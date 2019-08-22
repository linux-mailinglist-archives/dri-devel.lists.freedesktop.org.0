Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8490298B9F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 08:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4186E9D2;
	Thu, 22 Aug 2019 06:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947966E9D1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4754A3082A8D;
 Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7947E6012A;
 Thu, 22 Aug 2019 06:50:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9B3E711AAF; Thu, 22 Aug 2019 08:50:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm/bochs: some cleanups.
Date: Thu, 22 Aug 2019 08:50:37 +0200
Message-Id: <20190822065041.11941-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 22 Aug 2019 06:50:46 +0000 (UTC)
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, tzimmermann@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpHZXJkIEhvZmZtYW5uICg0KToKICBkcm0vYm9jaHM6IHBhc3MgZnJhbWVidWZmZXIgdG8gYm9j
aHNfaHdfc2V0YmFzZQogIGRybS9ib2NoczogZHJvcCB5cmVzX3ZpcnR1YWwgZnJvbSBzdHJ1Y3Qg
Ym9jaHNfZGV2aWNlCiAgZHJtL2JvY2hzOiBkcm9wIHN0cmlkZSBhbmQgYnBwIGZyb20gc3RydWN0
IGJvY2hzX2RldmljZQogIGRybS9ib2NoczogbW92ZSBib2Noc19od19zZXRmb3JtYXQoKSBjYWxs
CgogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzLmggICAgIHwgMTAgKysrLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9ib2Nocy9ib2Noc19ody5jICB8IDQxICsrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2Noc19rbXMuYyB8IDE0ICsrKy0tLS0t
LS0tCiAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQoK
LS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
