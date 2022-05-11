Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FFE523D2E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 21:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2A6112B0E;
	Wed, 11 May 2022 19:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24C610FAEB;
 Wed, 11 May 2022 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652296285; x=1683832285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AB5NhtTiKRDL6pfIAfTUCzhbRMpOAvBGcCe1ore8QKw=;
 b=H3RXSKlXcfYWNSFpHo76gCiQtgMrNqiutCVwjZBf5GW3WWd3fB5Ix33M
 b4Z220yLl8QtdZkp/rbfhkXcOLWB9l2lBBTkzKoEmPoAw6N0B+Ym4zYl6
 rPA9ziFN93JuO7GoCxBuTl9LAmapeayOQ4N8gnrnTmT7QNZ1Ashm5sQQy
 jXtlQ0amqAKGSqOS0sJsoENCBEVUTnh6ZU1OPILkdfMoWbvVEfCo/LWBy
 GBvUuf6Gwk/Vh9JPd61+LLOp66ofXfC6rDiMQam/MuiB/LbuVBeFMK4aE
 XKK5zGmurv60VUzcuamPXww+BcBzOOZ+YwhSxjeauAo87FXX4x6kmFnxD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="250319510"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="250319510"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 12:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="624082901"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2022 12:11:25 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 12:11:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 11 May 2022 12:11:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 11 May 2022 12:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyoagMqW80km1XffVe9DeIFbvjd39HWZcZCOzEh2bSK75zcSVxAIl+ejMKCLKep9DliNXHrakfuvGrE7YmaThSSI/DhYb+shZkLIdk7w1Wy0oBuB+D5KcEH2xdf/JLCsl27uRdLucKnRxZEkkeHGBzTGnkXJS7i7THhYmixr6ecAljKWTHCUyX7Podroda8AykKtzHCm+KUZ36A8UOSii+LhtUKaGncenP5dymQZbv40NO9tqefVWlMnmHTe21KKaPHv7G1H71y1Zwi2p/MnJmnGWYl59XN4byp7328d9cHZjFvbi3T1Q85ePfv58xGtBIhURpzB6YOVEFaD25JwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4SW2YpVomiVEvbiC57Mkv7Cvhlpf579zhax2Td6SVE=;
 b=V/rBcZRl23Qp2+JUEvfmNjHG3RcOqImD/k7K4PjwjguOF4hh05D3V9yIAizFTzohyTS3e+xHc1KAUNYxOrp23zYoHw5eZfpwDHFlGTEn+4LoYptENaS4b7bMytXsydhMCLMzQA3zhQLOjXQddWxDRKYRVIA+J0S9as28XFKXrv+Jw7qTOCTCZVWJcf68XYmdFLfHhxbxDKQvZmJPCWm72xO5W7cUXG1MgQeS6Ar1yXFXB+uIYpJpLvX6EqcW13Qs49HjDy3V9Y1xxAFacuU58ujvZiDt1xHA1xX7VZ5gaZE071xKSV9JWOxanxXTNEIxjI/GUl969lX8bJspv1SAWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 CY4PR11MB1336.namprd11.prod.outlook.com (2603:10b6:903:2f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.23; Wed, 11 May 2022 19:11:22 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b907:4e16:92da:b2cf%2]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 19:11:22 +0000
Message-ID: <218ed800-d267-fc6c-2e07-233d1519f2b6@intel.com>
Date: Wed, 11 May 2022 12:11:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v7 3/7] drm/i915: Prepare for multiple GTs
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
 <20220318233938.149744-4-andi.shyti@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220318233938.149744-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01ff19d0-791e-44e5-73f2-08da33820921
