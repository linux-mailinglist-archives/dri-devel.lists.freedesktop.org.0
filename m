Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3B1457325
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 17:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EFE6E0EA;
	Fri, 19 Nov 2021 16:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EC26E0EA;
 Fri, 19 Nov 2021 16:36:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/jTqVWH2GjyOLXJH/MgUWFPUhQD94/oThiF/ViADp9yee+dNx91ysb4+YbttwUTwT2RVA2saZjdf4CsgmcnGb6unTL/2LG6dIw3RUN+s+wEeBFBZV7i7jZvDDHjxqg+jXBugjIyJ0ATlfDCSRyPn+5CXAo4vYZVNfRtbT0vuZIrFXi0XEJbbeqfWAnPseGeTj9TFvtJ7yT2OeeeaBvuLgC6JEM2a4UY2kmViMbq58xZaxB8wOayHKjrp/7KlpER0RX5QR//p6+DgixaSZxur58zU2DOqfZR8Gjx0yyj3vWQ7lgwPEihL5bzm6bkafN5rMGetScCYFhW/X3ebpYuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv+3p72mQ2dQGpRT8M0dx4YivgzOvXqG3g4cL6cxnSM=;
 b=IqXbhTgeT/04+q1rWIikl3iBjlYrmmtq18M9xlhZHl+rrnFsd+7Zze1jQSGbO4navSKu5FQz0wr1KgZxCk/JO6oqTGamyNO+vWkOMANSbmFVAlKW3ivAolW1cfurdB2K6BJvnbToGMD8yk77y0WQBIztGEDooz3+X50KwmShOoLLlc1l3+UIOSqwenGF0VuPNkVuACicR5DQxhjgQ2vYJida25pgyz6QEGRoTkJz55+4Uh2x0VGQd0TEFw3kR0VkZfUJNW2508MCthS5W8+klqq6MsrrxbBqdOk20XFPt11ER5vdBnkvoSFIsBHRTxU+DISjVmW2F0hZecQcBhrZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv+3p72mQ2dQGpRT8M0dx4YivgzOvXqG3g4cL6cxnSM=;
 b=SiS2pCS1d5GVGPD7rCzyOK6AeYvUgxeeqx3oliloOhbFrut5w0YrDXjdfDNC3e3wdfs2EBjggEZ7WI6hIDrMZ5w8PCtUr3NMaCZaUslBmOdl9aE5hdaowVl3u4jeyxco9p17QsFPvQCBNJh+/mhYiKe+3Rq3ylIxu5eUaIsDRvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2425.namprd12.prod.outlook.com
 (2603:10b6:907:f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 16:36:00 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.029; Fri, 19 Nov 2021
 16:36:00 +0000
Subject: Re: Sparsely populated TTM bos
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <f73304f7-6ada-bcd2-97b3-c7898cbd166c@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5f292380-c3a2-3ec3-91bb-5e66a9290aac@amd.com>
Date: Fri, 19 Nov 2021 17:35:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <f73304f7-6ada-bcd2-97b3-c7898cbd166c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::23) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:719d:e788:438:2f7e]
 (2a02:908:1252:fb60:719d:e788:438:2f7e) by
 AS9PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:20b:462::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 16:35:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03c2906c-ad4b-4a43-2678-08d9ab7aab76
