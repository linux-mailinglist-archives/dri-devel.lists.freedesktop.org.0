Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2A1C0729
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 21:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8AD6E42E;
	Thu, 30 Apr 2020 19:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB836E42E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:57:52 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id q8so5721479eja.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sf4o7mpfsIW2p37ahDieiOuWLKAFwSGBAAlKSdh9MOY=;
 b=Un8z4LLS9bMGDJ9Fu8wWHQ95ThUZm76Ya6tyIlmjz0HZNoSXfNY3ZH1vIixddxgFVW
 Q34veuKAkRIRSf10WKZkNIvzChQ4Xa87EbhN3pSmlWGZdfPOqbTHx0mnK0n5g7zZvkh/
 9VkVveF3Y00KP8UJzhj7a0tsVzqSQkllu4ffRuoy92N9Ky9jI4lhpjko70ghYUYzgRIh
 N29GOPDkmA5x6zEDHX+teTJ8kwFkCqjiUic6o1eXsbDF8bngDH8I5KC9pjssNoxJdhXP
 MsmzzFKK2Mp7CxBGe8Hmi9bc5YLHJdU8ZZQfG4azNrKoHJdqxtFT1VQEveXSwcV/xBiM
 9Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sf4o7mpfsIW2p37ahDieiOuWLKAFwSGBAAlKSdh9MOY=;
 b=ULOLLabZfQudrufVjE803aAX5LMEkRvew4hHz1xq8dcRHPWlSJWQyhtJQiAQSNaem2
 9IWi2GwCPVKajwmUyHrjah41AFn6GN/bZ4WSJHQz6XAKBxq+QAP80RYZSRFaLwCRaWGp
 nL/M7Hdi32vzrVk8+tP/wx71y0Ywb8pDqIrM1zv5CyibgCr0Pv+PMLQq5w2ht5fHCvLz
 H/dceCiOllAQ8msj4B2Lp8juD7AksNzaE7Cn+pbvMMcBFQVxEwtzvGEMk+ZVGatbcl6S
 /EJQSDWfVtc85h3S5Lq78fC63fW6GjJ252lp0zQ5Eh7qGOINwfRJiZTh/pDlXpVjzUrA
 eo8A==
X-Gm-Message-State: AGi0PuZCZZCmEeHNA3JK1zZrME4107q2eNJVak1DqoLJbJG4zbNGF8Zf
 0yxFIE/Iuf0mq/nxvya8+C/+51zsOEPeJHvz8ASGiQ==
X-Google-Smtp-Source: APiQypKOXaE3DYjFDEXLTTGQwDCN/utfQsA/Jq0o+wDiVMI/8Zv0nR8I//OGRpyKSFVXTwr3buhsSNKoQwXTW0ZLDYs=
X-Received: by 2002:a17:906:9494:: with SMTP id t20mr72699ejx.51.1588276671059; 
 Thu, 30 Apr 2020 12:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
 <CAKMK7uE42AUZbqn4VhVjWaeUaoyhm+k5ZWUXjB576+7bWHfs2A@mail.gmail.com>
In-Reply-To: <CAKMK7uE42AUZbqn4VhVjWaeUaoyhm+k5ZWUXjB576+7bWHfs2A@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 30 Apr 2020 12:57:40 -0700
Message-ID: <CADaigPXx+iDd6Duqi+FqAsxLCP5EWhweNN8UwKBVOqYVaQD=8A@mail.gmail.com>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Peter Collingbourne <pcc@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 3:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Apr 28, 2020 at 2:46 PM Peter Collingbourne <pcc@google.com> wrote:
> >
> > Render nodes are not just useful for devices supporting GPU hardware
> > acceleration. Even on devices that only support dumb frame buffers,
> > they are useful in situations where composition (using software
> > rasterization) and KMS are done in different processes with buffer
> > sharing being used to send frame buffers between them. This is the
> > situation on Android, where surfaceflinger is the compositor and the
> > composer HAL uses KMS to display the buffers. Thus it is beneficial
> > to expose render nodes on all devices that support buffer sharing.
> >
> > Because all drivers that currently support render nodes also support
> > buffer sharing, the DRIVER_RENDER flag is no longer necessary to mark
> > devices as supporting render nodes, so remove it and just rely on
> > the presence of a prime_handle_to_fd function pointer to determine
> > whether buffer sharing is supported.
>
> The idea behind render nodes is that you can freely pass these to
> unpriviledged users, and nothing bad happens. That's why we have gpu
> reset code in drivers, proper pagetables, and also (in at least the
> solid drivers) ban code so that repeat offenders from userspace who
> constantly submit endless batch buffers and funny stuff like that
> can't DOS the gpu.
>
> Ofc in practice there's hw issues and fun stuff like that sometimes,
> and driver bugs, and all that. But that's the aspiration.
>
> Now many of these display-only drivers need contiguous buffers, and
> there's not endless amounts of that around. So if you allow random
> clients to allocate buffers, they can easily exhaust that, and not
> just upset the render side of the gpu, but essentially make it
> impossible for a compositor to allocate more framebuffers. I don't
> think that's a good idea.
>
> I know there's hw like vc4 which needs contiguous buffers for
> everything, but that's kinda the places where aspiration falls a bit
> short.
>
> So from that pov I'm a rather worried with handing out render rights
> to everyone for these display-only buffers. It's not entirely
> harmless.

This doesn't feel like a contiguous-mem-specific concern to me.  We
don't have resource limits on renderer GPU nodes today, you can
allocate memory there to fill up and DOS the system, and unless
something changed since last time I was looking, we don't even tell
the OOM killer about our allocations so they can kill the right app!
(my compositor always got picked, in my experience)

And, keep in mind what we're fixing at a system level here: the
current workaround is you either get your compositor to hand you a GPU
fd, at which point you can DOS the system, or you open the master node
yourself and try to drop master before the compositor comes up, then
DOS the system. "But there are access controls for the compositor or
the card node!" you say: yes, but there are for render nodes too.  I
know my distro doesn't default to open access to /dev/dri/render*
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
