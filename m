Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7387C4272C4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4CE6E117;
	Fri,  8 Oct 2021 21:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F276E117;
 Fri,  8 Oct 2021 21:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/tyEfK9d7Wb0enY/zkBG+qJf9EgD+S48nLRbKw0E95bJAW1Hk/bXOnsT+s95pkxZzcgl7vTQWqkIM0OId5Qz4X5YIYBRdU7BQkeanAm+ue0T46e/Ku93frUZrUVqOFRoEvSKbZ3ncN4aOXH3Zoi0L86+uC6aSn/hva9M+crsPCMRf2YLQ6ueGuaB8gdX2eWdqiOttZypTU+HJClnrvD6lTbr8kdcDWCS8z4WZQPABtU7ZVSfPnVubQxjYBxu43rA14qAbMry1Fp4pi1uvuuQZFiPY5iTdkZtVSWxQuYG8+wlv9+ZwcSYBdHq+SzDd3K8OucmyM9AXWF1nlEsk8PCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ct8g4v/CbaSRJ97S0Z2wDK0sLTaktBeMUD9At/bt7+w=;
 b=c43PWR+QTRJ9PIKfjnFFy5dNnZtcS3RmNjJ7v1oVx9nrhFP3WdGyb7zX+5g+eQeVaBIvjyw/L+QQZmxm0kaUATPMdg7GkpH+gcdWf8WjuETiiDapy9UuDlwr9QZNmHLGzaTRt9BZxUm13b3V4YCY8shytj0HMLZuvTPRWqflpcf6s6oIuOWzm2hhX3iLgZk3HzPecv3g1lJJp482YmNRlrqc22N8Aw9RAX5kb8ICznsQGvGi0ELqZ0nIzSaMgdgiHGI40xCgpK8DfZNqttIO0asCdWqPRmUvldW5SOjR0hc5OjVegva77hc3oMHWUC8fc2o58Nts/F8F9/EewdXLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ct8g4v/CbaSRJ97S0Z2wDK0sLTaktBeMUD9At/bt7+w=;
 b=K5BdfY2a1UwmZt+dDveBmEGsUEKBHMs2fGDLpIGrUQiWxGmyXtCRmPxhkRG+9AEpb9Tr8CvkIj6Cj81uxpHGvc/lC7bJQ6ZNhQBe756/W84AkhyxjE5n/HtD2N1PopIsG5DDPKABDU7jLXY5ilaR0otKwHG4k7Q+v9Li9H3mPvE=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by BY5PR12MB5510.namprd12.prod.outlook.com (2603:10b6:a03:1d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 21:03:13 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::49da:65ef:4d6d:62e5]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::49da:65ef:4d6d:62e5%9]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 21:03:13 +0000
Message-ID: <38c561f6-1bbf-a01b-bd28-2065a9889c50@amd.com>
Date: Fri, 8 Oct 2021 17:03:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v3] drm/dp: Add Additional DP2 Headers
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@intel.com, Nicholas.Kazlauskas@amd.com, wayne.lin@amd.com
References: <20210927192324.5428-1-Jerry.Zuo@amd.com>
 <b2ce7b34-23f1-75c8-182e-3e7fe9b845e1@amd.com>
 <20210930212113.rsy5lbg3mhejvsdo@outlook.office365.com>
 <06786045-115d-5b42-4ee1-33cd27d1b0c3@linux.intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <06786045-115d-5b42-4ee1-33cd27d1b0c3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::7) To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0104.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.17 via Frontend Transport; Fri, 8 Oct 2021 21:03:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8c24eeb-642e-43c8-1ec0-08d98a9f0a41
