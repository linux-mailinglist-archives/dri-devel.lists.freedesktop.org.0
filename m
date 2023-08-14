Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A177BD97
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 18:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941BE10E09C;
	Mon, 14 Aug 2023 16:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7573310E09C;
 Mon, 14 Aug 2023 16:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hahIWiGvbzZbPlU37tDly7PJTDNPPHluPNpjGidi62B7WjOz+t9fukNYdfSWMDDl36ud6jbVaw/Gbt73nD+R/Egt9Wur/eEwUZ/yvfDLFsSALpepJrhBfsLdknqcG2PJ0CmgCwu36mmKPjgPEHooVqbJONHckZFkzjWjliYnLvAHMJqMmfINcHP3cpiw4ZgkBtrF1UdAfpFg5JixzjVcqwBDcwLn/Vh4Gni2TeoJFirnJmf19yKxgggnDBYx37q02ofFLaBDU6UzaM1dyDg5MG0+qCja1H2y+bCXMdNfmB5SxIDKdCG6qEZB8Dmt3xZi3r7gisls4gLSpAToeOsBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhGhiM5oU88GED7UQgrkEVK3d6qFhzeYszPeJfCqj6c=;
 b=mdTt+u1E1/PfzkMTZQ7oAQ4PWW+dCXGrg6jDTliIg+Hhan4d02RWDR3oqt2Q9w+CwiMu4TnE9Ju35426+vI6fo+YaSqMkH5mO3GQZ1Y+Sd+on9qKxX3JacM73XY5+yreG9tdO0Rqkux2bOlqg/GM11EqRkR8f9I5PYbtMmwwKz1tJnBOhhO9ENyWWvG42e7c1mOCqGsc4ehoHaHgxYzjaIOJvjAERfLSPLq4EfCAPXzgZ6FwyYvsIck4rT6VOr94iCIsr2ARQ9pmmuvB9SfZiS4chhR3iS9bFAifc6VZcVIXXzDR4Gk8wE08cCLhcIgZiih553q3+ps+EaNdRxkVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhGhiM5oU88GED7UQgrkEVK3d6qFhzeYszPeJfCqj6c=;
 b=DI90QTH3QKqswCBjsUpZIIIeQaDfUMsjE8fOuhYU6o1D0UllCxv+qD/bpkFwNCrxEpDcAD1puiEGpMMI1yth2pWEMuse9Xn7VvmEMmvf7foZUJCvo+sDGadhgW44fLhonBrz42aB0JpKqkfvhnqQMTWpFMTC4pC+rkvBanAiAFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by CY5PR12MB6057.namprd12.prod.outlook.com (2603:10b6:930:2e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 16:05:58 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6678.025; Mon, 14 Aug 2023
 16:05:58 +0000
Message-ID: <4013bb32-0ab9-4dbe-7043-011051fee969@amd.com>
Date: Mon, 14 Aug 2023 18:05:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] Revert "drm/amd/amdgpu: switch on/off vcn power
 profile mode"
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Arvind Yadav <Arvind.Yadav@amd.com>
References: <20230814073438.10682-1-Arvind.Yadav@amd.com>
 <20230814073438.10682-4-Arvind.Yadav@amd.com>
 <CADnq5_M3_N-rXTcvsQ76QGo1bjBc92SPPHfwFayNbroq-Ph_iw@mail.gmail.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <CADnq5_M3_N-rXTcvsQ76QGo1bjBc92SPPHfwFayNbroq-Ph_iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::8) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|CY5PR12MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 75235a52-9ea7-491e-1b77-08db9ce058c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmbJ/I6mLA8qaaxhxPBznYe0KHJcs3EEXsL87BKn1nJokqP4TfrVaULmtzkpxVz0Aj4/Onsh5IcJ9rIf1QBQ1A0BSsgZQysddWXm29pd5HitSD8rUTH6/lb/3KWivjOfw0SM3sBPwgWAp1l0/A6kVExA1hWMh+mJibvwcWSEYeo+N4/f2D2FoH8bN+lEYruJOamT53ds22jKYQjzJEYbs4T23O2vx22AFqhJR0IsvR1Iqo09gcsf/Je+wPBCB8EfHTxv1fUAbL8wGFZaNuQZHCA7kC7kGWsjpEvQag4c+thJnpX6Cv5y5xGbk0bT3WzW4H3ZgzRh3TKus/eueF7a1L/4M1Bfv5WhjJtuZ0hUUUIuplE87xxEL4C/BzQf+DiIBZlaAEf1j4go4IxnwLgidxxkIWkLeAsVE6vXQBrJyM7utAMmNTf1BqHOp0mLdlAUB/Jdlk1X0JZBUGHdBRvOZrRgXBKHLckjZwwycHUOJgSQFylycA+J1XYlPINUhqD9+rbTIV+tYIMCPMAKhq/GirlAATXpCGJG8I1P2WViYkFAljXhJzR6hf30HZ+jt7hvBfbEiMiYxoSlJ+r/MMFLy2FHGPCgw/XrkldAO6Nv/F6hNEDDT98QM8Nxk1/ZhXwDbILjsnbIVLXA9ZkkmhSPuH1nOswB334/eFzyeEGFBdY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(346002)(376002)(39860400002)(451199021)(186006)(1800799006)(38100700002)(110136005)(6486002)(6666004)(478600001)(5660300002)(2906002)(36756003)(86362001)(31696002)(44832011)(6636002)(4326008)(66476007)(66556008)(66946007)(41300700001)(8936002)(8676002)(316002)(83380400001)(2616005)(53546011)(26005)(6506007)(966005)(6512007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0xiTGs4blNTY3NCakN0Nlk1OThOTzl6ck05YlVmNWNqTFZ3eVR0SDBNZFJI?=
 =?utf-8?B?ek1FWW1FWk43ZFVlM25GbEZvejMvbWhma0dIYk1HcWhuanlHWHdaYUgwZlpN?=
 =?utf-8?B?Q0IzNThEdythVXhZWVhUSkE0bVErSUZpS2gvUzRpYktTTy9aWDFHTjRyNWtt?=
 =?utf-8?B?bVdQTlplTGc4T21VbHVlNVZkTzV1elNEdTRGZkRONzlYbnBJVFkzMGV5NzRn?=
 =?utf-8?B?MzJlYVM5TEtYVU51ckVUczR5eC85eXNIU29zTWhvSURYK1J4bmdrMk4yOEh4?=
 =?utf-8?B?U2RsSHRDZE0zYVZIdXhjelh2eXhieE5xWnpQNzEvVnJKNDR4cEtLcERZQmtN?=
 =?utf-8?B?TDhjZjRwVHpYUnJ5OEkrYzRLTXNMQk5jeG41SnJ3VWFCRjJUcXhvTGFwanJv?=
 =?utf-8?B?ekorY1ppdGcvZkhzbjBLak93dVE0ZFFwMVE0b0hLTVZxSk5ERjlXNjFldGxU?=
 =?utf-8?B?SE5vYmpGQXhQOUhnVzQ2aFJxNWV2dFc0a1FUbmJLb0tnUmR4dGlUUDdRQW9N?=
 =?utf-8?B?bEQxSmo4bzFZZjl0Q1liOXZUNlVkdkcxRXliN2tLSE5Ca2ErL2gzQ0x5Ym0z?=
 =?utf-8?B?eE44QXVsRmNXK0Q5a25nRXQzV0JHTjZBZkhQcC9EWlVLbml3Y1BGV0RTcEww?=
 =?utf-8?B?ekhHaStYRlJXMGJncXNZampwSURtazFGb3o1OGEzT1hDcUxNRnNZR2RMYUJt?=
 =?utf-8?B?ZjI0dmpSTy9FM3p0a0JwOC9qa0g5bC9waVk5NTZ6UUhkckhna2IxZCs1aTgy?=
 =?utf-8?B?dWszWWRtSDhCMmdHYm5CRDNhQnlDMllqaW5IelYzdWZoRy9XVCtTdWVnNlZM?=
 =?utf-8?B?ZUw0Y3JCam9CTWVUNldhUVltc2t2MUpOTm9GQkh0VzFvR1QrdjRwTlM1M0VI?=
 =?utf-8?B?Wm1JNUh4dFBlb1FiQzFNVjZ5dlp4Y2gxaS9XOHBxQVJBYjJuVjhtcUU5SDRP?=
 =?utf-8?B?L2Q3c0dNZmthM0kyMzhEVWdvUnhJL3ZQanEwTXlvckJFemM2ZW5wdVluanJ5?=
 =?utf-8?B?d1ZKdkVzc2NwdTY1WHgwcnB3bEtkbGUvRzdyYlBrb2JkT2NmWmtzR2dIMWNq?=
 =?utf-8?B?RTBaRDdVU1Z1VjlEUnM0anJJcDVtdnZVQVJoSy96bGRiMXhzcy8rR0JRZVpQ?=
 =?utf-8?B?UzY2aGhsWjdFYjJ2VWpoWDRvdVRBeW9QQmhXMG1WeFcvZVA2QWxQYjlkYWJ0?=
 =?utf-8?B?QlNjd3BFZXo1UzlycXRFY2xHRjhob2d4Q0EvSEk1Vi9kYzdSZm1tVS92YnVD?=
 =?utf-8?B?QVJpOTM2ZHdwaEEyM2FvZFNTYkl0VFhvczFBN0dvZlc1RnFCOUFJak15cjBY?=
 =?utf-8?B?NUxKOU9TZG1YeXViN1BOUnhCZUJWd1YzZkhCTUI2NHR3cHErWnNJN1VEOE85?=
 =?utf-8?B?STAwaFBEOUVlTG9uYzFNck1BakEzallOYnpRaUhNY3lhRmZxQkZLS3ZBeHpi?=
 =?utf-8?B?RjdDUGpjTTlpVnhad2tXQjYvVmxyNnVQL0laZUZLRjJCTzNoMHZ4Vy9LWW5K?=
 =?utf-8?B?TVRPNm4yamtHR0ZkYktuRTMyTkpxeWlsYnpmcCtyd3BBY1MwbFZ1STZSaGNq?=
 =?utf-8?B?MjdvZ3dqOGpRVFVUN09ITnhFVm00ZCt0UGJibWdDR1grdmZ5cmdUdWNZR2Q0?=
 =?utf-8?B?WExtUEVWWWRibkRIcEwwaUc5OVhYd2tQYkxvTTBzR0xvTHFrV0x1azVJTVRC?=
 =?utf-8?B?R25FUkdzdHhYcDVFc0R4TGZxTG1hNldVeDdsaDd5czdQNTJPNFYzSVgrbkhm?=
 =?utf-8?B?V2d0WEFjOVp2MFFiU1ZDRGpDVkJubG1jait1enQyRWRUcGZ1YU5Cd2FNZ1RQ?=
 =?utf-8?B?eWZvbHBJMWF6d2haRmZpY01ac2VqeTlHTVR0NUdpemxuMlF5Y2M3OXFhVHFL?=
 =?utf-8?B?aXpQZ2VXdngrQlQrL1JIdnMrOExCWE9jUWMvdUxaNzhoM2o0NGI4NFpMY1Nv?=
 =?utf-8?B?UUp6RGtEd0JyVHdhNWJNb0h0MUZMNlJDRmNaRmh6NVMyREVFT1JtbWp0NmxH?=
 =?utf-8?B?djBaa1RuYk9UaFY1L3dYbDBtb2tjdit6ZGpHRjJiSlRQeHNWeWxhZlRzZ1dK?=
 =?utf-8?B?SVViTktNcjd6Mm5rQmgvN1VtNGV2VlArQXNMcjZ5NUFqL01WOFJsbGs2QVdJ?=
 =?utf-8?Q?FL1g6mjCOV8tG8yI6AZWlMzq2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75235a52-9ea7-491e-1b77-08db9ce058c6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 16:05:58.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hzkr7G6YlptIcKO/w+SfgbaFGNmZf9KhVnFcf36wU6xSsYV8T2XcYrHI5qQxali1gLhWhYz0/ngl9Dw0sz5Etw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6057
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah, Thanks for pointing that out Alex.

@Arvind, please refer to the patch 
(https://patchwork.freedesktop.org/patch/504854/?series=109060&rev=4) in 
previous series of SMU workload hints with UAPI (here: 
https://patchwork.freedesktop.org/series/109060/)

Regards

Shashank

On 14/08/2023 17:20, Alex Deucher wrote:
> KFD also changes the profile when queues are active.  Please make sure
> that is properly taken into account as well.
>
> Alex
>
> On Mon, Aug 14, 2023 at 3:36 AM Arvind Yadav <Arvind.Yadav@amd.com> wrote:
>> This reverts commit 5ce71f59bb9bd3d8a09b96afdbc92975cb6dc303.
>>
>> Reason for revert: New amdgpu_smu* api is added to switch
>> on/off profile mode. These new api will allow to change the
>> GPU power profile based on a submitted job.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 14 ++------------
>>   1 file changed, 2 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> index 2d94f1b63bd6..70777fcfa626 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>> @@ -363,7 +363,6 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>>                  container_of(work, struct amdgpu_device, vcn.idle_work.work);
>>          unsigned int fences = 0, fence[AMDGPU_MAX_VCN_INSTANCES] = {0};
>>          unsigned int i, j;
>> -       int r = 0;
>>
>>          for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
>>                  if (adev->vcn.harvest_config & (1 << j))
>> @@ -392,10 +391,6 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>>          if (!fences && !atomic_read(&adev->vcn.total_submission_cnt)) {
>>                  amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
>>                         AMD_PG_STATE_GATE);
>> -               r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
>> -                               false);
>> -               if (r)
>> -                       dev_warn(adev->dev, "(%d) failed to disable video power profile mode\n", r);
>>          } else {
>>                  schedule_delayed_work(&adev->vcn.idle_work, VCN_IDLE_TIMEOUT);
>>          }
>> @@ -404,16 +399,11 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>>   void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>>   {
>>          struct amdgpu_device *adev = ring->adev;
>> -       int r = 0;
>>
>>          atomic_inc(&adev->vcn.total_submission_cnt);
>>
>> -       if (!cancel_delayed_work_sync(&adev->vcn.idle_work)) {
>> -               r = amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWER_PROFILE_VIDEO,
>> -                               true);
>> -               if (r)
>> -                       dev_warn(adev->dev, "(%d) failed to switch to video power profile mode\n", r);
>> -       }
>> +       if (!cancel_delayed_work_sync(&adev->vcn.idle_work))
>> +               amdgpu_gfx_off_ctrl(adev, false);
>>
>>          mutex_lock(&adev->vcn.vcn_pg_lock);
>>          amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
>> --
>> 2.34.1
>>
