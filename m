Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B753338AA0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 11:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6096F569;
	Fri, 12 Mar 2021 10:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4E16F569
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyJtoJ4xQwMpMHORC1Zw5PVoiMaV+b2vqaurOno7qcc=;
 b=da0kwKqnVBDLtWvqQNiZ0YgR4b7IVl0lqJBTD6n0okLk/FnDwTN4j45uOnLSYQAKbfKCWjUDlrZDgyYMgXbnXI4DT2/tIyUKa4kJ3XCMt4BrtiTTS71D2cCW5qxk0QRQgWjSoROmf1KsvhptzvP0oWUvjOyvp6EWKkhUn+QSw0c=
Received: from MR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::13) by
 DB8PR08MB5500.eurprd08.prod.outlook.com (2603:10a6:10:11e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Fri, 12 Mar 2021 10:55:34 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::72) by MR2P264CA0025.outlook.office365.com
 (2603:10a6:500::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 10:55:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 10:55:31 +0000
Received: ("Tessian outbound 520e67c3dd94:v71");
 Fri, 12 Mar 2021 10:55:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e8a082d093f3026
X-CR-MTA-TID: 64aa7808
Received: from f615eff359e6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6734D99E-80D0-4950-97C3-11C44F3BF691.1; 
 Fri, 12 Mar 2021 10:55:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f615eff359e6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Mar 2021 10:55:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMPZhJE1pZmjPJBoWVZ/JXKpEq5TIIjqSI23PY50lsya6byzgdZM6U2g8uMeeDBQXG1Iiu7bhTys0G5xHzBQbp2hP5uxo1g0vXh8swU5LJmNrP6bjxRDVUveGyJVVdh0n1sAcIEggRjAUIidoKuoxrC8uCPklzNpJR7oQ1BGHU0+G5lm//IuMRb4BBPDGvHNXBb9dt0n0GcLFrRjbX90U7nX+/QnbUSdboqfsaCuR5oc8RNJRUl64fdMUvRAeMK6hujKlIY7XvBPvYc5K00AviqqLUkJx09TpCh1ifQjqAsblwyXfTsCMG9fnYFxZmMebduBcO7fKV+s8RI/4gmk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyJtoJ4xQwMpMHORC1Zw5PVoiMaV+b2vqaurOno7qcc=;
 b=B/UHBBI78l3exNnKnXp6eYfC+tmAt5ZundQfNdytGJW/7jggFsfrROJdxx9r6owf7dUvG4TIw4QNCbC4uT0pz1rD5LC03k2wz3iGK+1clFvQRDnBeoInf5TDEbmFHqmOVA6k31oF6M6P+XwNqOm06B5fmcQ91XfAnRKrh7rvoPkVYpZcoBHO+lB3vAzEavzmVXLkHojhccG2nFWWbuTVlisT+hnb6gR1vtlv6E50gDoxbkPLG2AssMLWkJjy/JiHekwiGq2quFRi/s813p3Wm81FyKPyjjiC47ZOiTszaWX2Wm2O9rUpOua3Qt+CRcy2m9i0ev2ln30bMLMu0vxwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyJtoJ4xQwMpMHORC1Zw5PVoiMaV+b2vqaurOno7qcc=;
 b=da0kwKqnVBDLtWvqQNiZ0YgR4b7IVl0lqJBTD6n0okLk/FnDwTN4j45uOnLSYQAKbfKCWjUDlrZDgyYMgXbnXI4DT2/tIyUKa4kJ3XCMt4BrtiTTS71D2cCW5qxk0QRQgWjSoROmf1KsvhptzvP0oWUvjOyvp6EWKkhUn+QSw0c=
Authentication-Results-Original: foss.arm.com; dkim=none (message not signed)
 header.d=none; foss.arm.com;
 dmarc=none action=none header.from=arm.com; 
Received: from AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8)
 by AM4PR0802MB2242.eurprd08.prod.outlook.com (2603:10a6:200:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 10:55:22 +0000
Received: from AM8PR08MB6628.eurprd08.prod.outlook.com
 ([fe80::e582:9391:68bc:37a2]) by AM8PR08MB6628.eurprd08.prod.outlook.com
 ([fe80::e582:9391:68bc:37a2%6]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 10:55:22 +0000
Date: Fri, 12 Mar 2021 10:55:21 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: carsten.haitzler@foss.arm.com, james.qian.wang@arm.com
Subject: Re: [PATCH] drm/komeda: Fix off-by-1 when with readback conn due to
 rounding
Message-ID: <20210312105521.dg6zcuf5gikfz5zm@DESKTOP-E1NTVVP.localdomain>
References: <20210311120846.23543-1-carsten.haitzler@foss.arm.com>
Content-Disposition: inline
In-Reply-To: <20210311120846.23543-1-carsten.haitzler@foss.arm.com>
X-Originating-IP: [82.27.180.53]
X-ClientProxiedBy: LO2P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::16) To AM8PR08MB6628.eurprd08.prod.outlook.com
 (2603:10a6:20b:362::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.27.180.53) by
 LO2P123CA0052.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Fri, 12 Mar 2021 10:55:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94f98a82-6d2f-4e17-37c6-08d8e5455b52
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2242:|DB8PR08MB5500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB5500034B927791DB5CD3889FF06F9@DB8PR08MB5500.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: D9RNGegdvYZmSJe9QWOj47Pak3WXerfm5U5Lkx31cyHpzEn0skaKgSBHMXzNIJyEmHph2tZpmpIHM4MwAXFZXd87RMNNImE+QwevlH/wbJMcNbA1k6lxWL+Db10aYJNsn6T8mhWSznFMBSwVqqDYKVhG+55VnPEB/6dEQfO0MIoGSi5aUDrk9PY3uV0DD9Ai7xePWAZ937qEokFiUgTnbkYHDEiIrZuGC9raTqGce81URYuiLJSBBcTmTFsKPu1TD6A17C4/5kxvzfde1txE7E91JGb//G0FF+iod7y99pttU2vBqwAou7JJGbGwMukK4sB52V4BuczwGysmMLgmuJ7bVvRDHjEaEOZZvtjF6De8s+5wHzLGbmi4oei1EorCAhJ1amieHgptrsloApjh6FW0wvU7Ra4V2CZZI5Exp2eGTyU3mEwPv/oisdhidWYkzgnLZiWDUF1hwwc/A1xan4QawsS61LxL+0iVSDh8fCvoajaBl9hkYcWMLEmu0/75mn0uFqTjUFtCGPLW9X0C8I0jbXzcdb6K0jfMCZPKcknh58NxMSZwYH0CfPkTN0KwkOuro4i6K1D9WATr2y0jE45/PemHLw3XFK5OemI79OU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR08MB6628.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(83380400001)(66556008)(66476007)(66946007)(86362001)(16526019)(316002)(966005)(478600001)(44832011)(8676002)(2906002)(5660300002)(6506007)(956004)(1076003)(8936002)(52116002)(6636002)(9686003)(4326008)(186003)(26005)(7696005)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?O5U13DERjhWenRrT6aCskp8aI4BfC4wlj7zkWOUOlF3MhzSo34cZFmMEoLZk?=
 =?us-ascii?Q?cBm/BKxVyqxN0CANaFeKRLKX/LAcOcicfLIE11Utcjgu+20ZLgjAszxGVYTv?=
 =?us-ascii?Q?rkOXOMejRLJ42BsLAe6V1Nb9/5/G06g0aNpMB69cn9SH3o3JfsgyU72afqJE?=
 =?us-ascii?Q?dL7P9yQ6d6isLieWjbXQRso6ofhG40Tw5wjLVIwGMl58vdTA6hKJIUdIEa3g?=
 =?us-ascii?Q?Hp/+p26ebiY+nuTbK+gjIcEt6waSQ8Ywn6SbrKLRhQyTQe2b/YsNKOzM61qi?=
 =?us-ascii?Q?KKJFGgkVOz7vLSwrAnebPQ+yOVfTz34r1sZPXkmMM1ogXjd/+7gnQI3Mkjh9?=
 =?us-ascii?Q?pjQXzbMo3rBTBNe4mol+b1aoe8RaKiUzdMwr4VznhAp5C38uN6nqda4qnQzw?=
 =?us-ascii?Q?CcDrBxWKErMQetDRjGxMoiXirdzxrg9LanD3rhSzUsz8Fh3SlIeKlN8DsFma?=
 =?us-ascii?Q?VN4/VPVXNHehYlG6qMC6E2FeqYBqEHZ8vc0ZFyMrsRxY10fRz88IhZxJGvxD?=
 =?us-ascii?Q?tYDxqzVyZ3lqWP+PKex6pglR4BYWBG/VeU0DiAaQIIIRGC7TZacRLfO6COQA?=
 =?us-ascii?Q?587+/xZkKOjgbkfwjSxeEdWH2yQ2tXwLpdrkV7szIDzrZxxcSvFEgz1E+jea?=
 =?us-ascii?Q?43QsCb7Z+QMmzrglpMyZBACs177hkas2oJ0RmSGJaWFlN90cyGBiLfmqmp8Q?=
 =?us-ascii?Q?8mzdjG3NwL09IeXXJf4AWS22jFs63NmgZ6TxmzdindWVEzBn8gsmHKMaPkH7?=
 =?us-ascii?Q?bFBNSTZTlLXmZMft0/gK1VMt6ohyz4uJ9Lbk3kGWfhArutZQc6Rc2RbL118B?=
 =?us-ascii?Q?1SxT37RpA7nmiEnpJlCbiOWrEJgYIWWZ5jYSFbmwObHOrQNG24L2tmGcQLNR?=
 =?us-ascii?Q?lYsGqenUQbb/hZ6qry9g8npl1RFD45BnrWOqiDei9marjoifkokuv90vIx34?=
 =?us-ascii?Q?aqgzFbDmv7vDyTRfAb6VXg44X/L5X6O8NLR5AJ0c4/KEfo9mikXEzKHeag66?=
 =?us-ascii?Q?8ZjbKSuj2BXcHLDWE9vL8u0q0XONH7E5eCXQ1zVS0euAaTXq6+xLhKAhC9XH?=
 =?us-ascii?Q?WfXcTEk3AZsdQo2UXpTYjHUcCE7h1XGLeQGWkXmJKydbppLfvNXO7NsIcC2o?=
 =?us-ascii?Q?TDPKewTOuk1qCvcK/GlVuipfmk62x7+mx/IUGdUuHcv8knd2eoQYuJcANZWT?=
 =?us-ascii?Q?ydmjzVSPx5/BDnZa1E/LPliab5WUnY6MIkEyA5lWSvIMOAh0n3OW5qhzy62N?=
 =?us-ascii?Q?zmwV0qb7gbVM8Sm9I9wByFVqGn+Bl4/lPHXEDhh05VyemR5lSlbf+48yOrUU?=
 =?us-ascii?Q?zc3Jux4f38DvNUmT33Plxok5?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2242
Original-Authentication-Results: foss.arm.com; dkim=none (message not signed)
 header.d=none; foss.arm.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d5c0835-6913-4579-b5fc-08d8e545558f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8iAG1AEmw0HVIe38dl/iaRnBVPDJ06VLOusyclBJtnNP9iu8aELV35j+ffwJhEa3H4ErH6Vx1/Dd9tU/MIIgIGMPRNvkzgf7LHgbpvZY3vjc23J9EDQfE5rwkCCy2f9PWVCqcTtq3PW+gfnN8bvFuW76HsAr7LhYhkDdhfnAZzvKeRFdX1UdU2z3x1/3skkj9C+qb5NKHs0G4UfjDvXAdgYd4WCBwgb+XrZyePR/NwA+vSERdzRNI93jpP9W/8kgYM6KoYeGsMcd/1Y+MZMCEsPdc7Y13zMUMWIMYZeHyr4I/jHFHKMgZ/rNhdYOWkMosuQyFeM3LK2wPidFs3UWu82fOb8O5xOOtVth9LqNOXZvc3mV9cv+71sTQOHighIaesqtzgAr3FUyc7nWturcNQCdye9zsOrLhpbEFimhiDdYsdD7bqp1DAjO04fJsyaUHOXpfSmPf4j+G87ivxEqIPmIzlKd2LHKj05Vhl2jq5mP0bjOfydIWPD76rRZnBkjw9o5iZu8tluyaB+niYkqaRGnXECDjOLAjWcvLAHQm/OuR42eNwOQt+MgcByjI4CKbLkqj0JPHou4wCekCxB2s8NXB3524Uu9EyZZtM0AH/WTJ9+gbU7wLP511kdINPqXBRRVzftg8ujBbJHhiMmhSoQ5Yv4WaQJ7B1/ASsme2LytbMHvUEh83zoiv38v3jlJ
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(2906002)(47076005)(81166007)(82310400003)(186003)(36860700001)(356005)(82740400003)(16526019)(6636002)(26005)(956004)(8936002)(4326008)(478600001)(55016002)(9686003)(70586007)(6506007)(70206006)(316002)(336012)(1076003)(966005)(83380400001)(44832011)(5660300002)(86362001)(7696005)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 10:55:31.9194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f98a82-6d2f-4e17-37c6-08d8e5455b52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5500
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
Cc: nd@arm.com, liviu.dudau@arm.com,
 Carsten Haitzler <carsten.haitzler@arm.com>, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Adding back James again - did you use get_maintainer.pl?)

