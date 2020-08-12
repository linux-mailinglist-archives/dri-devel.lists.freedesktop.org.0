Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94B242941
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 14:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B666E0D4;
	Wed, 12 Aug 2020 12:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613ED6E0D4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597235081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8qaeKJSpEMEVTRywH7XJFxNd5ZO5sfYePo7FUxoQun4=;
 b=Er5McxOw0CT/jd1FAzShaRFR517r3LUSsiJNCC3NuW8/ZHU3i1JmtL5O17qAH8Or6TN3lK
 zd3E9QQWQDgW2JJ9oTQpy/oFuvdqwPRw15fKxwGej6GbGdrdXJP/w7tgzJfHS1iITv6WnA
 kxBWCN2PZ5igp6J3N4l4mL7CYbtli/o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-_GpLp_FzPde5xsCI2aG-lA-1; Wed, 12 Aug 2020 08:24:37 -0400
X-MC-Unique: _GpLp_FzPde5xsCI2aG-lA-1
Received: by mail-qv1-f72.google.com with SMTP id z10so1348140qvm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 05:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8qaeKJSpEMEVTRywH7XJFxNd5ZO5sfYePo7FUxoQun4=;
 b=GnBnVdyOv55+op73rEculQ2uImkQ6T1g2mJy3C1PRvP9aYi4ivcNx8RqmigYzhvfnt
 Ngc13ZmO2oBdpCGDdAIcJSss6EmyB+r4zAQ2gSY8hfp7QdfUE587ZLeXppJNVCUJ4hby
 8tuuDR7Zu2JF1E/KGfMHT2JilF8grzPZjvPlo9FJBIQCb4I7c2NB/LwyTVJ+pd+nkpqS
 N3VECt2oKFqv4AuJt2U16EUAkujHuUza9MR5fZwQwglBdzJX855EgsiF5Gx5rUmfwkFL
 55zfdaqRrTi4gxCMPb4OeSdxlXPcWECYrkCFASdks59NXJq5BfCnSLJpzt2nyxzCWPFU
 Vccw==
X-Gm-Message-State: AOAM532/czIkAFZAOx8y+JxDayGZdxpidEOLrgwgOVxXxq+tRbdi0XFX
 u+oOlziFafS3RW4JBFAfDds2OooQWfaDoqpaWrfr+8vaL8svDJkCJQ2eWXMahHbofYcDFQYyVcj
 hDfL78LUn6qdlPxJVJryHwvYqwap0e6U+l8Y3u+H9SVfr
X-Received: by 2002:ad4:438f:: with SMTP id s15mr6613952qvr.164.1597235076664; 
 Wed, 12 Aug 2020 05:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz9UB+vnUorqXJrpmQttLzIKSIAcUCj9pfWjABWuF5abxe8Kj3pdkPnC+Bm7PPMBM52/Qjqyaz9n074Eo/nAo=
X-Received: by 2002:ad4:438f:: with SMTP id s15mr6613924qvr.164.1597235076419; 
 Wed, 12 Aug 2020 05:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <20200630230808.wj2xlt44vrszqfzx@box>
 <ef7816b4-72ee-9e0e-8cac-4d80d8343f9f@nvidia.com>
 <20200701075719.p7h5zypdtlhqxtgv@box> <20200701075902.hhmaskxtjsm4bcx7@box>
 <77e744b9-b5e2-9e9b-44c1-98584d2ae2f3@nvidia.com>
 <CAPj87rOrUHBZZR3cw+iqUMtZL1ZQyjd=RoM2yHt5oUeRO5uDTA@mail.gmail.com>
 <5ffa32db-4383-80f6-c0cf-a9bb12e729aa@nvidia.com>
 <a3d331e9-d17e-9135-68c7-8e3e10df184d@nvidia.com>
 <CAKMK7uG8x4dHrRnzK9FFrJbtWsdLk+TTObK9r-nSncKowHVe3A@mail.gmail.com>
 <CAPM=9twK34VyR2kwiR1jzxqys1Bng2Vt8FY6aQTvCe2GL0Zopg@mail.gmail.com>
 <261cd7c9-6853-3d5f-3a3e-86b65c9dba71@nvidia.com>
 <CACO55ttJwjh2HZsygwqA7HUeF5UMuP0=Y9RyZU=UJsf-gWGagA@mail.gmail.com>
 <ad64c242-95f3-d346-87f3-a9ac149dc3a2@nvidia.com>
 <CACO55tt81q3VwpEmz9wxeUzWGPLXA1XPj8ZgxhuELUBPDpX1PA@mail.gmail.com>
 <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
