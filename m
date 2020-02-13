Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB115CAB3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 19:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADB96F621;
	Thu, 13 Feb 2020 18:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BBE6F621
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 18:49:14 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i11so7614582ioi.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvYxGQ/78KpLHiNvr29qS74xd6utm8BhrIQ0l8klMB4=;
 b=i3TtSC6ABm3Y4vfYGZ0y0nb9UxLAFWqEAwVIf4vBqB7+LgKryGshw1gm3+8mRidv8w
 NtoDXNic+vRttJ/qN112cwH2uw9rfb+/maidH97a+9aBd1bMolB8JCom38BZdr7YAUfL
 LQu8mhYeDFsVlJLE0ObGKF6yCA+IhiD8mQ6yq5HmFMTHdN1IoMUbYeBSE0i8F2e79+qd
 fpg2aUKHxim51QOsZy5eontt0/I1Zgs3oGcysQsN5+fBg8Eo7lp0CfzVEcvITay6vPN3
 b2npy4elSO7ldZtdc0j8S7CRmxqkYWgnDfw7sAeHHz5Kh67J16ZhjwpCBSPBCdYJej0Q
 D+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvYxGQ/78KpLHiNvr29qS74xd6utm8BhrIQ0l8klMB4=;
 b=KfUjHAYmDEbDVgqxpPhXHjoJxKFfYsk8FKPW2xBJOoHTHgTeefdRjtYMOQXhZSBZIB
 KFluBWWi7wXnQ/g226iY0DlGm3akQTLEqeWmNSg351qnzFKA0CioylvwefFaQZo2qrVG
 CghNj4pdCAPtZ24FXbdU7FA9Xu+iM7DFj5c5edJaxPcumTbSSrcEUkTuHHDArPqlRnZ+
 eHWJHBvIWz2CrF3aeM9Ojpo+siNqrdfg62cyh5HsorbxWAkySkYNg9WpLX6cEoL/iCsw
 E0H8vushVrT5tz29D6ieS5xggXjJfakPry3T19tFJhF88vcm08sZewdmuQRlLDA6TdXu
 kLcw==
X-Gm-Message-State: APjAAAXRzmkdsKMHNytJmKKugylSqoKUAfZoCESpleRWMT+4db03HvMi
 Qak9tCMs7VgD+GVRFjLUONI3IOmh1vHWeqistY4=
X-Google-Smtp-Source: APXvYqyovYHSosGYhrye3Nq/PG1i65uuiOhWSfpSAev9Iupxfc+C0+tyqOMQAWW4rbU6XBRNay0WHQv13Bw003/0rW4=
X-Received: by 2002:a5e:9246:: with SMTP id z6mr24041479iop.232.1581619753782; 
 Thu, 13 Feb 2020 10:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20200213132203.23441-1-kraxel@redhat.com>
In-Reply-To: <20200213132203.23441-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 13 Feb 2020 10:49:02 -0800
Message-ID: <CAPaKu7RAu4LaMUWczWU6UeE+LPfD0d3L=Lie7NQQ0E5xCOSDLQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] drm/virtio: rework batching
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

After the series, virtio_gpu_cmd_* may or may not call
virtio_gpu_notify.  It is error-prone and should be fixed, such that
virtio_gpu_cmd_* never notifies, or such that different naming
conventions are used for functions that notify and for those don't.



On Thu, Feb 13, 2020 at 5:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> v4:
>  - split into multiple patches.
>
> Gerd Hoffmann (4):
>   drm/virtio: rework notification for better batching
>   drm/virtio: batch plane updates (pageflip)
>   drm/virtio: batch resource creation
>   drm/virtio: batch display query.
>
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++--
>  drivers/gpu/drm/virtio/virtgpu_display.c |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c   |  1 +
>  drivers/gpu/drm/virtio/virtgpu_kms.c     |  2 ++
>  drivers/gpu/drm/virtio/virtgpu_object.c  |  1 +
>  drivers/gpu/drm/virtio/virtgpu_plane.c   |  7 ++--
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 41 +++++++++++++-----------
>  7 files changed, 33 insertions(+), 27 deletions(-)
>
> --
> 2.18.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
