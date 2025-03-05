Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D6A50EE7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 23:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7746610E843;
	Wed,  5 Mar 2025 22:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B50g/4oX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF1E10E83E;
 Wed,  5 Mar 2025 22:44:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 313A35C6D1A;
 Wed,  5 Mar 2025 22:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65452C4CEE0;
 Wed,  5 Mar 2025 22:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741214686;
 bh=wyy6bcz35Ic0LJohT92NUNy6iUK9dV6mTRs4Ply78R0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=B50g/4oXMbIoV9Z9klmYx4jSKhaAt9xUVznXxTMsj1LsGGmHtD0uMC//nA9uB+bh+
 fBKdRlfFEPocAL0pLDQNE5bwjEzesmIpGqet9sy9x0ZilNvthO5AOVwCRencJBNUlg
 EV9KU+U94AtIb6bDPqhzx1JOF14/EzdfqDl/NkgsfPTJslKK8nDNbKOj8uruGd7l/i
 ychaGahHwmWdHDKShjUePaLfYPs00Xh6YH/XjkBtx0tqHia9/1q8uhAce7rFvuM5wc
 BSi5b/D3VVcP0QxRX8uB1bAx/Z9WdYIdrZz5rF7FvRis34wLxi3t9+FVpyJIGVo+tL
 SXidsLY3FjjsQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Thu, 06 Mar 2025 00:44:36 +0200
Subject: [PATCH 1/2] MAINTAINERS: use kernel.org alias
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-update-email-v1-1-9a231571e905@kernel.org>
References: <20250306-update-email-v1-0-9a231571e905@kernel.org>
In-Reply-To: <20250306-update-email-v1-0-9a231571e905@kernel.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=785; i=lumag@kernel.org;
 h=from:subject:message-id; bh=wyy6bcz35Ic0LJohT92NUNy6iUK9dV6mTRs4Ply78R0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyNPaiH30/Z0LIok7AfjA4+dIOaq9P7v6VBovp
 k8fkJSC926JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8jT2gAKCRCLPIo+Aiko
 1bYaCACC2ErRbrXgHzpgyB9m6gmnrH+kUTtLozv6RKaDBnvqRANy/gpceaGDdhVGDQSRD6ZNhpj
 0kizyR/eA+obKC3tQ1DRcaQCxb09HqNGRJUcL1Waghwz7ojvMI0L/HME/9JsKoNAlyLyxXsRIj6
 r2e9VFMk5jeABnqa1DGgB7YZ12IO9BZ81UcNm47xlFDH/uris0b15MqhOGX9T/AlJtr8mTvClP0
 oaQGohu2miz7bYwq2kwtzrKAkmd9gR33fWydzau9cmofBMDiFqlZ1OqzpZF8cv62l8U4BkVAwbT
 dVFFqyLRfoi1G1OMXa6GpUvooUL9YdeKLIM/vWnXw3Pm0gVP
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

My Linaro email will stop working soon. Use @kernel.org email instead.

Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..b3a67e278a839fa14d1329a249ecf4bbec00c26c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7459,7 +7459,7 @@ F:	include/uapi/drm/msm_drm.h
 DRM DRIVER for Qualcomm display hardware
 M:	Rob Clark <robdclark@gmail.com>
 M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
-M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+M:	Dmitry Baryshkov <lumag@kernel.org>
 R:	Sean Paul <sean@poorly.run>
 R:	Marijn Suijten <marijn.suijten@somainline.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.39.5

