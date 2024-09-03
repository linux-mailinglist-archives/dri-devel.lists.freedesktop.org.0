Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3067B969EAE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 15:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114B710E59E;
	Tue,  3 Sep 2024 13:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qjjjgddi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8093910E59D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 13:08:12 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-82a20efed34so273565839f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725368892; x=1725973692; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeRs4z3I8mmDPvKoL9y7zecAhLAZtwSgnEUeAq3N0pw=;
 b=qjjjgddi0YrLsTBZeuzFhaf3NymDMyNbzbONVzU2mJ0vk1k4QVdLyznLHfD9KZODWQ
 xaV+FHRSRA6hbLFGKxR9IIL5CXVnWH5GRSiAtTIhm/JQZasHgjmSHRJ3YzyVs1e3x/tB
 7Sm/XROWIVTgLPWR+Gw3lx8K0BCCo2MQ44aHfmeYS8ACt8E9R/GUp/6hnwotR84V3sKn
 XC0cciSn+Zmkr7T17wjsHiB0ngbJHQc4azs7jIXazI3rxFZdTLRHvawz7wKgDVDq4Zux
 76z1VuCzWcwMQQSsdA6gVBSO3KhdyfGHlMViVdYNuEwDFMvW7QwWZhhKoKaBxPEDe7VS
 WNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725368892; x=1725973692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeRs4z3I8mmDPvKoL9y7zecAhLAZtwSgnEUeAq3N0pw=;
 b=kqLsKP1Lw4pRGKBhzbR6zw+KEqVq7SbA3tlVybsH62KtbTgpfnRGxWXoaCJgDVzE/6
 CwM+fF9RYSh8VqvfpAOuYq307leKHUYn/8P2vYaIqae3NxqfSCW7r/BTKtDuDD1IO8jB
 NGqxpbt7AV+eWLug/J1O9t1UoVvoHTMtUeZauN7XYf4Q6GKYrdDXRhKSYliELh6emXBm
 68ISUa0K8jBdw6aKFnA+C1P9RbWcMy/6jYtqWF5cpxwg/E+ITZyebvF0ezyLFUP0f2le
 qQUQIZdgU9SDW9OcENglF3g36mMD5NSMgHxpuhlJSYsLNO0A8jeAePE7G9lwTHXZhpGs
 jhdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaiDjv6WUsmU36FoR4NkdqNSJSVTr4PFi+nRzU9AnA9djrwttHW/JuKiAsQmrKAPah/NoW/VjCFfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysRWZqO5YeA4sLMJLaB7uknlPtx1hZPIY1sE/mwe8RtmvffC2W
 CS2y/X9KTrd62T2xIUfLXt4GViSwPN4TQlCDXZ14pf43nID00Q6VSoj4iI3QQI6Uq1QzY449kSI
 dY7y/B/jU1mJz50WkaKO5h2gN2HCsZ7eIhplCAw==
X-Google-Smtp-Source: AGHT+IGHAgnSMNvuVful4dbf9WKc4xkX76uqFfFYB8rGHdSebPTzop/+5Lxf4E1tJz0Qa5koqY5wyz6U/9g7ZRt6e8w=
X-Received: by 2002:a05:6e02:12cf:b0:39b:32f6:5e90 with SMTP id
 e9e14a558f8ab-39f4e0d41e1mr118881735ab.15.1725368891480; Tue, 03 Sep 2024
 06:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-78-tzimmermann@suse.de>
In-Reply-To: <20240830084456.77630-78-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 16:08:00 +0300
Message-ID: <CAA8EJpoX3X6+u7Nst4qj5J0hcUCeYQvULW1wMSjwnVyLQeszjA@mail.gmail.com>
Subject: Re: [PATCH v3 77/81] drm/msm: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
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

On Fri, 30 Aug 2024 at 11:45, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The msm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c   |   4 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  13 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c | 144 ++++++--------------------------
>  3 files changed, 38 insertions(+), 123 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
