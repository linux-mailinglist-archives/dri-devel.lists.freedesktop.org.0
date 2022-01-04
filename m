Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD6484A50
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 23:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EEC10E558;
	Tue,  4 Jan 2022 22:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA8310E396;
 Tue,  4 Jan 2022 22:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtvcdDlocHQx/KHaRMgScfw58yo/CDw6ZeXCyoGfaETGH0nGGL5aEZVZUmFGjCmEkSuSQnCtdELvMQ0OQovyen/6QKv+QM0LCHKX8H7ko9eO90/Juq+kqDNcggs49TNeR9rqej23R9Y1ZLcIOi0Zk0Ebz1Jv+hPwMsx2ZAXI7IYQsWLRWQ7/X6/gesgvg2n5TlOqy9vsJu6rKXupj0ru/VPsIgpvwohGUCIRqBmoacrxI/yhTQY+HbqBwS8FV5WHoN103Le0B8cs2eqt8n4sdFhmhVU2jCH77CmKVUakCR46qU68ikq+S/OvOQCKu6Z45LMnX8Xi8XIwOK00AW/VYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9gJmS9CJL3zzv2mkiA2x2QQdPetyJAhD3vmj5Ywf5s=;
 b=Fd4ctDFTguRvAulWpqYNa9EgtcRxHSjkWYeXonAq4X7xq1lR4noYqRlcya8+ONhofcC+J4ZN3iWDW5I0VCBDB+GemPgwvAJ7kvOBPIP3WDpO5VgoOqX+481rwoMa8ucXGAeVfKHF38/spOm/Cgupc1RmMtYzmWvtqWZsoAXiB1N2WjADWt66neJ+7xDW3ZRR4tJqdJJmuU1t/nZIOEUbSDNZrfBNATgTQ9caWi01LZ03+7sEYqHa/p9ZrIwoYSKX4T+qpaiqkNn5XdzcRUDy0po2Pch5oPpwkb3BV3cYHtLDPVbJt9C7lTKvHZ5+FwNPAHHJjWyxb039/UpQEQz/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9gJmS9CJL3zzv2mkiA2x2QQdPetyJAhD3vmj5Ywf5s=;
 b=218o+7kLI+jrxZ2HBOkMVbBWRC/TptoeMVW+03Kj4cSbeX+3CDTQhFLu6vJuQehOfRjYr5CxGGG/bHtvs8RFA2Jbu1EAxGqVfABq95ItubkU2jNYnLxpK4q7EWrWg7UdOjMDhjJm+FrDSOR0KRpwAANEmUSditi9KZYhVrB+QSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 22:01:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 22:01:46 +0000
Message-ID: <948c12cb-4e6c-0774-4860-57ec05dca72b@amd.com>
Date: Tue, 4 Jan 2022 17:01:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [i-g-t 00/14] Add IGT support for plane color management
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211118115002.14003184@eldfell>
 <26abc3eb-c50e-8f89-ccc9-ad96f1177987@amd.com>
 <20211129112033.770d1c2a@eldfell>
 <b961943f-3e92-cb93-7b2c-a1ddabb971ed@amd.com>
 <DM8PR11MB571951C2110DA00DD821CC588D499@DM8PR11MB5719.namprd11.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <DM8PR11MB571951C2110DA00DD821CC588D499@DM8PR11MB5719.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::37) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fea5a29-9231-4779-0d74-08d9cfcdcce4
