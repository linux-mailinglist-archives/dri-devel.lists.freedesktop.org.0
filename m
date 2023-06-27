Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF9740288
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 19:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33410E01F;
	Tue, 27 Jun 2023 17:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3E910E316;
 Tue, 27 Jun 2023 17:47:46 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98e1b1d1698so429356766b.2; 
 Tue, 27 Jun 2023 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687888064; x=1690480064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AZDCbtO++1Sx9t7C/B2TxgxH7taGxg4fU7YSpb4v+4s=;
 b=l19IV8djnVEYl157H2WJJf5XotIHTI04GrdF9If2UXrG/PLw0TxamMYG6X9opBgZYo
 jx5KOEue0E3s9PWOIvZsWlFvkzwAeMOV60EslKp8At+ENLc2j3tVlEO2jTJGn5QjQ8ZE
 UheK0a47VxaG8YjVyO8idkn6RhHh+Q2Ou/KEls7i+k6fHPin1r1nTm6XmOtB5phWv0P4
 XXMYzcWk45saDkOte7aZmXmDMbe/dPLuxpsgb2lDzoEucSlhx/rY4rptcLm+lFMH7jDg
 p09jN3B7430fnWqwD7N0nnr6Ks71ucHqY6XCPrnYc8tQyZJJzyTVJfJ2vB2UuKbUlYOA
 KGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687888064; x=1690480064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZDCbtO++1Sx9t7C/B2TxgxH7taGxg4fU7YSpb4v+4s=;
 b=ORXnYMfEUOFsKLYnTU+cJxd4iMyCUjNGNLugkbeVZDBXr+a4qP+FdyV+OfczuboVFA
 TcD0HoueK5nx1NC3Tv/SQHLnNEngDWtw7ijFxTsP8R7/VgGSCX5VMu6mFs21yULFhjU8
 ktkVUye7hv0geB9A+K+LbTP8k+QN2x7nIyGAnqLyaqUCUl2d2AWrtFKuuLXUwjdmT205
 /wHdRCL+lE0Q05kdNO24c1WzbP4zE2qpjNZCaFn4ahqFSYD9VDTuIdJfrQEZbm9ptdjJ
 xCv3obM/KtEnOYR4LzVP0nO1qn3XZA2WwEDy1/spxSvxhdX+5q+ZrYDe9Dric2MJc0HO
 6OpA==
X-Gm-Message-State: AC+VfDyPFMyZgI5a3Yt/Z0Wdjiz9Y7HlSCvJyM//69u48Q7ZBjtdcGiM
 nM2gt5y9R8xJji1eWcqN4KU=
X-Google-Smtp-Source: ACHHUZ6XmiIudo0KOTOyVlYkzieAae5ZM7joTZHdN/6cj6UZpef0gKukCJFXmhBktvjcggsclz10sQ==
X-Received: by 2002:a17:907:97c6:b0:98e:35d1:993e with SMTP id
 js6-20020a17090797c600b0098e35d1993emr7915706ejc.5.1687888063978; 
 Tue, 27 Jun 2023 10:47:43 -0700 (PDT)
Received: from ?IPV6:2a00:e180:1599:a100:929f:5de4:783e:4193?
 ([2a00:e180:1599:a100:929f:5de4:783e:4193])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a170906561500b0095807ab4b57sm4844371ejq.178.2023.06.27.10.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 10:47:43 -0700 (PDT)
Message-ID: <1dbeb507-3f18-1b5d-37be-fcfd60a1c0d4@gmail.com>
Date: Tue, 27 Jun 2023 19:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 1/1] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230627132323.115440-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230627132323.115440-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.06.23 um 15:23 schrieb André Almeida:
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>
> v4: https://lore.kernel.org/lkml/20230626183347.55118-1-andrealmeid@igalia.com/
>
> Changes:
>   - Grammar fixes (Randy)
>
>   Documentation/gpu/drm-uapi.rst | 68 ++++++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 65fb3036a580..3cbffa25ed93 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,74 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>   mmapped regular files. Threads cause additional pain with signal
>   handling as well.
>   
> +Device reset
> +============
> +
> +The GPU stack is really complex and is prone to errors, from hardware bugs,
> +faulty applications and everything in between the many layers. Some errors
> +require resetting the device in order to make the device usable again. This
> +sections describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to perform
> +it as needed. Usually a hang is detected when a job gets stuck executing. KMD
> +should keep track of resets, because userspace can query any time about the
> +reset stats for an specific context.

Maybe drop the part "for a specific context". Essentially the reset 
query could use global counters instead and we won't need the context 
any more here.

Apart from that this sounds good to me, feel free to add my rb.

Regards,
Christian.

>   This is needed to propagate to the rest of
> +the stack that a reset has happened. Currently, this is implemented by each
> +driver separately, with no common DRM interface.
> +
> +User Mode Driver
> +----------------
> +
> +The UMD should check before submitting new commands to the KMD if the device has
> +been reset, and this can be checked more often if the UMD requires it. After
> +detecting a reset, UMD will then proceed to report it to the application using
> +the appropriate API error code, as explained in the section below about
> +robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep an application working after a reset is if it
> +complies with the robustness aspects of the graphical API that it is using.
> +
> +Graphical APIs provide ways to applications to deal with device resets. However,
> +there is no guarantee that the app will use such features correctly, and the
> +UMD can implement policies to close the app if it is a repeating offender,
> +likely in a broken loop. This is done to ensure that it does not keep blocking
> +the user interface from being correctly displayed. This should be done even if
> +the app is correct but happens to trigger some bug in the hardware/driver.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). This
> +interface tells if a reset has happened, and if so, all the context state is
> +considered lost and the app proceeds by creating new ones. If it is possible to
> +determine that robustness is not in use, the UMD will terminate the app when a
> +reset is detected, giving that the contexts are lost and the app won't be able
> +to figure this out and recreate the contexts.
> +
> +Vulkan
> +~~~~~~
> +
> +Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
> +This error code means, among other things, that a device reset has happened and
> +it needs to recreate the contexts to keep going.
> +
> +Reporting causes of resets
> +--------------------------
> +
> +Apart from propagating the reset through the stack so apps can recover, it's
> +really useful for driver developers to learn more about what caused the reset in
> +first place. DRM devices should make use of devcoredump to store relevant
> +information about the reset, so this information can be added to user bug
> +reports.
> +
>   .. _drm_driver_ioctl:
>   
>   IOCTL Support on Device Nodes

