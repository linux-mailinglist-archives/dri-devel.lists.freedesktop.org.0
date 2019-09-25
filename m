Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC930BE233
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB816EBF8;
	Wed, 25 Sep 2019 16:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E726E07D;
 Wed, 25 Sep 2019 16:16:58 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E08DA21D81;
 Wed, 25 Sep 2019 16:16:57 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id 4so5779460qki.6;
 Wed, 25 Sep 2019 09:16:57 -0700 (PDT)
X-Gm-Message-State: APjAAAXgYWWSzTb+uCW6r00NZ/Pob+/1O4m2fu6udo9QPQOq/ESxuPn8
 RUCgfHqMTaUE/zPoOo0oriq0PUFHhP+B25ojWg==
X-Google-Smtp-Source: APXvYqyTl1XVuWTp/35jWle4Kbs2xpDG3Z/T5fV7UMzbxRk+doCiTCUGQILqDsprUV9H9iwgwr82s3aYudHesNV1NR4=
X-Received: by 2002:a37:be87:: with SMTP id o129mr4499696qkf.254.1569428216961; 
 Wed, 25 Sep 2019 09:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
 <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
 <e404c65b-5a66-6f91-5b38-8bf89a7697b2@arm.com>
 <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
In-Reply-To: <43fb5fe1de317d65a4edf592f88ea150c6e3b8cc.camel@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Sep 2019 11:16:45 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
Message-ID: <CAL_JsqLhx500cx3YLoC7HL1ux3bBpV+fEA2Qnk7D5RFGgiGzSw@mail.gmail.com>
Subject: Re: [PATCH 00/11] of: Fix DMA configuration for non-DT masters
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569428218;
 bh=kWvQDMnhvqyvgI/cRcXoMhpMrwTzw21yx7s7QxCURME=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0yN231Pbtuv+A35lsN4TVWWkAO/Ao1z+ejWEW70agRAiztlbt/DXeoxut4H8u0lni
 g2Sc0yzW9dahjD5GhfnpP7r4r+vF2NS+Ad9wA3nPzCfNIZpt3Zn8SW5rmnhGN60Wta
 Vjtu3J1zixjw+Pddib6E0BK6QMuLIg46YmwdgczY=
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>,
 james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MzAgQU0gTmljb2xhcyBTYWVueiBKdWxpZW5uZQo8
