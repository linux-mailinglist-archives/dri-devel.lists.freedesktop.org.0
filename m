Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808C925E71
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 13:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023B910E289;
	Wed,  3 Jul 2024 11:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UAp1i7Qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DA210E289
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 11:36:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52e9b9fb3dcso71488e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720006614; x=1720611414; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a9lv0dNph4VIX6fjDIPL0Am9pZ9pFj6rkqPcBPNXsWI=;
 b=UAp1i7Qw5FhUxsw2SMlDPzisXrz13MhxIJoq3bNdQWQdOhROAlLC3rvUqb6xzltc61
 4xWH8X1da8wVbdc4cITMCsdDDUCW5+K2JoA4jXzxB2wegRDol+5+JLAeUxSofCCHA/h7
 eTWta9izsUrGiJx0UYOgNGTbG5N54ph+YeQrk2RvmJ3AYJORpD6/l1vPqyOqWHLw4cFL
 ADaZ9Pcndwmsh8US9+Lkm1LP2YaqaOfYAmbIdbePIAVk/PnrRtLRg0QGIveRS3Gh+OGB
 hzfFMkS8sXIjQvfvVgzyqQ3j+khKXT9kva/FhfjGKzNe9MxbOiU143eksENFpJHdvY3K
 xlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720006614; x=1720611414;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9lv0dNph4VIX6fjDIPL0Am9pZ9pFj6rkqPcBPNXsWI=;
 b=FkhUhU0vTEv1a6FWQU58ypGg5L3jIHA2IUYSTtLa4i/uQbTqLhQGAysesbCFo/a8kB
 N9zHinOyBOgTS5aH9hfiU9cZQXeC3y1MLUnDR7PznFg0iVR6+x4fbAXh336hLPsyBEZX
 t9vHOemnud/pRdTUpRHDCXhgWVQTw1gGUNYR5UUGizlgq/m0KWI6IUoX2m3X1yOeVvX0
 OGgQev6kYqJgtSGh/HzuT0vDtJAK1sEJWBvdu/RsdbFViRGAnKwhvHN4KjSZrTJv9hyF
 FwtNXr86C6S5QqXailtaS/jw/RngjTaPeVjHtfEtwV63aBBs5Jk7BZkiLWkQ5hWLxIIr
 HOKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnGsA4UB7y7nPN7Rvc2+evY+F9kpQ4zv4ooK4FgbkVvGZ0fBEScQ/8u4U4dYydg9OZlLYjcRwp1+VA8e3O1FAy+B/J+2Z7GEgA+DjBsOhA
X-Gm-Message-State: AOJu0Yy5TmhSbRhdKV9S3ZzYeWZc4q07bLG8FLd7Lu7N0R1mFy6zYvNS
 zLRtja2XVbrhydT705XD6TFY8ckcP8fZ+Mha/vhfrCwlPRx8HaglqMdPmEd8WfU=
X-Google-Smtp-Source: AGHT+IHq5miROCNaH4d32J0OpMAkkQ6y4cLs6SwoFlGLh4VJCgygoze+j6b1zp7HswtTjkNXT++ySg==
X-Received: by 2002:a05:6512:3f5:b0:52e:8018:279b with SMTP id
 2adb3069b0e04-52e82747e45mr4620335e87.69.1720006614203; 
 Wed, 03 Jul 2024 04:36:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e96d6be30sm207314e87.306.2024.07.03.04.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 04:36:53 -0700 (PDT)
Date: Wed, 3 Jul 2024 14:36:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
Message-ID: <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:
> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
> the secure world. Access to these resources is provided using MinkIPC.
> MinkIPC is a capability-based synchronous message passing facility. It
> allows code executing in one domain to invoke objects running in other
> domains. When a process holds a reference to an object that lives in
> another domain, that object reference is a capability. Capabilities
> allow us to separate implementation of policies from implementation of
> the transport.
> 
> As part of the upstreaming of the object invoke driver (called SMC-Invoke
> driver), we need to provide a reasonable kernel API and UAPI. The clear
> option is to use TEE subsystem and write a back-end driver, however the
> TEE subsystem doesn't fit with the design of Qualcomm TEE.
> 
> Does TEE subsystem fit requirements of a capability based system?
> -----------------------------------------------------------------
> In TEE subsystem, to invoke a function:
>    - client should open a device file "/dev/teeX",
>    - create a session with a TA, and
>    - invoke the functions in that session.
> 
> 1. The privilege to invoke a function is determined by a session. If a
>    client has a session, it cannot share it with other clients. Even if
> it does, it is not fine-grained enough, i.e. either all accessible
> functions/resources in a session or none. Assume a scenario when a client
> wants to grant a permission to invoke just a function that it has the rights,
> to another client.
> 
> The "all or nothing" for sharing sessions is not in line with our
> capability system: "if you own a capability, you should be able to grant
> or share it".

