Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC38813ECA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 01:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F037910E301;
	Fri, 15 Dec 2023 00:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AE610E301
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 00:43:28 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20231215004326epoutp025590f892ad8f8743602cef708023cb52~g2pgtmFMX1375913759epoutp02w
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 00:43:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20231215004326epoutp025590f892ad8f8743602cef708023cb52~g2pgtmFMX1375913759epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1702601006;
 bh=styQRLU5PmM8gAvGZI0V9/+SJ2jcOS7s+oCAE3VNHu0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=kLUj85YZAEoL6jld3vX+LVFB6wLJ1YcOU3uwGdGQhoBiu1kQh0BgRQesEgdQkypCa
 K4PYTJvnWrSzpEgTRF46dGHa7D48RmLY1S9kcb8ZmuOh1ZtgHNvy6mNLpYuBUtgJuA
 sVpi2QCYeXgTuhedGfIoT8wKbJ0pqh2tCbaI7oC0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20231215004325epcas1p37347debb30507070a33b815c09924e7d~g2pgZK0RA2941629416epcas1p3F;
 Fri, 15 Dec 2023 00:43:25 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.136]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Srr706Pztz4x9Q7; Fri, 15 Dec
 2023 00:43:24 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 B4.28.10211.C21AB756; Fri, 15 Dec 2023 09:43:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20231215004324epcas1p4815860461a1ab793af60e97ad1b90462~g2pfKRajq2689226892epcas1p4L;
 Fri, 15 Dec 2023 00:43:24 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231215004324epsmtrp2b9f97d4ec7d56569aa3a9ea65719abbb~g2pfJnwFc0321603216epsmtrp2Z;
 Fri, 15 Dec 2023 00:43:24 +0000 (GMT)
X-AuditID: b6c32a38-6d3fd700000027e3-01-657ba12c549c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 58.41.18939.C21AB756; Fri, 15 Dec 2023 09:43:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231215004324epsmtip1e7fb0aa3aace65c41a6986328b8eef8e~g2pe9VF7l0978309783epsmtip1S;
 Fri, 15 Dec 2023 00:43:24 +0000 (GMT)
