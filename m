Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BA447B4C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 08:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DCD6E461;
	Mon,  8 Nov 2021 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3443D6E461
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 07:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbLcnB4Y9Neg8WPl6V+eFnAJm6sbawCBLNlamZIp5otPPHX3eZYIImJc5qRKtkOiIwok1p4vq9RloX4itFCSAe5LACwce2ukoJbxlfLlQuq7YtO7q0HqPTh3S7vyWEIB4Ue/cZ9g4WIeWxvS9rhC+RAT0jam8dOBFkAFcWRcTzTP+DyX00ieTfba/uB+uM+Nddc8M0HdEGYgtk5imxk1F204Cu7fW44AQTJbOqwp5ZaRuLFEsfgtG3w9fRq2RqcjBSdGTXC428uDHsemRTLqEyhTWIQ+IfqM2FcKLv7EhQ7u+4OahjgqVjZPfemltHDe0Mm7I9CyXkCZvKbamaFNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95SiULFaygGjW38KnSCexOahD0afr7OOFXoWXCVLoeE=;
 b=Fn4klq2FCiuQy0bOZpUAl42FHyqTFL5oQ0HNATnnIks0J3yMAIVMx8heRZf0FFObCdfqmcdvfVTQXHXrQCiVcd/Addym9nlpWPNAgJS+eY4zQZo0lY0vq3fhnzSH4sY7Wu6nSq9Gr9Q7jB7IyZ4BeSZp1NvxnRD3O+z50ss8TRZLvmrO+/S3vMMWr3iSVq+kWq4YTuj3jDWVQiqvvAArePrJ71+O7gCg/omMK1Ce/zbtufjhBNemWcTvLp9NW6rNnr7grk4Fvi8hpjw0vUES3B/hrALNPzH8LRInvvObrX/fXMDj8Nfktz/h+AvmPvG/KxTeEghLpjKezSIVd1/9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95SiULFaygGjW38KnSCexOahD0afr7OOFXoWXCVLoeE=;
 b=bZ3hxnh69ZWTvscgma2ywmTW6r2a4Nu+6VineiuAc85cSWImLcPGL6LCkbn184b6bFiKOqYSAgEU+ZD4afKsMxmLJvJkGbJwkfoFF+3lR4Y4X0GN1RdMUCWPnU4Ev5Av+2wMQ+YBra/FcxR52DFoxDQeHIbOzExCF0TY8jmCmgs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com (10.174.101.14) by
 MWHPR12MB1214.namprd12.prod.outlook.com (10.169.204.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.15; Mon, 8 Nov 2021 07:44:31 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 07:44:31 +0000
Subject: Re: Questions about KMS flip
To: Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>
References: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
 <5c242319-ade3-5621-6429-f77b17c34de5@amd.com>
 <YYV0W1CxT5torU7u@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <64e70779-7c33-7849-aa29-aeaee4a89005@amd.com>
Date: Mon, 8 Nov 2021 08:44:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YYV0W1CxT5torU7u@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:308a:d18e:268b:408f]
 (2a02:908:1252:fb60:308a:d18e:268b:408f) by
 AS8PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:20b:127::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 07:44:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b4f9f75-7435-4cfa-08af-08d9a28b9931
