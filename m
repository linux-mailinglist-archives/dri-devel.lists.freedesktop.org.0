Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419DB3B953D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 19:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9666EB73;
	Thu,  1 Jul 2021 17:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49136EB73
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 17:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6gf/9fYWkmEZjsV+4cbgliixewiWAtqkK3ouVDJSRI=;
 b=77mrARU8ur1cVmHvxlOXqxNd/ALb3cSq0OEOuDVtEFFUhA1VBTz0fjMIVwcDDsRhmPhk+uG+db0K7qoVh2X3T1CUPvHSpvnCIa8CJHo2jkDhlyGcUkdwKV4ZxqOSgpVfv5xr4GKhIFkcRuJ25f1etH7FjImi/zgahOpTFw29IWs=
Received: from AS8PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:310::7)
 by DB7PR08MB3578.eurprd08.prod.outlook.com (2603:10a6:10:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 17:08:15 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::82) by AS8PR04CA0002.outlook.office365.com
 (2603:10a6:20b:310::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Thu, 1 Jul 2021 17:08:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 17:08:15 +0000
Received: ("Tessian outbound 1763b1d84bc3:v97");
 Thu, 01 Jul 2021 17:08:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 448d4dc232fcf916
X-CR-MTA-TID: 64aa7808
Received: from 1f23855c4e17.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA6E181C-00B8-4961-89FA-926000FC1CFE.1; 
 Thu, 01 Jul 2021 17:08:04 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f23855c4e17.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Jul 2021 17:08:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFLxTJINoqorlmerXElXAYe/G2lefSl/d8Qr2amZsIij80ygwKX1yXF5z5tWwp15nCBgLQCrrrXgWduIzRdh7jEjvcQrka7f7O/A17uZb4VDhpL0apYhti3wVksQPDlBhY4mvgQgVgg5BSrgnySLBR4uyMREnD6g2CB780phmrmWKvUNtw8pBI2xKH+P/l9J2de0c3YY4SbdoZ7garOQR8tLegV+oilm9Q0vYzijp0Z0OiAEyqrTP/zL1/ivVrDEyP1S2Qc9xtsrkKlA41lwQUYvMe5nmNIgPBvoc0icZNNHX3r/2HrIHWCchy+ZHedYvREWAY0kpXRkc1Dsd21lMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6gf/9fYWkmEZjsV+4cbgliixewiWAtqkK3ouVDJSRI=;
 b=J2sIHin3dtzMSMZaQaKYtbQwm0QG3qwld90y6P9gYmBKGFQWOXEoOpK8xd77k7+GAQqx54bUnXl7FpCrYj12rK7WqvKMYhpcwlG+JlAOXRK8r/RZoTIbJWETbtHmk2nXlfJunC35RTthSjW/B0NlKJVUEQDNmu24lRrytizmYOOuK/5cvLJOH4hVQmzKP7M74K6v0VSXu6AfbOkWZJpot4IvLS7da1k50vHgpSCb6aDWps+Z21lGySAT1htj1ZFNMsUzTIp3Jajk7ZzpwKgprwZ0DbkBVlmnWlkv2QiNeLvbu27hSrohNHkIdRMgGWrKt/FO+btSfJLNjyY5Dn6+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6gf/9fYWkmEZjsV+4cbgliixewiWAtqkK3ouVDJSRI=;
 b=77mrARU8ur1cVmHvxlOXqxNd/ALb3cSq0OEOuDVtEFFUhA1VBTz0fjMIVwcDDsRhmPhk+uG+db0K7qoVh2X3T1CUPvHSpvnCIa8CJHo2jkDhlyGcUkdwKV4ZxqOSgpVfv5xr4GKhIFkcRuJ25f1etH7FjImi/zgahOpTFw29IWs=
Authentication-Results-Original: lists.freedesktop.org; dkim=none (message not
 signed) header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB4900.eurprd08.prod.outlook.com (2603:10a6:20b:cc::10)
 by AM6PR08MB4325.eurprd08.prod.outlook.com (2603:10a6:20b:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Thu, 1 Jul
 2021 17:08:02 +0000
Received: from AM6PR08MB4900.eurprd08.prod.outlook.com
 ([fe80::d28:d9b5:7c4b:c268]) by AM6PR08MB4900.eurprd08.prod.outlook.com
 ([fe80::d28:d9b5:7c4b:c268%7]) with mapi id 15.20.4264.028; Thu, 1 Jul 2021
 17:08:02 +0000
From: Normunds Rieksts <normunds.rieksts@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fourcc: Add modifier definitions for Arm Fixed Rate
 Compression
Date: Thu,  1 Jul 2021 18:07:09 +0100
Message-Id: <20210701170709.39922-1-normunds.rieksts@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO2P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::14) To AM6PR08MB4900.eurprd08.prod.outlook.com
 (2603:10a6:20b:cc::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (217.140.106.55) by
 LO2P265CA0218.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 17:08:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dec26453-e871-4007-b278-08d93cb2d0e8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4325:|DB7PR08MB3578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3578F0B2A3E1234D405DBA0396009@DB7PR08MB3578.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lTNnRDQEKoMZS5p2jH8GO2mzX3Hpltm60U+ajekqq5LCifGAbi1Hc3zmsb+cJSk/nLk5n2oz+SXDKMAi7p3ISl0Ej4yDj/LgCLbMqeKu5JATgQ0ScZfWY1uYbBEWUirS1dI8NVDoUanWUsrLRzJBhbXFue2RZ8siliqp7o7BlPbgVMWvEJ2nfP2box72tVIdjCWt7imU8FUIlL51MJ8hvmveEm1LWBOlaGhzh9tpA/VAfYtBWBIoP1Gk683d7vBkOEtluANSZ6udFVeUNRctVyLxlVJJkQjLYowxbeZ8Lx1Qb6k1zD+Qm0aL8vo1HA8TBVFs/qtOSra0/ABP1NXNCFZX2L6Rm3YjYYQnyLv3wBaOyUDHBMK7bHANPKNpx9DKqeyDUfhuC/LJ8x3Uky5OdGuXvVjrPfi1xUqSu1vSmnZXFsJTFQPubtGjJ69J9G79JcPdJ8bLI0TKoTGVOqJhlTT4vkUaGblKdMhj/UHUfv6Ut2T0cTWkQIsjvYwme1QXvSABO1tzywCY5ok/pTYIaT8CteFgL5taripLWVcWFxqkWpoxZ+SrGcSMZHcFZ1ks/Pk0xbdlmLw5CUx9S29Rk0q4+SRIUP8OQCcBKrfX/zkxHP2E9++6FGbo5q9OSFVJaeO5wXJvxwJwYlLrwoGa5Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB4900.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(136003)(346002)(376002)(83380400001)(86362001)(2616005)(36756003)(8936002)(956004)(38100700002)(5660300002)(2906002)(44832011)(478600001)(6496006)(8676002)(66476007)(186003)(6486002)(1076003)(4326008)(66556008)(66946007)(16526019)(316002)(26005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s32zBahU6Ttx49XYUqjkxZ3l6WHhqtkYkn72vf+YR2paPMwbC5GUmQLi7e2A?=
 =?us-ascii?Q?55Nz8lPn9LMxASYsOtlSdXntcbQefwFZvohnc9RlqFuEH29dYplbDVuzObe4?=
 =?us-ascii?Q?p1DSq6Kikn2Yvzft0m91qT46e4kQvdPTdmiZRn7cy2wlE3DhWrd1ZOmIzUhG?=
 =?us-ascii?Q?KJIZhy/Ay4umvnIp4tKD63hbsZVU/KY0VFmSINcvsnA84wXrni5TcMkD8mmH?=
 =?us-ascii?Q?5mLvRb30zHDmzQXRcYUGAhgjiDMnAFarNVCgg3nV0sIlj9b87Plu3legGyx8?=
 =?us-ascii?Q?Srkjx95ptCCx1CIkG92vjQYJHPflGr1TiZoTxqBiYcQX9oRiqbmFYwwTxSBS?=
 =?us-ascii?Q?tFpmALRyWr/jaf/Tk5uSPPKAc9EHdObyqb7xnp3IB2KSuC3Fow+sFF/UjfTh?=
 =?us-ascii?Q?LOA/MX282aHkg6V/zBovuJoDffYi5IXlot0TrmfeBnysPM5hwU9BNtE+rpRK?=
 =?us-ascii?Q?8peKONXQo05E8h4dMdPdvR0Il7WPqf0y5V6ctm+3frnUB4L50XfjwugsA3YK?=
 =?us-ascii?Q?pPaPrtdTur31bVHtKGcj5l7qtOLzk9uPJd+4mUIujCzPT6AEOgobMLgZ0SPP?=
 =?us-ascii?Q?MFWCBaL413zx4dhjLilotaL8RXoaF/wdULxDGDXnUZfXAKsrsJltVQHu0YO9?=
 =?us-ascii?Q?NSAwPkM0LMZHve+ZPMnzQq7LkLMmGKP8gO+UYFdVGxjzzjuzZDJR/5GtAxgh?=
 =?us-ascii?Q?s7qqv+hqlB+RG9CoOpZhuknFWol2IlKmibIJIa7AxG2VsYjbZBglBxm9ANtL?=
 =?us-ascii?Q?LP7adHPMF2nKQqlEXTky0W/OwyTET8tXz+AAep4UeFbLoTMuq0W9eASOuKYY?=
 =?us-ascii?Q?tb+WcL1niZu6wnpi/FONCA1JYosyeSYTHfQ9p6UTsreKCmJC1Z8VjxONPVPX?=
 =?us-ascii?Q?Nkijojynbgp9FB4ac/2slVe2GKWmQY9zVNvmhR1f/PkBJvYUKLFLsDjLgS7u?=
 =?us-ascii?Q?C+fA0gCzbszn9GB/lHZL+pskijYwH2CH3Qkx2SFu4tQB4jfgEkM8knzDRsHo?=
 =?us-ascii?Q?2eTuZq7p94kHFa8NbS8e+0V4hpdAoqxLXUhOky5V0BQblHTFU6Ib4AzAXP7d?=
 =?us-ascii?Q?v8o0z5uiZqh03z4Tt4wOxVPovDdf7wc/fVcfyVq2Omm6k/XyA0r559dBcfIt?=
 =?us-ascii?Q?Nsofp4rtgfPHvlJ3TmnmJu49epWaKMZyR2e4C6bYPvaro8BgYEt5R/2c2Xa5?=
 =?us-ascii?Q?wAv8cRQ9P7qqWxZHQwNYZ8KInkX0lui36p+wNxYJ9FR3rnPm7WLcHwhaqS6E?=
 =?us-ascii?Q?VUP/HLzFCbtqyXlxmEQ5WRRtx5pPlkdK6d7JA+X1uNv2t7Ur1eSWeEfVz8Dv?=
 =?us-ascii?Q?mTcKRcDMOAFSMJwyn/2We7rI?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4325
Original-Authentication-Results: lists.freedesktop.org;
 dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5219f4af-7052-4f60-4ce9-08d93cb2c858
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qE0nHZGfteMYch4t5+2rMKyPky7+k5zcVjDYY2wqFeRqLslTh+3A1AvhE19fQxzERwOHeNvf539cZgBi1Nnxz6QZgGyxRtpSHgGbsgU/g46BeMl+pxrS8PeSACR24UbPJrsmtHC4GQAI0Y2nTXR1aycz9w5qom7dsln4xYTO+hI+Hl3I5/k3ejIyMDpIjfkozAQmih/r6EY1gaz/gXRWT3LMVd5UFXOXXJ98AOWMhlkZscq0YVcBv8LPYB8BgvGvFm4wwYxRsXfBma9maX4DE1ARV6qYVX+EusgqRtT56ldxESv/S1r31pZsiFUwuVFCoN0QEpJprFtCcOZpDN0uSlbcZQAvLtO4iHyf8rJ6aZvxrC1emdKusQSTRnEjSTARwLFjZ6K9Vn3MXys3PNVqDF9J+4fbaXGc8jUwfUMVlquwubiwkai/+Q7JF4YRZcozdQjeGLMBSiojziHV+dg4FtRf1Qkl5n44vB2mNSz9i5WJ7zikarIijXZhGihosvfYnH1pliYgRt2FwAI5wEyllXGDmldpjJCjjozgfuM1DQhlXcG/R6n2EXIaBqRPIc/xgwNjbAtKkfum3whEUb+ph03oLW3SaMlnEHa2krcS0Whd7NfcSk9zXQw8rd7nXKZA3bUhn4IADylLYkI5lxkqgbo6gcMPo5RlNTi7Jth06MC8nS+c9ft1fuBB4cbp647iJayDvcwC0kTnIE8viqI1tw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(46966006)(36840700001)(26005)(70206006)(44832011)(8676002)(4326008)(70586007)(478600001)(83380400001)(82740400003)(36756003)(1076003)(316002)(16526019)(186003)(2906002)(81166007)(336012)(8936002)(47076005)(956004)(86362001)(2616005)(5660300002)(36860700001)(356005)(82310400003)(6916009)(6496006)(6486002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 17:08:15.5652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dec26453-e871-4007-b278-08d93cb2d0e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3578
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
Cc: Normunds Rieksts <normunds.rieksts@arm.com>, tzimmermann@suse.de,
 airlied@linux.ie, Liviu.Dudau@arm.com, Matteo.Franchin@arm.com, nd@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arm Fixed Rate Compression (AFRC) is a proprietary fixed rate image
compression protocol and format.
It is designed to provide guaranteed bandwidth and memory footprint
reductions in graphics and media use-cases.

This patch aims to add modifier definitions for describing
AFRC.

Signed-off-by: Normunds Rieksts <normunds.rieksts@arm.com>
---
 include/uapi/drm/drm_fourcc.h | 109 +++++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f7156322aba5..9f4bb4a6f358 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -900,9 +900,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 
 /*
  * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
- * modifiers) denote the category for modifiers. Currently we have only two
- * categories of modifiers ie AFBC and MISC. We can have a maximum of sixteen
- * different categories.
+ * modifiers) denote the category for modifiers. Currently we have three
+ * categories of modifiers ie AFBC, MISC and AFRC. We can have a maximum of
+ * sixteen different categories.
  */
 #define DRM_FORMAT_MOD_ARM_CODE(__type, __val) \
 	fourcc_mod_code(ARM, ((__u64)(__type) << 52) | ((__val) & 0x000fffffffffffffULL))
@@ -1017,6 +1017,109 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  */
 #define AFBC_FORMAT_MOD_USM	(1ULL << 12)
 
+/*
+ * Arm Fixed-Rate Compression (AFRC) modifiers
+ *
+ * AFRC is a proprietary fixed rate image compression protocol and format,
+ * designed to provide guaranteed bandwidth and memory footprint
+ * reductions in graphics and media use-cases.
+ *
+ * AFRC buffers consist of one or more planes, with the same components
+ * and meaning as an uncompressed buffer using the same pixel format.
+ *
+ * Within each plane, the pixel/luma/chroma values are grouped into
+ * "coding unit" blocks which are individually compressed to a
+ * fixed size (in bytes). All coding units within a given plane of a buffer
+ * store the same number of values, and have the same compressed size.
+ *
+ * The coding unit size is configurable, allowing different rates of compression.
+ *
+ * The start of each AFRC buffer plane must be aligned to an alignment granule which
+ * depends on the coding unit size.
+ *
+ * Coding Unit Size   Plane Alignment
+ * ----------------   ---------------
+ * 16 bytes           1024 bytes
+ * 24 bytes           512  bytes
+ * 32 bytes           2048 bytes
+ *
+ * Coding units are grouped into paging tiles. AFRC buffer dimensions must be aligned
+ * to a multiple of the paging tile dimensions.
+ * The dimensions of each paging tile depend on whether the buffer is optimised for
+ * scanline (SCAN layout) or rotated (ROT layout) access.
+ *
+ * Layout   Paging Tile Width   Paging Tile Height
+ * ------   -----------------   ------------------
+ * SCAN     16 coding units     4 coding units
+ * ROT      8  coding units     8 coding units
+ *
+ * The dimensions of each coding unit depend on the number of components
+ * in the compressed plane and whether the buffer is optimised for
+ * scanline (SCAN layout) or rotated (ROT layout) access.
+ *
+ * Number of Components in Plane   Layout      Coding Unit Width   Coding Unit Height
+ * -----------------------------   ---------   -----------------   ------------------
+ * 1                               SCAN        16 samples          4 samples
+ * Example: 16x4 luma samples in a 'Y' plane
+ *          16x4 chroma 'V' values, in the 'V' plane of a fully-planar YUV buffer
+ * -----------------------------   ---------   -----------------   ------------------
+ * 1                               ROT         8 samples           8 samples
+ * Example: 8x8 luma samples in a 'Y' plane
+ *          8x8 chroma 'V' values, in the 'V' plane of a fully-planar YUV buffer
+ * -----------------------------   ---------   -----------------   ------------------
+ * 2                               DONT CARE   8 samples           4 samples
+ * Example: 8x4 chroma pairs in the 'UV' plane of a semi-planar YUV buffer
+ * -----------------------------   ---------   -----------------   ------------------
+ * 3                               DONT CARE   4 samples           4 samples
+ * Example: 4x4 pixels in an RGB buffer without alpha
+ * -----------------------------   ---------   -----------------   ------------------
+ * 4                               DONT CARE   4 samples           4 samples
+ * Example: 4x4 pixels in an RGB buffer with alpha
+ */
+
+#define DRM_FORMAT_MOD_ARM_TYPE_AFRC 0x02
+
+#define DRM_FORMAT_MOD_ARM_AFRC(__afrc_mode) \
+	DRM_FORMAT_MOD_ARM_CODE(DRM_FORMAT_MOD_ARM_TYPE_AFRC, __afrc_mode)
+
+/*
+ * AFRC coding unit size modifier.
+ *
+ * Indicates the number of bytes used to store each compressed coding unit for
+ * one or more planes in an AFRC encoded buffer. The coding unit size for chrominance
+ * is the same for both Cb and Cr, which may be stored in separate planes.
+ *
+ * AFRC_FORMAT_MOD_CU_SIZE_P0 indicates the number of bytes used to store
+ * each compressed coding unit in the first plane of the buffer. For RGBA buffers
+ * this is the only plane, while for semi-planar and fully-planar YUV buffers,
+ * this corresponds to the luma plane.
+ *
+ * AFRC_FORMAT_MOD_CU_SIZE_P12 indicates the number of bytes used to store
+ * each compressed coding unit in the second and third planes in the buffer.
+ * For semi-planar and fully-planar YUV buffers, this corresponds to the chroma plane(s).
+ *
+ * For single-plane buffers, AFRC_FORMAT_MOD_CU_SIZE_P0 must be specified
+ * and AFRC_FORMAT_MOD_CU_SIZE_P12 must be zero.
+ * For semi-planar and fully-planar buffers, both AFRC_FORMAT_MOD_CU_SIZE_P0 and
+ * AFRC_FORMAT_MOD_CU_SIZE_P12 must be specified.
+ */
+#define AFRC_FORMAT_MOD_CU_SIZE_MASK 0xf
+#define AFRC_FORMAT_MOD_CU_SIZE_16 (1ULL)
+#define AFRC_FORMAT_MOD_CU_SIZE_24 (2ULL)
+#define AFRC_FORMAT_MOD_CU_SIZE_32 (3ULL)
+
+#define AFRC_FORMAT_MOD_CU_SIZE_P0(__afrc_cu_size) (__afrc_cu_size)
+#define AFRC_FORMAT_MOD_CU_SIZE_P12(__afrc_cu_size) ((__afrc_cu_size) << 4)
+
+/*
+ * AFRC scanline memory layout.
+ *
+ * Indicates if the buffer uses the scanline-optimised layout
+ * for an AFRC encoded buffer, otherwise, it uses the rotation-optimised layout.
+ * The memory layout is the same for all planes.
+ */
+#define AFRC_FORMAT_MOD_LAYOUT_SCAN (1ULL << 8)
+
 /*
  * Arm 16x16 Block U-Interleaved modifier
  *
-- 
2.17.1

