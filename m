Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BD3699F95
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 23:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E773910E38B;
	Thu, 16 Feb 2023 22:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD63810E38B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 22:08:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 g6-20020a05600c310600b003e1f6dff952so5360536wmo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1676585287;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPtKJo9uzlMbqFwgogBCaidam3IFBJ25DbmRZejTbw8=;
 b=jB5QcbTg7E/RoJswPQ07QlMEw+zeu2daTGLLLuDm9I6Od5VmBkY17pMFFuKFoD0jTA
 xoM0CpBh1hiyBe3YgAdQ7njuyr5aXbf179ad0kV05vSJX5UKxBa8Q6Jxxv6TrxqDWzUI
 iZWl9MLy9BPnaPG2rmybso0dqRp8TRloXzCwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676585287;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JPtKJo9uzlMbqFwgogBCaidam3IFBJ25DbmRZejTbw8=;
 b=6he0SSj0LwWC7rxTWayj9PPkGlLGxjW1f3aFvQiPVL1dKTYXmvwWQVPxhmCSahtk4p
 DXOd9DWMzRWsk3Ic2AeQmj604Ps9Qxc0TxssFIaFzfuHuRCXog7joqm4bvWzCwZqUIjK
 fgiJweEqrllSmFyHGv5Cpz/coL7PW5LteQMtZgpfwHTC3V+bUttYoivyKI3VL0pxEZ8Q
 GCKymkx0ELsTw2hH8ntKeXCXmywjHuDHj6gsz74j87C8DjBw1w+n74X03BOK6uvzXE42
 uVHSYixMm/fU4raperTBRpszOHRH07d5nfp9doJvpwFSFLeIFYUSxqb3EpwDrBFtPqOH
 ZB7A==
X-Gm-Message-State: AO0yUKVpPsLooJXHEXXAS41kWLm9NMyxeA/jL5IxUC8ddrQRcBYk7jxH
 6x00KUu7D2W7DI/4YsBRdRRA6w==
X-Google-Smtp-Source: AK7set/3YOBop3Elq8fdTq/3aXEvc3XA6+caiK+/8lZSXrLrHk3r4WC6sfK021BpJY5Y1vaapO9s3Q==
X-Received: by 2002:a05:600c:b87:b0:3e2:415:f09f with SMTP id
 fl7-20020a05600c0b8700b003e20415f09fmr6148446wmb.3.1676585287109; 
 Thu, 16 Feb 2023 14:08:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003df7b40f99fsm6915429wma.11.2023.02.16.14.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 14:08:06 -0800 (PST)
Date: Thu, 16 Feb 2023 23:07:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Message-ID: <Y+6pM/HuBuz+eqtA@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 David Airlie <airlied@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
 <20230127081339.yovxofpboc4gfdgo@sirius.home.kraxel.org>
 <0081b2c3-56c9-3ed8-b419-5ce8a151999e@collabora.com>
 <Y+4eYqdH1Xw2OYX5@phenom.ffwll.local>
 <c6ae4f5f-7fe1-5497-a611-bee57672c289@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6ae4f5f-7fe1-5497-a611-bee57672c289@collabora.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 11:43:38PM +0300, Dmitry Osipenko wrote:
> On 2/16/23 15:15, Daniel Vetter wrote:
> > On Mon, Jan 30, 2023 at 03:02:10PM +0300, Dmitry Osipenko wrote:
> >> On 1/27/23 11:13, Gerd Hoffmann wrote:
> >>> On Thu, Jan 26, 2023 at 01:55:09AM +0300, Dmitry Osipenko wrote:
> >>>> Hello Thomas and Gerd,
> >>>>
> >>>> On 1/9/23 00:04, Dmitry Osipenko wrote:
> >>>>> This series:
> >>>>>
> >>>>>   1. Makes minor fixes for drm_gem_lru and Panfrost
> >>>>>   2. Brings refactoring for older code
> >>>>>   3. Adds common drm-shmem memory shrinker
> >>>>>   4. Enables shrinker for VirtIO-GPU driver
> >>>>>   5. Switches Panfrost driver to the common shrinker
> >>>>>
> >>>>> Changelog:
> >>>>>
> >>>>> v10:- Rebased on a recent linux-next.
> >>>>>
> >>>>>     - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.
> >>>>>
> >>>>>     - Added Steven's ack/r-b/t-b for the Panfrost patches.
> >>>>>
> >>>>>     - Fixed missing export of the new drm_gem_object_evict() function.
> >>>>>
> >>>>>     - Added fixes tags to the first two patches that are making minor fixes,
> >>>>>       for consistency.
> >>>>
> >>>> Do you have comments on this version? Otherwise ack will be appreciated.
> >>>> Thanks in advance!
> >>>
> >>> Don't feel like signing off on the locking changes, I'm not that
> >>> familiar with the drm locking rules.  So someone else looking at them
> >>> would be good.  Otherwise the series and specifically the virtio changes
> >>> look good to me.
> >>>
> >>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> >>
> >> Thomas was looking at the the DRM core changes. I expect he'll ack them.
> >>
> >> Thank you for reviewing the virtio patches!
> > 
> > I think best-case would be an ack from msm people that this looks good
> > (even better a conversion for msm to start using this).
> 
> The MSM pretty much isn't touched by this patchset, apart from the minor
> common shrinker fix. Moving whole MSM to use drm_shmem should be a big
> change to the driver.
> 
> The Panfrost and VirtIO-GPU drivers already got the acks. I also tested
> the Lima driver, which uses drm-shmem helpers. Other DRM drivers should
> be unaffected by this series.

Ah that sounds good, I somehow thought that etnaviv also uses the helpers,
but there we only had problems with dma-buf. So that's all sorted.

> > Otherwise I think the locking looks reasonable, I think the tricky bits
> > have been moving the dma-buf rules, but if you want I can try to take
> > another in-depth look. But would need to be in 2 weeks since I'm going on
> > vacations, pls ping me on irc if I'm needed.
> 
> The locking conversion is mostly a straightforward replacement of mutex
> with resv lock for drm-shmem. The dma-buf rules were tricky, another
> tricky part was fixing the lockdep warning for the bogus report of
> fs_reclaim vs GEM shrinker at the GEM destroy time where I borrowed the
> drm_gem_shmem_resv_assert_held() solution from the MSM driver where Rob
> had a similar issue.

Ah I missed that detail, if msm solved that the same way then I think very
high chances it all ends up being compatible. Which is really what
matters, not so much whether every last driver actually has converted
over.

> > Otherwise would be great if we can land this soon, so that it can soak the
> > entire linux-next cycle to catch any driver specific issues.
> 
> That will be great. Was waiting for Thomas to ack the shmem patches
> since he reviewed the previous versions, but if you or anyone else could
> ack them, then will be good too. Thanks!

I'm good for an ack, but maybe ping Thomas for a review on irc since I'm
out next week. Also maybe Thomas has some series you can help land for
cross review.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
