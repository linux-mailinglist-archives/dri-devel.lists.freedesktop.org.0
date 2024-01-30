Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B981841E2C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 09:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEFF112E57;
	Tue, 30 Jan 2024 08:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DEE112E54;
 Tue, 30 Jan 2024 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706604246; x=1738140246;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=yfDvMsUhir8g8gyK0+E/eHXwm2z7CS74FHT1nf85sk4=;
 b=e9i4BduFmhgvbriXMaaFkX+NipE0CN9krNF5DQNh3HIYC6/xfaZkiQ9B
 Ng4ncpHIDd5UPzDEJflYT/ZhrOunOLfdhx4vvGin4eOqdBYuNlZRPbuvM
 LYDL92ic6egrgf/OaEEP4JpeffmIFkSjc46OZvic2w6Cn1TQMVc7SRX+i
 9J26WXpq2r92UFeoSCPxqmGsBPZCk8sRRHr+LA5KfOmbhlyUlzCCAxFGm
 nY3VR/EoU5c6mlA5nvsg54YDsGRXJoU4dNRajrgSjvSOsFK9I3wGi6v4j
 6RdV35ezDo89Js3DLPblKebtM1K0d4feJWBSLiEuN7BCvKXhZKef7Ptcf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10600440"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208,217";a="10600440"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 00:43:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="788123409"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
 d="scan'208,217";a="788123409"
Received: from skofoed-mobl.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 00:43:42 -0800
Content-Type: multipart/alternative;
 boundary="------------8O74dTRKH1fPtg0IGRtTacGx"
Message-ID: <884bcf1e-39c6-401f-88e4-8c001eaf8466@linux.intel.com>
Date: Tue, 30 Jan 2024 09:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ccf34f6a-d704-43de-a15e-2ae2890f9381@amd.com>
 <ZbKpWpOGuNKLJ6sA@phenom.ffwll.local>
 <7834e2fbe8052717a4e0fa44feafa544b1fedaa0.camel@linux.intel.com>
 <851e3ddb-6c74-4ec5-8d05-df12b34eb2b4@amd.com>
 <SA1PR11MB69919C19A16C007A6B01FC9E92782@SA1PR11MB6991.namprd11.prod.outlook.com>
 <5aca8bdc-1243-40e6-90dc-ece80a093a5b@amd.com>
 <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------8O74dTRKH1fPtg0IGRtTacGx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Oak,

On 1/30/24 01:21, Zeng, Oak wrote:
>
> The example you used to prove that KFD is a design failure, is against 
> *any* design which utilize system allocator and hmm. The way that one 
> proxy process running on host to handle many guest processes, doesn’t 
> fit into the concept of “share address space b/t cpu and gpu”. The 
> shared address space has to be within one process. Your proxy process 
> represent many guest processes. It is a fundamental conflict.
>
> Also your userptr proposal does’t solve this problem either:
>
> Imagine you have guest process1 mapping CPU address range A…B to GPU 
> address range C…D
>
> And you have guest process 2 mapping CPU address range A…B to GPU 
> address range C…D, since process 1 and 2 are two different process, it 
> is legal for process 2 to do the exact same mapping.
>
> Now when gpu shader access address C…D, a gpu page fault happens, what 
> does your proxy process do? Which guest process will this fault be 
> directed to and handled? Except you have extra information/API to tell 
> proxy process and GPU HW, there is no way to figure out.
>
> Compared to the shared virtual address space concept of HMM, the 
> userptr design is nothing new except it allows CPU and GPU to use 
> different address to access the same object. If you replace above C…D 
> with A…B, above description becomes a description of the “problem” of 
> HMM/shared virtual address design.
>
> Both design has the same difficulty with your example of the special 
> virtualization environment setup.
>
> As said, we spent effort scoped the userptr solution some time ago. 
> The problem we found enabling userptr with migration were:
>
>  1. The user interface of userptr is not as convenient as system
>     allocator. With the userptr solution, user need to call
>     userptr_ioctl and vm_bind for *every* single cpu pointer that he
>     want to use in a gpu program. While with system allocator,
>     programmer just use any cpu pointer directly in gpu program
>     without any extra driver ioctls.
>
No, the augmented userptr (lets call it "hmmptr" to distinguish here) 
would typically only be bound once when the VM is created. It's just a 
different way to expose the whole SVM mapping to user-space. It's 
sparsely populated and is not backed by a bo, and it is per-device so 
UMD would have to replicate the SVM setup and attribute settings on each 
device.

> 1.
>
>
>  2. We don’t see the real benefit of using a different Gpu address C…D
>     than the A..B, except you can prove my above reasoning is wrong.
>     In most use cases, you can make GPU C…D == CPU A…B, why bother then?
>  3. Looked into implementation details, since hmm fundamentally assume
>     a shared virtual address space b/t cpu and device, for the userptr
>     solution to leverage hmm, you need perform address space
>     conversion every time you calls into hmm functions.
>
I think very much focus lands on the A..B -> C..D mapping in the 
discussion. It's just an added flexibility with little or no 
implementation cost. Although I must admit I'm not fully clear about the 
actual use-case. In a para-virtualized environment like virGL or 
vmware's vmx/renderers I could imagine C..D being the guest virtual 
addresses including compute kernel pointers, A..B being the host 
renderer's CPU virtual addresses. (Host creates the VM's, and then this 
translation is needed. I'm not sure para-virtualized SVM exists ATM, but 
forcing A==C, B==D in the uAPI would rule out such a beast in the future?)

