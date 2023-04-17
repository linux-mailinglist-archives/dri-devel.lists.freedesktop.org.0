Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34776E54CC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 00:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A6F10E0E6;
	Mon, 17 Apr 2023 22:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727F910E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 22:52:18 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-517baf1bc87so1919841a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681771937; x=1684363937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9zo+QcbgswHVNKq1x8Eye8R2F5dWqFdny9W9Iv3jq8Q=;
 b=xfe80fkH53J5CUQ7FjYITdmYzmnPobKB5CbnFVwIER32p+5u+phsbqFtt6ERbaC6i7
 0TjYjI0EsDC4Pciz56LE2TzEHd20JgQF1Xi3NtPYRrVsO8pjJ6qIqc83SZdEx6Zy/06Z
 bqxzHi+97brr1D8M7hwjJOIyzVeCLZPX19g8iUdTMcrsiifQbdg71iyJWGAAxxojtXWs
 70gOiSGpT1S5JQlQqfXkvMpH6bS8HDyLNdw4GUz/5HNxHmlszC81F9GgvySqSR0j2h33
 aYUrnIqH9Bgae58iZl4NFBa0eWQKe6Aogmlt95RSm+mOxyQluwMk5WunSGqI51E+PFTw
 YDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681771937; x=1684363937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zo+QcbgswHVNKq1x8Eye8R2F5dWqFdny9W9Iv3jq8Q=;
 b=FsL3232Y5f+P+dRXJSxaIZjtZmjHvrZt6T06S+AUQ5tGbdVOJ4i9F1W4QeGuadU0zF
 K03mYeJOB3WCO/Ws7p7DesGy46mWRubIKMhsAxkIZ2d21Id2mMhucU+/qaUiIJ2ehygS
 v1NTH5zfKU+YYJIS2FV2kmu4g3ge0jh4HRgZnSuxm0e0VVC0ucS/G/QTQX1XUvCrsKCH
 cmNUcz3x0vf/f6HKzAMP05SFBKGJ/zF+pzUh7YOhZyPl6npAlMRQETfgY20Xw7LAaFHa
 joHBDnBTeNrekzh68gshsHzgUP2+YfOsRu51mCGQkbXSt12Xgu4kF3RGKy90DG6SU0dI
 JMZA==
X-Gm-Message-State: AAQBX9el51qHYWTrF42pXrI+Z6mA1Z0fDVhUwl55DKLD88lqvPcxAfxN
 Sd+lFC31KgIdlteab4uUtUOIffgsxJkSshtn71c4PQ==
X-Google-Smtp-Source: AKy350ZuiYuzhfhEJzAQR9g56AE63lpfBVdvcKCBUP9rE5siupUQJBnvU+9LxQ7dxFv7TslQUKfbJK/JFxB3Kr3MaPE=
X-Received: by 2002:a63:e310:0:b0:503:25f0:9cc5 with SMTP id
 f16-20020a63e310000000b0050325f09cc5mr45727pgh.2.1681771937242; Mon, 17 Apr
 2023 15:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230329014455.1990104-1-wonchung@google.com>
In-Reply-To: <20230329014455.1990104-1-wonchung@google.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Mon, 17 Apr 2023 15:52:06 -0700
Message-ID: <CAMNLLoRpWBONxqVG=5ksddZeD-O3LcuTtwDj6CpcvpWsCMcs8w@mail.gmail.com>
Subject: Re: [PATCH] drm/sysfs: Expose DRM connector id in each connector sysfs
To: Won Chung <wonchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 gildekel@chromium.org, linux-kernel@vger.kernel.org, pmalani@chromium.org,
 tzimmermann@suse.de, seanpaul@chromium.org, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 6:45=E2=80=AFPM Won Chung <wonchung@google.com> wro=
te:
>
> Expose DRM connector id in device sysfs so that we can map the connector
> id to the connector syspath. Currently, even if we can derive the
> connector id from modeset, we do not have a way to find the
> corresponding connector's syspath.
>
> This is helpful when determining the root connector of MST tree. When a
> tree of multiple MST hub is connected to the system, modeset describes
> the tree in the PATH blob. For example, consider the following scenario.
>
> +-------------+
> | Source      |    +-------------+
> | (Device)    |    | BranchX     |
> |             |    | (MST)       |
> |       [conn6]--->|       [port1]--->DisplayA
> +-------------+    |             |
>                    |             |    +-------------+
>                    |             |    | BranchY     |
>                    |             |    | (MST)       |
>                    |       [port2]--->|       [port1]----->DisplayB
>                    +-------------+    |             |
>                                       |       [port2]----->DisplayC
>                                       +-------------+
>
> DPMST connector of DisplayA would have "mst:6-1" PATH.
> DPMST connector of DisplayB would have "mst:6-2-1" PATH.
> DPMST connector of DisplayC would have "mst:6-2-2" PATH.
>
> Given that connector id of 6 is the root of the MST connector tree, we
> can utilize this patch to parse through DRM connectors sysfs and find
> which connector syspath corresponds to the root connector (id =3D=3D 6).
>
> ChromeOS intend to use this information for metrics collection. For
> example, we want to tell which port is deriving which displays even with
> a MST hub. Chromium patch for parsing DRM connector id from the kernel
> is at http://crrev.com/c/4317207.
>
> Signed-off-by: Won Chung <wonchung@google.com>

Exposing connector id in device sysfs looks good to me.

Reviewed-by: Manasi Navare <navaremanasi@chromium.org>

Manasi

> ---
>  drivers/gpu/drm/drm_sysfs.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 183130355997..11f98c5d6103 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -282,16 +282,27 @@ static ssize_t modes_show(struct device *device,
>         return written;
>  }
>
> +static ssize_t connector_id_show(struct device *device,
> +                                struct device_attribute *attr,
> +                                char *buf)
> +{
> +       struct drm_connector *connector =3D to_drm_connector(device);
> +
> +       return sysfs_emit(buf, "%d\n", connector->base.id);
> +}
> +
>  static DEVICE_ATTR_RW(status);
>  static DEVICE_ATTR_RO(enabled);
>  static DEVICE_ATTR_RO(dpms);
>  static DEVICE_ATTR_RO(modes);
> +static DEVICE_ATTR_RO(connector_id);
>
>  static struct attribute *connector_dev_attrs[] =3D {
>         &dev_attr_status.attr,
>         &dev_attr_enabled.attr,
>         &dev_attr_dpms.attr,
>         &dev_attr_modes.attr,
> +       &dev_attr_connector_id.attr,
>         NULL
>  };
>
> --
> 2.40.0.348.gf938b09366-goog
>
