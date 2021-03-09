Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33122332434
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 12:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9006E47A;
	Tue,  9 Mar 2021 11:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140087.outbound.protection.outlook.com [40.107.14.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AF66E47A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTsz3UD2ExvAVE1IAU9Rb/0godiSSu6gbeGs3RSsAV4=;
 b=DP/O/LEF75iXSijIM5fiS4VcGiXvwDIw283fMJkCg0CsjzWqp6Nh24BOmfDwQCLqCGoH6UeFu6qyvLQdxU4lDApWpCvFnNFq+As+/P03LK9aFJQVZEXxfqAVSLf/F6XaPTUIKfR9BGECP+zXg5eZtWhUMWMxoa5P2t2r0VefkrA=
Received: from AM5PR0601CA0025.eurprd06.prod.outlook.com
 (2603:10a6:203:68::11) by AM9PR08MB6307.eurprd08.prod.outlook.com
 (2603:10a6:20b:2dc::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Tue, 9 Mar
 2021 11:36:47 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::12) by AM5PR0601CA0025.outlook.office365.com
 (2603:10a6:203:68::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 11:36:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 11:36:45 +0000
Received: ("Tessian outbound 57597fd826fb:v71");
 Tue, 09 Mar 2021 11:36:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 62cc0d4dd379421b
X-CR-MTA-TID: 64aa7808
Received: from 8560d96565bb.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28E6951B-BA69-43D4-B364-C2490F200C0C.1; 
 Tue, 09 Mar 2021 11:36:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8560d96565bb.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Mar 2021 11:36:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtDGCZQtVRkqn1x3sr+o+nfciuQQz0jh/JnAR8FqVu2ddSWuHaCFAbMFPyoUaIjQTpAXI50kDVTYAP7UAgkjvsVEm7GUk/Dopp7Pio8sfCjMP9k1YT3Kk9VWj81HkGKFScKQUY1Eh8e5NR5OB9sc7vUh1sfqXsPHX9IL3Je64aGRha2kK2blWgONgyQ2ebmaC76zyAFmcvxX6Ytu+WxVWJeJIN7My82wIi1/LsA0G1ewah0YLONhqEVp1xnGS1ZBK+W98GrYVam2gHE40pzxCdPgR8O1e41691OH8b8vBxG33nloJYtL+4+LeliV+op699TPapMbr8DVXTFI+Cv61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTsz3UD2ExvAVE1IAU9Rb/0godiSSu6gbeGs3RSsAV4=;
 b=FOB4IOIkRh/XkDxpDNxUMZxLXGjxnUeVRYIz/iaLoe0PrOu7QYZbBnHt22kQyQiYE70D8ufQpMqdhANKwfwRIbSQqevvaKuV5eFZYzGPexiaIjGjzzk9jO5LMTZk40/R8U3zH1HS1ppx1zgXJqSDjUynB6VQZNRxCR4G1wN6xUzgAQHQ3asB8gob/YnSWe6buDMkBPtWH8DBWXpCMuVszG5o1nlrCLGFFnQVKxL3JadzlvxeOFnaMyxQ6CT8794OkXs2e2MM7+oaosnBw4k+j6xViuqzetVCOLs9RQahrP7TJe+8frx23PUKO87pK5jRyp/ftRGWhnrC9mm+VnD/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTsz3UD2ExvAVE1IAU9Rb/0godiSSu6gbeGs3RSsAV4=;
 b=DP/O/LEF75iXSijIM5fiS4VcGiXvwDIw283fMJkCg0CsjzWqp6Nh24BOmfDwQCLqCGoH6UeFu6qyvLQdxU4lDApWpCvFnNFq+As+/P03LK9aFJQVZEXxfqAVSLf/F6XaPTUIKfR9BGECP+zXg5eZtWhUMWMxoa5P2t2r0VefkrA=
Authentication-Results-Original: foss.arm.com; dkim=none (message not signed)
 header.d=none; foss.arm.com;
 dmarc=none action=none header.from=arm.com; 
Received: from AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8)
 by AM9PR08MB6115.eurprd08.prod.outlook.com (2603:10a6:20b:2df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Tue, 9 Mar
 2021 11:36:38 +0000
Received: from AM8PR08MB6628.eurprd08.prod.outlook.com
 ([fe80::e582:9391:68bc:37a2]) by AM8PR08MB6628.eurprd08.prod.outlook.com
 ([fe80::e582:9391:68bc:37a2%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 11:36:38 +0000
Date: Tue, 9 Mar 2021 11:36:36 +0000
From: Brian Starkey <brian.starkey@arm.com>
To: carsten.haitzler@foss.arm.com, james.qian.wang@arm.com
Subject: Re: [PATCH] drm/komeda: Fix off-by-1 when with readback conn due to
 rounding
Message-ID: <20210309113636.whdolt4v3k5qpgpx@DESKTOP-E1NTVVP.localdomain>
References: <20210305163853.66157-1-carsten.haitzler@foss.arm.com>
Content-Disposition: inline
In-Reply-To: <20210305163853.66157-1-carsten.haitzler@foss.arm.com>
X-Originating-IP: [82.27.180.53]
X-ClientProxiedBy: LO2P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::21) To AM8PR08MB6628.eurprd08.prod.outlook.com
 (2603:10a6:20b:362::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.27.180.53) by
 LO2P265CA0009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 11:36:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bb0388b-aac9-4baf-ff94-08d8e2ef9e51
X-MS-TrafficTypeDiagnostic: AM9PR08MB6115:|AM9PR08MB6307:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR08MB6307B49FDAA8C2F207B84CDDF0929@AM9PR08MB6307.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Hc3n6/gD9wRV6RZJK9hB+SRFoiXQje9d1ZXM5UMDcQRbnlOy+ecHJdEX3YmAdnZNvL5/5mzRdVUxejKCr51ExMQcbI3z3NVTMKKB/AiOLHU1ld0XXLr+/g/79ZqieOE85rY+7pDS3i6J1W6YZ5sERS5qK6NwKLQ3Nm/1nfebtICEF8hzww5VqIGSZLtLSJJD6mIh2GJvIJE4GMdjXTdjach/4mjvVJkcssCs1n+ivXcgXsUZ53n4zyPoTSikJGXW+nMfmjUsKU5+MUWh1faNDynFVy9j83CDRGkQz1a13ywUwC5TAwihAGa38IFWLcK8euse5zJQpkvoPeC0sior6S/vfbfpgorxfHUbIiQqIP5wMdOcjU+MdgKaDx58C9ivIHWXPjflKL8J137CwZFJP97LJWLHNc9/nbncEBA4JxplgM9vQa4CoBlVV6Bo1qyMHGQMMxIPPRnxmxkBOTGMMeQuvSnAma4neKsVS6N1lC2ZNZzJdkLNfT4cDz3ZXptTN/UaAXzP8hrckG3P8jASLgwOZt9PciVZozRjAkoEVn6QhP8maBMveiFDNugFXN2P
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR08MB6628.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(55016002)(9686003)(956004)(66946007)(66556008)(66476007)(2906002)(8676002)(26005)(316002)(44832011)(7696005)(6506007)(52116002)(6636002)(1076003)(16526019)(186003)(5660300002)(8936002)(478600001)(83380400001)(86362001)(4326008)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QiTb45yr6Onutg4+neP79j7v9gYXVA8MZytJ/1CfpZRV9d1YOGctWJbN/5Ie?=
 =?us-ascii?Q?dDpJEwqcp90OxG/lkHrWJleYQ5jii5HuCFefZfLCz+eizNGb5ADMgapvP2Zs?=
 =?us-ascii?Q?pq6JyzE0W59Ywf0u213oKdkQ+PfK7cjmurvE3E9+ucMNx6xvNXrw6FyH42/8?=
 =?us-ascii?Q?OkNCpw91G1vwYvk/16jud5nGQBdd3k21oIVTHK8U0wya8u+hEOu7FSvXFejN?=
 =?us-ascii?Q?NJ56NkoBlGWrMsJpHfhSPCJjSSog3TRTd3/IHmr1wSb/AefcHwR4f7vvGF7o?=
 =?us-ascii?Q?8Jv7L/RGFHXg77Z7ovVDBpv0G+atPtZZ8E2M4+S/PSPzAizgW7bacjVSMmbx?=
 =?us-ascii?Q?4dxUDU5y48/GEIixObI1DDQeNblaOEpf9LDha4/yvTS49bAEWzUP6dnKs/O/?=
 =?us-ascii?Q?nHr49SvYQ5TZuijjAW5rQGFKkHGFI+3zvBHMrEq4kK1dR/zzt4kMclXG7ANb?=
 =?us-ascii?Q?7Mk9lHZJDGzdl9v1VMiHP9KMDR9xbP7ckve+K064Wh8eNBTKABXOmaQZLtbk?=
 =?us-ascii?Q?+q/K8rxA4gUFH++KzLo7pmmZuLRWigXrfXYoBCpWiYRuYM49gMyquDil/5bI?=
 =?us-ascii?Q?fy1kqEgC9HaoW09Qet+q4OQD6HacLu48OjoZ7RFUODdeG9w8ziKehkfSbIWT?=
 =?us-ascii?Q?B2iv+La2DHjZdtdJJ0C61JunBbPVsgiGBfYnXt4AWur6yOWxh/GcjvN3Avem?=
 =?us-ascii?Q?qc0xEdu6Wd3MbyNpJ6lHoeXRaFiINaqU//NC1HC0Y6qD8enOXyTfhneiieEq?=
 =?us-ascii?Q?1ZslpO9a6gY/CEcal/Nm41XvPIu28nvz0INsaPu80uoGSCT4ytd92mfYU7v+?=
 =?us-ascii?Q?Pu8RbgP6YHDMDdFjCW6kstsfg7lQwQz7McsO9aSLrF9QUEg5k3PO8tT6j3Dd?=
 =?us-ascii?Q?uZNSqwtGgjdttLktRRTB/QMTIqc5EB11Fkt0DzLnUxTuEqSn3+5n56zy5t8M?=
 =?us-ascii?Q?4F/9aUir/muC48eGHULK6MF5lbAEzpggiDeYqtJiabIWzY5S1+m9frHpM5+D?=
 =?us-ascii?Q?syLCNNfgbVSVts9pFu2QZSxgoC8QMsp24wOJvAi9iMGNaAfdcIcXEtxNGKPG?=
 =?us-ascii?Q?6XN3616DJM197pssD2Yh6NndcOB1W47PjxCuufsfJFYVNNUZxAPZzDFboPgp?=
 =?us-ascii?Q?lFMKPo8/wYCJbwcbRTnfw0wLhfiJUO+zsSbOG8eyinAIEdyDrh04128zmX4S?=
 =?us-ascii?Q?Y/tWcUYuKbkXVDMKNfmKGljx97I2IK+prGG3OLeC/EsEvyx9zj+rBl2OnsPV?=
 =?us-ascii?Q?GJpIvH0Zy9/YssUbZuXa6+BQUOmOoM9AFBDk5FYYqRAXpflqQMNjXrFkGmRH?=
 =?us-ascii?Q?ts3P9J7yBmqNkEQAEzbVaImF?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6115
Original-Authentication-Results: foss.arm.com; dkim=none (message not signed)
 header.d=none; foss.arm.com;
 dmarc=none action=none header.from=arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d34729cc-63fd-4e0b-69b6-08d8e2ef99bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xpk9tx0x3PgdQpav3illb1Vi5qpctWBlbMjgAsDSZjD/0oy1ItFO5I1fQSSvXFqNOL/J3bsM9+9yy4Og+JYFasK4QVqEm6sKhh+h5w7bGbrmasqIAI2zhkCABZCsWU9Mpmb1AShyaDfYVxoOp1sGkeWVEkb13ohzwOMwYg5U2EZ+87cD2CCgTemvcjhZyT7rDz0tq8yAiypTM2TVOdspnz7eQwexCiEEGidnRgw1mwWrf3ttpUioQgmYpn0MYLLVglNbJcibg4d/3ll8+qMao/BtUybCqtieNkWQP4xAL8o8Z8IM3Z1nEir2ybiJo3fO9snq/r00sFp+oV8ABz8XcGO8UXgv6l+CkmTM20vq57lAHErM8xxMVs/c60GosNempz0Cq6nMx3pMY16noFTjKKwu/tV3BAlCwgAf4gMNUTSHSV76dM3oMUvY3lyNAOIW13eqwSg/k8wF96BZvX01gRYRxJ2+P2oC0yvCT7w9hP7bf805la4clFKBjIEZjVlSPipKl6NuDev+y7WngYZViTnJn7fgIa290dchIWQqqhPEXwIzQxvkRIzAYtl/8SnGnBRzY93YJyY2tQrsSgB0GqD0NunPpwzhP8p6aX4dv0haaPNEXcFvYY/H7sYpdcFFnNuJvrLs4pomHMExfq2MMuEG/f8NUMcVk/KNaGa47G8LSw9n2BlP5eUh9NpyJk8H
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(36840700001)(46966006)(1076003)(44832011)(47076005)(36860700001)(82740400003)(9686003)(6636002)(86362001)(478600001)(81166007)(70586007)(8676002)(70206006)(186003)(356005)(966005)(55016002)(8936002)(16526019)(6506007)(956004)(7696005)(316002)(26005)(83380400001)(336012)(82310400003)(2906002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 11:36:45.3541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb0388b-aac9-4baf-ff94-08d8e2ef9e51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6307
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

Hi Carsten, (+James for komeda)

Thanks for typing this up.

On Fri, Mar 05, 2021 at 04:38:53PM +0000, carsten.haitzler@foss.arm.com wrote:
> From: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> When setting up a readback conenctor that writes data back to memory

s/readback conenctor/writeback connector/ (similar in the subject)

> rather than to an actual output device (HDMI etc.), rounding was ses

s/ses/set/

> to round-down. As the DPU uses a higher internal number of bits when

"round-down" isn't really accurate - the rounding mode "rounds" based
on the most-significant discarded bit - so can round-up too.

Come to think of it, I can't explain 0xff becoming 0xfe, but still,
truncation is likely fine.

> generating a color value, this round-down back to 8bit ended up with
> everything being off-by one. e.g. #ffffff became #fefefe. This sets
> rounding to "round" so things end up correct by turning on the round
> flag (LW_TRC).

LW_TRC is the truncation flag. 0: Round, 1: Truncate

> 
> Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 6 +++++-
>  drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h      | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> index 8a02ade369db..d551e79fa0f1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> @@ -468,7 +468,11 @@ static void d71_wb_layer_update(struct komeda_component *c,
>  	struct komeda_layer_state *st = to_layer_st(state);
>  	struct drm_connector_state *conn_st = state->wb_conn->state;
>  	struct komeda_fb *kfb = to_kfb(conn_st->writeback_job->fb);
> -	u32 ctrl = L_EN | LW_OFM, mask = L_EN | LW_OFM | LW_TBU_EN;
> +	/* LW_TRC sets rounding to round not truncate which is needed for
> +         * the output of writeback to match the input in the most common
> +         * use cases like RGB888 -> RGB888, so set this bit by default */

/*
 * Comment style should be like this
 */

Same as above though - your description is inverted. By setting the
LW_TRC bit, you're forcing the hardware to truncate instead of round.

> +	u32 ctrl = L_EN | LW_OFM | LW_TRC;
> +	u32 mask = L_EN | LW_OFM | LW_TBU_EN | LW_TRC;

Really nitpicking, but I think it'd be good to keep these in the same
order as the bits in the register: L_EN | LW_TRC | LW_OFM | LW_TBU_EN

Cheers,
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