Can you please be more specific here? What kind of sharing is expected
on the user side of it?

> 2. In TEE subsystem, resources are managed in a context. Every time a
>    client opens "/dev/teeX", a new context is created to keep track of
> the allocated resources, including opened sessions and remote objects. Any
> effort for sharing resources between two independent clients requires
> involvement of context manager, i.e. the back-end driver. This requires
> implementing some form of policy in the back-end driver.

What kind of resource sharing?

> 3. The TEE subsystem supports two type of memory sharing:
>    - per-device memory pools, and
>    - user defined memory references.
> User defined memory references are private to the application and cannot
> be shared. Memory allocated from per-device "shared" pools are accessible
> using a file descriptor. It can be mapped by any process if it has
> access to it. This means, we cannot provide the resource isolation
> between two clients. Assume a scenario when a client wants to allocate a
> memory (which is shared with TEE) from an "isolated" pool and share it
> with another client, without the right to access the contents of memory.

This doesn't explain, why would it want to share such memory with
another client.

> 4. The kernel API provided by TEE subsystem does not support a kernel
>    supplicant. Adding support requires an execution context (e.g. a
> kernel thread) due to the TEE subsystem design. tee_driver_ops supports
> only "send" and "receive" callbacks and to deliver a request, someone
> should wait on "receive".

There is nothing wrong here, but maybe I'm misunderstanding something.

> We need a callback to "dispatch" or "handle" a request in the context of
> the client thread. It should redirect a request to a kernel service or
> a user supplicant. In TEE subsystem such requirement should be implemented
> in TEE back-end driver, independent from the TEE subsystem.
> 
> 5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
>    interface. This interface is not suitable for a capability system.
> For instance, there is no session in a capability system which means
> either its should not be used, or we should overload its definition.

General comment: maybe adding more detailed explanation of how the
capabilities are aquired and how they can be used might make sense.

BTW. It might be my imperfect English, but each time I see the word
'capability' I'm thinking that some is capable of doing something. I
find it hard to use 'capability' for the reference to another object.

> 
> Can we use TEE subsystem?
> -------------------------
> There are workarounds for some of the issues above. The question is if we
> should define our own UAPI or try to use a hack-y way of fitting into
> the TEE subsystem. I am using word hack-y, as most of the workaround
> involves:
> 
> - "diverging from the definition". For instance, ignoring the session
>   open and close ioctl calls or use file descriptors for all remote
> resources (as, fd is the closet to capability) which undermines the
> isolation provided by the contexts,
> 
> - "overloading the variables". For instance, passing object ID as file
>   descriptors in a place of session ID, or
> 
> - "bypass TEE subsystem". For instance, extensively rely on meta
>   parameters or push everything (e.g. kernel services) to the back-end
> driver, which means leaving almost all TEE subsystem unused.
> 
> We cannot take the full benefits of TEE subsystem and may need to
> implement most of the requirements in the back-end driver. Also, as
> discussed above, the UAPI is not suitable for capability-based use cases.
> We proposed a new set of ioctl calls for SMC-Invoke driver.
> 
> In this series we posted three patches. We implemented a transport
> driver that provides qcom_tee_object. Any object on secure side is
> represented with an instance of qcom_tee_object and any struct exposed
> to TEE should embed an instance of qcom_tee_object. Any, support for new
> services, e.g. memory object, RPMB, userspace clients or supplicants are
> implemented independently from the driver.
> 
> We have a simple memory object and a user driver that uses
> qcom_tee_object.

Could you please point out any user for the uAPI? I'd like to understand
how does it from from the userspace point of view.

> 
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
> Amirreza Zarrabi (3):
>       firmware: qcom: implement object invoke support
>       firmware: qcom: implement memory object support for TEE
>       firmware: qcom: implement ioctl for TEE object invocation
> 
>  drivers/firmware/qcom/Kconfig                      |   36 +
>  drivers/firmware/qcom/Makefile                     |    2 +
>  drivers/firmware/qcom/qcom_object_invoke/Makefile  |   12 +
>  drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
>  drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 +++
>  .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
>  .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
>  .../qcom/qcom_object_invoke/xts/mem_object.c       |  406 +++++++
>  .../qcom_object_invoke/xts/object_invoke_uapi.c    | 1231 ++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
>  include/uapi/misc/qcom_tee.h                       |  117 ++
>  12 files changed, 3616 insertions(+)
> ---
> base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
> change-id: 20240702-qcom-tee-object-and-ioctls-6f52fde03485
> 
> Best regards,
> -- 
> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> 

-- 
With best wishes
Dmitry