On Thu, Mar 11, 2021 at 12:08:46PM +0000, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> When setting up a readback connector that writes data back to memory
> rather than to an actual output device (HDMI etc.), rounding was set
> to round. As the DPU uses a higher internal number of bits when generating
> a color value, this round-down back to 8bit ended up with everything
> being off-by one. e.g. #fefefe became #ffffff. This sets

Perhaps overly pedantic, but now we've tracked down what was actually
happening I think we can be more precise here. Not _everything_ is
off-by-one, it's just rounding in the standard sense - if the most
significant bit-to-be-discarded is set, the value is rounded up to
minimise the absolute error introduced by bit-depth reduction.

> rounding to "round-down" so things end up correct by turning on the LW_TRC
> round down flag.

Can we call it "truncate" rather than round down? I think it makes
"TRC" a bit more understandable.

> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 7 ++++++-
>  drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h      | 1 +
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> index 8a02ade369db..e97acc5519d1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> @@ -468,7 +468,12 @@ static void d71_wb_layer_update(struct komeda_component *c,
>  	struct komeda_layer_state *st = to_layer_st(state);
>  	struct drm_connector_state *conn_st = state->wb_conn->state;
>  	struct komeda_fb *kfb = to_kfb(conn_st->writeback_job->fb);
> -	u32 ctrl = L_EN | LW_OFM, mask = L_EN | LW_OFM | LW_TBU_EN;
> +	/* LW_TRC sets rounding to truncate not round which is needed for
> +	 * the output of writeback to match the input in the most common
> +	 * use cases like RGB888 -> RGB888, so set this bit by default
> +	 */

Hm, not sure why this file uses "net/" style comments, but as you
said, this is in-keeping with the rest of the file, so meh :-)

> +	u32 ctrl = LW_TRC | L_EN | LW_OFM;
> +	u32 mask = LW_TRC | L_EN | LW_OFM | LW_TBU_EN;

If you were aiming for matching register order, this should be:

    L_EN | LW_TRC | LW_OFM | LW_TBU_EN


I think it'd be nice to have the exact behaviour in the commit
message, but either way this seems OK as a pragmatic fix so:

Reviewed-by: Brian Starkey <brian.starkey@arm.com>

Thanks,
-Brian

>  	u32 __iomem *reg = c->reg;
>  
>  	d71_layer_update_fb(c, kfb, st->addr);
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> index e80172a0b320..a8036689d721 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> @@ -321,6 +321,7 @@
>  #define LAYER_WR_FORMAT		0x0D8
>  
>  /* Layer_WR control bits */
> +#define LW_TRC			BIT(1)
>  #define LW_OFM			BIT(4)
>  #define LW_LALPHA(x)		(((x) & 0xFF) << 8)
>  #define LW_A_WCACHE(x)		(((x) & 0xF) << 28)
> -- 
> 2.30.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
