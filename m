Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B09414DC988
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 16:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881D210E1B5;
	Thu, 17 Mar 2022 15:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E8A10E16C;
 Thu, 17 Mar 2022 15:04:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxvPi8nofvDrqEFejBiCdAsVJZ5QC0oqAHZUsLlAtAOk1qgS3Rik2xug2dcy6/QUmX7G9OY69r06w8OJbohqGUNIP9juG84lWn3JrGKnC48g0ZrBEZ4EW2pRHaFb9mQ4RpFtDMH1Zr94n3k/l3u1X7GCRgwgW1UNtvF/56VSpHd7WQvwDM5gJGxuc8Ly2n7n36WTqELadmGpP4nFlbrg5ODsRrCXQUosqpyo1CLvCvA9k/486ZCF0h4DmnNPpquORSARUaLJyU16EUCbQKk2SpZT7rTUqFaI5x+Hc0bxXd/GBGrn7EYIww0PdAO0iRtawZX2reLFgelGqAhmFI8SAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEoBYQYv7A9jZd5e2W+2hXwF7UuRyWOvqQUVg7bjsJU=;
 b=MCEGHAC5qV2ZiQj1LuNlXvBAgyb4BsIqHliTVcxF7DhaUFKUzahzGNaftuhjHbZwwmHrQdZmdnzN/Y0XYs8J7yBvonWlouQwFnWA3wdxQCuDWO26MVW6pPZhPBD8Aqgbpaw0oLpLR48Ydwvara0JG2db1JlPyoUHGNizlaOKO2NyHdWl168ckAyzhMEFTUAkKMIgejHxpwm9zAV9SYh3eFnBtx7u2WEuuxAs1K04ozjykRLyVpLawaHDcivq3JjIS/PJdOX18asL3A+XwOXu2qp81mfOUwusrYENsPpYgtjhnMBfbeKz/ZCLXutKTeRwmesMMrV8vipUq+VqM1GVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEoBYQYv7A9jZd5e2W+2hXwF7UuRyWOvqQUVg7bjsJU=;
 b=pcqxBwnDVi7FkNRW3cprobSCmwb3qKvjVOsa/cuy0sdTKa8sTtD0ReaS9hJ2nVbnQ4rxgiHWy+btO7w+vq5odWXIPmif0m4vof2vPvDb43GchRPBzha1Jw51Vznj4L6ce26cv0iJPpX5Em0JRPcxEPAWsjoJyA6O0vSCXSVzRsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4533.namprd12.prod.outlook.com (2603:10b6:208:266::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 15:04:16 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 15:04:16 +0000
Message-ID: <215c21ff-0dcb-c8aa-c88a-0f8a57e09970@amd.com>
Date: Thu, 17 Mar 2022 11:04:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: amd-gfx Digest, Vol 70, Issue 199
Content-Language: en-US
To: "Yat Sin, David" <David.YatSin@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <mailman.598.1647476383.943.amd-gfx@lists.freedesktop.org>
 <DM6PR12MB50212F8389AA6EB60A1A2D7A95129@DM6PR12MB5021.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <DM6PR12MB50212F8389AA6EB60A1A2D7A95129@DM6PR12MB5021.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf0838c8-3521-48ed-aea5-08da08276774
X-MS-TrafficTypeDiagnostic: MN2PR12MB4533:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4533DF4F209D369356B3479392129@MN2PR12MB4533.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAZGo7bpeQGV9DS/+gt6NXI/fwzl6MpJaD5psLugiuAkdGLvyad1lU6wIWoSj4EiOO+dk66ku9gu8mV2cOT4jBGFUfnEIXnGzGSs0mCpD0Y83rlCyzAtnJX1iO9TtI44ohYEvtrMmGjlMxZoa+NQJY2NRtRk5FYfyswXjW9Q0X2SAbik+USoNi9ji79kq0iT07PPVvAfaa3PQzJFC0/Q4Jczn598savSucNi+fiaXeqw3kzytPogqbCU201NirUjuAK+KeVwOK07IZ/jI3y11gqNYgsyHNpiaokol0NeOefI2niS4NETQF3xRH3UUQql0m/1QDKtgYHbYH9gQ16xfMy609PUkQVcaIlSuQjWmiUyw/7c+AIYjoOQhpsgB2Li9LWPpEp/vhxmvdpaCkFG9WckuBYuU+xmp6af+WJasEqbeA1TMOXAPCkaQUd83gUwZqDdx3b9IZvqHLcsHZDlAAsJuiuNfv+zFb9DSKoVQSdZK6SU2CiRvxNJjzmUf92OFqR9u+WHrgLmMYqxNgFwI+60smdjEOUhqcs7qwZBRIa71hdlJdbWCJ2zDs7edMRnXILov4nhRXAyYqST3//pupMARJ67Tp+Tp0dVh0q98NdrdELuDPJtK5BrbFVWiy/vgm19RYi/Lw4QnXguURcA1srefWONLL7fAKFoZKDKndY0R6LBj8Q/eIliV5r9oWp/XRYhlYY9YoLcJYT7cC+WhA08kQhzheSTv8QwMTxquPMRz4ijIYNauOD/MvcvsmQq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(450100002)(6512007)(508600001)(316002)(31696002)(83380400001)(66946007)(38100700002)(6506007)(4326008)(8676002)(66556008)(66476007)(86362001)(44832011)(2906002)(186003)(110136005)(36756003)(26005)(31686004)(8936002)(5660300002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlo3bko2U1FUbDRCRTM1aGh1ZnpXRHJzK1RETkdsSjdjNC9qL3l1LytHQllV?=
 =?utf-8?B?M3JzWWl2U0FjY0Nac0VHckI1L3VKeS9WOVc1L3dXS3U2M3JzTU53aXVHcnVh?=
 =?utf-8?B?QmxOK3JxRDVqL2RsdTRWcU9yOTlIK2psRk5VSFVqTDdEL2dTb2tpSm9nSTVt?=
 =?utf-8?B?SHhZbThwT1VMSmx5cHlPeEd2UkgrZkt3eldxYk9hZXhLY3JBZlA4VzBXT3Nh?=
 =?utf-8?B?ZG1yWXYrc3ZHcmM3Q0hpQnFaanFaZGdBMURHLzRsKzk1b1ROTC9tVTVLdzZX?=
 =?utf-8?B?MnRGajU1cFhYeUV0TGREM1UwRnR3VnNGcGt5UFEzSGJSanNUOVZDOXZnSXZR?=
 =?utf-8?B?bGNYWnZ1NElaTXJZVHRUZzhtQ0RXaDdTYklKejd1UTZvaVQ1VEc3aXBLL2Iy?=
 =?utf-8?B?d05ES1RmRDVsS1pYRmhvS3hvZnhjQ2VYOGhMQWVhQnltb1NjQ09Pd01YVmxq?=
 =?utf-8?B?S1I3T3J6K2xrNk5ockN6eit2dzJkWTVIRGtHRVlHN2IwaFVMYlc1Ums3SEVI?=
 =?utf-8?B?dHlkL0hZQjUyMjVxTjVNeWpLZjVGMFRpVjFzMnlsaXUwS29GN1p3dWM5eGRw?=
 =?utf-8?B?S09Ya1luRUluWTBIODJkbnBjTUNaTm5IbXJkM2VvQ2Y0WlAySnYzQlJKcnAr?=
 =?utf-8?B?UDRaK21nSnh4bXBBRkpiSlpyQXlMSnRobkVoR08yYlVkVU1zUytlYUdEZ3Yz?=
 =?utf-8?B?OGNUYVJObkd2L0JxaGdpNy9aakYvMlBINTlrSlNOeW1zak1YN3ZOaEJGUllk?=
 =?utf-8?B?OFB1eitMVHFENkZsY0ppd0U3RUhmNmFubjhON0ZmQytCaDZhc0xSU0RObmkr?=
 =?utf-8?B?cVcyc0xsUnAvZ2xBdUtTVkFlTUVOM0JBeVNkVkdCMXNBRWUzNGFMWVBzZ1Jt?=
 =?utf-8?B?L2VlTUNrRnVOV0sveTNkM3AzWVFMa3JITEJTYkJiTE04MXh2M3FNNlNoN0VL?=
 =?utf-8?B?VEgrU1pnSE1kSDJCdGc1bG5aUmw3dC9CQnJ0TkxFVU5veHkyTmdhaUhGV1JK?=
 =?utf-8?B?NFg4RkJ3aXRHd0NXRHhCRHJQS3dVd3EvQ3JEemNDblVZaWxFV1IzZ0V3OW5o?=
 =?utf-8?B?ekJWcjZjYXJDZjYraVZuUVU3MWFrbjV4Snh0OHJPT1pBSUkxakplU0wvaDFH?=
 =?utf-8?B?bWxYUUxjemlHa0hDTndXV1NBcktsNkV0TzdaZk5ReDByUkh1WHNHWi9yUWVn?=
 =?utf-8?B?WGxSbnpoT2FCZFExVlhKWUlkNHpYSFZDN001Qnhyc0RxbndEMjhiWEdQTmZN?=
 =?utf-8?B?eHJvQ05mM2VobExEejF1dEU4SGdndG5YVHd1aUJYWklpd09pbUhhSytpaFg4?=
 =?utf-8?B?MktmTUxlWWpNb1RLU0NvZmxwNVVtRTIvSnRsdEFTMUlHWG9UZUVxcDFiQTYv?=
 =?utf-8?B?NmlkaWJGeS8zMVJESW1GSDNaNGxtUU9CcTV2NjB0elh1M2dXeG1ZV3pZMjE0?=
 =?utf-8?B?blFDeGtIeE94QTFzNFQvS2pxQUF2K0V3NVhaOUJIaHJhWklOKzhBc3NRSWow?=
 =?utf-8?B?UmVHWnJtd0FKR3ZjcXlzYkFld0ZzZXpKQ25pZHpiZzhWcmZCamZJMzVmZkRh?=
 =?utf-8?B?WEJZYmEwNjEwOW4vb3JVcUNHUGUyTGtKKzBSanhjb3JPQ25UNmlTbVAySHo2?=
 =?utf-8?B?ZFlCYUIvQS9UYnYyV3pIclByVGs2OFRZano5b3RqTlB4ZHRMUGlicjlMaDhB?=
 =?utf-8?B?L09CbE8vSjVmekw3U1RTU0pXajhKeXpDV2dMZ2JTT0daVndnS0phMHlESEY5?=
 =?utf-8?B?YjQvKzN5eVZ6MXp5U2hKbVVtdFFOY3RBMjFoM05FVmVnMGo0WkZadFlDMytp?=
 =?utf-8?B?dDBQRndCcHpMS3VERGFnMzdwU1RFTDFmT1dhUzBzT0xheFlId09VeFNwUmpz?=
 =?utf-8?B?dkVPYTlLem9OYzV4bzBrNUY0ZGVra2hGMFA5ZDVJUEJWcFA2czRHeG5YM0FJ?=
 =?utf-8?Q?v9qL3UrooyB0gRnveOvRgDwlhGtJQp94?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0838c8-3521-48ed-aea5-08da08276774
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 15:04:16.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8oiLVF0HyJwBIpjcjKgHcTmv7cmHNaOldWILaGpBaE4ZSggjC656nse/IlbJQx/2YOHwC4slgm69ClCZyvG2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4533
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-03-16 um 21:57 schrieb Yat Sin, David:
>> Use proper amdgpu_gem_prime_import function to handle all kinds of
>> imports. Remember the dmabuf reference to enable proper multi-GPU
>> attachment to multiple VMs without erroneously re-exporting the underlying
>> BO multiple times.
>>
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++--------
>> -
>>   1 file changed, 21 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index cd89d2e46852..2ac61a1e665e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -2033,30 +2033,27 @@ int
>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>   	struct amdgpu_bo *bo;
>>   	int ret;
>>
>> -	if (dma_buf->ops != &amdgpu_dmabuf_ops)
>> -		/* Can't handle non-graphics buffers */
>> -		return -EINVAL;
>> -
>> -	obj = dma_buf->priv;
>> -	if (drm_to_adev(obj->dev) != adev)
>> -		/* Can't handle buffers from other devices */
>> -		return -EINVAL;
>> +	obj = amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
>> +	if (IS_ERR(obj))
>> +		return PTR_ERR(obj);
>>
>>   	bo = gem_to_amdgpu_bo(obj);
>>   	if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
>> -				    AMDGPU_GEM_DOMAIN_GTT)))
>> +				    AMDGPU_GEM_DOMAIN_GTT))) {
>>   		/* Only VRAM and GTT BOs are supported */
>> -		return -EINVAL;
>> +		ret = -EINVAL;
>> +		goto err_put_obj;
>> +	}
>>
>>   	*mem = kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
>> -	if (!*mem)
>> -		return -ENOMEM;
>> +	if (!*mem) {
>> +		ret = -ENOMEM;
>> +		goto err_put_obj;
>> +	}
>>
>>   	ret = drm_vma_node_allow(&obj->vma_node, drm_priv);
>> -	if (ret) {
>> -		kfree(mem);
>> -		return ret;
>> -	}
>> +	if (ret)
>> +		goto err_free_mem;
>>
>>   	if (size)
>>   		*size = amdgpu_bo_size(bo);
>> @@ -2073,7 +2070,8 @@ int
>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>   		| KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
>>   		| KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
>>
>> -	drm_gem_object_get(&bo->tbo.base);
>> +	get_dma_buf(dma_buf);
>> +	(*mem)->dmabuf = dma_buf;
>>   	(*mem)->bo = bo;
>>   	(*mem)->va = va;
>>   	(*mem)->domain = (bo->preferred_domains &
>> AMDGPU_GEM_DOMAIN_VRAM) ?
>> @@ -2085,6 +2083,12 @@ int
>> amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>>   	(*mem)->is_imported = true;
>>
>>   	return 0;
>> +
>> +err_free_mem:
>> +	kfree(mem);
> Should be kfree(*mem)

Good catch. That was broken in the original code too and I just copied it.

Thanks,
   Felix


>
> Regards,
> David
>
>> +err_put_obj:
>> +	drm_gem_object_put(obj);
>> +	return ret;
>>   }
>>
>>   /* Evict a userptr BO by stopping the queues if necessary
