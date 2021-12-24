Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F32447EE1F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 10:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C56F10E48A;
	Fri, 24 Dec 2021 09:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3274610E486;
 Fri, 24 Dec 2021 09:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOaE0W7gcK4RBUy2UVHCs4xRKKsuxO+RsGOjDtsZLJMqcp1q8c23a0o6XiIEuME3Pz9qAkWIGdmFDpGaIL1yiYSzwq225Oh6jTztyZrUQi1e3IsZTiyOkn1KcKBNjsrJ0hp/AFjk8juadL5aBEv14NezQr4x4+lhrOfDQ4yGjY4TfFCcFeH2Lpb8wmljWYf3os5jOF/HjH6KA/SDTLv1/+mecRi9bOLLm+rEzACvC4PkxD+Zcif/dEoxk9M3XJDQJktNgWgacqpghWIZyIRaN8G0Q3lmHxU4AEUCoyzPuqUgTyjIRBKar44HAr6v3AP1XHhJbnVAGPv409FJNwxQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij3hX7zktHJ/wJ8BMXzThkQK/uK0hb/tZeX6Npm5+rI=;
 b=Cc1YuTuGeZkN/y3geLZ3gUwn6xi8LdEjaes/oxIL4Lo45/mWicznRL2hXyU4EX5hCrNLSGm/VnvnfPMGe0X4E4Ann6OtxTMbhG6Zwo4JB/pNKGLnaRumOLTXF4RrN62+AC5D4C6ePJDVmTZVNFbVim9TiYt5fZGp7HkY64+E2Q1W08opFeeNXt1okqhAa6KAVoSqOzcotsom1fDTa9+ormmpHcqln6/mJ0rdUOdkYslY+p+V7LiCiyU41q56OBV/uCHH6hzhNPOSm8UfCqXmid0mlGV1tyZqH7P4Mt7B0M8TFMULwoamJg3CWa5j/sVJ1fGCgXlTwbBRzYLLdfNU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij3hX7zktHJ/wJ8BMXzThkQK/uK0hb/tZeX6Npm5+rI=;
 b=Ydre4mssj0Zl3UjOLm7KQO35LMYK9aGt5FZbJ0iwmuhQt5jYQeQFvvyb5PrIhZ7OUeBzm4peKrov8KWtgPKhw5mhd84RH86o6bgK+gL8UfXXppXaBSTDcQm5wLA1LusxS0/OFlrjcAQrTgTY7aGvvNeaetKhRflaK91t7J0ddOY=
