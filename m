Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB771EBD81
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 16:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FD489D5F;
	Tue,  2 Jun 2020 14:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091989D5F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 14:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT2h3hXVu4AMEjjY7xLyLq/M1/NZ0CLbubKgNusF+0Udtfbg+dZGbvahTvSyv6JXO6uHl3B4mbvHWe2Cz/nfCV+u2NWVh1yW8TjV39fu7GtRVZ6/g5E63ZOPIgICh5Nuwzq2+aMk66eQueZgcRJEUnEEztDqiR1ySVFpbgKaFaSa++5brS385wMtJx/akt0dyLfCqqikv5kSbnNL7CvS319raRz1CvHmKwF3rkUXd/qaG1UYDBcxFzdS+dFchlbhfUpsMjx4p7nVzm2mpsO+l0hgFAkyuVqZqcYide1ayxJf8HzlEKtnBDhjzcP1ZR0iClhxcYT5PNhSRgP6r5G7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efCDtWuMheywnerZMqwTavXwGbTBEn01rESq0v77F+c=;
 b=Qve9yWdHYM2VHbQI8u7Lc9hqORzp7qOZbrNmkHY1bMA87RcKzbqGu03F5G+BEPPi9jnbRXPvCteNBD/z5DRn0uCsGQsBmNQNq+xStY/WVCJu1IhOlMD8Cw+C0ouEAOZ9bspcQ7kJupoi7qlNz6CSnOuxf9hNIPCzLKdAhCRcItKJCOOPrafzBe5Gg1qCD86u8P/F7KQ6vTDi3ObDgJNulKIgZp+9IKEiO5nCQV4oc0QhmPL8PBNiAPYCLFTtfC0jx1YKX1ny80ZdXD8NS1jb2YqTXzyLf47o+sgCI26oeG8J+1Yd7upD/vuxz5sTNbnGqsVQ49O/EW7o0By9Lddnbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efCDtWuMheywnerZMqwTavXwGbTBEn01rESq0v77F+c=;
 b=bJ1fo3cgDBpEUrWSjdogZXsoZa7PM+nTi2JziPhrdEMMqVzcF7o3+9TAOma9dqtUK/0YRxCM4Y306PZB5zOj0BxGv0BnukViar7gTkDuPwxLw9fnQMaYI3XF8YWlSwH3d/qIUoxqcnkhRJEm1bHXmEukogBsRNXaS4r8SO57tSc=
Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3228.namprd12.prod.outlook.com (2603:10b6:5:18c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Tue, 2 Jun 2020 14:00:14 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 14:00:14 +0000
Subject: Re: [PATCH v3] drm/doc: device hot-unplug for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200519100649.12053-1-ppaalanen@gmail.com>
 <20200601143203.14666-1-ppaalanen@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <9e5f47a1-1751-6565-69e2-8b648bbd8bae@amd.com>
Date: Tue, 2 Jun 2020 10:00:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200601143203.14666-1-ppaalanen@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:c5b5:a4a9:358f:7cfb]
 (2607:fea8:3ee0:2de:c5b5:a4a9:358f:7cfb) by
 YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Tue, 2 Jun 2020 14:00:12 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:c5b5:a4a9:358f:7cfb]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8147968a-fd7c-4aae-8d62-08d806fd4589
