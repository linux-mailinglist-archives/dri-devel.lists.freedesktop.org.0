Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23C843A425
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 22:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F84A6E219;
	Mon, 25 Oct 2021 20:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423E36E219
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 20:12:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="230028794"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="230028794"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 13:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="446783083"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 25 Oct 2021 13:12:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 13:12:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 13:12:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 25 Oct 2021 13:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyfzeU16u8HYnNTHCftpal904rEXZRdVNQjzjt47BgN0LWvgM14U++dBFMIlQ8pdC/gtIAqx0vQmLhv5S0dBim7SbdXeDBbOvxGjsfFlf9kfzqMO7TGtfZYnO3Pg8Esmehft+SZoclFE7jR6vL+DKMn3LNiFKsiREm+JMTxfoAeGQ5k7QM+bkRIA6/TLphUxX9mQ+ONLHNQ+NyodlNhPc3zjECRUBmnWZCxmID55v3cefuWXH2qjQtvm/ESIA3YukhR3ZchkDnAR7NBd9yfgU3Xpkx5ZKKtaUIqQVP6zTbL2bzRr/iUwY8b72IZn8SL7vHICBDxk3bW7dfSh6WVZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcHxrjTvCYXVPXmSadQ4+EkDRmLxhB6f336voCpXnu0=;
 b=MGh4c4TV8mLiHF0kJN2fJKzHyrKfe+6VIUTRHnqCCWFnCLzDOfyjbXgh2hY8/GHi4Hd+CU4ZLmAprfKVfLvgxrEoxVXZBq7ZlwfvCgfXKzz5P8RfZf0ke7hM8qbKxEB+CrdXWmdf1qo6OP53HfCyWMSo0cSuzXg26spWBbWUNajil1QQihicx589zmISLXflT6mJxjTIgOjFuvs+E672CcQqrp0OaDuPzeTTT54MDZZ2xh6Ui4jvPyE+Ns+6RfpIVmXTzIB6hl7uxCAZ+qGZw6XnGTDknGzCpoWLFAEzVj1FX/SUunW7JLbGGqEK/tvZrDZa1Z/QA1X1Wurp4LuiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcHxrjTvCYXVPXmSadQ4+EkDRmLxhB6f336voCpXnu0=;
 b=yO1KyXACPWeSd2487cR/sWPuFp2ErrzKb6RL46sCk8YMxww4lYV4t6ZYtHaWx+Eu/AEUwirkgtgMIIohKDa1eF9NkKrKpYB5uoEXFL1Y1KQiiURZWsJ5Z/xqKDckzQNnRhjpvbr125qnqBwEWXu2gzoXE+ghDV6FxOXRUUOnJqg=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none; ideasonboard.com; dmarc=none action=none header.from=intel.com; 
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Mon, 25 Oct 2021 20:11:54 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::3856:7f41:e399:f907]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::3856:7f41:e399:f907%7]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 20:11:54 +0000
Message-ID: <0e17993d-1e9f-2673-7fee-abf3787de431@intel.com>
Date: Mon, 25 Oct 2021 22:11:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, 
 <dri-devel@lists.freedesktop.org>, Philip Chen <philipchen@chromium.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jagan Teki
 <jagan@amarulasolutions.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Neil Armstrong" <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
 <YXHLrnAliqxmrrho@ravnborg.org>
 <cdcd19de-19e6-83ed-606f-defebdcc0997@intel.com>
 <YXaTJ+bwm7vSTGpv@pendragon.ideasonboard.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <YXaTJ+bwm7vSTGpv@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::20)
 To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (95.160.158.79) by
 DB6P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 20:11:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9136e544-14b3-4c5a-5cd6-08d997f3b09c
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR11MB548801312986987D688EF542EB839@DM4PR11MB5488.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8hazej9Ky/UoeVhCHTPDPETTEOSPlas33WkPjJHo19RNm2hiPSU1HECve2qP4KKuK1f3x1oi8kBuACqfUXyF8nNWoFCiHmvxXrPO1udwagtcz2okw/JaSn3qDG3JuS0QEky+S0waXaNl1NVUf/rNnFkuGeGWFRBksLE1VbbSEcn1GS63WCjnS4KwMxcVQyLmq14PJCa2n2ShJu7d84/0Q0PR5pN7fdLSNdG1xHOR+YbDRokXvhQ/R6ynE3ENbBwTyOhGZIhUpSreMhF6H8AtCS56/tBhHyvjBpoCGd7zQu+/ceiA3ZpXbjPc3HTTFw1v1FdXZmmS7df0x3y1RovLInYp6oGakH45dK0IlBWyZBgP94AughJogLT31TV4TlWvk22vpOPlXWuwuIWsVsunGqzjhjvTXidWUQvS41VvXsB1C3YtMeWBFaqBJ06KL1hyW37FGwVmqvwTEID6rr+yaLKTl/EOa38PmUe63Ov86nP5eRXeidjXBMWIjlv70lXtlNE7JAzbG9W7tFrZWGZIDlqBfvDIumnTo+k+GAesTzM7PtXJBK07qeuNcvOC6uXBYrQeJ2sk3TpPmMQ5Mq6NwPxyU7a0HZT7s49ukpoqPwVNaS6EJcdzu1LcDBBeqAoThpAmvGoM4gayFzhm4XVkqrWxGDcISL+xrMBoc4efPTJscApJfeLr3GUja63Pygjz4ytYiJngNBavpMRwgsrsgVQsiqk2CyyvvM0pjWxDJ5OOYOZdXxgjCfouF9B0mZ8yVxBueBK1bUFOxXtnsvloBgDCSYpZv4JA8AX7Yk44fcbGcLJU5uFiwbTO8WSS8XZP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7416002)(2906002)(966005)(66556008)(16576012)(4326008)(66946007)(66476007)(44832011)(86362001)(8936002)(31696002)(54906003)(956004)(53546011)(36916002)(83380400001)(6486002)(82960400001)(6666004)(5660300002)(26005)(316002)(508600001)(30864003)(36756003)(31686004)(38100700002)(8676002)(6916009)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEVJTGZubDdqcFFmelVUWSsyOGpQeFNIRkVLRzhSbk43RWswcURIZDRGK04x?=
 =?utf-8?B?Rmx2ZGNSZ2VFMzJOUmlzMmtPbVNYY0xBM1RRenVFQm1QdEI5eEhicTJmNEpp?=
 =?utf-8?B?OVRhT0JzUkFIUE9NdjJ5bk83VW5ZSGlDMThMRjRXUXNwZ3QrckxudjR4d2pG?=
 =?utf-8?B?bWE0RzkxOW0zUjI1V3FLbituaDYzSW5SMGdwb1E4TURyK0Ewb2JjbWZQWUp4?=
 =?utf-8?B?QjhSWkhCQVFrSGllNWRHMWFYZk16RXBBK3JWaWVsWndjMm9wK0tRclVvYzdC?=
 =?utf-8?B?Qkd3dE9mYzFjM1hQbFA5U2JTL3gxMlloT2pRcEhmOXE4TlJDbk9FdzJTTGFz?=
 =?utf-8?B?c21RWklhVHFRSnhVbzJ5QnM0cFh5YW9RZHpNTFk1UXEwZythRWV4OUszSi9q?=
 =?utf-8?B?dTVSNkRNMWRySVF0WTVwbSttalFiTngwNm4wRGdmZXRxMFFYZ1JJODZ4dWlX?=
 =?utf-8?B?UGVDSXhmalNrRGZ4SjlsaUd4b0VYcURNK2x2OU9HTlg1aDZoRmNDOUljdmta?=
 =?utf-8?B?RE9uQmx1cGk2OFN6eURHTFg2NzBxWWRnVWtFb1BRSk85WTlMOW5Ed2w5K1lo?=
 =?utf-8?B?U3dzWm40SFM0WFIyYXRqT1A1TTB4eXJzTmpYUnNLMEk5NlJ2MjcrR01uNy9B?=
 =?utf-8?B?dmdKOWw1dVlxbm1ZMHpzNEY0bzUvT3BZNlMrM09WREgvdm9ibEtxZFYrbmpo?=
 =?utf-8?B?VlA0ekxnOG9NTllzbjJONDAyMjc0TTN6Z2ZNMjYxQ3dmNHNQN0xRa3dTMWUz?=
 =?utf-8?B?M0UrbkNKbHh5NW14N3lPUmNJNncrQ09tS3VmSi9BOHA2VDRucGZMU1JwdU9S?=
 =?utf-8?B?NUEyWCs0cS9DRVpxbmdwbkY2aHdvcGFkbWQ4Q3cwVk1DdTFvbzZwb2NscE10?=
 =?utf-8?B?eUZ3d0VjaG5YVXlVeENmQ1c4a0RpbHVTcXNURmVCMnNOSVltT09xVXFTT2dm?=
 =?utf-8?B?eFFwSm1YNXJJOG5TcEp1VlRjZmErejZvUEUwaUwvMG1SbURTS093a0kvZXI0?=
 =?utf-8?B?MENxVEFHUElWUG1lS1Q4R2JQakE1eElNOWh4VFAxc0tIcmN1S2QyRS85N2pj?=
 =?utf-8?B?WUh1bDVmU2ZXdDAzMVNYN1FLZHBGWTBmUEQrNGNvczV1eExIRWl6ME0xVFFj?=
 =?utf-8?B?UFJYZXFKMWNES05UU1N5UFEvdUVmM1c3bmFtQmFlenJGUXNQQVRvUC9wcEww?=
 =?utf-8?B?RXgydis0T0Fzc2JVTVZGeGZSaDlPUzJaNjViOStNTnNoeXpHeWVOK29Gb2w5?=
 =?utf-8?B?VjRjSjYwTUY2RHIrcVQzQzNJUWh1dC9jNDdQSnAwd0ozN2xHbGREYzFTeGZl?=
 =?utf-8?B?MXZ4N2tRelJEWGY0UVlZbjJHQVZwRVRDaDVXZlNTaTZNc2RWK1NQRW1WZUY4?=
 =?utf-8?B?TCt1dzZoUG00amZwUXlGYkVXWHpPcm1OMXg1WW04Rm5KTFVXK1VQdllqOU1x?=
 =?utf-8?B?OFhFTjlvdkpvNHNkOGFZNHR0QmxTODVCUi9rMSsyWVVFeDlmb25tRW0vNDFB?=
 =?utf-8?B?cWhscTZvV0lpR3pRQW5PeFZWMk81UkJheVVzSWlXNDVBQjZnUzU5VTNLNmxk?=
 =?utf-8?B?MTAzc2xtS0VyUHVjcUM2bjB3UVg5aXNGRm5sSyt6dHdSdHl1ZTZpRW9VNkFX?=
 =?utf-8?B?WUhscEtJOFJtVnJEbC9VRmZ0aTUrYUNsODNDeU82eEErbTZKYklkeDhZOXdN?=
 =?utf-8?B?MFUvb0I5aWx3Q3N4VFhnbG5QRDNzc2NBc0dkZ1ZOc1NSeTVyVDJJV3d3SDJL?=
 =?utf-8?B?N21NVW55bWV3YzZzOVphQ0ZMMlVFQS83SkwvVWEzc0NJRlFQaGY0SXB3dHVs?=
 =?utf-8?B?R1ZPdCtzRVBWa012NlBxSDNjMEV6OCt0M2Zrclhvc25hc29FTktvUjQ1L1po?=
 =?utf-8?B?UmRnSnZmQ2NnUFliUHpabC9HYUV1bmswODFiZlhoVTlTY3h0U1JPeENKTENP?=
 =?utf-8?B?VHpsRE92ZE93SHlHWUFnYmN1cjBUYnNuUUtiNEhXY3NQQXlzMTdxRUlqUTM4?=
 =?utf-8?B?VlhXZm83amlkK2M1dFhFdkRRb1NNelpmYkJ5WFdvTXpMTFhueExjZEZhdFAw?=
 =?utf-8?B?MlRRLzBnTnBLL1JKeVh6M3FpYVlrRWdZQm90YjhMMWNodGd2Z1ZNNWpvWG1G?=
 =?utf-8?B?Z3kxajlyVTlzNGlUQlhnZEJEMzgvZDZGMEduUnNZUjFSUTdPbHZnNXQ5NWNq?=
 =?utf-8?Q?b+hGUdmmGi5WbcbPcpzfqlg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9136e544-14b3-4c5a-5cd6-08d997f3b09c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 20:11:54.7759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2D8CCttp5RualF8/G1U+oW0jySA44I6ZYFahOmaFd8y55lVO6nKKA7cPEFw14HXMxIq/fb2KFgl362zV6VT6Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5488
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 25.10.2021 13:21, Laurent Pinchart wrote:
> Hello,
>
> On Mon, Oct 25, 2021 at 01:00:10PM +0200, Andrzej Hajda wrote:
>> On 21.10.2021 22:21, Sam Ravnborg wrote:
>>> On Thu, Oct 21, 2021 at 12:29:01PM -0700, Douglas Anderson wrote:
>>>> Right now, the chaining order of
>>>> pre_enable/enable/disable/post_disable looks like this:
>>>>
>>>> pre_enable:   start from connector and move to encoder
>>>> enable:       start from encoder and move to connector
>>>> disable:      start from connector and move to encoder
>>>> post_disable: start from encoder and move to connector
>>>>
>>>> In the above, it can be seen that at least pre_enable() and
>>>> post_disable() are opposites of each other and enable() and disable()
>>>> are opposites. However, it seems broken that pre_enable() and enable()
>>>> would not move in the same direction. In other parts of Linux you can
>>>> see that various stages move in the same order. For instance, during
>>>> system suspend the "early" calls run in the same order as the normal
>>>> calls run in the same order as the "late" calls run in the same order
>>>> as the "noirq" calls.
>>>>
>>>> Let fix the above so that it makes more sense. Now we'll have:
>>>>
>>>> pre_enable:   start from encoder and move to connector
>>>> enable:       start from encoder and move to connector
>>>> disable:      start from connector and move to encoder
>>>> post_disable: start from connector and move to encoder
>>>>
>>>> This order is chosen because if there are parent-child relationships
>>>> anywhere I would expect that the encoder would be a parent and the
>>>> connector a child--not the other way around.
>>> This makes good sense as you describe it. I hope others can add more
>>> useful feedback.
>>> Added Andrzej Hajda <andrzej.hajda@intel.com> to the mail, as he have
>>> expressed concerns with the chain of bridges before.
>> Thanks Sam, but I am not sure about useful feedback - when I see bridge
>> chain issues it automatically triggers "whining mode" in my head :)
>>
>>>> This can be important when using the DP AUX bus to instantiate a
>>>> panel. The DP AUX bus is likely part of a bridge driver and is a
>>>> parent of the panel. We'd like the bridge to be pre_enabled before the
>>>> panel and the panel to be post_disabled before the
>>>> bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
>>>> bridge driver's post_suspend to work properly even a panel is under
>>>> it.
>>>>
>>>> NOTE: it's entirely possible that this change could break someone who
>>>> was relying on the old order. Hopefully this isn't the case, but if
>>>> this does break someone it seems like it's better to do it sonner
>>>> rather than later so we can fix everyone to handle the order that
>>>> makes the most sense.
>> It will break for sure. So the question is: if it is worth changing?
>>
>> New order seems good for eDP, DSI sinks [1], probably other as well.
>>
>> Old order is better for example for THC63LVD1024 [2 p. 20], I guess for
>> many other sinks as well.
>>
>> I am not even sure if it is protocol specific (LVDS, RGB, HDMI,...), or
>> it depends on specific hw pairs (source->sink).
>>
>> This is why I complain about the bridge chain - assumption that one
>> fixed call order will work for all setups seems to me ridiculous.
>>
>> Going back to the question - changing the order from fixed one to
>> another fixed one will not solve general issue.
>>
>> What can we do then?
>>
>> 1. Configurable call order? Probably doable: every chain element should
>> expose info if it's call should be before or after source, then some
>> core helper will create queue of callbacks. Seems quite complicated,
>> hides the logic from implementer and not fully flexible (for example,
>> there are protocols which require to perform sth on source, then on
>> sink, then again on the source).
>>
>> 2. Stop using bridge chain and call sink ops directly from the source
>> (this is what Exynos and VC4 do): is flexible and straightforward, gives
>> full control to the source.
> And breaks interoperability, because different sources end up calling
> operations in different orders. We end up having different sinks that
> expect calls in different ways, and divide the world in sink/source
> groups that don't interoperate :-(


