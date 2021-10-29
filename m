Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA07443FFF4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 17:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A60E6EA6F;
	Fri, 29 Oct 2021 15:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF6889E35
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 15:57:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="228149182"
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="228149182"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 08:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="636730112"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2021 08:57:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 29 Oct 2021 08:57:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 29 Oct 2021 08:57:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 29 Oct 2021 08:57:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 29 Oct 2021 08:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAqLL2lLFKXi7/YGVjm29bRUidwdcXazfOATqrmeiEMFbWhAaNwhiM/JsX5rErlPBOTXNeJ+765QDRfPSZ8iqksKuMk6ENjs9ore0z271S2pobjpDig2f7V2yN1g10wG1B8dRzfBXHwf/+lm5QHTGCg8TWeHsQJwnGjyw+uIDyRyGF24imqhu/Rd/AZNW05urJljzUzQMEuaoEmlQ1zrje5nKUoOhA+lH929f6BkVaj8NbFvbJdzeUUyInltX3m97OfPRUacSMrRbytUK5YPSNPO5k079eaUP2/iqpOFS7nKDCvACV6Ha6j4GQqvU7SqeC5pUSU3AlcH95XRf8iipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KseepTp5egxrKNmymtgkEaNj/fE9BoABJkN3jg3yEs=;
 b=SseAQSdKMGHHWGHhVlQBIiiP5YGDZyI+yawePkABB7ACPAoQqwyhmuc97Dg4xR8H1ro4Y8eXQRQbPie9BBr2pfMt1ttulND1oOrA17l9twzK/MMnlYyJFGEmSTwspgn2VWrcfLBPb6ZVXExq6KhEy8BqQldZKWZrEMP8YwZHpDAW0DCOxxUD5bbScnjX8h+Nug+a3V8Y3TaGq3InYtXL70UndjKMD6wIdHajZzRmImKzKZLkXc2knRwpLyz9BEVrkKvHjqpou4IHznk5ZCL0gbeaAQJkVGafsZ7yoC4/Yd/ihKxn71IhHxe6HWAt4riUXR8cBdg6lBHnwKlPABxdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KseepTp5egxrKNmymtgkEaNj/fE9BoABJkN3jg3yEs=;
 b=KqAlWwTBOlKuCVdpR3HBKS/gYvcNaIntiC4PFckDQODuGCKZilIY+e0Awj+Q9QAC/PiBmlWDhvcLj7n2wbUAZMho7n9MrG7RqvniUUTwKpRYMmXgQbx8ofmZxZZXa2JAjAyNruXK0k/GDgVsAV2I7awW+WikaE/WxfQtGRtkSXo=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none; ideasonboard.com; dmarc=none action=none header.from=intel.com; 
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM5PR11MB1706.namprd11.prod.outlook.com (2603:10b6:3:b::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Fri, 29 Oct 2021 15:57:17 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::3856:7f41:e399:f907]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::3856:7f41:e399:f907%7]) with mapi id 15.20.4628.020; Fri, 29 Oct 2021
 15:57:17 +0000
Message-ID: <9f6744db-f035-204e-2ac6-1d3dca3a2c98@intel.com>
Date: Fri, 29 Oct 2021 17:57:10 +0200
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
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>
References: <20211021122719.1.I56d382006dea67ed8f30729a751fbc75434315b2@changeid>
 <YXHLrnAliqxmrrho@ravnborg.org>
 <cdcd19de-19e6-83ed-606f-defebdcc0997@intel.com>
 <YXaTJ+bwm7vSTGpv@pendragon.ideasonboard.com>
 <0e17993d-1e9f-2673-7fee-abf3787de431@intel.com>
 <YXiOVlve5RshqA/B@pendragon.ideasonboard.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <YXiOVlve5RshqA/B@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6P18901CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::27) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (95.160.158.79) by
 DB6P18901CA0017.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 15:57:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 195d807f-3794-4cf1-391f-08d99af4c827
