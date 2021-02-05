Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599B310734
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15C6E196;
	Fri,  5 Feb 2021 08:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40044.outbound.protection.outlook.com [40.107.4.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF686E196
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oku3qG3Bqyx7cgh1kTOL2Ef9d6hi+s/SncvWyRMjV2U=;
 b=97626zbsiQ09kkxAK73/XDyIiPe+HkeeWX5aIOIzNRgNw2LOvEPgot2x3XYRcA6ilXr/JsMmMjEz3FOntw24nKpvUqucJ/6YNEB+BAbgGtlAZyXNLjSkH1Xkpqss1zdV3mBoesPZOkRAGl3P9OhNqXSyUHR5efVXa55nnC8qkbM=
Received: from DBBPR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:d4::17)
 by AM6PR08MB3176.eurprd08.prod.outlook.com (2603:10a6:209:46::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 08:56:26 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::fa) by DBBPR09CA0029.outlook.office365.com
 (2603:10a6:10:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Fri, 5 Feb 2021 08:56:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 5 Feb 2021 08:56:25 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71");
 Fri, 05 Feb 2021 08:56:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a87e63f27edb816
X-CR-MTA-TID: 64aa7808
Received: from f699cae6931c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78728D3E-42CE-4D9C-A5D0-BF66747DB1A7.1; 
 Fri, 05 Feb 2021 08:56:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f699cae6931c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Feb 2021 08:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv2HkUnxABG2YCGUxbFGNkQkt2EJGmpQfoSDPuqPD3+eDQuJwETYhEzq9IeZc/fiHYELErhFN1Zmz1Jp5pup9ox4yuVKuwdPR1rKKx1M9FrVm/ya6u2Iy5Pa334dk0jOt/b1yiXsmKT7I8mQWZrNDCrhdGxd48PIbZ4XWG8Fpmu2sr7usFQ9i5bVZxQIjAdfvYBTYBDSwQ8txI57OYIodjzl6h4OZ5cp7CK4ai+fPoT/BWPnOT7hEHmZINrHDMnOm096A51pItQu4Dc8N7d9Dbw0qrWdQpCrtqHpDaIqil9xre5xgwkyP/no4TtFuVdkdoQuDw9pz4ugqASLAds6TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oku3qG3Bqyx7cgh1kTOL2Ef9d6hi+s/SncvWyRMjV2U=;
 b=NvqhWw8fXlQ3Q9XUS6Cd1B9bRVuwnGX1yx+rjWy9oJpHTS0eEWTStdyo7+EcwfzuMnh8WVTfbFsNsvevGc0PNeC6tt/A69h19P7TurH8AiVjXGyeUwH4HlEdExJPp+gTVxOPIL1clMjwnBZWjaQiPPSehR6YmWo+L3T+vxpX+a2CA/FO1LBxeWlyNcZ40foDU8y1VlvbFw04HaHUJRr4TVVgofDzBqfngpPeGkEswtQaQEh60Q+zcK45TuisglEJpN5tgswj0Q+Ojeef7Midpq+nh2nHqsDZw6z6tVlYzxeJdT5B4EKP6qb2I0n4TizR8amb8+OeS5O29JI57bIWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oku3qG3Bqyx7cgh1kTOL2Ef9d6hi+s/SncvWyRMjV2U=;
 b=97626zbsiQ09kkxAK73/XDyIiPe+HkeeWX5aIOIzNRgNw2LOvEPgot2x3XYRcA6ilXr/JsMmMjEz3FOntw24nKpvUqucJ/6YNEB+BAbgGtlAZyXNLjSkH1Xkpqss1zdV3mBoesPZOkRAGl3P9OhNqXSyUHR5efVXa55nnC8qkbM=
Authentication-Results-Original: linux.alibaba.com; dkim=none (message not
 signed) header.d=none;linux.alibaba.com; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2527.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::13) by VE1PR08MB5759.eurprd08.prod.outlook.com
 (2603:10a6:800:1b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 08:56:15 +0000
Received: from VI1PR0802MB2527.eurprd08.prod.outlook.com
 ([fe80::c58a:f891:1edf:b0ce]) by VI1PR0802MB2527.eurprd08.prod.outlook.com
 ([fe80::c58a:f891:1edf:b0ce%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 08:56:15 +0000
Date: Fri, 5 Feb 2021 16:56:09 +0800
From: James Qian Wang <james.qian.wang@arm.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/komeda: convert sysfs sprintf/snprintf family to
 sysfs_emit
Message-ID: <20210205085609.GA1531584@jamwan02-TSP300>
References: <1612420708-25297-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Disposition: inline
In-Reply-To: <1612420708-25297-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Originating-IP: [203.126.0.113]
X-ClientProxiedBy: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To VI1PR0802MB2527.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.113) by
 SG2PR02CA0033.apcprd02.prod.outlook.com (2603:1096:3:18::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 08:56:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 214cb7c3-7953-45aa-33cd-08d8c9b3eb60
X-MS-TrafficTypeDiagnostic: VE1PR08MB5759:|AM6PR08MB3176:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3176AE6CA30E58F16D6EE896B3B29@AM6PR08MB3176.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Qw6l6c++tBVyHueW5EMudrDpQ2ZidXDLG9/WAofidD6d15LUdHSMRAtLLkFrZc27pbcVzZ9MPsRBNiEOeJkSXFIVEe3UX3OE311q+nKcdRMG1Uo/KsE5pfMaezGlLnloUIVrx6YxPhDgHovJWqdl/WTNN/ZZ01zgQziD6Lg+PLanPNs6aD1Ss/3zWP5gRnpewvDqdjShQFh2Xx4M+QeSX2th/5jf9Zt++cC6L5WbYd3u9nAs1DPD4BN7LxHcfbBl14+LvVyAZqdEReFX3EUamlySLk02IUBhYYi8qtyfWM8kEcv7eUquhfxYZjBX6FvZJ0bA3Lw9U07QvLrbXy0JxvdBK9O9Hds8BgU1kFEeAn1/fdF3lI95Zmj8j+sX9tnC9luLN8hksc90d1BQFELOn+Kh0B94p5ZkTrLrFOyo2Ac5VOjzsae6cdtXMKlfFIZrcmEMPv2UCLAaWHwEQ/aI0sjCs9flUOIryOrks4oVnk0Pq2/gvZmDDHauDXEqasU9j3Rqdd+pS1sSSlyE307L+g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR0802MB2527.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(376002)(396003)(346002)(136003)(39840400004)(33656002)(186003)(8936002)(478600001)(16526019)(2906002)(6666004)(33716001)(86362001)(5660300002)(83380400001)(956004)(9686003)(6496006)(52116002)(6486002)(8676002)(66556008)(66476007)(66946007)(1076003)(316002)(4326008)(26005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J+g4MEI/8D16uXrRCMLn7ajZGesQRySNZnDr2l3YoSg7uIGMrd+mnJhO2pCE?=
 =?us-ascii?Q?287fWzWhsSgRcUsPyw6BYX6jDB2+sUgZkk+HLhS714s5FekXiJJG1pgoGfdv?=
 =?us-ascii?Q?2p4B9sgzJjllXhCq1UYixMjOd6CENWPGtOpW2waoCqDx7Hklw3/ehtWZXf8c?=
 =?us-ascii?Q?wthYtckncIOmLUncFHrWZdJbunjogtR1xqwMFkUKHPcOqW6+s4erU1DQXQxg?=
 =?us-ascii?Q?+i3tz++6LbhAArCc6omNkbPyKhG9q+fTxBpxcTGzQ1Qb107XdzY7OPDhYrjO?=
 =?us-ascii?Q?bREKzF7CDoobAWNII72J8xMM55QEZRE2zMlS0YbUW70EIoBIzdVOlc1KieDP?=
 =?us-ascii?Q?dPZoEjDtvt9fW74I1LVboWx6H0y6/kJ+igc4juPmtxfa8zpuJTsGlrO3UYGS?=
 =?us-ascii?Q?l8WZu56Jn1fb2V31mrwfwWpvmaF4r4FvJ35fqF2LbDrQVLQyzKP42qFHLcL/?=
 =?us-ascii?Q?DOWRJ8oL3bavvR7NmkA321ClKNUdOti8CofsedcZvl2k8wqK0jNaKMpzpJvN?=
 =?us-ascii?Q?qK4o1rMUtRLSl8gE45VE6i484p9uiAR7/njmUmK0SAAt21kCiEyuvt1naFUV?=
 =?us-ascii?Q?ZK1xlw8hhuXWaskDf4eus8nAOJkZnSFl316a6vudol/DzbVEDBTY27v23q9a?=
 =?us-ascii?Q?t5OXSQeC5Y/YtkLybJAJk9xMoQhzpMXFmxKN719ZB7KQZ7dAFE0rYWGsd2SU?=
 =?us-ascii?Q?7L4CuqdNbrdIxrJt2oraWT9avxdxtdRv996BVD9RH30wccChBn1jEmn3oy9t?=
 =?us-ascii?Q?dHONgtYrntV9zW2MyImxZINa7p+PqtP8k3a0vFcNwAW4AXVrhQoxkXgN48Mj?=
 =?us-ascii?Q?1lICLytVG5h/pUnYrgXFHSEvHcqOI7o/bHhcq+9cJIME2ApKoKkNNrGtfvPp?=
 =?us-ascii?Q?7sSeV9L4SRCNJbJE2jnH23Evtb2iKbf0JM7QLIMrVbL22kn/7btER6JhqYk+?=
 =?us-ascii?Q?Ds7+71ni2Lny0Ao6QLY95BPspGS0/QsT4mFOvXaTdazYOEMbmd7LCca0hVDy?=
 =?us-ascii?Q?f3ViOxsfXI4+57xTmwDxFiNLVC8lJLzpQpyCpv/rYq4wH0c2Z7g8eLmUwvRT?=
 =?us-ascii?Q?8zZz1ckR6syX/7jL4gvn9lYGkl1aHtD1RE0qCqF86kPfTeRbjncvG9OTy1x1?=
 =?us-ascii?Q?rdnmCoGtCoto0uNjVhhYlqaQInci0F2osBkA1Y+45QBGNsHaPcGOFJTPNu5h?=
 =?us-ascii?Q?Kf6Iev0LGuPlOUVVWaUsgCS6KWaTgoBBcZWrRz2rMT3vdHIF6ux+qeiL83+f?=
 =?us-ascii?Q?aJyB+hGnPZMumHFEn1swJ2TPbUl9By/7oOe5slIRhUXyJD7XjPoVdB/iQQTs?=
 =?us-ascii?Q?MAi9W4IPd6gHpc5LSU7hGU0j?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5759
Original-Authentication-Results: linux.alibaba.com;
 dkim=none (message not signed)
 header.d=none;linux.alibaba.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3de347d3-15be-48c0-1cca-08d8c9b3e525
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDsyp9+xEFEMSZTFmrMEYUsf+zUo/yXRQmQw8vmNvMfTrRvd+TAIcVve0tpX4q/XFeJU1IfynIR1qqaFWqrJ63xL4X3Ad/yrxzM3pxhyEPv8yYD1wmu0hkxnOWS4JBp4KBqc+hqiJEmNWVqXTk2dRoDWzQjXEwnP5xgb0BxWfbp8Gx6H1FNlfYAuOIqFmjB+RabWrojI98b3Ltq3lHCUYYgLtHpgG3et/yQslND4UXWSB8qUq7RAeuyv5Juf21QPdpBefcZM53cFrKe71ATZp6ilRlXTMbFpLF1hPmpdvCB9KBEQbXM8ay6j0LcFsClZAjr3BNfvG50rRWVxyCxnkSui5zPJ79S1vZliUBMGn11xOg29qOVo2eC4PH34wLweGktcih/L9J5cJ36tl1wnth8iW436wTxD2x0l1YYp4qI+SEW4tJ1u3S/A5PFKA+fJVuTinw+UsdNAp0GqBrjiU3DG73tuqK8AeTMDwZKcyB+RDm3n6VWqjyIZDb3qg79Q57npwpOuCy2DiLWQlzQShQe/rBTZANTo0BAP3hmDeavvUnytXy8kgZYg9pXflt9Ga/4lMn0r8jIxGbPw5ejKcSWkXSuLKODr2pL68N76ilzVPT69aLlXp6uZ+FPvfn08h7GjzElL7cON0qJWauQ3whHtzsxnlKfOgAwIsdxtWrI=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(7916004)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(6666004)(47076005)(86362001)(1076003)(82740400003)(6496006)(6486002)(83380400001)(8676002)(478600001)(356005)(8936002)(9686003)(6862004)(26005)(33716001)(4326008)(16526019)(336012)(70206006)(81166007)(186003)(2906002)(82310400003)(33656002)(5660300002)(316002)(70586007)(956004)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:56:25.8144 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 214cb7c3-7953-45aa-33cd-08d8c9b3eb60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3176
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
Cc: nd@arm.com, airlied@linux.ie, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mihail.atanassov@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 02:38:28PM +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warning:
> 
> ./drivers/gpu/drm/arm/display/komeda/komeda_dev.c:97:8-16: WARNING: use
> scnprintf or sprintf.
> 
> ./drivers/gpu/drm/arm/display/komeda/komeda_dev.c:88:8-16: WARNING: use
> scnprintf or sprintf.
> 
> ./drivers/gpu/drm/arm/display/komeda/komeda_dev.c:65:8-16: WARNING: use
> scnprintf or sprintf.
> 
> Reported-by: Abaci Robot<abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---

Looks good to me, thank you for the patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

>  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index ca891ae..cc7664c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -62,7 +62,7 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
>  {
>  	struct komeda_dev *mdev = dev_to_mdev(dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "0x%08x\n", mdev->chip.core_id);
> +	return sysfs_emit(buf, "0x%08x\n", mdev->chip.core_id);
>  }
>  static DEVICE_ATTR_RO(core_id);
>  
> @@ -85,7 +85,7 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
>  		if (pipe->layers[i]->layer_type == KOMEDA_FMT_RICH_LAYER)
>  			config_id.n_richs++;
>  	}
> -	return snprintf(buf, PAGE_SIZE, "0x%08x\n", config_id.value);
> +	return sysfs_emit(buf, "0x%08x\n", config_id.value);
>  }
>  static DEVICE_ATTR_RO(config_id);
>  
> @@ -94,7 +94,7 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
>  {
>  	struct komeda_dev *mdev = dev_to_mdev(dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%lu\n", clk_get_rate(mdev->aclk));
> +	return sysfs_emit(buf, "%lu\n", clk_get_rate(mdev->aclk));
>  }
>  static DEVICE_ATTR_RO(aclk_hz);
>  
> -- 
> 1.8.3.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