X-MS-TrafficTypeDiagnostic: BY5PR12MB5510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB55106DC4CE2AD6E6CCD9E3718CB29@BY5PR12MB5510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sc7fBZf7zQq9ZOtjGv0pPaU0EmpXgO7QQgdVSy+im+r0tPGcIv6/soEFkp2UvP/tQgTu3S2ljWYAdhiO0YhzdiQ3OgyuVCw+MmhOy0M0XsJ/aDlPF5N0ipvYDA1r/zPXzMdE/aYaQnhalrHspS/EC30yHuThcQRLA6iByAO7S7T0favIS+BEZ/K3Bf6/HZe5XFgghlJxEfvXsJDIT7/jcT0a/to/35ACA2XosAiY07DfZRgRzEdld38gBjvBlcyHyDAsQZ4UYnWumL+Hrz3uWYqVHMwss16Xmkjo2a3ukdAYO2O/kbwIrKgw94X4EWPSJa5/uTDMSzV5XzcE3H7vLrf4ZPVTFhaCNmTTylyLXixqImJFPyTnYIuDoLgbzd/nNv1Un8xPhuHg/9gD+Fbz62FYtU78lf5vM7PjUN7mu4CkPz90e7pRhUPCqasw6p8MWhKg/OuLEqvCk50A1gy2USEhSqJo4X9nTsCKoIpXvRWkYmdWAKjXR/K6LPxYHKeSBW5yAXMY42jc2qOT9hTA2MmEn2AMw7r+28SWuvR511rzcWSnrzA78E822M+tkdAgkqZPS3uuETQyjLCqiyu/aMOPajbT2926Tdn+PDrW+jRU5Q8N5fzdeyJVgkB+ZQTM/KP1He8JCPGB+aYG1pZuqTkoLYoQoprcpciXHx0sKIvQPF4L4uEWyyPaA4ol4+Z/fUAcsDgL/OQu43R2JLQnKDEKOH+dJGcYy6yfIEqe7qiyqeHRyEBIKUz0ee88JuTeTneB7uCSQGQEHtzFwAc6+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(186003)(26005)(36756003)(956004)(31696002)(8936002)(66946007)(66476007)(2616005)(38100700002)(86362001)(31686004)(6486002)(44832011)(8676002)(5660300002)(4326008)(2906002)(966005)(53546011)(83380400001)(316002)(16576012)(508600001)(6636002)(110136005)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2pMcWpucmRldTVEM0VaWlBiWllRSGRScURTYjdqR0luTVZVWnNFVXlTcTR1?=
 =?utf-8?B?Wm8zZkNjTDFBRFpxSGUyTkh1a2NoRTVaT3VmQ1M4YXk5cFlDZ1pwSzFuTTF6?=
 =?utf-8?B?SHpRQTNTdGN5RzgrbWI4TW40UXRKN1ptOUxvMURFTmVDeW91ODhuazJwZGxE?=
 =?utf-8?B?MHpOZDdVWDFqMXdHZDVNQTViYmdOSk1VYWZBY2pjeWhBLytuOFJFYlErS1Q2?=
 =?utf-8?B?dFhwM3paUDFTTFUxRmdqdHY0bi8zZnMwMUNjY3hhMGE4UEVsOThNUGtvbHo1?=
 =?utf-8?B?Wno3MEJsRm0waW9wWlI3a3NIbk1ZbXJ2RDRGVi9pVzUxS1JZOTdQRWRwYnV5?=
 =?utf-8?B?MXRpd0E1WFhSVHVva01kb2tsb251QmVDTS9uQm5QdldGUjhCQ0QrMVQ0ZDNS?=
 =?utf-8?B?Tm9FZmtpOWgrUXNxMlNpRHRRWHBacTU5ZGhrd0wzSm9jZFRqanE3YUQrZ0FL?=
 =?utf-8?B?eHdmaFcyQ3BzejJzOFlpSytFNmYvaVlwUGdDLzV0NXFGajF1ZnUxdFJ2QWNB?=
 =?utf-8?B?WUZqZWlBZ1dUcm1ITlcvd1lxYks1ZmFwOTdWLzJVa1dac3RneXlMZWl3Nk41?=
 =?utf-8?B?RXBLWkQ1QUF1YjMzUGNVTmRsWXhkSC9taDZ1UFRJZlQvUGxBdkNmMzl0S3pr?=
 =?utf-8?B?TmNGV0tXeDFtYktrSE1YYTVxaytUaTlJZTlSMXZCYjF5V2hPMElMRmJ4V2pO?=
 =?utf-8?B?bjRRWXhYT2QzOVN4V1VKdnVIeXRrYWhRNXQwVmpyME1KdDE4Z0NycVR0cEJR?=
 =?utf-8?B?ekhpL1ZLemY0a1dnT3NYcUZjelF3T2hCSjkrL1lMYVMyNHhYT2RydDdJTjJa?=
 =?utf-8?B?U0FLSGpjWEhpV09HVm5LSjNuT1FEbkRWaUVnY0tjSkhsWWZ5R1pkZjU4ZU9Y?=
 =?utf-8?B?WjU1UTVtbEhPbUJmYnRmdlM2M1VacUNSQVhMWWYvSmp0bE5obzRoM3FPeHVQ?=
 =?utf-8?B?YVN0dzFtT0xWZ09LM1BwLzBKMWFtVkhNMFgvRGh2MmhYWWhjaTVMZTVsTW84?=
 =?utf-8?B?b3BFZS9DNTVtR3IwOTZqYmNyTGpLYTVuUmtmdkpDOGNRSkx5RitRTFY0Z3VC?=
 =?utf-8?B?V2FZdUhFSDROME9tMjc4d1p4a2RZZ3ZEQTFHWXhNa2JMSk1rQTdkMmpBeEhs?=
 =?utf-8?B?bXVXWmhuUEY2YjVSZ1NlZ2lINTFSSFpxZlBuVEZsKzlSS2NXR2tvUFp2Y1hk?=
 =?utf-8?B?NjlLMld6NmxBZHFUQlZUN1dNeVMwNUpCQjdPQUMyeC9aZU1rY3NERXFzNG9n?=
 =?utf-8?B?a0N4ZlNSMWdWdWFLZ0VYMFNXSm1PVlZnZzdMbjBsRnUweUFJd1JGNXhndXR1?=
 =?utf-8?B?eStJdDVpc0dlTUZMblUyOWl1cHdaMExuS01OU1NNSU9XVzVpQ0Q2WlNOMmhz?=
 =?utf-8?B?L1Z4MVZDRk12VFFyNHRYZVpMSzlXR21VdkpaMkRRcmE1VGtsU2hDS0pNd2M1?=
 =?utf-8?B?K1hkVGFSUkNIb2g5VkVJNVJQb2RzSEFZcTdxalRVem85bGRYT1JoVFNkWVpi?=
 =?utf-8?B?RlE4emdEQTRpbS95QmRVZ3NuWGEyTEI2OXRXcFFWL0JlUTVUVmhJR0l6V2RU?=
 =?utf-8?B?RDFuZCtmMVBHL2c0Wkh3RG5Na3g5R1VvVThUVUdYK25JZDFjeXZ0bzl2ZVlC?=
 =?utf-8?B?NW1hUWhxdmhVaUF6QWlWTE1pZFUvbkE1K0xPN3l2L3VtbFozWWxDRnJsVEpv?=
 =?utf-8?B?SUdVYjBzZXo0QldRNDk1YUtESTBZYVozRXVpdUpUN1lKcTZwV2x0SktDQm94?=
 =?utf-8?Q?JZBfxX//FLTBkRz717u4xvzhgpo8nViU2gtxssO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c24eeb-642e-43c8-1ec0-08d98a9f0a41
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 21:03:13.0808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLTkVfoFv+YGwEo4UNfOqsn3Pl9DvVgr7ymSB7JaF/YuM/wvOxSCEVunLgNmjcEpoYCSLF6xgc+t8m8QKhC+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5510
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

