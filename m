Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB477B3310
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 15:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E4910E709;
	Fri, 29 Sep 2023 13:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294CB10E709;
 Fri, 29 Sep 2023 13:08:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOf4WOvG+EzrXIqiibmoWhbRfaeMJ9mVYxHk8YLflmpQpPK4Bm9Tszu1TsNTW13i50OMLMQEbuolAytUu/Tu5rZFuYXOSd4q/xumoRLy5rikfJowybSzrEeMYIyzfwepf/w0d8CJicJIz3yJ6IHq+4x5c/kDBvgi1FbRe2thMW+g4TXAuiHfju0SMFWnJw6NhgYMUkRQdwuwQ5Zs7Z0OuroECWvOnuGFnSzPUcgtVqbDpWxk4fPoZoWAIO6510robn5Ei7dMBOvYg+a9ChcUDMjjaTaIxYuYe3mfWygobFJFcflJwLp6JLa5cWSb3gI/mCdkp60cpQLrqJeLnu9+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzhsGW2qXQxMRDZJWfpwreNGbSFD7QKd1VwelpnTH9E=;
 b=nmcBehKzwyxpcjAM6PCTthD8Kj/ZLZzKH4+0BFdBJEMT0CIqhP+Ch8nKrBo927DphX6ZlkDCtIzHF9rvPTBIeeEmRreTQHxh9V/22qbo8kYZXiTKWy6Se8dZO+tGiyWM5JFmXC3vY/En6B63uBwigWhfP0usHOiCrNjh4LGQJTk8uGFNhbwNJxK+jQb3+4p6S2pVWLTJjyN5TjoGuDQCi2l3qprplWl+vzwfQr+W6MGUB3cUk3hoY8YasNdS6xQmQubo/oxjZwBGF/TqR70EaxwyJhDODO4ibHsl1yYglgSy3D1idQfI4ckcu8x3TFu289RF4HBc6dQn3EkrIZQYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzhsGW2qXQxMRDZJWfpwreNGbSFD7QKd1VwelpnTH9E=;
 b=bLiQQltkRZYrsw7oz4SA0UstLcLAkpJRiEPDmVRMffqw6Z3wXHXbOoz1D814HwUAsubCL8c4Pa/XKv+1veZzaMhWpcLO0AYlGB/gv3qSGVnq+lyGBI1plZe/3vWKDhd1EAQkzjBo6wS6aNESldMg1CCKWxwlxTPfaaamvR1hgXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 13:08:47 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 13:08:47 +0000
Message-ID: <2f22c6fa-3b88-4401-a77a-6dc97115a045@amd.com>
Date: Fri, 29 Sep 2023 09:08:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/32] drm/amd/display: document AMDGPU pre-defined
 transfer functions
