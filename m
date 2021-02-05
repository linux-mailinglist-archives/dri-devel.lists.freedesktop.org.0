Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C098310706
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C016E93E;
	Fri,  5 Feb 2021 08:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332006E93E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wdN7EU+R54qmLVrFxh0H6JxM1k0GTlrrnYzl5eP6dw=;
 b=29nGNJANMmA1ipvyhSEIf2GQBqCMX9M9eOSXujCqB03L4K96MalfPhjAXGxbpGvFgWvb+0BTgv3p0/FESwmHOtJnEmX+9TvewCtya1Pos/I7LGsxkov+CAe3+WM6f05YqLnT57k4I9Pu9RyG2XXnFNjRC3IFk4tdcmKjXLa7rZU=
Received: from MR2P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::35) by
 DB6PR0801MB2120.eurprd08.prod.outlook.com (2603:10a6:4:3c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.23; Fri, 5 Feb 2021 08:50:46 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::d7) by MR2P264CA0023.outlook.office365.com
 (2603:10a6:500:1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19 via Frontend
 Transport; Fri, 5 Feb 2021 08:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 5 Feb 2021 08:50:44 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71");
 Fri, 05 Feb 2021 08:50:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04bff39a8b856139
X-CR-MTA-TID: 64aa7808
Received: from 328faf76f3b4.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22DC94B2-530B-4CB9-8A01-0EB7674C07DE.1; 
 Fri, 05 Feb 2021 08:50:38 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 328faf76f3b4.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Feb 2021 08:50:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLLh7U3L359ZorzESDX26LHoQirLbTkQHCUQafUP6U11H28l09N5hj2Yva+6A82NttOQWHxildNnONVoHhKcJbrOGjOA7trl9Mxam3TjmhnWLB1BrIYTziLiXiiTUTTwHaQw7Rv0VA2YXDnn/uZlBPgBH2OvTWytOAbhlKFonFPiqlTZ29k1VrvSDgMlxn2Rd6Q7p0WyzuGHQZPLD/dI0N68jArU1xITVea25pK93twfq/HRTRwJnpT3pQ8CYWYXhkZd0yP9U26VeJpaGNVyyZK+TmUTEesXFOjlLUnXaQtVA5EgA0D9/VnkGPCrio1a58PRFVRYthmKwHzPUgv4IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wdN7EU+R54qmLVrFxh0H6JxM1k0GTlrrnYzl5eP6dw=;
 b=FP0chKsPTBkiuXwLgexf93PYFMTQw5GgBLh9lqmrKoJXjjoIQn+pwgVXDFCaKb73ZBFp5My2PXE1km0mz3LV22vdxpfTEyD27pJj/zyfqj3q5NhUzrc0TVzXXj4wY4VDr43PToIUnfVJWsAmpiWBh74rMXAVP7TC4nfnGGpuUnAbjSl8Vvbgo0O5+0zNBPEiDG+uzA3350LAahynv3gGM4HxT3ppGP0wB01+c4M5SLIwYc99a6/D0giR/U5ytbI31tAdpgmducbBrbWh75xplxltnNinfNxoBc13Bky74LwsmEsTPDpYys/MD1mdOBVov8bTqrbVu+CoSq3X/Pxtjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wdN7EU+R54qmLVrFxh0H6JxM1k0GTlrrnYzl5eP6dw=;
 b=29nGNJANMmA1ipvyhSEIf2GQBqCMX9M9eOSXujCqB03L4K96MalfPhjAXGxbpGvFgWvb+0BTgv3p0/FESwmHOtJnEmX+9TvewCtya1Pos/I7LGsxkov+CAe3+WM6f05YqLnT57k4I9Pu9RyG2XXnFNjRC3IFk4tdcmKjXLa7rZU=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from VI1PR0802MB2527.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::13) by VE1PR08MB4829.eurprd08.prod.outlook.com
 (2603:10a6:802:a8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 5 Feb
 2021 08:50:35 +0000
Received: from VI1PR0802MB2527.eurprd08.prod.outlook.com
 ([fe80::c58a:f891:1edf:b0ce]) by VI1PR0802MB2527.eurprd08.prod.outlook.com
 ([fe80::c58a:f891:1edf:b0ce%7]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 08:50:34 +0000
Date: Fri, 5 Feb 2021 16:50:26 +0800
From: James Qian Wang <james.qian.wang@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/komeda: Fix bit check to import to value of proper
 type
Message-ID: <20210205085026.GA1419308@jamwan02-TSP300>
References: <20210204131102.68658-1-carsten.haitzler@foss.arm.com>
 <cd3022d0-d9fc-fd42-105b-5bd74346a41f@arm.com>
Content-Disposition: inline
In-Reply-To: <cd3022d0-d9fc-fd42-105b-5bd74346a41f@arm.com>
X-Originating-IP: [203.126.0.113]
X-ClientProxiedBy: SG2PR0401CA0023.apcprd04.prod.outlook.com
 (2603:1096:3:1::33) To VI1PR0802MB2527.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.113) by
 SG2PR0401CA0023.apcprd04.prod.outlook.com (2603:1096:3:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 08:50:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c55615e5-f44f-4a27-8c6b-08d8c9b32006
X-MS-TrafficTypeDiagnostic: VE1PR08MB4829:|DB6PR0801MB2120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB21201D1A0D74FC3130D2EFEDB3B29@DB6PR0801MB2120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: t9VTBKZr5qWqfpgP4zd8FyKvbWOvHg0awLJg50EWg88dWwvZayO18BSaslb8kJvHCEvS3gArXF4znO+u7qomaXb9ARSXotXzpg0lJb5faOBdVRmYsXYZPIpck6J96Eho/akPpG/KATRdWpOiQoM+lrkoNSgBLZ1QRU/wm3jp2gakNRSV/tiM9RT6TcbH3mvhjz2mtuRXdWVaKIrzZz56wIi2PpYwJjHbBfZ8QNKmHGnL6NzHCDgCCYtkQEOFcF1mizJJAR2XJ9sDkfZewB9p/RnrU10RtXOEtrZjICyy+3GNAfDcDkX2IgBGTBxaV7Mbg5AUpbFhCI4V7q255XCAO4f7f7VpamK4se5dvhzb17MYhD5MeKNtB1wf2M0wVupsNuSQVAzD2jBGLz0b+KnBi4xRu6DlZfypQC/aQ4wa14PBe/yq86fWJXC4ZiGjY2sxyWOPDxh4lWSZerVfxTQAU5DsmoBNgG0k1GW8Jy/2RdYE+PwRZBLMVKgiK2+6qIwEoi1X2WGNkq+uNnyx+HF2hg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI1PR0802MB2527.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(6862004)(53546011)(26005)(33656002)(8936002)(66556008)(2906002)(6486002)(6636002)(5660300002)(6666004)(956004)(86362001)(66476007)(478600001)(6496006)(316002)(33716001)(8676002)(52116002)(54906003)(186003)(16526019)(66946007)(1076003)(9686003)(4326008)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xhN19op3Kny9n35MsA3YXU5BPNzfcBiMArMrIPeT4+yIw1RxexSQDrT7/u87?=
 =?us-ascii?Q?EJpW+G2vsTfyxT+M2dEJfidCLev+QA6IOTAMMvLTJHaIg4B4wSQ5srV6etZx?=
 =?us-ascii?Q?9auNU32hnZYaMZVCKVvKVeItMS24Nnx29mIYgLvrLLd4w+0Frpa4AX7LrR9p?=
 =?us-ascii?Q?4w/HRzknpgXXpRbGp/nB6VfxYV9rFUl8kAICaMq8URW93RtdsgXYxBD8CwsD?=
 =?us-ascii?Q?r5kdLtq7PaIZqJ0mSF1k+nsuLWsB0xeMkJI8Yr2v+ZoKPWtGZM/8q1LHVHt6?=
 =?us-ascii?Q?WJjYQ35/3ukNvpANrNpz9WoQj0a5I/K5y/NjVAjeNuP9pFV2pFWyOT483fd+?=
 =?us-ascii?Q?cdmYvP9qjMAwfIbwLXaIm2V5ABT+5G8PN5zPdnTwE7uCGQJmkEE1qkmhaule?=
 =?us-ascii?Q?IbaMb+CvQrWSzQiv3wtiv5Nhi3FVlhLzGPpKgJcEfCDwBlumOzJthXF3ynGX?=
 =?us-ascii?Q?dP5ipDK2r0qKkcfWlGqmPeN4t+rx+x27pjnbe337S0eyM+OH12yoZcS0ourI?=
 =?us-ascii?Q?PWPxt1q3k/UW19ecinHLE2B0IvzrxNnZgsSiqvW1RLzw5W0b4cvUcI7Xbyy9?=
 =?us-ascii?Q?0B6zGliWuzEVHrCsB9pHvOMO05ftF7o42mkcsJvTzSHTFifsstMn+JoIij1k?=
 =?us-ascii?Q?E2merF2aBIhhNhaVUWwha2fXIHvCCsuERSKybJVxx/jdTLdNzR9aiKPTrLnv?=
 =?us-ascii?Q?qiTFun6RRrajWoghrLHTD6ITrVwfTuyAg2oXuWMoo6nUQoKluxs2PcMHD+jA?=
 =?us-ascii?Q?z/CdSfljWTI9Uv2TZquH4u5PBsWD4oLZbFmL4UUUUmUIBy+ZxjxK+/ZAFFut?=
 =?us-ascii?Q?unHcxT9IHr7C4H2vfBJGiF24CWZ3Izb5g/K0ryl/JtZmnDw+H0CGkpfH3eer?=
 =?us-ascii?Q?+ZSvwwgzVMTCqbb3EoWpWulTfgi3W/bLEFJzTzUEsKtkL1r9FaWj+PytXlAj?=
 =?us-ascii?Q?FnsAp4JRMsP2aL9PqfeEI6B+F9ybSTtKNWOP8JbAzZYE5J9wsn/RzUZQtfOQ?=
 =?us-ascii?Q?c3D3wITnjNgRJq4qkGFi+RoiO8G9GuKiurmSUyCcExqprrFJCblgXekucazp?=
 =?us-ascii?Q?MYcLwOG5jvdQ9l4Ilfnx/qhqq2VEbNQM2Z3bwrwfoqV4pwtwzHQ3tg+jW8cw?=
 =?us-ascii?Q?B1FwB/wdDm4wComp7+KZdcX/Q1xEeQ2wxGfSmNx5zY9fR18KZGkTIbJB3h1v?=
 =?us-ascii?Q?r3WMgMYQd0wX/ah4GNbYUOFLVkXDkxw9dD5He1iyf2PTJ2HUq0u9BuSJMzIg?=
 =?us-ascii?Q?p62pV5Fz1AUXRd7ZAXeIFo3G4deXIuR7LNv8k5WBptPakkjRvcdKiPDd0ORV?=
 =?us-ascii?Q?KdVdBdVA2Z/mio++YJbL8f/Q?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4829
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ae72b26b-0192-4325-8d16-08d8c9b31919
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akp6YmCMdCjIMnmWYs4rxxF6bniD5pO6iDsIXgEPE3gP2eYHssu6pfngj/2IGusn9EcI5MDxlgDYkax3gMikmXPOT1JgheSgw37MN/AJwI5BMFwsBWO9fmg3hceFcRcxAlBR7nXtQI2p1+s9khUyYhPqqjNDbVzBx2QFBOsltNg4r1NwEOMdPo+dAhElMKRT6fWM75anG44r5Drv19An4Wleqt+n8xx8M+S3+FAn9vLuIbDD9m0toKMLcWr0xrUuchf89RR2StcL0P4io1OHfQGf6e40WrksKvTZwdeSKt1T1qdZigGr1F9drkC65w1gXbpyLdeAPPf6PtvIzcNubvtyzNS48cd4a2HBkHrskCF529zL0X93gq9TRBaFQY0ebtoYXdGIkvT21gLK88utnn/FB83wfzRN8XV5EFhY1OSGWvH0RSZPwY7w3HReNuSOVbuH1NCCLJz2oERxTHvqTW/PYnuzhh78h48qEAh5qpNkLoS88IDMPz9ej8Vcv6nsmmhdbTk67wqwF2NYttPuE1/dND4V2/1LzucSRRUy9J7zK6ouEDbz3UEYBT0wFEBqVk6/5XRLkb1bJPGpsJUQtHjacafJ2F1WgQ/Qd1VePo79HJ7yrSYr6UBOcE4D7qW9oBmNvkrnRa5r8EYyidcUVQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(7916004)(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966006)(36840700001)(36860700001)(86362001)(6496006)(81166007)(16526019)(82310400003)(47076005)(54906003)(8936002)(316002)(70586007)(53546011)(336012)(186003)(33656002)(6666004)(6636002)(83380400001)(70206006)(2906002)(6486002)(1076003)(33716001)(478600001)(356005)(5660300002)(6862004)(8676002)(9686003)(82740400003)(956004)(26005)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:50:44.4842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c55615e5-f44f-4a27-8c6b-08d8c9b32006
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2120
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
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 Carsten Haitzler <carsten.haitzler@arm.com>, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, carsten.haitzler@foss.arm.com, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 08:29:32AM +0000, Steven Price wrote:
> +CC the other Komeda maintainers
> 
> On 04/02/2021 13:11, carsten.haitzler@foss.arm.com wrote:
> > From: Carsten Haitzler <carsten.haitzler@arm.com>
> > 
> > Another issue found by KASAN. The bit finding is buried inside the
> > dp_for_each_set_bit() macro (that passes on to for_each_set_bit() that
> > calls the bit stuff. These bit functions want an unsigned long pointer
> > as input and just dumbly casting leads to out-of-bounds accesses.
> > This fixes that.
> > 
> > Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
> 
> Looks fine to me:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
>

Thank you for the patch.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>

> > ---
> >   .../drm/arm/display/include/malidp_utils.h    |  3 ---
> >   .../drm/arm/display/komeda/komeda_pipeline.c  | 16 +++++++++++-----
> >   .../display/komeda/komeda_pipeline_state.c    | 19 +++++++++++--------
> >   3 files changed, 22 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/display/include/malidp_utils.h b/drivers/gpu/drm/arm/display/include/malidp_utils.h
> > index 3bc383d5bf73..49a1d7f3539c 100644
> > --- a/drivers/gpu/drm/arm/display/include/malidp_utils.h
> > +++ b/drivers/gpu/drm/arm/display/include/malidp_utils.h
> > @@ -13,9 +13,6 @@
> >   #define has_bit(nr, mask)	(BIT(nr) & (mask))
> >   #define has_bits(bits, mask)	(((bits) & (mask)) == (bits))
> > -#define dp_for_each_set_bit(bit, mask) \
> > -	for_each_set_bit((bit), ((unsigned long *)&(mask)), sizeof(mask) * 8)
> > -
> >   #define dp_wait_cond(__cond, __tries, __min_range, __max_range)	\
> >   ({							\
> >   	int num_tries = __tries;			\
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> > index 719a79728e24..06c595378dda 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> > @@ -46,8 +46,9 @@ void komeda_pipeline_destroy(struct komeda_dev *mdev,
> >   {
> >   	struct komeda_component *c;
> >   	int i;
> > +	unsigned long avail_comps = pipe->avail_comps;
> > -	dp_for_each_set_bit(i, pipe->avail_comps) {
> > +	for_each_set_bit(i, &avail_comps, 32) {
> >   		c = komeda_pipeline_get_component(pipe, i);
> >   		komeda_component_destroy(mdev, c);
> >   	}
> > @@ -247,6 +248,7 @@ static void komeda_pipeline_dump(struct komeda_pipeline *pipe)
> >   {
> >   	struct komeda_component *c;
> >   	int id;
> > +	unsigned long avail_comps = pipe->avail_comps;
> >   	DRM_INFO("Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
> >   		 pipe->id, pipe->n_layers, pipe->n_scalers,
> > @@ -258,7 +260,7 @@ static void komeda_pipeline_dump(struct komeda_pipeline *pipe)
> >   		 pipe->of_output_links[1] ?
> >   		 pipe->of_output_links[1]->full_name : "none");
> > -	dp_for_each_set_bit(id, pipe->avail_comps) {
> > +	for_each_set_bit(id, &avail_comps, 32) {
> >   		c = komeda_pipeline_get_component(pipe, id);
> >   		komeda_component_dump(c);
> > @@ -270,8 +272,9 @@ static void komeda_component_verify_inputs(struct komeda_component *c)
> >   	struct komeda_pipeline *pipe = c->pipeline;
> >   	struct komeda_component *input;
> >   	int id;
> > +	unsigned long supported_inputs = c->supported_inputs;
> > -	dp_for_each_set_bit(id, c->supported_inputs) {
> > +	for_each_set_bit(id, &supported_inputs, 32) {
> >   		input = komeda_pipeline_get_component(pipe, id);
> >   		if (!input) {
> >   			c->supported_inputs &= ~(BIT(id));
> > @@ -302,8 +305,9 @@ static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
> >   	struct komeda_component *c;
> >   	struct komeda_layer *layer;
> >   	int i, id;
> > +	unsigned long avail_comps = pipe->avail_comps;
> > -	dp_for_each_set_bit(id, pipe->avail_comps) {
> > +	for_each_set_bit(id, &avail_comps, 32) {
> >   		c = komeda_pipeline_get_component(pipe, id);
> >   		komeda_component_verify_inputs(c);
> >   	}
> > @@ -355,13 +359,15 @@ void komeda_pipeline_dump_register(struct komeda_pipeline *pipe,
> >   {
> >   	struct komeda_component *c;
> >   	u32 id;
> > +	unsigned long avail_comps;
> >   	seq_printf(sf, "\n======== Pipeline-%d ==========\n", pipe->id);
> >   	if (pipe->funcs && pipe->funcs->dump_register)
> >   		pipe->funcs->dump_register(pipe, sf);
> > -	dp_for_each_set_bit(id, pipe->avail_comps) {
> > +	avail_comps = pipe->avail_comps;
> > +	for_each_set_bit(id, &avail_comps, 32) {
> >   		c = komeda_pipeline_get_component(pipe, id);
> >   		seq_printf(sf, "\n------%s------\n", c->name);
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > index e8b1e15312d8..176cdf411f9f 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
> > @@ -1232,14 +1232,15 @@ komeda_pipeline_unbound_components(struct komeda_pipeline *pipe,
> >   	struct komeda_pipeline_state *old = priv_to_pipe_st(pipe->obj.state);
> >   	struct komeda_component_state *c_st;
> >   	struct komeda_component *c;
> > -	u32 disabling_comps, id;
> > +	u32 id;
> > +	unsigned long disabling_comps;
> >   	WARN_ON(!old);
> >   	disabling_comps = (~new->active_comps) & old->active_comps;
> >   	/* unbound all disabling component */
> > -	dp_for_each_set_bit(id, disabling_comps) {
> > +	for_each_set_bit(id, &disabling_comps, 32) {
> >   		c = komeda_pipeline_get_component(pipe, id);
> >   		c_st = komeda_component_get_state_and_set_user(c,
> >   				drm_st, NULL, new->crtc);
> > @@ -1287,7 +1288,8 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
> >   	struct komeda_pipeline_state *old;
> >   	struct komeda_component *c;
> >   	struct komeda_component_state *c_st;
> > -	u32 id, disabling_comps = 0;
> > +	u32 id;
> > +	unsigned long disabling_comps;
> >   	old = komeda_pipeline_get_old_state(pipe, old_state);
> > @@ -1297,10 +1299,10 @@ bool komeda_pipeline_disable(struct komeda_pipeline *pipe,
> >   		disabling_comps = old->active_comps &
> >   				  pipe->standalone_disabled_comps;
> > -	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%x.\n",
> > +	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, disabling_comps: 0x%lx.\n",
> >   			 pipe->id, old->active_comps, disabling_comps);
> > -	dp_for_each_set_bit(id, disabling_comps) {
> > +	for_each_set_bit(id, &disabling_comps, 32) {
> >   		c = komeda_pipeline_get_component(pipe, id);
> >   		c_st = priv_to_comp_st(c->obj.state);
> > @@ -1331,16 +1333,17 @@ void komeda_pipeline_update(struct komeda_pipeline *pipe,
> >   	struct komeda_pipeline_state *new = priv_to_pipe_st(pipe->obj.state);
> >   	struct komeda_pipeline_state *old;
> >   	struct komeda_component *c;
> > -	u32 id, changed_comps = 0;
> > +	u32 id;
> > +	unsigned long changed_comps;
> >   	old = komeda_pipeline_get_old_state(pipe, old_state);
> >   	changed_comps = new->active_comps | old->active_comps;
> > -	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, changed: 0x%x.\n",
> > +	DRM_DEBUG_ATOMIC("PIPE%d: active_comps: 0x%x, changed: 0x%lx.\n",
> >   			 pipe->id, new->active_comps, changed_comps);
> > -	dp_for_each_set_bit(id, changed_comps) {
> > +	for_each_set_bit(id, &changed_comps, 32) {
> >   		c = komeda_pipeline_get_component(pipe, id);
> >   		if (new->active_comps & BIT(c->id))
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
