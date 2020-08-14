Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9593244C3E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 17:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECE16EA80;
	Fri, 14 Aug 2020 15:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941B46EA80
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597419653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ThyQZ66104DCjOekfUr9An3BSUe4KlU1omqkveOfg/w=;
 b=cJyNLoY75oJz3ighv9WNRRFtJAwEsGqdHqZ+N2GaE6LAMp6gNID4bFBBOECtOUworSwEGq
 FmALYmSLN3qCWinaeCh/YwUD4JCouoWtdMzOQPO98WNj1DSYWic6j64abhxlc4wLi9hURI
 7v0BmWUMzpVRgLS3ed4StHkLp+ol2uM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-2oLDWdspNIO_VhaTz4uRYg-1; Fri, 14 Aug 2020 11:40:48 -0400
X-MC-Unique: 2oLDWdspNIO_VhaTz4uRYg-1
Received: by mail-qv1-f72.google.com with SMTP id d9so6311031qvl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 08:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ThyQZ66104DCjOekfUr9An3BSUe4KlU1omqkveOfg/w=;
 b=EcDT/DoaM+WPdcNZp4Je+yi4NqGAJdD4J6+PMUFfnkg5mdO+F0Bl7X1MhNJfL2Jo2R
 B6YVpdG3yMLG5s6EyYWxnH5pUgDRqprvV3fapyXAojSQgZR+39e/tDlFER5Z3tN5gbbP
 s+20KCOcPiQbKRhuP3WsPF04AWzRc/FZVk4YI27pyOUVr6EQ21pgy3SBU22YA/Z1ULYn
 Zjfpn0pQHwXgy8lkHghHNQb5q0TcU5O+5u3tC8aEeBfyDfcwjU5XtJsckCjQl1QTr907
 tIXAQTRZB2OVRaJgIQ42kGTmAS4GeQKx2ZvuXZroxNabL8Hc6odEHgjLqVxL5h+FdEZJ
 CGGQ==
X-Gm-Message-State: AOAM533u6NlvlVvTpJ9BkRze09z4xXXKgaHT/ANjFLf0iIBfmcNrAazz
 5/48wK7pnpyEHtJu6TXvN+p8AhcnDBHtzDChZ14FIA9qzUkkaUQ5WFbU8jBW/pJZA535TzR+io/
 Se4OUzGTDoj4PM5gIXjSmRAHKTpi4yyRHTR+yHbzjW0jx
X-Received: by 2002:a37:90e:: with SMTP id 14mr2610699qkj.102.1597419647658;
 Fri, 14 Aug 2020 08:40:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyysr2mjiT6IYdNjop3ancioVtMUhIVmKyuU9pGjtSVx4NwPN5MDraRTT3v30iTqUTwLHLkUj+eXFB9jX9G4xc=
X-Received: by 2002:a37:90e:: with SMTP id 14mr2610656qkj.102.1597419647238;
 Fri, 14 Aug 2020 08:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
In-Reply-To: <20200814153449.GH556087@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 14 Aug 2020 17:40:34 +0200
Message-ID: <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Thierry Reding <thierry.reding@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 5:35 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Aug 14, 2020 at 04:44:43PM +0200, Karol Herbst wrote:
> > On Fri, Aug 14, 2020 at 4:05 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Thu, Aug 13, 2020 at 10:45:34AM -0700, James Jones wrote:
> > > > I'll defer to Thierry, but I think that may be by design.  Tegra format
> > > > modifiers were added to get things like this working in the first place,
> > > > right?  It's not a regression, is it?
> > >
> > > I recall that things used to work with or without modifiers at some
> > > point. That was basically the point of the "pitch-linear by default"
> > > patch, see:
> > >
> > >     https://gitlab.freedesktop.org/mesa/mesa/-/commit/9603d81df05105857b676f20dff964ef3ab0ecff
> > >
> > > If we don't force pitch-linear for cases where we don't have modifiers,
> > > there's no way we can properly display these as framebuffers because we
> > > lack the modifier information at the kernel level.
> > >
> >
> > I suspect that's related to
> > https://gitlab.freedesktop.org/mesa/mesa/commit/c56fe4118a2dd991ff1b2a532c0f234eddd435e9
>
> But we're checking the the PIPE_USAGE_SCANOUT flag specifically for that
> type of case, so this should work. On the other hand, it does sound like
> that logic might actually work, but for some reason Nouveau then ends up
> allocating a linear render buffer and a tiled depth buffer, and that's
> the combination that doesn't work. Did I understand that correctly?
>
> So it sounds like there's a few options:
>
>   a) Make Nouveau render without a depth buffer in these cases (not sure
>      if that's even possible).
>
>   b) Allocate a linear buffer *in addition* to the normal buffer that
>      Nouveau allocates (with whatever it selects as the default layout)
>      and then blit from the tiled buffer to the linear buffer everytime
>      we need to. I think that'd be basically reproducing the code that
>      is controlled by the DRI_PRIME environment variable.
>

yeah, I think Ilia suggested something like that a long time ago as well.

>   c) Accept that modifiers are the way to go and rely on them for proper
>      functionality. This is obviously a really bad solution because not
>      everyone has transitioned to framebuffer modifiers yet. On the
>      other hand, this is precisely the kind of use-case that framebuffer
>      modifiers were meant to address, so it isn't all that far-fetched
>      to make them a requirement.
>

the problem with that is, that by default we don't have modifier aware
desktops. gnome-shell by default and no Xorg release.

> None of those are really great options... does anyone have any other
> ideas?
>

What I am wondering about is why with my patch it simply works in X,
but that could be a mere coincidence.

> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
