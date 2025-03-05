Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA9A50EE9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 23:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646C210E845;
	Wed,  5 Mar 2025 22:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eq9c20d4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B14410E844;
 Wed,  5 Mar 2025 22:44:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3CC8C5C6D18;
 Wed,  5 Mar 2025 22:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEF4C4CEE8;
 Wed,  5 Mar 2025 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741214688;
 bh=2JxaXI5uQ/VneCUNHP4A8xwsmj4sJP3Fjq8bh80NpMk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=eq9c20d4norAxAO/oMommFxdW5nm5a2y3XaA7Qha34sd5nGnP/rbR0V456aYJ4EeC
 cP7aJS37nVs2b667748aLYJ9J+kwrHvmFzaIlYfB7HDTgi9vdCnCWpFkQCIstZQgzN
 ZK5cGurB3ATJ962JrXevwrV+Rxjb38ZM44YqTq6asgFg2Qcr0QQZuMFKwCFoSH5FR0
 MkbKMdfS90PvCPDhCSXem6gZHUMDPqEZFa6M55GtnnS1csFE7/gxoKHhukfYWu1uAt
 gZSon1tF0JDfLAp2y9itQJF+Ua7euPIIUnui/+AzSsMxPs2wDNmRatJQ1rJnqCfXWq
 hcI7JpQEaS+Mw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 06 Mar 2025 00:44:37 +0200
Subject: [PATCH 2/2] mailmap: remap all addresses to kernel.org alias
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-update-email-v1-2-9a231571e905@kernel.org>
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
In-Reply-To: <20250306-update-email-v1-0-9a231571e905@kernel.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435; i=lumag@kernel.org;
 h=from:subject:message-id; bh=2JxaXI5uQ/VneCUNHP4A8xwsmj4sJP3Fjq8bh80NpMk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyNPbtNRffpS72VGGUzgGFdbbeJ4zw8URN3JwT
 MnlkNNV+g+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8jT2wAKCRCLPIo+Aiko
 1VXoB/9r868Rnm6Qgm8v+i+z+GwgFkQsLFFZJ/rkbhFHCaL5qp/nuJBuLKC4ORbhfMqR0sSKqPF
 bV2pQrWJBQ8pOalre5Hte6DapC+ZiOLplDHok4KiqNHhLXNkYufmrcatuX0P+a/vy15BOlCW6bY
 5SW9CbZNAurM0klwzqGzcuBQjrQVAzj9+BRea2nbGnX7SiOd9dIrueKAjiLPiLE+n4Ml2Ru/hqy
 ZbbmYVkvvaJty5Sj15/SokhZZkIn0+Gi4+q2fNLXhQt4s8Yy3twdg8hE1c57cfY+9/33iYjGvan
 WWNQxEzqJ9FkyCRZRefv2BKWXZy0tyH0IbnSnwRSuu3h7HKH
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remap all historical and non-historical entries to my kernel.org email.

Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
 .mailmap | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index 01145c078838bf9348e8d0e5e48b7b0954248dc5..a5c80ef0b7800519f3124e0d85294f34d6b275ca 100644
--- a/.mailmap
+++ b/.mailmap
@@ -198,10 +198,11 @@ Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@imgtec.com>
 Dengcheng Zhu <dzhu@wavecomp.com> <dengcheng.zhu@mips.com>
 <dev.kurt@vandijck-laurijssen.be> <kurt.van.dijck@eia.be>
 Dikshita Agarwal <quic_dikshita@quicinc.com> <dikshita@codeaurora.org>
-Dmitry Baryshkov <dbaryshkov@gmail.com>
-Dmitry Baryshkov <dbaryshkov@gmail.com> <[dbaryshkov@gmail.com]>
-Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_baryshkov@mentor.com>
-Dmitry Baryshkov <dbaryshkov@gmail.com> <dmitry_eremin@mentor.com>
+Dmitry Baryshkov <lumag@kernel.org> <dbaryshkov@gmail.com>
+Dmitry Baryshkov <lumag@kernel.org> <[dbaryshkov@gmail.com]>
+Dmitry Baryshkov <lumag@kernel.org> <dmitry_baryshkov@mentor.com>
+Dmitry Baryshkov <lumag@kernel.org> <dmitry_eremin@mentor.com>
+Dmitry Baryshkov <lumag@kernel.org> <dmitry.baryshkov@linaro.org>
 Dmitry Safonov <0x7f454c46@gmail.com> <dima@arista.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <d.safonov@partner.samsung.com>
 Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>

-- 
2.39.5

