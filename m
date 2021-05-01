Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E993704C1
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B9F6F620;
	Sat,  1 May 2021 01:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACD16F61F;
 Sat,  1 May 2021 01:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVsMLpbxVZd+TIQ6YWvoIIfJJtThZrUL4yDbWaN4j8mlaegzjA10KxfwslcGgPuk8/3siUPnTAVPjoUWU6wES4JXyubNT8pZKo7QHIxhM5eiaQNm+0oXxMtfXV70Qm+RhdvJockNWkvruBV3VuW3YlAfY7SLI/HR/X7MZ86anVMsb5y1wb4sHgfZEAX0QDx3uk0OA6oSr/CIs9YoUXDm7R81eXKa56+CqpjclV5zHkoSIlZoQKZTMOeMpuVUYnam3PeNkXMgaUCbXOPnzYbhunMxuO81OtyUJsJj8y5emcI6lSZh1Fdap03sXSSU0uVFuRcYB1MXnvpKfCcCSHMr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuQnSSmDusIxc2d9HNoy/hMJy0kIIPNL/VqX21Q5dRk=;
 b=mMb1uDGEZtnuG47RiX0OGAh97rkyGWi2XmLRtcnmOP0U5mjhOLZvcIy3q6DbOiAyC84s+lUVKn76IN+IJPlf6cW0cu0O6n70hE8ZTEZfbDS60QJJ0Yhha1E5w0aCjUv+brJOWgtvUVO1BwFxzloVHUgdCbsIcNlZjtIJtjYo1api+aFS1zuyTShNocToIFoH1o9WH9K6ghfDDk+XSr7BmaypkutonfxEvRLAwoeAoSU5LAH4w1eNb64f/sUJFt0oXKbNbTBEXBzZDkYIJJ4OCya8hfFsXjyx+YhzE+Qw+6mNE8kWU9hv9TnZVn37eADwqW22wTGfvShD2LJGwQjD+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuQnSSmDusIxc2d9HNoy/hMJy0kIIPNL/VqX21Q5dRk=;
 b=xc/9YeMjMXOSghCQhpOurqSeZmwE/gspT/pf+Mn56bSwWSQCbr1IZ+EJ3fmUNc+YD4qednza0i3ys/Tbnl0zYNFuBg1lCfUPGkcs3U76ZxwuGDqCA3ve+lMVlRM02qH2ge6iCfw9I5TgoFT7pzKg6x4pI3sdj8+xk28eZfPiia8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:18 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:18 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 01/17] x86/configs: CRIU update release defconfig
