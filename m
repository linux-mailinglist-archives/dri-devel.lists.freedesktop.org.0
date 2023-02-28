Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8615C6A5E1F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 18:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36FE10E4E3;
	Tue, 28 Feb 2023 17:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9753310E4E3;
 Tue, 28 Feb 2023 17:21:07 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-172a623ad9aso11584920fac.13; 
 Tue, 28 Feb 2023 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7x7oHut5DL2b1slktWg4ykcN8IGiByTWSwYr9fSdOk=;
 b=W1aPmSSXbMzPCaSAecaI772FQHgFMTqPnezT3cYUHA92WRfdFX76nNqomSs4mqmMSN
 xEBafiMXUr1i+RRk5CdEnwSVGApdZtwngzfMp3Ey8aNQ5SEAAP12etDcyGBnhdPalK2K
 jOrjH1vB86N+OQSbRRCDmY+dR3CZMmZXvtm/FMF2p3abisKQfN8j5Xvu1CyrlT4JunZ5
 2O1OVqBDgJOSDKhNkvDbMZbMRbjdySP0nUq8gdt6gQ4F6peTek4ZADfQeHr1iUfQeEA8
 9iBJHVDvVlFkxhWDD/qFocnQ01yYG/jyJS6WT36ZM8hU6nzte/Mu+/k/Z7Jn//pFCvmv
 WBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7x7oHut5DL2b1slktWg4ykcN8IGiByTWSwYr9fSdOk=;
 b=CK1el0xKydKDfs54YVoEmmRLcWQBzfVBLxg6K6qeSNMHLUbvt4lEWaPALhUSrLSqc2
 lb2lp2PR1q+O6HyGYTuHrJFDp81Lc1SWTPfhrhxW91Nyu38U02SYqR2NMpeSqd1pay1G
 BwEkNaE2DHo3D4/6NnR7U36Pekpkyp6SBBG1xg/5OG6LtdOCBqngmV2IpQBaYiCzG9dW
 JsxYBNpK58fov+E3bxAyQqcz77v2qn6U3fdpPlhrRypGh3Xjh8TgE1edCavPceguMpkr
 yYwNVevRzGDlsadjp6Kgq4+PcpdnXZdpdIs1SA5z4pZ00UAMnsNvB4LyOG/ZCpmo0MH4
 Ejnw==
X-Gm-Message-State: AO0yUKVzj7uSYZk8dirwsMm2OB/7p6TSRl4bDNZlAjCeaxbzR8+a/qY5
 ibAwhcJsTbEl497vS3g1x3pLKVtg7NE+V3f8CIA=
X-Google-Smtp-Source: AK7set/bb7R3q9nnU4uxrhjM46d5ADy7wq7B9UAVuFkbqBjqpPYOXMZIiragVo2wEaTsUqMgS+GpaShQpsfnJB7UTGk=
X-Received: by 2002:a05:6871:6a9e:b0:16e:873e:b06b with SMTP id
 zf30-20020a0568716a9e00b0016e873eb06bmr763908oab.3.1677604866849; Tue, 28 Feb
 2023 09:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20230227204000.56787-1-andrealmeid@igalia.com>
 <20230227204000.56787-2-andrealmeid@igalia.com>
In-Reply-To: <20230227204000.56787-2-andrealmeid@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Feb 2023 09:20:55 -0800
Message-ID: <CAF6AEGvpJTHLQdQRBZXpc0Tpuo1zgt3A-L_2TGBc+imuzuzf-w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/doc: Document DRM device reset expectations
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
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
Cc: Rob Clark <robdclark@chromium.org>, pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 amaranath.somalapuram@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, contactshashanksharma@gmail.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 12:40 PM Andr=C3=A9 Almeida <andrealmeid@igalia.com=
> wrote:
>
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 51 ++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 65fb3036a580..3d6c3ed392ea 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,57 @@ for GPU1 and GPU2 from different vendors, and a thir=
d handler for
>  mmapped regular files. Threads cause additional pain with signal
>  handling as well.
>
> +Device reset
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The GPU stack is really complex and is prone to errors, from hardware bu=
gs,
> +faulty applications and everything in the many layers in between. To rec=
over
> +from this kind of state, sometimes is needed to reset the GPU. Unproper =
handling
> +of GPU resets can lead to an unstable userspace. This section describes =
what's
> +the expected behaviour from DRM drivers to do in those situations, from =
usermode
> +drivers and compositors as well. The end goal is to have a seamless expe=
rience
> +as possible, either the stack being able to recover itself or resetting =
to a new
> +stable state.
> +
> +Robustness
> +----------
> +
> +First of all, application robust APIs, when available, should be used. T=
his
> +allows the application to correctly recover and continue to run after a =
reset.
> +Apps that doesn't use this should be promptly killed when the kernel dri=
ver
> +detects that it's in broken state. Specifically guidelines for some APIs=
:
> +
> +- OpenGL: KMD signals the abortion of submitted commands and the UMD sho=
uld then
> +  react accordingly and abort the application.

I disagree.. what would be the point of GL_EXT_robustness
glGetGraphicsResetStatusEXT() if we are going to abort the application
before it has a chance to call this?

Also, this would break the deqp-egl robustness tests because they
would start crashing ;-)

> +
> +- Vulkan: Assumes that every app is able to deal with ``VK_ERROR_DEVICE_=
LOST``.
> +  If it doesn't do it right, it's considered a broken application and UM=
D will
> +  deal with it, aborting it.
> +
> +Kernel mode driver
> +------------------
> +
> +The KMD must be able to detect that something is wrong with the applicat=
ion
> +and that a reset is needed to take place to recover the device (e.g. an =
endless
> +wait). It needs to properly track the context that is broken and mark it=
 as
> +dead, so any other syscalls to that context should be further rejected. =
The
> +other contexts should be preserved when possible, avoid crashing the res=
t of
> +userspace. KMD can ban a file descriptor that keeps causing resets, as i=
t's
> +likely in a broken loop.

syscalls to the context?  Like the one querying the reset status?  :-P

In general I don't think the KMD should block syscalls.  _Maybe_ there
could be some threshold at which point we start blocking things, but I
think that would still cause problems with deqp-egl.

What we should perhaps do is encourage drivers to implement
devcoredump support for logging/reporting GPU crashes.  This would
have the benefit that distro error reporting could be standardized.
And hopefully some actionable bug reports come out of it.

And maybe we could standardize UABI for reporting crashes so a
compositor has a chance to realize an app is crashing and take action.
(But again, how does the compositor know that this isn't intentional,
it would be kinda inconvenient if the compositor kept killing my deqp
runs.)  But for all the rest, nak

BR,
-R


> +
> +User mode driver
> +----------------
> +
> +During a reset, UMD should be aware that rejected syscalls indicates tha=
t the
> +context is broken and for robust apps the recovery should happen for the
> +context. Non-robust apps must be terminated.
> +
> +Compositors
> +-----------
> +
> +Compositors should be robust as well to properly deal with its errors.
> +
> +
>  .. _drm_driver_ioctl:
>
>  IOCTL Support on Device Nodes
> --
> 2.39.2
>
