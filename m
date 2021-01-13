Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9E92F41C9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 03:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6254789B0C;
	Wed, 13 Jan 2021 02:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF86389B03;
 Wed, 13 Jan 2021 02:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq8WEVfDS6YvkabmE9KoKZQ8z09rHGX9RxUyLRTfjxdDvN2ee8cHd26UPX9P3m1i8aoKw1ns2A3+njCEDHwexQ4N9UkfrxpJsDjiE2qQmqyqIcwcbs/iHT03eTXkPPwAwFh5UWwijwR8sQtjg7GHyG+j2bk1LRmwcCIwF3UBUvwCKy5tWcEWvlvhNS9+BII5f7ousPSSVZWUzslY9BgsfIiKv2SkSxgolPRNqTq3V2KG9/y++Xjt6B+6GAgTs/NCPJf52yoe1cyK5TVg1LYleUEO3gdW3hhfDTRdmjYG6YegP1jieMFwUXwa94QRoHLaytZqa4uR/wzCot8hpjlzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VQENVkI+3UxW7+LVOeACLD630FhG98WZ7Y5uYGF1wM=;
 b=lvuRonDZhBnoePV8AtPvSnnegKarY10V3Tc4HjgAqOkAYu4Q+Gj13bT03Fi4B6+Lo867jo0Wnk8AldcRYvk9wKuI3+t6yHC9EBHa5jC552EPjiKRWQLpbtrF/lkuR5QHkUhm0xkGt39KNN7/UlGqJ2uCNSHqTGn4fb6cO/xKei40mupKDe35srCZW0/L98M/5NHRPPruYUcVLcbgN34amxJnEqbGma57P9yUWY66lcrDxqAqwGNfpDD932mhjX5pRavfNYdiHdOTfCSL0VzIJrgCWI41pbp57hX1OOmouW12LDMLG60q2McCXqwLtavkxMVADpRKPXTYlL+nj/e06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VQENVkI+3UxW7+LVOeACLD630FhG98WZ7Y5uYGF1wM=;
 b=MOb9UYC2/pJilGPs14DinSgoxc87egwxQQ0igsqrWOJKu/ZOynNcnLx4BnkSY5zD1GCxw9y4Z/teEUX876HXHBBjhyjM6JEpm4y6Q/ljKzYlB0E4hEGCMTAkz/720KgRXHW+xZmt9hbZvGGhRoCRLjZEd4dNXecUEIMw9yzRvd8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1520.namprd12.prod.outlook.com (2603:10b6:301:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 02:31:00 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 02:31:00 +0000
Date: Wed, 13 Jan 2021 10:30:48 +0800
From: Huang Rui <ray.huang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm: amdgpu: pm: Mark vangogh_clk_dpm_is_enabled() as
 static
Message-ID: <20210113023048.GC135893@hr-amd>
References: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
 <20210113011901.GA135176@hr-amd>
 <CADnq5_NUaqHWW7A32M1BeQ+rHPS8WZ-0OnVXtD3m7pB3ZpHyYA@mail.gmail.com>
 <20210113022115.GB135893@hr-amd>
Content-Disposition: inline
In-Reply-To: <20210113022115.GB135893@hr-amd>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK0PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::23) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK0PR01CA0059.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Wed, 13 Jan 2021 02:30:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07e181fd-bddb-4bf4-a4cf-08d8b76b442e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB15208A0CA92CCBA863299D96ECA90@MWHPR12MB1520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ppMww4jyRuZhX3plFKrVXyntiwzTDNeOT7BR/0sMSw0ZpxaciDHdKBZfm/irpr7IU0W7khcpqbBygFeDrMgzfilBzDUcpIO8vhIbNNC0ZsdYzFcbiIRLUeZnmEy/RGQh0vIAS0xN3rVbb7o6he3ZcGzw01UeKlzQAvBEXiapuduv/6WIytiawKZPT2aJ3Rr/OECS/5uwerRGVqo0s0EZNmd7+cp1BLF3JNp7QVfVMwRV4yzzyIAukdEdKeZj2XPuzBzmbfT9xaIhQztWZPIkgS/6F8g0v5sCHCTtsjm+q77Er+5Jqav2IsdcDnw41Ocd5KtrxjABaqjv1uTPL8L3KBytKOwruhg6U+l4ZvwqvZj44XK84/G7Vlw1t2DyGPb0cLVIDi8f/Ngy4QiWREPVSk7fbCGmj/Biy4FXEwt28FY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(186003)(8936002)(83380400001)(45080400002)(966005)(16526019)(2906002)(66946007)(9686003)(8676002)(478600001)(956004)(86362001)(6496006)(4326008)(66476007)(66556008)(33716001)(54906003)(55016002)(6916009)(1076003)(33656002)(53546011)(52116002)(5660300002)(316002)(6666004)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BRTDH7ovP2xSkTh/bJgT+WwLMFUeobldxMsLpgn3ZB5WGN+xWhYSuMAbnBN+?=
 =?us-ascii?Q?4MfI05lZr5o066S6xZQAQc4TDGFAlNSEWP/4N6Nsj6LUpH3tiU8/LQKcqV64?=
 =?us-ascii?Q?kJ0JRWc7+f7pa5W/14eiTqsqRd6nBwsFdxkHR0Y6xuSye9IBAc9fwkl13CvB?=
 =?us-ascii?Q?WEungUQ1a9hI9wV7B9jl3Ufm2kFdn99meT/wa+pT91bu3F2Jf/8mcoKZUj0h?=
 =?us-ascii?Q?rMwYs+fVDsd+vGuMxDOv5cJIw+UGJL7b4iVBaD0rXpUjviVCVJV822IgaT1p?=
 =?us-ascii?Q?8Hz+92a2ak0xiPM+c6OtPR2IgY8k0WmXjeH1fxtTVX5gCZDWf3cmxJGakxvt?=
 =?us-ascii?Q?XHK+hLe+51XDS+MSLUNfVWdVuXkEeqMuapdJRWA0HuvgaGQ3gI1AJZi2u+Ve?=
 =?us-ascii?Q?SYAdEOlrHc7KeVQeEUlG1j6Hw2UP+YVrRX9Y+WkuVrMc6cw2LE7OnHPGpYyB?=
 =?us-ascii?Q?CzJ5h8UH66deVnXfvKzYaoJPegN8StjhzBuIQul2GeA2SYFiIoEPPgREzqsw?=
 =?us-ascii?Q?VKc/jIMTJmOyze5irwSx9v6pQr+l2632IX5yNl5ByQyku/MUJlH28dp2ZoIO?=
 =?us-ascii?Q?PsRTfjy5EiD/NHv00HfpSlH2+MndLzB3fqNKY3WLFrPDq44we6BseijQ45WO?=
 =?us-ascii?Q?T0fDcD7geMdP84h85ZCfz8lB4CsoJl6YssJ6Un3ixnEr0ovylYKxKqnTdYeJ?=
 =?us-ascii?Q?sdsX3w6El/SGZDj2HYMZFr1nQyzOsYWg8hCxdqIZJqw9Gup9ezDMaDO/DtD9?=
 =?us-ascii?Q?7YtilLFHyNld3HfKKYdRpW9EOh0Ig8WaXKWMStwlIbw043Sv65MBIFMumjil?=
 =?us-ascii?Q?2m5Dkw8qXS8hkBPS6Eo0ZEqFudk7Gmozz2fOGGilL8cbWQOmPQR3jmcb0Loq?=
 =?us-ascii?Q?6kG9Hv8RiEfrdYmmNtwSQfk37ZQ0H2z+Ibs8g66zfhZycpo8HBPCbCcTBl3f?=
 =?us-ascii?Q?qkCtVXUQlYg4ouXcav8IuQC0PkVBdjEJKHrNZ+DE1zgbUtTxcnCnnLvDVHzL?=
 =?us-ascii?Q?klG1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 02:31:00.5266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e181fd-bddb-4bf4-a4cf-08d8b76b442e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7xBlLwSDAQxTpKBuK4+ozA2ffcm6u+Aqm/xq2QfEq8SwYQ8ZYV29lQyMNDKViK4aAKMZyITFOr1c5f7twotNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1520
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
Cc: "Su, Jinzhou \(Joe\)" <Jinzhou.Su@amd.com>, "Du,
 Xiaojian" <Xiaojian.Du@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Hou,
 Xiaomeng \(Matthew\)" <Xiaomeng.Hou@amd.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 10:21:26AM +0800, Huang Rui wrote:
