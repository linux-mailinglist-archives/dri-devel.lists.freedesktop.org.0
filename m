Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F824BBA00
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 14:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDCE10F01D;
	Fri, 18 Feb 2022 13:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F2010F01D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 13:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645190431; x=1676726431;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pvc3I2opgJXrRDcuwxrKjZ2JpuiwXSMRMjzZl7OlNfY=;
 b=gN2Nnj6kJkZGeRoaBbeALGLjnEPuT6g6ALVuEpY8uRS1AL5f/LZhs89p
 NeL80BduQy+cR4h9Dm1yAlMdH/SbkJmkQIGxlktWbxKaCJIJUsmIKA44C
 ZsHjmARaQiOoSTJyZ/IVdW8zy2LPKmP4QzVSwjmCMwoZznDSPrJoMJ/hQ
 mOthGl/Ke4UgLVLN0v7dTuDu/ZLawbWT4Tq2oP/gB6AEZI+NPkEONI3I4
 Hn0YcWSvaQCaD4690XmW2hONHkiSxDbJms0Fpu3qpl5D0Axdz/pGxIRfc
 nP0GxNYb/5aQjkxSPhNfhMQvTlrGGnQxnfvzXEf0/ipZWp9Z9rXeCavVY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238528389"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="238528389"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 05:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="530922172"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 18 Feb 2022 05:20:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 05:20:28 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 05:20:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 05:20:27 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 05:20:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHB2t51ufy4H8p62wBxq8EATu50gComxvYibNi8iHWSjhaKGGUMzivLccArlNk/vcASk0vUt67ty6/a0I/AfjQTEqP0yCBkeEw85VSkDp2cVCgj6hJ11CJpJ+DCt58a1U0vqWJCrrvFmgWZPUiiSgDcNZKUk4U7OdBSTT9BxEz9QmY4Vpe4+1MHvUUT7wwwns8uqEzfQsDpAm6905veTHTxkQM3FKmkGpgTqSa1mqHSONvKA52EDLJLSHDseMbUPxrF8NJ4oNmlw7P6iRnGItiTKQZCgwxLH+ts5OgV0rzCoYElkwHrp0E0Cgo2So1IuJ7+dMA5zTPUNFI+ldR7rDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMTfsD46UsQ2RzhidZCDY+9V8Qw+xEF6b7pT5Rvtdj4=;
 b=LQ9xpVlMDce0Lt3cstlhXeYAmKsMtvvg2HipQBm9sBBKvGdh0VNpcSenJUy4egD7nlzpbaQmqeq23A0lau/srrLKSntfC53WoIVR3cAqFRh69HUPQwR+9Tpk25x44S6yHXkI3dyX55mgZlzJqp8bn3+OaTNVqGD2jPlOwzc3KhJb0KQAAcuFOxqTaboTT1dAfEH2HE33RXNEUBGtxcNIdUzpRU12XY+mc4WETP8m+SvGAwG/fMrn/1XxFWHjWI10M86oqnN9ao8RUd8Jhn4+cv/a1hCHpSdNCVtGzTfa+7LB9QfRC83GK87z49EaNgR/YO/DxHE/OMO6UZDso/AQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 CH2PR11MB4503.namprd11.prod.outlook.com (2603:10b6:610:46::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Fri, 18 Feb 2022 13:20:26 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 13:20:26 +0000
Message-ID: <31201578-6427-d580-4655-24d40dc22494@intel.com>
Date: Fri, 18 Feb 2022 14:20:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH 0/2] DSI host and peripheral initialisation ordering
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::35) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 936c38fc-4dcd-4281-9d85-08d9f2e16ce8
X-MS-TrafficTypeDiagnostic: CH2PR11MB4503:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB4503D67C81800C1786A4434BEB379@CH2PR11MB4503.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSRw05fXWSIAzYpja+8DEt3lMpRVjBQsB3nCmL+SZm8CRtpUKPM7bwKSmxiKfxVqvVCA/KTczS0li9tK/Fx4HKTeB9l/D87PwNgVTqB3IRy2Tt7k/3VcqFQYVEDvZhVRj/IjkBZeQgb1/FWZEe5vNPO5e9nNwn6ZMJ3aN0gIYjSSxykYD9xkEJhuKyA6KY2m2LqmDqFfck1rwUi4fUpHElUQZYjviN5O+hNmdgPTz9BEHyfib4gqB6DspyeVURB/FuZT8Kf+Rh8w6uGXV1lzb1z0B84AbGEhj4WIUetvlWzxb9UY/UzGRA01G7iHeVsr/fneonycYgVm0ND5RqhFFMWgFVPQhWTMe8o6Rt8DysubnQ6Th9BRZ6Q3vPJyVE9g2oMW6waFGRn2Ek0uYgaue9WYLv0w5a6TzEwLGMUjPFp3dmFPb/f1fNEMlvIL3tNGnXdqNH6gVYyIC/lWPIJKAG5YDddLjwBSRI8RDY2WNfMMhh43B9SIygeysyAaEiZ/tBxIcxXIsA0iNDfM7pxROTKSn1hzzXsCjqunrUt4icvJlqMssk5u3T1TbIhXHOy4ATK/agsTdeLLWwFhlhYsM15vDJCE0h4s0E2HLlOdz7neJ+ELcnwnM7Q5geaetp1y2rwlt9ZeZFO3jKRqC3I19+ruKPXaLEWP153AJ9Gd3ZEIY1leceJNxCEJcNW3+G1TuT01FaNlFvxLf2CdPDZFAI/qqliwawWpIFYiVoA8Fj6AT6IhaFI1kFCEV9nc11ySNX3I3YWKuZh70IvwHbQJCkcHVU3CeF73JyRliRNritJ1NmADXYHzNQpdxJR9tYvnuV6klzHMeK40lbUSkSVrp5wRpKZOIqYO/3dj2w9HxxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(2616005)(6486002)(966005)(508600001)(2906002)(4326008)(8676002)(66556008)(83380400001)(66946007)(66476007)(6506007)(36916002)(44832011)(110136005)(54906003)(82960400001)(38100700002)(186003)(26005)(53546011)(31686004)(5660300002)(7416002)(86362001)(8936002)(6512007)(316002)(36756003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFozRStnUXh2U2ZHZys1ZjFQampuL2JHZ1piMU83RVFpR00vTFdXOER5Wnpv?=
 =?utf-8?B?ai95Q1BTREswK0pFWXdxU1JFU3BaUmVWbHJwVkc3MGtzUlBXNStTK25ZSjJH?=
 =?utf-8?B?YmVoZE9mQXJYT2RwQzBmV0dpKzhLK0REWjh5MTVlTEZLMDkya0JGVkxqSlBz?=
 =?utf-8?B?REExVEZIN2pJbFgrQmU1dWQrSE05UmhEYkVJOU1peXN4M3l4c1lPVENKRFov?=
 =?utf-8?B?UnAyenhCanBYZW9wSStjdVphVWdTZCszcDRiU0lVdmJKUWx0blpZcng4Sk5I?=
 =?utf-8?B?Qkc1bTJjVHgvNGdaQmkzbzNtMFNNSmhwSlVuWS9tWXE2SXAwcUt6NzhVN2tP?=
 =?utf-8?B?ejEvYVU3UnFLTVprdTB2eU1aM0w3c1MxNlRRQ3ZnREhiMmVKdFBSdFFHdlZ1?=
 =?utf-8?B?NTZtY0ZTN3BhNGVIUDJjNXZhTHNhUlN6NE1iY00wMXgwNUpSWm9CWllrSi9T?=
 =?utf-8?B?a1E0WGdIeUxFRGxmdHZqOUxDZ2pILy9oV0dvSVhHZXpYV20vSFhlZ2gwajJX?=
 =?utf-8?B?ajYyVUtXSFZDUkt3M09wZWlsWDhwSmMzS3RTdVBBSTBRbEJWdlJ4MzUxNGN0?=
 =?utf-8?B?NVZ5OEdNWHAxOXZKSjVWS0RsWjE0RXhoUmtqYlpybndjMjJoc2oyMnV0NEdM?=
 =?utf-8?B?ZERndVN5Ull5UTJudHFLMlp4S3NzU0c0dVN6VU5qMTUwMlMyMFU4UWZRTWFS?=
 =?utf-8?B?cVNZUmV6TjhwdlByaUdKdjY2dkdTSVBtQ2M2K3RNSndrL0o5T0FDWnVRemlw?=
 =?utf-8?B?OVYvRXBBbHI4VTM2UXEwVkRxdjJJUmc5MzVMQkZyU3BsQm0rb3lVZGdPZDJF?=
 =?utf-8?B?VE5GWHJ3bk9UTUdUcTZWdWlTNTNNUnhYNkpUQml0U2dDSEorZVRWM2dZQTVj?=
 =?utf-8?B?YnlucWpiOTQ1R2Qxc21TbUR4cHRhNXdZVFZsK2MxUTRCajdYNTdzNDR4YzRF?=
 =?utf-8?B?R0JUK0ZDODJybjBleFV3VHNzRWFobjV0Ky9INXRYNGJtTFJ4WlVrajExT2ph?=
 =?utf-8?B?UVo0aWE0endWaHRZU0h2WnkrSnFqK1N0a2tBOE9pd0dKL1BEZ3Q4N3BwMGhi?=
 =?utf-8?B?S2w3ZS9jVUJCaDd1V204aXFPRmU5YjVFQmpDdHpGMk5WcjV5L2ZUc2w0dDZT?=
 =?utf-8?B?MkNBNmQvLzRFMkl0UWVNRTBNVzFUK2VCb2lpUzM2RVJOQUluc0o1U0Niem45?=
 =?utf-8?B?YXdmajRtRVRLcjQ2RGpYaVhWOEFMeGhQVlFKUHoyOVNqclB4eHpTMkdLZWZ6?=
 =?utf-8?B?NEFNSHJMRXlJVGJ0dkpTVnRqdVZlQ1cvcEFqclJoZG01cURleE4zWjc4emY3?=
 =?utf-8?B?OU9iU1R5NUhNd2VBUUg5RWRsN2RnV3ROQXd4WWRKWVBPbWRUNUNGSVB6VjM1?=
 =?utf-8?B?V2RQR0VwdTdpbittdlJ5UTZjR1BaT01IVkZNRGkway9iVjFGbVZHb0d1Ymw0?=
 =?utf-8?B?K2Q3TExod242WUZWR2ZmTXZuQW9ZaEhUMUVpODVvcGdxVzBaTncwTnh4aEd4?=
 =?utf-8?B?N0dFVU1HNGIzM2JUaXg0bGdQdzF3RVB5d0MzRFpHdXBidmJZUUkweGZkeDFI?=
 =?utf-8?B?Z1l2c2FSdXZtVjFZMGt0aXR0Vm1pNWdueDRUR0hYd2hqd2liR3B5bFBQdC9z?=
 =?utf-8?B?MERMWDlkTFhsU1NWY1FzRWdxM3psdVQyb2xXUkNVNGZ5cUNHeE92UytHK2gv?=
 =?utf-8?B?bkVTZGZhQ1haMFVkZk02em1aaFVSM04vbVpjYXQvYlVPOTl6RTdkV0ZLbjUz?=
 =?utf-8?B?N1pRRFVPMHluTFpmQk9CU3BLQ3N1eFF1MTJWemNBRHM5NFAyeUpONFNKWklR?=
 =?utf-8?B?aDJsNFNNVmJpQjhOT1lHL3Z5L3k4S0xxK1pCekFtN1ZsQ2VrZWIvREdZMC9H?=
 =?utf-8?B?Zm9LRUJ3U0tjRGNjeTVzTW1ZaDNMS3UvOVNHTnBYckd1UHBiZzVtdzNDZFlJ?=
 =?utf-8?B?R3IvaFc5b1dnMWp5enB6TkZsL3pncE1USlRvTEFXdkp1M1N0czJRRmFjRkd2?=
 =?utf-8?B?bnp1N1lpS1hCVkVrcjJ5YUNEdENRa0xESHJGWGRXNDhJR05RbWlPNTkxYjRR?=
 =?utf-8?B?NENkUmZxNU9lV1pUd1hTYmJwZGdPZkdHT0NoYk82ZytUU013QWRZcVV1eEli?=
 =?utf-8?B?ZUMyOUREQmM1NTJCWVYxL2JuSjRMRjV4QUdrRUpMY2ViTElZbWllYkRMQkNz?=
 =?utf-8?Q?zyACxGlh+J3ur/Ct3E1gn3A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 936c38fc-4dcd-4281-9d85-08d9f2e16ce8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 13:20:26.0570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kypY0L7ev4r8rMWM1pFzIi3+qT5ddn/VIgH7GFmf32krmitL/nM3RPugLEZAXY2DceknD/cwSXs1bB9Qqbpj5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4503
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 16.02.2022 17:59, Dave Stevenson wrote:
> Hi All
>
> Hopefully I've cc'ed all those that have bashed this problem around previously,
> or are otherwise linked to DRM bridges.
>
> There have been numerous discussions around how DSI support is currently broken
> as it doesn't support initialising the PHY to LP-11 and potentially the clock
> lane to HS prior to configuring the DSI peripheral. There is no op where the
> interface is initialised but HS video isn't also being sent.
> Currently you have:
> - peripheral pre_enable (host not initialised yet)
> - host pre_enable
> - encoder enable
> - host enable
> - peripheral enable (video already running)
>
> vc4 and exynos currently implement the DSI host as an encoder, and split the
> bridge_chain. This fails if you want to switch to being a bridge and/or use
> atomic calls as the state of all the elements split off are not added by
> drm_atomic_add_encoder_bridges.
>
> dw-mipi-dsi[1] and now msm[2] use the mode_set hook to initialise the PHY, so
> the bridge/panel pre_enable can send commands. In their post_disable they then
> call the downstream bridge/panel post_disable op manually so that shutdown
> commands can be sent before shutting down the PHY. Nothing handles that fact,
> so the framework then continues down the bridge chain and calls the post_disable
> again, so we get unbalanced panel prepare/unprepare calls being reported [3].
>
> There have been patches[4] proposing reversing the entire direction of
> pre_enable and post_disable, but that risks driving voltage into devices that
> have yet to be powered up.
> There have been discussions about adding either a pre_pre_enable, or adding a
> DSI host_op to initialise the host[5]. Both require significant reworking to all
> existing drivers in moving initialisation phases.
> We have patches that look like they may well be addressing race conditions in
> starting up a DSI peripheral[6].
>
> This patch takes a hybrid of the two: an optional reversing of the order for
> specific links within the bridge chain within pre_enable and post_disable done
> within the drm_bridge framework.
> I'm more than happy to move where the flag exists in structures (currently as
> DRM_BRIDGE_OP_UPSTREAM_FIRST in drm_bridge_ops, but it isn't an op), but does
> this solve the problem posed? If not, then can you describe the actual scenario
> it doesn't cover?
> A DSI peripheral can set the flag to get the DSI host initialised first, and
> therefore it has a stable LP-11 state before pre_enable. Likewise the peripheral
> can still send shutdown commands prior to the DSI host being shut down in
> post_disable. It also handles the case where there are multiple devices in the
> chain that all want their upstream bridge enabled first, so should there be a
> DSI mux between host and peripheral, then it can still get the host to the
> correct state.
>
> An example tree is at [7] which is drm-misc-next with these patches and then a
> conversion of vc4_dsi to use the atomic bridge functions (will be upstreamed
> once we're over this hurdle). It is working happily with the Toshiba TC358762 on
> a Raspberry Pi 7" panel.
> The same approach but on our vendor 5.15 tree[8] has also been tested
> successfully on a TI SN65DSI83 and LVDS panel.
>
> Whilst here, I've also documented the expected behaviour of DSI hosts and
> peripherals to aid those who come along after.

Good summary, of multiple attempts of solving the issue (however I still 
could add some more :) ).
I think the main issue is that we try to squeeze different hardware 
protocol requirements into one quite restrictive framework - whole 
crtc->encoder->bridges->(panel ||connector) is managed directly by drm core.
No place to negotiate configuration directly between players 
(bridges/panels).
This patchset slightly looses the restrictions, so hopefully will help 
for some time, but still every developer needs to solve riddles what to 
put into callbacks, to allow driver working in different pipelines.
<DREAM MODE ON>
Ideally I would like to drop idea of the bridge/panel and build 
abstraction on data links.
So for example DSI/EDP bridge during probe would register DSI sink with 
their ops, and EDP source with their ops or just look for EDP sink (what 
will suit better).
To establish data link they could use their ops and helpers to provide 
two-way conversation.
This way if we need add support for new data link type or extend 
existing one we do not need to touch whole framework and pray to not 
break some strange bridge, or to add ops which will not be used by most 
of users.
<DREAM MODE OFF>

Putting dreams off, I think this patchset can add some value, at the 
price of call chain complication. Lets see opinion of others.

Regards
Andrzej

>
> Thanks
>    Dave
>
> [1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L940
> [2] https://lists.freedesktop.org/archives/dri-devel/2022-January/337769.html
> [3] https://lists.freedesktop.org/archives/dri-devel/2021-December/333908.html
> [4] https://lists.freedesktop.org/archives/dri-devel/2021-October/328476.html
> [5] https://lists.freedesktop.org/archives/dri-devel/2021-October/325853.html
> [6] https://lists.freedesktop.org/archives/dri-devel/2022-February/341852.html
> [7] https://github.com/6by9/linux/tree/drm-misc-next-vc4_dsi
> [8] https://github.com/6by9/linux/tree/rpi-5.15.y-sn65dsi83
>
>
> Dave Stevenson (2):
>    drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter bridge init order
>    drm/bridge: Document the expected behaviour of DSI host controllers
>
>   Documentation/gpu/drm-kms-helpers.rst |   7 +
>   drivers/gpu/drm/drm_bridge.c          | 235 ++++++++++++++++++++++++++++++----
>   include/drm/drm_bridge.h              |   8 ++
>   3 files changed, 225 insertions(+), 25 deletions(-)
>

