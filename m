Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DE699EF4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 22:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC0710E386;
	Thu, 16 Feb 2023 21:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037110E386;
 Thu, 16 Feb 2023 21:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTEZ7VglcRpY6wldy8VRQPRi5AINMqcqBswMzcSm7dOpeoTrSISiPpUhNyyt+JLye3AjwIxt14K6Bvg1ZeeS9Fh23Ts8E80mdi5uJ+DIVIOQ01xmdRiumpopnPBpaTA+OfPW42lfhRqMKouD/4gRUOND5rK9suDlchujhj9Cr+XC9hXTpdHoTNcIW3Y8gdFmvNWyOVaBAOppICHeo7KaSxTvLBX585CfBgdxL20/jVG5XMorJhszUsSMZQ7gR8RI0iW+J/owq109kac9wvHOgJ1XeWYRQvGsZC+JFMkyO4Gs4F1szkwXPCFIiDfjDitdkFUhFnfM0FFJoIhgbkEw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk1unmOly2tnF8A2zBx1+1LDmLYyY5d5CnU+FNYjNis=;
 b=Y7FjWZWwH9jcOYl87SsdWaKeGcupwXHxe7LRnuZo5vHdQn/Ag6aCyRfiWO0qfFG8+4//328qwpmXtFq/RSQO3rvi/DZ45OzeLj0IryWK5bOuLo8r66Hsia5CBZCRd30oO4OrMBZZrluTT8m88vW6lDaNMoLi9h/GQSHE0N5k866+jGLgeM+n/O5EPXOx4+HG3OUMa74YSoWnOet6vq2ttQI92y5DV+Qy/SumKgLxIGWyDVYjOpDd3+A+U8gAFZaESSa6Zf5JPgWfFfnPt7HxcLLXbe4mgLUhAWdkjl0hVPCie6tZANnCh01fv7HoZhRPuFN3y+uEyKhE6ZplQGYtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk1unmOly2tnF8A2zBx1+1LDmLYyY5d5CnU+FNYjNis=;
 b=qMEnGd9wos3xY6OXVRKzyQuFy6dki3TPNp7A2WV0YG1de1Z8cgAqXZ+VpoWsh00RZ1yNoMZB2WzjxyiT/qpIPgF1ikZaMoaMXoenrLIqIDB9ThJmvjrDQN5/PilZloYcfDbsYy3ZRU8AqAfL3tvtJiDMYYjiTTiPAxGkWkK42dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 21:22:49 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%8]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 21:22:49 +0000
