Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048B44FEBC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 07:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9256E190;
	Mon, 15 Nov 2021 06:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3E16E190;
 Mon, 15 Nov 2021 06:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2CQ4g8+SCZuTXhqv39OsVoXwBItGgUtz2+aojprY4b7U7VHcPRtpeEKP3KskiQZDzCheOJ6WwL0wVcA4oRY/nTNWGvXUXFr6FZ4SQO/Nwk9iF4kTcaf4i1dPLaGExaAIBIfuyza7Lh6CbrEhVGVY7rlBuwLip3oJwomoRXNPw0elPczfz8+0Jp6Ynhmmsi71XrDTO2HiGIH0prljHNYipTjjY4qVTP6Jc7SptRD/N+ZbIcWVE88wpsEsioA0L+ENCDLF/Git5Pdn5m5v25q+u8DBOPYkUG48BQ0gy6Ptq1LAvOqe71je6zeKjdkVJlKiDtHTKZZBfYkcFnfb/WjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snktmgtZdxUVrVoNyUayUjAnh2Aa68VTbxZOYbTMGkQ=;
 b=itB+N/EpcsK+/2e71Gmq4v5g4R3H8yS11ZGkKWOkbdKaiQOVP31nqQIJKVyj6YWltbP9jxVIi7robnt96EsWfLKnDGiHVdVmSWmTL/cdfzxvU72CD+vXdCfdvh5j/REp76AAsF3pF8N4SJW9eBP4gCWE7dLqzlw7iZsORDXbX7yVlcIqKmPrcpTop71KyT+PXTSZTtAwBwDOpyDBVDYkbgQEY95sPmH/y8HPtkmlE2oL3AqonZsu7U/An1+LloJh5o5nc2owjC70n/OH9CBdmvBDzhUDwcSpttJ8p8LdBqBcdy+FE04afD0cEBqzGrjF+oX1HSe49pnQ/yYMtF/lBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snktmgtZdxUVrVoNyUayUjAnh2Aa68VTbxZOYbTMGkQ=;
 b=HyzyCElxsGRqt30MkiUc+xpJkRbGZ6yH2tYgf9azplh6sKLiN7RdoBleLMrsDIOgB+7RV7Li8t/+huimEAuBvoPxC8XORbrEVmFLadnfmP6qQKBn5ZwEn1hjlfFVJbDvghcpYcOK6ba1itXr0KkW0sNYY6TckKJ6FQ00Znp+Dss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) by
 DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Mon, 15 Nov 2021 06:41:16 +0000
