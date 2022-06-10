Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBBD546E75
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E5113BCC;
	Fri, 10 Jun 2022 20:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001C4113BCC;
 Fri, 10 Jun 2022 20:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7WZTAKUvSW7yK5SpDvYCrtPuA2O+HCBlukyH3Ft5qLBjSlVxpQ8Wg9kXs9C9m0qE2ZHYPW9i3yfUEHp7AXnvxhGG+1jVPtLVKsu7eto22JGqC8QUdx6xuWLA40J/TFvbMmjBnv6mD72a+aByJRuhKZB6sES1pDNjwIJtNF+bhQKgrzXId4Il2ftNHk60toVjquz/fR9xBvO6dwkA1XqXVlpT1aNYgNO2MK9rr52IXWy7+ev2natfkds+Ihq06lGYp61Xnz57jcvrxbHxuJME926XcoYmS7UQuYRuCfQOGQIVGJCuwxo5S4V2i+tKwxN8Tq/W/i638UgoaA1UJAfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEAgV0nc3aNZuY1SBV6F5CsKkO2C3VaFw9Gvo3ZOCzE=;
 b=WFPEjl+d5vqmR1+iFvQpBg/DYTbUYhSI/g9QFbfipDfxc7B8cJU/FHHPOYW95Fc9+Ukh8ibq30o2VtTKGqkxIzubGTvvDAw4090DiPKZdB+RzWrzgoRQsTzx9xAKjdShgJitcWh2a395SJOqdhJ0nWN/L8slBSQvnvKAs0W4iWjTkTcDRPyl0IbxVp03PECl/bnBEO0l376t1oKGRbn9ESA26utMxHUj9EBFS/gr5V+lORDGTNO0QClylxcoukwReusVduuGvjzowgOxR4PHQTWoR3UPwSYqQD69mjvDcmlAiDh2M28+2hfeZ9UZHALx58dVLIUrzytiIbqknVs2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEAgV0nc3aNZuY1SBV6F5CsKkO2C3VaFw9Gvo3ZOCzE=;
 b=AbYKvz0w/1k8HxIqbBAnCNhfhNFzG7pC/4LYRwEicvBOvYMlQ7LmXqROxz5e7DXdocu08amz94a3W8LNKbPWFk02mTfIt+kh7kNRmfc7CrHk+D74O3baXqroP437qkY83fsaxRFb/U29LOBnpONMgHmGxM8kzNatrPOOp3ylDfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN6PR1201MB0162.namprd12.prod.outlook.com (2603:10b6:405:51::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 20:29:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::540e:d76a:bdf0:ed0d%6]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 20:29:54 +0000
