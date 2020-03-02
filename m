Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F0017663A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E8D6E853;
	Mon,  2 Mar 2020 21:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAE76E851
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 21:43:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z12so714923wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NZzh4WLN3HdKpheVswt4yXHXNUmZ515aYHnEfrAyU80=;
 b=gs7h1GfDUG5+J8pjU0xhwzvCzXAH3NsdHCseAfnkgzYfOY+StwLZNApz/SHEOvtH09
 N64J8RQrL59z/QQT0zCFaNuBra6Wj10/2Pk3lrjsN09rQtCaek+pcCuVKPnnnWAp5Gde
 m5IY6xR9r5XENFUTshyR4Wo1ISeS8dTgJnzTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NZzh4WLN3HdKpheVswt4yXHXNUmZ515aYHnEfrAyU80=;
 b=fsodmxiuW908nNrUUshYLywMYGr7355QX3xUIgwFj3V+gIQR1lemy6HLPT8LFW8fbS
 71BykhUQh+2VvYMqIGjff/Z19oMve/8RXgCGvKwmRuw49db7eK37gJ+Y8avJ1aFxhJ6Y
 twVNMB4X2PisSdG9JXPJdY+TZyI61Q0dbNpHtZmLnWeXtM0vawngNHghrV03TUd1qOUu
 REMbBAbmt/tnxaXvP5/X6UC+7c8mf7bTFQBcLLIG5bU6C0Ap8aAPIjNKyEO/vMApRzCT
 VivXgtQ3POWH1dipeZUDdQo9dHMcKV6KUP0rzygM/YeVKQr6WResqz8k7FZP9Kwbmf2f
 iJ8g==
X-Gm-Message-State: ANhLgQ3sZ89AVF+SlzK6RqRK25QJDWh7bOFNYpJy9AkxKIbv/BYwrLbe
 +qSlMBffs7PvL0RnnWNf0m+sAg==
X-Google-Smtp-Source: ADFU+vv/JHEYjQV9iWq4Q0Vth9RDEGZLmNzoKEhjC50zgdAcKugyciFOw1rDbUkXu9zwkNLN3/sjug==
X-Received: by 2002:a1c:a9c3:: with SMTP id s186mr434750wme.82.1583185402379; 
 Mon, 02 Mar 2020 13:43:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b16sm26144377wrq.14.2020.03.02.13.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 13:43:21 -0800 (PST)
Date: Mon, 2 Mar 2020 22:43:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 0/7] drm: drm_fb_helper cleanup.
Message-ID: <20200302214319.GI2363188@phenom.ffwll.local>
References: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
 <CACvgo50_0ZE3dxbwwv2g6937F3mA15thM_qXv=BBVodYy=mbxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50_0ZE3dxbwwv2g6937F3mA15thM_qXv=BBVodYy=mbxg@mail.gmail.com>
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

On Mon, Mar 02, 2020 at 06:21:23PM +0000, Emil Velikov wrote:
> Hi Pankaj,
> 
> On Mon, 2 Mar 2020 at 16:33, Pankaj Bharadiya
> <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> >
> > This series addresses below drm_fb_helper tasks from
> > Documentation/gpu/todo.rst.
> >
> > - The max connector argument for drm_fb_helper_init() isn't used
> >   anymore and can be removed.
> >
> > - The helper doesn't keep an array of connectors anymore so these can
> >   be removed: drm_fb_helper_single_add_all_connectors(),
> >   drm_fb_helper_add_one_connector() and
> >   drm_fb_helper_remove_one_connector().
> >
> > Changes since v1:
> >    - Squashed warning fixes into the patch that introduced the
> >      warnings (into 5/7) (Laurent)
> >    - Fixed reflow in in 9/9 (Laurent)
> >
> For the future, include the changelog in the respective patches. This
> makes it easier for reviewers...
> Plus you're already changing the commit - might as well mention what/why :-)
> 
> Also do include the R-B, Acked-by, other tags accumulated up-to that
> point, when sending new revision.

Yup, can you pls resend that entire pile with all the ack/review tags from
the earlier versions included? If you don't do that you waste reviewers
time. Another one is that resend right away also kinda wastes peoples
time, because there's a much bigger chance that someone will review the
old version, instead of your new one. Better wait of at least 1-2 days or
so.

> That said, if you're interested in further cleaning this up, one can
> cleanup the drm_dp_mst_topology_cbs hooks.
> In particular ::register_connector is identical across the board -
> create a helper function using it directly in core, killing the hook.
> 
> While for ::destroy_connector - there's some amdgpu specific code in
> there... which I'm not sure if it should stay or not.
> To be on the save side - create a helper which will be called for
> drivers where the hook is !=NULL (aka everyone but amdgpu).

Yeah that stuff looks fishy. Smells a bit like old mst code developed
before Lyude fixed the refcounting for real, it seems to manually shut
down stuff that should be cleaned up with normal code paths (modeset
and/or final kref_put on the connector).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
