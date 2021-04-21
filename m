Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D984E366FCE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 18:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5A889DFA;
	Wed, 21 Apr 2021 16:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2650F89DAB;
 Wed, 21 Apr 2021 16:18:07 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id n184so16917871oia.12;
 Wed, 21 Apr 2021 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5IyC7Gpwn5ArZ5GanVhyjl5d8zPk1aPolAUQ4cg0yI=;
 b=W8RcbjmW8ZSOG+xTgCM551bMZ/waizOAlhWCuQ1MflmMQRD/OJYhLJo79NtPBqURlg
 GtT2q0WhnNlwyttY/HrjDINdCBlRjQZLnJEXpTy1j3xjE5nxC8Jy120x4p45BKLy2M6T
 QfZxs4A/62x0ltpISQi7q2yaooQyKtibGxgf6A5bmqk0T050WaoTvPCEt8H81mhlMGy3
 rQTQk3lOS7OxdyejpNV+MvnnoiFbNeCRR+qGfLYdgmTlpzCKN+CvYcwj2NLiWDO+I0ji
 FJmGP8qyiLtq5Fwn3QAq5mZ0afE6blYLEmlsYPV48HDvZbndHZBh+XOzFr8EcRD+dcZP
 XdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=d5IyC7Gpwn5ArZ5GanVhyjl5d8zPk1aPolAUQ4cg0yI=;
 b=CQJTIer/KpotFT8MjJEXLMEqKD2s1domIt+fN9XkJtn/Yhn7MjZjcvYDGnvwVsnVV6
 53LUmKPNi+s9I+6qY2aZM1AoUj1DyGLU2C7/og7Hmgxrhf7W6XOUU325Pg14gIyq7NHG
 cNPSKbG4Umy//a0E5IyDu9Wc4Qe9U70YjcomGVnfqHILMaqJol+ba/9+CHJYnSy+jAwJ
 fsWy58ZtkY0BAYhPjpznZgouxqNGyMosHHvi76QmhPGjGFRB8xz0GlSKnG+2eq2s2b2Z
 08mzsuIJahvzGr+FAGGZPBddHiTj/34W9AUOHadZgSFHuTcJKmWa4WfieV2tkJzrdQRO
 XqcA==
X-Gm-Message-State: AOAM531YM5iu8TFQRXytw8o1SkXx0tZ12Od7h3EAlx5BbmTX5d7P46Bg
 6K9MkTBAO1FiUFcQreiMckM=
X-Google-Smtp-Source: ABdhPJxLD2J7kjsRr4bQeHQNlhiyYOmBZqzEdKSHxoRd6pcHgTe1Elkjy8gyHtZydpUgPCR74pFYWw==
X-Received: by 2002:aca:ad81:: with SMTP id w123mr5895267oie.113.1619021886481; 
 Wed, 21 Apr 2021 09:18:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m3sm627253otk.18.2021.04.21.09.18.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Apr 2021 09:18:06 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Fix build warnings
