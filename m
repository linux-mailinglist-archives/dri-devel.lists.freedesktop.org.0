Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A453A29D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 12:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6D10EEB3;
	Wed,  1 Jun 2022 10:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368F710EE8F;
 Wed,  1 Jun 2022 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654079528; x=1685615528;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vPJbioeuF4/qtd+aV+Azf7CQNJ//HsV7LxmwJbnPkj4=;
 b=FLlLP/Yrd2PdAhum+8r/anuwJYX96RzM9fEzLizlj/+kymWhiUoTibiY
 fnMLp4t4sAwVhwntgx5ajPRP7DBuA8GHeKaExf0P3lGXsudaWhiu5aYFs
 9TCCBEyZiBSIGBpnDo783xmQhtiPpLyqiQtvrLccJ0IxTNjh+NY7wcr22
 JN8c3DTgG1ys/kcGDBr2wHD6xdTn+TE+OtmAK5RbZG4ZtQgZM/q5d3SEl
 zC9h1utAKWsdcVivEP/OtDkdjuQYwvzf5du3QJcb2IXvpKMEiIf+0x6nc
 I1ce9RTD4NyEEco9bmkjnlBuxkNI6OStk6/gnzCELlciOP71pmIW5lH+L g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255415329"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="255415329"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 03:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="552246162"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 01 Jun 2022 03:32:07 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 03:32:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 03:32:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 03:32:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKgSOLZRkOhmxzkdDdmMgQrxVCJ14Y/i9YjL8GK8YNTkebdZNEN6virCWEDS8zhCj/t+HYMJkwFADp84SQXYSBWSu6zVb2f41+HWbs2OW5CosU9qSB+Lf80vZRxwx9yHWhow/zBcpOuvMQxZa5SXMIRFTfa+1DeC+rELq4d3yDMLEO1fZQlolb/3DGgPq4l3GrDfLgSAqKbbHEQCBv6CyeVuClzsrCvAgYHg/UEXp5MsOeny0qSoKpR3KRdYcBb+p/VQ6Wloi8DqFVGB7BMLlYHxVoZ3A1Oy6QZ6k66PraJO89B1lHZW5YD8aYf2IeIMK7ycpIymSsUGK0R60GQnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HiPPHvfqfxGpDi+waj7aqicP3zVOD7PLoBK/5m44gI=;
 b=kwZxrtFJFtlkP9AIrbvHwDJekb5ta9nxHPV43gTxnMnr9LUw/XuMH57hZlzSEF/T5VvUaCBdOhgBHs71ToAuAgDqqVY5xvWzG5Y0Gp4qzQNX5oCjminnwUKZGo7lACifNJVo4wsIZdAFTahmq+1XDWD4qeut6AGY+h+Mpc7q0fYyrrSN0Jy6j8xI1uNiL9+1afWoeiUzkCFJhQ6blppR1YDrDLQ9+cawuo1LHd/YrxKV9npnJc+RIilJZHmTFpa91Cf+OyN35A4Q5pbNLP63PCU1OfL8NC4zV/ZSVI6M7SOHgW3lbGaDEFkVVlYRHZyvt9TU8L6LDnsZ2rcH4z6ZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 CH2PR11MB4487.namprd11.prod.outlook.com (2603:10b6:610:44::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 1 Jun 2022 10:32:04 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4165:e33d:ade7:9ba4]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::4165:e33d:ade7:9ba4%6]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 10:32:04 +0000
Message-ID: <822934c0-59e0-9622-3b38-774cded176b6@intel.com>
Date: Wed, 1 Jun 2022 16:01:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC V3 0/2] Attach and Set vrr_enabled property
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
 <YpYeotF27wVJbAhJ@phenom.ffwll.local>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Organization: Intel