Date: Fri, 30 Apr 2021 21:57:36 -0400
Message-Id: <20210501015752.888-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 309778f5-02a6-4a60-c33f-08d90c449734
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142E15B447D46E95FBF5F34925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Twyf4XMI2mqWV6medNcwxIIh+tNPNKpigyCSzmMyR+DULa98CglykiOUNJn/XU0VAQkrjMAXEERjiR5eQzFxQkFNNq+QlDIRGn4Yu/4A9CyNuHuXyQEtLR/wAyFCcf9jm2LImgRp1fnr7+4JcmQiC04qsW2ITXMLqdzzkycbu2L88m67IU+A/F2bXJWomEiVmM26o8Bei+Sxgl8amSNP3nxWY5BjpDNvbzOYZ2jtq+k1RHjrvB62SCSp+BJ2/tQoImh9vWUZcyxj9o2eaC0f2m409NGTmo11ANahHuLWrSUDRrT0UBsRGwy1+zys0I11nf1A/8z4Rl7L7DwFZXZfc5z3LQJeTKU/0FSi/AlX7YeFxypv5K6KoR5Pd+iBQqlZNd/WTHkTA1FQoK7513vxD24/cmgKyoQRromxV98yrhROCPTZ5FePqIPT/p/4lZ7iLtrYXmHhHCmVDhETonHRIOBoEPcDOnNbKNuxb4sndRBwpAcrd6qvRpQrohhbvbHVC+b7sBhxQIhVl7B9kCYfX8KIMZZw95tZgnA/BKhRT9z/j87ulrXIyDBy1kFaWZ41Qio1wQqMriruIM1QSSLbcG/IfCqdjr7ApEpo2mK9O5MOPnLKLWFGytKnibobdggfWZeo0bx4/WULT9bmaWcqM6L8awSSV/PCVx3VvAGdzUUL80Yljl7ivOlUE9mWIpe9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(15650500001)(66556008)(6506007)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?23SsFof+4FtxGoGAXZxBWaUArDc+Fm6KPHr+SoFyeSti7RFvu7UJ7OSn/65c?=
 =?us-ascii?Q?Pu0tb3/s69+JvwCmC5Zkdw6o01TK+bP2zJh1qoBu23nseREOsVJmOK5YngbN?=
 =?us-ascii?Q?6OcVeVVYb4Jhd+jnTnfIZPVE3RcotEOvpj7riweuaKkq/L61ADXpKjcR83AA?=
 =?us-ascii?Q?89GisYxXlpzuNqGL4ZPY/E3+sr2OAQaKYAiOQmIQSv/t+ETh4RrPl3i80ee0?=
 =?us-ascii?Q?Ur347ZUR/LJKWRj4RQY01NM4JsQ1g9J3xfo9s1eVa5SfuJ5fKmzCpmNGFwmV?=
 =?us-ascii?Q?E4AvoFCFhnlp8llVqMWHAZYO+GAEsg08EI11rLPVIgkK3H8ylJCYUBsu2iL1?=
 =?us-ascii?Q?Q1bgrD9Ln9DlR/HPxVIhVoaRD7/kJ9bkwy7oO5uuOB+ZpylRy6nN240erek/?=
 =?us-ascii?Q?FPZFBr0CxcmQ8rPKHBweN9+q7tiOM9FZv/RKbdAxpNLlAafakXJgge3W32C8?=
 =?us-ascii?Q?uPLW6jrI6BumtBiYgodXPqCxylhYoIWNBgrAN/8Ho1LowtzbJG9MjSSar8wA?=
 =?us-ascii?Q?ggBBV0SYYpOGNBNjhfELd+S1Q03RUx4Gy4PRbuiHYqiiZsO53IVswQvDldwK?=
 =?us-ascii?Q?/YSxnr8XLCaLADeQuPbp+jIfQCVCc6sxscWBzlyhpJQkC1QfjW9FcgOd+R3s?=
 =?us-ascii?Q?bNSRBEbJCGk5CbdpMUKdLpQadVk7m9oFI7Rt0PZY/okcyaq8ro3Y1qYYBExw?=
 =?us-ascii?Q?zJJxf1KsHWns60mhqindmQwJ+C451nrUFWvb7vFAJkhRxui/StzzH5kXZLj8?=
 =?us-ascii?Q?lUKhvG73y4+oOouJLJa8KtZZk3Noi1JqvEjcBtQQK5/2fp5Z7pKyoyvKOGeF?=
 =?us-ascii?Q?zz1eNzz1PmTuIefDsS+p+Q+HiIiTf5b6AZ0yWJ5nGvJ9+WzlO2y0HpGW4duG?=
 =?us-ascii?Q?iYKUXubVYtMXKClDtAqQ/NgiAccbHg9bOadnvwUZEFyH8nZpJ3E/whDDl5cy?=
 =?us-ascii?Q?vr9oZ5hUhfnEDMVc+KoUfXNlS8psbBXXmHhLPolsk5YzYFqGhj8Ui/xWFiGV?=
 =?us-ascii?Q?m41Dco7Ujc02EwWPxn7oe1vvuDNQ7JpHKEx/EeorE+1bK6sdUow6TFVzm2J3?=
 =?us-ascii?Q?bc9ETbsMKgcLbdvwQcvAXUyoZ4wQAD8LZYSZse5qgHDvCemkMCoKXLPrIl//?=
 =?us-ascii?Q?jQEiPjA+iATghxCh77hhCQazNemAQaVj53xvJvRVhoWzB7w20RsNC6eibM5l?=
 =?us-ascii?Q?VflyQ2rItYB3m084ayuPqUdTvrtxFXfxnQeRDeF5LM37TQY7O9YpaH2hSS1r?=
 =?us-ascii?Q?pM6gUQg5muKMUmak5tGf51FzA76FxAJxOVYlu/B2nRHovevGV1KTS2u7x2Hz?=
 =?us-ascii?Q?Q60e/a6bOVSpGOn2WYWRKrzs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309778f5-02a6-4a60-c33f-08d90c449734
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:18.6062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6+GPUZOWfUdyVYmDE+y1jSxfpy2ynyB+Ce0L6Fu8W30lFVB7olZ9sPrdDBTipe46ZRlMPE8DY2Irz//jlZfUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

