Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F710998F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 08:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347A6E21B;
	Tue, 26 Nov 2019 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FF46E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 07:25:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 855DEB2EB;
 Tue, 26 Nov 2019 07:25:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH 4/4] drm/mgag200: Add module parameter to pin all buffers at
 offset 0
Date: Tue, 26 Nov 2019 08:25:45 +0100
Message-Id: <20191126072545.22663-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126072545.22663-1-tzimmermann@suse.de>
References: <20191126072545.22663-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIGhhcmR3YXJlIHRoYXQgZG9lcyBub3QgaW50ZXJwcmV0IHRoZSBzdGFydGFkZCBmaWVsZCBj
b3JyZWN0bHksCmFkZCB0aGUgbW9kdWxlIHBhcmFtZXRlciAnaHdfYnVnX25vX3N0YXJ0YWRkJywg
d2hpY2ggZW5hYmxlcyB0aGUKd29ya2Fyb3VuZC4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfZHJ2LmMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMKaW5kZXggZDQzOTUxY2FlZWEw
Li43OTgzNmIwOWE1NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwpAQCAt
MjcsNiArMjcsMTAgQEAgaW50IG1nYWcyMDBfbW9kZXNldCA9IC0xOwogTU9EVUxFX1BBUk1fREVT
Qyhtb2Rlc2V0LCAiRGlzYWJsZS9FbmFibGUgbW9kZXNldHRpbmciKTsKIG1vZHVsZV9wYXJhbV9u
YW1lZChtb2Rlc2V0LCBtZ2FnMjAwX21vZGVzZXQsIGludCwgMDQwMCk7CiAKK2ludCBtZ2FnMjAw
X2h3X2J1Z19ub19zdGFydGFkZCA9IC0xOworTU9EVUxFX1BBUk1fREVTQyhtb2Rlc2V0LCAiSFcg
ZG9lcyBub3QgaW50ZXJwcmV0IHNjYW5vdXQtYnVmZmVyIHN0YXJ0IGFkZHJlc3MgY29ycmVjdGx5
Iik7Cittb2R1bGVfcGFyYW1fbmFtZWQoaHdfYnVnX25vX3N0YXJ0YWRkLCBtZ2FnMjAwX2h3X2J1
Z19ub19zdGFydGFkZCwgaW50LCAwNDAwKTsKKwogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRy
aXZlcjsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0g
ewpAQCAtNjQsNiArNjgsMTAgQEAgREVGSU5FX0RSTV9HRU1fRk9QUyhtZ2FnMjAwX2RyaXZlcl9m
b3BzKTsKIAogc3RhdGljIGJvb2wgbWdhZzIwMF9waW5fYm9fYXRfMChjb25zdCBzdHJ1Y3QgbWdh
X2RldmljZSAqbWRldikKIHsKKwlpZiAoIW1nYWcyMDBfaHdfYnVnX25vX3N0YXJ0YWRkKQorCQly
ZXR1cm4gZmFsc2U7CisJZWxzZSBpZiAobWdhZzIwMF9od19idWdfbm9fc3RhcnRhZGQgPiAwKQor
CQlyZXR1cm4gdHJ1ZTsKIAlyZXR1cm4gbWRldi0+ZmxhZ3MgJiBNR0FHMjAwX0ZMQUdfSFdfQlVH
X05PX1NUQVJUQUREOwogfQogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
