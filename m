Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696B1E236A
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 15:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6F689C1B;
	Tue, 26 May 2020 13:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50074.outbound.protection.outlook.com [40.107.5.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93B389C09
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETYQ01IA72tQX+TrM/6OqECCtKKfPzv8aeJkYQ57+V8=;
 b=PhWuMUtHgW4Z8XtslC5UXZAkilhQZ7LYZz55lfNyRx3J9wOwMbhIiihlZNaMSfFChjCCtomCbxcbR258hXpfSVHTvZDlaObLKwGtpG8d9OhpH9AHprJeE9EsnfX1H9XKPzu3L+Mwdfqsv4WT61ZwtbkAsIDkrAhC3fQ9bcrEO6Y=
Received: from DB3PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:8::20) by
 DBBPR08MB4267.eurprd08.prod.outlook.com (2603:10a6:10:cb::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Tue, 26 May 2020 13:53:14 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::bf) by DB3PR08CA0007.outlook.office365.com
 (2603:10a6:8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 26 May 2020 13:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Tue, 26 May 2020 13:53:14 +0000
Received: ("Tessian outbound 444e8e881ac1:v57");
 Tue, 26 May 2020 13:53:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2917d9094306c03e
X-CR-MTA-TID: 64aa7808
Received: from 95ec89f95588.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 341C6F0B-5BB6-4DC4-8569-BF524D0EDD40.1; 
 Tue, 26 May 2020 13:53:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95ec89f95588.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 May 2020 13:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLa7NRHQJQQUVeGrc5YBzSz14gjA+qjg9cknLty3TZpWUGDkLztNhABGdvpO/4H+wB/JoLqRCmxlrzYA44xsE9tB60BUIAfUgvce++1s6iJ0B1PvFKUQ7ydRIJsdKDdbsgBla54/n9T/cIHX/sERk8Ky2QM3i7ESd8EDj0gi9WN0QkUc9Yav1kgGXMwAJgCuvHRbYzhABMMIkrJ1jvGFkF2hJM0UD/ZvYsC1qHCYJw/3sjFlIqMWRCCniunKluiu6tmOZXyyzODSRZV3ZWnj+Wie3IkA4quqSoULvtx2PtDXISIiMz8s5Si0BETwzE+cmC0MFktI6q8dVR4C7QW7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETYQ01IA72tQX+TrM/6OqECCtKKfPzv8aeJkYQ57+V8=;
 b=WgOIE48n1IAJtTIyj3okmG91UhrIIrTkHiSVIKrCaPwHnO9eByQ9LpLKenNNo7BKpgQefOw7Pl5Zf0INV4tPqcu+XyofmGi68iObvdTQTLOhKeozAtmUFDDce3MNfVAJ1fJz3jWt5MFRxedXz0JWSKas3zUGWN15huq7HzGQh2GJLN2e6YOWlGvBqJUhB15Hnygf1ITLlnrSlM45vOx5K1L+xXi07lCOP/Cd8uqRKBvoPc3P1VlpuGq4FzjzazTyjov/suaBXtVZkQe4klLlyC3K/vIEvzM8RDYROUuDdG4VjF94vtxfrk12pnpy4mrKnIq+A5jJQLaFXoRbPq03BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETYQ01IA72tQX+TrM/6OqECCtKKfPzv8aeJkYQ57+V8=;
 b=PhWuMUtHgW4Z8XtslC5UXZAkilhQZ7LYZz55lfNyRx3J9wOwMbhIiihlZNaMSfFChjCCtomCbxcbR258hXpfSVHTvZDlaObLKwGtpG8d9OhpH9AHprJeE9EsnfX1H9XKPzu3L+Mwdfqsv4WT61ZwtbkAsIDkrAhC3fQ9bcrEO6Y=
Authentication-Results-Original: kwiboo.se; dkim=none (message not signed)
 header.d=none;kwiboo.se; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2827.eurprd08.prod.outlook.com (2603:10a6:7:37::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Tue, 26 May 2020 13:52:21 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::e0ed:ba93:1a15:ba08]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::e0ed:ba93:1a15:ba08%3]) with mapi id 15.20.3021.026; Tue, 26 May 2020
 13:52:21 +0000
