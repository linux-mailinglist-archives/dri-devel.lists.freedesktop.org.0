Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC52EE738
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 21:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45226E520;
	Thu,  7 Jan 2021 20:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89F56E526;
 Thu,  7 Jan 2021 20:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xf+rHWgOZfSngJ4ztjssx1Q4kENTSnhA3u5VzVWputPeEpn/DAYWoxS90YSqZiT7KMOxbUZ25GcXqNXaERlYmQgHUpaGsWaXcfLLSYHzzUdfe5FMzw8EChyaPRdkJR3RtrLeZC7umhmkleQ9ZFg9ozai1G4MJ0yoA9aWZ1G+xiQBvw3OgFtqkduw2D7CIvm4SMJ2mzeu/X/KHXY+et7XT6TQZVGLVv0oXlVm8K4YW2wtgDykI3qtp5QNV3xe6jhHeYhKtBJRPHkuaytBhzhReEQi/noZyljc/aKCQw3Gcrz1/JWq2lgaHaBQxlkaiKfzvEB5iHkdhJEvAP1C+onn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jygytPtqLUAKdZPwRtSA7V8nxQlKACwrLurzehMkRG4=;
 b=Kh0WwzLLlE6cAMjr8sjCSJiRA7/QpSZc/mTUn/hNA0vJgMIR2NPY8GoK6dWNAgXjawRAHIvWMQ4bPHfUCp6bQap5oZcQ1V5MPOdPctOe+onrans8I4xwp5M0iDCKPpCwit19QcGKyBjWNuWGM8HTxb3dgFMMO3nA/5PwNZH2NWY3Iq2Dh+NAdrAPiFa8Rhq3Ppo07GfELQ3L1SoYH03gVSlgSLZl7ht+SOUVy3c9nYq1r4tVOp9M2ezKVwlYSYhd44lQ6SMEjWXFT2HMVZ5l5BYgAIWStJLndc2S+x68Ns7M/6t0gWG8CIhWNB8DOZRRdcXrasV6Jel3154m84DYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jygytPtqLUAKdZPwRtSA7V8nxQlKACwrLurzehMkRG4=;
 b=eboGfU9nNK3Kniht9umNpq4jCX+Rwx7yL7wJmWrqRNHwbw0kYKegDWwg7vBWoqRU94DzzYdtnKmqWpZvH6fR7CQaHzzmEfydsrFzKPMwpZGDr2T/y8F7tMkFQI7sbutSmGn+uHJQdm82kXYQk902Y4KPsa3+aMT368bhvc3Luyc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM6PR12MB3595.namprd12.prod.outlook.com (2603:10b6:5:118::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 20:53:41 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 20:53:41 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] Revert "drm/amdgpu/disply: fix documentation warnings in
 display manager"
Date: Thu,  7 Jan 2021 15:53:20 -0500
Message-Id: <20210107205321.166698-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
References: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3]
X-ClientProxiedBy: BN9PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:408:fc::9) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3)
 by BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 20:53:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e09b6a0-d549-43af-36a8-08d8b34e5072
