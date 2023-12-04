Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A9480413F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 23:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5D210E420;
	Mon,  4 Dec 2023 22:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7994310E420;
 Mon,  4 Dec 2023 22:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeFlNOLH2Xj9Qv5uv+13szjAfbr2hEUEwcHuBC4PPsFmSr3mIPh5qGCFA+tp1f/5km1DR2QI/gHwCg49yml5MrVu0rljefm7PRcVrWnvyG8EtFqYCUg1lyCXLI2b1BYfs57cablhVYWYLdShW8U20cbes/83vmvqCv1sBV1vuCKNfEOrSKlQ6cbO93WpeZfPEFw01zioYxsj+Auhzq3JI9HVmnLQmmDGH0ENeC/cQx75xq5KuR1rm8dItdtXFkWwZQFRn1VcdcG4qNXSD2h056O67lxJoDsxHwkzcwU4cEqvFTCiBU4XhKpFFdNOHpvmIwywDsPcYFZ6V6TTx9lrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sd+P41Ir9HW3wcp8ilfLwoF/5mQxjuZ61upbROgL/Kk=;
 b=WOKLuhyac9rAtgR4mavdc/i32pkEan49d0sMS7zK6P5PMeNw9gbPx2qNK11mDWwVGB/8tOZv737873myy21nr9F62r5Me3gDAhtJTVT95UPllzg6ZcSEXH/VdoE+INf2kmtv0spbd9+E8aurmwo4frVTkIn5OEA2vAZUF6hxjaxoDiLlGOL7OKVT+TEqcDbHFUFy8qB5NArAj7qLIlb1AtQ7lLDYJXPYYcxqFAy3eETsnzskktJocoXon2A+K4JNZLd5q9/kTSWAvbdcdiVA18ToTGx8MPcSPUXHbHYo3OualrQ3yuGH8so1N+jMFijk8hwQU9bhrX9BG8CwYaTEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd+P41Ir9HW3wcp8ilfLwoF/5mQxjuZ61upbROgL/Kk=;
 b=OKJ77vYmhquN9iCOMFiqDYNrUu/kakkUVau9PpBLKRv+3C49D8QMAS+G+tCwLbRZMBzmD/5V3YIe6FyjPGh5v/UXodMaLwh7NsufLNVTPZty+XNsIm0Jx4QqUNnsd1eQIO++ulqAvpFKgbtVuBBaJWndrgnsBSP78fwP9lpRGFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 4 Dec
 2023 22:01:57 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 22:01:57 +0000
