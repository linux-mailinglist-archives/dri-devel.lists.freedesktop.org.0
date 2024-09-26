Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C5986C11
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 07:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6B10E013;
	Thu, 26 Sep 2024 05:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="JQyWOOFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 446 seconds by postgrey-1.36 at gabe;
 Thu, 26 Sep 2024 05:33:39 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E53388784
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:33:39 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240926052610epoutp02064c438d28ee2eea1e653f365b79a9b6~4tABiNZ-e2700527005epoutp02a
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 05:26:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240926052610epoutp02064c438d28ee2eea1e653f365b79a9b6~4tABiNZ-e2700527005epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727328370;
 bh=9MAi+qFyft85MmmfbtuAWfV4Vpr9g/bP51pxJnrvTco=;
 h=From:Date:Subject:To:Cc:References:From;
 b=JQyWOOFkCl7WwOJD9I54S0mRrRLnC2/ZLeLAv0rMDDrVi8HU7ML113XZGXhRuPAYQ
 VgKSMB/AedkhxqSmMkWxbDni/ZWta7f49F8mx/vH4w+MzHV5gBlYCJUUBfeJZnqs8Q
 +eXaO1RcbeeqCX1duLKF/hB3jluzVEUZcvnHcJ70=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240926052610epcas1p4c520927c06690173cc2b1a078bea8eb4~4tABMvxm91544115441epcas1p4m;
 Thu, 26 Sep 2024 05:26:10 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.233]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4XDhsF2hF8z4x9QC; Thu, 26 Sep
 2024 05:26:09 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 CB.1D.09725.170F4F66; Thu, 26 Sep 2024 14:26:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240926052608epcas1p39e2db7b275e944285d0925b3e5c649b9~4s--oEo5x1059110591epcas1p3p;
 Thu, 26 Sep 2024 05:26:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240926052608epsmtrp10fb74bd6b61fe702eb46b60a65e40fb4~4s--nQ1Ue3004130041epsmtrp1K;
 Thu, 26 Sep 2024 05:26:08 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff700000025fd-0b-66f4f07128b2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.B1.08964.070F4F66; Thu, 26 Sep 2024 14:26:08 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240926052608epsmtip2095f62459e88af80410b6dcd5d10990c~4s--UaHIR0725407254epsmtip23;
 Thu, 26 Sep 2024 05:26:08 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Thu, 26 Sep 2024 14:25:39 +0900
