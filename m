Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8D357CF7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 09:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8A76EA15;
	Thu,  8 Apr 2021 07:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A566EA15
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 07:06:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id w23so1095526edx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=z4Gitq6pVFDGPa5UrDIJQObnLNdxwY706RuaVL/8cJQ=;
 b=Rq/AVPm1jCL9qyyHKxT5usmTELeBq1QBK7S0jE9FhIpcOnkmIE1MFYUSaaLB+fbeG4
 woViT2OkK6JUUf3A2pifrsX5TFDVEZfZya+OSIC/IKAg4osGnjzTTNPpvYzlhqNEJGTc
 CyQuygiOyddbOLcV9fNt8j8cWcoY5jPX7ERVGHmcm4UIxIqYaDrUz/IJFIT1ktLpb4rd
 dhA3O4NnNSbVMZrBVtPWqo2gxWeYgW/qSBaWA8dFh8D4M8VVcD4zXhwnNPoFZ1JuOnq0
 a1nKocWIAJawxgrF7mtFwTlMC+n6jAdNlz5Tl3pqZOd3kKWkQc0WWuZq0v4zfd9PMsx9
 xj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z4Gitq6pVFDGPa5UrDIJQObnLNdxwY706RuaVL/8cJQ=;
 b=mdED7y2HZqXDJ37vRIM8XweRdHogXHGHIhJfE192NSCtf2HrgqkW/bID6a7uJfuOhd
 /RDalhZLwcD3zi4BA2kxqsYkrCpn6sH7JuiCOmZMwKc0xnLN+Vpuxa4r4807yausCBwt
 kSeL5UveOkz8reVBQX63HaDPQN8iqkMVK/+gEA9+c/B/mWuj4G0vxWStR00ABZPOBC8g
 52YhFgUVSdRRkwF4de/GqhzrAw9aiTQ9drwWp53XsVyy9QoKdn+gSzKUu/D9HFwI3YoS
 RHZJwxA92eb5nk1kkP+e/1X5zyIwGUkY1wCA69po9jR4FW7ZkPeaVl+t802TNeMgwMCB
 n0Gw==
X-Gm-Message-State: AOAM530pESF9sSfK14+FPkh8TSNgL00st8cmck8eGoMFEEZ5dagCflOA
 NG01H3Aete62SFpzCQYduKgMmw==
X-Google-Smtp-Source: ABdhPJxnL59ZtT6Iah9N++cMUYV0rXC755tzrsh7H6THlQikyo2EcZ08HAyhG/iIV512tuxRYVlbrA==
X-Received: by 2002:a05:6402:4d1:: with SMTP id
 n17mr9243636edw.118.1617865568643; 
 Thu, 08 Apr 2021 00:06:08 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id q16sm13810809ejd.15.2021.04.08.00.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 00:06:08 -0700 (PDT)
Date: Thu, 8 Apr 2021 08:06:05 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [RESEND 00/25] Rid W=1 warnings from HID
Message-ID: <20210408070605.GC2961413@dell>
References: <20210326143458.508959-1-lee.jones@linaro.org>
 <20210406085605.GS2916463@dell>
 <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+5Vd6jC2+0pfHLOw3opdXzKoc9pUWzxmBVhSvQvNWMsQ@mail.gmail.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Zhang Lixu <lixu.zhang@intel.com>, linux-iio <linux-iio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Anssi Hannula <anssi.hannula@gmail.com>,
 Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Henrik Rydberg <rydberg@bitmath.org>,
 Lopez Casado <nlopezcasad@logitech.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Masaki Ota <masaki.ota@jp.alps.com>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Vojtech Pavlik <vojtech@suse.cz>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-media@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 message to <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, "L. Vinyard,
 Jr" <rvinyard@cs.nmsu.edu>, linaro-mm-sig@lists.linaro.org,
 Michael Haboustak <mike-@cinci.rr.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Drubin <daniel.drubin@intel.com>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAwNyBBcHIgMjAyMSwgQmVuamFtaW4gVGlzc29pcmVzIHdyb3RlOgoKPiBPbiBUdWUs