/Thomas


> 1.
>
>
>
> In summary, GPU device is just a piece of HW to accelerate your CPU 
> program. If HW allows, it is more convenient to use shared address 
> space b/t cpu and GPU. On old HW (example, no gpu page fault support, 
> or gpu only has a very limited address space), we can disable system 
> allocator/SVM. If you use different address space on modern GPU, why 
> don’t you use different address space on different CPU cores?
>
> Regards,
>
> Oak
>
> *From:*dri-devel <dri-devel-bounces@lists.freedesktop.org> *On Behalf 
> Of *Christian König
> *Sent:* Monday, January 29, 2024 5:20 AM
> *To:* Zeng, Oak <oak.zeng@intel.com>; Thomas Hellström 
> <thomas.hellstrom@linux.intel.com>; Daniel Vetter <daniel@ffwll.ch>; 
> Dave Airlie <airlied@redhat.com>
> *Cc:* Brost, Matthew <matthew.brost@intel.com>; Felix Kuehling 
> <felix.kuehling@amd.com>; Welty, Brian <brian.welty@intel.com>; 
> dri-devel@lists.freedesktop.org; Ghimiray, Himal Prasad 
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah 
> <krishnaiah.bommu@intel.com>; Gupta, saurabhg 
> <saurabhg.gupta@intel.com>; Vishwanathapura, Niranjana 
> <niranjana.vishwanathapura@intel.com>; intel-xe@lists.freedesktop.org; 
> Danilo Krummrich <dakr@redhat.com>
> *Subject:* Re: Making drm_gpuvm work across gpu devices
>
> Well Daniel and Dave noted it as well, so I'm just repeating it: Your 
> design choices are not an argument to get something upstream.
>
> It's the job of the maintainers and at the end of the Linus to judge 
> of something is acceptable or not.
>
> As far as I can see a good part of this this idea has been exercised 
> lengthy with KFD and it turned out to not be the best approach.
>
> So from what I've seen the design you outlined is extremely unlikely 
> to go upstream.
>
> Regards,
> Christian.
>
> Am 27.01.24 um 03:21 schrieb Zeng, Oak:
>
>     Regarding the idea of expanding userptr to support migration, we
>     explored this idea long time ago. It provides similar functions of
>     the system allocator but its interface is not as convenient as
>     system allocator. Besides the shared virtual address space,
>     another benefit of a system allocator is, you can offload cpu
>     program to gpu easier, you don’t need to call driver specific API
>     (such as register_userptr and vm_bind in this case) for memory
>     allocation.
>
>     We also scoped the implementation. It turned out to be big, and
>     not as beautiful as hmm. Why we gave up this approach.
>
>     *From:*Christian König <christian.koenig@amd.com>
>     <mailto:christian.koenig@amd.com>
>     *Sent:* Friday, January 26, 2024 7:52 AM
>     *To:* Thomas Hellström <thomas.hellstrom@linux.intel.com>
>     <mailto:thomas.hellstrom@linux.intel.com>; Daniel Vetter
>     <daniel@ffwll.ch> <mailto:daniel@ffwll.ch>
>     *Cc:* Brost, Matthew <matthew.brost@intel.com>
>     <mailto:matthew.brost@intel.com>; Felix Kuehling
>     <felix.kuehling@amd.com> <mailto:felix.kuehling@amd.com>; Welty,
>     Brian <brian.welty@intel.com> <mailto:brian.welty@intel.com>;
>     Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>     <mailto:himal.prasad.ghimiray@intel.com>; Zeng, Oak
>     <oak.zeng@intel.com> <mailto:oak.zeng@intel.com>; Gupta, saurabhg
>     <saurabhg.gupta@intel.com> <mailto:saurabhg.gupta@intel.com>;
>     Danilo Krummrich <dakr@redhat.com> <mailto:dakr@redhat.com>;
>     dri-devel@lists.freedesktop.org
>     <mailto:dri-devel@lists.freedesktop.org>; Bommu, Krishnaiah
>     <krishnaiah.bommu@intel.com> <mailto:krishnaiah.bommu@intel.com>;
>     Dave Airlie <airlied@redhat.com> <mailto:airlied@redhat.com>;
>     Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>     <mailto:niranjana.vishwanathapura@intel.com>;
>     intel-xe@lists.freedesktop.org <mailto:intel-xe@lists.freedesktop.org>
>     *Subject:* Re: Making drm_gpuvm work across gpu devices
>
>     Am 26.01.24 um 09:21 schrieb Thomas Hellström:
>
>
>         Hi, all
>
>           
>
>         On Thu, 2024-01-25 at 19:32 +0100, Daniel Vetter wrote:
>
>             On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:
>
>                 Am 23.01.24 um 20:37 schrieb Zeng, Oak:
>
>                     [SNIP]
>
>                     Yes most API are per device based.
>
>                       
>
>                     One exception I know is actually the kfd SVM API. If you look at
>
>                     the svm_ioctl function, it is per-process based. Each kfd_process
>
>                     represent a process across N gpu devices.
>
>                   
>
>                 Yeah and that was a big mistake in my opinion. We should really not
>
>                 do that
>
>                 ever again.
>
>                   
>
>                     Need to say, kfd SVM represent a shared virtual address space
>
>                     across CPU and all GPU devices on the system. This is by the
>
>                     definition of SVM (shared virtual memory). This is very different
>
>                     from our legacy gpu *device* driver which works for only one
>
>                     device (i.e., if you want one device to access another device's
>
>                     memory, you will have to use dma-buf export/import etc).
>
>                   
>
>                 Exactly that thinking is what we have currently found as blocker
>
>                 for a
>
>                 virtualization projects. Having SVM as device independent feature
>
>                 which
>
>                 somehow ties to the process address space turned out to be an
>
>                 extremely bad
>
>                 idea.
>
>                   
>
>                 The background is that this only works for some use cases but not
>
>                 all of
>
>                 them.
>
>                   
>
>                 What's working much better is to just have a mirror functionality
>
>                 which says
>
>                 that a range A..B of the process address space is mapped into a
>
>                 range C..D
>
>                 of the GPU address space.
>
>                   
>
>                 Those ranges can then be used to implement the SVM feature required
>
>                 for
>
>                 higher level APIs and not something you need at the UAPI or even
>
>                 inside the
>
>                 low level kernel memory management.
>
>                   
>
>                 When you talk about migrating memory to a device you also do this
>
>                 on a per
>
>                 device basis and *not* tied to the process address space. If you
>
>                 then get
>
>                 crappy performance because userspace gave contradicting information
>
>                 where to
>
>                 migrate memory then that's a bug in userspace and not something the
>
>                 kernel
>
>                 should try to prevent somehow.
>
>                   
>
>                 [SNIP]
>
>                         I think if you start using the same drm_gpuvm for multiple
>
>                         devices you
>
>                         will sooner or later start to run into the same mess we have
>
>                         seen with
>
>                         KFD, where we moved more and more functionality from the KFD to
>
>                         the DRM
>
>                         render node because we found that a lot of the stuff simply
>
>                         doesn't work
>
>                         correctly with a single object to maintain the state.
>
>                     As I understand it, KFD is designed to work across devices. A
>
>                     single pseudo /dev/kfd device represent all hardware gpu devices.
>
>                     That is why during kfd open, many pdd (process device data) is
>
>                     created, each for one hardware device for this process.
>
>                   
>
>                 Yes, I'm perfectly aware of that. And I can only repeat myself that
>
>                 I see
>
>                 this design as a rather extreme failure. And I think it's one of
>
>                 the reasons
>
>                 why NVidia is so dominant with Cuda.
>
>                   
>
>                 This whole approach KFD takes was designed with the idea of
>
>                 extending the
>
>                 CPU process into the GPUs, but this idea only works for a few use
>
>                 cases and
>
>                 is not something we should apply to drivers in general.
>
>                   
>
>                 A very good example are virtualization use cases where you end up
>
>                 with CPU
>
>                 address != GPU address because the VAs are actually coming from the
>
>                 guest VM
>
>                 and not the host process.
>
>                   
>
>                 SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should
>
>                 not have
>
>                 any influence on the design of the kernel UAPI.
>
>                   
>
>                 If you want to do something similar as KFD for Xe I think you need
>
>                 to get
>
>                 explicit permission to do this from Dave and Daniel and maybe even
>
>                 Linus.
>
>               
>
>             I think the one and only one exception where an SVM uapi like in kfd
>
>             makes
>
>             sense, is if the _hardware_ itself, not the software stack defined
>
>             semantics that you've happened to build on top of that hw, enforces a
>
>             1:1
>
>             mapping with the cpu process address space.
>
>               
>
>             Which means your hardware is using PASID, IOMMU based translation,
>
>             PCI-ATS
>
>             (address translation services) or whatever your hw calls it and has
>
>             _no_
>
>             device-side pagetables on top. Which from what I've seen all devices
>
>             with
>
>             device-memory have, simply because they need some place to store
>
>             whether
>
>             that memory is currently in device memory or should be translated
>
>             using
>
>             PASID. Currently there's no gpu that works with PASID only, but there
>
>             are
>
>             some on-cpu-die accelerator things that do work like that.
>
>               
>
>             Maybe in the future there will be some accelerators that are fully
>
>             cpu
>
>             cache coherent (including atomics) with something like CXL, and the
>
>             on-device memory is managed as normal system memory with struct page
>
>             as
>
>             ZONE_DEVICE and accelerator va -> physical address translation is
>
>             only
>
>             done with PASID ... but for now I haven't seen that, definitely not
>
>             in
>
>             upstream drivers.
>
>               
>
>             And the moment you have some per-device pagetables or per-device
>
>             memory
>
>             management of some sort (like using gpuva mgr) then I'm 100% agreeing
>
>             with
>
>             Christian that the kfd SVM model is too strict and not a great idea.
>
>               
>
>             Cheers, Sima
>
>           
>
>           
>
>         I'm trying to digest all the comments here, The end goal is to be able
>
>         to support something similar to this here:
>
>           
>
>         https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/
>
>           
>
>         Christian, If I understand you correctly, you're strongly suggesting
>
>         not to try to manage a common virtual address space across different
>
>         devices in the kernel, but merely providing building blocks to do so,
>
>         like for example a generalized userptr with migration support using
>
>         HMM; That way each "mirror" of the CPU mm would be per device and
>
>         inserted into the gpu_vm just like any other gpu_vma, and user-space
>
>         would dictate the A..B -> C..D mapping by choosing the GPU_VA for the
>
>         vma.
>
>
>     Exactly that, yes.
>
>
>
>           
>
>         Sima, it sounds like you're suggesting to shy away from hmm and not
>
>         even attempt to support this except if it can be done using IOMMU sva
>
>         on selected hardware?
>
>
>     I think that comment goes more into the direction of: If you have
>     ATS/ATC/PRI capable hardware which exposes the functionality to
>     make memory reads and writes directly into the address space of
>     the CPU then yes an SVM only interface is ok because the hardware
>     can't do anything else. But as long as you have something like
>     GPUVM then please don't restrict yourself.
>
>     Which I totally agree on as well. The ATS/ATC/PRI combination
>     doesn't allow using separate page tables device and CPU and so
>     also not separate VAs.
>
>     This was one of the reasons why we stopped using this approach for
>     AMD GPUs.
>
>     Regards,
>     Christian.
>
>
>
>         Could you clarify a bit?
>
>           
>
>         Thanks,
>
>         Thomas
>
>           
>
>           
>
>           
>
>           
>
>           
>
>           
>
>           
>
--------------8O74dTRKH1fPtg0IGRtTacGx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi, Oak,<br>
    </p>
    <div class="moz-cite-prefix">On 1/30/24 01:21, Zeng, Oak wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}ol
	{margin-bottom:0cm;}ul
	{margin-bottom:0cm;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">The example you used to prove that KFD is a
          design failure, is against *any* design which utilize system
          allocator and hmm. The way that one proxy process running on
          host to handle many guest processes, doesn’t fit into the
          concept of “share address space b/t cpu and gpu”. The shared
          address space has to be within one process. Your proxy process
          represent many guest processes. It is a fundamental conflict.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Also your userptr proposal does’t solve
          this problem either:<o:p></o:p></p>
        <p class="MsoNormal">Imagine you have guest process1 mapping CPU
          address range A…B to GPU address range C…D<o:p></o:p></p>
        <p class="MsoNormal">And you have guest process 2 mapping CPU
          address range A…B to GPU address range C…D, since process 1
          and 2 are two different process, it is legal for process 2 to
          do the exact same mapping.<o:p></o:p></p>
        <p class="MsoNormal">Now when gpu shader access address C…D, a
          gpu page fault happens, what does your proxy process do? Which
          guest process will this fault be directed to and handled?
          Except you have extra information/API to tell proxy process
          and GPU HW, there is no way to figure out.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Compared to the shared virtual address
          space concept of HMM, the userptr design is nothing new except
          it allows CPU and GPU to use different address to access the
          same object. If you replace above C…D with A…B, above
          description becomes a description of the “problem” of
          HMM/shared virtual address design. <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Both design has the same difficulty with
          your example of the special virtualization environment setup.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">As said, we spent effort scoped the userptr
          solution some time ago. The problem we found enabling userptr
          with migration were:<o:p></o:p></p>
        <ol style="margin-top:0cm" type="1" start="1">
          <li class="MsoListParagraph"
            style="margin-left:0cm;mso-list:l0 level1 lfo1">The user
            interface of userptr is not as convenient as system
            allocator. With the userptr solution, user need to call
            userptr_ioctl and vm_bind for *every* single cpu pointer
            that he want to use in a gpu program. While with system
            allocator, programmer just use any cpu pointer directly in
            gpu program without any extra driver ioctls.</li>
        </ol>
      </div>
    </blockquote>
    <p>No, the augmented userptr (lets call it "hmmptr" to distinguish
      here) would typically only be bound once when the VM is created.
      It's just a different way to expose the whole SVM mapping to
      user-space. It's sparsely populated and is not backed by a bo, and
      it is per-device so UMD would have to replicate the SVM setup and
      attribute settings on each device.<br>
    </p>
    <blockquote type="cite"
cite="mid:SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <ol style="margin-top:0cm" type="1" start="1">
          <li class="MsoListParagraph"
            style="margin-left:0cm;mso-list:l0 level1 lfo1"><o:p></o:p><br>
          </li>
          <li class="MsoListParagraph"
            style="margin-left:0cm;mso-list:l0 level1 lfo1">We don’t see
            the real benefit of using a different Gpu address C…D than
            the A..B, except you can prove my above reasoning is wrong.
            In most use cases, you can make GPU C…D == CPU A…B, why
            bother then?<o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0cm;mso-list:l0 level1 lfo1">Looked into
            implementation details, since hmm fundamentally assume a
            shared virtual address space b/t cpu and device, for the
            userptr solution to leverage hmm, you need perform address
            space conversion every time you calls into hmm functions. </li>
        </ol>
      </div>
    </blockquote>
    <p>I think very much focus lands on the A..B -&gt; C..D mapping in
      the discussion. It's just an added flexibility with little or no
      implementation cost. Although I must admit I'm not fully clear
      about the actual use-case. In a para-virtualized environment like
      virGL or vmware's vmx/renderers I could imagine C..D being the
      guest virtual addresses including compute kernel pointers, A..B
      being the host renderer's CPU virtual addresses. (Host creates the
      VM's, and then this translation is needed. I'm not sure
      para-virtualized SVM exists ATM, but forcing A==C, B==D in the
      uAPI would rule out such a beast in the future?)</p>
    <p>/Thomas</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:SA1PR11MB6991DF41C958CA46DD715E9F927D2@SA1PR11MB6991.namprd11.prod.outlook.com">
      <div class="WordSection1">
        <ol style="margin-top:0cm" type="1" start="1">
          <li class="MsoListParagraph"
            style="margin-left:0cm;mso-list:l0 level1 lfo1"><o:p></o:p><br>
          </li>
        </ol>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">In summary, GPU device is just a piece of
          HW to accelerate your CPU program. If HW allows, it is more
          convenient to use shared address space b/t cpu and GPU. On old
          HW (example, no gpu page fault support, or gpu only has a very
          limited address space), we can disable system allocator/SVM.
          If you use different address space on modern GPU, why don’t
          you use different address space on different CPU cores?<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Regards,<o:p></o:p></p>
        <p class="MsoNormal">Oak<o:p></o:p></p>
        <div
