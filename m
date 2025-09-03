Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD665B41E47
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9B510E7B1;
	Wed,  3 Sep 2025 12:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="TXJ12BAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013052.outbound.protection.outlook.com [52.101.127.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0C610E7B1;
 Wed,  3 Sep 2025 12:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZsPLAJck6Dz9ENqCT6Sa2OeM2RLZxswrZRnvPi/qmvUHjaye3rytPpqnusK7kygxpNs6J15Hobn5rSs90H6I3ZYSG0fmojXfVIju2sHF8BcQNPU31OU8rGNwmQMasj3/dxmOv2bIi5k+vfq5PPuY+UcFSO1OnnMzsLTDr+9Yb8MW1TDNweTR4k8UEd7+AMtfSHoKM5whkpbWbG4Nqc61h7Y7OBjPphO/ljlO2k2cJMDOyFZIArQy8DZn6lG3HHYUM2aNxlkQpz3BAH4a/LRxMIw3pTKxwUoaRkb61yyxVXwXAZzxOF4IuNAzNnuV9mdIE5EZIGNfvhgzFGNIFrb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6QyIcBPiA9GPHdRn2wdOk3ypXSVIH6fFExfm9kKVk8=;
 b=h07WgTqc0wjoXOW/oPUgOxaXHsdB4EosOUVPadUqLqZc2wwsduUKhtg1JVy977Wa6pEnL4qEzAi64WY/clAqEWRhB/6V2x99JEM1GbuR1LnUuFJ9DzyyZjTdjv+/IbH2rAB9arZ1utU5xhj6L5cpCvZ1vGswKGSKwb9QFVynlcBmap7kKhLUnur5R5/ihb3zRU/Wc0eOJt8N/MPhPEfiio9aftp8WgQpb9F+UQ2emeWvMBJrgOleow3Fe03FW2TGLQdEhBwhVaZjrgEUGAc4ec6fQpLf+m6xRqh8b/kmFAw5cHIIOcMcoSYKaYOuBCCnLSQUXxaBOWKFOfT4qXwQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6QyIcBPiA9GPHdRn2wdOk3ypXSVIH6fFExfm9kKVk8=;
 b=TXJ12BAXa8tVETLUvx3Vx5QUCAlDAnM9rPmJ5DBfiegQU37s1aJl/TCITtH5qAdwKQQW8k5T/5FXHFUNaZK4VY4nJVSG+vYDE0arvo5jgsATS+huRu+tCmCrT9qZwDKYlWDqKyTmFY4Xl8CSwjsQN0rZN3idgBziBQPOMdUW9gXYrslp9+UMYlt3VDYTsjrBLqPPimbIke9KrpoTOadQZQOJi320Jto/B/gAB3w3V5/zsSS+EuvS/9TT4nzuHqt7b5ZJjDl7EDana2nhL+QUzz9Qv9qCzOhbNI0gAGKehAS3pcPGbNlMvdPgPhc4GtZMO6drnmzjCm5fC9SMGbLr4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY1PPF568C2A376.apcprd06.prod.outlook.com (2603:1096:408::914)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 12:05:37 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:05:37 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 2/6] drm/amdgpu/gfx: Remove redundant ternary operators