X-MS-TrafficTypeDiagnostic: CY4PR11MB1336:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR11MB13364CF05B9A49CAEC4B27EDF4C89@CY4PR11MB1336.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3/qzuMS4IFsJMZZI1MUMgUs28HiLgp0/sSbl6goE02QAaIO8zWpEFSvUcyfLGI9UzIuNHooGSGcC+v+CxKym+GqJzmyisrBuXz/YC41j2WT+FXCH5WunlQywZOMQ0LhxkzxtHwMeif3BMhD7CdSTX2fkgYxP3hq6C1u0E9+BGCcuv+CYrmdVgyHK/Kx1S+MQs5yi3icaLn9yE2/eHgw8BOa+0B60XmpL7iS6D73OXXJKaf/gTPh4wThXjcAXxEGXuTde2puZ4LxlKnSXEHbuJct9hLciHshyjjkPz/2jFtLdUhy0oQmB96Ah1gfY+qdxAz7fMzggl19eqPDYUFqL+2SI9eUwMPpOWMuymtlIrg3sY4UupzWm5Uux+qEgYV2U3oolXGUPary+qdwho5/8EVN3KgdXmunLwiDrhGtcexc5/z1p0lrafxaWPuPDvpcgy6//LrG1ZlncpEPkqCRAy7hv9UtCqr8T9OPxeuNaG+oKYbvg4FiozHHYqbvIQMx3ByKz2vU1xPsBOFFIPmwnp3RZehQ/uFp4058xSLstMfeB/ihOhctNx7IuKy8WAwmeMZ3igm+PCcxa4dIzn0dNckO/Fh31Lz6xWjionwSgfbu8n+4SserbJQQpfyMrN8CntXkxs09OeENfCKnS7G6toPN8fk+rATNhMbxbHajl1KImM+t0s7Pn630EMn10mgTGwD1D4xKHELXdivWGnfiM7/PJkvb7tUwRpIvx6+Nab8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(186003)(508600001)(83380400001)(2616005)(30864003)(26005)(110136005)(2906002)(6512007)(36756003)(6666004)(8936002)(5660300002)(6486002)(86362001)(82960400001)(38100700002)(31696002)(66476007)(66556008)(66946007)(54906003)(8676002)(4326008)(6506007)(53546011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjdRbkZFa3BETzFob2xqQmdTUzJJeGdTcTR6aGQ2c1JSVGVnUjJCSVROVk8y?=
 =?utf-8?B?Z0VKbTRlMUM1MVV1NzJXTTVnS0tUUGlqejNhOEhSeFVJeTl2TnA3N21VOTZB?=
 =?utf-8?B?dHorTUhSaTJNTDR0UThLZ3YrR0lPNWhlamZOb2VqdmJDQ0J1alJPNEYwVzUr?=
 =?utf-8?B?NStFZUl3aGZ2ZE02UkVBRmJ2THJQTWVBL1NoMXVwa2treWtqSDgrejcyVGF5?=
 =?utf-8?B?SnNoL3RUcUwrcTFLazU1c21OK3FwditBU1Q5MVI1cE9ZV1ltRHNhTUlwVW5w?=
 =?utf-8?B?TmswWXhsVHFtN25nS2VpWUlNRFR3TWFQa054ckE0YVZpamllN0xiZjhyTVNH?=
 =?utf-8?B?SjdqR0d0eUJqUzlOMG05a09lbVZnaDlaRGFHRjJVL3JpYlQvMktMOVhPaFk3?=
 =?utf-8?B?a0tjRVpKclBlSnkvVjNyV29abm91REI0VEFWdldoWG5wQ2tOUDdCdHE0VzdX?=
 =?utf-8?B?SzZsQ2toRmpkY0s2aGdzUzRIL200NGRZSkQ1S2JKWnVibVNPd0lRMlVOaUpQ?=
 =?utf-8?B?ZjEza25CTm9CZ1I1Nk9EUGNyQ1dXdVlqNVZmS2pncUc1SjllUEhVek51Nzlh?=
 =?utf-8?B?MU5lc3VocXpTVER2bk8xRGg0UWJUaW52T25xL2FXVFAvMk9wNDh4S2VZT1dL?=
 =?utf-8?B?ZHQ5YVZ4Znk0NlRHMmxXR2M2Mmt1eEE1RlhZemVSSlVMSmpjbjhnbVdUbi9p?=
 =?utf-8?B?dUQ3V0dRbDZnTk44bmZtbFJhQ29yRTBrN3p4WDY2ZWZEUmNVVGM4cE5JREJj?=
 =?utf-8?B?TFNiS0xpUHNaRC9uZk1ycUVkd1hSYTdWaFg4ZUlrU3NPVW9NWDcyUjBkOEFT?=
 =?utf-8?B?U0dtK0ZaL0svNW8yeHNDaU1sVG8rOVU1akZZakhYMHVScDg1TSt6Y3hHVTR3?=
 =?utf-8?B?OWFWQnZXRlF2RkNCcjNoZTdFdXIxUjZXT1lLNk1Dc1NyWUJDaFpGS1lsM1hS?=
 =?utf-8?B?ODZOT0VTOHM0ZGlQbTRtaDZnY3dxdHhOVXIvKytDanJEcmYwbWMyMkhMeE1X?=
 =?utf-8?B?VVlyTHU0Q2pVeVUrV0RXaWMvaXN0VFBRYVpWTHFYNFpmZE40Ly90M21iNmJh?=
 =?utf-8?B?Tkd4WW1KakgvTm9hNy9HWFhVQ1dmVnRpLy9MclVxVDdic3BobnFySTdkSVd2?=
 =?utf-8?B?RlBDVE5tNVErajR3R1Q5YUNyQ0c1TFRzeXRkRlIzWHdPQnFUMGp1cGJJNkNz?=
 =?utf-8?B?dTdYVG14a095MCs0Y1M1VWR3REZlblpXVFMzcnl1akkwdDhEZkt2b2gyb3Ja?=
 =?utf-8?B?ZUp5VFlVU1Q2ZndGUzU3UXpQM0xzbFBVdTBRVlh4b2dXSDBVMm5uRFExNDl5?=
 =?utf-8?B?b2pnV2ZqeFg2ak1PWDVyS0lScnBRK0VCNUJXMUN6d0NjcGk1UzFxck1PZ1dK?=
 =?utf-8?B?RVdNZ1EveGlBL3pXUkhmTFlrMTNVQ3Y2YWJoZzJMcUFaWC9CVnhYMktRaFgy?=
 =?utf-8?B?d0x1WVQxYTFzK3ZuNERYQkk2dHhyd0FkOXNjZm1PN1N2cDQ2SzZUa2p2ZTR6?=
 =?utf-8?B?QjdTT3ZYWk5OQmR5OEtYR0lLZjQ5Yk0zNlJIUEZxKzMrcVIva0VLclJtclZ1?=
 =?utf-8?B?ZE1icWFKM09tWGQ2RVZhMXUrOXorS0FZbStabjZjTWl5a0JPVXhVQWdiSWEy?=
 =?utf-8?B?MkRGRmZIZDZrOVJCSzJoRHBPY1pLWmRnM3BiUm5tb2tzN0J5TFZtMHRCYTVU?=
 =?utf-8?B?YTRZUkp1Y3dhUTRjUDV4WTFod3IwcmlVVUhKWC9rOWR5em0yU2VodWNrQ2hO?=
 =?utf-8?B?Z1RYR0ZRM01PL2M5WC9YODUxOG52ektYWUk2YkdQb01mSHNoaFdac0EvQm0y?=
 =?utf-8?B?TkFKSSsyVU55K1JaekdoMzBlMXdRL1gxV2lYR2FWeFVRQm5NNU16bXV2TndD?=
 =?utf-8?B?ay9EaHlSWXpsL05jeVBWa3V4Zm9XOEczUHFibm16dGNLcmpOdkJnbWJWWHha?=
 =?utf-8?B?dEdDcFRlOGVtN2RSVnFJTEovd2xWMGdiYmRlZTBKODBBb0s4MjRxK09vNEFD?=
 =?utf-8?B?eEt6OXNuUzZBVUJ0SXpSdmVkZXJ0a2d2ZzZubnIrcnZlUVk3L1RldFB1OUZD?=
 =?utf-8?B?cTJGMHNnc3djUGJGZlIzSGlaTGhaRCtNbGYwNXdUdmZiNWFDRW5qWEYvU2N1?=
 =?utf-8?B?azZUS1BTd2llTTFaaXY2YTIvTXBjRVZseVFIdXN4YWV0bmphTGVndjcvTnAr?=
 =?utf-8?B?YWtKbXJLWEN4SlJvcE9xL0lYMkp3NDVvNTg3UmdMWUJSdWpZQlRzYmJrWWp1?=
 =?utf-8?B?UEZKaUxvMk1pT25zNUQ0UGRLM2l6eExOWXErMzl4K2RvY0c1NFp2RzM0bnVl?=
 =?utf-8?B?UXpaenZSNEJ0bEhnWFJoMmNoaXFXMkpqM0VFS3E2MmQwRWsxMTRvUldmWFBM?=
 =?utf-8?Q?GBJ9buJJapwZSVFz2VNWWfEt8n+VA/C4YiESV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ff19d0-791e-44e5-73f2-08da33820921
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 19:11:21.9548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4e9J+tKkrU+WHscClkz4b4J4mFDwzTLrpBNGPpSrdfd+KE2sF+6f9CypDb/P216cwY7JntNIlzbo/UIB7wRP5StRLE/Y47/iA+9cQmp5COc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1336
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi@etezian.org>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/18/2022 4:39 PM, Andi Shyti wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> On a multi-tile platform, each tile has its own registers + GGTT
> space, and BAR 0 is extended to cover all of them.
>
> Up to four GTs are supported in i915->gt[], with slot zero
> shadowing the existing i915->gt0 to enable source compatibility
> with legacy driver paths. A for_each_gt macro is added to iterate
> over the GTs and will be used by upcoming patches that convert
> various parts of the driver to be multi-gt aware.
>
> Only the primary/root tile is initialized for now; the other
> tiles will be detected and plugged in by future patches once the
> necessary infrastructure is in place to handle them.
>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c            | 133 ++++++++++++++++--
>   drivers/gpu/drm/i915/gt/intel_gt.h            |  17 ++-
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   9 +-
>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
>   drivers/gpu/drm/i915/i915_driver.c            |  28 ++--
>   drivers/gpu/drm/i915/i915_drv.h               |   6 +
>   drivers/gpu/drm/i915/intel_memory_region.h    |   3 +
>   drivers/gpu/drm/i915/intel_uncore.c           |  11 +-
>   drivers/gpu/drm/i915/intel_uncore.h           |   3 +-
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  13 +-
>   10 files changed, 184 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index ca875ba3e2a9d..cfac4a913642e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -29,7 +29,7 @@
>   #include "intel_uncore.h"
>   #include "shmem_utils.h"
>   
> -void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> +static void __intel_gt_init_early(struct intel_gt *gt)
>   {
>   	spin_lock_init(&gt->irq_lock);
>   
> @@ -51,17 +51,23 @@ void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>   	intel_rps_init_early(&gt->rps);
>   }
>   
> -void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> +/* Preliminary initialization of Tile 0 */
> +void intel_root_gt_init_early(struct drm_i915_private *i915)
>   {
> +	struct intel_gt *gt = to_gt(i915);
> +
>   	gt->i915 = i915;
>   	gt->uncore = &i915->uncore;
> +
> +	__intel_gt_init_early(gt);
>   }
>   
> -int intel_gt_probe_lmem(struct intel_gt *gt)
> +static int intel_gt_probe_lmem(struct intel_gt *gt)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> +	unsigned int instance = gt->info.id;
> +	int id = INTEL_REGION_LMEM_0 + instance;
>   	struct intel_memory_region *mem;
> -	int id;
>   	int err;
>   
>   	mem = intel_gt_setup_lmem(gt);
> @@ -76,9 +82,8 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
>   		return err;
>   	}
>   
> -	id = INTEL_REGION_LMEM_0;
> -
>   	mem->id = id;
> +	mem->instance = instance;
>   
>   	intel_memory_region_set_name(mem, "local%u", mem->instance);
>   
> @@ -807,16 +812,21 @@ void intel_gt_driver_release(struct intel_gt *gt)
>   	intel_gt_fini_hwconfig(gt);
>   }
>   
> -void intel_gt_driver_late_release(struct intel_gt *gt)
> +void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
>   {
> +	struct intel_gt *gt;
> +	unsigned int id;
> +
>   	/* We need to wait for inflight RCU frees to release their grip */
>   	rcu_barrier();
>   
> -	intel_uc_driver_late_release(&gt->uc);
> -	intel_gt_fini_requests(gt);
> -	intel_gt_fini_reset(gt);
> -	intel_gt_fini_timelines(gt);
> -	intel_engines_free(gt);
> +	for_each_gt(gt, i915, id) {
> +		intel_uc_driver_late_release(&gt->uc);
> +		intel_gt_fini_requests(gt);
> +		intel_gt_fini_reset(gt);
> +		intel_gt_fini_timelines(gt);
> +		intel_engines_free(gt);
> +	}
>   }
>   
>   /**
> @@ -1013,6 +1023,105 @@ void intel_gt_report_steering(struct drm_printer *p, struct intel_gt *gt,
>   	}
>   }
>   
> +static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
> +{
> +	int ret;
> +
> +	if (!gt_is_root(gt)) {
> +		struct intel_uncore_mmio_debug *mmio_debug;
> +		struct intel_uncore *uncore;
> +
> +		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
> +		if (!uncore)
> +			return -ENOMEM;
> +
> +		mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
> +		if (!mmio_debug) {
> +			kfree(uncore);
> +			return -ENOMEM;
> +		}
> +
> +		gt->uncore = uncore;
> +		gt->uncore->debug = mmio_debug;
> +
> +		__intel_gt_init_early(gt);
> +	}
> +
> +	intel_uncore_init_early(gt->uncore, gt);
> +
> +	ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
> +	if (ret)
> +		return ret;
> +
> +	gt->phys_addr = phys_addr;
> +
> +	return 0;
> +}
> +
> +static void
> +intel_gt_tile_cleanup(struct intel_gt *gt)
> +{
> +	intel_uncore_cleanup_mmio(gt->uncore);
> +
> +	if (!gt_is_root(gt)) {
> +		kfree(gt->uncore->debug);
> +		kfree(gt->uncore);
> +		kfree(gt);
> +	}
> +}
> +
> +int intel_gt_probe_all(struct drm_i915_private *i915)
> +{
> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	struct intel_gt *gt = &i915->gt0;
> +	phys_addr_t phys_addr;
> +	unsigned int mmio_bar;
> +	int ret;
> +
> +	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
> +	phys_addr = pci_resource_start(pdev, mmio_bar);
> +
> +	/*
> +	 * We always have at least one primary GT on any device
> +	 * and it has been already initialized early during probe
> +	 * in i915_driver_probe()
> +	 */
> +	ret = intel_gt_tile_setup(gt, phys_addr);
> +	if (ret)
> +		return ret;
> +
> +	i915->gt[0] = gt;
> +
> +	/* TODO: add more tiles */
> +	return 0;
> +}
> +
> +int intel_gt_tiles_init(struct drm_i915_private *i915)
> +{
> +	struct intel_gt *gt;
> +	unsigned int id;
> +	int ret;
> +
> +	for_each_gt(gt, i915, id) {
> +		ret = intel_gt_probe_lmem(gt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +void intel_gt_release_all(struct drm_i915_private *i915)
> +{
> +	struct intel_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, i915, id) {
> +		intel_gt_tile_cleanup(gt);
> +		i915->gt[id] = NULL;
> +	}
> +}
> +
>   void intel_gt_info_print(const struct intel_gt_info *info,
>   			 struct drm_printer *p)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index ce471aa5c83d7..e76168e10a21b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -39,10 +39,8 @@ static inline struct intel_gt *huc_to_gt(struct intel_huc *huc)
>   	return container_of(huc, struct intel_gt, uc.huc);
>   }
>   
> -void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
> -void __intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915);
> +void intel_root_gt_init_early(struct drm_i915_private *i915);
>   int intel_gt_assign_ggtt(struct intel_gt *gt);
> -int intel_gt_probe_lmem(struct intel_gt *gt);
>   int intel_gt_init_mmio(struct intel_gt *gt);
>   int __must_check intel_gt_init_hw(struct intel_gt *gt);
>   int intel_gt_init(struct intel_gt *gt);
> @@ -52,7 +50,7 @@ void intel_gt_driver_unregister(struct intel_gt *gt);
>   void intel_gt_driver_remove(struct intel_gt *gt);
>   void intel_gt_driver_release(struct intel_gt *gt);
>   
> -void intel_gt_driver_late_release(struct intel_gt *gt);
> +void intel_gt_driver_late_release_all(struct drm_i915_private *i915);
>   
>   int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
>   
> @@ -97,6 +95,17 @@ u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
>   
>   void intel_gt_report_steering(struct drm_printer *p, struct intel_gt *gt,
>   			      bool dump_table);
> +
> +int intel_gt_probe_all(struct drm_i915_private *i915);
> +int intel_gt_tiles_init(struct drm_i915_private *i915);
> +void intel_gt_release_all(struct drm_i915_private *i915);
> +
> +#define for_each_gt(gt__, i915__, id__) \
> +	for ((id__) = 0; \
> +	     (id__) < I915_MAX_GT; \
> +	     (id__)++) \
> +		for_each_if(((gt__) = (i915__)->gt[(id__)]))
> +
>   void intel_gt_info_print(const struct intel_gt_info *info,
>   			 struct drm_printer *p);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index e4ecc17889d34..eeead40485fbc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -129,7 +129,14 @@ static const struct intel_wakeref_ops wf_ops = {
>   
>   void intel_gt_pm_init_early(struct intel_gt *gt)
>   {
> -	intel_wakeref_init(&gt->wakeref, gt->uncore->rpm, &wf_ops);
> +	/*
> +	 * We access the runtime_pm structure via gt->i915 here rather than
> +	 * gt->uncore as we do elsewhere in the file because gt->uncore is not
> +	 * yet initialized for all tiles at this point in the driver startup.
> +	 * runtime_pm is per-device rather than per-tile, so this is still the
> +	 * correct structure.
> +	 */
> +	intel_wakeref_init(&gt->wakeref, &gt->i915->runtime_pm, &wf_ops);
>   	seqcount_mutex_init(&gt->stats.lock, &gt->wakeref.mutex);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index bbba885d45bd5..937b2e1a305ed 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -188,7 +188,14 @@ struct intel_gt {
>   		u8 instanceid;
>   	} default_steering;
>   
> +	/*
> +	 * Base of per-tile GTTMMADR where we can derive the MMIO and the GGTT.
> +	 */
> +	phys_addr_t phys_addr;
> +
>   	struct intel_gt_info {
> +		unsigned int id;
> +
>   		intel_engine_mask_t engine_mask;
>   
>   		u32 l3bank_mask;
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 92a625a174e22..64e6f76861f95 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -321,9 +321,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   	intel_device_info_subplatform_init(dev_priv);
>   	intel_step_init(dev_priv);
>   
> -	intel_gt_init_early(to_gt(dev_priv), dev_priv);
>   	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
> -	intel_uncore_init_early(&dev_priv->uncore, to_gt(dev_priv));
>   
>   	spin_lock_init(&dev_priv->irq_lock);
>   	spin_lock_init(&dev_priv->gpu_error.lock);
> @@ -354,7 +352,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   
>   	intel_wopcm_init_early(&dev_priv->wopcm);
>   
> -	__intel_gt_init_early(to_gt(dev_priv), dev_priv);
> +	intel_root_gt_init_early(dev_priv);
>   
>   	i915_gem_init_early(dev_priv);
>   
> @@ -375,7 +373,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   
>   err_gem:
>   	i915_gem_cleanup_early(dev_priv);
> -	intel_gt_driver_late_release(to_gt(dev_priv));
> +	intel_gt_driver_late_release_all(dev_priv);
>   	intel_region_ttm_device_fini(dev_priv);
>   err_ttm:
>   	vlv_suspend_cleanup(dev_priv);
> @@ -394,7 +392,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>   	intel_irq_fini(dev_priv);
>   	intel_power_domains_cleanup(dev_priv);
>   	i915_gem_cleanup_early(dev_priv);
> -	intel_gt_driver_late_release(to_gt(dev_priv));
> +	intel_gt_driver_late_release_all(dev_priv);
>   	intel_region_ttm_device_fini(dev_priv);
>   	vlv_suspend_cleanup(dev_priv);
>   	i915_workqueues_cleanup(dev_priv);
> @@ -425,13 +423,9 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = intel_uncore_setup_mmio(&dev_priv->uncore);
> -	if (ret < 0)
> -		goto err_bridge;
> -
>   	ret = intel_uncore_init_mmio(&dev_priv->uncore);
>   	if (ret)
> -		goto err_mmio;
> +		return ret;
>   
>   	/* Try to make sure MCHBAR is enabled before poking at it */
>   	intel_setup_mchbar(dev_priv);
> @@ -449,9 +443,6 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
>   err_uncore:
>   	intel_teardown_mchbar(dev_priv);
>   	intel_uncore_fini_mmio(&dev_priv->uncore);
> -err_mmio:
> -	intel_uncore_cleanup_mmio(&dev_priv->uncore);
> -err_bridge:
>   	pci_dev_put(dev_priv->bridge_dev);
>   
>   	return ret;
> @@ -465,7 +456,6 @@ static void i915_driver_mmio_release(struct drm_i915_private *dev_priv)
>   {
>   	intel_teardown_mchbar(dev_priv);
>   	intel_uncore_fini_mmio(&dev_priv->uncore);
> -	intel_uncore_cleanup_mmio(&dev_priv->uncore);
>   	pci_dev_put(dev_priv->bridge_dev);
>   }
>   
> @@ -598,7 +588,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>   	if (ret)
>   		goto err_ggtt;
>   
> -	ret = intel_gt_probe_lmem(to_gt(dev_priv));
> +	ret = intel_gt_tiles_init(dev_priv);
>   	if (ret)
>   		goto err_mem_regions;
>   
> @@ -849,10 +839,14 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   
>   	intel_vgpu_detect(i915);
>   
> -	ret = i915_driver_mmio_probe(i915);
> +	ret = intel_gt_probe_all(i915);
>   	if (ret < 0)
>   		goto out_runtime_pm_put;
>   
> +	ret = i915_driver_mmio_probe(i915);
> +	if (ret < 0)
> +		goto out_tiles_cleanup;
> +
>   	ret = i915_driver_hw_probe(i915);
>   	if (ret < 0)
>   		goto out_cleanup_mmio;
> @@ -909,6 +903,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	i915_ggtt_driver_late_release(i915);
>   out_cleanup_mmio:
>   	i915_driver_mmio_release(i915);
> +out_tiles_cleanup:
> +	intel_gt_release_all(i915);

We don't seem to call intel_gt_release_all() from driver_release(), so 
we might be leaking something there. I wanted to send a patch to add the 
call at the same place in the flow as in this error path, but then I 
noticed that i915_driver_late_release(), which we call a few lines 
below, calls intel_gt_driver_late_release_all(), which seems to expect 
that the GTs are still allocated, so we probably need to flip the order 
those are called in, or move the cleanup code from late_release() to 
late_release_all() (or vice versa).
Andi, can you have a look at this?

Thanks,
Daniele

>   out_runtime_pm_put:
>   	enable_rpm_wakeref_asserts(&i915->runtime_pm);
>   	i915_driver_late_release(i915);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 97622d3ccfc2a..8e4083d413592 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -777,6 +777,12 @@ struct drm_i915_private {
>   	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
>   	struct intel_gt gt0;
>   
> +	/*
> +	 * i915->gt[0] == &i915->gt0
> +	 */
> +#define I915_MAX_GT 4
> +	struct intel_gt *gt[I915_MAX_GT];
> +
>   	struct {
>   		struct i915_gem_contexts {
>   			spinlock_t lock; /* locks list */
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index cc7078bcbfbfc..3d8378c1b4478 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -30,6 +30,9 @@ enum intel_memory_type {
>   enum intel_region_id {
>   	INTEL_REGION_SMEM = 0,
>   	INTEL_REGION_LMEM_0,
> +	INTEL_REGION_LMEM_1,
> +	INTEL_REGION_LMEM_2,
> +	INTEL_REGION_LMEM_3,
>   	INTEL_REGION_STOLEN_SMEM,
>   	INTEL_REGION_STOLEN_LMEM,
>   	INTEL_REGION_UNKNOWN, /* Should be last */
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index ef8ffc01ad19c..8b9caaaacc21f 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2039,14 +2039,11 @@ static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
>   	return NOTIFY_OK;
>   }
>   
> -int intel_uncore_setup_mmio(struct intel_uncore *uncore)
> +int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
>   {
>   	struct drm_i915_private *i915 = uncore->i915;
> -	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> -	int mmio_bar;
>   	int mmio_size;
>   
> -	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
>   	/*
>   	 * Before gen4, the registers and the GTT are behind different BARs.
>   	 * However, from gen4 onwards, the registers and the GTT are shared
> @@ -2063,7 +2060,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore)
>   	else
>   		mmio_size = 2 * 1024 * 1024;
>   
> -	uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
> +	uncore->regs = ioremap(phys_addr, mmio_size);
>   	if (uncore->regs == NULL) {
>   		drm_err(&i915->drm, "failed to map registers\n");
>   		return -EIO;
> @@ -2074,9 +2071,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore)
>   
>   void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
>   {
> -	struct pci_dev *pdev = to_pci_dev(uncore->i915->drm.dev);
> -
> -	pci_iounmap(pdev, uncore->regs);
> +	iounmap(uncore->regs);
>   }
>   
>   void intel_uncore_init_early(struct intel_uncore *uncore,
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 9a760952d46af..52fe3d89dd2b8 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -29,6 +29,7 @@
>   #include <linux/notifier.h>
>   #include <linux/hrtimer.h>
>   #include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/types.h>
>   
>   #include "i915_reg_defs.h"
>   
> @@ -221,7 +222,7 @@ void
>   intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_debug);
>   void intel_uncore_init_early(struct intel_uncore *uncore,
>   			     struct intel_gt *gt);
> -int intel_uncore_setup_mmio(struct intel_uncore *uncore);
> +int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr);
>   int intel_uncore_init_mmio(struct intel_uncore *uncore);
>   void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
>   					  struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index 573d9b2e1a4a3..9c31a16f83800 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -73,7 +73,7 @@ static void mock_device_release(struct drm_device *dev)
>   	destroy_workqueue(i915->wq);
>   
>   	intel_region_ttm_device_fini(i915);
> -	intel_gt_driver_late_release(to_gt(i915));
> +	intel_gt_driver_late_release_all(i915);
>   	intel_memory_regions_driver_release(i915);
>   
>   	drm_mode_config_cleanup(&i915->drm);
> @@ -112,6 +112,11 @@ static struct dev_pm_domain pm_domain = {
>   	},
>   };
>   
> +static void mock_gt_probe(struct drm_i915_private *i915)
> +{
> +	i915->gt[0] = &i915->gt0;
> +}
> +
>   struct drm_i915_private *mock_gem_device(void)
>   {
>   #if IS_ENABLED(CONFIG_IOMMU_API) && defined(CONFIG_INTEL_IOMMU)
> @@ -180,11 +185,11 @@ struct drm_i915_private *mock_gem_device(void)
>   	spin_lock_init(&i915->gpu_error.lock);
>   
>   	i915_gem_init__mm(i915);
> -	intel_gt_init_early(to_gt(i915), i915);
> -	__intel_gt_init_early(to_gt(i915), i915);
> +	intel_root_gt_init_early(i915);
>   	mock_uncore_init(&i915->uncore, i915);
>   	atomic_inc(&to_gt(i915)->wakeref.count); /* disable; no hw support */
>   	to_gt(i915)->awake = -ENODEV;
> +	mock_gt_probe(i915);
>   
>   	ret = intel_region_ttm_device_init(i915);
>   	if (ret)
> @@ -229,7 +234,7 @@ struct drm_i915_private *mock_gem_device(void)
>   err_drv:
>   	intel_region_ttm_device_fini(i915);
>   err_ttm:
> -	intel_gt_driver_late_release(to_gt(i915));
> +	intel_gt_driver_late_release_all(i915);
>   	intel_memory_regions_driver_release(i915);
>   	drm_mode_config_cleanup(&i915->drm);
>   	mock_destroy_device(i915);

