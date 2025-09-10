Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024BAB51932
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578DC10E2EC;
	Wed, 10 Sep 2025 14:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nLrRMCiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6BB10E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 14:22:17 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-71d6051aeafso54647697b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1757514136; x=1758118936;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NbI3XtrWeiAfL17IN4rrKH+Ltn8PAz/n7TKulLhLSW4=;
 b=nLrRMCiF7EPGsHPTW2WomfglmLnU+Dd6rNX1yWnIcIRzrkDlxp1gqGaVi8N+1xyiaJ
 irUBFi9kxJL7PjXG0gK9z1pzmuSKiQuTfVxupjJw+xVTm7gh1XM6c4zBsC7ohe43Eien
 vJ90L2DIXfxEP2BJB/C6KlUhx82A/9+8Z0tRd4Au9ramZzpkD4qf2LP2Qzwfh9+myCAS
 0osEksaTNh2K0v4Zt1SOu4FzCCFsHYQhq0dby1qsmtbpOSeqLe6Q6LfUydZwc1dtSv3C
 vaeeIu3WAyRUU2vWdoMVdc3ncIqN/myU4dNNOhH5W7/YYU7rQhKaFRfD0Lm1BSxNew5k
 IKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757514136; x=1758118936;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NbI3XtrWeiAfL17IN4rrKH+Ltn8PAz/n7TKulLhLSW4=;
 b=XgNp65dRkrtqPiE1PlVgKD0Gpzd//lDzBlsMh8n/FYFlg1tEASD3R7GsBMBm4cBZL8
 eR3MaXQbpL+L50v+E/FcpWE2gR5M96J90m+14J/6J3Qv/+xq8jZrv0avTHMm69XR4Tcj
 ePB5fZnbecIv0dRnehGOd5Ir4C9z+yKZSAq8UoDHaB81/VESJixokKNJwkL86Ndt+p7q
 2jeihQnURfKECXI0/XElSMFRgDUf5EB1/kT7k9hz9Dl6i52QxWR9MUYVOQU4QIOalrF3
 dIAHYPwFO42+b/upbqwCKuuZtKnJDi/pBE3Mq4uYfnR48E8rHqvGIQmu/jI46XwAX8RR
 e+uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqzsXyME+dx8c0Z5FD/P+bIKKz2mZ1/M0dz1lMsSfI1Y9wPSnR1mosOnXu+hP8jbHPe364Aws7Eso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs5TQkPxOEYf591SJK0j48q46lUoJfqeoh+K088CmPY95prl1x
 lP4tubgAfgde9FFYnEc+vb+3BKmAgPw+CMZilVjbSD4jd/wSA8Fm6feupm2y+uUSu1YcdGR9M1z
 1f2NpS1EpNIrS8/MKld6VDaj1ml3bcIXdbbYnA/q1Jg==
X-Gm-Gg: ASbGnctPEUIzE73G2TOGACLTF2p2kuculkdfzapqiFJL7V6J4q9j6WpdlgT3ymf1y/o
 PuoFLqDcU+AmZIVYti3syr0sQvm2Yxte5kk3bx6fMXyU8E25zXeP0BYijnb7+jzcolakmRBCS5Y
 /Ai4pZ6r8sfXMJ/EoiL005nqxHabHJgJvkgIAESVZmFD96/8h8sZ4mAOfwGVozSWD4w1poDZaL0
 eumVPZnMtL3iUBYNnKp07qHVci1+gMqJ/FeeGNYrkC1BPRFqw==
X-Google-Smtp-Source: AGHT+IFUo1uVtNHSnP8Nhf+uhc15fO8avExAUC3caetFrA1lApFmwbcGCtGZuZpabR6cjtqgKxftAOablvHlNfYyr/I=
X-Received: by 2002:a05:690c:7088:b0:727:637f:8729 with SMTP id
 00721157ae682-727f5b2f46emr139954427b3.44.1757514136106; Wed, 10 Sep 2025
 07:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
 <pz5luqbagulactqp7h237apoostl64rcrnvmu53eauvtb6cqly@nsmzsvbfixrr>
 <bmbu6dfhr4i37fxlqo7ltalkzz6bocb5whuv34x437k3crie5j@ndtqjrv64n5j>
In-Reply-To: <bmbu6dfhr4i37fxlqo7ltalkzz6bocb5whuv34x437k3crie5j@ndtqjrv64n5j>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 10 Sep 2025 15:21:58 +0100
X-Gm-Features: Ac12FXzGi6FvExML235VpMWJC7OtX3X_HUqq2rGTITMHO2b6QfyU1Z_oqgDmcto
Message-ID: <CAPY8ntD-q6nZcVJmo5OG_6U5cxdOVdwKLJChsQZd_ZFjCRuGZQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v7] drm/vc4: hdmi: switch to generic CEC helpers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
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

Hi Dmitry

On Fri, 5 Sept 2025 at 17:51, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Aug 15, 2025 at 06:11:57PM +0300, Dmitry Baryshkov wrote:
> > On Sat, Jul 05, 2025 at 01:05:13PM +0300, Dmitry Baryshkov wrote:
> > > Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> > > registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> > > now.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > > This is a part of the HDMI CEC rework, posting separately to let it be
> > > tested by the maintainers.
> > > ---
> > > Changes in v7:
> > > - Dropped all applied patches, keeping just VC4
> > > - Link to v6: https://lore.kernel.org/r/20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com
> > >
> >
> > Can I please get Tested-by for this patch? It has been R-B'ed, but I
> > totally don't think it should be applied without testing on the actual
> > hardware...
>
> And another ping to get it tested by...

Apologies - I'll find a display or AVR that supports CEC tomorrow to test.

  Dave

> --
> With best wishes
> Dmitry
