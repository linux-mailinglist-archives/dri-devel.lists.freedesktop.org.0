Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B317EA2F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD1E6E58A;
	Mon,  9 Mar 2020 20:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F916E58A;
 Mon,  9 Mar 2020 20:37:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z15so12970021wrl.1;
 Mon, 09 Mar 2020 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etQwsxZhquxB/PEuJ02TQzUR5LQnS/E2DgPvNBKCcws=;
 b=CLlb1cI0LmgVVywtN8uI2aWxGHzGxePlNfk7QVc9L7xqH4VDZgKPLxVyq1haUWBtcT
 yCukEHIgCPCflhEgQZsUhK3eKoaFctbTmR3H/K7HEOqiyoxcr+0XOc6+0tUWK9XS+Wk7
 Q5s423OmcF7V7iAKg8DgUGQrYv7dDibX3waz7ytKwnF+OAtkQ6H0N30dKo76PDhJp6+D
 YqIgbgaKtfyiqXTco0gc/n1l6NBPRvFHC97WfWKYXfHUn/df/bxGyi7MUb5qkZALPCmz
 EL8UJmcfL63XBHwBe2jKuy+pKTHm/ZUuA/EJSebfgzPmYpuVy9x8GFl6rJxgeUliPR51
 qKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etQwsxZhquxB/PEuJ02TQzUR5LQnS/E2DgPvNBKCcws=;
 b=dUrCOQcdvJivoHLx4ZqSdHLgh9PyEmUqmoF2FNW2mWIX4ZjFNhlbtCw7yjMl5JEK+d
 6QIXBGwE9BBBV5nSEZ3+qNA52/raoi7nNdmaArAgFFETZXoWjv0S2OSNB0+YfaPDDwED
 33rNx9PsOgsBReWMzZlMMGiFkKbdHlYGtBX27EIMmrHzpXSNlIF5hsC/ZsJqq81ekdaE
 1zS8t855Xpbe3SUYpC+s7wpYay7h5J9f2TOOvq4MiQQCy9GYZO6rAZ9o9Scfk/5UQT5B
 AQumxAeKdiH1eV3ORFP9fj6MT0ohg3+oKNod5d1tdKXJ/G2NLtS8ZkA8ZBVzr94MIEfB
 /85g==
X-Gm-Message-State: ANhLgQ2xx6xru72xOmk5ow6QMpVvOLLwFbufcumI/IbIvc0Ty4OlOe9z
 zSib9sBwA5Fl4qOi86ifu4RkC06hwzvoZzHCAiY=
X-Google-Smtp-Source: ADFU+vtIxLO03bQvdjuyVpFZU+MOpT3RFri6ow5zLqmcOVNL9eIPkK7DOus4kdqyL4MWFJAQv65bOYmiNu5cjFqyOi4=
X-Received: by 2002:a5d:6688:: with SMTP id l8mr22330427wru.362.1583786259114; 
 Mon, 09 Mar 2020 13:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
 <9e5fcbcd3f7a4d74b9941a21e0407c6eef79e920.camel@redhat.com>
In-Reply-To: <9e5fcbcd3f7a4d74b9941a21e0407c6eef79e920.camel@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Mar 2020 16:37:27 -0400
Message-ID: <CADnq5_PM5guD=LgyKo613PJkgEO=5Kwc_B1Gkwev1pPKEbsSSQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Cleanup drm_dp_mst_topology_cbs hooks
To: Lyude Paul <lyude@redhat.com>
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
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 9, 2020 at 4:27 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Sat, 2020-03-07 at 14:00 +0530, Pankaj Bharadiya wrote:
> > drm_dp_mst_topology_mgr_cbs.register_connector callbacks are identical
> > amongst every driver and don't do anything other than calling
> > drm_connector_register().
> > drm_dp_mst_topology_mgr_cbs.destroy_connector callbacks are identical
> > amongst every driver and don't do anything other than cleaning up the
> > connector((drm_connector_unregister()/drm_connector_put())) except for
> > amdgpu_dm driver where some amdgpu_dm specific code in there.
>
> Yeah that amdgpu destruction code kinda stinks a little bit :\. I think we can
> just drop some of it and move the rest into their connector destruction
> callbacks.
>
> For the whole series:
>         Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> I'm going to go ahead and let the maintainers know I'm going to push this
> (since there's some minor changes here outside of drm-misc), and push this to
> drm-misc-next. Then I'll go and write some patches to remove the leftover amd
> bits and drop the callback for good (I'll cc it to you as well).

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> >
> > This series aims to cleaup these drm_dp_mst_topology_mgr_cbs hooks.
> >
> > Pankaj Bharadiya (5):
> >   drm: Register connector instead of calling register_connector callback
> >   drm: Remove dp mst register connector callbacks
> >   drm/dp_mst: Remove register_connector callback
> >   drm: Add drm_dp_destroy_connector helper and use it
> >   drm: Remove drm dp mst destroy_connector callbacks
> >
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  6 ------
> >  drivers/gpu/drm/drm_dp_mst_topology.c         | 18 +++++++++++++++---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 16 ----------------
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 19 -------------------
> >  drivers/gpu/drm/radeon/radeon_dp_mst.c        | 17 -----------------
> >  include/drm/drm_dp_mst_helper.h               |  1 -
> >  6 files changed, 15 insertions(+), 62 deletions(-)
> >
> --
> Cheers,
>         Lyude Paul (she/her)
>         Associate Software Engineer at Red Hat
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