X-MS-TrafficTypeDiagnostic: DM5PR11MB1706:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB17061469D18F03BC470D9D90EB879@DM5PR11MB1706.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbSPwoC/aawfN23PYeWuLNkjGyiMxChkf99s11WSNtcZh/D6yXfNQCvShbeTFueVfjYhkFgtpR2Jrwx/JPsYYPfhyFmspI0hiHlqL1Tzn4TZTthiegHgM0RcSvzDlen4wchAcFW+06yzoQz69VDG+ghiu/IS/e7IbkW6grdaZOSTwmYAB8sdOKjBnfywyOwXGhKRtj+RHu5cSCcOfLXgKC6oYa/pNaXXx2AUfCWVHJtWCA4vfDN+wP5gj0z6RvuNpX4ug7OF8oAOXHWcit2V1t6pc6bcWgJqcZGMCS1Gvnx12+xFReD/+wEdMhdHHxItCvVt3Ntnf5BcaYB4HS0nyyKLzIqzpIt2+RWmM47dbNglg5gQuqpCrcXE9nyH0nwN7Qd7/ypLrDbua+btb0OI9lLUt11qGGxtjMVH/jB2w7oi5uNw0E/wZXcQ4sJzHldb1HSZeeKnIqDwQAI8Oykmz+efKUP/1BHYuibAb1RTeqz2fnI0aHz9lohcrH81R0CswHZK9Ie3V4COyUIe7IEpuSMxlKxCu11F70FM/S+iB5X+5PVrx9a/RayUxgg7B1tDiFsnm875AY1Kg+cteLu+rW0GIcODmmew+Z7M+lq5NoLAz2oIDNilx4EDpX/tT0mMoJTpOj28nIMfkgiUFLmTRua4e87r+i3OXYee3A5izdwYVHmtqjlSBmJZtj7iKd3vNBg+Id3dG90e5i+L5zZylpetRNWfWD6tu0XuOlyJwqWQOXRwXNOBgIByx4DtYGIJDW74+gd3y6cddEZv3WGgff78otKQNcx7WTlbjHInjq11dPAWVpwWeCnpANrBLcKu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(186003)(36916002)(66946007)(5660300002)(30864003)(44832011)(6486002)(16576012)(316002)(31686004)(54906003)(26005)(966005)(508600001)(82960400001)(7416002)(4326008)(31696002)(66556008)(6916009)(36756003)(8676002)(8936002)(38100700002)(2616005)(956004)(6666004)(53546011)(83380400001)(2906002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVJJeExFbGlKRXRmbEVJSSsydUNJdFYxeGdPbWVVNm1mVHk3K2RkRHFibnNv?=
 =?utf-8?B?U1pvWjZ4V1NkTEY2eXRrODRCRGxkSjd3RkVnNWxuOXhmNUttUVVYbnkxUTZl?=
 =?utf-8?B?RjVKUlBtMzcwS3p4RTFENXlSYjFUQVZDcm5GU2ROZStHcnpIVEUwblV3TVpj?=
 =?utf-8?B?MURBQXkvTzRGcE1ueUEzNXBtUi83L3NSa2VLUWNyYXFhVnd3WGJVMUtwbUNF?=
 =?utf-8?B?KzUxOGpKa09lbE45NjQySUpzWTZGNXFTYktPSWpBbEVIUnRmT1RzaXNYbkFy?=
 =?utf-8?B?cnd3ZkdBSmxBWE5mSXNDNTNzYXpYMXhVc3ZId3dXdlY2bEZhaEcwWlpFVUdX?=
 =?utf-8?B?RmQvR0lGY1dDVTk2RTNMeURoSERpeEl1TXJJSzhFY0Q4L08xSzNkUmR2TnBy?=
 =?utf-8?B?UHU1OWxzNXlRSGJVd0VabWtCU1daRHNZaHZhUHlMM1VJRUp4U2lIQzNVOXVl?=
 =?utf-8?B?Rk1QTUQyM1ZPMlRUWWdxVVJRY1Q5aGc0Q1hXdm9nZFhGdWxsQ2owMDczOFNy?=
 =?utf-8?B?ejR2MTlLTUZoeFNVb3pkWjE1N0dRY0Y5SjNxdEx0aFJsQjZkNEY2WjE0ellT?=
 =?utf-8?B?dUZTZDBpYjA3RzlKcTFJUmlEMm04S0dlQUVVOGVNR0xNTlpMN1d4cjh6QU1n?=
 =?utf-8?B?aUY0K1RxMHE0Yng2UGtEMlZJbW9BdDZqREZEczRxSlF3YmZQMTBUVVA2NCtr?=
 =?utf-8?B?TU9HcENYeHNRY1pXQ0N0NDcyZTRTbGFSdWh5WExraUcrWG1HWk1xUmRjQzhs?=
 =?utf-8?B?cTJ4akNqRHJOdXJoMGQ4N1lvWTNBNFJ1SDMwZU00VVExdnpsZDdNeEk3QllF?=
 =?utf-8?B?NTdUY2hjelRUTHV3SlYwZHd2Y2RuUk1LYzJiVTRQclJBWjNoVVE2WXV6Z0J0?=
 =?utf-8?B?ZDB0RFJ5bk1nYUkyaVdJTkNLSmEzQzdBR2lWUmIzdzdGZURMMkVYcTVPbnFC?=
 =?utf-8?B?QUhHOWNYTklHOWlSd2wyWWh0UE8vYmpzOC9lWDl2MFE1Ymx4eWI1VjNsMzlv?=
 =?utf-8?B?T2VYLzhsdU1tQ01kK0Z1VTZOVlhseThtK0VrUktId25BVTQ2cURmaG5FaDEy?=
 =?utf-8?B?QVMxUEEralhUYTErZnJyVXdYYVBnZ3o3MlAxcDZIZHVMWkY5K3ZZRmVBSklS?=
 =?utf-8?B?alkvZUc0anZaN0w3TXpnc0pPUHp1L3g3VXpPVlN6eDNGNEpTb01UWmlsMXll?=
 =?utf-8?B?R2NpN3BQdU5ucTNVd1dCUXI1ejRCVGdJeEZ6R3hCNFl3am8wYUJZSmUzOFVm?=
 =?utf-8?B?RXFDbE8ybCtTSmVrODZDWTdaWm5sNmpoVUVoaDFNOEcyNzR3cGs3eFpTbC9E?=
 =?utf-8?B?MTNKWHhVelRWUko5WVVRZTQ0eVVQT25sSWszOE1ieEpUd0tzeGRabGlISGRL?=
 =?utf-8?B?MmdvOXFpb0FjYm03c2ZKNW5qcWZFOUI3bjQ4N1BBSG5mSVZndUdFK0FveXdZ?=
 =?utf-8?B?SGt6RUJPeU9ZRXVkWWlrWUlCM0xnTDZ5SnBYOGtNQjNhaHF6ekV5bCt5NU8r?=
 =?utf-8?B?TUR5NEZOQWN0SEJHV3Q3NzhlNnJ3MEpFeUZSNlJicTlyL0d2TUN5WHA2K2th?=
 =?utf-8?B?MGZNM1RGYmVPOHlDOC9IbGNQZDR0M0V0OVBXVG5jcHFqU1o5R2VIbXpxMHpT?=
 =?utf-8?B?dmg1TDNXU1MzZ2ZCK3k3dCtSZ3BQb0c3dGliNjhnRy81MTZ1Ym5RZW1ROTJh?=
 =?utf-8?B?YjlmSVVrK1JUZm9ERHlSbHUyQ1FxbnFLdTQvSDN4U0EwWFdQTTRlemxsdEFH?=
 =?utf-8?B?anFHL0RRYkgyVjFEcWtKamIxZGlqL1Ntd1dKYUdieDBJbmcvV1BONVZEMWdz?=
 =?utf-8?B?TWJxTFRCWmZlK1dEcEJtaHpOaG5LZkI0b3hCZ28rN1kweWVxVHZ3elR6aGtW?=
 =?utf-8?B?eDFHSzFqcUdTUkx1QXFOVk5vczBQRHhvODliOUk0R3BrNVZuWEEvbEhjZE10?=
 =?utf-8?B?Sy9MQ0ZCUHM4YldXcmR1VjNIb0RDZkppK1ZaTXBiODhBN0NiM2lIeTZLZk1B?=
 =?utf-8?B?dVBPM2dKdGpxUjZCSE1NSWY4TktEZ0lSU2dsTm13VnBYd3dVRi9MSE1JNXZ1?=
 =?utf-8?B?MFVVYkRHSzlBbDZlZGNWMzNreDFlUHBLSXZhaUt6dkw2LzY0cTF5OHppd3p2?=
 =?utf-8?B?ajNDVkZhUlZHV3ZtV0kvaFZsSW9Ld1YyVUNLNmZRWkZiSzNDRjl1OGhZM1l1?=
 =?utf-8?Q?F6MH3TV90mSBBAW3/9DhYiY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 195d807f-3794-4cf1-391f-08d99af4c827
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 15:57:17.2626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+9DEBEmP7EdEoDABumg1vsGVgKJPSb/CAG/3HJlje9/cZiYiC+bs2NCcoPoK9FzIDB5lTQZYVZO6+wZ792mWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1706
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


On 27.10.2021 01:25, Laurent Pinchart wrote:
> Hi Andrzej,
>
> On Mon, Oct 25, 2021 at 10:11:47PM +0200, Andrzej Hajda wrote:
>> On 25.10.2021 13:21, Laurent Pinchart wrote:
>>> On Mon, Oct 25, 2021 at 01:00:10PM +0200, Andrzej Hajda wrote:
>>>> On 21.10.2021 22:21, Sam Ravnborg wrote:
>>>>> On Thu, Oct 21, 2021 at 12:29:01PM -0700, Douglas Anderson wrote:
>>>>>> Right now, the chaining order of
>>>>>> pre_enable/enable/disable/post_disable looks like this:
>>>>>>
>>>>>> pre_enable:   start from connector and move to encoder
>>>>>> enable:       start from encoder and move to connector
>>>>>> disable:      start from connector and move to encoder
>>>>>> post_disable: start from encoder and move to connector
>>>>>>
>>>>>> In the above, it can be seen that at least pre_enable() and
>>>>>> post_disable() are opposites of each other and enable() and disable()
>>>>>> are opposites. However, it seems broken that pre_enable() and enable()
>>>>>> would not move in the same direction. In other parts of Linux you can
>>>>>> see that various stages move in the same order. For instance, during
>>>>>> system suspend the "early" calls run in the same order as the normal
>>>>>> calls run in the same order as the "late" calls run in the same order
>>>>>> as the "noirq" calls.
>>>>>>
>>>>>> Let fix the above so that it makes more sense. Now we'll have:
>>>>>>
>>>>>> pre_enable:   start from encoder and move to connector
>>>>>> enable:       start from encoder and move to connector
>>>>>> disable:      start from connector and move to encoder
>>>>>> post_disable: start from connector and move to encoder
>>>>>>
>>>>>> This order is chosen because if there are parent-child relationships
>>>>>> anywhere I would expect that the encoder would be a parent and the
>>>>>> connector a child--not the other way around.
>>>>> This makes good sense as you describe it. I hope others can add more
>>>>> useful feedback.
>>>>> Added Andrzej Hajda <andrzej.hajda@intel.com> to the mail, as he have
>>>>> expressed concerns with the chain of bridges before.
>>>> Thanks Sam, but I am not sure about useful feedback - when I see bridge
>>>> chain issues it automatically triggers "whining mode" in my head :)
>>>>
>>>>>> This can be important when using the DP AUX bus to instantiate a
>>>>>> panel. The DP AUX bus is likely part of a bridge driver and is a
>>>>>> parent of the panel. We'd like the bridge to be pre_enabled before the
>>>>>> panel and the panel to be post_disabled before the
>>>>>> bridge. Specifically, this allows pm_runtime_put_sync_suspend() in a
>>>>>> bridge driver's post_suspend to work properly even a panel is under
>>>>>> it.
>>>>>>
>>>>>> NOTE: it's entirely possible that this change could break someone who
>>>>>> was relying on the old order. Hopefully this isn't the case, but if
>>>>>> this does break someone it seems like it's better to do it sonner
>>>>>> rather than later so we can fix everyone to handle the order that
>>>>>> makes the most sense.
>>>> It will break for sure. So the question is: if it is worth changing?
>>>>
>>>> New order seems good for eDP, DSI sinks [1], probably other as well.
>>>>
>>>> Old order is better for example for THC63LVD1024 [2 p. 20], I guess for
>>>> many other sinks as well.
>>>>
>>>> I am not even sure if it is protocol specific (LVDS, RGB, HDMI,...), or
>>>> it depends on specific hw pairs (source->sink).
>>>>
>>>> This is why I complain about the bridge chain - assumption that one
>>>> fixed call order will work for all setups seems to me ridiculous.
>>>>
>>>> Going back to the question - changing the order from fixed one to
>>>> another fixed one will not solve general issue.
>>>>
>>>> What can we do then?
>>>>
>>>> 1. Configurable call order? Probably doable: every chain element should
>>>> expose info if it's call should be before or after source, then some
>>>> core helper will create queue of callbacks. Seems quite complicated,
>>>> hides the logic from implementer and not fully flexible (for example,
>>>> there are protocols which require to perform sth on source, then on
>>>> sink, then again on the source).
>>>>
>>>> 2. Stop using bridge chain and call sink ops directly from the source
>>>> (this is what Exynos and VC4 do): is flexible and straightforward, gives
>>>> full control to the source.
>>> And breaks interoperability, because different sources end up calling
>>> operations in different orders. We end up having different sinks that
>>> expect calls in different ways, and divide the world in sink/source
>>> groups that don't interoperate :-(
>> I have an impression you describe current status :) More seriously, it
>> is matter of proper specification/documentation/implementations of the
>> operations. If we really need strict constraints we could try to
>> implement them on protocol level.
> I certainly wouldn't complain if we had better documented operations :-)
>
>>>> 3. Use different abstractions to enforce proper initialization order
>>>> (like extending mipi_dsi_host_ops): requires existence of transport bus
>>>> abstraction (only DSI at the moment(?)).
>>> A real bus seems overkill, but we could have drm_bridge operations
>>> specific to particular hardware interfaces.
>>>
>>>> ... other ideas?
>>> I don't like it because of the amount of work it would require to switch
>>> to such a model, but I'm really starting to think that a variation of
>>> the second option would be best, where the sink controls the source
>>> instead of having the source controlling the sink. It's the sink that
>>> knows about its enabling/disabling sequence, and about how the source
>>> needs to be controlled to match it.
>> I am afraid it depends on the protocol and cross-calls (source->sink,
>> sink->source) can be hard to avoid in case of some protocols.
> Do you have any particular protocol in mind ?

