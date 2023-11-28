Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA747FC518
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 21:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C1210E0B9;
	Tue, 28 Nov 2023 20:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFBE10E093;
 Tue, 28 Nov 2023 20:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8327j0sBSJiLCfXFh8AbpHRzhdCe4zuqttdoQ0mHPa7NYakNUB9GvqTuiwrSOWYYmnRpozwzhUi7GFFLr7mSahhuCRvTAM5SC/ff0lJykavM1C6nuryiKo4HRfl+Pr/sEIZXPFKBTx5XWrNiogCLOyiZiaEak11ZYhBd7HRTrxZM4ZTRLOZpSupF8Hwv5Gf9vQhz7nPUlmfjm+PMc2+vEkXXPdUFxLSlN8kynIz6wZZWL/F4n1Vyksa/SwDJwH2Q8BuKrIyPETcQV6g/VKa1cxqEm5ntEI1sYeovKEYIVetyswmwOEIk1roMLr6D5wOnrgn9We5PpHoWGb9MQHmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiIgU8xG93kgT3WLm7rwmEaTvP9jaO/9mwZzTpBIAoU=;
 b=idDLNKV+9lO7GUVoacNbmVoHjiNGBNHIpq4g7agNXvbtiPVP6Kg51g4zZW6RF4q3DjoprcBaBsDI+RUwyfOwqWHbQqQ2o/TlFIDTHta4ieNXnVcGL5ovjWjObLGLVY58IOO7oHU+tx6vJZ3+ZLqbhJD0rjGxjOpjo6D0v6exYfj9Z7RWKNXf/cw/KM6uUCtAgNyoMxLuj/6NMJ+ax6c97yMm51+rj6Xa6vmgyJOchsAjRS5P2B/Xr7wCAIKmw1BEv3SxHTxzLD1WGtnA0FXVbdmmJdxyOvopEvvaKY/X/agiFOigCo35kZIpCzxT8BwbOK11tlVveFPM65gU4+5Taw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiIgU8xG93kgT3WLm7rwmEaTvP9jaO/9mwZzTpBIAoU=;
 b=I67+AbCmBQJDH9SmTNApVv9x5S6NTg2DFKomOnlD8E3RpVXZXjYnHUz+rXEaVLTx+XSKKf8zdOfaNgiiwpEgLzldRl/+2cvVgWPRsodKKqdiTSb/hhHVsYiLmnV4o+x9pAmbkjHO6DZgQc1yECI54YXbptnuhdlBigh9qqwuMMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA1PR12MB8917.namprd12.prod.outlook.com (2603:10b6:806:386::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 20:15:31 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 20:15:31 +0000
Message-ID: <728a593c-188f-4b0e-96e4-f09806e88d4d@amd.com>
Date: Tue, 28 Nov 2023 15:15:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <4293cfca-6775-44bb-b6f6-81c98491941b@amd.com>
 <CADnq5_Noy86ts4y3a2pns7U=biiFdLFjbYtq9sLaEsiXhLnNzQ@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <CADnq5_Noy86ts4y3a2pns7U=biiFdLFjbYtq9sLaEsiXhLnNzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA1PR12MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f894f0c-140d-48d4-5a6d-08dbf04ec5a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Il81hqvRxvhn+/qRDwxsdZap8riX5he/q3m+5ujbglhy2ad4AHCqRbvlUwKbLjmmkTle7g5lwGiOGNz1afjT1oQ52XDY3GtD8/hxojuPYxnIUmEFiasxlkQDbpLbSZChWlYjmccALY/jdaTUysxgm4fZqR+83y0+s+8OMUOBmnwgViQ4i3RxEeHgacXvGXgWxqekSMkiq/gvcI7xiIMUlTEcQMaSTsv/wnrTxQ7V2aahEvKL6dU1HKYDpy1T4eUEoQGx2DaH2CPfekbHMQp9PS+OoQU85jEnoQCVqSbcT8BZQUIz2b2sSiLr+YwvyDp4CQnaMC+EQ+noyp46mCjCywW/iPGoQgzHeRWXOI+4uR8uPbOmoEaiZO2X6uYfsC02mSyok5xox6ffJ9gvMcr0YFOzGNHogHBQkygQdLTI+q/PRfCpuskyCLkbI1G1dpyuWjeRK8648n7BaJgoMUsidVTwaAC3Cgozqd2w389vSPfoWbgk5/vIx7z6ZJF4kXbso0ijSK8XQH+9naQBX1mVL2FH9uOze+0PeWW8vIUsbTaV9DgGnwM2oxUJ84gQ9TNsB1UKCsPg8gJjYHDXyYGNPDyXrGxnxWIkMSow754JJNNIJALPld2U55WJuB6Tczm/0iwgxmOFrJMJie5Ne9QeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(376002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(8936002)(4326008)(31696002)(8676002)(6512007)(53546011)(6506007)(6916009)(54906003)(66556008)(66946007)(66476007)(316002)(66899024)(6486002)(478600001)(36756003)(38100700002)(41300700001)(31686004)(4001150100001)(86362001)(26005)(44832011)(2906002)(2616005)(83380400001)(5660300002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXg4MWhrYm9FdlBxcThHMUZrejZRakd5ZXQ2L0t5OE81V3QwZ3o4dGJDTHYv?=
 =?utf-8?B?dFgxN3VLaFRDcWoydmZLek5BMUZqK2cwNWtmV1daT1BtVWNYYTluTXlQWlBZ?=
 =?utf-8?B?czkzWTF1cWFjRjhRU0llc2QzMitoK3Z2ekZTV0tzTWdWOFRiVUdvc21tYTZX?=
 =?utf-8?B?T0VDMGRneVRmQzI3Y1dCaEJTRm02dWN0ZDJGV2RiWVNsZXYrdEFQZkdaL0c5?=
 =?utf-8?B?NHE4TS9ub0JMdWdVcVkrcGU0dUtMRVVUVm9pM2k2NXRZd2RicE5NVXEvbFZo?=
 =?utf-8?B?SVZvaHhSU2N0MklPVXUrT2tVTXFBM2VwVFJaL2hhZSsxU3hyeWExYTBKRmNU?=
 =?utf-8?B?eHZUVEUrbnorb0VGL2VaSmR4cjlFRC8yeGlEamYyajFnUUIvNWdqanJkZmNj?=
 =?utf-8?B?ell1QjQrTkJKUjk5U3lad3VHczZLa0RvWmlndCtGak5zVmh6U0J4S2ZQZVox?=
 =?utf-8?B?Q0IzbEsvU2pXRklFNzVCOVp4bjZac3BQQU1wM09iQWhjUFlSdWdMVVdvZDF1?=
 =?utf-8?B?U29jbnJlYS9OSk1BQ2tXeDB5K3VuSmhta1hlMk5sU0xSUE1vcXFYY1NtL3BF?=
 =?utf-8?B?UVp0SE9aYmUzeGpsU3ovekY4dnFUMEZBL2JCbVBTMHNCR2ZrMUNvMGhOb0sy?=
 =?utf-8?B?TnVEVWhaS0VHK1p6MFUrUzloY0dHZEp6aEY4NktnRTRMYngwRjVET1F6SW5o?=
 =?utf-8?B?QWNCM3k4bTNCSE9LY20yWm9GNEV1WlVQY0RuMVQ1T0RTVFF5WXdaL3hLQUh1?=
 =?utf-8?B?TzNzTnc0dnd1TzA4K0V0dUxveUxrN1FOUGZrMFRDT3R2TXNEZC9KczlVNWYw?=
 =?utf-8?B?NUdXaHVhOFVNQ09mc0xZNFl4S0dYMVhGNnB0Qzc2dnBIdzhUTHV1b2ZoTXd6?=
 =?utf-8?B?OEptWGN0Y05RTnFJYVM5NHZOdzlCRGVEcXg0c1l0TEZEWkFqdm4vUFBzU3pL?=
 =?utf-8?B?SXV0UTNrbmlBdjdRL25iRlJ5OHNPZzNQRTBraHJaUW9TYkh2QnQ5djBNMnJP?=
 =?utf-8?B?ZWpUeDdHMWxtaU1FbDZMSkZHR0M2aDh6VExEVmpmMGdreHhqdVEvV1J4N2NH?=
 =?utf-8?B?eE5xLys4S1FaMGR6aGJ5bzBCekgvRFluL29IOHp1YTZMQm54M0FsQ1RnQXJi?=
 =?utf-8?B?K0NJWXhrNDY1TU80c2t0QUZUcXgweDFSSjRuWnRFaExTcTd5Rk93WGZJRHJH?=
 =?utf-8?B?S2hwd2lBa0liNWU0dFZhUTlMakZjb2p2THFHRmNDc2VsUC92WG1SN0JjSmJK?=
 =?utf-8?B?dHBRaTdTOXBETDZ2NU84TTlnRS92VHBDd3I1MzRLcFYwdDJoSzFuOHZXUHVl?=
 =?utf-8?B?ZWNQWDcvOUpKK0VzZUphNzVSTHNtRk8xNVhidnJWd3lNTXBvMzNYdTZxdmtT?=
 =?utf-8?B?ektuVTI3WkQ3VmxSMzdTVjYvU1crRHB5MldNWWxkem14QSszclZoVktnREV5?=
 =?utf-8?B?bmNUcUNWWitzWUtmcTIrTFV2b0o3T05jbzVVZWFJcjZtNjMxLzc4Uk5uME02?=
 =?utf-8?B?M0lhYnQ1cVkvdmpBK0hSbWN4WXRKNlF4NnZTVmFMYmJRelJMWnhlNUVPa3B0?=
 =?utf-8?B?NEI5Y0JvZlI2K094N2Z4aVVPSG81eWNGS2M1THc5bVZlRDNtelY1S2xtZzBJ?=
 =?utf-8?B?czc2QVVLQXVIN1p0a0R3TGZROHIrT3hlRkY4ekRtVTBReUVCYjR3UVliaGxt?=
 =?utf-8?B?STdSSXptR3Bad3ZsUGtuNytFSm94ajR2MjhUbkpadDlpSEdSSW0xQWpubUc3?=
 =?utf-8?B?NDhYZkdJc1hCb3lRN0xjZEtndHJuY1FCOG9McWJLUjRjVWJNeFF6STh1NzFO?=
 =?utf-8?B?SWtNK0JXZFUvcmovSjhaYnVtcU1CM1FmWGpZWHBGVFY5Q1pLZzR3TUNxZGlP?=
 =?utf-8?B?YWpENnlNNzB0K1NidW0rY2JiYnBmR3V1QWVhdDgzQVZkYmdLSSs5bnFJMjky?=
 =?utf-8?B?cGJVQmhNU25tcCt4RWJlOVNJSy93SVRzYUxLSDYyRVhCK2ZxNVVMSEZmbXYx?=
 =?utf-8?B?TUl2K291TGdJSEYzN0VhMlRTQ0FlMkRKSngxZ2xiWjdtaEV0eWZTTWgxUVBq?=
 =?utf-8?B?eGNOK1laRllCK0QxMmdySm1kNjBOcGlBbXNPQjdiMUkyYzRyblhMQkR4STNH?=
 =?utf-8?Q?jaEG09tGp7qvbgumKVSKqMRcH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f894f0c-140d-48d4-5a6d-08dbf04ec5a3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 20:15:31.8547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hD9Tq4hqVL2K1vvm6L2BOZaAfY3xq2FdneAw2+peFMWwtIrNzs9CmQhFbGI/7IXMrqN1CZvZZuAIRaPlJHNfAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8917
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-28 12:22, Alex Deucher wrote:
> On Thu, Nov 23, 2023 at 6:12 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
>> [+Alex]
>>
>> On 2023-11-17 16:44, Felix Kuehling wrote:
>>
>>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>>
>>> These helper functions are needed for KFD to export and import DMABufs
>>> the right way without duplicating the tracking of DMABufs associated with
>>> GEM objects while ensuring that move notifier callbacks are working as
>>> intended.
>>>
>>> CC: Christian König <christian.koenig@amd.com>
>>> CC: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Re: our discussion about v2 of this patch: If this version is
>> acceptable, can I get an R-b or A-b?
>>
>> I would like to get this patch into drm-next as a prerequisite for
>> patches 2 and 3. I cannot submit it to the current amd-staging-drm-next
>> because the patch I'm reverting doesn't exist there yet.
>>
>> Patch 2 and 3 could go into drm-next as well, or go through Alex's
>> amd-staging-drm-next branch once patch 1 is in drm-next. Alex, how do
>> you prefer to coordinate this?
> I guess ideally this would go through my drm-next tree since your
> other patches depend on it unless others feel strongly that it should
> go through drm-misc.

Yes, drm-next would work best for applying this patch and the two 
patches that depend on it. I can send you the rebased patches from my 
drm-next based branch that I used for testing this.

Regards,
   Felix


>
> Alex
>
>
>> Regards,
>>     Felix
>>
>>
>>> ---
>>>    drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>>>    include/drm/drm_prime.h     |  7 +++++++
>>>    2 files changed, 25 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>> index 63b709a67471..834a5e28abbe 100644
>>> --- a/drivers/gpu/drm/drm_prime.c
>>> +++ b/drivers/gpu/drm/drm_prime.c
>>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
>>>    }
>>>    EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>
>>> -/*
>>> +/**
>>>     * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
>>>     * @dev: drm_device to import into
>>>     * @file_priv: drm file-private structure
>>> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>     *
>>>     * Returns 0 on success or a negative error code on failure.
>>>     */
>>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>> -                                   struct drm_file *file_priv, int prime_fd,
>>> -                                   uint32_t *handle)
>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>> +                            struct drm_file *file_priv, int prime_fd,
>>> +                            uint32_t *handle)
>>>    {
>>>        struct dma_buf *dma_buf;
>>>        struct drm_gem_object *obj;
>>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>        dma_buf_put(dma_buf);
>>>        return ret;
>>>    }
>>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>>
>>>    int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>>>                                 struct drm_file *file_priv)
>>> @@ -408,7 +409,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>>>        return dmabuf;
>>>    }
>>>
>>> -/*
>>> +/**
>>>     * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
>>>     * @dev: dev to export the buffer from
>>>     * @file_priv: drm file-private structure
>>> @@ -421,10 +422,10 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>>>     * The actual exporting from GEM object to a dma-buf is done through the
>>>     * &drm_gem_object_funcs.export callback.
>>>     */
>>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>> -                                   struct drm_file *file_priv, uint32_t handle,
>>> -                                   uint32_t flags,
>>> -                                   int *prime_fd)
>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>> +                            struct drm_file *file_priv, uint32_t handle,
>>> +                            uint32_t flags,
>>> +                            int *prime_fd)
>>>    {
>>>        struct drm_gem_object *obj;
>>>        int ret = 0;
>>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>
>>>        return ret;
>>>    }
>>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>>
>>>    int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>>                                 struct drm_file *file_priv)
>>> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>>     * @obj: GEM object to export
>>>     * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>>     *
>>> - * This is the implementation of the &drm_gem_object_funcs.export functions
>>> - * for GEM drivers using the PRIME helpers. It is used as the default for
>>> - * drivers that do not set their own.
>>> + * This is the implementation of the &drm_gem_object_funcs.export functions for GEM drivers
>>> + * using the PRIME helpers. It is used as the default in
>>> + * drm_gem_prime_handle_to_fd().
>>>     */
>>>    struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>                                     int flags)
>>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>>     * @dev: drm_device to import into
>>>     * @dma_buf: dma-buf object to import
>>>     *
>>> - * This is the implementation of the gem_prime_import functions for GEM
>>> - * drivers using the PRIME helpers. It is the default for drivers that do
>>> - * not set their own &drm_driver.gem_prime_import.
>>> + * This is the implementation of the gem_prime_import functions for GEM drivers
>>> + * using the PRIME helpers. Drivers can use this as their
>>> + * &drm_driver.gem_prime_import implementation. It is used as the default
>>> + * implementation in drm_gem_prime_fd_to_handle().
>>>     *
>>>     * Drivers must arrange to call drm_prime_gem_destroy() from their
>>>     * &drm_gem_object_funcs.free hook when using this function.
>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>>> index a7abf9f3e697..2a1d01e5b56b 100644
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
>>>                                      struct dma_buf_export_info *exp_info);
>>>    void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>>
>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>> +                            struct drm_file *file_priv, int prime_fd, uint32_t *handle);
>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>> +                            struct drm_file *file_priv, uint32_t handle, uint32_t flags,
>>> +                            int *prime_fd);
>>> +
>>>    /* helper functions for exporting */
>>>    int drm_gem_map_attach(struct dma_buf *dma_buf,
>>>                       struct dma_buf_attachment *attach);
