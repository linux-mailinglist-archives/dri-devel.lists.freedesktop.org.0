Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59A75254D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 16:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E63C10E0E3;
	Thu, 13 Jul 2023 14:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCD010E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 14:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6PRVrMNgbM/+RLaVkMduPHucdayO3BxDwqHGbuPGPVkM7yjZOWUIF+hgKF9G9NpegrDYmOHRCxMFBFfkHQAk42edDUE85S0i3Px6xt54rTA+uvMkYliP7EBgwyjYDfD6NpJdPDlumV28fGrvfTaiPXNKEVV4m1cDH3KU93ZtuH9btxadAlswoD2gvCjWPD86o7j91A0H+GNOnT5J6QeXMbJ+KFDJMYLvyBqVKbRQlmJc+5z/IXvY8Sbp4zULAC+4I5nv3FMuM7WUsOadcngAJHDtkz9X2fLHudU7VZ2MI0T2htAvI8LT8C0JWg2YJgwKKJnJ7cYobAqYAzfvEU51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y67t2q7STRB/Tr5YZnAooo1/iKAIg4iCDkly8cNob6Y=;
 b=LQjEO++JQxG5RM7cU/fChIX7he/7qopXNWOtfgWBAQ5u52aHjFaubFbC/40J/BTlJs4O29ArzpRgZ0Ywj3U/CX8ntHU2FJWw0inB/cvp+mus+Bibaf70jQSy3/R8N3rw4bz5C4nLkq41+g0yt+6Uhl3FB3kEA2QUJ/mdp1V6B9+Bv9WP2ZHXlitcF044gV1EvoHqEulcUQfvrwm0jvQLMhNrriyFWViZNgzYz6gIkfHsPZLaGJIYB23HfY5aPv4DC7PieeNXa7vm4k4veKX1zWZtCW17TFrZn5CnhN85l3FjKnZdJgEwY79zrjgSYQvfMb0vwXizGsfTnAYDDKndEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y67t2q7STRB/Tr5YZnAooo1/iKAIg4iCDkly8cNob6Y=;
 b=g6sXbC5ZG/mbKYmnbbmdMXDuS4MT/cOInVDXSrjPY6WssiVYQ0ITTzLgIVS92Xt+ChScTM52DZz7FqjFjctYsZoTIcFJrMiMKlfZ47squi3q89HQpv7UejbiJdIQ04WRINj5AEAlrBEZeGk5Af7ejaowMhc2d/kHAQRkrIfimPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 13 Jul
 2023 14:38:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::669f:5dca:d38a:9921%4]) with mapi id 15.20.6588.024; Thu, 13 Jul 2023
 14:38:43 +0000
