Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210874B60E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC92A10E5CD;
	Fri,  7 Jul 2023 18:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16EE10E5CD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 17:59:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-991ef0b464cso639117466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688752796; x=1691344796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azrOyEqV71RCLqg+gOSoa1rFyGphadqCQWI7uGj/i20=;
 b=JSqQw4/rUzn4qZpnbNmUBCugiQcAXSR7CB6la34ysCab1HeiqF2/exnQqbNaDA+eot
 C0FNzEzzTrZd9pCoTOnHlNyNuNeI5IMFmb0S1KvrLEjQybGf64hPp9kxoXx8Fk9gmMbm
 jNAR2g2f8OsplFvUXdCgYBYaFA7cu+3nnyZvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688752796; x=1691344796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azrOyEqV71RCLqg+gOSoa1rFyGphadqCQWI7uGj/i20=;
 b=Dv6f/h8qfCesIpfj6/fOGNQ1RzfaSW1hIJOfqqbhZHh22aL3SWs/HHCV6tU+sJBRdS
 yNh3cV9zrjUCQopoDBVHEFBJvCQwvCGRQ70auzqAuh8BKPTmt9XHylj6H1kQlAOA9PyE
 gfl7NG4/2i8hEMNx1y6ISIXyJrOxX64v/uragDqbvA32JNzR0Sn067+wyNz5yldRngEc
 tSTp1vET1GtpI1OkLwHQc4jxoTRLW6c3vzz2d2eZKMAnmwFMoOgSV4yii4LY6RSga2ui
 nVnTLZK7Jmpk+mOXzhlUf+y8Z1rdZtgDqBfI35428Qzu3JBsLVy6S/uQmyS0LCtMWd03
 K1/Q==
X-Gm-Message-State: ABy/qLbkCKn+a3tWkLqQC+ko1N3mqN7AuxECA7JDvmJk5rFlP5ZxEw8r
 jKN9IYKQ66RtA5WjL/PgsYA32LKKCuwnu6LZ9nz7gg==
X-Google-Smtp-Source: APBJJlGkECP9QK4w6t7jB/I0Gnzl7ynuQlCy2tyEERxcCv1tBA5F9nEbjyhheao7nNrjkH4QFIJkUg==
X-Received: by 2002:a17:906:2210:b0:993:d920:87d2 with SMTP id
 s16-20020a170906221000b00993d92087d2mr1538460ejs.30.1688752796602; 
 Fri, 07 Jul 2023 10:59:56 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 t9-20020a17090616c900b009932337747esm2452846ejd.86.2023.07.07.10.59.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 10:59:56 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-51db8a4dc60so773a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 10:59:56 -0700 (PDT)
X-Received: by 2002:a50:955a:0:b0:51a:1ffd:10e with SMTP id
 v26-20020a50955a000000b0051a1ffd010emr1937eda.3.1688752796038; Fri, 07 Jul
 2023 10:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <77c241ff-b3b6-d399-59db-0291dc9d2812@collabora.com>
 <20230707154337.620-1-gurchetansingh@chromium.org>
 <2be0ec9f-5e40-1b23-48ed-e284e97a93d1@collabora.com>
 <0a581623-1241-5bc3-aed9-c355053131bc@collabora.com>
In-Reply-To: <0a581623-1241-5bc3-aed9-c355053131bc@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 7 Jul 2023 10:59:43 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmON-0Jb+3YFtP5vkjHUion7pWWzckEF+e7=VNE6hrd=w@mail.gmail.com>
Message-ID: <CAAfnVBmON-0Jb+3YFtP5vkjHUion7pWWzckEF+e7=VNE6hrd=w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: conditionally allocate virtio_gpu_fence
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023 at 10:35=E2=80=AFAM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/7/23 20:04, Dmitry Osipenko wrote:
> > On 7/7/23 18:43, Gurchetan Singh wrote:
> >> @@ -161,21 +157,27 @@ static int virtio_gpu_init_submit(struct virtio_=
gpu_submit *submit,
> >>                                struct drm_file *file,
> >>                                u64 fence_ctx, u32 ring_idx)
> >>  {
> >> +    int err;
> >> +    struct virtio_gpu_fence *out_fence;
> >>      struct virtio_gpu_fpriv *vfpriv =3D file->driver_priv;
> >>      struct virtio_gpu_device *vgdev =3D dev->dev_private;
> >> -    struct virtio_gpu_fence *out_fence;
> >> -    int err;
> >> +    bool drm_fence_event =3D (exbuf->flags & VIRTGPU_EXECBUF_RING_IDX=
) &&
> >> +                           (vfpriv->ring_idx_mask & BIT_ULL(ring_idx)=
);
> >
> > Previously, when VIRTGPU_EXECBUF_RING_IDX flag wasn't specified, the
> > fence event was created for a default ring_idx=3D0. Now you changed thi=
s
> > behaviour and event will never be created without
> > VIRTGPU_EXECBUF_RING_IDX flag being set.

ring_idx =3D 0 is fine, but without VIRTGPU_EXECBUF_RING_IDX that means
the global timeline.

It's an additional check for where the userspace specifies they want
to use per-context fencing and polling, but actually uses the global
timeline.  Userspace never does this since it wouldn't work, so it's a
bit of a pathological edge case check than any UAPI change.

> >
> > Could you please point me at the corresponding userspace code that poll=
s
> > DRM FD fence event?

https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools/somm=
elier/virtualization/virtgpu_channel.cc#216

Used with the following flow:

https://crosvm.dev/book/devices/wayland.html

If you wish to test, please do apply this change:

https://chromium-review.googlesource.com/c/chromiumos/platform2/+/4605854

> >
> > It's unclear whether there is a possible userspace regression here or
> > not. If there is no regression, then in general such behavioural change=
s
> > should be done in a separate commit having detailed description
> > explaining why behaviour changes.

Sommelier isn't formally packaged yet in the Linux distro style and it
always specifies RING_IDX when polling, so no regressions here.  Maybe
a separate commit is overkill (since the 2nd commit would delete the
newly added checks), what about just more detail in the commit
message?

>
> I see that venus does the polling and ring_idx_mask is a
> context-specific param, hence it's irrelevant to a generic ctx 0. Still
> it's now necessary to specify the EXECBUF_RING_IDX flag even if ctx has
> one ring, which is UAPI change.

It doesn't seem like venus enables POLL_RINGS_MASK to poll since that
param is zero?

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/virtio/vulkan/vn_r=
enderer_virtgpu.c#L617



>
> --
> Best regards,
> Dmitry
>