Content-Type: multipart/mixed; boundary="------------21y9tNHNBJ2JvVU8ZFYTXjMY"
Message-ID: <85f086ec-7007-412c-db95-e20eb1837a25@amd.com>
Date: Fri, 10 Jun 2022 16:29:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: Pekka Paalanen <ppaalanen@gmail.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 Uma Shankar <uma.shankar@intel.com>
Subject: DRM/KMS PWL API Thoughts and Questions
X-ClientProxiedBy: YT3PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b792ccb-8a91-4448-6d34-08da4b1ffa01
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0162:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB016266E325C66B27B35BF0908CA69@BN6PR1201MB0162.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tQw9sKSVueRmdFkTZBSX+DwcmwVmpsxmXTKREykz1jtACZL3IS4WWHqzhtjJfK/MYpqFbcXfdYlzlRXd4vc5cvoRumiImI4lVw4kWuiCNFmtCNpCguChFvM/1yl/qiY1RwY44HhkSsBpstrV6dYOTCt0K5R1q129vS1maKhcH5MJ+J/PaWjhtyL6GWEAQdGNtbCSGIkYLSs2KVv7illLmAIbIlRXdtztqHL/guQIXRDi+zlTWKVlb0bRqhUgglTOQS7DIRqO1GhDH//3y3cs/n1CW1SzcRaiJuqEiloeYZqBP8bCpFY1cV7P60eMeHgFyCRgXxdsJGY86OyrLofO5lX8lPRqOFQhpcRTZzZS8Je19RdTIIHx3ezSteWeLMf5OEhuuoMX/d/eaQ7Hs8Aun4ZE131UhdLKJ6YG8cH6a2+dDTQSyUxu7PTdcUMnJYiNUh0al+3V1+N5joYsJ/SeMoHTItxnLY1ySOfwIX/itKNUeVBKxI0yj3ZNmHR48QG2Iqk2Y39D57H2zD3dwsxS1wwctnulfzcav8qDsw/nZ7u9Q3akFUUHZ1hPkZHSUAyfzyddwOUkRhBDV48MF7HlVnrNbr0hOjdWvG23AP7bLu+EfP6xmyy1bN5CqKAPsjCWT2Wx08Tnc/Vaw1wYsuBJTH9XDtricf6oYAHfTE9gkwLw2gxyc0l+0PRvTiOgKMtJr2PRtIc3czUlk+0Li6JFg8j74eEJdBX0iSyQk4+wNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(83380400001)(8676002)(38100700002)(110136005)(4326008)(66556008)(66476007)(31686004)(54906003)(316002)(86362001)(36756003)(31696002)(66946007)(508600001)(2906002)(6666004)(186003)(26005)(6512007)(966005)(33964004)(8936002)(5660300002)(235185007)(6506007)(2616005)(6486002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXorQVY4MlhhNW5PYmE3aXVoTlhKYVRHN3hjVE11NGpTUlJyaTJBZzZWamNa?=
 =?utf-8?B?SWNlRHBNdEFNSG5YaFVZUUNTVmhLMjZvTlRjRjFiR3ZTQS9ZeENaMDlkdGJu?=
 =?utf-8?B?dXhOeDhYYU83a0RIM2EzMW15TU55Smc1eXJnWGVhMGxBS2g0Ui9TdE1OVW9S?=
 =?utf-8?B?bGVueG1nOG5uWkRnNWI5T2RISTZ5c2J4VUFTZDVtQnpkNCtGb1FqV0NsUllw?=
 =?utf-8?B?R2hTS3J6Wmc0aGpQYlpCdzQ2OVU2UW9NV1Jya2VDVS9FbVBGL3RxTUR3bjJq?=
 =?utf-8?B?OG51Zk9MYVM1MW1kS0piRTd6UnhZeUZSZUJzdG40VHVwT1VBQUlGRU43dXNC?=
 =?utf-8?B?clFZMXVuRTYxMnoyR1ArdzdVaVZmbjlHd09ucjliZWRIR0paTnhwYm5qZHZw?=
 =?utf-8?B?OTBnS28xK0JSdGF5S1VIM1lIeXVIN3p5czd3RnNqVWhDRG05aUZTVmdJSCtK?=
 =?utf-8?B?Qlp3N1pKc1ltTjNQNTBONzB4ZzR1anZGS2FDc1BVc1lVNlVyeDBialhxVHFz?=
 =?utf-8?B?WE0rRnBlRE5oaFkvMm5SKzR4a3pXUWxrYVFSa0JDMzFZYUZod21hYVk0WVF6?=
 =?utf-8?B?aC9CbEhIRE5wVE5la2lpM2U4ZTZsVFcveHdDLzdSUmJpZGo2OXN5ZEMrTlUz?=
 =?utf-8?B?T3Z0THFrSkMvRTJOa1h3SFl5VE9OWkFTcTVqRG9QWEErTTZQSVlNOVgwV0U2?=
 =?utf-8?B?RHRCb0E4dituekNEdlNjMFZnOHpaM0cycWRyL1NERU9uYVVWcTI4aUNzK2hu?=
 =?utf-8?B?aHF0aGQvZGw1YWNwZ1lnNFJJaVgzQWpua0lCSTJlRDFkV2oyTXVraldEdmZu?=
 =?utf-8?B?U0JDcGNjWFdTWnRrNHEwQXFVWjlrV2JVWUtpUTRqTTJpaTZQT2pzaklQSWRM?=
 =?utf-8?B?d0QxdVB5UXZ1dGpYa3BFSHUveWJjTmhIQ1JNV2VsRERNcTVqSXNORUZXbHhm?=
 =?utf-8?B?Zmt1dkNNaUc4bW1FRlJ5ei9LYW9xQ3ZsQWJJd1BMU2llcXZCUVhTbHI1TEhP?=
 =?utf-8?B?Zk5mWkpQLzdlaXBoSlZKWGk2TnBDU3JYT1FvTUpzbVE5Qnc3Ulc4SHdBRzVp?=
 =?utf-8?B?OThaNFVyZWRNME1udXJhWFlJU0grTWFCZlN6NVVoaUEwMnVCNDRtdWtuZjFj?=
 =?utf-8?B?YTNoY2ZBMzJXOG04WXgveWFJMUlxMFVQdkNZeVRjYitwdXZjZDQzVnRsWUZX?=
 =?utf-8?B?TXFsczJHQXNEMTRKcUwvUHp0TUlZdS9seFNBS0g4Z3RZMVo4TFRYRzRBV2h1?=
 =?utf-8?B?d2IycGkxK0FmME56Y2ZsSkZMRnBlc0ZCS3lRVFVoRHYrSmRJWERwb3Y1c2hP?=
 =?utf-8?B?eHBLSUhPemlQRFBwa2NSR2R4OTE0bDNYNm10UFV3QVlYa2MzWnJvb1pKOGZw?=
 =?utf-8?B?SUpQY1NtMXZiclBQSDdwcHJUVGZQMy9jMTA1R2JjVWxmVm02eW52UGJnOTJG?=
 =?utf-8?B?THA1cHRYbEZHYi95MGpvbzVXanpRMXJ6cHVLczE0V1p4c0JLY0FONFJSUHBh?=
 =?utf-8?B?TXQ2SXBGcjdJb0NjbDRYUkY1ZHVlNWFkeW44KzJwVm9iUVIxU1ZWWGg0dmZm?=
 =?utf-8?B?aXoyWWxMdXJMdTJqalBwTGR4UmFZQUxUQmdFMERnSTBOcU9Va2tpRjZrdi9P?=
 =?utf-8?B?L2RBQlpEWGx5YzZuc1BBck5ONVlrN0pacFdsT1NKeVlEbGJXb0RIZVNNK0E1?=
 =?utf-8?B?cWhBb3FsdlBNZmdXNXA3aVREckU2TUVQOFFheEY3ZXkwaEZ5RjE5VG9hQ3Ft?=
 =?utf-8?B?R1lvdWZkVzFlS0NUYXA3NHE5SDZiTk40RUhzQVJMblo3VGVrTEFia2ZFWThB?=
 =?utf-8?B?cUk1OFFzSzJYSDFHZHJiTHVXdFV0cWJ6WmlrT1haMGFOMVEvdVlZRWd3WmIw?=
 =?utf-8?B?dnVsYlBTNHFVOEpXNDlLUXdLTk8rT2laOEViNlgzMUtJOUQ5U3kxSFFFRzE4?=
 =?utf-8?B?SWFKT3p3cDFHM0Y0blBTOE9weks3UkxYTzhOODBqYVMrOUFmVXJZdVpLNkM0?=
 =?utf-8?B?UE9sdVdJc2puWW9ISzRIcndlV2pMN0dBNDBlMm1xaklJd0tkN0xFbDBHTGlE?=
 =?utf-8?B?RUNUVXhjd0F1VllOajB5UE9qVThuQjlwby9DZGhRY21WU1NTNDVNcDRDVk10?=
 =?utf-8?B?czFIZlI3Ylp3RGN1ams5cTl5SEYrK2I5K2J4S2xPaVpaOEhDN0gvQitLTTRQ?=
 =?utf-8?B?S0gwZ2s0YlhKdUs1eHZ6cUVLbDdtUjFsWTZxek5PYmZwcWtHWmlnaFJia2J3?=
 =?utf-8?B?QW9aOWhGNG8rbjZIUUJBL2ZmaG1yQzhYTFl3a2lMdUR4TnpvOWJSdkRNQTRh?=
 =?utf-8?B?b2NJZjEyVUkzQitrSnd3OGVGcktaK091aVRQb0QzNkozdE5yMDh2QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b792ccb-8a91-4448-6d34-08da4b1ffa01
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 20:29:54.0262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rW9sHEWbGETYLmA74AvaNYZP//Zz0opPiLCRggc843DTSfcVw6KxCDIZC2kLHo1V9nRv4oKFPdITJeFiqbuFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0162
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------21y9tNHNBJ2JvVU8ZFYTXjMY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(I'm sending this as an email as lowest common denominator but feel an issue on the color-and-hdr repo would be a better interface for productive discussion. Please pop over to https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/10 if you agree. Hopefully we can drive the discussion there but if there is a strong preference for email that works as well. :) )

I've wanted to start a thread to discuss the use of PWL APIs that were introduced by Uma a year ago and for which Bhanuprakash provided IGT tests. I have come to like the API but as we're getting closer to a real-world use of it I have a few questions and comments. As with a lot of complex APIs the devil is in the details. Some of those details are currently underspecified, or underdocumented and it's important that we all interpret the API the same way.

**The API**

The original patches posted by Uma:
https://patchwork.freedesktop.org/series/90822/
https://patchwork.freedesktop.org/series/90826/

The IGT tests for PWL API:
https://patchwork.freedesktop.org/series/96895/

I've rebased the kernel patches on a slightly more recent kernel, along with an AMD implementation:
https://gitlab.freedesktop.org/hwentland/linux/-/tree/color-and-hdr

I've also rebased them on an IGT tree, but that's not too up-to-date:
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/color-and-hdr


**Why do I like the API?**

In order to allow HW composition of HDR planes in linear space we need the ability to program at least a per-CRTC regamma (inv_EOTF) to go from linear to wire format post-blending. Since userspace might want to apply corrections on top of a simple transfer function (such as PQ, BT.709, etc.) it would like a way to set a custom LUT.

The existing CRTC gamma LUT defines equally spaced entries. As Pekka shows in [1] equally-spaced LUTs have unacceptable error for regamma/inv_EOTF. Hence we need finer granularity of our entries near zero while coarse granularity works fine toward the brighter values.

[1] https://gitlab.freedesktop.org/pq/color-and-hdr/-/merge_requests/9

HW (at least AMD and Intel HW) implements this ability as segmented piece-wise linear LUTs. These define segments of equally spaced entries. These segments are constrained by the HW implementation. I like how the PWL API allows different drivers to specify the constraints imposed by different HW while allowing userspace a generic way of parsing the PWL. This also avoids complex calculations in the kernel driver, which might be required for other APIs one could envision. If anyone likes I can elaborate on some ideas for an alternate API, though all of them will require non-trivial transformations by the kernel driver in order to program them to HW.


**Nitpicks**

The API defines everything inside the segments, including flags and values that apply to the entire PWL, such as DRM_MODE_LUT_GAMMA, DRM_MODE_LUT_REFLECT_NEGATIVE, input_bpc, and output_bpc. If these don't stay constant for segments it might complicate the interpretation of segments. I suggest we consider these as effectively applying to the entire PWL. We could encode them in an overall drm_color_lut struct that includes an array of drm_color_lut_range but that's probably not necessary, hence why I called this out as a nitpick. I would just like us to be aware of this ambiguity and document that these values applies to the entire PWL.


**How to read the PWL**

Let me first give a summary for how this LUT is used in userspace. If you're familiar with this please review and comment if I got things wrong. As I mentioned, a lot of this is underspecified at the moment so you're reading my interpretation.

You can see this behavior in plane_degamma_test [2] in the kms_color.c IGT test suite. I suggest the plane_degamma_test here here instead of the test_pipe_gamma test as the latter still has Intelisms (assumptions around Intel driver/HW behavior) and will not work for other drivers.

Iterate over all enums in PLANE_DEGAMMA_MODE and find a suitable one. How do we find the suitable one? More on that below.

Once we have the right PLANE_DEGAMMA_MODE we read the blob for the blob ID associated with the PLANE_DEGAMMA_MODE enum. We interpret the blob as an array of drm_color_lut_range. See get_segment_data [3].

We can think of our LUT/PWL as f(x) = y. For a traditional equally spaced LUT with 1024 entries x would be 0, 1, 2, ..., 1023. For a PWL LUT we need to parse the segment data provided in drm_color_lut_range.

Let's look at the 2nd-last entry of the nonlinear_pwl definition for the AMD driver [4] (I've correct it here and dropped the DRM_MODE_LUT_REUSE_LAST but it's still incorrect in the link) and simplify it to 4 entries for sake of readability:

{
        .flags = (DRM_MODE_LUT_GAMMA | DRM_MODE_LUT_REFLECT_NEGATIVE | DRM_MODE_LUT_INTERPOLATE | DRM_MODE_LUT_NON_DECREASING),
        .count = 4,
        .input_bpc = 13, .output_bpc = 18,
        .start = 1 << 12, .end = 1 << 13,
        .min = 0, .max = 1UL << 35
    },

We see we have 16 entries in the region from (1 << 12) to (1 << 13). We see input_bpc is 13, so our 1.0 float value is 1 << 13.

(Is it sensible to use input_bpc as our 1.0 floating point reference? Why?)

Since this segment is not reusing the last entry (doesn't have DRM_MODE_LUT_REUSE_LAST) we divide the region between 1 << 12 and 1 << 13 into 4 equally spaced sections.

step_size = (segment->end - segment->start) / count

In our case our segment spans from 4096 to 8192 and yields a step_size of 1024.

Note that we need to calculate this in floating point, otherwise we're not guaranteed equal spacing.

This gives us these X entries for this particular segment:
4096, 5120, 6144, 7168

And normalized to 1 << 13 (input_bpc) for our 1.0 float value we get
0.5, 0.625, 0.75, 0.875

If the segment had the REUSE_LAST flag the values would look like
4096, 5461, 6826, 8192

and normalized to
0.5, 0.666626, 0.833252, 1

Though in the case of REUSE_LAST a more sensible definition might be with a count of 5 entries in this segment, instead of 16. But ultimatly that's up to the driver.

I attached a simple C program that parses a PWL and helps illustrate my interpretation. You'll just need to copy-paste or include your PWL definition (instead of color_gamma.h), and point the PWL define to your PWL variable. To build it you'll need to copy the drm-uapi folder from my IGT repo into the same directory as pwl-parser.c and then just build it with "gcc -Idrm-uapi pwl-parser.c".

The above entries come from running pwl-parser with the nonlinear_pwl from [5].

To illustrate these I added versions of your lut1d_error scripts that run on the SDR and HDR PWLs for AMD HW [6].

We should probably document the above in detail in the DRM/KMS API docs.

[2] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/blob/color-and-hdr/tests/kms_color.c#L978
[3] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/blob/color-and-hdr/tests/kms_color_helper.c#L393
[4] https://gitlab.freedesktop.org/hwentland/linux/-/blob/color-and-hdr/drivers/gpu/drm/amd/display/modules/color/color_gamma.h#L109
[5] https://gitlab.freedesktop.org/hwentland/linux/-/blob/color-and-hdr/drivers/gpu/drm/amd/display/modules/color/color_gamma.h#L38
[6] https://gitlab.freedesktop.org/hwentland/color-and-hdr/-/tree/precision/octave

**How to provide PWL entries?**

To provide the PWL values for each entry we'll have to sample our (custom) curve at the respective points specified by our PWL entries and providing those samples in a blob that is passed to PLANE_DEGAMMA_LUT. It's not much different from how we provide values for an equally spaced (legacy) LUT. As for sampling our curve, I remember seeing that Weston uses an LCMS function to sample the curve at required points. Last I checked it samples the curve at evenly spaced intervals but the LCMS function seemed to provide arbitrary sampling.


**How to pick a suitable PWL definition?**

Picking the right PWL definition out of the respective \_MODE enum isn't trivial. Without further information a userspace implementer has to understand the distribution of entries in all segments and perform a bunch of math to estimate the error for given curves.

A simpler approach might be if we defined common naming for our PWL enums. We can define the commonly expected cases. The two important parameters are within-range vs overrange entries, and linear vs non-linear outputs.

Within-range PWLs would cover [0.0, 1.0] entries and overrange [0.0, 128.0] to cover PQ and probably anything else. One could think of the within-range PWL as intended for SDR content and the over-range PWL for HDR content.

Linear PWLs would be intended for linear luminance outputs (or near-linear), and can be represented by equally spaced LUTs, such as a single-segment definitions. Non-linear PWLs would be intended for linear to non-linear transforms; Linear PWLs for non-linear to linear transforms or OOTFs.

This gives us four enums, plus one for bypass:
DRM_MODE_LUT_BYPASS
DRM_MODE_LUT_LINEAR_SDR
DRM_MODE_LUT_NONLINEAR_SDR
DRM_MODE_LUT_LINEAR_HDR
DRM_MODE_LUT_NONLINEAR_HDR

Drivers can provide appropriate PWLs based on the HW caps. Userspace can pick an appropriate one if it's available or fall back to either a sub-optimal PWL or to using a GPU transform instead.

Thoughts?

Thanks,
Harry
--------------21y9tNHNBJ2JvVU8ZFYTXjMY
Content-Type: text/x-csrc; charset=UTF-8; name="pwl-parser.c"
Content-Disposition: attachment; filename="pwl-parser.c"
Content-Transfer-Encoding: base64

LyoKICogQ29weXJpZ2h0IDIwMjIgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgogKgogKiBQ
ZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNv
biBvYnRhaW5pbmcgYQogKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAogKiB0byBkZWFsIGluIHRoZSBTb2Z0
d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCiAq
IHRoZSByaWdodHMgdG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmli
dXRlLCBzdWJsaWNlbnNlLAogKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBh
bmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKICogU29mdHdhcmUgaXMgZnVybmlzaGVk
IHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKICoKICogVGhl
IGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2Ugc2hhbGwg
YmUgaW5jbHVkZWQgaW4KICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0
aGUgU29mdHdhcmUuCiAqCiAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAiQVMgSVMiLCBXSVRI
T1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCiAqIElNUExJRUQsIElOQ0xVRElO
RyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAog
KiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAg
SU4gTk8gRVZFTlQgU0hBTEwKICogVEhFIENPUFlSSUdIVCBIT0xERVIoUykgT1IgQVVUSE9SKFMp
IEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCiAqIE9USEVSIExJQUJJTElUWSwg
V0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAogKiBB
UklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9S
IFRIRSBVU0UgT1IKICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogKgogKiBBdXRo
b3JzOiBBTUQKICoKICovCgojZGVmaW5lIEJJVCh4KSAoMSA8PCB4KQojaW5jbHVkZSAiZHJtX21v
ZGUuaCIKI2luY2x1ZGUgImNvbG9yX2dhbW1hLmgiCiNpbmNsdWRlIDxzdGRpby5oPgoKI2RlZmlu
ZSBQV0wgbm9ubGluZWFyX2hkcl9wd2wKCiNkZWZpbmUgTUFYX0VOVFJJRVNfUEVSX1NFR01FTlQg
NTEyCiNkZWZpbmUgTUFYX0VOVFJJRVMgNDA5NgoKaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkKewoJX191NjQgZW50cmllc1tNQVhfRU5UUklFU107Cgl1bnNpZ25lZCBwd2xfc2l6ZSA9
IDA7Cgl1bnNpZ25lZCBzZWdtZW50X3NpemUgPSAwOwoJdW5zaWduZWQgc2VnbWVudF9jb3VudCA9
IDA7Cgl1bnNpZ25lZCBpID0gMDsKCXVuc2lnbmVkIGogPSAwOwoJdW5zaWduZWQgb3ZlcmFsbF9j
b3VudCA9IDA7CglfX3U2NCBub3JtID0gMDsKCglwd2xfc2l6ZSA9IHNpemVvZihQV0wpOwoJc2Vn
bWVudF9zaXplID0gc2l6ZW9mKFBXTFswXSk7CglzZWdtZW50X2NvdW50ID0gcHdsX3NpemUgLyBz
ZWdtZW50X3NpemU7CgoJcHJpbnRmKCJwd2xfc2l6ZSA9ICVkLCBzZWdtZW50X3NpemUgPSAlZCwg
c2VnbWVudF9jb3VudCA9ICVkXG4iLAoJICAgICAgIHB3bF9zaXplLCBzZWdtZW50X3NpemUsIHNl
Z21lbnRfY291bnQpOwoKCWZvciAoaSA9IDA7IGkgPCBzZWdtZW50X2NvdW50OyBpKyspIHsKCQlj
b25zdCBzdHJ1Y3QgZHJtX2NvbG9yX2x1dF9yYW5nZSAqc2VnbWVudCA9ICZQV0xbaV07CgkJX191
NjQgc2VnbWVudF9lbnRyaWVzW01BWF9FTlRSSUVTX1BFUl9TRUdNRU5UXTsKCQl1bnNpZ25lZCBj
b3VudCA9IDA7CgkJX191NjQgc3RlcF9zaXplID0gMDsKCgkJcHJpbnRmKCJTZWdtZW50ICVkXG4i
LCBpKTsKCQlwcmludGYoIlx0LmZsYWdzID0gMHgleFxuIiwgc2VnbWVudC0+ZmxhZ3MpOwoJCXBy
aW50ZigiXHQuY291bnQgPSAlZFxuIiwgc2VnbWVudC0+Y291bnQpOwoJCXByaW50ZigiXHQuaW5w
dXRfYnBjID0gJWQsIC5vdXRwdXRfYnBjID0gJWRcbiIsIHNlZ21lbnQtPmlucHV0X2JwYywgc2Vn
bWVudC0+b3V0cHV0X2JwYyk7CgkJcHJpbnRmKCJcdC5zdGFydCA9IDB4JWx4LCAuZW5kID0gJWx4
XG4iLCBzZWdtZW50LT5zdGFydCwgc2VnbWVudC0+ZW5kKTsKCQlwcmludGYoIlx0Lm1pbiA9IDB4
JWx4LCAubWF4ID0gJWx4XG4iLCBzZWdtZW50LT5taW4sIHNlZ21lbnQtPm1heCk7CgoJCW5vcm0g
PSBzZWdtZW50LT5pbnB1dF9icGM7CgoJCWlmIChzZWdtZW50LT5jb3VudCA9PSAxKSB7CgkJCXBy
aW50ZigiXHQtIHN0ZXBzID0gJWRcbiIsIHNlZ21lbnQtPnN0YXJ0KTsKCQkJcHJpbnRmKCJcdC0g
bm9ybWFsaXplZCBzdGVwcyA9ICVnXG4iLCBzZWdtZW50LT5zdGFydCAvICgoMSA8PCBzZWdtZW50
LT5pbnB1dF9icGMpICsgMC4wKSk7CgkJCWVudHJpZXNbb3ZlcmFsbF9jb3VudCsrXSA9IHNlZ21l
bnQtPnN0YXJ0OwoJCQljb250aW51ZTsKCQl9CgoJCWlmIChzZWdtZW50LT5mbGFncyAmIERSTV9N
T0RFX0xVVF9SRVVTRV9MQVNUKSB7CgkJCS8qCgkJCSAqIEVudHJpZXMgYXJlIGV2ZW5seSBzcGFj
ZWQgaW4gW3N0YXJ0LCBlbmRdCgkJCSAqIGluY2x1ZGluZyAiZW5kIiBhcyBhbiBlbnRyeS4KCQkJ
ICogCgkJCSAqIFRoaXMgaXMgdGhlIHNhbWUgYXMgY291bnQgLTEgZW50cmllcyB3aGVuCgkJCSAq
IFJFVVNFX0xBU1QgaXNuJ3QgdXNlZCwgd2l0aCAiZW5kIiBhZGRlZAoJCQkgKiBhcyB0aGUgYWRk
aXRpb25hbCBlbnRyeQoJCQkgKi8KCQkJY291bnQgPSBzZWdtZW50LT5jb3VudCAtIDE7CgkJfSBl
bHNlIHsKCQkJLyoKCQkJICogZW50cmllcyBhcmUgZXZlbmx5IHNwYWNlZCBpbiBbc3RhcnQsIGVu
ZF0KCQkJICogZXhjbHVkaW5nICJlbmQiIGFzIGFuIGVudHJ5CgkJCSAqIAoJCQkgKiB0aGlzIHdp
bGwgbG9vayB0aGUgc2FtZSBhcyBhIFJFVVNFX0xBU1QKCQkJICogZGlzdHJpYnV0aW9uIG9mIGNv
dW50ICsgMSB3aXRoIHRoZSBsYXN0CgkJCSAqIGVudHJ5IG9taXR0ZWQKCQkJICovCgkJCWNvdW50
ID0gc2VnbWVudC0+Y291bnQ7CgkJfQoKCQlzdGVwX3NpemUgPSAoc2VnbWVudC0+ZW5kIC0gc2Vn
bWVudC0+c3RhcnQpIC8gKGNvdW50KTsKCgkJcHJpbnRmKCJcdC0gc3RlcF9zaXplIGNvdW50IDB4
JXgsIHN0ZXBfc2l6ZSAweCV4XG4iLCBjb3VudCwgc3RlcF9zaXplKTsKCgkJZm9yIChqID0gMDsg
aiA8IGNvdW50OyBqKyspIHsKCQkJc2VnbWVudF9lbnRyaWVzW2pdID0gc2VnbWVudC0+c3RhcnQg
KyAoaiAqIHN0ZXBfc2l6ZSk7CgkJCWVudHJpZXNbb3ZlcmFsbF9jb3VudCsrXSA9IHNlZ21lbnRf
ZW50cmllc1tqXTsKCQl9CgoJCWlmIChzZWdtZW50LT5mbGFncyAmIERSTV9NT0RFX0xVVF9SRVVT
RV9MQVNUKSB7CgkJCXNlZ21lbnRfZW50cmllc1tqXSA9IHNlZ21lbnQtPmVuZDsKCQkJZW50cmll
c1tvdmVyYWxsX2NvdW50KytdID0gc2VnbWVudF9lbnRyaWVzW2pdOwoJCX0KCgkJLyogcHJpbnQg
YWxsIGVudHJpZXMgKi8KCgkJY291bnQgPSAoc2VnbWVudC0+ZmxhZ3MgJiBEUk1fTU9ERV9MVVRf
UkVVU0VfTEFTVCkgPyBjb3VudCArIDEgOiBjb3VudDsKCgkJcHJpbnRmKCJcdC0gc3RlcHMgPSAi
KTsKCQlmb3IgKGogPSAwOyBqIDwgY291bnQ7IGorKykgewoJCQlwcmludGYoIiVsZCIsIHNlZ21l
bnRfZW50cmllc1tqXSk7CgkJCWlmIChqIDwgY291bnQtMSkKCQkJCXByaW50ZigiLCAiKTsKCQl9
CgkJcHJpbnRmKCJcbiIpOwoKCQlwcmludGYoIlx0LSBub3JtYWxpemVkIHN0ZXBzID0gIik7CgkJ
Zm9yIChqID0gMDsgaiA8IGNvdW50OyBqKyspIHsKCQkJcHJpbnRmKCIlZyIsIHNlZ21lbnRfZW50
cmllc1tqXSAvICgoMSA8PCBzZWdtZW50LT5pbnB1dF9icGMpICsgMC4wKSk7CgkJCWlmIChqIDwg
Y291bnQtMSkKCQkJCXByaW50ZigiLCAiKTsKCQl9CgkJcHJpbnRmKCJcbiIpOwoKCX0KCglwcmlu
dGYoInN0ZXBzID0gIik7Cglmb3IgKGkgPSAwOyBpIDwgb3ZlcmFsbF9jb3VudDsgaSsrKSB7CgkJ
cHJpbnRmKCIlbGQiLCBlbnRyaWVzW2ldKTsKCQlpZiAoaSA8IG92ZXJhbGxfY291bnQtMSkKCQkJ
cHJpbnRmKCIsICIpOwoJfQoJcHJpbnRmKCJcbiIpOwoKCXByaW50Zigibm9ybWFsaXplZCBzdGVw
cyA9ICIpOwoJZm9yIChpID0gMDsgaSA8IG92ZXJhbGxfY291bnQ7IGkrKykgewoJCXByaW50Zigi
JWciLCBlbnRyaWVzW2ldIC8gKCgxIDw8IG5vcm0pICsgMC4wKSk7CgkJaWYgKGkgPCBvdmVyYWxs
X2NvdW50LTEpCgkJCXByaW50ZigiLCAiKTsKCX0KCXByaW50ZigiXG4iKTsKCXByaW50ZigiJWQg
ZW50cmllc1xuIiwgb3ZlcmFsbF9jb3VudCk7CgoKCXJldHVybiAwOwp9Cg==

--------------21y9tNHNBJ2JvVU8ZFYTXjMY--