I guess I made my claim too early, as I do not know how would you like 
to implement this "sink controls the source".

So the main question is why do you think sink should control the source, 
leaving aside the current model (which looks for me source control sink) 
I do not see why sink->source would be better than source->sink.


Going back to your question in Exynos DSI there were following stages, 
according to vendor code:

1. DSI host on.

2. DSI dev on.

3. DSI host init.

4. DSI dev init.

5. DSI host start video.

6. DSI dev display_on.

How would you put it into framework?


>
>>>> Another idea, connected to the subject - some protocols require some
>>>> negotiations between source and sink bus format, or more steps than
>>>> pre_enable, enable ops to establish link. I wonder if encapsulating
>>>> drm_bridge in some protocol specific struct wouldn't be a solution, it
>>>> can be helpful as well in case of the subject.
>>>>
>>>> For example:
>>>>
>>>> struct drm_bridge_edp {
>>>>
>>>>        const struct drm_bridge_edp_funcs *funcs;
>>>>
>>>>        struct drm_bridge base;
>>>>
>>>>        ...
>>>>
>>>> };
>>>>
>>>> Then source could promote bridge pointer to bridge_edp pointer (if
>>>> applicable) and perform edp specific stuff. To make it working well
>>>> pre-enable order should be as proposed in this patchsets (encoder ->
>>>> connector), as the source should initiate negotiations.
>>>>
>>>> Btw this encapsulation stuff above asks to rename drm_bridge to
>>>> drm_sink, otherwise it would be confusing as bridges have two ends.
>>> drm_sink would be equally confusing when used for devices that have a
>>> sink and a source :-) I'm not against a rename though, if we can find a
>>> better name.
>> But in this case we are interested only in sink part of the bridge (OR
>> panel). If source is looking for specific bridge or panel
>> (drm_of_find_panel_or_bridge), it is in fact looking for sink.
> I'm find using "sink" as part of a function name that would look up a
> sink, but the device itself isn't necessarily just a sink, so we need a
> more generic name.