> On Wed, Jan 13, 2021 at 10:13:02AM +0800, Alex Deucher wrote:
> > On Tue, Jan 12, 2021 at 8:19 PM Huang Rui <ray.huang@amd.com> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 03:57:22AM +0800, Souptick Joarder wrote:
> > > > kernel test robot throws below warnings ->
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> > > > warning: no previous prototype for 'vangogh_clk_dpm_is_enabled'
> > > > [-Wmissing-prototypes]
> > > > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> > > > warning: no previous prototype for function 'vangogh_clk_dpm_is_enabled'
> > > > [-Wmissing-prototypes]
> > > >
> > > > Mark vangogh_clk_dpm_is_enabled() as static.
> > > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > > > index 75ddcad..3ffe56e 100644
> > > > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > > > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > > > @@ -610,7 +610,7 @@ static int vangogh_get_profiling_clk_mask(struct smu_context *smu,
> > > >       return 0;
> > > >  }
> > > >
> > > > -bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> > > > +static bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> > > >                               enum smu_clk_type clk_type)
> > >
> > > Ah, I have another patch which will use this function in another file.
> > >
> > 
> > I can drop it if you plan to land those patches soon.
> 
> Thanks Alex. Yes, I will upload them after verify them on the new firmware
> today.

Sorry Alex, I miss read the function name as "cclk_dpm".
This patch is good, please go forward to apply it.

Reviewed-by: Huang Rui <ray.huang@amd.com>

Thanks,
Ray

> 
> Thanks,
> Ray
> 
> > 
> > Alex
> > 
> > 
> > > Thanks,
> > > Ray
> > >
> > > >  {
> > > >       enum smu_feature_mask feature_id = 0;
> > > > --
> > > > 1.9.1
> > > >
> > > _______________________________________________
> > > amd-gfx mailing list
> > > amd-gfx@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cray.huang%40amd.com%7C19fce6891f2d4f6df7de08d8b768c8a9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637461007972405505%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=v2JGTkklMHOE2hN1s4dYZ1hT7ctLeUHpwkpn1M3nyi8%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