Date: Wed,  3 Sep 2025 20:03:46 +0800
Message-Id: <20250903120449.380087-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903120449.380087-1-liaoyuanhong@vivo.com>
References: <20250903120449.380087-1-liaoyuanhong@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY1PPF568C2A376:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b45332f-e3bc-4e84-4cb2-08ddeae23141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/YFi3bnbEJUdLsDl7ls1JuR3zVx+nnEVqXEqoZJXuWANh8y1d1OvoxHHi4iY?=
 =?us-ascii?Q?7hPQ4V16i5AKS6lWcnAElVpX2Fs6oTxevc8nROiGMhpDL+NHTZAbE5N4G86A?=
 =?us-ascii?Q?Be7/PJJxGlzkcrKe6+xyvLbHgcPtARpR3DPePjdmrBGI9bu3UIn1k/bpG329?=
 =?us-ascii?Q?CxdCTb3GWZardLREPQhfRY2eVU7Gs/x06mMhtxA2sUX7s7xXuCnI8GEwFa8A?=
 =?us-ascii?Q?3mmrfCNAdChF+RKzcDQnfC1hyk7dcX4sAOTQgX5DLjg+C9qwXbPFBoXcpxgm?=
 =?us-ascii?Q?H00AYJoP9RP2hEeqC7IDlFwelDFIfccr+CvSjeNXh4LDQK7Ce7u+NfQuZpre?=
 =?us-ascii?Q?iREqo4ZdM7d1Icoik0Gimzj4mih0qVTn9Kvj6txy4OrdZ6G+F/z1nUhjXyLT?=
 =?us-ascii?Q?AzeARzcaLsSUhiFlV67qeOxngRYsGXv2RbzdKkLZQLAmgOxcMR11f0xyn3wB?=
 =?us-ascii?Q?qPawBqxM8bzu5SdHUBfFuvskO29aliQf7hf/owkltz46TDSxgFNTe2k7464b?=
 =?us-ascii?Q?laei55TB0c5WT/vsIJQ5ci/LQcsGxLM09CEZ3x1pxrW5yQM4TeuylhiWoM0o?=
 =?us-ascii?Q?6/dRPzJgAp34R4GJPGhkSu0BS1yUvAPuJaD1AjPduXZ8r/O/+lTkA4xPog31?=
 =?us-ascii?Q?D+99X5+2xFxq43LZ0dElniLVn0qEUEP0M3jeaUchQIB8r1TLsLmDQqTFnC9J?=
 =?us-ascii?Q?CNedB+ccyFui1MNLdHL5WiudToMUdpZ9pg3leG2AhJDZn1YEJJPqizwFgu18?=
 =?us-ascii?Q?K5pByVnPtenYDWkXHpBvvicbzTteyMn/Cgpu8xtdSupz4HBSkuVI9PuxsyBj?=
 =?us-ascii?Q?z5Shyu1mLFe6++A6AgrkckbC80L4l3SIv8WBp4zxV7zUqWUpbQ7CkWwgCndY?=
 =?us-ascii?Q?eq+RDA1mwm3jDCT+wH5xrATP4zjPo4Nh6QFUD+7cU4NVKPHtyo8FcQsL/F+m?=
 =?us-ascii?Q?U3InNzgmIrz1FauM3nAmQmpGBP2Uv3kGaYnxe/1A0Cbt6G7CjR01JGHa3Uhm?=
 =?us-ascii?Q?p6murzIyWhvfviNI3A9bLyPKh3klAGsAriO0lb9XKtA8V+hXlEBZXtGf9Qhs?=
 =?us-ascii?Q?xGEnQHynZKgf8/4XAWyc1BYvO4sExPfWjhgQv7OhfqmnTqjY1uk6ASe7h6ru?=
 =?us-ascii?Q?AgjxNE98ZoagV9DSx2/JiehsAIHyc1Y6RXRZvtFE5JRBZvQpsZkbfPLx9X1e?=
 =?us-ascii?Q?QhixV99vnJcUjTGB9apVxCFYzhE/LUhBm9rzeXg+x8Wa3G6AtZz8LPVnZxZK?=
 =?us-ascii?Q?+FUFw50qFdQD5VYHR2pJxn5VeuwEnOAdEswJqJlROR2TrYkLFaYteqrSypFd?=
 =?us-ascii?Q?9zgNmgPw9mXsF5UBi5GYl4WJT4DGj57oOfETcJQPMpXMNpN5IYUXJpXz1buA?=
 =?us-ascii?Q?w0/f6y7Sn89Ex16TnH/Go8IC+lpK54G0715hJ672f2YNeXu7rDjFyn8xF/u7?=
 =?us-ascii?Q?SB71vHxy0iKFsuUqNZkTS3uFEDqPxipteGLEogQfR/1pcbXH46GBiklWNHtZ?=
 =?us-ascii?Q?4E6F3+jgM4Z2kc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zjPBUM6tlLrR6iY+s6pCz4FaQLLvFbs2HzcgGZODylsAoRWKmvJw5kSEAbyy?=
 =?us-ascii?Q?ImZIL+BOHBbMtSF71qgiQTI2PM4uHokNGZZnopW/swsnYbLGIVo8afVw6qkW?=
 =?us-ascii?Q?Gtuh1enoiC17sCGjpiJ35Yx6Zhg92rURNSLVukCP/K16EQHQUnNWurkXd8VM?=
 =?us-ascii?Q?sbBNIxBILh5jUEyVY8PRnb21OHdtitm7ClgxBT/30WwirbzJu3sheyMubFke?=
 =?us-ascii?Q?9R7pYfezJTi4JdbJuM5sb+x0OWiSbPtGIjtuFBQw6VhGu+LOUSklI3/0Wz8C?=
 =?us-ascii?Q?sdhE/CIPjbXsMbrjbQrEsdtdjc27c85c+i/TzO7GYJt0ICUtHAeWsrTrL13O?=
 =?us-ascii?Q?7aNppXM6LuitAAl5uROpoMCKWp1ezL/ikeB8kLpDn96EChSYTzVLWWUPfoJI?=
 =?us-ascii?Q?keb0XZ8fa9Ca6a7WHRy7PN6nu+cfpu7t/V4yiwFVyvf2gyYN5lv5qGxiCIPj?=
 =?us-ascii?Q?ixa22gktUJJcPdnPHqvQuGpxQDPPAVxt5Y3Fs9PUmNY8bIGxG+W6Qzu+HjVV?=
 =?us-ascii?Q?AN3IF+UfTClKyi2l4wYW7dkIrMrx/tly0kvdW+12WdvEJg0ZMte/s4/rlyCg?=
 =?us-ascii?Q?mFd79FhduWvNbszmD6OKQeJZE5KN7KlDPdiBcnVZZqOwPDa9JHAKicdaPC/j?=
 =?us-ascii?Q?v/Fk8PLg/TQlullX0pZ87v8eldQkI8naNEd4i6wDFBmbKh+YvwJ1mqZmoXJV?=
 =?us-ascii?Q?cdW8G593aJCKVG8xZDIu0FqFkn9k0r6JU+tQ8/BG1iyuXGUNfvlNtCzKViVN?=
 =?us-ascii?Q?gMhNSs7n71M1qGoFtuNPLubBDSmsWZB4VbMxaV7CQUPHoK4Gdv8nB/igArRq?=
 =?us-ascii?Q?hXYHqRTn0uJ0IzpVueL70rjQh3uYahvMw9K79Lz/CCt1NLY4vcdi2g+Bh/6u?=
 =?us-ascii?Q?pven80zgeblmTOD1PdreV0gW7dbH/4OXDnx1CZI7vO+8tP1OcRD6MJrSgdb7?=
 =?us-ascii?Q?bFmOOw7aWoOQzSRm4sXmGnnNIg5UgGG2oN/iDJiCEoYXE5BPWoWEP3w0MTWK?=
 =?us-ascii?Q?A4YUeGb2XZwmfALQ1U1wblvLfgmTqL1wXLvUu+BuYW3xcDw06hzO3BVd8x1u?=
 =?us-ascii?Q?qFhOMKJjyhNNfQf2B4xj1TpkvNdviYf6W1n+zqABJvn+0TGwLpWK7i3kdQvV?=
 =?us-ascii?Q?rQUBUDJ2hN/eFxoWFnktZuLz/d10Zs7rg7EX/ww6DfOSbpWjpGPRzHnW8WAA?=
 =?us-ascii?Q?FlGgtepUnCAcx640l6TiBwbdGp49oB3ekYcvDacvlnC85uoI5V4fpk1CxgZF?=
 =?us-ascii?Q?EsShmjWGp2Sbza2agngc3JSuUxPbJSlQmVUAye6bylAEIzTUUjXl8uS8ovvv?=
 =?us-ascii?Q?J8OPk8yGMmCOiOzHIgSai9GJWuLPeEEJIHYgQYOm4Aoxe2InEdL6WWdcrunH?=
 =?us-ascii?Q?qCmVQM6l9c6pT6FMHm/qW6/hDZWwd9huZZKIqBFGEm+eM3XjbVRJ++RpUxk+?=
 =?us-ascii?Q?q7L3zeVvZCraKnir7n6hZyJhThlZxeNyyebz1YA1eeCpEhLlC2gnsWhP0yzu?=
 =?us-ascii?Q?HIArLUNStrDVCaNpcYVgQUC5CgO+XX7L1euOasXq6dOATycn1E0kIoLNO1c3?=
 =?us-ascii?Q?3NH15bl7AY3dTHV4me87LYQcotpymzQeRg/6XrQ7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b45332f-e3bc-4e84-4cb2-08ddeae23141
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:05:37.1657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sT/ZqdebDYD1phlX2JIYqj6cDJiDSNIbDqRK5ysH1jQgYpWGDlReKnNUZkJh6PzoBCHPVD+2pq6Ww7Hw7zJfPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF568C2A376
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

For ternary operators in the form of "a ? false : true", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index c85de8c8f6f5..3d9c045a8a64 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -4643,8 +4643,7 @@ static int gfx_v11_0_gfxhub_enable(struct amdgpu_device *adev)
 
 	amdgpu_device_flush_hdp(adev, NULL);
 
-	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
-		false : true;
+	value = amdgpu_vm_fault_stop != AMDGPU_VM_FAULT_STOP_ALWAYS;
 
 	adev->gfxhub.funcs->set_fault_enable_default(adev, value);
 	/* TODO investigate why this and the hdp flush above is needed,
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index fd44d5503e28..5dbc5dbc694a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -3524,8 +3524,7 @@ static int gfx_v12_0_gfxhub_enable(struct amdgpu_device *adev)
 
 	amdgpu_device_flush_hdp(adev, NULL);
 
-	value = (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_ALWAYS) ?
-		false : true;
+	value = amdgpu_vm_fault_stop != AMDGPU_VM_FAULT_STOP_ALWAYS;
 
 	adev->gfxhub.funcs->set_fault_enable_default(adev, value);
 	/* TODO investigate why this and the hdp flush above is needed,
-- 
2.34.1

