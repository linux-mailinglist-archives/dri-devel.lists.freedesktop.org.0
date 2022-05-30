Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C508B537483
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 09:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A8C10E221;
	Mon, 30 May 2022 07:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDA110E221
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:09:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXRE1GHz38hyrAC3ex3tqO6WhzzFR3adFq5c+Y19T9i9S9qhocYR3jQgbSvwgBSdGk8rrKMDhkiA/5yKSFzkVzyqhODBMoL2FKJxMpEL7oljIGiZLK0LUjd8Vk7sCa4f/xJSAj4hLCdCFbgZVWauPP4siFz6e4kWphBa5wAEDTWo+0VEV8cx3ix2DPaPufJdwIhDYJVFKueKK2/XsHYA5WsT9Vi2IP7vc1cPjknDeTtEW5TzT0q8/lDTZzWiujEUlk3oOrYPmRRTeDwsdo8etvTjDVBEdI8P/H9k/53CAKVPsuMlD2fqzi0vRSRngqS2ZmIk5ADxEBhw6jbDKS4RCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxNJRzpNggJKTs+GBAZgeFyPXTeMXdP7rXlz58oLtRo=;
 b=WHrbkVPXjgrNxs7+wgrHQUgFQZINdBQqOfYJ8tjLjiQeWkUXXgFwUt8XBWB6G587Pv3sGCWuWEJNRd8V59FVIk9NbDAhE/gk1qtd7n2swE5X+HpLNlmPP6k9gSRGNHho86xFfuarbLJ1h+APjBY+xO12syUKxRm7n4Sk9x96PhkANnTShJ2lgVZnnLl84/tOGHTg+G6tEZHBbSas4drhewurHqyLjKZGvQKnp+omNKw88R6hRpZx461cVZ8O8I51MSjg+QhgIMItHce90TcXDf/+1nd0mgjeSC2X60676XMh1vd5E9fzGIjmYrWPLA1++nMgZSoNX/dpjnFVhiASfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxNJRzpNggJKTs+GBAZgeFyPXTeMXdP7rXlz58oLtRo=;
 b=se4ZWmJXh26cPqNybpWwQ4gM9bhmtBpiYJc+KOlHYM0HUktkIXG81htWXY9D4Yrfvpfyh/UJ+AcedpQvQrF9KTMeW5ITiLGcB/Mrc35ZhM7/QVwXlFAojpQ/IOG8kTQLPVp6FzaHcWvbV2eaDp11KcbXHzaMhL2yhhbXpNpZ3kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 07:09:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 07:09:39 +0000