Message-ID: <65b64123-2d41-7d42-d6cb-fd4215aef661@amd.com>
Date: Thu, 13 Jul 2023 16:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com> <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230713141023.52dkz5ezicwev74w@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e5f222-8fda-4943-3e06-08db83aedb7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Hy7228x8SoYimAPc2QyA67Xg2ejzEGzxyvZwmLKVTW4IVxpQ7/eGAF0dmlPEoshz+guBA8GP0JPhr/IzZLrmWxQWg0Q7yWiKLis6dfDeFaXsb2+cc4pR4U1thCcLiuBzoUh510246JFudxTwSFb5hOwqzJgCqjbmu1ybRSb2akgn7t/GhgNbQlONEoVA/P8944MBf6yaWrXIMcauzmLc4k3518FHUU2Qp63Cy8jMIurfCFqqte1VZEMF9ZDY3Vnx5fIae9CmxtT5nsTOK4IBcaMxXBUKHsA8uAcxsAR+cjxICNTRrtTJcfW/4lXNwKsyI2lLBp2IKeMyJI75yIGL9yyKVEuAXNbGFhW8tdudQ2l1hZCCHuHmSvSAV9oSAYtQOwvVp3kNPxCkrlLboVNg2XEpyM5oHQgl2ZpJpHFYxDFj+71uXN7fNonEOXUxiGeiMN+whbU0rg9o+MOaZxjRcdZKWw+G/tjO/Vg8NiargCvTjfOvf/4vmEHvsX//6sMs6DH+fWlbh6GnIrR0r/58ipJYXDW5vlNmdtvj+skmcsd4198dRhn3K8vtfsYpPSKYZc3GfFACiKIeY7ZnMOf/RwqLHHrkM2CPDJnCQDOoK6cJKbMK5NuNgQsSCE1ItNGHwrYnvwjl3vW1fWsP6FmpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(8676002)(8936002)(6666004)(7416002)(2906002)(31686004)(41300700001)(5660300002)(316002)(4326008)(66556008)(66946007)(66476007)(110136005)(54906003)(478600001)(6486002)(36756003)(38100700002)(186003)(6512007)(2616005)(31696002)(86362001)(83380400001)(66574015)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRQZDI1QlVrNXhDUkk4MU5pZnZxWmxWbEVFSU9ockRENWt1ZFVhVEszbVpo?=
 =?utf-8?B?dmk0U0NPMG9HcFF5YmdaYzE0dk5CN2QzaTg2UzBKUlpCWTRtcDBYSFBaVHBo?=
 =?utf-8?B?TVc4eTJwQUVkU09pRmIybnRHN0JtYUdZVDZxNk1XbnJPdmZ5Tys5b1U3T3BL?=
 =?utf-8?B?b3MvWVBIUmVaWWtTSGV5RWJhcnRsVWQvTU5kdmgxN1g0M1FmMGtMeklMeFpP?=
 =?utf-8?B?Rm5FV0h3QTBGR01hakx3UXprNjFGWHlEQXV3d3J3dTdzelpuQ0s2SzZ2TWxF?=
 =?utf-8?B?clRPL2RyTFZRQWsyUTlydmVFZC9qYm9BWGVhZTJ4a3p6aTgxSjcxVmwyY21C?=
 =?utf-8?B?RWk3QjROMjZ0SkVmREdGbFRmN3kxd0Jnby9rcTJvcGdkam1yQkorUnRSbGtZ?=
 =?utf-8?B?dTFmUi9DWUxpd1B4aEd4ZU5jTEl6ejQzaTljeHlST1hZMUVHeGZaSk52OHRu?=
 =?utf-8?B?THBOM2labVRCcjRQaUZra0RNUUpaWFVpTjlwTG5KbzZLUnI1Nk9xNFRJRmU5?=
 =?utf-8?B?eXdCSzNueTNMUTY1QjRpcVZSb0NpeXU5dVIzUEM5ZHVLM2M0YUVtbDZRK3do?=
 =?utf-8?B?ek5jRkFxRGQwekdpQnlTUEZhTC9qcTQ1czlKejdacWxQSDF2UmZ5N01nOUlp?=
 =?utf-8?B?Nm8rSmNoam5xa1JYUW1hR3Fyd3lqRlFkZVBmL0VZcGhoTnpIV0FRSXJOclVE?=
 =?utf-8?B?Z0tRQjFraGlzRkRVaUxwR3hDUmZIQUdhNkV6dGVGWjBQYW5hWTdwUnF4R3ZE?=
 =?utf-8?B?a3FtTzdYdHA1UlZ3TDJjYlkzMFRjZVJDa0VSTmhXOGdlQTFDUGtod2o5Kzk2?=
 =?utf-8?B?Y01DTWkxeFdsOTRHYXdKR2NFTEJ1dk1hMDVkOG53ZERPWkdhWW1ZV1FMWGx2?=
 =?utf-8?B?Z21pQkVNenpEQk0zL3VWN3B5QUVXOCtTQWUzNUYxdmVtOTJBSHJ6blRFSWF4?=
 =?utf-8?B?eEJaNmF3MTVhZ3hFUUZNV01qUjR4cUk3eGhyWUNxQ2tiQ1Rldm1MRXBPTXY5?=
 =?utf-8?B?SS94dWR6MUdYTVRSaWNxbjR1Ty80S3dKanlEb2VHRVJRTXNZVTF4UkZSWEwy?=
 =?utf-8?B?TXJmSGQ3bnF4VTlJR2M3RXBOd3E5VGd6TzAwdEhyb0I5QjFqbE1Ubk5ZUXFu?=
 =?utf-8?B?R0ZmWHNET3daK2pBZnZ6L0gzYkVYeDFNOE1QeUtaUUFWZ2ltZjJvSU0yL2l6?=
 =?utf-8?B?SkUxTzJhWEk3dVkwU0JMTDIwRElLT1hUZlg2YlQ1K2w1V0VPREpMMmdwdW44?=
 =?utf-8?B?aVRueVQxM1F2RUlTL0Q1b2UreDlJQXNJeGRLdU5xa0xEbFFvRmJMOXdIc2hZ?=
 =?utf-8?B?aWdwclVBV1BLMzhCWGZNbkJmemdrQ2NMSU9hNTZ0VGRGRnBPUndwUzdwZ3VE?=
 =?utf-8?B?U1pFbXZ3cFVOVlZHQjNUb3BHbzM4UFVxYW80K2UxY3Zmb0xTdzA1ckFVLzRB?=
 =?utf-8?B?cjZJQUhaV3NGcjk3aElzNHplSzdSb1hhN2R4WWZVSjAwTWNuWVJkMFh6ZnZN?=
 =?utf-8?B?cndZdmRoVEcxaHVKblpsNzhTaUtxbkZiOWk0MXlpbWREMFZzdFdzb1R5a0Ir?=
 =?utf-8?B?cUpmYU1CbmhOYTRmRG5aUSt1djM2aFYxTTBQSkg4cFFnQkRwL2RDYnpzWVlK?=
 =?utf-8?B?ZFJab2tSRGRzdGxKaEJoYXdqTVBqeXNvY0h3VnZZcEZIZjBQZWlFdDZmQjNw?=
 =?utf-8?B?V2NjZFVCeFRnN3lMN3pPZGF5bFY2b3FnNDNXSnNsdS8zL05RSDlsTGNZSnFq?=
 =?utf-8?B?OThkbzlvRzlHV3dUNm9WY3ZYQUU0V29OdnJ6NkV3YnFOUjdrWU02RDJvYzBU?=
 =?utf-8?B?UThidkV6MTc2SVBIQ2ZqRXRRWCtFRWNkSWoxU1BRUXlyeEdGbWpRMnQ5N1RC?=
 =?utf-8?B?TGV5cnN0L1JsNzN0TmtXVmlrdUVzR1NONklQZFVQMHV3NGlPU2NSTkk5MWFU?=
 =?utf-8?B?TmFJempsS3g4U243KzMzY2NZRWhVKzAzdmROSHdwUW8yeWlsUW9uU21GQnFo?=
 =?utf-8?B?a2F4WGFHc1pBeGNMNy9CUmt4ZjhGZGFWc3hQdVdwYlV0bzVMNWFLLytJdHRy?=
 =?utf-8?B?ZWZrNnFrSGEwZ3VseXBiRVFoUWdOYnlFczlacnl2dGRyMjNHWlVyVmhjeE56?=
 =?utf-8?B?eUdHcWJJSkNIRGFWU1l1aEJTMVZ6NXdmMDFnU2ZaVU5uR0lHczlPSzZzQ1Z6?=
 =?utf-8?Q?GRJh7OjXIoCklLwcGIL79TQncIR7JLsOjvLaiHnpcjIo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e5f222-8fda-4943-3e06-08db83aedb7a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 14:38:43.5784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRv+/YfIULdSn3Bg2/Bswb9sRuLTM/GwfDWujAa20H7B1UFOjb09dkjxOytzusAW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.23 um 16:10 schrieb Uwe Kleine-König:
