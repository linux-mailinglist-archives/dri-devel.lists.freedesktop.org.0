Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48171E2413
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 16:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9D66E207;
	Tue, 26 May 2020 14:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E246E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 14:30:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glPIX9r5PjmhvFuhhAFvRg+Tg/g9q+GQcL8Fiqj9MKwNRVcdZxus04a+qHrPtZp0vvxIhN9fV9iGSI0chEyuDaORQ/cNGSaxMDflHz4u8ThE24x47R1zqh/5VE6vA/awEc3L9UptyNN8kOdXZ2fmkQhiSEvvPmU5KxQX9LIpjK+1x4Uiljqnf7fJuzHARCxKc0gdjB0CZiSHm5imFD5KP3/z9kFKCCkHQw28kNv1jKGjNMaF+qCmBD8CSL51W1dQEyPlwZYicKq/03mlqxCNB4LH5zqh+E28B2G30w85mFg9Gu+99b3uuQLP97+FEh3sPJcCfYpDvrEwuhOmxsnT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+g2zpqqY2vGrSLZSNYHY5EzxzNBDpep7FhYrbSvKFZU=;
 b=WU1XeUv/oBYnCnzVH+lEIHykL03SNfMP4ZpieqsX3YaUlnf74iQO+UQ09FtKPlKKbunVRXdjb6jsA76KYPvtJrKwMGlHrCa9Mi1NWlzfNZGnPTBJG1x3e+KcKECnKQUMPb89Jt2xcHbeo2O12UlkHw/PxGKkyGStww2HQvb+fExIyhtJGNdnvrAnuIqq35QjHhU0YfXVFkwyt+PgiFuam4Coz8rRCtmcIU2+HeFjs135/BoDs/yfx4V/TBZiCj4ujLcD5r7hDdLvmvCw4ykesY3RVNjG9+8rC5osU5/5aMWZmR2TdaYHusV0jTvHX3BM/qzr1YExJI24n0rRwdx3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+g2zpqqY2vGrSLZSNYHY5EzxzNBDpep7FhYrbSvKFZU=;
 b=L8bQZVLdmpC89yXKODqJcJtyZtGehbY98aq2ixHMENODGZfaPGhcioUWI431a0dSHixZrYkUSDKqO192qfyw83A9TQoemLgNbPLoogq69TVIBX0l2KL6tt+Mq9IDNdBY0u1tan+fQotHB49JijM/hiY69Wz7sMtSYhX8JRVdAnk=
Authentication-Results: poorly.run; dkim=none (message not signed)
 header.d=none;poorly.run; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23; Tue, 26 May 2020 14:30:22 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 14:30:22 +0000
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200519100649.12053-1-ppaalanen@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <db6e57bd-a5c0-f156-93ca-80828d98064e@amd.com>
Date: Tue, 26 May 2020 10:30:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200519100649.12053-1-ppaalanen@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::43) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:1926:a92f:9271:c50]
 (2607:fea8:3ee0:2de:1926:a92f:9271:c50) by
 YTOPR0101CA0066.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend
 Transport; Tue, 26 May 2020 14:30:21 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:1926:a92f:9271:c50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51c2f3b4-0e53-4f34-7172-08d801815291
