Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF724B4A52
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3966EB85;
	Tue, 17 Sep 2019 09:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADB66EB86
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:24:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 623ED308213F;
 Tue, 17 Sep 2019 09:24:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0796E10013A1;
 Tue, 17 Sep 2019 09:24:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5726BA1E0; Tue, 17 Sep 2019 11:24:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/11] drm/shmem: drop VM_DONTDUMP
Date: Tue, 17 Sep 2019 11:23:56 +0200
Message-Id: <20190917092404.9982-4-kraxel@redhat.com>
In-Reply-To: <20190917092404.9982-1-kraxel@redhat.com>
References: <20190917092404.9982-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 17 Sep 2019 09:24:06 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG9idmlvdXMgd2h5IHRoaXMgaXMgbmVlZGVkLiAgQWNjb3JkaW5nIHRvIERlbmllbCBWZXR0
ZXIgdGhpcyBpcyBtb3N0Cmxpa2VseSBhIGhpc3RvcmljIGFydGVmYWN0IGRhdGluZyBiYWNrIHRv
IHRoZSBkYXlzIHdoZXJlIGRybSBkcml2ZXJzCmV4cG9zZWQgaGFyZHdhcmUgcmVnaXN0ZXJzIGFz
IG1tYXAnYWJsZSBnZW0gb2JqZWN0cywgdG8gYXZvaWQgZHVtcGluZwp0b3VjaGluZyB0aG9zZSBy
ZWdpc3RlcnMuICBzaG1lbSBnZW0gb2JqZWN0cyBzdXJlbHkgZG9uJ3QgbmVlZCB0aGF0IC4uLgoK
U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3No
bWVtX2hlbHBlci5jCmluZGV4IGE5YTU4NjYzMDUxNy4uNmVmZWRhYjE1MDE2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwpAQCAtNTM2LDcgKzUzNiw3IEBAIGludCBkcm1f
Z2VtX3NobWVtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKQogCQlyZXR1cm4gcmV0OwogCX0KIAotCXZtYS0+dm1fZmxhZ3MgfD0gVk1f
SU8gfCBWTV9NSVhFRE1BUCB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKKwl2bWEtPnZt
X2ZsYWdzIHw9IFZNX0lPIHwgVk1fTUlYRURNQVAgfCBWTV9ET05URVhQQU5EOwogCXZtYS0+dm1f
cGFnZV9wcm90ID0gcGdwcm90X3dyaXRlY29tYmluZSh2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1f
ZmxhZ3MpKTsKIAl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQodm1hLT52bV9w
YWdlX3Byb3QpOwogCXZtYS0+dm1fb3BzID0gJmRybV9nZW1fc2htZW1fdm1fb3BzOwotLSAKMi4x
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