IEFwciA2LCAyMDIxIGF0IDEwOjU2IEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgMjYgTWFyIDIwMjEsIExlZSBKb25lcyB3cm90ZToKPiA+
Cj4gPiA+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8g
Y2xlYW4tdXAgVz0xCj4gPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNoIGFyZSBjdXJyZW50bHkgb3Zl
cndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiA+IG5pZ2dseSBsaXR0bGUgd2FybmluZ3MuCj4g
PiA+Cj4gPiA+IExlZSBKb25lcyAoMjUpOgo+ID4gPiAgIEhJRDogaW50ZWwtaXNoLWhpZDogUmVt
b3ZlIHVudXNlZCB2YXJpYWJsZSAnZXJyJwo+ID4gPiAgIEhJRDogaXNodHAtaGlkLWNsaWVudDog
TW92ZSB2YXJpYWJsZSB0byB3aGVyZSBpdCdzIGFjdHVhbGx5IHVzZWQKPiA+ID4gICBISUQ6IGlu
dGVsLWlzaC1oaWQ6IHBjaS1pc2g6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgJ3JldCcKPiA+ID4g
ICBISUQ6IGludGVsLWlzaDogU3VwcGx5IHNvbWUgbWlzc2luZyBwYXJhbSBkZXNjcmlwdGlvbnMK
PiA+ID4gICBISUQ6IGludGVsLWlzaDogRml4IGEgbmFtaW5nIGRpc3Bhcml0eSBhbmQgYSBmb3Jt
YXR0aW5nIGVycm9yCj4gPiA+ICAgSElEOiB1c2JoaWQ6IFJlcGFpciBhIGZvcm1hdHRpbmcgaXNz
dWUgaW4gYSBzdHJ1Y3QgZGVzY3JpcHRpb24KPiA+ID4gICBISUQ6IGludGVsLWlzaC1oaWQ6IEZp
eCBhIGxpdHRsZSBkb2Mtcm90Cj4gPiA+ICAgSElEOiB1c2JoaWQ6IGhpZC1waWRmZjogRGVtb3Rl
IGEgY291cGxlIGtlcm5lbC1kb2MgYWJ1c2VzCj4gPiA+ICAgSElEOiBoaWQtYWxwczogQ29ycmVj
dCBzdHJ1Y3QgbWlzbmFtaW5nCj4gPiA+ICAgSElEOiBpbnRlbC1pc2gtaGlkOiBGaXggcG90ZW50
aWFsIGNvcHkvcGFzdGUgZXJyb3IKPiA+ID4gICBISUQ6IGhpZC1jb3JlOiBGaXggaW5jb3JyZWN0
IGZ1bmN0aW9uIG5hbWUgaW4gaGVhZGVyCj4gPiA+ICAgSElEOiBpbnRlbC1pc2gtaGlkOiBpcGM6
IENvcnJlY3QgZndfcmVzZXRfd29ya19mbigpIGZ1bmN0aW9uIG5hbWUgaW4KPiA+ID4gICAgIGhl
YWRlcgo+ID4gPiAgIEhJRDogaXNodHAtaGlkLWNsaWVudDogRml4IGluY29ycmVjdCBmdW5jdGlv
biBuYW1lIHJlcG9ydF9iYWRfcGFja2V0KCkKPiA+ID4gICBISUQ6IGhpZC1reWU6IEZpeCBpbmNv
cnJlY3QgZnVuY3Rpb24gbmFtZSBmb3Iga3llX3RhYmxldF9lbmFibGUoKQo+ID4gPiAgIEhJRDog
aGlkLXBpY29sY2RfY29yZTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0Jwo+ID4gPiAgIEhJ
RDogaGlkLWxvZ2l0ZWNoLWhpZHBwOiBGaXggY29uZm9ybWFudCBrZXJuZWwtZG9jIGhlYWRlciBh
bmQgZGVtb3RlCj4gPiA+ICAgICBhYnVzZXMKPiA+ID4gICBISUQ6IGhpZC11Y2xvZ2ljLXJkZXNj
OiBLZXJuZWwtZG9jIGlzIGZvciBmdW5jdGlvbnMgYW5kIHN0cnVjdHMKPiA+ID4gICBISUQ6IGhp
ZC10aHJ1c3RtYXN0ZXI6IERlbW90ZSBhIGJ1bmNoIG9mIGtlcm5lbC1kb2MgYWJ1c2VzCj4gPiA+
ICAgSElEOiBoaWQtdWNsb2dpYy1wYXJhbXM6IEVuc3VyZSBmdW5jdGlvbiBuYW1lcyBhcmUgcHJl
c2VudCBhbmQgY29ycmVjdAo+ID4gPiAgICAgaW4ga2VybmVsLWRvYyBoZWFkZXJzCj4gPiA+ICAg
SElEOiBoaWQtc2Vuc29yLWN1c3RvbTogUmVtb3ZlIHVudXNlZCB2YXJpYWJsZSAncmV0Jwo+ID4g
PiAgIEhJRDogd2Fjb21fc3lzOiBEZW1vdGUga2VybmVsLWRvYyBhYnVzZQo+ID4gPiAgIEhJRDog
aGlkLXNlbnNvci1odWI6IFJlbW92ZSB1bnVzZWQgc3RydWN0IG1lbWJlciAncXVpcmtzJwo+ID4g
PiAgIEhJRDogaGlkLXNlbnNvci1odWI6IE1vdmUgJ2hzZGV2JyBkZXNjcmlwdGlvbiB0byBjb3Jy
ZWN0IHN0cnVjdAo+ID4gPiAgICAgZGVmaW5pdGlvbgo+ID4gPiAgIEhJRDogaW50ZWwtaXNoLWhp
ZDogaXNodHAtZnctbG9hZGVyOiBGaXggYSBidW5jaCBvZiBmb3JtYXR0aW5nIGlzc3Vlcwo+ID4g
PiAgIEhJRDogaXNodHAtaGlkLWNsaWVudDogRml4ICdzdWdnZXN0LWF0dHJpYnV0ZT1mb3JtYXQn
IGNvbXBpbGVyIHdhcm5pbmcKPiA+Cj4gPiBUaGVzZSBoYXZlIGJlZW4gb24gdGhlIGxpc3QgZm9y
IGEgY291cGxlIG9mIHdlZWtzIG5vdy4KPiA+Cj4gPiBJcyB0aGVyZSBhbnl0aGluZyBJIGNhbiBk
byB0byBoZWxwIGV4cGVkaXRlIHRoZWlyIG1lcmdlPwo+ID4KPiA+IEknbSBjb25jZXJuZWQgc2lu
Y2UgLXJjNiBoYXMganVzdCBiZWVuIHJlbGVhc2VkLgo+IAo+IFNvcnJ5IGZvciB0aGUgZGVsYXku
Cj4gCj4gSSBhbSBjdXJyZW50bHkgcXVldWluZyB0aGVtIGxvY2FsbHkgYW5kIHJ1bm5pbmcgYSBm
ZXcgdGVzdHMgb24gdGhlbS4gSQo+IGRvbid0IGV4cGVjdCBhbnl0aGluZyB0byBoYXBwZW4sIGJ1
dCBiZXR0ZXIgYmUgc2FmZSB0aGFuIGFueXRoaW5nLgo+IAo+IEZXSVcsIEkgYW0gc3BsaXR0aW5n
IHRoZSBzZXJpZXMgaW4gMzoKPiAtIDExIHBhdGNoZXMgZm9yIGludGVsIGlzaCBhcmUgZ29pbmcg
dG8gYmUgcXVldWVkIGluIGZvci01LjEzL2ludGVsLWlzaAo+IC0gdGhlIHRocnVzdG1hc3RlciBv
bmUgaW4gZm9yLTUuMTMvdGhydXN0bWFzdGVyCj4gLSB0aGUgcmVzdCAoMTMgcGF0Y2hlcykgd2ls
bCBiZSBzZW50IGluIGZvci01LjEzL3dhcm5pbmdzLgoKU291bmRzIGdvb2QgdG8gbWUuICBUaGFu
a3MgQmVuamFtaW4uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwg
TGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