X-MS-TrafficTypeDiagnostic: DM6PR12MB4265:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4265D8D255C570FA5DC0E5BFEAB00@DM6PR12MB4265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpamE9MIJjZd8khkoMJ30kLygwzZ+YaJxtyP3qq5+VZYw+tIB1LJDbkZzT4xucMq+t70mYqgm1zdowDyb1icSy508EQG0Dne7rnfg+TJeEPVB/7LPWM04A+sBfW42BM3GATiwzmlYpalj3T3T4RbL92J6yoeTd6Q/dBMtNtrVJTB/GQVXCGYYVxVKBS1btiE6Dmx5ev7ZPomJqmoKAas3UKMsYgbln10iyL9ZLEZ3tUBheChx0XlEgvma0xn5GW2F4tWiobvD+QIkBEpaFVsiIprDdtojU/IKv3qZWMOcz2k2Up+GdZAsaiQuhurrTT+v8IDe0+CE94cqULTHk/HUwtGa2LpvFh6Nfhg7tgclxqPW/7l9VtzWe/Xdw/sVkmIMUUbTa8RkL/lT17OMvACKLk4fM+mICD+o/Qehng9vkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(54906003)(31686004)(316002)(53546011)(5660300002)(478600001)(2616005)(36756003)(45080400002)(8676002)(8936002)(31696002)(52116002)(186003)(66556008)(2906002)(6486002)(66946007)(4326008)(86362001)(16526019)(966005)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YIM7CeghDgYP3LXjSU9PYMWtE4GL0uJNbZ5gZ7SlfjOzzr23ba5wCZXJxuvIP0GCmLwyq+wTe0THhfUTCuVbBLPUJ7KqHN6bL0AtQBpXtnppiLWnJeQDmV1SBxz9Vx5zpHKe+YaGFH7Izw1/UtEDWmOx9GdkFEOO+kpxhsM9MpHoXI63GQSHXhF0oQFh96BuZMotDAkXwwQglhOSedbxXLi2gn4KV2cW64waIRW+A4qYmauhkLMzrt2wwbhBvLUfEVLQyWusQo6/gDpGCpaOjZ5SbelXJGfzKOEIpTQE3cSkclEYGXgAIUIu6BdbCMALSnCn6EH+prZTI39lH5gpL9M3xNlUFnV4PRxU2yhPQntlKCqRBdil/R1kQL02//Ia4EpvhNYqkCg6QEWv2v16MVPf7Gowa/k+SIsP7kyWfZ4W9oUkwyjtZFIl7iE4eggKdlDUP7ewK2iUH7RpHreucpH6+SkkgFrqf+JSxsWkvI8cg+omHHmMsmHqhWrOHHebjqfDDgC+gnGu6/V446MhnHmqKZ48atpQHYx1iyBHirQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c2f3b4-0e53-4f34-7172-08d801815291
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 14:30:22.2210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufhGPY8geAd+MO4gsirwAYDzMyFnISK7dceJtGf1W40WmuiabwGVIf0jMesqFhUbHuxFScpwWgw392tI0wHBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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


On 5/19/20 6:06 AM, Pekka Paalanen wrote:
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
>
> Set up the expectations on how hot-unplugging a DRM device should look like to
> userspace.
>
> Written by Daniel Vetter's request and largely based on his comments in IRC and
> from https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265484.html&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7Ce8e13dc4c85648e5fcd408d7fbdc5f2b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637254796242596783&amp;sdata=bA%2FAy3VGvzNqmV1kGigNROSZQEws2E98JibDxvEICNs%3D&amp;reserved=0 .
>
> Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
>
> ---
>
> Disclaimer: I am a userspace developer writing for other userspace developers.
> I took some liberties in defining what should happen without knowing what is
> actually possible or what existing drivers already implement.
> ---
>   Documentation/gpu/drm-uapi.rst | 75 ++++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 56fec6ed1ad8..80db4abd2cbd 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -1,3 +1,5 @@
> +.. Copyright 2020 DisplayLink (UK) Ltd.
> +
>   ===================
>   Userland interfaces
>   ===================
> @@ -162,6 +164,79 @@ other hand, a driver requires shared state between clients which is
>   visible to user-space and accessible beyond open-file boundaries, they
>   cannot support render nodes.
>   
> +Device Hot-Unplug
> +=================
> +
> +.. note::
> +   The following is the plan. Implementation is not there yet
> +   (2020 May 13).
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
> +disappearance from the device removed uevent or in some cases specific
> +ioctls returning EIO.
> +
> +This goal raises at least the following requirements for the kernel and
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
> +
> +- If underlying memory disappears, the mmaps are replaced with harmless
> +  zero pages where access does not raise SIGBUS. Reads return zeros,
> +  writes are ignored.


Regarding this paragraph - what about exiting mappings ? In the first 
patchset we would actively invalidate all the existing CPU mappings to 
device memory and i think we still should do it otherwise we will see 
random crashes in applications as was before. I guess it's because TLBs 
and page tables are not updated to reflect the fact the device is gone.

Andrey


> +
> +- dmabuf which point to memory that has disappeared are rewritten to
> +  point to harmless zero pages, similar to mmaps. Imports still succeed
> +  both ways: an existing device importing a dmabuf pointing to
> +  disappeared memory, and a disappeared device importing any dmabuf.
> +
> +- Render ioctls return EIO which is then handled in userspace drivers,
> +  e.g. Mesa, to have the device disappearance handled in the way
> +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)
> +
> +Raising SIGBUS is not an option, because userspace cannot realistically
> +handle it.  Signal handlers are global, which makes them extremely
> +difficult to use correctly from libraries like Mesa produces. Signal
> +handlers are not composable, you can't have different handlers for GPU1
> +and GPU2 from different vendors, and a third handler for mmapped regular
> +files.  Threads cause additional pain with signal handling as well.
> +
> +Only after userspace has closed all relevant DRM device and dmabuf file
> +descriptors and removed all mmaps, the DRM driver can tear down its
> +instance for the device that no longer exists. If the same physical
> +device somehow comes back in the mean time, it shall be a new DRM
> +device.
> +
>   .. _drm_driver_ioctl:
>   
>   IOCTL Support on Device Nodes
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