Message-ID: <734e2cb2-a666-4c8b-a37a-8cf605748ae6@amd.com>
Date: Mon, 4 Dec 2023 17:01:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20231201233438.1709981-1-Felix.Kuehling@amd.com>
 <408f223f-cb86-4ebc-b1db-26be0a964bfe@amd.com>
 <BL1PR12MB5144740B1E94C1BD2F7B73BBF786A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <BL1PR12MB5144740B1E94C1BD2F7B73BBF786A@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0026.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: d96cb71a-829c-4240-187b-08dbf514a26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5JVyrcoRhL3idnRsoCnwqDdTafo1Xd1sfMVnX4S/IC9VJhmYuRqrwktsz7EWS1QdTm8x/M7sjzi59p0rnoPGeIcxMvP+PR/r3NjsWbGRWZbEfbx2XfZUthtVbMLD2hu60JNCA62qaqKb1vwDlooxgwnseEr+I9L/jDhnp3KxF94U8SRNrplssvIUg2eniRgcosflN81aufPQnEJfxoC01MGFtOaEOSKhXZ70ZBOyMuLTpDoNvE7iISMPcirPan35RFdy6Tw9B2AmEmA6u2IMh7tyoZEOjnV17bnSUuv+mKBjxz6qhmCwd8PEp498Ckhr0BhTp5bZpu4wGV0U6yEWonSB0XQgu9kMxAmjakGEz5wWCNkQgwqiEsqpifpS8aG/U6psUNF6hnyf0LJO7LXDQnwPYVDXLomZOvsXB//EUnKMM4/n/riioHGfG1ucADOZiWmmkExiKQ4aGS0eMDdg/NB8ZmJL8tFaZyE4PfIMsRMlonfXcEHqiQlKJKJ0ZOe8RC1cECqNLH8JT6U1WTZFwCm8MqiLxsr3HAdUw2DpT27jTUWog5CS9yqNMhVrKRlyCY9r3ZXom8pyQlCoXX09WaAkGOl2H83Wqv+nSxp1dUlRp8eAqc3NVySEKQzXv3oTCp4IN6PQzo/O9Tn+PaBOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(31686004)(316002)(44832011)(478600001)(110136005)(53546011)(6512007)(66556008)(8676002)(6506007)(66946007)(41300700001)(5660300002)(966005)(4326008)(6486002)(26005)(66574015)(2616005)(83380400001)(66476007)(8936002)(54906003)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1VhbnpGN09mbEQ0NklKN25BUlBkSytOZDJLc0tmbVFxdTYwb2kvQ2MxUVlq?=
 =?utf-8?B?VVpsdElwc0ZwRzdEbUFub1luWUhGb3IxeE5ZcGNvK2l0c1JoeXpVOFAxRklS?=
 =?utf-8?B?RnRac1k1TDZlWmFmYnA2Vm9mbDg0QnE4b1BSclh0RStZTkhXZmVOUFgxQ2tY?=
 =?utf-8?B?dFpJQXBMZEJLV0ZkR3hCU2llUjkxMCt4MFFCUExPYVFDLzZ3NFJhVTRtZWJ6?=
 =?utf-8?B?LzJISitqand3RytDZXozRDlpYkE4ZktCUjBsa3RySCtoOXNHS2ErVkVjTFZG?=
 =?utf-8?B?bHNhUlYwSWdDOGNORlhlVTF3UXd0M2xRdXBZM0lQeSsyNVpBK0M1dDd1citl?=
 =?utf-8?B?bE52UVIvWDZiZUNySG5FV01mbmhXMnJ0SndMaHhWR2NBcWhtRUVsQ3grd0Jx?=
 =?utf-8?B?c3NYQ01vcHFGUy80akdTaUdjSkRXZUxSNVJRbm1lV3JxNFZpb0xOU01JaU9T?=
 =?utf-8?B?SmJIMWFERlBBSEVmdytWUXJna1NRN0gxMktPS1d5dFpnQmRRT3ExalJJU0Z5?=
 =?utf-8?B?K2NWZEFGak9pK1l2UkgwUVlseUJxY2p3UUVLYjg2dHVaWG1nMDI4NU16bEVn?=
 =?utf-8?B?NGt6YjNzcllqTHRKQ296WkVNYzlMMUJtRWpiS3J4QlFvUXBKeVArc1l1U3NZ?=
 =?utf-8?B?UXYrZURseXMxVUhheDVITUlVVENKajMzdnV4ZnFMNkh2WktqRlh1NUd0WDc1?=
 =?utf-8?B?amo3MW5Ba0dOZW82b0Jrd3Z3c01aY1R2N2tIeG1jOFBKcXUvWXl1cWkxTUxw?=
 =?utf-8?B?eFkvaHFiVDBNOHZtcStSbVdRcnpIMVEyUUVFSFFCTEFsTkVCRVhJV0dIYzJt?=
 =?utf-8?B?bjhyVks1UEF4MTdpT2NybzFhc2hSWGt5bFZjUkxIMVI2UVpKYnZ6ZHlJWFox?=
 =?utf-8?B?ZHFEaGJZL2RnZWkzZGROM2VUYnFDVVF2c01rZlNMWWtlRUYrcnNucU14YTBL?=
 =?utf-8?B?ZWVEZlNoQkxIN2dIc281RC9NNkl6SmpNa2hSbTd5SHhub3ozYlhoN21WM1JL?=
 =?utf-8?B?YldkNzVOMFdZWmZoM1JCN0x4ZG8wWDlseDF4QWVxbzhhZ3p2dGxYSjNOTzJw?=
 =?utf-8?B?akVHaWwvMjlVY25jVitsdnFqekNrUko1Z0REUW8vTFN3YkVpbHY5YXRHcFZJ?=
 =?utf-8?B?UE0vV1ZLTkdZQ2FNNnJ4Um45VDJUYmVwMFFLamUyOWtqaU00VDBLQUl2OStF?=
 =?utf-8?B?NHh5UVpHOE9KV09QcHFLeUVTc1hUa1hoMlIxNi9hbVptaytSSDY5SFdBUFpu?=
 =?utf-8?B?cnN0SGszdHA3L2E2SkkvaWlLQ2drY0hmSWNWdUc1WlpkOEIzUXc2TDhFS3ha?=
 =?utf-8?B?V2FvTkFNS2FYazNMYXJGOUdxUGhIVENaa3JlT0lsRXdscmhZOEVieE10ZXJh?=
 =?utf-8?B?V3piL1hJckN1Y2U5WGVNVThKWXUvcURpOXAvTVJEQzNCekRINTdzcDBMZ0VX?=
 =?utf-8?B?emlybytHb2RRcUJBU2htVk9jSG1UUFNlWGtwRUV1RnlkQmNGcWRPRnZyVkds?=
 =?utf-8?B?RUsrTU5ONUk5cTdpcUxaK1BrQU1la21NUWJUSmpmRXFHK2tBZDVnaW9DVEJr?=
 =?utf-8?B?WURMYUZiRkdVQWk5ZnZSeXErbTMrVEZUenY2WkhXSHdyYTFCQzM1VXpyOVRz?=
 =?utf-8?B?MU40QWdFM3FQU3IzSUhIdi93TXhud1hZQjZrc0taS3cya0FqWmpKeDJ1M05j?=
 =?utf-8?B?Tk5rdzVLbGZQeUpkRXpMYngzUytQdkcvNjNvbnlyYUJsTCtnRkVlV0hTT1dj?=
 =?utf-8?B?N0t0TGlLNWFLN1VxQWpWNVpqbzNFNXpBMVNpNzI5NXM2OGRITk8wdkE0NXF5?=
 =?utf-8?B?K0taVkRySVBOdURWZHVpVnRsdzRCdXpDY29YYktDT09EbHhHNmNON253SXNx?=
 =?utf-8?B?L2pQdzRJayt4T1VhelczOVovTUZVZ0FIRGwyZEdEM3VwRjZONW5DY0hIV1NS?=
 =?utf-8?B?Y1dBeXhRWWJFei9DazJrdXZ5aG84elVJWjY4MHlxRmIwU3Y5dVR4OHdHQit3?=
 =?utf-8?B?NE81RnIrSERIcTJ3c0lCYVJsQ0ZpS3h0Z1UzUldtWkVNaDh4LzdXbFpGUXpK?=
 =?utf-8?B?SU9FQldhVUoxMjZKSzVkZ1EvdU1OWWc2bGxMa1owdHFzWmJzWElFZkpNS2JB?=
 =?utf-8?Q?XOgFAzs6gikIAdsnQqY1ipdkp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96cb71a-829c-4240-187b-08dbf514a26c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 22:01:57.8133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWyZrkYv8zkVXBtdC+U+CmFBaWItfwWDHFQ88lQ9pFt57jlmAzqyX0puJiSXDqR6In1xA5sb3NO+P6S6T86KOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8299
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-12-04 12:49, Deucher, Alexander wrote:
> [AMD Official Use Only - General]
>
>> -----Original Message-----
>> From: Kuehling, Felix <Felix.Kuehling@amd.com>
>> Sent: Friday, December 1, 2023 6:40 PM
>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Deucher,
>> Alexander <Alexander.Deucher@amd.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>
>> Subject: Re: [PATCH 1/6] Revert "drm/prime: Unexport helpers for fd/handle
>> conversion"
>>
>> Hi Alex,
>>
>> I'm about to push patches 1-3 to the rebased amd-staging-drm-next. It would
>> be good to get patch 1 into drm-fixes so that Linux 6.6 will be the only kernel
>> without these prime helpers. That would minimize the hassle for DKMS driver
>> installations on future distros.
> Already done:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0514f63cfff38a0dcb7ba9c5f245827edc0c5107