style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
          <div>
            <div
style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
              <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span
                  lang="EN-US"> dri-devel
                  <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel-bounces@lists.freedesktop.org">&lt;dri-devel-bounces@lists.freedesktop.org&gt;</a>
                  <b>On Behalf Of </b>Christian König<br>
                  <b>Sent:</b> Monday, January 29, 2024 5:20 AM<br>
                  <b>To:</b> Zeng, Oak <a class="moz-txt-link-rfc2396E" href="mailto:oak.zeng@intel.com">&lt;oak.zeng@intel.com&gt;</a>;
                  Thomas Hellström
                  <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>; Daniel
                  Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Dave Airlie
                  <a class="moz-txt-link-rfc2396E" href="mailto:airlied@redhat.com">&lt;airlied@redhat.com&gt;</a><br>
                  <b>Cc:</b> Brost, Matthew
                  <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Felix Kuehling
                  <a class="moz-txt-link-rfc2396E" href="mailto:felix.kuehling@amd.com">&lt;felix.kuehling@amd.com&gt;</a>; Welty, Brian
                  <a class="moz-txt-link-rfc2396E" href="mailto:brian.welty@intel.com">&lt;brian.welty@intel.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>; Ghimiray, Himal
                  Prasad <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>; Bommu,
                  Krishnaiah <a class="moz-txt-link-rfc2396E" href="mailto:krishnaiah.bommu@intel.com">&lt;krishnaiah.bommu@intel.com&gt;</a>; Gupta,
                  saurabhg <a class="moz-txt-link-rfc2396E" href="mailto:saurabhg.gupta@intel.com">&lt;saurabhg.gupta@intel.com&gt;</a>;
                  Vishwanathapura, Niranjana
                  <a class="moz-txt-link-rfc2396E" href="mailto:niranjana.vishwanathapura@intel.com">&lt;niranjana.vishwanathapura@intel.com&gt;</a>;
                  <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Danilo Krummrich
                  <a class="moz-txt-link-rfc2396E" href="mailto:dakr@redhat.com">&lt;dakr@redhat.com&gt;</a><br>
                  <b>Subject:</b> Re: Making drm_gpuvm work across gpu
                  devices<o:p></o:p></span></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal" style="margin-bottom:12.0pt">Well Daniel
            and Dave noted it as well, so I'm just repeating it: Your
            design choices are not an argument to get something
            upstream.<br>
            <br>
            It's the job of the maintainers and at the end of the Linus
            to judge of something is acceptable or not.<br>
            <br>
            As far as I can see a good part of this this idea has been
            exercised lengthy with KFD and it turned out to not be the
            best approach.<br>
            <br>
            So from what I've seen the design you outlined is extremely
            unlikely to go upstream.<br>
            <br>
            Regards,<br>
            Christian.<o:p></o:p></p>
          <div>
            <p class="MsoNormal">Am 27.01.24 um 03:21 schrieb Zeng, Oak:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal">Regarding the idea of expanding userptr
              to support migration, we explored this idea long time ago.
              It provides similar functions of the system allocator but
              its interface is not as convenient as system allocator.
              Besides the shared virtual address space, another benefit
              of a system allocator is, you can offload cpu program to
              gpu easier, you don’t need to call driver specific API
              (such as register_userptr and vm_bind in this case) for
              memory allocation.<o:p></o:p></p>
            <p class="MsoNormal"> <o:p></o:p></p>
            <p class="MsoNormal">We also scoped the implementation. It
              turned out to be big, and not as beautiful as hmm. Why we
              gave up this approach.
              <o:p></o:p></p>
            <p class="MsoNormal"> <o:p></o:p></p>
            <div
