Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121D45288F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 04:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42C689C9A;
	Tue, 16 Nov 2021 03:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F9B883A9;
 Tue, 16 Nov 2021 03:28:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/82J8bDtASKbUO+SKFO1usR3i2eaxp6mxail7INPUki9BpwHQq44iCKjAdc1Wi7z8kc6dPOZQuyPA8cnTHgIJplL8g++SJA5qfgVPjvjs+/zioYyzgYmyjRxVfhUnhQ/4gHyrcKcdjmNKg4D8Ed8K51k5fL4FymU1P9qu2YiiAgG0CkJPMRXWFV8rNVQ+RTAQUX/ZjRlSiBim4nAg/n3/c9c16UvyvSqVp5Gytupgyi2wrSFDMv03HdrScfqI5/Po4ZZDkWnpSkJHNNwmLdsvoD32MUY7G2wg7Nisk9TDDE6VaZW8ZPsU8HOmoTN6Oz4BRtvkp49BUbXFGFotxx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEnJreBXLDkl6IrqOX9fvSiL7PPOjjZgir/HTaaiD1Y=;
 b=brv1oYW1wQzv1owDAzueUBoy56x1qs/GShUzCAvoiXdLLwoYV83/1mwdyoFDT9c5eIMc9PRx2N4Vv1Vc8FZFxON69qeyt62EjNYtbSY1ml5js1Zsi81acG28IH144Z9kEhWqfsF6x5QQ+wyEO8VLhB5XhdFhPxDXRppf3xA207clsxL9TEYJH3SJR0jDXS13bSUeyh/ma5/Yu1un6yko6eu+m+dZfr10G6+GJzxeBkiHLiyJhyxlVyCEo0NXx7L+EW0g6nTH8cQMp3GSqwAVdGZ9MT/c5pfSlGGw7IEu0OLzxLjD/q2QgXMNTpbelEyuLAvb9xEnQ6Qhb2V81UxEEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEnJreBXLDkl6IrqOX9fvSiL7PPOjjZgir/HTaaiD1Y=;
 b=SqirTRf7zHr3v7xGy1OWk87cljqLFRvN8ZHj6b7bMjizi6ImmukNe4AsWkaUQMxeznD04Ha7Y2WmNg/eI3OyrlZ79kVa94mqZfHo+OT9nAsEUntpqEukzdawJf+R8oFF1BUwYzvmAUJUsTWZd/Ctcnn9pWI3guK0dnM+b2KsBIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM5PR12MB1514.namprd12.prod.outlook.com (2603:10b6:4:f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Tue, 16 Nov 2021 03:28:04 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 03:28:04 +0000
Date: Tue, 16 Nov 2021 11:27:21 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Michel DDDnzer <michel@daenzer.net>
Subject: Re: Questions about KMS flip
Message-ID: <YZMlGSA9iG3aVCUu@lang-desktop>
References: <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
 <YZJFHMEqm1oz7QJN@lang-desktop>
 <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
X-ClientProxiedBy: HK2PR02CA0203.apcprd02.prod.outlook.com
 (2603:1096:201:20::15) To DM6PR12MB4250.namprd12.prod.outlook.com
 (2603:10b6:5:21a::9)
MIME-Version: 1.0
Received: from lang-desktop (165.204.134.244) by
 HK2PR02CA0203.apcprd02.prod.outlook.com (2603:1096:201:20::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 03:28:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80791873-2273-41c3-47aa-08d9a8b119b8
X-MS-TrafficTypeDiagnostic: DM5PR12MB1514:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15141232960EE5BA53CA59EFFB999@DM5PR12MB1514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YNmaN1NOWM3u1vo+qF5NHd1PuPRC6x+TVhTWNCufzpGded+twWzGv4C8+jK8cV6bbg/HwbF/nl48tmJkghCFFOSU7uDrJSROcOk1Gu5A+v7D6vs5sMMvu7egrzTuEbZngWf4ExEUFljAqqtlG2twAdhIQIQfXX6ggSLwbnzZzWAuD3awWskJ36oqq/Q68LVy7EX4+9TTGGLN4bsdOX1LQuiRkFvB7ukWN4ukdDijk8fQ7RI3lu2wSwGsqZ7RnVrjZLCkXCE2YBm1GZxqwt0KYnBfgIYL0J+XBn4MNNcKwiuDETezwwEGR7EGELsIdURtw2qPFHTarJEnKicayCAC+0Se20Wno0x59QmV5xpjtShNR/LfxgOpEAvqpGZel+9isMHgci/jRbZ07iXFpaoGxCuxTbgsbXqutVn8MMqUEEC9XcAHrsK7sXweU4PqlnAbEJT9StztPMe8LyulxvsdZA2Ym6i1fD197MhGkTh7+hjHuL4yXrQDvlIA9UpMsoco8oDvNtS+PWjwRUZJbJHm3l6a+w2W31nOv7N+69E6/pLS/Je9gacudVHCj2PQ5Nlf2w94mMhlocqbwPbmH9nY+f6ebzsR2zPQKc8TTYpEJtpQ44xzLtSFKOyo+xSKDIxCgx4eCskqipXJFv1Mf6U9PFeClz5SekVThCY+/jUA+97hA0qWncAxHqIQlPKG/sR5DvVqlnVJwdzfK3BHtQy/82tmUl8/8Ez0T17uMD73MOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(55016002)(6496006)(5660300002)(53546011)(4326008)(66574015)(9686003)(966005)(83380400001)(45080400002)(316002)(38100700002)(186003)(54906003)(508600001)(6916009)(956004)(4001150100001)(66476007)(66556008)(86362001)(3480700007)(2906002)(6666004)(26005)(8676002)(33716001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nNOYKa1r1aR3fjsqKLdEk+qPigrKWp96xZMePw7n8wIipu/aXkBmrcaSVG?=
 =?iso-8859-1?Q?8mC+yIktDtdMMZDNx5BYM/tocfLccXigGHnyS/7m9sr+eBO6m6WBhKR9LY?=
 =?iso-8859-1?Q?lqhMnI7THahQZfTcnxyjdkpE7JjP3kQY2QOU11gpGtYUm8r7KRDS1iogRF?=
 =?iso-8859-1?Q?p+4SxWj7OpSh7dIOy7M30eVfbiUPybyWcBG3umz6z0TCDEhxfORHC9zbwU?=
 =?iso-8859-1?Q?eLocuh8WtvdudBP1nzbosUDCekWEyO+vKQynChF/gQddAKDB6EC75lkSn9?=
 =?iso-8859-1?Q?wD/gqbV0+sG17F7yAHWSBZ8ZwiOaGTEFPb0c3wfzou49gdBgpJNet+oI1x?=
 =?iso-8859-1?Q?NfXzrzHw44KHqUCRcMUSV/nH5jwzdSSMjeBRJLrZMjKEu3/DXP9cowAQXQ?=
 =?iso-8859-1?Q?/+UyqvFrZXG0nxqfQN0PtheIi/DiqOM2pg8KUTKcXkEMw9MTXDgQcnoMRZ?=
 =?iso-8859-1?Q?DpiX6S5/p4yreROFYWcuu9et0ayj7PatIyNr6qu00foaZEaIOnNdkeogev?=
 =?iso-8859-1?Q?89q4ehqkDV7emytsfx23nzgS6x89OGQMq3R+ZlQbS33QiD8qefkXO668dx?=
 =?iso-8859-1?Q?82C2bkNTpD0ZppaSv9BP3Jp4JDNrt97BxpQRwnZWP6KZB5jsHd//bcVn1m?=
 =?iso-8859-1?Q?M0g1gT774f1h+E6NN0k4cntdLtaFG4/zaFQ+TcA3HzUfEbA87+Rr0JR5zS?=
 =?iso-8859-1?Q?CfWCv7eQnD1FYt4K3QDpLkJYDvgIhS4GHF4xxe1vDBiCH2t5ReUaA1bUpV?=
 =?iso-8859-1?Q?eRys/I5Re5zsgWCTKd3GsH2Kyil7K7LulUU5YMNDTTkyAJqf7Yc1NOw7Qe?=
 =?iso-8859-1?Q?LVw2NWCJ1hK+hCjuvqFe0LgCu3Fje3+VXm/dooSQ8SlJT3JndKAlu9DFVb?=
 =?iso-8859-1?Q?iilL2Y/Rs2GGncTgYuFzp2xWd/d9/yEaFNeNQDR8pSFzSn83w15uCx0mhB?=
 =?iso-8859-1?Q?c3TciFQC8G2frCOoz6cTDpn9U9wQzEkElb/XfFZPxqgvIzVFZaarm8Fed5?=
 =?iso-8859-1?Q?cfCLm8W21We1RCGNZ5Mqn5hQdDEigG6VuX6TLckZWEOzN0AGonOTxw2Gcm?=
 =?iso-8859-1?Q?K8ZUSekeOKWPck8TNdYvKY+52UH2OE3RtY00lbjABUASDkwT4/kUpwzDVx?=
 =?iso-8859-1?Q?/7N3UwPYxd2nrcoB/m1eFtSkgdOyWSnqM2+ZLiJ0ed1b3Zc1WkNVw5U1Gg?=
 =?iso-8859-1?Q?yCdsAqtHm0AKqB0nEcibulJmnHl/qtJXSQiSIx980SVQej22DMcGY1GNr9?=
 =?iso-8859-1?Q?ClsJX7OjB0Sp3YmaitFjd+xxa4uZ5ccdKkMQO4StGS5fUSNgzuNjtc5w9v?=
 =?iso-8859-1?Q?rSw2ESo1cYh5t8nkrjIHW5cNLPMK14SOkn/aKRB7iZahi49ovIWn+Fouhr?=
 =?iso-8859-1?Q?ua1QOJ/NjW6eUAkUwZJt5lBYKEBsLWf8doDKdrKaELOFoKnTBHhJ/RufSH?=
 =?iso-8859-1?Q?/lZGJRaXtsbfBLtLXNbbQWpkuCKp1u8kZz+wtrBkRMeIJFVU+xyxUVTdiy?=
 =?iso-8859-1?Q?3/VafktL/GuB4EYRIT3kxrtorFbINplKYJdTATDgjHrN+yCANApcqY1llT?=
 =?iso-8859-1?Q?fo7s8M5KtSVj0+2dFf0Nipp22wKkLv3Opir67cVcOptbN8OxgpRqBvKYEr?=
 =?iso-8859-1?Q?pFNoPGWQzUfOjzSiyke9I6tkznOvSiPji712BeE7E8ICv8dbLv0WuHqymS?=
 =?iso-8859-1?Q?ItI0Tc7vCU97vAswWlA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80791873-2273-41c3-47aa-08d9a8b119b8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 03:28:04.5115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZuBIhD+RUIW2OfkXfkEJ33SSfDd49HNrK8HNMRc1ymViJxm+WuzkUSyDJsAim8x0bSSBb2548q6Hej/NOuyEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1514
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

On Mon, Nov 15, 2021 at 01:04:15PM +0100, Michel DDDnzer wrote:
> On 2021-11-15 12:31, Lang Yu wrote:
> > On Mon, Nov 15, 2021 at 10:49:39AM +0100, Michel DDDnzer wrote:
> >> On 2021-11-15 10:04, Lang Yu wrote:
> >>> On Mon, Nov 15, 2021 at 09:38:47AM +0100, Michel DDDnzer wrote:
> >>>> On 2021-11-15 07:41, Lang Yu wrote:
> >>>>> On Fri, Nov 12, 2021 at 05:10:27PM +0100, Michel DDDnzer wrote:
> >>>>>> On 2021-11-12 16:03, Christian König wrote:
> >>>>>>> Am 12.11.21 um 15:30 schrieb Michel Dänzer:
> >>>>>>>> On 2021-11-12 15:29, Michel Dänzer wrote:
> >>>>>>>>> On 2021-11-12 13:47, Christian König wrote:
> >>>>>>>>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D214621&amp;data=04%7C01%7CLang.Yu%40amd.com%7C07b2a4c13d2f4eba9ebb08d9a8300cd3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725746610767105%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Qz2VKDE0%2BcIuXZMy0IL3NLZAjeXLimwl8PPZh4Cp4iE%3D&amp;reserved=0
> >>>>>>>>>>
> >>>>>>>>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
> >>>>>>>>>>
> >>>>>>>>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
> >>>>>>>>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
> >>>>>>>>> dm_plane_helper_cleanup_fb.
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
> >>>>>>>> This should say amdgpu_display_unpin_work_func.
> >>>>>>>
> >>>>>>> Ah! So that is the classic (e.g. non atomic) path?
> >>>>>>
> >>>>>> Presumably.
> >>>>>>
> >>>>>>
> >>>>>>>>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
> >>>>>>>
> >>>>>>> Nope, my educated guess is rather that we free up the BO before amdgpu_display_unpin_work_func is called.
> >>>>>>>
> >>>>>>> E.g. not pin unbalance, but rather use after free.
> >>>>>>
> >>>>>> amdgpu_display_crtc_page_flip_target calls amdgpu_bo_ref(work->old_abo), and amdgpu_display_unpin_work_func calls amdgpu_bo_unref(&work->old_abo) only after amdgpu_bo_unpin. So what you describe could only happen if there's an imbalance elsewhere such that amdgpu_bo_unref is called more often than amdgpu_bo_ref, or maybe if amdgpu_bo_reserve fails in amdgpu_display_unpin_work_func (in which case the "failed to reserve buffer after flip" error message should appear in dmesg).
> >>>>>
> >>>>>
> >>>>> Actually, each call to amdgpu_display_crtc_page_flip_target() will
> >>>>>
> >>>>> 1, init a work(amdgpu_display_unpin_work_func) to unpin an old buffer
> >>>>>    (crtc->primary->fb), the work will be queued in dce_vX_0_pageflip_irq().
> >>>>>
> >>>>> 2, pin a new buffer, assign it to crtc->primary->fb. But how to unpin it?
> >>>>>    Next call.
> >>>>>
> >>>>> The problem is the pinned buffer of last call to 
> >>>>> amdgpu_display_crtc_page_flip_target() is not unpinned.
> >>>>
> >>>> It's unpinned in dce_v*_0_crtc_disable.
> >>>
> >>> I just found crtc->primary->fb is NULL when came in dce_v*_0_crtc_disable().
> >>> So it's not unpinned...
> >>
> >> __drm_helper_disable_unused_functions sets crtc->primary->fb = NULL only after calling crtc_funcs->disable. Maybe this path can get hit for a CRTC which was already disabled, in which case crtc->primary->fb == NULL in dce_v*_0_crtc_disable is harmless.
> >>
> >> Have you checked for the issue I described below? Should be pretty easy to catch.
> >>
> >>
> >>>> I think I've found the problem though: dce_v*_0_crtc_do_set_base pin the BO from target_fb unconditionally, but unpin the BO from the fb parameter only if it's different from the former. So if they're the same, the BO's pin count is incremented by 1.
> > 
> > Form my observations, amdgpu_bo_unpin() in dce_v*_0_crtc_disable() is
> > never called.
> 
> It would be expected to happen when the screen turns off, e.g. due to DPMS.
> 
> 
> > Though a single call to dce_v*_0_crtc_do_set_base() will 
> > only pin the BO, I found it will be unpinned in next call to 
> > dce_v*_0_crtc_do_set_base().
> 
> Yeah, that's the normal case when the new BO is different from the old one.
> 
> To catch the case I described, try something like
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> 
> index 18a7b3bd633b..5726bd87a355 100644
> 
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> 
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> 
> @@ -1926,6 +1926,7 @@ static int dce_v11_0_crtc_do_set_base(struct drm_crtc *crtc,
> 
>                 return r;
> 
> 
> 
>         if (!atomic) {
> 
> +               WARN_ON_ONCE(target_fb == fb);
> 
>                 r = amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
> 
>                 if (unlikely(r != 0)) {
> 
>                         amdgpu_bo_unreserve(abo);
>

I did some tests, the warning can be triggered.

pin/unpin operations in *_crtc_do_set_base() and
amdgpu_display_crtc_page_flip_target() are mixed.

Regards,
Lang

> 
> -- 
> Earthling Michel Dänzer            |                  https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fredhat.com%2F&amp;data=04%7C01%7CLang.Yu%40amd.com%7C07b2a4c13d2f4eba9ebb08d9a8300cd3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725746610767105%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=jct%2F2NG7LamVRzzpkSy9XjQIDZRBIutSeK3VQ2jh524%3D&amp;reserved=0
> Libre software enthusiast          |         Mesa and Xwayland developer
