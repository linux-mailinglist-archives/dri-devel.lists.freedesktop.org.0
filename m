Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD6439464
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 13:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506DB89DFD;
	Mon, 25 Oct 2021 11:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC4D89DFD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 11:00:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="290456736"
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="290456736"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 04:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,180,1631602800"; d="scan'208";a="485624296"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 25 Oct 2021 04:00:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 04:00:20 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 04:00:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 04:00:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 25 Oct 2021 04:00:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUaSAjA2PqyMqgUP7FjHHjlFpWBci21TY55YP2CkwtaO4g/5hfF8SQM16b9TXAnrX7T0ujuove3KTkRUcrOcYAEjsswWH8QKWuKStAwiSw8fCVlLcEWIjW2xWH8MX7YPF4Tja39nPx2znLw/68M/YuJcFOIT5nhSsAO8S3WewTvu4npDH169x8bE6YjROW5WvIVE8wkdi+kXlfBPUfrBioxJi6DKP5felDg0/kys9rFiwb23iqb5nmjCY3s3hcl2tEqEwQ36HPGoc2iQ/92KEJ0RdoGVJDqmEb4fOF5J4548LKZ/Ad5J3mtZmXB4qs0zDzveDmOzxcaYInX1V3F5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8eHlm7kDQblVco9tGKNhfQFKedaIZCKbsEfrlIWIsg=;
 b=EYW7O6uYy2c1RztvApZPoFUqLLnJ7FBLEmsNpjPaoQmaRFWHYCvn+YGsR60YrThhue4XS9oIG42FXVuaFEVzwBqiNsPLADN97uF+v/EA39hv57JK2qvXmDJF+lvQMyv8md/9PnKyrahpT9jZYEeC9e3i7k7zITa7Tuiinwi8mKwtYn41gFjIvFjeN0Myw0cG5aoCEfphJTfkp5sGa6HLiDwD/Iu0frbgq03kplyULD8Au6Py8iI8JS5i40H3Wqu3wKgyeDkfd91Kec1FFQbm3hp1TofCj9HUWddzX4LWGexDzdIOCXSd3QBZcMG8Hz8ZymFERp/VNBfo0LQpqPnE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8eHlm7kDQblVco9tGKNhfQFKedaIZCKbsEfrlIWIsg=;
 b=YCX8EsnOpSPnXqoCgl3eqFxCyv5dPCBYLQYIWCP4c876XAi3Gj6i8nlpKTeQbh2KeLUy75EI1xsBOuQ0Npqk4fkNqIYkDm+T4uEy72HZK6Puv0oxcQk1ri8CLaiP3ZO43khJAqqdg0Yy+lJ6XQImFNK0nkAonTVx566MwRRFBbc=
