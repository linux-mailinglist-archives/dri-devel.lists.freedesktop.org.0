Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38475B4A59
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922BF6EB88;
	Tue, 17 Sep 2019 09:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD476EB86
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 09:24:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 490F6C057E9F;
 Tue, 17 Sep 2019 09:24:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F9121001B01;
 Tue, 17 Sep 2019 09:24:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E9CAA9D3C; Tue, 17 Sep 2019 11:24:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/11] drm/ttm: drop VM_DONTDUMP
Date: Tue, 17 Sep 2019 11:24:00 +0200
Message-Id: <20190917092404.9982-8-kraxel@redhat.com>
In-Reply-To: <20190917092404.9982-1-kraxel@redhat.com>
References: <20190917092404.9982-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 17 Sep 2019 09:24:11 +0000 (UTC)
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
 open list <linux-kernel@vger.kernel.org>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IG9idmlvdXMgd2h5IHRoaXMgaXMgbmVlZGVkLiAgQWNjb3JkaW5nIHRvIERlbmllbCBWZXR0
ZXIgdGhpcyBpcyBtb3N0Cmxpa2VseSBhIGhpc3RvcmljIGFydGVmYWN0IGRhdGluZyBiYWNrIHRv
IHRoZSBkYXlzIHdoZXJlIGRybSBkcml2ZXJzCmV4cG9zZWQgaGFyZHdhcmUgcmVnaXN0ZXJzIGFz
IG1tYXAnYWJsZSBnZW0gb2JqZWN0cywgdG8gYXZvaWQgZHVtcGluZwp0b3VjaGluZyB0aG9zZSBy
ZWdpc3RlcnMuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMKaW5kZXggN2MwZTg1YzEwZTBlLi40ZGM3N2E2NmFhZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dm0uYwpAQCAtNDQ1LDcgKzQ0NSw3IEBAIHZvaWQgdHRtX2JvX21tYXBfdm1hX3NldHVwKHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqCiAJICogVk1f
TUlYRURNQVAgb24gYWxsIG1hcHBpbmdzLiBTZWUgZnJlZWRlc2t0b3Aub3JnIGJ1ZyAjNzU3MTkK
IAkgKi8KIAl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOwotCXZtYS0+dm1fZmxhZ3MgfD0g
Vk1fSU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7CisJdm1hLT52bV9mbGFncyB8PSBW
TV9JTyB8IFZNX0RPTlRFWFBBTkQ7CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib19tbWFwX3ZtYV9z
ZXR1cCk7CiAKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
