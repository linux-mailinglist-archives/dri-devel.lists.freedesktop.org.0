Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC35873A0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107526ED2E;
	Fri,  9 Aug 2019 08:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Thu, 08 Aug 2019 07:48:33 UTC
Received: from r3-11.sinamail.sina.com.cn (unknown [202.108.3.11])
 by gabe.freedesktop.org (Postfix) with SMTP id B860D6E7B4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 07:48:32 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.253.230.179])
 by sina.com with ESMTP
 id 5D4BD2870003564E; Thu, 8 Aug 2019 15:43:06 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 30895649291193
From: Hillf Danton <hdanton@sina.com>
To: Alex Deucher <alexdeucher@gmail.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: The issue with page allocation 5.3 rc1-rc2 (seems drm culprit
 here)
Date: Thu,  8 Aug 2019 15:42:52 +0800
Message-Id: <20190808074252.6864-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
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
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIFRodSwgOCBBdWcgMjAxOSAxMzozMjowNiArMDgwMCBBbGV4IERldWNoZXIgd3JvdGU6Cj4g
Cj4gT24gV2VkLCBBdWcgNywgMjAxOSBhdCAxMTo0OSBQTSBNaWtoYWlsIEdhdnJpbG92IHdyb3Rl
Ogo+ID4KPiA+IFVuZm9ydHVuYXRlbHkgZXJyb3IgImdub21lLXNoZWxsOiBwYWdlIGFsbG9jYXRp
b24gZmFpbHVyZTogb3JkZXI6NCwKPiA+IG1vZGU6MHg0MGNjMChHRlBfS0VSTkVMfF9fR0ZQX0NP
TVApLAo+ID4gbm9kZW1hc2s9KG51bGwpLGNwdXNldD0vLG1lbXNfYWxsb3dlZD0wIiBzdGlsbCBo
YXBwZW5zIGV2ZW4gd2l0aAo+ID4gYXBwbHlpbmcgdGhpcyBwYXRjaC4KClRoYW5rcyBNaWtoYWls
LgoKTm8gc3VycHJpbmcgdG8gc2VlIHRoZSB3YXJuaW5nIGJlY2F1c2Ugb2Yga3ZtYWxsb2Mgb24g
dG9wIG9mIHRoZSBjdXJyZW50CmttYWxsb2MuIEFueSBvdGhlciBkaWZmZXJlbmNlIG9ic2VydmVk
PwoKPiBJIHRoaW5rIHdlIGNhbiBqdXN0IGRyb3AgdGhlIGttYWxsb2MgYWx0b2dldGhlci4KCkRy
b3BwaW5nIGttYWxsb2MgYWx0b2dldGhlciBPVE9IIG1ha2VzIHRoZSByZWFzb24gZm9yIHRoZSB2
bWFsbG9jCmZhbGxiYWNrIElNTywgU2lyPwoKPiBIb3cgYWJvdXQgdGhpcyBwYXRjaD8KPiAKPiBG
cm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gRGF0ZTogVGh1
LCA4IEF1ZyAyMDE5IDAwOjI5OjIzIC0wNTAwCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL2Rp
c3BsYXk6IHVzZSBrdm1hbGxvYyBmb3IgZGNfc3RhdGUKPiAKPiBJdCdzIGxhcmdlIGFuZCBkb2Vz
bid0IG5lZWQgY29udGlndW91cyBtZW1vcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQoKTG9va3MgZ29vZCB0byBtZSBp
ZiB3aXRoIGEga3ZmcmVlIGFkZGVkLgoKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGMuYyB8IDkgKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jb3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kYy5jCj4gaW5kZXggMjUyYjYyMWQ5M2E5Li5lZjc4MGE0ZTQ4NGEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKPiBAQCAtMjMsNiArMjMsNyBAQAo+ICAg
Ki8KPiAgCj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tbS5o
Pgo+ICAKPiAgI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCj4gIAo+IEBAIC0xMTgzLDggKzExODQs
OCBAQCBib29sIGRjX3Bvc3RfdXBkYXRlX3N1cmZhY2VzX3RvX3N0cmVhbShzdHJ1Y3QgZGMgKmRj
KQo+ICAKPiAgc3RydWN0IGRjX3N0YXRlICpkY19jcmVhdGVfc3RhdGUoc3RydWN0IGRjICpkYykK
PiAgewo+IC0Jc3RydWN0IGRjX3N0YXRlICpjb250ZXh0ID0ga3phbGxvYyhzaXplb2Yoc3RydWN0
IGRjX3N0YXRlKSwKPiAtCQkJCQkgICBHRlBfS0VSTkVMKTsKPiArCXN0cnVjdCBkY19zdGF0ZSAq
Y29udGV4dCA9IGt2emFsbG9jKHNpemVvZihzdHJ1Y3QgZGNfc3RhdGUpLAo+ICsJCQkJCSAgICBH
RlBfS0VSTkVMKTsKPiAgCj4gIAlpZiAoIWNvbnRleHQpCj4gIAkJcmV0dXJuIE5VTEw7Cj4gQEAg
LTEyMDQsMTEgKzEyMDUsMTEgQEAgc3RydWN0IGRjX3N0YXRlICpkY19jcmVhdGVfc3RhdGUoc3Ry
dWN0IGRjICpkYykKPiAgc3RydWN0IGRjX3N0YXRlICpkY19jb3B5X3N0YXRlKHN0cnVjdCBkY19z
dGF0ZSAqc3JjX2N0eCkKPiAgewo+ICAJaW50IGksIGo7Cj4gLQlzdHJ1Y3QgZGNfc3RhdGUgKm5l
d19jdHggPSBrbWVtZHVwKHNyY19jdHgsCj4gLQkJCXNpemVvZihzdHJ1Y3QgZGNfc3RhdGUpLCBH
RlBfS0VSTkVMKTsKPiArCXN0cnVjdCBkY19zdGF0ZSAqbmV3X2N0eCA9IGt2bWFsbG9jKHNpemVv
ZihzdHJ1Y3QgZGNfc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiAgCj4gIAlpZiAoIW5ld19jdHgpCj4g
IAkJcmV0dXJuIE5VTEw7Cj4gKwltZW1jcHkobmV3X2N0eCwgc3JjX2N0eCwgc2l6ZW9mKHN0cnVj
dCBkY19zdGF0ZSkpOwo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBNQVhfUElQRVM7IGkrKykgewo+
ICAJCQlzdHJ1Y3QgcGlwZV9jdHggKmN1cl9waXBlID0gJm5ld19jdHgtPnJlc19jdHgucGlwZV9j
dHhbaV07Cj4gLS0gCj4gMi4yMC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
