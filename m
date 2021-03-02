Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8536F32AC83
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 23:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B6A6E1DE;
	Tue,  2 Mar 2021 22:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3B06E1DE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 22:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuW3aSo97QWYMB3lyFagMfmx04GDQncbhEplZZAUwy8hDlitP6UQKT+0Ar+ZRCKSY7lf30l06RwF6Wirj1wpSk8dblCAlNVGU5zvKTR0btyoojEYo1B56Br8J1FKlljswi5EUW6ZM5WD6m23ruifcyvGDntc2MdLrkukcp1U5WPa8Jh8XVB2jyTqJ4Zs9iX1EtKvSJkgnlR/JOPfCCNz1ZBs2TME52gbQEEia+Vz4YH3IJECrW4RHxikUKf50Aq1wYW2Nh4DTYCkmMgYPR+T60KXCmtexw2uT/xsRcmZqnYpwy8RUuAGzbDjsPiqMnOxFjQPcbWWdF7AGRdByBOluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63cBbZJZxeH+8GAoO8nnIhfYqiXSECb74qihzHQzd+Y=;
 b=moc/sDUJSmX8cnhilStlWPtZDlHjMUX+w6lYVqD70FjLX1x6C/qHXXShvFVFWpfgR8WgGl2Ix5E41AT4BwzZwY+11P/j/SvFlt1sBvcy6ahYG+LLQ/Mi/ah9UjT66IHP8uGIe0Iin4+hJW48zfv7wK2yw+fQIdNc3JsyAMRXsFTRUhnFrXB/5mwAQrnSZIOBn1nnyufMtQv4QDTqvA3aqU10fcBLjeojWoIJakkfa3nmOBbrwGGcmB0aCmk8jajHoX7+eE70Oc4drjArtCkcDl/r8x7FcgY5AezpDTz/oPd7u9lMIV4EVjVupjxn4p+Z23ahSr4wDvr5XJWO94+ZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63cBbZJZxeH+8GAoO8nnIhfYqiXSECb74qihzHQzd+Y=;
 b=s2d5U5fblrqIaKFwwSFJq1mljZXUhzqOZU0ThevyyOHQo8wVYubEz9cuTFySbzwC+qjIyLyHD53Rpxh0WfjSk215dKr+/Pq+duSB0J1BFW8AoZtQtr8iz/Lu1meF0D94CbpdXs+fLRRurJEt+9q4sNwcS7lnZZcIHc7Z5j9V1CA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM5PR12MB2519.namprd12.prod.outlook.com (2603:10b6:4:b5::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Tue, 2 Mar 2021 22:51:01 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 22:51:01 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: PLEASE ignore. Just test Intel build robot.
Date: Tue,  2 Mar 2021 16:50:50 -0600
Message-Id: <1614725450-6290-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::43) To DM6PR12MB4732.namprd12.prod.outlook.com
 (2603:10b6:5:32::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YTXPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3890.28 via Frontend
 Transport; Tue, 2 Mar 2021 22:51:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 623bbe13-e816-4f29-af79-08d8ddcda706
X-MS-TrafficTypeDiagnostic: DM5PR12MB2519:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2519EA5B639F86ED7942C70080999@DM5PR12MB2519.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pHVYaXJgLzAD8tVDCCuYBsiBIB497pSTLUFa18fVouNtjIBx68H8vQVoqMb02YeA/5Z21ZLjeXp+Laq0RthbpbD6FoSQvnHnvyZAl15y2eqsRspsHb+puTJponN3kyOlwnShiDxF00p1DkRE06V/91JWyzZK2pC/R2eRxTCz5DpEO9ycuDrpfsL6ZAMVc4CBk6phe25G521VJWbSBxJ1JQ5/l9QVuSy3+VPppEk7K7H6LY5uOv8XJT/gNzXKM4FaQyXarm8JKhkb+B68hElB0k8kqbytJVditHzZgVxvV2FYKy3vpskNVhlGuOnWW1/Tzpdg8pW40msdHEmOYzWs5lptfs/c8KUB7P/9foVdRkphxqJ/CaNe+XwivGQHsvsUgTrlIxDCKttrSq8EWhbrvUfizz3PcYuw2gxZuXHYoacLgkkMpP2ms3PgMtBYz0mdZWx2Pdk4ZikWNunoNryGbREMHmqxbz39S48lfRbyI93D8dS9SX5si3JpePJqIUbYw4G59TjeUg8MljNRPXH55Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(5660300002)(478600001)(2906002)(66946007)(66476007)(4326008)(66556008)(7696005)(956004)(36756003)(52116002)(6486002)(8936002)(8676002)(6666004)(26005)(186003)(6916009)(16526019)(2616005)(86362001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QmIw10dnJE9bdLhW6LV2bfl2ObFkjDqPYvgGK3Wrh0MAaozbvveF7F+GcmEi?=
 =?us-ascii?Q?hyfN5iRJZf/Z8hBlkrAMTCLeJi5gKamIweHy13uGzznX5wx4glxY8O5HD8CA?=
 =?us-ascii?Q?WKBpE3iDgCRCE8HpZBYSO5aBZah+veTfLCXUMydzrl+lHblACeR1S7f2d+M7?=
 =?us-ascii?Q?H6Dadqi0Goa8RwQD184Yuk1Ut1oYC4mTs5Aga+V645m/PykS41h4Ll0y528o?=
 =?us-ascii?Q?8AbO6bghhgeU72XS3BnAXB0lEdDsdqPUTVx/XaOOUvvPgkEpNIru5prG9dwE?=
 =?us-ascii?Q?3CBnmkNK18mJD8MJZ90nEg1QyjopMBO63XywYUOhv0FZ4lp1Y78MrfVSMwRX?=
 =?us-ascii?Q?2lJxQAxQ4DvnB8amVDykJGOADpaKfmY0vSr0HzPTMvibfORvw+3we+3+OkyH?=
 =?us-ascii?Q?rwqsoq0VAC+dYCba000X9PU9q0QVTy+H43JNwMs69SwWsGNTqCmAsbivNxJT?=
 =?us-ascii?Q?R7L+OonLRC3oI4AK/K6iCp2Vfvb9nNpCocq88aKLLfeZrpQSxVlG7JDkfbvG?=
 =?us-ascii?Q?xqd0/x8V7uIhUp22b2vAtRq6yajs2hK2ENJCknIYktWvhpy7QAvpzMJ4mnlO?=
 =?us-ascii?Q?WlGmACR3R95L/w9VS0rcFpnEYw+etvEYc5Y27GuFhZ+zpAkZZq1EddmXagdQ?=
 =?us-ascii?Q?+ns1LF5L6NMVwTFtS4JJMhcfP3sHXm/WUvCEtIEuKiBwuBR5/uTiacv1WVCZ?=
 =?us-ascii?Q?DQdSWfO5wJwYjUSp0qvG/ut4ume+1s51O2CEYa8z3nyR4CE04gg3kU+pD09l?=
 =?us-ascii?Q?0V8+bi/hiOAumm+L8VxaleGlsBj5LfqaLdqN/Eu0+W/cw+W+yP9BkZp2xE4h?=
 =?us-ascii?Q?bBTJuwiXQg53Ol+Msf1ISE3ES3x9uiOQVjHGqaHZ7jhGS4Ys80BNZ9I68maO?=
 =?us-ascii?Q?Hn0E+y/lKArmMn91cxtEtYAxESq0cYFiltxnZplx0n+kJBS4E1cR6WAnG1ti?=
 =?us-ascii?Q?BYp+5epai83Shxw1BWCi0btX3Y7b8Jh4hqDu/ZZtgyC1c32uSepJ/vwCfOsL?=
 =?us-ascii?Q?bW9eIaKVcCaTyuElC/M7EdkVRnLWwZKiZYGT9PrBbRTyXC60j03nmgS0ReOg?=
 =?us-ascii?Q?1CvCrPY8zliDOSyUeJYbcwLWOQbu9gG+dur5u9gR3MCUveXuHu65Kb1Blk3/?=
 =?us-ascii?Q?aM3iV+f539UlQ3g+JjpNHHLRlitWx5fktkvJHCRmoGKwdGjzqWYQsCQpv/hi?=
 =?us-ascii?Q?IAv4KAJ9peDHm0RKUrb3S5HTlPzPksEfT92GDICcZmTxxALYwyZBtv0MjpPD?=
 =?us-ascii?Q?36oT/MccecSoHymbWc4cp4p1nnA/x5zAy/Mexfs4VwIoypoS/ZInNHNrY09k?=
 =?us-ascii?Q?QlDjgrXrV7BEhNqken/tnKZz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623bbe13-e816-4f29-af79-08d8ddcda706
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 22:51:01.4421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrzcunEVxaNq9aJrwVapiW79TPpigBewRNdB6V2bmDEe5Lfw0FLhw3TVV5qfke1H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
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
Cc: Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ioremap buffer according to TTM mem caching setting

If tbo.mem.bus.caching is cached, buffer is intended to be mapped
as cached from CPU. Map it with ioremap_cache.

This wasn't necessary before as device memory was never mapped
as cached from CPU side. It becomes necessary for aldebaran as
device memory is mapped cached from CPU.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 031e581..8c65a13 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -91,6 +91,8 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
 
 		if (mem->bus.caching == ttm_write_combined)
 			addr = ioremap_wc(mem->bus.offset, bus_size);
+		else if (mem->bus.caching == ttm_cached)
+			addr = ioremap_wc(mem->bus.offset, bus_size);
 		else
 			addr = ioremap(mem->bus.offset, bus_size);
 		if (!addr) {
@@ -372,6 +374,9 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
 		if (mem->bus.caching == ttm_write_combined)
 			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
 						  size);
+		else if (mem->bus.caching == ttm_cached)
+			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
+						  size);
 		else
 			map->virtual = ioremap(bo->mem.bus.offset + offset,
 					       size);
@@ -490,6 +495,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
 		else if (mem->bus.caching == ttm_write_combined)
 			vaddr_iomem = ioremap_wc(mem->bus.offset,
 						 bo->base.size);
+		else if (mem->bus.caching == ttm_cached)
+			vaddr_iomem = ioremap_wc(mem->bus.offset,
+						  bo->base.size);
 		else
 			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
