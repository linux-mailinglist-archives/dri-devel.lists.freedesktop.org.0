Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BC48330
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 14:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AD38921E;
	Mon, 17 Jun 2019 12:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2019 12:55:19 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F658921E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 12:55:19 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MkpvV-1iL0zK3xWR-00mM5r; Mon, 17 Jun 2019 14:50:06 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: "James (Qian) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/komeda: fix size_t format string
Date: Mon, 17 Jun 2019 14:49:18 +0200
Message-Id: <20190617125002.1312331-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:2IhlH3w9aK7OqAObh0m0vtxUjmwrTi/dYeLzaTbn3KHAugqPA8o
 upoUdMJZ1b6d3NEfaBcd6MZbAuwFtdZ71C++Eh5q12WN8vmMJUEXW6JIe/JpUrIXf++qqi6
 v1bKA5Cxe/HV/9AQpRk7pZqnXeHebYbE+h+L9C19RjPK6emuttIEXdLD+XEnlU7+WS+0MgC
 JtVOPXXnWtvXeN4BfSoVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ti3Wa9oJNFg=:T3BYQRFe+rCQyihBF9RYY2
 OM7UgegglZFjtKmZF9qIzP+OcafwlEvL/eOZzkY9RDbBE2+XkGAeiYF/9c8IA9NIXTdxVrCuM
 p0t8xnz7130HFUuhB3U9S1hPrD5dkBtGD0zdFm52GVoK76BZrwUFkmVMA8kGht25Dm8n+gbrY
 eXY0GgDVShlUhYFrckUPyIjtq6n7rs4hs686mRIUbS2VE539EgufYYJcHTR7di5E9x1aBWDn9
 HBMbYSY64krOLeyTGOGaSVZFXpWi/Bcl89QL1KLh5Ox/qb8PST2bxswk+AIkVHamCcDw3v/bN
 Ipnh30re54cZTHOT7XF0z4/AOAA+egKMWRFJ2EWasnBo1YLsEmAaplSeYId3whJzAlIvBrB3v
 FIBrIKjUL093GoUVfS2JK35+mdkWia+MIwH239ubYEixDFuKN+D8zRjO38kaDgB83ePLu8JIk
 Kh1u6/WruWq5F8cpWcHnbHMR09e8+qXfCwZVIBazVF6zZ31hFtYfkzIoqT/zu0EQtexDSMKWR
 HiEUJF5swL5LEMNHMXArtXwBBJifabNbmgrFZ7ABBAh+yElkIQSDfkPjhxS3D2/QJkfi5bXkH
 v5Pm7hw7JfPC3ttGyHT9e3akotUim9JSIbM55PtBMGW1UCDJ2+u6dfCLWOM22V5kMGFQTENAL
 FPs0N3Zgp+o0dD//RENRbW17eNUlo2v6onthjCYoplwAtcr4Hf2IjxGPyaEfAUzvaiRFSlfFt
 kpLkeZHaGYi4HvqI0b+j1O5rMoJf4gggycjZww==
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRlYnVnIG91dHB1dCB1c2VzIHRoZSB3cm9uZyBmb3JtYXQgc3RyaW5nIGZvciBwcmludGlu
ZyBhIHNpemVfdDoKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2RybS9kcm1fbW0uaDo0
OSwKICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvZHJtL2RybV92bWFfbWFuYWdlci5oOjI2
LAogICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9kcm0vZHJtX2dlbS5oOjQwLAogICAgICAg
ICAgICAgICAgIGZyb20gZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZnJhbWVidWZmZXIuYzo5Ogpkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9mcmFtZWJ1ZmZlci5jOiBJbiBmdW5jdGlvbiAna29tZWRhX2ZiX2FmYmNfc2l6ZV9jaGVjayc6
CmRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmM6
OTY6MTc6IGVycm9yOiBmb3JtYXQgJyVseCcgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlICdsb25n
IHVuc2lnbmVkIGludCcsIGJ1dCBhcmd1bWVudCAzIGhhcyB0eXBlICdzaXplX3QnIHtha2EgJ3Vu
c2lnbmVkIGludCd9IFstV2Vycm9yPWZvcm1hdD1dCiAgIERSTV9ERUJVR19LTVMoImFmYmMgc2l6
ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCVseC4gbWluX3NpemUgMHgleC5cbiIsCgpUaGlz
IGlzIGhhcm1sZXNzIGluIHRoZSBrZXJuZWwgYXMgc2l6ZV90IGFuZCBsb25nIGFyZSBhbHdheXMg
dGhlIHNhbWUKd2lkdGgsIGJ1dCBpdCdzIGFsd2F5cyBiZXR0ZXIgdG8gdXNlIHRoZSBjb3JyZWN0
IGZvcm1hdCBzdHJpbmcKdG8gc2h1dCB1cCB0aGUgd2FybmluZy4KCkZpeGVzOiA5Y2NmNTM2ZTUz
Y2IgKCJkcm0va29tZWRhOiBBZGRlZCBBRkJDIHN1cHBvcnQgZm9yIGtvbWVkYSBkcml2ZXIiKQpT
aWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZm
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVm
ZmVyLmMKaW5kZXggYWJjOGMwY2NjMDUzLi41OGZmMzRlNzE4ZDAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwpA
QCAtOTMsNyArOTMsNyBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFf
ZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAogCQkJICAgICAgIEFGQkNfU1VQRVJCTEtf
QUxJR05NRU5UKTsKIAltaW5fc2l6ZSA9IGtmYi0+YWZiY19zaXplICsgZmItPm9mZnNldHNbMF07
CiAJaWYgKG1pbl9zaXplID4gb2JqLT5zaXplKSB7Ci0JCURSTV9ERUJVR19LTVMoImFmYmMgc2l6
ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCVseC4gbWluX3NpemUgMHgleC5cbiIsCisJCURS
TV9ERUJVR19LTVMoImFmYmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCV6eC4gbWlu
X3NpemUgMHgleC5cbiIsCiAJCQkgICAgICBvYmotPnNpemUsIG1pbl9zaXplKTsKIAkJZ290byBj
aGVja19mYWlsZWQ7CiAJfQpAQCAtMTM3LDcgKzEzNyw3IEBAIGtvbWVkYV9mYl9ub25lX2FmYmNf
c2l6ZV9jaGVjayhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiwgc3RydWN0IGtvbWVkYV9mYiAqa2Zi
LAogCQltaW5fc2l6ZSA9IGtvbWVkYV9mYl9nZXRfcGl4ZWxfYWRkcihrZmIsIDAsIGZiLT5oZWln
aHQsIGkpCiAJCQkgLSB0b19kcm1fZ2VtX2NtYV9vYmoob2JqKS0+cGFkZHI7CiAJCWlmIChvYmot
PnNpemUgPCBtaW5fc2l6ZSkgewotCQkJRFJNX0RFQlVHX0tNUygiVGhlIGZiLT5vYmpbJWRdIHNp
emU6ICVsZCBsb3dlciB0aGFuIHRoZSBtaW5pbXVtIHJlcXVpcmVtZW50OiAlZC5cbiIsCisJCQlE
Uk1fREVCVUdfS01TKCJUaGUgZmItPm9ialslZF0gc2l6ZTogJXpkIGxvd2VyIHRoYW4gdGhlIG1p
bmltdW0gcmVxdWlyZW1lbnQ6ICVkLlxuIiwKIAkJCQkgICAgICBpLCBvYmotPnNpemUsIG1pbl9z
aXplKTsKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9Ci0tIAoyLjIwLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
