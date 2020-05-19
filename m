Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAE1D9A0C
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 16:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB74D6E22C;
	Tue, 19 May 2020 14:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0D6E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 14:37:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWaKaah+7gQzQTERqDPfAIsqE/ZzJzfR5xpj9Xt2NPkCJly0yyXAAgWoS0M1PAZy9zCDXKsbZz+CbTYyh7MEAAarXpwwhXHAyj5a5Kgw4Uj+dsGWKqBz8F0MmNgUcWwJjNto+LyhFvVUCL8jMAxGo2bykMhyXSKsQWuvm32uKFPhJuWSlFztS1B9hfYtJGF8gRwX2HkWxGkQ2rdmAWaw3TnaGpQpd2yz9vsw3/c04q20YRJ8NYgJBwH7lhO644bqGhClHRhmiVnN+GE3HaYeA593CZWRsxZq6NF8grE9iv4LkxeemtFFmD2bjwtRBt+ViZZiwW9VCWwptNAKY2lU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dDh3DmNlNMYtRbCkep1A+E80j2kwbawtK7nZgCZmMM=;
 b=Qt4+CgC47cgwfskzPQr0dPlydAGBh+rc4s6jhyQ+RVp3qxuOLhI1CJTfY1uRSJDT2ycUK+y24ctmr3rwRStgaJQcSXHgOYLIl6SEucIjviUbA8lfL2cytlFND2vTqd9SYrHqyoxTgpfSP7qtWwAUZPmKeZ0ozPu5hE44qfUsnF4bMznIbiS6MMZt7KXXSUXqv5w7X2yTXtNViFpWjsKhaTjWmvHHJc2DjXdMUor8wZgbp5OAoHy/y2GQtV0oE+rCkUKJ/ClSuRL9gM1O4Jb9IUeZ0NPtrElZN+E/gLXLQUJS49QcdjFWvXy4aYVgJdE/nP6SOCNZiXskMafj18Ph9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dDh3DmNlNMYtRbCkep1A+E80j2kwbawtK7nZgCZmMM=;
 b=lGrSsw+VMBz7KZ/XIeJGwkOOcTwhjt/siLkuN449HtM7lOICupwO/njxcjA+KWNOvS3Ncvsp53ZbtZ46n6YTHkqRwJJQ2lFKlxkupe886y+7HtMFkLkBeQz4bocmMVNR5/mO+L5Qhm8k5ljfqsEaA8uLS8frwjpsNS9cGpNsAoU=
