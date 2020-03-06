Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764517B9E9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3731D6ECBF;
	Fri,  6 Mar 2020 10:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0866ECBF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:13:32 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a132so1727313wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/vDIlGX0meuTJ9u7QAn+s4nQf3ELnqI9FgEEknuOygI=;
 b=AAfF9D4sZdaDyHWigxkTcwEDeh5nBGLUDWGgd5LZtuAzONxa2cPUAHBORz22PRi9lz
 Pl3EcbK0XCqqaO2WaOwCIqPFhQ07s9kLBSdp/V4UP4Xu6nzdPF7txuYTxYXhFyPwwxDJ
 8ay6PSuPsESmDluAoK+L41ohhu0BOEi+SKVh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/vDIlGX0meuTJ9u7QAn+s4nQf3ELnqI9FgEEknuOygI=;
 b=Yy8049HJgfoWCgONRyuIYgM79y/lxD7EsjR0ftUSZ7agkCHwGneASu1MQhMR6gBE53
 yHn4rSlhhhTelaidhWZDcQbCrgnvetWQtOfPxBAS8dtqdcNyfv5SYDdF6AwbeGguusvi
 MXDmR33pRTp4qLhlpcihFJyDZFAK7kxv7DEDFd5Pr3oeAmdAcH+uQxBYCyoR1/oR/WNw
 Q+2Dxf8cVI3/Pjp2MprGCa0Y69j9ZKOUfLIcRS8Dj5cNRBGfsaWQZ8hgojNV6Hk6OREO
 ykbthQOKDOLqsDJf97DYL0GG/gMGh+vIvJCn/Et2f6lPz6mbQpqYK644EtuJ7qknf/yT
 dXbA==
X-Gm-Message-State: ANhLgQ2w5LekVTAyp86XynH+/igtGpmjw+MpBLI2tZbIy1j2riI5zcBD
 OAiIsf2ybZ35EoAUwhUMvX2I5O23hWs=
X-Google-Smtp-Source: ADFU+vt7yOW1im8q9ywyGWVPyTSOpVuRYwEPRoCyv4+cUol7N1/VZo0VFbhdrlnn8cytwSvI5VFNdA==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr3334559wmy.104.1583489611295; 
 Fri, 06 Mar 2020 02:13:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 19sm14643940wma.3.2020.03.06.02.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:13:30 -0800 (PST)
Date: Fri, 6 Mar 2020 11:13:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 1/4] drm/fourcc: Add modifier definitions for describing
 Amlogic Video Framebuffer Compression
Message-ID: <20200306101328.GR2363188@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-amlogic@lists.infradead.org, nd <nd@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
 <20200221090845.7397-2-narmstrong@baylibre.com>
 <20200303121029.5532669d@eldfell.localdomain>
 <20200303105325.bn4sob6yrdf5mwrh@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uFgQGrnEkXyac15Wz8Opg43RTa=5cX0nN5=E_omb8oY8Q@mail.gmail.com>
 <20200303152541.68ab6f3d@eldfell.localdomain>
 <20200303173332.1c6daa09@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303173332.1c6daa09@eldfell.localdomain>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org,
 nd <nd@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 05:33:32PM +0200, Pekka Paalanen wrote:
> On Tue, 3 Mar 2020 15:25:41 +0200
> Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
> > On Tue, 3 Mar 2020 12:37:16 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > 
> > > On Tue, Mar 3, 2020 at 11:53 AM Brian Starkey <brian.starkey@arm.com> wrote:  
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Mar 03, 2020 at 12:10:29PM +0200, Pekka Paalanen wrote:    
> > > > > On Fri, 21 Feb 2020 10:08:42 +0100
> > > > > Neil Armstrong <narmstrong@baylibre.com> wrote:
> > > > >    
> ...
> > > > > > +/*
> > > > > > + * Amlogic Video Framebuffer Compression modifiers
> > > > > > + *
> > > > > > + * Amlogic uses a proprietary lossless image compression protocol and format
> > > > > > + * for their hardware video codec accelerators, either video decoders or
> > > > > > + * video input encoders.
> > > > > > + *
> > > > > > + * It considerably reduces memory bandwidth while writing and reading
> > > > > > + * frames in memory.
> > > > > > + * Implementation details may be platform and SoC specific, and shared
> > > > > > + * between the producer and the decoder on the same platform.    
> > > > >
> > > > > Hi,
> > > > >
> > > > > after a lengthy IRC discussion on #dri-devel, this "may be platform and
> > > > > SoC specific" is a problem.
> > > > >
> > > > > It can be an issue in two ways:
> > > > >
> > > > > - If something in the data acts like a sub-modifier, then advertising
> > > > >   support for one modifier does not really tell if the data layout is
> > > > >   supported or not.
> > > > >
> > > > > - If you need to know the platform and/or SoC to be able to interpret
> > > > >   the data, it means the modifier is ill-defined and cannot be used in
> > > > >   inter-machine communication (e.g. Pipewire).
> > > > >    
> > > >
> > > > Playing devil's advocate, the comment sounds similar to
> > > > I915_FORMAT_MOD_{X,Y}_TILED:
> > > >
> > > >  * This format is highly platforms specific and not useful for cross-driver
> > > >  * sharing. It exists since on a given platform it does uniquely identify the
> > > >  * layout in a simple way for i915-specific userspace.    
> > > 
> > > Yeah which we regret now. We need to now roll out a new set of
> > > modifiers for at least some of the differences in these on the
> > > modern-ish chips (the old crap is pretty much lost cause anyway).
> > > 
> > > This was kinda a nasty hack to smooth things over since we have epic
> > > amounts of userspace, but it's really not a great idea (and no one
> > > else really has epic amounts of existing userspace that uses tiling
> > > flags everywhere, this is all new code).
> > > -Daniel
> > >   
> > > > Isn't the statement that this for sharing between producer and decoder
> > > > _on the same platform_ a similar clause with the same effect?
> > > >
> > > > What advantage is there to exposing the gory details? For Arm AFBC
> > > > it's necessary because IP on the SoC can be (likely to be) from
> > > > different vendors with different capabilities.
> > > >
> > > > If this is only for talking between Amlogic IP on the same SoC, and
> > > > those devices support all the same "flavours", I don't see what is
> > > > gained by making userspace care about internals.    
> > > 
> > > The trouble is if you mix&match IP cores, and one of them supports
> > > flavours A, B, C and the other C, D, E. But all you have is a single
> > > magic modifier for "whatever the flavour is that soc prefers". So
> > > someone gets to stuff this in DT.
> > > 
> > > Also eventually, maybe, perhaps ARM does grow up into the
> > > client/server space with add-on pcie graphics, and at least for client
> > > you very often end up with integrated + add-in pcie gpu. At that point
> > > you really can't have magic per-soc modifiers anymore.  
> > 
> > Hi,
> > 
> > I also heard that Pipewire will copy buffers and modifiers verbatim
> > from one machine to another when streaming across network, assuming
> > that the same modifier means the same thing on all machines.[Citation needed]
> > 
> > If that is something that must not be done with DRM modifiers, then
> > please contact them and document that.
> 
> Sorry, it's waypipe, not pipewire:
> https://gitlab.freedesktop.org/mstoeckl/waypipe/

I do think this is very much something we want to make possible. They
might pick a silly modifier (compression modifiers only compress bw, by
necessity the lossless ones have to increase storage space so kinda dumb
thing to push over the network if you don't add .xz or whatever on top).

I'm also hoping that intel's modifiers are definitely the one and only
that we ever screwed up, and we should be getting those fixed in the near
future too.

So maybe what we should do instead is add a comment to the modifier docs
that this stuff _is_ supposed to be transferrable over networks and work.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
