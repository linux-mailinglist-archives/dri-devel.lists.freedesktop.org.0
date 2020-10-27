Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241529A949
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 11:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119726EB54;
	Tue, 27 Oct 2020 10:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E86EB54
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 10:13:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 803F4AEF8;
 Tue, 27 Oct 2020 10:13:37 +0000 (UTC)
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Simon Ser <contact@emersion.fr>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
 <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ef0788e4-d645-6f71-bece-fb8bcd0cb3c7@suse.de>
Date: Tue, 27 Oct 2020 11:13:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
Content-Language: en-US
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE2LjEwLjIwIHVtIDEzOjM1IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPiBPbiBGcmks
IE9jdCAxNiwgMjAyMCBhdCAxMjozOCBQTSBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+
IHdyb3RlOgo+Pgo+Pj4gVGhlIG9ubHkgdGhpbmcgd2Ugc3VwcG9ydCBpcyB4cmdiODg4OC4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPj4+IENjOiBSb2RyaWdvIFNpcXVlaXJhIDxyb2RyaWdvc2lxdWVpcmFtZWxvQGdtYWlsLmNv
bT4KPj4+IENjOiBNZWxpc3NhIFdlbiA8bWVsaXNzYS5zcndAZ21haWwuY29tPgo+Pj4gQ2M6IEhh
bmVlbiBNb2hhbW1lZCA8aGFtb2hhbW1lZC5zYUBnbWFpbC5jb20+Cj4+PiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL3ZrbXMv
dmttc19kcnYuYyB8IDIgKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmtt
c19kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmMKPj4+IGluZGV4IDcyNjgw
MWFiNDRkNC4uZWI0MDA3NDQzNzA2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19kcnYuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYuYwo+
Pj4gQEAgLTEyNCw3ICsxMjQsNyBAQCBzdGF0aWMgaW50IHZrbXNfbW9kZXNldF9pbml0KHN0cnVj
dCB2a21zX2RldmljZSAqdmttc2RldikKPj4+ICAgICAgIGRldi0+bW9kZV9jb25maWcubWF4X2hl
aWdodCA9IFlSRVNfTUFYOwo+Pj4gICAgICAgZGV2LT5tb2RlX2NvbmZpZy5jdXJzb3Jfd2lkdGgg
PSA1MTI7Cj4+PiAgICAgICBkZXYtPm1vZGVfY29uZmlnLmN1cnNvcl9oZWlnaHQgPSA1MTI7Cj4+
PiAtICAgICBkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDI0Owo+Pj4gKyAgICAg
ZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAzMjsKPj4KPj4gQXJlIHlvdSBzdXJl
IHhyZ2I4ODg4J3MgZGVwdGggaXMgMzIgYW5kIG5vdCAyND8gTG9va2luZyBhdCBkcm1kYiBbMV0s
ICphbGwqCj4+IGRyaXZlcnMgc2V0IGl0IHRvIDI0Lgo+IAo+IFVoIHRoZXJlJ3MgYSBwcm9ibGVt
IEkgdGhpbmsuIERlcHRoIHNob3VsZCBpbmRlZWQgc3RheSBhdCAyNCwgdGhlCj4gcHJvYmxlbSBp
cyB0aGF0IGZiIGhlbHBlcnMgZGlyZWN0bHkgdGFrZSB0aGF0IHRvIGJlIHRoZSBicHAgcGFyYW1l
dGVyLAo+IHdoaWNoIGlzIGEgZGlmZmVyZW50IHRoaW5nLiBBbmQgaWYgeW91IGxvb2sgYXQgaG93
IG1vc3QgZHJpdmVycyBzZXQgdXAKPiB0aGF0LCB0aGV5IHBpY2sgMzIuCj4gCj4gSSBndWVzcyBJ
IG5lZWQgdG8gcmV2ZXJ0IHRoaXMgaGVyZSwgYW5kIHVuY29uZnVzZSB0aGUgZmIgaGVscGVycyBh
Ym91dAo+IGRlcHRoIHZzIGJwcC4KCkkganVzdCBwcmVwYXJlZCB0aGUgUFIgZm9yIGRybS1taXNj
LW5leHQsIGJ1dCBzYXcgaXQgYXQgMzIgc3RpbGwuIFdhcwp0aGlzIHN1cHBvc2VkIHRvIGJlIHJl
dmVydGVkPwoKQmVzdCByZWdhcmRzClRob21hcwoKPiAKPiBNYXliZSBiZXN0IHdvdWxkIGJlIHRv
IGp1c3Qgc3dpdGNoIG92ZXIgdG8gcHJlZmVycmVkIGRybV9mb3VyY2MgZm9ybWF0Cj4gY29kZSwg
b3IgbWF5YmUganVzdCBwaWNrIHRoaXMgdXAgZnJvbSB0aGUgZmlyc3QgZm9ybWF0IHRoZSBwcmlt
YXJ5Cj4gcGxhbmUgc3VwcG9ydHMuCj4gCj4gVGhpcyBpcyBhbGwgZ2V0dGluZyBzbGlnaHRseSB0
cmlja3kgYW5kIGEgbG90IG1vcmUgd29yayA6LS8KPiAtRGFuaWVsCj4gLS0KPiBEYW5pZWwgVmV0
dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKPiAKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQpHZXNjaMOkZnRz
ZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
