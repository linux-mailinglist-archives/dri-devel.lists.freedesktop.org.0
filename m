Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3721D4F5A
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 15:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824C6ECA7;
	Fri, 15 May 2020 13:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC176ECA5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR9lfAw+AJ/VbUKQBLYIv0uSZ9xdK7F7sBVqQs2F2VI=;
 b=2wjgKXFKLZljNTfL/CuKEDRZhLQ49O9wXXiQytVl/7lkSOC0utq49wNMXiRYu5Dhvv08xFprR8hJP4b4f7YN1PSHlS40HaRAaAGljInQMwP3jo+5GB15nFm2THr74Jtfw8w2oASAEOgABCEp+ScB5K56ePgZ7MzOnAHVMe1qQv0=
Received: from AM5PR0601CA0081.eurprd06.prod.outlook.com (2603:10a6:206::46)
 by DBBPR08MB4250.eurprd08.prod.outlook.com (2603:10a6:10:c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Fri, 15 May
 2020 13:37:23 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::5e) by AM5PR0601CA0081.outlook.office365.com
 (2603:10a6:206::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Fri, 15 May 2020 13:37:23 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Fri, 15 May 2020 13:37:23 +0000
Received: ("Tessian outbound e88319d7ccd0:v54");
 Fri, 15 May 2020 13:37:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1407ff5fb2924a8d
X-CR-MTA-TID: 64aa7808
Received: from 3e3a1cd96b95.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4CD5E440-8D4D-42EC-B52E-4FC695257B6D.1; 
 Fri, 15 May 2020 13:37:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e3a1cd96b95.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 May 2020 13:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRqwX3eOjqDQioBHyjYK5xTFCyQcmdRQ1KL6l/oItcoQW9fkr1v0d3BMysYnzo9j/QBY64TFxGraxT5KNy//nhzEWu/TAWdaC23U7/PnTD2QytyhftCYLnW8TTXTzdQ8o765H5C2dcNy5B6y1Nd1CjNWjlEUCLd8T0vt2e4qOFS8gFFjaIZLbUgZBR2usF5DRPGu5gtBYEi/iAyKmekARpN/hlKUtiyLnwuPU5ehUzzbc8n0iFX3lb/8Xz2RY7YeHvHwZ8+8s9y7dfS6+MvuCgpdWZ+j+5ipEB9ag5bPrBLggutfFr0InKegp/N3qLLz10pjyA1x5Z17wlELPZ3l7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR9lfAw+AJ/VbUKQBLYIv0uSZ9xdK7F7sBVqQs2F2VI=;
 b=K8TTYz7j1TVPmEBfZYgWj2/QQ2X97lWRRvMNVmGTnNjJdtiIycdAz+GADoj2yQqED9xBYoYv039IS1GcX//CfJN8+tWdVS2QuvNT4C+PMXp+p4GNdPEtJf3oOHt2OM7OXw5MZEpC5nIWGCrynY5RlvxSOKoxwDGS/ry5LCpzWaqjaFqegD9nVPiR61kj6wq+Y/L2w62pnFlTGiocSkZ6MSL7x+hxoIf7IjjsTI2PQwKuEd62IP91hOkmQknvXbcSNG+mTEvDwJljAf7qXOMPMNxMeosT4VWgXSXcxv6JBYUufOysvaVFtg4FO8vPwsEEuLMS9uFsf6cbeD0rym5LQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR9lfAw+AJ/VbUKQBLYIv0uSZ9xdK7F7sBVqQs2F2VI=;
 b=2wjgKXFKLZljNTfL/CuKEDRZhLQ49O9wXXiQytVl/7lkSOC0utq49wNMXiRYu5Dhvv08xFprR8hJP4b4f7YN1PSHlS40HaRAaAGljInQMwP3jo+5GB15nFm2THr74Jtfw8w2oASAEOgABCEp+ScB5K56ePgZ7MzOnAHVMe1qQv0=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.26; Fri, 15 May 2020 13:37:14 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::21af:7992:3558:1a80]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::21af:7992:3558:1a80%2]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 13:37:14 +0000
Date: Fri, 15 May 2020 14:37:12 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Ben Davis <ben.davis@arm.com>, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] drm: drm_fourcc: add NV15, Q410, Q401 YUV formats
Message-ID: <20200515133712.l5vaxnye3qypkah2@DESKTOP-E1NTVVP.localdomain>
References: <20200422111349.1632-1-ben.davis@arm.com>
 <20200506144126.GB13535@arm.com>
