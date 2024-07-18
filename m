Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F0934B68
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7F910E707;
	Thu, 18 Jul 2024 10:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z6A98cz+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD4310E030
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 10:00:34 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-4f2f39829a9so267174e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721296833; x=1721901633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M8rxLnL1/ZBBcqIXYNDAEdacIhoiDUKyiW14lHy/sPY=;
 b=z6A98cz+vdw1ccGQp8ZlmWFIG9Un9DtfXan0j5Qxc0L7ouLfgHFgIfW8K1YdmBQ5JX
 OPHOcqzrMTkPHQuNpjet8PsK2BcI5g17bNx9B2yLpV7bOuXD2xQzAsjZoXCf956X8XyJ
 wdsvtgPd+2FgB04ZYjMDzwLgR16dO+aI0sFbyHHaPR9HJ9iYMtuRrFxcJDgWf/XTmBex
 X3MjPhICqPxrnhi3MeIqj7fuGhKazmP1mpKA7MutOZuMp4tqoHtbdr+Heawc9/0Cfq3h
 ECYkwuIIEaJ3wAdYi5g2n8uU0oZxD3sDkDBHujRulGin3bbxkWFKHxdEtjYAFz9ROTCD
 /Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721296833; x=1721901633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8rxLnL1/ZBBcqIXYNDAEdacIhoiDUKyiW14lHy/sPY=;
 b=GcmM7FMGMb+z7Hlao4wdwqJEkO2CqGuQvOwkUfL68QmsxT3aVTVXDnzbAN40kB5Dbz
 QEPLIOG1YTA/coVWklV2+0mkZ+jAESZGrano4F4AqKhwA6R6yXL3yW77u4jWEIbJ2PYi
 0jwMWV4iBsHjnmQ1JoYTG880k8SydmE4GraUbFQYv8l9fzrN/llGTBWwCxl+Cu7uU7wu
 dDAcRnfNUWgp+LWv5UK9Wgnb+97LuoypSix9ORU6VdzrLlNecRDDZDQh7UiAPfllMfKj
 P10+iyskrODdVH/6vfOeZRDbM6XTk8Axdq3mAARz7F/G8PP4ye8JQUrIO3K9UkeCbqjG
 Y6bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcLZWri/RuvdGo9BPL2eEgMEF+WmXYKEpG2nN3IX/7yvDgnjJXDnC8khGG9gZ4pTIgGeSJo/3wFq7aQ84gxNOUY9bTB69sAeEOp7SYPFX7
X-Gm-Message-State: AOJu0YyLBJGWKtAA5G0choZlBOvILK+zJktuCJ0a91KQ7WZpKAn88nSX
 LtyuFPzhwV1+HBTQ2xtWLgF340I7hR1X3KPL6rFr2gG7MWA3h2T2qrBEZsozPQj4JHTuHMEMk82
 XTC3a5Ka46g4DRfjEoeS773/KD7CyB7JK+rx82Q==
X-Google-Smtp-Source: AGHT+IFIvveE9+hwc5fI8Gm5gVQl0mC2NeEDpF93k0AHQdtX5YlfWQmHyGpNH53iq8RyOj9bqhAuN02rDxmieuEzWT4=
X-Received: by 2002:a05:6102:2c8d:b0:48f:e683:7b46 with SMTP id
 ada2fe7eead31-4915976d01fmr5598002137.3.1721296833133; Thu, 18 Jul 2024
 03:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
 <bdf39b00-b889-42d2-ba07-4e2881fe9105@quicinc.com>
 <fsoczpwh4za37yavm5wau7n2ie2eemu4aux5xh3jubjfshlceu@4h7nfmi2qe2t>
In-Reply-To: <fsoczpwh4za37yavm5wau7n2ie2eemu4aux5xh3jubjfshlceu@4h7nfmi2qe2t>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 18 Jul 2024 15:30:21 +0530
Message-ID: <CAFA6WYPveNBhghBJGgxYFSj+WyQysXh8a_8VmhyqFqTeEhkmKg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 17 Jul 2024 at 18:01, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Adding TEE mailing list and maintainers to the CC list.

