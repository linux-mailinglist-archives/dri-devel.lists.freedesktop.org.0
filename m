Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7FD5690C8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE8E8926F;
	Wed,  6 Jul 2022 17:39:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5704113CEA;
 Wed,  6 Jul 2022 17:39:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eat23WSrH0xT47UmsHPOdVBJjHbc1uwp/GtepealfhPQ+do5w4szRuj/5+h1v9ImLMqTva78zuHvW+ALFldlwwyX/Gz7JZnCFlmx4LEBseOfUDpJUDACjCYvYF1bZTiSQJFuMDx5+1nrq/VD7GSRkxCGIJqeM7D6FRufHYSYqO0pa0FydncQ3MLA63n4OzOfUFFfvLNgC2xUW6pb0CzvctQ+Ukit19EgxvZSQKEZpCxu9A0fXfqDXCl7Ahx0VJGgCX86UtdWeDF8HACBO+SLrsVFvh9+F8KQbeXKwNmKEHyrf1lTLXMu2Lgkv7OkXfl4eNyaNFGSL2AT20sx8uIitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+r0Gxo1XStc+Gtqzl8rm9antejZvEOOv5JHL2ltB+8=;
 b=WhZiJ2ETuRy9Gra+gNIAWFlh5/vsYZ7U/gPILX7cZHOhZVO0FjXpNNIfFgNKgEOJYNlrgxa4TYKLGqcE4LIbH1zlyI0cVNlbyi9u4cy3P4tXdQQW7unc+1n1NJnNjMZUh8DCZSa+D6Ng18JrZd3z2F9LkuJfJpDZgGtI/GoAk1B402EAsgclUzl1OC21Lbhi+WGIKXXGtVSUFn8uen9Vt6qWeDpmo67BPCYYROFZMvuWdG9gJdelujyqefqZmSFcwxS2t58A9LnLFc/XI6GF0kvo7TsD4990vyn1LalvPC14ST8MhaCIUnbqLgpeD1HrRebLr7QgjOJ56nMgkb5FAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+r0Gxo1XStc+Gtqzl8rm9antejZvEOOv5JHL2ltB+8=;
 b=P9EB6/BBhJkFis52lEnUOIF28yzdRUGl0nT1xfE5v6/d27pchOKCuAEs70K2C5ML/K+jQQtPonQiqmHCzimT5qccQu1ODd0YYvPVmKlNhW6WdPEpMNvVL1EPdCE5mLbinE+NtK0obOcWoN7eu/uCPpzKnjinNJuJb2Rl0USWnCs+Pv7oAvW1vKqS7v3QM7mSzUfy37jSMcaHzRRpoKpn0ENLbtF5jBaq9buerA00/nvn/HQpqryvxWbqk2QvqIshgvXNWaM9Ca949sMjlJ7gHwXu/TrBhSdTgClQBtsbVEFxCyfilk3NVjmjyHHF2k3VdSMrGw54uKZ35xOFUI3zhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by CH2PR12MB4822.namprd12.prod.outlook.com (2603:10b6:610:6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Wed, 6 Jul
 2022 17:39:18 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::e16c:261d:891d:676c]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::e16c:261d:891d:676c%3]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 17:39:18 +0000
