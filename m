Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52540E8F60
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 19:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3476E59D;
	Tue, 29 Oct 2019 18:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0197.hostedemail.com
 [216.40.44.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AC46E59D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:36:07 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id CE5E4180A5B16;
 Tue, 29 Oct 2019 18:36:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:857:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3868:3872:4321:5007:6742:10004:10400:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13019:13069:13311:13357:13439:14096:14097:14659:14721:21080:21627:21773:30054:30070:30075:30079:30091,
 0,
 RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:26,
 LUA_SUMMARY:none
X-HE-Tag: thing30_17c4da0fde813
X-Filterd-Recvd-Size: 2471
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Tue, 29 Oct 2019 18:36:03 +0000 (UTC)
Message-ID: <5a6f05cef45dbb4f77008b36d7a63b429f1519ec.camel@perches.com>
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, Andrea Righi <righi.andrea@gmail.com>
Date: Tue, 29 Oct 2019 11:35:55 -0700
In-Reply-To: <20191029182320.GA17569@mwanda>
References: <20191029182320.GA17569@mwanda>
User-Agent: Evolution 3.34.1-2 
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
Cc: linux-fbdev@vger.kernel.org, security@kernel.org,
 Kees Cook <keescook@chromium.org>, kernel-janitors@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTEwLTI5IGF0IDIxOjIzICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IFRoZSAiZml4IiBzdHJ1Y3QgaGFzIGEgMiBieXRlIGhvbGUgYWZ0ZXIgLT55d3JhcHN0ZXAgYW5k
IHRoZQo+ICJmaXggPSBpbmZvLT5maXg7IiBhc3NpZ25tZW50IGRvZXNuJ3QgbmVjZXNzYXJpbHkg
Y2xlYXIgaXQuICBJdCBkZXBlbmRzCj4gb24gdGhlIGNvbXBpbGVyLgpbXQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYm1lbS5jCltdCj4gQEAgLTExMDksNiArMTEwOSw3IEBAIHN0YXRpYyBsb25nIGRvX2Zi
X2lvY3RsKHN0cnVjdCBmYl9pbmZvICppbmZvLCB1bnNpZ25lZCBpbnQgY21kLAo+ICAJCQlyZXQg
PSAtRUZBVUxUOwo+ICAJCWJyZWFrOwo+ICAJY2FzZSBGQklPR0VUX0ZTQ1JFRU5JTkZPOgo+ICsJ
CW1lbXNldCgmZml4LCAwLCBzaXplb2YoZml4KSk7Cj4gIAkJbG9ja19mYl9pbmZvKGluZm8pOwo+
ICAJCWZpeCA9IGluZm8tPmZpeDsKPiAgCQlpZiAoaW5mby0+ZmxhZ3MgJiBGQklORk9fSElERV9T
TUVNX1NUQVJUKQoKUGVyaGFwcyBiZXR0ZXIgdG8gY2hhbmdlIHRoZSBzdHJ1Y3QgY29weSB0byBh
IG1lbWNweQotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJtZW0uYwppbmRleCBlNmExYzgwLi4zNjQ2OTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYm1lbS5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1l
bS5jCkBAIC0xMTEwLDcgKzExMTAsNyBAQCBzdGF0aWMgbG9uZyBkb19mYl9pb2N0bChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbywgdW5zaWduZWQgaW50IGNtZCwKIAkJYnJlYWs7CiAJY2FzZSBGQklPR0VU
X0ZTQ1JFRU5JTkZPOgogCQlsb2NrX2ZiX2luZm8oaW5mbyk7Ci0JCWZpeCA9IGluZm8tPmZpeDsK
KwkJbWVtY3B5KCZmaXgsICZpbmZvLT5maXgsIHNpemVvZihmaXgpKTsKIAkJaWYgKGluZm8tPmZs
YWdzICYgRkJJTkZPX0hJREVfU01FTV9TVEFSVCkKIAkJCWZpeC5zbWVtX3N0YXJ0ID0gMDsKIAkJ
dW5sb2NrX2ZiX2luZm8oaW5mbyk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
