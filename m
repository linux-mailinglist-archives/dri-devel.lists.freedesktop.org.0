Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1B1BAFB6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 22:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8290189CF9;
	Mon, 27 Apr 2020 20:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86A189CF9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 20:47:13 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w2so14608398edx.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 13:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohkGtfGENaaLH1p+LuB5iTKDRuTnJqaCWLKDZs3R4dA=;
 b=1xKgKW0XL3jsYDOP4UT/GMCGQTMBVedtUbhH0nh/tiMPdWdYnWKdRHqP04P3eXYUTp
 gGCkHQKfRCHIIXtSTyq10vpl1wD7hC9k3fybaYzvICeZ7Zx+C11Ydb3WlmqGH8MlvlTZ
 Sb9wM1/9CLLaTttu6WXlvA7joL9C7aQH+wYJpWTKQq7UsxM3GUY5URg/rN6iSHBCzZHD
 g9IXgEG7e2mMil2dvzVKQnVmPt2rhx2GJ45sdWoHdqYBuUTgZbixGAlE8kebeo9km/oO
 NO53SCbSwTn6fhra7HUlmHeiMyHW6BvuMJa1ykx8j4Rfy1skeXk//UpC51a78YjedoBa
 BkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohkGtfGENaaLH1p+LuB5iTKDRuTnJqaCWLKDZs3R4dA=;
 b=S7Pn4w7wp7L88e6fyrDSbNzg3y1MrJ9q3He9Cw4mWGPqOSsTcAKZmiAXoSQtUWAXDO
 NsR3vlqz+DbIWqHFYpzS1cxEVgOi4nMBdZ4XVXY05BgQNlPvjdgoKomhXHejnEpw92b8
 lz/qGgCq3nbtXGxPwdTyvDhHvvFZCCQvX4RE5fEgNm/heEpAUx0hTT4K6Qpvsbs2KsxD
 8FvB1/cm338+9/ctLbpYaC6C+rSydzT7CKa4mkeBZRvIAJb7ixCcMDBEhyk0j0i/6lIf
 38qE6eXDfobPYbgahOqmfuiuBqEnJB/cJW3otEycX6XIQtdrkENEM4/FcJRV97PS/7OE
 4V9Q==
X-Gm-Message-State: AGi0PuarU+B3lRds2AkLo7jPHfke6UqZmcE8bcZMegWznMVAJy80H0ig
 yj3cvStOFd71/SKyUfkuQBsCRftG/Iypclyap9wXXw==
X-Google-Smtp-Source: APiQypLgkDrIaqDwFd9GHRXWJQn+DI5W7iN8ZBzqhG2Ay0KuMlGlzoPgyapYQI//N/0E/6MkLFMydb1NZF2GQxAAbc0=
X-Received: by 2002:a05:6402:1b91:: with SMTP id
 cc17mr19367330edb.46.1588020432504; 
 Mon, 27 Apr 2020 13:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
In-Reply-To: <20200427200513.36328-1-pcc@google.com>
From: Eric Anholt <eric@anholt.net>
Date: Mon, 27 Apr 2020 13:47:01 -0700
Message-ID: <CADaigPViPMOsHA2FtjL4BJ0YdbYm0L7AKC_tgiRXVrU6Zh5YEA@mail.gmail.com>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
To: Peter Collingbourne <pcc@google.com>
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 27, 2020 at 1:05 PM Peter Collingbourne <pcc@google.com> wrote:
>
> Render nodes are not just useful for devices supporting GPU hardware
> acceleration. Even on devices that only support dumb frame buffers,
> they are useful in situations where composition (using software
> rasterization) and KMS are done in different processes with buffer
> sharing being used to send frame buffers between them. This is the
> situation on Android, where surfaceflinger is the compositor and the
> composer HAL uses KMS to display the buffers. Thus it is beneficial
> to expose render nodes on all devices that support buffer sharing.
>
> Because all drivers that currently support render nodes also support
> buffer sharing, the DRIVER_RENDER flag is no longer necessary to mark
> devices as supporting render nodes, so remove it and just rely on
> the presence of a prime_handle_to_fd function pointer to determine
> whether buffer sharing is supported.

I'm definitely interested in seeing a patch like this land, as I think
the current state is an ugly historical artifact.  We just have to be
careful.

Were there any instances of drivers with render engines exposing PRIME
but not RENDER?  We should be careful to make sure that we're not
exposing new privileges for those through adding render nodes.

There's a UAPI risk I see here.  Right now, on a system with a single
renderer GPU, we can just open /dev/dri/renderD128 and get the GPU for
rendering, and various things are relying on that (such as libwaffle,
used in piglit among other things)   Adding render nodes for kms-only
drivers could displace the actual GPU to 129, and the question is
whether this will be disruptive.  For Mesa, I think this works out,
because kmsro should load on the kms device's node and then share
buffers over to the real GPU that it digs around to find at init time.
Just saying, I'm not sure I know all of the userspace well enough to
say "this should be safe despite that"

(And, maybe, if we decide that it's not safe enough, we could punt
kms-only drivers to a higher starting number?)

> @@ -260,12 +258,6 @@ static int vc4_drm_bind(struct device *dev)
>         if (!vc4)
>                 return -ENOMEM;
>
> -       /* If VC4 V3D is missing, don't advertise render nodes. */
> -       node = of_find_matching_node_and_match(NULL, vc4_v3d_dt_match, NULL);
> -       if (!node || !of_device_is_available(node))
> -               vc4_drm_driver.driver_features &= ~DRIVER_RENDER;
> -       of_node_put(node);
> -
>         drm = drm_dev_alloc(&vc4_drm_driver, dev);
>         if (IS_ERR(drm))
>                 return PTR_ERR(drm);

Looks like dropping this code from vc4 should be fine -- kmsro looks
for a render node from each driver name it supports in turn, so even
if v3d moves from renderD128 to renderD129, things should still work.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