Authentication-Results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM5PR1101MB2234.namprd11.prod.outlook.com (2603:10b6:4:5a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Mon, 25 Oct 2021 11:00:18 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::3856:7f41:e399:f907]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::3856:7f41:e399:f907%7]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 11:00:17 +0000
Message-ID: <cdcd19de-19e6-83ed-606f-defebdcc0997@intel.com>
Date: Mon, 25 Oct 2021 13:00:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/bridge: Fix the bridge chain order for pre_enable /
 post_disable
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>
CC: <dri-devel@lists.freedesktop.org>, Philip Chen <philipchen@chromium.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jagan Teki
 <jagan@amarulasolutions.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
 <YXHLrnAliqxmrrho@ravnborg.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <YXHLrnAliqxmrrho@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::16) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (95.160.158.79) by
 DB9PR01CA0011.eurprd01.prod.exchangelabs.com (2603:10a6:10:1d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 11:00:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd3d14b1-56b8-4a9b-3c6b-08d997a6a153
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2234:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR1101MB2234BBBD20C83FFA0AF90228EB839@DM5PR1101MB2234.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzz0jIkrAaMdsO4Do4rhReuKHpKWJidVLbk/tWnl7g8462+KrwGGKCjSbQyEm1hdhXE055Ya7smRYKSVZi75GcS0iU7Fo3i4r8Sc8GIjWA+43JVBs/IfSb6uGyGSgZlxtMjW1E3iDzZtyNAItYwlA37JPvPVQvM5xHLJAIOCNz0ncUIlvBo0On1fw5EJTwlNbaYAr3bY6lYBpk32Id/C5+gZJY27UTP5E/QY+3yxbdXpebEWNkCCXDVWkvOqGAsfkNqoYopfSblPUbaokSJJ0XwpGNyfEI//SnPJIArFmFxX/j7kiibTEfkL4uRtUy1+jJqwheGWL7DClMo+/1RGWkQ77yf33I//v4/6hz8Ny+JGtU3zJOJ59AMpXaL9uuoVWlTGfWmTWy8bdWosXTVwJOnZxIR9RsLLzFNHF2pkWYc2IH7KsxDKVEzb1BrF3ju7SwhfbSCYtyeOETUY6CK+M8E84blI5O56g8sNbBva55fdbJLmP6mQE81zGADJnisMfnAeMK2BWup/9aICJmoGYvpBd7k1YhYR90RydWS/ZhZlwcSFkhsZuFSDlvUEs+mp1tBo5apgTxyT2op8TQM6AORa3kPPN0RLNxsXdK684jGdjtkiEinc5fejXGuq3PsQwzCSif4D7MpejSI9h5k7CNqcB2snFlgMP7PhtdSyUbrWIOazTM/uqot/5XWAJe44iyFIEpBulR7J8AyYr4ONfnZkuDuu60trw/kJhD55jRvZXof0ywzVCnmKssI/gx1V6TEJZljgIx5JqeZ8F7eOXJcr8EE6cHeCKCqxYoahMGE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(956004)(86362001)(31686004)(6666004)(186003)(966005)(83380400001)(66946007)(508600001)(26005)(36756003)(38100700002)(7416002)(44832011)(6486002)(31696002)(8936002)(53546011)(316002)(5660300002)(2906002)(16576012)(8676002)(110136005)(66556008)(66476007)(54906003)(36916002)(4326008)(82960400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei81dnA0MS9iNENOajhVdkoyV2Z3U1NpUEJRNW1jL3Q3emZmTTF4MlpIK1ZJ?=
 =?utf-8?B?UWNFYXN6VmxyRnIwSUxSbUdZaGFyTkZUWlU0emM2WXIyT1p0QTJuVHBGd2s1?=
 =?utf-8?B?dFIyQzBGR0owWGFjdTRybllGcnJETzZuWEFxT0Z6TUJDSnZOZyt5RmVJdEto?=
 =?utf-8?B?S0RqR3NSeE4rYlIrTi9tUHVrZ2xjckFsVHM3TGZUeVJ1RERINmh5Ni9wTWxJ?=
 =?utf-8?B?a2VtN3FXNnhpNUh3VWp2WlhiRGdHN1JxdW5zeEs2cW16RXlJNDlxSDhvMWdZ?=
 =?utf-8?B?ZEtIYlNRNURrdE56a1JZaFRpTXg2RkhMc3VHbmtPZXV2ZTBmZytGQjdpZGdy?=
 =?utf-8?B?bEhaekhOdStGNWVxMFhkTGxxaHVSTzNmWVZsUFRhNVBEMDl6SXQ0a3Z2amxW?=
 =?utf-8?B?VjloemI4eGdqakhDTDV4b1FNRnVZRCswUWtJV0pSSkYwc2JrSHk0VlBaeVVp?=
 =?utf-8?B?aUpWU3preE5ObkxlRjAwQkRCOVlsZElNWG15TFBCdUNEbElONVJvd0t0Ynl2?=
 =?utf-8?B?dm96WWdiUWtrSkgyNS9TUkxoT1QzMmZMeStMeFhuQUdydmQveGoxdElMN0k5?=
 =?utf-8?B?L0tkOGduakZldVQ3SDYzeWNOTFVDUVU2R05sN0JjUGorUUcrbGs0dXI3SlNw?=
 =?utf-8?B?R2Rpbm9WOUFtWGxId0VTZTdaenVybzIvQVgzN2srK0lLKzI3d1NYRmYzaHV5?=
 =?utf-8?B?aE1DR1hYR1NudG9jTkQwQlc4eWNlbzRqSk0vSGh0RVlOc1VYUEh6T3Zyanhv?=
 =?utf-8?B?aFgzLzVaY2k5Nmk3VXo3cXBJbStIZU52bzM1TkJ4ZE9NZG9rdzYzWDYraG1Q?=
 =?utf-8?B?STdtaHZoKytVVWNGZTF6TFZNZ1R2WEdRY2dIMUp6blRzQmhwazFMN3IwOHNj?=
 =?utf-8?B?bTdUdThjaEpNRmx6T1B5b3NjSW0vM2lNMnduTFBoNzdTN2ZzWm04bXh3aXBs?=
 =?utf-8?B?SHFTblBNRisrNkZlSTlEdGhOY1RyTncxOW5EbW51QjZ2dmxJTUNhR3Nscy94?=
 =?utf-8?B?cE5RaHBtUTM4NTNRRUd1Ny9vTGVSRVdMbmxtZzc2RHg2QTB0SXJFVCtHc0dU?=
 =?utf-8?B?UW00R29JNkFKajFSMVF1OGVGNzRacmFlMUFJMUQ0UzdSRGxLS2VrQmpkaEpP?=
 =?utf-8?B?VXZIdjQrekd2WjNocGd1c0dtUVhjOCtxbGdkY3J1WE9pcERubnRKTDRvS1B5?=
 =?utf-8?B?em5Gc2V2dnVHYWtDL1NNdGFKV3RJVXFTRmFkcmJyZitLdmhmK3RYVHVUSk9s?=
 =?utf-8?B?VGsvNHJTRi9YUmRFU0s4dFRNRWpkT25XNzNJVGd6YU5JYUlvSm9pTEQzUS84?=
 =?utf-8?B?b043a1Z3Y1IwN3ZQa29EamtLNGUzcDVyVXpSNHFMWSt0MUcrenRhbi9oY0xD?=
 =?utf-8?B?MDJndUVKdzhIUlozbmdUNGRuUTFMTkwwbWlJaWhlRkEzNjc5VEJDNUhNMFBH?=
 =?utf-8?B?NFF5ckM1OTgwZTMyeE5CMlB3RXc1Q2Y4TlhwbGI0cmM5WUIxNVY4ZWRDZURI?=
 =?utf-8?B?dDV0amc3ZVFsdU9hZXFXMnZqeE54b2NzcUJhdm1mT3ZaV2xXNUVVS0xkblkx?=
 =?utf-8?B?WSt3REdTcnFINVIvTHJmd3BCN2xjVkNmaDVmZVNpbjVweDExWndyZVVsaUdo?=
 =?utf-8?B?MTNuaEx3QnU3VmZMN1BMT3NSQTRSdVRZU29iNTJpOTN4RXV0QVh4TDhwSy9X?=
 =?utf-8?B?Q05rZTR4Ny9VeFVCY00zTS90UEt2dFJsU2Zvb2o2VlpZa0g4Tng0VC9OU05Y?=
 =?utf-8?B?ZmNjRHJJUVBtWGpJTHpSVVJLUzQ5eW81UmhBNkdOUDhzUDZkZC8veXJhc0Jx?=
 =?utf-8?B?dkUvSWM1cm5Va1ZhcVhSUDhrbUtsN1dGdTFkVnk4SG1rUzV1OTF3Z1MvS1BJ?=
 =?utf-8?B?TnAzZFg2RmdsclEyTC96UWxZTWJwMVBhUjVKa0czTkhLOGZBcDkzTWF4WENo?=
 =?utf-8?B?V1JoT0dUdmp2cFQ0eGpDYlc2WmdoTWFTWVdBQ3NBMVBZejdjUzhFeXJFUWVa?=
 =?utf-8?B?Wmd0SVdSWENndXdGa25iZmVYZ3BJU3p6NnVrZVV2SmF6dURMcGZaQlhzSTdX?=
 =?utf-8?B?NVJaQ2V3N3hPcE43YUN6bWZlQTJTWnlLemxaazVHai9oUmFweE0wU3gxVWJq?=
 =?utf-8?B?a2FjaXRkM0ZsU1dVYzJjK1oxd3RiNFBLSitDQUU4L1ZIZWxGR3l4M2hYN0Uw?=
 =?utf-8?Q?vRJ+hoorxeLKh35CLUwJrWI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3d14b1-56b8-4a9b-3c6b-08d997a6a153
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 11:00:17.8626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI5D1M2j5mfGnz/0q0vc4R+6VcsnmBDlXFTIkcV5Q+ZqIPZH/FfvaZZ71HxTcrTYnv7T40moqeiuiJbj0fAAXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2234
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

Hi All,

On 21.10.2021 22:21, Sam Ravnborg wrote:
> Hi Douglas,
>
> On Thu, Oct 21, 2021 at 12:29:01PM -0700, Douglas Anderson wrote:
>> Right now, the chaining order of
>> pre_enable/enable/disable/post_disable looks like this:
>>
>> pre_enable:   start from connector and move to encoder
>> enable:       start from encoder and move to connector
>> disable:      start from connector and move to encoder
>> post_disable: start from encoder and move to connector
>>
>> In the above, it can be seen that at least pre_enable() and
>> post_disable() are opposites of each other and enable() and disable()
>> are opposites. However, it seems broken that pre_enable() and enable()
>> would not move in the same direction. In other parts of Linux you can
>> see that various stages move in the same order. For instance, during
>> system suspend the "early" calls run in the same order as the normal
>> calls run in the same order as the "late" calls run in the same order
>> as the "noirq" calls.
>>
>> Let fix the above so that it makes more sense. Now we'll have:
>>
>> pre_enable:   start from encoder and move to connector
>> enable:       start from encoder and move to connector
>> disable:      start from connector and move to encoder
>> post_disable: start from connector and move to encoder
>>
>> This order is chosen because if there are parent-child relationships
>> anywhere I would expect that the encoder would be a parent and the
>> connector a child--not the other way around.
> This makes good sense as you describe it. I hope others can add more
> useful feedback.
> Added Andrzej Hajda <andrzej.hajda@intel.com> to the mail, as he have
> expressed concerns with the chain of bridges before.


Thanks Sam, but I am not sure about useful feedback - when I see bridge 
chain issues it automatically triggers "whining mode" in my head :)


