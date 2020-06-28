Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368CA20CB09
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 01:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4824F89FA6;
	Sun, 28 Jun 2020 23:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FCB89FA6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 23:02:03 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id x83so5374299oif.10
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFXV7zU7d2aO2yFJ0oYL5tOi9HgfSWnYg/siYuUTMNE=;
 b=Hfb/I2m1gGJnZKNPvol9THHFrIAtmv1c4D4sy2J9+xyMtOupWHwLfCIM72+Tuyr2Kv
 W977mIPw/xsghganl8Y4mJDxxvc6X60aTiEAyIX1V7WRxv1nyumkG0JAz9ma/83YAa03
 UqoTqnaWgFcE4WQgWUHYJREadcLcjrsTpZQKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFXV7zU7d2aO2yFJ0oYL5tOi9HgfSWnYg/siYuUTMNE=;
 b=CLd4g5vS9wfXoYnlIPmZmcemfbo5BjLmixRqKV+d95o8NnYzVtSZdab5P7m7HeEa1d
 EnsG181TgtPzGs2C1apAiKkCK8Jaqpa8+XD6yddffsWUSn73YgyIMn4HW2hKRvq1UeCF
 fMxbwWCAr3cJNeBrk1xT9e1nklhrwf39u6pXOXHMTdYOvUT3715sp3aXYmxvF8nQs6bn
 PnOCq90yzI+8gHDweVq0/clm4dGeL4yiaK8c9KQQ5nAKOZ15ZBYJgqoOajv7eQWTL6fN
 zY4iYxHNJk7AAR6fIBgNJQCP6tyYPZJdXIISV0AIgmWJb6dhgds3CLNrkgiikJNWjrkN
 0PrA==
X-Gm-Message-State: AOAM532oabLptii0i51f+l8qBARgmle0rFR4MzssvPfQ+pg/8gor6qti
 w/wDW370+vM45NQuN5t2Btd9oXFKSFXddDg3FoUxEw==
X-Google-Smtp-Source: ABdhPJyT+a/pW+st1ahh4OYWn7YrmSdQdK9rMlURfY4eL3/ugaSOalgbTcVXrcx6ZTTC6m9tRQuBf/OZ4alnE1vq2uU=
X-Received: by 2002:aca:cc8e:: with SMTP id
 c136mr10224136oig.128.1593385322913; 
 Sun, 28 Jun 2020 16:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200622110623.113546-1-drawat.floss@gmail.com>
In-Reply-To: <20200622110623.113546-1-drawat.floss@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 29 Jun 2020 01:01:52 +0200
Message-ID: <CAKMK7uExRNRV8spaBzaO8syPiFGw-8f5ZHLhtZj159JsRFMRPw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] DRM driver for hyper-v synthetic video device
To: Deepak Rawat <drawat.floss@gmail.com>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Michael Kelley <mikelley@microsoft.com>,
 Jork Loeser <jloeser@microsoft.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Wei Hu <weh@microsoft.com>,
 K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 1:07 PM Deepak Rawat <drawat.floss@gmail.com> wrote:
>
> Hi All,
>
> First draft of DRM driver for hyper-v synthetic video device. This synthetic
> device is already supported by hyper-v and a corresponding framebuffer driver
> exist at drivers/video/fbdev/hyperv_fb.c. With this patch, just reworked the
> framebuffer driver into DRM, in doing so got mode-setting support. The code is
> similar to cirrus DRM driver, using simple display pipe and shmem backed
> GEM objects.
>
> The device support more features like hardware cursor, EDID, multiple dirty
> regions, etc, which were not supported with framebuffer driver. The plan is to
> add support for those in future iteration. Wanted to get initial feedback and
> discuss cursor support with simple kms helper. Is there any value to add cursor
> support to drm_simple_kms_helper.c so that others can use it, or should I just
> add cursor plane as device private? I believe we can still keep this driver
> in drm/tiny?

Simple is for really simple framebuffers, if you want a few planes or
multiple outputs or multiple crtcs then just write a normal drm
driver. We've worked hard to ditch all the boilerplate and replace it
with defaults, so the difference isn't much, and if we don't keep
simple helpers really simple there's not much point.

Also once you don't use simple helpers anymore I think migrating out
of drm/tiny is probably a good idea.
-Daniel

> For testing, ran GNOME and Weston with current changes in a Linux VM on
> Windows 10 with hyper-v enabled.
>
> Thanks,
> Deepak
>
> Deepak Rawat (2):
>   drm/hyperv: Add DRM driver for hyperv synthetic video device
>   MAINTAINERS: Add maintainer for hyperv video device
>
>  MAINTAINERS                       |    8 +
>  drivers/gpu/drm/tiny/Kconfig      |    9 +
>  drivers/gpu/drm/tiny/Makefile     |    1 +
>  drivers/gpu/drm/tiny/hyperv_drm.c | 1007 +++++++++++++++++++++++++++++
>  4 files changed, 1025 insertions(+)
>  create mode 100644 drivers/gpu/drm/tiny/hyperv_drm.c
>
> --
> 2.27.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
