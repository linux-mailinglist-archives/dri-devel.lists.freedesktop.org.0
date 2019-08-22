Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE098B9E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 08:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D706E9D1;
	Thu, 22 Aug 2019 06:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793AC6E471
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 224BA89F38E;
 Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B489E58B5;
 Thu, 22 Aug 2019 06:50:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E57E77F; Thu, 22 Aug 2019 08:50:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm/bochs: drop yres_virtual from struct bochs_device
Date: Thu, 22 Aug 2019 08:50:39 +0200
Message-Id: <20190822065041.11941-3-kraxel@redhat.com>
In-Reply-To: <20190822065041.11941-1-kraxel@redhat.com>
References: <20190822065041.11941-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG5lZWRlZCwgd3JpdGluZyB0byBWQkVfRElTUElfSU5ERVhfVklSVF9IRUlHSFQgaGFzIG5v
IGVmZmVjdCBhbnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaCAgICB8IDEgLQogZHJp
dmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2h3LmMgfCA4ICsrLS0tLS0tCiAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYm9jaHMvYm9jaHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Nocy5oCmlu
ZGV4IGVkMTY4NDA0MTFmMS4uNmFhZTQ5NGZmYmU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHMuaApAQCAt
NjIsNyArNjIsNiBAQCBzdHJ1Y3QgYm9jaHNfZGV2aWNlIHsKIAkvKiBtb2RlICovCiAJdTE2IHhy
ZXM7CiAJdTE2IHlyZXM7Ci0JdTE2IHlyZXNfdmlydHVhbDsKIAl1MzIgc3RyaWRlOwogCXUzMiBi
cHA7CiAJc3RydWN0IGVkaWQgKmVkaWQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYm9j
aHMvYm9jaHNfaHcuYyBiL2RyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jCmluZGV4IDk0
OTkzMGQ4YTkyZi4uMjY1N2IyZTZlNGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYm9j
aHMvYm9jaHNfaHcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYm9jaHMvYm9jaHNfaHcuYwpAQCAt
MjExLDExICsyMTEsOSBAQCB2b2lkIGJvY2hzX2h3X3NldG1vZGUoc3RydWN0IGJvY2hzX2Rldmlj
ZSAqYm9jaHMsCiAJYm9jaHMtPnlyZXMgPSBtb2RlLT52ZGlzcGxheTsKIAlib2Nocy0+YnBwID0g
MzI7CiAJYm9jaHMtPnN0cmlkZSA9IG1vZGUtPmhkaXNwbGF5ICogKGJvY2hzLT5icHAgLyA4KTsK
LQlib2Nocy0+eXJlc192aXJ0dWFsID0gYm9jaHMtPmZiX3NpemUgLyBib2Nocy0+c3RyaWRlOwog
Ci0JRFJNX0RFQlVHX0RSSVZFUigiJWR4JWQgQCAlZCBicHAsIHZ5ICVkXG4iLAotCQkJIGJvY2hz
LT54cmVzLCBib2Nocy0+eXJlcywgYm9jaHMtPmJwcCwKLQkJCSBib2Nocy0+eXJlc192aXJ0dWFs
KTsKKwlEUk1fREVCVUdfRFJJVkVSKCIlZHglZCBAICVkIGJwcFxuIiwKKwkJCSBib2Nocy0+eHJl
cywgYm9jaHMtPnlyZXMsIGJvY2hzLT5icHApOwogCiAJYm9jaHNfdmdhX3dyaXRlYihib2Nocywg
MHgzYzAsIDB4MjApOyAvKiB1bmJsYW5rICovCiAKQEAgLTIyNSw4ICsyMjMsNiBAQCB2b2lkIGJv
Y2hzX2h3X3NldG1vZGUoc3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMsCiAJYm9jaHNfZGlzcGlf
d3JpdGUoYm9jaHMsIFZCRV9ESVNQSV9JTkRFWF9ZUkVTLCAgICAgICAgYm9jaHMtPnlyZXMpOwog
CWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfQkFOSywgICAgICAgIDAp
OwogCWJvY2hzX2Rpc3BpX3dyaXRlKGJvY2hzLCBWQkVfRElTUElfSU5ERVhfVklSVF9XSURUSCwg
IGJvY2hzLT54cmVzKTsKLQlib2Noc19kaXNwaV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVY
X1ZJUlRfSEVJR0hULAotCQkJICBib2Nocy0+eXJlc192aXJ0dWFsKTsKIAlib2Noc19kaXNwaV93
cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1hfT0ZGU0VULCAgICAwKTsKIAlib2Noc19kaXNw
aV93cml0ZShib2NocywgVkJFX0RJU1BJX0lOREVYX1lfT0ZGU0VULCAgICAwKTsKIAotLSAKMi4x
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