Date: Wed, 21 Apr 2021 09:18:02 -0700
Message-Id: <20210421161802.175639-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgd2FybmluZ3MuCgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzoKCUluIGZ1bmN0aW9uIOKAmGRt
X3VwZGF0ZV9tc3RfdmNwaV9zbG90c19mb3JfZHNj4oCZOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzo2MjQyOjQ2OgoJd2FybmluZzog
dmFyaWFibGUg4oCYb2xkX2Nvbl9zdGF0ZeKAmSBzZXQgYnV0IG5vdCB1c2VkCgpkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYzoKCUluIGZ1
bmN0aW9uIOKAmGFtZGdwdV9kbV9jb21taXRfY3Vyc29yc+KAmToKZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6NzcwOTo0NDoKCXdhcm5p
bmc6IHZhcmlhYmxlIOKAmG5ld19wbGFuZV9zdGF0ZeKAmSBzZXQgYnV0IG5vdCB1c2VkCgpUaGUg
dmFyaWFibGVzIHdlcmUgaW50cm9kdWNlZCB0byBiZSB1c2VkIGluIGl0ZXJhdG9ycywgYnV0IG5v
dCB1c2VkLgpVc2Ugb3RoZXIgaXRlcmF0b3JzIHdoaWNoIGRvbid0IHJlcXVpcmUgdGhlIHVudXNl
ZCB2YXJpYWJsZXMuCgpGaXhlczogOGFkMjc4MDYyZGU0ZSAoImRybS9hbWQvZGlzcGxheTogRGlz
YWJsZSBjdXJzb3JzIGJlZm9yZSBkaXNhYmxpbmcgcGxhbmVzIikKRml4ZXM6IDI5YjliYTc0ZjYz
ODQgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlY2FsY3VsYXRlIFZDUEkgc2xvdHMgZm9yIG5ldyBEU0Mg
Y29ubmVjdG9ycyIpClNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKaW5kZXggNTczY2YxNzI2MmRhLi5mOWI4N2YxZjQyNGIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNjIz
OSwxMyArNjIzOSwxMyBAQCBzdGF0aWMgaW50IGRtX3VwZGF0ZV9tc3RfdmNwaV9zbG90c19mb3Jf
ZHNjKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIHsKIAlzdHJ1Y3QgZGNfc3RyZWFt
X3N0YXRlICpzdHJlYW0gPSBOVUxMOwogCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3I7
Ci0Jc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKm5ld19jb25fc3RhdGUsICpvbGRfY29uX3N0
YXRlOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpuZXdfY29uX3N0YXRlOwogCXN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yOwogCXN0cnVjdCBkbV9jb25uZWN0b3Jf
c3RhdGUgKmRtX2Nvbm5fc3RhdGU7CiAJaW50IGksIGosIGNsb2NrLCBicHA7CiAJaW50IHZjcGks
IHBibl9kaXYsIHBibiA9IDA7CiAKLQlmb3JfZWFjaF9vbGRuZXdfY29ubmVjdG9yX2luX3N0YXRl
KHN0YXRlLCBjb25uZWN0b3IsIG9sZF9jb25fc3RhdGUsIG5ld19jb25fc3RhdGUsIGkpIHsKKwlm
b3JfZWFjaF9uZXdfY29ubmVjdG9yX2luX3N0YXRlKHN0YXRlLCBjb25uZWN0b3IsIG5ld19jb25f
c3RhdGUsIGkpIHsKIAogCQlhY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25u
ZWN0b3IpOwogCkBAIC03NzA2LDE1ICs3NzA2LDE0IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9o
YW5kbGVfdnJyX3RyYW5zaXRpb24oc3RydWN0IGRtX2NydGNfc3RhdGUgKm9sZF9zdGF0ZSwKIHN0
YXRpYyB2b2lkIGFtZGdwdV9kbV9jb21taXRfY3Vyc29ycyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUpCiB7CiAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7Ci0Jc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqb2xkX3BsYW5lX3N0YXRlLCAqbmV3X3BsYW5lX3N0YXRlOworCXN0cnVjdCBkcm1f
cGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZTsKIAlpbnQgaTsKIAogCS8qCiAJICogVE9ETzog
TWFrZSB0aGlzIHBlci1zdHJlYW0gc28gd2UgZG9uJ3QgaXNzdWUgcmVkdW5kYW50IHVwZGF0ZXMg
Zm9yCiAJICogY29tbWl0cyB3aXRoIG11bHRpcGxlIHN0cmVhbXMuCiAJICovCi0JZm9yX2VhY2hf
b2xkbmV3X3BsYW5lX2luX3N0YXRlKHN0YXRlLCBwbGFuZSwgb2xkX3BsYW5lX3N0YXRlLAotCQkJ
CSAgICAgICBuZXdfcGxhbmVfc3RhdGUsIGkpCisJZm9yX2VhY2hfb2xkX3BsYW5lX2luX3N0YXRl
KHN0YXRlLCBwbGFuZSwgb2xkX3BsYW5lX3N0YXRlLCBpKQogCQlpZiAocGxhbmUtPnR5cGUgPT0g
RFJNX1BMQU5FX1RZUEVfQ1VSU09SKQogCQkJaGFuZGxlX2N1cnNvcl91cGRhdGUocGxhbmUsIG9s
ZF9wbGFuZV9zdGF0ZSk7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
