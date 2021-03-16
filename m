Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C770F33CBE6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 04:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A676E1A3;
	Tue, 16 Mar 2021 03:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBF16E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 03:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T43rHeXb9U+AHuYl0EgaM1jS7wAT/Vir5+q7nyulhfY=;
 b=Yd3pxKQ8qOQ1wm+peQpSjcnEjepRjCK22kv1QwVDiRz4limpqfRR3TcTwh9cegpCjitFB+QOF692aIyyg8uF+wTvwhkait2LYtpecP5sJNkpAivW2Yk3oRoGQXTsvXksflwPz29oLFm0QzTp7T33ROCueIDn2jwnn+M5qpKpdDY=
Received: from DB6PR0501CA0035.eurprd05.prod.outlook.com (2603:10a6:4:67::21)
 by AS8PR08MB6152.eurprd08.prod.outlook.com (2603:10a6:20b:298::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 03:18:19 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::5c) by DB6PR0501CA0035.outlook.office365.com
 (2603:10a6:4:67::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Tue, 16 Mar 2021 03:18:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 03:18:18 +0000
Received: ("Tessian outbound de94f9ae513a:v87");
 Tue, 16 Mar 2021 03:18:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 887e09062e8a40ca
X-CR-MTA-TID: 64aa7808
Received: from e6bea6bc35d2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62764219-6377-445E-A12C-067206C639C5.1; 
 Tue, 16 Mar 2021 03:18:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6bea6bc35d2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Mar 2021 03:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKpEMbOdOuulkLfqF8YVjKhkJ3QxienZwbQF7kW7KbHramCEGI7nwDmb4aEnaRixlUyOJPw/CwaJgxO29s4mSGcHOkYeuD0F/y09gUYrwGMT7YZSKhZOrhPASqW6AwZNU5PW1F9DAbvc9dMpSvjav/m97TQbHLn5baqnj4btyS1hKa5x4wJpU0oZNytHNC6W9g0RmpW936erHtg1jFksprCwbqcKvXEoemNtCRMdC69dLc4EYG37cElojirqLpnx7tYjifMoL+K8qEE+NSs+H807bqbwMSCpvztTfB1p5bLpRF5jHhc7wOuiy6k9FxEKrQvJ55+y4ZIJlvcAJ4IyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T43rHeXb9U+AHuYl0EgaM1jS7wAT/Vir5+q7nyulhfY=;
 b=nk1kbh9U2kmhf3ZUntstdhH/Qh3JJYsVprR85HJHoEc4X1kI5yDJRMkpKS6QXi1WPSmtr22RCaww6wDNQPUZKGGZPOf0QgxwLtKoFGl/tWzZreS6vtl3xlbuLN9FAswoOOuu5cI8qyqzdUNVt5deeNPuqimmT+y+VY2i4zOi3E7SzJb8L/xz0kmTPc+uCTzhmDZtywvHYk7s97EqckA1RmcPxrUtq0bhwoDYTiIsksiryVEdddSWsNoaHHGXiNxmfb12AxzzFLK9zTpE8kxDBaQpkkWy5X7MGc/w+Z2rFRggLzSxwwXZOhfULm4P1AoadupQdW1rgAfkgNoiqBKNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T43rHeXb9U+AHuYl0EgaM1jS7wAT/Vir5+q7nyulhfY=;
 b=Yd3pxKQ8qOQ1wm+peQpSjcnEjepRjCK22kv1QwVDiRz4limpqfRR3TcTwh9cegpCjitFB+QOF692aIyyg8uF+wTvwhkait2LYtpecP5sJNkpAivW2Yk3oRoGQXTsvXksflwPz29oLFm0QzTp7T33ROCueIDn2jwnn+M5qpKpdDY=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from VI1PR0802MB2527.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::13) by VE1PR08MB5759.eurprd08.prod.outlook.com
 (2603:10a6:800:1b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 03:18:04 +0000
Received: from VI1PR0802MB2527.eurprd08.prod.outlook.com
 ([fe80::c58a:f891:1edf:b0ce]) by VI1PR0802MB2527.eurprd08.prod.outlook.com
 ([fe80::c58a:f891:1edf:b0ce%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 03:18:04 +0000
Date: Tue, 16 Mar 2021 11:17:56 +0800
From: James Qian Wang <james.qian.wang@arm.com>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH] drm/komeda: Fix off-by-1 when with readback conn due to
 rounding
Message-ID: <20210316031756.GA2910649@jamwan02-TSP300>
References: <20210311120846.23543-1-carsten.haitzler@foss.arm.com>
 <20210312105521.dg6zcuf5gikfz5zm@DESKTOP-E1NTVVP.localdomain>
Content-Disposition: inline
In-Reply-To: <20210312105521.dg6zcuf5gikfz5zm@DESKTOP-E1NTVVP.localdomain>
X-Originating-IP: [203.126.0.112]
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To VI1PR0802MB2527.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.112) by
 SG2PR02CA0031.apcprd02.prod.outlook.com (2603:1096:3:18::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 03:18:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd9cae26-7d9c-4ae8-41cd-08d8e82a2598
X-MS-TrafficTypeDiagnostic: VE1PR08MB5759:|AS8PR08MB6152:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61528BA48C74788A89D659F2B36B9@AS8PR08MB6152.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: np2sAcpe8oASKvFhhbWjICAOPXfDngYBCs9NbPTJDLYEGU/6iiCUvxpOX5cthsMcJXcaZa9rpWxtzubc+ZKGVo6mHE+C7WpH5Mtpg0wb7MGnfeWXeAn4LJyZoub6E6avOzP80e8lnPKeUEFxCQnwEYkwleILo/VnJUFNiuIKkrWTM3dBFknJ3VnOe2ixJAHcVS/0sEUfg/G4XOoVjAq9MAx9Mk8mSTUHSDKmnoQFLf6oRBH0PIbYI7bGIa/sWyQ60KxcvefLjk1Ht9eibH4XJ07A+3UfWsPfy59pRdELsUCTqKnZIlRILcd1A5WtqpcINfmPkMB+7A529IkmELJmINm1nF5EXghU6kTClmsg3wVWMxR/R6jATw+2YjlBZwVl8PylVp0w25L9Pd/CYeJlpiYYUirDIGVNeb3+4lekxfBwlC/17iu7a7m7g5nE4TaHNMBooQjCIEwgt3resBPQwd9rr+e2NV2o3+e1oAy4qrn6EXPvDaIE44g3dw6SaBrBhZfnJ1Z7a3RRiW9GzmJIDn1ACUO76n4lMajq9JT4FpB2zW7qsfzuJJnMVzKGHcBqE/xjavj3Chb+eQJX4fkzN3sMYso0zQf9bWRbt8GpJtE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR0802MB2527.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(346002)(136003)(396003)(39860400002)(376002)(366004)(26005)(5660300002)(966005)(8676002)(2906002)(16526019)(1076003)(186003)(66946007)(478600001)(316002)(6636002)(9686003)(66476007)(86362001)(83380400001)(6666004)(6496006)(4326008)(52116002)(66556008)(6862004)(33656002)(8936002)(956004)(6486002)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MEPi+6xJoFv+fyqbCjJIAIvRKfP3TJgZUHoTFMOikecyy6JmDbnGYS9KylnQ?=
 =?us-ascii?Q?zQdbDPBv6+zaqNE/PUe5wULSFgv3VNCwnOZk85MSEHgwIXqhgWMC7/uyqbSq?=
 =?us-ascii?Q?/fcf7RMG5Oy/kfciUCY0/oLdpv5WfdiiUug0BbDE+gYzlAajLxwY6vifD7Yz?=
 =?us-ascii?Q?v7ACQAdy8c9pAbh41LcdpD0H4O4TQ7rXEfD4G/uUdfQQKx299PO0E7J13bWn?=
 =?us-ascii?Q?+701Rw4QgNKOer1EeqBQ5Lg1jn4v8LU7swrnPcju9Hv0NaTKF1pPg3nOO6i0?=
 =?us-ascii?Q?Gd5qZUtAK3vJe4MzW2saQ4hu6u7+NHu7qdWWWXg3BlnKrf2WuaEAwnW8u27t?=
 =?us-ascii?Q?P1JQZ5cbLLJr+y49k9Xw62cQPKRwf79wjqE8y0Pxvf5BKZYHFNqPdsaWVKVn?=
 =?us-ascii?Q?cGnozoXd4Yks2JdxvysVYoPxpLowMiH+N/AEFYYXcTb8YqmmIpR6AoKOoOWR?=
 =?us-ascii?Q?ZNhJyBVpA4Kx57S1mQ3pxsmEcb1IO22FH/RrThzXZNIyR9+jB7egyudnM2Da?=
 =?us-ascii?Q?g9j7ZWDaTBTLopkXV4IGm2ftoXGdHAy4CNeiiMH6uz5flyRprAdNsKytQWUl?=
 =?us-ascii?Q?GPdpWMzwHo22VArzw8wPluSSr1sRILlunXRMaiOohBXkeu9tr998s8WUUi8G?=
 =?us-ascii?Q?srT2OU3sV/QTDIECrfUgNkodTAXcCFdFQWzqXR3MPqgWsXBbhdC8Wpp2nQFv?=
 =?us-ascii?Q?8cz2DGSEg8+vcRlO05HAMKoXtb8A9FAXJzD5U2SBnt+qApd3a+lEQ4t/RqCB?=
 =?us-ascii?Q?oXqZ7IyPkqPsNVWTpiQU5l0belvLbHtDo4NW3dIlm/T+svuhkl1VAmbCg6Xu?=
 =?us-ascii?Q?tzZpnOf9amLmrhMehGfOErCNjVdpfLkiLS5a2rR1mCnvqaJj7/KHsPItHYtb?=
 =?us-ascii?Q?7BKdqdnrojfGrRFxmM7dd8e3P6NtB/HYb7ttwNOSNTI1d12x++5KZwhE4IqM?=
 =?us-ascii?Q?gSV090meaAn7iGZ2r8za2KB6Nhxs/ydkCBNAplQ5F1wotam1HdB+c04lMQX3?=
 =?us-ascii?Q?466WXDJMm4sWQ3VUPL58zfG2WUk+y/Az+Y+gE4ae9V6ZM8zy3bsIRjvyh0m/?=
 =?us-ascii?Q?pug1/aEM5bozYPEp0E2vfti5DKou2ZOI+QMngJYtS23u6uanBn9+dSf60anR?=
 =?us-ascii?Q?I2K7+R/1IVpxCI9JYH2qBqv1VTrPimYHHUJxjBatmEvYSYjHTn8p7pmptNil?=
 =?us-ascii?Q?745EYegJVLsw06XYfHgU9GAmpT8f/UAoqjh6a9qbIY13zhlH4D69i5xjE6oP?=
 =?us-ascii?Q?B7xutVkBjel1Q11Va8nHq+foi7rAmXn41ghJDKpk93pjQ9jz2r1inFkaALRn?=
 =?us-ascii?Q?d2uw1O5RNeOEI0T1VzUKg1c+?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5759
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 63474ea5-4952-498c-78e9-08d8e82a1cbb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVJRXlyX9ybFmvebjhQi8w60I+U24krLKWpiPzHb9hrbKQCG5CR8d9+KtGML/dENhxFI8oodsAJGbq/cc0Xtn5RDaVGViT8MtbDCkoPSW4EMbkJU5Fjn/dFMlhRSv70Yf8BgyGeOePE4LYvuvq1SyK14r+vOkh3zuB8n6Qq3YCIl9Hhi+jZB27LZjJ86m04aDrUp8qLPPKyo4CQpCjJb3Av9Qo/VCaMx/vnASvkPizHSgyH5kHMBZBsptUcrB285uRqAkOKQh7VCVOlhARlu1O1FY9nled+VVwo56kTELL2kG8mdnKsIDOB8548X2swdrWd7e63hZkHYXk2DI2mRNIV/7FFvbpPycYdA+4PAYk+ylP2d+Kttt3FJFfoolOeaqO/LUbXiN2nRQRiLTFBkamUVc3QQzuhPYKsCQnoA7Eg917a7SicFwcQ7jAktpnMYYJP7tyNZy01dDvjWk06Dr2pni7UcGQBc3RdKbkEJ6wVyTNII3HR9Q/fMr+pW3GdSn8zWx8AGsP9OqPOujqx2qtn7GwYny/Bi9sCZefDTkuIGHrPfHH6f+0VVa796i5iEix+AtMlBZliAsRQm9T08Fo40dFgGcvWih8gvBf2Gykb/+l1CAFNxiePg6hVgapEd5paAA/h5LpW5INH6z17Y7NNtkMP8s307S7IbNv+tWQ9CubfnygJ1NegbpLMPaXBR
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(36840700001)(966005)(8676002)(81166007)(26005)(83380400001)(8936002)(316002)(16526019)(2906002)(9686003)(186003)(5660300002)(478600001)(70206006)(1076003)(6666004)(336012)(36860700001)(47076005)(33656002)(6862004)(70586007)(82740400003)(4326008)(6496006)(86362001)(82310400003)(956004)(33716001)(6636002)(356005)(6486002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 03:18:18.9870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9cae26-7d9c-4ae8-41cd-08d8e82a2598
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6152
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 carsten.haitzler@foss.arm.com, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 10:55:21AM +0000, Brian Starkey wrote:
> (Adding back James again - did you use get_maintainer.pl?)
> 
> On Thu, Mar 11, 2021 at 12:08:46PM +0000, carsten.haitzler@foss.arm.com wrote:
> > From: Carsten Haitzler <carsten.haitzler@arm.com>
> > 
> > When setting up a readback connector that writes data back to memory
> > rather than to an actual output device (HDMI etc.), rounding was set
> > to round. As the DPU uses a higher internal number of bits when generating
> > a color value, this round-down back to 8bit ended up with everything
> > being off-by one. e.g. #fefefe became #ffffff. This sets
> 
> Perhaps overly pedantic, but now we've tracked down what was actually
> happening I think we can be more precise here. Not _everything_ is
> off-by-one, it's just rounding in the standard sense - if the most
> significant bit-to-be-discarded is set, the value is rounded up to
> minimise the absolute error introduced by bit-depth reduction.
> 
> > rounding to "round-down" so things end up correct by turning on the LW_TRC
> > round down flag.
> 
> Can we call it "truncate" rather than round down? I think it makes
> "TRC" a bit more understandable.
> 
> > 
> > Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> > ---
> >  drivers/gpu/drm/arm/display/komeda/d71/d71_component.c | 7 ++++++-
> >  drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h      | 1 +
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> > index 8a02ade369db..e97acc5519d1 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> > @@ -468,7 +468,12 @@ static void d71_wb_layer_update(struct komeda_component *c,
> >  	struct komeda_layer_state *st = to_layer_st(state);
> >  	struct drm_connector_state *conn_st = state->wb_conn->state;
> >  	struct komeda_fb *kfb = to_kfb(conn_st->writeback_job->fb);
> > -	u32 ctrl = L_EN | LW_OFM, mask = L_EN | LW_OFM | LW_TBU_EN;
> > +	/* LW_TRC sets rounding to truncate not round which is needed for
> > +	 * the output of writeback to match the input in the most common
> > +	 * use cases like RGB888 -> RGB888, so set this bit by default
> > +	 */
> 
> Hm, not sure why this file uses "net/" style comments, but as you
> said, this is in-keeping with the rest of the file, so meh :-)
> 
> > +	u32 ctrl = LW_TRC | L_EN | LW_OFM;
> > +	u32 mask = LW_TRC | L_EN | LW_OFM | LW_TBU_EN;
> 
> If you were aiming for matching register order, this should be:
> 
>     L_EN | LW_TRC | LW_OFM | LW_TBU_EN
> 
> 
> I think it'd be nice to have the exact behaviour in the commit
> message, but either way this seems OK as a pragmatic fix so:
> 
> Reviewed-by: Brian Starkey <brian.starkey@arm.com>
> 
> Thanks,
> -Brian
> 
> >  	u32 __iomem *reg = c->reg;
> >  
> >  	d71_layer_update_fb(c, kfb, st->addr);
> > diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> > index e80172a0b320..a8036689d721 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> > +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_regs.h
> > @@ -321,6 +321,7 @@
> >  #define LAYER_WR_FORMAT		0x0D8
> >  
> >  /* Layer_WR control bits */
> > +#define LW_TRC			BIT(1)
> >  #define LW_OFM			BIT(4)
> >  #define LW_LALPHA(x)		(((x) & 0xFF) << 8)
> >  #define LW_A_WCACHE(x)		(((x) & 0xF) << 28)
> > -- 
> > 2.30.0
> > 

Acked-by: James Qian Wang <james.qian.wang@arm.com>

Thanks
James

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
