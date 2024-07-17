Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B44933CFB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 14:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079710EAC9;
	Wed, 17 Jul 2024 12:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TZYuLSYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571BF10EAC7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 12:31:14 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52ed9b802ceso3133484e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721219472; x=1721824272; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uKB7J3EgQwLanq/ra1h9qD1kCuQgzSw+53rKAv+Afxg=;
 b=TZYuLSYQTE9JT+UdSmR0+fn+c41gnN02zs3CvLJbsVLy1p7kroU4P8WIIqk/Itbgta
 1joFvuj+rDX6ueW96DEqo4EXcQj7SZjiTntDF2EtzLsOENbw32SvOFQdzOqmKWMdDWCc
 7vvnm3+9y8h4iTL0Mb0I39kPcTKrY+vvJB68GbMttMUuzhwd5vqUt/moCPifv4kDJjOp
 NnEz/el/kySb9oAmG7XDL4Po5t5jaEVgz4BONLUc4sSs53/r7BYOMsKZL+KJDjlU8ELF
 o7QFGQrPsq8aL3O4g8tt4SYAqFjYcQNQr9+tgHmjQlMLuHhjOelKXzYYSXrBYBRlh8cc
 Qfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721219472; x=1721824272;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uKB7J3EgQwLanq/ra1h9qD1kCuQgzSw+53rKAv+Afxg=;
 b=jTV1OustS+7SgpKy6WbLLAUEZINQynkdQtPVkSYqJ1Ifp9RLI6V2rQ3O+m9hmudgQg
 0dtH+2WNJq6oxP0+g/y17TFQsVbipOsPu8URbaSzM5BjO5L24qDMx3zz8zpHJ0+K+yZ2
 HpC5wper7VM8hKL1aVWycGEIN0d/6pa6QjLioKfPA6n9XzcAkijD3IHMsWePytniVm6v
 5qjsVv+VHDltk/Bm0yZmEYwh27xukxXcVdd17vV7hSYpAUVX721kCw1qFFTXg60KGQbc
 5uA4d9m58O4qA70TyixMRnwCwlbmFDg6vx6KE0LS+/ifgAPflFDkL2d4BmfGdL99rDnN
 xUHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUHnbMwLJFpO8s0tkZ+LQDWWNnBokxk5opkrUgVP9gq3wUN77vLqXeKNLMnFoN24HG33GlNaTP5ARUCNMOgRPFS3WvwdmkW/iVde+YYOlv
X-Gm-Message-State: AOJu0Yy38W1sc6uvLodhDV2WUnkD16LQBHChlOTgZ4VOhyR3LAqlpixh
 EPxCC76CCTVhahyDwDP8sGWlFi+2hW9MP903qGXLpGT53PvztMR6Rn8jFOnQGrm2FfyXhl05/TI
 S
X-Google-Smtp-Source: AGHT+IFwMtxiQlhQk53dEYwEmoxgj8+4UWm2/FiqXl2cYGNlf0Z/0jwfvGOU4LPWFM22Oegtp4EHrw==
X-Received: by 2002:a05:6512:690:b0:52c:e086:7953 with SMTP id
 2adb3069b0e04-52ee539c939mr1394484e87.4.1721219472042; 
 Wed, 17 Jul 2024 05:31:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24f5938sm1459877e87.117.2024.07.17.05.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 05:31:11 -0700 (PDT)
Date: Wed, 17 Jul 2024 15:31:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>, 
 Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
Message-ID: <fsoczpwh4za37yavm5wau7n2ie2eemu4aux5xh3jubjfshlceu@4h7nfmi2qe2t>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
 <bdf39b00-b889-42d2-ba07-4e2881fe9105@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdf39b00-b889-42d2-ba07-4e2881fe9105@quicinc.com>
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

Adding TEE mailing list and maintainers to the CC list.

Amirreza, please include them in future even if you are not going to use
the framework.