X-MS-TrafficTypeDiagnostic: DM6PR12MB3228:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32286AFB1B0F07E2127BD814EA8B0@DM6PR12MB3228.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuysauyvNL/7DTydj3ekCmhgvlf0HuGnFLPWV1ovRj7TVJQDx425IbL4oQAHvc7CjC/pec6o/0m+FXiQpDAf0xQWtDcM7nqRIU1RWXXaywXk8pV9iBnaxgmhFxAhC1IWWjPIxoyMOc8MvMDsboJH1qAFgA5Y1A7O0hVmrOfV/BC4p1CaW+Rs6syar20tpSdcgQvtqepCCYazDlN4MUqOKrWwgcBF3F4T22F2lH3vmVJF1sAE+SB7MBHDGTgBpopjR9F5aB/w2uuyULzKF9zs0gKu6M3CJ+QIL960XCNuwjbzo5NPaq2own8kzr/BI0ejEvalFXCgB6XyVJr724ajEPPLKtwIpjJV0jGavCWhUAqTmvjuXeHfaDeB1/La7CibAbkToGZG2xouDlUJSFawg8SzII9L0pGqwvqWslC0Sadk1O8QgrFuOzStA1eJTb93vY0kk+2xQbeH+nkwym3pVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(6486002)(66946007)(4326008)(45080400002)(478600001)(66476007)(83380400001)(2906002)(66556008)(966005)(16526019)(36756003)(186003)(86362001)(316002)(2616005)(31696002)(54906003)(5660300002)(52116002)(8676002)(8936002)(53546011)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: JW0WhXslXW9pzRUqvozI+oSo6uZOAzKrmHbBtG860XErq0OGxcPP2euV+1UfhGDUI3oPAvKwsKZoUc3tWWawO1GT1jSlN8kl6h8bwo6rATZZP9nkDuhF/h/pbWMwDfGkANXABmz8/kp0eks7Z2Pv8drQ0Cgk4NaCvrUR54moHxKHMIBDPBsjJJdqeKzfMUzhLD4+W1Y9JDNwEe0H49kUzHpdDKiIVPAq4skqsGH0vgPUdcQRmYnMXXMloOzHY3a7Pvj2A/7qvxyOXaM69Fo6pkwqb6/xCMNOn8niG9XJU+P8hZl+YkVvww56ObTSRqNIRQxiK2IRiPdqe4UYVhjrWN5Xj5z/U7wLsJz6D1ucyzBfRmozsB+nZ8Fu/WleneDWjeHOD4LiIZUotV0rGVSjZQXPwLCiJwhUFxWOWFsQxZ82+5cdT3vKcXexgMSBkqut9cjG4qGsIErXbsbQjJ4PEQwlxi25ws+bLpBv2Ezn202g4umDVuCDN/BUPiviX7Ajs24ZYNk44K8d2lCsrNzcE3+WskymQYJz9m2vMjsEeLA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8147968a-fd7c-4aae-8d62-08d806fd4589
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 14:00:13.8967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iO/ZumsA+Skq0BxIzu/uKYKZu/uFTOfVFQJfeor5XzHSpkjMnGliCaTiTuXkTm6oHUHl9WUQYEDXgzCeuozatg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3228
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