Message-ID: <0a092885-cf6a-1244-a7c9-2fb42902aba7@nvidia.com>
Date: Wed, 6 Jul 2022 23:08:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>, corbet@lwn.net, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, farman@linux.ibm.com, mjrosato@linux.ibm.com,
 pasic@linux.ibm.com, vneethv@linux.ibm.com, oberpar@linux.ibm.com,
 freude@linux.ibm.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
 alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
 kevin.tian@intel.com, hch@infradead.org
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
From: Kirti Wankhede <kwankhede@nvidia.com>
X-Nvconfidentiality: public
In-Reply-To: <20220706062759.24946-5-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f152830-a3af-4121-7e38-08da5f767401
X-MS-TrafficTypeDiagnostic: CH2PR12MB4822:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUk+ucwnoduypz0MKT7ktKngeOREKdPaZQ2TNaMiil94XQ651xsPrl2HJZ7xIVOWTq4SUNPrnJ3y2waqUz2AySHbHoSAaUy2XAIxoX4TDDvOCqPCxeVzRKBcW9efuEyAoX7iEMqAIbvMqHHtT5rvxoVoG8uaVBRRsvGlPz+C35R2yDaPeVpSd6CuOmRenAzONX5iOvo81ifkWItMBKq1T+pV1UozaFSMucQ+GMHv2u8gGx4TnMcTxiCeaoX+F8CNY7SmGcxt/1Iu78eofyoS/arC8ye+h7lyj8azk6TORJrRkEYW1HqQobioirW4tZQI77uk54OnLvQAM5tSzxdFzcdwBpHRyGdFQTem1MC1frsf98oydoI5ffXDWvTyNevLgJuxbj1NT0919laX3igjCUcKDLs0oMcgrBEy1WmftBZMpqKa8iLyEr3jMu4xOYmc6CETrQ7c3VPEKZUR+g0tWjTOHiPRqgPHZy6L8fSXZ97aK2Q7dto42C98piDoPWV7ptyV79XFU4k1UkIcHbrQ9EIt7ZIlD8ivuOGG3EV93YEEeSDc0T7PsTLmEj5//t5ijn/HgkZMFJYoGzpxMBBWia/66opHqVP27DEHOzQavUfkwN81jE+o973OvxE1nScXa6PCYVGFZPtHBB17obfh/SQ+gJc1X0s2TLSOcGeylzzImaR6X84IN2kfD9IdTzfroDS/7MJPGuM/JSO2CAVfnSzLV66XXQT/A9n0nZ/8wmoP7WCIt8tEzCq0PRKfNyYP3/1dfUNLV2vHgVlY5T6krMUirqYVMi9P+X6b2htZH7d66DlSxYJQoMPMX8jXHgZvieHvIs+kTr9IAzrBL+1OUibipSiypmLXxMigypeutA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(7406005)(7416002)(53546011)(55236004)(8936002)(478600001)(6506007)(5660300002)(2906002)(921005)(41300700001)(6666004)(30864003)(4326008)(66476007)(66556008)(38100700002)(8676002)(26005)(54906003)(36756003)(186003)(6486002)(31686004)(6512007)(31696002)(107886003)(86362001)(83380400001)(2616005)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXhJM1FReEJCVFJiWk9RcVU2NzAwd292VW4xQ2JXNm9uUzNsY3RROG53a0FF?=
 =?utf-8?B?RlArU0VCazZNalRMVFhaR3RoSGxEcDZwV2FXamtwaCtqZDMvUmpIU010ZC9E?=
 =?utf-8?B?bVUwVStNT0Rxcy9PdEhPbmpPT1dpYTlHMTVJd2g5N29EQllmMlR2UU5FS0Vi?=
 =?utf-8?B?cFB6bEg1MEpLdzNvWHVZcTdVeXBLdlVvQXBnclhPemZpa3BnVWpYeVN1bWpM?=
 =?utf-8?B?SzRSUWM1eVlmYjIrem1kaVdybkN5UzVLOXQyMWZFTktrU2FVQ1U0OFdHbmRO?=
 =?utf-8?B?dVJXcDBRbGE5R0RVWlhZbWdNL2hoNlBpMXdYTTZXc2Nyd3ZNS2VtS3FLdThY?=
 =?utf-8?B?eEllWmV1aTl2UXpZd3FUNyt5dXgxQ1lLRTFVbk5pc3VuMjJZZUFvZXQ5Z3NV?=
 =?utf-8?B?NlpyVmk3ei8vamZWc1ZBOEorazFUaG5hM2FnMUZLVXZIV3BEVHRZZEwxM0xG?=
 =?utf-8?B?VnNkNHA3OVdKZkJlbnJiMk9qSTZVMXQyUElpUHUvakRJbTdzMSs4OWF4dHNz?=
 =?utf-8?B?R2NBbUx5a1l6KzhSN2d0KzRJT04yYTJJKytPcGpzZFdYdmJucE9UL2haUGh4?=
 =?utf-8?B?aHRqU2s1Z2NuWFdUcTRDV2lEeSs2Q1NsT0p3WG53NGZ1aW96ZndrU3cvNVF4?=
 =?utf-8?B?SENaOEtzd09DbE44WDkwSTRoM1gzRER4aEgyeGtkamJ5TUNRaTJBZUpHK3Ft?=
 =?utf-8?B?RVhGOWoyU2ZmRjQzWXZsUUJhQ3JQSVZ4NWJxSHg2VFVKbzZHcU53WVdaRkcr?=
 =?utf-8?B?TWY3RUxtdWZHeHhaSE5tYjh5NlFqbUhVMUtXVkdPTmN3a3VONm5kMkpMM2M2?=
 =?utf-8?B?Wm1VU2xZRjVZZytCQkpQZXgydjliZzhsNTVRcG9kblRBRWZkME9ueU5RU0xq?=
 =?utf-8?B?OVE0R0ZoY3F2RldjMFc3UERBMEgzY1htZ1Y4VnVrN0JERUlWb0VaVDM1alJn?=
 =?utf-8?B?RGUydFh0aXBPTis0UmNSQzlyNk5WUVhIRUJ6YlB6QUkrUTBJTDNPU085eldI?=
 =?utf-8?B?cVlYV3o3bWNDaEdTcU5UdlhtSVRxTTV6NzNocWg1blFLQlBvVnNqVXl6OWt2?=
 =?utf-8?B?OCtMVjNDMlBQdWZ1cGk2d2duMkE3YktocHdxcEtqMmVUU3lObTVINzJ1QStt?=
 =?utf-8?B?NVdYQ3JLZ2RBcGN0YXlCb3dhTDkyNGtZajdFNkZoZGVIOTcvODkvZmVNT0RK?=
 =?utf-8?B?NEdRUk56Sisydk5QY01McFpQellLN0pmUjlYR0RUeVV6bnFEOHhiQUUxc1BB?=
 =?utf-8?B?dk1BYWY3UUxhNEZoQWMrbGF6S2JhQThWYkFFVjJpWFpRTDBvM2xXSk43VjR4?=
 =?utf-8?B?TXQ2dW1uaTYrdDc3SVVXNkVSZU12MlIzRnBHbHJDL25QQURjSGs3elRQalBS?=
 =?utf-8?B?WDg3NEhwUkJ6dlFjclV2M1JCZjlKamFheTdyOHd1YkxVeml5UGplSEtsaUEr?=
 =?utf-8?B?RlYrMkxaT05icUt0WVlwYyt4VzcrYjdNUGJ4ZVJFeVdhaDVLcksrRWlvTzBT?=
 =?utf-8?B?S0tJSW1qYkZ3ejZ3VDNqOXh6eFJmMmtQdC8vcXp1aGM0T2VrdnB1Z0U1Tncv?=
 =?utf-8?B?dW9tQWx0ZUhUNUZwWWY4WmEvM1pQUEw5aVpKa09ydlJrR3hSQWI4UkFDQ3Z4?=
 =?utf-8?B?UjAvajZZTVh0TDRLUmNXenkwUW5nRzBRRFpYa3hwakxuQUFkRGlrdktxcFI2?=
 =?utf-8?B?YmRETHMzTzlnckxzWG5wREJEd0M4eU1WaUJ5ZWp3NUFZcEVaUlJyc1N4ZXpI?=
 =?utf-8?B?Unh0RUloNk1STkhNVjFNNCtqUUEvaFU4c1FuVWJYcXNmSXpmTzdKMlA5WHIr?=
 =?utf-8?B?K1ZhOWJwMHBmb0lZa3N6YURDUFlPbmpOanBRSXBTSU5UdDBXWWtyM2tLVkVB?=
 =?utf-8?B?ZVdVK3hBMzUvcmJqU1IzbUY1TWVYSmw3R0V1b3Z6eTN6R2ROZ1gwYWRkUkFI?=
 =?utf-8?B?a0d5ci9qUElrNVZSbGM0aHFQa2hEUHB5cWxSTkhsYWtnOU9JNGZJeHRMOFBK?=
 =?utf-8?B?VGFBaVJtK3ZTekNOQmJHOHR6VHYvMnIveFJoTDZ2WXF1YmVqVkJVZy93ejdk?=
 =?utf-8?B?bHpNdnNLdmJ6ZVZ5OXJZYVVLcXdoOGxJZE1md3k1ek1WUmhpaXJuZjIxV29q?=
 =?utf-8?Q?jdMFnPEQOAJzX0+43MMDVtCBY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f152830-a3af-4121-7e38-08da5f767401
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 17:39:18.6505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0Dmw3eWbj2FBBJuiuvWVepSDjbfUxJwwsoO4o6l/OsrZmWCoBKqyHY5nQ2Vz1rrGgwcUVMGtR2USDib6V6wvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4822
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
Cc: linux-s390@vger.kernel.org, Neo Jia <cjia@nvidia.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 jchrist@linux.ibm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tarun Gupta <targupta@nvidia.com>,
 Shounak Deshpande <shdeshpande@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>