style="border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm 4.0pt">
              <div>
                <div
style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
                  <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span
                      lang="EN-US"> Christian König
                    </span><a href="mailto:christian.koenig@amd.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;christian.koenig@amd.com&gt;</span></a><span
                      lang="EN-US">
                      <br>
                      <b>Sent:</b> Friday, January 26, 2024 7:52 AM<br>
                      <b>To:</b> Thomas Hellström </span><a
                      href="mailto:thomas.hellstrom@linux.intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;thomas.hellstrom@linux.intel.com&gt;</span></a><span
                      lang="EN-US">; Daniel Vetter
                    </span><a href="mailto:daniel@ffwll.ch"
                      moz-do-not-send="true"><span lang="EN-US">&lt;daniel@ffwll.ch&gt;</span></a><span
                      lang="EN-US"><br>
                      <b>Cc:</b> Brost, Matthew </span><a
                      href="mailto:matthew.brost@intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;matthew.brost@intel.com&gt;</span></a><span
                      lang="EN-US">; Felix Kuehling
                    </span><a href="mailto:felix.kuehling@amd.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;felix.kuehling@amd.com&gt;</span></a><span
                      lang="EN-US">; Welty, Brian
                    </span><a href="mailto:brian.welty@intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;brian.welty@intel.com&gt;</span></a><span
                      lang="EN-US">; Ghimiray, Himal Prasad
                    </span><a
                      href="mailto:himal.prasad.ghimiray@intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;himal.prasad.ghimiray@intel.com&gt;</span></a><span
                      lang="EN-US">; Zeng, Oak
                    </span><a href="mailto:oak.zeng@intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;oak.zeng@intel.com&gt;</span></a><span
                      lang="EN-US">; Gupta, saurabhg
                    </span><a href="mailto:saurabhg.gupta@intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;saurabhg.gupta@intel.com&gt;</span></a><span
                      lang="EN-US">; Danilo Krummrich
                    </span><a href="mailto:dakr@redhat.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;dakr@redhat.com&gt;</span></a><span
                      lang="EN-US">;
                    </span><a
                      href="mailto:dri-devel@lists.freedesktop.org"
                      moz-do-not-send="true"><span lang="EN-US">dri-devel@lists.freedesktop.org</span></a><span
                      lang="EN-US">; Bommu, Krishnaiah
                    </span><a href="mailto:krishnaiah.bommu@intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;krishnaiah.bommu@intel.com&gt;</span></a><span
                      lang="EN-US">; Dave Airlie
                    </span><a href="mailto:airlied@redhat.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;airlied@redhat.com&gt;</span></a><span
                      lang="EN-US">; Vishwanathapura, Niranjana
                    </span><a
                      href="mailto:niranjana.vishwanathapura@intel.com"
                      moz-do-not-send="true"><span lang="EN-US">&lt;niranjana.vishwanathapura@intel.com&gt;</span></a><span
                      lang="EN-US">;
                    </span><a
                      href="mailto:intel-xe@lists.freedesktop.org"
                      moz-do-not-send="true"><span lang="EN-US">intel-xe@lists.freedesktop.org</span></a><span
                      lang="EN-US"><br>
                      <b>Subject:</b> Re: Making drm_gpuvm work across
                      gpu devices</span><o:p></o:p></p>
                </div>
              </div>
              <p class="MsoNormal"> <o:p></o:p></p>
              <p class="MsoNormal">Am 26.01.24 um 09:21 schrieb Thomas
                Hellström:<br>
                <br>
                <br>
                <o:p></o:p></p>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Hi, all<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre>On Thu, 2024-01-25 at 19:32 +0100, Daniel Vetter wrote:<o:p></o:p></pre>
                <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                  <pre>On Wed, Jan 24, 2024 at 09:33:12AM +0100, Christian König wrote:<o:p></o:p></pre>
                  <blockquote
                    style="margin-top:5.0pt;margin-bottom:5.0pt">
                    <pre>Am 23.01.24 um 20:37 schrieb Zeng, Oak:<o:p></o:p></pre>
                    <blockquote
                      style="margin-top:5.0pt;margin-bottom:5.0pt">
                      <pre>[SNIP]<o:p></o:p></pre>
                      <pre>Yes most API are per device based.<o:p></o:p></pre>
                      <pre> <o:p></o:p></pre>
                      <pre>One exception I know is actually the kfd SVM API. If you look at<o:p></o:p></pre>
                      <pre>the svm_ioctl function, it is per-process based. Each kfd_process<o:p></o:p></pre>
                      <pre>represent a process across N gpu devices.<o:p></o:p></pre>
                    </blockquote>
                    <pre> <o:p></o:p></pre>
                    <pre>Yeah and that was a big mistake in my opinion. We should really not<o:p></o:p></pre>
                    <pre>do that<o:p></o:p></pre>
                    <pre>ever again.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <blockquote
                      style="margin-top:5.0pt;margin-bottom:5.0pt">
                      <pre>Need to say, kfd SVM represent a shared virtual address space<o:p></o:p></pre>
                      <pre>across CPU and all GPU devices on the system. This is by the<o:p></o:p></pre>
                      <pre>definition of SVM (shared virtual memory). This is very different<o:p></o:p></pre>
                      <pre>from our legacy gpu *device* driver which works for only one<o:p></o:p></pre>
                      <pre>device (i.e., if you want one device to access another device's<o:p></o:p></pre>
                      <pre>memory, you will have to use dma-buf export/import etc).<o:p></o:p></pre>
                    </blockquote>
                    <pre> <o:p></o:p></pre>
                    <pre>Exactly that thinking is what we have currently found as blocker<o:p></o:p></pre>
                    <pre>for a<o:p></o:p></pre>
                    <pre>virtualization projects. Having SVM as device independent feature<o:p></o:p></pre>
                    <pre>which<o:p></o:p></pre>
                    <pre>somehow ties to the process address space turned out to be an<o:p></o:p></pre>
                    <pre>extremely bad<o:p></o:p></pre>
                    <pre>idea.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>The background is that this only works for some use cases but not<o:p></o:p></pre>
                    <pre>all of<o:p></o:p></pre>
                    <pre>them.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>What's working much better is to just have a mirror functionality<o:p></o:p></pre>
                    <pre>which says<o:p></o:p></pre>
                    <pre>that a range A..B of the process address space is mapped into a<o:p></o:p></pre>
                    <pre>range C..D<o:p></o:p></pre>
                    <pre>of the GPU address space.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>Those ranges can then be used to implement the SVM feature required<o:p></o:p></pre>
                    <pre>for<o:p></o:p></pre>
                    <pre>higher level APIs and not something you need at the UAPI or even<o:p></o:p></pre>
                    <pre>inside the<o:p></o:p></pre>
                    <pre>low level kernel memory management.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>When you talk about migrating memory to a device you also do this<o:p></o:p></pre>
                    <pre>on a per<o:p></o:p></pre>
                    <pre>device basis and *not* tied to the process address space. If you<o:p></o:p></pre>
                    <pre>then get<o:p></o:p></pre>
                    <pre>crappy performance because userspace gave contradicting information<o:p></o:p></pre>
                    <pre>where to<o:p></o:p></pre>
                    <pre>migrate memory then that's a bug in userspace and not something the<o:p></o:p></pre>
                    <pre>kernel<o:p></o:p></pre>
                    <pre>should try to prevent somehow.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>[SNIP]<o:p></o:p></pre>
                    <blockquote
                      style="margin-top:5.0pt;margin-bottom:5.0pt">
                      <blockquote
                        style="margin-top:5.0pt;margin-bottom:5.0pt">
                        <pre>I think if you start using the same drm_gpuvm for multiple<o:p></o:p></pre>
                        <pre>devices you<o:p></o:p></pre>
                        <pre>will sooner or later start to run into the same mess we have<o:p></o:p></pre>
                        <pre>seen with<o:p></o:p></pre>
                        <pre>KFD, where we moved more and more functionality from the KFD to<o:p></o:p></pre>
                        <pre>the DRM<o:p></o:p></pre>
                        <pre>render node because we found that a lot of the stuff simply<o:p></o:p></pre>
                        <pre>doesn't work<o:p></o:p></pre>
                        <pre>correctly with a single object to maintain the state.<o:p></o:p></pre>
                      </blockquote>
                      <pre>As I understand it, KFD is designed to work across devices. A<o:p></o:p></pre>
                      <pre>single pseudo /dev/kfd device represent all hardware gpu devices.<o:p></o:p></pre>
                      <pre>That is why during kfd open, many pdd (process device data) is<o:p></o:p></pre>
                      <pre>created, each for one hardware device for this process.<o:p></o:p></pre>
                    </blockquote>
                    <pre> <o:p></o:p></pre>
                    <pre>Yes, I'm perfectly aware of that. And I can only repeat myself that<o:p></o:p></pre>
                    <pre>I see<o:p></o:p></pre>
                    <pre>this design as a rather extreme failure. And I think it's one of<o:p></o:p></pre>
                    <pre>the reasons<o:p></o:p></pre>
                    <pre>why NVidia is so dominant with Cuda.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>This whole approach KFD takes was designed with the idea of<o:p></o:p></pre>
                    <pre>extending the<o:p></o:p></pre>
                    <pre>CPU process into the GPUs, but this idea only works for a few use<o:p></o:p></pre>
                    <pre>cases and<o:p></o:p></pre>
                    <pre>is not something we should apply to drivers in general.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>A very good example are virtualization use cases where you end up<o:p></o:p></pre>
                    <pre>with CPU<o:p></o:p></pre>
                    <pre>address != GPU address because the VAs are actually coming from the<o:p></o:p></pre>
                    <pre>guest VM<o:p></o:p></pre>
                    <pre>and not the host process.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>SVM is a high level concept of OpenCL, Cuda, ROCm etc.. This should<o:p></o:p></pre>
                    <pre>not have<o:p></o:p></pre>
                    <pre>any influence on the design of the kernel UAPI.<o:p></o:p></pre>
                    <pre> <o:p></o:p></pre>
                    <pre>If you want to do something similar as KFD for Xe I think you need<o:p></o:p></pre>
                    <pre>to get<o:p></o:p></pre>
                    <pre>explicit permission to do this from Dave and Daniel and maybe even<o:p></o:p></pre>
                    <pre>Linus.<o:p></o:p></pre>
                  </blockquote>
                  <pre> <o:p></o:p></pre>
                  <pre>I think the one and only one exception where an SVM uapi like in kfd<o:p></o:p></pre>
                  <pre>makes<o:p></o:p></pre>
                  <pre>sense, is if the _hardware_ itself, not the software stack defined<o:p></o:p></pre>
                  <pre>semantics that you've happened to build on top of that hw, enforces a<o:p></o:p></pre>
                  <pre>1:1<o:p></o:p></pre>
                  <pre>mapping with the cpu process address space.<o:p></o:p></pre>
                  <pre> <o:p></o:p></pre>
                  <pre>Which means your hardware is using PASID, IOMMU based translation,<o:p></o:p></pre>
                  <pre>PCI-ATS<o:p></o:p></pre>
                  <pre>(address translation services) or whatever your hw calls it and has<o:p></o:p></pre>
                  <pre>_no_<o:p></o:p></pre>
                  <pre>device-side pagetables on top. Which from what I've seen all devices<o:p></o:p></pre>
                  <pre>with<o:p></o:p></pre>
                  <pre>device-memory have, simply because they need some place to store<o:p></o:p></pre>
                  <pre>whether<o:p></o:p></pre>
                  <pre>that memory is currently in device memory or should be translated<o:p></o:p></pre>
                  <pre>using<o:p></o:p></pre>
                  <pre>PASID. Currently there's no gpu that works with PASID only, but there<o:p></o:p></pre>
                  <pre>are<o:p></o:p></pre>
                  <pre>some on-cpu-die accelerator things that do work like that.<o:p></o:p></pre>
                  <pre> <o:p></o:p></pre>
                  <pre>Maybe in the future there will be some accelerators that are fully<o:p></o:p></pre>
                  <pre>cpu<o:p></o:p></pre>
                  <pre>cache coherent (including atomics) with something like CXL, and the<o:p></o:p></pre>
                  <pre>on-device memory is managed as normal system memory with struct page<o:p></o:p></pre>
                  <pre>as<o:p></o:p></pre>
                  <pre>ZONE_DEVICE and accelerator va -&gt; physical address translation is<o:p></o:p></pre>
                  <pre>only<o:p></o:p></pre>
                  <pre>done with PASID ... but for now I haven't seen that, definitely not<o:p></o:p></pre>
                  <pre>in<o:p></o:p></pre>
                  <pre>upstream drivers.<o:p></o:p></pre>
                  <pre> <o:p></o:p></pre>
                  <pre>And the moment you have some per-device pagetables or per-device<o:p></o:p></pre>
                  <pre>memory<o:p></o:p></pre>
                  <pre>management of some sort (like using gpuva mgr) then I'm 100% agreeing<o:p></o:p></pre>
                  <pre>with<o:p></o:p></pre>
                  <pre>Christian that the kfd SVM model is too strict and not a great idea.<o:p></o:p></pre>
                  <pre> <o:p></o:p></pre>
                  <pre>Cheers, Sima<o:p></o:p></pre>
                </blockquote>
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre>I'm trying to digest all the comments here, The end goal is to be able<o:p></o:p></pre>
                <pre>to support something similar to this here:<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre><a
