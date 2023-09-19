Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1285A7A629B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 14:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D675E10E3AD;
	Tue, 19 Sep 2023 12:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5150910E3AB;
 Tue, 19 Sep 2023 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695125960; x=1726661960;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KU72SSZOY/PKs92ca4GNwHYFC38ixwrqFD5ReFtUTGc=;
 b=RyPSdYGYzNdwWRUHWElpPdRRhgjQCfaDjaKmR/8zBf+NSF6JYXtBLBVl
 E67XjCmmSHN25lHo/jg3dzWEK2m4F3pcMI7SU1HMXYL/NQT4BFLFum7q4
 qbObh1mAVyJKrlnMJ76H32Tqqbx8f2lbzxec2JGckWret8sdrrQvLhqyX
 FQXFSSBIYPfaAGgkXKUpIrb7Aj4AVrMy8TL77xZ+dHx1bSN8c3pmlv6ou
 2gxxdoDxBGhAVUo/dGEzwZh+97UhZM8c5r+UdNnJG45K3JViS1vdXZAH0
 wE6UOIV+NJpdNsHO57oDUklP+VIIW2OUBswWWa98EWmh91Bh8bsktrKfZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382675493"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="382675493"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 05:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775527672"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="775527672"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 05:19:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 05:19:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 05:19:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 05:19:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 05:19:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRIY0n26MF74l8zT3GOOmBYASPhqHiVRJXE94InUtcu1d/nS7HnwSUznvcu5zjHEIERtK4bVqxMVpRGvjBLtV/XrSAxjknFHOXjfSG3ymFj7dlaL/l8NBCzzmxzNM0yfg60g5SNz7lo7Zy52shyVIFOy9Wh+nQ0Ux+NaW0pGSvHcbNW2oda03ycnPIkxdOzZCMPgv4+Yci/PuZgdTeH3fp9a6Gj+fiWUtAh++gQoXZ1ej4euYaFx5AkPFuaVVsc+CJW0YbF+Kjfs/FgpMIwQroDODoDmqZG9Z4Og/e3T18V+8BSL8jcz2EEwKjDE079kx3tSB24Vb+jq1D4DNd8WIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KU72SSZOY/PKs92ca4GNwHYFC38ixwrqFD5ReFtUTGc=;
 b=SWLnZAUk5IhdVQtVwLPvvcQSMsoXAa0k43jOVqVRII9b87+K+14CL8lvkWYxbq0bNxzik8NHB7roE+COF91HL/zWrfwwjGNCwvrfHCf5+7y2bhwerzHHQM6xW2vP/+NE7PdEdiQufMsxX2jIgYhoHXySXgl2cW7UpEUXKVE+PmROCwf0TA3f6ZPs4psAQjBYe/ERYdan91/u+0A+WdG+rCtNSf6vcIlzlCWwyYFWUDQhEdxk0YuZOOSM9nsj5ftjBwE9Ab2W+e92ZUYBP/gmOKCK+SiCsEOUcaGBGKbKzE26rCtsStpIyuxAXGzrhd4LmUdiQJxavYA081nppCXi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19)
 by MW4PR11MB5871.namprd11.prod.outlook.com (2603:10b6:303:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 12:19:16 +0000
Received: from CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::5fb6:7200:97a4:b7e9]) by CO1PR11MB5169.namprd11.prod.outlook.com
 ([fe80::5fb6:7200:97a4:b7e9%7]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 12:19:16 +0000
Message-ID: <aa102a2e-0b73-9f1b-8fcf-75eb5b741d03@intel.com>
Date: Tue, 19 Sep 2023 15:19:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915: Fix aux invalidation with proper pipe_control
 flag
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230919114716.19378-1-nirmoy.das@intel.com>
 <ZQmP+IWIcu1yUkSC@ashyti-mobl2.lan>
Content-Language: en-US
From: =?UTF-8?Q?Tapani_P=c3=a4lli?= <tapani.palli@intel.com>
In-Reply-To: <ZQmP+IWIcu1yUkSC@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::18) To CO1PR11MB5169.namprd11.prod.outlook.com
 (2603:10b6:303:95::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:EE_|MW4PR11MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: b445ef1e-0552-4147-a658-08dbb90aa456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: csS9dI6VnaL3FJWGDjt5sAcIZqZiYRefyWe2OcuOabHmngCVL57B+POs6JuR3JBowG64rAjG7FbR41Kdct57oWGTRTKKg/SZf01fUqHGB1J0P3OS7Vs4a51YFAPK/9rCHMe9fn4qTWSJZwqyEmyvromJMGSjxf6sK64QvbtHQRG5roKfsKHAf4ECZaDVThuXe+l/38UY/jT/2pXLSoATEACV1fsfrTl8wRSLik6ZBdnF1a3KVYcHk/9e4cndbZtRpFFmCzSymGnOUf20Pt3Xti+ucdAjDuSvLskCfHZS975HSVblMU9sqRrDHeuLff3Riu0/ajvsWiIm63V+KNTb34IPHSN4TGvfd6pqGRpUN3H3YLZ7A3BfmBtCsA//QJWtjuEk2LoRQ1YJvoREIMCgiP1yAwD9+vwJXO125A3bE0YrFpusCZieSTHEE158awitjQU10pZ+LuOPnuIbD5DYb/sbkMQ4eTBK3IEAdEcHuwupxHjgMzQixV+rQeiXQtkX/PpcR9UjVIS2w5l1sbP8J3stNBGCkIm4PkHavh3vGzLV8Vq5oh9YDHedV/vHlQamx59sogilqOfMO4ell40JYLBVmH4WdiWh2QBNXcolHIO6Zr3A5r5olkb+RYGeLWwYUD2nxoYo0OAUkfS1EUCXiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5169.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(1800799009)(186009)(451199024)(6512007)(4326008)(6486002)(6506007)(26005)(2616005)(8936002)(8676002)(82960400001)(2906002)(36756003)(41300700001)(66476007)(86362001)(6636002)(66946007)(66556008)(54906003)(316002)(31686004)(38100700002)(110136005)(31696002)(6666004)(5660300002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmd5N0JiSjVIUlNnRTI1eCtLeHFCOHdsdE1yWWxXOVdMUUZsMnNnS1luTHp6?=
 =?utf-8?B?VDVib0J0NldNaEFGc0lZK0xZR0lZNSszSXBKSTBsTFMyZzN2ejRnb0tLZjE0?=
 =?utf-8?B?Zm0vRHV6MVVpVk92MVJsbVpwVW9IRU9SZVdNbHpVMUJsMHFLRWhyZk5sMXJ6?=
 =?utf-8?B?NVRFRzgvb2pmNnJMLzI4ME44YVZKdmFSOHNXejMyUjBOdjFNL2p5ZnZQZnA1?=
 =?utf-8?B?eVkwUjFIQmt1Q0FMTTh0VGtMb1B5QjVSSEdsRGVVMnZtQ2FGQlIrcjhIeWxz?=
 =?utf-8?B?ZlZEZ1ZPTitwOHpZYzFOQkZmWTFwdnpuQnZEN0VUQTg3Zyt4Qjk5cFlsQTll?=
 =?utf-8?B?Y1p6UlRJbDNGOTd5YjgrZ0JscWhQY2dUVkhDK0llM0FhQm41MlptUS9qZTYy?=
 =?utf-8?B?RnZrMEh1WS9WYzZPTk81ZXRiVHZCWXlOamh1TmMxTUJCMjFEWGJpU1dES1ll?=
 =?utf-8?B?R3FEeUJGZ2lnbEkyVndCbzJvT2U0Nkl0MmxqMStIRHJhalFzN1AxbW4zTjg5?=
 =?utf-8?B?V3RjU00yaXhoWHRiR2pleFlFRDZXcmZRZzk2REZRKytINFFqUkMydmVoUEdr?=
 =?utf-8?B?TTQwdFdvYVhxN2JuNDBKSllQSkU0VnI0UzVRZFFwL016VWpVcTZaVHZPNDRk?=
 =?utf-8?B?aHpndzZlazA0aWJvRzJ4aU5sbkVFdVRHcVc5d2V2djhVay9tN3k0bFdob3hH?=
 =?utf-8?B?R3lyaEsvQU1vZmtQNDBPb1J1c25IbWVQYnF4U0Y0TlgzUW91azR4b2hTb3NM?=
 =?utf-8?B?cXRPeUdjL2hnN2NycExqSmpsU2hSZ3JaVjRyL2FwcGJhL1ZNRE5vTFZkdlpR?=
 =?utf-8?B?ZlZQS2tqeDBjMCttT0JSMWVQck4rZmVpcEl1ZUUrMDNQUWJ1c0gyRWVCOVla?=
 =?utf-8?B?Z3VjaGdqMjJNdGZMWlo4OHVELzFKa3VhaHUvU0NuM1U4eFFFMndpWTA2QlF6?=
 =?utf-8?B?V2FpekQyUmVuanh6TXZQTzZGWWpha2dHM0NnT0FTM3pTUXhTVXNpQVhXdGJL?=
 =?utf-8?B?SDE5WWV5bkF0VllGaWNuVHJTL1pjaTU0Zks5ZlNXTDl0OVQ1VWtKNHRpS0ZM?=
 =?utf-8?B?MFhKazZTZkRiTis2NFZJbVMxaWM2ZStiV3pTMDhMV29VWmJyZ05sN1Zsa3JC?=
 =?utf-8?B?SjF1Q3ArYXYxbnlKa3BHMVI1ZWR3a3RXazdsV2dMMll6WTNHMXZOclliMlpK?=
 =?utf-8?B?d21uaW1BWEUrSkNidEVGSUozWmxvSmNyL0JuOUU3VkI3dFlBVDVBczNIckd1?=
 =?utf-8?B?NlpFWFljTEdPSHRUYUNRTW5rNWF3aTQyUk8rdHIwZFovd0R6TE1PUXdVa09h?=
 =?utf-8?B?SGxteVdtV3JmVHcvMVBXVmw3NGt2TjVPL2hBbHZlaDFPY0ZyYStSWEV5WFhw?=
 =?utf-8?B?b083RERFRDJYZHJBQ3pKVzZ3MDIwaHIwN096Mktjei9VV2dST2lGUVNTSjF6?=
 =?utf-8?B?TWcrbmJiY01GS2toOWdkeG8vUmJqNUNmV2QvdzRFMm5oZG02OGIzaW5GUWNP?=
 =?utf-8?B?bDEvQ0JpOWM5cGtVSlIyaFhxUHpaaXJhc21GOVVxVkR3UzNlRVRSWUtuZjFy?=
 =?utf-8?B?dHJZVEtjZ2NSblVnOU9zT3V1bUQ0bVVJeHVTL055bVBiYkNKcG5sNkR0WXE3?=
 =?utf-8?B?U1djUlN3Qm40RzBJZVF2eC9HOEhVMTJ3a0owdjZNYTZ1K0RuL2hxclEzdFNt?=
 =?utf-8?B?MEFtOXFxWmVpeTUrQVdZS0xOZjRZWlM2ODNkRWFnL0VyaXMrVnk1QS8yOEI2?=
 =?utf-8?B?ei9maCs0cDhwVElUMmlCTlM4bXJQZDJBKzNYdUJabkpNMktzemRpYkJwV3pw?=
 =?utf-8?B?MW5mRkNaSFdlY2czRWQ2OThCRnBBb255WlQwMzdGbitxaEdIalNva0JrSHRO?=
 =?utf-8?B?V3lDREgraGRNWk85UG9iVXprbWtPcTFVNHhQY3lER21MSFdOVm92aXRSVWkx?=
 =?utf-8?B?MWg2VUIreTNiVGw1TjR4MHZEeTdEdko3cHVZaVgxRTg5SDVPWlI1OTdPV2FV?=
 =?utf-8?B?OEp6ZUVYd0lZY2JsSkNweDIzbmhTWTljWGVCdWlVVTJRdDVkZk80MUptOTFr?=
 =?utf-8?B?WnBvbENlKzc2QWFvZ0VEekp6UWZsUnlDS2svMnkzT2xWbWZBbUxubnJIdXJW?=
 =?utf-8?B?V3czWlc2SmdIMmdicG5rTEYyYWUvZ091STVwVlIwMjF5a2xNVEhsUWhnOG4z?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b445ef1e-0552-4147-a658-08dbb90aa456
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 12:19:16.4105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZERDxQkgSU9OaOYMll2FGUcM4GyHiTVWgKZ0FSV0piq70x+XyvSQZeUgSDsT190IvMffdRw+4a1JiPBtz8OEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5871
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19.9.2023 15.11, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Tue, Sep 19, 2023 at 01:47:16PM +0200, Nirmoy Das wrote:
>> The suggestion from the spec is to do l3 fabric flush not L3 flush.
>>
>> Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before
>> invalidation")
> please put this in one line.
>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: <stable@vger.kernel.org> # v5.8+
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> and I believe
>
> Tested-by: Tapani Pälli <tapani.palli@intel.com>

Yes, tested on TGL LP (0x9a49)!


> Thanks,
> Andi