source is looking for the sink, and using only the sink, what is behind 
the sink is sink's private matter :)

I guess you have an approach that all these bridges/sinks/crtcs/.... are 
parts of drm_dev and drm_dev should control them directly. My approach 
is more local - they are part of drm_dev but mainly they 'talks' only to 
their neighbours- sinks or sources, from drm_dev they require only few 
global settings, and drm_dev controls them indirectly.


Regards

Andrzej


>
>>>> [1]: I use term sink as short equivalent for 'bridges AND panels'
>>>> (another issue in DRMs).
>>>>
>>>> [2]: https://www.mouser.com/datasheet/2/286/THC63LVD1024-1396205.pdf
>>>>
>>>>>> A FURTHER NOTE: Looking closer at commit 4e5763f03e10 ("drm/bridge:
>>>>>> ti-sn65dsi86: Wrap panel with panel-bridge") you can see that patch
>>>>>> inadvertently changed the order of things. The order used to be
>>>>>> correct (panel prepare was at the tail of the bridge enable) but it
>>>>>> became backwards. We'll restore the original order with this patch.
>>>>>>
>>>>>> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
>>>>>> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
>>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>>>> To make the patch complete the descriptions in drm_bridge_funcs
>>>>> need to be updated to reflect the new reality.
>>>>>
>>>>>> ---
>>>>>>
>>>>>>     drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++--------------
>>>>>>     1 file changed, 14 insertions(+), 14 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>>>>> index c96847fc0ebc..98808af59afd 100644
>>>>>> --- a/drivers/gpu/drm/drm_bridge.c
>>>>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>>>>> @@ -583,18 +583,14 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>>>>>>     void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>>>>> If you, or someone else, could r-b or ack the pending patches to remove
>>>>> this function, this part of the patch would no longer be needed.
>>>>>
>>>>>>     {
>>>>>>     	struct drm_encoder *encoder;
>>>>>> -	struct drm_bridge *iter;
>>>>>>     
>>>>>>     	if (!bridge)
>>>>>>     		return;
>>>>>>     
>>>>>>     	encoder = bridge->encoder;
>>>>>> -	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>>>>>> -		if (iter->funcs->pre_enable)
>>>>>> -			iter->funcs->pre_enable(iter);
>>>>>> -
>>>>>> -		if (iter == bridge)
>>>>>> -			break;
>>>>>> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>>>>>> +		if (bridge->funcs->pre_enable)
>>>>>> +			bridge->funcs->pre_enable(bridge);
>>>>>>     	}
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>>>>>> @@ -684,26 +680,30 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>>>>>>     					  struct drm_atomic_state *old_state)
>>>>>>     {
>>>>>>     	struct drm_encoder *encoder;
>>>>>> +	struct drm_bridge *iter;
>>>>> s/iter/bridge/ would make the patch simpler
>>>>> And then the bridge argument could be last_bridge or something.
>>>>> This would IMO increase readability of the code and make the patch smaller.
>>>>>>     
>>>>>>     	if (!bridge)
>>>>>>     		return;
>>>>>>     
>>>>>>     	encoder = bridge->encoder;
>>>>>> -	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
>>>>>> -		if (bridge->funcs->atomic_post_disable) {
>>>>>> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>>>>>> +		if (iter->funcs->atomic_post_disable) {
>>>>>>     			struct drm_bridge_state *old_bridge_state;
>>>>>>     
>>>>>>     			old_bridge_state =
>>>>>>     				drm_atomic_get_old_bridge_state(old_state,
>>>>>> -								bridge);
>>>>>> +								iter);
>>>>>>     			if (WARN_ON(!old_bridge_state))
>>>>>>     				return;
>>>>>>     
>>>>>> -			bridge->funcs->atomic_post_disable(bridge,
>>>>>> -							   old_bridge_state);
>>>>>> -		} else if (bridge->funcs->post_disable) {
>>>>>> -			bridge->funcs->post_disable(bridge);
>>>>>> +			iter->funcs->atomic_post_disable(iter,
>>>>>> +							 old_bridge_state);
>>>>>> +		} else if (iter->funcs->post_disable) {
>>>>>> +			iter->funcs->post_disable(iter);
>>>>>>     		}
>>>>>> +
>>>>>> +		if (iter == bridge)
>>>>>> +			break;
>>>>> I cannot see why this is needed, we are at the end of the list here
>>>>> anyway.
>>>>>
>>>>>>     	}
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