Received: from DM6PR02CA0138.namprd02.prod.outlook.com (2603:10b6:5:1b4::40)
 by CH0PR12MB5059.namprd12.prod.outlook.com (2603:10b6:610:e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Fri, 24 Dec
 2021 09:57:11 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::77) by DM6PR02CA0138.outlook.office365.com
 (2603:10b6:5:1b4::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Fri, 24 Dec 2021 09:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Fri, 24 Dec 2021 09:57:11 +0000
Received: from [10.65.96.204] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 24 Dec
 2021 03:57:08 -0600
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: "Deng, Emily" <Emily.Deng@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, Horace" <Horace.Chen@amd.com>, "Chen, 
 JingWen" <JingWen.Chen2@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
From: JingWen Chen <jingwech@amd.com>
Message-ID: <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
Date: Fri, 24 Dec 2021 17:57:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1558ddb-f6e4-49fe-dfa4-08d9c6c3c18b
X-MS-TrafficTypeDiagnostic: CH0PR12MB5059:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB50599ABA3C61FF62545BEA47B77F9@CH0PR12MB5059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mCv01MzIcOpUqf8UX9yhf+kouhVEgGoi6O5laWijmJBgDN7YPokT6c1OgNQYqZhvM09/+X9vuB4kGkvKcIpNkJnjb8CmvpgI5MWg3Y2ezIAeiepQ0IL2SMq4pxrZmZPkO9+ly9GbChMkRCvtIQNGjm1kxRZQoEbfvHVXp/K3mu1L4Cw+dShZ5ogG+7e4Efc97qP0TuHKHwH9Lrgldu9VW9WnqdFx5iw5utehSoF30pgZsN4KUhE5/v7OfjEHpNNxf65Vzugsx95wDlSszaqyUGLN8sN+cRu8e3mOe81juxAsDdrua5GdHrkCevGHQWSAz2FAqvtzLc2r5Ds4nQ7kYMPJqxZiNjKxO7iMmXGx7l1lJbyuW7uWKFfOBv9Ijjz8adZv/g7h/gEqUUk09vW/LLNyedN5H2ryPATVH2+4qrmuAW12ZKS136bjX1nS2gxzH6IByv2iAZK6ojbe645DSBEzmNbsWWP8E4G12ZbbIXZXmhuUh6elku8QIno0i+Pti3bUK7P07Hxm5FXtRZ20NdzHIAg3RwTL2Tfj4yyzC2woUDLFTJjIC/tEefD7bTbksyXPOSDormoa/j6Pu9LntSJF5gg9nqoQp+Kki61x0DHZHY6xq78dSJnVTYs6PcONE5P5Yq0ilZL60qHrYHFnA7HOJvtaAWgQLb1gnNpDU4sn2Bf0b/prdvaPhn8cLpSgmscZUZZvviliJLFzhIsGA5A6igaPCQ+aMhUL5tYK4Li7phWCNmTJE8L8f0AEuOQefkCHwJWEQgjlk53x0e4Q+/4/+MT3dyDOxqKH/P5cOccfML/E2nXIXjd0LBli9uaOSUr4x8XNtCwVLciRgiYMDMrrdq+aeb+fNXgoHSoEk6w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(16526019)(186003)(66574015)(8936002)(83380400001)(2906002)(53546011)(70586007)(6636002)(5660300002)(26005)(356005)(36756003)(70206006)(36860700001)(508600001)(16576012)(921005)(426003)(110136005)(2616005)(316002)(4326008)(81166007)(31696002)(47076005)(40460700001)(336012)(8676002)(31686004)(82310400004)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 09:57:11.6946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1558ddb-f6e4-49fe-dfa4-08d9c6c3c18b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5059
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.

On 2021/12/24 下午4:58, Deng, Emily wrote:
> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>
> Best wishes
> Emily Deng
>
>
>
>> -----Original Message-----
>> From: Liu, Monk <Monk.Liu@amd.com>
>> Sent: Thursday, December 23, 2021 6:14 PM
>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey
>> <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedesktop.org; amd-
>> gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen,
>> JingWen <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>> Cc: daniel@ffwll.ch
>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>> for SRIOV
>>
>> [AMD Official Use Only]
>>
>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>
>> Please take a review on Andrey's patch
>>
>> Thanks
>> -------------------------------------------------------------------
>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>> -------------------------------------------------------------------
>> we are hiring software manager for CVS core team
>> -------------------------------------------------------------------
>>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Thursday, December 23, 2021 4:42 PM
>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>> <Horace.Chen@amd.com>
>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
>> for SRIOV
>>
>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>> Since now flr work is serialized against  GPU resets there is no need
>>> for this.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>   2 files changed, 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> index 487cd654b69e..7d59a66e3988 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>> work_struct *work)
>>>   	struct amdgpu_device *adev = container_of(virt, struct
>> amdgpu_device, virt);
>>>   	int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>
>>> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>> -	 * otherwise the mailbox msg will be ruined/reseted by
>>> -	 * the VF FLR.
>>> -	 */
>>> -	if (!down_write_trylock(&adev->reset_sem))
>>> -		return;
>>> -
>>>   	amdgpu_virt_fini_data_exchange(adev);
>>> -	atomic_set(&adev->in_gpu_reset, 1);
>>>
>>>   	xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>
>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>> work_struct *work)
>>>   	} while (timeout > 1);
>>>
>>>   flr_done:
>>> -	atomic_set(&adev->in_gpu_reset, 0);
>>> -	up_write(&adev->reset_sem);
>>> -
>>>   	/* Trigger recovery for world switch failure if no TDR */
>>>   	if (amdgpu_device_should_recover_gpu(adev)
>>>   		&& (!amdgpu_device_has_job_running(adev) || diff --git
>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> index e3869067a31d..f82c066c8e8d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>> work_struct *work)
>>>   	struct amdgpu_device *adev = container_of(virt, struct
>> amdgpu_device, virt);
>>>   	int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>
>>> -	/* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>> -	 * otherwise the mailbox msg will be ruined/reseted by
>>> -	 * the VF FLR.
>>> -	 */
>>> -	if (!down_write_trylock(&adev->reset_sem))
>>> -		return;
>>> -
>>>   	amdgpu_virt_fini_data_exchange(adev);
>>> -	atomic_set(&adev->in_gpu_reset, 1);
>>>
>>>   	xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0, 0, 0);
>>>
>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>> work_struct *work)
>>>   	} while (timeout > 1);
>>>
>>>   flr_done:
>>> -	atomic_set(&adev->in_gpu_reset, 0);
>>> -	up_write(&adev->reset_sem);
>>> -
>>>   	/* Trigger recovery for world switch failure if no TDR */
>>>   	if (amdgpu_device_should_recover_gpu(adev)
>>>   		&& (!amdgpu_device_has_job_running(adev) ||