X-MS-TrafficTypeDiagnostic: DM6PR12MB3595:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB35954B9E8472A7630860B4AE98AF0@DM6PR12MB3595.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iPac5Go7hsEjth0k2vJwxIZIxCCTTq5Ty6vkPx1HtcuaglCjLbyWUhzR3uctmObDn32kZxGlyACnonsY7LZjlftmXFS/XJu6nPtbxV0bxFeIiOfwyuWP2XQ+U+DDf6amIyOe3AG9jT3W3UO+xeofQbrmpUgAMa1LIgdF7qAHDDmiQYs8pch7asRgOy42MoTnB3OHqV0FPwiJaakHQNmLAs3huMaXhFzv8AwH90ubPDfbVBLKHTlfbf/Szdzsp3uYQDzHmJjbFFXA2Vj+7Q/UQuMz9bI0Czr3Nvq/of6waHhHVvdA44zZyJ0VLAeRYXBHqhZF+Gcb/88a2ORKijsh2uVUkB5FCWp+q3y6RBFn5Znq5II6fYdIyJAAMd4Va5QP+s3vNM/XknDqpzj9z6Kl6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(2906002)(86362001)(6512007)(6666004)(478600001)(4326008)(8676002)(54906003)(5660300002)(66946007)(2616005)(66556008)(66476007)(1076003)(83380400001)(186003)(6486002)(16526019)(52116002)(8936002)(316002)(6506007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sJaeU0b+G85qkevYBMpr0SWFKO2ENPCjl5HO2Ci6vN0Kvu3qZ9WcVeKkQIXO?=
 =?us-ascii?Q?IdUdZq/swRMmQzRP9nXK5FKoOWM8wcHW3azJWS2ME2DCaHOMtDdCI/HUfRw7?=
 =?us-ascii?Q?Aw2kuEcHbAatwrxZvssdzcV3sMf1zD6N8h9+y30E4xY/xy8uboyoXlEcQSkK?=
 =?us-ascii?Q?taisTSkP7kjBLzyVDXt1nnllv4qCLRE1dfuhQkKwY2VVIiBy6A3lHm62DYZx?=
 =?us-ascii?Q?YYpHxn2nvNPIk62MYnDu8UEY5JbGx+m40eV4t7mJ8NIRoPGCrFxixoQHjlqK?=
 =?us-ascii?Q?ngxQg1rpsDHc+FP6uHTbwgQYPGgxWsowCyzrutBu2FcwSm5jBkxn1XTAdxXd?=
 =?us-ascii?Q?xtPg7rMdAybYK0m/VLEj0E10wr695AKF/Zp6TLfkm3VD7+iTJ8kAOlyXWuoi?=
 =?us-ascii?Q?RY0+SUzJC1KtrQobRi49sHea3js0f6ZsLAp8ALIn1txuu767piVV8I7IoKsi?=
 =?us-ascii?Q?R1D4FQ6fZCFtHzXQZ+KIjZY5BQIWlfovkH35hDSHkHYJ/ACR+RRXCE3UcQJH?=
 =?us-ascii?Q?XinyEu9xN7D4N7tMm9iERIba9OlshQua2pGjcipXZBlbYA+pqalNYo9ZJI2o?=
 =?us-ascii?Q?UrlqIsqThDI3zh4t+WGE0+ELuzegDGF8jzOCm+Eb32Uz1PRScZ5LXg6pZ7Cd?=
 =?us-ascii?Q?Vtp+T+0boa4TO0FqqC1w2VCELINGJUef0FO6r2oEQcWPgg//0e3xJHYxT7N4?=
 =?us-ascii?Q?qTXixIqxlb5o9K4Ara9JwEbjATjm2fcmf3R8efRXvjbW5MyPJWev9APRAzd8?=
 =?us-ascii?Q?UFhIPwiRaSXusOqlX/uH/QNjN7gLx4169t5BDWWL0PAMLaZ75SjxZdmZwN0S?=
 =?us-ascii?Q?qxf7KON5ULZHyUOF/rVpBsTQ9r+6jejgewzumSzroocRqu0j3XaXQRpzgyZm?=
 =?us-ascii?Q?P9ryR9AhtaLbsQytt3mg4DSi99Wjbxfimc3RFF3BboDuBgyk47LuI+HJDmnL?=
 =?us-ascii?Q?hzVrD8bOfP/asxYFHqR+vP+2ofSBdqfl6UNr3sMLFs14+7jbk3D+FoKIY1GO?=
 =?us-ascii?Q?d3uqpw0tmBfIBDNRlOn7pd97SgxBXAt10PqKYpuRWq65ae4kXWqMSqFzIb/o?=
 =?us-ascii?Q?AoRW4Ct5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 20:53:41.0279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e09b6a0-d549-43af-36a8-08d8b34e5072
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eBllebjnbmVkRzPL+2Zdb/TFWfUMDU7IqYHmgnMzzD4ZkFuILPYCHmy48wI8RhdtzX2cQBqI77lfRpNdtqgjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3595
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 1206904465c8a9eebff9ca5a65effc8cf8f3cb84.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Bindu R <Bindu.R@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 27b32ce7b6c9..ef394e941d9d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -344,29 +344,10 @@ struct amdgpu_display_manager {
 	uint32_t active_vblank_irq_count;
 
 #ifdef CONFIG_DEBUG_FS
-	/**
-	 * @crc_win_x_start_property:
-	 *
-	 * X start of the crc calculation window
-	 */
+	/* set the crc calculation window*/
 	struct drm_property *crc_win_x_start_property;
-	/**
-	 * @crc_win_y_start_property:
-	 *
-	 * Y start of the crc calculation window
-	 */
 	struct drm_property *crc_win_y_start_property;
-	/**
-	 * @crc_win_x_end_property:
-	 *
-	 * X end of the crc calculation window
-	 */
 	struct drm_property *crc_win_x_end_property;
-	/**
-	 * @crc_win_y_end_property:
-	 *
-	 * Y end of the crc calculation window
-	 */
 	struct drm_property *crc_win_y_end_property;
 #endif
 	/**
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
