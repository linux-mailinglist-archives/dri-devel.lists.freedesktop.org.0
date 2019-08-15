Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB48E6DD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64C36E8F1;
	Thu, 15 Aug 2019 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609506E886;
 Thu, 15 Aug 2019 00:49:15 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 1D6D03EA1D;
 Thu, 15 Aug 2019 00:49:14 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Subject: [PATCH 05/11] drm/bridge: analogix-anx78xx: correct value of TX_P0
Date: Wed, 14 Aug 2019 20:48:48 -0400
Message-Id: <20190815004854.19860-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830154;
 bh=vvUbQvnJ/4OGyTU3jR+k5h+lF40i8YqgCaHr7dOl1Qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GNUjU00qmOaQpH/H6nGA9HmdDwtETr0KGIReNXp+26ch2MMd1z4kyfQvyaMbZt+HT
 xecw9TYCY+UOayRIlV9u0VzL3URggiPjeSxlavZeF0NQM+UJ3yXYsIJO+ZD9DOLJ5d
 AYCIS3i/+uvfkd3WekVOviCLXubzK8/+7Khmrp0Y=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBhdHRlbXB0aW5nIHRvIGNvbmZpZ3VyZSB0aGlzIGRyaXZlciBvbiBhIE5leHVzIDUgcGhv
bmUgKG1zbTg5NzQpLApzZXR0aW5nIHVwIHRoZSBkdW1teSBpMmMgYnVzIGZvciBUWF9QMCB3b3Vs
ZCBmYWlsIGR1ZSB0byBhbiAtRUJVU1kKZXJyb3IuIFRoZSBkb3duc3RyZWFtIE1TTSBrZXJuZWwg
c291cmNlcyBbMV0gc2hvd3MgdGhhdCB0aGUgcHJvcGVyIHZhbHVlCmZvciBUWF9QMCBpcyAweDc4
LCBub3QgMHg3MCwgc28gY29ycmVjdCB0aGUgdmFsdWUgdG8gYWxsb3cgZGV2aWNlCnByb2Jpbmcg
dG8gc3VjY2VlZC4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vQUlDUC9rZXJuZWxfbGdlX2hhbW1l
cmhlYWQvYmxvYi9uNy4xL2RyaXZlcnMvdmlkZW8vc2xpbXBvcnQvc2xpbXBvcnRfdHhfcmVnLmgK
ClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5oIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmggYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaAppbmRleCAyNWUwNjNiY2VjYmMuLmJjNTExZmM2MDVj
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmgKQEAgLTYsNyAr
Niw3IEBACiAjaWZuZGVmIF9fQU5YNzh4eF9ICiAjZGVmaW5lIF9fQU5YNzh4eF9ICiAKLSNkZWZp
bmUgVFhfUDAJCQkJMHg3MAorI2RlZmluZSBUWF9QMAkJCQkweDc4CiAjZGVmaW5lIFRYX1AxCQkJ
CTB4N2EKICNkZWZpbmUgVFhfUDIJCQkJMHg3MgogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