Received: from DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa]) by DM6PR12MB4250.namprd12.prod.outlook.com
 ([fe80::711a:4c44:b4a7:4afa%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 06:41:15 +0000
Date: Mon, 15 Nov 2021 14:41:01 +0800
From: Lang Yu <Lang.Yu@amd.com>
To: Michel DDDnzer <michel@daenzer.net>
Subject: Re: Questions about KMS flip
Message-ID: <YZIA/dkvjuMsup24@lang-desktop>
References: <YYV0W1CxT5torU7u@phenom.ffwll.local>
 <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
 <YYk7SkflDx8ToqYG@phenom.ffwll.local>
 <4ba7e3f8-7956-882a-6888-57e2448b907d@amd.com>
 <YYvIfXy9bwPokiK9@phenom.ffwll.local>
 <ab2fb071-12ab-da99-53c9-1411ca9acdaa@amd.com>
 <9a5b8470-d02d-71b4-4a89-6d6c32fdfa5d@daenzer.net>
 <88dfe9b4-e170-2d6b-604b-03af5d57152b@daenzer.net>
 <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To DM6PR12MB4250.namprd12.prod.outlook.com
 (2603:10b6:5:21a::9)
MIME-Version: 1.0
Received: from lang-desktop (165.204.134.244) by
 HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25 via Frontend Transport; Mon, 15 Nov 2021 06:41:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5459c81-74b7-410f-cd90-08d9a802ec30
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2491DCD6BA505B32B51883EEFB989@DM5PR1201MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFxYSpwIJ9lLt1GM+yMCyEtkTiBV6ODtgzQ8DI6pfvAHg3uFEkFxhIyl0EVK9tPyAf0Z1WQiS+FlEgcjWF1noTdYFq5N5x4wZUUEJAle7HqyV78WIBqYJ9DotCPasRgFdEbMD+OdSESIwWHHeWncebMHBcsCbQAs/kgmeDmQ2AXTEhuJfUznSss7FJGcrZeRaDu4Kh+aLi7QfSBmZB2KSp45VTvbFkEpvH0cAEuBm83h6LJIDcfjyLfsiORBE8FGUghXjdDDz288df4X6QOic1/LBuMHU2Xo8yaN/hs0cunImTdnBYhl1ZKk30G8tA6IGI8FIAaKMojJSThOYdAa3iO48hqPoFsolDMgU1fDHtSVqp3FxuX1oipt15EU0IWCuoet8NWJhDs0GwrkNUWvM9wa+syszGG479hsBtk1hrNI/wnvOfq85Xpeib8YMtQtOXclmsvr45yJSPsuMfB3rHR3UeU9O6ufHIL7M8BQZgw4a+gBX4+YbWTA7C+5rkDNWZ5uFh29FyrHNiao7I0IlkzwMl7vNu1Ud5XQFCrQpawRh/xLiTh6heSDmG3GxC5k7a+UiYe5iyvXA9mrW0R6BVbQQSe4LrdX2T73BZ2CNbIz4Q8zmzAPHZseItZWcZV1L9aBueIMhGNOQrsTcMOuwnirPz/qw9oRIgKiNoAx+DyH8drBJ7T/0BDvLCsW0ayVmKT5uDO5yled+JoFv8kxRCOd7+ZeSlJloUyCPob6Xtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4250.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(8676002)(6916009)(55016002)(5660300002)(9686003)(26005)(33716001)(4001150100001)(8936002)(186003)(38100700002)(966005)(6666004)(66574015)(2906002)(86362001)(45080400002)(66556008)(4326008)(53546011)(54906003)(316002)(508600001)(3480700007)(956004)(66476007)(83380400001)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QYR4zxzawMl6EaEyH8c1eAdYfHknf3m187B76YkQm4ckRUhsOkdRZeNV1b?=
 =?iso-8859-1?Q?jmlf+DizKYYT5HpbHxmflkT3DEvFy8EhK3v49QkQl6FPk8SjvhDZbTKsdn?=
 =?iso-8859-1?Q?xERC9ObR/LPe8s5eVecrZj0eaXo+3LjXQLhevyOYt9WgAntrsbBmwsBjsI?=
 =?iso-8859-1?Q?B1vRG8bccvKXkaHU9xxA8kBx/VquF8KspFWoyWSMt2uBp9+G7BXEXmFuVh?=
 =?iso-8859-1?Q?bzSjvGoxqdt8BXjgBh1dLCsEClpiopng+EtAAYcbDUkJ4dGn6lCeZJfN0r?=
 =?iso-8859-1?Q?46cptoNXXF+zByxfWnkYi+bc/059osmrOezC/yAeNiLpNYjYgLVEtwmPVR?=
 =?iso-8859-1?Q?mvqCzBxP0hK7+XG5MbKBh/vvitGt+fPKTFi6Y/kkle4TbazcKELYPJkt3K?=
 =?iso-8859-1?Q?ALEaJp/JESj/gbW2/caaaqqYO4cftAFQfqQcqMnKBbE93GUmd8jCHAnC01?=
 =?iso-8859-1?Q?pkaY7oeas7+knaTM2k4Rg6JPETRDIWKqf4WCRD9eSR0+Udazrs291LsgTB?=
 =?iso-8859-1?Q?+5K74E68IMGjiD2DET+Mh1LAjchjRfO5XwRbi/DA2PIhBV2Zi8QnR9vskC?=
 =?iso-8859-1?Q?UXUenhqg4jbWb/FFJv68KFcYHFCR8v9aZFKIQ5Pe/1zy33RyFbP8y9kMaD?=
 =?iso-8859-1?Q?R+Ej2nrKOtXshMMxXArrBfgTupR07uyduruYoyNpiMQEaqid3aXCzc0ip2?=
 =?iso-8859-1?Q?PnY585ZzGrpnpQUEJ48kaAZI5mZiw2hmZ/+8OAFXMdBJlVuWBNxslAoMwr?=
 =?iso-8859-1?Q?XTViILjmOUj20dCknEI0+lXL/TlL3ahZOGbhEhAfu0LhWheyLPHN3Z4UyV?=
 =?iso-8859-1?Q?Mw+ZrnLMA5c1l58WT+GxaQz2p3frBEpGZtONoR0OvVJwG3RimSq7Z3dsba?=
 =?iso-8859-1?Q?JB2qQ9yC2HKPPOAVQh5gn5gRpKQneQYG145TYclec3umZmYKdXLwKD6Z0J?=
 =?iso-8859-1?Q?8OzCWnAQ/HC+NjRiaUP655Q+zhL+9VurQqEBNbjNhyh+qb5W62HAWNQP8U?=
 =?iso-8859-1?Q?DmoDmSvPkOsnetiINdJlFfG4IxegGVc5CiDxFdSkISCCS+MveztpNaLouh?=
 =?iso-8859-1?Q?V5ZBMsv6fBbDZYb/3baJEmo6U0kjbBjD1k0uRvOstHYAHCNHq10JVOezdc?=
 =?iso-8859-1?Q?Pvmq32AVrYRi+RRwBw/jXeXrcW5wvdLpAQrdO3+qZKgQU+IXCcZc2ydduZ?=
 =?iso-8859-1?Q?DCgOsUmaKfGsgnijpYDAmNyYbnjoi/207exsWVKk2lCQtFoqE8ehGjxSwk?=
 =?iso-8859-1?Q?pJiL+MoD57w4p10YuBxTDTHEELkcx/UHoT//86WspIrtsRzkJntjdMecxS?=
 =?iso-8859-1?Q?l1lE0wVupGpE6+juj4tIlfxhVUM42plKu83mrgdj9WrQ+XchJ3J3eDd/SC?=
 =?iso-8859-1?Q?cvCR0AOAPxeedZiTN01l3jlta8cQlsq/DJUE30oSbOQzSVH3depkLXm8p7?=
 =?iso-8859-1?Q?1MSs0fzR8WPtcszBo1O6I2KSMp7y9QMg1/GPAALCBaItqWuKuNQimXR+Bj?=
 =?iso-8859-1?Q?IAEsuuMPq74MFp+j/sOgV9ck5BmnQ3BOqlILg9x6wWYi6p2KGHyJs3BJV6?=
 =?iso-8859-1?Q?h4LNbVgGplZR381ofWgnovufIbz//AY3rFbBvPYgH04fBK1zDiaX51hKVA?=
 =?iso-8859-1?Q?QBaYsPBZGRPTatWpaX0MzOsAPPgsBgD7jjXrZ2qvhXS/dw0i+hF0AjpUh+?=
 =?iso-8859-1?Q?ZEcizaWPaxYtE+vWVsg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5459c81-74b7-410f-cd90-08d9a802ec30
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4250.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 06:41:15.8117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47mQGCPDjGgM0N5kWKbZ3COafsDv7fGDjgxr4u5hT46bebYfJHFsI+ttX6z1U+zDeOAw4DwBxWmW4Aj7h/FiAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2491
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

On Fri, Nov 12, 2021 at 05:10:27PM +0100, Michel DDDnzer wrote:
> On 2021-11-12 16:03, Christian König wrote:
> > Am 12.11.21 um 15:30 schrieb Michel Dänzer:
> >> On 2021-11-12 15:29, Michel Dänzer wrote:
> >>> On 2021-11-12 13:47, Christian König wrote:
> >>>> Anyway this unfortunately turned out to be work for Harray and Nicholas. In detail it's about this bug report here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D214621&amp;data=04%7C01%7CLang.Yu%40amd.com%7Cca557eab16864ab544a108d9a5f6f288%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637723302338811983%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=9oG6k22BVp%2BkSvRX6uMlGXc6G%2BA5UL0Qy3W5iDTpvzs%3D&amp;reserved=0
> >>>>
> >>>> Lang was able to reproduce the issue and narrow it down to the pin in amdgpu_display_crtc_page_flip_target().
> >>>>
> >>>> In other words we somehow have an unbalanced pinning of the scanout buffer in DC.
> >>> DC doesn't use amdgpu_display_crtc_page_flip_target AFAICT. The corresponding pin with DC would be in dm_plane_helper_prepare_fb, paired with the unpin in
> >>> dm_plane_helper_cleanup_fb.
> >>>
> >>>
> >>> With non-DC, the pin in amdgpu_display_crtc_page_flip_target is paired with the unpin in dm_plane_helper_cleanup_fb
> >> This should say amdgpu_display_unpin_work_func.
> > 
> > Ah! So that is the classic (e.g. non atomic) path?
> 
> Presumably.
> 
> 
> >>> & dce_v*_crtc_disable. One thing I notice is that the pin is guarded by if (!adev->enable_virtual_display), but the unpins seem unconditional. So could this be about virtual display, and the problem is actually trying to unpin a BO that was never pinned?
> > 
> > Nope, my educated guess is rather that we free up the BO before amdgpu_display_unpin_work_func is called.
> > 
> > E.g. not pin unbalance, but rather use after free.
> 
> amdgpu_display_crtc_page_flip_target calls amdgpu_bo_ref(work->old_abo), and amdgpu_display_unpin_work_func calls amdgpu_bo_unref(&work->old_abo) only after amdgpu_bo_unpin. So what you describe could only happen if there's an imbalance elsewhere such that amdgpu_bo_unref is called more often than amdgpu_bo_ref, or maybe if amdgpu_bo_reserve fails in amdgpu_display_unpin_work_func (in which case the "failed to reserve buffer after flip" error message should appear in dmesg).


Actually, each call to amdgpu_display_crtc_page_flip_target() will

1, init a work(amdgpu_display_unpin_work_func) to unpin an old buffer
   (crtc->primary->fb), the work will be queued in dce_vX_0_pageflip_irq().

2, pin a new buffer, assign it to crtc->primary->fb. But how to unpin it?
   Next call.

The problem is the pinned buffer of last call to 
amdgpu_display_crtc_page_flip_target() is not unpinned.

It should be an imbalance call to pin/unpin.

> 
> -- 
> Earthling Michel Dänzer            |                  https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fredhat.com%2F&amp;data=04%7C01%7CLang.Yu%40amd.com%7Cca557eab16864ab544a108d9a5f6f288%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637723302338811983%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=fJroRJc4SYuUXX1U52X%2FktYpAKaADg3kM9PsONnKu8c%3D&amp;reserved=0
> Libre software enthusiast          |         Mesa and Xwayland developer