Update rock-rel_defconfig for monolithic kernel release that enables
CRIU support with kfd.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
(cherry picked from commit 4a6d309a82648a23a4fc0add83013ac6db6187d5)
Change-Id: Ie6fe1e44285f4fccc17092baee664e8d784851fa
---
 arch/x86/configs/rock-rel_defconfig | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/configs/rock-rel_defconfig b/arch/x86/configs/rock-rel_defconfig
index 16fe62276006..9c46bb890879 100644
--- a/arch/x86/configs/rock-rel_defconfig
+++ b/arch/x86/configs/rock-rel_defconfig
@@ -1045,6 +1045,11 @@ CONFIG_PACKET_DIAG=m
 CONFIG_UNIX=y
 CONFIG_UNIX_SCM=y
 CONFIG_UNIX_DIAG=m
+CONFIG_SMC_DIAG=y
+CONFIG_XDP_SOCKETS_DIAG=y
+CONFIG_INET_MPTCP_DIAG=y
+CONFIG_TIPC_DIAG=y
+CONFIG_VSOCKETS_DIAG=y
 # CONFIG_TLS is not set
 CONFIG_XFRM=y
 CONFIG_XFRM_ALGO=m
@@ -1089,7 +1094,7 @@ CONFIG_NET_FOU=m
 CONFIG_NET_FOU_IP_TUNNELS=y
 CONFIG_INET_AH=m
 CONFIG_INET_ESP=m
-# CONFIG_INET_ESP_OFFLOAD is not set
+CONFIG_INET_ESP_OFFLOAD=m
 # CONFIG_INET_ESPINTCP is not set
 CONFIG_INET_IPCOMP=m
 CONFIG_INET_XFRM_TUNNEL=m
@@ -1097,8 +1102,8 @@ CONFIG_INET_TUNNEL=m
 CONFIG_INET_DIAG=m
 CONFIG_INET_TCP_DIAG=m
 CONFIG_INET_UDP_DIAG=m
-# CONFIG_INET_RAW_DIAG is not set
-# CONFIG_INET_DIAG_DESTROY is not set
+CONFIG_INET_RAW_DIAG=m
+CONFIG_INET_DIAG_DESTROY=m
 CONFIG_TCP_CONG_ADVANCED=y
 CONFIG_TCP_CONG_BIC=m
 CONFIG_TCP_CONG_CUBIC=y
@@ -1126,7 +1131,7 @@ CONFIG_IPV6_ROUTE_INFO=y
 # CONFIG_IPV6_OPTIMISTIC_DAD is not set
 CONFIG_INET6_AH=m
 CONFIG_INET6_ESP=m
-# CONFIG_INET6_ESP_OFFLOAD is not set
+CONFIG_INET6_ESP_OFFLOAD=m
 # CONFIG_INET6_ESPINTCP is not set
 CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
