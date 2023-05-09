Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ED66FCCAF
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 19:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8F210E3B4;
	Tue,  9 May 2023 17:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82910E3B4;
 Tue,  9 May 2023 17:25:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuF+kETVKX/nb6ticaUhWtgBezqd76mXh0Zg/3uVE4lGCeBf9ZflY8KJI/yfXTrbfxaNq454wxZ6DLwLERe5HMzvCheTmgCjhENutsTzHLMz/f+8bv+oHiWEwkGM3p7HJh4p1gVOwxkkgVQb+67VxEdMINM3A8l6QU844HcH8YfyhbdNEJ6bJFjlDkC18qgTHVMgLvH35MRqCCS+SgOYXa5XdxCYPocPZLP0f4/zUak6G5PBBjB0iuDp36kpe40bd+I5VxcN78YjVYuGYunBOqKzCM8XWrFIT2w9e1BtMuTzHZzQkPINFbCn6+hsVfkhVYyBFUz6/j98cjcpQFTdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zx5k5uLKXs3Cd2fSpER135m2Im1IDR4BfLjnrJssCM=;
 b=CIIF88u3hzlxdT6aPxjB1zcB3ocVeMzRbQdChxAtd3QMpAZ9lULDWLd3raoGolNYo/BlvVJf14didkhVmTgsBw0akfH2Bs2mutCcenYmK55oioG9d5on/FfLFpzKtxqXTEDJ1fOJlZhZKk3Ns6KPsZprVpJx6LJgAsH5h0rJZM0eTNmdKiNEFWEQLj4pfenlQIZdj6+pHu/W5Vn4uqs7fWvjmWfUGbBsJYIEvrdh2RvcppG1NN3HUweEa95tyXa0AmJxPaX9pSYS2ucwXpdGo3TElZC6Dj7WHSZKxIfqJgeoERd8V3GPm9Foo/J/Ny0hZlxC9iOsh5T5ykWJ3wat/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zx5k5uLKXs3Cd2fSpER135m2Im1IDR4BfLjnrJssCM=;
 b=1pdJUvaRlKK6kmeFIXo1XHDmMLxTfsnhyihFUkqpoS7q0cDk/55gm9FrISzBUxK1exOEfniN4DuRefSMMCnnIQrM7XPFfTreqkdsoAnNfOXw3d2DjEWFedfVxSZ71bMhsJz3L5S+cQdu+FiSeXFpE3XZyf73OJ9SB8FzFWrNib4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.33; Tue, 9 May 2023 17:25:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%6]) with mapi id 15.20.6387.018; Tue, 9 May 2023
 17:25:54 +0000
Message-ID: <ff6a3832-1c99-6e00-31a3-cc597cbc01d0@amd.com>
Date: Tue, 9 May 2023 13:25:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [RFC PATCH 00/40] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
 <ba9b8a67-37a7-d924-d673-f716b3192bb8@amd.com>
 <20230509165208.kaydnbcc22ejj72u@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230509165208.kaydnbcc22ejj72u@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0167.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM8PR12MB5413:EE_
