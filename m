Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C136373E8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FF110E69D;
	Thu, 24 Nov 2022 08:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C063E10E5D9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 18:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzRY8JS7z/DjqZ0wqwyrwpDY8DDaf2PzNerUtWwb/MUZEvuCACsaoHop3Wt87nJXXXttwfIlE03E6C36V6UPxuYWFBE7s94uGKaoOdmksSxDuHvXYBJLrtupAdT5fWuqyAnZlnQMOaA1p25y0Ss8iFT8C/ChQc1NMzFjBNTWNlBp9zHYM2nSegFAtDzwYFQSVRqXUSCORevNNW1/hztIe7+Ae3FqcwpICbq9Vy8Y38Npffbg+vxECyejTkOM3MTmrxz2yWQeSSCM4fxubYtVrN9oMSbGL31xBiZkBsjjiGSxJY0sRlcRkv2oaSULkCnnP/9W7a+yVCdtuBIFmLqIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zT7XsHHRHusln+NJ/AaE8Lgr/zaBAIYJcndqIJrYV0=;
 b=AXgBq7wrnMXS5vrSGqpafqDardzbLY1oKfbGsdYuYcU2quy3FeyeXJMsVH9BNIaoIUBAWQwUF2LwCH/UdVc/m7K+QoT/6e/TqQLg1sXAwK0vQfTvm2smEbb/c4MfdEZkA2drbgMRMuTFeoxpZN8W3PYphk+jqV931eKD5GGVXvU1/zjmGbBmbdYl0FvU3L5I2W5X8j3XsacVoGgLaQX5PTqzq7PPgFDE+vdF0yp4FFXOTiT2VIueaTp26ahzFeYNLrqTAfxzUyEjYVjlY9NDQMr+zeReZUUzEZXkRkUuFV7mhj/fMBVxSeKL3X7KGOr/descIRmU6/2kspnBzCg+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zT7XsHHRHusln+NJ/AaE8Lgr/zaBAIYJcndqIJrYV0=;
 b=c2152pIweCuaN5mvneIvIswdA25Bbq4wwNMnUjInrh1gFfPFT2Y/VBehR5rxW6/Uqdufzj02MKXISAGL9Z1uyeZ8tR9f6bDmv/LDVgHW+5IaW91w7m9YWT6ITxJrkdn9P6Nxikegq1vQN+BoIuEPCVIPYSnWE4l6Xy5l0HY6Vk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MW4PR03MB6620.namprd03.prod.outlook.com (2603:10b6:303:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 18:06:33 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%6]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 18:06:33 +0000
Content-Type: multipart/alternative;
 boundary=Apple-Mail-3F569FA6-8FF1-4654-A37C-BB0C094BE881
