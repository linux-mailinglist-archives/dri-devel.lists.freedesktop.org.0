Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006F1E69AF
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 20:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A506E1D8;
	Thu, 28 May 2020 18:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509CC6E1D8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 18:45:37 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a25so23083846ljp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZrQJyA97zQ7Iv4LOwSx5n5zLQ+dDhZxs+DnvTuci2D0=;
 b=qBYOQWNa8/ebUtTB5T/vCk71RZmprd/CYCD9L3rY0UmGq0V0FsBWUFVLiIlkdWOH/f
 xhw+1DnviPMi0TipeovDQ3zLerHHLCpI/O7RZzn53Jrr9DmMm7U4urN5g4AF6v1alpDW
 Bs6bHD8RjZMVcOQsta0jyBZcvLrGQCifk2qOS2Z5BeQNnCmPhtghZsURa2p6SQ8jtB+G
 AAiSzDyhYUSal1KmavVSd8CQcJ/5e23oQ/boio+pqnZQ/srUCAUXThkT6LBYUbUDAl7p
 /3l6ULVLyAn8pRn718FL1dibMtobDsRolLpnwGXAJ7DXRL9ftlpjQacUr54oAUw09QoQ
 cSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZrQJyA97zQ7Iv4LOwSx5n5zLQ+dDhZxs+DnvTuci2D0=;
 b=DDC5gu9WEpSnVONGpiVm3Rwl0TlpdPqsuO+i6Z8QqaMuotI0ttOec4HBJwqQayaW/W
 c4VHlRcT736uCuSTTT2O3U10MIrpYce5QNfu+ZWgwyAKvvkyqCUXllBGAllvT5QbOd4a
 uX0ZYjgE1cvsEUiTwz/uusEiwaghIgTvuWpSAfwBxRl6y2bnc6OHmGNcTfm7wkoS9sba
 raNQbB2brDw7ocsZSfCe3/ULdFKrpm+ue7PskYrgjEZ0NQMfnruaSkvVlC79sGLNk++1
 SgyzCHENADAi/QFlfXTDrCqQL5vWGm7r+8obOJ2Ivq3Mc6aEs/gzUys4F42lJCC8Qf+E
 tAFg==
X-Gm-Message-State: AOAM530ac8pN04sX0+Zw5G5p2/BHthppSKkBPj4/jqgG+tpOuJdUdlFX
 aWKLLlI7h4B5nUTZTY9mmxVAbRMwXvOywGQxQD706w==
X-Google-Smtp-Source: ABdhPJy5XezSMgCO1fnlXOpPQ6HX6y5uzdVdiv+K+/J5HfTX9F893RLdluPIrqeN7ju1IzU6eHUA8Mtm0BmxE/AHDwQ=
X-Received: by 2002:a2e:9087:: with SMTP id l7mr2258778ljg.430.1590691535411; 
 Thu, 28 May 2020 11:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200528170604.22476-1-rohan.garg@collabora.com>
In-Reply-To: <20200528170604.22476-1-rohan.garg@collabora.com>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 28 May 2020 11:45:24 -0700
Message-ID: <CADaigPUZ3j35iBKtOyR=3WWKuu+V_PcPEgrk7-FzZWb6QSabbQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/ioctl: Add a ioctl to set and get a label on GEM
 objects