X-MS-TrafficTypeDiagnostic: CO6PR12MB5473:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB547389410EFD40B172FC29408C4A9@CO6PR12MB5473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQlV1v+uJ/xsZ5npALrW1A0eWPXIrxKCikZLTHj2AkzkRuHSvzleLreFIJWyk3jxLFeqAocSDxgATr2FUdAk8XtVg7eCTWYSU9Qgdabfb7wMDAIQw7MvRYI64vKn8ngeK/PmtSjI0st0bNFsyr9Toq1UKrMyZKIktmm2jv83wKfj6i8wHcBGVUwcSVQQBQVEpM35rd8r9XuZ4T5lz3Mw3+qv+AyiKM8SfExpyyBrn6GAUAk5AprX6eQMiwS4RF27TOpYOCesEKuwWKaFTAmsQpKlHNNmBbIcRgO5OFfo1UoSVcAalEAHfan2JsDzICd1TriGEJ7FRbQ/2ehD+dP+6AZGuXctU5qkOMEaqpvYQJRmigQ6WCrkLSEUSBG7cr2Dp9ZTcPB1f0TK8QtitTv0uE6lsRJcmMw8SOQ0alad+VYZZP2p/plNLnvRdNHgHbe0OU9LWzdEmixhLEWXk1dQHO8NkxkUNyL+gINI1x7RkzeGomST+m/36EHI+JGLAEpPuX2sj6XXeD7Tw0MGRrvxLqXOw/zNA8P9mXVeu5Ak+lxrt0b6fAb0tEQZ1Ea0MQoRxw1qIqNto5H3hZZmvxgfjt+vYeB2djiAfYnZdr21O/yaurCEjBkBolspD5ibYXLA0MA/RPW54MbbLO2HmnbEQvZRynvkWgAqIsLdhSEvzpQYmf05ngDuElsPcVhJDPLXybKlfL6Jga7AS/ddbl457ApNNTE22umapC2grrDrwyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(316002)(6486002)(31696002)(6506007)(86362001)(4326008)(508600001)(186003)(54906003)(110136005)(36756003)(45080400002)(31686004)(966005)(66556008)(44832011)(66476007)(6512007)(66946007)(6666004)(83380400001)(2906002)(4001150100001)(5660300002)(26005)(38100700002)(53546011)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TElpSVoxZnBINW1CNU9ZMEhkUlJsQ2RyYmJRdjJGVzlaUWZPY3Y2V1Yvb3NU?=
 =?utf-8?B?U010U3BtWjFiR2dKc3JLTVVXUjB6KzhTS0c5b0pOall4bkd2RmxHWUI5SGpy?=
 =?utf-8?B?aWl5OFY0dkxDZ0R0ZWViSmdhRWZvMklPcytRTkcrSFQrUGllSVlVWit3eDJQ?=
 =?utf-8?B?QnJ6NW9lTlFLRTZEWXY2S0djQTZIamEzdS9UakxiZC9qc29VUjRYUlkycGsr?=
 =?utf-8?B?Y0l1MGR5eHFtUTVMY3FUaDlqQnJQdHd5cWhWWE51ckl4VkQ4VGczQWt0bWdF?=
 =?utf-8?B?RHVWWFo4UmZLV2cwRDZocERuaUNYMHhrdUtSaU5wZGw0dXlvcGQxTmg2N2FO?=
 =?utf-8?B?M1ljNmFVWDZuL0F6dFFCaC82VCtVRjljMzROTjFVRmRGOFNzYTFpR1ZaY3Zh?=
 =?utf-8?B?Tk1FdzJpU3VUc3YrZ1BxV1dOdnd6T080U2s0SHhxVzdIUmt5NGV2bDRab2Za?=
 =?utf-8?B?TllneklkeHBSdnVTQnNncHpMK3JrUDIxMUREajZ1MDl1Z3RJcVFIYUZGdkxQ?=
 =?utf-8?B?UWlWUkw4RVJwYXF0STg5TFRIS3pyRm5BcGVhN2FoL0kzY2lmMS9pVVVQa05x?=
 =?utf-8?B?RTJEYlJ4QWpaOXpUL2Y3UGpuYnRXOEdDRlRLZW1OcFQ3K2xGN1owcVBJaVBM?=
 =?utf-8?B?QmZvQzRnbzZJVnR1RmJoZDFDWFEwME0vL3phcXdBdU5rZ3ZmUEk3eURReVFZ?=
 =?utf-8?B?d1NZdFVzUjgxSWVLWVhnTmNvSmM5alZmWVVGUys4eDV0cmM4TEpVZnU1bCs4?=
 =?utf-8?B?VCtjVHBDMmh5TDlkRjZmQmZMYW9ObGtKdnBibXlEVnBaaGVWek52Z0FVemxG?=
 =?utf-8?B?d1BBKy80SCtuUy9NOEFWLzNhbmFNS2JuNERsVU5aNEFvZEs3Q2xHeHkyclB6?=
 =?utf-8?B?Z2Nvb2VObElIaTFiWWhSMUlKdWhoTytzZFFJczlyaDJ3TUdFaHIwcnI0V05L?=
 =?utf-8?B?cTFWUm1DSGFLWVU1QUZZQWdwS1F2eHp5Ry9yRUIxYnhseWJzNThaUDdZTXUw?=
 =?utf-8?B?MUpJd1JBemM1aFZFNU5oWExZWk94OUs0WUpFVEx2eHdmaWllZ2tnQ3JzNU9C?=
 =?utf-8?B?SzNIeXFWSDE0WFhUaVNWWDNFMGNNemIyVTZac0RqQ244UHo0ZDJuWUhtQmhG?=
 =?utf-8?B?RWFTYWhISXpNRXhsQkdtaGxwNWxDQ2tKUDZENjNGM0swTjIzbzZ2amFCajRM?=
 =?utf-8?B?aXJNbG9IVlU3a2FPcUhGSXg3K0k1ZmdPN0NydlNDVGloclFISmhqK2taVWNp?=
 =?utf-8?B?dUxkUm8wUkRkTWdJZmxIc0VjQlc2TmRWbHVZMk11YWRqV1hDNFVGYjJpb1hS?=
 =?utf-8?B?ank3bFdIZGg1L3lxMVFIRnFVVzZ3NlNGQlJtWkpkQ3ZPajN4cldaYWJoa2FF?=
 =?utf-8?B?aUxYbFlUOTMvaXc5SndzZlZDNlNYWHR6L3pGNW1XZ3lBaExOckkrMEhPd1E5?=
 =?utf-8?B?MFhXVHd2cnByY3JTS2ZSdSs3ZEkvemFEc0p2Q2VRTjRzbzdjemJrWm0wdlgv?=
 =?utf-8?B?UGFpSnl6NEJmbTh6TFpycmIzSE12ZnRMWW5xbEc3WXY3a0NxL05UMjVhdkhS?=
 =?utf-8?B?QVRoR3QwYnVlNXlJNzBCZGdkS2VJU25kTk1naXZ1S2dxNFVrSTIrd2tWWHhy?=
 =?utf-8?B?R3hYOWs5ZmFDNDJMMklUQjZNSDBSTURBUUNrUnEydnNrYVdwdmZOK2U0b21o?=
 =?utf-8?B?cmE5eEx2dkRkdS90eHlxTHQzVzNSdmw3enJ2cmZNN3kyaXpoYlJwTy93VUoz?=
 =?utf-8?B?RnZDZGs5SDNXZDNWc2ZHODVzU2pDK3JVTHRuenVJc1NKTTZNQURONkNOS2kx?=
 =?utf-8?B?RG1pWmhsb3JGQlhNVGZOeWd0a3p0ZTNTSlBSRktydVFZKzBPYUo2TWd3RkFn?=
 =?utf-8?B?b2toNExxaFhMVlZ0Sm9WcjB0Wm9XSFJvdzgyRjlzU2hJcU5DVzZCVW10NHNE?=
 =?utf-8?B?a3lxdFRKZ3RnWlZWdjBCL2dEN05QVE9CTG5LdUxHYVBrOG05RFEzZWpGZTFR?=
 =?utf-8?B?OXRLRk5iKzY0Z2R4Qyt6RG9sZ2N1N2hBN3hSOGg2WVUzRUhwWWJ5MXhPN0xm?=
 =?utf-8?B?aFNWc3RrampkWS9LMGVGMnJtY2NnZzRFaHk1dHpEbjhyalJ6OGJqVGJHeTM4?=
 =?utf-8?B?WjUwSW1veW44V3pRUVNHbjN4VFhCTkZha3ZXeUJWdW5ucmlaMU9CSUd5ZDVr?=
 =?utf-8?Q?bHFExBKosY98NsXFkD1Tvh8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fea5a29-9231-4779-0d74-08d9cfcdcce4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 22:01:46.6430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BophTZWOWrbVUK67mbVXtzTw+2fiu5mKn6EI9+wIw/1Q5BbgEbA1/g0VaWo0eTIpKcBpIituopKaWIzAjWH4iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5473
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Kumar,
 Mukunda Pramodh" <mukunda.pramodh.kumar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-01-02 23:11, Modem, Bhanuprakash wrote:
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: Monday, November 29, 2021 8:50 PM
>> To: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org; Modem, Bhanuprakash
>> <bhanuprakash.modem@intel.com>; igt-dev@lists.freedesktop.org; Kumar,
>> Mukunda Pramodh <mukunda.pramodh.kumar@intel.com>; Juha-Pekka Heikkila
>> <juhapekka.heikkila@gmail.com>; Shankar, Uma <uma.shankar@intel.com>
>> Subject: Re: [i-g-t 00/14] Add IGT support for plane color management
>>
>> On 2021-11-29 04:20, Pekka Paalanen wrote:
>>> On Fri, 26 Nov 2021 11:54:55 -0500
>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>
>>>> On 2021-11-18 04:50, Pekka Paalanen wrote:
>>>>> On Mon, 15 Nov 2021 15:17:45 +0530
>>>>> Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
>>>>>
>>>>>> From the Plane Color Management feature design, userspace can
>>>>>> take the smart blending decisions based on hardware supported
>>>>>> plane color features to obtain an accurate color profile.
>>>>>>
>>>>>> These IGT patches extend the existing pipe color management
>>>>>> tests to the plane level.
>>>>>>
>>>>>> Kernel implementation:
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90825%2F&amp;data=04%7C01%7Charry.wentland%40amd.com%7C6d85b55209204b9b1e6108d9ce6f30f6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637767799222764784%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=j%2BkGUD45bTIke%2FIeCO7GGAM1n%2FCrF2oy6CKfLc6jhzk%3D&amp;reserved=0
>>>
>>> ...
>>>
>>>>> I also found some things that looked hardware-specific in this code
>>>>> that to my understanding is supposed to be generic, and some concerns
>>>>> about UAPI as well.
>>>>>
>>>>
>>>> I left some comments on intellisms in these patches.
>>>>
>>>> Do you have any specifics about your concerns about UAPI?
>>>
>>> Yeah, the comments I left in the patches:
>>>
>>> patch 3:
>>>
>>>> Having to explicitly special-case index zero feels odd to me. Why does
>>>> it need explicit special-casing?
>>>>
>>>> To me it's a hint that the definitions of .start and .end are somehow
>>>> inconsistent.
>>>
>>> patch 4 and 8:
>>>
>>>>> +static bool is_hdr_plane(const igt_plane_t *plane)
>>>>> +{
>>>>> +	return plane->index >= 0 && plane->index < SDR_PLANE_BASE;
>>>>
>>>> How can this be right for all KMS drivers?
>>>>
>>>> What is a HDR plane?
>>>
>>> patch 12:
>>>
>>>>> +struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
>>>>> +						const gamma_lut_t *gamma,
>>>>> +						uint32_t color_depth,
>>>>> +						int off)
>>>>> +{
>>>>> +	struct drm_color_lut *lut;
>>>>> +	int i, lut_size = gamma->size;
>>>>> +	/* This is the maximum value due to 16 bit precision in hardware. */
>>>>
>>>> In whose hardware?
>>>>
>>>> Are igt tests not supposed to be generic for everything that exposes
>>>> the particular KMS properties?
>>>>
>>>> This also hints that the UAPI design is lacking, because userspace
>>>> needs to know hardware specific things out of thin air. Display servers
>>>> are not going to have hardware-specific code. They specialise based on
>>>> the existence of KMS properties instead.
>>>
>>> ...
>>>
>>>>> +void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type
>> type)
>>>>> +{
>>>>> +	igt_display_t *display = &data->display;
>>>>> +	gamma_lut_t *gamma_log;
>>>>> +	drmModePropertyPtr gamma_mode = NULL;
>>>>> +	segment_data_t *segment_info = NULL;
>>>>> +	struct drm_color_lut *lut = NULL;
>>>>> +	int lut_size = 0;
>>>>> +
>>>>> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 1);
>>>>
>>>> Is this how we are going to do cross-software DRM-master hand-over or
>>>> switching compatibility in general?
>>>>
>>>> Add a new client cap for every new KMS property, and if the KMS client
>>>> does not set the property, the kernel will magically reset it to ensure
>>>> the client's expectations are met? Is that how it works?
>>>>
>>>> Or why does this exist?
>>>
>>> ...
>>>
>>>>> +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 0);
>>>>
>>>> I've never seen this done before. I did not know client caps could be
>>>> reset.
>>>
>>>
>>> So, patch 12 has the biggest UAPI questions, and patch 3 may need a
>>> UAPI change as well. The comments in patches 4 and 8 could be addressed
>>> with just removing that code since the concept of HDR/SDR planes does
>>> not exist in UAPI. Or, if that concept is needed then it's another UAPI
>>> problem.
>>>
>>
>> Thanks for reiterating your points. I missed your earlier replies and
>> found them in my IGT folder just now.
>>
>> Looks like we're on the same page.
> 
> Thanks Pekka & Harry for the review. Apologies for late response. I thought
> that everyone is in holidays 😊. Now I am re-igniting this discussion.
> 

No worries.

> I have gone through all review comments and it's make sense to remove hardware
> specific stuff from the helper functions.
> 
> Patch 3:
> Intel hardware is expecting first LUT value as 0, still we can remove this logic
> from helper & handle in the subtest.
> 
> Patch 4 & 8:
> In this context, for you HDR & SDR plane stuff is just a matter of plane index.
> We are expecting to run tests on one HDR plane (index 0-3) & one SDR plane
> (index 3-6). I think we can update the logic to run tests on first & last plane.
> If you want to run on tests on all planes we need to pass an extra argument through
> command line. Please refer tests/kms_flip.c for similar implementation.
> 

I think that's fine for AMD HW. For us all planes are the same.

Harry

> Patch 12:
> It seems there is some confusion with the IGT comments & variable names, I'll
> refactor the logic & upload a new rev.
> 
> - Bhanu
> 
>>
>> Harry
>>
>>>
>>> Thanks,
>>> pq
>>>
> 
