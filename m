Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3D6DE187
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 18:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FD110E5CB;
	Tue, 11 Apr 2023 16:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CCC10E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 16:53:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f4130b898cso19227f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681232000;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+gfcS2tsX9XYUKArm1OCX22keoi76nV+AVghU8pmdeQ=;
 b=ZHwBGcIXDowSL7P0mmBS86mEH7x4yQD/opnqA2YmT3uLGcV8wIz3w7kfDDiqRZH8wK
 CvPWLRqV56VJ/fHFbywikIUe0WbQ4aqOlQbMcsWioRrumzFp7GM23LX4kQisKX4N65dC
 bSyte7J7M300AOpKo4rtQgSP5iikR5XAeKqVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681232000;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+gfcS2tsX9XYUKArm1OCX22keoi76nV+AVghU8pmdeQ=;
 b=ysuuTCzm8mC8QIQ/yWdg/RDFWfxiXnVcARFALz+mFQTQSLwWMNsDra57oMf61V7hM5
 qQXImTr2WPJw/NiUBk+H68sSYNII7arSM0RIDxzzV/ug24Y1Ivrbs5En56b64JakMBwp
 8SoG/rxyKJbLl9za53bAPTX1ShgDwyKZXYl79stUrwEzoTT6yELgGKMuXDNPdcfaDFe3
 F0PomKyD1mYFUfcWMKbcScyHViPex286bTk+CJFbAm/j8Vpo4Ad3klC80q6zUEo9K9hl
 /GmXVVZvQWpSv/4yXKEORIKsubJ0kWK4wUqUCXNz/DCmgXCvV5/8eTpPXpq4daC6Omb2
 N2eg==
X-Gm-Message-State: AAQBX9fmFyIbDTm5KLR4uQGVd8Rn2qDDuupomrPYiX5YjELENw5yN+eL
 jbmCslnMTg7MEp7xiSnOwIglsQ==
X-Google-Smtp-Source: AKy350br+rdKktY3gNnwuJRPjU8rT52r6Z6DA+ZmF+aY8UidhYk2IuG1US9rA79MkKG7FwSbsx8pVQ==
X-Received: by 2002:a05:600c:3490:b0:3f0:7ec7:a71 with SMTP id
 a16-20020a05600c349000b003f07ec70a71mr8239096wmq.4.1681231999969; 
 Tue, 11 Apr 2023 09:53:19 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c0b5700b003ee44b2effasm17500892wmr.12.2023.04.11.09.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 09:53:19 -0700 (PDT)
Date: Tue, 11 Apr 2023 18:53:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 0/2] drm: fdinfo memory stats
Message-ID: <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org
References: <20230410210608.1873968-1-robdclark@gmail.com>
 <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> On Mon, Apr 10, 2023 at 2:06 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Similar motivation to other similar recent attempt[1].  But with an
> > attempt to have some shared code for this.  As well as documentation.
> >
> > It is probably a bit UMA-centric, I guess devices with VRAM might want
> > some placement stats as well.  But this seems like a reasonable start.
> >
> > Basic gputop support: https://patchwork.freedesktop.org/series/116236/
> > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> 
> On a related topic, I'm wondering if it would make sense to report
> some more global things (temp, freq, etc) via fdinfo?  Some of this,
> tools like nvtop could get by trawling sysfs or other driver specific
> ways.  But maybe it makes sense to have these sort of things reported
> in a standardized way (even though they aren't really per-drm_file)

I think that's a bit much layering violation, we'd essentially have to
reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want to
be in :-)

What might be needed is better glue to go from the fd or fdinfo to the
right hw device and then crawl around the hwmon in sysfs automatically. I
would not be surprised at all if we really suck on this, probably more
likely on SoC than pci gpus where at least everything should be under the
main pci sysfs device.
-Daniel

> 
> BR,
> -R
> 
> 
> > [1] https://patchwork.freedesktop.org/series/112397/
> >
> > Rob Clark (2):
> >   drm: Add fdinfo memory stats
> >   drm/msm: Add memory stats to fdinfo
> >
> >  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> >  drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> >  include/drm/drm_file.h                | 10 ++++
> >  5 files changed, 134 insertions(+), 3 deletions(-)
> >
> > --
> > 2.39.2
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
