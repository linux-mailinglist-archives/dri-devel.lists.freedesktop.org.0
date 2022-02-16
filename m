Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597A74B86E8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 12:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A166310E9BD;
	Wed, 16 Feb 2022 11:43:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950CB10E9B8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645011779; x=1676547779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aSdNWupAqRa6owsPqMmfYM/gnn+yDVKkEux78ixE1wg=;
 b=e38EUCLA2vWw1V70kzabuoGF2OGAHAYpi+g2u2kRp2LPvAFazBx1wWA6
 qEyZ/IbtrzjtZH6qOm8Ytz6ETNHJ8SHg+iXJRvi3kMcKeBvFF/swoKRlL
 03U8fnbVp3d8JYAuS9dR9eZtxll5qZt0mkBVSNLLv3KiUxKZpaX7+pPY1
 E6JCob0rak20DI+7pKybMqGSM41ZfNMUOH+GPm0r/cwMKbL/7QnGU03YZ
 E4ZPei6Kej5EzRghKCFigqgekuLkuR9NkkanyzIhrUGwmju/K9Du6WjlS
 yjCYmSmPCgraXeYvMuNnyCLoutJAx/906WpSl5FsKKV+GM6zUgmkN5JSk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="234124238"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="234124238"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 03:42:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="544891802"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 16 Feb 2022 03:42:58 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 03:42:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 16 Feb 2022 03:42:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 16 Feb 2022 03:42:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhkgEfN7A1t78TMy71oxgxQj19w+suOpYfwZUt5N2MYOjIs5y/GNIHx0rHj6itZLd2CEiLBCwyKHxnp2xPG88lZI+yDTDiwcmoSguw6jciUb5grZqFtWHOqvvG4wJF6iCZaYf/+/H3V+uhUmrsjSgFhEtrd8EEeqs/S+oMBTnVjeiZ1xj8hipcRG2JWgFLClNWu10VZIcCky2qucF7V3wyBg3S2HeFyIJNP79Oq8mldqtPK/LDsdPKhAXyAShDMBsSyDOsZ7V7iyqliz+/y/LF2jj31xADHdb7ABvRZypPu8LtjvyYtoWNvW51LgLAv993yU0oLVDstIxIrE+BaobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03SHWByS9VrGJduz676leXrXubEYWESv/LIji5W9Mfs=;
 b=OFq4r26bXZjDu0cb5zjgpOrCIkFDFkZEbrhoDpSJUl3aRNt6PA/NHgFpMHa4o9fgkQ6cFUFDnLa+IEeQKGL7tNedsi6ZmuTr56DkyT4KQQAhEqXaF36Gwo1ltySfjdBGV6LoOxDKw7gMdxQuiegTG2jwm9wNFh3n8Mg2jDz7L5AyAaxpj9IzQc0mCxP90UX9tIZ0rDOF3Dm10oq0X5u3WxdrB8qIjijEcMMpQEI95WrS197VkG06tJeHdTRiRF7IyXB4gnojuKAY840jHwQKn6qftXnq7mnfB3VqJCqyvU5gBaNUTkqLVjK2YjHsILPY0Z+0dDcKetPod8JwpdykuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Wed, 16 Feb 2022 11:42:56 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 11:42:56 +0000
Message-ID: <68332eba-800a-544a-846b-f59ff694c915@intel.com>
Date: Wed, 16 Feb 2022 12:42:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/3] drm: Plumb debugfs_init through to panels
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Doug Anderson <dianders@chromium.org>
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
 <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
 <e6670fd7-1f75-56f7-b668-20db9902cac6@intel.com>
 <CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com>
 <87ee435fjs.fsf@intel.com> <ce339fc7-b6bf-b19a-be10-54ee86487b96@redhat.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ce339fc7-b6bf-b19a-be10-54ee86487b96@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::25) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2236944-cabc-4a8d-5400-08d9f14179a3