X-MS-TrafficTypeDiagnostic: MWHPR12MB1214:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1214B97DA8C71E8370ACE6FF83919@MWHPR12MB1214.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4oW6IS1640IxWFDQdB+d8VJ0W5ozq23HyU08+A/N7mL/KcVwzI3wio5afLXd1Oov1p2Rqkc626MVrOEjInuVDWxr/PxYBp7rX94rje2cSivUK5NzHOM27vaIOxD/6Ei49mlsPP/KKr5hZ9MELYmsjFvh6d3VYlL6c4hV77LRgoaB5D/OfIbsjO2CQOvRQQ1y3a3FWOALucKOx4hB8SLnG9+B7ANo3Yk+PiBbfXtPwW0iOIUAbqOvp5C2SjGuBUv+pcmGJAbLWoJur+6ZkRRmCSt+vC84Cu2ASLhLMdUvGx2uQEx+/DvNqhZXErAUCxjaeQWT3fle0G/QcwNNgMzTfF2HSRRMoQ/Ttq5y4M3JKXlDgb35cMSPYiYI/nGF+4MafTO3mJ+kTARlod265wNsU6XRd+wyffc5PCHcohuG88BSINVJNhJ7Sxak9A0H1s6T6gt/u/WvkgRTEUVv3Px+0gR54snEfh+ijq5Nmz39pUtc4rnjrlFV353D2jnFCbqNMxW4Jkzz8U4tD4YekocJwmfcBSaDhaTixEu+r0o8rw3Wpg9fHGOzlI2UUpvDXxHfneBFNZkIM8PRRJStKea3aiOmpsop4qqA63GW6seRCBwfdtlCVG6EKA7Phf0kul4oo1UUDQFJ3VRUd1q9Vm5wEfDsVf9mkXgT+X8KWUofG8X8wGtnm4zOmQGKARbeifTxVgy8MZhAYPrLPN4mP/hdN/oLqNNZ0E3Siw7VmUmyNHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(4326008)(36756003)(86362001)(66556008)(66476007)(2906002)(66574015)(186003)(53546011)(66946007)(8936002)(3480700007)(31696002)(83380400001)(316002)(31686004)(110136005)(54906003)(6636002)(38100700002)(6486002)(2616005)(5660300002)(8676002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGhuVHNUVGFhVUJjNXIyWW1RMU5IOG96NzNMdlNhQ20vQVlvazFLYjF6S3Rq?=
 =?utf-8?B?U2R0SGVZVDhIMnZPL0FLVVlCcEl6cjV0eHpUYXBsN2tlMW9PWjN6eEk3N2JF?=
 =?utf-8?B?Y293Y0RVa3BoeFFhVUJFUnd4RkJPSDVOQUFWc1BBTDlodnczeDU5MTdSZmtN?=
 =?utf-8?B?T0s1aitJWXpMU0tVc0hqc2Q3aUM5RURFRUJEcEVYbUdValB2bi9xTEljeDVp?=
 =?utf-8?B?Mlc0TSsrZzZmZUE0dVpLMlRTUzViOThkOFpyc2VZWTc2K1pjNFJLME8vYTNa?=
 =?utf-8?B?V3BEVXVva0JrRzVaQSsraGVmcHdEWVFDdzRtYlBwQU84UWxhdVJEcjBFSWJ4?=
 =?utf-8?B?VC9TMDMySW5vSTZ5WldaRTk4MHVXWmJZZ2pIbkwyZ2lDa081eExHcU9NS1dJ?=
 =?utf-8?B?NTc1RXJoeXB2YXU2b2NhZ3d5c010NFRIcXY4ekJTVkE3ZERBMUJ0OW1SWEpJ?=
 =?utf-8?B?WTNLMTFrR3cvS1ZCZHRhN1V1MDZDcndZVWdDODlTSUlUTnlsUmNmMlBnbVVO?=
 =?utf-8?B?NXZDR0w1bC9nejJsaDZBcFNQNEd5NWZTQ09HZG02ZXBYL3BvaVpzU2o0RDRl?=
 =?utf-8?B?cDFEc1NEUFJvakhFNDhia21uOW5YU3dIM241TFMrWlMzWEdJQXBoMkR2T1Fu?=
 =?utf-8?B?UlVXVEp1WDJRSXpEbHZ6OXZBNTdDWUdhN01yQjJXSjIxdGFTaWJhc2RSYVJU?=
 =?utf-8?B?WUhUajErVHVJZVVwQTY0ZXA5MjhGVTFjckJIb2orSnplN202NGJCemZwNVlM?=
 =?utf-8?B?dkpBeC8yb0pEMDg5bWRTYUU5cEJCclVsUEhQcXJzcnJzUHVhWHZmUXhMMW1M?=
 =?utf-8?B?VW9nL05iQzZyQ0JZMXV1eDA5dGRFTmpaa3ROVjhWN3V0a0kvMDQyOC9CZU1i?=
 =?utf-8?B?NU1LdFhZV21Xb05rZlhlWGx3ZVNzTFVGQU5XV1d1WHF2SE85bGowYzNmeEt0?=
 =?utf-8?B?cy9Ya0ZqcEVxNnJ6M3hoeDJoSmZsVmp0TFhjZE8zTWRhMUFlSE5LUzJQLzJK?=
 =?utf-8?B?RDdTNDFSK083VHBUcUcrR0VCOXVkdGVBbjhBRi9tdWIrMExwcC9MVUlYbllm?=
 =?utf-8?B?TmMrdGRXRDFvTUFTNEcwTGNrNU9JNGVrcFVOcVR0ZWxBWHh0WGtwSWdURFRj?=
 =?utf-8?B?bnNOQjNFbkZmMVRwZ2IwbVpXNHNTVDlDS2c2Y3BFQXBLOEk5RXo4TG4zWW9N?=
 =?utf-8?B?SnN6bjdGZDJLcW5XWksrblZCcXEwTmFQL1hLSjNEZ0xQYkY3ZjZnSTdyZUF4?=
 =?utf-8?B?cWVaR1BudERnNCtLcC9FUVNCdm4rWnpYU0ZCdDhYbjlyV0U2eUVQeW1JUnBM?=
 =?utf-8?B?VHJaOTF3RWtxZnhFem11R3ExZDhGQzZIc2JLMkQ4WWJSVWxKQ1IrV3p6QnpE?=
 =?utf-8?B?NHBkUHVyV0FSSm1ybjcySmZtYjBNNmtVUzVXbDBLREVwUmJsaUFDN2FzWWJN?=
 =?utf-8?B?QkJNcEZNaHdad3haclFGVXA1c2lITTA4aE90c2NnOTVydkdiSUUxSVBVdzh4?=
 =?utf-8?B?ZnJqeU5SdDRYVVczaC9YbVJZQ3Z5Rm1pUnhuS05JdzV2SHhRcVB6ekttc0Fk?=
 =?utf-8?B?ZzE2QW5QaFR4QkpRN1F2VHJXMFFxNzlTRVhrVFdxbFJjMjlmOXloakw5V2Rq?=
 =?utf-8?B?LzBhUTlpc3pMU0djNUpzR3Q0Z1F6VTAxZVppeitpd0w1QklGQUliQ0t5SXZv?=
 =?utf-8?B?OGZBb0UwRDQzREZvZUtTNFNYVUtZTEdCaVhneHBPcWlqcU5WbHZwT2dCY0lm?=
 =?utf-8?B?aENDZW5oTUNEQ3NIY3N1dy8vYSs1c0poN2NTMHpmSlBzY0VhVmpPOXQ4eEMy?=
 =?utf-8?B?TXFIU0ZBcy9iNmVTR2J6OWxhdHFvWUtJalRTWk9tZHNpUkhqc25sTnJYQTVs?=
 =?utf-8?B?YWpMWkpzVE1jbUVJczBuQjNXMGlvNG5sQ3RZb1RkR0lIZkhHd0d2MkxwMTBP?=
 =?utf-8?B?cG1VUGdFNEIrZFZuOTJRcTJvT0RaSWtzWTY0amZzcVlHK0h3Y2ZKbDRLNUIr?=
 =?utf-8?B?WDlmZDlQNys0NzcxQTNFSFlxYkxPT0RpejFvclZ0SDR6RWtWQU1Fb3NsUVUr?=
 =?utf-8?B?S21lcmdIVTF2Uy9tV2NSN0Q4OFpsb1dmdHR4WGN3RkM4V3dyc0NTTkMwY3dv?=
 =?utf-8?B?YU01VURhOVJqQlZoaVBmOXl3RHVrNlJab1dTOGE1Uno0VG9YSE5ySHpoc043?=
 =?utf-8?Q?KljquH3kMkbPdLpKAa3437A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4f9f75-7435-4cfa-08af-08d9a28b9931
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 07:44:30.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blC3eo/AbnTJBwIRKCUsBLLDnanKnjOypGprW2TtQK0I3wa+e+ZDyj8xx5X4xS0b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1214
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 05.11.21 um 19:13 schrieb Daniel Vetter:
> On Thu, Nov 04, 2021 at 12:44:34PM -0400, Harry Wentland wrote:
>> +Nick
>>
>> It looks to be the old drm_plane_state->fb holds that reference. See dm_plane_helper_cleanup_fb() in amdgpu_dm.c.
> Yup plane state holds reference for its entire existing (well this holds
> in general as design principle for atomic state structs, just makes life
> easier). And the plane state is guaranteed to exist from when we first pin
> (prepare_fb plane hook) to when it's getting unpinned (cleanup_fb plane
> hook).
>
> Out of curiosity, what's blowing up?

The TTM pin count warning. What happens is that we try to free up a BO 
while it is still being pinned.

My best guess is that some DMA-buf client is doing something wrong, but 
it could of course also be that the BO was pinned for scanout.

Christian.

> -Daniel
>
>> Harry
>>
>> On 2021-11-04 08:51, Christian König wrote:
>>> Hi guys,
>>>
>>> adding the usual suspects which might know that of hand: When we do a KMS page flip, who keeps the reference to the BO while it is scanned out?
>>>
>>> We are running into warning backtraces from TTM which look more than odd.
>>>
>>> Thanks,
>>> Christian.