On Wed, Jul 10, 2024 at 09:16:48AM GMT, Amirreza Zarrabi wrote:
> 
> 
> On 7/3/2024 9:36 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:
> >> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
> >> the secure world. Access to these resources is provided using MinkIPC.
> >> MinkIPC is a capability-based synchronous message passing facility. It
> >> allows code executing in one domain to invoke objects running in other
> >> domains. When a process holds a reference to an object that lives in
> >> another domain, that object reference is a capability. Capabilities
> >> allow us to separate implementation of policies from implementation of
> >> the transport.
> >>
> >> As part of the upstreaming of the object invoke driver (called SMC-Invoke
> >> driver), we need to provide a reasonable kernel API and UAPI. The clear
> >> option is to use TEE subsystem and write a back-end driver, however the
> >> TEE subsystem doesn't fit with the design of Qualcomm TEE.
> >>
> 
> To answer your "general comment", maybe a bit of background :).
> 
> Traditionally, policy enforcement is based on access-control models,
> either (1) access-control list or (2) capability [0]. A capability is an
> opaque ("non-forge-able") object reference that grants the holder the
> right to perform certain operations on the object (e.g. Read, Write,
> Execute, or Grant). Capabilities are preferred mechanism for representing
> a policy, due to their fine-grained representation of access right, inline
> with
>   (P1) the principle of least privilege [1], and
>   (P2) the ability to avoid the confused deputy problem [2].
> 
> [0] Jack B. Dennis and Earl C. Van Horn. 1966. Programming Semantics for
> Multiprogrammed Computations. Commun. ACM 9 (1966), 143–155.
> 
> [1] Jerome H. Saltzer and Michael D. Schroeder. 1975. The Protection of
> Information in Computer Systems. Proc. IEEE 63 (1975), 1278–1308.
> 
> [2] Norm Hardy. 1988. The Confused Deputy (or Why Capabilities Might Have
> Been Invented). ACM Operating Systems Review 22, 4 (1988), 36–38.
> 
> For MinkIPC, an object represents a TEE or TA service. The reference to
> the object is the "handle" that is returned from TEE (let's call it
> TEE-Handle). The supported operations are "service invocation" (similar
> to Execute), and "sharing access to a service" (similar to Grant).
> Anyone with access to the TEE-Handle can invoke the service or pass the
> TEE-Handle to someone else to access the same service.
> 
> The responsibility of the MinkIPC framework is to hide the TEE-Handle,
> so that the client can not forge it, and allow the owner of the handle
> to transfer it to other clients as it wishes. Using a file descriptor
> table we can achieve that. We wrap the TEE-Handle as a FD and let the
> client invoke FD (e.g. using IOCTL), or transfer the FD (e.g. using
> UNIX socket).
> 
> As a side note, for the sake of completeness, capabilities are fundamentally
> a "discretionary mechanism", as the holder of the object reference has the
> ability to share it with others. A secure system requires "mandatory
> enforcement" (i.e. ability to revoke authority and ability to control
> the authority propagation). This is out of scope for the MinkIPC.
> MinkIPC is only interested in P1 and P2 (mention above).
> 
> 
> >> Does TEE subsystem fit requirements of a capability based system?
> >> -----------------------------------------------------------------
> >> In TEE subsystem, to invoke a function:
> >>    - client should open a device file "/dev/teeX",
> >>    - create a session with a TA, and
> >>    - invoke the functions in that session.
> >>
> >> 1. The privilege to invoke a function is determined by a session. If a
> >>    client has a session, it cannot share it with other clients. Even if
> >> it does, it is not fine-grained enough, i.e. either all accessible
> >> functions/resources in a session or none. Assume a scenario when a client
> >> wants to grant a permission to invoke just a function that it has the rights,
> >> to another client.
> >>
> >> The "all or nothing" for sharing sessions is not in line with our
> >> capability system: "if you own a capability, you should be able to grant
> >> or share it".
> > 
> > Can you please be more specific here? What kind of sharing is expected
> > on the user side of it?
> 
> In MinkIPC, after authenticating a client credential, a TA (or TEE) may
> return multiple TEE-Handles, each representing a service that the client
> has privilege to access. The client should be able to "individually"
> reference each TEE-Handle, e.g. to invoke and share it (as per capability-
> based system requirements).
> 
> If we use TEE subsystem, which has a session based design, all TEE-Handles
> are meaningful with respect to the session in which they are allocated,
> hence the use of "__u32 session" in "struct tee_ioctl_invoke_arg".
> 
> Here, we have a contradiction with MinkIPC. We may ignore the session
> and say "even though a TEE-Handle is allocated in a session but it is also
> valid outside a session", i.e. the session-id in TEE uapi becomes redundant
> (a case of divergence from definition).
> 
> > 
> >> 2. In TEE subsystem, resources are managed in a context. Every time a
> >>    client opens "/dev/teeX", a new context is created to keep track of
> >> the allocated resources, including opened sessions and remote objects. Any
> >> effort for sharing resources between two independent clients requires
> >> involvement of context manager, i.e. the back-end driver. This requires
> >> implementing some form of policy in the back-end driver.
> > 
> > What kind of resource sharing?
> 
> TEE subsystem "rightfully" allocates a context each time a client opens
> a device file. This context pass around to the backend driver to identify
> independent clients that opened the device file.
> 
> The context is used by backend driver to keep track of the resources. Type
> of resources are TEE driver dependent. As an example of resource in TEE
> subsystem, you can look into 'shm' register and unregister (specially,
> see comment in function 'shm_alloc_helper').
> 
> For MinkIPC, all clients are treated the same and the TEE-Handles are
> representative of the resources, accessible "globally" if a client has the
> capability for them. In kernel, clients access an object if they have
> access to "qcom_tee_object", in userspace, clients access an object if
> they have the FD wrapper for the TEE-Handle.
> 
> If we use context, instead of the file descriptor table, any form of object
> transfer requires involvement of the backend driver. If we use the file
> descriptor table, contexts are becoming useless for MinkIPC (i.e.
> 'ctx->data' will "always" be null).
> 
> > 
> >> 3. The TEE subsystem supports two type of memory sharing:
> >>    - per-device memory pools, and
> >>    - user defined memory references.
> >> User defined memory references are private to the application and cannot
> >> be shared. Memory allocated from per-device "shared" pools are accessible
> >> using a file descriptor. It can be mapped by any process if it has
> >> access to it. This means, we cannot provide the resource isolation
> >> between two clients. Assume a scenario when a client wants to allocate a
> >> memory (which is shared with TEE) from an "isolated" pool and share it
> >> with another client, without the right to access the contents of memory.
> > 
> > This doesn't explain, why would it want to share such memory with
> > another client.
> 
> Ok, I believe there is a misunderstanding here. I did not try to justify
> specific usecase. We want to separate the memory allocation from the
> framework. This way, how the memory is obtained, e.g. it is allocated
> (1) from an isolated pool, (2) a shared pool, (3) a secure heap,
> (4) a system dma-heap, (5) process address space, or (6) other memory
> with "different constraints", becomes independent.
> 
> We introduced "memory object" type. User implements a kernel service
> using "qcom_tee_object" to represent the memory object. We have an
> implementation of memory objects based on dma-buf.
> 
> > 
> >> 4. The kernel API provided by TEE subsystem does not support a kernel
> >>    supplicant. Adding support requires an execution context (e.g. a
> >> kernel thread) due to the TEE subsystem design. tee_driver_ops supports
> >> only "send" and "receive" callbacks and to deliver a request, someone
> >> should wait on "receive".
> > 
> > There is nothing wrong here, but maybe I'm misunderstanding something.
> 
> I agree. But, I am trying to re-emphasize how useful TEE subsystem is
> for MinkIPC. For kernel services, we solely rely on the backend driver.
> For instance, to expose RPMB service we will use "qcom_tee_object".
> So there is nothing provided by the framework to simplify the service
> development.
> 
> > 
> >> We need a callback to "dispatch" or "handle" a request in the context of
> >> the client thread. It should redirect a request to a kernel service or
> >> a user supplicant. In TEE subsystem such requirement should be implemented
> >> in TEE back-end driver, independent from the TEE subsystem.
> >>
> >> 5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
> >>    interface. This interface is not suitable for a capability system.
> >> For instance, there is no session in a capability system which means
> >> either its should not be used, or we should overload its definition.
> > 
> > General comment: maybe adding more detailed explanation of how the
> > capabilities are aquired and how they can be used might make sense.
> > 
> > BTW. It might be my imperfect English, but each time I see the word
> > 'capability' I'm thinking that some is capable of doing something. I
> > find it hard to use 'capability' for the reference to another object.
> > 
> 
> Explained at the top :).
> 
> >>
> >> Can we use TEE subsystem?
> >> -------------------------
> >> There are workarounds for some of the issues above. The question is if we
> >> should define our own UAPI or try to use a hack-y way of fitting into
> >> the TEE subsystem. I am using word hack-y, as most of the workaround
> >> involves:
> >>
> >> - "diverging from the definition". For instance, ignoring the session
> >>   open and close ioctl calls or use file descriptors for all remote
> >> resources (as, fd is the closet to capability) which undermines the
> >> isolation provided by the contexts,
> >>
> >> - "overloading the variables". For instance, passing object ID as file
> >>   descriptors in a place of session ID, or
> >>
> >> - "bypass TEE subsystem". For instance, extensively rely on meta
> >>   parameters or push everything (e.g. kernel services) to the back-end
> >> driver, which means leaving almost all TEE subsystem unused.
> >>
> >> We cannot take the full benefits of TEE subsystem and may need to
> >> implement most of the requirements in the back-end driver. Also, as
> >> discussed above, the UAPI is not suitable for capability-based use cases.
> >> We proposed a new set of ioctl calls for SMC-Invoke driver.
> >>
> >> In this series we posted three patches. We implemented a transport
> >> driver that provides qcom_tee_object. Any object on secure side is
> >> represented with an instance of qcom_tee_object and any struct exposed
> >> to TEE should embed an instance of qcom_tee_object. Any, support for new
> >> services, e.g. memory object, RPMB, userspace clients or supplicants are
> >> implemented independently from the driver.
> >>
> >> We have a simple memory object and a user driver that uses
> >> qcom_tee_object.
> > 
> > Could you please point out any user for the uAPI? I'd like to understand
> > how does it from from the userspace point of view.
> 
> Sure :), I'll write up a test patch and send it in next series.
> 
> Summary.
> 
> TEE framework provides some nice facilities, including:
>   - uapi and ioctl interface,
>   - marshaling parameters and context management,
>   - memory mapping and sharing, and
>   - TEE bus and TA drivers.
> 
> For, MinkIPC, we will not use any of them. The only usable piece, is uapi
> interface which is not suitable for MinkIPC, as discussed above.
> 
> > 
> >>
> >> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> >> ---
> >> Amirreza Zarrabi (3):
> >>       firmware: qcom: implement object invoke support
> >>       firmware: qcom: implement memory object support for TEE
> >>       firmware: qcom: implement ioctl for TEE object invocation
> >>
> >>  drivers/firmware/qcom/Kconfig                      |   36 +
> >>  drivers/firmware/qcom/Makefile                     |    2 +
> >>  drivers/firmware/qcom/qcom_object_invoke/Makefile  |   12 +
> >>  drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
> >>  drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++
> >>  drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 +++
> >>  .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
> >>  .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
> >>  .../qcom/qcom_object_invoke/xts/mem_object.c       |  406 +++++++
> >>  .../qcom_object_invoke/xts/object_invoke_uapi.c    | 1231 ++++++++++++++++++++
> >>  include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
> >>  include/uapi/misc/qcom_tee.h                       |  117 ++
> >>  12 files changed, 3616 insertions(+)
> >> ---
> >> base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
> >> change-id: 20240702-qcom-tee-object-and-ioctls-6f52fde03485
> >>
> >> Best regards,
> >> -- 
> >> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> >>
> > 

-- 
With best wishes
Dmitry