bnNhZW56anVsaWVubmVAc3VzZS5kZT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIwMTktMDktMjUgYXQg
MTY6MDkgKzAxMDAsIFJvYmluIE11cnBoeSB3cm90ZToKPiA+IE9uIDI1LzA5LzIwMTkgMTU6NTIs
IE5pY29sYXMgU2FlbnogSnVsaWVubmUgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgMjAxOS0wOS0yNCBh
dCAxNjo1OSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCBTZXAgMjQs
IDIwMTkgYXQgMToxMiBQTSBOaWNvbGFzIFNhZW56IEp1bGllbm5lCj4gPiA+ID4gPG5zYWVuemp1
bGllbm5lQHN1c2UuZGU+IHdyb3RlOgo+ID4gPiA+ID4gSGkgQWxsLAo+ID4gPiA+ID4gdGhpcyBz
ZXJpZXMgdHJpZXMgdG8gYWRkcmVzcyBvbmUgb2YgdGhlIGlzc3VlcyBibG9ja2luZyB1cyBmcm9t
Cj4gPiA+ID4gPiB1cHN0cmVhbWluZyBCcm9hZGNvbSdzIFNUQiBQQ0llIGNvbnRyb2xsZXJbMV0u
IE5hbWVseSwgdGhlIGZhY3QgdGhhdAo+ID4gPiA+ID4gZGV2aWNlcyBub3QgcmVwcmVzZW50ZWQg
aW4gRFQgd2hpY2ggc2l0IGJlaGluZCBhIFBDSSBidXMgZmFpbCB0byBnZXQgdGhlCj4gPiA+ID4g
PiBidXMnIERNQSBhZGRyZXNzaW5nIGNvbnN0cmFpbnRzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRo
aXMgaXMgZHVlIHRvIHRoZSBmYWN0IHRoYXQgb2ZfZG1hX2NvbmZpZ3VyZSgpIGFzc3VtZXMgaXQn
cyByZWNlaXZpbmcgYQo+ID4gPiA+ID4gRFQgbm9kZSByZXByZXNlbnRpbmcgdGhlIGRldmljZSBi
ZWluZyBjb25maWd1cmVkLCBhcyBvcHBvc2VkIHRvIHRoZSBQQ0llCj4gPiA+ID4gPiBicmlkZ2Ug
bm9kZSB3ZSBjdXJyZW50bHkgcGFzcy4gVGhpcyBjYXVzZXMgdGhlIGNvZGUgdG8gZGlyZWN0bHkg
anVtcAo+ID4gPiA+ID4gaW50byBQQ0kncyBwYXJlbnQgbm9kZSB3aGVuIGNoZWNraW5nIGZvciAn
ZG1hLXJhbmdlcycgYW5kIG1pc3Nlcwo+ID4gPiA+ID4gd2hhdGV2ZXIgd2FzIHNldCB0aGVyZS4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBUbyBhZGRyZXNzIHRoaXMgSSBjcmVhdGUgYSBuZXcgQVBJIGlu
IE9GIC0gaW5zcGlyZWQgZnJvbSBSb2JpbiBNdXJwaHlzCj4gPiA+ID4gPiBvcmlnaW5hbCBwcm9w
b3NhbFsyXSAtIHdoaWNoIGFjY2VwdHMgYSBidXMgRFQgbm9kZSBhcyBpdCdzIGlucHV0IGluCj4g
PiA+ID4gPiBvcmRlciB0byBjb25maWd1cmUgYSBkZXZpY2UncyBETUEgY29uc3RyYWludHMuIFRo
ZSBjaGFuZ2VzIGdvIGRlZXAgaW50bwo+ID4gPiA+ID4gb2YvYWRkcmVzcy5jJ3MgaW1wbGVtZW50
YXRpb24sIGFzIGEgZGV2aWNlIGJlaW5nIGhhdmluZyBhIERUIG5vZGUKPiA+ID4gPiA+IGFzc3Vt
cHRpb24gd2FzIHByZXR0eSBzdHJvbmcuCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gdG9wIG9mIHRo
aXMgd29yaywgSSBhbHNvIGNsZWFuZWQgdXAgb2ZfZG1hX2NvbmZpZ3VyZSgpIHJlbW92aW5nIGl0
cwo+ID4gPiA+ID4gcmVkdW5kYW50IGFyZ3VtZW50cyBhbmQgY3JlYXRpbmcgYW4gYWx0ZXJuYXRp
dmUgZnVuY3Rpb24gZm9yIHRoZSBzcGVjaWFsCj4gPiA+ID4gPiBjYXNlcwo+ID4gPiA+ID4gbm90
IGFwcGxpY2FibGUgdG8gZWl0aGVyIHRoZSBhYm92ZSBjYXNlIG9yIHRoZSBkZWZhdWx0IHVzYWdl
Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IElNTyB0aGUgcmVzdWx0aW5nIGZ1bmN0aW9ucyBhcmUgbW9y
ZSBleHBsaWNpdC4gVGhleSB3aWxsIHByb2JhYmx5Cj4gPiA+ID4gPiBzdXJmYWNlIHNvbWUgaGFj
a3kgdXNhZ2VzIHRoYXQgY2FuIGJlIHByb3Blcmx5IGZpeGVkIGFzIEkgc2hvdyB3aXRoIHRoZQo+
ID4gPiA+ID4gRFQgZml4ZXMgb24gdGhlIExheWVyc2NhcGUgcGxhdGZvcm0uCj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhpcyB3YXMgYWxzbyB0ZXN0ZWQgb24gYSBSYXNwYmVycnkgUGkgNCB3aXRoIGEg
Y3VzdG9tIFBDSWUgZHJpdmVyIGFuZAo+ID4gPiA+ID4gb24gYSBTZWF0dGxlIEFNRCBib2FyZC4K
PiA+ID4gPgo+ID4gPiA+IEh1bW0sIEkndmUgYmVlbiB3b3JraW5nIG9uIHRoaXMgaXNzdWUgdG9v
LiBMb29rcyBzaW1pbGFyIHRob3VnaCB5b3Vycwo+ID4gPiA+IGhhcyBhIGxvdCBtb3JlIGNodXJu
IGFuZCB0aGVyZSdzIHNvbWUgb3RoZXIgYnVncyBJJ3ZlIGZvdW5kLgo+ID4gPgo+ID4gPiBUaGF0
J3MgZ29vZCBuZXdzLCBhbmQgeWVzIG5vdyB0aGF0IEkgc2VlIGl0LCBzb21lIHN0dWZmIG9uIG15
IHNlcmllcyBpcwo+ID4gPiBvdmVybHkKPiA+ID4gY29tcGxpY2F0ZWQuIFNwZWNpYWxseSBhcm91
bmQgb2ZfdHJhbnNsYXRlXyooKS4KPiA+ID4KPiA+ID4gT24gdG9wIG9mIHRoYXQsIHlvdSByZW1v
dmVkIGluIG9mX2RtYV9nZXRfcmFuZ2UoKToKPiA+ID4KPiA+ID4gLSAgIC8qCj4gPiA+IC0gICAg
KiBBdCBsZWFzdCBlbXB0eSByYW5nZXMgaGFzIHRvIGJlIGRlZmluZWQgZm9yIHBhcmVudCBub2Rl
IGlmCj4gPiA+IC0gICAgKiBETUEgaXMgc3VwcG9ydGVkCj4gPiA+IC0gICAgKi8KPiA+ID4gLSAg
IGlmICghcmFuZ2VzKQo+ID4gPiAtICAgICAgICAgICBicmVhazsKPiA+ID4KPiA+ID4gV2hpY2gg
SSBhc3N1bWVkIHdhcyBib3VuZCB0byB0aGUgc3RhbmRhcmQgYW5kIG1ha2VzIHRoaW5ncyBlYXNp
ZXIuCj4gPiA+Cj4gPiA+ID4gQ2FuIHlvdSB0ZXN0IG91dCB0aGlzIGJyYW5jaFsxXS4gSSBkb24n
dCBoYXZlIGFueSBoL3cgbmVlZGluZyB0aGlzLAo+ID4gPiA+IGJ1dCB3cm90ZSBhIHVuaXR0ZXN0
IGFuZCB0ZXN0ZWQgd2l0aCBtb2RpZmllZCBRRU1VLgo+ID4gPgo+ID4gPiBJIHJldmlld2VkIGV2
ZXJ5dGhpbmcsIEkgZGlkIGZpbmQgYSBtaW5vciBpc3N1ZSwgc2VlIHRoZSBwYXRjaCBhdHRhY2hl
ZC4KPiA+Cj4gPiBXUlQgdGhhdCBwYXRjaCwgdGhlIG9yaWdpbmFsIGludGVudCBvZiAiZm9yY2Vf
ZG1hIiB3YXMgcHVyZWx5IHRvCj4gPiBjb25zaWRlciBhIGRldmljZSBETUEtY2FwYWJsZSByZWdh
cmRsZXNzIG9mIHRoZSBwcmVzZW5jZSBvZgo+ID4gImRtYS1yYW5nZXMiLiBFeHBlY3Rpbmcgb2Zf
ZG1hX2NvbmZpZ3VyZSgpIHRvIGRvIGFueXRoaW5nIGZvciBhIG5vbi1PRgo+ID4gZGV2aWNlIGhh
cyBhbHdheXMgYmVlbiBib2d1cyAtIG1hZ2ljIHBhcmF2aXJ0IGRldmljZXMgd2hpY2ggYXBwZWFy
IG91dAo+ID4gb2Ygbm93aGVyZSBhbmQgZXhwZWN0IHRvIGJlIHRyZWF0ZWQgYXMgZ2VudWluZSBE
TUEgbWFzdGVycyBhcmUgYQo+ID4gc2VwYXJhdGUgcHJvYmxlbSB0aGF0IHdlIGhhdmVuJ3QgcmVh
bGx5IGFwcHJvYWNoZWQgeWV0Lgo+Cj4gSSBhZ3JlZSBpdCdzIGNsZWFybHkgYWJ1c2luZyB0aGUg
ZnVuY3Rpb24uIEkgaGF2ZSBubyBwcm9ibGVtIHdpdGggdGhlIGJlaGF2aW91cgo+IGNoYW5nZSBp
ZiBpdCdzIE9LIHdpdGggeW91Lgo+Cj4gUm9iaW4sIGhhdmUgeW91IGxvb2tlZCBpbnRvIHN1cHBv
cnRpbmcgbXVsdGlwbGUgZG1hLXJhbmdlcz8gSXQncyB0aGUgbmV4dCB0aGluZwo+IHdlIG5lZWQg
Zm9yIEJDTSBTVEIncyBQQ0llLiBJJ2xsIGhhdmUgYSBnbyBhdCBpdCBteXNlbGYgaWYgbm90aGlu
ZyBpcyBpbiB0aGUKPiB3b3JrcyBhbHJlYWR5LgoKTXVsdGlwbGUgZG1hLXJhbmdlcyBhcyBmYXIg
YXMgY29uZmlndXJpbmcgaW5ib3VuZCB3aW5kb3dzIHNob3VsZCB3b3JrCmFscmVhZHkgb3RoZXIg
dGhhbiB0aGUgYnVnIHdoZW4gdGhlcmUncyBhbnkgcGFyZW50IHRyYW5zbGF0aW9uLiBCdXQgaWYK
eW91IG1lYW4gc3VwcG9ydGluZyBtdWx0aXBsZSBETUEgb2Zmc2V0cyBhbmQgbWFza3MgcGVyIGRl
dmljZSBpbiB0aGUKRE1BIEFQSSwgdGhlcmUncyBub3RoaW5nIGluIHRoZSB3b3JrcyB5ZXQuCgpS
b2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