To: Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-8-mwen@igalia.com>
 <c1f850e7-7442-4cb9-a83f-289d467dc749@amd.com>
 <20230929103522.5635c48b.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230929103522.5635c48b.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CYYPR12MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 96030438-3708-4a0c-4cca-08dbc0ed374e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8eef5b+BBA+9zJP7G+9PiCaDTPzJS1vDTy/sSiWKPfpBjicwqNxtk4jXXCHdS8QxSoCrWOpiN4BejLJmk+dAsuYi5lxI380UzgU8qI2HUiWSp5d2YVnj7RXS8G/gktt9a0YahdeXA3QlYXJa2PgH6cp4DBgaK3cHwDIjmR4hSNsGcl52g0aKiLhI4aU3XOSbwQ6MMDshcBMdrIwOlz4U5EPx81LVdifPRgGEhvIwEoB6sOQVNql6k5UaiqeD3gngKMlYRhBHlt06VnezHKFO4FX51mERcbtA6Gwl57yur8wSsaj/7BtB4UophmFU2sOO/TtpDrSf9klHfZO1jNLhzPEvHgjNm/yxeCAh8XoJoYVhIyW87rskfObl+S55eTEuMisk2PBwRvo3EYH2bvNNCvRr/RFKo7D15O3jiqsHPfJDdxnDdgDjHilkLeflnzdx66lbRMfMhwoseK4+gpr/4Xqc3CuwIVdoRGx0jBNf2T2expu2oXYX3Cr6ovQYCtSKCTvHRtMXBwAn/xTmA7YKF0pVc136nB79uAVM+jo4HCzj+YEMp1rcJbOzebswe/PgFkdlaVxMmq+Y5W3bdNIVlaIx+kuzhMbiRC3RJzWVaa+jHw0tzRt2AuhqFa38yE6j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(31686004)(6512007)(6506007)(2616005)(53546011)(86362001)(36756003)(38100700002)(31696002)(26005)(2906002)(7416002)(966005)(6666004)(6486002)(83380400001)(478600001)(8936002)(4326008)(316002)(8676002)(41300700001)(66556008)(44832011)(66946007)(66476007)(54906003)(6916009)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZGS25McHlJdVkzRlE5UkV5U0NGNzd3bm5LSTdOZWhWWFBLYVZRbVh3bXdR?=
 =?utf-8?B?dDJTRm5KdUFNVzVtWXBTU3JtSHA2V0o1TnFoQm9SMUFUaEVxYjdIYVFvVVln?=
 =?utf-8?B?RUxnOGREQWZDbHJJb25jbFd2OUE1dWpFdW9YN1plc3lJWUcwNGN5ZWNOYTBR?=
 =?utf-8?B?bUFpUnlwUmxyM3lWQnlXc3pnV2czWHBGQVp1Nisvak01d3VlV3cwZmNCcUs5?=
 =?utf-8?B?bE9idEIycHdiK0FGcFhCVmN6UmFIMjdTOTdDUkhJSE14THNYSmlyd1hoVEg5?=
 =?utf-8?B?Q2ZCSHYwdHR2SXBFZWluQ0ZROHpBcE9VejVHamxYOXZsRmh4aEo2TjMrWnN1?=
 =?utf-8?B?dzMwQ2VERVNJbnR1THhtWXZMQ3FrNElXZ1hUWTdIb0VmTjNSdUp2a2RXOVRJ?=
 =?utf-8?B?enVQcEFwVXA4RzFRSlA0ek85bmdOWTRVcmhRa0hCRGcyeVpoSGZtcXErQTNu?=
 =?utf-8?B?R1pXTkxyd0VTWkZJY0pnQVRqZFRhbWJ1OUI1eGE4ZXJYV0EvSm1UWGJlS1ht?=
 =?utf-8?B?Smk1WWxLd2xnVkE2UWFQYk1XVUQxYW9sWHVmVDZZM3NkdGxXR2gyTFlVTE5M?=
 =?utf-8?B?bnJiUGw2eWF2NGFiMmhDSXhZQ2VoM3BXZG9oeE9GZlFhNU84cFZaSmFmcndZ?=
 =?utf-8?B?M0U1WEhqaUZIU2FSajRxYTJIQ0VDcEZOVmV4NEk5b1B2Y0dWN0c5ZW1Jc0pR?=
 =?utf-8?B?SldXc1E5S0JWUGNzOHdzcTlWMnVMSXpIOW10bUlqUjQ1WUZKb3lCaEl1VXRO?=
 =?utf-8?B?UnNyWEsrbXlpTGwvd2E4UjhVbk5kMDNxbHZlYlp0Mms2OVc4MGdNMllCRm5K?=
 =?utf-8?B?N1Y0L1gzc0dCZnVEZjNuMG84RHhlNUVza09OemltZDE2YmV1WlpEOG8vOHYw?=
 =?utf-8?B?d0JMK0UzczhUK0lVK0VMRFZ4RU8wR2ZNNFhPQmhmQUpVZDFiZW9lQ1VCTjdJ?=
 =?utf-8?B?Q3VIVG91T1EwZmVxME9KUEZnTitYQWU4cHNCeEtUL2trNFNESTVpTGpBU2pC?=
 =?utf-8?B?SXlNM0hQQ1RRK0Q5UEdZVnRNKzlXWFNTT29Nc0ZiYVdwdHBBTnNiaXRQK3dU?=
 =?utf-8?B?WEMvZ3FGc216L0NHR0JtUndzeHlodTYxWUdlZXpzMGNyODZNd1BEZTZUcnYr?=
 =?utf-8?B?aVo0TmRWMThkdjRsbVBvUnV5MmlHNTc0UTBEMHQ1YjM2VGZic2dyb1M4eUxJ?=
 =?utf-8?B?T0Z5SlFYVGJlSWVqYWp0VUhWaGd0VjBDaHVzeHlFNG1rN0FTSzkxZTQyQ2tk?=
 =?utf-8?B?VFVvd1hWVUxtbXJPK3puZ1BMa2FlUERnTi96K1E5VmtmUkZYMkliNFlYYS85?=
 =?utf-8?B?Vy9wWXdocUl1MVN2QUJIVlkvM3Q5QmltVjg5dmFYY3lWUm9iajYzU3E3Vy9p?=
 =?utf-8?B?cmFVdWlvcFpnQjQvQ1JGbW1tVXM4dHg3UCtOTElBWXVVbHZUVmhmSWpMZGM0?=
 =?utf-8?B?VXJBVVRCZlk2azJWcHV0MDNKVVp5Qmx1aEtjQTc1aFprR2dUL05XaFFwZVRj?=
 =?utf-8?B?OFBOQlBJSy9PR3ZSRlZhcjF5N3BXWUxiOWNOQ2xwUjJYZmxrNHRjdWx0TnZY?=
 =?utf-8?B?eGFFb01TZUtWZnFlYVpvS3ltMHBMaS96Nk1Mc0MzWVNTdS9xVjZ5VE16aExO?=
 =?utf-8?B?bm5SWDV2bWNjRVlxanZ3aGNEaG4wR0hONkk1WWthSHE0TDQvV2E0MUJDeDNU?=
 =?utf-8?B?MktEVUFKTlNodW92YkhhQUxsWFRhYVRMWk5JdjZORjJxd2k5dGVHOUQ1K1hl?=
 =?utf-8?B?L0NBazI3aTlub0E2djY0YzROelEvWk52U3BpZ1NXYy83MXhXRmhUc3UwNHp0?=
 =?utf-8?B?UlkyNFpKdHpHQjZBU1JXK0RlSmdoMC9aTDVKc2R0ZENjNmJPWU1QbVFzTHd3?=
 =?utf-8?B?b2VlRjJFQ2dINTJaU2hVRG94Lzk4cDIrY3Jnc0FNL0RBSUJUV0ZRdlEreGND?=
 =?utf-8?B?YThJdVUwZHdPeTFRV3VNZmNPNEUvRmFRWkk0U0czQUgwc2hTMEtLNG9sa3JT?=
 =?utf-8?B?MVI5SFRHVFdDbGpwS1NHMzNWaUJWMGZhUEFqVmlPVjlYZW9CRVY4RW1aYUpW?=
 =?utf-8?B?UW9XUHNKQm5TWHZLNU9tbk8wZUxseTIzNUNSM1YxbHhNaHduUnhoWjYwakI4?=
 =?utf-8?Q?SRuLS2Wf9J8yqVyeAibv9ACpZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96030438-3708-4a0c-4cca-08dbc0ed374e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 13:08:47.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0BOf0dIA31S98wTjZBOlQdbI4HxfS7aotW1LgHNcVQyiqz74/PD7nvvTV9NmgvljzjYKP7n33XwK8bs6Os7cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-29 03:35, Pekka Paalanen wrote:
