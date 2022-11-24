Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A1637105
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 04:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5652A10E253;
	Thu, 24 Nov 2022 03:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6A510E253
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 03:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gesCOb80HiPyxOhrikXpv2wB2qs92Kxiy/kPmKn8JeL7DW1GDoLT9LtTUo+CXmB+vGpZNYcIjlygpNpsDyoxSsiiAzZrWQN0mJyLWcC0G8s8TvU9lV3xmUeOQ3CjxXL/gehMd57HNvWKu1KFg6yVIsEvhOvIKu1yTzdEGlo9JQAxI6cKZCQFkcgjSwD6fxPLguVeBSShEby+VEnowPqU7kjr9mO4CNt7cIMAPbYMoAAWud6G/UJSQ+8nRJwM3vDzdCzY4GUuwsfn/q2fmc9OIfy7MiN+13JRXxreUWwGvQMXdpCgE6L+5EeKrMUM7zdbGcP+IooOxbeevXrALSR4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpuTgbPwmEooBS+88CZQxaDe2vTOtu3JCUtXzdrtvNY=;
 b=Zn5twJFsE+vJs3c223MD2CAdvoVdLv6fiHNZBxfw74Y/9fLEBlA+VAXDCbHhNIX/ttzl1PKM+TfgTzrHYerfxpDiIt6th9bNdENSlNLCa/lfyIJBQxlk6UGN9HKnKuGQEJoz8qmjQj3eDxNDkhO65RIWPfDksA8DGccVATEs4znPhOfW4wOBG8eoXEFuSeqVVLL5QBu2Iw+LLEv8/2IlhD9aO6gC/yUXxEyCf9uYlNVlCq63KCU0GGXFLAqvyCFDBHTeJ6DBoZBPTiVqWmH28Lo7JmYYvTCf7mtVdwESzmkpbJarlk8lPcZspk0Q+DkI4asPGxTN7GD1hu26/2qNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpuTgbPwmEooBS+88CZQxaDe2vTOtu3JCUtXzdrtvNY=;
 b=TLUhoLLY3YERqdjzpQp9tVTSp/ZbJutp1//bgyhYBA2Lpxc14f/7jYQSPOWetCbAE5Z2+kS2gtbgjnRqxIPvic3pPyHVSpq8b6aZYnYlMWfPdwU1gKC1RhIioEi5VharjXf2Lcndhg9+i8kh8cajN0VW+zx9oIN+d7EHqZUa1dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BLAPR03MB5476.namprd03.prod.outlook.com (2603:10b6:208:29b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 03:28:41 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%6]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 03:28:41 +0000
Message-ID: <801bea69-fd52-40a9-8ac4-8be5b7e425eb@synaptics.com>
Date: Thu, 24 Nov 2022 11:28:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
To: daniel@ffwll.ch
References: <Y35Nbhd/fhESOFeU@phenom.ffwll.local>
 <48867317-C751-4339-ADA6-6AF88A7FB9AC@synaptics.com>
 <Y35YDXZ5G7l2EWRa@phenom.ffwll.local>
