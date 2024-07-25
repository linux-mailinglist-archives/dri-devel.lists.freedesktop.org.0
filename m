Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45A93BA6F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 03:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DD6896E9;
	Thu, 25 Jul 2024 01:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fmVDvExA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809E4896E9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 01:55:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46OJCPK9014505;
 Thu, 25 Jul 2024 01:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z9QYchTIAD7uXBOvBTuiNNHwODwdNvOWyTtv4xpfQHw=; b=fmVDvExAZiZ4R7B8
 58Gb2SeN0fBPrUko/ElzdoxchDGkyXoQ+HWfPBvPeMVK6gDPtjm79DjiUwKSKaw5
 44FogawEl3slTZcXi6HQ3Ih04/dtq0GqJpJE2n4tKOrQ0XQ+QN6uVSwSXI5v12pn
 qekYur5ehDfstY9Qe11EflgOvdzBCIsy3Wr29WwRP55vK261/7ajJkxBz6jmd4mz
 ZT6b16U6CKRpnUYlCiEmNzyeXQZO0FKPkg4OgjsieG0q5BED1+aUXTIUtxhVT/CC
 1Wodxh7dYCLIWZ1ODcyiwfF0SMD/oDsf85qLMOu+ssVUUtSbGRv6sTFGgHomaVaB
 MgMWgQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40jxxbhyrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2024 01:55:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46P1tllq030051
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2024 01:55:47 GMT
Received: from [10.4.85.8] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Jul
 2024 18:55:44 -0700
Message-ID: <37b6ba2d-6c3b-448e-be2c-8922ee1ae68a@quicinc.com>
Date: Thu, 25 Jul 2024 11:55:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
 Sumit Garg <sumit.garg@linaro.org>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
 <bdf39b00-b889-42d2-ba07-4e2881fe9105@quicinc.com>
 <CAHUa44FXT6VREMUkNsY943EfhFoMSEsWKb5vyx9SwOERXitDbw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHUa44FXT6VREMUkNsY943EfhFoMSEsWKb5vyx9SwOERXitDbw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ffex5ax52QQ3jbG6NUv2ulz2KdzoMe_L
X-Proofpoint-GUID: Ffex5ax52QQ3jbG6NUv2ulz2KdzoMe_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_27,2024-07-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250011
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



