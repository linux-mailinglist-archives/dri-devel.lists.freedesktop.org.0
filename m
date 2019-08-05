Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4281733
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 12:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38B26E3E9;
	Mon,  5 Aug 2019 10:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDEF6E3E9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 10:37:54 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v15so74235890wml.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 03:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EjSGNU5tuMFasj89k5pfoAkxeWuwm7YGZxI63pDJurY=;
 b=R1N7Bjfazvcdi2d1PGwy/LIJqemAi3RTrtDzTZteLqmdaaBQqsU8cOzFNAIOGhVOEw
 Ozv6Ba5TfbMejR4+LxuIy2P4Dh0E+wK1P7NHlVk+zRfgGjE5EdNvi6jdHT9I5LsYzEBe
 MyQDH2WoEECwbZwQxBDj1lh3y1udKm/vuFcfB7fIFdSodmjNULi17/JNN9xxY+nctTNa
 tkQTlbCmPsyfNZMscns7RFc3Vf7e0DE6XB2FbIYaEWsj9akdv3UqvOm3CmN3EU583++I
 yGliX7kyjNiC4okN2MwG487waGjvJLE3/52B1eumJfqNBfVz1LeQnc63LdNipJPSiJFz
 6Q5g==
X-Gm-Message-State: APjAAAW+06cPJ18mrsgDohRW9pRGnnGodn9h59rSSeyjR5xcAYaMo9EV
 dN2f+65P7ZGb3hHujULZGlJocw==
X-Google-Smtp-Source: APXvYqyfPy8bJ4jliIHsN8Aii8j0f6KsqZMMACwhVIeHmj6Cf501bv9kzRahA7ZUnqifBzzHRD/S/w==
X-Received: by 2002:a1c:cfc3:: with SMTP id
 f186mr17103441wmg.134.1565001472966; 
 Mon, 05 Aug 2019 03:37:52 -0700 (PDT)
Received: from dell ([109.180.115.177])
 by smtp.gmail.com with ESMTPSA id o11sm79528209wmh.37.2019.08.05.03.37.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 03:37:52 -0700 (PDT)
Date: Mon, 5 Aug 2019 11:37:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 0/4] backlight: Expose brightness curve type through
 sysfs
Message-ID: <20190805103750.GG4739@dell>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190722235926.GA250418@google.com> <20190725111541.GA23883@dell>
 <20190725171726.GD250418@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725171726.GD250418@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=EjSGNU5tuMFasj89k5pfoAkxeWuwm7YGZxI63pDJurY=;
 b=SdYRFXozELsThSHXdS1mXooull3R6J9nnf8C9J4LG2rf8Ay/tHpcXw2sFKAZoIllXB
 UKzi8TW1M0OqDdoMJIDgbNPtrLtVsqGNe/0mrOegp1PJbxsi91tSM2AMp05i+GQJGWfv
 0ndxMSUXoF6zD4BAG4BkQVA5ggAsEF1fWdZLuxRZwHQxF2mE9tNSwMUHD6NPuvpOd/pG
 t6FqshJ99YgzsFLuWKobI7n04sKxA23fNY0aWKPCmWnE/D5C39GPb0eyMHtNpKwaD/mJ
 4ho5THOfnm4/3mlbtxwCfPSP8ZB7VdziBnItzlaaDFyKQ7bhlLHbMKVB7phZr+csRiRE
 XmCQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNSBKdWwgMjAxOSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cgo+IE9uIFRodSwg
