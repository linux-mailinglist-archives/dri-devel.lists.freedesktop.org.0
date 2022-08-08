Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E358BE87
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 02:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024F110FD1A;
	Mon,  8 Aug 2022 00:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C940A10FA08;
 Mon,  8 Aug 2022 00:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659918988; x=1691454988;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1CvykbMGptnuZVB7V+F0YwrHShBECFJl7p+9J+7m7e8=;
 b=ZlrWEId7IcGe0ay2WLNpw2mcBSGv0hXeYZcPibRS0MZagwpyTbvyY7z0
 EkSP4qpLZI+TfwJQQiBpgTfLuNKvH0BhC38H+BMBA04Lccwew3DeymzB6
 du7fYG75j1O2UZwLnXSH9cx9wtOKBlWZmqTfVOnvafVWQOmGxqCxoCthm
 MmwAHmj+u5MUzOYtQY54l6QbZUktX6OJO4SxLURhw6KVZgz3Vfa8NK+ib
 f73eop2JWQ5n7a6AJNAe1xlc3jnmiFmh6p6uFKYaK/wlRdiW2dtHUpyan
 eXxUWYI8hL84dukRjtzxk+TQwpGO3SfJ/AN0qwzcvNN8yO9CIg1aSbk3F A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="291704041"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="291704041"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2022 17:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="604174985"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 07 Aug 2022 17:36:27 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sun, 7 Aug 2022 17:36:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 7 Aug 2022 17:36:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Sun, 7 Aug 2022 17:36:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JABs2/vkhsQiA/MkDpo8FK9g51Kds1mLLceAdzrRO/VrhMLbP99S44ulyqfbXuQ4IlaiALxx7HxDqXJ+G4Fcu6AI5fNZkmwZBEXEOyfsIphBnXnQSoeBbeDIxogEIdb7AbWWX6T35/j/btH+Qg2zwP/3oefN/4wWC4j7z+1O0NM+pNoUXhxqPVRA/KWKrrkkbGJdOOPgFZ6+fxaDIw7vLau/XCnqR2fgtLXlKU3BqFCpKg4LZJ5+M08px1CRTSAV6i7ywDDW879NJKX+JA55EK02RVSAmcpcB6Ycht47wj2ykmtBNsMrcmltRkKpPcXH71nRR3sDtlaj9nOdLn+eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hSqR1qvYDpGjP1C5s9iSLQbE40ragvqGJnpv2+vykk=;
 b=ec+LjdeXFitwiGnpDeJ57aLrWbRsGFEu2lH198gfECOh2rjELXYWgiNpcLJ9fQboXwkeX8me4AObOZ086tyTV+COP+Ox0pLIS2VE1OE8/jRginuFNp7UTv9xiCbO6mzLy7EfCqp03LatIPgL2xvBhFZpgrj1RcyAzKnEXC56qy3TzbRD+b2vjRsWEg+CNTYfETWZnZHhpE8ckpUoXyHAsJCRBz7o+8sAEFzlp8XZ2VY5Z5cs/t41hPhZy4Av0pbJkG3NHnR4xkPsrWYFjwJOFZ2OSJqQoEf3xybJoev+dPPz5p4duvtScLo/glBxxOqVHVBxFk2li3zedlutd/OY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) by
 DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Mon, 8 Aug 2022 00:36:26 +0000