On 7/18/2024 12:52 AM, Jens Wiklander wrote:
> Hi,
> 
> On Wed, Jul 10, 2024 at 1:17 AM Amirreza Zarrabi
> <quic_azarrabi@quicinc.com> wrote:
>>
>>
>>
>> On 7/3/2024 9:36 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:
>>>> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
>>>> the secure world. Access to these resources is provided using MinkIPC.
>>>> MinkIPC is a capability-based synchronous message passing facility. It
>>>> allows code executing in one domain to invoke objects running in other
>>>> domains. When a process holds a reference to an object that lives in
>>>> another domain, that object reference is a capability. Capabilities
>>>> allow us to separate implementation of policies from implementation of
>>>> the transport.
>>>>
>>>> As part of the upstreaming of the object invoke driver (called SMC-Invoke
>>>> driver), we need to provide a reasonable kernel API and UAPI. The clear
>>>> option is to use TEE subsystem and write a back-end driver, however the
>>>> TEE subsystem doesn't fit with the design of Qualcomm TEE.
>>>>
>>
>> To answer your "general comment", maybe a bit of background :).
>>
>> Traditionally, policy enforcement is based on access-control models,
>> either (1) access-control list or (2) capability [0]. A capability is an
>> opaque ("non-forge-able") object reference that grants the holder the
>> right to perform certain operations on the object (e.g. Read, Write,
>> Execute, or Grant). Capabilities are preferred mechanism for representing
>> a policy, due to their fine-grained representation of access right, inline
>> with
>>   (P1) the principle of least privilege [1], and
>>   (P2) the ability to avoid the confused deputy problem [2].
>>
>> [0] Jack B. Dennis and Earl C. Van Horn. 1966. Programming Semantics for
>> Multiprogrammed Computations. Commun. ACM 9 (1966), 143–155.
>>
>> [1] Jerome H. Saltzer and Michael D. Schroeder. 1975. The Protection of
>> Information in Computer Systems. Proc. IEEE 63 (1975), 1278–1308.
>>
>> [2] Norm Hardy. 1988. The Confused Deputy (or Why Capabilities Might Have
>> Been Invented). ACM Operating Systems Review 22, 4 (1988), 36–38.
>>
>> For MinkIPC, an object represents a TEE or TA service. The reference to
>> the object is the "handle" that is returned from TEE (let's call it
>> TEE-Handle). The supported operations are "service invocation" (similar
>> to Execute), and "sharing access to a service" (similar to Grant).
>> Anyone with access to the TEE-Handle can invoke the service or pass the
>> TEE-Handle to someone else to access the same service.
>>
>> The responsibility of the MinkIPC framework is to hide the TEE-Handle,
>> so that the client can not forge it, and allow the owner of the handle
>> to transfer it to other clients as it wishes. Using a file descriptor
>> table we can achieve that. We wrap the TEE-Handle as a FD and let the
>> client invoke FD (e.g. using IOCTL), or transfer the FD (e.g. using
>> UNIX socket).
>>
>> As a side note, for the sake of completeness, capabilities are fundamentally
>> a "discretionary mechanism", as the holder of the object reference has the
>> ability to share it with others. A secure system requires "mandatory
>> enforcement" (i.e. ability to revoke authority and ability to control
>> the authority propagation). This is out of scope for the MinkIPC.
>> MinkIPC is only interested in P1 and P2 (mention above).
> 
> This is still quite abstract. We have tried to avoid inventing yet
> another IPC mechanism in the TEE subsystem. But that's not written in
> stone if it turns out there's a use case that needs it.
> 

Ack.

>>
>>
>>>> Does TEE subsystem fit requirements of a capability based system?
>>>> -----------------------------------------------------------------
>>>> In TEE subsystem, to invoke a function:
>>>>    - client should open a device file "/dev/teeX",
>>>>    - create a session with a TA, and
>>>>    - invoke the functions in that session.
>>>>
>>>> 1. The privilege to invoke a function is determined by a session. If a
>>>>    client has a session, it cannot share it with other clients. Even if
>>>> it does, it is not fine-grained enough, i.e. either all accessible
>>>> functions/resources in a session or none. Assume a scenario when a client
>>>> wants to grant a permission to invoke just a function that it has the rights,
>>>> to another client.
>>>>
>>>> The "all or nothing" for sharing sessions is not in line with our
>>>> capability system: "if you own a capability, you should be able to grant
>>>> or share it".
>>>
>>> Can you please be more specific here? What kind of sharing is expected
>>> on the user side of it?
>>
>> In MinkIPC, after authenticating a client credential, a TA (or TEE) may
>> return multiple TEE-Handles, each representing a service that the client
>> has privilege to access. The client should be able to "individually"
>> reference each TEE-Handle, e.g. to invoke and share it (as per capability-
>> based system requirements).
>>
>> If we use TEE subsystem, which has a session based design, all TEE-Handles
>> are meaningful with respect to the session in which they are allocated,
>> hence the use of "__u32 session" in "struct tee_ioctl_invoke_arg".
>>
>> Here, we have a contradiction with MinkIPC. We may ignore the session
>> and say "even though a TEE-Handle is allocated in a session but it is also
>> valid outside a session", i.e. the session-id in TEE uapi becomes redundant
>> (a case of divergence from definition).
> 
> Only the backend drivers put a meaning to a session, the TEE subsystem
> doesn't enforce anything. All fields but num_params and params in
> struct tee_ioctl_invoke_arg are only interpreted by the backend driver
> if I recall correctly. Using the fields for something completely
> different would be confusing so if struct tee_ioctl_invoke_arg isn't
> matching well enough we might need a new IOCTL for whatever you have
> in mind.
>