href="https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://developer.nvidia.com/blog/simplifying-gpu-application-development-with-heterogeneous-memory-management/</a><o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre>Christian, If I understand you correctly, you're strongly suggesting<o:p></o:p></pre>
                <pre>not to try to manage a common virtual address space across different<o:p></o:p></pre>
                <pre>devices in the kernel, but merely providing building blocks to do so,<o:p></o:p></pre>
                <pre>like for example a generalized userptr with migration support using<o:p></o:p></pre>
                <pre>HMM; That way each "mirror" of the CPU mm would be per device and<o:p></o:p></pre>
                <pre>inserted into the gpu_vm just like any other gpu_vma, and user-space<o:p></o:p></pre>
                <pre>would dictate the A..B -&gt; C..D mapping by choosing the GPU_VA for the<o:p></o:p></pre>
                <pre>vma.<o:p></o:p></pre>
              </blockquote>
              <p class="MsoNormal"><br>
                Exactly that, yes.<br>
                <br>
                <br>
                <br>
                <o:p></o:p></p>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre> <o:p></o:p></pre>
                <pre>Sima, it sounds like you're suggesting to shy away from hmm and not<o:p></o:p></pre>
                <pre>even attempt to support this except if it can be done using IOMMU sva<o:p></o:p></pre>
                <pre>on selected hardware?<o:p></o:p></pre>
              </blockquote>
              <p class="MsoNormal"><br>
                I think that comment goes more into the direction of: If
                you have ATS/ATC/PRI capable hardware which exposes the
                functionality to make memory reads and writes directly
                into the address space of the CPU then yes an SVM only
                interface is ok because the hardware can't do anything
                else. But as long as you have something like GPUVM then
                please don't restrict yourself.<br>
                <br>
                Which I totally agree on as well. The ATS/ATC/PRI
                combination doesn't allow using separate page tables
                device and CPU and so also not separate VAs.<br>
                <br>
                This was one of the reasons why we stopped using this
                approach for AMD GPUs.<br>
                <br>
                Regards,<br>
                Christian.<br>
                <br>
                <br>
                <br>
                <o:p></o:p></p>
              <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
                <pre>Could you clarify a bit?<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre>Thanks,<o:p></o:p></pre>
                <pre>Thomas<o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
                <pre> <o:p></o:p></pre>
              </blockquote>
              <p class="MsoNormal"> <o:p></o:p></p>
            </div>
          </blockquote>
          <p class="MsoNormal"><o:p> </o:p></p>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------8O74dTRKH1fPtg0IGRtTacGx--
