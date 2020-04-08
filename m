Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B66D1A1EA6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 12:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EED36EA13;
	Wed,  8 Apr 2020 10:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1796EA13
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 10:19:30 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A011D20027;
 Wed,  8 Apr 2020 12:19:28 +0200 (CEST)
Date: Wed, 8 Apr 2020 12:19:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH] video: fbdev: mb862xx: remove set but not used variable
 'mdr'
Message-ID: <20200408101927.GD20795@ravnborg.org>
References: <20200403022553.33320-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403022553.33320-1-yanaijie@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=i0EeH86SAAAA:8
 a=e5mUnYsNAAAA:8 a=fKMPv7tiX5XEn72-Iu4A:9 a=QEXdDO2ut3YA:10
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, b.zolnierkie@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFzb24uCgpPbiBGcmksIEFwciAwMywgMjAyMCBhdCAxMDoyNTo1M0FNICswODAwLCBKYXNv
biBZYW4gd3JvdGU6Cj4gRml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cj4gCj4gZHJpdmVy
cy92aWRlby9mYmRldi9tYjg2Mnh4L21iODYyeHhmYl9hY2NlbC5jOjE4Nzo2OiB3YXJuaW5nOiB2
YXJpYWJsZQo+IOKAmG1kcuKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQo+ICAgaW50IG1kcjsKPiAgICAgICBefn4KPiAKPiBSZXBvcnRlZC1ieTogSHVsayBS
b2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gWWFuIDx5YW5h
aWppZUBodWF3ZWkuY29tPgoKVGhhbmtzLCBjb21taXR0ZWQgdG8gZHJtLW1pc2MtbmV4dC4KVGhl
IGZpeCB3aWxsIHNob3cgdXAgZHVyaWduIHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4KCglTYW0KCj4g
LS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvbWI4NjJ4eC9tYjg2Mnh4ZmJfYWNjZWwuYyB8IDIg
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvbWI4NjJ4eC9tYjg2Mnh4ZmJfYWNjZWwuYyBiL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvbWI4NjJ4eC9tYjg2Mnh4ZmJfYWNjZWwuYwo+IGluZGV4IDQyNTY5MjY0ODAxZi4u
ZDQwYjgwNjQ2MWNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWI4NjJ4eC9t
Yjg2Mnh4ZmJfYWNjZWwuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbWI4NjJ4eC9tYjg2
Mnh4ZmJfYWNjZWwuYwo+IEBAIC0xODQsNyArMTg0LDYgQEAgc3RhdGljIHZvaWQgbWI4NjI5MGZi
X2ltYWdlYmxpdDE2KHUzMiAqY21kLCB1MTYgc3RlcCwgdTE2IGR4LCB1MTYgZHksCj4gIHN0YXRp
YyB2b2lkIG1iODYyOTBmYl9pbWFnZWJsaXQoc3RydWN0IGZiX2luZm8gKmluZm8sCj4gIAkJCQlj
b25zdCBzdHJ1Y3QgZmJfaW1hZ2UgKmltYWdlKQo+ICB7Cj4gLQlpbnQgbWRyOwo+ICAJdTMyICpj
bWQgPSBOVUxMOwo+ICAJdm9pZCAoKmNtZGZuKSAodTMyICosIHUxNiwgdTE2LCB1MTYsIHUxNiwg
dTE2LCB1MzIsIHUzMiwKPiAgCQkgICAgICAgY29uc3Qgc3RydWN0IGZiX2ltYWdlICosIHN0cnVj
dCBmYl9pbmZvICopID0gTlVMTDsKPiBAQCAtMTk2LDcgKzE5NSw2IEBAIHN0YXRpYyB2b2lkIG1i
ODYyOTBmYl9pbWFnZWJsaXQoc3RydWN0IGZiX2luZm8gKmluZm8sCj4gIAl1MTYgZHggPSBpbWFn
ZS0+ZHgsIGR5ID0gaW1hZ2UtPmR5Owo+ICAJaW50IHgyLCB5MiwgdnhyZXMsIHZ5cmVzOwo+ICAK
PiAtCW1kciA9IChHRENfUk9QX0NPUFkgPDwgOSk7Cj4gIAl4MiA9IGltYWdlLT5keCArIGltYWdl
LT53aWR0aDsKPiAgCXkyID0gaW1hZ2UtPmR5ICsgaW1hZ2UtPmhlaWdodDsKPiAgCXZ4cmVzID0g
aW5mby0+dmFyLnhyZXNfdmlydHVhbDsKPiAtLSAKPiAyLjE3LjIKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