Thanks. I am not going to reiterate what Jens said in the other thread
but going to cover some additional points.

>
> Amirreza, please include them in future even if you are not going to use
> the framework.
>
>
> On Wed, Jul 10, 2024 at 09:16:48AM GMT, Amirreza Zarrabi wrote:
> >
> >
> > On 7/3/2024 9:36 PM, Dmitry Baryshkov wrote:
> > > On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:
> > >> Qualcomm TEE hosts Trusted Applications (TAs) and services that run =
in
> > >> the secure world. Access to these resources is provided using MinkIP=
C.
> > >> MinkIPC is a capability-based synchronous message passing facility. =
It
> > >> allows code executing in one domain to invoke objects running in oth=
er
> > >> domains. When a process holds a reference to an object that lives in
> > >> another domain, that object reference is a capability. Capabilities
> > >> allow us to separate implementation of policies from implementation =
of
> > >> the transport.
> > >>
> > >> As part of the upstreaming of the object invoke driver (called SMC-I=
nvoke
> > >> driver), we need to provide a reasonable kernel API and UAPI. The cl=
ear
> > >> option is to use TEE subsystem and write a back-end driver, however =
the
> > >> TEE subsystem doesn't fit with the design of Qualcomm TEE.
> > >>
> >
> > To answer your "general comment", maybe a bit of background :).
> >
> > Traditionally, policy enforcement is based on access-control models,
> > either (1) access-control list or (2) capability [0]. A capability is a=
n
> > opaque ("non-forge-able") object reference that grants the holder the
> > right to perform certain operations on the object (e.g. Read, Write,
> > Execute, or Grant). Capabilities are preferred mechanism for representi=
ng
> > a policy, due to their fine-grained representation of access right, inl=
ine
> > with
> >   (P1) the principle of least privilege [1], and
> >   (P2) the ability to avoid the confused deputy problem [2].
> >
> > [0] Jack B. Dennis and Earl C. Van Horn. 1966. Programming Semantics fo=
r
> > Multiprogrammed Computations. Commun. ACM 9 (1966), 143=E2=80=93155.
> >
> > [1] Jerome H. Saltzer and Michael D. Schroeder. 1975. The Protection of
> > Information in Computer Systems. Proc. IEEE 63 (1975), 1278=E2=80=93130=
8.
> >
> > [2] Norm Hardy. 1988. The Confused Deputy (or Why Capabilities Might Ha=
ve
> > Been Invented). ACM Operating Systems Review 22, 4 (1988), 36=E2=80=933=
8.
> >
> > For MinkIPC, an object represents a TEE or TA service. The reference to
> > the object is the "handle" that is returned from TEE (let's call it
> > TEE-Handle). The supported operations are "service invocation" (similar
> > to Execute), and "sharing access to a service" (similar to Grant).
> > Anyone with access to the TEE-Handle can invoke the service or pass the
> > TEE-Handle to someone else to access the same service.
> >
> > The responsibility of the MinkIPC framework is to hide the TEE-Handle,
> > so that the client can not forge it, and allow the owner of the handle
> > to transfer it to other clients as it wishes. Using a file descriptor
> > table we can achieve that. We wrap the TEE-Handle as a FD and let the
> > client invoke FD (e.g. using IOCTL), or transfer the FD (e.g. using
> > UNIX socket).
> >
> > As a side note, for the sake of completeness, capabilities are fundamen=
tally
> > a "discretionary mechanism", as the holder of the object reference has =
the
> > ability to share it with others. A secure system requires "mandatory
> > enforcement" (i.e. ability to revoke authority and ability to control
> > the authority propagation). This is out of scope for the MinkIPC.
> > MinkIPC is only interested in P1 and P2 (mention above).
> >
> >
> > >> Does TEE subsystem fit requirements of a capability based system?