>
>> This can be important when using the DP AUX bus to instantiate a
>> panel. The DP AUX bus is likely part of a bridge driver and is a
>> parent of the panel. We'd like the bridge to be pre_enabled before the
>> panel and the panel to be post_disabled before the
>> bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
>> bridge driver's post_suspend to work properly even a panel is under
>> it.
>>
>> NOTE: it's entirely possible that this change could break someone who
>> was relying on the old order. Hopefully this isn't the case, but if
>> this does break someone it seems like it's better to do it sonner
>> rather than later so we can fix everyone to handle the order that
>> makes the most sense.


It will break for sure. So the question is: if it is worth changing?

New order seems good for eDP, DSI sinks [1], probably other as well.

Old order is better for example for THC63LVD1024 [2 p. 20], I guess for 
many other sinks as well.

I am not even sure if it is protocol specific (LVDS, RGB, HDMI,...), or 
it depends on specific hw pairs (source->sink).

This is why I complain about the bridge chain - assumption that one 
fixed call order will work for all setups seems to me ridiculous.

Going back to the question - changing the order from fixed one to 
another fixed one will not solve general issue.

What can we do then?

1. Configurable call order? Probably doable: every chain element should 
expose info if it's call should be before or after source, then some 
core helper will create queue of callbacks. Seems quite complicated, 
hides the logic from implementer and not fully flexible (for example, 
there are protocols which require to perform sth on source, then on 
sink, then again on the source).