On 7/6/2022 11:57 AM, Nicolin Chen wrote:
> The vfio_pin/unpin_pages() so far accepted arrays of PFNs of user IOVA.
> Among all three callers, there was only one caller possibly passing in
> a non-contiguous PFN list, which is now ensured to have contiguous PFN
> inputs too.
> 
> Pass in the starting address with "iova" alone to simplify things, so
> callers no longer need to maintain a PFN list or to pin/unpin one page
> at a time. This also allows VFIO to use more efficient implementations
> of pin/unpin_pages.
> 
> For now, also update vfio_iommu_type1 to fit this new parameter too,
> while keeping its input intact (being user_iova) since we don't want
> to spend too much effort swapping its parameters and local variables
> at that level.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   .../driver-api/vfio-mediated-device.rst       |  4 +--
>   drivers/gpu/drm/i915/gvt/kvmgt.c              | 24 ++++++-----------
>   drivers/s390/cio/vfio_ccw_cp.c                |  4 +--
>   drivers/s390/crypto/vfio_ap_ops.c             |  9 +++----
>   drivers/vfio/vfio.c                           | 27 +++++++++----------
>   drivers/vfio/vfio.h                           |  4 +--
>   drivers/vfio/vfio_iommu_type1.c               | 17 ++++++------
>   include/linux/vfio.h                          |  5 ++--
>   8 files changed, 40 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> index b0fdf76b339a..ea32a0f13ddb 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -262,10 +262,10 @@ Translation APIs for Mediated Devices
>   The following APIs are provided for translating user pfn to host pfn in a VFIO
>   driver::
>   
> -	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +	int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>   				  int npage, int prot, unsigned long *phys_pfn);
>   
> -	void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +	void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova,
>   				    int npage);
>   
>   These functions call back into the back-end IOMMU module by using the pin_pages
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 8c67c9aba82d..ea6041fa48ac 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -231,16 +231,8 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
>   static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   		unsigned long size)
>   {
> -	int total_pages;
> -	int npage;
> -
> -	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
> -
> -	for (npage = 0; npage < total_pages; npage++) {
> -		unsigned long cur_gfn = gfn + npage;
> -
> -		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
> -	}
> +	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
> +			 roundup(size, PAGE_SIZE) / PAGE_SIZE);
>   }
>   
>   /* Pin a normal or compound guest page for dma. */
> @@ -258,14 +250,14 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   	 * on stack to hold pfns.
>   	 */
>   	for (npage = 0; npage < total_pages; npage++) {
> -		unsigned long cur_gfn = gfn + npage;
> +		dma_addr_t cur_iova = (gfn + npage) << PAGE_SHIFT;
>   		unsigned long pfn;
>   
> -		ret = vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
> +		ret = vfio_pin_pages(&vgpu->vfio_device, cur_iova, 1,
>   				     IOMMU_READ | IOMMU_WRITE, &pfn);
>   		if (ret != 1) {
> -			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
> -				     cur_gfn, ret);
> +			gvt_vgpu_err("vfio_pin_pages failed for iova %pad, ret %d\n",
> +				     &cur_iova, ret);
>   			goto err;
>   		}
>   
> @@ -309,7 +301,7 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   	if (dma_mapping_error(dev, *dma_addr)) {
>   		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
>   			     page_to_pfn(page), ret);
> -		gvt_unpin_guest_page(vgpu, gfn, size);
> +		gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
>   		return -ENOMEM;
>   	}
>   
> @@ -322,7 +314,7 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   	struct device *dev = vgpu->gvt->gt->i915->drm.dev;
>   
>   	dma_unmap_page(dev, dma_addr, size, DMA_BIDIRECTIONAL);
> -	gvt_unpin_guest_page(vgpu, gfn, size);
> +	gvt_unpin_guest_page(vgpu, gfn << PAGE_SHIFT, size);
>   }
>   
>   static struct gvt_dma *__gvt_cache_find_dma_addr(struct intel_vgpu *vgpu,
> diff --git a/drivers/s390/cio/vfio_ccw_cp.c b/drivers/s390/cio/vfio_ccw_cp.c
> index 3b94863ad24e..a739262f988d 100644
> --- a/drivers/s390/cio/vfio_ccw_cp.c
> +++ b/drivers/s390/cio/vfio_ccw_cp.c
> @@ -114,7 +114,7 @@ static void pfn_array_unpin(struct pfn_array *pa,
>   			continue;
>   		}
>   
> -		vfio_unpin_pages(vdev, first, npage);
> +		vfio_unpin_pages(vdev, *first << PAGE_SHIFT, npage);
>   		unpinned += npage;
>   		npage = 1;
>   	}
> @@ -146,7 +146,7 @@ static int pfn_array_pin(struct pfn_array *pa, struct vfio_device *vdev)
>   			continue;
>   		}
>   
> -		ret = vfio_pin_pages(vdev, first, npage,
> +		ret = vfio_pin_pages(vdev, *first << PAGE_SHIFT, npage,
>   				     IOMMU_READ | IOMMU_WRITE,
>   				     &pa->pa_pfn[pinned]);
>   		if (ret < 0) {
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index bb869b28cebd..8a2018ab3cf0 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -124,7 +124,7 @@ static void vfio_ap_free_aqic_resources(struct vfio_ap_queue *q)
>   		q->saved_isc = VFIO_AP_ISC_INVALID;
>   	}
>   	if (q->saved_pfn && !WARN_ON(!q->matrix_mdev)) {
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, &q->saved_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, q->saved_pfn << PAGE_SHIFT, 1);
>   		q->saved_pfn = 0;
>   	}
>   }
> @@ -258,7 +258,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   		return status;
>   	}
>   
> -	ret = vfio_pin_pages(&q->matrix_mdev->vdev, &g_pfn, 1,
> +	ret = vfio_pin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1,
>   			     IOMMU_READ | IOMMU_WRITE, &h_pfn);
>   	switch (ret) {
>   	case 1:
> @@ -301,7 +301,7 @@ static struct ap_queue_status vfio_ap_irq_enable(struct vfio_ap_queue *q,
>   		break;
>   	case AP_RESPONSE_OTHERWISE_CHANGED:
>   		/* We could not modify IRQ setings: clear new configuration */
> -		vfio_unpin_pages(&q->matrix_mdev->vdev, &g_pfn, 1);
> +		vfio_unpin_pages(&q->matrix_mdev->vdev, g_pfn << PAGE_SHIFT, 1);
>   		kvm_s390_gisc_unregister(kvm, isc);
>   		break;
>   	default:
> @@ -1248,9 +1248,8 @@ static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
>   
>   	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
>   		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
>   
> -		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
> +		vfio_unpin_pages(&matrix_mdev->vdev, unmap->iova, 1);
>   		return NOTIFY_OK;
>   	}
>   
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 01f45ec70a3d..813b517c973e 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1910,17 +1910,17 @@ int vfio_set_irqs_validate_and_prepare(struct vfio_irq_set *hdr, int num_irqs,
>   EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare);
>   
>   /*
> - * Pin a set of guest PFNs and return their associated host PFNs for local
> + * Pin contiguous guest pages and return their associated host pages for local
>    * domain only.
>    * @device [in]  : device
> - * @user_pfn [in]: array of user/guest PFNs to be pinned.
> - * @npage [in]   : count of elements in user_pfn array.  This count should not
> + * @iova [in]    : starting IOVA of user/guest pages to be pinned.
> + * @npage [in]   : count of pages to be pinned.  This count should not
>    *		   be greater VFIO_PIN_PAGES_MAX_ENTRIES.
>    * @prot [in]    : protection flags
>    * @phys_pfn[out]: array of host PFNs
>    * Return error or number of pages pinned.
>    */
> -int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>   		   int npage, int prot, unsigned long *phys_pfn)
>   {
>   	struct vfio_container *container;
> @@ -1928,8 +1928,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   	struct vfio_iommu_driver *driver;
>   	int ret;
>   
> -	if (!user_pfn || !phys_pfn || !npage ||
> -	    !vfio_assert_device_open(device))
> +	if (!phys_pfn || !npage || !vfio_assert_device_open(device))
>   		return -EINVAL;
>   
>   	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> @@ -1943,7 +1942,7 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   	driver = container->iommu_driver;
>   	if (likely(driver && driver->ops->pin_pages))
>   		ret = driver->ops->pin_pages(container->iommu_data,
> -					     group->iommu_group, user_pfn,
> +					     group->iommu_group, iova,
>   					     npage, prot, phys_pfn);
>   	else
>   		ret = -ENOTTY;
> @@ -1953,20 +1952,18 @@ int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   EXPORT_SYMBOL(vfio_pin_pages);
>   
>   /*
> - * Unpin set of host PFNs for local domain only.
> + * Unpin contiguous host pages for local domain only.
>    * @device [in]  : device
> - * @user_pfn [in]: array of user/guest PFNs to be unpinned. Number of user/guest
> - *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
> - * @npage [in]   : count of elements in user_pfn array.  This count should not
> + * @iova [in]    : starting address of user/guest pages to be unpinned.
> + * @npage [in]   : count of pages to be unpinned.  This count should not
>    *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>    */
> -void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		      int npage)
> +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage)
>   {
>   	struct vfio_container *container;
>   	struct vfio_iommu_driver *driver;
>   
> -	if (WARN_ON_ONCE(!user_pfn || !npage || !vfio_assert_device_open(device)))
> +	if (WARN_ON_ONCE(!npage || !vfio_assert_device_open(device)))
>   		return;
>   
>   	if (WARN_ON_ONCE(npage > VFIO_PIN_PAGES_MAX_ENTRIES))
> @@ -1979,7 +1976,7 @@ void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   	if (WARN_ON_ONCE(unlikely(!driver || !driver->ops->unpin_pages)))
>   		return;
>   
> -	driver->ops->unpin_pages(container->iommu_data, user_pfn, npage);
> +	driver->ops->unpin_pages(container->iommu_data, iova, npage);
>   }
>   EXPORT_SYMBOL(vfio_unpin_pages);
>   
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index bef4edf58138..dbcd0e8c031b 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -50,11 +50,11 @@ struct vfio_iommu_driver_ops {
>   					struct iommu_group *group);
>   	int		(*pin_pages)(void *iommu_data,
>   				     struct iommu_group *group,
> -				     unsigned long *user_pfn,
> +				     dma_addr_t user_iova,
>   				     int npage, int prot,
>   				     unsigned long *phys_pfn);
>   	void		(*unpin_pages)(void *iommu_data,
> -				       unsigned long *user_pfn, int npage);
> +				       dma_addr_t user_iova, int npage);
>   	int		(*register_notifier)(void *iommu_data,
>   					     unsigned long *events,
>   					     struct notifier_block *nb);
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index 08613edaf722..f10d0c4b1f26 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -828,7 +828,7 @@ static int vfio_unpin_page_external(struct vfio_dma *dma, dma_addr_t iova,
>   
>   static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   				      struct iommu_group *iommu_group,
> -				      unsigned long *user_pfn,
> +				      dma_addr_t user_iova,
>   				      int npage, int prot,
>   				      unsigned long *phys_pfn)
>   {
> @@ -840,7 +840,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	bool do_accounting;
>   	dma_addr_t iova;
>   
> -	if (!iommu || !user_pfn || !phys_pfn)
> +	if (!iommu || !phys_pfn)
>   		return -EINVAL;
>   
>   	/* Supported for v2 version only */
> @@ -856,7 +856,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   again:
>   	if (iommu->vaddr_invalid_count) {
>   		for (i = 0; i < npage; i++) {
> -			iova = user_pfn[i] << PAGE_SHIFT;
> +			iova = user_iova + PAGE_SIZE * i;
>   			ret = vfio_find_dma_valid(iommu, iova, PAGE_SIZE, &dma);
>   			if (ret < 0)
>   				goto pin_done;
> @@ -881,7 +881,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	for (i = 0; i < npage; i++) {
>   		struct vfio_pfn *vpfn;
>   
> -		iova = user_pfn[i] << PAGE_SHIFT;
> +		iova = user_iova + PAGE_SIZE * i;
>   		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>   		if (!dma) {
>   			ret = -EINVAL;
> @@ -938,7 +938,7 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	for (j = 0; j < i; j++) {
>   		dma_addr_t iova;
>   
> -		iova = user_pfn[j] << PAGE_SHIFT;
> +		iova = user_iova + PAGE_SIZE * j;
>   		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>   		vfio_unpin_page_external(dma, iova, do_accounting);
>   		phys_pfn[j] = 0;
> @@ -949,13 +949,13 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   }
>   
>   static void vfio_iommu_type1_unpin_pages(void *iommu_data,
> -					 unsigned long *user_pfn, int npage)
> +					dma_addr_t user_iova, int npage)
>   {
>   	struct vfio_iommu *iommu = iommu_data;
>   	bool do_accounting;
>   	int i;
>   
> -	if (WARN_ON_ONCE(!iommu || !user_pfn || npage <= 0))
> +	if (WARN_ON_ONCE(!iommu || npage <= 0))
>   		return;
>   
>   	/* Supported for v2 version only */
> @@ -966,10 +966,9 @@ static void vfio_iommu_type1_unpin_pages(void *iommu_data,
>   
>   	do_accounting = list_empty(&iommu->domain_list);
>   	for (i = 0; i < npage; i++) {
> +		dma_addr_t iova = user_iova + PAGE_SIZE * i;
>   		struct vfio_dma *dma;
> -		dma_addr_t iova;
>   
> -		iova = user_pfn[i] << PAGE_SHIFT;
>   		dma = vfio_find_dma(iommu, iova, PAGE_SIZE);
>   		if (!dma)
>   			break;
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index d0844ecdc961..c3e441c0bf4b 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -147,10 +147,9 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
>   
>   #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
>   
> -int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +int vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
>   		   int npage, int prot, unsigned long *phys_pfn);
> -void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		      int npage);
> +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage);
>   int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>   		void *data, size_t len, bool write);
>   
