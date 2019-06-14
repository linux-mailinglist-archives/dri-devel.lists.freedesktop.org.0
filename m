Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A54600D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85018975F;
	Fri, 14 Jun 2019 14:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DAD8975F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:08:17 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0C843260C2A;
 Fri, 14 Jun 2019 15:08:16 +0100 (BST)
Date: Fri, 14 Jun 2019 16:08:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Subject: Re: [RFC/WIP] drm/rockchip: Support CRTC gamma LUT
Message-ID: <20190614160811.7605d7b7@collabora.com>
In-Reply-To: <4034618.A4UzVy7svI@diego>
References: <20190613192244.5447-1-ezequiel@collabora.com>
 <20190614155320.348d42af@collabora.com> <4034618.A4UzVy7svI@diego>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNCBKdW4gMjAxOSAxNjowMzoyOCArMDIwMApIZWlrbyBTdMO8Ym5lciA8aGVpa29A
c250ZWNoLmRlPiB3cm90ZToKCj4gSGkgQm9yaXMsCj4gCj4gQW0gRnJlaXRhZywgMTQuIEp1bmkg
MjAxOSwgMTU6NTM6MjAgQ0VTVCBzY2hyaWViIEJvcmlzIEJyZXppbGxvbjoKPiA+IE9uIFRodSwg
MTMgSnVuIDIwMTkgMTY6MjI6NDQgLTAzMDAKPiA+IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxA
Y29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gPiAKPiA+ICAgCj4gPiA+ICtzdGF0aWMgaW50IHZvcF9n
YW1tYV9sdXRfcmVxdWVzdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ICsJCQkJIHN0cnVjdCBy
ZXNvdXJjZSAqcmVzLCBzdHJ1Y3Qgdm9wICp2b3ApCj4gPiA+ICt7Cj4gPiA+ICsJcmVzb3VyY2Vf
c2l6ZV90IG9mZnNldCA9IHZvcC0+ZGF0YS0+Z2FtbWFfbHV0X2FkZHJfb2ZmOwo+ID4gPiArCXJl
c291cmNlX3NpemVfdCBzaXplID0gVk9QX0dBTU1BX0xVVF9TSVpFICogNDsKPiA+ID4gKwo+ID4g
PiArCS8qCj4gPiA+ICsJICogU29tZSBTb0NzIChlLmcuIFJLMzI4OCkgaGF2ZSB0aGUgZ2FtbWEg
TFVUIGFkZHJlc3MgYWZ0ZXIKPiA+ID4gKwkgKiB0aGUgTU1VIHJlZ2lzdGVycywgd2hpY2ggbWVh
bnMgd2UgY2FuJ3QgcmVxdWVzdCBhbmQgaW9yZW1hcAo+ID4gPiArCSAqIHRoZSBlbnRpcmUgcmVn
aXN0ZXIgc2V0LiBPdGhlciAoZS5nLiBSSzMzOTkpIGhhdmUgZ2FtbWEgTFVUCj4gPiA+ICsJICog
YWRkcmVzcyBiZWZvcmUgTU1VLgo+ID4gPiArCSAqCj4gPiA+ICsJICogVGhlcmVmb3JlLCB3ZSBu
ZWVkIHRvIHJlcXVlc3QgYW5kIGlvcmVtYXAgdGhvc2UgdGhhdCBoYXZlbid0Cj4gPiA+ICsJICog
YmVlbiBhbHJlYWR5Lgo+ID4gPiArCSAqLwo+ID4gPiArCWlmICh2b3AtPmxlbiA+PSAob2Zmc2V0
ICsgc2l6ZSkpIHsKPiA+ID4gKwkJdm9wLT5sdXRfcmVncyA9IHZvcC0+cmVncyArIG9mZnNldDsK
PiA+ID4gKwkJcmV0dXJuIDA7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJaWYgKCFkZXZtX3Jl
cXVlc3RfbWVtX3JlZ2lvbihkZXYsIHJlcy0+c3RhcnQgKyBvZmZzZXQsCj4gPiA+ICsJCQkJICAg
ICBzaXplLCBkZXZfbmFtZShkZXYpKSkgewo+ID4gPiArCQlkZXZfd2FybihkZXYsICJjYW4ndCBy
ZXF1ZXN0IGdhbW1hIGx1dCByZWdpb25cbiIpOwo+ID4gPiArCQlyZXR1cm4gLUVCVVNZOwo+ID4g
PiArCX0KPiA+ID4gKwo+ID4gPiArCXZvcC0+bHV0X3JlZ3MgPSBkZXZtX2lvcmVtYXAoZGV2LCBy
ZXMtPnN0YXJ0ICsgb2Zmc2V0LCBzaXplKTsKPiA+ID4gKwlpZiAoIXZvcC0+bHV0X3JlZ3MpIHsK
PiA+ID4gKwkJZGV2X2VycihkZXYsICJjYW4ndCBpb3JlbWFwIGdhbW1hIGx1dCBhZGRyZXNzXG4i
KTsKPiA+ID4gKwkJZGV2bV9yZWxlYXNlX21lbV9yZWdpb24oZGV2LCByZXMtPnN0YXJ0ICsgb2Zm
c2V0LCBzaXplKTsKPiA+ID4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gPiA+ICsJfSAgCj4gPiAKPiA+
IENhbid0IHdlIHBhdGNoIHRoZSByZXNvdXJjZSBqdXN0IGFmdGVyIGNhbGxpbmcgcGxhZm9ybV9n
ZXRfcmVzb3VyY2UoKQo+ID4gKGFuZCBiZWZvcmUgY2FsbGluZyBkZXZtX2lvcmVtYXBfcmVzb3Vy
Y2UoKSkgc28gd2UgZG9uJ3QgaGF2ZSB0byBhZGQKPiA+IHRoZXNlIGRldm1fcmVxdWVzdF9tZW1f
cmVnaW9uKCkrZGV2bV9pb3JlbWFwKCkgY2FsbHMgaGVyZT8gIAo+IAo+IFRoZSBpc3N1ZSBpcyB0
aGF0IG9uIHRoZSBvbGRlciByazMyODggc29jcyB0aGUgdm9wcyBtZW1vcnkgbWFwIGhhcwo+IHRo
ZSBtbXUgcmVnaXN0ZXJzICh3aGljaCBnZXQgbWFwcGVkIHNlcGFyYXRlbHkpIGluIGJldHdlZW4g
dGhlIGNvcmUKPiBhbmQgbHV0IHJlZ2lzdGVycy4KClNvcnJ5IGZvciB0aGUgbm9pc2UsIEkgdGhv
dWdodCB0aGUgTU1VIHdhcyByZWdpc3RlcmVkIGRpcmVjdGx5IGJ5IHRoZQpWT1AgZHJpdmVyIGFu
ZCB3ZSBjb3VsZCBhdm9pZCB0aGUgMyBpb3JlbWFwIGFuZCBtZXJnZSB0aGluZ3MgaW50byBhCnNp
bmdsZSBvbmUsIGJ1dCBpdCBzZWVtcyB0aGUgTU1VIGRyaXZlciBpcyBhIHNlcGFyYXRlIHRoaW5n
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