> On Thu, 28 Sep 2023 16:16:57 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2023-09-25 15:49, Melissa Wen wrote:
>>> Brief documentation about pre-defined transfer function usage on AMD
>>> display driver and standardized EOTFs and inverse EOTFs.
>>>
>>> v3:
>>> - Document BT709 OETF (Pekka)
>>> - Fix description of sRGB and pure power funcs (Pekka)
>>>
>>> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 39 +++++++++++++++++++
>>>  1 file changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> index d03bdb010e8b..14f9c02539c6 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> @@ -85,6 +85,45 @@ void amdgpu_dm_init_color_mod(void)
>>>  }
>>>  
>>>  #ifdef AMD_PRIVATE_COLOR
>>> +/* Pre-defined Transfer Functions (TF)
>>> + *
>>> + * AMD driver supports pre-defined mathematical functions for transferring
>>> + * between encoded values and optical/linear space. Depending on HW color caps,
>>> + * ROMs and curves built by the AMD color module support these transforms.
>>> + *
>>> + * The driver-specific color implementation exposes properties for pre-blending
>>> + * degamma TF, shaper TF (before 3D LUT), and blend(dpp.ogam) TF and
>>> + * post-blending regamma (mpc.ogam) TF. However, only pre-blending degamma
>>> + * supports ROM curves. AMD color module uses pre-defined coefficients to build
>>> + * curves for the other blocks. What can be done by each color block is
>>> + * described by struct dpp_color_capsand struct mpc_color_caps.
>>> + *
>>> + * AMD driver-specific color API exposes the following pre-defined transfer
>>> + * functions:
>>> + *
>>> + * - Linear/Unity: linear/identity relationship between pixel value and
>>> + *   luminance value;
>>> + * - Gamma 2.2, Gamma 2.4, Gamma 2.6: pure power functions;
>>> + * - sRGB: 2.4: The piece-wise transfer function from IEC 61966-2-1:1999;
>>> + * - BT.709: has a linear segment in the bottom part and then a power function
>>> + *   with a 0.45 (~1/2.22) gamma for the rest of the range; standardized by
>>> + *   ITU-R BT.709-6;
>>> + * - PQ (Perceptual Quantizer): used for HDR display, allows luminance range
>>> + *   capability of 0 to 10,000 nits; standardized by SMPTE ST 2084.
>>> + *  
>>
>> I think it's important to highlight that the AMD color model is
>> designed with an assumption that SDR (sRGB, BT.709, G2.2, etc.)
>> peak white maps (normalized to 1.0 FP) to 80 nits in the PQ system.
>> This has the implication that PQ EOTF (NL-to-L) maps to [0.0..125.0].
>> 125.0 = 10,000 nits / 80 nits
>>
>> I think we'll want table or some other way describing this:
>>
>> (Using L to mean linear and NL to mean non-linear.)
>>
>> == sRGB, BT709, Gamma 2.x ==
>> NL form is either UNORM or [0.0, 1.0]
>> L form is [0.0, 1.0]
>>
>> Note that HDR multiplier can wide range beyond [0.0, 1.0].
>> In practice this means that PQ TF is needed for any subsequent
>> L-to-NL transforms.
>>
>> == PQ ==
>> NL form is either UNORM or FP16 CCCS (Windows canonical composition color space, see [1])
>> L form is [0.0, 125.0]
> 
> Hi,
> 
> what is [1]?
> 

Oops.

[1] https://learn.microsoft.com/en-us/windows/win32/direct3darticles/high-dynamic-range

Harry

> 
> Thanks,
> pq
> 
>> == Unity, Default ==
>> NL form is either UNORM or FP16 CCCS
>> L form is either [0.0, 1.0] (mapping from UNORM) or CCCS (mapping from CCCS FP16)
>>
>> Harry
>>
>>> + * In the driver-specific API, color block names attached to TF properties
>>> + * suggest the intention regarding non-linear encoding pixel's luminance
>>> + * values. As some newer encodings don't use gamma curve, we make encoding and
>>> + * decoding explicit by defining an enum list of transfer functions supported
>>> + * in terms of EOTF and inverse EOTF, where:
>>> + *
>>> + * - EOTF (electro-optical transfer function): is the transfer function to go
>>> + *   from the encoded value to an optical (linear) value. De-gamma functions
>>> + *   traditionally do this.
>>> + * - Inverse EOTF (simply the inverse of the EOTF): is usually intended to go
>>> + *   from an optical/linear space (which might have been used for blending)
>>> + *   back to the encoded values. Gamma functions traditionally do this.
>>> + */
>>>  static const char * const
>>>  amdgpu_transfer_function_names[] = {
>>>  	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",  
>>
>>
> 

