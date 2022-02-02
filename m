Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA24A6DC7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8331010F75F;
	Wed,  2 Feb 2022 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4B510F6D7;
 Wed,  2 Feb 2022 09:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZ2Ow2mCGjMWCNch6uX32gQ+0BdIqPdoFckIcX1mDNChqi1x66Mpoa7ZnYPVVq4cFAoyzessNlRk//eHPBQwaAjCnUCHQ5UgtcAh8xtKJD1gy6UNLhiypBZhByOChc1+XJdaxzhTIwo/FjerjiwqtNb2tkIGdTWPNYSyjnsgAuEzi27YcpKm+tS57TD+GbZt/WnZ+d6Dml+/ErzexWFotCeVUdCqbiLXCwReLXAlVv5BxbW4Wn1I9NPN0ZYoMXBXgycpUs8oviCcOvgNKNHD5cJDDVpos2pwheeTcxsxw8DqXBx+EkfQNlkSUfKom7/YQVQi+DcMzsL21Bd/HSo7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQytfyMc4gjsF1ctlClUp8zxogILTnwVEFVm76O+oSM=;
 b=PkC+tC9qLpRhQTu2zbPkL6JwE0PXsZw9U3Mb601ipn4PMsQ9R7OAox3Q2zXYoIOS/7o6sYk0bR25oKybYyQ14WF4DE9GBgMTwdqoyIZq/1yzSSG10I6TtPFVlZFqFvfSuJ8bGAES6T9WiAXNE+FyXKLa9VKUxzpyI5tqbrX9myZxSnwVnXDHYmbYmL6mClkjlm0lvHWpHJ9tn9tXgZ9F/pFgLd9s6U/2m7ZI6OTRnDaAQUnHQg9qowQwyBBTlyyVjXJ/u+ZP/dqthZctySBss9XkLbvaDrtH768boEKD9JhsRi6UjWMYILDAw/Zi8ePzAaK8ABhmys/XPPGBSvSajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQytfyMc4gjsF1ctlClUp8zxogILTnwVEFVm76O+oSM=;
 b=fmX0eE874+WNUwlk7EGVnEHrqLdjoZw7Et7IwbKpeZqSVhqlZYT0L30LP3uLLQtOhnxTtWdp0mnefCruGEf6TBg+e+ODHGLbLqEBGL+bPsuNtNdhfkS0AU3JIEwLEhjluZbV6U5sjos8I1u3C0jOAPpZQxLk0owTNvCXEAx4h5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB2977.namprd12.prod.outlook.com (2603:10b6:408:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 09:25:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 09:25:36 +0000
Message-ID: <514cdee2-655e-7e52-d6a5-a7176ee603cc@amd.com>
Date: Wed, 2 Feb 2022 10:25:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] dma-buf-map: Rename to iosys-map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220202091134.3565514-1-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220202091134.3565514-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0253.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b95ea1ff-76e4-4eb7-b7ec-08d9e62df804
X-MS-TrafficTypeDiagnostic: BN8PR12MB2977:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2977A0B49A202E5CCF16631283279@BN8PR12MB2977.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJNrgVjTNGUx2TnxGz4D7UsDrbrQ2qhc6IJSgUvGrblAj1gsmhiQoKXFSdDx5+ffq3oHXDWAn+xj0DgNQNoS7NNp1ZQrAAtt0l7mwqQOUIiT2VbbZFsAq3MlYTMrbirhv4jQZCW5WxoKcRIjk6VuOvDXskLMpyWbXjWEZsGGwKN4FPglqZL8VAABB+fxaobaRABPuQ2/RH4Dev/+UnZTUXTbHBt5LTAUfXs/dgD2rZ3RJKPrZWFrLd5JtAHSALxO62z/lCfxdlRUYCpcU9HrhcM/ICbx8h9zwP8NLFdzSsV/ua91zh7rHPvjciMPjMuaXrsVpnSHkL3ld/LJrVkUioLVWhzuzC8Jjz7KUulgBiLHfrxesMOHRGyfsxWkcZu2qxIs583cbK9qmdLHJiAQYvX4uFjaDM94rjLDqnXJSbh8pg1FfCiQ7dhGXBnIEHl9HBT80JE2V8m+w/LIfHHVLIemq5OkmwQwh6WLcb0OAb0A7lRIMyzKNcna0a5j6DsDQFr2Q5a0N/80UPBpgrnLDd6xxJZIzy87OdK8Drz+QMwR7caxBjjuv2P7ByrPMNkm3DZ5s7LD5FMw3wc4hWn4s5V+WiWYs45D0N0QXA0RxArN1613X+kZmpO99nQZ/CEsY1IWTvDTf/sjTXiNeXWoKr6Yztzg3MpmyMOVWMBvCzg+noCAp6JBF7dh5hLnEm/8yd9DiyrIq7bYdqWbKjC0EiNT+ZULIAbaEdJ+jtQf/oa/8WpSXgk8RIXxwhcIbJCZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(66946007)(8936002)(66556008)(66476007)(5660300002)(4326008)(8676002)(86362001)(31696002)(38100700002)(2906002)(26005)(186003)(2616005)(508600001)(6486002)(6506007)(6512007)(6666004)(316002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2hDQjhvUmJaejI1Q3NmY2NqOHROQVhQREl5TUpkQW51QUJndjBHWllWcmNN?=
 =?utf-8?B?VzMzbDJON21nbERaU0JlZkpBaWhLUWhxbGV5c1FpcnpHbUtNSEx1YzVWL2F0?=
 =?utf-8?B?VTJpdVE5WVVaUVlseVpxN3Y5S1ZsWEYvZy9SUUxrK2JRS2o0Q1haZm9FVTdE?=
 =?utf-8?B?aGtydzBySlFXTURmUDBjU0p2czZwbk1uR1o2S1hEWUlRMHk4M1QreTRlc3RD?=
 =?utf-8?B?M1VoM3lWRzJkK1RVdk1Mc3Zsc05Mc1haT2RtUG1pVFRVQkMzU3FkeDY3TEVo?=
 =?utf-8?B?cCsvRzZUeThWUnVlQm9ERjZJMmV3aXZNNDdtSkNTYlA5dUpKRm5SVHJ5Yk9i?=
 =?utf-8?B?bnJRRytBV201ankzT2grV1kwQVlNVXA4U09JVnpJNXh5K2UrRWVBaitMRTJV?=
 =?utf-8?B?Y2pMVklQUkV1bklwTE9tQjUyNjR1VmE1cGlLNEpFRUpONXZmS1pQYllRa1FR?=
 =?utf-8?B?ZnM4MEkycmFJbDM4Wmt0VExNTm5KRVlzVlJmL05kdFEvTGxsc05QbTNsZUxW?=
 =?utf-8?B?aHRkekVFdGtaaDVoUHpTVjgzQzNHdUZMTzVLd0VEUXRpYm8xRjg5UHVPbXpM?=
 =?utf-8?B?MkxGTXJ0cW9CVDY0SGJWajgyYzJVQ0RaV0lIQnpQYllMSnFxL0xyMUFlRGJV?=
 =?utf-8?B?UFh4ZmJZaEJoZUVNaWY0UzhBM1piUVZ2empUM2YrNGNsdkQ3U0pHYm83Y0JO?=
 =?utf-8?B?VVpPcnNlSkhtTG92UEhvVGoxa0RrdHE1QkpiVENQR2NScmVJd3N6UzBJdU8r?=
 =?utf-8?B?MVdRdERKMWxQTkVYc0xjNVgvZHZFZ216SFFld1F6TCswbDMxTm5zd3dBMDg5?=
 =?utf-8?B?UmpQdGVORGYvMUUzKy9MMTJiUy9mOXRteENzbDhoMUo5bXExK2hGL1ZxRjZU?=
 =?utf-8?B?QzVLNWhjRDZZWGNtNlJOa1pFNHRxM0R5VVdHWEhkYjVZV0xhSlBFK0UxTkps?=
 =?utf-8?B?Q3NTZjlsVEVmTU1JazlUeEcxSTVsVVBaWXpkdUp0OW9DaS8wcW54TWEySDgx?=
 =?utf-8?B?YjdHeE1WNjJ5MXZiVEY2S2xLQ2l5VDdQVGZPZ1cyOEtOUlB2UWpMUDUrOGJw?=
 =?utf-8?B?SmJMbVBBWTZIaE5IVXgyRklnaDlQYlJNdUtIaldnQzBVQ004VnZoQ2lvNC92?=
 =?utf-8?B?NzdnNEVzWFZuNzZvMGp2aUgzTU9heU1VUWhlVTBJRXVEQmp6TW5PYnBIbUlU?=
 =?utf-8?B?QWFYeGRPcSsweHY0eWtzc2w2cmhHRjEvdWxGcHBpUGtoUjRpdXFjbkJwSUNi?=
 =?utf-8?B?SVYxUjBzb2l0ZHkzRmtaVFlSOHc4WEhRcTBialRNUmJXSWxrWjV0MnlaR3E1?=
 =?utf-8?B?UkRvRFBLZHAwcVgvMVZ2M2UxUmhxbnBSSExveXltTmN1WmdwSzhiQXlyQlJ2?=
 =?utf-8?B?VTF3TzBwRVBPcmN4bm1ENEszTmtrV3lXcWI0VEdJUGNLMVhXUDZXS1ZnNW5j?=
 =?utf-8?B?bmtsbnY4V3c4bXFLd3hKcWFuSnBvdEx2dEEzNm1ZVVEydWlBVEZjd2xhRVFG?=
 =?utf-8?B?TkVDZDJrOS82L2x3MUlpOGt1SjlBdkxIR1Zkc2JXazRUVGRmU2RxWnpQRlht?=
 =?utf-8?B?aW1JTG1aSHFtTThleG1YUTRNanpBZlk5Sm1yaTlDNmNrOWN6UEZQZnhXMlBF?=
 =?utf-8?B?dG9vMnRielVlM1pmdi9TcWVnQXZnNW9iSGs5VytIRVVoZTgyMTBTbU42eHhN?=
 =?utf-8?B?QVRYRUZsYkUyL1NPaVpNZGZiczFDbkNLM0VtSFZsejJjaDZIS3N2Qm9nMkl5?=
 =?utf-8?B?TEtoN1V5dUhzRTFKSkYrTWtNdjVqYjB5V1ZhY215dTZWWWt6Zzh6ZThiV2Ux?=
 =?utf-8?B?VTNHSjk1c3RnNGdyRmJJZXBkdG93K1pwb2c2Y204T3orNjFtWXlydkxKOFRp?=
 =?utf-8?B?Qk02ODlWR1lyKzFFZjREQmVmck5WU1BVcGdDcGRVMUs1K2xvM0svMGpPS2RP?=
 =?utf-8?B?MzdnR1VUcGZjL2FHOVNPd25qY2I2VkRkRWlLMkpCbnI0bFByOGRFSnhTTG9a?=
 =?utf-8?B?c0ZBdjZXWko4bnFReFRINThQbUFFY0gyYlhDQW1sODlaQkRQOUxVZjR6Sng3?=
 =?utf-8?B?M213TWQ5R1lGc0laNDFaY0VOKzJZWi9scStZaW9PTFp5Ymx2L3JVR3Q5MXNn?=
 =?utf-8?Q?nfLY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95ea1ff-76e4-4eb7-b7ec-08d9e62df804
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 09:25:36.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHeiRevej6fYXc0oMrtFpaHRQsuXvSo3w28gjH3eLgYJB8g8+Nf4t9qRLV57NSZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2977
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de, daniel.vetter@ffwll.ch,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.02.22 um 10:11 schrieb Lucas De Marchi:
> [SNIP]
>   
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d03ad8da1f36..112676f11792 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5675,7 +5675,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/driver-api/dma-buf.rst
>   F:	drivers/dma-buf/
>   F:	include/linux/*fence.h

Oh, that is not correct to begin with.

> -F:	include/linux/dma-buf*

That here should probably be changed to point directly to 
include/linux/dma-buf.h, but that can come later on.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to the patch.

If nobody objects I'm going to push it drm-misc-next and provide a 
follow up to cleanup the MAINTAINERS file a bit more.

Regards,
Christian.

>   F:	include/linux/dma-resv.h
>   K:	\bdma_(?:buf|fence|resv)\b
>   
> @@ -9976,6 +9975,13 @@ F:	include/linux/iova.h
>   F:	include/linux/of_iommu.h
>   F:	include/uapi/linux/iommu.h
>   
> +IOSYS-MAP HELPERS
> +M:	Thomas Zimmermann <tzimmermann@suse.de>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	include/linux/iosys-map.h
> +

