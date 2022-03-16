Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E94DBA53
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 22:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AAE10E05D;
	Wed, 16 Mar 2022 21:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6AC10E04F;
 Wed, 16 Mar 2022 21:49:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso2797059wms.1; 
 Wed, 16 Mar 2022 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CtD+Q8xYCQwOTsJk6RUepbB/BPj2KkJaY9i4ORpgAR0=;
 b=gsmqqsgBuSkvKJmUS2edlitkP1gbyVjhR+mi0GPUwWS/3wgu2ox+3R/3oQOS6i5DdC
 hiB9OuKf56GyreJsgyKKWIqVwo8DbnFf39/EONKEml9ozNdDEpXTPQ5q7yQHu6VGA0Jw
 k+hDq25t+uOGPS6NhWAVzkr/foTQdXyuIttXvAXXB1yMth5o5L/TCz0nV3KLhP33FK2z
 vHlJJRUqlHzsGezhe8jg6+JWrywhfj3P7f3IEURx6CZTZ0R91tU0KjmfEC6o9o4CbEY2
 rvDGxXWAwXPcwml1CtoXaha6P4g5vncJlMiYXb/Ef7+cQmVVg7fr8y37N18+P194dTuL
 9x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CtD+Q8xYCQwOTsJk6RUepbB/BPj2KkJaY9i4ORpgAR0=;
 b=AymyHIy9TYy34EYBpIu6wYtcuvrBK8sDXz3FSa6P6fL9M6Oo2QvJ0Faw0Jdc8QugIx
 k330TUzfCdfT+iILAVa7Kxq0UD8qicOrq44uObbxB+pB9C3eNDhMhmRgpIoaROydaDxS
 vA+G7X7A4JZNhEdSFpx1lofkB2KTj/zDqqC8cxT7lM0SlMQPn0WCkMBDANi6WuB8NMG2
 1/aIOcUVptAmvYFqjS6Ah+1+a1RdFC2WdsOH2TXxkVlRQkqoTRDj6EFLWdnUClQ9DM6I
 veXKtJ8fyUA3I7oCA4JBf75IZIyqGl2ZmwaB1cFxhfqa6gAeWTMe4PnINQmLFbapua/t
 eloQ==
X-Gm-Message-State: AOAM5310F+nXSRG6OG3DKfcGoun3OAvanlT1bjj7Qvlc1IUWMWMPVCdX
 RNtaihtPdQY0c+8JPKNkXCx8j6E6Y4GjcXuRgSY=
X-Google-Smtp-Source: ABdhPJw5D+eLsYaC94e1YZFTrQ6mywJt26HC4TbPmTKiH1uWmwyutSKpsz2PbasF8ljgne96lYtY9G+tjpwRLSQVVPo=
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id
 w22-20020a1cf616000000b0037d1e1cf90amr9190749wmc.148.1647467386069; Wed, 16
 Mar 2022 14:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
In-Reply-To: <20220308180403.75566-1-contactshashanksharma@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 16 Mar 2022 14:50:28 -0700
Message-ID: <CAF6AEGtnXvo=-fKbgSRtAtZ80igqJM2bTKefiLPUsSohU9idNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
To: Shashank Sharma <contactshashanksharma@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 11:40 PM Shashank Sharma
<contactshashanksharma@gmail.com> wrote:
>
> From: Shashank Sharma <shashank.sharma@amd.com>
>
> This patch adds a new sysfs event, which will indicate
> the userland about a GPU reset, and can also provide
> some information like:
> - process ID of the process involved with the GPU reset
> - process name of the involved process
> - the GPU status info (using flags)
>
> This patch also introduces the first flag of the flags
> bitmap, which can be appended as and when required.
>
> V2: Addressed review comments from Christian and Amar
>    - move the reset information structure to DRM layer
>    - drop _ctx from struct name
>    - make pid 32 bit(than 64)
>    - set flag when VRAM invalid (than valid)
>    - add process name as well (Amar)
>
> Cc: Alexandar Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Amaranath Somalapuram <amaranath.somalapuram@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 31 +++++++++++++++++++++++++++++++
>  include/drm/drm_sysfs.h     | 10 ++++++++++
>  2 files changed, 41 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 430e00b16eec..840994810910 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -409,6 +409,37 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_sysfs_hotplug_event);
>
> +/**
> + * drm_sysfs_reset_event - generate a DRM uevent to indicate GPU reset
> + * @dev: DRM device
> + * @reset_info: The contextual information about the reset (like PID, flags)
> + *
> + * Send a uevent for the DRM device specified by @dev. This informs
> + * user that a GPU reset has occurred, so that an interested client
> + * can take any recovery or profiling measure.
> + */
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info)
> +{
> +       unsigned char pid_str[13];
> +       unsigned char flags_str[15];
> +       unsigned char pname_str[TASK_COMM_LEN + 6];
> +       unsigned char reset_str[] = "RESET=1";
> +       char *envp[] = { reset_str, pid_str, pname_str, flags_str, NULL };
> +
> +       if (!reset_info) {
> +               DRM_WARN("No reset info, not sending the event\n");
> +               return;
> +       }
> +
> +       DRM_DEBUG("generating reset event\n");
> +
> +       snprintf(pid_str, ARRAY_SIZE(pid_str), "PID=%u", reset_info->pid);
> +       snprintf(pname_str, ARRAY_SIZE(pname_str), "NAME=%s", reset_info->pname);
> +       snprintf(flags_str, ARRAY_SIZE(flags_str), "FLAGS=%u", reset_info->flags);
> +       kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_sysfs_reset_event);
> +
>  /**
>   * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any connector
>   * change
> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> index 6273cac44e47..5ba11c760619 100644
> --- a/include/drm/drm_sysfs.h
> +++ b/include/drm/drm_sysfs.h
> @@ -1,16 +1,26 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _DRM_SYSFS_H_
>  #define _DRM_SYSFS_H_
> +#include <linux/sched.h>
> +
> +#define DRM_GPU_RESET_FLAG_VRAM_INVALID (1 << 0)
>
>  struct drm_device;
>  struct device;
>  struct drm_connector;
>  struct drm_property;
>
> +struct drm_reset_event {
> +       uint32_t pid;

One side note, unrelated to devcoredump vs this..

AFAIU you probably want to be passing around a `struct pid *`, and
then somehow use pid_vnr() in the context of the process reading the
event to get the numeric pid.  Otherwise things will not do what you
expect if the process triggering the crash is in a different pid
namespace from the compositor.

BR,
-R

> +       uint32_t flags;
> +       char pname[TASK_COMM_LEN];
> +};
> +
>  int drm_class_device_register(struct device *dev);
>  void drm_class_device_unregister(struct device *dev);
>
>  void drm_sysfs_hotplug_event(struct drm_device *dev);
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info);
>  void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
>  void drm_sysfs_connector_status_event(struct drm_connector *connector,
>                                       struct drm_property *property);
> --
> 2.32.0
>