That's right.

Nice. Assuming there is option for some additions ;), what do you think about

(1) support for a buffer without actual memory sharing with TEE.
    TEE subsystem provides very nice memory sharing utilities. We are missing
    support for sending __user addresses to backend driver so it can sent it to
    TEE, however it sees fit, e.g. copying to an existing shared memory used by
    the underlying transport.

    + What if we add TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT/OUPUT?

(2) support to pass more generic form of service identification.
    Currently, we use (session_id + fun_id) to identify the service, what we need
    is (object_id + fun_id). It is just a name, but it has a greater side effect.
    session_id, implies that (a) the user should call TEE_IOC_OPEN_SESSION
    first, and (b) call to TEE_IOC_INVOKE can not generate a session_id, or
    (c) TEE_IOC_SUPPL_RECV can not return a session_id from TEE.

    With object_id, we do not put a requirement on how we get the id,
    e.g. a call to TEE_IOC_INVOKE may return an object_id or object_id may actually
    represent a resource in kernel rather than TEE (e.g. dma_buf, so you should be
    able to pass an FD as object_id).

    + What if we add IEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT?

    Finally, we need an IOCTL to invoke the object.
    
    + What if we add TEE_IOC_OBJECT_INVOKE which accept (object_id + fun_id)? 

    PS - Just a suggestion, as object_id can be anything, we can use TEE_IOC_OBJECT_INVOKE
         for any future improvement. So for instance, to prepare a dma_buf for TEE, we
         can invoke it, and the TEE back-end driver will map it, and register it with TEE
         subsystem (if needed) rather than introducing new IOCTL + struct every
         time, for each new feature.


>>
>>>
>>>> 2. In TEE subsystem, resources are managed in a context. Every time a
>>>>    client opens "/dev/teeX", a new context is created to keep track of
>>>> the allocated resources, including opened sessions and remote objects. Any
>>>> effort for sharing resources between two independent clients requires
>>>> involvement of context manager, i.e. the back-end driver. This requires
>>>> implementing some form of policy in the back-end driver.
>>>
>>> What kind of resource sharing?
>>
>> TEE subsystem "rightfully" allocates a context each time a client opens
>> a device file. This context pass around to the backend driver to identify
>> independent clients that opened the device file.
>>
>> The context is used by backend driver to keep track of the resources. Type
>> of resources are TEE driver dependent. As an example of resource in TEE
>> subsystem, you can look into 'shm' register and unregister (specially,
>> see comment in function 'shm_alloc_helper').
>>
>> For MinkIPC, all clients are treated the same and the TEE-Handles are
>> representative of the resources, accessible "globally" if a client has the
>> capability for them. In kernel, clients access an object if they have
>> access to "qcom_tee_object", in userspace, clients access an object if
>> they have the FD wrapper for the TEE-Handle.
> 
> So if a client has a file descriptor representing a TEE-Handle, then
> it has the capability to access a TEE-object? Is the kernel
> controlling anything more about these capabilities?
> 

Yes. Having an FD means the process is capable of invoking the object.
The only thing kernel does is just wrapping the TEE-Handles in a FD, and
converting the IOCTL calls on the FD to TEE calls.

>>
>> If we use context, instead of the file descriptor table, any form of object
>> transfer requires involvement of the backend driver. If we use the file
>> descriptor table, contexts are becoming useless for MinkIPC (i.e.
>> 'ctx->data' will "always" be null).
> 
> You still need to open a device to be able to create TEE-handles.

Not really, only for the first FD.

