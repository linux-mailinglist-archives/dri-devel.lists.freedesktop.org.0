Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AE7B306A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 12:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0C210E0FF;
	Fri, 29 Sep 2023 10:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019BD10E0FF;
 Fri, 29 Sep 2023 10:32:26 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a648f9d8e3so1933656866b.1; 
 Fri, 29 Sep 2023 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695983545; x=1696588345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SWJdqBPnDAgywcBZidpvlgZ+YV2aBNzRsFnFunNvCTo=;
 b=CeYAQij2U5zYkbPYp8T8k0MpgJGVNPGjZFL5TVaFQ31XLb+TrYH+jluA+FhPPZ4ECm
 8VxQ2/4n1T6dlP6uXwWg4c0QBQ6AGCG7RAWEoMW0Z3/uAGMqYcmx117Vt9ahzREs79gW
 3Q58RmLGdj6pyLwJpohCJ9cz3EZw5Un81MVL9vcqKAVJYyk6XULwQz4zd69/DFLZjN8O
 S7a6zJgUdNi5gk5k2T6Syb86uFiacVqGTvTnBn8+B1sf0EaLKmdAY4lnwjfMvdO3z3p4
 rDqytZSI27MCagEU9HWNjj6NS/ZxDvYi9bw+XdedQJOGOwqsJXN4+uRpXcOgxremiONe
 pYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695983545; x=1696588345;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SWJdqBPnDAgywcBZidpvlgZ+YV2aBNzRsFnFunNvCTo=;
 b=K3BycIvT1l3Tlwrr06B8JKYlTfpp8xfrJNgHql+KUxGKojFLGS8Y71012vLLkyW4br
 qRk4yFeNib4ZhFGF5yrewaNnsnXYEeKIKZevZBMXzv1DZfd7jpl+EMAFZMcgL/0/DMAY
 PZgiNx66nKgWWEIi+mFMajC31d0Qa2YMo4Ib64mxBdMI97MizNGTe8+OWZWY7q9c7hH4
 zHPyEP4CZPocTR2pDfRdgZ8ieUxd3OTelBlBfzdAO30RCimEsdd+1rwa7nWmjyOy20JT
 cxcb8KaazN4N1qJmMdgGQi+SQWY1Hl1Qw5qqWzlfZ5fErQrAJtlm9KwQKJZO7Nqp5JEG
 huug==
X-Gm-Message-State: AOJu0YzkjKPMWKo4BDv4mQ8LvkmQiqlM61aPoGfNvm2Lw5v6tzrrG6BU
 IqvFJp6j1PKeRsy0kQIyNBA=
X-Google-Smtp-Source: AGHT+IHwAzEk47p3atUGX2xHAqL4CJe8oWQxMBDcSASlwdq6m/olOlBn2FKqZDILQOAgoVZkcA1g6g==
X-Received: by 2002:a17:906:5dc1:b0:9ae:513d:47bd with SMTP id
 p1-20020a1709065dc100b009ae513d47bdmr3396092ejv.26.1695983545033; 
 Fri, 29 Sep 2023 03:32:25 -0700 (PDT)
Received: from [192.168.178.25] ([185.254.126.65])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a1709064c4c00b0099bd86f9248sm12316174ejw.63.2023.09.29.03.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 03:32:24 -0700 (PDT)
Message-ID: <6c937706-d171-817d-806f-602a939d5cb3@gmail.com>
Date: Fri, 29 Sep 2023 12:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8] drm/doc: Document DRM device reset expectations
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230929092509.42042-1-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230929092509.42042-1-andrealmeid@igalia.com>
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
 Sebastian Wick <sebastian.wick@redhat.com>, amaranath.somalapuram@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.09.23 um 11:25 schrieb André Almeida:
> Create a section that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Acked-by: Sebastian Wick <sebastian.wick@redhat.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

I think that is now ready to be pushed. Do you have commit rights to 
drm-misc-next? If not please ping me.

Regards,
Christian.

