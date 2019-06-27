Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FE5826E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94B189824;
	Thu, 27 Jun 2019 12:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C75F89824
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:23:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E40DE3003BF1;
 Thu, 27 Jun 2019 12:23:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 758B15D719;
 Thu, 27 Jun 2019 12:23:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BC28911AAF; Thu, 27 Jun 2019 14:23:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/bochs: cleanups and framebuffer setup fix.
Date: Thu, 27 Jun 2019 14:23:43 +0200
Message-Id: <20190627122348.5833-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 27 Jun 2019 12:23:56 +0000 (UTC)
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

CgpHZXJkIEhvZmZtYW5uICg1KToKICBnZW0vdnJhbTogcGluIHRvIHZyYW0gaW4gdm1hcAogIGRy
bS9ib2NoczogcGFzcyBmcmFtZWJ1ZmZlciB0byBib2Noc19od19zZXRiYXNlCiAgZHJtL2JvY2hz
OiBkcm9wIHlyZXNfdmlydHVhbCBmcm9tIHN0cnVjdCBib2Noc19kZXZpY2UKICBkcm0vYm9jaHM6
IGRyb3Agc3RyaWRlIGFuZCBicHAgZnJvbSBzdHJ1Y3QgYm9jaHNfZGV2aWNlCiAgZHJtL2JvY2hz
OiBtb3ZlIGJvY2hzX2h3X3NldGZvcm1hdCgpIGNhbGwKCiBkcml2ZXJzL2dwdS9kcm0vYm9jaHMv
Ym9jaHMuaCAgICAgICAgIHwgMTAgKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ib2Nocy9ib2No
c19ody5jICAgICAgfCAzNyArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9ib2Nocy9ib2Noc19rbXMuYyAgICAgfCAxMyArKystLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
