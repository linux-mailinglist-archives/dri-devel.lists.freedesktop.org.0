Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5A45037E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7033C6E8DC;
	Mon, 15 Nov 2021 11:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ACF6E8DC;
 Mon, 15 Nov 2021 11:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFsOWUHxKiEd0vGSckJDOWv8gZQvqNzTHPohAgIAPZVB0dSYbsq3Wsc8jgsKVYVInu9bH+p0ZOKFspuzQKrGSUK6We27HI+XD1dPbipvCop5z7JkkI9QLZvsQLlT4V6FU1DSwAdKrDbdfWG7PYs2qjqSyh1UfSBRoumjpBix0gwLzN3T3s73zy3Wn0mluncvPXchkcjeLNI0k8+obVDvMocO+XOThFUcaTW9DjLDVo4VNl+nRPG3smVwjdT2N0mEqDris/+68jNZazzbDCAXeAbRwIJJN7pfboSB05BOjl9A3S9hN2eC02Sf6ZD8OfZR7Hnt2RAtKAa+tt+S7i/w2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF3a6syMbsOkqwXXrgi4J2IqGTmiYWjyIC0uLk0SYdU=;
 b=bZhKUgc880AqoTNzTsJxDN5OnBwJNcq7qOU2KSRYsjwAKd8kWBbPCEZyN9Zxfn2TBawx14FWOauoksXtqbZz95kdnNHRQeW9SDmxb0Bo0kfL+hqHGs0V2201IEzAtJmuylyxEDqfrPFNn4WCc0WdREZD9S+CMmylYyiCyJ0C5sfGBqL+5DI72WNLZ9KD0DuytY2ZcQZ2tzOGO9WuJwEOWlAUXmrv9Ns984ZrLLwiKtYRocu3KseaDA+0puglhNpHaC1hgi5N4aS4oDuvnZfZghpKi+K/JAO3AzBBu5Osru/r2hnxa55AwKO5jVzHohMBaVROZNueqLuNpnqBjdJAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF3a6syMbsOkqwXXrgi4J2IqGTmiYWjyIC0uLk0SYdU=;
 b=YLfC8MW9eziuXFgt6lEEfs1/P6xOP9j3awmyC3mrGs6xbLsqQiny4xiJmpyXo/jBGGNKsdnCi+5lrCC7u+e75uxEdq43AsKXv6vh/M+QMB6eUlsqFTswdfv1TvR3q4Yk8C6yWw+GI43RrPj9jgH0soITATKxr7NR0YwwzfNcgGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Mon, 15 Nov 2021 11:31:49 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:31:48 +0000
Date: Mon, 15 Nov 2021 19:31:40 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Michel DDDnzer <michel@daenzer.net>
Subject: Re: Questions about KMS flip
Message-ID: <YZJFHMEqm1oz7QJN@lang-desktop>
References: <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
X-ClientProxiedBy: HK2PR0401CA0020.apcprd04.prod.outlook.com
 (2603:1096:202:2::30) To DM6PR12MB4250.namprd12.prod.outlook.com
 (2603:10b6:5:21a::9)