In-Reply-To: <CACO55ts2AHgDNZKBvoU8NZf26V8BJDGkKiapY=1xaUQ1DrC8SA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 12 Aug 2020 14:24:25 +0200
Message-ID: <CACO55tvF0dOQ=myUpccmfHc+hCVQZoXQnCA0iHeXQo3B=UaD0Q@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: James Jones <jajones@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thierry Reding <treding@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 12:43 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 12, 2020 at 12:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Wed, Aug 12, 2020 at 2:19 AM James Jones <jajones@nvidia.com> wrote:
> > >
> > > Sorry for the slow reply here as well.  I've been in the process of
> > > rebasing and reworking the userspace patches.  I'm not clear my changes
> > > will address the Jetson Nano issue, but if you'd like to try them, the
> > > latest userspace changes are available here:
> > >
> > >    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3724
> > >
> > > And the tegra-drm kernel patches are here:
> > >
> > >
> > > https://patchwork.ozlabs.org/project/linux-tegra/patch/20191217005205.2573-1-jajones@nvidia.com/
> > >
> > > Those + the kernel changes addressed in this thread are everything I had
> > > outstanding.
> > >
> >
> > I don't know if that's caused by your changes or not, but now the
> > assert I hit is a different one pointing out that
> > nvc0_miptree_select_best_modifier fails in a certain case and returns
> > MOD_INVALID... anyway, it seems like with your patches applied it's
> > now way easier to debug and figure out what's going wrong, so maybe I
> > can figure it out now :)
> >
>
> collected some information which might help to track it down.
>
> src/gallium/frontends/dri/dri2.c:648 is the assert hit: assert(*zsbuf)
>
> templ is {reference = {count = 0}, width0 = 300, height0 = 300, depth0
> = 1, array_size = 1, format = PIPE_FORMAT_Z24X8_UNORM, target =
> PIPE_TEXTURE_2D, last_level = 0, nr_samples = 0, nr_storage_samples =
> 0, usage = 0, bind = 1, flags = 0, next = 0x0, screen = 0x0}
>
> inside tegra_screen_resource_create modifier says
> DRM_FORMAT_MOD_INVALID as template->bind is 1
>
> and nvc0_miptree_select_best_modifier returns DRM_FORMAT_MOD_INVALID,
> so the call just returns NULL leading to the assert.
>
> Btw, this is on Xorg-1.20.8-1.fc32.aarch64 with glxgears.
>

So I digged a bit deeper and here is what tripps it of:

when the context gets made current, the normal framebuffer validation
and render buffer allocation is done, but we end up inside
tegra_screen_resource_create at some point with PIPE_BIND_SCANOUT set
in template->bind. Now the tegra driver forces the
DRM_FORMAT_MOD_LINEAR modifier and calls into
resource_create_with_modifiers.

If it wouldn't do that, nouveau would allocate a tiled buffer, with
that it's linear and we at some point end up with an assert about a
depth_stencil buffer being there even though it shouldn't. If I always
use DRM_FORMAT_MOD_INVALID in tegra_screen_resource_create, things
just work.

That's kind of the cause I pinpointed the issue down to. But I have no
idea what's supposed to happen and what the actual bug is.

> > > Thanks,
> > > -James
> > >
> > > On 8/4/20 1:58 AM, Karol Herbst wrote:
> > > > Hi James,
> > > >
> > > > I don't know if you knew, but on the Jetson nano we had the issue for
> > > > quite some time, that GLX/EGL through mesa on X was broken due to some
> > > > fix in mesa related to modifiers.
> > > >
> > > > And I was wondering if the overall state just caused the issue we saw
> > > > here and wanted to know what branches/patches I needed for the various
> > > > projects to see if the work you have been doing since the last
> > > > upstream nouveau regression would be of any help here?
> > > >
> > > > Mind pointing me towards everything I'd need to check that?
> > > >
> > > > I'd really like to fix this, but didn't have the time to investigate
> > > > what the core problem here was, but I think it's very likely that a
> > > > fixed/improved modifier support could actually fix it as well.
> > > > Alternately I'd like to move to kmsro in mesa as this fixes it as
> > > > well, but that could just be by coincidence and would break other
> > > > devices..
> > > >
> > > > Thanks
> > > >
> > > > On Tue, Jul 14, 2020 at 4:32 PM James Jones <jajones@nvidia.com> wrote:
> > > >>
> > > >> Still testing.  I'll get a Sign-off version out this week unless I find
> > > >> a problem.
> > > >>
> > > >> Thanks,
> > > >> -James
> > > >>
> > > >> On 7/12/20 6:37 PM, Dave Airlie wrote:
> > > >>> How are we going with a fix for this regression I can commit?
> > > >>>
> > > >>> Dave.
> > > >>>
> > > >> _______________________________________________
> > > >> dri-devel mailing list
> > > >> dri-devel@lists.freedesktop.org
> > > >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >>
> > > >
> > >

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
