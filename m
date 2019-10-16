Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDACD9012
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 13:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5486E94F;
	Wed, 16 Oct 2019 11:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E406E946
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 11:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C0C1B6907A;
 Wed, 16 Oct 2019 11:52:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11ECF5D9CD;
 Wed, 16 Oct 2019 11:52:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 517A931E89; Wed, 16 Oct 2019 13:52:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 03/11] drm/shmem: drop VM_DONTDUMP
Date: Wed, 16 Oct 2019 13:51:55 +0200
Message-Id: <20191016115203.20095-4-kraxel@redhat.com>
In-Reply-To: <20191016115203.20095-1-kraxel@redhat.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 16 Oct 2019 11:52:09 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
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
U2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxw
ZXIuYwppbmRleCBhOWE1ODY2MzA1MTcuLjZlZmVkYWIxNTAxNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fc2htZW1faGVscGVyLmMKQEAgLTUzNiw3ICs1MzYsNyBAQCBpbnQgZHJtX2dlbV9zaG1l
bV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSkKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1f
TUlYRURNQVAgfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7CisJdm1hLT52bV9mbGFncyB8
PSBWTV9JTyB8IFZNX01JWEVETUFQIHwgVk1fRE9OVEVYUEFORDsKIAl2bWEtPnZtX3BhZ2VfcHJv
dCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7
CiAJdm1hLT52bV9wYWdlX3Byb3QgPSBwZ3Byb3RfZGVjcnlwdGVkKHZtYS0+dm1fcGFnZV9wcm90
KTsKIAl2bWEtPnZtX29wcyA9ICZkcm1fZ2VtX3NobWVtX3ZtX29wczsKLS0gCjIuMTguMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
