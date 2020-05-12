Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58E1CEA8A
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 04:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD136E073;
	Tue, 12 May 2020 02:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDD56E064;
 Tue, 12 May 2020 02:10:15 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id o134so512730ybg.2;
 Mon, 11 May 2020 19:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zcq/C2mPvyaxNF2lVsVAAK7HuZoD0vL2Lekk73ttM9c=;
 b=QTUTR10HRSLC/TmGuicNIvhxEmKHNlDigJZyRKIMl5gsEAteM0iWF2eGAR9PHoTKdk
 At3sV9vTEbhZ8oRwK/8/kCkUgmTNEE1Repq8YEpp93GaLiWSyTmfOzhDkJz0KlCT55JN
 bsVpDPvwP32JFAJl9iu8vSl5V6tSmUurImMPDwvROdzbHw9ELGxiq0ZF6ucA3herDxcs
 WdOWxLlkcB3zq4eaI1iWNmf3/S2ZT5nUyhO59z7zVvp+IXyTabwffYP4Zt6ZelvPvVIe
 nqaNU/M2Q7apIJRecgFESPxwZzKAh4utAi8TGLCalSX5LLlpvewah/jzj4b6sJ0yGDs6
 ucuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zcq/C2mPvyaxNF2lVsVAAK7HuZoD0vL2Lekk73ttM9c=;
 b=WeqUBeh2veTI4ta0mcaq/OxRV5CmeCC5LvLpcNsdA6RiiCMwAQce8nw+KBk0xXnf6K
 cCsAmQ8YQ7ZtaI5xT5iriUh1kwXWqiK3Y2uh9rgrhSG/YEViUusQ9ij4FLpyKaZCE5us
 v5UAbdrWpIJRFwAGArce0l4CeNh/BrauSpxKRYAuT6AX0DkOvERR+XtW9D8UdC14usz9
 7Ji9tzXabDPi4eFYoOOOtjuyla4cMRFQM6Z1JFHWDF8wPho1HUVYr+iHo+beOrnHkZjF
 r3XSVM5P3P6AFSFpQOIg6x86fSiTSHn7uGSC/4bOlyZmGXftbj+4Bxc+/qdz5MFyiWFo
 f4fg==
X-Gm-Message-State: AGi0PuYau8qHFj8ya0t3ZBmLvMw4mO5s4G5k5FJB5KMiWAoBTGWgpf8N
 xOYhJk8BS0Lq8W5yFOAom0VAQJKBPvdLa4T3AzY=
X-Google-Smtp-Source: APiQypJrvsmTHW860BhtnJ2gO7lfm9Dv5dNGo6aH4Lk4s07qsm3DIExyEcz8w8paVk2wwZrwAOzwCSLAi48y0m9hQv8=
X-Received: by 2002:a25:9d82:: with SMTP id v2mr29859246ybp.268.1589249414325; 
 Mon, 11 May 2020 19:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200511224148.598468-1-lyude@redhat.com>
 <20200511224148.598468-4-lyude@redhat.com>
 <CAKb7UvjQfw9UvxCdcu1k3t0dnq7PdQJrw5CtWhB42=uiW9-4dA@mail.gmail.com>
In-Reply-To: <CAKb7UvjQfw9UvxCdcu1k3t0dnq7PdQJrw5CtWhB42=uiW9-4dA@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 12 May 2020 12:10:03 +1000
Message-ID: <CACAvsv7V4wHhCKVaA7F-GiF-cN21E-z82JBp=pnePgWj-Kcq0A@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/nouveau/kms/gv100-: Add support for interlaced
 modes
To: Ilia Mirkin <imirkin@alum.mit.edu>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 May 2020 at 09:06, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Mon, May 11, 2020 at 6:42 PM Lyude Paul <lyude@redhat.com> wrote:
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > index 43bcbb6d73c4..6dae00da5d7e 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > @@ -1065,7 +1065,7 @@ nouveau_connector_mode_valid(struct drm_connector *connector,
> >                 return get_slave_funcs(encoder)->mode_valid(encoder, mode);
> >         case DCB_OUTPUT_DP:
> >                 if (mode->flags & DRM_MODE_FLAG_INTERLACE &&
> > -                   !nv_encoder->dp.caps.interlace)
> > +                   !nv_encoder->caps.dp_interlace)
> >                         return MODE_NO_INTERLACE;
> >
> >                 max_clock  = nv_encoder->dp.link_nr;
>
> You probably meant for this hunk to go into an earlier patch.
I fixed this and merged the series.

Ben.
>
>   -ilia
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
