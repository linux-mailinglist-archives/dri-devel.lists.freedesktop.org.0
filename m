Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4F4F1903
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 17:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798E610E701;
	Mon,  4 Apr 2022 15:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C73510E190;
 Mon,  4 Apr 2022 15:57:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzFCI3+cTWzOWIwo4fUtatiW9JZAZkK2NAV7NBbb/NE+CcZ8su9B1/Mc9GfT2QjkiyTxBi/yfzEVw6AQzWJR3yWD7qUi0Gm2zTFYkXQ7kngdTyo4PLb/FQGxEC2J4wfLBLrkO0JqzOxU9SQe2m2yqT3rxS9/uPvNcryozW9dTDDnLawLxx60JazoQXcvs2/o3wVRYDSnY+m7SVHqoAEUegrJ1dMs3YOzl5049NgnVHTWtJvUd60bSbUL1SVMBBSH/InxFVjGz+mtAhIOqMQrCQITlmd4L1XPjrx4MHIEIy4QT6Jv8nXcuS9mtU2GOxN0hSoJrZ5PXAh386B5elM3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzEKGgFwQkH3p8KhnpowKfvXgVPEWmhU4Fc3jAzmr5c=;
 b=a1JGtHZ44A7luqG8PdBPFUVdpdu7NCixy9OCtPZKUq6erSSQvjn9abiLdWx5xN+2mCgzqK2zpUljrBkcPBBw3F/DuEMs2Dv+IgwcbJAC0K8v12pZxTp22GH64TGVDFdWdZG0BpkY4S7ygab8KDJlPYl/npTs6IZZPlkfBF6TwUIEc1otj3mlQradjYK+gGq9O2H+biAhFJii+ZtUfiFuEwSVX7A32vr8NdaZ45r+STDIYHBln/kKwNA8mawbetyCbOHBdOCAN8x39xp0kT0rozvv96RsE2QOOPLxkMETWxBMi9j9qvNsU+uCZzRy0uB3mxGpHtX2OLGXyB7vA3C/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzEKGgFwQkH3p8KhnpowKfvXgVPEWmhU4Fc3jAzmr5c=;
 b=iebpFNMTOH1PUNK54hOXHR8YQ0hOro1hHGwerxHO8Q2aMb33OTIbkyGFz3yD3Nd+2V/An/1yRYImuuuFXG4LGZ1Jp5TbZB1FWAuTMvIfFRgWtE10Afwc/GYz8XM/3+vy00WUJmTbRC6CcKf9f/vqgcGcJJxh83XEZ87mAlL4gRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN1PR12MB2397.namprd12.prod.outlook.com (2603:10b6:802:27::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 15:57:12 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%5]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 15:57:12 +0000
Message-ID: <e0397927-06fc-933e-f73a-794e0629e0fd@amd.com>
Date: Mon, 4 Apr 2022 11:57:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amd/display: cleanup extern usage in function
 definition
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, wenjing.liu@amd.com, waynelin@amd.com,
 Anson.Jacob@amd.com, Yu-ting.Shen@amd.com, keescook@chromium.org,
 nicholas.kazlauskas@amd.com
References: <20220403142137.2234322-1-trix@redhat.com>
 <513a5993-2cc5-54fa-2d6c-f4162d76ab0e@amd.com>
 <462e2f2a-0cc8-2e2e-93b6-504cc12aa768@redhat.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <462e2f2a-0cc8-2e2e-93b6-504cc12aa768@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::21) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9952ec56-6f73-4060-590d-08da1653c845