Content-Language: en-US
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: <Y35YDXZ5G7l2EWRa@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|BLAPR03MB5476:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ab2c5c-bb9d-4ccd-ce6c-08dacdcbfbaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GvJEPjs1VC65E8FBqgpFiZ0c8ZBk7tdAYo0S89vXYNV9I9fXfiutbsEiglThi7VpZTCrbV8NUT3gxUjUY6IysHQhIUCs2D1ByOT8c7WzkOrWteXqqLl01SL9HcpDKVa4JlVu8wgFBhc01Mi7ssVPWiRIyuw51F8CSqN3oJ5triWSuQSPBWNmuCgnh4DsxIPhWptKsJf2uVt+tlKeYri085N8U+xRCpomkHXWvftfQMrNpCB+M/3/4yCScxK3U7CqZ6ehlFa0anNn/fjZbjmh/6XxNVLmPsI3i8TrDANnOPNdFqfkZxOQ5g6kgVXzFFiKlNov6MWZZ/jbwyk1OA9U3AMZCv38QTb1XSwrv9WGM4/2u66zewCD4kJ6x81zxDKr/NRP+nVS+4XRL8sLS4blK0TrFyAfDlkyPl/s9XJ7iu0NmYZuOfLS3yYVyaFzTvwxxpPYz77kPcMdYtbjBdWF5tKZI457QYmnejE1SqUkbTocrUkLWq9Q20+vdLohgBCfljQAJQlyEMCXOgO/VldE5rRPBd7RLsDKjOgPtWtPdHobx5jCMli6+vBNcPsZlFrrUsYpBCi/mJBTau08+arRISFgxVK1FipyrlpKLO32hB+oEswpy7T2xrOVSY0i+eQYkndI0bUX1YzBvPg57rTru89tGoutBSYg2IdVA4LMo0cckfMilbBcWeL+lmOHuVEGSAiZMLu8dVONCYesaqG1U6PckRvrNXqNB0um9PyXXxoBUIbeYljIuQ2BeWhHbt7Dx8RaSIHH6YQ5nNVT14NefOriDLTRlo9C2xSm916nsCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(39850400004)(136003)(376002)(451199015)(2906002)(86362001)(31696002)(316002)(83380400001)(54906003)(6512007)(6916009)(6666004)(53546011)(52116002)(26005)(6506007)(6486002)(966005)(186003)(2616005)(478600001)(8936002)(7416002)(5660300002)(41300700001)(38100700002)(4326008)(38350700002)(66476007)(8676002)(66556008)(66946007)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzJHa0d3N01rdFQ4dEVTWExMc3hFd1ZKcUlxbi9YakEwdVBXQlZFcGZ3YWJ2?=
 =?utf-8?B?bEN1T1l6dTkwRTBqTStwMytlVGcveHZzdjM0bjZkVlR5cE12bENxMFJ6R2dy?=
 =?utf-8?B?VTBzK0pYdERGc01rQk5pYytyM3VtRjdZc255V2dvcktlckI2ZnNQYkRLRk15?=
 =?utf-8?B?S3FzOVhHRTNXQ2RsN1g0L1BUclJtNWhkRVk3RnFrYy9TZWxwNHBQSWx3ZXl0?=
 =?utf-8?B?aDI4TjcyeGdMWFNERm5mUW9MUzF2YlREUVRTZC9NajdFdkRZYXMwZ0cyanRl?=
 =?utf-8?B?RkVTNEZKSGFwMlRhVUFJNi9mbUdoNU81L2pxdjRuaFVvaVFMdS9hTjBmV3cw?=
 =?utf-8?B?Qkk4RHYrdXovcnp3cTRDNS9vWHNaSHNvcHA4OGpLeHErV0phKzFzaE1CeFY3?=
 =?utf-8?B?R2EyUTZpS3JwWW5OK0hTTkwweEFoME1GYnUrQUVMeDA1bjZWYkVOVllSRUFv?=
 =?utf-8?B?cjZaa3RCTEZWN1M5MVhsVU95dnhmdFc3a0NqVmdJZWRXcEY1a0x4U0RtVXhh?=
 =?utf-8?B?ci94R2FRa1Z6am1QMWl3ZlVlZHdXTFpHbTNNMUNhQkNyR0ZvZEVmZXFHMlF2?=
 =?utf-8?B?em5pVEZSMVg1WkR2bE1KWGRmRlVxT3N6YlBkWTJqOFR0OW9zaGRqVkhxMUUv?=
 =?utf-8?B?NU5uV1dwMW9MZ1pCalFhK0dtZ0hVZ3NVbS9nNXZ1RVdtdDZYZlp3SXdNTFBK?=
 =?utf-8?B?MnlRSXBZT1FIOGkrcVZKeW5qUTFsUiszNkNPU0dISE9MbXVZcVNSdlU4RENW?=
 =?utf-8?B?Mjc1VDFERGpsNTlRUkt3TVFudGk1a3l5SCt0UEhBYTJaT2t3aVBqNURqamxR?=
 =?utf-8?B?SldGMU1BL1VyQkNKSlFQa1ZnaHRvMnpueHhVZktJWjNlaStlU2Q3RVNVVDJT?=
 =?utf-8?B?UENCanVZeVZoT1luL1JyZWZoTWQ4ZDhEWUFSZ0pBRnJpejBIaCtRaUhCbFZl?=
 =?utf-8?B?TDBmdDVKYXovT0swUnZVVUZRT1RJcjdCSlIwMkdwNHZERysvdFVBR3RiWTQv?=
 =?utf-8?B?YVc0V09nL3I2anUwNDI0RHVQK3ZGNERSenRVUVlUcFNhWk9xN0x0YTkwWnhV?=
 =?utf-8?B?UTRIZEIyRHFtVUdFVVBXZGQ4eThlWXN0YXZHNVhqL1dFS2V1TG1oNG55QTBo?=
 =?utf-8?B?T1JCaTZkLzYvU3hPdVM5SUltbzZKZmhNR1V5dHBGbjVnZjVLRHh6NU10cXh6?=
 =?utf-8?B?Rk9BV3Y3NnM1TWVXZnRJdkc3Yk1hOW5VK3kwRnRHQTZSd2hjWTBwRHVOQTRL?=
 =?utf-8?B?TGJsZm5uMXg2Z0Y3N3BsM1hsMzA5cDZWS1hBLzh1dDBjclpFOVhSd0ZkOHpK?=
 =?utf-8?B?S1I2K1FLRGdLamtWZUl3Uk5TUW0zOHdqRURwOTQ5eTdkQjVNRlUvdUZQODgw?=
 =?utf-8?B?emp3bDUxcVpHNFJvdUhjYXpKQVFiSVM4cWxNOE9Fd3AxM0RPT3pKcVlLUHVD?=
 =?utf-8?B?K040VFdxMHZMdE9wMzlPMkNsK0Jha0NyNmxFcVQ4Zm1VdjZFK0dlbmtHVEFI?=
 =?utf-8?B?bGFGVjI5QkphTWgwZER6ditPaGVRekNobkJlS3hvZlBiNlAydDRBZVlrSjFD?=
 =?utf-8?B?NUVRNjFXME5lUnVyMEpQdG85c2lpYkw3MGVlTHBLRjJpVVl5QllkSXc4Yld3?=
 =?utf-8?B?TnFONy92QzZmeGk0MUJDSGlmR3U1SjNrOE4vRUNQN0I1cTZzY3E4S3VnY2pu?=
 =?utf-8?B?MEVEMUFsWWRuQnVGYWMyRzJYZDlBRWJZMDYzYWVCdjYwdDlIbnF6clovRElp?=
 =?utf-8?B?aG5NRFN6enBNUWZ3M01MZi9wdjFmRzNCSDgvRjZ4UE56VFhuaEkzK2MydEdY?=
 =?utf-8?B?dHVWaXZoK3YwSDJPbzBYRkZoYWYrSTQ5NjIvRWdZWTgrRkN2SVpGNUczcVRF?=
 =?utf-8?B?bHZWTFNSbXpyYVVKQjVDV2ZXWUZnY0VMSzRsdlpMaHdpeFpFeUd5eEhNMHZ1?=
 =?utf-8?B?ZkthNjZPamZxQUZ3Tk1RUlY1Nm9JcmVqVklnSzdOd0JFMVNqS1djY3FtZmRl?=
 =?utf-8?B?eDJETzdQTHhkd3J0TW1FakJkWlFOZkg0RVp3R3RFYlc5OFN3Y3BDbXd6Y2U2?=
 =?utf-8?B?SXlzTHlpQWx2RTdUNkdVYTRYZUM3bkZtbFVzZmJkdThReTJhaE5EME4vbUxk?=
 =?utf-8?Q?t42YkTOFMDcXnBmV4xQDv9ucN?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ab2c5c-bb9d-4ccd-ce6c-08dacdcbfbaa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 03:28:41.2395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+HMo2C3I8QSj5/h0xKlY2y+cN1ZrZNTdOlIWv2sHLWPJfmnJkSElcRk+2OpTJmNq6BNLcnDtU9zHCAmQRI8Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5476
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
Cc: nicolas@ndufresne.ca, sakari.ailus@linux.intel.com,
 Jisheng Zhang <jszhang@kernel.org>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, ayaka <ayaka@soulik.info>,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, helen.koike@collabora.com,
 linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
 tzimmermann@suse.de, ribalda@chromium.org, sebastian.hesselbarth@gmail.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/24/22 01:27, Daniel Vetter wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Thu, Nov 24, 2022 at 01:14:48AM +0800, Randy Li wrote:
>>
>>> On Nov 24, 2022, at 12:42 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>
>>> ﻿On Wed, Nov 23, 2022 at 10:58:11PM +0800, Jisheng Zhang wrote:
>>>>> On Wed, Nov 23, 2022 at 05:19:57PM +0800, Hsia-Jun Li wrote:
>>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>>>> Memory Traffic Reduction(MTR) is a module in Synaptics
>>>>> VideoSmart platform could process lossless compression image
>>>>> and cache the tile memory line.
>>>>> Those modifiers only record the parameters would effort pixel
>>>>> layout or memory layout. Whether physical memory page mapping
>>>>> is used is not a part of format.
>>>>> We would allocate the same size of memory for uncompressed
>>>>> and compressed luma and chroma data, while the compressed buffer
>>>>> would request two extra planes holding the metadata for
>>>>> the decompression.
>>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>>>>> ---
>>>>> include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++
>>>>> 1 file changed, 75 insertions(+)
>>>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>>>>> index bc056f2d537d..ca0b4ca70b36 100644
>>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>>> @@ -407,6 +407,7 @@ extern "C" {
>>>>> #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>>>>> #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>>>>> #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>>>>> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>>>> Any users in the mainline tree?
>> Not yet. I believe a V4L2 codec would be the first one.
>> Still there are many patches are requested for v4l2 which currently does
>> not support format modifier. You could find discussion in linux media
>> list.
>>
>> This does need the agreement from drm maintainers, three of us tend to
>> drop the pixel formats in video4linux2.h only keeping those codec
>> formats in new extended v4l2 format negotiation interface. All the pixel
>> formats should go to drm_fourcc.h while we can’t decide how to present
>> those hardware requests contiguous memory.
> 
> Uh no.
> 
> These enums are maintained in drm_fourcc.h, by drm maintainers. You
> _cannot_ mix them up with the fourcc enums that video4linux2.h has, that's
> a completely different enum space because fourcc codes are _not_ a
> standard.
> 

Things us in v4l2 try to solve is the those non contiguous memory planes 
in v4l2, we don’t want to increase them anymore. Besides the values for 
pixel formats are the same between V4L2 and DRM.
> Please do not ever mix up drm_fourcc format modifiers with v4l2 fourcc
> codes, that will result in complete chaos. There's a reason why there's
> only one authoritative source for these.
> 

In the previous version, it would fail in building, because a driver’s 
header(ipu-v3) would included both v4l2 and drm. I can’t add another 
format modifier macro to v4l2.
If DRM doesn’t like the idea that v4l2 use the fourcc from DRM, I should 
inform people about that.
>> We don’t bring those NV12M into drm_fourcc.h, we hate that.
>>> Note that drm_fourcc.h serves as the vendor-neutral registry for these
>>> numbers, and they're referenced in both gl and vk extensions. So this is
>>> the one case where we do _not_ require in-kernel users or open source
>>> userspace.
>>>
>> The first user for these pixel formats would be the software pixel reader for Gstreamer, I am planning to add the unpacker for the two uncompressed pixel formats.
>>> If there is someone interested in an in-kernel or open userspace driver
>>> though it would be really great to have their acks before merging. Just to
>>> make sure that the modifiers will work with both upstream and downstream
>>> driver stacks.
>> This patch have been reviewed internally, it is good enough to describe our pixel formats.
>>>
>>> I just realized that we've failed to document this, I'll type up a patch.
>>
>> About the format itself, I have sent the document to the mesa, you could find a MR there.
> 
> Please include the link to that MR in the patch description.
mesa !19921

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19921

I would like to do that when the document got more reviewed.
> -Daniel
> 
>>> -Daniel
>>>
>>>
>>>>> /* add more to the end as needed */
>>>>> @@ -1507,6 +1508,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>>>>> #define AMD_FMT_MOD_CLEAR(field) \
>>>>>    (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>>>>> +/*
>>>>> + * Synaptics VideoSmart modifiers
>>>>> + *
>>>>> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
>>>>> + * within a tile. GOT size and layout varies based on platform and
>>>>> + * performance concern. When the compression is applied, it is possible
>>>>> + * that we would have two tile type in the GOT, these parameters can't
>>>>> + * tell the secondary tile type.
>>>>> + *
>>>>> + * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to store
>>>>> + * some compression parameters for a compression meta data plane.
>>>>> + *
>>>>> + *       Macro
>>>>> + * Bits  Param Description
>>>>> + * ----  ----- -----------------------------------------------------------------
>>>>> + *
>>>>> + *  7:0  f     Scan direction description.
>>>>> + *
>>>>> + *               0 = Invalid
>>>>> + *               1 = V4, the scan would always start from vertical for 4 pixel
>>>>> + *                   then move back to the start pixel of the next horizontal
>>>>> + *                   direction.
>>>>> + *               2 = Reserved for future use.
>>>>> + *
>>>>> + * 15:8  m     The times of pattern repeat in the right angle direction from
>>>>> + *             the first scan direction.
>>>>> + *
>>>>> + * 19:16 p     The padding bits after the whole scan, could be zero.
>>>>> + *
>>>>> + * 20:20 g     GOT packing flag.
>>>>> + *
>>>>> + * 23:21 -     Reserved for future use.  Must be zero.
>>>>> + *
>>>>> + * 27:24 h     log2(horizontal) of bytes, in GOTs.
>>>>> + *
>>>>> + * 31:28 v     log2(vertical) of bytes, in GOTs.
>>>>> + *
>>>>> + * 35:32 -     Reserved for future use.  Must be zero.
>>>>> + *
>>>>> + * 36:36 c     Compression flag.
>>>>> + *
>>>>> + * 55:37 -     Reserved for future use.  Must be zero.
>>>>> + *
>>>>> + */
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED        fourcc_mod_code(SYNAPTICS, 1)
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
>>>>> +    fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
>>>>> +                 ((__u64)((m) & 0xff) << 8) | \
>>>>> +                 ((__u64)((p) & 0xf) << 16) | \
>>>>> +                 ((__u64)((g) & 0x1) << 20) | \
>>>>> +                 ((__u64)((h) & 0xf) << 24) | \
>>>>> +                 ((__u64)((v) & 0xf) << 28) | \
>>>>> +                 ((__u64)((c) & 0x1) << 36)))
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
>>>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
>>>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
>>>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
>>>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
>>>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
>>>>> +
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
>>>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
>>>>> +
>>>>> #if defined(__cplusplus)
>>>>> }
>>>>> #endif
>>>>> --
>>>>> 2.17.1
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__blog.ffwll.ch&d=DwIDaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=MGl40tua4_XwHXeBMgk_8hffHo5og9goZOWs0NTaFEOVNt4EnfL6XjISa0JSiK_j&s=FeAOQAovXW3Vm03VKTY8ysPZY5rW-2Jd_vgrxgIgGo0&e=
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://urldefense.proofpoint.com/v2/url?u=http-3A__blog.ffwll.ch&d=DwIDaQ&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=P4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=MGl40tua4_XwHXeBMgk_8hffHo5og9goZOWs0NTaFEOVNt4EnfL6XjISa0JSiK_j&s=FeAOQAovXW3Vm03VKTY8ysPZY5rW-2Jd_vgrxgIgGo0&e=

-- 
Hsia-Jun(Randy) Li
