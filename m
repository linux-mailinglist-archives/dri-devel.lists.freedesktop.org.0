Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8759E2F3775
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 18:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B8789C37;
	Tue, 12 Jan 2021 17:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191A189C37
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 17:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0raKYWihRlqV/PN+CToCQKP/6IGSuzlSn7pe16PzQe0dt7zIgY1ua+AqB0dDyfxWSEMfL+Dw6ThTdGSCCPBvlpy98TZxnZayqDfoLdyOTvTBNHEG58tk8mgY0G7DHJ8g7oV0JbzOxHjeZzoU2/zfMiGRIc9b2ioWTtMIUX7qP0PvowJ7vPOS/Cut62qYcX7wcf11MHwXWVnNNgA7aYID57qBZXLgWm7dkci+X17KNXpzMIFVVMvju9ysvk0O+vH99A3uZD0qHYi0/G8s1Rld1BEVx+aZ4dz3bVd5mFUO4OCeUYd5/umOocrgRkhPaSkocoqhnPPw3+M88H35P+ozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3ojbUBS/2pPx6FAFU9460Nsa7tF7XCsypnOyyGQZl4=;
 b=grwwKlX5F0fpzxXapb/uLyYk7bUbyFBf9X7njyt2MqvzWi0RSPlKGEY04VjiZfgUX+vq0tUgmqXMFfVM74J9qsvxr6BceYy3Ld2A7cv4VVoDMcnvW3CfuP7WQBeIaGy8ctxTxq9RxR3ziIPMP+mWvR30Ly3M8VcYL3UfEnNgXDey6c1vJr9sBx+YNmMb/NHD8i+3GgXzurd8jUfb/i8k+7nu7Krq2wqj5J+tjnhL3txVggysP16t4QBIUjisppN35lznHGLJo/HtJxWb9IZRZEGfYdFEso5y5r/b7cQeFZiKPsIHU8KVgfMaXXqmEZp23XZbRWmVwkAiscbWWCMtQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3ojbUBS/2pPx6FAFU9460Nsa7tF7XCsypnOyyGQZl4=;
 b=3LUNISAmQoBgx9mQmx/u3Zx8aFCVEAC04U8EwoOsHkqSDmnDfO+FlNX9q67xFqrNb4ftfCfPOtmSzVL8nnXTlmTdHZVFFYflNgweoOZxpVReJr6uI5W3kuW14Gyffy0CI+oetyUTh9ZSBZ3H48f5iQ+8jQtc2Lzb0Swx8unSRNQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM5PR12MB2520.namprd12.prod.outlook.com (2603:10b6:4:b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 17:46:47 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::f872:3677:28c3:660b%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 17:46:47 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: Christian.Koenig@amd.com
Subject: [PATCH 1/1] drm/amdgpu: Remove unused variable
Date: Tue, 12 Jan 2021 18:46:33 +0100
Message-Id: <20210112174633.77125-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [217.86.126.184]
X-ClientProxiedBy: AM3PR07CA0116.eurprd07.prod.outlook.com
 (2603:10a6:207:7::26) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux.fritz.box (217.86.126.184) by
 AM3PR07CA0116.eurprd07.prod.outlook.com (2603:10a6:207:7::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.5 via Frontend Transport; Tue, 12 Jan 2021 17:46:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c220123d-f44c-41fb-ef32-08d8b7220889
X-MS-TrafficTypeDiagnostic: DM5PR12MB2520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2520876E40778FC91D2BC6418BAA0@DM5PR12MB2520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13aQ3PHyFFYjK/iNmvSkQqhkyW0KVKTWB2fX0wo31QMSSDp2yj0Y9ca7hWjmXYlOAT07NBCKjRN11vP3RRIA89iJQDKiwyV7KruoFe3OjMfz+jzgvOrrYckDGI//k8mEpvArRSnFt5DLkM/ZN6U3a8SC5Y5Aqiox7DUYlUR0XoQcMeF9f7Jk3qmf9JgayEz68RHpD/lzoas9zWZaTYWw6kA/A3WffyT9oU02IqblD7O6N0W8NcA/hY50Zr7wiHtC1hoCSYg+zSdhu6j4tZXvFgQW+06hZuFhvi8+mQDtU6crTU4jqMgZA49UjFbYOq8sz1hwWIfuQ4IjUtVqSXSSNyF/kzxHRlXPiI2s4DC16nesohotSIIXi/uJDvM9OEasW1BdK/hK2qPX8K3meBJQqHe5YHaLbygIMOROoj45rmlSoUvq7p6D+dmZsCgMeMrf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39830400003)(376002)(396003)(508600001)(186003)(52116002)(6636002)(16526019)(956004)(6512007)(2616005)(34206002)(44832011)(6666004)(5660300002)(1076003)(2906002)(4744005)(66476007)(6506007)(86362001)(83380400001)(8676002)(66946007)(6486002)(26005)(4326008)(36756003)(37006003)(66556008)(34490700003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?53nU5qH5GDnYZYO2uEmepkGgHOPiLkUE+s9mNRxwOiQmekekSGBGl+pKn+L2?=
 =?us-ascii?Q?tvGZCaoWje3BT5+3GCVfH/69Bq/ETiZ1c493S3q6The3WUFqP4gBZ1GTkc8s?=
 =?us-ascii?Q?6Q6vctx9EIiPRcrWfp5B+3uBZ/LVrZ4GvaZxhK322kZfHLMUyD1VFsoXqDHz?=
 =?us-ascii?Q?a4nzJLbpQ5l6ligu8zfNBnyE+a9PFCSqOzlOHf/UuZQ/MfsTTJbR5NxN2GMB?=
 =?us-ascii?Q?UJZn8nW0yN5tBxVCAiPg69vEBzs7j43W0su0yC00I0OFmHIyVXLUytPWolFw?=
 =?us-ascii?Q?q8oBqka9jvmZwUGuFdzPTGTAc36F1VSacvcYwKG5UdYN56bKAnzOaLVX0Qe5?=
 =?us-ascii?Q?dy0/d5RlZOdYK6DEtl6Lb0/czbZSg382hpR+GEcd/YK+HTNJQ0cpj6u2jzos?=
 =?us-ascii?Q?GF/HYlA/tkogErh6oBlAWzZdtFRyr0e9dU//i6XiRvHuoA0y6U8VRiAk3r6u?=
 =?us-ascii?Q?EH21NYA8LitUVB76kVstt0vhY+8EeLkLsTTFQ6OtjZwI5dlayANtYKRO0GZG?=
 =?us-ascii?Q?PFitkfqssI2V5SwWa1/F5/db0z2p8zaHXBXX/A2CUDLGyoqf8LMYa8p3LGcJ?=
 =?us-ascii?Q?OPkGtorh/TQZF1w/t2Bs2rrorziO0VrQzsitJgcdch/fZJKCqJvjA1ajVIc/?=
 =?us-ascii?Q?wcCFJvILqW+16GLnufLEFNREbSatTszZEmc3D26JXna8IcC8S5fL9oTv4fyS?=
 =?us-ascii?Q?fVPVKtpu94bfbrAiI7kn/O02i2OZHtFYQ/92QFjqZhfqOorhk5CXskMzlc65?=
 =?us-ascii?Q?AITtSOpdwouDHLNG6IguSGCYLdFS1Zyg7lXlLyLkh9W90Z7rxJ/Mx4LffTbN?=
 =?us-ascii?Q?eJ6CxLvwLOOcS2u+hK9N4IgyY+bueGrmCXLS8i8EMldAMUTJKjpo3hw5FASn?=
 =?us-ascii?Q?Qv3nitAd4jmZB4Ggrc+iFYecmZiyaHMmvd+h26/IQUTaYFJqPBDxgZSQjM4o?=
 =?us-ascii?Q?WvqcqBFFuf3SQ+vuqMHiHHeuqcUSx64G6cfgaEEo3uGmEdRakD7C2pEtrWYd?=
 =?us-ascii?Q?DU+D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 17:46:47.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c220123d-f44c-41fb-ef32-08d8b7220889
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfbawfJtgPIsFxIaphhvn9wnKJAGmm7zjf/cZG8K1sTyMtGYqPmI/D4SOomvh7MS//rSrTGxpzQXEVSUKdoFpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2520
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unused space_needed variable.

Fixes: 453f617a30a ("drm/amdgpu: Resize BAR0 to the maximum available size, even if it doesn't cover VRAM")
Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 348ac678a230..5888367b1000 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1106,7 +1106,6 @@ void amdgpu_device_wb_free(struct amdgpu_device *adev, u32 wb)
  */
 int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 {
-	u64 space_needed = roundup_pow_of_two(adev->gmc.real_vram_size);
 	int rbar_size = pci_rebar_bytes_to_size(adev->gmc.real_vram_size);
 	struct pci_bus *root;
 	struct resource *res;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
