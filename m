Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C201E0FDB
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 15:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D3E89C56;
	Mon, 25 May 2020 13:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5340A89C56
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 13:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7ZWIjUJoZ9V6FdIVGSvDxMFr+/7p2BHACcHU4WyKQ3kKQkAGFwlJMLl4l6qY+8VsFE1eLX8eBu/FDDM1aRaVOaB4Yuey8ULlBm0ZkpfDWAj+u5eb+tVauIKbo3MPLgJEFJ8TsgDtipYfL4xlgmpgKQ1HsFwn1nEzOSuR8MVGLWJIGKLqxlJ3LWMx0AkXXrRbU4ItAJVylea4laMQSMgCsqRVKmhgKUD1Jag2dhzI1GnqGntJu4wJB3Bb77gq5oQMxQa+H2821KMtZMIc01HtzK2xSKwNpEJgtTbqQVWNONcHLzTfXcg4GDoeTAk9qPGskrL9VLRfxf1nquQxsdz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnjfPHx797e5B7oPMHw7yPOfL27uwoyUBlk26PsR/pQ=;
 b=oVhCC+GUSc9opfmVbCST2htf+ML9iataCXYzJPF9LLgtoG7gBuQfKS8PrE4OBxTdpgg8flc78uIunQSfbK3CBCg8bsENWcr/d8+BeitiOE7vaxrywdr81Dn/VtY6fKD68zcaJyy3JomWw7YPaJWU8nmS2aogp2xchIfVvXLX3iO8dLcRDo9b9kNLUXziJfyoaNVAnJGd/QD8zl2oA/2MijoKOihcxwBzkaD58L6B29SuhBPwMDkHD993kFfx35rNUZ5rHHkWG7CR12FJH3cQehxQDQSmtzyVLteKDD/m1Tj76RVuNZelndnVAut8RZP/KJeSYMvmIE3ozHz8H8f9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnjfPHx797e5B7oPMHw7yPOfL27uwoyUBlk26PsR/pQ=;
 b=HpPJCOvbesX4QjHt7lma9wICIQp6wPQjFPiIAAdyTs6T7u7raGewu5DLYOLbCs+dWOcRPjhWg8SIU1wpNs936ew+d4cgtRc3GQ3ML+c6c/pboPfcIpBmznO6GQcT9NXbWII6hOTlbcDlBJag7VK9JFAqdfEFncfKMzgIHS1BNlI=
Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3802.namprd12.prod.outlook.com (2603:10b6:5:1c5::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.27; Mon, 25 May 2020 13:51:33 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 13:51:33 +0000
Subject: Re: [PATCH v2] drm/doc: device hot-unplug for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200525124614.16339-1-ppaalanen@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <d2acce4d-8e5f-a335-24e6-e454a7fc2436@amd.com>
Date: Mon, 25 May 2020 09:51:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200525124614.16339-1-ppaalanen@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: BN3PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:400:4::18) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:1926:a92f:9271:c50]
 (2607:fea8:3ee0:2de:1926:a92f:9271:c50) by
 BN3PR03CA0100.namprd03.prod.outlook.com (2603:10b6:400:4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Mon, 25 May 2020 13:51:32 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:1926:a92f:9271:c50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd927734-caa3-4ccc-4a2b-08d800b2bbfa
X-MS-TrafficTypeDiagnostic: DM6PR12MB3802:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3802E0AB7C1D66C467413E1EEAB30@DM6PR12MB3802.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0414DF926F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2SAaGjy6fZCoY8vTutCOf44PC64rybIvkeSPJvp+9IzacsmaV7iF+7DK9UQU7uox5PoBO6M2nFyXu3AcPH3pLfJeeaxPePGppOvNeb0mB/t2FyTOVpUp5gJXFecgAS9Ym10SoeQUX1NBeuUReCFCnCIzrZB7bFqyBcSLOjnGH0m3kRW6dy0d7lX3l8+yAke70YSFhzDlCKYDTBBNV41oZQh6plbpto+Qwmhq49sWfbGTU6WsfX6XUnH1HC6biuTg5vW8Ul3nq1aVa5NqgH4K4gRAlbfjvt9tVpXDzBWM/Tv7OzoJfB7CrCIu9FBl4ZU9qV0Zh2MI8iTbHlyAXLOmY5m9Cc5fY/NJQxF4vaDZwQonpde5pZ/3ZWQ5hEQmV+wkRSAQvU1Twe1V5qz3JRYhZP64x9smGcHDVbiI9jEaU9OaMCMpnDY2STLWv6Lb45+vN9luN7bwbDL/6PccvsQcLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(31696002)(316002)(2616005)(54906003)(52116002)(53546011)(66556008)(66946007)(66476007)(36756003)(86362001)(8936002)(5660300002)(31686004)(6486002)(186003)(16526019)(2906002)(8676002)(45080400002)(966005)(478600001)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ptsVnlOZL7LRIxsM0Etk4RsqAo4KvrUG1A9Rl7rLIR3A+ES6HuWoRZ9banb5qXXjQVV7aXNWkJLxviSU4WfcEk32K9DgY/uv4S0KnpITrLKgXleT4BNPCqf2a6eOUWWYR0/aNB5b3m8kqsdIi1SLJu9Zt34c/Qdrr8iMKzdaGUmg8lLHNXFnoBwmLPWgWknsImS5YeNKvoelIeIbWxlq2a0fiVaCIh0iHUYC2oxar99XbXyznNmtzUJ9bK+1+FA2JW/pgm/9DmZz8P8tsepD0BctVkjVeiQpjdbhPmYMvoKcLI6g6bhsPhtOFtVtp0kSkgmcXM21wJPuCG/ubkDFZdeIa2bfQGUtgtWQkbLUv8iNNls1GUcj+5GuCeGvGEyTJEEJP5Z1LDeyMymzAWtIhuMaqO4WDiRC+GJggESQYpLpDOB22J8JMt8Rp+z+/7cREYR5FwKLg9qIy26gCBGYic4yg2XCwDenUTN4ZBgDFOEdLRA67UIwZ5M43wQ5Cwul4yr7cAgQ88VkG3hTu70wX05BYjZB/bNoTB7DBYfQJL0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd927734-caa3-4ccc-4a2b-08d800b2bbfa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2020 13:51:33.2130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 148cxDdAPY1JdihYGEw83TglGgLEcyPJzCLPTqXEqqND4DFo2upxj9Bcl7erOUFfLGnhTkcSJG9pag0qZhiy4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3802
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/20 8:46 AM, Pekka Paalanen wrote:

> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>
> Set up the expectations on how hot-unplugging a DRM device should look like to
> userspace.
>
> Written by Daniel Vetter's request and largely based on his comments in IRC and
> from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178891269&amp;sdata=tbOTr7TfESohEgWspomM1sbMq4U4n7bOvdS6JlYifmM%3D&amp;reserved=0 .
>
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Simon Ser <contact@emersion.fr>
>
> ---
>
> v2:
> - mmap reads/writes undefined (danvet)
> - make render ioctl behaviour driver-specific (danvet)
> - restructure the mmap paragraphs (danvet)
> - chardev minor notes (Simon)
> - open behaviour (danvet)
> - DRM leasing behaviour (danvet)
> - added links
>
> Disclaimer: I am a userspace developer writing for other userspace developers.
> I took some liberties in defining what should happen without knowing what is
> actually possible or what existing drivers already implement.
> ---
>   Documentation/gpu/drm-uapi.rst | 102 +++++++++++++++++++++++++++++++++
>   1 file changed, 102 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 56fec6ed1ad8..520b8e640ad1 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -1,3 +1,5 @@
> +.. Copyright 2020 DisplayLink (UK) Ltd.
> +
>   ===================
>   Userland interfaces
>   ===================
> @@ -162,6 +164,106 @@ other hand, a driver requires shared state between clients which is
>   visible to user-space and accessible beyond open-file boundaries, they
>   cannot support render nodes.
>   
> +Device Hot-Unplug
> +=================
> +
> +.. note::
> +   The following is the plan. Implementation is not there yet
> +   (2020 May).
> +
> +Graphics devices (display and/or render) may be connected via USB (e.g.
> +display adapters or docking stations) or Thunderbolt (e.g. eGPU). An end
> +user is able to hot-unplug this kind of devices while they are being
> +used, and expects that the very least the machine does not crash. Any
> +damage from hot-unplugging a DRM device needs to be limited as much as
> +possible and userspace must be given the chance to handle it if it wants
> +to. Ideally, unplugging a DRM device still lets a desktop to continue
> +running, but that is going to need explicit support throughout the whole
> +graphics stack: from kernel and userspace drivers, through display
> +servers, via window system protocols, and in applications and libraries.

So to support all the requirements in this document only kernel changes 
should be enough and no changes are required from user mode part of the 
stack ?

> +
> +Other scenarios that should lead to the same are: unrecoverable GPU
> +crash, PCI device disappearing off the bus, or forced unbind of a driver
> +from the physical device.
> +
> +In other words, from userspace perspective everything needs to keep on
> +working more or less, until userspace stops using the disappeared DRM
> +device and closes it completely. Userspace will learn of the device
> +disappearance from the device removed uevent


Is this uevent already implemented ? Can you point me to the code ?


> or in some cases
> +driver-specific ioctls returning EIO.
> +
> +Only after userspace has closed all relevant DRM device and dmabuf file
> +descriptors and removed all mmaps, the DRM driver can tear down its
> +instance for the device that no longer exists. If the same physical
> +device somehow comes back in the mean time, it shall be a new DRM
> +device.
> +
> +Similar to PIDs, chardev minor numbers are not recycled immediately. A
> +new DRM device always picks the next free minor number compared to the
> +previous one allocated, and wraps around when minor numbers are
> +exhausted.
> +
> +Requirements for UAPI
> +---------------------
> +
> +The goal raises at least the following requirements for the kernel and
> +drivers:
> +
> +- The kernel must not hang, crash or oops, no matter what userspace was
> +  in the middle of doing when the device disappeared.
> +
> +- All GPU jobs that can no longer run must have their fences
> +  force-signalled to avoid inflicting hangs to userspace.
> +
> +- KMS connectors must change their status to disconnected.
> +
> +- Legacy modesets and pageflips fake success.
> +
> +- Atomic commits, both real and TEST_ONLY, fake success.
> +
> +- Pending non-blocking KMS operations deliver the DRM events userspace
> +  is expecting.


The 4 points above refer to mode setting/display attached card and are 
irrelevant for secondary GPU (e.g. DRI-PRIME scenario) or no display 
system in general. Maybe we can somehow highlight this in the document 
and I on the implementing side can then decide as a first step to 
concentrate on implementing the non display case as a first step or the 
only step. In general and correct me if I am wrong, render only GPUs (or 
compute only) are the majority of cases where you would want to be able 
to detach/attach GPU on the fly (e.g attach stronger secondary graphic 
card to a laptop to get high performance in a game or add/remove a GPU 
to/from a compute cluster)

Andrey


> +
> +- dmabuf which point to memory that has disappeared will continue to
> +  be successfully imported if it would have succeeded before the
> +  disappearance.
> +
> +- Attempting to import a dmabuf to a disappeared device will succeed if
> +  it would have succeeded without the disappearance.
> +
> +- Some userspace APIs already define what should happen when the device
> +  disappears (OpenGL, GL ES: `GL_KHR_robustness`_; `Vulkan`_:
> +  VK_ERROR_DEVICE_LOST; etc.). DRM drivers are free to implement this
> +  behaviour the way they see best, e.g. returning failures in
> +  driver-specific ioctls and handling those in userspace drivers, or
> +  rely on uevents, and so on.
> +
> +- open() on a device node whose underlying device has disappeared will
> +  fail.
> +
> +- Attempting to create a DRM lease on a disappeared DRM device will
> +  fail. Existing DRM leases remain.
> +
> +.. _GL_KHR_robustness: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fregistry%2FOpenGL%2Fextensions%2FKHR%2FKHR_robustness.txt&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178891269&amp;sdata=m%2FneRusoe6qGVU8Edk%2FncaD7eSJZXtPnA1IqLr7k%2Bos%3D&amp;reserved=0
> +.. _Vulkan: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fvulkan%2F&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cc9676f35bbdf4d5a052808d800a9b517%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637260076178901265&amp;sdata=WsfLduUBzRKlybOJb5PQViBWYu5DgleEeycmf76l3UU%3D&amp;reserved=0
> +
> +Requirements for memory maps
> +----------------------------
> +
> +Memory maps have further requirements. If the underlying memory
> +disappears, the mmap is modified such that reads and writes will still
> +complete successfully but the result is undefined. This applies to both
> +userspace mmap()'d memory and memory pointed to by dmabuf which might be
> +mapped to other devices.
> +
> +Raising SIGBUS is not an option, because userspace cannot realistically
> +handle it.  Signal handlers are global, which makes them extremely
> +difficult to use correctly from libraries like those that Mesa produces.
> +Signal handlers are not composable, you can't have different handlers
> +for GPU1 and GPU2 from different vendors, and a third handler for
> +mmapped regular files.  Threads cause additional pain with signal
> +handling as well.
> +
>   .. _drm_driver_ioctl:
>   
>   IOCTL Support on Device Nodes
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