2. Stop using bridge chain and call sink ops directly from the source 
(this is what Exynos and VC4 do): is flexible and straightforward, gives 
full control to the source.

3. Use different abstractions to enforce proper initialization order 
(like extending mipi_dsi_host_ops): requires existence of transport bus 
abstraction (only DSI at the moment(?)).

... other ideas?


Another idea, connected to the subject - some protocols require some 
negotiations between source and sink bus format, or more steps than 
pre_enable, enable ops to establish link. I wonder if encapsulating 
drm_bridge in some protocol specific struct wouldn't be a solution, it 
can be helpful as well in case of the subject.

For example:

struct drm_bridge_edp {

     const struct drm_bridge_edp_funcs *funcs;

     struct drm_bridge base;

     ...

};

Then source could promote bridge pointer to bridge_edp pointer (if 
applicable) and perform edp specific stuff. To make it working well 
pre-enable order should be as proposed in this patchsets (encoder -> 
connector), as the source should initiate negotiations.

Btw this encapsulation stuff above asks to rename drm_bridge to 
drm_sink, otherwise it would be confusing as bridges have two ends.


Regards

Andrzej



[1]: I use term sink as short equivalent for 'bridges AND panels' 
(another issue in DRMs).

[2]: https://www.mouser.com/datasheet/2/286/THC63LVD1024-1396205.pdf


