Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273CD23D34C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 22:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3B66E83F;
	Wed,  5 Aug 2020 20:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0089.hostedemail.com
 [216.40.44.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2BC883F4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 20:53:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 5C1FC181D3026;
 Wed,  5 Aug 2020 20:53:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3653:3867:3870:3871:3872:4321:4605:5007:7576:10004:10400:10848:11026:11232:11233:11657:11658:11914:12043:12050:12296:12297:12555:12740:12760:12895:12986:13069:13095:13311:13357:13439:14181:14659:14721:21080:21433:21627:21990:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: farm00_4b167ce26fb2
X-Filterd-Recvd-Size: 2363
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed,  5 Aug 2020 20:53:26 +0000 (UTC)
Message-ID: <a8ab7d75ef9df54bd193fc88e0670b30026e7e67.camel@perches.com>
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
From: Joe Perches <joe@perches.com>
To: Alex Deucher <alexdeucher@gmail.com>, Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 13:53:25 -0700
In-Reply-To: <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
References: <20200805113510.18277-1-colin.king@canonical.com>
 <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-08-05 at 16:01 -0400, Alex Deucher wrote:
> On Wed, Aug 5, 2020 at 7:35 AM Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake in a DRM_ERROR message. Fix it.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This is already fixed.

This fix is not in today's -next.

Perhaps whatever tree it's fixed in should be in -next.


$ git show --oneline -s
d15fe4ec0435 (HEAD, tag: next-20200805, origin/master, origin/HEAD) Add linux-next specific files for 20200805

$ git grep -i falied drivers
drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:                DRM_ERROR("Falied to terminate tmr\n");

> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
[]
> > @@ -2010,7 +2010,7 @@ static int psp_suspend(void *handle)
> > 
> >         ret = psp_tmr_terminate(psp);
> >         if (ret) {
> > -               DRM_ERROR("Falied to terminate tmr\n");
> > +               DRM_ERROR("Failed to terminate tmr\n");
> >                 return ret;
> >         }


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