Content-Transfer-Encoding: 7bit
From: Randy Li <ranl@synaptics.com>
Subject: Re: [PATCH v4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Date: Thu, 24 Nov 2022 02:06:27 +0800
Message-Id: <1A9F4228-DE6C-49D0-AF06-8A506C5E4B3A@synaptics.com>
References: <Y35YDXZ5G7l2EWRa@phenom.ffwll.local>
In-Reply-To: <Y35YDXZ5G7l2EWRa@phenom.ffwll.local>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailer: iPad Mail (18D61)
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MW4PR03MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 07773bb7-8298-4183-a959-08dacd7d740e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ipVXx5ZL+IOCv/OYoMh50o5CaYkD5p85pGUFZL5+UMWEy3BBBjOVEdOhXBMpaYQSczS5HH7Coqden1vynohNTAZtFGa3hEthGIf0QQSKOuH2mFAGnGLbDaYIR/ahuFx0wxfdjsaP2eilhEF4RW/zSXcBKayBbWx3ofoVrp2DOfdyTSUDVyFZpKvbPJ4NYL+fKBneyoDnK4CPSYigiFB93cYw2EZEMIH6NOJmjtURiBe1LygrXpyMMqdf5TSkzh12XTLviNg/Ptb5iaOipcRBN7BIpX2c+Knk7CZUaGuLa5Ojy0t4EZCYLUdbHQQQ2HbnPtjK5vYDQoAiGA1GTpPH9dT+v2X1AY4omH8HUroihilbnCV9NRMwjdM0QcVjo4oikjDfT2E9AasCEFjR7XnYMQmEgPZVtR5vy+HFdT8NmBZ/Mb/CvYelm1T2t0qqEhYmhCYqnjs0N6Xl/rXf6fGm4NanJdv03AlNwX78c4GySuccYq2rzbiWoKel+LWHUFUvuggXLZrW8nPwsi7/Hi7Vh+wR4cq4LFpQqPaTfVftdJsI3qQBC9Na1xY0pm9KdOEsFq2C4oIZhLOHzmgvcPWYlopDWWpwRARIKCAiyduvspPgAHxxe4igaEot/z7h3yRJIBNZJfJMCpMHw8qBLXQt5QYm9YVnpPCcl0KfXl4U9uzLi/cwe2xWJdV0Pz18reWaoppIe5ILh4hE8aNq6cEm/Z6VDQdDgI+0EUH4nZXk5Jk9mdDfJN/7V8KsgCkc6Rro
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(36756003)(26005)(166002)(38100700002)(38350700002)(186003)(2906002)(6512007)(83380400001)(30864003)(54906003)(6916009)(33656002)(8936002)(5660300002)(52116002)(478600001)(66556008)(6506007)(7416002)(966005)(53546011)(33964004)(2616005)(6666004)(41300700001)(316002)(8676002)(6486002)(66476007)(66946007)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9xWDJOOEwveEc1dHZRdkY0empyRVZUUGFoZjN3TVJZL1ZMbmFmdElCVll1?=
 =?utf-8?B?REdqTHlPWGJSZmdjWlZNYzN3WFhDRUJRaGZHU0p5SmNMMEg5Sit0NkNvRDgv?=
 =?utf-8?B?QWV5UjBIZDNNaEFJcGRWYWVoZ3k3MC9PZU0xUEhLdUFNSDFiYk0xVU01VmtT?=
 =?utf-8?B?dWZYM2hTNVRpaHI0d0NTQ0V2OVMzcmJpNGM4WlQ2ZDZwZGVJRzBHNkJsZlh5?=
 =?utf-8?B?YW9DNkYya1E4TTNIVGIwcEZsajNBVjJROU9hd1dKTWI3dHdQVVJOajhhUVV5?=
 =?utf-8?B?Zzh1MVp2TkdOQklKT1NVcWtUOFplMlR6bXY0Z3BuR2pZaWQyT1JqNVFYSlpP?=
 =?utf-8?B?WXZHYzBEdHJSb2l4QkdncU5QWFNQbFQ3cG84OGVjQVZ4YW1uc1AyRWZxTmYw?=
 =?utf-8?B?WUJaTW1pWldOLzZWZ3ovTUlHWFdxUEM1dEt1WXhyY1phNmtOcm1kc0ZQSlV3?=
 =?utf-8?B?K0ppdFQyN0EvaGdGeWhRbHI0NUVHMmk0UGszV2E2UWdXVFd3UHgyTlI2K0tF?=
 =?utf-8?B?S05WQWJxcmJwbWtTTjRmNW1Wb3hkc1pKWEMraTdMMHFDbGw0QnJuM3F2N3dx?=
 =?utf-8?B?QVBZenpnTHdPbTRpZEtHVzEwaEZMUzdUbnpSdjNBN3p5TUludkZ0emhxUDRn?=
 =?utf-8?B?dGhJNVQvY3hyRGxKMjlBZm9YdzhZMHhYM2pMTFdiMmcxN25ZUFNoM3NHU1dK?=
 =?utf-8?B?MTF4TGlvVUVuWTdRUGFHSlpiWXg4Z1hXd3R6dHFTb013U21PSmFzOU04ZXp5?=
 =?utf-8?B?ZmtJMGNmMU0xNXg1OWJMOFJ0Yk1sYjBuMXljK2t0TzNBM2Mxa0VNa040SFN1?=
 =?utf-8?B?K1pFNUpiVkhlcjVUVTFlckRmUVZ0d3pMbXVWa3pGa2xPck9NYVZMODN2c0to?=
 =?utf-8?B?S1h5VVAycTZHeGdGN3lmanhOTmVSMTBmdUdJblBRcGFHdWxaTU5ROThHdXdy?=
 =?utf-8?B?ZGpycGtGQUVZQmRKbXZUalhuc0hFbDZkT0ROMEE5VlFkSG9DcUpLVS95WnFz?=
 =?utf-8?B?NWZ1akFrOHYyZXlsNm56Z2QyZm03WEFheG9rWmMzaHplditYWE1LeC9aN2dt?=
 =?utf-8?B?cHRQRXU0WTE0aDc4dDZWSWh1b24zOVlTK0F0b3FyL1RnMjZtVEV5aW4zdmlk?=
 =?utf-8?B?TDVlREw3ZnNZRzM4Y05JdFRyWC92WEc3bWs3TnFDSHV1VGVnNXZPTTV4ZEI4?=
 =?utf-8?B?U2lrTEFvQndRNmtxTmEzOHNKRGFPOUxvQmxmNmVpK1Jjd2o0UEo5SWl0Vjd0?=
 =?utf-8?B?blUvSGhxTThiREUrTFJoR0YyQVplS0p0YVFJMnpBT3VQL1M4TEhndjFzd0N0?=
 =?utf-8?B?VHJZOEtsUVVVZXBXUjdtYlFReHl2b3lWRjVwZm9mbFlFYi92eGR0OVhoTVBG?=
 =?utf-8?B?YUNtR092N3ZiMk9jT0FvYzM5SUF1MS90cmR3SDgwa3NUekFsNThJb0pzRk1p?=
 =?utf-8?B?MCtkWFRSaTZHdjB5M0xmMnNic05rRGE4VHgyN29VV0NMcERLdTdZVkJYalBy?=
 =?utf-8?B?UjZxRzVIVjM5SmdKNHk2YmpyU29aRC9CMlBnTWdCektiK3pseWdYaXB1bElv?=
 =?utf-8?B?L2Izb0hDa3lqY1hua3F0dXlxOVZ4VzVxVkhqaHFoRERZUExydUZuNU91RzBy?=
 =?utf-8?B?ZFowcHp4MmY4c2ZOZTFHcjFJOGt1ckJaYXlLajZ3QzN6czEzN095dGdiV01R?=
 =?utf-8?B?MW5RY2xac3JWYmhXM1h6bC84OWVwNzhrbnovMzE4czR3U2hhcGRQM0l2VXJM?=
 =?utf-8?B?dUhXNUNNZUFDOEZYQjFCajdJKzlUTlIwNE02TW5zY1hXdE1LL3RBMHpBcEM0?=
 =?utf-8?B?L3lDd1NZQ1VPa1loSlFlSnR2ZWtrVVhHcXpqMmJzZGpxTlczT2k1OGp0WEVK?=
 =?utf-8?B?OHNJV2V1UnluUzBPVWFDSVhQYTUyWm1nVUt1djAybFNsSFB5RkxYckwwbC9l?=
 =?utf-8?B?MTA1U253OEtjY2s4R3UvbXJOOVh5R3A4V0RWUkI2dFl0cVpMcnNobXRIT0hM?=
 =?utf-8?B?ajhyQ0dYM0lhbTR4MXY2aFFudnp2cXozcXJKUUxxUUFueXdTL0JUemhpUXkv?=
 =?utf-8?B?NTR0RlY0QVEvaWp1MzIzUGUrajJlaWc2b0o3WkVIc3JJWHR6S01HQmJYQ05W?=
 =?utf-8?Q?mff62PoTsk/W84/pZd9Z9WwxS?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07773bb7-8298-4183-a959-08dacd7d740e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 18:06:32.9320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwJGR2Eu9ltznsauvCgeCi+KXcUzfJ/iQAJvYNqNLAHOY01RQSeEAk4Lhs01ubLPLrxpopYHviAUfENVXSGxTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6620
X-Mailman-Approved-At: Thu, 24 Nov 2022 08:30:00 +0000
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
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, airlied@linux.ie,
 tzimmermann@suse.de, ayaka <ayaka@soulik.info>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 Hsia-Jun Li <randy.li@synaptics.com>, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, Jisheng Zhang <jszhang@kernel.org>,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Apple-Mail-3F569FA6-8FF1-4654-A37C-BB0C094BE881
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Nov 24, 2022, at 1:27 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> =EF=BB=BFCAUTION: Email originated externally, do not click links or open a=
ttachments unless you recognize the sender and know the content is safe.
>=20
>=20
>> On Thu, Nov 24, 2022 at 01:14:48AM +0800, Randy Li wrote:
>>=20
>>>> On Nov 24, 2022, at 12:42 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>=20
>>> =EF=BB=BFOn Wed, Nov 23, 2022 at 10:58:11PM +0800, Jisheng Zhang wrote:
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
>>>>> include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++=

>>>>> 1 file changed, 75 insertions(+)
>>>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_four=
cc.h
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
>>=20
>> This does need the agreement from drm maintainers, three of us tend to
>> drop the pixel formats in video4linux2.h only keeping those codec
>> formats in new extended v4l2 format negotiation interface. All the pixel
>> formats should go to drm_fourcc.h while we can=E2=80=99t decide how to pr=
esent
>> those hardware requests contiguous memory.
>=20
> Uh no.
>=20
> These enums are maintained in drm_fourcc.h, by drm maintainers. You
> _cannot_ mix them up with the fourcc enums that video4linux2.h has, that's=

> a completely different enum space because fourcc codes are _not_ a
> standard.
>=20
Things we try to solve is the those non contiguous memory planes in v4l2, we=
 don=E2=80=99t want to increase them anymore. Besides the values for pixel f=
ormats are the same between V4L2 and drm.
> Please do not ever mix up drm_fourcc format modifiers with v4l2 fourcc
> codes, that will result in complete chaos. There's a reason why there's
> only one authoritative source for these.
>=20
In the previous version, it would fail in building, because a driver=E2=80=99=
s header(ipu-v3) would included both v4l2 and drm. I can=E2=80=99t add anoth=
er format modifier macro to v4l2.
If drm doesn=E2=80=99t like the idea that v4l2 use the fourcc from drm, I sh=
ould inform people about that.
>> We don=E2=80=99t bring those NV12M into drm_fourcc.h, we hate that.
>>> Note that drm_fourcc.h serves as the vendor-neutral registry for these
>>> numbers, and they're referenced in both gl and vk extensions. So this is=

>>> the one case where we do _not_ require in-kernel users or open source
>>> userspace.
>>>=20
>> The first user for these pixel formats would be the software pixel reader=
 for Gstreamer, I am planning to add the unpacker for the two uncompressed p=
ixel formats.
>>> If there is someone interested in an in-kernel or open userspace driver
>>> though it would be really great to have their acks before merging. Just t=
o
>>> make sure that the modifiers will work with both upstream and downstream=

>>> driver stacks.
>> This patch have been reviewed internally, it is good enough to describe o=
ur pixel formats.
>>>=20
>>> I just realized that we've failed to document this, I'll type up a patch=
.
>>=20
>> About the format itself, I have sent the document to the mesa, you could f=
ind a MR there.
>=20
> Please include the link to that MR in the patch description.
mesa !19921

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19921
The reason I didn=E2=80=99t do that is I didn=E2=80=99t get response from me=
sa.

> -Daniel
>=20
>>> -Daniel
>>>=20
>>>=20
>>>>> /* add more to the end as needed */
>>>>> @@ -1507,6 +1508,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64=
 modifier)
