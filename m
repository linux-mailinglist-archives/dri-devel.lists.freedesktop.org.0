Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053776A5C31
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593E910E057;
	Tue, 28 Feb 2023 15:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1F310E057
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 15:43:48 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 l16-20020a4ad9d0000000b005254905810aso1614641oou.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LonH6h0XflHd2ZjJoaCMQxM+eselh1rFlXJtr2TdEH0=;
 b=WyJg6CTQHizjZtwa26KfNyODiFG3bpBQVCtLC6kZa2jQ93g3cNA0st7X5zv0Q0WEyz
 DssEP8HT6EafkjajKflc8sIiiF0dUns20WwxZRwoLYoYxJDiuQntnrgON6O0bmAB78gU
 eusnG6BYYBWBbE9LMTXMKE1W0CDyQP43ruj+RGcEzoFV8LOE3zN/x9BMvVl2JZ1quO1J
 YTTCzT58vDVD0zhGKokq3aPnJ1b01i5rGPvzR8ipxkTmzyihfnBoBJxmHS8DBHDCFkJT
 en235u700aMHlAZhuPqoO8i2/Fohbbk33SHXIvLNO4mmMkLm7loqL7m1EG3wa+b8ziGD
 udpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LonH6h0XflHd2ZjJoaCMQxM+eselh1rFlXJtr2TdEH0=;
 b=ui82HI+8VTVRSlet9XrGFepS8uMn8YGrtlTpuPCIbMS6ForJtcvpMaTUBFYU2Er3Tp
 jx3J/AF64p0iiGFSHgi+sDjcDnCRqkDuvCmF6ZTGT+BwdYfq7YIt9QXAIFxbLbR7gwiS
 xw5SF7m5GewDbh+ZBptjtWVGzktBFNKO166nM/msOc8w/pFJJzvK0+5tczq5+sCV9DZg
 jQa8RU34dJsaruSoW8wl8pOIbxgYYBb+u9HG+4V0MtMMPbhhSeY9XJAgpmrEHdIT/Z/j
 dP2wAYdM+xiXwr5QT4LWNjtQUTjKSsUOq8txQFMVhyjqaQRhFm8WnBRVEyJ+i5WUMOoZ
 iOmw==
X-Gm-Message-State: AO0yUKUoVre7JxpoZBTBYPwV2C6adCr0ISvHuKLTmLHqYthqt5uH/Wq5
 0qraiSNheUrMXVa1rZW1G0YbqVB28Fws/N1PuJc=
X-Google-Smtp-Source: AK7set8STQ1oztAalDc2bpQ9rNAMwQTUZCm2yzbWRYUjL7JbeIR+duZmjExm+N3PqFqj9f5vVh1ZzbL3mR9s5ouJdgQ=
X-Received: by 2002:a4a:840f:0:b0:525:499e:ce2f with SMTP id
 l15-20020a4a840f000000b00525499ece2fmr795883oog.1.1677599027483; Tue, 28 Feb
 2023 07:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20230227173800.2809727-1-robdclark@gmail.com>
 <44e67d88-fce6-a1c1-79a9-a937e64a32bb@collabora.com>
 <CAF6AEGsT8_o+v0vzGu1nyh6Z82pj8FnGUdMFc0Lq+4OWoSjRBQ@mail.gmail.com>
 <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>
In-Reply-To: <fb70356e-4e13-1858-9e1a-e886f5918030@suse.de>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Feb 2023 07:43:36 -0800
Message-ID: <CAF6AEGt2SYvppE3-QbmZNbgVgTNndT+mRUe6N-z0AS+SB6KKoQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: Add option to disable KMS support
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan Neph <ryanneph@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 4:34 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 27.02.23 um 19:15 schrieb Rob Clark:
> > On Mon, Feb 27, 2023 at 9:57 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 2/27/23 20:38, Rob Clark wrote:
> >> ...
> >>> +     if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS)) {
> >>> +             /* get display info */
> >>> +             virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
> >>> +                             num_scanouts, &num_scanouts);
> >>> +             vgdev->num_scanouts =3D min_t(uint32_t, num_scanouts,
> >>> +                                         VIRTIO_GPU_MAX_SCANOUTS);
> >>> +             if (!vgdev->num_scanouts) {
> >>> +                     /*
> >>> +                      * Having an EDID but no scanouts is non-sensic=
al,
> >>> +                      * but it is permitted to have no scanouts and =
no
> >>> +                      * EDID (in which case DRIVER_MODESET and
> >>> +                      * DRIVER_ATOMIC are not advertised)
> >>> +                      */
> >>> +                     if (vgdev->has_edid) {
> >>> +                             DRM_ERROR("num_scanouts is zero\n");
> >>> +                             ret =3D -EINVAL;
> >>> +                             goto err_scanouts;
> >>> +                     }
> >>> +                     dev->driver_features &=3D ~(DRIVER_MODESET | DR=
IVER_ATOMIC);
> >>
> >> If it's now configurable by host, why do we need the
> >> CONFIG_DRM_VIRTIO_GPU_KMS?
> >
> > Because a kernel config option makes it more obvious that
> > modeset/atomic ioctls are blocked.  Which makes it more obvious about
> > where any potential security issues apply and where fixes need to get
> > backported to.  The config option is the only thing _I_ want,
> > everything else is just a bonus to help other people's use-cases.
>
> I find this very vague. What's the security thread?

The modeset ioctls are a big potential attack surface area.  Which in
the case of CrOS VM guests serves no legitimate purpose.  (kms is
unused in the guest, instead guest window surfaces are proxied to host
for composition alongside host window surfaces.)

There have been in the past potential security bugs (use-after-free,
etc) found in the kms ioctls.  We should assume that there will be
more in the future.  So it seems like simple common sense to want to
block unused ioctls.

> And if the config option is useful, shouldn't it be DRM-wide? The
> modesetting ioctl calls are shared among all drivers.

Maybe, if there is a use?  The situation of compositing guest windows
in the host seems a bit unique to virtgpu, which is why I went with a
config option specific to virtgpu.

BR,
-R

> Best regards
> Thomas
>
> >
> > BR,
> > -R
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