On 2021-10-08 04:36, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> Is it my checkout only or this causes a lot of build warnings for everyone?
> 
> ./include/drm/drm_dp_helper.h:1120: warning: "DP_TEST_264BIT_CUSTOM_PATTERN_7_0" redefined
>  1120 | #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0  0x2230
>       |
> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:35,
>                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
>                  from ./drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
>                  from drivers/gpu/drm/amd/amdgpu/amdgpu.h:66,
>                  from drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:40:
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dp_types.h:871: note: this is the location of the previous definition
> 
> Etc..
> 

Fixed by https://patchwork.freedesktop.org/patch/456190/?series=95166&rev=2 but looks like it's not in drm-misc-next.

Siqueira, do you have bandwidth to pull that patch into drm-misc-next?

Harry

> Regards,
> 
> Tvrtko
> 
> 
> On 30/09/2021 22:21, Rodrigo Siqueira wrote:
>> Applied to drm-misc-next.
>>
>> Thanks
>>
>> On 09/28, Harry Wentland wrote:
>>> On 2021-09-27 15:23, Fangzhi Zuo wrote:
>>>> Include FEC, DSC, Link Training related headers.
>>>>
>>>> Change since v2
>>>> - Align with the spec for DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT
>>>>
>>>> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
>>>
>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>>
>>> Harry
>>>
>>>> ---
>>>> This patch is based on top of the other DP2.0 work in
>>>> "drm/dp: add LTTPR DP 2.0 DPCD addresses"
>>>> ---
>>>>   include/drm/drm_dp_helper.h | 20 ++++++++++++++++++++
>>>>   1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>>>> index 1d5b3dbb6e56..a1df35aa6e68 100644
>>>> --- a/include/drm/drm_dp_helper.h
>>>> +++ b/include/drm/drm_dp_helper.h
>>>> @@ -453,6 +453,7 @@ struct drm_panel;
>>>>   # define DP_FEC_UNCORR_BLK_ERROR_COUNT_CAP  (1 << 1)
>>>>   # define DP_FEC_CORR_BLK_ERROR_COUNT_CAP    (1 << 2)
>>>>   # define DP_FEC_BIT_ERROR_COUNT_CAP        (1 << 3)
>>>> +#define DP_FEC_CAPABILITY_1            0x091   /* 2.0 */
>>>>     /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
>>>>   #define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC    /* 0x9E - 0x92 */
>>>> @@ -537,6 +538,9 @@ struct drm_panel;
>>>>   #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_1  0x0a1
>>>>   #define DP_DSC_BRANCH_MAX_LINE_WIDTH        0x0a2
>>>>   +/* DFP Capability Extension */
>>>> +#define DP_DFP_CAPABILITY_EXTENSION_SUPPORT    0x0a3    /* 2.0 */
>>>> +
>>>>   /* Link Configuration */
>>>>   #define    DP_LINK_BW_SET                    0x100
>>>>   # define DP_LINK_RATE_TABLE            0x00    /* eDP 1.4 */
>>>> @@ -688,6 +692,7 @@ struct drm_panel;
>>>>     #define DP_DSC_ENABLE                       0x160   /* DP 1.4 */
>>>>   # define DP_DECOMPRESSION_EN                (1 << 0)
>>>> +#define DP_DSC_CONFIGURATION                0x161    /* DP 2.0 */
>>>>     #define DP_PSR_EN_CFG                0x170   /* XXX 1.2? */
>>>>   # define DP_PSR_ENABLE                BIT(0)
>>>> @@ -743,6 +748,7 @@ struct drm_panel;
>>>>   # define DP_RECEIVE_PORT_0_STATUS        (1 << 0)
>>>>   # define DP_RECEIVE_PORT_1_STATUS        (1 << 1)
>>>>   # define DP_STREAM_REGENERATION_STATUS      (1 << 2) /* 2.0 */
>>>> +# define DP_INTRA_HOP_AUX_REPLY_INDICATION    (1 << 3) /* 2.0 */
>>>>     #define DP_ADJUST_REQUEST_LANE0_1        0x206
>>>>   #define DP_ADJUST_REQUEST_LANE2_3        0x207
>>>> @@ -865,6 +871,8 @@ struct drm_panel;
>>>>   # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
>>>>   # define DP_PHY_TEST_PATTERN_CP2520         0x5
>>>>   +#define DP_PHY_SQUARE_PATTERN                0x249
>>>> +
>>>>   #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
>>>>   #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
>>>>   #define    DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
>>>> @@ -1109,6 +1117,18 @@ struct drm_panel;
>>>>   #define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
>>>>   # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
>>>>   +#define DP_TEST_264BIT_CUSTOM_PATTERN_7_0        0x2230
>>>> +#define DP_TEST_264BIT_CUSTOM_PATTERN_263_256    0x2250
>>>> +
>>>> +/* DSC Extended Capability Branch Total DSC Resources */
>>>> +#define DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT        0x2260    /* 2.0 */
>>>> +# define DP_DSC_DECODER_COUNT_MASK            (0b111 << 5)
>>>> +# define DP_DSC_DECODER_COUNT_SHIFT            5
>>>> +#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0    0x2270    /* 2.0 */
>>>> +# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK    (1 << 0)
>>>> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK    (0b111 << 1)
>>>> +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT    1
>>>> +
>>>>   /* Protocol Converter Extension */
>>>>   /* HDMI CEC tunneling over AUX DP 1.3 section 5.3.3.3.1 DPCD 1.4+ */
>>>>   #define DP_CEC_TUNNELING_CAPABILITY            0x3000
>>>>
>>>
>>

