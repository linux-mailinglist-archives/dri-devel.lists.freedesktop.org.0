Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2A2B8007
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 16:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BE96E435;
	Wed, 18 Nov 2020 15:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E644B6E435
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 15:03:39 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g19so1973562otp.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sc64GKkwK1kAp1Oi/9a4/pUN7nrtBEAUO0yfxsrN/zc=;
 b=WWcwAhIO91+kUoo9atUW5GTun6zwRXyyrTWsKFfIOFdDf6jfdjk+qj2eEWIWsQ5j2e
 4yaVdEk3rIXPr9LgrMBWF72EXY8CVK23hHKTB3A25L1/gpEq3egSCi9gPi4h1oMEYwLo
 US09M6+pLcYnJyiL/A3k49PYcJ+1SxNfocXDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sc64GKkwK1kAp1Oi/9a4/pUN7nrtBEAUO0yfxsrN/zc=;
 b=jYhOFZ5fdeSXMSAx5uEZ2/53QOto8FPZt6+iyw5JV8urfwq9fdd5r8MZd08B/UoGX/
 WuLDectJdvGTaZE8dNXK+51LcWOv6Fq8eVduyapDsgvDWeTZHwHnDE0xY32b3TAwVhdD
 /MhiyR8xBhvrj+Y6k4PtSMV7oZhjtj9KfPvKqeUwmaoW97NlnG6vB/zeg68buh86kIJo
 /ZzUIuSoghDwbMVQUENN76VotUm+fCJNWKtYJwbagBXNoYeQoSkRWUGGlMiwCyAlk1fN
 U3Fxdd9jMLDKsdPevNkd/QWQ1rhfbMKnFecQ1V4v0JPlEd76BzAAyvCvzQxABKX6BHos
 +PnA==
X-Gm-Message-State: AOAM530K2P7jamvlTy5oujwvUDBqB9wPIShb3uyXHPGI0gPpr5ewiadh
 FVlwr6T2E4n3DnKQXxYFRTPLgUp/cWO9eLldrVNc1B60IgESYA==
X-Google-Smtp-Source: ABdhPJxAqJypbOQOKYQWR05G3Ecuh7DcJhb56EC2mfkbgKgsXruqMw2KMn4iWVknbX7BoDsXVdyddrf0tC90zUxKaFs=
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr7078110ots.281.1605711819133; 
 Wed, 18 Nov 2020 07:03:39 -0800 (PST)
MIME-Version: 1.0
References: <zvaqgUJLuDcSaX7hbo6wcjWOCFUkiwPThMV1D8tq7dc@cp3-web-020.plabs.ch>
In-Reply-To: <zvaqgUJLuDcSaX7hbo6wcjWOCFUkiwPThMV1D8tq7dc@cp3-web-020.plabs.ch>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Nov 2020 16:03:27 +0100
Message-ID: <CAKMK7uHLR2Rd9xOMEqURZJBvyVqO1HCe6eXzh8qKnG+9WX0FYA@mail.gmail.com>
Subject: Re: [PATCH] drm: document drm_mode_get_connector
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

On Wed, Nov 18, 2020 at 11:52 AM Simon Ser <contact@emersion.fr> wrote:
>
> Document how to perform a forced probe, and when should user-space do it.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm_mode.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ad10ab2a577..09647b799f39 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -368,6 +368,19 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_WRITEBACK   18
>  #define DRM_MODE_CONNECTOR_SPI         19
>
> +/**
> + * struct drm_mode_get_connector - get connector metadata
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
> + */

I think this causes warnings, because now we have kerneldoc for this,
but not for all the members. Also the member-specific stuff should be
documented as inline comment, see

https://dri.freedesktop.org/docs/drm/doc-guide/kernel-doc.html#in-line-member-documentation-comments

I also noticed that this file has a ton of wrong kerneldoc comments,
but they seem to not cause warnings (anything starting with /** is
fishy).

Can I volunteer you for a bit more here?

Thanks, Daniel

>  struct drm_mode_get_connector {
>
>         __u64 encoders_ptr;
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
