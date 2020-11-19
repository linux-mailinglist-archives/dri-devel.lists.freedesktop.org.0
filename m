Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5382B95B2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115289A4E;
	Thu, 19 Nov 2020 15:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D51789A4A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:06:49 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id f11so6640909oij.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9u6tUuDMF3Wz3GFvQOAGs/51qxixlGowiI2P22K+pLY=;
 b=eXMutpB4SFSHdmRanytND5ywyrS0iFE/uneX/PvdrAmr2w7EKVYLkI4JNRYAhsop8x
 OWSd2x038x8DtBu8v8DFa1lg6D+50OnWdkZe8tLBYS59tsNqF3fQK1s0nGbYn9m3coQO
 4mhFaWS/c+oUUFR6i5Bl8FotGlVeg8JcynPwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9u6tUuDMF3Wz3GFvQOAGs/51qxixlGowiI2P22K+pLY=;
 b=BnWzT5+Dk04rlZxX+Z2qQqXCj57+hr2oSs7cjYvVMUz8yFXKcKL4cJ7Wslv9W4xIoG
 e5luVrqPDIu9xPgehu5voqvDB7bg2AfMlErkTND7eZwFhkt/Va3FpExsr7MuCPELZEch
 KExutNGxH7E4JmPrcH2FDxYcSO58dqBf4UwIkJODdCQ9CopHL5PjjkI1Z+xCCLljZ/ox
 lHRWOy7Hf3rsX2LL8umkMeXeALGAadhon0HhQ1gEm+Jt5NKB0ks65JhdUkJN5wRD/C00
 fpprFD2bJBrq5LdD01v/5JvLWjNXZxxnrbbT1gcAAbrKeYjqwlrlInHYjonHivJM0Rzd
 sNBw==
X-Gm-Message-State: AOAM530+nxyghHbIM3vSuHWCpkwDlmnbOb9iZLOUhJcsEwSq/OLWaHzn
 2RJ5tVfnGE1e9wZkfY8Qsow30BdnhN6sO4eonVPLC3S0HKg=
X-Google-Smtp-Source: ABdhPJydS0YUjXNYKQfP8QsUrJ9v3gWHdDSV8Eb6dH2UtT59oXs0Kfqf0HYbTJwyX5YsCSx4DP+yDo/5d+8ZgxzjxDg=
X-Received: by 2002:aca:7506:: with SMTP id q6mr3180789oic.128.1605798408261; 
 Thu, 19 Nov 2020 07:06:48 -0800 (PST)
MIME-Version: 1.0
References: <PwfAVfVzxSH9UbOc2njhv2b7Kislwt2Xq4HBGrGBSc@cp4-web-040.plabs.ch>
In-Reply-To: <PwfAVfVzxSH9UbOc2njhv2b7Kislwt2Xq4HBGrGBSc@cp4-web-040.plabs.ch>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Nov 2020 16:06:37 +0100
Message-ID: <CAKMK7uHskOYggQBCuUeTY0neDCa2QvyrwUW2vsnqg_-=BtF8rw@mail.gmail.com>
Subject: Re: [PATCH v2] drm: document drm_mode_get_connector
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