Just to make things clear, first you should have involved TEE
subsystem maintainers to discuss QTEE requirements and see how we can
evolve the TEE subsystem rather than complaining about the opposite.
What happens if another proprietary TEE implementation comes up to
reuse this capability based system as you have described for QTEE? The
reason we have a generic TEE subsystem is to allow common
functionality to be reused within the kernel to interface with
different TEE implementations.

> > >> -----------------------------------------------------------------
> > >> In TEE subsystem, to invoke a function:
> > >>    - client should open a device file "/dev/teeX",
> > >>    - create a session with a TA, and
> > >>    - invoke the functions in that session.
> > >>
> > >> 1. The privilege to invoke a function is determined by a session. If=
 a
> > >>    client has a session, it cannot share it with other clients. Even=
 if
> > >> it does, it is not fine-grained enough, i.e. either all accessible
> > >> functions/resources in a session or none. Assume a scenario when a c=
lient
> > >> wants to grant a permission to invoke just a function that it has th=
e rights,
> > >> to another client.
> > >>
> > >> The "all or nothing" for sharing sessions is not in line with our
> > >> capability system: "if you own a capability, you should be able to g=
rant
> > >> or share it".
> > >
> > > Can you please be more specific here? What kind of sharing is expecte=
d
> > > on the user side of it?
> >
> > In MinkIPC, after authenticating a client credential, a TA (or TEE) may
> > return multiple TEE-Handles, each representing a service that the clien=
t
> > has privilege to access. The client should be able to "individually"
> > reference each TEE-Handle, e.g. to invoke and share it (as per capabili=
ty-
> > based system requirements).
> >
> > If we use TEE subsystem, which has a session based design, all TEE-Hand=
les
> > are meaningful with respect to the session in which they are allocated,
> > hence the use of "__u32 session" in "struct tee_ioctl_invoke_arg".
> >
> > Here, we have a contradiction with MinkIPC. We may ignore the session
> > and say "even though a TEE-Handle is allocated in a session but it is a=
lso
> > valid outside a session", i.e. the session-id in TEE uapi becomes redun=
dant
> > (a case of divergence from definition).
> >

First of all, we need an open source reference user-space
implementation to better understand how these capabilities are going
to be used in real world use-cases. Is there any enforcement done from
the kernel side or it's purely a user-space concept?

> > >
> > >> 2. In TEE subsystem, resources are managed in a context. Every time =
a
> > >>    client opens "/dev/teeX", a new context is created to keep track =
of
> > >> the allocated resources, including opened sessions and remote object=
s. Any
> > >> effort for sharing resources between two independent clients require=
s
> > >> involvement of context manager, i.e. the back-end driver. This requi=
res
> > >> implementing some form of policy in the back-end driver.
> > >
> > > What kind of resource sharing?
> >
> > TEE subsystem "rightfully" allocates a context each time a client opens
> > a device file. This context pass around to the backend driver to identi=
fy
> > independent clients that opened the device file.
> >
> > The context is used by backend driver to keep track of the resources. T=
ype
> > of resources are TEE driver dependent. As an example of resource in TEE
> > subsystem, you can look into 'shm' register and unregister (specially,
> > see comment in function 'shm_alloc_helper').
> >
> > For MinkIPC, all clients are treated the same and the TEE-Handles are
> > representative of the resources, accessible "globally" if a client has =
the
> > capability for them. In kernel, clients access an object if they have
> > access to "qcom_tee_object", in userspace, clients access an object if
> > they have the FD wrapper for the TEE-Handle.
> >
> > If we use context, instead of the file descriptor table, any form of ob=
ject
> > transfer requires involvement of the backend driver. If we use the file
> > descriptor table, contexts are becoming useless for MinkIPC (i.e.
> > 'ctx->data' will "always" be null).

From purely user-space perspective, the TEE context is really a file
descriptor only corresponding to "/dev/teeX". It really depends on the
TEE backend driver if they want to tie up some TEE context or not.

