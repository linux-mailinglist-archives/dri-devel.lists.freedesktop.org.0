Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67D1363F39
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 11:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E436E203;
	Mon, 19 Apr 2021 09:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BD36E203
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 09:55:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id o16so38629561ljp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ac+/RDFDZwqxQM1YZG+NKhRwGNKn1wPe8k84YxH283M=;
 b=HKurBa83oYzINv/oZfV8hZ44LSh6xV6T5WewOSna3dYwU6kEDtcHOpYaTFb0LobUpW
 7fdEQ8hb47KZteiK7MjxXBaBun9KGzzieF5X1DEbp6VvMuGlC5Aoty4wyj4CxDhjfh8m
 T9ecaygHZGQFOHHRTl21E7LKNCrjCcQb8tzyF1yVOYT7AnsM4spz/yZGg9ejlC/fVpdH
 VJHyykmZUuZZb5U1GCL03hCV/T27G22vi0vzKmNxO7OIVdG7Ys/LASEYo2db7O73mHMf
 owXhcQk/sA4dE86jDMiDcwXHJzynp9NkB+sP7Yyk8SK1RuZN88MmwDOl2TbAZ/bwp9Cy
 WYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ac+/RDFDZwqxQM1YZG+NKhRwGNKn1wPe8k84YxH283M=;
 b=q8tAegF9UVmfHrPutJr/upTDgfnKMlvGDovd1BonwsCEwgcimnulUCyihGAC+mzaI4
 G0ALXAIVbR9fqmkMc2h5W+RVHKd2yMHRUf+NR+eK+C9A1iX15E40QcS4pGiOuG9yUKh4
 1yhLBr9SFAZmnD1mpM5gXB2Bvz9iHX2GBfK9UXX8yOax0UGLNRsbSG6fl2gnwqIaJ1L+
 c0XJqYVFGFZBf6B17cjm1/svqgahm/rZLKgxdVFub0ziOk5ajCAjkqHC3Ef1tn9cE+61
 bhS/6oN2B4xT4N1FQy63J9AtuGiwALkMi4nTywxhxrjKDGrTX/VJ0gj+ZNBamMix+4n4
 Or8w==
X-Gm-Message-State: AOAM5315GoLZE5l/eOuFiPLwtPi+QyV6ICwio4kbXjmeJcSy0f0gIidq
 AuAjQyKOurfxQx6ehl/oi788tjbm6aU3NnVZpf4=
X-Google-Smtp-Source: ABdhPJzjbowagID+0Tq/eUdoUjEEqSw6LDCkb3PwLhpzB3fsLwZpjsdyJweOlmDzPmNZviyxLZpu8VQVfiWbl6dgh2Y=
X-Received: by 2002:a05:651c:1249:: with SMTP id
 h9mr10822745ljh.141.1618826117706; 
 Mon, 19 Apr 2021 02:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
 <CADiBU3-d3_L8RTeYCirnfjJdG=ea6UVenAi8O8GO_LvOaB7OdA@mail.gmail.com>
 <20210419072229.GA4869@dell> <20210419072317.GB4869@dell>
 <20210419072403.GC4869@dell>
In-Reply-To: <20210419072403.GC4869@dell>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 19 Apr 2021 17:55:06 +0800
Message-ID: <CADiBU38bMuH00Bcx5hJas2=yAon00ffcGokT4u89vX-LJYuxNA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] mfd: rt4831: Adds support for Richtek RT4831
To: Lee Jones <lee.jones@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjHlubQ05pyIMTnml6Ug6YCx
5LiAIOS4i+WNiDM6MjTlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMTkgQXByIDIwMjEsIExlZSBKb25l
cyB3cm90ZToKPgo+ID4gT24gTW9uLCAxOSBBcHIgMjAyMSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4K
PiA+ID4gT24gTW9uLCAxOSBBcHIgMjAyMSwgQ2hpWXVhbiBIdWFuZyB3cm90ZToKPiA+ID4KPiA+
ID4gPiBIaSwgTGludXggbWZkIHJldmlld2VyczoKPiA+ID4gPiAgICBJdCdzIGJlZW4gdGhyZWUg
d2Vla3Mgbm90IHRvIGdldCBhbnkgcmVzcG9uc2UgZnJvbSB5b3UuCj4gPiA+ID4gSXMgdGhlcmUg
c29tZXRoaW5nIHdyb25nIGFib3V0IHRoaXMgbWZkIHBhdGNoPwo+ID4gPiA+IElmIHllcywgcGxl
YXNlIGZlZWwgZnJlZSB0byBsZXQgbWUga25vdy4KPiA+ID4KPiA+ID4gQ291cGxlIG9mIHRoaW5n
czoKPiA+ID4KPiA+ID4gRmlyc3QsIGlmIHlvdSB0aGluayBhIHBhdGNoIGhhZCBmYWxsZW4gdGhy
b3VnaCB0aGUgZ2Fwcywgd2hpY2ggZG9lcwo+ID4gPiBoYXBwZW4gc29tZXRpbWVzLCBpdCBpcyBn
ZW5lcmFsbHkgY29uc2lkZXJlZCBhY2NlcHRhYmxlIHRvIHN1Ym1pdCBhCj4gPiA+IFtSRVNFTkRd
IH4yIHdlZWtzIGFmdGVyIHRoZSBpbml0aWFsIHN1Ym1pc3Npb24uICBGWUk6IFRoaXMgd2FzIHN1
Y2ggYQo+ID4gPiBwYXRjaC4gIEl0IHdhcyBub3Qgb24sIG9yIGhhZCBmYWxsZW4gb2ZmIG9mIG15
IHJhZGFyIGZvciBzb21lIHJlYXNvbi4KPiA+ID4KPiA+ID4gU2Vjb25kbHksIHdlIGFyZSByZWFs
bHkgbGF0ZSBpbiB0aGUgcmVsZWFzZSBjeWNsZS4gIC1yYzggaGFzIGp1c3QgYmVlbgo+ID4gPiBy
ZWxlYXNlZC4gIFF1aXRlIGEgZmV3IG1haW50YWluZXJzIHNsb3cgZG93biBhdCB+LXJjNi4gIFBh
cnRpY3VsYXJseQo+ID4gPiBmb3IgbmV3IGRyaXZlcnMuCj4gPiA+Cj4gPiA+IE5vIG5lZWQgdG8g
cmVzdWJtaXQgdGhpcyBkcml2ZXIgdGhpcyB0aW1lLiAgSXQgaXMgbm93IG9uIG15IHRvLXJldmll
dwo+ID4gPiBsaXN0IGFuZCBJIHdpbGwgdGVuZCB0byBpdCBzaG9ydGx5Lgo+ID4gPgo+ID4gPiBU
aGFua3MgZm9yIHlvdXIgcGF0aWVuY2UuCj4gPgo+ID4gQWxzbyB5b3UgYXJlIG1pc3NpbmcgYSBE
VCByZXZpZXcgb24gcGF0Y2ggNC4KPgo+IC4uLiBsb29rcyBsaWtlIHlvdSBmb3Jnb3QgdG8gQ2Mg
dGhlbSEKPgpZYXAsIHJlYWxseS4gSScnbGwgcmVzZW5kIHBhdGNoIDQgYW5kIGNjIHRoZW0uIFRo
eC4KPiAtLQo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IFNlbmlvciBUZWNobmljYWwgTGVhZCAt
IERldmVsb3BlciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
