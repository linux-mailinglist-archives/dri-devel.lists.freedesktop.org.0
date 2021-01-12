Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C32F334C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7C6E25B;
	Tue, 12 Jan 2021 14:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411626E25B;
 Tue, 12 Jan 2021 14:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+mvxTX/S/vKJHlFQpPbglJV2j+fRejKiqhcHq1q9zRiB8WnhEg1PVnlFRGqC9KdtYzNKTu4MGKlg690ZzTgVUopp4mICy3+zQVFmEXwgWErJ0hv24mHwrApUpQxYGhiGTGYfW1ySqRqFs4FN9oafl/q8KxefRwbMM51buBquj1grw0gyco9LD/etUZxo1B/7R65iaoHhJcuj+ktCkrFd5Zlobq3lpHeOSPsPdDPJWpmWJO57ETMhAJdwK9TzgJ2PKVh68z8/OTrE+2iaJP7t46XKItnvIQ5lamjxgnNJJ788xDVf69o7aO3t6JPwDd5CuacwdleWiy55dovXBElnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwIszL8A/+On9SwObMmJaIEM2V2yKaP9m0XTnGrKcHQ=;
 b=QKSCl2FY7uK8wyRPm+pg30QL1zrtPaJRAcDmJ8KUT1IdbQZ3WVJwVnL0XzKRSiIt5pXhG4IzRv0P4iBoYzPp8JgXLEWymqC8lMi+Laszte2ymg3GS9keAB/d85d/+6DZgbmARtD6pr8cCd36mdHk6OlImjP8amVgNK0QS5e4A6fg+g8RhSXUqA0dVdZGv2SUwgVJGKPEgXjrZi6v+xl2N1Ky3+Oe2zt0G53RDzovzgBjQujENwXNvtOFjkWedwoSEEDM51CwsZk1SZlrqxprSDbFgepoWSOf8K1V/YYUdI0sMAgv0pfBM45IB5MDM8VsmSLWw4WBna6BrFpd0VVj+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwIszL8A/+On9SwObMmJaIEM2V2yKaP9m0XTnGrKcHQ=;
 b=Rs1ae4Zco7vFFIDqFoKdJypLvr3YTGZE3vcMIur0yysLrn3/uDTH1F3Nitj/3O0MRrMsHqEAXMmHDtvni5QpXpu0OZF/sKi/wa68eKWS/NAY8F8Rj4USEHIR9dIdFMbj7Xb8NrWrK7Wz6N13V7di0x5S1qH6lS5SZdQTI004VIU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:55:55 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.012; Tue, 12 Jan
 2021 14:55:53 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] Revert "drm/amdgpu/disply: fix documentation warnings
 in display manager"
