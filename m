Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7AC64A549
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 17:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C07A10E10F;
	Mon, 12 Dec 2022 16:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185B710E0FE;
 Mon, 12 Dec 2022 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670863929; x=1702399929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0Bui79DIRw1+XMF2Etmu50AanbmO4yIHXcO80tGI3SI=;
 b=Mc6LwGHBtTXPdm8SY12A+rMiN4+7ZH2a+Xx0+uZA3xAls+4dRuJTRGUT
 PDAGnmsA8fYai/MZrKcM7/QafRcH6ei6DV9JtEfxQklu/saKsJyi+Amxj
 vzFvBazI9UDMWMMR74fEIFh6BYCEvoEQoH6mx1nKVz2BCazNelkkF5INO
 si68E6edvU9+13VCIofEXYlFJFLVKJdTdeKMUrzRNctpOOb/s/eeUjdBK
 yt+Dy2iNxhtVSUKKS5QSPABKombvauR2RFP6SXIAsJ9Mhu/zFs6ziovM+
 ZsS3lWrRIJPQbYJKQt+qOI6wR5+0oDxYxWodcdR1mihZZnqUVuwTVC66n A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="319761411"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="319761411"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 08:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="772656814"
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="772656814"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 12 Dec 2022 08:52:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 08:52:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 08:52:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 12 Dec 2022 08:52:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JI5aBgOE89DY4lPXnC/gixoQTJkOVvPef8Ewv+IgmMj5c9BFJNy/kmp7JsMblMILWITxDlniJHLqylLdpyLJfpjls0QolvBn28lcyyA7q3+GdUYI8cmR3Nps82J0/5RbhgpdHPCAdNSpiJdG62gA2fT8+0+0FEOYHys9WQM/9Xvnm0pegBChTkAmFhwLwrSY2bKL5XWvaSWHGweRgopwEGCiprZXrrrJvSX8VoNPWE1IKQjYa44mtUBU1+x4s3lFXEZncgiw6j159VYOI4kyp+7UM6dpjEhp23Srf9RyO5k3BFsDvbtNGDaOI03ZMwCU+ulXW6ZakRbAlUYMmp+TOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ulPDQfQ5iyfhU/WvOVZ6uCKJ1UnsgQrvoo7WDfReRE=;
 b=kkswaYvs4Fa586ymNdW27W9X1mjQ3b5vHo8dFq8XVI2U/Z1mRW+I6tUVcX0qn+t9/XxVvi70gsGufiozZtHjdCoIVuXfePOTWCh1yOP5I8MqHdVU3qjiUe1V5GxKJx+UMByA9ivUhar8+lyNX96ld2G1LOsW8BFB44YkJxzmFxgl2ZohoMuhFYoYrVZJjcPUPbtNuc3LCkh4SlisQxf6dBQ5MoJxObQW38HXeJYjo2ul/8emnIfmMBNFfI+oLY876D67psUeahAUjT5X/foX5xaY7jTiPJY/955MYCQAAlOLh+C1A20NUnFK6/bCSL9hzTWnn2hn0LH21ofS7KaHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 16:52:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 16:52:05 +0000