On 6/1/20 10:32 AM, Pekka Paalanen wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>
> Set up the expectations on how hot-unplugging a DRM device should look like to
> userspace.
>
> Written by Daniel Vetter's request and largely based on his comments in IRC and
> from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cfc4392da89ea4fc4281b08d806389835%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637266187434486889&amp;sdata=Mbsx6qBXN9MBnDDJi4shRZobf7tjcClvNUlUCPsiVtw%3D&amp;reserved=0 .
>
> A related Wayland protocol change proposal is at
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fwayland%2Fwayland-protocols%2F-%2Fmerge_requests%2F35&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cfc4392da89ea4fc4281b08d806389835%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637266187434486889&amp;sdata=5j%2FNQFW0C1wvdnR%2BC0WgGU0JcNCb8fIYBPXFOmp36Ck%3D&amp;reserved=0
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
> v3:
> - update ENODEV doc (Daniel)
> - clarify existing vs. new mmaps (Andrey)
> - split into KMS and render/cross sections (Andrey, Daniel)
> - open() returns ENXIO (open(2) man page)
> - ioctls may return ENODEV (Andrey, Daniel)
> - new wayland-protocols MR
>
> v2:
> - mmap reads/writes undefined (Daniel)
> - make render ioctl behaviour driver-specific (Daniel)
> - restructure the mmap paragraphs (Daniel)
> - chardev minor notes (Simon)
> - open behaviour (Daniel)
> - DRM leasing behaviour (Daniel)
> - added links
>
> Disclaimer: I am a userspace developer writing for other userspace developers.
> I took some liberties in defining what should happen without knowing what is
> actually possible or what existing drivers already implement.
> ---
>   Documentation/gpu/drm-uapi.rst | 114 ++++++++++++++++++++++++++++++++-
>   1 file changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 56fec6ed1ad8..db56c681b648 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -1,3 +1,5 @@
> +.. Copyright 2020 DisplayLink (UK) Ltd.
> +
>   ===================
>   Userland interfaces
>   ===================
> @@ -162,6 +164,116 @@ other hand, a driver requires shared state between clients which is
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
> +
> +Other scenarios that should lead to the same are: unrecoverable GPU
> +crash, PCI device disappearing off the bus, or forced unbind of a driver
> +from the physical device.
> +
> +In other words, from userspace perspective everything needs to keep on
> +working more or less, until userspace stops using the disappeared DRM
> +device and closes it completely. Userspace will learn of the device
> +disappearance from the device removed uevent, ioctls returning ENODEV
> +(or driver-specific ioctls returning driver-specific things), or open()
> +returning ENXIO.
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
> +The goal raises at least the following requirements for the kernel and
> +drivers.
> +
> +Requirements for KMS UAPI
> +-------------------------
> +
> +- KMS connectors must change their status to disconnected.
> +
> +- Legacy modesets and pageflips, and atomic commits, both real and
> +  TEST_ONLY, and any other ioctls either fail with ENODEV or fake
> +  success.
> +
> +- Pending non-blocking KMS operations deliver the DRM events userspace
> +  is expecting. This applies also to ioctls that faked success.
> +
> +- open() on a device node whose underlying device has disappeared will
> +  fail with ENXIO.
> +
> +- Attempting to create a DRM lease on a disappeared DRM device will
> +  fail with ENODEV. Existing DRM leases remain and work as listed
> +  above.
> +
> +Requirements for Render and Cross-Device UAPI
> +---------------------------------------------
> +
> +- All GPU jobs that can no longer run must have their fences
> +  force-signalled to avoid inflicting hangs to userspace.
> +  The associated error code is ENODEV.
> +
> +- Some userspace APIs already define what should happen when the device
> +  disappears (OpenGL, GL ES: `GL_KHR_robustness`_; `Vulkan`_:
> +  VK_ERROR_DEVICE_LOST; etc.). DRM drivers are free to implement this
> +  behaviour the way they see best, e.g. returning failures in
> +  driver-specific ioctls and handling those in userspace drivers, or
> +  rely on uevents, and so on.
> +
> +- dmabuf which point to memory that has disappeared will either fail to
> +  import with ENODEV or continue to be successfully imported if it would
> +  have succeeded before the disappearance. See also about memory maps
> +  below for already imported dmabufs.
> +
> +- Attempting to import a dmabuf to a disappeared device will either fail
> +  with ENODEV or succeed if it would have succeeded without the
> +  disappearance.
> +
> +- open() on a device node whose underlying device has disappeared will
> +  fail with ENXIO.
> +
> +.. _GL_KHR_robustness: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fregistry%2FOpenGL%2Fextensions%2FKHR%2FKHR_robustness.txt&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cfc4392da89ea4fc4281b08d806389835%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637266187434486889&amp;sdata=69J%2FRk9%2BX4Hew4UVZCvnVvBUFtKjU3lDz5DthyEvaR4%3D&amp;reserved=0
> +.. _Vulkan: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.khronos.org%2Fvulkan%2F&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Cfc4392da89ea4fc4281b08d806389835%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637266187434486889&amp;sdata=g%2F8ITu9GYokOr%2FgrwoDOKEWMcOV0EZGZDI4quRkjrVQ%3D&amp;reserved=0
> +
> +Requirements for Memory Maps
> +----------------------------
> +
> +Memory maps have further requirements that apply to both existing maps
> +and maps created after the device has disappeared. If the underlying
> +memory disappeared, the map is created or modified such that reads and
> +writes will still complete successfully but the result is undefined.
> +This applies to both userspace mmap()'d memory and memory pointed to by
> +dmabuf which might be mapped to other devices (cross-device dmabuf
> +imports).


I haven't actually tested this yet but my guess is that for existing 
mappings nothing needs to be done as the result returned from 
reading/writing to pages backed by removed card will not fail since the 
page tables are in place but rather will return all 1s or just some 
undefined value for reads and nothing will happen for right - does this 
assumption makes sense ?

Andrey


> +
> +Raising SIGBUS is not an option, because userspace cannot realistically
> +handle it. Signal handlers are global, which makes them extremely
> +difficult to use correctly from libraries like those that Mesa produces.
> +Signal handlers are not composable, you can't have different handlers
> +for GPU1 and GPU2 from different vendors, and a third handler for
> +mmapped regular files. Threads cause additional pain with signal
> +handling as well.
> +
>   .. _drm_driver_ioctl:
>   
>   IOCTL Support on Device Nodes
> @@ -199,7 +311,7 @@ EPERM/EACCES:
>           difference between EACCES and EPERM.
>   
>   ENODEV:
> -        The device is not (yet) present or fully initialized.
> +        The device is not anymore present or is not yet fully initialized.
>   
>   EOPNOTSUPP:
>           Feature (like PRIME, modesetting, GEM) is not supported by the driver.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
