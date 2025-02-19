Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B805A3C117
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5E110E80C;
	Wed, 19 Feb 2025 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="MzblbdUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EC010E490
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:11 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140310euoutp012467cc5f18eac6f227d9db46f73c60f7~loPGX_Xrl1474514745euoutp01Z
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:03:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250219140310euoutp012467cc5f18eac6f227d9db46f73c60f7~loPGX_Xrl1474514745euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973790;
 bh=nVl9RqNjWqqCMJN0x65czVQJPwBmxJG9j64/CReghc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MzblbdUN5G3BrAkAaBZmnRViltdNcRQsTGZrqDsT/poMQzsMMFEYzSdPkv3OwpA0V
 mbz/oMb4mIoPnB7h6j/z+x1I6WkG2e5YwMzCaelNvAOhyaNMDas6eI9raO+TXm+tzI
 ROSfIm2pzBPokdSgU6AL5wsM/ApjOODK0+Rub0/k=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140309eucas1p197fbbc05b88ba14a3e51dc177ef08f08~loPFtDpJE1249212492eucas1p1_;
 Wed, 19 Feb 2025 14:03:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 54.92.20397.D94E5B76; Wed, 19
 Feb 2025 14:03:09 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140309eucas1p2701a4b4bacd3be6e9f20d637d3cefa5c~loPFQDxs_2657326573eucas1p24;
 Wed, 19 Feb 2025 14:03:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140309eusmtrp1be717018bcd6c53827f20b86dcfa1556~loPFMZwCw2415024150eusmtrp1t;
 Wed, 19 Feb 2025 14:03:09 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-05-67b5e49d858b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E1.96.19920.D94E5B76; Wed, 19
 Feb 2025 14:03:09 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140306eusmtip26ba16cd7050750da8584d887567b2556~loPC6WwJl2723327233eusmtip2d;
 Wed, 19 Feb 2025 14:03:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 14/21] dt-bindings: gpu: Add 'resets' property for GPU
 initialization