Date: Tue, 26 May 2020 14:52:19 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
Message-ID: <20200526135219.eu32pqvxfocmoovk@DESKTOP-E1NTVVP.localdomain>
References: <20200422111349.1632-1-ben.davis@arm.com>
 <20200506144126.GB13535@arm.com>
 <20200515133712.l5vaxnye3qypkah2@DESKTOP-E1NTVVP.localdomain>
 <504d071a-50c8-2bb9-c9e1-2cbe65ba6380@kwiboo.se>
Content-Disposition: inline
In-Reply-To: <504d071a-50c8-2bb9-c9e1-2cbe65ba6380@kwiboo.se>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0336.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::36) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0336.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 13:52:20 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc354e78-3d57-48bf-b18b-08d8017c2307
X-MS-TrafficTypeDiagnostic: HE1PR08MB2827:|DBBPR08MB4267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB426724E05DDED970E83AA11DF0B00@DBBPR08MB4267.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 31kKkX3+/E2qw4+tonI2Gl/QF39nWapa3yG1FzI94DfVd/beODE0sdkvykSnBr/tluhbIbCDqbAtn4N5K8CWE2FiFMG5IkagFlLU+1Bz69v7xioG3JUMSDHWxtYkkaUxhMNtRijYD+zSoIbH6GVPmlH9pBlrXbHvhwPZM4jb2GWF4kjSViax9UOGfn4PuNztZkZSR27b/BJhhE7kvZW46Nbit3+CRenYrXih4rcJPC6FNqAHlEv32hhVwmGZotTpT4LU8Bbcw5wX+ELyYoqJRjcE6CrlSQLwxXN2gRLFyaaaigbL1VMsxtTt9UleTZbZiJcWKeRy2hIht0BpP2LYrIlf9X7qxD1tWJxohSXKPJM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(66946007)(66476007)(66556008)(316002)(8676002)(5660300002)(9686003)(55016002)(8936002)(6506007)(4326008)(86362001)(2906002)(186003)(26005)(956004)(53546011)(44832011)(1076003)(478600001)(6916009)(52116002)(966005)(16526019)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: RWwXeOzLr/Jw7wSZzGclYPqYq6jr0swR2vqrmrKdZ1B1HAW2Wzg9EON/iJq+z9/i0ObfwR7d63Ke9QcXiZG0kJ5qjy4hIp51A1AzjM50oFU6ntEul8GZdF+aZyH/om5QMC7hAi4F49waC9pe04mwKWVCUOLAixNpJPXTuCLTGtsAF1nMuo1+kp1BwnyDJyZ62RXepbAYAcs66S/IX1olyTYfewo1WwLMXmayNzGntLhIDYn9nz1CtyUuLLhWh5a1nE6ntlGOptzWv//FYhf1pVWnub1koVOohBDLgknv9VqZ4elexYN40ZEkQSXzQTAEAgkmFLIP3pJLCKTRGUBpZ3nPLL+x1fUPXN9XybyRtkcZI2zKvSRyX9j4q2zwPU3L/1pHbpUjMCgW0vIR8BV7s1UMm7awHOy4h3bVLY2LprTVv1ctT98OMBnhBwBJb4laJRDmiKfA4ngvPfzFp2psXma0LnKkkSymprJ2HVKt9SSNG6pPiUabIZHD+tRMBzhd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2827
Original-Authentication-Results: kwiboo.se; dkim=none (message not signed)
 header.d=none;kwiboo.se; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(478600001)(966005)(8936002)(70586007)(336012)(316002)(47076004)(70206006)(5660300002)(82740400003)(7696005)(16526019)(26005)(81166007)(356005)(82310400002)(8676002)(6862004)(1076003)(4326008)(53546011)(6506007)(44832011)(956004)(55016002)(86362001)(9686003)(2906002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b5dca37-6bf4-4f8c-66af-08d8017c02c0
X-Forefront-PRVS: 041517DFAB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: slTf/oiGmnGrSJHyQfeG9kja9nYqG9jgGxwDgT5bWxZwxHVBTAWrZwxaRV1ByDTxiZvKelJoS/o3qy+QkyW3H7qWdMw15SNa8DzepQWPdpWDLZvnveaOb4/LIKNvGTllpqK23870CIXlyucp4DU+ix6jWAVkUU17MGrPsieWk2qLr4nqRYaqfYBBape31kYxnrvu8MF/t0IbgupYqqrAiy1Mjrls7v/RZM4F//nSstnKLqK6aYCHIAFTDScE149ccWoT3TQtxcwbriot8jN/0B3+ZMtRJKWlDPifYLAgx0iAECKtyQnLMp7IY4sZHS/MKTXg9BNOdSfi5GD+C3jriozQjCdt51JT4CWaUBpoHUrIOMYW4TX9Su5ebEZ+f1JN7mL4QF5jZpbtbaN8LthmcSi3L6aGBYdoRohTVKBce218MZZDAVn+obasi+PEseVs
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 13:53:14.8139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc354e78-3d57-48bf-b18b-08d8017c2307
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4267
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, nd@arm.com, matteo.franchin@arm.com,
 Ben Davis <ben.davis@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonas,

On Mon, May 25, 2020 at 11:08:11AM +0000, Jonas Karlman wrote:
> Hi,
> 
> On 2020-05-15 15:37, Brian Starkey wrote:
> > Hi Ben,
> > 
> > On Wed, May 06, 2020 at 03:41:26PM +0100, Ben Davis wrote:
> >> Hi all, any feedback on this patch?
> >> Thanks, Ben
> >> On Wed, Apr 22, 2020 at 12:13:49PM +0100, Ben Davis wrote:
> >>> DRM_FORMAT_NV15 is a 2 plane format suitable for linear and 16x16
> >>> block-linear memory layouts. The format is similar to P010 with 4:2:0
> >>> sub-sampling but has no padding between components. Instead, luminance
> >>> and chrominance samples are grouped into 4s so that each group is packed
> >>> into an integer number of bytes:
> >>>
> >>> YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
> >>>
> >>> The '15' suffix refers to the optimum effective bits per pixel which is
> >>> achieved when the total number of luminance samples is a multiple of 8.
> >>>
> >>> Q410 and Q401 are both 3 plane non-subsampled formats with 16 bits per
> >>> component, but only 10 bits are used and 6 are padded. 'Q' is chosen
> >>> as the first letter to denote 3 plane YUV444, (and is the next letter
> >>> along from P which is usually 2 plane).
> >>>
> >>> Signed-off-by: Ben Davis <ben.davis@arm.com>
> > 
> > The descriptions match my understanding of the formats and the
> > format_info struct, so feel free to add my r-b:
> > 
> > Reviewed-by: Brian Starkey <brian.starkey@arm.com>
> > 
> > Can anyone else pass comment on the approach and/or naming? I feel
> > like we should have some non-Arm eyes on this before we merge it.
> 
> This pixel format seem to match the memory layout used for 10-bit 4:2:0 by the
> Rockchip Video Decoder, for the rkvdec a 4:2:2 format is also needed (maybe NV20?).
> 
> From what I can tell the rockchip specific pixel format has previously been submitted in [1]
> and GStreamer use NV12_10LE40 (fourcc RK20) for this pixel format.
> 
> [1] https://patchwork.freedesktop.org/patch/276029/
> 

Yeah you're right, this is the same as the Rockchip version. I see
Randy's submission has `block_w = { 4, 2, 0 }`... more on that below.

The comment on block_w says "in pixels" - but what's a pixel in a
subsampled chroma plane? For a 2-plane 4:2:0 format, is one pair of
chroma samples a single pixel, or one pair of chroma samples is two
pixels?

Looks like Randy assumed the former and us the latter.

> > 
> > Thanks,
> > -Brian
> > 
> >>> ---
> >>>  drivers/gpu/drm/drm_fourcc.c  | 12 ++++++++++++
> >>>  include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
> >>>  2 files changed, 36 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> >>> index b234bfaeda06..0c0a65481afd 100644
> >>> --- a/drivers/gpu/drm/drm_fourcc.c
> >>> +++ b/drivers/gpu/drm/drm_fourcc.c
> >>> @@ -274,6 +274,18 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >>>  		{ .format = DRM_FORMAT_YUV420_10BIT,    .depth = 0,
> >>>  		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 2, .vsub = 2,
> >>>  		  .is_yuv = true },
> >>> +		{ .format = DRM_FORMAT_NV15,		.depth = 0,
> >>> +		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
> >>> +		  .block_w = { 4, 4, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> >>> +		  .vsub = 2, .is_yuv = true },
> 
> For a 4:2:0 format I wonder if the char_per_block value is correct for the second plane,
> using the following formula to calculate the pitch seem to result in only half expected width.
> Maybe .char_per_block { 5, 10, 0 } could be correct?
> 
> pitch = (width * char_per_block[1]) / block_w[1] / hsub
> 
> for 16x16 this would be
> 
> pitch[1] = (16 * 5) / 4 / 2 = 10 bytes
> vs
> pitch[1] = (16 * 10) / 4 / 2 = 20 bytes
> 
> height[1] = 16 / 2 = 8
> 

I've talked myself round in circles, I don't know what to think any
more.

drm_format_info_min_pitch() does:

pitch[1] = width * char_per_block[1] / (block_w[1] * block_h[1])

so:

pitch[1] = 16 * 5 / (4 * 1) = 20 bytes

which implies that it expects the subsampling to be baked in to the
block size, or that it just doesn't consider subsampling and so is
broken, or that it expects `width` to be pre-divided.


Looking at DRM_FORMAT_NV12, it has cpp = {1, 2, 0}, which means it
considers a single pair of chromas to be a single pixel - which is
in-line with Randy.

So, I think our definition is inconsistent here. We should have
either:

block_w = { 4, 4, 0 }, char_per_block = { 5, 10, 0 }

or: 

block_w = { 4, 2, 0 }, char_per_block = { 5, 5, 0 }

Probably leaning more towards the { 4, 2, 0 } option, and with a big
question-mark over whether drm_format_info_min_pitch() is doing the
right thing.

Thanks,
-Brian

> 
> Regards,
> Jonas
> 
> >>> +		{ .format = DRM_FORMAT_Q410,		.depth = 0,
> >>> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> >>> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> >>> +		  .vsub = 0, .is_yuv = true },
> >>> +		{ .format = DRM_FORMAT_Q401,		.depth = 0,
> >>> +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> >>> +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> >>> +		  .vsub = 0, .is_yuv = true },
> >>>  	};
> >>>  
> >>>  	unsigned int i;
> >>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >>> index 8bc0b31597d8..232b9ad3534d 100644
> >>> --- a/include/uapi/drm/drm_fourcc.h
> >>> +++ b/include/uapi/drm/drm_fourcc.h
> >>> @@ -236,6 +236,12 @@ extern "C" {
> >>>  #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
> >>>  #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
> >>>  #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
> >>> +/*
> >>> + * 2 plane YCbCr
> >>> + * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
> >>> + * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
> >>> + */
> >>> +#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
> >>>  
> >>>  /*
> >>>   * 2 plane YCbCr MSB aligned
> >>> @@ -265,6 +271,24 @@ extern "C" {
> >>>   */
> >>>  #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
> >>>  
> >>> +
> >>> +/* 3 plane non-subsampled (444) YCbCr
> >>> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> >>> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> >>> + * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
> >>> + * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
> >>> + */
> >>> +#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
> >>> +
> >>> +/* 3 plane non-subsampled (444) YCrCb
> >>> + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> >>> + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> >>> + * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
> >>> + * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
> >>> + */
> >>> +#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
> >>> +
> >>> +
> >>>  /*
> >>>   * 3 plane YCbCr
> >>>   * index 0: Y plane, [7:0] Y
> >>> -- 
> >>> 2.24.0
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