Date: Tue, 12 Jan 2021 09:55:06 -0500
Message-Id: <20210112145508.1564863-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
References: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:24ef:ec9:b88:9a22]
X-ClientProxiedBy: BN8PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:408:4c::24) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:24ef:ec9:b88:9a22) by
 BN8PR16CA0011.namprd16.prod.outlook.com (2603:10b6:408:4c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 14:55:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5f85b07-52b8-46ef-f234-08d8b70a28e4
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB24904E8E3BEA559665145B6D98AA0@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmYKkDh3lB0ioCkiBvz5/H6cd0xZwT0O7gzkx08wJCGHwRB2qt/eC8bcviuvq5siXH82dGRKt7g25aBGlWjTbHzXpAP+NBAxQSxSoF6hlfbFkQzRhuxA0VKyhXa/V5uf3rHPBmUmbdcTDiu0CNi6T2oFbpjbgAN5GY4OU+/s6x2t6gOKQqaTwBuGPwXTzoNDYCEGq7gxOPMNDVmbBbSy0lVB8Lra6E7diBU9k3y7JNUt6FWvSUnVJ8hkkOptxPiEXUhsh/Fn4IhgBFQ4HfC5tufP1ca7jRGUko8XFgnEHNUKHuymH42Ib+LjzWsSW1EjoT5bWa4cKUYjAZFhCuGfdzUyaUCxzwSt+B22RqTFIAIdyYj37fQiHJsf7PS7dPOavYPkmOIidjjOme11zc+jdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(54906003)(186003)(6666004)(6506007)(6512007)(8936002)(86362001)(52116002)(66946007)(83380400001)(16526019)(8676002)(5660300002)(6486002)(2906002)(316002)(4326008)(1076003)(478600001)(66476007)(66556008)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gmALUrp1gHooZApCNckYTdJfZ9csz5Afk7RN1ucuUr2xl2CtwFQmXKkxLGhd?=
 =?us-ascii?Q?bfPbWXkKBRugfoWob588raaAED9u53umuUy3dXyfeabX+cfyVjtWsGeZzmw/?=
 =?us-ascii?Q?VQG6QiSeEoP5o+G7E3sV60/fj1YD0WDfyDStTfIZYGXXu3U8lY98pgqPrcTo?=
 =?us-ascii?Q?FfJLz1bLVD0tv9VPxNkRbRk44S9qVMC52MeQCaxd+iN3q4rzwG1/IM3uNIHm?=
 =?us-ascii?Q?cjt55YVjyZtwXofLhbCis2fNXVknCkY1ZHbLQrxJ4mVk2sxZw7HLe0yrGhGP?=
 =?us-ascii?Q?UHAJhTns6xdK6A/hBizNTYpgYL3Z7QKP6NnI/FJbgkFBaDemtRrQZYpUr0a7?=
 =?us-ascii?Q?G9SI1yCI3RmqxVOnwb1RpKXu8V7o1uzx0nqPNVrLgJH0PD3qh5JixKRKyTyC?=
 =?us-ascii?Q?hQC9Opr7sT4ktrFgzpsSKGpHgbGMR93Md6yHg1L+B97nKQfCLP+nE5QJziky?=
 =?us-ascii?Q?0FmTcH5Ch6K5MUG+cefxHNXTnzUx8pZCjzqDAcXbJZtAWQNCyL3+yntjuAQU?=
 =?us-ascii?Q?OvgrmZNVlBjZM30HrB/Rm3hHIvFZNqITCobRQ2FhgHgXG975ZnLQq93V5bkX?=
 =?us-ascii?Q?fEjubTsGiiUmgkxeB46JXjFLWjaW8qanOxjW0scEh2Qc1wfOq88+nDr8vRhi?=
 =?us-ascii?Q?NEzsTdji86bH+MeExx68NLfwgUeYOo6ups6D9rXwIM+5gYbNeaRBee0BCX8y?=
 =?us-ascii?Q?sv1bqiAJ8YYBmg+s0W3y5NQLlyBpUxDuTv5eieg+2qOWbsQU5zHC+BpmSImC?=
 =?us-ascii?Q?Nm9UE3LkXZ4jktAvUGfXydCCtKFwdCWcmwS7XzCKWhfnw+YBB5Yw2h8dizRY?=
 =?us-ascii?Q?if7eOBqua/rmwMxmqeNnciBU91cg77IDAS0IhnNAMWksj6t4FRWhgQIL06iX?=
 =?us-ascii?Q?yMuCs+VLgmqI4ARJ5fxqa6hWqJdXu6vY0EooXr3A4kyV8IdaM3Ut7Ttx0HSa?=
 =?us-ascii?Q?tC5tBHtJi7Gc5gbDjJYpTOFdNC2+jWnsSXgq6RXHA/WFXJmaL80aUqzQU4mk?=
 =?us-ascii?Q?GHS3CUbYbAnjzB5b8jU+hm2n9BIQ7gZEsReQDMkkFtBofZOiKnSN1SJKTE3S?=
 =?us-ascii?Q?XPwKQyXN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:55:53.5384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f85b07-52b8-46ef-f234-08d8b70a28e4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hp6tehTujkXLb1DpLGB0H1RofVkVF9NDWUOneUtMnyf/mseQulNwmPdku4rbXvcDGUJNy4lA2oAgQ6krD9UczA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
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
index 68df94a8b609..2a370d6a5a26 100644
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