In-Reply-To: <YpYeotF27wVJbAhJ@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::14) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53c72831-2e68-4a4a-80ad-08da43b9f86f
X-MS-TrafficTypeDiagnostic: CH2PR11MB4487:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR11MB4487F53F002D542F9683959E8DDF9@CH2PR11MB4487.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: itxYd4TXoHRv1KDK/hUttWuQf1ZAsBEEVG9+vgZhRbLuZv+yI1QAVWqlHs6yL8kGhFq8Np/rjFOhnAptrwfmPigd8vfBySHFI/ENzEU7JeczC8Zm/O67/00v28ldN+Zr9ucjnj7YVJvTQjZQLEzmrIrcxSVWesj9Ys1kTMKs/nUib/XNFuZqIYPlnHVhX90W/t8U7VSPgsUStogz9g39CwcY8TEh5C4l8Xdmy11OfkNjPixflBNhuW5iTCfT1+p7VHaUZUapymDmIeKb31T3aP/Nzi9GKfHW8Jo6b9jF0ich+F8UVqlaIgmmaL2KX9+vcMVO2eJfhqFtPuIq5H/WpAVXMba38jzDcBxMIszZjk3V0MN8p5t19hapNUiDx2WNuAFJyiEGv8cyetDTtQjN7ijQPLZxjMRuNOS5umT5pHYPt2R8nuLfo+Bi51MABrkSMgNdL38ssggLimTpOWaNTGN6KqzMUVVle4pyENAZxRlxMbh/skrpboZU4Li4EG4DfPYpxCu3wDhrJtY2C7expTa79MvbFeTfNCn+wa2SDomw3Ogz4b6SzYMAJDyp+9xhueLdC1tMFBAcQv6dVM+Np9JE5MKSuX7GZAn5/L/FbZqZdbfU8eT2thQclN+OZn8v1HcMrMTuOcFR1MMltlZqjkR/RWVZapGeyaEJ2PRHXTgSZh38pMMTvp98hx0D0C9Lqs4xeL7OfsfBoElSpLrsvSO2EdsKD1wJd7NRTiWAQEU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(966005)(6486002)(66476007)(316002)(26005)(82960400001)(8676002)(6666004)(36916002)(4326008)(31696002)(6916009)(6506007)(83380400001)(86362001)(186003)(66946007)(66556008)(2616005)(508600001)(2906002)(8936002)(5660300002)(31686004)(38100700002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHpzKzJqUlErVGdGWU5WWTV0eGRXZmdhQ3ZzWmN6RlhKUUtneFdHRjBBUm5X?=
 =?utf-8?B?TDFpTDZsLzlVaXBUbWZRb3U2L0ljL09XdklLRFJYSEtDZ1M3dmltQ0ZvU2Jj?=
 =?utf-8?B?eXpTVkloT3loRUZJaThKN2QrNXNlODRhaWxrUFB4TTVhNUtjczd4MHRURGVY?=
 =?utf-8?B?NVFielMzVVZsWWdHUDI5Uk9sbVBKL2V0aWNhL2tiZXVrYVFlNmRUNFRwVVpF?=
 =?utf-8?B?ZitlK2c4M3RoeStORDlFS2RwZ1ZIM0dDSWJVWVFzVG43Tk1TVUluZ1RxYW5B?=
 =?utf-8?B?V0xoQ2Y4cGI3dkhON1dwNGY1dzF3NitKZG1jVlMxN3JCRS9QU3RXajN6N2hL?=
 =?utf-8?B?dG95RTdjRGdydVhhaXFLSXdFdU9WNmFXOU10elRhWjBSMWN2MUdWb1c4eTRM?=
 =?utf-8?B?bkltaWJXMEFSUFpUaUFNR0QxY1UvTXl6Tm9oS2gzZnVYRzJyYU5iK01kc0lV?=
 =?utf-8?B?VnUzYmMxUVB3dzUvNUpKcDhCbjVXRURTclFoMTNiUjV2Uk0vMzJFVkNMZ1V4?=
 =?utf-8?B?US9qbUgvcktNNy84SW1tM1pHSldZUTNJbFpVRjZlK244cVVqZmIrb1dDWEZ4?=
 =?utf-8?B?eVV4L0phTHFXWDhBMDJVRm5uV1NMZ3EwQW1BQXRyd0dtUUpxSkptNnVzK014?=
 =?utf-8?B?R1ZsSVZSR1JEMk1DNzhIdVFsT2E2WVd1M0Z0ZDV3TmRvOU03bmo2Ui82Y0hi?=
 =?utf-8?B?c084aU9La3ArRjcwcExvcy82U2dpbEg3V3ZiYmZPbVlTTWtzNUJNMkF0WGtw?=
 =?utf-8?B?d1RGS0V0a1lsZ0lwRENIODZaYVlqS2ZsOU5xUlowY0ZWMkZJZEgzcWpjNjFB?=
 =?utf-8?B?WjI1aFpDYURXTHV4UUIrcGtLVFhycW4rcmUrbk04R25yVldiQXgrejZSVUZM?=
 =?utf-8?B?ZE9BbjRFQ1M5L28wVTBkelE2RVVvbFgyUUgrYU9lUFhKRVBpSFZlNURkWVBu?=
 =?utf-8?B?RC9LZlozamhxUU15NlFVRFVyd2F4OC9rY2tOYVRKbCtkeU51V1kyd1Bub1dO?=
 =?utf-8?B?TXAxakhJL3VEVktwSFZNczc0b1kvb29pd2N3VzFGNVZpWEVWOUhVRHl5UTY2?=
 =?utf-8?B?amtyaGhaL0tCZjdJZ3N5SFJuWkxuelkrZHp5ZFpwZlVXWVhDeHN3ODhYRzJp?=
 =?utf-8?B?RGx3Q05RT1hYZUlZSmhTWjRBaVREUndUbS9aUDNXS3haMnVQSU1IdnNxdlUv?=
 =?utf-8?B?YnhDUDdINjRJTEthOS93OVBUTUR3eFBacUVDVml2VnRMV3c4a0ZrMDRJVXpj?=
 =?utf-8?B?Sjd6bTlwcTJZMmZ0RUhEemtEOHpoUGNFc1BxV0lQL2p5d1NiLzlKVVlNVkk1?=
 =?utf-8?B?V2RtOWlhWUVLTlBFNEUxZVBOZzRlNnZndjJreVFmend6dnJGcHNiYjJ1bFFz?=
 =?utf-8?B?eFNmNGpWRUFlaWVsSHRvNFdOdHMwWm5YRVRMN3ZlS3NHSlBOTEhHVkg0ZjVm?=
 =?utf-8?B?cjJmVGlIL1o5TE9nZUpnNm5QK2VBb0lFbEE4RUw1M0dxdzhuUUR4ODVtMzZp?=
 =?utf-8?B?ZkpjZkRBN0NqWlVMczVXVjNpSTlGZ3BTUTV1U29RSENxaXVvWUNhbFovMlFl?=
 =?utf-8?B?T2FRVmZ6YjdXZ2cvekdZcDNsQkZzVFZEYkxZNDVtc2RUUkRQblRsQTV0TGtz?=
 =?utf-8?B?ekZvcHJ0bmpBaXNleFp0MUVyVldYNUZlaUcveUZtdUZQdVdFdkhTUnFYaUo2?=
 =?utf-8?B?S01wNm5FVHBhUnNma3ZWMDNqZm5lck9zS2RHOXFTZkEwSnBnVkVTY3dDTDd5?=
 =?utf-8?B?TFBUenVpTUhlNkU3TTY5QUZTam9WLzhNdmJIWThvZGNqYkU5S0NETkZMNTZy?=
 =?utf-8?B?akZsRzhadWFkVmRpbGRENDZzcS95enFKNnlUcjd0R2NwMEFGNG5LNGE5SkNN?=
 =?utf-8?B?Y3Y4alB0WW5PdGpRTkxTYUtFZ2dzV2F4VGEva1RIbithZnFGWU0vNnA5UnBx?=
 =?utf-8?B?eW9PRmJPY0haYTJSYmpaM29zc29sc213enZwWkM2KzluUnZBV3dvUDhGcGxO?=
 =?utf-8?B?ZVRtRFRwOFNybWJ6VU5xRWpXTG9vaHZIeXcvME8zeGRYK2F5R1pCc3A3UEV6?=
 =?utf-8?B?WHNOTjh6U2JZc3lFb2lwR1h1OUViQ1V6YXdyMFllcHFzYWNsMHBXZlIzWGxM?=
 =?utf-8?B?UHFRbjBvU204NzJPSldVZHcvMGdRRXVaWVl2eFM3VnJYVVd0ak5wTU4yQ25H?=
 =?utf-8?B?YXNzUTVFL2xrZGhwcWFOdlJRNXE3T2JUV3dER0Z6R1FndEJjK0FGcUZKVzY4?=
 =?utf-8?B?bWVJUTdTdjFudmhtOUNuYmhzVGFhWjIvR0IxcXAwSVdFcXB5Yi9MQ2NyNXhY?=
 =?utf-8?B?aHBkUi9CUjFrcFlQeEowYXk1NGMzZ0hPay82UVpHYm4wMGw2TE0wNk5iRlI3?=
 =?utf-8?Q?xUZ+tmO6O22qMi1s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c72831-2e68-4a4a-80ad-08da43b9f86f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:32:04.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZB7olPwapW6/qUktqqVmAbumUm3gi9pbRbwd/o+oPKI5IDsCakKtbDFS56pWEdRSsEiYNcqkfS5pYSYtaQX9n+CwVlnjz5+oP+RwAcCy9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4487
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
Cc: manasi.d.navare@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue-31-05-2022 07:26 pm, Daniel Vetter wrote:
> On Tue, May 17, 2022 at 12:56:34PM +0530, Bhanuprakash Modem wrote:
>> This series will add a support to set the vrr_enabled property for
>> crtc based on the platform support and the request from userspace.
>> And userspace can also query to get the status of "vrr_enabled".
>>
>> Test-with: 20220422075223.2792586-2-bhanuprakash.modem@intel.com
>>
>> Bhanuprakash Modem (2):
>>    drm/vrr: Attach vrr_enabled property to the drm crtc
>>    drm/i915/vrr: Set drm crtc vrr_enabled property
> 
> I'm rather confused by this patch set >
> - This seems to move the property from connector to crtc without any
>    justification. For uapi that we want to have standardized (anything
>    around kms really) that's no good, unless there's really a mandatory
>    semantic reason pls stick to existing uapi.

Thanks for the reply.

No, we are not moving any property from connector to crtc.
"vrr_capable" belongs to connector & "vrr_enabled" belongs to crtc.

I am trying to manipulate this "vrr_enabled" property.

> 
> - If the driver interface doesn't fit (maybe the helper should be on the
>    crtc and adjust the property for all connector) pls roll that change out
>    to all drivers.
> 
> - This is uapi, so needs igt tests and userspace. For igts we should make
>    sure they're generic so that they apply across all drivers which already
>    support this property, and not just create new intel-only testcases.

Yeah, IGT patches are already in ML:
https://patchwork.freedesktop.org/series/100539/

> 
> - Finally the property is set up, but not wired through. Or at least I'm
>    not seeing how this can even work.
> 
> So no idea what exactly you're aiming for here and what kind of comments
> you want, but this doesn't look like it's on the right path at all.

This "vrr_enabled" prop was userspace write only & driver read only prop 
which would be used by the userspace to request to enable the VRR on 
that CRTC.

Now I would like to modify this prop to be used as a bidirectional 
property. So, that userspace can request to enable the VRR and also to 
get the status of VRR on that CRTC.

Manasi is already replied to the Patch [1/2] in this series.

- Bhanu

> 
> Cheers, Daniel
> 
> 
>>
>>   drivers/gpu/drm/drm_crtc.c               | 26 ++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_mode_config.c        |  2 +-
>>   drivers/gpu/drm/i915/display/intel_vrr.c |  8 ++++++++
>>   include/drm/drm_crtc.h                   |  3 +++
>>   4 files changed, 38 insertions(+), 1 deletion(-)
>>
>> --
>> 2.35.1
>>
> 