X-MS-TrafficTypeDiagnostic: MW3PR11MB4764:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <MW3PR11MB4764C32ED8E125A96D162CE5EB359@MW3PR11MB4764.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SfpFXj/pShqZUdbjVltOKXDzowd3E2ZzxOMNzIW/pyctNsIUcxNalpqA1kYQ/SvDRDX+tCJcEM3qNctEkDbvit7zzU9lig17Oy7n73aMn+4TvpiSQSYX/eLPokUphxUHWa0UnyAAMqC4SPTyKCE+2vPDHaQlLKlbQKvTvWBEoy+OSvtyQN/YjgqT/8P/5T0B9vtqaPMMopsy+VVJ4hSE0LfmSbpnZITI61TtlHBBz2M86oriFWWqaxmk8vbrrmcwwkHEG62VggLGLw3yA3OXuYnYKUxoj1nv6VpSXezQATu4lSHsUHtrWUsIS0xwDeovBxLorqeRp2wFWd1W5YRmnbFE3iGT6Rqz0fFL0yBhj9+A5OfqCS8czZ0G9vHZP4YRdJYW7KeSw9AFd8KvrXkESWVIrik/MDBsUh5y+Hni3zFKPtxze9FRYWjUS/BuRjm564AF80pb0rZsDFZLSfVZQ56vICPNZxVpyvWjdBMGOa5fdQin6upxVb6DcmB5vCi6gFYqcarCw5h5i+fKTvERwk4qfokZkncALVD0euOmqb9IZwWNFKyjZBpvzArK4uo/QLraMoOpNf3yZKO1kN3+TfU5afKw1Q6wGPuyze745XrETDTzkc+FQXkfmuJOFdKW2k1sQZtz2Tzmzb+vAGJ0BnE5H57EHOKOGkmCjTjVGGrhI+AoqoF13cGc3wIKzCOvMdWs3G8+7nx9iAvyegavx6DEzMOta4TJ2zMHlrMMCzI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(4326008)(54906003)(110136005)(316002)(38100700002)(2906002)(36916002)(6666004)(6506007)(6512007)(66556008)(86362001)(66476007)(66946007)(82960400001)(53546011)(508600001)(5660300002)(36756003)(83380400001)(6486002)(2616005)(7416002)(8936002)(44832011)(26005)(186003)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2NrcC9QMDA2WjV2M2FGSDZBVHQ0VWFETXJOeXpGbkRBQ3g5cUQ2MHEvMmV5?=
 =?utf-8?B?WWxkUTk3dWdReWREMitxVmRCb0NQTnN3UHBiWUViNis2QU9LeVh2MjdMMnds?=
 =?utf-8?B?SFpIZTBBQkFuS1NVd0d5NzlJeEV5OGQ2TnBhRUNsNXgvOEVteVYwUnNWR3Rh?=
 =?utf-8?B?OFZab2REYkJzcXd0WWd3dlVGU2x1eWZNVmFUYjNLSHRsaU1SaGpkSkxSeUdK?=
 =?utf-8?B?c0pIMTljK3ozTVcyYitLdkR3SG1uOXVrMytaNXNLMzhnOSt4TVlKeDRwcHJv?=
 =?utf-8?B?TzVoT3EvMTJwTHZ5dWJqbUlld09JY2JueldUZnEwaUxnaGJXWWN2N2t6cW1H?=
 =?utf-8?B?dEpXL054UEdlM0pYSkdOV0FVQk1PTXhSSzc4WXdnZVhmdWxoa1ViamRRWkEx?=
 =?utf-8?B?d1hzMnA3R3ZpYXBUZTZFa2lGdjduUW9XOFp0VzFsRWFHZURINDVWVXZQNkZD?=
 =?utf-8?B?ZTE1OVh4b0JqUWUyanplN1ZWT1VaYlBUakFuaDBHMmVSZ3RGTU5JWi9uVHlE?=
 =?utf-8?B?QzBpbURTUE9YbWQ2WjBMTkRMZGdSczdxQzl4ZE9tQkJPU2tNZ3hpZ0Q0TFQx?=
 =?utf-8?B?bXB5UWJaTDZPQzZCRWFHbmFURHBydU5aSFZCZStESVV2bklVanY2TXE3eXlV?=
 =?utf-8?B?ZGhyMnVDMnhqNm9acXo5NUZKL3RKeEdFOTlJMThSV0lhRnhXM091Z1FLNXF0?=
 =?utf-8?B?aUpYSVI0RDVFV3VZQUMwRUJEcGlMaG1uYlFIcDV0aUZDZEsxbzhuMWp4eVox?=
 =?utf-8?B?Z0FWNXBVSHpHei9ndWtkYkZQV1lJang4MW8vTUgzc3N2ZUI2bXlKWEh4VFgv?=
 =?utf-8?B?bkdITzFvM3ZVUk9YY3JFUDk0andjZWNEQm9TZ1hiZ2hPUFhTK2k1Nm44TlhT?=
 =?utf-8?B?T2Rjb2hQUCtNOXg3WjEzUkliMUxQbWZpNEtmY2FTWWh3WjFlaTZCK2lNKzlx?=
 =?utf-8?B?ZWRwSm8wVGIxa2xCdExBVzBGTzR6dXA1aDY3b3pNeHdObjg3THo4MXE0WGNG?=
 =?utf-8?B?S2hkcVFVamNFRFJYd1FKYjZsK3NBVEpTMUZqSUkybXFpYUlia1Jvd0g3MEFB?=
 =?utf-8?B?UTd2UnBpdVdhMmYweU1YTnVjVXJQcUlyQ01vdHJ1S084bjM5OFJDQmJEaDdR?=
 =?utf-8?B?SUNyT1BKSDg0TXd5VkE3MUpuTWhvcFAyK2xXb1RBakk0TC9mU3ROMWEwVisr?=
 =?utf-8?B?UVNiYS9BZVlqaVFiK09BWHpwanJmSW1VaTlQR1hkQnpFdi91WG1SYmhMeUx6?=
 =?utf-8?B?QUlQZTFIV0RKYlFidEpHYnltdnVSTzZaTEhKVnhaTVFlcTFxc0s5KzgzUHdj?=
 =?utf-8?B?b2NHeU9vSDVRNlp6NHcvRnVNZTZLQVRORHRDeDhRaWFvd1lhTVM1ZTFYcDBr?=
 =?utf-8?B?NWhDeG1XenJ2S294NmNBVHptajExYXFlS2w5Uk8rTjVRaDRlRXZsaUE0bVhE?=
 =?utf-8?B?Y1BESDZuVVh4TEdnWXhlT3J5YlJZSWMwVVdKeTIyU3pvRlY0WVdja2pwOVA3?=
 =?utf-8?B?eWZ6aGU0MW53SUEwZzREajBNY1dyeFUybVh5VkM1NXZhU01ENEp0ZWRMWmU2?=
 =?utf-8?B?c24wbjJHTW1xUjYrME1VQURRNzdxTjU2MGgzbWY2M3ZyV2Fmemg5MkZ4SVkw?=
 =?utf-8?B?Tmd5My9SYzhpNy9pZUFEWGcvNE5PeDhnOElWRjN5eXEzVlNiSUg3bEY5VWh0?=
 =?utf-8?B?bFU0cWNkVGlHRTB5dTcycFRtTGh6dmY4UnQ4ZDJzTWN2Qkt3TlhpdHkyVmJj?=
 =?utf-8?B?dy9OTUV3UTlUN1pGTnMvbXQwQ3RpTW5RS05rTHc4aDl5d2VESzhoZ1FxQklz?=
 =?utf-8?B?WGh5Y1BZa1BpeDdjOUJna2phMUFJUFRDaWhuWW1hQWZGTkMrK2pFb2o4bW5s?=
 =?utf-8?B?WGU0TWE2eXJXTmVhZGpxMm1WVXpwVk5KQ2JycTc4N1ZXU3djbWIxVGhiNE5K?=
 =?utf-8?B?dy9rbjVCS0tRc2JhMDlWd0VXNXdWb0tnTzNwb0xwVnVMN2g3RFFiQ1FpMmt6?=
 =?utf-8?B?RGQ1UFM1Y2Y3Q3lIU1ppMTFJVzFZNXlPa1BMVytsdXpoUG9nTVFjeldMS3hw?=
 =?utf-8?B?SHJIaWk3amRJYkJGczZkWHRMN3JIZlM5eWU1dGplNkhQTGRiZWhNZjcvYy85?=
 =?utf-8?B?d2ZNK3U0akJFbnVnME5CZFhFbEQyWlhSUmZRZXpxREY2N2dJRXVGQjA0V252?=
 =?utf-8?Q?scIwL2MXv87DJZegnpnDcq0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2236944-cabc-4a8d-5400-08d9f14179a3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 11:42:56.7582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1VlnxiwQP5IP5w6S5XSlx060An3SWYjXXl5xvoNS4Kp9OntXVLfnDIDgCsmJJGZoPJZAzKfU80af6SRYprT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-OriginatorOrg: intel.com
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, lschyi@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>, jjsu@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16.02.2022 10:35, Javier Martinez Canillas wrote:
> On 2/16/22 10:25, Jani Nikula wrote:
>
> [snip]
>
>>> I actually wrote said follow-up patches and they were ready to go, but
>>> when I was trying to come up with the right "Fixes" tag I found commit
>>> b792e64021ec ("drm: no need to check return value of debugfs_create
>>> functions"). So what's being requested is nearly the opposite of what
>>> Greg did there.
>>>
>>> I thought about perhaps only checking for directories but even that
>>> type of check was removed by Greg's patch. Further checking shows that
>>> start_creating() actually has:
>>>
>>> if (IS_ERR(parent))
>>>    return parent;

>>>
>>> ...so I guess that explains why it's fine to skip the check even for parents?
>>>
>>> Sure enough I confirmed that if I pass `ERR_PTR(-EINVAL)` as the root
>>> for `panel->funcs->debugfs_init()` that nothing bad seems to happen...
>> Yeah, the idea is that you don't need to check for debugfs function
>> return values and you can safely pass error pointers to debugfs
>> functions. The worst that can happen is you don't get the debugfs, but
>> hey, it's debugfs so you shouldn't fail anything else because of that
>> anyway.
>>
> Thanks a lot Doug and Jani for the explanations. That makes sense and it
> explains why most code I looked was not checking for the return value.
>
> I guess we should write something about this in the debugfs functions
> kernel doc so it's mentioned explicitly and people don't have to guess.

Nice, didn't know debugfs started using this pattern. I hope the pattern 
will be used broader, as it allows to save lot of redundant checks.

Regards
Andrzej


>
> Best regards,

