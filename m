Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F830A30C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035076E432;
	Mon,  1 Feb 2021 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673F76E165
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 12:50:25 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p20so591306ejb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 04:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eHyxcdRkq1cYMti9nVUicUhH69aVVf5LQFGWJ0sd/ls=;
 b=lnj5kA0/kXNleiS2dTLwg9KK/txJOAaYmpDc/vU1TcrwjlZNBiyI3Hq+rEmmXS/iSf
 /Ydg9TW/k4H6HLxZANFnANadjXqaoJX7uWTLl/4e4OZyMO5woc5E+fwDQtPiFFs+lLno
 020mUWdn5g3nETAzG/jRKn/hhei3fwx5s4zvEOseSlsRsKUMGY1o4EMmUqgNu6eG0ZG/
 ygEVc1IKJzNuBw0HJLROF5huPz5pceZoQxMIwi9bDtmNYNrbt1Uqa52Z7EOSbLRqrtR0
 W3lItFYMhULm9dPnIu8D+jjbtCuhlavYaBQH5tD/UlRJFX0rAxS4MyjtEeeQ+c35OI5g
 4QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eHyxcdRkq1cYMti9nVUicUhH69aVVf5LQFGWJ0sd/ls=;
 b=Fzh3wwOOurrlYlRsNGlsRshvM9Ikon5fRlwo9jZ7NUvgWTJUIHZdkHuW0mxZ9TO2ih
 jONiQRL8+mUS5t7JUsdks7r1Jfu7KUbMUh4Q6d12hC+5Q0DNq+/ku95n2QF8st+Yqe/z
 iaem06pCFRdofH6gBBrTQ8S7rM4NzYefv2OK7VrQ7atoS1/p2Gkn4eiiS6hmva26YGXR
 ooFdghw0z2MHeCneOEiWO5HyyzanbUZ6r7UHFyUe1z4cYAjj9Zl0s5fqgfUvP1iE7Q+m
 A8wtOoEXXa5GuvfnsjYBQuTka5BCxJb+f4Hj6pTJFLcC8Dj7lNVQSkbFQh5zNrVY+Bjr
 mdWQ==
X-Gm-Message-State: AOAM532RSZ2TtFlDxrRSMbaqdto1Tu1AoDLRZyqU77YrdI4fbABfdG5/
 bHEDud1FAwbMkWQh4x4gmGDBhH5BqTg=
X-Google-Smtp-Source: ABdhPJzwvktPNgAiUqWHn6Vhx5flBjZAJHGe74jXpTZzOk80auNUnuuIRMzLHiftM9290UwaUG+snw==
X-Received: by 2002:a17:906:2e0d:: with SMTP id
 n13mr12820275eji.554.1612097423877; 
 Sun, 31 Jan 2021 04:50:23 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id j18sm1317753edj.36.2021.01.31.04.50.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 Jan 2021 04:50:23 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH] drm/rockchip: vop_reg: add PX30 version info
Date: Sun, 31 Jan 2021 13:50:16 +0100
Message-Id: <20210131125016.10837-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Mon, 01 Feb 2021 08:11:06 +0000
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
Cc: airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To reduce memory various Rockchip VOP versions share
common reg structures. However more recent added SoCs not
always have to same futures as the old ones.
Add PX30 missing version info, so all VOP version checks
work correct if needed in the future.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 80053d91a..0697057e7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -312,6 +312,7 @@ static const struct vop_win_data px30_vop_big_win_data[] = {
 };
 
 static const struct vop_data px30_vop_big = {
+	.version = VOP_VERSION(2, 6),
 	.intr = &px30_intr,
 	.feature = VOP_FEATURE_INTERNAL_RGB,
 	.common = &px30_common,
@@ -327,6 +328,7 @@ static const struct vop_win_data px30_vop_lit_win_data[] = {
 };
 
 static const struct vop_data px30_vop_lit = {
+	.version = VOP_VERSION(2, 5),
 	.intr = &px30_intr,
 	.feature = VOP_FEATURE_INTERNAL_RGB,
 	.common = &px30_common,
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