SnVsIDI1LCAyMDE5IGF0IDEyOjE1OjQxUE0gKzAxMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9u
IE1vbiwgMjIgSnVsIDIwMTksIE1hdHRoaWFzIEthZWhsY2tlIHdyb3RlOgo+ID4gCj4gPiA+IE9u
IFR1ZSwgSnVsIDA5LCAyMDE5IGF0IDEyOjAwOjAzUE0gLTA3MDAsIE1hdHRoaWFzIEthZWhsY2tl
IHdyb3RlOgo+ID4gPiA+IEJhY2tsaWdodCBicmlnaHRuZXNzIGN1cnZlcyBjYW4gaGF2ZSBkaWZm
ZXJlbnQgc2hhcGVzLiBUaGUgdHdvIG1haW4KPiA+ID4gPiB0eXBlcyBhcmUgbGluZWFyIGFuZCBu
b24tbGluZWFyIGN1cnZlcy4gVGhlIGh1bWFuIGV5ZSBkb2Vzbid0Cj4gPiA+ID4gcGVyY2VpdmUg
bGluZWFybHkgaW5jcmVhc2luZy9kZWNyZWFzaW5nIGJyaWdodG5lc3MgYXMgbGluZWFyIChzZWUK
PiA+ID4gPiBhbHNvIDg4YmE5NWJlZGI3OSAiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJp
Z2h0bmVzcyBvZiBMRUQKPiA+ID4gPiBsaW5lYXJseSB0byBodW1hbiBleWUiKSwgaGVuY2UgbWFu
eSBiYWNrbGlnaHRzIHVzZSBub24tbGluZWFyIChvZnRlbgo+ID4gPiA+IGxvZ2FyaXRobWljKSBi
cmlnaHRuZXNzIGN1cnZlcy4gVGhlIHR5cGUgb2YgY3VydmUgaXMgY3VycmVudGx5IG9wYXF1ZQo+
ID4gPiA+IHRvIHVzZXJzcGFjZSwgc28gdXNlcnNwYWNlIG9mdGVuIHJlbGllcyBvbiBtb3JlIG9y
IGxlc3MgcmVsaWFibGUKPiA+ID4gPiBoZXVyaXN0aWNzIChsaWtlIHRoZSBudW1iZXIgb2YgYnJp
Z2h0bmVzcyBsZXZlbHMpIHRvIGRlY2lkZSB3aGV0aGVyCj4gPiA+ID4gdG8gdHJlYXQgYSBiYWNr
bGlnaHQgZGV2aWNlIGFzIGxpbmVhciBvciBub24tbGluZWFyLgo+ID4gPiA+IAo+ID4gPiA+IEV4
cG9ydCB0aGUgdHlwZSBvZiB0aGUgYnJpZ2h0bmVzcyBjdXJ2ZSB2aWEgYSBuZXcgc3lzZnMgYXR0
cmlidXRlLgo+ID4gPiA+IAo+ID4gPiA+IE1hdHRoaWFzIEthZWhsY2tlICg0KToKPiA+ID4gPiAg
IE1BSU5UQUlORVJTOiBBZGQgZW50cnkgZm9yIHN0YWJsZSBiYWNrbGlnaHQgc3lzZnMgQUJJIGRv
Y3VtZW50YXRpb24KPiA+ID4gPiAgIGJhY2tsaWdodDogRXhwb3NlIGJyaWdodG5lc3MgY3VydmUg
dHlwZSB0aHJvdWdoIHN5c2ZzCj4gPiA+ID4gICBiYWNrbGlnaHQ6IHB3bV9ibDogU2V0IHNjYWxl
IHR5cGUgZm9yIENJRSAxOTMxIGN1cnZlcwo+ID4gPiA+ICAgYmFja2xpZ2h0OiBwd21fYmw6IFNl
dCBzY2FsZSB0eXBlIGZvciBicmlnaHRuZXNzIGN1cnZlcyBzcGVjaWZpZWQgaW4KPiA+ID4gPiAg
ICAgdGhlIERUCj4gPiA+ID4gCj4gPiA+ID4gIC4uLi9BQkkvdGVzdGluZy9zeXNmcy1jbGFzcy1i
YWNrbGlnaHQgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrCj4gPiA+ID4gIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gPiA+ID4gIGRyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2JhY2tsaWdodC5jICAgICAgICAgICB8IDE5ICsrKysrKysrKysK
PiA+ID4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgICAgICAgICAgICAgIHwg
MzUgKysrKysrKysrKysrKysrKysrLQo+ID4gPiA+ICBpbmNsdWRlL2xpbnV4L2JhY2tsaWdodC5o
ICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrKwo+ID4gPiA+ICA1IGZpbGVzIGNoYW5nZWQs
IDg5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtY2xhc3MtYmFja2xpZ2h0Cj4gPiA+
IAo+ID4gPiBwaW5nLCBhbnkgY29tbWVudHMgb24gdjM/Cj4gPiAKPiA+IExvb2tzIGxpa2UgUEFU
Q0ggMi80IHN0aWxsIG5lZWRzIHNlZWluZyB0by4KPiAKPiBUaGUgcGF0Y2ggY3VycmVudGx5IGRv
ZXNuJ3QgaGF2ZSBhbnkgY29tbWVudHMuCj4gCj4gRG8geW91IHNlZSBhbnkgc3BlY2lmaWMgdGhp
bmdzIHRoYXQgbmVlZCBpbXByb3ZlbWVudD8gSWYgc28sIGNvdWxkIHlvdQo+IGNvbW1lbnQgb24g
dGhlIHBhdGNoPwoKSXQgbmVlZHMgRGFuaWVsIFQncyBBY2suCgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVu
IHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBU
d2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
