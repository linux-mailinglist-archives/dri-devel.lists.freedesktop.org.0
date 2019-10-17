Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB97DAE3D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41426EA93;
	Thu, 17 Oct 2019 13:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917176EA85
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0988A881363
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DDE560600;
 Thu, 17 Oct 2019 13:26:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A1C716E2D; Thu, 17 Oct 2019 15:26:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/qxl: a collection of small tweaks.
Date: Thu, 17 Oct 2019 15:26:33 +0200
Message-Id: <20191017132638.9693-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Thu, 17 Oct 2019 13:26:42 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3dpdGNoIHF4bCBkcml2ZXIgdG8gdGhlIG5ldyBtbWFwIHdvcmtmbG93LApzb21lIGNsZWFudXBz
LCByZWR1Y2UgbWVtb3J5IGZyYWdtZW50YXRpb24uCgpTZXJpZXMgbmVlZHMgbGF0ZXN0IGRybS1t
aXNjLW5leHQgdG8gYnVpbGQuCgpHZXJkIEhvZmZtYW5uICg1KToKICBkcm0vcXhsOiBkcm9wIHF4
bF90dG1fZmF1bHQKICBkcm0vcXhsOiBzd2l0Y2ggcXhsIHRvICZkcm1fZ2VtX29iamVjdF9mdW5j
cy5tbWFwCiAgZHJtL3F4bDogZHJvcCB2ZXJpZnlfYWNjZXNzCiAgZHJtL3F4bDogdXNlIERFRklO
RV9EUk1fR0VNX0ZPUFMoKQogIGRybS9xeGw6IGFsbG9jYXRlIHNtYWxsIG9iamVjdHMgdG9wLWRv
d24KCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX2Rydi5jICAgIHwgMTAgKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfb2JqZWN0LmMgfCAgOCArKysrLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgICAg
fCA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