I have an impression you describe current status :) More seriously, it 
is matter of proper specification/documentation/implementations of the 
operations. If we really need strict constraints we could try to 
implement them on protocol level.


>
>> 3. Use different abstractions to enforce proper initialization order
>> (like extending mipi_dsi_host_ops): requires existence of transport bus
>> abstraction (only DSI at the moment(?)).
> A real bus seems overkill, but we could have drm_bridge operations
> specific to particular hardware interfaces.
>
>> ... other ideas?
> I don't like it because of the amount of work it would require to switch
> to such a model, but I'm really starting to think that a variation of
> the second option would be best, where the sink controls the source
> instead of having the source controlling the sink. It's the sink that
> knows about its enabling/disabling sequence, and about how the source
> needs to be controlled to match it.


I am afraid it depends on the protocol and cross-calls (source->sink, 
sink->source) can be hard to avoid in case of some protocols.


>
>> Another idea, connected to the subject - some protocols require some
>> negotiations between source and sink bus format, or more steps than
>> pre_enable, enable ops to establish link. I wonder if encapsulating
>> drm_bridge in some protocol specific struct wouldn't be a solution, it
>> can be helpful as well in case of the subject.
>>
>> For example:
>>
>> struct drm_bridge_edp {
>>
>>       const struct drm_bridge_edp_funcs *funcs;
>>
>>       struct drm_bridge base;
>>
>>       ...
>>
>> };
>>
>> Then source could promote bridge pointer to bridge_edp pointer (if
>> applicable) and perform edp specific stuff. To make it working well
>> pre-enable order should be as proposed in this patchsets (encoder ->
>> connector), as the source should initiate negotiations.
>>
>> Btw this encapsulation stuff above asks to rename drm_bridge to
>> drm_sink, otherwise it would be confusing as bridges have two ends.
> drm_sink would be equally confusing when used for devices that have a
> sink and a source :-) I'm not against a rename though, if we can find a
> better name.