> >
> > >
> > >> 3. The TEE subsystem supports two type of memory sharing:
> > >>    - per-device memory pools, and
> > >>    - user defined memory references.
> > >> User defined memory references are private to the application and ca=
nnot
> > >> be shared. Memory allocated from per-device "shared" pools are acces=
sible
> > >> using a file descriptor. It can be mapped by any process if it has
> > >> access to it. This means, we cannot provide the resource isolation
> > >> between two clients. Assume a scenario when a client wants to alloca=
te a
> > >> memory (which is shared with TEE) from an "isolated" pool and share =
it
> > >> with another client, without the right to access the contents of mem=
ory.
> > >
> > > This doesn't explain, why would it want to share such memory with
> > > another client.
> >
> > Ok, I believe there is a misunderstanding here. I did not try to justif=
y
> > specific usecase. We want to separate the memory allocation from the
> > framework. This way, how the memory is obtained, e.g. it is allocated
> > (1) from an isolated pool, (2) a shared pool, (3) a secure heap,
> > (4) a system dma-heap, (5) process address space, or (6) other memory
> > with "different constraints", becomes independent.
> >
> > We introduced "memory object" type. User implements a kernel service
> > using "qcom_tee_object" to represent the memory object. We have an
> > implementation of memory objects based on dma-buf.
> >

I would really like to see use-cases for integration of dma-buf with
TEE subsystem. You can see earlier attempt here [1] but without an
upstream implementation of secure heap we can't land it upstream.

[1] https://lkml.org/lkml/2022/8/12/544

> > >
> > >> 4. The kernel API provided by TEE subsystem does not support a kerne=
l
> > >>    supplicant. Adding support requires an execution context (e.g. a
> > >> kernel thread) due to the TEE subsystem design. tee_driver_ops suppo=
rts
> > >> only "send" and "receive" callbacks and to deliver a request, someon=
e
> > >> should wait on "receive".
> > >
> > > There is nothing wrong here, but maybe I'm misunderstanding something=
.
> >
> > I agree. But, I am trying to re-emphasize how useful TEE subsystem is
> > for MinkIPC. For kernel services, we solely rely on the backend driver.
> > For instance, to expose RPMB service we will use "qcom_tee_object".
> > So there is nothing provided by the framework to simplify the service
> > development.
> >

OP-TEE has a similar requirement to access RPMB as a kernel supplicant
service [1]. Like I said above there is nothing stopping us to extend
TEE subsystem with common parts like RPMB kernel service to be reused
among backend drivers.

[2] https://lore.kernel.org/lkml/20240527121340.3931987-1-jens.wiklander@li=
naro.org/T/

> > >
> > >> We need a callback to "dispatch" or "handle" a request in the contex=
t of
> > >> the client thread. It should redirect a request to a kernel service =
or
> > >> a user supplicant. In TEE subsystem such requirement should be imple=
mented
> > >> in TEE back-end driver, independent from the TEE subsystem.
> > >>
> > >> 5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
> > >>    interface. This interface is not suitable for a capability system=
.

Have a look at how Trusted Services TEE implementation [3] (non GPTEE
compliant) works nicely with TEE subsystem.

