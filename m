Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9200C1E446D
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 15:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54F96E0CB;
	Wed, 27 May 2020 13:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F2E6E0CB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 13:51:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLcnt1Uwjy5oIW7kiAxjEpmfBL7jGAvteK7URwbxTBR/JydnJHos7PePXNqAZBZ4s/R61DcOT1FjmeqNWjBBjkeOQGcFTwVtqe9wo2D9NIsJ1wjmIXTbgShr9g40rTuZl11clK/65OkaalJoMU+0xhlgPh0nsTgSso1qDT3NZELRrXm3tr2OujVh+yc9gJQugzo4wkNTRVPtpblup66R47zsuuR4EHuJ6rUBVB+fJaCLjMW5RsMV0HQCBG3zAOMdAOpZ+o+ZGhB4qkBYQWs45w4BBzf+bQhc0Th6KFAF12r1gIRxLI8E2bd8FxsUQkSGyG3FkcPAZMMdG6JU+RYj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOJQowNqi8sXlbBtm92lxJNucXxyp49ycje+5Z93KiQ=;
 b=GkJKolgC8AmBpk/uDldp7RzSUikN4oWj6dUoVTQ8I+jywvVm6tpfLPWGRB6JDyn77TSqFOYAQEjOFPBP5O6P3oyVQrtzY0VPcO235eHGsKCdfaVPTvjaZ1kl3VQ2KmdzZtgSpgUj3150xRcOqcyASZbs9F+VEq7b0gGJBLr5aOZJuEQ1s03r6w/1EkOvH96ZB4XSo1QniWa889kNiAEM8/BTCFvdikg+jvGLthREsdex0nGsFP9ReezGCh477duwgUENgqCLZIM1zjvir56Y8tPsjv5PKQq5tnNWJcu3zcsGf9U9NkOtc9Ko5pSPZuo5kWLeLmXg4S5iCJs0niUZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOJQowNqi8sXlbBtm92lxJNucXxyp49ycje+5Z93KiQ=;
 b=HzbO/d8oW48YQv467ASofNBssa/k4IOvByBuJyYLahvb8PTJi/HHz6rtTKmCjQV1jmeMN8wt6/GMj1PcCs2xbKNzWvfZumhxwFPF67iXOOcN9Nhqq0OFKEnrk66GdGpyLlmwd0+RB13v6ME8S5oh/lL6vr+KVRKAz0CwRK+mDuI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19; Wed, 27 May 2020 13:51:17 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 13:51:17 +0000
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <db6e57bd-a5c0-f156-93ca-80828d98064e@amd.com>
 <20200527094428.4b4a7ca6@eldfell.localdomain>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <63d2e957-ae79-8c70-29c9-fd53a7de92cf@amd.com>