> Hello Maxime,
>
> On Thu, Jul 13, 2023 at 01:17:43PM +0200, Maxime Ripard wrote:
>> On Thu, Jul 13, 2023 at 12:39:40PM +0200, Uwe Kleine-König wrote:
>>> On Thu, Jul 13, 2023 at 12:23:50PM +0300, Jani Nikula wrote:
>>>> On Thu, 13 Jul 2023, Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
>>>>> after most feedback for my series "drm/crtc: Rename struct drm_crtc::dev
>>>>> to drm_dev"[1] was positive in principle, here comes a new series.
>>>> I find it obnoxious to send a new series within 24 hours of the first,
>>>> while the discussion is still in progress, and it's a misrepresentation
>>>> of the in-progress dicussion to say most of the feedback was positive.
>>>>
>>>> This is not the way to reach consensus.
>>> Let me tell you I didn't had any obnoxious intentions when sending this
>>> new series. I honestly still think that the feedback was mostly positive
>>> to the idea to get rid of struct drm_device *dev. Most discussion was
>>> about splitting the series and the right name to use instead of "dev".
>> And then you have a former and current maintainers that tell you that
>> they'd prefer not to merge it at all.
> I went back to the previous thread rereading the replies I got yesterday
> (i.e. the ones I was aware when I started to respin the series). By then
> following people stated their opinion:
>
>   - Paul Kocialkowski
>     Is happy with the status quo
>     naming: drm_dev > { drmdev, drm }
>   - Thomas Zimmermann
>     All data structures should be converted
>     naming: drm > *
>   - Javier Martinez Canillas
>     Generally in favour (also via irc)
>     Wants a single patch
>     naming: drm > drm_dev > dev
>   - Russell King
>     Sent a "Reviewed-by, Thanks"
>   - Christan König
>     Wants a single patch
>     naming: don't care

