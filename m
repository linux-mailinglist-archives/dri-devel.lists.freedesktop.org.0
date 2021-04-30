Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2236FCAE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 16:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A3B6F547;
	Fri, 30 Apr 2021 14:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BB996F547
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 9B1292020D5;
 Fri, 30 Apr 2021 16:46:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id MwP2vei1dPOT; Fri, 30 Apr 2021 16:46:54 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 8B2532020D1;
 Fri, 30 Apr 2021 16:46:54 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1lcUPt-000GJW-9Q; Fri, 30 Apr 2021 16:46:53 +0200
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <R359hIfrDhyN2VBgiSyQ1ogbifYmn7KwIuMUqS3u3A@cp4-web-032.plabs.ch>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <5af20517-40bd-c07a-7017-d96048c1ab57@daenzer.net>
Date: Fri, 30 Apr 2021 16:46:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <R359hIfrDhyN2VBgiSyQ1ogbifYmn7KwIuMUqS3u3A@cp4-web-032.plabs.ch>
Content-Language: en-CA
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0zMCA0OjQwIHAubS4sIFNpbW9uIFNlciB3cm90ZToKPiBMZXQgdGhlIHVzZXIg
a25vdyB3aGF0IHdlbnQgd3JvbmcgaW4gZHJtX2dlbV9mYl9pbml0X3dpdGhfZnVuY3MKPiBmYWls
dXJlIHBhdGhzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lv
bi5mcj4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzog
U2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KPiBDYzogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBA
Y29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZm
ZXJfaGVscGVyLmMgfCA3ICsrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVm
ZmVyX2hlbHBlci5jCj4gaW5kZXggMTA5ZDExZmI0Y2Q0Li5lNGEzYzdlYjQzYjIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuYwo+IEBAIC0xNTUs
OCArMTU1LDEwIEBAIGludCBkcm1fZ2VtX2ZiX2luaXRfd2l0aF9mdW5jcyhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAo+ICAJaW50IHJldCwgaTsKPiAgCj4gIAlpbmZvID0gZHJtX2dldF9mb3JtYXRf
aW5mbyhkZXYsIG1vZGVfY21kKTsKPiAtCWlmICghaW5mbykKPiArCWlmICghaW5mbykgewo+ICsJ
CWRybV9kYmdfa21zKGRldiwgIkZhaWxlZCB0byBnZXQgRkIgZm9ybWF0IGluZm9cbiIpOwo+ICAJ
CXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5udW1f
cGxhbmVzOyBpKyspIHsKPiAgCQl1bnNpZ25lZCBpbnQgd2lkdGggPSBtb2RlX2NtZC0+d2lkdGgg
LyAoaSA/IGluZm8tPmhzdWIgOiAxKTsKPiBAQCAtMTc1LDYgKzE3Nyw5IEBAIGludCBkcm1fZ2Vt
X2ZiX2luaXRfd2l0aF9mdW5jcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCQkgKyBtb2Rl
X2NtZC0+b2Zmc2V0c1tpXTsKPiAgCj4gIAkJaWYgKG9ianNbaV0tPnNpemUgPCBtaW5fc2l6ZSkg
ewo+ICsJCQlkcm1fZGJnX2ttcyhkZXYsCj4gKwkJCQkgICAgIkdFTSBvYmplY3Qgc2l6ZSAoJXUp
IHNtYWxsZXIgdGhhbiBtaW5pbXVtIHNpemUgKCV1KSBmb3IgcGxhbmUgJWRcbiIsCj4gKwkJCQkg
ICAgb2Jqc1tpXS0+c2l6ZSwgbWluX3NpemUsIGkpOwo+ICAJCQlkcm1fZ2VtX29iamVjdF9wdXQo
b2Jqc1tpXSk7Cj4gIAkJCXJldCA9IC1FSU5WQUw7Cj4gIAkJCWdvdG8gZXJyX2dlbV9vYmplY3Rf
cHV0Owo+IAoKUmV2aWV3ZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29t
PgoKCkkgbWFkZSBhbG1vc3QgdGhlIHNhbWUgY2hhbmdlIChleGNlcHQgZm9yIHRoZSBzdHJpbmdz
KSBmb3IgdHJhY2tpbmcgZG93biB0aGUgaXNzdWUgZml4ZWQgYnkgaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQzMTY3Ny8gKG5vdGUgbXkgZm9sbG93LXVwIHRoZXJlISku
IDopCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAg
ICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