Date: Wed, 27 May 2020 09:51:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200527094428.4b4a7ca6@eldfell.localdomain>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::13) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:1926:a92f:9271:c50]
 (2607:fea8:3ee0:2de:1926:a92f:9271:c50) by
 YT1PR01CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Wed, 27 May 2020 13:51:09 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:1926:a92f:9271:c50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e931d4df-7835-4dbc-ccc9-08d80245074a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4401:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4401C07D408722214EFE5292EAB10@DM6PR12MB4401.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ra/E3r+g/5Qe1FQ1cPNNmcCPf2CIke79lPFD2DjEdqj64YoX+lrnzCCl9H/Di+pj9ASz/pkLpRL3xoqql9AafjXhbHF2Qm9/5RQnuVyNx18aFZSy1bphbqFx0ajm13gRemz8O758iNZ8SQfaIK3sXmxIXIwTlPzuyoHZbW82nxMB+jfjqrOFfTAZW06iOb2a134RTAMkxPmAjwTTEW8Gc/La4SZICSrTtBIfWCzdu0KhMPHrrIgIXkRATM3exbNC6V3Xz2bvXj0rZBKu4EofaWxcpOiMvlilFMel/7LS4BGmuNpcAmTTYReT7pLvayLkl/BAFToMWwPirw5D08vOjKJ0BQZ0TAxNQtAsOapDuVV1aRKuJnGJ3m/46ckKVqzJVdn06bWTxuj6uC1eK5pk/+ATEReh+ob4UjxOz/MbrqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6666004)(83380400001)(316002)(86362001)(6916009)(2616005)(54906003)(8936002)(31686004)(53546011)(36756003)(52116002)(66556008)(66476007)(66946007)(2906002)(45080400002)(5660300002)(186003)(16526019)(31696002)(8676002)(6486002)(478600001)(4326008)(966005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ggSjPITxhgDpiY9IDiaYFJTPhMMTZgyfNYPMSXILVUcLmv8zfEs6YW0GN2Rh4e1QppX7Z7nHF945HyQCGJIAhB11esPxz3boTwPi3asM4CaODBxwS0Ng5nvrX5RpIrXDSm9sqi2GEQJSS3HjTOq6TTEN64YAEdXeQedatt294OGpIpaDQyqnWCJv+7ypOz0Ve6MKilAumP4M+PNFpTX/VejuDwbWb/KoF8NqnP7u0D2XajIOWii0kjU8XpjGcQLX90+Px65R6B4IwYovG1KW5G5JyoW4tNQudcmCQEUBdj6nVMn0ghU7Xfqvjf9ksn3Z9Io/EwuctESBjvekk1kAJUiEqoCux0ywEL7GhAu7svYsFHvfWcYdiM/S/z/4qK9AT7Z2+ZoFMJWE0Gk9whkswoW+X9gv6MB+JFuvFx8IkQck0BJkx1quG5qaWLCzQRDvycLSXC+PplpYwCxS3PO0VZIcja0YuFzdE3d1EVk8TTVMozZRiJPRbcxoueW4D6KFKzWIogsxsjnLWy8qYMLsStLlYXLK7Cn7m4vT+ooGA4Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e931d4df-7835-4dbc-ccc9-08d80245074a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 13:51:17.3138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9YMIzvwovvZKmJu7vtWHp3BxXzorVoq8wzkF9wZtXffyEhWsZhocaiJGMIbJaBt5P7KYR1tRUGV6qCFeLJo6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4401
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/27/20 2:44 AM, Pekka Paalanen wrote:
> On Tue, 26 May 2020 10:30:20 -0400
> Andrey Grodzovsky <Andrey.Grodzovsky@amd.com> wrote:
>
>> On 5/19/20 6:06 AM, Pekka Paalanen wrote:
>>> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>
>>> Set up the expectations on how hot-unplugging a DRM device should look like to
>>> userspace.
>>>
>>> Written by Daniel Vetter's request and largely based on his comments in IRC and
>>> from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Ce8e13dc4c85648e5fcd408d7fbdc5f2b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637254796242596783&amp;sdata=bA%2FAy3VGvzNqmV1kGigNROSZQEws2E98JibDxvEICNs%3D&amp;reserved=0 .
>>>
>>> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>>
>>> ---
>>>
>>> Disclaimer: I am a userspace developer writing for other userspace developers.
>>> I took some liberties in defining what should happen without knowing what is
>>> actually possible or what existing drivers already implement.
>>> ---
>>>    Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
>>>    1 file changed, 75 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
>>> index 56fec6ed1ad8..80db4abd2cbd 100644
>>> --- a/Documentation/gpu/drm-uapi.rst
>>> +++ b/Documentation/gpu/drm-uapi.rst
>>> @@ -1,3 +1,5 @@
>>> +.. Copyright 2020 DisplayLink (UK) Ltd.
>>> +
>>>    ===================
>>>    Userland interfaces
>>>    ===================
>>> @@ -162,6 +164,79 @@ other hand, a driver requires shared state between clients which is
>>>    visible to user-space and accessible beyond open-file boundaries, they
>>>    cannot support render nodes.
>>>    
>>> +Device Hot-Unplug
>>> +=================
>>> +
>>> +.. note::
>>> +   The following is the plan. Implementation is not there yet
>>> +   (2020 May 13).
>>> +
>>> +Graphics devices (display and/or render) may be connected via USB (e.g.
>>> +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An end
>>> +user is able to hot-unplug this kind of devices while they are being
>>> +used, and expects that the very least the machine does not crash. Any
>>> +damage from hot-unplugging a DRM device needs to be limited as much as
>>> +possible and userspace must be given the chance to handle it if it wants
>>> +to. Ideally, unplugging a DRM device still lets a desktop to continue
>>> +running, but that is going to need explicit support throughout the whole
>>> +graphics stack: from kernel and userspace drivers, through display
>>> +servers, via window system protocols, and in applications and libraries.
>>> +
>>> +Other scenarios that should lead to the same are: unrecoverable GPU
>>> +crash, PCI device disappearing off the bus, or forced unbind of a driver
>>> +from the physical device.
>>> +
>>> +In other words, from userspace perspective everything needs to keep on
>>> +working more or less, until userspace stops using the disappeared DRM
>>> +device and closes it completely. Userspace will learn of the device
>>> +disappearance from the device removed uevent or in some cases specific
>>> +ioctls returning EIO.
>>> +
>>> +This goal raises at least the following requirements for the kernel and
>>> +drivers:
>>> +
>>> +- The kernel must not hang, crash or oops, no matter what userspace was
>>> +  in the middle of doing when the device disappeared.
>>> +
>>> +- All GPU jobs that can no longer run must have their fences
>>> +  force-signalled to avoid inflicting hangs to userspace.
>>> +
>>> +- KMS connectors must change their status to disconnected.
>>> +
>>> +- Legacy modesets and pageflips fake success.
>>> +
>>> +- Atomic commits, both real and TEST_ONLY, fake success.
>>> +
>>> +- Pending non-blocking KMS operations deliver the DRM events userspace
>>> +  is expecting.
>>> +
>>> +- If underlying memory disappears, the mmaps are replaced with harmless
>>> +  zero pages where access does not raise SIGBUS. Reads return zeros,
>>> +  writes are ignored.
>>
>> Regarding this paragraph - what about exiting mappings ? In the first
>> patchset we would actively invalidate all the existing CPU mappings to
>> device memory and i think we still should do it otherwise we will see
>> random crashes in applications as was before. I guess it's because TLBs
>> and page tables are not updated to reflect the fact the device is gone.
> Hi,
>
> I was talking about existing mappings. What I forgot to specify is how
> new mmap() calls after the device disappearance should work (the end
> result should be the same still, not failure).
>
> I'll clarify this in the next revision.
>
>
> Thanks,
> pq


I see, that ok.

Next related question is more for Daniel/Christian - about the 
implementation of this paragraph, I was thinking about something like 
checking for device disconnect in ttm_bo_vm_fault_reserved and if so 
remap the entire VA range for the VMA where the fault address belongs to 
the global zero page (i.e. (remap_pfn_range(vma, vma->vm_start, 
page_to_pfn(ZERO_PAGE(vma->vm_start), vma->vm_end - vma->vm_start, 
vma->vm_page_prot)). Question is, when the doc says 'writes are ignored' 
does it mean i should use copy on write for the vma->vm_page_prot and if 
so how i actually do it as i was not able to find what flags to set into 
vm_page_prot to force copy on write behavior.

Andrey




>
>
>>> +
>>> +- dmabuf which point to memory that has disappeared are rewritten to
>>> +  point to harmless zero pages, similar to mmaps. Imports still succeed
>>> +  both ways: an existing device importing a dmabuf pointing to
>>> +  disappeared memory, and a disappeared device importing any dmabuf.
>>> +
>>> +- Render ioctls return EIO which is then handled in userspace drivers,
>>> +  e.g. Mesa, to have the device disappearance handled in the way
>>> +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
>>> +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)
>>> +
>>> +Raising SIGBUS is not an option, because userspace cannot realistically
>>> +handle it.  Signal handlers are global, which makes them extremely
>>> +difficult to use correctly from libraries like Mesa produces. Signal
>>> +handlers are not composable, you can't have different handlers for GPU1
>>> +and GPU2 from different vendors, and a third handler for mmapped regular
>>> +files.  Threads cause additional pain with signal handling as well.
>>> +
>>> +Only after userspace has closed all relevant DRM device and dmabuf file
>>> +descriptors and removed all mmaps, the DRM driver can tear down its
>>> +instance for the device that no longer exists. If the same physical
>>> +device somehow comes back in the mean time, it shall be a new DRM
>>> +device.
>>> +
>>>    .. _drm_driver_ioctl:
>>>    
>>>    IOCTL Support on Device Nodes
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