Authentication-Results: poorly.run; dkim=none (message not signed)
 header.d=none;poorly.run; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2748.namprd12.prod.outlook.com (2603:10b6:5:43::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Tue, 19 May 2020 14:37:15 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.3021.020; Tue, 19 May 2020
 14:37:14 +0000
Subject: Re: [PATCH] drm/doc: device hot-unplug for userspace
To: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200519100649.12053-1-ppaalanen@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <3b8add86-a65c-df60-4273-18be804a7174@amd.com>
Date: Tue, 19 May 2020 10:37:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200519100649.12053-1-ppaalanen@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:404:c9::29) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.7.192] (165.204.84.11) by
 BN6PR04CA0103.namprd04.prod.outlook.com (2603:10b6:404:c9::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Tue, 19 May 2020 14:37:13 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92a62427-358e-439e-a028-08d7fc021f9f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2748:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2748AF03BF8A7185BE17229BEAB90@DM6PR12MB2748.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9Q5cuZFK906LxRDNlcuOKBVnCU6CxBaDCwvWUeGW6Glpv5sIWzbOAEH+uoIBT2QTk7UYOwrDRMxTktX6INY4Hjz2Q+4RHbhIDYBV3bv6AVzS9uAvEmyl4LLW5jB4QVcswYWTM6VIJu2VYWSdL9q0tSpHN+NjYdXl8xODjwLeXnVoDRUo2t+jWmTl9G7qXs+m7hsjpBbQGzFglcxZiFs0t+dr8Zaza5UR8www8p0kbp4HRnCNedZhUMLk4bIHbf0+14x9ZSf4foVi8F0+eIMYEgLhBS6Tt8kRhkK2Q24Ci9allet7M2XdGsdhHL3mLO5cdRwqS6KeR3UywHdRv0ynxjANM7lo+JSq+yuculYlpZ7cnQd4JdKMAAjK2fP0E88PSXMppZrYS7fWqALrAfodvR6MDGBRDEm65Vi2qYsVaAInT+RzCxAANwHWOutVS4t2oDT500Dfsn+P4Uo7U6dFaCmCXYgv26eUgQCAWuXVrXBcy2+gpdl/PxUul+XIkASMeyuEplkS6fDs3KA2CxoTyvUu2s44y9QMFT2uwkkPuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(31696002)(26005)(86362001)(66946007)(66476007)(66556008)(2906002)(5660300002)(2616005)(53546011)(956004)(31686004)(45080400002)(478600001)(36756003)(54906003)(4326008)(186003)(52116002)(6486002)(966005)(16576012)(8936002)(316002)(8676002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: oyWyPBENa0VRcfhU3udBdP2awwFg1xJBHvKnfRO55LxwhrNJu3l+AQBeldotOZt0cklldSfGk/rcUXstRq3UhuNXwmOXkhlQc+C/014uahamfYE2eWNR1/DinpE0QJuZZeiMWw2zlEBF6TATzsBrdE7Kx0RcgXxJcqFN3xzg2Xuab31DTQRwu6JAlo3mTFk8CjjE3u3msbmb1f5uR67qlVJF8p8D1DGI64x7Rr346PVfvPhORFxhdE+KVEY8KXf9wZTAHjb+AimE27G+ruW1LW2u1NmBbskTqN0SIxIThr4yp0he8Adh4W3mFbGwQk3OVfUD28zu1HinZ5zqF54uxYTI18IIRh5edW9mJ0N9g2mM4ewNfy6pvu6yu3so5GGMnMNikFpPX8CtThRP0f4u3IBRqXMGtGGnf0ZsaMQ5WBy6Ucs2tJeHOnIwYXZXMOY9usd6mA2nFCnkdhJH4ISCAHbYO6oe9L8V9C1oDj1R05c=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a62427-358e-439e-a028-08d7fc021f9f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 14:37:14.9143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoJvSOo+SR9L/lJr0ODUZ6oyIyfxl4U0zbdxPKdogzzk9yIoHd+qGJgJiAIyiVFb7khavkzi37sFd3Pz4KvNXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2748
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

Thanks for the summary, does put things in order and makes it easier to 
comprehend all the TODOs, some questions bellow

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


Why wouldn't we return -EIO for the atommic commit IOTCL/legasy pflip 
and modeset ioctls here same way as you suggested returning -EIO for 
render ioctl ?

> +
> +- Pending non-blocking KMS operations deliver the DRM events userspace
> +  is expecting.
> +
> +- If underlying memory disappears, the mmaps are replaced with harmless
> +  zero pages where access does not raise SIGBUS. Reads return zeros,
> +  writes are ignored.
> +
> +- dmabuf which point to memory that has disappeared are rewritten to
> +  point to harmless zero pages, similar to mmaps. Imports still succeed
> +  both ways: an existing device importing a dmabuf pointing to
> +  disappeared memory, and a disappeared device importing any dmabuf.


Same as above, I would expect drmPrimeHandleToFD and drmPrimeFDToHandle 
to return -EIO in case device is detached


> +
> +- Render ioctls return EIO which is then handled in userspace drivers,
> +  e.g. Mesa, to have the device disappearance handled in the way
> +  specified for each API (OpenGL, GL ES: GL_KHR_robustness;
> +  Vulkan: VK_ERROR_DEVICE_LOST; etc.)


As far as I understood from our discussion we would reject any IOCTL 
aimed at a device which is gone and not only render ioctls.

Andrey


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
