Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18A244C7E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 18:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C7A6E1B1;
	Fri, 14 Aug 2020 16:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3C86E1B1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597421595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7/VbLefSArVFIaz9yNquj/34Tkotz8G9lrGjLqHv8o=;
 b=X+yBZHMQEvyJ3TRKY9/XWww7CH14vQc0esCN8hCZprKjIUzAk7VsIaXL6iIiJYaLUeYEOK
 fHQa1wiVOtXyU+xV2wr3Zo7qNiEKn3YpOeE2GEhCUSJtvRR7fvATnTuaI0jfuiipUyz5wm
 NBjo21/cD2klrHSgKSMQfasXtH0dDNg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-5hMTG5MAO8aUqXotlniD1A-1; Fri, 14 Aug 2020 12:13:10 -0400
X-MC-Unique: 5hMTG5MAO8aUqXotlniD1A-1
Received: by mail-qv1-f72.google.com with SMTP id y30so6384554qvy.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 09:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7/VbLefSArVFIaz9yNquj/34Tkotz8G9lrGjLqHv8o=;
 b=QC2zAsO6Il+5CNDMqJgQfRqiyns3g0cZzgPWNSJlwMl4AeLkZDw6+zvvTGuCuueo3G
 kpkJM5KjzZ9b6s9dCdb3ylr1X7Yrdnl0QlwZMfcFfC8R4mPEQ+ZLEHDzds0v0fMwdUtM
 ZRF883QeBSXxnJXSJgr34SiOJYwEWWdF0kP8uuFv+v+1v7qR7t6KMsK0VWhqGyvVECEN
 zuzBbkkTOAIVNg+jkQRvgQ9qi+916PfB7is2ZeeBDWI8cBK99dcf2egAC75aHLeI6B4r
 AdE9w2Of/0VZPh7v7FOn32KHcyBUcGKW0LOTX6B5ggteRW9J2z5JwoLYnTSJ+yc9YG6l
 +syg==
X-Gm-Message-State: AOAM530popuv/4DpVk48UzXlcOHlHwdZP8k2EcTIe1s50u/rHobS0nrG
 F8eW5wLQn9MjWId03salehWzAI0MOAQsJ63hmJThQ3M5xhtMIyakyqjeL8DWpgN5fr9/c6Ji3Kc
 4uAbNIUD1ShV60t5j08FlgiiOxNM33hNDH7Z1pUwRFY1j
X-Received: by 2002:a0c:9cc4:: with SMTP id j4mr3198419qvf.230.1597421590123; 
 Fri, 14 Aug 2020 09:13:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI85ehBGjvFh0kMia2hnBTaUtSmFarC8YQVJ0LNl4n+wNmye1KjXMraettZ6OK+nuqMKi/VUZWK0TkaojUVrg=
X-Received: by 2002:a0c:9cc4:: with SMTP id j4mr3198401qvf.230.1597421589877; 
 Fri, 14 Aug 2020 09:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
 <20200814153449.GH556087@ulmo>
 <CACO55tt69SbBKLkmTVtoq2BLRJGbO5fmUH4dFWX_qC7nii3jSQ@mail.gmail.com>
 <20200814160631.GI556087@ulmo>
In-Reply-To: <20200814160631.GI556087@ulmo>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 14 Aug 2020 18:12:56 +0200
Message-ID: <CACO55tvzoCBNvvnrzn9fSQZwB-hXPPApFMkbJ+ZGWDHgkgkJTw@mail.gmail.com>
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

On Fri, Aug 14, 2020 at 6:06 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Aug 14, 2020 at 05:40:34PM +0200, Karol Herbst wrote:
> > On Fri, Aug 14, 2020 at 5:35 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Fri, Aug 14, 2020 at 04:44:43PM +0200, Karol Herbst wrote:
> > > > On Fri, Aug 14, 2020 at 4:05 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > >
> > > > > On Thu, Aug 13, 2020 at 10:45:34AM -0700, James Jones wrote:
> > > > > > I'll defer to Thierry, but I think that may be by design.  Tegra format
> > > > > > modifiers were added to get things like this working in the first place,
> > > > > > right?  It's not a regression, is it?
> > > > >
> > > > > I recall that things used to work with or without modifiers at some
> > > > > point. That was basically the point of the "pitch-linear by default"
> > > > > patch, see:
> > > > >
> > > > >     https://gitlab.freedesktop.org/mesa/mesa/-/commit/9603d81df05105857b676f20dff964ef3ab0ecff
> > > > >
> > > > > If we don't force pitch-linear for cases where we don't have modifiers,
> > > > > there's no way we can properly display these as framebuffers because we
> > > > > lack the modifier information at the kernel level.
> > > > >
> > > >
> > > > I suspect that's related to
> > > > https://gitlab.freedesktop.org/mesa/mesa/commit/c56fe4118a2dd991ff1b2a532c0f234eddd435e9
> > >
> > > But we're checking the the PIPE_USAGE_SCANOUT flag specifically for that
> > > type of case, so this should work. On the other hand, it does sound like
> > > that logic might actually work, but for some reason Nouveau then ends up
> > > allocating a linear render buffer and a tiled depth buffer, and that's
> > > the combination that doesn't work. Did I understand that correctly?
> > >
> > > So it sounds like there's a few options:
> > >
> > >   a) Make Nouveau render without a depth buffer in these cases (not sure
> > >      if that's even possible).
> > >
> > >   b) Allocate a linear buffer *in addition* to the normal buffer that
> > >      Nouveau allocates (with whatever it selects as the default layout)
> > >      and then blit from the tiled buffer to the linear buffer everytime
> > >      we need to. I think that'd be basically reproducing the code that
> > >      is controlled by the DRI_PRIME environment variable.
> > >
> >
> > yeah, I think Ilia suggested something like that a long time ago as well.
> >
> > >   c) Accept that modifiers are the way to go and rely on them for proper
> > >      functionality. This is obviously a really bad solution because not
> > >      everyone has transitioned to framebuffer modifiers yet. On the
> > >      other hand, this is precisely the kind of use-case that framebuffer
> > >      modifiers were meant to address, so it isn't all that far-fetched
> > >      to make them a requirement.
> > >
> >
> > the problem with that is, that by default we don't have modifier aware
> > desktops. gnome-shell by default and no Xorg release.
> >
> > > None of those are really great options... does anyone have any other
> > > ideas?
> > >
> >
> > What I am wondering about is why with my patch it simply works in X,
> > but that could be a mere coincidence.
>
> So I was testing your revert with Weston and that "works", but only as
> in "it doesn't crash". As expected, since there's now a mismatch between
> what layout Nouveau assumes and the pitch-linear buffer that modesetting
> assumes it got, it'll now be completely scrambled. That said, even
> without the revert I can't seem to be able to make Weston work without
> modifiers support.
>

yeah, that does seem to reproduce what I noticed with
gnome-shell/wayland as well.

> I'll have to investigate some more why that's not working. Perhaps it
> doesn't pass the correct usage flags?
>
> Thierry

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