But in this case we are interested only in sink part of the bridge (OR 
panel). If source is looking for specific bridge or panel 
(drm_of_find_panel_or_bridge), it is in fact looking for sink.


Regards

Andrzej


>
>> Regards
>>
>> Andrzej
>>
>>
>> [1]: I use term sink as short equivalent for 'bridges AND panels'
>> (another issue in DRMs).
>>
>> [2]: https://www.mouser.com/datasheet/2/286/THC63LVD1024-1396205.pdf
>>
>>>> A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
>>>> ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
>>>> inadvertently changed the order of things. The order used to be
>>>> correct (panel prepare was at the tail of the bridge enable) but it
>>>> became backwards. We'll restore the original order with this patch.
>>>>
>>>> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
>>>> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> To make the patch complete the descriptions in drm_bridge_funcs
>>> need to be updated to reflect the new reality.
>>>
>>>> ---
>>>>
>>>>    drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++--------------
>>>>    1 file changed, 14 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>>> index c96847fc0ebc..98808af59afd 100644
>>>> --- a/drivers/gpu/drm/drm_bridge.c
>>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>>> @@ -583,18 +583,14 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>>>>    void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>>> If you, or someone else, could r-b or ack the pending patches to remove
>>> this function, this part of the patch would no longer be needed.
>>>
>>>>    {
>>>>    	struct drm_encoder *encoder;
>>>> -	struct drm_bridge *iter;
>>>>    
>>>>    	if (!bridge)
>>>>    		return;
>>>>    
>>>>    	encoder = bridge->encoder;
>>>> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>>>> -		if (iter->funcs->pre_enable)
>>>> -			iter->funcs->pre_enable(iter);
>>>> -
>>>> -		if (iter == bridge)
>>>> -			break;
>>>> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>>>> +		if (bridge->funcs->pre_enable)
>>>> +			bridge->funcs->pre_enable(bridge);
>>>>    	}
>>>>    }
>>>>    EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>>>> @@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>>>>    					  struct drm_atomic_state *old_state)
>>>>    {
>>>>    	struct drm_encoder *encoder;
>>>> +	struct drm_bridge *iter;
>>> s/iter/bridge/ would make the patch simpler
>>> And then the bridge argument could be last_bridge or something.
>>> This would IMO increase readability of the code and make the patch smaller.
>>>>    
>>>>    	if (!bridge)
>>>>    		return;
>>>>    
>>>>    	encoder = bridge->encoder;
>>>> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>>>> -		if (bridge->funcs->atomic_post_disable) {
>>>> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>>>> +		if (iter->funcs->atomic_post_disable) {
>>>>    			struct drm_bridge_state *old_bridge_state;
>>>>    
>>>>    			old_bridge_state =
>>>>    				drm_atomic_get_old_bridge_state(old_state,
>>>> -								bridge);
>>>> +								iter);
>>>>    			if (WARN_ON(!old_bridge_state))
>>>>    				return;
>>>>    
>>>> -			bridge->funcs->atomic_post_disable(bridge,
>>>> -							   old_bridge_state);
>>>> -		} else if (bridge->funcs->post_disable) {
>>>> -			bridge->funcs->post_disable(bridge);
>>>> +			iter->funcs->atomic_post_disable(iter,
>>>> +							 old_bridge_state);
>>>> +		} else if (iter->funcs->post_disable) {
>>>> +			iter->funcs->post_disable(iter);
>>>>    		}
>>>> +
>>>> +		if (iter == bridge)
>>>> +			break;
>>> I cannot see why this is needed, we are at the end of the list here
>>> anyway.
>>>
>>>>    	}
>>>>    }
>>>>    EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
