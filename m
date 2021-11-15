Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D504500D0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02CA6EC42;
	Mon, 15 Nov 2021 09:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD29E6EC40;
 Mon, 15 Nov 2021 09:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb/fn1OcQBwfKz7rJXOK7aFocEJulM0LhVEvNn6EDMOIDuvIrtCUrM7Oj+5bYqP01Xeg7Kz0v4UJTbM+agpIZzJB8hC/v+F7HVQn5onZF0oP6faxQ9K2e/hQ2t6Y4x4mFRIt5HOIau8xZK+4z77CKFC83ALrt9GXlBtvg64/NtWxGeM4uxpStoZibT8jxgoqz0lcVaj4gnNFDCgEgG3F+g/kj+mSuofzNq+oenEgRUmJayd+U/R0dMZkIYvL3b416F9UdGBshDYGbgH26sJWcaz7Yue/hxlgf9chhqNg2u96jdTuklmGgE7NkQvv5FJ8JWqMNZ75nhIxd7pC2Nfz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLM673yie1YVCclHym+tsJSlU6+tCYdhSZ8qepVuFuI=;
 b=ON3sAc9DwVEOczGSvwk44nYvCM+hhhWRS4QELpjL/Uz4qukXk1QfBiuded1N5W6ixIBozGTYpaFyXCwdi5IgBjoawI5aX2Pj93cDzrHE5z2pnUb7VvK6vBjf6mokXFtc8gCLbfKcO3YpzMNaK11dnN7otVQVqbCnLdMet72kXz6nYKg7yUPVk3ng1ggeYSTc4Zqtxs1mF6u1dFpagT8RabTMVYW+ky2ZUWIulAnZkxmaDrGlaRGMYp3xLeysa4LAPbHmbFXf/ig6D7wMoxIisdqa2dmKHuVsvQZn19oc4Kw+ZwuI5F+HWV0F/X4eBKw/btQ9UGRFmZhDlOmI6KLTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLM673yie1YVCclHym+tsJSlU6+tCYdhSZ8qepVuFuI=;
 b=U+dEGUufzWUMj1P6WyTvQ/oEKQeC+oESaEmG+1SkW/Soz6Ft867m+eNm9DuutdjvnPI+EhSWe8A5vA3QLGBybF8IuDYup3g8ZIzUvCE9tVGxRcwMALLEG5G3CvYsNI0hr6SoNzhGUdapb47B2RQ7lf+s7+4acRmip5QzDN7x2BE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM5PR1201MB0203.namprd12.prod.outlook.com (2603:10b6:4:56::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.27; Mon, 15 Nov 2021 09:04:49 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 09:04:49 +0000
Date: Mon, 15 Nov 2021 17:04:40 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Michel DDDnzer <michel@daenzer.net>
Subject: Re: Questions about KMS flip
Message-ID: <YZIiqM6PKKL/ZMNy@lang-desktop>
References: <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
 <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To DM6PR12MB4250.namprd12.prod.outlook.com
 (2603:10b6:5:21a::9)
MIME-Version: 1.0
Received: from lang-desktop (165.204.134.244) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26 via Frontend Transport; Mon, 15 Nov 2021 09:04:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eff1a4b-ecae-41eb-b541-08d9a816fa6e
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0203:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB02035102D65238849A56890CFB989@DM5PR1201MB0203.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pv7cU51Z6cCtCDn0iC4HqPDlxcFvxJOybKcnPXUPgJkYVC1LLYTSGUOBK9G14Gn+DGIF5fe/uqmwkJQE214gjteKciPaG6wREm9S1ldjxJP1MmsIzVkCh+KMU0emxnZ+JpV0078pubLo7d/YBZnfcWVqpakV9IDOPgV33yx/LS/I3jxhJaIjyjP+Q42MNlVjoh0XjJ1GgRfhjFTjNRJh1CRW1wUMbzJ61h78f9v1brQ/lEZ1VVqFjm7fVshXXy8SAEr8A79e8SziLPm4AzGHOuBqSjPhBbZruBte1WQHcpfuSkf9M2BnPRkFwCghsi4OQ15CLGVZYCZHNuFLQ/fw5FyhzEb/cbomFw/jk/wjPJbUtRymnL1N3Zm2msawIbv/M+ABuWB6zKC31hlAnKQ1nWCwysciJOyAhLZBFHCp7oSUY++otC/alDtvRbQnmMF7yVNTpgtvpyiAnOtUFcTnARvmyKFj2gP5xOH2jlRY9rk+H61G60ODh8xGflo3y0tB6B4LVw56AWiQZMkbA+3RWXjF1RmItQlsQIsNN+3EPjYyqXmr1/Cif+IGqxgM2MiWwMOu3vLIMklmqdQOdPmZHb5uZTpV4yxvXca7aKvx7zjbpInetyPN3sGLBfeFixYwmAvLEaNqXqWpGU6ihYj7pq0wExpeC7v3MCnUKhFHNtBnEjzOqS6CcuDeakZN9S1MKPDchtSvhKBu78ZVDtpBg57A+uXcMKgg9NXBKAmgiSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(3480700007)(966005)(26005)(86362001)(66556008)(66946007)(38100700002)(66476007)(186003)(4001150100001)(2906002)(508600001)(4326008)(53546011)(66574015)(6666004)(55016002)(8936002)(956004)(83380400001)(6916009)(45080400002)(54906003)(6496006)(316002)(9686003)(33716001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PGD6+RsuegbSK87W5keOtDv1NeCWfHFlv4Ovf6f883Knhvz70W/aAVlzqj?=
 =?iso-8859-1?Q?QPm80cWPaiv987QVatma+S963YlDliymFRnQJPDVprvpwvFB1d3WU+/dc8?=
 =?iso-8859-1?Q?fRXcE7aVzIilxyEgnIUDKPv8NdYAqCaOm5B/fO+p7TvdM4ojZ73enFM6It?=
 =?iso-8859-1?Q?FcAZ7oxrzogwmvP+rm9Aci4HRk8SoJ29wL9a2pEJOE/gqVdxsTdzVsQ8uK?=
 =?iso-8859-1?Q?fCsGf5+cYeN6FW1ca5KbWuuwqZ4f6w8R8Y97l0X9zy4rEfmwZwL722plyQ?=
 =?iso-8859-1?Q?PogA9/qon0qVUfpDuWilZDJkDsiEIxeIG0pdOl1u0o6oh1OZ0k4KAf8PHX?=
 =?iso-8859-1?Q?A3fl+7iYcxmXjCKMj6AhH0Zh4HNl8xCkuOKIQut4qV1IAhPaPn5Q5kt8cX?=
 =?iso-8859-1?Q?zPC2h3uceBHEjBfDGLgN96k+Mi+J8wOh+/koFgczKf7krFbEDp2Ahf6niR?=
 =?iso-8859-1?Q?yEJ/0tMOfARHA7aUOCDXVXi4oXUahubWo8RSLGQ+JAgwOK4uym3tiHYJAQ?=
 =?iso-8859-1?Q?TqhfJ2utJPeGp10IPFce12aG7eI90vX+jMZl3nxNx8VQfodLOSRuz9rUOU?=
 =?iso-8859-1?Q?0P0bH+fzqUx5uCw4O8bJfwuWcvk9gSR618aAeZP8x12szW3SM8yMcRUDqx?=
 =?iso-8859-1?Q?IxsiZSNfdzFp7J/iYlAkSKiOdr+ZfR71GB8yjEyTviJaFdNgn3O75XEMT5?=
 =?iso-8859-1?Q?USX9ZfpIl0hyy6orH3SBucnauzEtm80RGY6v1oozNCu983mZSrYM0YGBpZ?=
 =?iso-8859-1?Q?vy/la9xb31dt5wecXeUjXVhHlGM2gqymqNQ/agUpeETMOEmNaKgNhSWkqu?=
 =?iso-8859-1?Q?2lRfou6Ny0M72InAN6eqlMNztVhTRSBawWWb5+zUiv+vMppYmyq4BxxTMo?=
 =?iso-8859-1?Q?tDa3PluzIY0GKEXFSJ2Tooc7fI0l7h8Vth0oWluJFbjs9ppXQnYSKb0l3j?=
 =?iso-8859-1?Q?tlvIqiQUEevGs6z7TLQ7525fd/uUtz3YTWpbLs6RM514D6eszoPaDwCO9Q?=
 =?iso-8859-1?Q?RxUc5mAL0yjHfSvGpwBdzbKW7dqDdwKawRaJoBBBnMHNxQSDAwIhTl/Ojh?=
 =?iso-8859-1?Q?DK3Am7OnT3gnJHwElhbLEU/dMpXFprzEkaFLo7RkwQrCJWL+a76jf1FUbW?=
 =?iso-8859-1?Q?GC0SJXVMz8xGr3ed9OPRTRw3+SlfKlEgGWSqnRbMzcQraGFfH/qjXo7y1o?=
 =?iso-8859-1?Q?v0NU9bMtKAjAzxiW55sTYeI+AUcgDIQjo5lQvV0brvQjxMksqnByA3pnbE?=
 =?iso-8859-1?Q?RnYdiftW7z1ReDi+svlavRcJ4CcIOxj2+QGybd9NaaOkCYiu2v8M+y5CjQ?=
 =?iso-8859-1?Q?dtm2VkRV/lV9zym4BBXpVYZPu3ptE8+CsBUfGwXivT2LGzDCfrpXHT+OyS?=
 =?iso-8859-1?Q?a4WUPyqhEmo4g65F1bg0kULttYh4OagMoBuMQ0X+cc5DKZBGrqkasa9FnN?=
 =?iso-8859-1?Q?iLtYGZJc7aNxFnm+8SDmAKWKkdSyxIxoW0Drc6mrCSRib4uDRDquOa+rmT?=
 =?iso-8859-1?Q?oj3Z1HvC7519h7qixBoKSUkQy6GzDT4ixe0V1tsn8pOM1o8iUTBrbqTKGA?=
 =?iso-8859-1?Q?2YXKt+rgPT7vf7eEHkVek6HJ3NrjUoLl5nrS8H7y0Ok/gkfXbCi7SHh8u7?=
 =?iso-8859-1?Q?r1bYF6NNpT1glYJbCYqRzQTaE63v3TxLaj5ijghP4nNmFpjwQY6RMyxPJQ?=
 =?iso-8859-1?Q?/6iXBm6SP8H5NsGcyKI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eff1a4b-ecae-41eb-b541-08d9a816fa6e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:04:49.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYUL61NiTeruN94E3Pu36dpk+2ecWrfBOUzSthpN+OFU/DlkouDtqXK0CKRAUTOOiwV0H8hjI3zi/12r8xNdAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0203
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
Cc: Christian KKKnig <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian KKKnig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 09:38:47AM +0100, Michel DDDnzer wrote:
> On 2021-11-15 07:41, Lang Yu wrote:
> > On Fri, Nov 12, 2021 at 05:10:27PM +0100, Michel DDDnzer wrote:
> >> On 2021-11-12 16:03, Christian König wrote:
> >>> Am 12.11.21 um 15:30 schrieb Michel Dänzer:
> >>>> On 2021-11-12 15:29, Michel Dänzer wrote:
> >>>>> On 2021-11-12 13:47, Christian König wrote:
> >>>>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D214621&amp;data=04%7C01%7CLang.Yu%40amd.com%7C766e41a1c30544442b6b08d9a81358b0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725623316543180%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=od%2BNksWOff%2FtsuAYZLX7lIJFQJMY2OScVqhLclPYWAQ%3D&amp;reserved=0
> >>>>>>
> >>>>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
> >>>>>>
> >>>>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
> >>>>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
> >>>>> dm_plane_helper_cleanup_fb.
> >>>>>
> >>>>>
> >>>>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
> >>>> This should say amdgpu_display_unpin_work_func.
> >>>
> >>> Ah! So that is the classic (e.g. non atomic) path?
> >>
> >> Presumably.
> >>
> >>
> >>>>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
> >>>
> >>> Nope, my educated guess is rather that we free up the BO before amdgpu_display_unpin_work_func is called.
> >>>
> >>> E.g. not pin unbalance, but rather use after free.
> >>
> >> amdgpu_display_crtc_page_flip_target calls amdgpu_bo_ref(work->old_abo), and amdgpu_display_unpin_work_func calls amdgpu_bo_unref(&work->old_abo) only after amdgpu_bo_unpin. So what you describe could only happen if there's an imbalance elsewhere such that amdgpu_bo_unref is called more often than amdgpu_bo_ref, or maybe if amdgpu_bo_reserve fails in amdgpu_display_unpin_work_func (in which case the "failed to reserve buffer after flip" error message should appear in dmesg).
> > 
> > 
> > Actually, each call to amdgpu_display_crtc_page_flip_target() will
> > 
> > 1, init a work(amdgpu_display_unpin_work_func) to unpin an old buffer
> >    (crtc->primary->fb), the work will be queued in dce_vX_0_pageflip_irq().
> > 
> > 2, pin a new buffer, assign it to crtc->primary->fb. But how to unpin it?
> >    Next call.
> > 
> > The problem is the pinned buffer of last call to 
> > amdgpu_display_crtc_page_flip_target() is not unpinned.
> 
> It's unpinned in dce_v*_0_crtc_disable.

I just found crtc->primary->fb is NULL when came in dce_v*_0_crtc_disable().
So it's not unpinned...

> 
> I think I've found the problem though: dce_v*_0_crtc_do_set_base pin the BO from target_fb unconditionally, but unpin the BO from the fb parameter only if it's different from the former. So if they're the same, the BO's pin count is incremented by 1.
> 
> 
> -- 
> Earthling Michel Dänzer            |                  https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fredhat.com%2F&amp;data=04%7C01%7CLang.Yu%40amd.com%7C766e41a1c30544442b6b08d9a81358b0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725623316543180%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=o2m1p98zVr16n58wdOWBWyEzETMAfEGqMYAtaAZozgo%3D&amp;reserved=0
> Libre software enthusiast          |         Mesa and Xwayland developer
