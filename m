Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9345A0DF0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 12:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335A112816;
	Thu, 25 Aug 2022 10:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74AE112816;
 Thu, 25 Aug 2022 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661423632; x=1692959632;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u1F9kxDvl54Z6vwhXK4TmrLacA/jjOv5oCSlTA4pI4Q=;
 b=dq+Mte8hYAF5KzoG6qXmWB3Go2bEESbXkaSDyHMgz9WUcHFm7LiHIni5
 15tpuJ9BP6VikvvojQkNBds+ea6gvvPCcHMCxZduraj7t5NZmtoloY2LL
 paTXDjAV4laF91gMI7+IHNg+gn7AOF7OTgsLHyy9tsCbpjrDr4sTSG4gO
 FwbSrhNpcNHRLAXPhhA6RYNFUUOpAcP7WzcTU5KMaKU/I8DvqXdGhGSon
 X0tzuuecURpBgT9ll4Vldetc+PMacQhnV9gH5lkepgonWSLj/Ng8jKoub
 ixglsxz9R4uekZHMBiTgLN+guDQB6dLZ7BdxS8DsDdrvIRvBM/HLe2rq5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="273960065"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="273960065"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 03:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="938278978"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2022 03:33:52 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 03:33:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 03:33:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 03:33:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 03:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS2CuReNtj9RoEONzNe8GAlCi/ts4JQOiFhb2uN/6C0O0JzUZLCSAMnxqTOuSW+8Z1iSP7ziqLtegJSIZDX2I15prb6c44p/jCVb35Nz20+EbC1sb6lhWNZ8uJuzz/DZv1addqe78aY8NaB2JSmh207mlYKjn/Isq5Omxs/LFMjkzDZj0wUUfoYTpYYYK9XDECUaeWmUbdjEjEzu4T9g6MC8UGUw4egQKuFAEpCMeg1aSM35VuRymwBns6wpthXYKUkEqBGNnsTvf1ugaOfBMTZKDi+hYGw4g6ZDo9gwtFJvDf7/GQB4csr7zyyT5r5IPyTwDlPogTJ8ZPoLwlrOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/SpvRrTkmuP9Jhf6NGldyJD5elLOgQj89WleA8BzPQ=;
 b=ODPjW6H1xBdNWGvKN8z7YUuBZ0IX7QINBGXQpRWOa+ObUYnR1RiM9YleWCalNhaNILalUI3jOlTX+C0VF7zPDgY1awHJnHzSFo9ITfM0ewLTy/gbQpCalHvs+O8RHgjFZm9t+AT8lpSSK+KzvUP07dI9r3F82gVWew5yjOV4+dQw5NNePeaVcGtHfGxjYONOTw8pfKUcsohCNKt0Cdrnw6wSc5HfuFPzMd8FCD1OWZi3KPpafPsrXceePTODbv6w16yCJmouIpWnAhgCya0mbGzGZdSvyW34ShSpsfdE+1R+W9q1NmDGBjzbitJfAodQuOuu5dgu9yunWEDKV3APBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SN6PR11MB2686.namprd11.prod.outlook.com (2603:10b6:805:59::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Thu, 25 Aug 2022 10:33:49 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 10:33:49 +0000
Date: Thu, 25 Aug 2022 16:03:40 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/21] drm/i915/mtl: Define engine context layouts
Message-ID: <YwdQBIViVSqNQ0pv@bala-ubuntu>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-6-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220818234202.451742-6-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: PN3PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::22) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a77e27-4aae-4420-38b7-08da86854c23
X-MS-TrafficTypeDiagnostic: SN6PR11MB2686:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zp1ZaJs+PwldX8EWOXTs38smry8owKuS+b3N0/L1sipCyb7Cgz33DJifqTefragG7edDVRqybB0gkfa0sM3RRtkx7xJbvgKBFt9Pt9DS0i3zK6qL3MGnKyECIE8r35E3Y/maXEl8wlJxDvrSuEF1oLMnDopyDNogzloaWKBUfNRpKhi1hIAp9GPPwa1U9ohITOiZsQ4A2sHoJHQoHPRdgM7jmKIO7QNDm7bqn4Q8O8CNqeyJ+DLhRzgZpW3qa7ssunYxiBMBgUKEKaukQ4hmcMpo9i7uJPIlH1AAKTKaseVingruxhFRuOWus2r8cCfi3PKEqR6JoeO0VRFGQJ+iDkLESwKZsrI4zoDOALAueo3KvrAeHHZ5gMEZvrUSMfNQItm6MnY69z/5JAu8cALgiDNw18u9Swc8me2Gepz6l9swMI3P4LJa7/ua3eKArFfy8LXvxxIGq6Yo4jtMYXf5FB8Lj8OXTe+IlYSeUvMg8mK8kz7gtzGQ+Q9ELHmEI7qmSUJOI/3nzaymLD5R06zeElBhWGWBxwPtDAfrSEZk1ZnOMswAIXA5+ttpqowX4GewojIH1JIElC8mhKS5+bEkwsp9MH/0X2p7TSaLUxFYt5sR3QTKf5IufB6uVn2qnwiqBigUqbGEE1rQlEGcnp1hniGaKGHgVLrrMlAj8a7vuEcDm+J826ktL5mDStAR2XwG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(39860400002)(396003)(366004)(346002)(376002)(136003)(6506007)(5660300002)(6486002)(186003)(8936002)(83380400001)(9686003)(41300700001)(2906002)(6666004)(26005)(316002)(44832011)(33716001)(478600001)(53546011)(8676002)(66946007)(450100002)(38100700002)(66476007)(4326008)(6512007)(66556008)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVRBVnlrdUFvZ3BCSXdnUzZFU3BjV2hhaU8yR1BNS2JJZjJRVmk3RTVZd05Q?=
 =?utf-8?B?RDlzRHc1NnU5bkhpZEhqc3ZvYmVVc3JDczdpb21NNTRTNzB0cGJSeHRnaUFR?=
 =?utf-8?B?a3NuY2ZVTnh2alpRMVprMFJIM3RKOTRWU2RYcENqWjNTYzQ1VWRYSk1BVmtG?=
 =?utf-8?B?MzlpK0daS3dESmZrOHhZZmdkdEZLeXlFK1pjaGF4OVRqRFNKSVpJTktuUGFp?=
 =?utf-8?B?ajB6S0pmSDRzS0hSN0d2Qm1SaHN4T3ZrWWdPK0s1emozK0FyZ2xSS3luUjhX?=
 =?utf-8?B?NzFENm5NRzZOUXM3Q0R3aEMxai9Tc1Q1UnpmbUhjMmpBVzJCcVphZXh2YU9r?=
 =?utf-8?B?U2t4V284cWhGMmNKNTBaOE9MaXMyeHhiRjRlWUg3REQrS0orNGNLcWRaeDlk?=
 =?utf-8?B?OER3YWF5ZHlGWitqUHB5UVVJNldqT1J0QVJQWjhkRng0NXZhblkwY3N1RnNH?=
 =?utf-8?B?eUNudWJBaWNRNnB2Y3dSejBGc0Y2YTFJb2dVeitaOUNpb0ZwUDZ6VnAxaS84?=
 =?utf-8?B?T3NYcEkvRTJxNmdaZDR1VjFwVm16bU50WXU0bjN1cHlqTFVBYUxSM1lPc1dz?=
 =?utf-8?B?d2RCY1BWdUJMRERXNVh1UTlGeVFsU1Jpek81WFBmeGFqY05hdjZ1MVg3Mk5z?=
 =?utf-8?B?T1JwUEFjbEc5bTZUVHNFVkt3S1JpVkJwS3hNbE1kUzAvMXlQSFZHS282d3ZY?=
 =?utf-8?B?ajh5MnZTN0M0Y1NUeVFCU3llRHA1U1ZrVXJSeTVkZUtJMlJXN29teEhXTXA2?=
 =?utf-8?B?aSt2bytvcVVTQXdOb0E1SjQveEpFQ2lMUlYrQ1VQNE5kNGt3OEVab1luVnNy?=
 =?utf-8?B?Ry8razBmSzhPYWRrYmNtL1QrRldpd04xSEZVNG9nK1U0TWF5dTkwQm5uRE5Y?=
 =?utf-8?B?dGZsaTZXS1U0Zm5IYzlSWFAybGkwMTRZbDM1Mzh1QVhIQzN1elJUREpGNldK?=
 =?utf-8?B?RFBYT3kzOVZCMmFjUGJja3EwZjl4ZXVPdGhtSDZGeitwQmhkQ1diQlBvbVlG?=
 =?utf-8?B?RkdIUmZMUGdIbFI4dU9mcHdGUU5HeHo3YTZBVTROam1ISnAxT2d2elk3cUll?=
 =?utf-8?B?MTU1d3gxck9kYUVBZExtOFZyTHRNTTViUTYwclh6K3U0aWs0VzRKbnluZ05B?=
 =?utf-8?B?SVNlVlVUdFVoMFFzZnlENGlQSTRGb0hEV3BIT1hsYjc4OFJUbnl3NjhYNlJL?=
 =?utf-8?B?bTljUFcwS3dwNmlzZWxON0pmTmU4QkZOc3FpUzJTazhBUmpDTlU1U1RuR0dK?=
 =?utf-8?B?aVIzYjhSckxtREpWMDd4OGdkOGhrTm1jc3RseXkwTDB5b1oycTRSUmc3MXpx?=
 =?utf-8?B?TWd4Ri9UeW1EYmFMWC9ZQ00wM3UvbjMyWmZNWFB2dHF2V005Vk5YaUozN3JL?=
 =?utf-8?B?WmRnUEFMZ3UrK0Z6R3pHdmlnMVJITmErM1VpdThwc3hWNXhyWkpObVQzMkFY?=
 =?utf-8?B?bUFWQ0RYaHdXWCtWSmZzRFBNeFpjVytTUEZTbWVBeHJEVnlGbUFHT2dtRjdR?=
 =?utf-8?B?dytRcW9zNDV2WmVsWlpNeGhRWTVpTU1sckpWRC8rNkRXY3BkanFlQVp3d2NR?=
 =?utf-8?B?dHdoQ0UvVWJQQlAwMk1uRmdCalhXeHhqb3VteG1nTThHMG5qUmdJM0V1b1d4?=
 =?utf-8?B?SjNyZy9zdEV0WWdaanlFcGJGWVN2TCtHN0ZDSTN2SDN4RVZwalhxeWhsemVl?=
 =?utf-8?B?SjFzMnZQTTRPSFA0cGRHYUZKR3k2VWZPaTNxcFRxallQUzQrNkhqM0JHVXRD?=
 =?utf-8?B?cGkvUGV2aHdhTWQ1NHhrbks4cTYxZVZwWjdUbTdIdjJ3QjdNR3prN1V5aTFi?=
 =?utf-8?B?ZUNGUWtoVkhaU2JObDdSdmRScjdlYXRzY3JadzloeGpFV2pXbmZZZlYwdlZk?=
 =?utf-8?B?N1BPYXFRcGFuUXhPcVdlcHhQVUNuMFBaQWU0RElmRXRiTjhHVXhxTkdqSk9G?=
 =?utf-8?B?NjdsL0wzRCthR3ExYmpOZ3g2S0I0VXJ0VWRKRDhqNS9xTGllcU5DTzBTZ0hu?=
 =?utf-8?B?SG1ndUx2M3VIOS9VTUw4WGs3N0MrcG1wL2szOEViV0d0RktVZnI3dnJtTmls?=
 =?utf-8?B?SHVPSi9SbS82QXprNFhKMlV5NVJvcXMwclBJVjlOZHBiYnBEc3NScFpwQTBI?=
 =?utf-8?B?NnFCQnFBWmEveWxCT2VUaTZ2TEpGSUI2M3YzNXlXQmpMQUJJMkI4UVhSbjJB?=
 =?utf-8?Q?uiF03KXyyOsyK1vyk/jrNtg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a77e27-4aae-4420-38b7-08da86854c23
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 10:33:49.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdDzdZ+pYe4pGBFOBaIPCJccGyP02mEfFaAFZE08fZCdRZtdtFtfz4O0dHtcHUgu88MjIm8gvKmiiWooGR9bBpikyxqFcOeZRp9dHWOLDcxZ8MOjcoI1xSPFOVE9/aab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2686
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.08.2022 16:41, Radhakrishna Sripada wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> The part of the media and blitter engine contexts that we care about for
> setting up an initial state are the same on MTL as they were on DG2
> (and PVC), so we need to update the driver conditions to re-use the DG2
> context table.
> 
> For render/compute engines, the part of the context images are nearly
> the same, although the layout had a very slight change --- one POSH
> register was removed and the placement of some LRI/noops adjusted
> slightly to compensate.
> 
> Bspec: 46261, 46260, 45585
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 47 ++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index eec73c66406c..d3833cbaabcb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -606,6 +606,49 @@ static const u8 dg2_rcs_offsets[] = {
>  	END
>  };
>  
> +static const u8 mtl_rcs_offsets[] = {
> +       NOP(1),
> +       LRI(15, POSTED),
> +       REG16(0x244),
> +       REG(0x034),
> +       REG(0x030),
> +       REG(0x038),
> +       REG(0x03c),
> +       REG(0x168),
> +       REG(0x140),
> +       REG(0x110),
> +       REG(0x1c0),
> +       REG(0x1c4),
> +       REG(0x1c8),
> +       REG(0x180),
> +       REG16(0x2b4),

Inspecting Bspecs 46261 and 46260 indicates the following 2 registers
are replaced by NOP for MTL. Can you check?
> +       REG(0x120),
> +       REG(0x124),

> +
> +       NOP(1),
> +       LRI(9, POSTED),
> +       REG16(0x3a8),
> +       REG16(0x28c),
> +       REG16(0x288),
> +       REG16(0x284),
> +       REG16(0x280),
> +       REG16(0x27c),
> +       REG16(0x278),
> +       REG16(0x274),
> +       REG16(0x270),
> +
> +       NOP(2),
> +       LRI(2, POSTED),
> +       REG16(0x5a8),
> +       REG16(0x5ac),
> +
> +       NOP(6),
> +       LRI(1, 0),
> +       REG(0x0c8),
> +
> +       END
> +};
> +
>  #undef END
>  #undef REG16
>  #undef REG
> @@ -624,7 +667,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
>  		   !intel_engine_has_relative_mmio(engine));
>  
>  	if (engine->flags & I915_ENGINE_HAS_RCS_REG_STATE) {
> -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> +			return mtl_rcs_offsets;
> +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>  			return dg2_rcs_offsets;
>  		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
>  			return xehp_rcs_offsets;

Similarly from Bpsec 45582, the same 2 registers indicated above is
replaced by NOP even in Copy and Blitter engine contexts in MTL compared
to DG2. So we have to create a new structure for MTL for Copy and Media
engine contexts.

Regards,
Bala
> -- 
> 2.25.1
> 
