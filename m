Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6262F41AD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 03:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410F589A9B;
	Wed, 13 Jan 2021 02:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9409889A9B;
 Wed, 13 Jan 2021 02:21:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsU5meUrCcqyhhRaghbHC5B2bGgbJGg4jQZTof6a4d2xY2UjaYLkQmhoYRvnc9Y7JSWmZ7k9wXPWsycRV/yfAhAh9RDMLU7/EJeTDtN7ZKkkjTa13WNvV+UYYm5pZgm4Cs2cFskC/vqXc1zStSh4U7FL1gRCMXSo+nP7TqgCrxc7MwHPX9dYGpMj/5BXnq+4yiZ9815cBZWTZUDHO4UH72AZH3MEYNDaVgVxyk09DwprY8XE46MPm6dKwQzfkBwuqNNO1TZ6HsCKZszaRmS1WNDwwmo55jiAuSHZyuOaJ/4PudDT+LQ3yDEcTPwpDEFI/3UPXyTXKm6abPVGAXJ0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8ZDm3CEedrnijPTyrpHEeej6fwRh9ZV0KFMJHg6zys=;
 b=Hv36Lb14iVmbOs/XPwVojqp9/anW+6Lj5YNRVv0w07qTyNR530CpnwK8R/m6P3l+nkwE5LwzENB84uhBRzEqi3WkgtCpph4D6kZozGjxm+jA4qhjtHIzVGUy5Mo//U1qkbxhgb2I7dNrszNkwLJeZDXs8/YgKlxVL4EJk49SFCu51ctT83w25VMwRtNoiHfHXukx0rCeMX99XMlY1bXKgmMffKagW/cSIdHjSDZVEdJPwwToePCz8zlnvXFF4Mt0AZ/kSI05Rnb/CVEYLYGAX1+xXLF793xYHfYWAgsUCV7zuM/P+jlNdMxtGUEqSfT431ZwubZK0+OUaz311QlsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8ZDm3CEedrnijPTyrpHEeej6fwRh9ZV0KFMJHg6zys=;
 b=RpyRd3Wyryt5Tky9IB5tDzRgrXbB8WJ20wgThaGKjtG09zA3xb8EYoXS+10laUI5nDfoMOEZTVF/NP+RL9J0iRQpi5BT70OEh9vh83tOip35w8HkciVZGNoD4uwzWkorCsnN/9CT8JK0zzf81MS72Gu5NVjPSc9DmhxlWKEgB7o=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1949.namprd12.prod.outlook.com (2603:10b6:300:107::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.10; Wed, 13 Jan
 2021 02:21:25 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 02:21:25 +0000
Date: Wed, 13 Jan 2021 10:21:15 +0800
From: Huang Rui <ray.huang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm: amdgpu: pm: Mark vangogh_clk_dpm_is_enabled() as
 static
Message-ID: <20210113022115.GB135893@hr-amd>
References: <1610481442-6606-1-git-send-email-jrdr.linux@gmail.com>
 <20210113011901.GA135176@hr-amd>
 <CADnq5_NUaqHWW7A32M1BeQ+rHPS8WZ-0OnVXtD3m7pB3ZpHyYA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CADnq5_NUaqHWW7A32M1BeQ+rHPS8WZ-0OnVXtD3m7pB3ZpHyYA@mail.gmail.com>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR04CA0067.apcprd04.prod.outlook.com
 (2603:1096:202:15::11) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK2PR04CA0067.apcprd04.prod.outlook.com (2603:1096:202:15::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Wed, 13 Jan 2021 02:21:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 96bf2110-f858-4e77-97c2-08d8b769ed8b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1949EA1551BB68AE401A5A81ECA90@MWHPR12MB1949.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y05hVlqKrYaKs21jwCBv32ok3clP3Kcm+rLe9kdG+BIymjPlVybQSTDP32w3+YEku5GbOHoEiBSwz1zUVEOVTKsCKTvqMfTlRj39O6/ytG7em3E/3+R/V103BExrHfHUWtDtZefyQEcZLEqv8O9jVoHo4wgr/9GgckWV2pzC8q5QYp1ZzHCTyteQQpVNySk77vD51XBht5cHL8Ek81kQMUSY41j1dRETrvIGYvYo86OLhwj6N3zr2aSKjneUziQreLrO4oly17OBSOEsjCEwrirYUlsxD+Ln3vX8UiA1GHvBbmOa0fUpbMfmQztScUdiWT07S3tuTuKLoiZFsyS0Hf7Uj4OLzK74HLsybUFiKlkyL2tj/nHY0mULXPgH7WPelBrzZ/n5ZVZpxHyQKsH4xL0fbCfDwOnUBeTmKtAFnfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(52116002)(6496006)(54906003)(6666004)(8936002)(316002)(66946007)(956004)(16526019)(186003)(83380400001)(66556008)(66476007)(26005)(86362001)(5660300002)(478600001)(45080400002)(1076003)(2906002)(9686003)(6916009)(33716001)(4326008)(53546011)(55016002)(8676002)(33656002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?W9kWXyVtDDtZX+HrUSQ04rkmExMtOWNTTKZ73u5NDWkmYwZezvj/MAXRbvti?=
 =?us-ascii?Q?oGwM6fbjM8F7qt4KIN3B3cKROnELXzhjw2YDe5bRVtrxfrh4j9SmD68PFWkh?=
 =?us-ascii?Q?oqAiozO/DC4jvfECN69HSQFkojO/VXjJwv6M8kHhhS1lJNm6nob5+64ZUMxd?=
 =?us-ascii?Q?RiMEAGpVhHVnBuqL8vpQZvqfC+bX0fw/s5MxG8UdKvKwO/pv0zfScJ0qm7dX?=
 =?us-ascii?Q?8VmKr2aPnALLsKBAyAvppLZRSlWUbY2XNbRA0p2LShVL/p4nXW9WlOFIWQUa?=
 =?us-ascii?Q?Cbuesz+I8BfktBjXoESmEhIVErgsYGPZMSUEFqCWKep7x2+dYrq9jkCZVOXY?=
 =?us-ascii?Q?scZb1wdsebxQcVNU9IDcP05qthILWPPA7D/XHax8/4iOBslXCxn3bekOluq7?=
 =?us-ascii?Q?oQ729KBkfqToapIBLgcYBC8Ggm9wWmSS4/HOREuQvfqRcxGTHYdE2EDAUGy2?=
 =?us-ascii?Q?lF5Y9CcJ3ut21HDTUahpgv8jTHDLO355lCPQhVvqJSIFT5zxaDepHDZ13QCK?=
 =?us-ascii?Q?BlRbkfswGOhW4gSchcWiZedlCXy39D/YWXDOUIkaId75eKF+NYB/umHjL1bY?=
 =?us-ascii?Q?5n4ZCXXpXl/YJOPYmf0psvbGPnODNTYsndS91wzNrTgQHtmhVk8yKUfyM2Bt?=
 =?us-ascii?Q?O8mjAPmAXRy40yaslBGRU7cFRro8GXT14zFPwR3KpBwdM9sJXiPWhlSz5DU2?=
 =?us-ascii?Q?glnFa2IW0Y5SH4QJ1g3PPaD2HW8NISann9dgJV1NId4jv+3q9PknGDdjrqvj?=
 =?us-ascii?Q?REYDJ5rfj0E9wTHYwJ3Yk/L/YQli+Hcs4m6yR9wwUt4B69l0725p8CZPgUgA?=
 =?us-ascii?Q?xFtr5Xp+ME6IsFeXhEYJsOmo7EHX2wTXsb4ZJUaJBJ7/PnPbBFmvdcseiQzR?=
 =?us-ascii?Q?B5fn82/BXlCPDyT7Kq65DeNym+KDzSAmvp/0OFECMBRepS2ugqi80cZvFCkR?=
 =?us-ascii?Q?QHAsXyYAD1CpJLLLaCc3YjZ1WavDW/MP7DIhYy8NdhxgPPe4t/XmlBDJPWth?=
 =?us-ascii?Q?+b6B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 02:21:25.5643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bf2110-f858-4e77-97c2-08d8b769ed8b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hI4ALuh5rhkFxnUHSKbdqQ3ISVFY5ihxLx7XRwWDnY2vRxilwEYlZNUqrFBN9/+L2r+hNwBkZwjz+2uVKgJ6Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1949
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

On Wed, Jan 13, 2021 at 10:13:02AM +0800, Alex Deucher wrote:
> On Tue, Jan 12, 2021 at 8:19 PM Huang Rui <ray.huang@amd.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 03:57:22AM +0800, Souptick Joarder wrote:
> > > kernel test robot throws below warnings ->
> > >
> > > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> > > warning: no previous prototype for 'vangogh_clk_dpm_is_enabled'
> > > [-Wmissing-prototypes]
> > > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:594:6:
> > > warning: no previous prototype for function 'vangogh_clk_dpm_is_enabled'
> > > [-Wmissing-prototypes]
> > >
> > > Mark vangogh_clk_dpm_is_enabled() as static.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > > ---
> > >  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > > index 75ddcad..3ffe56e 100644
> > > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> > > @@ -610,7 +610,7 @@ static int vangogh_get_profiling_clk_mask(struct smu_context *smu,
> > >       return 0;
> > >  }
> > >
> > > -bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> > > +static bool vangogh_clk_dpm_is_enabled(struct smu_context *smu,
> > >                               enum smu_clk_type clk_type)
> >
> > Ah, I have another patch which will use this function in another file.
> >
> 
> I can drop it if you plan to land those patches soon.

Thanks Alex. Yes, I will upload them after verify them on the new firmware
today.

Thanks,
Ray

> 
> Alex
> 
> 
> > Thanks,
> > Ray
> >
> > >  {
> > >       enum smu_feature_mask feature_id = 0;
> > > --
> > > 1.9.1
> > >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cray.huang%40amd.com%7C19fce6891f2d4f6df7de08d8b768c8a9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637461007972405505%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=v2JGTkklMHOE2hN1s4dYZ1hT7ctLeUHpwkpn1M3nyi8%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
