Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 151C832420A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEFD6EADD;
	Wed, 24 Feb 2021 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140045.outbound.protection.outlook.com [40.107.14.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE356EADD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPqH1TM1b/Lwfwj020EPSJqK/EPcHyybFBrN5vuHllU=;
 b=mJ3Nl6c9iQA7m33aV+MHSRCbm23LdT/keS/Dy7sRu9M8irULdhukhmp22BQGVUr5t50MZWCVQXe5nqZ+K+ZYeOFIkjRHaFvXbu0Semn2HRmiUF53YPP/X4kix+BgvmvGaEH5XE8w3ueOvYk9gEy2IedEbwcoZmCGtRejRjkL2Bo=
Received: from AM5PR0701CA0050.eurprd07.prod.outlook.com (2603:10a6:203:2::12)
 by AS8PR08MB6389.eurprd08.prod.outlook.com (2603:10a6:20b:33e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 16:26:14 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::d) by AM5PR0701CA0050.outlook.office365.com
 (2603:10a6:203:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend
 Transport; Wed, 24 Feb 2021 16:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 16:26:14 +0000
Received: ("Tessian outbound b973c7e93073:v71");
 Wed, 24 Feb 2021 16:26:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d5922cfcfa2c3a7
X-CR-MTA-TID: 64aa7808
Received: from f05ffbd7b764.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CBA2FBC-9EA7-42DD-9904-EECA471E73D0.1; 
 Wed, 24 Feb 2021 16:26:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f05ffbd7b764.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Feb 2021 16:26:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hv1/kUzQdBaj10ghMftxtyGiNlVgYVQVRdqL+GlbKwcRet9u3PcjFrCMgyXUAFNnwDl2uvHSS4+0wrKIU/1PVcX0Rk1y7j0eHIA8ErA/c2/IjdLm22P04zUiMUXiHodkR/Ezu7YgsaaL5KSf7uqUYElLWiHzNpLXjFsqiFSl1bbtmOGC300IdFWIOw0covO4O+ICPnhJW9+rpnQLD6I03slqMLy4vxbwIFYg5tBaw1b5LyiYo76qtUeuvOnNHd4PPONJUS/gDx0LeKwn49Da/RO7dGWOyeCXKnhZ/sywxwRMfdJmYA005gY/94LxvHBsfBD+O7OpSu0cS7diMAR8rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPqH1TM1b/Lwfwj020EPSJqK/EPcHyybFBrN5vuHllU=;
 b=OOjStAnnGX3OhyYQVaXP4Gw1D9p6EYyvaZrY9EtYTOcCdvlYZG6CA5DrWHZPH0blwqQl1vwWm4qbghc0REywXv5Vp3jRny+Pnxaq+xl81pgMGQZbLf929jRDHMdOMAYyHQtDMSbFHcm5tEqo7qxQNCV3UIVP9O3q9ixTW71UKXCQ6/Q/NL4U6BHSVis6GcPqZ2/WdRNXqPg53xt6gvcfilcPoeyoMHAfNpuS5OiRxhfmEighyimtAp/qTIt9TEgb2xgR5u/JNP76Z54D3DOncVazMxas06kjQzY75I4oJuYzzInq6u/L0JSLBn/wY0OGkYmZQCUqS7ostirZTL051A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPqH1TM1b/Lwfwj020EPSJqK/EPcHyybFBrN5vuHllU=;
 b=mJ3Nl6c9iQA7m33aV+MHSRCbm23LdT/keS/Dy7sRu9M8irULdhukhmp22BQGVUr5t50MZWCVQXe5nqZ+K+ZYeOFIkjRHaFvXbu0Semn2HRmiUF53YPP/X4kix+BgvmvGaEH5XE8w3ueOvYk9gEy2IedEbwcoZmCGtRejRjkL2Bo=
Authentication-Results-Original: fooishbar.org; dkim=none (message not signed)
 header.d=none; fooishbar.org;
 dmarc=none action=none header.from=arm.com; 
Received: from AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8)
 by AM0PR08MB3329.eurprd08.prod.outlook.com (2603:10a6:208:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 16:26:04 +0000
Received: from AM8PR08MB6628.eurprd08.prod.outlook.com
 ([fe80::e582:9391:68bc:37a2]) by AM8PR08MB6628.eurprd08.prod.outlook.com
 ([fe80::e582:9391:68bc:37a2%6]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 16:26:04 +0000
Date: Wed, 24 Feb 2021 16:26:02 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
Message-ID: <20210224162602.7p55iaxjroc7a2it@DESKTOP-E1NTVVP.localdomain>
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <20210223145143.7bfayhp32tzdj637@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rMkSdtrHnoLzK6zAVvST2KH8SprNnp5bS92qpr84g=fPg@mail.gmail.com>
 <20210223165348.edghgglgx4g2lvfw@DESKTOP-E1NTVVP.localdomain>
 <YDU2+A0MNJnrWxPs@maud>
 <20210223183404.jmdw5rojy4s64xfd@DESKTOP-E1NTVVP.localdomain>
 <CAPj87rOVTd7YhbPoYyxhDD1+S7xG23L2v8Hujdh6tGFBq+n+Hg@mail.gmail.com>
 <CAKMK7uG+xNt4iQkB2ysbMQPbe_JSPWCq+3VzV+OOAuAhn=9x0Q@mail.gmail.com>
 <CAPj87rPRgJU0N7-41K2VLuBahEnYQH52FaTqVbDpW7CHu_6VmA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPj87rPRgJU0N7-41K2VLuBahEnYQH52FaTqVbDpW7CHu_6VmA@mail.gmail.com>
X-Originating-IP: [82.27.180.53]
X-ClientProxiedBy: LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20)
 To AM8PR08MB6628.eurprd08.prod.outlook.com
 (2603:10a6:20b:362::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.27.180.53) by
 LO2P123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 16:26:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f8292f10-11dd-44cc-b06e-08d8d8e0e7b7
X-MS-TrafficTypeDiagnostic: AM0PR08MB3329:|AS8PR08MB6389:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6389CAE24EA9A7F653416E9AF09F9@AS8PR08MB6389.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:538;OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: e7x9N0t8SoNPcTjbkGvYCv1oqMuuJi6VGivivznVuXwuoYbXCK4NC9MvenYwqF0Pd+Vj5pT8slFPCKQRpzfuCFPxs7cnBolgvP0BcbEtX4sUOZLxa1/OpGg7M74zw8hOLTy90or+v+qCo4KyIOhCyU3MJJf4NZ74+IYLM3rLWkKMiw5ppWdbzHfrFlfVl6EJO4yknn+0eJnERwjCUk0xutoS/AvQ5cGHp0NWoowlLlDR/0be0rHPT8PxUekze+flyY3YCG0fJmykj1Yv0Co7rmOC356RGAdIcV9KctfZX7zIYQhOIFw08RBGTzS6k36gj7Q+wOQ7EXx15flaFihZSOMUD8yQjEPBhZc/pKfUHsA9mVRaHjEb4as/p8wbpg9fXFDNh1MOjZNXLCyFi4zmtKHNf5qbo0wCZcxCm59THKdp37+qtYr3F8c+jdhjzEY9vz3V2J2/FmqCPFQ187DHlcqPp8HZ5bPaO/oa2xkq1nh+/KthEk+FtxcDRmcg4Om1s9ggtRf0UdGU+cEZGFLwTg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR08MB6628.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(136003)(346002)(396003)(376002)(4326008)(9686003)(55016002)(1076003)(6916009)(54906003)(478600001)(4744005)(52116002)(5660300002)(66556008)(316002)(66946007)(7696005)(8676002)(66476007)(83380400001)(44832011)(6506007)(2906002)(86362001)(956004)(16526019)(26005)(186003)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?b/jhrWYTca/6svvVYHLZ7e8aiuoTmXZfocQbEkL3z2hA0kmGO3RN6sSycotm?=
 =?us-ascii?Q?VDFGN4601pCt6OwBYzoxJNSf9hRkY79EY+8JVK1fBDPmb8MEP18ptgzGxDc2?=
 =?us-ascii?Q?JoBr4O0V9Eb5ZlihZewHYTynhbovwIyiTp1gzZdYfnftL795y+7vedil9mze?=
 =?us-ascii?Q?OBuwyLjx5jvJXN0jVZnp35ZL14w8dMhbYb0Oi1m3uV2O9uOEaAuIeVCe5+tv?=
 =?us-ascii?Q?O0ufZag6DYxGTZth5mwy8/2A7c9SgUX/MLoRjR7am1Mhj8o+lFotOFkg1j+4?=
 =?us-ascii?Q?Gw4Ingm2fX3+iijQhf0Gnj6cTdlsVi+/aZtuGmW5HnX0enTbjAjPJwyaVSyW?=
 =?us-ascii?Q?+e9gnr/tFucRoS8dWm8cOu9yJ6rx3fECLPr4w0+Er/QyLlrngci+nPvTJ10Y?=
 =?us-ascii?Q?2uqlEilaMMo7cSz5Z6nUy7c1z8s/NmrjZlayltdQzTmZKFKgkrbHJUCHuDNC?=
 =?us-ascii?Q?guLrCcdB6rR9bpsxYUIad0Z2GEpnrvDD8jUaAiNg0snB9pqzbF3meQKryW8+?=
 =?us-ascii?Q?eWMjotuJohaA33n38SPNQJpcAS8r70DfyLUOKpEm5vMDHuhlSm7/awI776A0?=
 =?us-ascii?Q?ie5yY4RoOPqMyqZ57+yJlczDaONueRhFRiCLaKw1/dFF8+Nzk1JlyifRj/Ys?=
 =?us-ascii?Q?BqC3dQyJw3cmbvO0R6q9WN5LVujiJ6liWBPNdMnvmS59tbXmTk85Iq6AiUoY?=
 =?us-ascii?Q?uPlZnsueVzrwgNSHfnxl+s5DxL7QIf8rRhiXaoL1EJpTq2g0AoH+A6sfYUkx?=
 =?us-ascii?Q?oor87oEiu+yJBW+VHm01wrRnoruSFavvaXuiPYT9jeZ/ZnrDIl76ov5MYndB?=
 =?us-ascii?Q?3b3mi1D86v/v4jLyvHlfaGDP3L+mDE24EEmtFS3tqr/kClArSvuU6op3r1fW?=
 =?us-ascii?Q?DUbiayB/xG7AZ7gcNB639ZqWDRjjiCjLkuPRRtwUJK+JOe+mexeyx7tVpZgG?=
 =?us-ascii?Q?80dG+Be9tXCOM1VFrDBdZhb9YqJNIIkHWt5ab7q5B/Od1i7EgUtOS8QJ+fMv?=
 =?us-ascii?Q?LKuKrw51IabTrhUfLleylcLxknLtxCXzO6dD/VVtL3RdqKS/SDywbEYJwZRk?=
 =?us-ascii?Q?vW+lRbP/XJo1SSELq1FhSHkFFsjiWaBbulxh9flnJ0bBQavOCzXLrMYAYBnn?=
 =?us-ascii?Q?d34BPwNUAHEaBKKsJbrjwsvRSmT7zQi5DPUqWVb9fV+/7njGmEFk24BRb078?=
 =?us-ascii?Q?BCVeEdCoTNjZx0vGQjjD8Hy94aTkoW+cdS/345BZmsMKz44ILh7La6MTa6DL?=
 =?us-ascii?Q?Qh1UgZsE+Dm1CoxayzRJ3lqybbwuaz4j9GhRXpm/WNLeWS522Q5Upm9oURTQ?=
 =?us-ascii?Q?ryu76uHOF/dIyMZF0wRYNztF?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3329
Original-Authentication-Results: fooishbar.org; dkim=none (message not signed)
 header.d=none; fooishbar.org;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 44be6723-35f9-477b-afb7-08d8d8e0e16c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HumbiKDk8uaLR5xPxbHFhICkTX6QskTx6Qfgb/b8zHheHbeyVduqwYJzMy6EyfPqFIrySswrefPA9hEmidshLxWe88pRJGJoflNAyg6GpeHdoigjPZ7W+MzJQ0PnESog7F8lxxtBzMnHpJZVm3B/DrP78SvnBM2QBdFu4U0dRg3lCHMsYOhwyNpg1WA90lg73rcPaTcyL+I5QpuQYNFIHYGv7NLCAOxTd/7IzYZwF1fEK78cDFX15FzNHlHU3fjJRuTAYEOq9pLXYnj1YwstgEXpk24iEfuu4vujQ4vVccCdPOE0/eaGFUK1kdGru/KsefclfZuke8q4EojDUVC5EC8pMLxQRFIwM0OWJG2/KSoOTlPoI7CvsObnbZm5qWO+9TrLOaCjYnPTLlh6652cb1z6IBZNMe/qFskTOeoJk+toP+KSnUHz2/kc7NNtvYV6A8Zevq3yTEDSgzKE5W9xO+fOz+aZIrJy8NEG6b95Pg0axP+INsaQc3yzf4iBXoSAdnIKTeNXJ+mS7Q6VS+gbrLknCHttDzOkkVpRwRKn2ut3acbrHKsFcdrMu8GthIXBGQzx6Ydtco3cVDIeDuSuHcEGBZwueC44gHr7/W/CJeZ/1/ExJepilD+3RbR0SK+gYWLLiGZxTGmG0ITkTYv4tw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39830400003)(346002)(36840700001)(46966006)(4326008)(1076003)(83380400001)(6862004)(186003)(356005)(16526019)(47076005)(4744005)(86362001)(316002)(478600001)(956004)(81166007)(44832011)(107886003)(54906003)(8676002)(9686003)(82310400003)(26005)(8936002)(55016002)(336012)(6506007)(2906002)(7696005)(5660300002)(70586007)(70206006)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 16:26:14.4134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8292f10-11dd-44cc-b06e-08d8d8e0e7b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6389
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, nd <nd@arm.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 04:06:05PM +0000, Daniel Stone wrote:
> Android punted on that from the beginning and just uses
> XBGR for everything ... so it's not really a matter of dumb vs. smart
> userspace, just equally dumb userspaces which disagree with each
> other. ;)

...apart from HAL_PIXEL_FORMAT_RGB_565, which has the opposite
component order despite having the same "name" order. So Android
disagrees with itself, too.

Sigh, pixel formats are awful.

-Brian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