MIME-Version: 1.0
Received: from lang-desktop (165.204.134.244) by
 HK2PR0401CA0020.apcprd04.prod.outlook.com (2603:1096:202:2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 11:31:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acda7e27-49c7-47b3-cef2-08d9a82b831b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4266:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4266BBDDADC9628FDD18E53FFB989@DM6PR12MB4266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NA25DmafpGT2ENz0NeSMr6tZWfbMAkEPoLU26AFSqZfAhPDxhyzZVdmLXkZwidSDeeZY7BWdYKOv6D63nym40O1NzPx7mtaJjoQ7wRhBxJ/KeIqkf9IjMUmXhetYWKEhQg95Eg4hjjAkvQoOGU4G30zV0x4N4u6sStpcl/0FnL8V7PjXtawPOdOHTS/AAeen/PdhmVUmxPW4wZD9znX4Cz5f/v+XNebz7pu2cmW2riICPUBjZSwg3tHsZr8ufsSkBuHZ4wMrlREuvmDTFTRCpHnJ3qkkOqZELRQTjCVAKtSpWPBdq7uKMiKJkRzYfNmEzjkWvUBBl10tZk+lThDSyTJvi6Ew99jjT6rnHgZThlFGLaSAlKo+vktg9caiPEsnhMxcqcbLCyFiVe4q9kNmNNE9ve8LB/zZAag3dXwh1hn46UkHF0PqVlVFCed10dVBTgIJRzlmY81+vcqHjuWgVSPVhR63XsZIHEvb0mggM+s4RlB9g06hrh4x7bRL9bd7WV4eYqyBK6xqWcbEigfmD45oTLUgyDjA+3peIXkows3V+qFPnKyd1ZeM+f/Mh8K3ikVavuYsUz99eERrtWwn8qKpfnDf6lc560cqd5SN1u1pwAGMJcRWsJzYnvsCyJUDeRriqK/FIISdQIHzEhnJl1nPN9l5wWXTWiuEq5CcEih76dqfftJcvZjAToR34WB/K7aapx7yhUf3WdLAjaY0PhuIRHNHu9YXgQQTh6tPtoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(45080400002)(8676002)(956004)(6666004)(83380400001)(966005)(66574015)(6916009)(9686003)(2906002)(66556008)(508600001)(33716001)(3480700007)(4326008)(66946007)(4001150100001)(6496006)(316002)(66476007)(86362001)(8936002)(55016002)(54906003)(5660300002)(53546011)(186003)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5pU6i1WmkQee+T8objkJQgz7olOQusHIRIgw4+KNtXx0+sEJPrW8Sx/9W5?=
 =?iso-8859-1?Q?A4Zk2Q6N6BjSeO9sWC2k1VzeUHZ1rR16asl8gfakfEjWFbQyJpKIp0xnAD?=
 =?iso-8859-1?Q?C0b8dGQxtIPx1T9XKuw7CzHtKPnGs+QmAunaJmbpguNFmOuPpcP57Tjv80?=
 =?iso-8859-1?Q?U57Za2T0AVaEurWt8Tu5nOCmGgRQHlYvBGDJhyBYIUDhHh/NUxcfuK1hQm?=
 =?iso-8859-1?Q?+qo+kINMWo7/7JW3xq+49mtK1D9Z78/E/RBAB5ZfY9JAEiVtztsvslImV/?=
 =?iso-8859-1?Q?spXMYVCVNgs2J6DbbudkaFxPqqiD1Y5IczW8LVArUzDzlp4jp5XpmcIqXQ?=
 =?iso-8859-1?Q?ISt32R5BDsTf2lPTyror4GH2G62WIIIfpiTa1iCVp3jA6oLlUdM5d0UVcF?=
 =?iso-8859-1?Q?RJYB2Gpehm22M72I3p5p/yBxhCjcOdhGdoQrRFy/FALmlxBYgDPhHd2BfL?=
 =?iso-8859-1?Q?Wnbk+6FpAi3Uf8uCQts62UISCucoEvD6vhOVH3xCsBglaW9cn+imduK5uJ?=
 =?iso-8859-1?Q?Sqo0wOHF+bfFwoEnEdGkHyuro0BOj3/tQdfhcmaI80dGoAI+S1zwv6UcoN?=
 =?iso-8859-1?Q?bVQ8H8wSRzUPpO9N8aAldW6/6AWhUkqKtMTQ38oARfrWcOu+tr5Cgcy9In?=
 =?iso-8859-1?Q?foKllnd0gspha6pRW3fBD9uJecg8n3dosBnFUbEBIJO3q3Qz2cD+dJLRDd?=
 =?iso-8859-1?Q?ZXyIKd60gVXXC8IUabacLaq/ddCgTAHtz2OcYq3tW78fL3i1jRuB2C5vuB?=
 =?iso-8859-1?Q?Ivv65dbC+coTM8WIJMAKAHY2heE4AtskJrGDxmWrQWvsVwcSERRebM63Z4?=
 =?iso-8859-1?Q?j+nS40VbP1OXJmVVLTS2XHIJ2IOm84D8PgGeYYLcf39rlRNOCVkiDGc+3P?=
 =?iso-8859-1?Q?PRUfiWJ9ra5NpR1QEomAwr61mG2koLaStTqQwTCgLr8hAjjafM+Sn3hi91?=
 =?iso-8859-1?Q?uGciDE/rETWqP1M1NjHKmmjM+2ew28uejbucCRkVzm3wF54uKtJixFiH+K?=
 =?iso-8859-1?Q?DBcJ+KK10ndxXSZeY3Chh4QI7XTLf9B3mNAw65kklS45Q/adh/gkvQjj7h?=
 =?iso-8859-1?Q?YVrw2M83J0u1MxngQlRlyEfHHQwVfI1QSoSgh6U5/4CfyyQF9dogJh8z7j?=
 =?iso-8859-1?Q?yZja0iZyKWPsuUzOCBlXX6k9Zr6hnJneDk5IqeMC5xUkD0biWfy/eQTT8c?=
 =?iso-8859-1?Q?rB3+xR+H7AqyViErXjEmDZoQ7Q0jW1XiRpLY3e9EfRuHRZZddLSSfCUDsj?=
 =?iso-8859-1?Q?UM7XaYgxVkkTy6rTY7a0+y6vO+pQOET51bGP6+ayDBJy77k8mvkn5X13G1?=
 =?iso-8859-1?Q?/66ILhKxcfk+YkjkL18GRXlILYr+bLSJNP4Pg4duzI+9z2QdktHDaktImH?=
 =?iso-8859-1?Q?uCMzB4yzOSJFlbUQCiMDN9zVByVcQ3nW3bjqwBqwUEyTVxNpFQTwyFayYg?=
 =?iso-8859-1?Q?N3N5TD+2hbqJIyJjTtLEkOLsul0Ukg+A2VnTqsYDCsy2cJLqQm+QtpgPak?=
 =?iso-8859-1?Q?zftxx0wvOn7hi8ldvEfhC0ULLCwQgPWYJYOc+yX7goiUl6a2dYbn45nLp5?=
 =?iso-8859-1?Q?zFuXTiJ6mfEfGhEoPLBOLqKQS16lrQIHlIEIcuSEF3fb0y/AnHiw2SyELw?=
 =?iso-8859-1?Q?F+SPYicXTlavs8aBgObY53JbLDUmBv+p0A0Rv9pCHKa48Deuh+FSvy1bZo?=
 =?iso-8859-1?Q?Ht5yOPVGuCyGQ0FjgvI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acda7e27-49c7-47b3-cef2-08d9a82b831b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:31:48.8076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5ThqgUT1Z8JwST9xnnUJicqQ+ruLeLfkTCZb/6+tNV2/ulKqpf4lnmUpCPDi5Xc0tpUo+BbH9o6BgI8gR4fog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian KKKnig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 10:49:39AM +0100, Michel DDDnzer wrote:
> On 2021-11-15 10:04, Lang Yu wrote:
> > On Mon, Nov 15, 2021 at 09:38:47AM +0100, Michel DDDnzer wrote:
> >> On 2021-11-15 07:41, Lang Yu wrote:
> >>> On Fri, Nov 12, 2021 at 05:10:27PM +0100, Michel DDDnzer wrote:
> >>>> On 2021-11-12 16:03, Christian König wrote:
> >>>>> Am 12.11.21 um 15:30 schrieb Michel Dänzer:
> >>>>>> On 2021-11-12 15:29, Michel Dänzer wrote:
> >>>>>>> On 2021-11-12 13:47, Christian König wrote:
> >>>>>>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D214621&amp;data=04%7C01%7CLang.Yu%40amd.com%7Cee54c4d055d040ef9f8b08d9a81d3eb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725665833112900%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=7nwIYd1um420XHVpOzeIvz37%2FLQqHF%2F6aRKfzgxUTnM%3D&amp;reserved=0
> >>>>>>>>
> >>>>>>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
> >>>>>>>>
> >>>>>>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
> >>>>>>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
> >>>>>>> dm_plane_helper_cleanup_fb.
> >>>>>>>
> >>>>>>>
> >>>>>>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
> >>>>>> This should say amdgpu_display_unpin_work_func.
> >>>>>
> >>>>> Ah! So that is the classic (e.g. non atomic) path?
> >>>>
> >>>> Presumably.
> >>>>
> >>>>
> >>>>>>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
> >>>>>
> >>>>> Nope, my educated guess is rather that we free up the BO before amdgpu_display_unpin_work_func is called.
> >>>>>
> >>>>> E.g. not pin unbalance, but rather use after free.
> >>>>
> >>>> amdgpu_display_crtc_page_flip_target calls amdgpu_bo_ref(work->old_abo), and amdgpu_display_unpin_work_func calls amdgpu_bo_unref(&work->old_abo) only after amdgpu_bo_unpin. So what you describe could only happen if there's an imbalance elsewhere such that amdgpu_bo_unref is called more often than amdgpu_bo_ref, or maybe if amdgpu_bo_reserve fails in amdgpu_display_unpin_work_func (in which case the "failed to reserve buffer after flip" error message should appear in dmesg).
> >>>
> >>>
> >>> Actually, each call to amdgpu_display_crtc_page_flip_target() will
> >>>
> >>> 1, init a work(amdgpu_display_unpin_work_func) to unpin an old buffer
> >>>    (crtc->primary->fb), the work will be queued in dce_vX_0_pageflip_irq().
> >>>
> >>> 2, pin a new buffer, assign it to crtc->primary->fb. But how to unpin it?
> >>>    Next call.
> >>>
> >>> The problem is the pinned buffer of last call to 
> >>> amdgpu_display_crtc_page_flip_target() is not unpinned.
> >>
> >> It's unpinned in dce_v*_0_crtc_disable.
> > 
> > I just found crtc->primary->fb is NULL when came in dce_v*_0_crtc_disable().
> > So it's not unpinned...
> 
> __drm_helper_disable_unused_functions sets crtc->primary->fb = NULL only after calling crtc_funcs->disable. Maybe this path can get hit for a CRTC which was already disabled, in which case crtc->primary->fb == NULL in dce_v*_0_crtc_disable is harmless.
> 
> Have you checked for the issue I described below? Should be pretty easy to catch.
> 
> 
> >> I think I've found the problem though: dce_v*_0_crtc_do_set_base pin the BO from target_fb unconditionally, but unpin the BO from the fb parameter only if it's different from the former. So if they're the same, the BO's pin count is incremented by 1.

Form my observations, amdgpu_bo_unpin() in dce_v*_0_crtc_disable() is
never called. Though a single call to dce_v*_0_crtc_do_set_base() will 
only pin the BO, I found it will be unpinned in next call to 
dce_v*_0_crtc_do_set_base(). Anyway, these pin/unpin operations looks
error-prone.

Regards,
Lang

> 
> -- 
> Earthling Michel Dänzer            |                  https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fredhat.com%2F&amp;data=04%7C01%7CLang.Yu%40amd.com%7Cee54c4d055d040ef9f8b08d9a81d3eb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637725665833112900%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=EppaFKsy78tecP6oIVVuBh3enb%2Fu8jurugqEwUxDCYk%3D&amp;reserved=0
> Libre software enthusiast          |         Mesa and Xwayland developer
