Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F9F7FE038
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 20:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D2610E01F;
	Wed, 29 Nov 2023 19:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A715310E01F;
 Wed, 29 Nov 2023 19:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDXUd7T2qkcDO6wLP3bTe6cFX0XJqL/27yOUVvbKB56s8ZiN5kkOAhHzIfeCEKqbNGXfptjU1G9nWpmyf2N4gPqNKbVWYZ+aKUdtO8y+x+T2A2867X2MwYRUCRGaU0mrhFf+3StGFMT42uBJ1nvLYhc+LAHeRp8S6f/TNT8vGwBve8AmhLxlZISdDYzuwETxnKDqI2pCfsY0Tr0hZjGG7dRHxEp8FMySNsW8IiC3o/niL+CT2QRjhzVlGuyUfissztlT8MUVJ12IpOO5sy89CDayxrZk5IYqA47WRLxmeZp3+hbhl9+YD07xm3NZqwdOpI/zSp2dmZktCV6s3Zkd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw/GLUgvZMLMvKy5sG/4si2qJjypshKJL1wTlvHKpes=;
 b=l14KKyAcH0223cPVIEtJile95v9yJ+BmyRp2j6019cb3FJhjzWGJFhw4OMmvzxLD4sZhrc7Fo9ahISfzF8SMwQXi6VCk7gSmq61FkZAVPrnSzu9OVm7xvyjWH4r0MZF6DnpIDSiA9DfJFr3/tl0hABXRpoQXHH5kzieKnpGWy/65/ehVuRI5X+rHx5nhWP2GHWbvHwlLGZaZBMxYW39ZtSeJPnqI4ln/3t7ZETkY/rptLx8OtoiMmZCXFirTfgjBzz7Zd6b31iNJCzN2UgAqvbgOk9ZdKQ41/Znyrr1kdwnXDWjhh1xQPCxyBFx7aO44UGhMNhA8cugCXHEWU9b9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fw/GLUgvZMLMvKy5sG/4si2qJjypshKJL1wTlvHKpes=;
 b=uLHT+tzzcVzNQdUJp+zTSMr3dkY723H3EnRLz22kd1pqRqzIuNnQrxTk7R0RtJWWBhpenaqNOp+Ve/woWFZg97r8ulGazpCxHCt8a3AdmVkp/Bj9wmxnRsmzMgUZPW3o9uavjzTarExWqhuL59uQ3QxxJLSSeMWehJ3HaL7TrngS+cak4koec1ljdw7xnS19ZNKUOdgFmonqf67iLo5JekJ1fAO5z97ZjpRfP3gUnaENPi34UziWM3BmkYtrgyFPhZfddVw+auqhs9xm01zZyzSTOSBb9lZeBceKiT+Sclh2bc2Ta2/xnIuIo2bVFS9NYFzkvr8yD24haQxHBIF4UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 19:20:39 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::6b9f:df87:1ee2:88ca]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::6b9f:df87:1ee2:88ca%6]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:20:39 +0000