Date: Mon, 12 Dec 2022 11:52:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/i915/hwconfig: Modify mismatched function name
Message-ID: <Y5dcMKDZmMNJdiJu@intel.com>
References: <20221212032012.114253-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221212032012.114253-1-jiapeng.chong@linux.alibaba.com>
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ceb758-6af0-4bfa-61b3-08dadc6132d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hprRMrlo2SHD2WDcJdWaVzoWPZgBeI7oy3PI6GCc4N71N5ZjEPYyF3XdbdMChmluX/QyCaVY1o0itEsjCT0NN4N33UBOa/C5PeOFqUity4WLcfB6tTMcJEUXOFx2aUb7MQbgEUVm/QxBVcMl+u7OJQFRuGgwQLmrNM4JKYMdBIO2qBc+wEYfj5rgCAqtcaYbHdOI8jkBkI+dhY9pjCT6UnYv69xnDUY4iH2YlVoUcaw+apbaGMi1nYsNbwkxqLHP8m8iydbb5EOnnMXyd0HQNtepn0ZTKrtTo5w3LeZSrXM1j+q2SV1h+fkCU42rYpO7u4PtBIyWbnbjNC4vdyPo0BIfUvvoo8Gtfr79HHRH05aEj5BoD4imn0hOeUFLAJYjn25XHs1xXP/dSeXYD41gtCv971LtcccdffgRujLp19IH4HpH6DMuxx9xXFYWrHZeT6IYeu7LpAcYonKiehvwV0dI6gWtsvK/suK7WkD3ytUKCn/o7nQxtafAtoybHMnrVHrbNnDGpK9S42Ku7Y8QKSoUyTAQ3RTJGDyCbD00o937zd46jJKwWqGDBjWip4w+OS0pX3f+kQ/pVU5OIWqofA02IFpAHhFRZPY/eXtnlOiZ+ryz4GO56XLyd+TcL051xV2n/AihlFsZgTC4pr7GmAD2jhVYlnupBV11AiqB4WE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(82960400001)(2906002)(38100700002)(44832011)(8936002)(41300700001)(5660300002)(83380400001)(36756003)(4326008)(66476007)(66946007)(8676002)(66556008)(2616005)(6506007)(86362001)(316002)(6512007)(6486002)(478600001)(6666004)(6916009)(186003)(26005)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yFZJekvSl92TNueAVH8l1++9QSd0P/zSSJei/wOVCao2IXVCTSSuCYfgiIlK?=
 =?us-ascii?Q?gbVxJNhT3y/AMTyz/XGyNrXgKlkk6ErByr1Mb0iSbndh/wMaOxuX7yJPBMAy?=
 =?us-ascii?Q?D0L3YRi6m5y2tMuDDg/phqpZGiCpG1X4A55ZM04kgCottdwsq50FfR+zMPOd?=
 =?us-ascii?Q?L8MDbSgZhBIzeuDXzrlxZnHEkf1LPBmcpaJ63ZZPS5fqpcg6tWufM4d9IftG?=
 =?us-ascii?Q?PjkNtoczIdmLmsd+AqXey5IUIBaPw2uD75S3pXqOGumsd+PSeL9Y7BXKS59G?=
 =?us-ascii?Q?gRLtON858ONNzBFuHS+C/BSpo34VTtnrnWMMmIrvt2KlLmmfwrL3WA45a766?=
 =?us-ascii?Q?omXqLd07EhBTlv+F1Ik8eyzT8drpnDbg9qHp45orl/y6g0YE4H9uzmLStv5V?=
 =?us-ascii?Q?IrfsKzhwAeiOzJTye8tp/lwZX/CYQiHbgKiPKtry+AgpwP13WL9J3sVVaGlS?=
 =?us-ascii?Q?KyecDjhI+cm1BEEbAxy6B2gqdu468CvvKPWSjnGhdKX59pI/Tk3n2N+se7r9?=
 =?us-ascii?Q?GsRKUQ8tTOBRl5cAeOkQ1QNTAVT2tOZKiy4o2ztI7nhOKdC7HO4VtxLDU/1v?=
 =?us-ascii?Q?mAQLAd/u9zdv4KSiAesVfHELibkMF+Me04UIf/1gVYus1yldB+v3wUdlr6ua?=
 =?us-ascii?Q?hx1NXRHYApq4FmiaSIgdvPuQGLCloKA6znW63jJ0T7pAVCFPMAJ0wu5ixa4g?=
 =?us-ascii?Q?tHdGmApN94nYuhQ5ZegktbwZoS7FCn4y3Lct6FujPcT1FNj7vDbkr5alM4A7?=
 =?us-ascii?Q?ZAb6sm2IzuKfWWqUg3Zke5cUrlZJzEQvWPoQ787tevuxWqhj4A6ubDKmej+e?=
 =?us-ascii?Q?v/oCKoEZ77Yvwc+hrZalh1zwKrHBJkQkEoaFoHKCimQzN0Kfwofhyny8ijXX?=
 =?us-ascii?Q?FmWwIZV3pWx85pcr4WPs/C9C22oNOBG4F8TVwjn9L15bP8fP3/3w5LaoY4+/?=
 =?us-ascii?Q?SzQMafjaqKMVJuLn6LZSumTOMX0RqrwqYDHZArylM3LVJz1zLXW9lsjme+G3?=
 =?us-ascii?Q?k10xsjiku0m98+2gDexrEnASpd7oHYQhY/SRt1AYmBHIzdra8MJQZ+ZJnwY5?=
 =?us-ascii?Q?+2xVEXe5LdJAQs+WcomEjd5D342cXVE/sgiWS54J7U/B7m6tIs5pC3t/3E+8?=
 =?us-ascii?Q?nnU/MxvAOSLiu0VPjdoDUOLaEtUDRLpDlu6hsA5cGR0jiAfZ+XaN/8l0giTt?=
 =?us-ascii?Q?tR+DRiO7c2tQ+snLbB04MVfg/6C8VQpFs/elL5UnwO2xwkHh24ofs/MpRu6q?=
 =?us-ascii?Q?7EZ38dBuGGPeDDQLwNBNfY6iGr4ccfhULBI9Oy2TxR/tI7sM0HN59addf0yP?=
 =?us-ascii?Q?0+lhEeOzk34m5+vBDAsAzuli90l7IwuS/5RCoQanFQhsZSh78gQYbG5IWfAw?=
 =?us-ascii?Q?dC4BOqkJSo70tPo9gnaRXYV8455d8a2HJpQxO2/GiQepxZS31N2Q4v07RliP?=
 =?us-ascii?Q?TG/MQJqW/Xf6XLfF9wv9cEvUPL7Wql51ebP5YSvfulAjMWrzFLtVgfdySXew?=
 =?us-ascii?Q?E7+XFxWONI17gMPf1xghax85NafoIy01bNfoob7wayvxRpYVYnoQ641G46TT?=
 =?us-ascii?Q?zssNZZQ9iHe2z1z0lkIe/bCwYEKPXKptvAIUYefY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ceb758-6af0-4bfa-61b3-08dadc6132d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 16:52:05.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYzHFmIdSgbGGTRR4EtC6dfREgkKiHIXLI9/PQkx+xMnzSvgWSag0ngWDwh4FEgXfRW+MQZxDZPYMBQnqOzWbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6349
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 12, 2022 at 11:20:12AM +0800, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:112: warning: expecting prototype for intel_guc_hwconfig_init(). Prototype was for guc_hwconfig_init() instead.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3414
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> index 4781fccc2687..bdb20beb3e70 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
> @@ -103,7 +103,7 @@ static bool has_table(struct drm_i915_private *i915)
>  }
>  
>  /**
> - * intel_guc_hwconfig_init - Initialize the HWConfig
> + * guc_hwconfig_init - Initialize the HWConfig
>   *
>   * Retrieve the HWConfig table from the GuC and save it locally.
>   * It can then be queried on demand by other users later on.
> -- 

The name chaged when the function become static. And we shouldn't be
documenting internal static functions. So, could you please entirely
remove this comment block instead of fixing the name?

Thanks,
Rodrigo. 

> 2.20.1.7.g153144c
> 
