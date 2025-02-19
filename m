Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE59A3CDC5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DA310E097;
	Wed, 19 Feb 2025 23:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="cXARaUQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38CC10E885;
 Wed, 19 Feb 2025 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=oarx2htQhbiEQaRIQ4Up+yKSdMWBsn+7UK21V4YdlnU=; b=cXARaUQW2aHXVgWd
 5AYAllghPG7J7CbtqFQEDgaQyCW4r529khKxoiaqpVktYlR1dGP+bbvzsuAIflvRFE4we2fJ5ExCi
 FpchPS1gFVQA/MaJ24pdijHIPrzJGPFDQ6Ctw5k98FxC8+ffkAfHFie90/cCnw/SDlVfN3F76X1G7
 zHqeuLJQITYU/VxBdk/zDY6ZBNaB9yn4f/tCRgnJ+og/Gikb71GX+4gbiK/4ZasXORLjfbBmnk9q8
 BdzUwoFRoqbKsw0yqzWyOwdzEAFUOznSZ/261dcSR/Hz/9SKhVNmsPooHrGCDrsnsPTf62gxiACZH
 ty2AZ95D0mdPK0Q1HQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tkqEh-00GzPF-2D;
 Wed, 19 Feb 2025 19:59:59 +0000
Date: Wed, 19 Feb 2025 19:59:59 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, Hawking.Zhang@amd.com, Likun.Gao@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: missing wire up of nbif_v6_3_1_sriov_funcs ?
Message-ID: <Z7Y4P4hEltSuHLEy@gallifrey>
References: <Z7YomFgEdOZzIyun@gallifrey>
 <CADnq5_NpxZLJxvP0dWwT_9MbyLUvuTSWHTt7j=cgqeQUsPiDwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NpxZLJxvP0dWwT_9MbyLUvuTSWHTt7j=cgqeQUsPiDwA@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 19:59:32 up 287 days,  7:13,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Mailman-Approved-At: Wed, 19 Feb 2025 23:48:37 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alex Deucher (alexdeucher@gmail.com) wrote:
> On Wed, Feb 19, 2025 at 2:04 PM Dr. David Alan Gilbert
> <linux@treblig.org> wrote:
> >
> > Hi All,
> >   I think you may be misisng some wiring of nbif_v6_3_1_sriov_funcs.
> >
> >   My scripts noticed 'nbif_v6_3_1_sriov_funcs' was unused;
> > It was added in:
> >   Commit: 894c6d3522d1 ("drm/amdgpu: Add nbif v6_3_1 ip block support")
> >
> >
> > and is:
> > drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c:
> >   const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs = {
> >
> > but, it's not referenced, which makes me think it perhaps
> > should be in:
> > drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> >
> > I see for 4.3.x there is:
> >   case IP_VERSION(4, 3, 0):
> >   case IP_VERSION(4, 3, 1):
> >     if (amdgpu_sriov_vf(adev))
> >       adev->nbio.funcs = &nbio_v4_3_sriov_funcs;
> >     else
> >       adev->nbio.funcs = &nbio_v4_3_funcs;
> >     adev->nbio.hdp_flush_reg = &nbio_v4_3_hdp_flush_reg;
> >     break;
> >
> > but for 6.3.1 we have:
> >
> >   case IP_VERSION(6, 3, 1):
> >     adev->nbio.funcs = &nbif_v6_3_1_funcs;
> >     adev->nbio.hdp_flush_reg = &nbif_v6_3_1_hdp_flush_reg;
> >     break;
> >
> >
> > so is that supposed to have something similar?
> 
> They can be dropped.  I think they were just copy and paste leftovers.

Thanks for the reply.

OK, I'll send a patch then to remove nbif_v6_3_1_sriov_funcs.

Dave

> Alex
> 
> >
> > Dave
> >
> > --
> >  -----Open up your eyes, open up your mind, open up your code -------
> > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> > \        dave @ treblig.org |                               | In Hex /
> >  \ _________________________|_____ http://www.treblig.org   |_______/
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