On Thu, Nov 19, 2020 at 2:52 PM Simon Ser <contact@emersion.fr> wrote:
>
> Document how to perform a GETCONNECTOR ioctl. Document the various
> struct fields. Also document how to perform a forced probe, and when
> should user-space do it.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm_mode.h | 76 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 71 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ad10ab2a577..cd97c5671c75 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -368,27 +368,93 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_WRITEBACK   18
>  #define DRM_MODE_CONNECTOR_SPI         19
>
> +/**
> + * struct drm_mode_get_connector - Get connector metadata.
> + *
> + * User-space can perform a GETCONNECTOR ioctl to retrieve information about a
> + * connector. User-space is expected to retrieve encoders, modes and properties
> + * by performing this ioctl at least twice: the first time to retrieve the
> + * number of elements, the second time to retrieve the elements themselves.
> + *
> + * To retrieve the number of elements, set @count_props and @count_encoders to
> + * zero, set @count_modes to 1, and set @modes_ptr to a temporary struct
> + * drm_mode_modeinfo element.
> + *
> + * To retrieve the elements, allocate arrays for @encoders_ptr, @modes_ptr,
> + * @props_ptr and @prop_values_ptr, then set @count_modes, @count_props and
> + * @count_encoders to their capacity.
> + *
> + * Performing the ioctl only twice may be racy: the number of elements may have
> + * changed with a hotplug event in-between the two ioctls. User-space is
> + * expected to retry the last ioctl until the number of elements stabilizes.
> + * The kernel won't fill any array which doesn't have the expected length.
> + *
> + * **Force-probing a connector**
> + *
> + * If the @count_modes field is set to zero, the kernel will perform a forced
> + * probe on the connector to refresh the connector status, modes and EDID.
> + * A forced-probe can be slow and the ioctl will block.
> + *
> + * User-space shouldn't need to force-probe connectors in general: the kernel
> + * will automatically take care of probing connectors that don't support
> + * hot-plug detection when appropriate. However, user-space may force-probe
> + * connectors on user request (e.g. clicking a "Scan connectors" button, or
> + * opening a UI to manage screens).

I think we should warn here that force probe can disrupt the UI, hence
why it should only be done on user request and not automatically.

> + */
>  struct drm_mode_get_connector {
> -
> +       /** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
>         __u64 encoders_ptr;
> +       /** @modes_ptr: Pointer to struct drm_mode_modeinfo array. */
>         __u64 modes_ptr;
> +       /** @props_ptr: Pointer to ``__u32`` array of property IDs. */
>         __u64 props_ptr;
> +       /** @prop_values_ptr: Pointer to ``__u64`` array of property values. */
>         __u64 prop_values_ptr;
>
> +       /** @count_modes: Number of modes. */
>         __u32 count_modes;
> +       /** @count_props: Number of properties. */
>         __u32 count_props;
> +       /** @count_encoders: Number of encoders. */
>         __u32 count_encoders;
>
> -       __u32 encoder_id; /**< Current Encoder */
> -       __u32 connector_id; /**< Id */
> +       /** @encoder_id: Object ID of the current encoder. */
> +       __u32 encoder_id;
> +       /** @connector_id: Object ID of the connector. */
> +       __u32 connector_id;
> +       /**
> +        * @connector_type: Type of the connector.
> +        *
> +        * See DRM_MODE_CONNECTOR_* defines.
> +        */
>         __u32 connector_type;
> +       /**
> +        * @connector_type_id: Type-specific connector number.
> +        *
> +        * This is not an object ID. This is a per-type connector number. Each
> +        * (type, type_id) combination is unique across all connectors of a DRM
> +        * device.
> +        */
>         __u32 connector_type_id;
>
> +       /**
> +        * @connection: Status of the connector.
> +        *
> +        * See enum drm_connector_status.

Please add & so it becomes a link in the generated docs (and pls check
the link goes to the right place).

> +        */
>         __u32 connection;
> -       __u32 mm_width;  /**< width in millimeters */
> -       __u32 mm_height; /**< height in millimeters */
> +       /** @mm_width: Width of the connected sink in millimeters. */
> +       __u32 mm_width;
> +       /** @mm_height: Height of the connected sink in millimeters. */
> +       __u32 mm_height;
> +       /**
> +        * @subpixel: Subpixel order of the connected sink.
> +        *
> +        * See enum subpixel_order.

Same here.

> +        */
>         __u32 subpixel;
>
> +       /** @pad: Padding. */

I think this should have a "Must be zero"?

With the nits addressed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks a lot for doing this!
>         __u32 pad;
>  };
>
> --
> 2.29.2
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