X-MS-TrafficTypeDiagnostic: MW2PR12MB2425:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2425AB34DB0D38C005C8CF45839C9@MW2PR12MB2425.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mlCDbZuhUaxc3jDBBjyTpCXZxDLMCBWawNbAJA68pz0k1pTIUwfXuQUShu5aRYhPh9eiodZXlyvfZEr8PSrld9Z46QkOA39AFGu0T3OrE4fXK77JpBwjhPGD2IfthwFKKu/CFg6jWRzvxuMnJ0wceqXUoSoKWPGr5cGSeLQu90N6rFovMCUAGb9Lx0QukM9UHOBHEBngYo68dO4jPDRgLAIdBw/aq5Ocs+sCWm6eoFbkSefKWiPW2mOHadNgnZvLBy5MmVI3XXuY+Z4RiYS0y7MRGhw5s+C/lcl4fvEe9TB9M1AerJn8WWpXtWrgzgq8M34zJtsbwnq9kbm5WVIRVJo3zEBhJixCuuCgVEeUjAoReInGQReFrqf6N7sJJ4HEfZg69ZokMazoIzFEwvDlUQ6lVaY6fbf5xusGCLZm45XAnCjeckskrIiNkeBDULzl1Dd1wTlVvusgmN6gHvjQTf13SBODtEr+LqDjBsPftO5GS8MQOBdGzzwta7W97gblVyfaRSalrxE2M45gOnHnsxmp6/RGyM7LRGapEq2cS8kegqHjUDL4T4RMA8waPtClqu78ic+oQQilh8U3i2Z7ejgfheZNs8FbcwjvM9kOlJfdiP4CiaerIDGP1enEWxU8hvYhFboI4fgW4fVdxF61aryL1XcC2xzGdjsuc3affAa8UxB2T7wTBvvcOcB3TbBMPCyZ20/gmg9rLEp4nbApQSIHf2RUKmdFohkHlFXbrdV2lzxdbJLw8p6fMQ6GUoR/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(6916009)(83380400001)(3480700007)(31696002)(4744005)(38100700002)(8936002)(5660300002)(508600001)(36756003)(6666004)(86362001)(31686004)(8676002)(2906002)(6486002)(66476007)(186003)(66556008)(316002)(66946007)(54906003)(2616005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkVRYW01UXVwanBrMjhEcHFpeGZ3emFwKzIwcHZiWFppS085Q1Fwd3hHVlZx?=
 =?utf-8?B?MXhBM2J5WEp2dFYrNTF0dWE2aWhwVE0wRmZvME5ZM2RtWnlvWUljTkkrNFdy?=
 =?utf-8?B?UWhDMUNtZUtzUm5nWkxHZ2wwTnBTUXE5SVBCK2szbnRKWVlsTGtHSFprd3NC?=
 =?utf-8?B?N2RpU1Vvb29qMXBsK1piR3ZuZitRNC8zellEajNwSHQ3VXRPRW5jRGRZdUg1?=
 =?utf-8?B?L2c3bkt1SDVDZzNlMXR1Sml3THJMd0wvNmhzdGhwc1RMRDBJOTg4cmxZQWFZ?=
 =?utf-8?B?TmhWTUdHTXlSampnKzVwMUxVZmNmbEw0a2pXRFlEU3YwdFFQL0VXT1dFVGIr?=
 =?utf-8?B?SDR0aEI0L0VKODNRUlVsYk5BSnhjTWxKUFZqWFRLc3hqbjQwekJVZ0RzUDdB?=
 =?utf-8?B?RGVkRmMrd3V4L0VTYnFUS3I1bllEYmJZNlMwNkVqRXE4bWIyTUpUeVdtNmxF?=
 =?utf-8?B?czZHQWo2T3VXM1haWlVMTUorb0JidnE4ekRuTnlKM3FzR0lKYWtxT2kyQXpK?=
 =?utf-8?B?VE15QUw5VldjVVJOUHhGUGxEMXNDTGhHQkhMQ2pFa1J3Vldqc3ZmL21iVEt3?=
 =?utf-8?B?RUNyQTEwbFpLT0dYcGEvZmtmUVhWNFVsRFJpQXQxNDlGT2pCeDZCWklET1JX?=
 =?utf-8?B?bUVicXVuZWF3Sm12KzI4UVpXWWx4dzg5eHlmbDFzNEFnU2ZmckkyaHJrTHdN?=
 =?utf-8?B?NHlqR3ZWbU1JN1VmNFdSb05ySDE3S09TTVo3NklycGg3UmJWczlkdzZCWVNX?=
 =?utf-8?B?ZkpvQ04vZ3dXazhJWlJ5bThtOXpqK3lqSk15UGxEM3dPajR2azJ5dnZtS00x?=
 =?utf-8?B?L1owc3pXYXVpaHlzdkNwaVhZdjZNbEEzOUUrUW1TaWVZQjVKRDMwRFk4WnUr?=
 =?utf-8?B?STR6OGU1S0U4ZS9KUDBnUVJhSVF6WXRreWI0c0xTKzJ1WG9qWW5WK3VBajc2?=
 =?utf-8?B?Ly9rcGc0QWNWV0krV3FkUENXbEZSSHlCVmJhWjFHc3BlOEJ5Y1c5NXgyajFx?=
 =?utf-8?B?RXJscFExS0UvK281a0xRVXlxa1NLMUJabGdFUkxuZTEzWnA1amNhS2xTc0d2?=
 =?utf-8?B?TEo3RUltdk1ESDQ0a3A2YXJLOFBSMmEwM3Z2NkNwL3JFN3dFdnFzUGFUZkVz?=
 =?utf-8?B?SWJkQzBNY0pVbEdVK3UyYXk5M1BIbXdndEdJTnFZNnJoWTN3UnlodVdvSFcv?=
 =?utf-8?B?ZXpKV0tDQTRDUElaeDRZajkrTUFPbFVEMUVNRjRoQlVaNEVjTFErM3pzTm5s?=
 =?utf-8?B?TW9CTEM0VnZseUgzeXRLdEdFSDNNemxxKzgwcEg4M3hiblhJRDNUZzVrc0JI?=
 =?utf-8?B?QS9heXRhMng3K2p0VVN2VjcvZnpnU2RKT2ZYalNCaHlQWXlUa3lOc090cm8x?=
 =?utf-8?B?ODNUczlUSGwrQzBwUkZvZjlRUHZKNk94V2w4Y3ZQZ3hJT2Z6NkNnWmI4U1Bs?=
 =?utf-8?B?RC94dFdXbmg2c2RxNFlWa2x5eUhMZXl2akZRS1gzMTgrdS92STA3dkk2dURa?=
 =?utf-8?B?TjVJSWlzeU13eHA2S1IxSE0waDk0T2NUTnZmUUx4TGJNdGVUOW1tdzVXdTFz?=
 =?utf-8?B?cUt4bll4SEZjazJveGpGSmN1YUp5enJoKzRJYTB5ejhqVHlFODYxUzlmOXc4?=
 =?utf-8?B?SG94NlRCOHQ3b0ZabExSdWlROHl4elpKM015SFMzZ3A5N3pXak9BN2pvOU5o?=
 =?utf-8?B?dHBrVENxUnhmK2tnZ3ErVWpBWlVqZEJxcWRUTDFCRDV0ZWFMcHRSblRIVG4y?=
 =?utf-8?B?cHZYSWJLTXFPMVo0eDdjU2M4N2VBZEFzSEVNdkdtVTlUZlJzanMyZitTdWh6?=
 =?utf-8?B?L05tYUhIQW5kR2FLWUNvM1VUdnk3STh2WTJoY2tDaldVR1FSS1RsN0RmdjBj?=
 =?utf-8?B?YStFMVpUbytCRGJQM0dqV1FHUDBhaDEyc3djQnhSV0NmbmE2UGZUWlZoWWls?=
 =?utf-8?B?WWFHY0Vabnh2dVowM29wM3JIWWd0M3NZcmo4T1cvWDhiWkFCU2pYM01NeG9B?=
 =?utf-8?B?cXMycFJFSVNSTTZsTVloa1A1YWdoRjU5QSs4aHhRdmNFRy90VjdCZDNVYjhJ?=
 =?utf-8?B?dG0zcWVwU2trSXNhWmhIMTJCbVlmdVVBNjc5R3c4L0ovcnR4S1hGVi9UcTFj?=
 =?utf-8?B?MmRHTkxRRVE4ZUt6am82d1pBQWJtVzhkbFNoRkF3R1RPOFVNU2F1cWFYdE9l?=
 =?utf-8?Q?Lw5hGod+pc4+n5hlKBp/WxI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c2906c-ad4b-4a43-2678-08d9ab7aab76
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 16:36:00.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wr3xzCxaof15u7AGPhSQSpcz4GRyMTld5z2mVGygd6PfKTKDJc+4zyxzgtDftiV6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2425
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Am 19.11.21 um 15:28 schrieb Thomas Hellström:
> Hi, Christian,
>
> We have an upcoming use-case in i915 where one solution would be 
> sparsely populated TTM bos.
>
> We had that at one point where ttm_tt pages were allocated on demand, 
> but this time we'd rather be looking at multiple struct ttm_resources 
> per bo and those resources could be from different managers.
>
> There might theoretically be other ways we can handle this use-case 
> but I wanted to check with you whether this is something AMD is 
> already looking into and if not, your general opinion.

oh, yes I've looked into this as well a very long time ago.

At that point the basic blocker was that we couldn't have different 
cache setting for the same VMA, but I think that's fixed by now.

Another thing is that you essentially need to move the LRU handling into 
the resource like I already planned to do anyway.

Regards,
Christian.

>
> Thanks,
> Thomas
>
>

