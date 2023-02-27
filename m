Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A16A4967
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EE410E2A3;
	Mon, 27 Feb 2023 18:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573F10E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 18:15:47 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1720433ba75so8305803fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kthqGc9HV1+cBVD65tJGeV3icobdW/IXIZ0JuA3FrL8=;
 b=lYckM1IRs9rKTPJansQK12xCrzQqLHSEAEz0U8EQZ5KlEC2GYtPE1Q68T+2aD+Z2/N
 Yg4gtNSULCKaJIHLZV1iFIDGXhEERqdg7mZaQCpKVWD86OIDc20uQDvbtvsZ1wxBh8DR
 vq8RnC5zPZw4yiF8ETZEJDSAxogkEBUchv5yKkf3Rnd14QbEp1u2tlU44b1WkI/r+Lln
 L1ZwoQIlfV8UjJ/VHMAwZPSmY7w5udoGEIlXEYX5F2lqCTE7tKa5b7JxCmKiI8jbKnfY
 D5jZ+prKhJizeyRPaKSIhmuK7T5aTPyFGtx3cX5r2WWV5yJVb738V79OsOPbmVCB2ZfT
 49+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kthqGc9HV1+cBVD65tJGeV3icobdW/IXIZ0JuA3FrL8=;
 b=pX8zFLecXm1Yn6IJLYvDMhbbFTUjF8PJ82Zmj/EuBN0OsOtoOCWCnAFOCUrmal+L+e
 hMYMqYKUY6Nmw8Spc/+m1vbdlbpx52f7uQWvz1ZvMlcHwCn69TOtfUDKyFkpeq06Qn2B
 ywHxZxWsX/ZhRuMoOCyH1tH9mgD+qVQ8dUcb6YovPN7s79qpKR+v7jfKkIsgavcod5C1
 2QVrgN4mue4ut1iKjDKxVpFh4G4+blO1+BBrLcbQxEDQxjIa/iR8ccx3idIa2ckN6Du6
 gJsb0EszfdwSFBRB+gY9gYWOy6JZMzk8U7Y89Dwy9iGJCV+JEpQ4CpS4xOTCPVFRSw7b
 3slQ==
X-Gm-Message-State: AO0yUKVFJqjgRYlSbyMAFVFo1QQrefnYu/4lBbmXU7bpiIcDQkiao+Ox
 AKzKMQcxcbIwjhaKQU+Omy5Q43k0+HVJuxmBleg=
X-Google-Smtp-Source: AK7set+Ri0pJ646Cs1O36dk7bj0CewKmdMpJW7Ni/DCBcjC1K4lZ/4qSxJJbnKDXx/oHOUK7tOnbal73p58uN1fK7R4=
X-Received: by 2002:a05:6870:5b0a:b0:172:6f4:dcdf with SMTP id
 ds10-20020a0568705b0a00b0017206f4dcdfmr3879299oab.3.1677521746056; Mon, 27
 Feb 2023 10:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20230227173800.2809727-1-robdclark@gmail.com>
 <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
In-Reply-To: <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 27 Feb 2023 10:15:34 -0800
Message-ID: <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 9:57 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 2/27/23 20:38, Rob Clark wrote:
> ...
> > +     if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS)) {
> > +             /* get display info */
> > +             virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
> > +                             num_scanouts, &num_scanouts);
> > +             vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
> > +                                         VIRTIO_GPU_MAX_SCANOUTS);
> > +             if (!vgdev->num_scanouts) {
> > +                     /*
> > +                      * Having an EDID but no scanouts is non-sensical,
> > +                      * but it is permitted to have no scanouts and no
> > +                      * EDID (in which case DRIVER_MODESET and
> > +                      * DRIVER_ATOMIC are not advertised)
> > +                      */
> > +                     if (vgdev->has_edid) {
> > +                             DRM_ERROR("num_scanouts is zero\n");
> > +                             ret = -EINVAL;
> > +                             goto err_scanouts;
> > +                     }
> > +                     dev->driver_features &= ~(DRIVER_MODESET | DRIVER_ATOMIC);
>
> If it's now configurable by host, why do we need the
> CONFIG_DRM_VIRTIO_GPU_KMS?

Because a kernel config option makes it more obvious that
modeset/atomic ioctls are blocked.  Which makes it more obvious about
where any potential security issues apply and where fixes need to get
backported to.  The config option is the only thing _I_ want,
everything else is just a bonus to help other people's use-cases.

BR,
-R
