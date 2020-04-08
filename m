Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA51A1EA3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 12:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923BD6EA0F;
	Wed,  8 Apr 2020 10:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8796B6EA0F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 10:18:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4F37920029;
 Wed,  8 Apr 2020 12:18:53 +0200 (CEST)
Date: Wed, 8 Apr 2020 12:18:52 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] video: fbdev: matroxfb: remove dead code and set but not
 used variable
Message-ID: <20200408101852.GC20795@ravnborg.org>
References: <20200403021609.20968-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403021609.20968-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=i0EeH86SAAAA:8
 a=e5mUnYsNAAAA:8 a=I71sJGB1j8iV39tR8JAA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 b.zolnierkie@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFzb24uCgpPbiBGcmksIEFwciAwMywgMjAyMCBhdCAxMDoxNjowOUFNICswODAwLCBKYXNv
biBZYW4gd3JvdGU6Cj4gRml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cj4gCj4gZHJpdmVy
cy92aWRlby9mYmRldi9tYXRyb3gvZzQ1MF9wbGwuYzozMzY6MTU6IHdhcm5pbmc6IHZhcmlhYmxl
Cj4g4oCYcGl4ZWxfdmNv4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCj4gICB1bnNpZ25lZCBpbnQgcGl4ZWxfdmNvOwo+ICAgICAgICAgICAgICAgIF5+fn5+
fn5+fgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+CgpUaGFua3MsIGNv
bW1pdHRlZCBhbmQgcHVzaGVkIHRvIGRybS1taXNjLW5leHQuClRoZSBmaXggd2lsbCBzaG93IHVw
IGluIHVwc3RyZWFtIGtlcm5lbCBhdCB0aGUgbmV4dAptZXJnZSB3aW5kb3cuCgoJU2FtCgo+IC0t
LQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21hdHJveC9nNDUwX3BsbC5jIHwgMjIgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L2c0NTBfcGxsLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L21hdHJveC9nNDUwX3BsbC5jCj4gaW5kZXggYzE1ZjhhNTc0OThlLi5mZjhl
MzIxYTIyY2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9tYXRyb3gvZzQ1MF9w
bGwuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWF0cm94L2c0NTBfcGxsLmMKPiBAQCAt
MzMzLDExICszMzMsOSBAQCBzdGF0aWMgaW50IF9fZzQ1MF9zZXRjbGsoc3RydWN0IG1hdHJveF9m
Yl9pbmZvICptaW5mbywgdW5zaWduZWQgaW50IGZvdXQsCj4gIAkJCSB1bnNpZ25lZCBpbnQgKmRl
bHRhYXJyYXkpCj4gIHsKPiAgCXVuc2lnbmVkIGludCBtbnBjb3VudDsKPiAtCXVuc2lnbmVkIGlu
dCBwaXhlbF92Y287Cj4gIAljb25zdCBzdHJ1Y3QgbWF0cm94X3BsbF9saW1pdHMqIHBpOwo+ICAJ
c3RydWN0IG1hdHJveF9wbGxfY2FjaGUqIGNpOwo+ICAKPiAtCXBpeGVsX3ZjbyA9IDA7Cj4gIAlz
d2l0Y2ggKHBsbCkgewo+ICAJCWNhc2UgTV9QSVhFTF9QTExfQToKPiAgCQljYXNlIE1fUElYRUxf
UExMX0I6Cj4gQEAgLTQyMCw3ICs0MTgsNiBAQCBzdGF0aWMgaW50IF9fZzQ1MF9zZXRjbGsoc3Ry
dWN0IG1hdHJveF9mYl9pbmZvICptaW5mbywgdW5zaWduZWQgaW50IGZvdXQsCj4gIAkJCQkKPiAg
CQkJCW1ucCA9IG1hdHJveGZiX0RBQ19pbihtaW5mbywgTTEwNjRfWFBJWFBMTENNKSA8PCAxNjsK
PiAgCQkJCW1ucCB8PSBtYXRyb3hmYl9EQUNfaW4obWluZm8sIE0xMDY0X1hQSVhQTExDTikgPDwg
ODsKPiAtCQkJCXBpeGVsX3ZjbyA9IGc0NTBfbW5wMnZjbyhtaW5mbywgbW5wKTsKPiAgCQkJCW1h
dHJveGZiX0RBQ191bmxvY2tfaXJxcmVzdG9yZShmbGFncyk7Cj4gIAkJCX0KPiAgCQkJcGkgPSAm
bWluZm8tPmxpbWl0cy52aWRlbzsKPiBAQCAtNDQxLDI1ICs0MzgsNiBAQCBzdGF0aWMgaW50IF9f
ZzQ1MF9zZXRjbGsoc3RydWN0IG1hdHJveF9mYl9pbmZvICptaW5mbywgdW5zaWduZWQgaW50IGZv
dXQsCj4gIAkJCXVuc2lnbmVkIGludCBkZWx0YTsKPiAgCj4gIAkJCXZjbyA9IGc0NTBfbW5wMnZj
byhtaW5mbywgbW5wKTsKPiAtI2lmIDAJCQkKPiAtCQkJaWYgKHBsbCA9PSBNX1ZJREVPX1BMTCkg
ewo+IC0JCQkJdW5zaWduZWQgaW50IGJpZywgc21hbGw7Cj4gLQo+IC0JCQkJaWYgKHZjbyA8IHBp
eGVsX3Zjbykgewo+IC0JCQkJCXNtYWxsID0gdmNvOwo+IC0JCQkJCWJpZyA9IHBpeGVsX3ZjbzsK
PiAtCQkJCX0gZWxzZSB7Cj4gLQkJCQkJc21hbGwgPSBwaXhlbF92Y287Cj4gLQkJCQkJYmlnID0g
dmNvOwo+IC0JCQkJfQo+IC0JCQkJd2hpbGUgKGJpZyA+IHNtYWxsKSB7Cj4gLQkJCQkJYmlnID4+
PSAxOwo+IC0JCQkJfQo+IC0JCQkJaWYgKGJpZyA9PSBzbWFsbCkgewo+IC0JCQkJCWNvbnRpbnVl
Owo+IC0JCQkJfQo+IC0JCQl9Cj4gLSNlbmRpZgkJCQo+ICAJCQlkZWx0YSA9IHBsbF9mcmVxX2Rl
bHRhKGZvdXQsIGc0NTBfdmNvMmYobW5wLCB2Y28pKTsKPiAgCQkJZm9yIChpZHggPSBtbnBjb3Vu
dDsgaWR4ID4gMDsgaWR4LS0pIHsKPiAgCQkJCS8qID09IGlzIGltcG9ydGFudDsgZHVlIHRvIG5l
eHRwbGwgYWxnb3JpdGhtIHdlIGdldAo+IC0tIAo+IDIuMTcuMgo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlz
dAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