> ---
> v8 changes:
> - Add acked-by tags
>
> v7: https://lore.kernel.org/dri-devel/20230818200642.276735-1-andrealmeid@igalia.com/
>
> v7 changes:
>   - s/application/graphical API contex/ in the robustness part (Michel)
>   - Grammar fixes (Randy)
>
> v6: https://lore.kernel.org/lkml/20230815185710.159779-1-andrealmeid@igalia.com/
>
> v6 changes:
>   - Due to substantial changes in the content, dropped Pekka's Acked-by
>   - Grammar fixes (Randy)
>   - Add paragraph about disabling device resets
>   - Add note about integrating reset tracking in drm/sched
>   - Add note that KMD should return failure for contexts affected by
>     resets and UMD should check for this
>   - Add note about lack of consensus around what to do about non-robust
>     apps
>
> v5: https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
> ---
>   Documentation/gpu/drm-uapi.rst | 77 ++++++++++++++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index eef5fd19bc92..632989df3727 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -285,6 +285,83 @@ for GPU1 and GPU2 from different vendors, and a third handler for
>   mmapped regular files. Threads cause additional pain with signal
>   handling as well.
>   
> +Device reset
> +============
> +
> +The GPU stack is really complex and is prone to errors, from hardware bugs,
> +faulty applications and everything in between the many layers. Some errors
> +require resetting the device in order to make the device usable again. This
> +section describes the expectations for DRM and usermode drivers when a
> +device resets and how to propagate the reset status.
> +
> +Device resets can not be disabled without tainting the kernel, which can lead to
> +hanging the entire kernel through shrinkers/mmu_notifiers. Userspace role in
> +device resets is to propagate the message to the application and apply any
> +special policy for blocking guilty applications, if any. Corollary is that
> +debugging a hung GPU context require hardware support to be able to preempt such
> +a GPU context while it's stopped.
> +
> +Kernel Mode Driver
> +------------------
> +
> +The KMD is responsible for checking if the device needs a reset, and to perform
> +it as needed. Usually a hang is detected when a job gets stuck executing. KMD
> +should keep track of resets, because userspace can query any time about the
> +reset status for a specific context. This is needed to propagate to the rest of
> +the stack that a reset has happened. Currently, this is implemented by each
> +driver separately, with no common DRM interface. Ideally this should be properly
> +integrated at DRM scheduler to provide a common ground for all drivers. After a
> +reset, KMD should reject new command submissions for affected contexts.
> +
> +User Mode Driver
> +----------------
> +
> +After command submission, UMD should check if the submission was accepted or
> +rejected. After a reset, KMD should reject submissions, and UMD can issue an
> +ioctl to the KMD to check the reset status, and this can be checked more often
> +if the UMD requires it. After detecting a reset, UMD will then proceed to report
> +it to the application using the appropriate API error code, as explained in the
> +section below about robustness.
> +
> +Robustness
> +----------
> +
> +The only way to try to keep a graphical API context working after a reset is if
> +it complies with the robustness aspects of the graphical API that it is using.
> +
> +Graphical APIs provide ways to applications to deal with device resets. However,
> +there is no guarantee that the app will use such features correctly, and a
> +userspace that doesn't support robust interfaces (like a non-robust
> +OpenGL context or API without any robustness support like libva) leave the
> +robustness handling entirely to the userspace driver. There is no strong
> +community consensus on what the userspace driver should do in that case,
> +since all reasonable approaches have some clear downsides.
> +
> +OpenGL
> +~~~~~~
> +
> +Apps using OpenGL should use the available robust interfaces, like the
> +extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). This
> +interface tells if a reset has happened, and if so, all the context state is
> +considered lost and the app proceeds by creating new ones. There's no consensus
> +on what to do to if robustness is not in use.
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
> +the first place. DRM devices should make use of devcoredump to store relevant
> +information about the reset, so this information can be added to user bug
> +reports.
> +
>   .. _drm_driver_ioctl:
>   
>   IOCTL Support on Device Nodes