Regards

Andrzej


>>
>> A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
>> ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
>> inadvertently changed the order of things. The order used to be
>> correct (panel prepare was at the tail of the bridge enable) but it
>> became backwards. We'll restore the original order with this patch.
>>
>> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
>> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> To make the patch complete the descriptions in drm_bridge_funcs
> need to be updated to reflect the new reality.
>
>> ---
>>
>>   drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++--------------
>>   1 file changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index c96847fc0ebc..98808af59afd 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -583,18 +583,14 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>>   void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
> If you, or someone else, could r-b or ack the pending patches to remove
> this function, this part of the patch would no longer be needed.
>
>>   {
>>   	struct drm_encoder *encoder;
>> -	struct drm_bridge *iter;
>>   
>>   	if (!bridge)
>>   		return;
>>   
>>   	encoder = bridge->encoder;
>> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>> -		if (iter->funcs->pre_enable)
>> -			iter->funcs->pre_enable(iter);
>> -
>> -		if (iter == bridge)
>> -			break;
>> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>> +		if (bridge->funcs->pre_enable)
>> +			bridge->funcs->pre_enable(bridge);
>>   	}
>>   }
>>   EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>> @@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>>   					  struct drm_atomic_state *old_state)
>>   {
>>   	struct drm_encoder *encoder;
>> +	struct drm_bridge *iter;
> s/iter/bridge/ would make the patch simpler
> And then the bridge argument could be last_bridge or something.
> This would IMO increase readability of the code and make the patch smaller.
>>   
>>   	if (!bridge)
>>   		return;
>>   
>>   	encoder = bridge->encoder;
>> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>> -		if (bridge->funcs->atomic_post_disable) {
>> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>> +		if (iter->funcs->atomic_post_disable) {
>>   			struct drm_bridge_state *old_bridge_state;
>>   
>>   			old_bridge_state =
>>   				drm_atomic_get_old_bridge_state(old_state,
>> -								bridge);
>> +								iter);
>>   			if (WARN_ON(!old_bridge_state))
>>   				return;
>>   
>> -			bridge->funcs->atomic_post_disable(bridge,
>> -							   old_bridge_state);
>> -		} else if (bridge->funcs->post_disable) {
>> -			bridge->funcs->post_disable(bridge);
>> +			iter->funcs->atomic_post_disable(iter,
>> +							 old_bridge_state);
>> +		} else if (iter->funcs->post_disable) {
>> +			iter->funcs->post_disable(iter);
>>   		}
>> +
>> +		if (iter == bridge)
>> +			break;
> I cannot see why this is needed, we are at the end of the list here
> anyway.
>
>
>>   	}
>>   }
>>   EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
> 	Sam