Message-ID: <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com>
Date: Mon, 30 May 2022 09:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3] dma-buf: Add a capabilities directory
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20220527073422.367910-1-contact@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220527073422.367910-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0097.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::38) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bb84be9-0c1a-49bc-0bd1-08da420b5cdd
X-MS-TrafficTypeDiagnostic: DM6PR12MB4466:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4466CFD9DA6A6845CD50E39583DD9@DM6PR12MB4466.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gIJnBNCxK8nFmZesQsheAsbDOUMTuZCVEpFStRkR2rLMRIBAhIr6I3x/5lXDPu6m4N+LMXDKzcXAy85/yi/bfcH2Pad+NbbmpwFozKHu1CNs6otiQRuthvuglt0vJhB3IDOJ7ohILtF2JYCVm02dumUvdEZ8NF22QCLjJ/VtDZqUPPWWcK4DuF2fwnTUEWsnMNT5CkK1oJE6UDIDHbOw1WA+LFlc2wHAXYmRYJ1QfrDXbEha+7zClCLa3crMgBB9mbEnxbOBes2Oce2Z3Y8Mgf7e9l2gtAAEidQiuQM3f0E8/Ow0ENag0IxwDDuMyiqTLB0k6PeOh2ix9AsO8wE7Pa/06nNGSwrxmKG/j91wEcDS8NFJKJkFa9L0ErQSBL52Jwb+MFl1LhZ6llzx43NUXBcLBd0blrUB8M1ewi+uDJX9rBMAS+fUpH+fZ6pyX61ehnk6wOndNUGaf9MJIKYxqpVWwBrVLuf10Y/gfHRj6xZrVBZ3W9X+SpZYv7RtWn7J9ihMMEfHlcZLHPI6SEms5076xRaPgxTPmOI6kticXtl1dKuAyY+9i1GI+WX6dHKp+DKv/HLN4Ir0UXBLxEib0qrFowFJPFnLGi0vyMxLtgaEtgUSn3/zQ82vbM1PligcvhjctFGjZsD8UW6ToFYofVWB7aji0j+GMg3/+DWWLXJQxfryVwtmiyDiOZqhIDeTZ7kldx/VDUGzSC/AEMph0hb3yzXT4F9oerxhTVMRmT5iiScXe6djV7VJ4wcoGTX3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66946007)(66476007)(66556008)(8676002)(38100700002)(5660300002)(2616005)(86362001)(186003)(30864003)(8936002)(31696002)(6666004)(508600001)(6486002)(26005)(54906003)(6506007)(31686004)(2906002)(6512007)(316002)(66574015)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2FOdDZVT0JxZHFkeDNURWtZVlcyVnV6ZkZaOUFMTDNsbFppd29qWHNPMU0x?=
 =?utf-8?B?SzJ6VHl2VnhBaThmL0IrMHdZZURuQk1BNnFMb1ZQNEVHU2FjWGErT0lvL2Vu?=
 =?utf-8?B?WldpdWYvR3hvaG1OVnpyNytHK2hmNVBLYlFNbFhvNlJXMW9iQ0VEeUhvWnpm?=
 =?utf-8?B?ekF2ZDBHQ0U0cS9zRnUwYmdEdjZsUk1vam14bWdxemtMZTlIMFh1NjVOdmNw?=
 =?utf-8?B?R24wYlVhNlhBdG9qamV4U2xjb1JtbFBBR2FxcmxvUGhIYkhwSTRYNmdpSXpv?=
 =?utf-8?B?MlNNb2tpbFp1dytoSW1mM0tuQm9jM0FWRnQvcHJPeVRUVkhQTkQ3S3UwNStM?=
 =?utf-8?B?aGFXUHF5N3NXbHZtVmY4UHExRm5HQVpmc1BDN0hFdjdRMFBhMnpGbXRtY3M0?=
 =?utf-8?B?MmpxNGYyS3FwRHptdTBBTmd5OEU2ZXV3cG5OVnR2WmgrZDNKVWtKdVFBQmN4?=
 =?utf-8?B?YSt5eVlzREhiWDRaaHp3T0NVeFd1TEhCbDNUV2crWWdWK0pnT0JBb0VUYVJI?=
 =?utf-8?B?RW5Ra295eWprN0QyZk9RVmQ2SFhzS0xOUlRocEg3c0FCa3U0aXQrNnVUbnEr?=
 =?utf-8?B?bVo2OEI4QWpBNStwVXNNLytjMWE3b0xPTWgrMXFkMERyZmZiRG1NTFd3VmZ0?=
 =?utf-8?B?QkUvNUFzOHYxM2VjRytNalppOUdhODcrWHlMbEpROXdXTS8yM0V5YXVOSlZO?=
 =?utf-8?B?WVhyY1VGb1l1VkFUM3RESXhyaitWcWowdFl1bHJCanNvVk05UGRuZXl6UnIv?=
 =?utf-8?B?TnA2Wlc1eGhNM1BYS0h5UGQwc1NjMmVRZFVhWXNwV2huQ2hkK2tLT1Nqb1Ux?=
 =?utf-8?B?WG1TbTUybDBYZHRVUDgyVThJc0RlUGp1cXNiKzVUMHhIRDhDc1o1QUlnZFV2?=
 =?utf-8?B?S2MxeEc5dlVsbGNtb0lmclRxbTViS29VNjBKNzRmTUlVUXk0N0ZsNHlxL3Vk?=
 =?utf-8?B?WXlGb1p5MFZ3cmIyVGVuT2Vpd3NRNEtMdzhMVkZnVjBpMDZSbktxakxJRlUy?=
 =?utf-8?B?T1E3VnorK2pEbzdxSnJ0elpTY1ZsRGNWRk04TGx6MTRYMWVhcG5GckZyRTgr?=
 =?utf-8?B?RlU4aFZTWnB1eDlBYTlNbW1XVjFsSjIyT2o2SG1xR1FYanhQSEwzbTVVVGQv?=
 =?utf-8?B?ZzdickJhQlhnZW5HMmFMTU50eFh2K0JzTkRmaUtpT0lneTMrVitFN3VxdTlG?=
 =?utf-8?B?SDIraGtkaFZlK001ampZZTdPVWh2ZWtNbTNkMkxQOHpoT3E2bE1hM3ZyYVJt?=
 =?utf-8?B?ZmZzWHZSU3BTU2MvMEhTTU9adW03bjRhdUN2Ymd4YXQ3SzhHNFE4VUdFOXBC?=
 =?utf-8?B?bHRqbFFSU05hUXBzNmpacWdwbm5QaVdQWkNqdjc1NnVRbVZkM1ZWOTBBRmZi?=
 =?utf-8?B?aGFicitudXNyMFBZZnpMOWNjOEFhWFVXNllJdDR1dEJhNll3Y1FLRlpNM3Mx?=
 =?utf-8?B?THVwTVZIWWVxd1o4LzZDRm1rMEVvcDNHbjB4cGZKMU8rUm9xMlZadGFsUjhh?=
 =?utf-8?B?UDMrV3pPOGVOZjkwekVDNklCRnBiVWx0RkRuUVladnVVbFFTSjFqSjMyVWVa?=
 =?utf-8?B?QmNYOVZjOFgvOTJ2bEFSc1JPSTYxZ3hmTDJDY24zQXA3SzFEckl1ZUMxZFRB?=
 =?utf-8?B?eTFITHlQS0thWGtOb05SSXpnai9IQitEZGhKLzVzWUF2SmdaY1c4b2xraFJC?=
 =?utf-8?B?ZTBzT1pwWFVwUEZ1RzUzSG1nZEhyc2hJYmU1VEFYVGxOTWFrbHFxWDNIaU1E?=
 =?utf-8?B?MkhoKyt0MG9IMjdrc3lJK2Jhdkw4VHNObGVmckk1alQwWS9KZ0ROT1lleEhR?=
 =?utf-8?B?eUh3ZXhvTFh0RjhPUTBORitaNTI1WWY3WkZjbHVHRkNYWUFGQUdTRVZscGZh?=
 =?utf-8?B?M3EyQ2JKLzRuM0czbFBEclZHbjNpSGk1emVzRG5sd1FhMU9PeGNPL1NYNk9Z?=
 =?utf-8?B?amZPdDlqekg0OWFhOHNMbTNyK0NQR0JJQ0IvbG1RSUJSZVJ5MTlBZHQxRmxP?=
 =?utf-8?B?NW5vRmRyaGk4MzUwSkpIWmpObWlRRDBib3FBMHdhWHdjQUp1SXhKaWgwYXFI?=
 =?utf-8?B?Yit0MGI0UTJxaytLS3RiS0FWdUkwMlgyQ1VlTGlzdlBwQmlMUm1lOFhpQkZW?=
 =?utf-8?B?d09wbFgyYTRMOHNxV1pwd2U1RXluUDBESTNybVczbktXYzNFYmZ1VzhFU216?=
 =?utf-8?B?T1FoNFNlQVFYc0VTakU4c1paV3NxTGNBWlJFMXBNVzkvWnd5ZjRKdzdlQkJS?=
 =?utf-8?B?TkFuYjc5ZlgxdEUyeDZFTm1icXAzVXNiWDBUZ1JIU1FFRDRjUUU1NVVJeG9C?=
 =?utf-8?B?RFpiY3Nqdko5RXJEZDRCMjdDSGwwSEFDNGNhREU5bTlobW9IQkhtZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb84be9-0c1a-49bc-0bd1-08da420b5cdd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 07:09:39.8285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6Ta8/6+pdz1ajR+4FlnMt25QYLNnF59VL3OZS4eghIw3/2PEVb3602yno+KQeFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>, Greg KH <greg@kroah.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.05.22 um 09:34 schrieb Simon Ser:
> To discover support for new DMA-BUF IOCTLs, user-space has no
> choice but to try to perform the IOCTL on an existing DMA-BUF.
> However, user-space may want to figure out whether or not the
> IOCTL is available before it has a DMA-BUF at hand, e.g. at
> initialization time in a Wayland compositor.
>
> Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> subsystem to advertise supported features. Add a
> sync_file_import_export entry which indicates that importing and
> exporting sync_files from/to DMA-BUFs is supported.

I find a separate directory rather unusual, but can't come up with any 
better idea either.

IIRC the security module had a mask file with names for the supported 
capabilities.

>
> v2: Add missing files lost in a rebase
>
> v3:
> - Create separate file in Documentation/ABI/testing/, add it to
>    MAINTAINERS
> - Fix kernel version (Daniel)
> - Remove unnecessary brackets (Jason)
> - Fix SPDX comment style
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Greg KH <greg@kroah.com>
> ---
>   .../ABI/testing/sysfs-kernel-dmabuf-caps      | 13 +++++
>   MAINTAINERS                                   |  1 +
>   drivers/dma-buf/Makefile                      |  2 +-
>   drivers/dma-buf/dma-buf-sysfs-caps.c          | 51 +++++++++++++++++++
>   drivers/dma-buf/dma-buf-sysfs-caps.h          | 16 ++++++
>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 16 ++----
>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  6 ++-
>   drivers/dma-buf/dma-buf.c                     | 43 ++++++++++++++--
>   include/uapi/linux/dma-buf.h                  |  6 +++
>   9 files changed, 134 insertions(+), 20 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.c
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-caps.h
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps b/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> new file mode 100644
> index 000000000000..f83af422fd18
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
> @@ -0,0 +1,13 @@
> +What:		/sys/kernel/dmabuf/caps
> +Date:		May 2022
> +KernelVersion:	v5.20
> +Contact:	Simon Ser <contact@emersion.fr>
> +Description:	This directory advertises DMA-BUF capabilities supported by the
> +		kernel.
> +
> +What:		/sys/kernel/dmabuf/caps/sync_file_import_export
> +Date:		May 2022
> +KernelVersion:	v5.20
> +Contact:	Simon Ser <contact@emersion.fr>
> +Description:	This file is read-only and advertises support for importing and
> +		exporting sync_files from/to DMA-BUFs.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 11da16bfa123..8966686f7231 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5871,6 +5871,7 @@ L:	dri-devel@lists.freedesktop.org
>   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/ABI/testing/sysfs-kernel-dmabuf-caps
>   F:	Documentation/driver-api/dma-buf.rst
>   F:	drivers/dma-buf/
>   F:	include/linux/*fence.h
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 4c9eb53ba3f8..afc874272710 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> -	 dma-resv.o
> +	 dma-resv.o dma-buf-sysfs-caps.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
>   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.c b/drivers/dma-buf/dma-buf-sysfs-caps.c
> new file mode 100644
> index 000000000000..82b91eb874a9
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-caps.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DMA-BUF sysfs capabilities.
> + *
> + * Copyright (C) 2022 Simon Ser
> + */
> +
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include "dma-buf-sysfs-caps.h"
> +
> +static ssize_t sync_file_import_export_show(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static struct kobj_attribute dma_buf_sync_file_import_export_attr =
> +	__ATTR_RO(sync_file_import_export);
> +
> +static struct attribute *dma_buf_caps_attrs[] = {
> +	&dma_buf_sync_file_import_export_attr.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group dma_buf_caps_attr_group = {
> +	.attrs = dma_buf_caps_attrs,
> +};

Didn't we had macros for those? I think I have seen something for that.

Apart from those two random thoughts looks good to me as well.

Regards,
Christian.

> +
> +static struct kobject *dma_buf_caps_kobj;
> +
> +int dma_buf_init_sysfs_capabilities(struct kset *kset)
> +{
> +	int ret;
> +
> +	dma_buf_caps_kobj = kobject_create_and_add("caps", &kset->kobj);
> +	if (!dma_buf_caps_kobj)
> +		return -ENOMEM;
> +
> +	ret = sysfs_create_group(dma_buf_caps_kobj, &dma_buf_caps_attr_group);
> +	if (ret)
> +		kobject_put(dma_buf_caps_kobj);
> +	return ret;
> +}
> +
> +void dma_buf_uninit_sysfs_capabilities(void)
> +{
> +	kobject_put(dma_buf_caps_kobj);
> +}
> diff --git a/drivers/dma-buf/dma-buf-sysfs-caps.h b/drivers/dma-buf/dma-buf-sysfs-caps.h
> new file mode 100644
> index 000000000000..d7bcef490b31
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-caps.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * DMA-BUF sysfs capabilities.
> + *
> + * Copyright (C) 2022 Simon Ser
> + */
> +
> +#ifndef _DMA_BUF_SYSFS_CAPS_H
> +#define _DMA_BUF_SYSFS_CAPS_H
> +
> +struct kset;
> +
> +int dma_buf_init_sysfs_capabilities(struct kset *kset);
> +void dma_buf_uninit_sysfs_capabilities(void);
> +
> +#endif // _DMA_BUF_SYSFS_CAPS_H
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 2bba0babcb62..e2e62f83ce18 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -141,23 +141,14 @@ static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>   	.filter = dmabuf_sysfs_uevent_filter,
>   };
>   
> -static struct kset *dma_buf_stats_kset;
>   static struct kset *dma_buf_per_buffer_stats_kset;
> -int dma_buf_init_sysfs_statistics(void)
> +int dma_buf_init_sysfs_statistics(struct kset *kset)
>   {
> -	dma_buf_stats_kset = kset_create_and_add("dmabuf",
> -						 &dmabuf_sysfs_no_uevent_ops,
> -						 kernel_kobj);
> -	if (!dma_buf_stats_kset)
> -		return -ENOMEM;
> -
>   	dma_buf_per_buffer_stats_kset = kset_create_and_add("buffers",
>   							    &dmabuf_sysfs_no_uevent_ops,
> -							    &dma_buf_stats_kset->kobj);
> -	if (!dma_buf_per_buffer_stats_kset) {
> -		kset_unregister(dma_buf_stats_kset);
> +							    &kset->kobj);
> +	if (!dma_buf_per_buffer_stats_kset)
>   		return -ENOMEM;
> -	}
>   
>   	return 0;
>   }
> @@ -165,7 +156,6 @@ int dma_buf_init_sysfs_statistics(void)
>   void dma_buf_uninit_sysfs_statistics(void)
>   {
>   	kset_unregister(dma_buf_per_buffer_stats_kset);
> -	kset_unregister(dma_buf_stats_kset);
>   }
>   
>   int dma_buf_stats_setup(struct dma_buf *dmabuf)
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> index a49c6e2650cc..798c54fb8ee3 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.h
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -8,9 +8,11 @@
>   #ifndef _DMA_BUF_SYSFS_STATS_H
>   #define _DMA_BUF_SYSFS_STATS_H
>   
> +struct kset;
> +
>   #ifdef CONFIG_DMABUF_SYSFS_STATS
>   
> -int dma_buf_init_sysfs_statistics(void);
> +int dma_buf_init_sysfs_statistics(struct kset *kset);
>   void dma_buf_uninit_sysfs_statistics(void);
>   
>   int dma_buf_stats_setup(struct dma_buf *dmabuf);
> @@ -18,7 +20,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf);
>   void dma_buf_stats_teardown(struct dma_buf *dmabuf);
>   #else
>   
> -static inline int dma_buf_init_sysfs_statistics(void)
> +static inline int dma_buf_init_sysfs_statistics(struct kset *kset)
>   {
>   	return 0;
>   }
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 5e1b0534b3ce..b5c5a5050508 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -30,6 +30,7 @@
>   #include <uapi/linux/dma-buf.h>
>   #include <uapi/linux/magic.h>
>   
> +#include "dma-buf-sysfs-caps.h"
>   #include "dma-buf-sysfs-stats.h"
>   
>   static inline int is_dma_buf_file(struct file *);
> @@ -1546,22 +1547,54 @@ static inline void dma_buf_uninit_debugfs(void)
>   }
>   #endif
>   
> +/* Capabilities and statistics files do not need to send uevents. */
> +static int dmabuf_sysfs_uevent_filter(struct kobject *kobj)
> +{
> +	return 0;
> +}
> +
> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
> +	.filter = dmabuf_sysfs_uevent_filter,
> +};
> +
> +static struct kset *dma_buf_kset;
> +
>   static int __init dma_buf_init(void)
>   {
>   	int ret;
>   
> -	ret = dma_buf_init_sysfs_statistics();
> +	dma_buf_kset = kset_create_and_add("dmabuf",
> +					   &dmabuf_sysfs_no_uevent_ops,
> +					   kernel_kobj);
> +	if (!dma_buf_kset)
> +		return -ENOMEM;
> +
> +	ret = dma_buf_init_sysfs_capabilities(dma_buf_kset);
>   	if (ret)
> -		return ret;
> +		goto err_kset;
> +
> +	ret = dma_buf_init_sysfs_statistics(dma_buf_kset);
> +	if (ret)
> +		goto err_sysfs_caps;
>   
>   	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
> -	if (IS_ERR(dma_buf_mnt))
> -		return PTR_ERR(dma_buf_mnt);
> +	if (IS_ERR(dma_buf_mnt)) {
> +		ret = PTR_ERR(dma_buf_mnt);
> +		goto err_sysfs_stats;
> +	}
>   
>   	mutex_init(&db_list.lock);
>   	INIT_LIST_HEAD(&db_list.head);
>   	dma_buf_init_debugfs();
>   	return 0;
> +
> +err_sysfs_stats:
> +	dma_buf_uninit_sysfs_statistics();
> +err_sysfs_caps:
> +	dma_buf_uninit_sysfs_capabilities();
> +err_kset:
> +	kset_unregister(dma_buf_kset);
> +	return ret;
>   }
>   subsys_initcall(dma_buf_init);
>   
> @@ -1570,5 +1603,7 @@ static void __exit dma_buf_deinit(void)
>   	dma_buf_uninit_debugfs();
>   	kern_unmount(dma_buf_mnt);
>   	dma_buf_uninit_sysfs_statistics();
> +	dma_buf_uninit_sysfs_capabilities();
> +	kset_unregister(dma_buf_kset);
>   }
>   __exitcall(dma_buf_deinit);
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 70e213a0d7d9..ab3afd5da75a 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -114,6 +114,9 @@ struct dma_buf_sync {
>    * ordering via these fences, it is the respnosibility of userspace to use
>    * locks or other mechanisms to ensure that no other context adds fences or
>    * submits work between steps 1 and 3 above.
> + *
> + * Userspace can check the availability of this API via
> + * /sys/kernel/dmabuf/caps/sync_file_import_export.
>    */
>   struct dma_buf_export_sync_file {
>   	/**
> @@ -146,6 +149,9 @@ struct dma_buf_export_sync_file {
>    * synchronized APIs such as Vulkan to inter-op with dma-buf consumers
>    * which expect implicit synchronization such as OpenGL or most media
>    * drivers/video.
> + *
> + * Userspace can check the availability of this API via
> + * /sys/kernel/dmabuf/caps/sync_file_import_export.
>    */
>   struct dma_buf_import_sync_file {
>   	/**