[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/tee/ts-tee.rst

> > >> For instance, there is no session in a capability system which means
> > >> either its should not be used, or we should overload its definition.
> > >
> > > General comment: maybe adding more detailed explanation of how the
> > > capabilities are aquired and how they can be used might make sense.
> > >
> > > BTW. It might be my imperfect English, but each time I see the word
> > > 'capability' I'm thinking that some is capable of doing something. I
> > > find it hard to use 'capability' for the reference to another object.
> > >
> >
> > Explained at the top :).
> >
> > >>
> > >> Can we use TEE subsystem?
> > >> -------------------------
> > >> There are workarounds for some of the issues above. The question is =
if we
> > >> should define our own UAPI or try to use a hack-y way of fitting int=
o
> > >> the TEE subsystem. I am using word hack-y, as most of the workaround
> > >> involves:
> > >>
> > >> - "diverging from the definition". For instance, ignoring the sessio=
n
> > >>   open and close ioctl calls or use file descriptors for all remote
> > >> resources (as, fd is the closet to capability) which undermines the
> > >> isolation provided by the contexts,
> > >>
> > >> - "overloading the variables". For instance, passing object ID as fi=
le
> > >>   descriptors in a place of session ID, or
> > >>
> > >> - "bypass TEE subsystem". For instance, extensively rely on meta
> > >>   parameters or push everything (e.g. kernel services) to the back-e=
nd
> > >> driver, which means leaving almost all TEE subsystem unused.
> > >>
> > >> We cannot take the full benefits of TEE subsystem and may need to
> > >> implement most of the requirements in the back-end driver. Also, as
> > >> discussed above, the UAPI is not suitable for capability-based use c=
ases.
> > >> We proposed a new set of ioctl calls for SMC-Invoke driver.
> > >>

Please work constructively to evolve TEE subsystem. There is no
specific definition here for TEE subsystem but rather it provides a
generic user-space interface for clients to interact with underlying
TEE implementation.

> > >> In this series we posted three patches. We implemented a transport
> > >> driver that provides qcom_tee_object. Any object on secure side is
> > >> represented with an instance of qcom_tee_object and any struct expos=
ed
> > >> to TEE should embed an instance of qcom_tee_object. Any, support for=
 new
> > >> services, e.g. memory object, RPMB, userspace clients or supplicants=
 are
> > >> implemented independently from the driver.

Why do we want to implement a separate platform driver for each of
them when a single DT node is sufficient to tell presence of QTEE? It
looks like an improper use of DT nodes.

> > >>
> > >> We have a simple memory object and a user driver that uses
> > >> qcom_tee_object.
> > >
> > > Could you please point out any user for the uAPI? I'd like to underst=
and
> > > how does it from from the userspace point of view.
> >
> > Sure :), I'll write up a test patch and send it in next series.
> >
> > Summary.
> >
> > TEE framework provides some nice facilities, including:
> >   - uapi and ioctl interface,
> >   - marshaling parameters and context management,
> >   - memory mapping and sharing, and
> >   - TEE bus and TA drivers.
> >
> > For, MinkIPC, we will not use any of them. The only usable piece, is ua=
pi
> > interface which is not suitable for MinkIPC, as discussed above.

Don't you want to support kernel clients to access QTEE services? I
already see an example related to UEFI runtime variables access [4] as
there wasn't a QTEE driver upstream to support that.

[4] drivers/firmware/qcom/qcom_qseecom_uefisecapp.c

-Sumit

> >
> > >
> > >>
> > >> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> > >> ---
> > >> Amirreza Zarrabi (3):
> > >>       firmware: qcom: implement object invoke support
> > >>       firmware: qcom: implement memory object support for TEE
> > >>       firmware: qcom: implement ioctl for TEE object invocation
> > >>
> > >>  drivers/firmware/qcom/Kconfig                      |   36 +
> > >>  drivers/firmware/qcom/Makefile                     |    2 +
> > >>  drivers/firmware/qcom/qcom_object_invoke/Makefile  |   12 +
> > >>  drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
> > >>  drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 +++++++++=
+++++++++
> > >>  drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 +++
> > >>  .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
> > >>  .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
> > >>  .../qcom/qcom_object_invoke/xts/mem_object.c       |  406 +++++++
> > >>  .../qcom_object_invoke/xts/object_invoke_uapi.c    | 1231 +++++++++=
+++++++++++
> > >>  include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
> > >>  include/uapi/misc/qcom_tee.h                       |  117 ++
> > >>  12 files changed, 3616 insertions(+)
> > >> ---
> > >> base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
> > >> change-id: 20240702-qcom-tee-object-and-ioctls-6f52fde03485
> > >>
> > >> Best regards,
> > >> --
> > >> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> > >>
> > >
>
> --
> With best wishes
> Dmitry