To: Rohan Garg <rohan.garg@collabora.com>
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
Cc: kernel@collabora.com, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 28, 2020 at 10:06 AM Rohan Garg <rohan.garg@collabora.com> wrote:
>
> DRM_IOCTL_HANDLE_SET_LABEL lets you label buffers associated
> with a handle, making it easier to debug issues in userspace
> applications.
>
> DRM_IOCTL_HANDLE_GET_LABEL lets you read the label associated
> with a buffer.
>
> Changes in v2:
>   - Hoist the IOCTL up into the drm_driver framework
>
> Changes in v3:
>   - Introduce a drm_gem_set_label for drivers to use internally
>     in order to label a GEM object
>   - Hoist string copying up into the IOCTL
>   - Fix documentation
>   - Move actual gem labeling into drm_gem_adopt_label
>
> Changes in v4:
>   - Refactor IOCTL call to only perform string duplication and move
>     all gem lookup logic into GEM specific call
>
> Changes in v5:
>   - Fix issues pointed out by kbuild test robot
>   - Cleanup minor issues around kfree and out/err labels
>   - Fixed API documentation issues
>   - Rename to DRM_IOCTL_HANDLE_SET_LABEL
>   - Introduce a DRM_IOCTL_HANDLE_GET_LABEL to read labels
>   - Added some documentation for consumers of this IOCTL
>   - Ensure that label's cannot be longer than PAGE_SIZE
>   - Set a default label value
>   - Drop useless warning
>   - Properly return length of label to userspace even if
>     userspace did not allocate memory for label.
>
> Changes in v6:
>   - Wrap code to make better use of 80 char limit
>   - Drop redundant copies of the label
>   - Protect concurrent access to labels
>   - Improved documentation
>   - Refactor setter/getter ioctl's to be static
>   - Return EINVAL when label length > PAGE_SIZE
>   - Simplify code by calling the default GEM label'ing
>     function for all drivers using GEM
>   - Do not error out when fetching empty labels
>   - Refactor flags to the u32 type and add documentation
>   - Refactor ioctls to use correct DRM_IOCTL{R,W,WR} macros
>   - Return length of copied label to userspace
>
> Signed-off-by: Rohan Garg <rohan.garg@collabora.com>

I don't think we should land this until it actually does something
with the label, that feels out of the spirit of our uapi merge rules.
I would suggest looking at dma_buf_set_name(), which would produce
useful output in debugfs's /dma_buf/buf_info.  But also presumably you
have something in panfrost using this?

> +int drm_gem_get_label(struct drm_device *dev, struct drm_file *file_priv,
> +                     struct drm_handle_label *args)
> +{
> +       struct drm_gem_object *gem_obj;
> +       int len, ret;
> +
> +       gem_obj = drm_gem_object_lookup(file_priv, args->handle);
> +       if (!gem_obj) {
> +               DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
> +               return -ENOENT;
> +       }
> +
> +       if (!gem_obj->label) {
> +               args->label = NULL;
> +               args->len = 0;
> +               return 0;
> +       }
> +
> +       mutex_lock(&gem_obj->bo_lock);
> +       len = strlen(gem_obj->label);
> +       ret = copy_to_user(u64_to_user_ptr(args->label), gem_obj->label,
> +                          min(args->len, len));
> +       mutex_unlock(&gem_obj->bo_lock);
> +       args->len = len;
> +       drm_gem_object_put(gem_obj);
> +       return ret;
> +}

I think the !gem_obj->label code path also needs to be under the lock,
otherwise you could be racing to copy_to_user from a NULL pointer,
right?

>  #define DRM_CORE_IOCTL_COUNT   ARRAY_SIZE( drm_ioctls )
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index bb924cddc09c..6fcb7b9ff322 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -540,6 +540,36 @@ struct drm_driver {
>                             struct drm_device *dev,
>                             uint32_t handle);
>
> +       /**
> +        * @set_label:
> +        *
> +        * Label a buffer object
> +        *
> +        * Called by the user via ioctl.
> +        *
> +        * Returns:
> +        *
> +        * Length of label on success, negative errno on failure.
> +        */
> +       int (*set_label)(struct drm_device *dev,
> +                        struct drm_file *file_priv,
> +                        struct drm_handle_label *args);
> +
> +       /**
> +        * @get_label:
> +        *
> +        * Read the label of a buffer object.
> +        *
> +        * Called by the user via ioctl.
> +        *
> +        * Returns:
> +        *
> +        * Length of label on success, negative errno on failiure.
> +        */
> +       char *(*get_label)(struct drm_device *dev,
> +                          struct drm_file *file_priv,
> +                          struct drm_handle_label *args);
> +

I think the documentation should note that these are optional.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