From: Inki Dae <inki.dae@samsung.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/exynos: fix incorrect type issue
Date: Fri, 15 Dec 2023 09:43:23 +0900
Message-Id: <20231215004323.147643-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7bCmrq7OwupUg5NzjS2ufH3PZjHp/gQW
 ixnn9zFZvGp+xObA4rF4z0smj/vdx5k8+rasYvT4vEkugCUq2yYjNTEltUghNS85PyUzL91W
 yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
 I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj8vUz7AUtHBUnrq1mb2BsYO9i
 5OSQEDCR+DvtABOILSSwg1Gi8QpfFyMXkP2JUWL5+1kscM703n4WmI6Jrx4xQyR2AiW2T2GF
 cL4wSlxcN4ENpIpNQFVi4or7YLaIgLLE34mrGEFsZoFsiQkfzgDZHBzCAqYSL/7qgYRZgMqb
 Ji8BO4NXwEri4NRuqGXyEjMvfWeHiAtKnJz5hAVijLxE89bZYEdICKxjl9i+bDEzyEwJAReJ
 D9sYIXqFJV4d3wL1ppTE53d72SDqJzNK3Lm+ggXCmcEocfjndagOY4n9SyczgQxiFtCUWL9L
 H2IZn8S7rz2sEPN5JTrahCCqlSSOXbwB1SkhcWHJRDYI20Pix49p7CDlQgKxEqcvJ01glJuF
 5INZSD6YhbBrASPzKkax1ILi3PTUYsMCE3g8JufnbmIEJzQtix2Mc99+0DvEyMTBeIhRgoNZ
 SYT35I7yVCHelMTKqtSi/Pii0pzU4kOMpsAwncgsJZqcD0ypeSXxhiaWBiZmRsYmFoZmhkri
 vGeulKUKCaQnlqRmp6YWpBbB9DFxcEo1MGn5lP2r5IxcMGe+wguvoDq13yZFDvzc/w0PFMv5
 ypxq9/5fU7Fo9TydkLr5NheeGsz5J8zPfSN8Z4b1912L4p53vmR7nXFrnqDOeaUesfXxeyVz
 TnQ6rIvliXpjIT8j9tfKjiWCdxMX3kxd59xhFrhNXfhUf4NO+/9tyn3nzV+c9zGv/j4nQ0ty
 SzvT66MRlxxVM8Xm/vGfwPpF9t3ECFEDv0NJjQ3Z5X2vt7k+zXwwycHG7jBrEjN/SjBvy+Sw
 DxVZ7PFT18tYvenSMTUU7ryotqq+NuDyJ1bWjp8fz7VvVJ1hvEalfl2/ffZPmx8zrJu9t6lM
 mue+NWuWqNQ0YGKtXnNfNmiLcHQOt6wSS3FGoqEWc1FxIgBL4bnY8QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCLMWRmVeSWpSXmKPExsWy7bCSnK7OwupUg6atChZXvr5ns5h0fwKL
 xYzz+5gsXjU/YnNg8Vi85yWTx/3u40wefVtWMXp83iQXwBLFZZOSmpNZllqkb5fAlTH5+hn2
 ghaOihPXVrM3MDawdzFyckgImEhMfPWIuYuRi0NIYDujxOFzU4EcDqCEhMSWrRwQprDE4cPF
 ECWfGCXW7J7PAtLLJqAqMXHFfTYQW0RAWeLvxFWMIDazQK7E36Mf2UF6hQVMJV781QMJswCV
 N01ewgRi8wpYSRyc2s0CcYK8xMxL39kh4oISJ2c+YYEYIy/RvHU28wRGvllIUrOQpBYwMq1i
 FE0tKM5Nz00uMNQrTswtLs1L10vOz93ECA44raAdjMvW/9U7xMjEwXiIUYKDWUmE9+SO8lQh
 3pTEyqrUovz4otKc1OJDjNIcLErivMo5nSlCAumJJanZqakFqUUwWSYOTqkGJqeUpgcXDjVe
 mNzU6+1l3DLxw50SLbO9itK2b9Rfd5x7Y8x/RHtJ4O6og31m1ZH8SuvjN0rNn/hiMptA5Fc2
 uVtbrvy4ezJyjvO2KXf3zJBJ330l4guPz2/zpBPNBzYGViss/i3tmDbFvPdrnt6Sjqjf2z9+
 lOgRc1me+HfXm+uav+cvm3009mSHkoaVldKhPzITFdnnW0/jW7rOaRXv29hZRYXxh/YyOEgL
 Gk5N8NX5+dY48qXtnzlCJe4HXgRukHdZPvWW4s/ksB8cXI//9KqxMU3YLSDlFs0Z+ro0Z/UR
 znN//wt4XypyD91rtXDiLUPTVxIv1sgpPTq+elp5+l8fo/tiVY/en+GfarzynKsSS3FGoqEW
 c1FxIgB00IjhpwIAAA==
X-CMS-MailID: 20231215004324epcas1p4815860461a1ab793af60e97ad1b90462
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231215004324epcas1p4815860461a1ab793af60e97ad1b90462
References: <CGME20231215004324epcas1p4815860461a1ab793af60e97ad1b90462@epcas1p4.samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix incorrect type issue in fimd_commit() of exynos_drm_fimd.c module.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312140930.Me9yWf8F-lkp@intel.com/
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index a9f1c5c05894..60d1ef4010bb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -480,7 +480,7 @@ static void fimd_commit(struct exynos_drm_crtc *crtc)
 	struct fimd_context *ctx = crtc->ctx;
 	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
 	const struct fimd_driver_data *driver_data = ctx->driver_data;
-	void *timing_base = ctx->regs + driver_data->timing_base;
+	void __iomem *timing_base = ctx->regs + driver_data->timing_base;
 	u32 val;
 
 	if (ctx->suspended)
-- 
2.25.1