X-MS-Office365-Filtering-Correlation-Id: ae900e0d-e8e7-4270-1561-08db50b27130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TOtP/dZLC3nwpSPmSIHK72h3VChXoE9rPAgeY1lNbrxLCh3By0/9FNmrRGTV4FkQEfe1EqbAsKDz5bHOSfs7+jdgCPOIc8SRwE0RPp3tQXOTmCvExP+k68u1gl6khn7p2YJJ7a6bdpnw+y7p+606QMOzLaU9mcesDbRdjGpOUbDQRIvmYHrtu9c5K081e6mQuQqVBb1CKDCLlv9/kPvAtWVZgzqBv0FlAAKHh/lPWiMfXYzq1wkLv5eRRK2dWwMj3E46DVHsBptSAXFuXKsuY+g3ZU2L3ninIrlS1iKRQbKqx+0FnhMhSkeLjhB9++ArVCEmC+u9fHitZEfJu8d4VhwwSavK+USXY0FRKdAFxt36QPHk/EYSF5qSaTsY0Co/+uyFfpyhiKCNC/NMVpLyRLleltjJaG78ZXBeRnPvsUElYmMchZf8Eg4IKpEvBHWiqJbU/D5Q5FfDb9Xf98fkHQagYqEEvzrw8FvAggb4WRgKHdeTp8yjkMHFZTfPdX2EktRP6hRpZAO7NNCf3u7LhJuAZFW+a0Ozpt33dLetfAk+GkooVqefjvabknzukPB9AUeqpmI+wODMB2U1yqAPYkYulyVwGlsVBN3hQbwwBh3d7Sx2saM+sr6bDQVww4LF9sepAGcUnk/OFmaW4hT+76cxGaq3xYJbFjnbYCqDGN5LSAtSowq1ycxnC9nH4Kpi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(5660300002)(44832011)(7416002)(8676002)(966005)(8936002)(2906002)(83380400001)(2616005)(186003)(30864003)(36756003)(38100700002)(86362001)(31696002)(53546011)(6506007)(6512007)(66476007)(66946007)(316002)(6916009)(66556008)(4326008)(26005)(54906003)(31686004)(478600001)(6486002)(6666004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZPYXJYSEIreE1CK3gvUnpLQWorMGh4T1RpMHpxbmRmV0h3ajdqNDFFOVUv?=
 =?utf-8?B?UHJkdXluWStkOTczK2xMdzFJWDF3N2JyMDNJcjBheWcyTXo5R09UWVVpRTRo?=
 =?utf-8?B?ZFhtdjk4eHZRR2RkRkJmSHIrTFpLbVFwdkFzZDNKOXBSTStiY3d2a2tGd3Zh?=
 =?utf-8?B?NkE4NUorcGxxczdsTDQ2cjZFeTN0U2hLY1VSUkNkdFRuU0VmS1NZOHMyQ3U2?=
 =?utf-8?B?eFVpZlV4V1g0Tm9xbzQ1VHFieEE1ZGlWVXZOSWthMXpaZEJ5TVdCYmppdWhT?=
 =?utf-8?B?cjlkUjg2cVdkNm5SVWJSdjhNS3R0NkVMOEJGQ3VzTS9OVzVCdm94aS9oMXRn?=
 =?utf-8?B?cDl0L21KZVpSL29NQVJkYjFWNGtYOXZGRHk0SHBpb0RPV3NycnpFR1FyODIx?=
 =?utf-8?B?TU0wVUFOb2FZSGUvRmMreGlmVXdYMnJSWE93UmxranZBSmp6cGttRlJZRkww?=
 =?utf-8?B?WWxwZWlSVnRCeXBpYTd3VkUzSWFSRXYwcUNKbzlUcVFXNVU0eDJibllzejl1?=
 =?utf-8?B?Q0ZUaGtvOUpIbjZiUzVRb1ZBc21pV0djS21rU25PdEdiMURLd1hwTlZqbGda?=
 =?utf-8?B?eWZmcTA5YnhTVnQ4UENsUWZRczk4OHlZNnJ0Y21XN2pyWDhLNUx2UmZjWHhG?=
 =?utf-8?B?S0gwVEpuWi8rMFJ4YnZTcHc3T25TV3c0L3ExV1d3RFY0cHdmZzk1cS9ybGxO?=
 =?utf-8?B?blVmREIzb0cvcUtKbm8yaFpyUUttVjRDSS9SL2FVV3FWNDFyczY4MTlUT1Az?=
 =?utf-8?B?dnBvd1NXOEpDTkhhV2ZoTzAvREJhZytPelQ2dUJNMnF2aytOUlAvN2FhdUl0?=
 =?utf-8?B?akViQ3ZuMUpiZExMRUVTTnJQTlZ5UStsM1JreE54WE1PQ2gxVjd4SjU4OWI4?=
 =?utf-8?B?dkdRRVZPQ3R1dU91ZjdpQzU2blF5VGpEcElMUS9ka1FoZWtHQXJiaVF5SlFI?=
 =?utf-8?B?ZUZ5ZEgwMDdjSTV5dkllOExPdkJqTmdQc29yWWZYM2g4NEI4OGZaQTlSVnNt?=
 =?utf-8?B?SGVXVngyd0dlSkdDajNDRXh6RE9mdmlXbURpYndMTzBvbGsvQzBkZjVvV1l1?=
 =?utf-8?B?YkZsb3hXU3haanBHNEMvcVdhWnNqVVVEcm5lY1ZtTlJoZGRGSUtFbXVIVjlH?=
 =?utf-8?B?SStYS0puNFd0b3ZvYit1Sk1EVXoyamJ2bWR1UktCU2Yra25sbDZacGZvdTZa?=
 =?utf-8?B?aVM1SlZyS0VlVHhHUmdkblA5OGgvRHU2TXpyUW9GVE90ZmwvMnMzWmV4SjhN?=
 =?utf-8?B?M1J6WnJWK1FuNFdPZ3M5REc5RW84SWg3alhZeVR6SnQxTEJuWXJwdjI4dWZT?=
 =?utf-8?B?TWxma1RMNGR1TlRQcmtxQXMvQTllU1Rrb1Yyem4xK1A2RGFFNTR5aUFpeDd0?=
 =?utf-8?B?Ym5LTmxDUXpLWVdHR2JNYzQraUV5dUJ4SndPVVMrcVk4ck1oWENrQzZiUmRC?=
 =?utf-8?B?OVdxMXJRWkJXN0FvWGJ5WjJxU25oN0xwZHVYQ2xoSjVJUXFBemdma2NNQkY1?=
 =?utf-8?B?OElKS0JLMEVubTFCQmlRVlppbVozY1gwVzFlNzYrRnRTeVd0ejROT0UvMmcv?=
 =?utf-8?B?T09wZGNYSXBxNUgrQkZ0TExlZVlmdURDczBudGs1RlhQdVJacHVsREJGSFBm?=
 =?utf-8?B?UTU4R1ZYUExNSUVuOE9OM0VIMGFtTzVZOTVpbG1hV0NiUENBRUZjRmIveFJh?=
 =?utf-8?B?Y1NRdlNIWUhQQWpKM1lxcUZlWkYzZkJHY0cvWFF0OGJyckErUnVscGRaR0Fj?=
 =?utf-8?B?b1ZSUDBlZ0ZrMkc5R0hpZmJKYTV2UnlVemRKclRCQnY3dHI5RXpDQ21rYzZT?=
 =?utf-8?B?REpIMlRBSzNYNWo0VmdiMmwxMXRsSHBFUWNhWWsrcDVML1g0aGo0S01WeEhy?=
 =?utf-8?B?anFlVjZoYk1XQ2JEcE1zaDlqOVBtc0t6QlhtK3RzMVNsMEZmdnBsRXVDOXht?=
 =?utf-8?B?V3FzVFZOYVltOXQ0UUkxTWEraEFhVDVDalpHUFk2K1N0dTUxY1AyazNpVGFJ?=
 =?utf-8?B?akVEU3dxMW83VWZRVWVXaDNGVWpRNVlpVjZBVW14Y1hzOVI1WGdlR296SDBn?=
 =?utf-8?B?R21yV0tlelBPVW1VRHd4SXBPenl3a2cwd1pEdEhTaXY1Q3d5RVdyQlBtWDh1?=
 =?utf-8?Q?L+xL/CawQV66QNyuAmw6q+rug?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae900e0d-e8e7-4270-1561-08db50b27130
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 17:25:53.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3wtm6ruxR42fuGH3KlhJet9H6B9zqagdXWddvgH+P2rMZI5Ja3QzSMEV2SWMynyTh85AuAWjf6tmb+3SUtvZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5413
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/9/23 12:52, Melissa Wen wrote:
> On 05/08, Harry Wentland wrote:
>>
>>
>> On 4/23/23 10:10, Melissa Wen wrote:
>>> Hi all,
>>>
>>> Joshua Ashton and I (with the great collaboration of Harry Wentland -
>>> thanks) have been working on KMS color pipeline enhancement for Steam
>>> Deck/SteamOS by exposing the large set of color caps available in AMD
>>> display HW.
>>>
>>
>> Thank you for your work on this.
>>
>>> This patchset results from this full-stack work, including pre-blending
>>> and post-blending new color properties. The first two patches fix
>>> quantization issues on shaper LUT programming. Just after, we have one
>>> patch that adds a config option to restrict AMD colo feature usage. The
>>> following 13 patches implement AMD driver-private color properties
>>> (pending detachment of property counter and plane color_mgmt_changed
>>> from DRM). Finally, the last 24 patches rework the AMD display manager
>>> and color management to support the properties exposed.
>>>
>>> In short, for pre-blending, we added the following:
>>> - plane degamma LUT and predefined transfer function;
>>> - plane HDR multiplier
>>> - plane shaper LUT/transfer function;
>>> - plane 3D LUT; and finally,
>>> - plane blend LUT/transfer function, just before blending.
>>>
>>> After blending, we already have DRM CRTC degamma/gamma LUTs and CTM,
>>> therefore, we extend CRTC color pipeline with the following:
>>> - CRTC shaper LUT/transfer function;
>>> - CRTC 3D LUT; and
>>> - CRTC gamma transfer function.
>>>
>>> You can already find the AMD color capabilities and color management
>>> pipeline documented here:
>>> https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#color-management-properties
>>>
>>> In previous iterations, we tried to provide a generic solution for
>>> post-blending shaper and 3D LUT [1][2][3], and also Alex Hung worked on
>>> a pre-blending 3D LUT solution[4] extending plane color mgmt proposal
>>> from Uma Shankar [5]. However, we identified during our work [6] that
>>> AMD provides many other valuable capabilities that we don't find in
>>> other vendors, so we started to work on AMD driver-private color
>>> properties that better describe its color pipeline, enabling us to
>>> expose full AMD color capabilities on Deck HW.
>>>
>>> Our primary purpose is to avoid usage limitations of color calibration
>>> features provided by HW just because we don't have an interface for
>>> that. At the same time, a generic solution doesn't fit well since some
>>> of these capabilities seem AMD HW specific, such as hardcoded
>>> curve/predefined transfer function and shaper 1D LUTs sandwiching 3D
>>> LUT.
>>>
>>> So far, we keep these properties' usage under an AMD display config
>>> option (STEAM_DECK). However, we are fine with having them fully
>>> available to other DCN HW generations. In the current proposal, we are
>>> already checking ASICs before exposing a color feature. We can work on
>>> 3D LUT resource acquisition details to fit them to DCN 3+ families that
>>> support them. Indeed, before moving to these config boundaries, we
>>> started working on an open solution for any AMD HW [7].
>>>
>>
>> The problem with a CONFIG_XYZ option is that it becomes uAPI and can't be
>> removed. I feel we have a good proposal going for the generic solution.
>> Would it work for you if we don't make this a CONFIG_ option? What I mean
>> is using
>>
>> #define AMD_PRIVATE_COLOR
>>
>> around the interface bits, which are only compiled when building with
>> -DAMD_PRIVATE_COLOR
> 
> I think we can go with this approach for the properties already in use
> by Gamescope/SteamOS.
>>
>> That way we have the option to rip the driver-private stuff out later
>> while still allowing for experimentation now.
>>
>> Or, alternatively, we can merge everything but the stuff currently
>> guarded by CONFIG_STEAM_DECK, so that custom kernels can enable this
>> functionality by simply merging one patch that includes all the
>> CONFIG_STEAM_DECK stuff.
> 
> An then we can drop the interface of things that Gamescope is not
> managing, but keep those things already programmed on DM color for any
> future usage. What do you think?
> 

Sure.

Harry

> Melissa
> 
>>
>> This will allow us to merge the vast majority of the code without
>> having to maintain it in downstream repo.
>>
>>> The userspace case here is Gamescope which is the compositor for
>>> SteamOS. It's already using all of this functionality (although with a
>>> VALVE1_ prefix instead of AMD) to implement its color management
>>> pipeline right now:
>>> https://github.com/ValveSoftware/gamescope
>>>
>>> We are planning on shipping our color management support with gamut
>>> mapping, HDR, SDR on HDR, HDR on SDR, and much more in Steam OS 3.5. A
>>> brief overview of our color pipeline can be found here:
>>> https://github.com/ValveSoftware/gamescope/blob/master/src/docs/Steam%20Deck%20Display%20Pipeline.png
>>>
>>> We have also had some other userspace interests from Xaver Hugl (KDE) in
>>> experimenting with these properties for their HDR/color bring-up before
>>> a generic interface is settled on also.
>>>
>>> It still needs AMD-specific IGT tests; we are working on documentation
>>> and adding plane CTM support too. 
>>>
>>> We decided first to share our work to collect thoughts and open for
>>> discussion, even with missing refinements, since driver-private
>>> properties are not the usual DMR/KMS color management approach.
>>>
>>> Please, let us know your thoughts.
>>>
>>
>> As discussed at the hackfest I think it's a good idea to have something
>> that's easy to enable for the purposes of experimentation (and to
>> help downstream users that help us figure out how this all fits
>> together, i.e. SteamOS).
>>
>> Harry
>>
>>> Best Regards,
>>>
>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>> Signed-off-by: Melissa Wen<mwen@igalia.com>
>>>
>>> [1] https://lore.kernel.org/dri-devel/20220619223104.667413-1-mwen@igalia.com/
>>> [2] https://lore.kernel.org/amd-gfx/20220906164628.2361811-1-mwen@igalia.com/
>>> [3] https://lore.kernel.org/dri-devel/20230109143846.1966301-1-mwen@igalia.com/
>>> [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex.hung@amd.com/
>>> [5] https://lore.kernel.org/dri-devel/20210906213904.27918-1-uma.shankar@intel.com/
>>> [6] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-color-mgmt
>>> [7] https://gitlab.freedesktop.org/mwen/linux-amd/-/commits/amd-private-color-mgmt
>>>
>>> Harry Wentland (2):
>>>   drm/amd/display: fix segment distribution for linear LUTs
>>>   drm/amd/display: fix the delta clamping for shaper LUT
>>>
>>> Joshua Ashton (15):
>>>   drm/amd/display: add CRTC gamma TF to driver-private props
>>>   drm/amd/display: add plane degamma LUT driver-private props
>>>   drm/amd/display: add plane degamma TF driver-private property
>>>   drm/amd/display: add plane HDR multiplier driver-private property
>>>   drm/amd/display: add plane blend LUT and TF driver-private properties
>>>   drm/amd/display: copy 3D LUT settings from crtc state to stream_update
>>>   drm/amd/display: dynamically acquire 3DLUT resources for color changes
>>>   drm/amd/display: add CRTC regamma TF support
>>>   drm/amd/display: set sdr_ref_white_level to 80 for out_transfer_func
>>>   drm/amd/display: add support for plane degamma TF and LUT properties
>>>   drm/amd/display: add dc_fixpt_from_s3132 helper
>>>   drm/adm/display: add HDR multiplier support
>>>   drm/amd/display: handle empty LUTs in __set_input_tf
>>>   drm/amd/display: add DRM plane blend LUT and TF support
>>>   drm/amd/display: allow newer DC hardware to use degamma ROM for PQ/HLG
>>>
>>> Melissa Wen (23):
>>>   drm/amd/display: introduce Steam Deck color features to AMD display
>>>     driver
>>>   drm/drm_mode_object: increase max objects to accommodate new color
>>>     props
>>>   drm/amd/display: add shaper LUT driver-private props
>>>   drm/amd/display: add 3D LUT driver-private props
>>>   drm/drm_plane: track color mgmt changes per plane
>>>   drm/amd/display: move replace blob func to dm plane
>>>   drm/amd/display: add plane 3D LUT driver-private properties
>>>   drm/amd/display: add plane shaper LUT driver-private properties
>>>   drm/amd/display: add plane shaper TF driver-private property
>>>   drm/amd/display: add comments to describe DM crtc color mgmt behavior
>>>   drm/amd/display: encapsulate atomic regamma operation
>>>   drm/amd/display: update lut3d and shaper lut to stream
>>>   drm/amd/display: allow BYPASS 3D LUT but keep shaper LUT settings
>>>   drm/amd/display: handle MPC 3D LUT resources for a given context
>>>   drm/amd/display: add CRTC 3D LUT support to amd color pipeline
>>>   drm/amd/display: decouple steps to reuse in CRTC shaper LUT support
>>>   drm/amd/display: add CRTC shaper LUT support to amd color pipeline
>>>   drm/amd/display: add CRTC shaper TF support
>>>   drm/amd/display: mark plane as needing reset if plane color mgmt
>>>     changes
>>>   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
>>>   drm/amd/display: reject atomic commit if setting both plane and CRTC
>>>     degamma
>>>   drm/amd/display: add plane shaper/3D LUT and shaper TF support
>>>   drm/amd/display: copy dc_plane color settings to surface_updates
>>>
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 153 +++++
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  92 +++
>>>  drivers/gpu/drm/amd/display/Kconfig           |   6 +
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  31 +-
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 120 +++-
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 613 ++++++++++++++++--
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 124 +++-
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 238 +++++++
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |   7 +
>>>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  49 +-
>>>  drivers/gpu/drm/amd/display/dc/dc.h           |   8 +
>>>  .../amd/display/dc/dcn10/dcn10_cm_common.c    | 109 +++-
>>>  .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   5 +-
>>>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   9 +-
>>>  .../amd/display/dc/dcn301/dcn301_resource.c   |  26 +-
>>>  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
>>>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>>>  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
>>>  include/drm/drm_mode_object.h                 |   2 +-
>>>  include/drm/drm_plane.h                       |   7 +
>>>  20 files changed, 1509 insertions(+), 104 deletions(-)
>>>
>>
>>

