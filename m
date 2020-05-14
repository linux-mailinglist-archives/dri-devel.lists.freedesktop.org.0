Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E031D34D9
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD606EB63;
	Thu, 14 May 2020 15:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B186EB63;
 Thu, 14 May 2020 15:18:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e1so4685805wrt.5;
 Thu, 14 May 2020 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mqcL9G4GwvDXau49ts4jKonS+XSNd4KWiN9J9Xdv4QE=;
 b=KNKmwpGalCkVWgPVUsq4/LxY4Bp1cDJEh52kyzVlU3K/Ez2/PvXYOhMdz1uz19vTZ5
 4Fo18y5NxMVW+2CkbSvHXFt2io/2IhUG/4gtuDFTvJK2mI81JrZFrivADYR+znNPex6b
 uDTJyAypS+BhvSlgp6g+QkP0So5OSA6kkfQVd4kVkqLaRUhaic1zdEVC9fW/UtJlW1Rh
 vLp+jTUYA7RgdV4VxI9AWM6EqZmlsDlgQSfooy9ZIYUHv8mwou7gkcmndZz4Hx9/3ckO
 /u2BXvEjzb4fbJgSWsQOkAskVt0TAq8huuiqxZfFo/O8P4iKZ8NEfFthnW+9wye6zqVV
 epGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mqcL9G4GwvDXau49ts4jKonS+XSNd4KWiN9J9Xdv4QE=;
 b=PxGItDCFfz1zSdSqa3djzV8f9xzl9e8xIOSKC8rMdgGvnNGsVBdOxwrvNsyfYEVJzZ
 7c4I/P5BFxBDMOmuWy2MmsfhUH6Bd2hgNeAku17Pd+c0sg2Q6PCIRHPTYvG23quq93ED
 8IMiEBckKU3MXjEm9QwYxasxYouX7wdCvuukO75vXTX6S/JEK2HP0K25T9ne5olsizIq
 B2Zrny+k+0KGaf1VVanW36iU6pyaLwx/w7O+aeNFd6wYe26SYTbROjy5cLRtD+iMc56D
 s/2Ae8W/NGmOfHdX/vqP9yUjyhNOykINM7O3HMnu0Vr22KWusuNu8iHcHe2Jaknqy6bh
 dF4g==
X-Gm-Message-State: AOAM532NVFzAf+K6L9XbfFhwplzGbhm9wVzMeaJzKDPAG6uHYrrot5Hx
 TMlihu43XusCNhTEA3Kws5gHQ6yAodHIMXNPPHoD3w==
X-Google-Smtp-Source: ABdhPJxSrY45EcZ/VcRp3WJwvknzGl4jngRqfdUnTM3eL4Cw+ZwhIkcPHuuI75CDkmPAXGYUQ+bHlekbt4xZw5DRhns=
X-Received: by 2002:adf:9264:: with SMTP id 91mr5953145wrj.362.1589469513164; 
 Thu, 14 May 2020 08:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200430212951.3902-1-alexander.deucher@amd.com>
 <CAPj87rM6nvr-pspfz9PaPiV9kkSM+=rh_YMaPXqaBZv37Yc-Yw@mail.gmail.com>
 <CADnq5_O-jgxFf4RArnf_fxeW5MxyDX3aMn=jViAZyx1-PAtHzw@mail.gmail.com>
 <CAPj87rPwd0TpnBy1g3BDBbQb3e0RjEn2Sy+yP01ALNGts+NhLA@mail.gmail.com>
In-Reply-To: <CAPj87rPwd0TpnBy1g3BDBbQb3e0RjEn2Sy+yP01ALNGts+NhLA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 May 2020 11:18:21 -0400
Message-ID: <CADnq5_NB6J9ZUtNtKxO2wiGDnA55FBQn6O14OiqqZE9O=oN=ag@mail.gmail.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.8
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 10:15 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Thu, 14 May 2020 at 14:36, Alex Deucher <alexdeucher@gmail.com> wrote:
> > On Thu, May 14, 2020 at 5:42 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > > Did this ever go through uAPI review? It's been pushed to the kernel
> > > before Mesa review was complete. Even then, Mesa only uses it when
> > > behind a magic environment variable, rather than through the EGL
> > > extensions which have been specifically designed for protected content
> > > (EGL_EXT_protected_content, protected_surface, etc). The winsys
> > > usecase was based on a Wayland system which seems like it will only
> > > work when composition bypass is available - not using any of the
> > > Wayland protected-content extensions, and it's completely unclear what
> > > will happen if composition bypass can't actually be achieved.
> > >
> > > I don't think this should be landing before all those open questions
> > > have been answered. We're trying to come up with a good and coherent
> > > story for handling protected content, and I'd rather not see AMD
> > > landing its own uAPI which might completely contradict that.
> >
> > Well, the patches have been public for months and we have a UAPI and
> > mesa userspace which works for our use cases and the mesa side has
> > been merged and the recent comments on the MR didn't seem like show
> > stoppers.
>
> As a generic compositor author, it's pretty important for me to
> understand what happens when trying to access protected content. Does
> the import simply fail? Does it sample rubbish? Does my context
> killed? etc.

Unless you are a GPU engine in secure mode, you'll just get garbage.
You specify what mode you want each engine to operate in when you
submit work to the GPU.

>
> > I don't disagree with your point, but I feel like agreeing
> > on a what we want to do for EGL protected content could drag out for
> > months or years.
>
> I don't really see what the problem is, but it would've been nice if
> it was at least attempted, rather than just parachuted in ... I know
> I'm going to end up getting bug reports about it for Wayland/Weston,
> and then all of a sudden it's become my problem that this was just
> dropped in as a vendor-specific feature in a vendor-specific island.

I'm not sure what you mean by parachuted in.  The patches for both the
kernel and mesa were send out to their respective review mediums a
number of times and there were actually a number of revisions as we
worked through issues that came up.  We were certainly not trying to
"sneak" this in.

I didn't realize anyone was actually seriously working on this at the
moment either until you brought it up.  What is the current status?
Does anyone else have anything similar in progress?

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