When opened, it returns an FD which wraps a static object in TEE (let's call it root object).
The root_fd is used for initiating the connection with other TEE services.

So the steps are like:
  (1) open /dev/tee to get the root_fd
  (2) env_fd = IOCTL(root_fd, credentials);
  (3) TA_fd = IOCTL(env_fd, LOAD_TA)
  (4) ...

In theory, you should be able to pass env_fd to another process, i.e. sharing
your identity, or pass TA_fd to another process, i.e. share a service.

So, here is the issue, if we expose object trough FDs, in practice we do not need to
use IOCTL on the FD we get by opening the device. Therefore, the contexts remain
unused and we directly land in the back-end driver.

PS - Assuming we do the above improvement to the TEE subsystem IOCTL, we should be able
     to wrap TEE-Handle as FD and pass them as object_id to userspace if we sharing is
     requested for an object.

> 
>>
>>>
>>>> 3. The TEE subsystem supports two type of memory sharing:
>>>>    - per-device memory pools, and
>>>>    - user defined memory references.
>>>> User defined memory references are private to the application and cannot
>>>> be shared. Memory allocated from per-device "shared" pools are accessible
>>>> using a file descriptor. It can be mapped by any process if it has
>>>> access to it. This means, we cannot provide the resource isolation
>>>> between two clients. Assume a scenario when a client wants to allocate a
>>>> memory (which is shared with TEE) from an "isolated" pool and share it
>>>> with another client, without the right to access the contents of memory.
>>>
>>> This doesn't explain, why would it want to share such memory with
>>> another client.
>>
>> Ok, I believe there is a misunderstanding here. I did not try to justify
>> specific usecase. We want to separate the memory allocation from the
>> framework. This way, how the memory is obtained, e.g. it is allocated
>> (1) from an isolated pool, (2) a shared pool, (3) a secure heap,
>> (4) a system dma-heap, (5) process address space, or (6) other memory
>> with "different constraints", becomes independent.
> 
> Especially points 3 and 4 are of great interest for the TEE Subsystem.

Ack.

> 
>>
>> We introduced "memory object" type. User implements a kernel service
>> using "qcom_tee_object" to represent the memory object. We have an
>> implementation of memory objects based on dma-buf.
> 
> Do you have an idea of what it would take to extend to TEE subsystem
> to cover this?

I am a bit hesitate to put dma-buf handling directly into the TEE subsystem
(maybe I am wrong :)). For instance, dma-but can have scatterlist, or single
entries, or even it must be from specific heap, registered in specific way.
Each may need support from back-end driver, i.e. the dma-buf should be passed
to the back-end driver.

If we have a support for IEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT, we can pass
dma_buf directly to the back-end to process.

> 
>>
>>>
>>>> 4. The kernel API provided by TEE subsystem does not support a kernel
>>>>    supplicant. Adding support requires an execution context (e.g. a
>>>> kernel thread) due to the TEE subsystem design. tee_driver_ops supports
>>>> only "send" and "receive" callbacks and to deliver a request, someone
>>>> should wait on "receive".
> 
> So far we haven't needed a kernel thread, but if you need one feel
> free to propose something.
> 
>>>
>>> There is nothing wrong here, but maybe I'm misunderstanding something.
>>
>> I agree. But, I am trying to re-emphasize how useful TEE subsystem is
>> for MinkIPC. For kernel services, we solely rely on the backend driver.
>> For instance, to expose RPMB service we will use "qcom_tee_object".
>> So there is nothing provided by the framework to simplify the service
>> development.
> 
> The same is true for all backend drivers.

Ack.

> 
>>
>>>
>>>> We need a callback to "dispatch" or "handle" a request in the context of
>>>> the client thread. It should redirect a request to a kernel service or
>>>> a user supplicant. In TEE subsystem such requirement should be implemented
>>>> in TEE back-end driver, independent from the TEE subsystem.
>>>>
>>>> 5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
>>>>    interface. This interface is not suitable for a capability system.
>>>> For instance, there is no session in a capability system which means
>>>> either its should not be used, or we should overload its definition.
> 
> Not using the session field doesn't seem like such a big obstacle.
> Overloading it for something different might be messy. We can add a
> new IOCTL if needed as I mentioned above.
> 

