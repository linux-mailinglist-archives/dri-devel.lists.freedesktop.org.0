Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCD5B23A9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED91110EB61;
	Thu,  8 Sep 2022 16:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A93210EB61;
 Thu,  8 Sep 2022 16:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662654873; x=1694190873;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MUwVjR0piI0rJV5wCV00w71+yNkNH2TsdP+CewwgVHc=;
 b=hxbYJw3E15EzQQqKk+XdHOBZdlcOsNYLgPxPPbHOHFPxykEBKOWTTaUE
 Qy+Z3Kv96pBfgBoN5TSER1XPxJG/32mw1O+ZTJgH8wJou6aew1TK9UvJR
 f/xeIQw4yuWvNv81K6nQeXj7nM1Lrt3aTcmN+h0B10G422fPB5GiElS08
 hoSL+n4BnpvKwsQite1Dx5aU2qw0s279uO/1AwhmUzSciqHpWyvxEM7rt
 NgiGkZvo+u+3hhRXdurHr8EuqsSVBYktSf4Mz2TKlK6EcK0X+GJe1wo91
 Gq9hinCUU6viFL+dxwnm2abtkldIIO/kkU1oM21t7uI4T5sMvNaVGxbeM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298588425"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="298588425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 09:34:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="566014202"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 08 Sep 2022 09:34:32 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 09:34:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 09:34:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 09:34:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODrMuimuLb3PV3FT3KZzMIPIYKY37Euiw5r4rIUQgzfwaZK1hEhu7xntuOVaPojDhs4YW6qFp3vwfWFRp4CjmgfrbMJhUp1W8z2u9TtJbwBg9B5BxAPKZS1djP9UtlRLHn7XZoWmVeFci04syvZqJo3uGATyrBIIt2XScI+jp58Afa9tK19CBA+PRh6bWayTgCYxwt4eMNI9oNEuDDLmPB0sU84Zss/9wUis6T4Oz8exZbUJQR/nlbsaDiaG5qt6E1JXg2j2f2qgrZbLKKf/i7wtOArJ11mvPyWcdFJ+No141wZXDZh0a/kXZlzn1sZC2moIy985+TlLpM4XfBk8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cals+AuI18M2o6BUcDBmp7ocRzoc01ukuWTZ9l9yqTA=;
 b=i9AX02C7SKigSU8J26awKUk33kdKdDhX58F3OIjJTOgFjvXHAYHQbvmMhFvLQlG5HTDds98GJidZZHTk+ZfyKnrxNODPSQ8PIHzMVLdEbge035+tRMENbTOBygZTj+WDctluGj2fjtIDClCby99gyGjxrXS8okMtn4EpYmhDp68Cq+xZhe8TiK7JOT5KyVoG4cWMCmLPyc3te0NFHwNn4yV3Z8trWpJQYPP6mSF97q2xlp0LFygP65pCRyCj4AUp/jfu91Du6iJ8t6dJpntb2G8bYo+CChKAid90rjfPajqzs/evYse6Tt1VtUmRW+sCb5pEuKccJw0Ef/MdHT1zxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4773.namprd11.prod.outlook.com (2603:10b6:510:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 16:34:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 16:34:30 +0000
Date: Thu, 8 Sep 2022 09:34:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Invert if/else ladder for
 frequency read
Message-ID: <20220908163427.7v6rxs66tona6t7a@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220907203041.1651514-1-lucas.demarchi@intel.com>
 <YxnNRzQbXnt3zVh2@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxnNRzQbXnt3zVh2@intel.com>
X-ClientProxiedBy: BYAPR08CA0005.namprd08.prod.outlook.com
 (2603:10b6:a03:100::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e53f81f8-896a-4492-8a46-08da91b800c1
X-MS-TrafficTypeDiagnostic: PH0PR11MB4773:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0IVehT3VgPdZmQw5PJBKepFyY9xf9reFx+Vmtl4z+Oes5if2dYrEaj+z7qH7DenqWh+A04XIvxji/NHeIP5ugcpbrVfb5qnOdVZyk3JiTd6qe8TTWpiA8kNOGFF4fVRvPb9qR9aPVXR5RB5PnOZI8QDh2swl8+RypJtle0LOA/55KZ+CVqPrlABWBvjr71t/K1RBz3Z8sb6STg0t+ukKBSksJDgubPA7DMKNTx8RxWgS32XGV2eow012g/NVqgAG56ewO4xRQIEmaM1mS/1KKBx+f+l9Xdc+UOk7HAonmx44lYaURuId1gG0atrf9qyJYUiqLiOb695oXLzs9SebGVQ/c8VW5FsJ9mk71b0eEKFu0Ddx6iMoR3kdY9UvCsxh66nMx7lZZfQ3rgZo77GugJ+OMsL0T6KiaYPVcajqdH73G5m6ilL7xH93/Ou8bTxGifSUjtQ/uDExYNDZ+dZgCVsG1/4rSmaNTgW4XyfKzAnXcKrE5XR5GcWsf0LimE4J5L+oRrTHNrc7Z4CejSrR1qdpyRSFej+23z3d5zykSJDqZdvH51aiumf+AEZsJlK24tz2kVNUmATMQhdOACbsHIFzPkMzLM72w8KbaUaZpQ1cQM1PP/SHSAju1ThjGqBjt5ASVcE1H+mtK4T+rTQZVLn/AgyinecUgfFKXK+LBn0LDSXN7cYHkhIp+QCrhkvaKC1P59ry3bgqqGpqD+mNdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(39860400002)(136003)(376002)(5660300002)(2906002)(66946007)(4326008)(8676002)(8936002)(36756003)(316002)(66556008)(66476007)(6916009)(6486002)(9686003)(6512007)(478600001)(6666004)(26005)(186003)(41300700001)(1076003)(86362001)(83380400001)(6506007)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0VXcmlYdG1weWxpWE9yd3RKMHhkZ1dQMHFPT2kybDBJTXllSzJYemt1V29y?=
 =?utf-8?B?NFFIZnBwUVJ3UjVnSEVQVktnWUZOTnVvNEFRdzlQME9sSmRPVVlsdFJ5aWVk?=
 =?utf-8?B?ZWc2ZnVUY1hnZVAwSStXdVJuanRRVDc4dmlIKzE2dHMybUtrN2YxMzdPempv?=
 =?utf-8?B?YjBlWDZwNzQ5R1hPc3NNNmNXZkdjeDdaaVpUWUczYmExSnVNZlhzd2RncEsw?=
 =?utf-8?B?bmpheHJCWmxXM0JDam9GQVFUK1B1OUFWNmN6VHdEaGthVHFkL09tb3V3TXlx?=
 =?utf-8?B?WG9FM25PNm1XYWY1cE41NXo1VGFXcVFrSld6SllsTWtNZXNORnlDQXArNTBz?=
 =?utf-8?B?TFlPVnBKWTVMMUNuZll5NGlITzdvOHNxNjRhdDVXVXBSS2NRQ21KYkZubGhi?=
 =?utf-8?B?YTdSNE8wOXBqV0FJNjZTVkgzZTU1RmZlYkk1WW9oREhIQ2tMREFUcUc2aG9h?=
 =?utf-8?B?ZGhla2RKcUV6UnZ0eklXNjc2UkdZSmt2TFZLZGhJeFhQR241SkFrTVJ5eVhH?=
 =?utf-8?B?VEZZQTRmZjY0NDRRVE5aK0tOcmVhMEJ4cmltVnQ2THMxYVVXaWs4WnlGeExV?=
 =?utf-8?B?eTlPWCs3cTM2TEtJQWFYU1U5dW5EME5ucyt1cjNhK2xCTWxGTTkzOXdocHBB?=
 =?utf-8?B?L1JOZlkrdXFmVk4xWW1UZzBjelJLa0RRVC92U0tWOVJRNmdKSmxEUTYzMkM2?=
 =?utf-8?B?MlNCL2NBVlFtRndpYnVFekhpRVUyU0NzZXoxQzR1NHFPU3R1RW4yNjhVNTRG?=
 =?utf-8?B?Mm1CaXNjQzFQUFI4WHdYZzg5bi9RQTZLVmF3cGJab2ZvaWQrVXFpNFNBMmJT?=
 =?utf-8?B?QVpvblU5YWE4QzBPUVliL205YU9NaHZmT3BJWVpwT0Vhc1hpTFVJU0FLVjM4?=
 =?utf-8?B?SnJBS0o2b1NUN01MMmR6L2UyRFU1cEZ6NnJQc1pPVDQ0NWI1ZzRZM2l4UWRy?=
 =?utf-8?B?OFZZaVcwL1VEaVMvaG1IUUFSOWtXeFo3dzBlTXNLRE9WTitDVjRqbmVpbjAv?=
 =?utf-8?B?cVRETnU5VEUzTlJGZjVtSmkwM3dlVXNzY0s3cklLYlFrWHdqUU11Yk00ZFVv?=
 =?utf-8?B?NFdyNzI5V0hTUzNzZ2ZQTFVRcWZiSFFYN29NWmdzbFp1dXA3R0hjTDRvR1Q5?=
 =?utf-8?B?dkVnVno1QXhvbmVYckpwQUFuZGpzM0x6YVZNaGc5cFB2czZaUVdndlU5S1dM?=
 =?utf-8?B?Z1pOaW5XaENyTkZWUWk5TjNTSWdzWGZyQTdjclBIa3N2NGgwUjR5NHZUMmNp?=
 =?utf-8?B?cGtKN044ZGRMMjFUdmErSkVpMlUrbUpQNWltanpLRUFVTnR5S21Zb0lzek9T?=
 =?utf-8?B?UzFIRVlWRW54ZjJQeHRiRTNyMDV5amYyenF3YUVSL2YyL2g2VW5JYXIvQk5Q?=
 =?utf-8?B?Mk1tdnJad3FLRUVxMFhEcUxzL3ZNaFJOLzBBY2ZzbVhLazhIenRNYjFFd3VL?=
 =?utf-8?B?TElXOE5XWUc4M2tvZ2I0aFU3ZVE1Wi8wRjNHZWc1M0NSR1M4bmdycGd6di9m?=
 =?utf-8?B?SjdTS0NDUGpiL0UxR3RzOFVZSXdVRmRLbTUxRC9Na2xRWnp2WjhzdnFZYzRl?=
 =?utf-8?B?S0FmYy9lYzRLZGNtcXE4TVRlUWxmUWZiY0owVFd4bVUzUkY0N0dKOFFvT3V4?=
 =?utf-8?B?YU9ZVVNjRzVDL1UrZEM5cTdiUTJUTUt2VUxLS0ZDSGN5UVY4di9iZG1jQ202?=
 =?utf-8?B?Zk1Hb3ZLQ1ZUbXVlS1U2OUs4enFLZDJBcGYycU05TjVSdUtrblh2amxSVjRG?=
 =?utf-8?B?T04rVDhOcHBxZjFWQUF1aklzOUpPN2k5a0RFaUtZRlRFTGYveVBPTjIybHRs?=
 =?utf-8?B?TTdCNGcwZm1VaXExL21IZ1hna2dTaXVnTzkrNXBmRG93dlVpSnI0eSt3d2M1?=
 =?utf-8?B?TlQ0NmhVNDd4NmNPOEtHdWJrbW1xa01vT3k1VmlrZTJHMUxmUmZobUpja2Q1?=
 =?utf-8?B?ZS8rWlFGeXhFTGNtdFJkTTRxbTFDeG9CdmJyOVM1UjBIelpzazVNOVBmdHN6?=
 =?utf-8?B?NDlpT1o2NGVsWnZDdUk3cUJTN1dCWXEzVGhDdEU5R25XcmlXdldSVVQ3RTNm?=
 =?utf-8?B?eldVU21NNUhVMXJEL0w4UFNoditPQmpxSWo2SUdkWUJqT0Uzd1JIRjNXUUtV?=
 =?utf-8?B?c3FGdXlMWVJRQlIwaE9BK1lKeiszdGorN1hHWlNoT3JSODh6MDAzVDNoODY0?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e53f81f8-896a-4492-8a46-08da91b800c1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 16:34:30.0758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjqEMWDPNl2CLC6cRL96YEMsBxacc1vBzRAd52+zbF7mwD78whuO0x/W17A1qKua0SV3r297IR5ToGELFhTaRprDz8ALarRj+lW3Rz9TNW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4773
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 08, 2022 at 02:08:55PM +0300, Ville Syrjälä wrote:
>On Wed, Sep 07, 2022 at 01:30:41PM -0700, Lucas De Marchi wrote:
>> Continue converting the driver to the convention of last version first,
>> extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
>> be handled by the first branch.
>>
>> With the new ranges it's easier to see what platform a branch started to
>> be taken. Besides the >= 11 change, the branch taken for GRAPHICS_VER == 10
>> is also different, but currently there is no such platform in i915.
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  .../gpu/drm/i915/gt/intel_gt_clock_utils.c    | 77 +++++++++----------
>>  1 file changed, 37 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
>> index d5d1b04dbcad..93608c9349fd 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
>> @@ -78,77 +78,74 @@ static u32 read_clock_frequency(struct intel_uncore *uncore)
>>  	u32 f19_2_mhz = 19200000;
>>  	u32 f24_mhz = 24000000;
>>
>> -	if (GRAPHICS_VER(uncore->i915) <= 4) {
>> -		/*
>> -		 * PRMs say:
>> -		 *
>> -		 *     "The value in this register increments once every 16
>> -		 *      hclks." (through the “Clocking Configuration”
>> -		 *      (“CLKCFG”) MCHBAR register)
>> -		 */
>> -		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
>> -	} else if (GRAPHICS_VER(uncore->i915) <= 8) {
>> -		/*
>> -		 * PRMs say:
>> -		 *
>> -		 *     "The PCU TSC counts 10ns increments; this timestamp
>> -		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
>> -		 *      rolling over every 1.5 hours).
>> -		 */
>> -		return f12_5_mhz;
>> -	} else if (GRAPHICS_VER(uncore->i915) <= 9) {
>
>Is there a good reason each of these branches isn't just its own function?

Because they are a single line, hard to justify a separate function, but
yes, we could move each of those to a separate one since the others
start to span a little more.


Lucas De Marchi

>
>> +	if (GRAPHICS_VER(uncore->i915) >= 11) {
>>  		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
>>  		u32 freq = 0;
>>
>> +		/*
>> +		 * First figure out the reference frequency. There are 2 ways
>> +		 * we can compute the frequency, either through the
>> +		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
>> +		 * tells us which one we should use.
>> +		 */
>>  		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
>>  			freq = read_reference_ts_freq(uncore);
>>  		} else {
>> -			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
>> +			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
>> +
>> +			if (GRAPHICS_VER(uncore->i915) >= 11)
>> +				freq = gen11_get_crystal_clock_freq(uncore, c0);
>> +			else
>> +				freq = gen9_get_crystal_clock_freq(uncore, c0);
>>
>>  			/*
>>  			 * Now figure out how the command stream's timestamp
>>  			 * register increments from this frequency (it might
>>  			 * increment only every few clock cycle).
>>  			 */
>> -			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
>> -				      CTC_SHIFT_PARAMETER_SHIFT);
>> +			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
>> +				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
>>  		}
>>
>>  		return freq;
>> -	} else if (GRAPHICS_VER(uncore->i915) <= 12) {
>> +	} else if (GRAPHICS_VER(uncore->i915) >= 9) {
>>  		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
>>  		u32 freq = 0;
>>
>> -		/*
>> -		 * First figure out the reference frequency. There are 2 ways
>> -		 * we can compute the frequency, either through the
>> -		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
>> -		 * tells us which one we should use.
>> -		 */
>>  		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
>>  			freq = read_reference_ts_freq(uncore);
>>  		} else {
>> -			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
>> -
>> -			if (GRAPHICS_VER(uncore->i915) >= 11)
>> -				freq = gen11_get_crystal_clock_freq(uncore, c0);
>> -			else
>> -				freq = gen9_get_crystal_clock_freq(uncore, c0);
>> +			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
>>
>>  			/*
>>  			 * Now figure out how the command stream's timestamp
>>  			 * register increments from this frequency (it might
>>  			 * increment only every few clock cycle).
>>  			 */
>> -			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
>> -				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
>> +			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
>> +				      CTC_SHIFT_PARAMETER_SHIFT);
>>  		}
>>
>>  		return freq;
>> +	} else if (GRAPHICS_VER(uncore->i915) >= 5) {
>> +		/*
>> +		 * PRMs say:
>> +		 *
>> +		 *     "The PCU TSC counts 10ns increments; this timestamp
>> +		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
>> +		 *      rolling over every 1.5 hours).
>> +		 */
>> +		return f12_5_mhz;
>> +	} else {
>> +		/*
>> +		 * PRMs say:
>> +		 *
>> +		 *     "The value in this register increments once every 16
>> +		 *      hclks." (through the “Clocking Configuration”
>> +		 *      (“CLKCFG”) MCHBAR register)
>> +		 */
>> +		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
>>  	}
>> -
>> -	MISSING_CASE("Unknown gen, unable to read command streamer timestamp frequency\n");
>> -	return 0;
>>  }
>>
>>  void intel_gt_init_clock_frequency(struct intel_gt *gt)
>> --
>> 2.37.2
>
>-- 
>Ville Syrjälä
>Intel
