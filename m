Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B556622F5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB6410E3C1;
	Mon,  9 Jan 2023 10:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD10D10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:18:01 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id 17so9035800pll.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mJnzLxDjt78ujfe9ZmRndk6crd1DO5L9dsHU8mWzKIs=;
 b=bYlAyl2HvcGBGh2bPQYePiF1uY7yLEPZV1J0Ei7Owr/gbKqn7+V+mHse8I+aw6Bujw
 tRk0HN8S8h+rPz+1MjG3hDiJ6o6Mq+nEAUnJPTBQLYia8jyfygdPP70DbdERYt9BaqQa
 Fd2O/uJBj0rgEb5Xk5BrEqJ6eiR/u6vADFfFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mJnzLxDjt78ujfe9ZmRndk6crd1DO5L9dsHU8mWzKIs=;
 b=Ed2CoLke8lVpEl2Z9ZfOcNzpg2Fh8bJDmRXUzX5JDEXLiUUooEbT8kPCDNSiVViRJv
 B1802rrNAKKBT04TVQkxTIEGsbRHpbgzZ9zKAeLrMN90FDzL5KRyIbhcbn06yvOFlK5k
 XVRNcUyL8vPViv0dkn1xAy0/pjTC32Jo1kM7SmidDPVt5etVZf/ubVDFMLfaxLncOZkI
 6YehvYUStLUTKgtWYLAD6/Qoey9XtEwz9HmTYCv4PYUoKsgvPSGhYrt6cWpw64yuyBAm
 WKPIVxoslJOKpeufxkba+sc2djpC7/dQ1OjLiZPbGmcI1+oXWbRaTmejWznOJDZzoE2n
 2eFA==
X-Gm-Message-State: AFqh2koBR7JUG251Y0mbt26FPFPB3nfNWkAzsxPUmVzynlNHNjiFCM8K
 CUJOVRO90m70cXHbBettvkuxi7KWzJ8VIb4HM/mu8A==
X-Google-Smtp-Source: AMrXdXvmABsaDRPLtNSiTCvjBWRitbixGo2I6/Lzik4RbrH2g0VetD9k8EFsJ13uiAnTKyssmCC0Iq4T8If2o/eQclg=
X-Received: by 2002:a17:90a:c702:b0:223:f7a8:bd83 with SMTP id
 o2-20020a17090ac70200b00223f7a8bd83mr3986584pjt.10.1673259481439; Mon, 09 Jan
 2023 02:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
 <20230104130308.3467806-2-boris.brezillon@collabora.com>
 <Y7btZUve7rDA/ctq@phenom.ffwll.local>
 <20230109093437.35ccf475@collabora.com>
In-Reply-To: <20230109093437.35ccf475@collabora.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 9 Jan 2023 11:17:49 +0100
Message-ID: <CAKMK7uH5rrpuyTQqs5FY+UQz8GV1VdhvM55E+mf7-JGz2XsrTw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] drm/panfrost: Provide a dummy show_fdinfo()
 implementation
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 09:34, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hi Daniel,
>
> On Thu, 5 Jan 2023 16:31:49 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Wed, Jan 04, 2023 at 02:03:05PM +0100, Boris Brezillon wrote:
> > > Provide a dummy show_fdinfo() implementation exposing drm-driver and
> > > drm-client-id. More stats will be added soon.
> > >
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panfrost/panfrost_drv.c | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > index 2fa5afe21288..6ee43559fc14 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > > @@ -515,7 +515,22 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
> > >     PANFROST_IOCTL(MADVISE,         madvise,        DRM_RENDER_ALLOW),
> > >  };
> > >
> > > -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
> > > +static void panfrost_show_fdinfo(struct seq_file *m, struct file *f)
> > > +{
> > > +   struct drm_file *file = f->private_data;
> > > +   struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> > > +
> > > +   seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
> > > +   seq_printf(m, "drm-client-id:\t%llu\n", panfrost_priv->sched_entity[0].fence_context);
> >
> > I think at this point we really need to not just have a document that says
> > what this should look like, but drm infrastructure with shared code.
> > Drivers all inventing their fdinfo really doesn't seem like a great idea
> > to me.
>
> Okay. I'm just curious how far you want to go with this common
> infrastructure? Are we talking about having a generic helper printing
> the pretty generic drm-{driver,client-id} props and letting the driver
> prints its driver specific properties, or do you also want to
> standardize/automate printing of some drm-memory/drm-engine props too?

I think we should standardized what's used by multiple drivers at
least. It might be a bit tough for the memory/engine props, because
there's really not much standard stuff there yet (e.g. for memory I'm
still hoping for cgroups work, for engines we should probably base
this on drm_sched_entity and maybe untie that somewhat from sched
itself for i915-sched and fw sched and whatever there is).

But as usual, try to be reasonable with standard code :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
