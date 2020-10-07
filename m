Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829EF285DC2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 13:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3E26E0AD;
	Wed,  7 Oct 2020 11:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50087.outbound.protection.outlook.com [40.107.5.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929D76E0AD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MELNLZZJ8IXmGzHYbYFSUqW4qc5stMv+7KaaE0D0DDM=;
 b=jQ1ZDMCS3VRXzhESQcMdEd38a5DjuByk2HFcvLSR0bFYJvaV8ZUM1WD2ACweZjb5yweycw29nSm9FLq9L96OyS4xJs6vlF1VLUG1rx36npsiZvNSuKZmBDXT3wJbZ2A7oaX25phMaVKEtgTmjCnAh2kFoC840qvO/mLhaObl+6k=
Received: from AM6P193CA0098.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::39)
 by VI1PR0801MB1981.eurprd08.prod.outlook.com (2603:10a6:800:89::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 11:04:16 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::fc) by AM6P193CA0098.outlook.office365.com
 (2603:10a6:209:88::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Wed, 7 Oct 2020 11:04:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 11:04:15 +0000
Received: ("Tessian outbound 7161e0c2a082:v64");
 Wed, 07 Oct 2020 11:04:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eeaa1abc63b199a8
X-CR-MTA-TID: 64aa7808
Received: from 41d17d6fd3f2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44DBCC0B-9590-4805-B137-D3A8DA400FBB.1; 
 Wed, 07 Oct 2020 11:03:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41d17d6fd3f2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Oct 2020 11:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k38VuYxDQEbyBHbWjAJHUARPMoVaAMUsb4uyBFUJpeJqjrLRuAsPD1uyzzsfIhHDJlbwwB2z6sl/i+p5oi41MDCuyyblBXPdQ9ZA0G+71UOPgv/yg827Ce+6TzESCBn6lPxPGM07ZgV4iRZTW16Splw4tLD8lKQXMqy5ZuCl0cHFUxPy1gFa5ZYfNXMdHPrN+5T7sG68pM/M48Q5K4KdKX43sfxIhkukWHsXJHWL2VF87d7wVcKtSy8PYSpOU8L1l7xdEDtDzOHauoaOtN7HqyHx+v5bOAHFzZlo6dFYqljdP9ZTSu8LcENVCWIgjWddyBqHcx0n8KQ4zBJF4GEXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MELNLZZJ8IXmGzHYbYFSUqW4qc5stMv+7KaaE0D0DDM=;
 b=fOz49iOc8duIp/w9XOrHbSzOf6spTYOs5aOrGyHxFw/BdbyHhnGUW3RIaajTr+rcjpGrJ+YOPN76Q3Xr5asLFANzmNXFwWvL/HBiv2Z3cpQ4mHmsaSutBSdEvIgvob0t1qqvXXd0QrLbTq0DeO+cDltqzPU8j4rgvvTv50OjQahwDNNFhmeMBL8+CBtRuEzpW941/Yhn+h5KQjID4Xo2mDxcK0HRrLFdBuWtJbNtBs1WqeiwRiY9pTGGiIQTbFTrLQhDfCtDREg9N4hUBTKb0QFwg8tw/KkOg+NLv4qpZDlLmSk1pcv+Tv3ahNiIo873UJiEzz273hOvmoj/k6d+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MELNLZZJ8IXmGzHYbYFSUqW4qc5stMv+7KaaE0D0DDM=;
 b=jQ1ZDMCS3VRXzhESQcMdEd38a5DjuByk2HFcvLSR0bFYJvaV8ZUM1WD2ACweZjb5yweycw29nSm9FLq9L96OyS4xJs6vlF1VLUG1rx36npsiZvNSuKZmBDXT3wJbZ2A7oaX25phMaVKEtgTmjCnAh2kFoC840qvO/mLhaObl+6k=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3653.eurprd08.prod.outlook.com (2603:10a6:20b:4c::22)
 by AS8PR08MB6136.eurprd08.prod.outlook.com (2603:10a6:20b:292::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 11:03:50 +0000
Received: from AM6PR08MB3653.eurprd08.prod.outlook.com
 ([fe80::d0be:76bf:3d2f:8c56]) by AM6PR08MB3653.eurprd08.prod.outlook.com
 ([fe80::d0be:76bf:3d2f:8c56%6]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 11:03:50 +0000
Date: Wed, 7 Oct 2020 12:03:48 +0100
From: Matteo Franchin <matteo.franchin@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fourcc: Add AXBXGXRX106106106106 format
Message-ID: <20201007110348.GA13749@lagrange>
References: <20201007092725.13300-1-matteo.franchin@arm.com>
 <CAKMK7uHZs7uKMbbQhn43-u7Y3_KANA6tU25jnOZkzj3h_7dmgg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uHZs7uKMbbQhn43-u7Y3_KANA6tU25jnOZkzj3h_7dmgg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To AM6PR08MB3653.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (217.140.106.50) by
 LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.44 via Frontend Transport; Wed, 7 Oct 2020 11:03:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2ef72d6d-ba56-4d18-00c9-08d86ab0bb30
X-MS-TrafficTypeDiagnostic: AS8PR08MB6136:|VI1PR0801MB1981:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1981CD76C82157223B5299E3F40A0@VI1PR0801MB1981.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nd9b1VO7SKDPkiW1w1tpMWCS0WiKZZLjzzM1exUz1fq9vrcE64ci8eOuVBtXGhHUICv7bOk91fMRQKZuPATnSgAmnlVVC2ncbGlbIJmh7XqHft4BF2hwMJ96+RxXPreM4faSGtU2g2Nm2+CGKqTEJaZKhxf3gNbVGrrzl+ZHizr8srwsxUkaUPOWymEBlC/y5QWNlcQUMTZmsr1+Gp9hK+x+I/bBJMhzLJnYm++pQgMKlXOM40kjk6O8UHbbPf0gtcuiIvAF/f5siIeW0aw4ULNxZM98KoVwjwMDZxs1l8YCO4fMma1O4/+v8YYY7i/Q7/zaOvhCdbQe6sY6rT//daUh2dlOG6O4qf3XoV0oM+Vm6D8n/yaIx3wNUzR/KHkth+ywnCFLIfY9i9+/2Ysi9g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3653.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(5660300002)(6486002)(478600001)(33656002)(66946007)(66556008)(4326008)(6916009)(83080400001)(66476007)(44832011)(2906002)(52116002)(16526019)(26005)(6496006)(186003)(53546011)(54906003)(316002)(956004)(86362001)(9686003)(8676002)(1076003)(8936002)(33716001)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QL1J1mng2vWh3wFAlzG5PaIa3pLF63sGIa5YuH+KIrevn97aNNswsRw0cbRBcSZAEAkF1Dxfsdsjq2IOOon2qaRwDJH5/TpV0f2GA9yXxogM3VpOfaf9zbAJKQ/yQ2Gs711xRTm2moR8YrYu3nrCdhx4RogO6UZRW4SkPLp3wPKnjkj4M7Tq3zAmxaG9PsXi600mJ4FoRMMOH1AwKCI9y8KUIXTjFGRKWMLcl6pgiGSk7/Xdo2bXkSHDgpwNpdNMjeR6xB73d550VVPdyrQKuuIweol7EzLna1LZ3Gmal8msJ5LVeacwXGk8xUMQrojshN2tHFTYhCo8hEmMHpvcbL/lxRbxc5BehHE3d6r1OfeDKU459mUVifdSGYGRz1U56ULObPhn6IHk4fgR6pbruypv1Vg5LwnwLWVVLIKXqDHmuKiBxGeUyp9D2bhpoeqPRj0Umzn2T1F3vzztqBfNKoupNYoO1kzr85rSJqPJxJoKZjfFQdOelGFsSVL2lCytqu81Mz/6yenujTtRKFl8w6fH5SCM9WzMOu8izKKOf196oQFifE/6C4yvJB7viW7KhfJr2rxpvMxLer15ij+Ol8LzUiCTnaw/eEjfUlHdZ0OCrmI4Sayalh+V1yX9XgpH9y5gQrVkMssrSezmRgQ7Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6136
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b07c61a-230f-4cf4-4797-08d86ab0abf4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmMTCuKMWc8LKF/ZtMQwXqC1gjZ2H/+Xt9shXKgY2bH/YFDfSf9BiPC123JUq545Arax+F8scDB6EhBO9bSzzPtvk8vuH6z5PsVKhCi8l2O4dGF1IunPHY3rk+EZ+88Vyo42qMdrE0lD0BLnm4rAkBRFjuZwIqIexH4z6BLhcmugUU+91H63L6nreVhqz4VBppSpcgMN+Vmc3R5fTdOKDcSNyV6tMnAMwd6JOqdpjl4yTAzbWuceJR2KcovtkX3k8E4i04tQ+nxvmyobeXuihpLipWyq078T4qSE6Peq4ltnjdSVYMaB12MtMmHqnyAyi0/vZgyro+G6jUf3Dnmkwf39Num3oqhHOVvVsMesWb2nV+ItSe5A0GM+ot+r4hCTHuaBZ2JZBX/xN7Klu15ydbb2YwDWMRkA+4rZheidPJG8QJdsquh19e86W03KcghVg2orbVR3+fvTMprvhusAiOurFwDGS5sYRJyl/4tR8tE=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(7916004)(4636009)(346002)(376002)(396003)(136003)(39850400004)(46966005)(1076003)(26005)(82740400003)(47076004)(316002)(36906005)(54906003)(83080400001)(81166007)(186003)(356005)(6496006)(966005)(336012)(86362001)(16526019)(5660300002)(70586007)(956004)(70206006)(9686003)(44832011)(53546011)(2906002)(478600001)(6486002)(33716001)(4326008)(82310400003)(8676002)(6862004)(8936002)(33656002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 11:04:15.9599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef72d6d-ba56-4d18-00c9-08d86ab0bb30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1981
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
Cc: Dave Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Oct 07, 2020 at 12:06:34PM +0200, Daniel Vetter wrote:
> On Wed, Oct 7, 2020 at 11:29 AM Matteo Franchin <matteo.franchin@arm.com> wrote:
> >
> > Add ABGR format with 10-bit components packed in 64-bit per pixel.
> > This format can be used to handle
> > VK_FORMAT_R10X6G10X6B10X6A10X6_UNORM_4PACK16 on little-endian
> > architectures.
> >
> > Signed-off-by: Matteo Franchin <matteo.franchin@arm.com>
> 
> So is this essentially 16 bit, with the lowest 6 bits in each channel
> ignored? What exactly is this used for where the full 16bit format
> doesn't work?

If you are asking why we don't add a 16-bit format, instead (e.g.
DRM_FORMAT_ABGR16161616) the answer is that this is really a 10-bit
format: only the 10 MSBs are preserved. 

We'd be uncomfortable to add support for a 16-bit format and just
ignore the lowest 6 bits.

Thanks,
Matteo


> -Daniel
> 
> > ---
> >  drivers/gpu/drm/drm_fourcc.c  | 1 +
> >  include/uapi/drm/drm_fourcc.h | 7 +++++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 722c7ebe4e88..bba03fcb016d 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -202,6 +202,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >                 { .format = DRM_FORMAT_XBGR16161616F,   .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1 },
> >                 { .format = DRM_FORMAT_ARGB16161616F,   .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_ABGR16161616F,   .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > +               { .format = DRM_FORMAT_AXBXGXRX106106106106,    .depth = 0,  .num_planes = 1, .cpp = { 8, 0, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_RGB888_A8,       .depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_BGR888_A8,       .depth = 32, .num_planes = 2, .cpp = { 3, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> >                 { .format = DRM_FORMAT_XRGB8888_A8,     .depth = 32, .num_planes = 2, .cpp = { 4, 1, 0 }, .hsub = 1, .vsub = 1, .has_alpha = true },
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index 82f327801267..76eedba52b77 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -155,6 +155,13 @@ extern "C" {
> >  #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:0] A:R:G:B 16:16:16:16 little endian */
> >  #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0] A:B:G:R 16:16:16:16 little endian */
> >
> > +/*
> > + * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
> > + * of unused padding per component:
> > + * [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian
> > + */
> > +#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0')
> > +
> >  /* packed YCbCr */
> >  #define DRM_FORMAT_YUYV                fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:Cb0:Y0 8:8:8:8 little endian */
> >  #define DRM_FORMAT_YVYU                fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:Cr0:Y0 8:8:8:8 little endian */
> > --
> > 2.17.1
> >
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
