Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A662DDAE50
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D626EA9E;
	Thu, 17 Oct 2019 13:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B706EA9C;
 Thu, 17 Oct 2019 13:26:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C8685307D9CF;
 Thu, 17 Oct 2019 13:26:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FDA35C1B5;
 Thu, 17 Oct 2019 13:26:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C1F399997; Thu, 17 Oct 2019 15:26:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/qxl: use DEFINE_DRM_GEM_FOPS()
Date: Thu, 17 Oct 2019 15:26:37 +0200
Message-Id: <20191017132638.9693-5-kraxel@redhat.com>
In-Reply-To: <20191017132638.9693-1-kraxel@redhat.com>
References: <20191017132638.9693-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 17 Oct 2019 13:26:46 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZSBubyBxeGwtc3BlY2lmaWMgZm9wcyBhbnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9xeGwv
cXhsX2Rydi5jIHwgMTAgKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmMKaW5kZXggNjU0NjQ2MzBhYzk4Li4x
ZDYwMWY1N2E2YmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCkBAIC0xNTAsMTUgKzE1MCw3IEBAIHF4
bF9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCWRybV9kZXZfcHV0KGRldik7CiB9
CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHF4bF9mb3BzID0gewotCS5v
d25lciA9IFRISVNfTU9EVUxFLAotCS5vcGVuID0gZHJtX29wZW4sCi0JLnJlbGVhc2UgPSBkcm1f
cmVsZWFzZSwKLQkudW5sb2NrZWRfaW9jdGwgPSBkcm1faW9jdGwsCi0JLnBvbGwgPSBkcm1fcG9s
bCwKLQkucmVhZCA9IGRybV9yZWFkLAotCS5tbWFwID0gZHJtX2dlbV9tbWFwLAotfTsKK0RFRklO
RV9EUk1fR0VNX0ZPUFMocXhsX2ZvcHMpOwogCiBzdGF0aWMgaW50IHF4bF9kcm1fZnJlZXplKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
