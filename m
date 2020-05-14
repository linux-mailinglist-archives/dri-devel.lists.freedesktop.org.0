Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 939EA1D316B
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 15:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E18C6E061;
	Thu, 14 May 2020 13:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4661D6EB4A;
 Thu, 14 May 2020 13:36:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id f13so2015243wmc.5;
 Thu, 14 May 2020 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WleO5OQQ2cS64pu//3/WDEpJDP0OZyFZHtQOIo82VZU=;
 b=W0NgcbzdazeTnbuhFXMKX5Bojco1SFNqNnPqizZstWUIN/gDNJPxD9ZoGdl/GtJ9Da
 A5b23Hg+2Xe4wEZaZFhVolhv5W+6rd3Mk9K42MpYmb0obcrlWuW/4Eop0I0Jou1Q6x/4
 qKqGDT/aK6IESYNbVQc5oFQ9mG0pTF7/AoiLP3u7n0L3TW8EtYkybTQQ+4Kuzm7q8glV
 FRDxoJ7nkgcvqdwjs1Zm+9mOid4MsEJNJJ9dllATzA+IY7SjqTMfQiuj1ZWelQY9/6B5
 iOE9Y0tP5tPnn7yRk/V4FWvJU+kAdFL+CHdCt5ZkByMauvNFvARvkac1VWtTDluVbpQ7
 c1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WleO5OQQ2cS64pu//3/WDEpJDP0OZyFZHtQOIo82VZU=;
 b=tSgS0KhMjZE8YgzcZagq6KUf12WBLBOUrVHvI0O1oya/ChNOtvtz5JtHBgKPcSDOk1
 x8ohIAPR8k3RueGzL1OYSX+lSqOxeWuJbfsw4/HLCsVwhlgMgcQFTMTmpwr35yZGhqYl
 ZG4exr0LGglkzigr3fQVxHUGGpvhQBX5nGNpPV3usmNoUt0Zu7hbOTHpBLpkkb0MSN6y
 elEvtPzfKpnQEpCr/50WMx2LtJGNLrzLP0By7agDOYVg9zJNi+6PdkjThFYoMeEUnjEX
 FsTOsGFK8rOB6hlEej84PArkZPEZuV1b2pj4VGDt0agLGtu10D99/67dj8KlFKQ05/MN
 EXrQ==
X-Gm-Message-State: AGi0PuZ+aSi68mGBl70X1EdgfMRp9+Iz4iIQk7rhUhdk5190K1cuvkPn
 ZyqHO0lEcrrL6CifBDWnsB0vrkelcrDnDwukIjo=
X-Google-Smtp-Source: APiQypJ4ZCU2dOR9dURG1KJeLy+DhYpK/pw5TQ1DxW/dXarZxFLDnIOQNpJF6PcybSqaqy5+dPvVtGckhoN6NeQggSM=
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr28637962wmd.79.1589463381886; 
 Thu, 14 May 2020 06:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200430212951.3902-1-alexander.deucher@amd.com>
 <CAPj87rM6nvr-pspfz9PaPiV9kkSM+=rh_YMaPXqaBZv37Yc-Yw@mail.gmail.com>
In-Reply-To: <CAPj87rM6nvr-pspfz9PaPiV9kkSM+=rh_YMaPXqaBZv37Yc-Yw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 May 2020 09:36:10 -0400
Message-ID: <CADnq5_O-jgxFf4RArnf_fxeW5MxyDX3aMn=jViAZyx1-PAtHzw@mail.gmail.com>
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

On Thu, May 14, 2020 at 5:42 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi Alex,
>
> On Thu, 30 Apr 2020 at 22:30, Alex Deucher <alexdeucher@gmail.com> wrote:
> > UAPI:
> > - Add amdgpu UAPI for encrypted GPU memory
> >   Used by: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4401
>
> Did this ever go through uAPI review? It's been pushed to the kernel
> before Mesa review was complete. Even then, Mesa only uses it when
> behind a magic environment variable, rather than through the EGL
> extensions which have been specifically designed for protected content
> (EGL_EXT_protected_content, protected_surface, etc). The winsys
> usecase was based on a Wayland system which seems like it will only
> work when composition bypass is available - not using any of the
> Wayland protected-content extensions, and it's completely unclear what
> will happen if composition bypass can't actually be achieved.
>
> I don't think this should be landing before all those open questions
> have been answered. We're trying to come up with a good and coherent
> story for handling protected content, and I'd rather not see AMD
> landing its own uAPI which might completely contradict that.

Well, the patches have been public for months and we have a UAPI and
mesa userspace which works for our use cases and the mesa side has
been merged and the recent comments on the MR didn't seem like show
stoppers.  I don't disagree with your point, but I feel like agreeing
on a what we want to do for EGL protected content could drag out for
months or years.  Our UAPI is pretty straight forward and pretty much
matches how our hw works and what we already do for other GPUVM
mapping attributes like read/write/execute.  I don't see the current
UAPI being a blocker for any future protected content work, but of
course we can't be sure until it actually happens.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