Received: from DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::2dd1:3350:86d8:ed93]) by DM4PR11MB6043.namprd11.prod.outlook.com
 ([fe80::2dd1:3350:86d8:ed93%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 00:36:26 +0000
Date: Mon, 8 Aug 2022 06:06:39 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/ttm: remove calc_ctrl_surf_instr_size
Message-ID: <YvBal+4hwFIdcIjJ@ramaling-i9x>
References: <20220805132240.442747-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805132240.442747-1-matthew.auld@intel.com>
X-ClientProxiedBy: PN2PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::7) To DM4PR11MB6043.namprd11.prod.outlook.com
 (2603:10b6:8:62::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fa5a1a5-54f3-4155-38ac-08da78d606e0
X-MS-TrafficTypeDiagnostic: DM6PR11MB4612:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4abjoWbhVegurZ7BL1Ly7qlBl8G3X9gmwqNk7CeLElX3/hlWwh2BR4WP4WutlJcNIIEXQZ9OHIOTquMNq/yCS5u0nyyF65E+H+DPpWLOfLae2J5wAiGiYXwIz+qBuQo+KycU9n1wCctcz4GPrBNqiURtuWJFL0UpriI1VPz3FX5kotGhbcaZsE3U6RNk2RXaSaI0mkCmAU6+kspTjExFSmKqwi+8U3V7axUVk6wSesrV2wV/3n0VUiH4Sm3wkDcDeb8v1Ob2rTCP+LrB1m351srTPOuP0nPiHNcLyE++bd85coAxUWDCY4ZFmtHDJrlOYJ7wmtpmfMHi8tx+VvSOsS6+akQxRmx4XKTf+ulvdqM+nyvHQd45z2yGCIGRNS2qJgBXNjBMbq6piQFakvgFV72JbQBDPbkHtiWFicMhK0WM1hdnPBes8nPJTEulLzlNbaDldVxkcnMsvsK1H7/973Og/TmjYvcPvD6KR6cm49wlPCfstW5md/LTrqc6r0DqBuY8mXkW9RaqzLGqlzLXGjkbaroVEHI5p1b1rMSwnoIbH2k4AZluwJX7aG46Jin8V0N/sITeYHH/OyvKS0a6YxM/wRfgwB1ITAoVN5KnQSixpLZMlskGTR4xRtHxp9d3XWdrEJ0XfOJSp6/Lg88xkijiAlh9CR2fJr0rUJHt4xFpEoNH8JJYOkxVy3UeDflKtOsPBtu4lbTG5Ez/BDpbwcLwg4Of7qXCss7Emq5ZhqIygY0osa5palMReA7zT6YFVBN6Gmd4BR8qkz7nDMqyup6IxVLgzsjJFq99bW+6Yg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6043.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(66574015)(41300700001)(53546011)(6506007)(6666004)(2906002)(26005)(9686003)(6512007)(38100700002)(86362001)(82960400001)(83380400001)(33716001)(186003)(66476007)(5660300002)(66556008)(8676002)(6486002)(66946007)(4326008)(8936002)(6862004)(6636002)(478600001)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlpZM09QQzcxWG04UGg1ZEowYk53OVJ4aG80Z0c0OXhlRW9OS3FQMU9HNkVh?=
 =?utf-8?B?dU1FSmUwbjBKcG4yWUFXRjNtNWNNbmNiRkFXZzNwWW10OXlwM3RnVTlOM0dn?=
 =?utf-8?B?ajNRRStDamVZQzU5UzVsTWpLbDZwQlY4Qlg1MmZTU0padlFZalVOUEtneCtR?=
 =?utf-8?B?Sjh6Mzlka29QS2FyTUUwcHZDZDdPSHVDQjVtY284ZzJIWTBiNWdQaWptelBG?=
 =?utf-8?B?UEpkelhINUo5UUs2S3F5UEdzRWthTlNTeWlNbFZFMjB0OXdqdXd0b2Rwdzhz?=
 =?utf-8?B?MWhPM2VyRC9RZU9YT0tlajhubjNJUWh5elArTytpdVVRTzV4VUdHRk9NNkJ1?=
 =?utf-8?B?cnRHRFZzR2FpekYwUkc4UXRLYVlvMDlxTDJNbUdYREFYNit4WmpoUURqdDN4?=
 =?utf-8?B?MUZiRStKbEdVaUJSekcxVStadEVPT3JDcEowa2R0V3Q2MS9rVFV0R0pHdzRD?=
 =?utf-8?B?eVJaK294ODBtbzgxSFZYcGU3N25TbUFzeWxRNW11Y2ZnOGIza1hvVUNRV3lN?=
 =?utf-8?B?cEhyQTZuYUZ5UUpVcEhRSUhTNjQySklJeXhFZUZ2ZDRWU0JoQ0dTc0VoeGhG?=
 =?utf-8?B?bG5tMWVPaXBicko0OEFqVEZSdEs0QUJaVUMrcUlZUGlNQi9yWFpZakw4cERu?=
 =?utf-8?B?VUw0clI4cFFQMFdMRW8vNHFoSFYrSHI5M1ZqMWNhQXg2eFlhMjVWYUJ2Qzc3?=
 =?utf-8?B?N01kSFI2OEFRU1NGQ0R1Q2lJZ3Q5OWUxdXdLOEJBUDZnUHhTVW91UEQ5eTRu?=
 =?utf-8?B?OWtLSmRaZnFBZXg1UG1HRnhBM3kxbXcrakQ5WFhsTUtYUnlqUlkzTnRHdkRE?=
 =?utf-8?B?QkJDVERhOEk3dGN2b1ZzTGoyQ0o3NG5mR0F2dUs3ZlVGMWcxVkpzeFV4L0J5?=
 =?utf-8?B?STVwV3p5NUgvY09zOEI0SndBaGRHTFEyZDdHNDV4WW4xeHdxYnZmSVR6VUpl?=
 =?utf-8?B?L2xSRDlmUHFMbnZGejFrRUlxeHRhR3grbzNNdmR4aTlFRE8za1lDUlRUcUd5?=
 =?utf-8?B?N0pnT1hTSXpVZHluVDcybkFFSTNZMXNKSEtYVHBLK1VFenFIK1JTelgxSWty?=
 =?utf-8?B?ZkxSRElCZlhZTWw2TlQ2cVV0aU96dmVsMDB2NlR1RWhBWG1ScUJLeC9XRXBp?=
 =?utf-8?B?V1hOR3hpRVJkd2Uzai9DcGJQd3FOVUhkOUNGM1VGdjU2cEZpSWl5SkZpcUJ2?=
 =?utf-8?B?bXJDazNYaUhIa3Zra0lTTXRXcCtuL2l5czYxWnFSTEZPNkdHUHM1RFNpV0xM?=
 =?utf-8?B?S1o1N0gzdUxBYUZxSHRnRnJJaEhQdFlscXRnSTIxVzlQelBxM09sSjMyUWZt?=
 =?utf-8?B?MjBsNWNiLzZPN0dHeERyL2d2WmpnR1JtYmJPTWQyQkhqME5rb2YwTXorTWRU?=
 =?utf-8?B?anBxTFdHbTBjZlFlM3NxN0s1dmRRSHhQZjlPRzlMaVc0SWJHRVRGanZPRUw2?=
 =?utf-8?B?NFFOSnc2cVF2SUJGNGFEbTRDV2tQQXB2TGlDc3RCZ2dxTTJJZ3paeFhmWGt0?=
 =?utf-8?B?SVdrTm9VcENoQ2tYSnpKckc1LzJCMHlKQ0J0Qk44RDdvSDh2UG1qZ1I4cG1Z?=
 =?utf-8?B?aUg3dHZSUEljT3lWT3h0bG9xbzVSUWdweFRyaXBYUFpydE9vUU03bVBrZlN6?=
 =?utf-8?B?TURCQ1IzSWI2bmFkSEs2RTRaZTVObEk3VThhbi92cUVTQWxsOVpVUlZnaXVs?=
 =?utf-8?B?UG1CWEw4S05HTllJN0xPeUx6eW93anFoN24yVk0xcFpXRGhibUFpZXFSeGFQ?=
 =?utf-8?B?SDdvNHdQNFR2UUQxQVYxNUNpYmdDaTJ0WFR5VHRaeXM2Znh0djlqWXphaThh?=
 =?utf-8?B?UWJYNVIzWjZTUnBXNkVXMEMzbnJYdEdPYUM0M1RIQ2daTlM2a0ZIMFhCa25E?=
 =?utf-8?B?bWZhR0szQkpUdm1IQmRNR0NqSEc0ZGROdzdVUXhBL3l4WHNtZnJkQkNxUjdC?=
 =?utf-8?B?ai9XWVg2T1NsZ1QrckI2UC9vT1RqQm5WMmhXSDRBQXJqUUpvWmVUVzFYOEtx?=
 =?utf-8?B?YUFmTjByVTNYREFwdWRjSlI1QmsyOWVwbm56NjBKd0ZYRWpPZENVVHRxZjlT?=
 =?utf-8?B?ZXBGTmYrd1hyUTQwb1dUVDRyL3RYdDZpNWEwa0R1TEdId3N2czZCOEZsODdy?=
 =?utf-8?Q?Ga7zf01l3WSrHVd+j1nqsrkUo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa5a1a5-54f3-4155-38ac-08da78d606e0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6043.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 00:36:26.2706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4cn+10WXY2x9CSTH5RSGsjr6kZ47gzF3rpzuJetvmE8LyiJ7W05z7XUHsdj6h+PCpia23+Ag/xHnZWakZ35xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-05 at 14:22:39 +0100, Matthew Auld wrote:
> We only ever need to emit one ccs block copy command.
Since max size we handle at a time is CHUNK_SZ, we will need only one
cmd.

Reviewed-by: Ramalingam C<ramalingam.c@intel.com>
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 35 +++----------------------
>  1 file changed, 3 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 9a0814422ba4..1bbed7aa436a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -511,44 +511,16 @@ static inline u32 *i915_flush_dw(u32 *cmd, u32 flags)
>  	return cmd;
>  }
>  
> -static u32 calc_ctrl_surf_instr_size(struct drm_i915_private *i915, int size)
> -{
> -	u32 num_cmds, num_blks, total_size;
> -
> -	if (!GET_CCS_BYTES(i915, size))
> -		return 0;
> -
> -	/*
> -	 * XY_CTRL_SURF_COPY_BLT transfers CCS in 256 byte
> -	 * blocks. one XY_CTRL_SURF_COPY_BLT command can
> -	 * transfer upto 1024 blocks.
> -	 */
> -	num_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
> -				NUM_CCS_BYTES_PER_BLOCK);
> -	num_cmds = DIV_ROUND_UP(num_blks, NUM_CCS_BLKS_PER_XFER);
> -	total_size = XY_CTRL_SURF_INSTR_SIZE * num_cmds;
> -
> -	/*
> -	 * Adding a flush before and after XY_CTRL_SURF_COPY_BLT
> -	 */
> -	total_size += 2 * MI_FLUSH_DW_SIZE;
> -
> -	return total_size;
> -}
> -
>  static int emit_copy_ccs(struct i915_request *rq,
>  			 u32 dst_offset, u8 dst_access,
>  			 u32 src_offset, u8 src_access, int size)
>  {
>  	struct drm_i915_private *i915 = rq->engine->i915;
>  	int mocs = rq->engine->gt->mocs.uc_index << 1;
> -	u32 num_ccs_blks, ccs_ring_size;
> +	u32 num_ccs_blks;
>  	u32 *cs;
>  
> -	ccs_ring_size = calc_ctrl_surf_instr_size(i915, size);
> -	WARN_ON(!ccs_ring_size);
> -
> -	cs = intel_ring_begin(rq, round_up(ccs_ring_size, 2));
> +	cs = intel_ring_begin(rq, 12);
>  	if (IS_ERR(cs))
>  		return PTR_ERR(cs);
>  
> @@ -583,8 +555,7 @@ static int emit_copy_ccs(struct i915_request *rq,
>  		FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, mocs);
>  
>  	cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
> -	if (ccs_ring_size & 1)
> -		*cs++ = MI_NOOP;
> +	*cs++ = MI_NOOP;
>  
>  	intel_ring_advance(rq, cs);
>  
> -- 
> 2.37.1
> 
