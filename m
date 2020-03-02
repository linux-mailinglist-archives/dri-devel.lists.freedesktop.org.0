Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01231176651
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C84C6E856;
	Mon,  2 Mar 2020 21:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB3C6E858
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 21:45:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t11so1748937wrw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 13:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AJQB0QHCpUPfr5+6enhxEVjXwTxv09kszw7xzCnQZuM=;
 b=J+GnPzeCS4i3vfS9/B1vULV9xDevC9Ae2BlX38wnJnGyLm7/u/Hxy33kLVlJa+Y4gb
 W3TP2mEf6npZba0bZhcBEbvV6P+7zi0XKwVbPCCsLwRqUsY5XtUmvRGF64w28LOIqyU0
 FpT44OiKbb3DjbY5wt/vLZkrYf6fvmAzV6u+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AJQB0QHCpUPfr5+6enhxEVjXwTxv09kszw7xzCnQZuM=;
 b=AUP3wf2O689IMsUGoIGXwlkTpoemAtf6Bjc0NjIVy94k2ZL+oIoWO9+viGNuK4RX7l
 B7uyw5/gRcr/WOqWDvOeAsly68IKbtbpZ1o50cITFHT5cj/UZ8YaPa/CANE/Ic9U3OuZ
 a7lzy7yJjvVhigUtlBPp+udNnvJihqlmnqC4eFyoaSTSNao8AiniSKLR3fc/ii2vbJS+
 KdK03XHtZHfgcgAeUDOkh8WPyf9s35LNNth5BPIqnexsb/tnJyxmAy4MXe8FyS9Mv9zn
 IqpJHO5CeLWNXJWngi0AePcM5nr/2EcGg/Tj2t1YQd3AJ604mLyH5aAim48awbJtLpyd
 uCkw==
X-Gm-Message-State: ANhLgQ0wDTnqvj8T6qugBuAFvZo4x4Mbx2YSb8l3HeaGA8/ica2qJafu
 JT8SwdU5kgSNaUkMEvu/lP4/xDUElOw=
X-Google-Smtp-Source: ADFU+vtqHCv2/u4ld9Dt/lOn4btJwcJhR29LdtJ6cq8JcRIlQ3y5RtuJzpud4fR8AQb394+wdbl2TA==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr1494983wrm.70.1583185511188; 
 Mon, 02 Mar 2020 13:45:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u8sm411264wmm.15.2020.03.02.13.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 13:45:10 -0800 (PST)
Date: Mon, 2 Mar 2020 22:45:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
Message-ID: <20200302214508.GJ2363188@phenom.ffwll.local>
References: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
 <CACvgo50_0ZE3dxbwwv2g6937F3mA15thM_qXv=BBVodYy=mbxg@mail.gmail.com>
 <20200302214319.GI2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302214319.GI2363188@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 10:43:19PM +0100, Daniel Vetter wrote:
> On Mon, Mar 02, 2020 at 06:21:23PM +0000, Emil Velikov wrote:
> > Hi Pankaj,
> > 
> > On Mon, 2 Mar 2020 at 16:33, Pankaj Bharadiya
> > <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> > >
> > > This series addresses below drm_fb_helper tasks from
> > > Documentation/gpu/todo.rst.
> > >
> > > - The max connector argument for drm_fb_helper_init() isn't used
> > >   anymore and can be removed.
> > >
> > > - The helper doesn't keep an array of connectors anymore so these can
> > >   be removed: drm_fb_helper_single_add_all_connectors(),
> > >   drm_fb_helper_add_one_connector() and
> > >   drm_fb_helper_remove_one_connector().
> > >
> > > Changes since v1:
> > >    - Squashed warning fixes into the patch that introduced the
> > >      warnings (into 5/7) (Laurent)
> > >    - Fixed reflow in in 9/9 (Laurent)
> > >
> > For the future, include the changelog in the respective patches. This
> > makes it easier for reviewers...
> > Plus you're already changing the commit - might as well mention what/why :-)
> > 
> > Also do include the R-B, Acked-by, other tags accumulated up-to that
> > point, when sending new revision.
> 
> Yup, can you pls resend that entire pile with all the ack/review tags from
> the earlier versions included? If you don't do that you waste reviewers
> time. Another one is that resend right away also kinda wastes peoples
> time, because there's a much bigger chance that someone will review the
> old version, instead of your new one. Better wait of at least 1-2 days or
> so.

Hm just noticed that people are still reviewing v1. I'd say lets forget
about this v2 here, wait 1-2 days, and then resend with everything
combined. Hopefully not too many will re-review v2 here and waste time on
stuff that's reviewed already. Resending within hours is really not good
on mailing lists (with merge requests or whatever it doesn't matter,
because everyone always looks at the latest version).
-Daniel

> 
> > That said, if you're interested in further cleaning this up, one can
> > cleanup the drm_dp_mst_topology_cbs hooks.
> > In particular ::register_connector is identical across the board -
> > create a helper function using it directly in core, killing the hook.
> > 
> > While for ::destroy_connector - there's some amdgpu specific code in
> > there... which I'm not sure if it should stay or not.
> > To be on the save side - create a helper which will be called for
> > drivers where the hook is !=NULL (aka everyone but amdgpu).
> 
> Yeah that stuff looks fishy. Smells a bit like old mst code developed
> before Lyude fixed the refcounting for real, it seems to manually shut
> down stuff that should be cleaned up with normal code paths (modeset
> and/or final kref_put on the connector).
> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