X-MS-TrafficTypeDiagnostic: SN1PR12MB2397:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2397611A7F2419ECE37CF45D8CE59@SN1PR12MB2397.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P93vKLH5U69dnelVAHNb+0ugOoo41xKsc0rZRILdayntspFoBLgJrjKgEOGQ6cCbcpVzwokDDpQs1BEzhZDSuc2p+pfM0hE+XgmiVvayEUMETy37fcdhNUBTKY3x6Os8NA9KA49C+7U50Ru//dL7/eBSBB6ABSZ9WwhTQcUhRvqBkDn/4EEYMgrAu7Et/8x7mGkOK2FlCp6msj63PAFnbR1oC/2+vcuVlkbORevnfy4XdMV5CSaZCzQReNXjJtNufdvwwFf1MlzB6wOCeIQl3hgRFolWJNSLWEnUUgMTEDt3ghftLCcjO0+4PpMCn+/+4gpLRu10P1mb8BUS3nxwKttAMS0UkX2Fj4c0ubgiKmVcfLzL/z9LL28lU1XEIyTP5CFjq+m/w4r7od6Cuw8coZpqwAyRngcnEbZ3vE9ic8kSq/crfIvW5HTTGkiDZM8QKcgWwgl2C5skO9LheS84d3+FuSQq7EN4/mGNvktF6lejTYaWHwxMn9QRr9IyI4YLBVESgUNEaPK2QssJ4gVeKdiZiUdltvs1szr/5mk7M1aNsfi+qG6mP0USjPuHUo+w9Wha9FNev9LGR+KB035MPxPGjwg1F/LB6QB9pNM7HCafROc7efH5WT8eLd0xkz03IIeKikqAlhwGLxxJwiwDgiX+tRXaJEECVAHG8wwmeE1fsrS+lMIsf89h4CJhoz38NigCf1YsPK513JC6MspCb8XvzUsB+E04rozH6eSE2Ib4KsFVUKsZJ8rhBRQSBKZE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(31686004)(31696002)(2616005)(38100700002)(921005)(83380400001)(36756003)(2906002)(6512007)(6506007)(26005)(53546011)(86362001)(966005)(508600001)(6636002)(5660300002)(6486002)(44832011)(8676002)(4326008)(66556008)(316002)(66946007)(66476007)(6666004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWFoVjkvS3Z5QnZwY2Rwei8zUm5lZEFJYmtEZlVvNmFnaFJYT3FjM0dYUUxB?=
 =?utf-8?B?K2hWa1pNUmMwRU5PWTFTOXQ3cGE4R1VEbitWYXRwMVFZb3NpODNtQ25OTjY3?=
 =?utf-8?B?WXJRQWdYOEtHSkl0ek9weVZFQTAzMkZDVER5RkRxa0J6bDlWbnNqZkEra3Zy?=
 =?utf-8?B?R3VWbHd2Z1NySmZGSVB2Q1h3d3hBbmRwUHFMcW5TMW5UTFV4aUdqVG5yaWdr?=
 =?utf-8?B?SU80U3lMNTFPZUJ1eDJXNVBtS29nKzhybGJUME5RSHFiYzloZHVESXRkdm5R?=
 =?utf-8?B?c0NYanNGQWkzMDlHTUNTTktOV1kvZ0ZHcTdpQVpSYnhqT0NFeFovU2hocjQy?=
 =?utf-8?B?MU92OGFlVmpyWHdIYXllUVhUUVhYUDBWSHNkckhHa1VmSTNkNmI1RUI2RGZU?=
 =?utf-8?B?MnR3KytpbnJBMERJREI2d3FYM3dUMzNta3hlS0wwVENXaWs2Y1V6N3BsemNn?=
 =?utf-8?B?K2tCeHJBUUR4bFovWDVJelhIcGZWSTRnQWhPam56c2lPR1I2L0tuTWEzZno5?=
 =?utf-8?B?ZUxJdGhkZFFPNTh5NjFhT3RJM3liaFIxYVJVbTlrVCt6YkorYUloUFB5eXlK?=
 =?utf-8?B?U21sdzJXWXp2eXRHZWQ1aEdwVlluR2o0ekZVTVd1TWFBdDF3VjJwUFA4bjIv?=
 =?utf-8?B?d0xIZzA3R1M4ZlhLTE1FNk9yTlM1UEdIVFhPTnE0WSsvS1ByQ2U2SHNXRGZp?=
 =?utf-8?B?TVRGWU1aeWRuWll2S2dWaWsrOCtYZnRlTnAxNkFkT1pyTlhhaUVnaDNyQjVN?=
 =?utf-8?B?MkxMazVJZ2VTbWxYbVhyaTdoaGNLVkJxQTFCcVdHUGxzaDhmU1hQemJGYmJ0?=
 =?utf-8?B?MXA3OTRLQ1JsUEZVWGhSMXdMWlFmTzcxWmgrZVg2dVJaVWlhTHJGZ0tNdHNQ?=
 =?utf-8?B?VEpxZlZ5UDFMK0dvYWlmT1liQ3hXSFh3MG41WkVPbGJoMm1GMm5mNnRXQndr?=
 =?utf-8?B?YkVxdVVQMXhuanVNa2tndi9VZjRnS0dsSUd2QkxpNkxHVGc5UzgrdmRqb3l6?=
 =?utf-8?B?dktyRmkxS2pGZUFBTmwyM0QzYUFUdE9KNWZHV2JabWU2cTVxT01ZYW8wNThx?=
 =?utf-8?B?L3MxOEU5c3cvVFErazA2WmdJSUM4UkJhR0JteXhTOTF1VS84aE4zVkZEU0VT?=
 =?utf-8?B?Y1owelRyWVJ4c0s2RUFERmhwZ01hSW9zbjF0SkNMQ29ObUE1UzZHYjlSalZJ?=
 =?utf-8?B?VlVRaUwzb0dkMndtT1RUeDYrbnpPcEVOcWxBbmdiMmJURWh5Vlp0cDBWU05O?=
 =?utf-8?B?NWZPV2tXbHphTWlDMDFpOEc5ZFFLY1JaMit6aDhXZldIMXlsZ3VBaFVwRGFV?=
 =?utf-8?B?VDVXdk0zTXVMTGRIVXo4cWoyUGRwYTlDamNDYTJZWTA1bmMzTCtocHMzVld5?=
 =?utf-8?B?ZVVtUVlIRnRnck9SRVpUanQxT1Q0WDl1U3hvQSs0cFFBWVVaODBEQWttdlZS?=
 =?utf-8?B?WmhLdDQ1ODVXOHR5Y1R0Rys4eHNPRzlJaTQ5M1FoQkE1TEh1a2VnbDZXdk8v?=
 =?utf-8?B?TDMvWlg0L0ZvbmRDN3MxQWZhTDY5QmhMTU1UUE9WRW1Ebk1XN1lrM0x0bDIw?=
 =?utf-8?B?ZElpMkZiZ09Uc1NKMnAvdVpEelVJL1lTT1gzT0VOUDR3dWZjZmYzZzM2azAy?=
 =?utf-8?B?ZjNTeTJjM21TV1RzbWtaOUVmYyt1ampIZDdKTTJpU0dMZHF6ZWd5eFh6dkxT?=
 =?utf-8?B?RkhZWjZRbUF6SFl5c1VMVUpScm1KalZOUDJMUmt5U3NTdHQ5M2ZobFVzeS9m?=
 =?utf-8?B?YUpqa0xwZnBucGpPd0N5SEFWNWxqNUptOE1zektzSHdMQzBWMkQzcy9zdEo0?=
 =?utf-8?B?TFhWcWNjcEc3TDlCemtWQTJsYkpkTkF6UUZNaDRHZ2lCVzZLenQyUTBRY0NX?=
 =?utf-8?B?ZnpvdFRvV2R3U0pVR2czQ2dCTGd1TkYwOFg1VmxDdkZCcnpvYks5ZlFUdzBs?=
 =?utf-8?B?bnorZHBQOTNWQWJxd1N6Ly9aTDJEa1AvTUdWNitlNGF6MFg3cDAxRVJhdnl3?=
 =?utf-8?B?d2h6Y2UvL1k5c095OTdQL2ZZQ2J4T2luZEtrRDYwRVF2Q2p3bTVnb2Zmb2tR?=
 =?utf-8?B?N1FJQXloajBxNTgxSHEwL3FxMUM1Rmo5S080L3NGWjZ4bXNWWGdpUHg3OGJL?=
 =?utf-8?B?TUVBZ1VYYzVvOGRxdHZXVzl6VjA3dE90OVpoNkdyNkJSTWZjV05lTm9WeEhT?=
 =?utf-8?B?cnJXNmJEaHdsVmdFbXo1aitaN2xpbEtla1plaUR5bENRRnc4L2pMNmpWaklo?=
 =?utf-8?B?dmZuNFg2MnkxazVGZDVKc3V0eDZKVGw5a0tnd2RMUVBSbDdkczA1Vnp2Z3p4?=
 =?utf-8?B?U3BMZ2ozdVJaclN3L2Q4Zy9nWnhxMDZicFdxRk94WEhWVVBWMmtjZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9952ec56-6f73-4060-590d-08da1653c845
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 15:57:12.6461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LC+bw/sAM1kJH32zjmHRV0k2rYU25njytlU09Fo1NfjRYFJylDtb6FLsvv0LFlTylscqvXU2bb2c+xagE1dq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2397
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-04-04 11:43, Tom Rix wrote:
> 
> On 4/4/22 8:22 AM, Harry Wentland wrote:
>>
>> On 2022-04-03 10:21, Tom Rix wrote:
>>> Smatch reports this issue
>>> hdcp1_execution.c:500:29: warning: function
>>>    'mod_hdcp_hdcp1_dp_execution' with external linkage
>>>    has definition
>>>
>> Which branch are you using?
> 
> linux-next from 4/1
> 

Apologies. I was looking at the wrong function.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Tom
> 
>>
>> I don't see the 'extern' on
>> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c>>>
>> Harry
>>
>>
>>> The storage-class-specifier extern is not needed in a
>>> definition, so remove it.
>>>
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>   drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
>>> index 6ec918af3bff..1ddb4f5eac8e 100644
>>> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
>>> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
>>> @@ -497,9 +497,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_execution(struct mod_hdcp *hdcp,
>>>       return status;
>>>   }
>>>   -extern enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
>>> -        struct mod_hdcp_event_context *event_ctx,
>>> -        struct mod_hdcp_transition_input_hdcp1 *input)
>>> +enum mod_hdcp_status mod_hdcp_hdcp1_dp_execution(struct mod_hdcp *hdcp,
>>> +                         struct mod_hdcp_event_context *event_ctx,
>>> +                         struct mod_hdcp_transition_input_hdcp1 *input)
>>>   {
>>>       enum mod_hdcp_status status = MOD_HDCP_STATUS_SUCCESS;
>>>   
> 

