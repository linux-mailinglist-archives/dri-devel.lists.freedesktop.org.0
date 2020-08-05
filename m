Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C523C947
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E42A896A5;
	Wed,  5 Aug 2020 09:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A61896A5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:36:54 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 93so22674489otx.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QAf2r22ie0nJ9P9yn7tCrZWYCPDCIRxVkswdnQpyC0=;
 b=R9PgmfP4r/afAuE6yEI5xwzwZqrkDG1FMSlt+zUdxWUaS4wWM+lhaaJ3udKFGIHV/W
 Sxr3aqMHHy30L/DQSNLDdmhLhwdZ6M+XCwLD+M0bLPKXBlfV9xBmPsPg27gzv1ujq3a2
 YgKJtw3aPeIIZqvGF1oQZ/LAv6nhBrxZ1HTv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QAf2r22ie0nJ9P9yn7tCrZWYCPDCIRxVkswdnQpyC0=;
 b=aderVqb7jDtUhPxZguQdlX9q0bApY5AN2lp9IpDnynC7Drnlp8f9E/62VL/MzCHWr7
 YyBhYX0FNgUyhxMNCvVm4dfVA5JKqHr8LIkfUsVpOLr33tq/1qHJeB6ajvKuAalt8scw
 mJLtfXPJOP62toJAWmLZBnIIbrbUTKqo1CiUqhf9Fjqjk75AH+JzKMEuJr1XvmmOWoZk
 tvjTA96dH8kCTDdLIkChitW4QUZccd+1F6fyMNs5N6qlYzGaSF/oNaEN/5rfdUKTCUQu
 VUoNVyLQY8Ju8s7JiePwOXpw3wKkjbuES/dfU3UpNwylyFS2dQI3NyDCJwaHuOYsbuHG
 LWSw==
X-Gm-Message-State: AOAM530zt6kelowCgJGy2UbLWu+dF2+fBL4iAGcWkNtzxmtxnb0jzkN+
 mLmCHOyteHhFOoFi5shWo5gqlmcL6ZXPFlbpEDshUQ==
X-Google-Smtp-Source: ABdhPJxbvKXGNnuWD4z2BMkiilvW3CUx+kj1KpLvwjAj9AlKw4Z10kOAXFUtCEfBE2pJ5diZAjtOip4Pqm/YdXEBojM=
X-Received: by 2002:a9d:7283:: with SMTP id t3mr1760637otj.303.1596620213781; 
 Wed, 05 Aug 2020 02:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200805083646.4123-1-hjc@rock-chips.com>
In-Reply-To: <20200805083646.4123-1-hjc@rock-chips.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 5 Aug 2020 11:36:42 +0200
Message-ID: <CAKMK7uGmKJqZJ0ONQjjquZn6mksKbkScmcUSEA43eg1jFskmTg@mail.gmail.com>
Subject: Re: [PATCH] drm: sysfs: Add to get current mode
To: Sandy Huang <hjc@rock-chips.com>
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
Cc: Tao Huang <huangtao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Kever Yang <kever.yang@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 10:37 AM Sandy Huang <hjc@rock-chips.com> wrote:
>
> add this node to get the current true mode.
>
> Signed-off-by: Sandy Huang <hjc@rock-chips.com>

Uh what's this for? Since it's sysfs, I guess there's something
parsing this, which means we'd kinda need to have that piece too.

If it's just for debugging purposes, then we already have this
information in debugfs, together with everything else that's in the
atomic modeset state.
-Daniel

> ---
>  drivers/gpu/drm/drm_sysfs.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 939f0032aab1..f39bcd34853b 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
>
>  #include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_modes.h>
> @@ -236,16 +237,45 @@ static ssize_t modes_show(struct device *device,
>         return written;
>  }
>
> +static ssize_t current_mode_show(struct device *device,
> +                     struct device_attribute *attr,
> +                     char *buf)
> +{
> +       struct drm_connector *connector = to_drm_connector(device);
> +       struct drm_display_mode *mode;
> +       struct drm_crtc_state *crtc_state;
> +       bool interlaced;
> +       int written = 0;
> +
> +       if (!connector->state || !connector->state->crtc)
> +               return written;
> +
> +       crtc_state = connector->state->crtc->state;
> +       if (!crtc_state)
> +               return written;
> +
> +       mode = &crtc_state->mode;
> +
> +       interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
> +       written += snprintf(buf + written, PAGE_SIZE - written, "%dx%d%s%d\n",
> +                           mode->hdisplay, mode->vdisplay,
> +                           interlaced ? "i" : "p", drm_mode_vrefresh(mode));
> +
> +       return written;
> +}
> +
>  static DEVICE_ATTR_RW(status);
>  static DEVICE_ATTR_RO(enabled);
>  static DEVICE_ATTR_RO(dpms);
>  static DEVICE_ATTR_RO(modes);
> +static DEVICE_ATTR_RO(current_mode);
>
>  static struct attribute *connector_dev_attrs[] = {
>         &dev_attr_status.attr,
>         &dev_attr_enabled.attr,
>         &dev_attr_dpms.attr,
>         &dev_attr_modes.attr,
> +       &dev_attr_current_mode.attr,
>         NULL
>  };
>
> --
> 2.17.1
>
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