Content-Disposition: inline
In-Reply-To: <20200506144126.GB13535@arm.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::23) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20 via Frontend Transport; Fri, 15 May 2020 13:37:13 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce53fb08-dd8d-4ab0-1d50-08d7f8d5196e
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|HE1PR08MB2764:|DBBPR08MB4250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4250D38F8348A6A191B1CC16F0BD0@DBBPR08MB4250.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PCU9zv/akgUsRCijCuntBvSSkSKh8lw2ElfXwMYV/pUhw1h5yUE5gRgQmFw6DtsuWFhRLO6ZSgP36cwVSh5abs8P2l27ynwDyiPS/6sMK4HBmKCAjDWJQ1OyPbe2/Q6GGKwybuWgdgFzT92PcuhvasYV6q3ertyfSZ6wqLvSD8ezp1GxY9GJEOCsp6bsS3pxbV8kzwVjoyrao3KJwwqGQSc8U6PN1xCu+UdFGVhiPNYRcX4VQjnB9cDZfU6E1shi0rD+bPibVoq9wNvYf1ZcKiTlzPFG1vB4QqOempSc+KFpTCUHuG2O7f0JGHxjkwfqHVvLL2pvtRmBOUY7LNmN40vdJbzY+knNKmnOx4/wlkqLSo9CBOt+MYNcZy6HLRrh3/2IU/dg0olDhcqpXGAoYcp5/3pnoAh0atM8pKcvQPtp7BKenrx7DX5HV/E7Ud38
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(186003)(478600001)(2906002)(6506007)(7696005)(8936002)(5660300002)(86362001)(16526019)(26005)(66556008)(44832011)(8676002)(1076003)(4326008)(956004)(55016002)(9686003)(52116002)(316002)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: zW7XonS8J082Vo01qL38j0rNpMXhfWQtlR5HVE3YuckWg1+Dv2ojPLMyzCcReSA2h9H3PeGol+7glZGinTnvd/81A3tP+LtrEmvREp5Ztct6mJ9hyWzIhX11H+el244mAwWXtW6pd6dRHi7fhKGwUsLqvWOm2P/rhjq1jaL55nEyrQvp+w+TMMSf8qTrXPdFfIx+Vmwk2K1CXRo/qIHq9N0tbS7jRsns5f+GR4ElAoWpmurrAr7o+rGsuhuksbIjvT0YwAWwQSfFO8+yau3mrTzUvrhY0iP0l09jIpzcy8EUMnxtPMjt4aJeS/BUaqafV6QaZiRvr9mBWXwSAJGVyx4XgCUVCBXHgv6iKU7rOAVhKiEM510GRUVyTLtYabBHIWxRNrbWemZOvSS/W0C4Z5S2Bef8z3OF2dlmin1NNeKy2pl4k8hMCK6+roAOnSlzVzPVRqR3v49DFF3ONJneZDPYVRs1K04nP1jVeTNYsI3zWrbBKQcxQX91vA+6hZT1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966005)(44832011)(5660300002)(4326008)(2906002)(26005)(1076003)(6506007)(55016002)(7696005)(8936002)(478600001)(82740400003)(47076004)(86362001)(16526019)(70206006)(186003)(81166007)(82310400002)(356005)(8676002)(316002)(70586007)(956004)(36906005)(9686003)(336012);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5baeeb6f-206a-4e6d-9d1e-08d7f8d513ad
X-Forefront-PRVS: 04041A2886
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Xq3tA5x0EQwi4PbPYGAimAh5Ck1lOMxvOQkhkQgA5D6lsflbCT8MC44eIjATiPb0fbPUFNL875B1eZY3cXUMIlxTv3QrghAO9SYlZ5VgoKLX1qxhV5RZ+VcGYzzKOCvZrWykxg3JUMKeEXK6a/knsBqzmHj3vtNcAUh8Qtle7/bXojqoUaGCTK8s4QWOXpw7vX06HPxf4PqaQ5Eex0JZ7d7aBskphHXdYIGA7yHIllnx/TmYNDJgbfsLQx6A4fqqQVz5xYkNmeSRv38ddfn599XyKD16uLe6p32zfrxMILD0GTr4G21RKgMn5YJqrDlbYyjtVNMADUdBMrEdTFcubl/hJo0gIafkaUjUbSYFDVlvW+usLwWc8l8Q/lYF/7e137tuGz4GLNMEM72rjTZJgHe/Z01gdfn91DmC5hgWPKJ9W422VM46w5KgikvE/oJTNVgmdBxL/HGRyDDRkY0c4SCyUSR2O7dSnVggr23e9w8ZMGkgTMY8QLIJrpK/UN2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 13:37:23.3984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce53fb08-dd8d-4ab0-1d50-08d7f8d5196e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4250
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
Cc: liviu.dudau@arm.com, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 nd@arm.com, matteo.franchin@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ben,

