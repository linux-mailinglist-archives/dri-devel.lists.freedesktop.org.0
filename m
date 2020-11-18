Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C72B8043
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 16:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F275897D0;
	Wed, 18 Nov 2020 15:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2307D897D0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 15:19:33 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id d9so2577757oib.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qoz8axajlTVY6B88RyDwVL+TlHe+ogJs0Oxc7aj5dyQ=;
 b=DDhbw98jiC9ZTb+82ry5A2VSLcqPTtxRVCHDJt/fMFAUY90hcvGzf3o0SslRXp5Cqw
 g3ew2eQNjurCZSP/LnVMv2KryIl4a0Act0V0W+xJiyUECTGrbnPoHlgFh55BZ0r8RMDo
 wErrpO8DEM2HSDZZ1+kiAg0AWhP5Dv1sFKrXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qoz8axajlTVY6B88RyDwVL+TlHe+ogJs0Oxc7aj5dyQ=;
 b=l/jiIw5GVwU8QvNdycSg2X1pQCNtftMneVZP79sJFRcnYoS9AsM19sfPs3XxeWEoeI
 gz3wyPzVERZTj4SysZ3WgsUS9pmP6HB2PYAET6HGq2M4a3Hkfqg4tf2Hd15Ap4TmTTc9
 86+07PnxaKgBcUneYxMD6tQg2LlOE9sEAZn21idIRF3ajoEYwhdwcKQfkkYQ7RBEaCXf
 EEOZnHmkEhLaZkgrkFTChhPI9GKseMCUqdrkZGBJtkdT+C5t6Oj0rBF95SvKpwdz8gPU
 h/Gwlnj0DNbpz/AXHO2wF6fj4s/zIzWLkilSeQh3JWSBYKjeWab5rlEGsMpGw98RKsSb
 tG0Q==
X-Gm-Message-State: AOAM531nZE9bNyozbznkJFDLSe6A2Z5NWU8DgQi88lKxgAgkkX4xdJz4
 IINg3eg5YDTO35dZlzIaLRoQq2iU76+OXWHUY3ks8znoNIo=
X-Google-Smtp-Source: ABdhPJxh8FFhBv+V7xXOlfDyr+1+CejdTFgxpSXdK6Ek1XMq1TuZr/gS7u+qqSag7CeUmAmyGaRV83lNA6nAdihGUjw=
X-Received: by 2002:aca:1713:: with SMTP id j19mr323529oii.101.1605712772425; 
 Wed, 18 Nov 2020 07:19:32 -0800 (PST)
MIME-Version: 1.0
References: <zvaqgUJLuDcSaX7hbo6wcjWOCFUkiwPThMV1D8tq7dc@cp3-web-020.plabs.ch>
 <CAKMK7uHLR2Rd9xOMEqURZJBvyVqO1HCe6eXzh8qKnG+9WX0FYA@mail.gmail.com>
 <T5AN4SYwiVlMP_M5BjzOYV5dTtcc60-0mIORLfkdPazgmXjgJ9xK7-Tt-GFtLYBanzgaxHW6I2PwgBS3yrJSwsjfDlx03cirPmCvVaTp3VE=@emersion.fr>
In-Reply-To: <T5AN4SYwiVlMP_M5BjzOYV5dTtcc60-0mIORLfkdPazgmXjgJ9xK7-Tt-GFtLYBanzgaxHW6I2PwgBS3yrJSwsjfDlx03cirPmCvVaTp3VE=@emersion.fr>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Nov 2020 16:19:21 +0100
Message-ID: <CAKMK7uFreq=SqqPGjNLank-iOYe8xWb3Lq8fyBVWhgNWuaWKSg@mail.gmail.com>
Subject: Re: [PATCH] drm: document drm_mode_get_connector
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 4:09 PM Simon Ser <contact@emersion.fr> wrote:
>
> On Wednesday, November 18, 2020 4:03 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > I think this causes warnings, because now we have kerneldoc for this,
> > but not for all the members. Also the member-specific stuff should be
> > documented as inline comment, see
> >
> > https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#in-line-member-documentation-comments
>
> Hm, right, will make sure the patch doesn't trigger warnings.
>
> I still think the force-probe stuff shouldn't be documented in in-line
> comments, because I'd never look at the in-line count_modes comment to know
> whether the ioctl probes or not. Adding short in-line comments sounds fine
> though.

Hm yeah, maybe give it a sub-title then like "Probe Modes" with the
two options. I think the detail that a small array/count (either 0 or
1 depending whether you want force probing) should be documented in
the inline comment though.

I think the inline comment for connection should also link to the
drm_connector_status enum. Maybe also have that link in the "Probe
Modes" section with an explanation that a forced probe can get rid of
some the unknown ones.

I also kinda wonder where we should up recommendations for autoconfiguration.
>
> > I also noticed that this file has a ton of wrong kerneldoc comments,
> > but they seem to not cause warnings (anything starting with /** is
> > fishy).
> >
> > Can I volunteer you for a bit more here?
>
> Yeah, I've noticed this as well. Will have a look!

Thanks!
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
