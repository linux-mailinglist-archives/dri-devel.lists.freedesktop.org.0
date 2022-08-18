Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB459913C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C07310E06E;
	Thu, 18 Aug 2022 23:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D04610E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 23:37:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNv/P5dwc+IKGd3W1A8So2j6+DjLukPMQuljMFTQhzSYA0s4Bl/NCkhkIWXlASt1EpH2QY15hGTQSOXNVqqra6SMHwpcMXGk2Mq7nAClxPT3CGbP1vhVnZ9IbvpTs3hM/xGExP00ucH/P0PMjEeLdRwp4Y9PNwvehHzLbSnWgGD69zlNMqjm9jxd/bhcXmnLuRehgmsqIGVyYrThVK0tAk2uQ4csUArbreylTA4jfQV3POvV3AUhCtFI2DgrZ2qfKrd8K5k3yAosXL92ukmHhrElJsjBM2BI4O8TiaMjM1+Rj3IwHQtVdABJ8RfDUv9xoyOZeGkh7uq+654aOUo7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pn40IbLK//p6B+ku4uHCOvaBsWrVONOQvjJM6a6pc7M=;
 b=I3j2coIEHU1rY+B1PS4aQEBKF9RbWea7LcRic1CKRekyRU3Nxa7vqrjuxM6Y2El+mZjQok2FhWP88WtSn6RIDB2uGK52FSZYSrm91vZzpET/XxYQHGviXS+6k8OWK0bxyTtCNJc3alDxhECs3wAeFniG2J8wx1CsU2NiQjXF9flG4heLWj2H076G8ZEq1X3EbbJCOMf1j+KRkcU8FIVZU815nyG3rRQdKrvSbc3I5Ns+nCzQ7LDt8VUXvSy013Kp8LjKYHp1fbYBRZl31u76N3P2GzDXh0tWoZjHgw8r1ef1l9Iiu91oApIJV9VCeSkFXmgKG9RZaz+kT2mI5HdEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pn40IbLK//p6B+ku4uHCOvaBsWrVONOQvjJM6a6pc7M=;
 b=f1zjHa8ENOV1N/kKvmdV+7SbU/Ya9ncdULM9wDPb60+DN9yxt7uPMhGacpQi7ipy9bRK8F7Pm5ppowrtzodtzD/KFEG9VQNPAUHK5RxoyUzgYO35WLv2MzFdc7Ohe5u6ziIO5rW+bxR1FCldfFLoDFMAtn4l6ocaFV9k17vwqrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MN2PR03MB5199.namprd03.prod.outlook.com (2603:10b6:208:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 23:37:18 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 23:37:18 +0000
Message-ID: <8c7fc96e-47f1-2a68-0ebe-3205b4e3187f@synaptics.com>
Date: Fri, 19 Aug 2022 07:37:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-2-randy.li@synaptics.com>
 <Yv7IUrhTYWevMk60@pendragon.ideasonboard.com>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <Yv7IUrhTYWevMk60@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 395d58c0-8344-4b4e-8e5e-08da817296ab
X-MS-TrafficTypeDiagnostic: MN2PR03MB5199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V+bU2TUyEDTzbM5tU0fBJAK97H9/3YzCBw4lnKtlKiG0Zkm+B7K5VD6OzdT6JpnSCVb3iQ7qqf8EeWcsyikcz28cNPl4tfryNeRIGlAsRDHvzqCzCmhWX25NDgwfoy794nl1KjS/viSdczFDEIgIhtnU113P1pC/Tg9iAWHL/ESpgsGli/bIFK3UPHU459ZPMJ2AJVXaefsCJfWSLeqSwDLckYio+/X/EnQ6KAJ3cTqD2NxPcGt/1UgHXFkuTb31a7JjYqdG6e6f/k1WZxk//FkzUvm3i4ECzYfuhA170kWMWiU/F994sQZGBci9y1nDLuhZIt7YF6u25xgVbQzl5w5/N5MiUyP2gwdtkIooHdAM9hzOoqztZyLo5FTnM8Kzx2hf35WecwsagziLKhRYe0cHLao6dqXX5YlVl0ZcXqlk2Hae03Z4zALluda8SsFaALA2QBIE9lR/swYnoLqjS/RoPiJlj1sd1ai01wICI8KGgCyFM4ugcHiudEoA2w2S/V7Pgp+LfqrQ6SLfq6aD7F5/OUO2fF/x7Fm+8iC/9rnCH8jWm2oSo7SjVDyxFYPO0wOWu0ROcFN9VMFUfFboNWye1VC3LZYqxw/A7DJgcwjZ1HouG7J+6v4CFvpdoTyHye766Gn1Uq8asIPxEfEd/9OmKpDg2LNL77T0nzhd5NDWt3iRlwkLIqRYogFjRhufvv1OVDY0lEQlmG01DyVcT2m5iWIbVIVV+CVd2lB4LvPiT0LIGJJx8sb5mjgdcTz+T5nGgX3mVUSgVkNqeW1WstRWUIrTBMN+HP8vFI2KhKnmwjmmoEmaeVtdnQ1s5aQ7QOsdu2+HV2u8r06L5NZd3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(39860400002)(136003)(366004)(346002)(5660300002)(478600001)(36756003)(8676002)(7416002)(316002)(6666004)(6916009)(66476007)(41300700001)(66556008)(6486002)(66946007)(31686004)(4326008)(2906002)(8936002)(31696002)(86362001)(6506007)(53546011)(186003)(6512007)(52116002)(2616005)(26005)(83380400001)(38100700002)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlhhOVA3eGVKS0MrS3cxZGROcy9XeXdSeVVPZTJUVTdKVHN3T1RmMXkwdmxr?=
 =?utf-8?B?Q0lPOVA0SzBlRkxBNUFkdFMydmEzQ1oxV0hLU3VyUTVJVDg1QWU5OTIvTHNO?=
 =?utf-8?B?Tmc0WEczeC9Xc2tNZXhEd2Zxay9QRnYxNDlWcXlHOEh2bzcwSXFEczh3TndM?=
 =?utf-8?B?R0Q0OFd0NzhXTTR6QnBhbWgrcjhLSTNyMElrbEF2Mi9IekhCL3NlLzE1bHll?=
 =?utf-8?B?cE1xOFBlUzVEZ3Nnc1pSd3owOHdSWjFmdVRoU0V2Q05Sbnk2ZEJqMlhoKzRm?=
 =?utf-8?B?aVZtWnpNVTFhaSt5cDVQQlBObENyK05xL3dXTUJhTGp6empTTDNmeVBVeXpI?=
 =?utf-8?B?L1VVLy8yMWdIRWVxUDRIWnlvd1V5K2RvTkRDYkFyckR2cGY5S3hQUlk0M1gz?=
 =?utf-8?B?WDNOb2JvT0dmcHlSdW5jSjBvQVgyNm1XekkxeU5qYzJNQTVCTVNMQjRnRThQ?=
 =?utf-8?B?WFlKR1RhM2lXdXVKL2ZLb0prU0hQQTFJZ3kyNjJ4cVdVeE5qVXAwRzRkSDNM?=
 =?utf-8?B?OERXUmlCQ2tkZ05GNTVobFQ5MnRSc0FYUzlYU0wrN1JJVno5YjJScEhpSXgr?=
 =?utf-8?B?UEFXTnl4OEFaUjU3ZnFmdHlwajRJZzZQLzhZYVhKSWQzQmN6V3hNTVJXSWV5?=
 =?utf-8?B?K2dTWHZ3LzMraUtqVHdRdGpxRDdVaFZlNm1FNHFMdXRkRWJHY0tWT3RYN3Av?=
 =?utf-8?B?aUhFcE9tRHpVT1VxVlVFZ29FUWlFMFB0OWZ5L1A4b0VPUFAyU1hoemlobHcr?=
 =?utf-8?B?Ry9jVWZUNTE0a0pZM2FMd2xGazVyMGZVUDRmbHpoSWZERStFU3RCR0VpWnBN?=
 =?utf-8?B?Qm5hR2RBbnhJSzB6K3Nvc1p3d1NDY3VWa3RaMXh4RE84Vm5zSk9BWUxtNWk5?=
 =?utf-8?B?Wjl0RnRCTWc5R0ViTHAwQVE1UEJ0N09hTTlOakZXVUs5MzhDNXMwbGI1cHZW?=
 =?utf-8?B?bVFjVzZSVVZpVWg2aHprUWJXcFM3RTdhWFVjSCtoclpSMVJRdWtWU2tBR3FO?=
 =?utf-8?B?dHlVMllLRjFEd0VWNjFQRU1rN1BsV01pV1R3Zk5ObEgrcnRWaUM5K3N2WVVx?=
 =?utf-8?B?WnljWmxpWjYrdHYrNEdZekQ0dmN6WUhOejJ6bFhYZnhXMzBGbzh5MnBiemN0?=
 =?utf-8?B?TWphK2M3b3hjdVpZZlkwaGRWbWNJWWZyUlpFR1Z4bk4wcXpEemR6alpiRnNa?=
 =?utf-8?B?d1BaQVhFalcvQUhqcEE1TkxrbWdpR1FWWEoxbjhXV2YyOEJ1em9SN0czb09C?=
 =?utf-8?B?bjVUZmwzdE9rL3VZT2cySUpzd3Q4OHRXMmh6Q3NHOWh4d1Rpb0VNb2ZSQUxx?=
 =?utf-8?B?S0x1cWZvZHJsMVQyOVhWYjRJVUJaQ1FMdzNaVnUxakVoWFVPVzd2U1k3YUVv?=
 =?utf-8?B?a1Rqb3NDSFRWOW5jZWpzL3pHaHhRSk9LWS9NYzVuT1dHMCtIRC9oN3pRbWls?=
 =?utf-8?B?MWU5NDdiTHN5TE8rcHp1Qzk3OFhiQmxyRTdTMHk1Ti8rWkR1UHFUeFFuOWU3?=
 =?utf-8?B?bStHNk1pS2lVUXFXbDgvQ3p6aFBwRlREdnlhNUEyZmx6d2NWeWNWbWFySitP?=
 =?utf-8?B?UkFQVDRmTERxTXZkOWw0L2N0U3dSeFo0ZE9aRGJURE0wVUlyajByRGRQdFo5?=
 =?utf-8?B?OEh6ZkVPWkFmSUtmR2xWeUh3N0psMGFSTDRqVGQvODRHNEd1UmhXWWIyMUpo?=
 =?utf-8?B?L0Vjc3ZvaWZ0TElSeWpYUUp4V3FJeENiTGZlYlY5RU9WUGFUZW5kbnB4aUZu?=
 =?utf-8?B?QlJ6T0kra2I2d09nR2liN25lRmNLQ2dKaHk5WVBodlZLWGQ5Mnl1NU8rL2Zo?=
 =?utf-8?B?VkRwRTlURC9uWU0zcjQ5TFExUndGWml3M3plZXlXMlpUK09MaGJtL244QU5u?=
 =?utf-8?B?VnJJNWEwQk82cmZ3VnZWUlhWU0NaUmZ0RzNKM0JkcXlqblFDeUg5YjNTeXBJ?=
 =?utf-8?B?cjlnVHhlS3FxRklxdDNwblh4c2tBdlZrZmlZNVhFdmRrb3NOUS91SldPclV2?=
 =?utf-8?B?L3NvZWxySUlhUUZ2MUxLbUxRN0d3NTU4VzRYdUJ1eWI2OUNCVTJDblNzQVFS?=
 =?utf-8?B?cE9vYWZDZ0hCMzZYYkwrRWJlL0JnWmVqNWl4TzV2SDRLY05KRUtoSmNzMGdS?=
 =?utf-8?Q?wd9/jqEhm3HxL3NbpW4XYFlPI?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395d58c0-8344-4b4e-8e5e-08da817296ab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 23:37:18.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2RDqKj3xIUORUAnZxF3jw5pZPQkJQf5XdVUvU/p/jB0wrMQDZdi/zptcqLhBAWlhhqYsPkZhL0bcRq2rfuspQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5199
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
Cc: linux-arm-kernel@lists.infradead.org, tfiga@chromium.org,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/19/22 07:16, Laurent Pinchart wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Hsia-Jun,
> 
> Thank you for the patch.
> 
> On Tue, Aug 09, 2022 at 12:27:49AM +0800, Hsia-Jun Li wrote:
>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>
>> Memory Traffic Reduction(MTR) is a module in Synaptics
>> VideoSmart platform could process lossless compression image
>> and cache the tile memory line.
>>
>> Those modifiers only record the parameters would effort pixel
>> layout or memory layout. Whether physical memory page mapping
>> is used is not a part of format.
>>
>> We would allocate the same size of memory for uncompressed
>> and compressed luma and chroma data, while the compressed buffer
>> would request two extra planes holding the metadata for
>> the decompression.
>>
>> The reason why we need to allocate the same size of memory for
>> the compressed frame:
>> 1. The compression ratio is not fixed and differnt platforms could
>> use a different compression protocol. These protocols are complete
>> vendor proprietaries, the other device won't be able to use them.
>> It is not necessary to define the version of them here.
>>
>> 2. Video codec could discard the compression attribute when the
>> intra block copy applied to this frame. It would waste lots of
>> time on re-allocation.
>>
>> I am wondering if it is better to add an addtional plane property to
>> describe whether the current framebuffer is compressed?
>> While the compression flag is still a part of format modifier,
>> because it would have two extra meta data planes in the compression
>> version.
> 
> Would it possible to show an example of how these modifiers apply to a
> particular format (such as NV12 for instance) ? Otherwise I'm having
> trouble understanding how they actually workThis version didn't contains the big tile information as I was 
considering moving them into compression options. The uncompressed tile 
in big tile pixel formats do exist, but I never see them being used.
Anyway, let me just try to describe the most simple tile here.
For example a NV12 tile format(V4H1)
(0, 0) (0, 1) (0, 2)
(1, 0) (1, 1)
(2, 0) (2, 1)
(3, 0)
(0, 0) (1, 0) (2, 0) (3, 0) is a tile, then (0, 1)..(3, 1) after that.
(4, 0) is after (3, y).

For example a NV15 tiled format(V4H3P8),
(0, 0) (0, 1) (0, 2)
(1, 0) (1, 1)
(2, 0) (2, 1)
(3, 0)

(0, 0) (1, 0) (2, 0) (3, 0) (0, 1) (1, 1) (2, 1) ... (3, 2) are 120bits, 
then fill it with an extra 8 bits, (0, 3) would be placed that the first 
128bits in the memory.
> 
>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>> ---
>>   include/uapi/drm/drm_fourcc.h | 49 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>> index 0206f812c569..b67884e8bc69 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -381,6 +381,7 @@ extern "C" {
>>   #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>>   #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>>   #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>>
>>   /* add more to the end as needed */
>>
>> @@ -1452,6 +1453,54 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>>   #define AMD_FMT_MOD_CLEAR(field) \
>>        (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>>
>> +/*
>> + * Synaptics VideoSmart modifiers
>> + *
>> + *       Macro
>> + * Bits  Param Description
>> + * ----  ----- -----------------------------------------------------------------
>> + *
>> + *  7:0  f     Scan direction description.
>> + *
>> + *               0 = Invalid
>> + *               1 = V4, the scan would always start from vertical for 4 pixel
>> + *                   then move back to the start pixel of the next horizontal
>> + *                   direction.
>> + *               2 = Reserved for future use.
>> + *
>> + * 15:8  m     The times of pattern repeat in the right angle direction from
>> + *             the first scan direction.
>> + *
>> + * 19:16 p     The padding bits after the whole scan, could be zero.
>> + *
>> + * 35:20 -     Reserved for future use.  Must be zero.
>> + *
>> + * 36:36 c     Compression flag.
>> + *
>> + * 55:37 -     Reserved for future use.  Must be zero.
>> + *
>> + */
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED         fourcc_mod_code(SYNAPTICS, 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, c) \
>> +     fourcc_mod_code(SYNAPTICS, (((f) & 0xff) | \
>> +                              (((m) & 0xff) << 8) | \
>> +                              (((p) & 0xf) << 16) | \
>> +                              (((c) & 0x1) << 36)))
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H1_COMPRESSED \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_COMPRESSED \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1)
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
> 
> --
> Regards,
> 
> Laurent Pinchart

-- 
Hsia-Jun(Randy) Li
