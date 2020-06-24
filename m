Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975172076E6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C206E0F9;
	Wed, 24 Jun 2020 15:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0026A6E0F9;
 Wed, 24 Jun 2020 15:11:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b6so2629557wrs.11;
 Wed, 24 Jun 2020 08:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ujwQciPl+L7lbdcyijKwCUqH7IK4/9USSSXUk6qmZOg=;
 b=SLLo7z94ccgwtDRo0DFIuN0STQWBcNUVZRVpDAX0TnbXHV/3AfY7PhJ3vY6yeCIH/p
 J/bRTe2lxeuS/kMB3cPIpFqxkvT0V9JUW7F1Ogi7YXj5mrC0SW4YKpNJGfXyMdgUTSBN
 SL7zioevlWWqq2F5+Iyq0KGMeVPqSp2qDGZpkKCoQzpDrArtAR+pd1Fg3z7EVwTM3afV
 rv5/iz2fwdHuzU1R8q0Hq0Bm1wz3GL/3HDF1q9XuOipEvbPrfp6UC8cg3iTIEEsBxCq0
 sJN8yqiKVu+Zr9WIQvF4U2zzpiW7BoCgHCEFi3VDNhDmtRVpsaAFiutq3h55vS7ysc2w
 jVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ujwQciPl+L7lbdcyijKwCUqH7IK4/9USSSXUk6qmZOg=;
 b=LSnyPfWXTd7usnL2jgUjYa2vraWxULgD0ZVyTmxAEkpGUwvaUqIEnSmq1uB8Pjxvbw
 f2NBpLz0MIbTRs2x8Be+u7UUBwuYRNwTkgl3LOEhWeBXMJiwquQpCbVcdCsIleoFXSAw
 qYCqLoKTbZfKMtBkWDXdcH8RSOAq4IuQ4oQkrQ7Hpl76MS5xMps3ulyfM+31g48Bz7yw
 Y4k89q/Q7vAeKSqIwOMb32Ho3WbTspXAHdX5mrsUu7F2f1psFUHf0Rvne4A25eXPs+bY
 7qKYwsWeXwCcxmqJUeffVQi8s/5cZ2rIVYrEDRCa11LVIhY9ieyeIndLkub4Unu46qdV
 94cw==
X-Gm-Message-State: AOAM530nkseW5IawdpZfKSMHejVmvyYV5AL/u7e4uYTQWQ63kgIR8PRv
 jd9knNcgPFAo5Wp/Pt5SiTbccnTgTEIpnI1z4GY=
X-Google-Smtp-Source: ABdhPJxcZ8Rrz4WTVA4JzfkWUwnDA9iyEW5D2N5Bj7502ovzHh8Sp8ZDl5fWVo+v3zOctaqg18jwU0autp6y1oTfP34=
X-Received: by 2002:a5d:5549:: with SMTP id g9mr28913930wrw.419.1593011516671; 
 Wed, 24 Jun 2020 08:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200624141423.6307-1-colin.king@canonical.com>
 <f9ceecb4-2679-c0e2-8f64-4dd2a4f5401f@amd.com>
In-Reply-To: <f9ceecb4-2679-c0e2-8f64-4dd2a4f5401f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jun 2020 11:11:45 -0400
Message-ID: <CADnq5_PA+Qs=oBkWwSneD1ptAVMdLcN3zL=UrjsNQFnaA2wLYQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm: amdgpu: fix premature goto because of missing
 braces
To: Nirmoy <nirmodas@amd.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jun 24, 2020 at 10:32 AM Nirmoy <nirmodas@amd.com> wrote:
>
> Acked-by: Nirmoy Das <nirmoy.das@amd.com>
>
>
> Thanks,
>
> Nirmoy
>
> On 6/24/20 4:14 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently the goto statement is skipping over a lot of setup code
> > because it is outside of an if-block and should be inside it. Fix
> > this by adding missing if statement braces.
> >
> > Addresses-Coverity: ("Structurally dead code")
> > Fixes: fd151ca5396d ("drm amdgpu: SI UVD v3_1")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> > index 599719e89c31..7cf4b11a65c5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
> > @@ -642,9 +642,10 @@ static int uvd_v3_1_hw_init(void *handle)
> >       uvd_v3_1_start(adev);
> >
> >       r = amdgpu_ring_test_helper(ring);
> > -     if (r)
> > +     if (r) {
> >               DRM_ERROR("amdgpu: UVD ring test fail (%d).\n", r);
> > -     goto done;
> > +             goto done;
> > +     }
> >
> >       r = amdgpu_ring_alloc(ring, 10);
> >       if (r) {
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