Subject: [PATCH] drm/exynos: remove unused prototype for crtc
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-remove_crtc-v1-1-9a20062444cb@samsung.com>
X-B4-Tracking: v=1; b=H4sIAFLw9GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNT3aLU3Pyy1PjkopJkXUszE/OkxMTEJNPkFCWgjoKi1LTMCrBp0bG
 1tQC2pY2CXQAAAA==
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,  Kwanghoon
 Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmnm7hhy9pBlNa+S1OXF/EZPFg3jY2
 iytf37NZTLo/gcWid81VJovz5zewW5xtesNusenxNVaLy7vmsFnMOL+PyWL2u/3sFjMmv2Rz
 4PHY+20Bi8fOWXfZPTat6mTzuN99nMlj85J6j74tqxg9Pm+SC2CPyrbJSE1MSS1SSM1Lzk/J
 zEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMATpUSaEsMacUKBSQWFyspG9nU5Rf
 WpKqkJFfXGKrlFqQklNgWqBXnJhbXJqXrpeXWmJlaGBgZApUmJCdsWj7J/aC1ZwVv5eUNDBO
 5Ohi5OSQEDCR+LT0CHMXIxeHkMAORomnx3+zgiSEBD4xStz7xgmR+MYocXlmDwtMx+YPDawQ
 ib2MEr82LmCDcF4xSsz9sIMRpIpNQF1iSdtadhCbRUBV4l7HdzBbWMBWoufUbLAVvAKCEidn
 PgGbyiwgL7H97RxmiLiDxN83E1lAhkoIrGGU2Hf5F5gjItDHJLHpSD87iMMssIlR4tzFdVBH
 CUt83r2GDcJeyiFx56UAhO0i8e7QBWaYmlfHt7BD2FISL/vboOxsiaMf90L1lkhcn7WIFcI2
 lti/dDJTFyMH0DJNifW79CEu5ZN497WHFSQsIcAr0dEmBGHKS9zqLIdoFJU48/Qj1EAPicdT
 jjFDgjRWounvCcYJjPKzkLw/C8n7sxB2LWBkXsUollpQnJueWmxYYAyP1OT83E2M4LSqZb6D
 cdrbD3qHGJk4GA8xSnAwK4nwTrr5MU2INyWxsiq1KD++qDQntfgQoykwEiYyS4km5wMTe15J
 vKGJpYGJmZGxiYWhmaGSOO+ZK2WpQgLpiSWp2ampBalFMH1MHJxSDUz5/83SJDdeVPfcVXp+
 hnKC9KPsub1hgS0SNQ/e3KlwP/fMeWmHtt8tncNrDZl3HxTR4vOonlq0vEZs/tPSnDiBvsXx
 Kqv+bGAyr+pNeSQXvf1Pr2jJnSvn4r+3zGMsYFsZ96ldSqpe95Va7+0pM+8a8RwPvioxf25A
 8CmPa1kRD4+sMmTPbnBp+SO8QsmlwzDERqAiV55Z5dxC7XUvHM6Zsh8OuHukLOFTz9w9+t+c
 I+uDbkdv33p9mUligaVj0cPjDnUlAnaVzYoPnYOqPe1flL0K/munmpzAvKbub723edD+vzUN
 q+090xuFRTpe7pux+e3m1UU/mrgtZy6K5BUsYehv++XFZHzIRalOiaU4I9FQi7moOBEAw9Zf
 kTQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSvG7Bhy9pBr+uq1qcuL6IyeLBvG1s
 Fle+vmezmHR/AotF75qrTBbnz29gtzjb9IbdYtPja6wWl3fNYbOYcX4fk8Xsd/vZLWZMfsnm
 wOOx99sCFo+ds+6ye2xa1cnmcb/7OJPH5iX1Hn1bVjF6fN4kF8AexWWTkpqTWZZapG+XwJWx
 aPsn9oLVnBW/l5Q0ME7k6GLk5JAQMJHY/KGBtYuRi0NIYDejxPyTv1ghEqISHZcbGbsYOYBs
 YYnDh4shal4wSmw5ep0FpIZNQF1iSdtadhCbRUBV4l7HdzBbWMBWoufUbLA5vAKCEidnPmEB
 mcMsoCmxfpc+SJhZQF5i+9s5zBAlDhJ/30xkgVi7hlFiDshILg4RgQlMEt+ubWEBcZgFNjNK
 LJ69nQmiSlji8+41bBMYBWYh2TELYccsJDsWMDKvYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvX
 S87P3cQIjhctzR2M21d90DvEyMTBeIhRgoNZSYR30s2PaUK8KYmVValF+fFFpTmpxYcYpTlY
 lMR5xV/0pggJpCeWpGanphakFsFkmTg4pRqYeDkSkhSnymovuy3Jetf6RLrpkym1z/hm63+8
 J1X+6ZCGjj77fLN8tb+Mv7+c5F/K4mC5KH5/0snz78yv72ZMMn7Od8Y28P4BuQJBhUPVP/58
 5JV/GpRg/Khy+oNexRPaKW/TzRytFd+dPs0nv1vweLnyQoG58me39gmp7+bVmc144T9HaPK8
 5u05Wb3M26M+LXxbNu2OZlNEmFKqtMdkD8sjnT3eCjuDLhpWGyXUnI3P/2Td4npD/2W49CaJ
 tFPW65+WhnHP/cT7dm/E/TDuZIawgr8/ehaXtxy1C194dKlhSIfGgkwOZSGLHMN9+jslNQty
 b6Tdjl/yeMIXni8npQxfK9vueXO/w+WJ3yslluKMREMt5qLiRAAPJMRQBgMAAA==
X-CMS-MailID: 20240926052608epcas1p39e2db7b275e944285d0925b3e5c649b9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240926052608epcas1p39e2db7b275e944285d0925b3e5c649b9
References: <CGME20240926052608epcas1p39e2db7b275e944285d0925b3e5c649b9@epcas1p3.samsung.com>
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

exynos_drm_crtc_wait_pending_update, exynos_drm_crtc_finish_update
are not used anymore.

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.h b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
index 0ed4f2b8595a..1815374c38df 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.h
@@ -19,9 +19,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
 					enum exynos_drm_output_type out_type,
 					const struct exynos_drm_crtc_ops *ops,
 					void *context);
-void exynos_drm_crtc_wait_pending_update(struct exynos_drm_crtc *exynos_crtc);
-void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
-				   struct exynos_drm_plane *exynos_plane);
 
 /* This function gets crtc device matched with out_type. */
 struct exynos_drm_crtc *exynos_drm_crtc_get_by_type(struct drm_device *drm_dev,

---
base-commit: 684a64bf32b6e488004e0ad7f0d7e922798f65b6
change-id: 20240925-remove_crtc-9647baaab5cd

Best regards,
-- 
Kwanghoon Son <k.son@samsung.com>

