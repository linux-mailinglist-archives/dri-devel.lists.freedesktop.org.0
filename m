Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2E6C0C19
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 09:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DF810E269;
	Mon, 20 Mar 2023 08:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26A610E269;
 Mon, 20 Mar 2023 08:23:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2DCCFB80D64;
 Mon, 20 Mar 2023 08:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C90C433EF;
 Mon, 20 Mar 2023 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679300589;
 bh=yabM2Apro8qj1FFGuBwMuZQLTe9feWHYNh167tSAo/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQz4d/CjYV65d+oc0RsBzPvJVmoNHKT1JzJDzHNRDyExrY6Ouospb5UWeHqL/aFha
 ExoNGowakQFwy2IJw0U7OnzVMktBFIk47fG92XQoUMc8uL2mNU1szyD5uL3BssQ9Yi
 RRG/qMo5Z+vwNSmkFmbs0/Z54yG0iRBtIYelvjSnKj1D7IyPJNA5rnlz+LbC2/juX1
 2a9jITzl6/We/jMTTQbbEkRdlEt7yBBiUm+1U9AzRe9LiwCA9IIC/y6O2pOYYvJeq+
 62d7Cr5NDhx3a4wU0xtO+2kN0Yev4eDeChwTLi45TG+mxxP5lSj0Jt3ajoDuaecvc6
 6lH+DTL+yYGbw==
Date: Mon, 20 Mar 2023 08:23:03 +0000
From: Lee Jones <lee@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 36/37] drm/amd/display/dc/link/link_detection: Demote a
 couple of kerneldoc abuses
Message-ID: <20230320082303.GL9667@google.com>
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-37-lee@kernel.org>
 <CADnq5_MhMNbcChfaQ=qbk7=F0xQ+nHvFf6W9Q+rEqXm0Zac14w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MhMNbcChfaQ=qbk7=F0xQ+nHvFf6W9Q+rEqXm0Zac14w@mail.gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Mar 2023, Alex Deucher wrote:

> Applied.  Thanks!
>
> Alex

Awesome as ever Alex.  Thank you.

> On Fri, Mar 17, 2023 at 4:24 AM Lee Jones <lee@kernel.org> wrote:
> >
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:877: warning: Function parameter or member 'link' not described in 'detect_link_and_local_sink'
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:877: warning: Function parameter or member 'reason' not described in 'detect_link_and_local_sink'
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1232: warning: Function parameter or member 'link' not described in 'dc_link_detect_connection_type'
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Wenjing Liu <wenjing.liu@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > ---
> >  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> > index 9a4cfa777622e..67addedd89563 100644
> > --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> > +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> > @@ -832,7 +832,7 @@ static void verify_link_capability(struct dc_link *link, struct dc_sink *sink,
> >                 verify_link_capability_non_destructive(link);
> >  }
> >
> > -/**
> > +/*
> >   * detect_link_and_local_sink() - Detect if a sink is attached to a given link
> >   *
> >   * link->local_sink is created or destroyed as needed.
> > @@ -1185,7 +1185,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
> >         return true;
> >  }
> >
> > -/**
> > +/*
> >   * link_detect_connection_type() - Determine if there is a sink connected
> >   *
> >   * @type: Returned connection type
> > --
> > 2.40.0.rc1.284.g88254d51c5-goog
> >

--
Lee Jones [李琼斯]