Message-ID: <fcce9fd0-ab33-8417-1e10-f4faf5e6d6a6@amd.com>
Date: Thu, 16 Feb 2023 16:22:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/3] drm/connector: Add enum documentation to
 drm_colorspace
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>, Joshua Ashton <joshua@froggi.es>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-2-joshua@froggi.es> <20230208105621.392fb2cc@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230208105621.392fb2cc@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f324fb-c747-4d82-8c4f-08db1063f461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNkP4ZnYjLKYsT1AWjh9n3W4Zd1Z6KHJ0O3KIqiNlzBmVVRfx8sRDNWw17I9KuHIuJEoq1VK8rnmei/ZvIqZuFqkQMPxlUyKlKBTt9sYyUeYjgJN6U4eW+VT1Jt+Svnl6QGGqMHEAmgP3gfMdyg087fbes6H4AaQ6bcQS1rkd9tOqNwiJUVGA3hCDkDdT0EbLWBr6vIDUxmoVEy9DAhib+fOZ1IbZoqZoiM26z2NUIR4biY+YkvTc5npF9SgM7P+LzBCCxyy/SyKQx/8VW12RWn/gEwj3md+leoBT9WnpqpCEPwvuaKiLIIPhJmTA4OTqyGyzKzztykrC86nUTaOwHKPB0sOtA8cBuhgqZpv6OQ63tnwnBRR56vIBBIvuHS5NFB7wqb/Tj7dGJ14fsbLvEv0NWp8eL93N+Ys4tWoQWHTyH7q9QtIhtoHdI8o88hHEHowYduboEAKsTQb9MpONGv8pgBWyTIQd+xevzGOgAA87mNCemA+k5VhFVzuA3trYVsy9qoHAiVl+78YFaKYoj91YoDCSvXxoUvSt14H55K5h8VjMYAUSlFnYkq6KuT3nYXVKSziXFHq3VBdDT/WAz/UUUjpolZw9pj9YOsHrbgBrLy8I2mQe4WC/QHHikcunwA5ornBwFQtq1/v+itiRTkZgIIm90+CMXOvrlmfdKqfexZoT2kEwyTUcw4R8Nz6b1MYyVPJjvHKzl/3Xuy1GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(451199018)(36756003)(86362001)(31696002)(38100700002)(44832011)(5660300002)(66946007)(8676002)(2906002)(66556008)(66476007)(4326008)(8936002)(2616005)(26005)(6512007)(186003)(53546011)(66574015)(83380400001)(110136005)(316002)(6506007)(54906003)(6666004)(966005)(6486002)(478600001)(41300700001)(31686004)(66899018)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dllDUGlmTXlLNlhFcTVUYk9lUWljenl1dWJMK0lGQUxGSnRwcW9TeE42MWF2?=
 =?utf-8?B?eDEwVy9nODBQUHoxZjF4N05IRWhmN3h6d3Y4cWV0bTh4MjNMOElhdUxhTE01?=
 =?utf-8?B?M3JVby9xZ2UrMzJrSnVacWU0THpWVlNjcmlhUlcreEdQbk50MHdWRlpFS1VO?=
 =?utf-8?B?SS9hLzlPa1BVZUdpTjBkZDFQUXl3Q1BDd3ZoSklVMmVXUHVkU080WFZOdElJ?=
 =?utf-8?B?NjhHVUpMUkd0ZUtKSXVZN05PdW1QT1lxam1DdDR0ejV4a3YxWEt2ZEFaT2Zx?=
 =?utf-8?B?c0Nja21XMEhkblhoV0NQQlFMZVR5RXNKQmd0a29YUkd1S2dsaGhmZ1hjTytQ?=
 =?utf-8?B?cVdrQlFUTytJUGQ1R1R3M2x4QXZMQTFXdHNqc1hqODh3V1BoWHhaZmR6Um85?=
 =?utf-8?B?QjRWWXBQY1BCV2hiTE5jSWdnWnhaajRRVDd3TkU5NmpreGRHSEdodmttN0l1?=
 =?utf-8?B?d3V3a0RncUptc0NxZlhZQkhodGRiVXUzYzRzWEt5UGNMVUdxd0RoVUlGbDli?=
 =?utf-8?B?ZlRkSkphWWM5SC8wb2dkdmN1L2x0aUZGYzdxcGhzNFdCV1M2dC9RWDlRcWZN?=
 =?utf-8?B?QlNORGp2cUI3eHZuQXhSOVdtSHB0ZXNZUGx6b0FSRnRMUEswSFVFKzYvTHV6?=
 =?utf-8?B?T2dsVDAybzlSUnZOL21TbWxGb2k2TmI3MmNSYUlEbEtma3NFOUNKa3luYngw?=
 =?utf-8?B?eWphK290eFVUdXQ0YWxIeHE2dUVodDA3aHVKaXNmU0Y1M0hvcDhteStvUWli?=
 =?utf-8?B?N3pzZXpQM3hkWm1WOW10bVJwbFFqT0pJU2QvME11ekJDajhNUlNrM2xsVUZz?=
 =?utf-8?B?YVoyRmNIZ0lRNzhaOGdtbXFLd1k0MG55ZTFWVDVha1k3K1lVLzdwaDFQT2kv?=
 =?utf-8?B?anZKQ01XSXhMeGh4SDN1VThlTjE5dVZYZnFpSUFoU2NmMEgrM3dXWjNuMG14?=
 =?utf-8?B?OFpMaTZRekJCenhabllJeWVpOHd3MGw0KzBLSDE5VFJjWVIxMmxSTHd0cXdi?=
 =?utf-8?B?b01qT1FRVmMvOTNPeFZRb0EyT0VYQy92b2c3UGswYWJHQVFNUmJ5MUZjdjZT?=
 =?utf-8?B?MnVlY1NlczdGc3BKRm9KL0RDdU4vZGVhNVZqU2J2aTZMbGgvYW0vUGRib3NB?=
 =?utf-8?B?KzllRWJBQk9sTTRGSHhkejBBaWIwY3U1bG1zUHNwU2JlWm5ZOW1rd0JLdEw5?=
 =?utf-8?B?ZGpTMEVaSE4welIwOWUxTlp4M2dzTGpyQzBFMjNjODh4SXFmenhleXBRRk50?=
 =?utf-8?B?SC9OT1dlN21kZ0NMM3hQT3JYZXY5QmZZMERXL3VRUTE5Z0FiSjByaVFtWXpP?=
 =?utf-8?B?blFLdERzeVhsZzRObkt3R1k0V3VYRCt4Z3RZeGFpM0x2QTZDVDhXdk5ab3JC?=
 =?utf-8?B?K3BmQjJXaUVVZWt5QkFTVURicTBkbVZHUWZNdDUveE1nSnB0Z1VDZkpjK0ZV?=
 =?utf-8?B?RmpCQXlzT1FGS3ZqSWc4d3hCVG1FWk5FSkx6RHl5Skd0N21YWE9kbUREMUZN?=
 =?utf-8?B?REdCZk52NUdxbHpFdUFXVnR2VkJNTk5BMEZnSkdMSzRKOEJwN3pTSCs2NUtZ?=
 =?utf-8?B?R3Jiek03Mnh5YkE0MGc1TU83d0JIREpXdHJVVEJRczFWaFNyN2JCcDFuczRM?=
 =?utf-8?B?WmxaZkxQei9DbzNCTTM3QUFLYktYODBVUzBzZXMwRlRxMXR0aklLKzZMVXlq?=
 =?utf-8?B?TURqNFBjZVhQbTMrS0grdEFPekR1bnBtN3BBTzhyYUVWRFVQME9OU1pxNTZX?=
 =?utf-8?B?bTNLQTI5c2t2eTl4Q0xCdzNLZmRVZGRDblZ1UE44KzZ2OURieGtPa3J1VnM4?=
 =?utf-8?B?QVd0S0VQeFBySjdQSVVCK1lzZ2NRTTRObjd0a3NySmU1MUdybGdDUkZnRUZC?=
 =?utf-8?B?amVkdEtUNVYzeUFlZHBnKzA5OHRzV1JvVHNyUDNwcG1ObEt4K0hSaitZNVdF?=
 =?utf-8?B?SVJaK0lvNWI1ZlB4aVpjUTFiNW0yWW4vTmFWYXZJQlRsYUJvK042b0ZjZkdy?=
 =?utf-8?B?ZjN5dy9Pc1BpbHJDQkxncTJUZDVBZnBsMTFnYUdmT0JTS0kwVk9rYnNZSDND?=
 =?utf-8?B?L25MbmNEVkxQUTA1bFJZSUFTS3phOGNkdk1Oa1NDbmw5WHdSOFBiR2pXNkdN?=
 =?utf-8?Q?sWgl7EwG+nphcqsgc4o7xr8e6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f324fb-c747-4d82-8c4f-08db1063f461
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 21:22:49.2772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umPvUeol7igtmxEVO7dJ8oszQeeOxtLGT3siWEAtBVhwD+s/J3BX47mRl3G+hMz07lDVxq++iBjeQzEGHzbT+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/8/23 03:56, Pekka Paalanen wrote:
> On Fri,  3 Feb 2023 02:07:43 +0000
> Joshua Ashton <joshua@froggi.es> wrote:
> 
>> To match the other enums, and add more information about these values.
>>
>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>
>> Cc: Pekka Paalanen <ppaalanen@gmail.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Vitaly.Prosyak@amd.com
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: amd-gfx@lists.freedesktop.org
>> ---
>>  include/drm/drm_connector.h | 41 +++++++++++++++++++++++++++++++++++--
>>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> Hi Joshua,
> 
> sorry for pushing you into a rabbit hole a bit. :-)
> 
>>
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index edef65388c29..eb4cc9076e16 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -363,13 +363,50 @@ enum drm_privacy_screen_status {
>>  	PRIVACY_SCREEN_ENABLED_LOCKED,
>>  };
>>  
>> -/*
>> - * This is a consolidated colorimetry list supported by HDMI and
>> +/**
>> + * enum drm_colorspace - color space
> 
> Documenting this enum is really nice. What would be even better if
> there was similar documentation in the UAPI doc of "Colorspace" under
> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties
> listing the strings that userspace must use/expect and what they refer
> to.
> 
> 
>> + *
>> + * This enum is a consolidated colorimetry list supported by HDMI and
>>   * DP protocol standard. The respective connectors will register
>>   * a property with the subset of this list (supported by that
>>   * respective protocol). Userspace will set the colorspace through
>>   * a colorspace property which will be created and exposed to
> 
> Could this refer to "Colorspace" property explicitly instead of some
> unmentioned property?
> 
>>   * userspace.
>> + *
>> + * @DRM_MODE_COLORIMETRY_DEFAULT:
>> + *   sRGB (IEC 61966-2-1) or
>> + *   ITU-R BT.601 colorimetry format
> 
> Is this what the "driver will set the colorspace" comment actually
> means? If so, I think the comment "driver will set the colorspace"
> could be better or replaced with "not from any standard" or "undefined".
> 

It's sRGB when RGB encoding is used and BT.601 for YCbCr.

> sRGB and BT.601 have different primaries. There are actually two
> different cases of BT.601 primaries: the 525 line and 625 line. How
> does that work? Are the drivers really choosing anything, or will they
> just send "undefined" to the sink, and then the sink does whatever it
> does?
> 
> Or is this *only* about the RGB-to-YCbCr conversion matrix and not
> about colorimetry at all?
> 
> If it's only about the conversion matrix (MatrixCoefficients in CICP
> (H.273) terms), then which ones of the below also define only the
> MatrixCoefficients but no colorimetry?
> 
>> + * @DRM_MODE_COLORIMETRY_SMPTE_170M_YCC:
>> + *   SMPTE ST 170M colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT709_YCC:
>> + *   ITU-R BT.709 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_XVYCC_601:
>> + *   xvYCC601 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_XVYCC_709:
>> + *   xvYCC709 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_SYCC_601:
>> + *   sYCC601 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_OPYCC_601:
>> + *   opYCC601 colorimetry format
>> + * @DRM_MODE_COLORIMETRY_OPRGB:
>> + *   opRGB colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT2020_CYCC:
>> + *   ITU-R BT.2020 Y'c C'bc C'rc (linear) colorimetry format
> 
> Is this one known as the constant luminance variant which requires
> KMS/driver/hardware knowing also the transfer characteristic function?
> 

Constant luminance as defined in BT.2020. Table 4 and 5
of the spec talk about it.

> Is there perhaps an assumed TF here, since there is no KMS property to
> set a TF? Oh, maybe all of these imply the respective TF from the spec?
> 
> I suspect the "linear" should read as "constant luminance".
> 
>> + * @DRM_MODE_COLORIMETRY_BT2020_RGB:
>> + *   ITU-R BT.2020 R' G' B' colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT2020_YCC:
>> + *   ITU-R BT.2020 Y' C'b C'r colorimetry format
> 
> ...compared to this one known as the non-constant luminance variant,
> i.e. "the simple RGB-to-YCbCr conversion"?
> 

Agreed.

The CTA-681 spec actually treats these as the same value
and for DP the R'G'G' (for RGB encoded signals) and the
Y'C'bC'r version (for YCbCr encoded signals) don't share
an actual value but you can't use the R'G'B' for YCbCr
and vice versa.

Rolling both into one seems to be the most reasonable thing
to do and doesn't clash with the spec. We can even combine
it later with a new "encoding" property where userspace can
provide a suggested encoding (or use the default, driver-selected
one).

>> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65:
>> + *   DCI-P3 (SMPTE RP 431-2) colorimetry format
>> + * @DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER:
>> + *   DCI-P3 (SMPTE RP 431-2) colorimetry format
> 
> These two can't both be the same, right? That is, the description is
> missing something.

P3 D65 vs P3 DCI

> 
>> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED:
>> + *   RGB wide gamut fixed point colorimetry format
> 
> Is this one scRGB too?

The spec doesn't seem to mention. -_-

In another place it annotates this with (XR8, XR10, XR12),
but I'm not sure if those are defined anywhere.

Harry

> 
>> + * @DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT:
>> + *   RGB wide gamut floating point
>> + *   (scRGB (IEC 61966-2-2)) colorimetry format
>> + * @DRM_MODE_COLORIMETRY_BT601_YCC:
>> + *   ITU-R BT.609 colorimetry format
> 
> Typo: BT.609
> 
> Which one of the two BT.601?
> 
>>   */
>>  enum drm_colorspace {
>>  	/* For Default case, driver will set the colorspace */
> 
> Thanks,
> pq