Message-ID: <2b26b696-60a3-4afa-b14e-7aa93c939130@nvidia.com>
Date: Wed, 29 Nov 2023 11:20:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231129090637.2629-1-thomas.hellstrom@linux.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20231129090637.2629-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aba4aa0-f099-46de-1aaf-08dbf11045c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHnnA4QjqniBnUPhm+Ep5xmZX9Q0/D5ksarcv7b/0tdprF9pOyCwUL8Ejrl5ccv7tPICTWRoAMpzYJSS0ciOLZ8Ut1yYVACoUw/BYiYDzPnR4OVD9sWbh3WPnn/KQaWol0h/ie5026fFUxbjJI7gAF0c4VCQGBlAUvA+4v2IYoGZkazD2tDB7sNzJaRvJQDo2yKS0qsbyE5xAcGzNWjnkcTu90mXlhJxvAwnsNCF/YpaDZXtVXCiCxb4V6lRWeHkcU/LhDT3nEZNX9wSLig1Fw8/CTIiXI+0ggIpDg54F9dSOMRD/zaN66hlNe1QeA2ajz8VfYjqpsxM7wfC7PrPU70g6/Zz//2pIJKDJwde3bNEsthHKI3UMBM9m3vAKgUYWZFWks4oweyzEiHwVIPi8WnLZ+kAL5AtW9qsztgZCbT1+tqtYGjl0ix1GB0V3fw50wa86R4doXUTljYDPeANaQJmhoOa5Cq6j6r+V39r1SNT5oNcTLc2b6/QKx7t/O0Za6Tw+2z5EC/hwaQKrlv8WJRGPeS6D4nhuQ1kyvmgO2ytTvOhc3+k38lUllDiooKqFKpMOMijCRS/5Be7ifPriq61PVCtFfv13urMsDGZiMmq4Zy4v0JJqsSXQKDgsOQ4dKGzFcF7o60I0J07du32gYdROUw57HZaOrgLaAo0IguVb3vzZsiz72X+ThAPmbKMXqVu1sjyyQjEiMJRwirxnrJtBF9nu2Ye9lWxZPRMQ9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4130.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6506007)(53546011)(36756003)(6512007)(6666004)(2616005)(66574015)(202311291699002)(83380400001)(31686004)(41300700001)(31696002)(66946007)(66556008)(66476007)(54906003)(30864003)(5660300002)(316002)(7416002)(2906002)(86362001)(8936002)(8676002)(38100700002)(4326008)(478600001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBHNVc4Zm9sdTBCcW1sU1hWWVpFR3dEVWNtdTI3Zk0yYmlZOXFxMSs3ZUYv?=
 =?utf-8?B?YzJveENJeWlObmxuUkJYUXpEMHpuMllCRWxPWExSUFNqNFdIdDBsdkRlTElh?=
 =?utf-8?B?WUdVL1pxTlFocFJKR3pBdEo3MTdDSS8zSGpoSkd3b0V6b29XTS9mbE5uUlNC?=
 =?utf-8?B?VVJSZG9BOVg5WGxtQS8rS2pzRlZpcVhrcGpqTXRuKzlYd0RWT1JPZ2REOUhQ?=
 =?utf-8?B?NE9tbEZJdGRsVU1SajRMSVpvbEJ3eC94cWtHK01PQ0dtRnp3QmtkN1BWK1hL?=
 =?utf-8?B?R09Wa2tXVm91L1dGbGxCbXRrVzVKOCtZSFRiQ3laeHhMOThXV0h1N3Z4NHFX?=
 =?utf-8?B?Y3VkSVh0YkI5RXMrbVdVYnRsaldjY1prWjNpZnJFN3k0MmJEa2hVNHhvYWd5?=
 =?utf-8?B?U2pkRzRQeWx4akZvaHREOVJORmpseHFoRlNpMDZDalZDdW1tcUUwdmdQbTFj?=
 =?utf-8?B?ckVBQXBOdS9YaHZ5MlNXTncrTFhQcDluSXZwSjFVQ2xLb0o0THNuVzBIbDlu?=
 =?utf-8?B?TU9ReWloZ0hMTE5GOFJ5RUxBNG5zVnlja1dMV1hHUHV2TUU5MHptQ2ZkZTBJ?=
 =?utf-8?B?TXdoN013Uy9xb09sOHU2WmVqZWMraW1VZUdLcHlpRjNienNHK3ovTlJqSU5v?=
 =?utf-8?B?K01sejFpMW0xamlnSEgwUVp2SmFZdmtyUk11OHFITVd5V2VJcjYrRjVZU1pK?=
 =?utf-8?B?ekY0Umg3NjlYNjdNWXZnbi96RWxvaklDbmNBNisxZGt3VFBpTjlKRmpqZ3lH?=
 =?utf-8?B?UUZ4M3Z0V295d09iNDdVRmhuZjVOY0h3Nm5Jd21xdmp3MWU3dWVNUWtvZFNK?=
 =?utf-8?B?NXQzYVJYZmJtWHJIUk1KalAzb0tPQjdWVGhTTTdMSlVoQnhDMzlXajQyaDdp?=
 =?utf-8?B?TXBzbS9WVlljNEJwUmNGbWdCT3ZvdkRlcHcyOEpDd1pxYUcvQ3R5cUhUalgx?=
 =?utf-8?B?S2M0Q08veVFFRTkybm5WelN6SHdRbnVvcUhKNWg4UmwrbGsrMzJQZkw4ajZ3?=
 =?utf-8?B?VXRTbHg3dldaelhycUIvcmZNTDhUS0x3SUxJNUhUNkVnQThFWElpd1lmQkdN?=
 =?utf-8?B?WElKVTEwY3JpT2FTQmw1SFVNb0k0ZTQyS2pqUlExci85WGRvSU0ySHlOcmpR?=
 =?utf-8?B?QmIyYXJKeHUwWUJ6VUF4dXErUUVDZ0lvQzh3bHhzQk1pWEFUWjhiemRUWXB5?=
 =?utf-8?B?RUFscm5WTHh3RzJpVHNvT2ExVVN0VC9JYnNmMmZlMUVMa2NoeFBzZzJUZEg3?=
 =?utf-8?B?QThhbzJhTk1hdFVmMlZDcHZBMlhIL0ZLbnlBLzMxb25RTTRJV1VGL3JqVStV?=
 =?utf-8?B?QjF4NU1YWk10a2xHVDlZL2tveHYrbjRtRFhKSUtFUzlrNDBWRU4vRjY2enlN?=
 =?utf-8?B?dHh5MFBsSHJoTWNCcElTS2xLS1hoYmFmaWhiMk80WmRqdEpVcGs3bHNwWUxB?=
 =?utf-8?B?SFdLL25PbjRFZ3I3dDExbEdsanBUNUtpaGsrNUdtcTJBdC9lQnVWUVlQeHI3?=
 =?utf-8?B?TmcxVWhIc25NcG1JSHNQMW5xcTE0aFVCMzRXdkwvMFV6bDczREJsK09GSUxR?=
 =?utf-8?B?ZGVRTWxRbkYxdzR1RW5RWEViSUs1RzErZ2NWQXM3N2luM2xmNEFiemlSTGZV?=
 =?utf-8?B?SG1oVjhVVXFoNkZueDlVOW5xSmdQNVZnVFUySWRNai9Mb1hTMEo3MGJTdGJK?=
 =?utf-8?B?VExnaUVHaVFleWluWHhkWlZHRFlORi9xSVJYZ21UVlhadTBsZVFpZmMrVXJJ?=
 =?utf-8?B?OUplVGhJSEkrVjBmQzRzemxxckFTNytyVEcza0IyMCtoTjJPQlprdGpTdTh5?=
 =?utf-8?B?MXd2Zi9VVy9VVytLTUxJbTQzazBTL0RLTERYMDFac05mUDFJTngxRHROV0k3?=
 =?utf-8?B?STlpZUhZR1JXeVRvRGdCOFB2WmNYcVB2V3RQSzNQSFlRQ2pyR1ArUElqUUhP?=
 =?utf-8?B?WlRZWEVDMnFCV3B1eGVUSkM3VTE2SEVBMHM0K0J2S3NyU01SaHRZQjhPYW92?=
 =?utf-8?B?M1hzNkhYeW1sUytEKzVYNXdJUmtxRllGZno4VThaYW92Rit5Y05yMnZIVi91?=
 =?utf-8?B?K2ZCb2lQU1dla3kwUUlRQ05WM2RyOWIvYjVaNW9NVi80R3dWNHlPczZpQVcr?=
 =?utf-8?B?UWJaR3VWTWlVL1N1SW5FbHhiaHlqa2hyQ2Fxc2hJQUgzT3VyK2xteUV3NHBT?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aba4aa0-f099-46de-1aaf-08dbf11045c8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:20:39.6728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGW/n/mTmMewRcvrlNw4eHHJ280Tyh1JlvuQKPwhQEhNdJfKFbha4nnV7UicYxOeOrUck91inNApFTNTDt7CKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oak Zeng <oak.zeng@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/29/23 01:06, Thomas Hellström wrote:
> Add the first version of the VM_BIND locking document which is
> intended to be part of the xe driver upstreaming agreement.
> 
> The document describes and discuss the locking used during exec-
> functions, evicton and for userptr gpu-vmas. Intention is to be using the
> same nomenclature as the drm-vm-bind-async.rst.
> 

Hi Thomas,

As requested, for the pin_user_pages() aspects (the MMU notifier
registration case), please feel free to add:

Acked-by: John Hubbard <jhubbard@nvidia.com

thanks,
-- 
John Hubbard
NVIDIA


> v2:
> - s/gvm/gpu_vm/g (Rodrigo Vivi)
> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>    (Rodrigo Vivi)
> - Adjust commit message accordingly.
> - Add SPDX license header.
> 
> v3:
> - Large update to align with the drm_gpuvm manager locking
> - Add "Efficient userptr gpu_vma exec function iteration" section
> - Add "Locking at bind- and unbind time" section.
> 
> v4:
> - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
> - Minor style fixes and typos (Rodrigo Vivi)
> - Clarify situations where stale GPU mappings are occurring and how
>    access through these mappings are blocked. (Rodrigo Vivi)
> - Insert into the toctree in implementation_guidelines.rst
> 
> v5:
> - Add a section about recoverable page-faults.
> - Use local references to other documentation where possible
>    (Bagas Sanjaya)
> - General documentation fixes and typos (Danilo Krummrich and
>    Boris Brezillon)
> - Improve the documentation around locks that need to be grabbed from the
>    dm-fence critical section (Boris Brezillon)
> - Add more references to the DRM GPUVM helpers (Danilo Krummrich and
>    Boriz Brezillon)
> - Update the rfc/xe.rst document.
> 
> v6:
> - Rework wording to improve readability (Boris Brezillon, Rodrigo Vivi,
>    Bagas Sanjaya)
> - Various minor fixes across the document (Boris Brezillon)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   Documentation/core-api/pin_user_pages.rst     |   2 +
>   Documentation/gpu/drm-mm.rst                  |   4 +
>   Documentation/gpu/drm-vm-bind-locking.rst     | 582 ++++++++++++++++++
>   .../gpu/implementation_guidelines.rst         |   1 +
>   Documentation/gpu/rfc/xe.rst                  |   5 +
>   5 files changed, 594 insertions(+)
>   create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> 
> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/core-api/pin_user_pages.rst
> index d3c1f6d8c0e0..6b5f7e6e7155 100644
> --- a/Documentation/core-api/pin_user_pages.rst
> +++ b/Documentation/core-api/pin_user_pages.rst
> @@ -153,6 +153,8 @@ NOTE: Some pages, such as DAX pages, cannot be pinned with longterm pins. That's
>   because DAX pages do not have a separate page cache, and so "pinning" implies
>   locking down file system blocks, which is not (yet) supported in that way.
>   
> +.. _mmu-notifier-registration-case:
> +
>   CASE 3: MMU notifier registration, with or without page faulting hardware
>   -------------------------------------------------------------------------
>   Device drivers can pin pages via get_user_pages*(), and register for mmu
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index acc5901ac840..d55751cad67c 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -466,6 +466,8 @@ DRM MM Range Allocator Function References
>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>      :export:
>   
> +.. _drm_gpuvm:
> +
>   DRM GPUVM
>   =========
>   
> @@ -481,6 +483,8 @@ Split and Merge
>   .. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>      :doc: Split and Merge
>   
> +.. _drm_gpuvm_locking:
> +
>   Locking
>   -------
>   
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> new file mode 100644
> index 000000000000..a345aa513d12
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -0,0 +1,582 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +===============
> +VM_BIND locking
> +===============
> +
> +This document attempts to describe what's needed to get VM_BIND locking right,
> +including the userptr mmu_notifier locking. It also discusses some
> +optimizations to get rid of the looping through of all userptr mappings and
> +external / shared object mappings that is needed in the simplest
> +implementation. In addition, there is a section describing the VM_BIND locking
> +required for implementing recoverable pagefaults.
> +
> +The DRM GPUVM set of helpers
> +============================
> +
> +There is a set of helpers for drivers implementing VM_BIND, and this
> +set of helpers implements much, but not all of the locking described
> +in this document. In particular, it is currently lacking a userptr
> +implementation. This document does not intend to describe the DRM GPUVM
> +implementation in detail, but it is covered in :ref:`its own
> +documentation <drm_gpuvm>`. It is highly recommended for any driver
> +implementing VM_BIND to use the DRM GPUVM helpers and to extend it if
> +common functionality is missing.
> +
> +Nomenclature
> +============
> +
> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> +  meta-data. Typically one per client (DRM file-private), or one per
> +  execution context.
> +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm with
> +  associated meta-data. The backing storage of a gpu_vma can either be
> +  a GEM object or anonymous or page-cache pages mapped also into the CPU
> +  address space for the process.
> +* ``gpu_vm_bo``: Abstracts the association of a GEM object and
> +  a VM. The GEM object maintains a list of gpu_vm_bos, where each gpu_vm_bo
> +  maintains a list of gpu_vmas.
> +* ``userptr gpu_vma or just userptr``: A gpu_vma, whose backing store
> +  is anonymous or page-cache pages as described above.
> +* ``revalidating``: Revalidating a gpu_vma means making the latest version
> +  of the backing store resident and making sure the gpu_vma's
> +  page-table entries point to that backing store.
> +* ``dma_fence``: A struct dma_fence that is similar to a struct completion
> +  and which tracks GPU activity. When the GPU activity is finished,
> +  the dma_fence signals. Please refer to the ``DMA Fences`` section of
> +  the :doc:`dma-buf doc </driver-api/dma-buf>`.
> +* ``dma_resv``: A struct dma_resv (a.k.a reservation object) that is used
> +  to track GPU activity in the form of multiple dma_fences on a
> +  gpu_vm or a GEM object. The dma_resv contains an array / list
> +  of dma_fences and a lock that needs to be held when adding
> +  additional dma_fences to the dma_resv. The lock is of a type that
> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary
> +  order. Please refer to the ``Reservation Objects`` section of the
> +  :doc:`dma-buf doc </driver-api/dma-buf>`.
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +* ``local object``: A GEM object which is only mapped within a
> +  single VM. Local GEM objects share the gpu_vm's dma_resv.
> +* ``external object``: a.k.a shared object: A GEM object which may be shared
> +  by multiple gpu_vms and whose backing storage may be shared with
> +  other drivers.
> +
> +Locks and locking order
> +=======================
> +
> +One of the benefits of VM_BIND is that local GEM objects share the gpu_vm's
> +dma_resv object and hence the dma_resv lock. So, even with a huge
> +number of local GEM objects, only one lock is needed to make the exec
> +sequence atomic.
> +
> +The following locks and locking orders are used:
> +
> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects the gpu_vm's
> +  data structure keeping track of gpu_vmas. It can also protect the
> +  gpu_vm's list of userptr gpu_vmas. With a CPU mm analogy this would
> +  correspond to the mmap_lock. An rwsem allows several readers to walk
> +  the VM tree concurrently, but the benefit of that concurrency most
> +  likely varies from driver to driver.
> +* The ``userptr_seqlock``. This lock is taken in read mode for each
> +  userptr gpu_vma on the gpu_vm's userptr list, and in write mode during mmu
> +  notifier invalidation. This is not a real seqlock but described in
> +  ``mm/mmu_notifier.c`` as a "Collision-retry read-side/write-side
> +  'lock' a lot like a seqcount. However this allows multiple
> +  write-sides to hold it at once...". The read side critical section
> +  is enclosed by ``mmu_interval_read_begin() /
> +  mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
> +  sleeping if the write side is held.
> +  The write side is held by the core mm while calling mmu interval
> +  invalidation notifiers.
> +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of gpu_vmas needing
> +  rebinding, as well as the residency state of all the gpu_vm's local
> +  GEM objects.
> +  Furthermore, it typically protects the gpu_vm's list of evicted and
> +  external GEM objects.
> +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is
> +  taken in read mode during exec and write mode during a mmu notifier
> +  invalidation. The userptr notifier lock is per gpu_vm.
> +* The ``gem_object->gpuva_lock`` This lock protects the GEM object's
> +  list of gpu_vm_bos. This is usually the same lock as the GEM
> +  object's dma_resv, but some drivers protects this list differently,
> +  see below.
> +* The ``gpu_vm list spinlocks``. With some implementations they are needed
> +  to be able to update the gpu_vm evicted- and external object
> +  list. For those implementations, the spinlocks are grabbed when the
> +  lists are manipulated. However, to avoid locking order violations
> +  with the dma_resv locks, a special scheme is needed when iterating
> +  over the lists.
> +
> +.. _gpu_vma lifetime:
> +
> +Protection and lifetime of gpu_vm_bos and gpu_vmas
> +==================================================
> +
> +The GEM object's list of gpu_vm_bos, and the gpu_vm_bo's list of gpu_vmas
> +is protected by the ``gem_object->gpuva_lock``, which is typically the
> +same as the GEM object's dma_resv, but if the driver
> +needs to access these lists from within a dma_fence signalling
> +critical section, it can instead choose to protect it with a
> +separate lock, which can be locked from within the dma_fence signalling
> +critical section. Such drivers then need to pay additional attention
> +to what locks need to be taken from within the loop when iterating
> +over the gpu_vm_bo and gpu_vma lists to avoid locking-order violations.
> +
> +The DRM GPUVM set of helpers provide lockdep asserts that this lock is
> +held in relevant situations and also provides a means of making itself
> +aware of which lock is actually used: :c:func:`drm_gem_gpuva_set_lock`.
> +
> +Each gpu_vm_bo holds a reference counted pointer to the underlying GEM
> +object, and each gpu_vma holds a reference counted pointer to the
> +gpu_vm_bo. When iterating over the GEM object's list of gpu_vm_bos and
> +over the gpu_vm_bo's list of gpu_vmas, the ``gem_object->gpuva_lock`` must
> +not be dropped, otherwise, gpu_vmas attached to a gpu_vm_bo may
> +disappear without notice since those are not reference-counted. A
> +driver may implement its own scheme to allow this at the expense of
> +additional complexity, but this is outside the scope of this document.
> +
> +In the DRM GPUVM implementation, each gpu_vm_bo and each gpu_vma
> +holds a reference count on the gpu_vm itself. Due to this, and to avoid circular
> +reference counting, cleanup of the gpu_vm's gpu_vmas must not be done from the
> +gpu_vm's destructor. Drivers typically implements a gpu_vm close
> +function for this cleanup. The gpu_vm close function will abort gpu
> +execution using this VM, unmap all gpu_vmas and release page-table memory.
> +
> +Revalidation and eviction of local objects
> +==========================================
> +
> +Note that in all the code examples given below we use simplified
> +pseudo-code. In particular, the dma_resv deadlock avoidance algorithm
> +as well as reserving memory for dma_resv fences is left out.
> +
> +Revalidation
> +____________
> +With VM_BIND, all local objects need to be resident when the gpu is
> +executing using the gpu_vm, and the objects need to have valid
> +gpu_vmas set up pointing to them. Typically, each gpu command buffer
> +submission is therefore preceded with a re-validation section:
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // Validation section starts here.
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +           // The following list iteration needs the Gem object's
> +           // dma_resv to be held (it protects the gpu_vm_bo's list of
> +           // gpu_vmas, but since local gem objects share the gpu_vm's
> +           // dma_resv, it is already held at this point.
> +           for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +                  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +           remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +   // Validation section ends here, and job submission starts.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   dma_resv_unlock(gpu_vm->resv);
> +
> +The reason for having a separate gpu_vm rebind list is that there
> +might be userptr gpu_vmas that are not mapping a buffer object that
> +also need rebinding.
> +
> +Eviction
> +________
> +
> +Eviction of one of these local objects will then look similar to the
> +following:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo);
> +           add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Note that since the object is local to the gpu_vm, it will share the gpu_vm's
> +dma_resv lock such that ``obj->resv == gpu_vm->resv``.
> +The gpu_vm_bos marked for eviction are put on the gpu_vm's evict list,
> +which is protected by ``gpu_vm->resv``. During eviction all local
> +objects have their dma_resv locked and, due to the above equality, also
> +the gpu_vm's dma_resv protecting the gpu_vm's evict list is locked.
> +
> +With VM_BIND, gpu_vmas don't need to be unbound before eviction,
> +since the driver must ensure that the eviction blit or copy will wait
> +for GPU idle or depend on all previous GPU activity. Furthermore, any
> +subsequent attempt by the GPU to access freed memory through the
> +gpu_vma will be preceded by a new exec function, with a revalidation
> +section which will make sure all gpu_vmas are rebound. The eviction
> +code holding the object's dma_resv while revalidating will ensure a
> +new exec function may not race with the eviction.
> +
> +A driver can be implemented in such a way that, on each exec function,
> +only a subset of vmas are selected for rebind.  In this case, all vmas that are
> +*not* selected for rebind must be unbound before the exec
> +function workload is submitted.
> +
> +Locking with external buffer objects
> +====================================
> +
> +Since external buffer objects may be shared by multiple gpu_vm's they
> +can't share their reservation object with a single gpu_vm. Instead
> +they need to have a reservation object of their own. The external
> +objects bound to a gpu_vm using one or many gpu_vmas are therefore put on a
> +per-gpu_vm list which is protected by the gpu_vm's dma_resv lock or
> +one of the :ref:`gpu_vm list spinlocks <Spinlock iteration>`. Once
> +the gpu_vm's reservation object is locked, it is safe to traverse the
> +external object list and lock the dma_resvs of all external
> +objects. However, if instead a list spinlock is used, a more elaborate
> +iteration scheme needs to be used.
> +
> +At eviction time, the gpu_vm_bos of *all* the gpu_vms an external
> +object is bound to need to be put on their gpu_vm's evict list.
> +However, when evicting an external object, the dma_resvs of the
> +gpu_vms the object is bound to are typically not held. Only
> +the object's private dma_resv can be guaranteed to be held. If there
> +is a ww_acquire context at hand at eviction time we could grab those
> +dma_resvs but that could cause expensive ww_mutex rollbacks. A simple
> +option is to just mark the gpu_vm_bos of the evicted gem object with
> +an ``evicted`` bool that is inspected before the next time the
> +corresponding gpu_vm evicted list needs to be traversed. For example, when
> +traversing the list of external objects and locking them. At that time,
> +both the gpu_vm's dma_resv and the object's dma_resv is held, and the
> +gpu_vm_bo marked evicted, can then be added to the gpu_vm's list of
> +evicted gpu_vm_bos. The ``evicted`` bool is formally protected by the
> +object's dma_resv.
> +
> +The exec function becomes
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // External object list is protected by the gpu_vm->resv lock.
> +   for_each_gpu_vm_bo_on_extobj_list(gpu_vm, &gpu_vm_bo) {
> +           dma_resv_lock(gpu_vm_bo.gem_obj->resv);
> +           if (gpu_vm_bo_marked_evicted(&gpu_vm_bo))
> +                   add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +   }
> +
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +           for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +                  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +           remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   for_each_external_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +   dma_resv_unlock_all_resv_locks();
> +
> +And the corresponding shared-object aware eviction would look like:
> +
> +.. code-block:: C
> +
> +   obj = get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo)
> +           if (object_is_vm_local(obj))
> +                add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +           else
> +                mark_gpu_vm_bo_evicted(&gpu_vm_bo);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence = gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +.. _Spinlock iteration:
> +
> +Accessing the gpu_vm's lists without the dma_resv lock held
> +===========================================================
> +
> +Some drivers will hold the gpu_vm's dma_resv lock when accessing the
> +gpu_vm's evict list and external objects lists. However, there are
> +drivers that need to access these lists without the dma_resv lock
> +held, for example due to asynchronous state updates from within the
> +dma_fence signalling critical path. In such cases, a spinlock can be
> +used to protect manipulation of the lists. However, since higher level
> +sleeping locks need to be taken for each list item while iterating
> +over the lists, the items already iterated over need to be
> +temporarily moved to a private list and the spinlock released
> +while processing each item:
> +
> +.. code block:: C
> +
> +    struct list_head still_in_list;
> +
> +    INIT_LIST_HEAD(&still_in_list);
> +
> +    spin_lock(&gpu_vm->list_lock);
> +    do {
> +            struct list_head *entry = list_first_entry_or_null(&gpu_vm->list, head);
> +
> +            if (!entry)
> +                    break;
> +
> +            list_move_tail(&entry->head, &still_in_list);
> +            list_entry_get_unless_zero(entry);
> +            spin_unlock(&gpu_vm->list_lock);
> +
> +            process(entry);
> +
> +            spin_lock(&gpu_vm->list_lock);
> +            list_entry_put(entry);
> +    } while (true);
> +
> +    list_splice_tail(&still_in_list, &gpu_vm->list);
> +    spin_unlock(&gpu_vm->list_lock);
> +
> +Due to the additional locking and atomic operations, drivers that *can*
> +avoid accessing the gpu_vm's list outside of the dma_resv lock
> +might want to avoid also this iteration scheme. Particularly, if the
> +driver anticipates a large number of list items. For lists where the
> +anticipated number of list items is small, where list iteration doesn't
> +happen very often or if there is a significant additional cost
> +associated with each iteration, the atomic operation overhead
> +associated with this type of iteration is, most likely, negligible. Note that
> +if this scheme is used, it is necessary to make sure this list
> +iteration is protected by an outer level lock or semaphore, since list
> +items are temporarily pulled off the list while iterating, and it is
> +also worth mentioning that the local list ``still_in_list`` should
> +also be considered protected by the ``gpu_vm->list_lock``, and it is
> +thus possible that items can be removed also from the local list
> +concurrently with list iteration.
> +
> +Please refer to the :ref:`DRM GPUVM locking section
> +<drm_gpuvm_locking>` and its internal
> +:c:func:`get_next_vm_bo_from_list` function.
> +
> +
> +userptr gpu_vmas
> +================
> +
> +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer object to a
> +GPU virtual address range, directly maps a CPU mm range of anonymous-
> +or file page-cache pages.
> +A very simple approach would be to just pin the pages using
> +pin_user_pages() at bind time and unpin them at unbind time, but this
> +creates a Denial-Of-Service vector since a single user-space process
> +would be able to pin down all of system memory, which is not
> +desirable. (For special use-cases and assuming proper accounting pinning might
> +still be a desirable feature, though). What we need to do in the
> +general case is to obtain a reference to the desired pages, make sure
> +we are notified using a MMU notifier just before the CPU mm unmaps the
> +pages, dirty them if they are not mapped read-only to the GPU, and
> +then drop the reference.
> +When we are notified by the MMU notifier that CPU mm is about to drop the
> +pages, we need to stop GPU access to the pages by waiting for VM idle
> +in the MMU notifier and make sure that before the next time the GPU
> +tries to access whatever is now present in the CPU mm range, we unmap
> +the old pages from the GPU page tables and repeat the process of
> +obtaining new page references. (See the :ref:`notifier example
> +<Invalidation example>` below). Note that when the core mm decides to
> +laundry pages, we get such an unmap MMU notification and can mark the
> +pages dirty again before the next GPU access. We also get similar MMU
> +notifications for NUMA accounting which the GPU driver doesn't really
> +need to care about, but so far it has proven difficult to exclude
> +certain notifications.
> +
> +Using a MMU notifier for device DMA (and other methods) is described in
> +:ref:`the pin_user_pages() documentation <mmu-notifier-registration-case>`.
> +
> +Now, the method of obtaining struct page references using
> +get_user_pages() unfortunately can't be used under a dma_resv lock
> +since that would violate the locking order of the dma_resv lock vs the
> +mmap_lock that is grabbed when resolving a CPU pagefault. This means
> +the gpu_vm's list of userptr gpu_vmas needs to be protected by an
> +outer lock, which in our example below is the ``gpu_vm->lock``.
> +
> +The MMU interval seqlock for a userptr gpu_vma is used in the following
> +way:
> +
> +.. code-block:: C
> +
> +   // Exclusive locking mode here is strictly needed only if there are
> +   // invalidated userptr gpu_vmas present, to avoid concurrent userptr
> +   // revalidations of the same userptr gpu_vma.
> +   down_write(&gpu_vm->lock);
> +   retry:
> +
> +   // Note: mmu_interval_read_begin() blocks until there is no
> +   // invalidation notifier running anymore.
> +   seq = mmu_interval_read_begin(&gpu_vma->userptr_interval);
> +   if (seq != gpu_vma->saved_seq) {
> +           obtain_new_page_pointers(&gpu_vma);
> +           dma_resv_lock(&gpu_vm->resv);
> +           add_gpu_vma_to_revalidate_list(&gpu_vma, &gpu_vm);
> +           dma_resv_unlock(&gpu_vm->resv);
> +           gpu_vma->saved_seq = seq;
> +   }
> +
> +   // The usual revalidation goes here.
> +
> +   // Final userptr sequence validation may not happen before the
> +   // submission dma_fence is added to the gpu_vm's resv, from the POW
> +   // of the MMU invalidation notifier. Hence the
> +   // userptr_notifier_lock that will make them appear atomic.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   down_read(&gpu_vm->userptr_notifier_lock);
> +   if (mmu_interval_read_retry(&gpu_vma->userptr_interval, gpu_vma->saved_seq)) {
> +          up_read(&gpu_vm->userptr_notifier_lock);
> +          goto retry;
> +   }
> +
> +   job_dma_fence = gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +
> +   for_each_external_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +
> +   dma_resv_unlock_all_resv_locks();
> +   up_read(&gpu_vm->userptr_notifier_lock);
> +   up_write(&gpu_vm->lock);
> +
> +The code between ``mmu_interval_read_begin()`` and the
> +``mmu_interval_read_retry()`` marks the read side critical section of
> +what we call the ``userptr_seqlock``. In reality, the gpu_vm's userptr
> +gpu_vma list is looped through, and the check is done for *all* of its
> +userptr gpu_vmas, although we only show a single one here.
> +
> +The userptr gpu_vma MMU invalidation notifier might be called from
> +reclaim context and, again, to avoid locking order violations, we can't
> +take any dma_resv lock nor the gpu_vm->lock from within it.
> +
> +.. _Invalidation example:
> +.. code-block:: C
> +
> +  bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
> +  {
> +          // Make sure the exec function either sees the new sequence
> +          // and backs off or we wait for the dma-fence:
> +
> +          down_write(&gpu_vm->userptr_notifier_lock);
> +          mmu_interval_set_seq(userptr_interval, cur_seq);
> +          up_write(&gpu_vm->userptr_notifier_lock);
> +
> +          // At this point, the exec function can't succeed in
> +          // submitting a new job, because cur_seq is an invalid
> +          // sequence number and will always cause a retry. When all
> +          // invalidation callbacks, the mmu notifier core will flip
> +          // the sequence number to a valid one. However we need to
> +          // stop gpu access to the old pages here.
> +
> +          dma_resv_wait_timeout(&gpu_vm->resv, DMA_RESV_USAGE_BOOKKEEP,
> +                                false, MAX_SCHEDULE_TIMEOUT);
> +          return true;
> +  }
> +
> +When this invalidation notifier returns, the GPU can no longer be
> +accessing the old pages of the userptr gpu_vma and needs to redo the
> +page-binding before a new GPU submission can succeed.
> +
> +Efficient userptr gpu_vma exec_function iteration
> +_________________________________________________
> +
> +If the gpu_vm's list of userptr gpu_vmas becomes large, it's
> +inefficient to iterate through the complete lists of userptrs on each
> +exec function to check whether each userptr gpu_vma's saved
> +sequence number is stale. A solution to this is to put all
> +*invalidated* userptr gpu_vmas on a separate gpu_vm list and
> +only check the gpu_vmas present on this list on each exec
> +function. This list will then lend itself very-well to the spinlock
> +locking scheme that is
> +:ref:`described in the spinlock iteration section <Spinlock iteration>`, since
> +in the mmu notifier, where we add the invalidated gpu_vmas to the
> +list, it's not possible to take any outer locks like the
> +``gpu_vm->lock`` or the ``gpu_vm->resv`` lock. Note that the
> +``gpu_vm->lock`` still needs to be taken while iterating to ensure the list is
> +complete, as also mentioned in that section.
> +
> +If using an invalidated userptr list like this, the retry check in the
> +exec function trivially becomes a check for invalidated list empty.
> +
> +Locking at bind and unbind time
> +===============================
> +
> +At bind time, assuming a GEM object backed gpu_vma, each
> +gpu_vma needs to be associated with a gpu_vm_bo and that
> +gpu_vm_bo in turn needs to be added to the GEM object's
> +gpu_vm_bo list, and possibly to the gpu_vm's external object
> +list. This is referred to as *linking* the gpu_vma, and typically
> +requires that the ``gpu_vm->lock`` and the ``gem_object->gpuva_lock``
> +are held. When unlinking a gpu_vma the same locks should be held,
> +and that ensures that when iterating over ``gpu_vmas`, either under
> +the ``gpu_vm->resv`` or the GEM object's dma_resv, that the gpu_vmas
> +stay alive as long as the lock under which we iterate is not released. For
> +userptr gpu_vmas it's similarly required that during vma destroy, the
> +outer ``gpu_vm->lock`` is held, since otherwise when iterating over
> +the invalidated userptr list as described in the previous section,
> +there is nothing keeping those userptr gpu_vmas alive.
> +
> +Locking for recoverable page-fault page-table updates
> +=====================================================
> +
> +There are two important things we need to ensure with locking for
> +recoverable page-faults:
> +
> +* At the time we return pages back to the system / allocator for
> +  reuse, there should be no remaining GPU mappings and any GPU TLB
> +  must have been flushed.
> +* The unmapping and mapping of a gpu_vma must not race.
> +
> +Since the unmapping (or zapping) of GPU ptes is typically taking place
> +where it is hard or even impossible to take any outer level locks we
> +must either introduce a new lock that is held at both mapping and
> +unmapping time, or look at the locks we do hold at unmapping time and
> +make sure that they are held also at mapping time. For userptr
> +gpu_vmas, the ``userptr_seqlock`` is held in write mode in the mmu
> +invalidation notifier where zapping happens. Hence, if the
> +``userptr_seqlock`` as well as the ``gpu_vm->userptr_notifier_lock``
> +is held in read mode during mapping, it will not race with the
> +zapping. For GEM object backed gpu_vmas, zapping will take place under
> +the GEM object's dma_resv and ensuring that the dma_resv is held also
> +when populating the page-tables for any gpu_vma pointing to the GEM
> +object, will similarly ensure we are race-free.
> +
> +If any part of the mapping is performed asynchronously
> +under a dma-fence with these locks released, the zapping will need to
> +wait for that dma-fence to signal under the relevant lock before
> +starting to modify the page-table.
> +
> +Since modifying the
> +page-table structure in a way that frees up page-table memory
> +might also require outer level locks, the zapping of GPU ptes
> +typically focuses only on zeroing page-table or page-directory entries
> +and flushing TLB, whereas freeing of page-table memory is deferred to
> +unbind or rebind time.
> diff --git a/Documentation/gpu/implementation_guidelines.rst b/Documentation/gpu/implementation_guidelines.rst
> index 138e637dcc6b..dbccfa72f1c9 100644
> --- a/Documentation/gpu/implementation_guidelines.rst
> +++ b/Documentation/gpu/implementation_guidelines.rst
> @@ -7,3 +7,4 @@ Misc DRM driver uAPI- and feature implementation guidelines
>   .. toctree::
>   
>      drm-vm-bind-async
> +   drm-vm-bind-locking
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index c29113a0ac30..ceb21219d52e 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -123,10 +123,15 @@ Documentation should include:
>   
>    * O(1) complexity under VM_BIND.
>   
> +The document is now included in the drm documentation :doc:`here </gpu/drm-vm-bind-async>`.
> +
>   Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
>   the second driver supporting VM_BIND+userptr appears. Details to be defined when
>   the time comes.
>   
> +The DRM GPUVM helpers do not yet include the userptr parts, but discussions
> +about implementing them are ongoing.
> +
>   Long running compute: minimal data structure/scaffolding
>   --------------------------------------------------------
>   The generic scheduler code needs to include the handling of endless compute


