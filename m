Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C31901AA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5576E426;
	Mon, 23 Mar 2020 23:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DDC6E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:12:59 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id 65so2587514wrl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sg2qLtVi/m/AD+n66HzhenmkGMOB9RjitFrDcK+U5kI=;
 b=EDZ49gz9yRfN2p+XTir8OZNd/ytZJ+wxwtBkr9k/N0hg8faJIpiccWFUO+8nNZrmtN
 v53wq8lgN6yqQYZa6QGWoJ2ZCjyhJXimNFVWmSv8xqw28PJ7LrM6PD/X2ANeTvHU3obb
 yTvoBQntyqiz4DZNxq8Y5zfU7XxvO7q5dE3LPj5EI4vEdilmy6ASyS/GbmkyQQeiEt7z
 v9cmcjCrc+W58kRI5QttDF76giLn8dA7cK5t9ZlVhCScPdgWAX1Bq8IGEFTGi9kF+25j
 F7RfxLPxOT8rrPA2NMw+jJ1vXr3+rp2kO8DZ139j8DlNNoYk3Qha34zhef9nLCkWFeby
 K9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sg2qLtVi/m/AD+n66HzhenmkGMOB9RjitFrDcK+U5kI=;
 b=am1yWDBctS2ne3vTo3RU+llPv1Hlsk1JY5fi/xN0vmP6+z7r5rsculpKKlczkgtX+f
 3D+h0Q7Gvx0WiIL2PXWSFZm2kbSCvaQ5xdvvIZHaBnQxTa9uZ6hnSJCTMchbNH1NDx94
 EqCwgZvC+6Rw6/YU+zT5DyCgdsD7BzrupDNu8VLlGpc/e91lhYXW8BpY2l0JVZABN4EY
 yEMszwuBWwxqlOxacXwyw1qzS9ZVaOGskv4GCz/oJtwooZx+VeanqRB2c81n7K9lxIqn
 D8bAIYRIW1Y5GLEQ0hHDuEpvkW3aAvYWJd4UFzl+3MkoSyWeWam6+TILyZPIaMvtf75F
 dlIA==
X-Gm-Message-State: ANhLgQ0H08QnRyjl+e30w9bW6wX2Y+Xd6syB0zMZ9ECWJCioowLcg5Xp
 FYqsh/t3HdiDr51XVYy7Q0NgNIxh
X-Google-Smtp-Source: ADFU+vub+bK1E7zwJCNCUXCIexd6REO+rQoBLY+MyowwUe1qrF7lhuPrF6wVDVcVGnWcQlN8KrUvGw==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr13593764wrs.13.1585005177884; 
 Mon, 23 Mar 2020 16:12:57 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id b82sm1495262wmb.46.2020.03.23.16.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:12:57 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 17/17] drm/vmwgfx: Use vmwgfx version 2.18 to signal SM5
 compatibility
Date: Tue, 24 Mar 2020 00:12:38 +0100
Message-Id: <20200323231238.14839-18-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
References: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+
CgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSA8dGhvbWFzX29zQHNo
aXBtYWlsLm9yZz4KUmV2aWV3ZWQtYnk6IENoYXJtYWluZSBMZWUgPGNoYXJtYWluZWxAdm13YXJl
LmNvbT4KUmV2aWV3ZWQtYnk6IEJyaWFuIFBhdWwgPGJyaWFucEB2bXdhcmUuY29tPgpSZXZpZXdl
ZC1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFJvbGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpfX18KdjI6IFVzZSAy
LjE4IGluc3RlYWQgb2YgMi4xNwotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Ry
di5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmggYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaAppbmRleCAwNDQ3YmU4NzY5N2UuLjVkZGJj
YjlmNmRmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmgKQEAgLTU4LDcgKzU4LDcg
QEAKICNkZWZpbmUgVk1XR0ZYX0RSSVZFUl9OQU1FICJ2bXdnZngiCiAjZGVmaW5lIFZNV0dGWF9E
UklWRVJfREFURSAiMjAyMDAxMTQiCiAjZGVmaW5lIFZNV0dGWF9EUklWRVJfTUFKT1IgMgotI2Rl
ZmluZSBWTVdHRlhfRFJJVkVSX01JTk9SIDE3CisjZGVmaW5lIFZNV0dGWF9EUklWRVJfTUlOT1Ig
MTgKICNkZWZpbmUgVk1XR0ZYX0RSSVZFUl9QQVRDSExFVkVMIDAKICNkZWZpbmUgVk1XR0ZYX0ZJ
Rk9fU1RBVElDX1NJWkUgKDEwMjQqMTAyNCkKICNkZWZpbmUgVk1XR0ZYX01BWF9SRUxPQ0FUSU9O
UyAyMDQ4Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