Date: Wed, 19 Feb 2025 15:02:32 +0100
Message-Id: <20250219140239.1378758-15-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxj23Ht776VL9VLYOEPRSbZlM4pOJp4MXQpx5m4//MiybNN92IxL
 6UaBtSAfmwijJcKKjglD2rmCYYMh0AzbriCFja+CQjdAgWWlGC3RKh8DikGJbJTbbf57nud9
 3vd535ND4+LLZCgtT0rllEnSxHBSSFi6Hzi2nXebZTu+GduKekYuYMi8pKNQnc2BIUOnQ4Bc
 gyYMXVuYIVHDxO8UumPLJdBwzXkK5XUbSeTRuUhku2em0KzWJUBDzd+SaL6oEyDLvJpE9Z1j
 FDIuGDBUOWsmUJW1GaD8gh8EaODKa2jM1UMgz5AWR/m6dejvFiuFlod/IpB+uo1CpsliAbLX
 v43UbSWEZBM7M6qh2EmPh2A7Tnkp1na/gmCbdGMUq23qA2xjbQHJOodbSPa73sPs+Jd2jL1U
 dZJV13dj7JlHO9iZ1uske9pUC9jBvBHqkPiIcE8clyg/zim3v3pMmFBScU+QoqYzKhwOKge4
 yUIQQEPmZXi2zEgVAiEtZmoAnOypInjiBfB+nwHjyTyA7tGuFUKvtlxv2cbr1QBa5iv8pkkA
 R5bqcN9cktkJb1QbBL5CMKMhoKYrF/gIzhgwePFh+aoriDkC2wo6VzchmOdg11+5hA+LGAks
 Uffh/IabYNuv/bgvOmBFbx0I5S2BsLfcvWrHVyx5Zj3umw8ZsxCOltoJvncfLMsZ8M8Jgnft
 JorHG+DVs1q/JxneMM/5PZ/DJq3dj6Oh0/GQ9OXizIvQ2Lydl2Ogc8oJ+JdYC0enAvkV1sKv
 LWU4L4vgqXwx734elmqL/gt11FgwHrPwzPKo4CuwWffYMbrHjtH9n1sB8FoQwqWpFDJOFZnE
 pUeopApVWpIs4qNkRSNY+d9Xl+0LVlBzdzaiHWA0aAeQxsODRfknTTKxKE6amcUpkz9UpiVy
 qnawnibCQ0QX2jQyMSOTpnKfcFwKp/y3itEBoTkYOTxyc++kRP5nQ5A7tn3RYezXJ9AZFjR0
 K8pT4tpycI2j6U19Tl2WLvTEnf0W7ccN0eeccfs29i5mX1zyvrfc7SrWS0Ch4qZNkV46J9wQ
 5Vz8ufjQwqeFx3daFbGL8rDp19P7kmnXoz/iQ95pSdv9RdRgrOSX4CWlUGoNCDuQotfE775c
 +PQcLRmfCFNVr9FMRL4ySxWYQyunymPeSIiM659+cmRh/5WDXuYDS9QBb0yRyVQ13ZqZTROJ
 6S9IfvPeHo+49pk8/vZA47tbH7izom327wPffyLXmnls/Y/6Z9ZdWnp27+kTRzXzImMGe6uy
 Y9dTcbuOvnW4JniPbWOHIdueGk6oEqQvbcGVKuk/Rx+UkU4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxjGPfeDWbez0uGxbqlpYlyclBa5/Lsw4Avuz1y8JQ4ZI9LosZhR
 6npBcCYFKWy2qCMDZa2UIreNDJ2UcjEUFMtVKCBSTSaFbSxb1dkRxgy7wFrIEr+9eZ7f877P
 h5fG+N8QQvpEro7T5CpyxORG/O7KoC+yet6plPa7XwJDD66iwPm3hQLfujwoqHF7COC714aC
 +0sBElz7eYICv7qKcOD9upoCxQPXSeC3+EjgeuKkwEKZjwBTN6+QYPG8GwHti0YStLhnKHB9
 qQYFtQtOHNR33kRA6blGAkyOpIAZ3xAO/FNlGCi1vAJWuzspsOK9gQPrs14KtD0tJ8BgSxow
 9lbgySIYeFhCwad+Pw7vfP4HBV1/2nHYZZmhYFnXKAJbm8+R8JG3m4S24QNw1jyIQke9ARpb
 BlB48V8pDPRMk/BCWzMC7xU/oPbzP5QkaNR6Hbc1W63VvSPOkIFoiUwOJNExcolsV3zm29Gx
 4qjEhGNczok8ThOVmCXJrrA/IU4a6Xy7x0MVIvOkCaFplolhp7sjTchGms80IGzlxGXChIQF
 9ddZr9mPr8/h7D9eE7kOPUbYlUAACxkkE83ONdWsBQRMHc66egpCEMY0oOyPq7fIkBHOHGad
 pqo1CGe2sf2/F61t5THJbIVxFFu/IGJ7b49hoUZhQb1nUhiS+UwS67kwS6zjr7LDX82vRbEg
 Xuy0Yl8gjOUFy/KCZUfQZkTA6bUqpUork2gVKq0+Vyk5qla1IsGfaR9YdnQitscLkj4EpZE+
 hKUxsYBXamhT8nnHFAWnOY36iEafw2n7kNhg7XJM+NpRdfDpcnVHZHHSWFlMnFwaK4/bJd7E
 2z01fpzPKBU67mOOO8lp/s+hdJiwEI2/GG48taw8W30G35CaHgFHvMnFhCdzPC2/VqBIc084
 Lm0gZ/2fjJrqeb+tvje/uyPdnLqAWgsaXYdvVYwsGz5IUVadmbNiDUtm3/Mf6KwtQ7wiUe0B
 eXnJUkTRX29Z9JNczPaO1odJm0v3dbdnqvpSbrh37o0Xnt+Ttml/Zd7zdw+uJvTfd52+872b
 m178rvHlJg3DyGYo/eakOtveLamFdQez3rz2viT8kW2469OOu7aMZDb9mSiR4ft/2inP9JuZ
 HREgajxScMiUf3nqI1FVhqGStyhyqH8Zu6SFDKy0Nzmc0i+viudKdJ/pPG9sMwm2dtB5Z612
 a+8pwxghxrXZCtkOTKNV/Ac2rXuxvAMAAA==
X-CMS-MailID: 20250219140309eucas1p2701a4b4bacd3be6e9f20d637d3cefa5c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140309eucas1p2701a4b4bacd3be6e9f20d637d3cefa5c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140309eucas1p2701a4b4bacd3be6e9f20d637d3cefa5c
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140309eucas1p2701a4b4bacd3be6e9f20d637d3cefa5c@eucas1p2.samsung.com>
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

All IMG Rogue GPUs include a reset line that participates in the
power-up sequence. On some SoCs (e.g., T-Head TH1520 and Banana Pi
BPI-F3), this reset line is exposed and must be driven explicitly to
ensure proper initialization.

To support this, add a 'resets' property to the GPU device tree
bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087..bb607d4b1e07 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -37,6 +37,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