>>>>> #define AMD_FMT_MOD_CLEAR(field) \
>>>>>  (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))=

>>>>> +/*
>>>>> + * Synaptics VideoSmart modifiers
>>>>> + *
>>>>> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small t=
ile
>>>>> + * within a tile. GOT size and layout varies based on platform and
>>>>> + * performance concern. When the compression is applied, it is possib=
le
>>>>> + * that we would have two tile type in the GOT, these parameters can'=
t
>>>>> + * tell the secondary tile type.
>>>>> + *
>>>>> + * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to stor=
e
>>>>> + * some compression parameters for a compression meta data plane.
>>>>> + *
>>>>> + *       Macro
>>>>> + * Bits  Param Description
>>>>> + * ----  ----- ------------------------------------------------------=
-----------
>>>>> + *
>>>>> + *  7:0  f     Scan direction description.
>>>>> + *
>>>>> + *               0 =3D Invalid
>>>>> + *               1 =3D V4, the scan would always start from vertical f=
or 4 pixel
>>>>> + *                   then move back to the start pixel of the next ho=
rizontal
>>>>> + *                   direction.
>>>>> + *               2 =3D Reserved for future use.
>>>>> + *
>>>>> + * 15:8  m     The times of pattern repeat in the right angle directi=
on from
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
>>>>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED        fourcc_mod_code(SYNAPTICS=
, 1)
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
>>>=20
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__blog.ffwll.ch&d=3D=
DwIDaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGG=
PrSV6j-jf3C3xlR7PXU-mLTeZE&m=3DMGl40tua4_XwHXeBMgk_8hffHo5og9goZOWs0NTaFEOVN=
t4EnfL6XjISa0JSiK_j&s=3DFeAOQAovXW3Vm03VKTY8ysPZY5rW-2Jd_vgrxgIgGo0&e=3D
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__blog.ffwll.ch&d=3DDw=
IDaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPr=
SV6j-jf3C3xlR7PXU-mLTeZE&m=3DMGl40tua4_XwHXeBMgk_8hffHo5og9goZOWs0NTaFEOVNt4=
EnfL6XjISa0JSiK_j&s=3DFeAOQAovXW3Vm03VKTY8ysPZY5rW-2Jd_vgrxgIgGo0&e=3D

--Apple-Mail-3F569FA6-8FF1-4654-A37C-BB0C094BE881
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"></=
head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"cite">On N=
ov 24, 2022, at 1:27 AM, Daniel Vetter &lt;daniel@ffwll.ch&gt; wrote:<br><b=
r></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<s=
pan>CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.</span><=
br><span></span><br><span></span><br><span>On Thu, Nov 24, 2022 at 01:14:48=
AM +0800, Randy Li wrote:</span><br><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
On Nov 24, 2022, at 12:42 AM, Daniel Vetter &lt;daniel@ffwll.ch&gt; wrote:<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>=EF=BB=BFOn Wed, Nov 23, 2022 at 10:=
58:11PM +0800, Jisheng Zhang wrote:</span><br></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>On Wed, Nov 23, 2022 at 05:19:57PM +0800, H=
sia-Jun Li wrote:</span><br></blockquote></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>From: &quot;Hsia-Jun(Randy) Li&qu=
ot; &lt;randy.li@synaptics.com&gt;</span><br></blockquote></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>Memory Traffic Red=
uction(MTR) is a module in Synaptics</span><br></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>VideoSmart platf=
orm could process lossless compression image</span><br></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>and cac=
he the tile memory line.</span><br></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>Those modifiers only record =
the parameters would effort pixel</span><br></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>layout or memory la=
yout. Whether physical memory page mapping</span><br></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>is used is=
 not a part of format.</span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>We would allocate the same siz=
e of memory for uncompressed</span><br></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>and compressed luma and =
chroma data, while the compressed buffer</span><br></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>would reques=
t two extra planes holding the metadata for</span><br></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>the dec=
ompression.</span><br></blockquote></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>Signed-off-by: Hsia-Jun(Randy) Li &lt;ran=
dy.li@synaptics.com&gt;</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><span>---</span><br></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>inc=
lude/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>1 file changed, 75 insertions(+)</span><br></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>diff=
 --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h</spa=
n><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>index bc056f2d537d..ca0b4ca70b36 100644</span><br></bloc=
kquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>--- a/include/uapi/drm/drm_fourcc.h</span><br></blockquote></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+++ b/inclu=
de/uapi/drm/drm_fourcc.h</span><br></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>@@ -407,6 +407,7 @@ extern &=
quot;C&quot; {</span><br></blockquote></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><span>#define DRM_FORMAT_MOD_VENDOR_ARM &nbs=
p;&nbsp;&nbsp;&nbsp;0x08</span><br></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>#define DRM_FORMAT_MOD_VENDO=
R_ALLWINNER 0x09</span><br></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>#define DRM_FORMAT_MOD_VENDOR_AMLOGI=
C 0x0a</span><br></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>+#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Any =
users in the mainline tree?</span><br></blockquote></blockquote></blockquot=
e><blockquote type=3D"cite"><span>Not yet. I believe a V4L2 codec would be =
the first one.</span><br></blockquote><blockquote type=3D"cite"><span>Still=
 there are many patches are requested for v4l2 which currently does</span><=
br></blockquote><blockquote type=3D"cite"><span>not support format modifier=
. You could find discussion in linux media</span><br></blockquote><blockquo=
te type=3D"cite"><span>list.</span><br></blockquote><blockquote type=3D"cit=
e"><span></span><br></blockquote><blockquote type=3D"cite"><span>This does =
need the agreement from drm maintainers, three of us tend to</span><br></bl=
ockquote><blockquote type=3D"cite"><span>drop the pixel formats in video4li=
nux2.h only keeping those codec</span><br></blockquote><blockquote type=3D"=
cite"><span>formats in new extended v4l2 format negotiation interface. All =
the pixel</span><br></blockquote><blockquote type=3D"cite"><span>formats sh=
ould go to drm_fourcc.h while we can=E2=80=99t decide how to present</span>=
<br></blockquote><blockquote type=3D"cite"><span>those hardware requests co=
ntiguous memory.</span><br></blockquote><span></span><br><span>Uh no.</span=
><br><span></span><br><span>These enums are maintained in drm_fourcc.h, by =
drm maintainers. You</span><br><span>_cannot_ mix them up with the fourcc e=
nums that video4linux2.h has, that's</span><br><span>a completely different=
 enum space because fourcc codes are _not_ a</span><br><span>standard.</spa=
n><br><span></span><br></div></blockquote>Things we try to solve is the tho=
se non contiguous memory planes in v4l2, we don=E2=80=99t want to increase =
them anymore. Besides the values for pixel formats are the same between V4L=
2 and drm.<br><blockquote type=3D"cite"><div dir=3D"ltr"><span>Please do no=
t ever mix up drm_fourcc format modifiers with v4l2 fourcc</span><br><span>=
codes, that will result in complete chaos. There's a reason why there's</sp=
an><br><span>only one authoritative source for these.</span><br><span></spa=
n><br></div></blockquote>In the previous version, it would fail in building=
, because a driver=E2=80=99s header(ipu-v3) would included both v4l2 and dr=
m. I can=E2=80=99t add another format modifier macro to v4l2.<div>If drm do=
esn=E2=80=99t like the idea that v4l2 use the fourcc from drm, I should inf=
orm people about that.<br><blockquote type=3D"cite"><div dir=3D"ltr"><block=
quote type=3D"cite"><span>We don=E2=80=99t bring those NV12M into drm_fourc=
c.h, we hate that.</span><br></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>Note that drm_fourcc.h serves as the vendor-neutra=
l registry for these</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>numbers, and they're referenced i=
n both gl and vk extensions. So this is</span><br></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>the one case whe=
re we do _not_ require in-kernel users or open source</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>us=
erspace.</span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span></span><br></blockquote></blockquote><blockquot=
e type=3D"cite"><span>The first user for these pixel formats would be the s=
oftware pixel reader for Gstreamer, I am planning to add the unpacker for t=
he two uncompressed pixel formats.</span><br></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>If there is someone interested in=
 an in-kernel or open userspace driver</span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>though it would b=
e really great to have their acks before merging. Just to</span><br></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>make sure that the modifiers will work with both upstream and downstream<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>driver stacks.</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><span>This patch have been reviewed internally, it is =
good enough to describe our pixel formats.</span><br></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>I just=
 realized that we've failed to document this, I'll type up a patch.</span><=
br></blockquote></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>About the format itself, I have s=
ent the document to the mesa, you could find a MR there.</span><br></blockq=
uote><span></span><br><span>Please include the link to that MR in the patch=
 description.</span><br></div></blockquote>mesa !19921<br><div><br></div><a=
 href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19921">h=
ttps://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19921</a><div>The =
reason I didn=E2=80=99t do that is I didn=E2=80=99t get response from mesa.=
<br><div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span>-Daniel</span=
><br><span></span><br><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>-Daniel</span><br></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span></span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>/* add more to the end as =
needed */</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>@@ -1507,6 +1508,80 @@ drm_fourcc_canonical=
ize_nvidia_format_mod(__u64 modifier)</span><br></blockquote></blockquote><=
/blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>#define AMD_FMT=
_MOD_CLEAR(field) \</span><br></blockquote></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span> &nbsp;(~((__u64)AMD_FMT_MOD_##fi=
eld##_MASK &lt;&lt; AMD_FMT_MOD_##field##_SHIFT))</span><br></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+/*=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>+ * Synaptics VideoSmart modifiers</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>+ *</span><br></blockquote></blockquote></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
blockquote type=3D"cite"><span>+ * Tiles could be arranged in Groups of Til=
es (GOTs), it is a small tile</span><br></blockquote></blockquote></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>+ * within a tile. GOT =
size and layout varies based on platform and</span><br></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * per=
formance concern. When the compression is applied, it is possible</span><br=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+ * that we would have two tile type in the GOT, these paramet=
ers can't</span><br></blockquote></blockquote></blockquote></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>+ * tell the secondary tile type.</span><br=
></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>+ *</span><br></blockquote></blockquote></blockquote></blockqu=
ote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+ * Besides, an 8 size 4 bytes arrar=
y (32 bytes) would be need to store</span><br></blockquote></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * some compress=
ion parameters for a compression meta data plane.</span><br></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ *=
</span><br></blockquote></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><span>+ * &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Macro</span>=
<br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>+ * Bits &nbsp;Param Description</span><br></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * =
---- &nbsp;----- ----------------------------------------------------------=
-------</span><br></blockquote></blockquote></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>+ *</span><br></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * &nbsp;7:0 &nbsp=
;f &nbsp;&nbsp;&nbsp;&nbsp;Scan direction description.</span><br></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>+ *</span><br></blockquote></blockquote></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>+ * &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0 =3D Invalid</span><br></blockquo=
te></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><spa=
n>+ * &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;1 =3D V4, the scan would always start from vertical for 4 pi=
xel</span><br></blockquote></blockquote></blockquote></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><block=
quote type=3D"cite"><span>+ * &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;then move ba=
ck to the start pixel of the next horizontal</span><br></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;direction.</span><br></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;2 =3D Reserved for future use.</span><br></blockquote></blockquote></block=
quote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>+ *</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>+ * 15:8 &nbsp;m &nbsp;&nbsp;&nbsp;&nbsp;The times of pattern repeat i=
n the right angle direction from</span><br></blockquote></blockquote></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;the first scan dire=
ction.</span><br></blockquote></blockquote></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>+ *</span><br></blockquote></blockquote></bloc=
kquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * 19:16 p &nbsp;&n=
bsp;&nbsp;&nbsp;The padding bits after the whole scan, could be zero.</span=
><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+ *</span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>+ * 20:20 g &nbsp;&nbsp;&nbsp;=
&nbsp;GOT packing flag.</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><span>+ *</span><br></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ *=
 23:21 - &nbsp;&nbsp;&nbsp;&nbsp;Reserved for future use. &nbsp;Must be zer=
o.</span><br></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>+ *</span><br></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>+ * 27:24 h &nbsp;&nbsp;=
&nbsp;&nbsp;log2(horizontal) of bytes, in GOTs.</span><br></blockquote></bl=
ockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ *</=
span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>+ * 31:28 v &nbsp;&nbsp;&nbsp;&nbsp;log2(vertical) of =
bytes, in GOTs.</span><br></blockquote></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>+ *</span><br></blockquote></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ * 35:32 -=
 &nbsp;&nbsp;&nbsp;&nbsp;Reserved for future use. &nbsp;Must be zero.</span=
><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+ *</span><br></blockquote></blockquote></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>+ * 36:36 c &nbsp;&nbsp;&nbsp;=
&nbsp;Compression flag.</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><span>+ *</span><br></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ *=
 55:37 - &nbsp;&nbsp;&nbsp;&nbsp;Reserved for future use. &nbsp;Must be zer=
o.</span><br></blockquote></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>+ *</span><br></blockquote></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>+ */</span><br></blockqu=
ote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><block=
quote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>+</span><br></blockquote></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>+#define DRM_FORMAT_MOD_SYNA_V4_TILED &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fourcc_mod_code(SYNAPTICS, 1)</span><br></b=
lockquote></blockquote></blockquote></blockquote><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>+</span><br></blockquote></blockquote></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><blockquote type=3D"cite"><span>+#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D=
(f, m, p, g, h, v, c) \</span><br></blockquote></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;fourcc_mo=
d_code(SYNAPTICS, ((__u64)((f) &amp; 0xff) | \</span><br></blockquote></blo=
ckquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;((__u64)((m) &amp; 0xff) &lt;&lt; 8) | \</span><br></block=
quote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;((__u64)((p) &amp; 0xf) &lt;&lt; 16) | \</span>=
<br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((__u64)((g) &amp; 0x1) &lt;&lt; 20)=
 | \</span><br></blockquote></blockquote></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><bloc=
kquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((__u64)((h) &amp; 0xf) &=
lt;&lt; 24) | \</span><br></blockquote></blockquote></blockquote></blockquo=
te><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((__u64)((v) &=
amp; 0xf) &lt;&lt; 28) | \</span><br></blockquote></blockquote></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;((_=
_u64)((c) &amp; 0x1) &lt;&lt; 36)))</span><br></blockquote></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>+#define DRM_FORMAT_MOD_SYNA_V4H1 \</span><br></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&n=
bsp;&nbsp;DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)</span><br>=
</blockquote></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>+</span><br></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>+#define DRM_FORMAT_MOD_SYNA_V4H3P8 \</=
span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(=
1, 3, 8, 0, 0, 0, 0)</span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>+</span><br></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+#defin=
e DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \</span><br></blockquote></block=
quote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp=
;&nbsp;&nbsp;DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>+</span><br></blockquote></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>+#define DRM_FORMAT_MOD_SYNA_V4H3=
P8_64L4_COMPRESSED \</span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;DRM_FORMAT_M=
OD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)</span><br></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><b=
r></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>+#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \</spa=
n><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1,=
 1, 0, 1, 7, 7, 1)</span><br></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>+</span><br></blockquote></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+#defin=
e DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \</span><br></blockquote></=
blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &=
nbsp;&nbsp;&nbsp;DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)</sp=
an><br></blockquote></blockquote></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+</span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote typ=
e=3D"cite"><blockquote type=3D"cite"><span>#if defined(__cplusplus)</span><=
br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>}</span><br></blockquote></blockquote></blockquote></blockq=
uote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>#endif</span><br></blockquote></b=
lockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>--</=
span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>2.17.1</span><br></blockquote></blockquote></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></=
span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>--</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>Daniel Vetter</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
Software Engineer, Intel Corporation</span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>https://urldefense.=
proofpoint.com/v2/url?u=3Dhttp-3A__blog.ffwll.ch&amp;d=3DDwIDaQ&amp;c=3D7df=
BJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&amp;r=3DP4xb2_7biqBxD4LGGPrSV6j-jf=
3C3xlR7PXU-mLTeZE&amp;m=3DMGl40tua4_XwHXeBMgk_8hffHo5og9goZOWs0NTaFEOVNt4En=
fL6XjISa0JSiK_j&amp;s=3DFeAOQAovXW3Vm03VKTY8ysPZY5rW-2Jd_vgrxgIgGo0&amp;e=
=3D</span><br></blockquote></blockquote><span></span><br><span>--</span><br=
><span>Daniel Vetter</span><br><span>Software Engineer, Intel Corporation</=
span><br><span>https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__blog.f=
fwll.ch&amp;d=3DDwIDaQ&amp;c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&=
amp;r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&amp;m=3DMGl40tua4_XwHXe=
BMgk_8hffHo5og9goZOWs0NTaFEOVNt4EnfL6XjISa0JSiK_j&amp;s=3DFeAOQAovXW3Vm03VK=
TY8ysPZY5rW-2Jd_vgrxgIgGo0&amp;e=3D</span><br></div></blockquote></div></di=
v></div></body></html>=

--Apple-Mail-3F569FA6-8FF1-4654-A37C-BB0C094BE881--
