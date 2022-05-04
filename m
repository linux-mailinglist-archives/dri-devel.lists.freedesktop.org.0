Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E4E519637
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 06:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E0310FD64;
	Wed,  4 May 2022 04:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E44510FD4B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 04:02:55 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7bb893309so3014607b3.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 21:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W3/oD3hhUgmP5e/isgUbw7+g1PPBvghdLqlobIHop/4=;
 b=VLwwz523wVa5T9+YMAiWIa2hQHB+9nrcrvf6MxAWFdvLCo0x1OnGKzj1cFBLowgXMa
 F45SzWgIU3s+cSzh6BKHqDYlqYUoOTlP/DSwTzBpXDEpugMjFGpv5L5yL1nWB2xwnQJD
 EeuRYbdH8HBV17g62T1SShvp34T9BuYwrJThnLnDnLJhdGSa0nZK8W8UurXcxl8Ll3aI
 CuFmoN3Ew3mEJT3PjNLT1g9uvz9IyHrcrnUAfAPHzOOpxOGBnh1C8FOhSOJQF400AJeW
 WMnxtjNXFOq3SFw9wIAD4v+TZIaajPa6RX6TP2zKpwNrgXwk+AxEfopbLgEXRwClGZVE
 vz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W3/oD3hhUgmP5e/isgUbw7+g1PPBvghdLqlobIHop/4=;
 b=FlKiYxAx/vXxBtXuCSxI9HlJ2SBfcTrX5Sn5TG/XQuOuWPcNU4vVUZYTj1Y3+3jTBQ
 0SyINllJpr07aIVy4l0XGVZvKnI9LseZMBc4tQL1YprddZc3HcU48IsLFCMxd229XkpN
 /D4Qt3jESJ+qwVoyOEoXeddm8ws8me55pkvAcseaAoU99dSM6OLH/Cyi2STAvdR/SprZ
 xBSPd5s4hUJ0D44BAA/1wG2obmgtAcwKxE1lRCt7n+V55dE+w0sKNY/JL5whjnHG6UIl
 HhgBJc/Pav86AqmIjgP5Tyg/yFPBNJk0BkfyqzYNuyjAk7W8NiFUYEIdGbcs1gt/DroH
 Z00A==
X-Gm-Message-State: AOAM5306nexgywRlkHhPGQqM4cPRaSAuCDN28F+1kk+tQPY5TElKTLKZ
 NB4ELMPLiWGHYXURosbGbJ/X4K8Ybcv9fW6SZ9U=
X-Google-Smtp-Source: ABdhPJwwVfviWqFjK/Glcs4mY8hURf2iUgeAvKOXOZreMUDCs5xJ8WBeFHrhRnAuZFlZ+hOGuZ9iZ95Q7xe95PrG0k4=
X-Received: by 2002:a05:690c:9e:b0:2e9:b625:1be2 with SMTP id
 be30-20020a05690c009e00b002e9b6251be2mr18279825ywb.48.1651636974377; Tue, 03
 May 2022 21:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
 <1651509391-2058-5-git-send-email-mikelley@microsoft.com>
In-Reply-To: <1651509391-2058-5-git-send-email-mikelley@microsoft.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Tue, 3 May 2022 21:02:44 -0700
Message-ID: <CAHFnvW3TDTh_iRpF5zH4uPKnB+_AisniVgam=Fj_Gog6KOfKrQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/hyperv: Remove support for Hyper-V 2008 and
 2008R2/Win7
To: Michael Kelley <mikelley@microsoft.com>
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, deller@gmx.de,
 Vitaly Kuznetsov <vkuznets@redhat.com>, K Y Srinivasan <kys@microsoft.com>,
 jejb@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 2, 2022 at 9:37 AM Michael Kelley <mikelley@microsoft.com> wrote:
>
> The DRM Hyper-V driver has special case code for running on the first
> released versions of Hyper-V: 2008 and 2008 R2/Windows 7.  These versions
> are now out of support (except for extended security updates) and lack
> support for performance features that are needed for effective production
> usage of Linux guests.
>
> The negotiation of the VMbus protocol versions required by these old
> Hyper-V versions has been removed from the VMbus driver.  So now remove
> the handling of these VMbus protocol versions from the DRM Hyper-V
> driver.
>
> Signed-off-by: Michael Kelley <mikelley@microsoft.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> index c0155c6..76a182a 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> @@ -18,16 +18,16 @@
>  #define SYNTHVID_VERSION(major, minor) ((minor) << 16 | (major))
>  #define SYNTHVID_VER_GET_MAJOR(ver) (ver & 0x0000ffff)
>  #define SYNTHVID_VER_GET_MINOR(ver) ((ver & 0xffff0000) >> 16)
> +
> +/* Support for VERSION_WIN7 is removed. #define is retained for reference. */
>  #define SYNTHVID_VERSION_WIN7 SYNTHVID_VERSION(3, 0)
>  #define SYNTHVID_VERSION_WIN8 SYNTHVID_VERSION(3, 2)
>  #define SYNTHVID_VERSION_WIN10 SYNTHVID_VERSION(3, 5)
>
> -#define SYNTHVID_DEPTH_WIN7 16
>  #define SYNTHVID_DEPTH_WIN8 32
> -#define SYNTHVID_FB_SIZE_WIN7 (4 * 1024 * 1024)
> +#define SYNTHVID_WIDTH_WIN8 1600
> +#define SYNTHVID_HEIGHT_WIN8 1200
>  #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
> -#define SYNTHVID_WIDTH_MAX_WIN7 1600
> -#define SYNTHVID_HEIGHT_MAX_WIN7 1200
>
>  enum pipe_msg_type {
>         PIPE_MSG_INVALID,
> @@ -496,12 +496,6 @@ int hyperv_connect_vsp(struct hv_device *hdev)
>         case VERSION_WIN8:
>         case VERSION_WIN8_1:
>                 ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN8);
> -               if (!ret)
> -                       break;
> -               fallthrough;
> -       case VERSION_WS2008:
> -       case VERSION_WIN7:
> -               ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN7);
>                 break;
>         default:
>                 ret = hyperv_negotiate_version(hdev, SYNTHVID_VERSION_WIN10);
> @@ -513,18 +507,15 @@ int hyperv_connect_vsp(struct hv_device *hdev)
>                 goto error;
>         }
>
> -       if (hv->synthvid_version == SYNTHVID_VERSION_WIN7)
> -               hv->screen_depth = SYNTHVID_DEPTH_WIN7;
> -       else
> -               hv->screen_depth = SYNTHVID_DEPTH_WIN8;
> +       hv->screen_depth = SYNTHVID_DEPTH_WIN8;
>
>         if (hyperv_version_ge(hv->synthvid_version, SYNTHVID_VERSION_WIN10)) {
>                 ret = hyperv_get_supported_resolution(hdev);
>                 if (ret)
>                         drm_err(dev, "Failed to get supported resolution from host, use default\n");
>         } else {
> -               hv->screen_width_max = SYNTHVID_WIDTH_MAX_WIN7;
> -               hv->screen_height_max = SYNTHVID_HEIGHT_MAX_WIN7;
> +               hv->screen_width_max = SYNTHVID_WIDTH_WIN8;
> +               hv->screen_height_max = SYNTHVID_HEIGHT_WIN8;
>         }
>
>         hv->mmio_megabytes = hdev->channel->offermsg.offer.mmio_megabytes;

Do we need a new version for Windows 11? If the synthetic device
version is decoupled from Windows version, then I guess we can rename
the macro to reflect that.

Reviewed-by: Deepak Rawat <drawat.floss@gmail.com>

> --
> 1.8.3.1
>