On Wed, May 06, 2020 at 03:41:26PM +0100, Ben Davis wrote:
> Hi all, any feedback on this patch?
> Thanks, Ben
> On Wed, Apr 22, 2020 at 12:13:49PM +0100, Ben Davis wrote:
> > DRM_FORMAT_NV15 is a 2 plane format suitable for linear and 16x16
> > block-linear memory layouts. The format is similar to P010 with 4:2:0
> > sub-sampling but has no padding between components. Instead, luminance
> > and chrominance samples are grouped into 4s so that each group is packed
> > into an integer number of bytes:
> > 
> > YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes
> > 
> > The '15' suffix refers to the optimum effective bits per pixel which is
> > achieved when the total number of luminance samples is a multiple of 8.
> > 
> > Q410 and Q401 are both 3 plane non-subsampled formats with 16 bits per
> > component, but only 10 bits are used and 6 are padded. 'Q' is chosen
> > as the first letter to denote 3 plane YUV444, (and is the next letter
> > along from P which is usually 2 plane).
> > 
> > Signed-off-by: Ben Davis <ben.davis@arm.com>

The descriptions match my understanding of the formats and the
format_info struct, so feel free to add my r-b:

Reviewed-by: Brian Starkey <brian.starkey@arm.com>

Can anyone else pass comment on the approach and/or naming? I feel
like we should have some non-Arm eyes on this before we merge it.

Thanks,
-Brian

> > ---
> >  drivers/gpu/drm/drm_fourcc.c  | 12 ++++++++++++
> >  include/uapi/drm/drm_fourcc.h | 24 ++++++++++++++++++++++++
> >  2 files changed, 36 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index b234bfaeda06..0c0a65481afd 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -274,6 +274,18 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >  		{ .format = DRM_FORMAT_YUV420_10BIT,    .depth = 0,
> >  		  .num_planes = 1, .cpp = { 0, 0, 0 }, .hsub = 2, .vsub = 2,
> >  		  .is_yuv = true },
> > +		{ .format = DRM_FORMAT_NV15,		.depth = 0,
> > +		  .num_planes = 2, .char_per_block = { 5, 5, 0 },
> > +		  .block_w = { 4, 4, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
> > +		  .vsub = 2, .is_yuv = true },
> > +		{ .format = DRM_FORMAT_Q410,		.depth = 0,
> > +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> > +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> > +		  .vsub = 0, .is_yuv = true },
> > +		{ .format = DRM_FORMAT_Q401,		.depth = 0,
> > +		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> > +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> > +		  .vsub = 0, .is_yuv = true },
> >  	};
> >  
> >  	unsigned int i;
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 8bc0b31597d8..232b9ad3534d 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -236,6 +236,12 @@ extern "C" {
> >  #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
> >  #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
> >  #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
> > +/*
> > + * 2 plane YCbCr
> > + * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
> > + * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
> > + */
> > +#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
> >  
> >  /*
> >   * 2 plane YCbCr MSB aligned
> > @@ -265,6 +271,24 @@ extern "C" {
> >   */
> >  #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
> >  
> > +
> > +/* 3 plane non-subsampled (444) YCbCr
> > + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> > + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> > + * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
> > + * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
> > + */
> > +#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
> > +
> > +/* 3 plane non-subsampled (444) YCrCb
> > + * 16 bits per component, but only 10 bits are used and 6 bits are padded
> > + * index 0: Y plane, [15:0] Y:x [10:6] little endian
> > + * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
> > + * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
> > + */
> > +#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
> > +
> > +
> >  /*
> >   * 3 plane YCbCr
> >   * index 0: Y plane, [7:0] Y
> > -- 
> > 2.24.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
