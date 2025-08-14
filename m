Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D59B26354
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8712910E04E;
	Thu, 14 Aug 2025 10:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="Mlb1VZWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0430D10E843
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:51:57 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7e87061d120so78435285a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755168716; x=1755773516;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EyUvbzeFbhuIBv4W0x0po1vS1DTZvcEEYsQW7Y4FHOk=;
 b=Mlb1VZWAoyry59Y8vuZI76ZHbbuirbJYZMA1ulQ6pHiNQCJzTOjz6QyYRo3eqQFX+0
 Qku1lC/cpZOC/M7C6x2QVjIe7gaftfwRpwCnjt3Yvr07Q2gsYEs331AwfY5W8lU08YOd
 pktpIuDw+GSrjhDznqiXWaL6+vqndSwveL9lKJBJZi+KWb88585lil71YeaYOLHk4G8F
 6ONnbHkjHZnXK2ZsbGLY7jPDSvVJ5aPG/f+vyMAxG4GGPfi52+710D4k5ailMY/JY0xw
 yu68Z7HzWaCPULXwSFQEene8pvhM9A4J71b1asqfpJdFprq+dSHChjN5q2JDdSEgnArY
 2awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755168716; x=1755773516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EyUvbzeFbhuIBv4W0x0po1vS1DTZvcEEYsQW7Y4FHOk=;
 b=vNYFsAT8+Hl990C95cy0b4GH7dNtJ8pf78gXH8ZkV9eqikFfbPl5tREJWpUeG9kTWD
 hXEMgFOcdAssMtcRfdZ01AIO/xjlsjL53QorXxUos+lrLBYAt0QPfkwk6+XX41nM0HK8
 JW+jD8MOL0SJa3E+/WnYCmkZSd/eYe0wSqu5EsPABnhZhnhVc3vOJUEXuj3K6MllbyE7
 EC/aU6sjrZsh8EPo2evw7wdvTItiRTXRCcG2F3lV/YQKbUBx9BWaQx0EK10DFS1a64Xp
 dRtk1/MpGzUP+iNzqfsIZGUYFY6yeyGjldXmS7dVrXVtRjI/EcX1u5l7fBtev803Uii7
 Uanw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkmHJsrpYGbzp/gYSNX5dIVTMslmPZZDBXYMGlr46TTG7/ge2fp8tWvgBQ06b+b8NxQEfnSh4w7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAk+XXi2ap9edDuklGjRumOrPH/vFuW+/d3SXnKqpSk6goTukd
 qgr6dsOXD9ZwWBqPhg3ZGwBCXy042sHqyXkM3zedFbgckd9Uy3yAhUXmzYyn9nLWzEZXH8lBi/4
 xY0fs9Di2nG4q+vxL6ddLDMoWjSAf8MDjKLFxj4uSuA==
X-Gm-Gg: ASbGncsbLA1PmsVeWpXnIGFuDfGIGt3GNkRKQ4Ih+m/QK793bl/KWWXdfx6EpRTyysQ
 y0Z+9wMttuxTGCB+3/UNLtVgLeXIAFUa7667DHkP7c/NvvKUbtY2k+rvwQ8PkdlSbOcJDfrTwh7
 yVpAc55yC5aIqmQbcqDUNhTG3SciXvlqFKeVWfSYcPfSbE4mw8yzcOT8CO7FCU4cnuwg9z/zWOk
 8TAyf4UsGs6NTaZYzKGzGriT52HW5eNvyoMMDtwOg==
X-Google-Smtp-Source: AGHT+IFU90m48TZvu7emDeXfQb++9pXmCA/ExMi3L8cHu3e/h3aMjPcuvjlvwAbLWla/D0jCK64yfVaPIBbatOC3QzI=
X-Received: by 2002:a05:620a:7088:b0:7e8:4693:4cf0 with SMTP id
 af79cd13be357-7e8705d8895mr317330585a.54.1755168715779; Thu, 14 Aug 2025
 03:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
 <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
In-Reply-To: <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 Aug 2025 11:51:44 +0100
X-Gm-Features: Ac12FXwC6fsbGm2wMI2VtffK314czO8RhVctNAh3tnx01lPB-4vBApOS_6ocfcM
Message-ID: <CAPj87rNDPQqTqj1LAdFYmd4Y12UHXWi5+65i0RepkcOX3wvEyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Tue, 12 Aug 2025 at 13:53, Daniel Stone <daniel@fooishbar.org> wrote:
> On Mon, 11 Aug 2025 at 22:05, Rob Herring (Arm) <robh@kernel.org> wrote:
> > +static int ethos_ioctl_submit_job(struct drm_device *dev, struct drm_file *file,
> > +                                  struct drm_ethos_job *job)
> > +{
> > +       [...]
> > +       ejob->cmd_bo = drm_gem_object_lookup(file, job->cmd_bo);
> > +       cmd_info = to_ethos_bo(ejob->cmd_bo)->info;
> > +       if (!ejob->cmd_bo)
> > +               goto out_cleanup_job;
>
> NULL deref here if this points to a non-command BO. Which is better
> than wild DMA, but hey.

Sorry this wasn't more clear. There are two NULL derefs here. If you
pass an invalid BO, ejob->cmd_bo is dereferenced before the NULL
check, effectively neutering it and winning you a mail from the other
Dan when he runs sparse on it. Secondly you pass a BO which is valid
but not a command BO, cmd_info gets unconditionally dereferenced so it
will fall apart there too.

> > +       for (int i = 0; i < NPU_BASEP_REGION_MAX; i++) {
> > +               struct drm_gem_object *gem;
> > +
> > +               if (job->region_bo_handles[i] == 0)
> > +                       continue;
> > +
> > +               /* Don't allow a region to point to the cmd BO */
> > +               if (job->region_bo_handles[i] == job->cmd_bo) {
> > +                       ret = -EINVAL;
> > +                       goto out_cleanup_job;
> > +               }
>
> And here I suppose you want to check if the BO's info pointer is
> non-NULL, i.e. disallow use of _any_ command BO instead of only
> disallowing this job's own command BO.

This is the main security issue, since it would allow writes a
cmdstream BO which has been created but is not _the_ cmdstream BO for
this job. Fixing that is pretty straightforward, but given that
someone will almost certainly try to add dmabuf support to this
driver, it's also probably worth a comment in the driver flags telling
anyone who tries to add DRIVER_PRIME that they need to disallow export
of cmdbuf BOs.

Relatedly, I think there's missing validity checks around the regions.
AFAICT it would be possible to do wild memory access:
* create a cmdstream BO which accesses one region
* submit a job using that cmdstream with one data BO correctly
attached to the region, execute the job and wait for completion
* free the data BO
* resubmit that job but declare zero BO handles

The first issue is that the job will be accepted by the processing
ioctl, because it doesn't check that all the regions specified by the
cmdstream are properly filled in by the job, which is definitely one
to fix for validation. The second issue is that region registers are
not cleared in any way, so in the above example, the second job will
reuse the region configuration from the first. I'm not sure if
clearing out unused job fields would be helpful defence in depth or
not; your call.

> (There's also a NULL deref if an invalid GEM handle is specified.)

This one is similar to the first; drm_gem_object_lookup() return isn't
checked so it gets dereferenced unconditionally.

Cheers,
Daniel