Thank you, all! I also saw Sasha Levin is backporting it to 6.6.

Cheers,
   Felix


>
> Alex
>
>> Thanks,
>>     Felix
>>
>>
>> On 2023-12-01 18:34, Felix Kuehling wrote:
>>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>>
>>> These helper functions are needed for KFD to export and import DMABufs
>>> the right way without duplicating the tracking of DMABufs associated
>>> with GEM objects while ensuring that move notifier callbacks are
>>> working as intended.
>>>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Acked-by: Daniel Vetter <daniel@ffwll.ch>
>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> ---
>>>    drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>>>    include/drm/drm_prime.h     |  7 +++++++
>>>    2 files changed, 25 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index 63b709a67471..834a5e28abbe 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf
>> *dma_buf)
>>>    }
>>>    EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>
>>> -/*
>>> +/**
>>>     * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
>>>     * @dev: drm_device to import into
>>>     * @file_priv: drm file-private structure @@ -292,9 +292,9 @@
>>> EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>     *
>>>     * Returns 0 on success or a negative error code on failure.
>>>     */
>>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>> -                                 struct drm_file *file_priv, int prime_fd,
>>> -                                 uint32_t *handle)
>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>> +                          struct drm_file *file_priv, int prime_fd,
>>> +                          uint32_t *handle)
>>>    {
>>>      struct dma_buf *dma_buf;
>>>      struct drm_gem_object *obj;
>>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct
>> drm_device *dev,
>>>      dma_buf_put(dma_buf);
>>>      return ret;
>>>    }
>>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>>
>>>    int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>>                               struct drm_file *file_priv)
>>> @@ -408,7 +409,7 @@ static struct dma_buf
>> *export_and_register_object(struct drm_device *dev,
>>>      return dmabuf;
>>>    }
>>>
>>> -/*
>>> +/**
>>>     * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
>>>     * @dev: dev to export the buffer from
>>>     * @file_priv: drm file-private structure @@ -421,10 +422,10 @@
>>> static struct dma_buf *export_and_register_object(struct drm_device *dev,
>>>     * The actual exporting from GEM object to a dma-buf is done through the
>>>     * &drm_gem_object_funcs.export callback.
>>>     */
>>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>> -                                 struct drm_file *file_priv, uint32_t handle,
>>> -                                 uint32_t flags,
>>> -                                 int *prime_fd)
>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>> +                          struct drm_file *file_priv, uint32_t handle,
>>> +                          uint32_t flags,
>>> +                          int *prime_fd)
>>>    {
>>>      struct drm_gem_object *obj;
>>>      int ret = 0;
>>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct
>>> drm_device *dev,
>>>
>>>      return ret;
>>>    }
>>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>>
>>>    int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>>                               struct drm_file *file_priv)
>>> @@ -864,9 +866,9 @@
>> EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>>     * @obj: GEM object to export
>>>     * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>>     *
>>> - * This is the implementation of the &drm_gem_object_funcs.export
>>> functions
>>> - * for GEM drivers using the PRIME helpers. It is used as the default
>>> for
>>> - * drivers that do not set their own.
>>> + * This is the implementation of the &drm_gem_object_funcs.export
>>> + functions for GEM drivers
>>> + * using the PRIME helpers. It is used as the default in
>>> + * drm_gem_prime_handle_to_fd().
>>>     */
>>>    struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>                                   int flags)
>>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>>     * @dev: drm_device to import into
>>>     * @dma_buf: dma-buf object to import
>>>     *
>>> - * This is the implementation of the gem_prime_import functions for
>>> GEM
>>> - * drivers using the PRIME helpers. It is the default for drivers
>>> that do
>>> - * not set their own &drm_driver.gem_prime_import.
>>> + * This is the implementation of the gem_prime_import functions for
>>> + GEM drivers
>>> + * using the PRIME helpers. Drivers can use this as their
>>> + * &drm_driver.gem_prime_import implementation. It is used as the
>>> + default
>>> + * implementation in drm_gem_prime_fd_to_handle().
>>>     *
>>>     * Drivers must arrange to call drm_prime_gem_destroy() from their
>>>     * &drm_gem_object_funcs.free hook when using this function.
>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h index
>>> a7abf9f3e697..2a1d01e5b56b 100644
>>> --- a/include/drm/drm_prime.h
>>> +++ b/include/drm/drm_prime.h
>>> @@ -60,12 +60,19 @@ enum dma_data_direction;
>>>
>>>    struct drm_device;
>>>    struct drm_gem_object;
>>> +struct drm_file;
>>>
>>>    /* core prime functions */
>>>    struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>>>                                    struct dma_buf_export_info *exp_info);
>>>    void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>>
>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>> +                          struct drm_file *file_priv, int prime_fd, uint32_t
>>> +*handle); int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>> +                          struct drm_file *file_priv, uint32_t handle,
>> uint32_t flags,
>>> +                          int *prime_fd);
>>> +
>>>    /* helper functions for exporting */
>>>    int drm_gem_map_attach(struct dma_buf *dma_buf,
>>>                     struct dma_buf_attachment *attach);