Ack. Responded above.

>>>
>>> General comment: maybe adding more detailed explanation of how the
>>> capabilities are aquired and how they can be used might make sense.
>>>
>>> BTW. It might be my imperfect English, but each time I see the word
>>> 'capability' I'm thinking that some is capable of doing something. I
>>> find it hard to use 'capability' for the reference to another object.
>>>
>>
>> Explained at the top :).
>>
>>>>
>>>> Can we use TEE subsystem?
>>>> -------------------------
>>>> There are workarounds for some of the issues above. The question is if we
>>>> should define our own UAPI or try to use a hack-y way of fitting into
>>>> the TEE subsystem. I am using word hack-y, as most of the workaround
>>>> involves:
> 
> Instead of hack-y workarounds, we should consider extending the TEE
> subsystem as needed.

Ack. :)

> 
>>>>
>>>> - "diverging from the definition". For instance, ignoring the session
>>>>   open and close ioctl calls or use file descriptors for all remote
>>>> resources (as, fd is the closet to capability) which undermines the
>>>> isolation provided by the contexts,
>>>>
>>>> - "overloading the variables". For instance, passing object ID as file
>>>>   descriptors in a place of session ID, or
> 
> struct qcom_tee_object_invoke_arg and struct tee_ioctl_invoke_arg are
> quite similar, there are only a few more fields in the latter and we
> are missing a TEE_IOCTL_PARAM_ATTR_TYPE_OBJECT. Does it make sense to
> have a direction on objects?

Almost, we can have direction on how object is moving around, e.g. an object
can be passed to TEE (i.e. INPUT), or received from TEE (i.e. OUTPUT). But when
invoked, an object can be used to pass other objects to/from TEE.

> 
>>>>
>>>> - "bypass TEE subsystem". For instance, extensively rely on meta
>>>>   parameters or push everything (e.g. kernel services) to the back-end
>>>> driver, which means leaving almost all TEE subsystem unused.
> 
> The TEE subsystem is largely "bypassed" by all backend drivers, with
> the exception of some SHM handling.
> 
> I'm sure the TEE subsystem can be extended to handle the "common" part
> of SHM handling needed by QTEE.

Ack. 

> 
>>>>
>>>> We cannot take the full benefits of TEE subsystem and may need to
>>>> implement most of the requirements in the back-end driver. Also, as
>>>> discussed above, the UAPI is not suitable for capability-based use cases.
>>>> We proposed a new set of ioctl calls for SMC-Invoke driver.
>>>>
>>>> In this series we posted three patches. We implemented a transport
>>>> driver that provides qcom_tee_object. Any object on secure side is
>>>> represented with an instance of qcom_tee_object and any struct exposed
>>>> to TEE should embed an instance of qcom_tee_object. Any, support for new
>>>> services, e.g. memory object, RPMB, userspace clients or supplicants are
>>>> implemented independently from the driver.
>>>>
>>>> We have a simple memory object and a user driver that uses
>>>> qcom_tee_object.
>>>
>>> Could you please point out any user for the uAPI? I'd like to understand
>>> how does it from from the userspace point of view.
>>
>> Sure :), I'll write up a test patch and send it in next series.
>>
>> Summary.
>>
>> TEE framework provides some nice facilities, including:
>>   - uapi and ioctl interface,
>>   - marshaling parameters and context management,
>>   - memory mapping and sharing, and
>>   - TEE bus and TA drivers.
>>
>> For, MinkIPC, we will not use any of them. The only usable piece, is uapi
>> interface which is not suitable for MinkIPC, as discussed above.
> 
> I hope that we can change that.  :-)
> For instance, extending the TEE subsystem with the memory-sharing QTEE
> needs could be useful for other TEE drivers.

Thank you so much Jens for comment :).

Best Regards,
Amir

> 
> Cheers,
> Jens