Well I don't care about the naming, but I care about avoiding additional 
unnecessary work.

So I'm not very keen about the naming change either because I think that 
this is just irrelevant.

Regards,
Christian.

>   - Maxime Ripard
>     Wants a single patch
>   - Sui Jingfeng
>     no union
>     naming: { drm, ddev } > drm_dev > dev
>   - Luben Tuikov
>     Wants a single patch
>     naming: drm_dev > { drm, dev }
>   - Jani Nikula
>     unnecessary change.(is this a "no" or a "don't care"?)
>     naming: drm > *
>   - Sean Paul
>     doesn't like this change
>
> I admit I'm not aware about the roles here, but up to then only Sean
> Paul wrote a clear no and maybe Jani Nikula a small one. I interpreted
> Paul Kocialkowski's replay as indifferent to the renaming. All others
> were in favour or only criticised details and naming.
>
> What did I miss (apart from today's replies which indeed are more
> negative:
>
>   - Thierry Reding
>     Agreed to Jani Nikula that this change is
>     unnecessary, also understood that for non-DRM people it might be
>     confusing.
>     naming: dev > drm > *
>   - Thomas Zimmermann
>     Agreed to Sean Paul about the too high downsides
>   - Geert Uytterhoeven
>     In favour (also before via irc)
> )?
>
>> Ignoring those concerns
> I'm really surprised by this suggestion. Either I really missed
> something, or I'd like to ask these maintainers to communicate in a more
> obvious way. If I send a series and I get feedback like "If you rename
> drm_crtc.dev, you should also address *all* other data structures." (by
> Thomas Zimmermann) or "When you automatically generate the patch (with
> cocci for example) I usually prefer a single patch instead." (by
> Christan König) then I would expect that if they oppose the underlying
> idea of the series they would say so, too. I'm sorry, I cannot read a
> concern (to the underlying idea) from these replies. And so I addressed
> the feedback about the details with a new series to have an updated base
> for the discussion.
>
>> and then sending a new version right away is, if not obnoxious,
>> definitely aggressive.
> If this is how you experience my submission even after I tried to
> explain my real intentions, I'm sorry. And I'm sure there is a deep
> misunderstanding somewhere.
>
> Best regards
> Uwe
>

