Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544255B2542
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 20:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F303110EB87;
	Thu,  8 Sep 2022 18:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E0C10EB86;
 Thu,  8 Sep 2022 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662660034; x=1694196034;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h96n8IUbNLvxJs1/CrCseOH4lbZeDCgoVvWQtlIRNSA=;
 b=GoV+f/i4XQ2zsvt1Bh1JDeEfmGeEHLdYBiZ9PPZnlEYzIWfo1c7vOw2j
 Vob5QoZP7pWvQqIROohvY/09hp4oTbCSzy3Lau63vz2HGvP8GBkRKNhOQ
 sDfJuFiM/bvR0qtVarFGd62uetEb8ka1Z3AS2odCD/n18ivHZovmjLDaf
 8YWx7coedSu/9PnoKb0uWVGLSxtJbeJAs0z6f1bp/Feyo5xU+5seMpD76
 R4xrSRt3On20hUWue33U/K+Bxs0dMiCeH9LEq3Eetw/xQK34Fv368vPnu
 xMwc64bN7TNQCPapELGVm2ymGTguyO709364yWeFyLWV5zfKs5c2j4R/w w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298083036"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="298083036"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 11:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="860131796"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2022 11:00:31 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 11:00:31 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 11:00:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 11:00:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 11:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIcQW5pu3J2XT5JgDdE/wRdo/VilA9qtR9KR/BmqLRo0IENticzzl5vDUit1r8tFFXAqgYHfukyZFtwvoYj7VsVJX/DVSlV1b5hLn7OdWPzcKfnhweo8suTk3bGkoxTgOa7/cl+TrdIsFgLmqYd3n7X1SZFcGRheTnyS+dFvYfDbBQ87+C7bpHk3S3tHeLtHUDXd8b76EtMod8wk6SdBg0R8rHQJxPRAwbO1Zbz57vSBbp29+hGPeYC1/bcEeegBnPexRqVDyJ90Y51r4VACKWVp3qCqcSantklcAaoCInJxAIv7/m1FT/t9R3gmgUfKJOlH8Woxhb1BowitXAjqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTvcU3/4ySsbwEFsM2+LyLfYnNI1pbOtXfWfkmBzjOc=;
 b=j3nDirD9Mg0M0r7XOCd1An5Kung4IcbvwiAIIqhh0E6wa2hbCUMoYWC9dyLs3OalIXB06lhQB0p8jqR6J8JQtFbnYidDLcl04ExVzbXLB+32D/V4R2T4zv7NnX+fTHRSGlV6ZIiDNxO7avQcC8EEYcBhK1QlbsoLz+o+fnH89RGw6fL1dUayzfhbEHbmIeVFgA/JjRMnmU0XqxbVqhTjJu9Hr0SO3hI9EQF5EjpXfJmMesRe9eGVolkC8R1rS1pfp1KoS/U4EcMbCjbnjs9ikCyIsr6Aqu2ahMrvVgDQJjGWel1alGvkeO82JQeL8dXhZ2huxGRqM6fq67nZrMdYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Thu, 8 Sep
 2022 18:00:14 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 18:00:14 +0000
Date: Thu, 8 Sep 2022 11:00:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4.1] drm/i915/mtl: Define engine context
 layouts
Message-ID: <Yxotq6Q4vY5fSozV@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-5-radhakrishna.sripada@intel.com>
 <20220907233317.357721-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220907233317.357721-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:74::42) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03ab5e3-5636-4599-1b3b-08da91c3faff
X-MS-TrafficTypeDiagnostic: DM5PR11MB0011:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NfoE5pJ74J2kr+7xVqxSdCKNB1phjwd5xM7cWeoHY5EfCH/1mz3an9utL5srv54SoK5sNlwEwWizU6R2nTvlCdCcMQp5wRgEVzl5VnwNTZa/QWzTD/I9Vfpmz4ZzM8svTDtXLhDDAnE2o+2mpAjRUHDVmZjs9yMQxEoJJ1a4+VzY8CSuyf6Sw3GTDiRu+9Nl3NvWkAB/Qk0LB6eDZzhVl9EpPAkitJr1AKCOLJOHFfs/XQ3w0uWqsebqirka4KOsj6ce+NZUquBBeJVjVv69je4E1mUX86SQAyT8MT29hma8tPs9xjfx7LrkyxfBu7dgp53lwlm9fLqYJbsndi3S8UzrX8GzOGvLyM7q9JFXXvlHcqWUeMDXQa9bAcpmoOsycVDpZzkhkTXSS5jgq9JVYh2lTVe5yVETOV9UINIXngOVffG1lCWfoZt/wwZb6i7KsKN+SiVwBiLI2LA5OqSx53BgNubFqwe7nRObZmlZGN71XHJdXwl6QOi+20H1a3tW6KgeIaL9CF77pjmxG2ibfG8qGheUcLoosTSQfWSCclvqllAozymUttznSeSy839VyY8Cseu6mYGa4OsInSaA4w/QLyKtRIpVz7CutymjAbpkQEy/S9V2vdLvviYHqWhSO3LV/42oEgwZRsHdzL6v3defR2IsazSKo6DwBzEVhSZfNmnpCSZw6b9WQefy74sMrXwmvAQ01WtxMvcPLcJjsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(396003)(39860400002)(136003)(346002)(38100700002)(66556008)(6636002)(316002)(82960400001)(66476007)(66946007)(83380400001)(450100002)(4326008)(5660300002)(6862004)(8936002)(186003)(8676002)(6486002)(478600001)(6506007)(6666004)(2906002)(6512007)(41300700001)(26005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8wu2tyhzfXY46MMP+6o0bjRZCvzULpXoT3AD9m3oFXfkJm+tL8g1xKwN9ir?=
 =?us-ascii?Q?n07omtne6N1VLF+GOxPSaiTsqSb+uwBhvvMjvEoZjwlKfEb8kUCsiL329CU+?=
 =?us-ascii?Q?jrizRve7/9OUMxQJBrR4TpJG23nAV47h3TMKZ4jey9jgGZkzJq/CAMMRetUb?=
 =?us-ascii?Q?sfPJCOsLjv1Oe8KcItoeajcftHDEoqsXFLomu6OnKjRYp3F16msn8HlilsLj?=
 =?us-ascii?Q?fRWUSv0nslgsi1VigKe5X0UPThykdD6nAeH8Sqlq8p3qamwzR2v+6tKLn1wi?=
 =?us-ascii?Q?3SLiYYsB0nrKvUk6Hs3bOXN57M0mIdX1uH7vWbZ6HYWpURCOFB5VjvQjxhK3?=
 =?us-ascii?Q?Rlt5dMCVR/k8QN95nCfmCSGhQ4wus/HxjQQYZBtU8z0gHA7EGdVUZfA9OrJ5?=
 =?us-ascii?Q?1WyLx9DLxDqBj+WWZb54xJLoPA0NECHt4ER0DneCnAx5iNkOcAaEsSZrQPer?=
 =?us-ascii?Q?RO3YvPMzqQuKnEv5OGi3+iq7B2BNYJAHp1KkhEOhqGPk9Iw0ymPi1SSpBYSs?=
 =?us-ascii?Q?21qJx6d7upAQHrjzGM6PM2Od7jnQasoy6lDZlgUBEAGpxEOBmEO5T9QHJYMf?=
 =?us-ascii?Q?9P28YHRI0zWaDCliSCoWOiuag4QYkGPZbqWf7tep3ZZDSlaLPDS7FqnTh6/I?=
 =?us-ascii?Q?mIiZOBkkMEol/Rgqug7WK8LV3xfdLTqmpoD+ii84sTl6YFC22h5apcQa14j8?=
 =?us-ascii?Q?rVfqFMqRu1HI4fKdvx92jDFw+dgNIIiHWB+LSgn4M2xjzqJxwtBEQD+M0sQh?=
 =?us-ascii?Q?bkITegsPuRQfrDcqtWpV1eaMSbUN5Ql2UBAqoJdiE9mILO3MFCh7y+0plATB?=
 =?us-ascii?Q?sY95x2yr1ArEKRfzxMpbMBUt4TxsMC9Aa9eM9YyxIAKXQ5PEBsHVCaM2AzjE?=
 =?us-ascii?Q?va4t22GbsT+hAY4pE/MXP5+AOP25yeEGtbwr7sDfE9Sm3Ff/pVnVydADL7SW?=
 =?us-ascii?Q?KZVD3OgCrud5Mppnv0a6VEzXE59r6DsoTgOd2SeFCMty6SdB6bvYp8A6CVng?=
 =?us-ascii?Q?SVqtwnGH5q/6ap4Z02EJ5c5ZNX/vScQJgN7f6dU6813gI2PYz14RUhy8j1/J?=
 =?us-ascii?Q?6ddJaFi7W+mJLTZ34u/c/Iy9cCBoG45TceRXWkkGpnL/jc39RNLDxAD4CqXa?=
 =?us-ascii?Q?xeNIw7fUuDETW38hATI9WvzoHeV5ihvgxUkKGNWyS+YOm038SOVt7sa+xdmK?=
 =?us-ascii?Q?4Z0hAPar5LebudmU4a9ujZ+tSullkgI6infwsWgT5Ao0uWwa5bIIkfWf8HE+?=
 =?us-ascii?Q?pxcszpGrzR/c7/jBlR/J76DYGwIs3VYcLEjCLCpJaSAwuWDYiFdY8RuFytWj?=
 =?us-ascii?Q?7Q3Dt5xhO1DE/SwHKrcqtW9g/4V/SMXbGHwlU+B7jG0mjWrOwBueVjqtQ2/V?=
 =?us-ascii?Q?hpfe4IcLVauncCEiaJDs62OnSjELgidvhLDIHoJM/Fghx2vxH55S1M+f/MgV?=
 =?us-ascii?Q?WyndayhDYxw9xx9LP3ITd+w/Qnv071loTBtKqy0K7q8LoIZaDmmPHHca6UX0?=
 =?us-ascii?Q?wzZy7Hwhmelp5BcJEb7JOQZ1hMjkI47At7n0fO2s6e5c1qS7wU3XclKzscAh?=
 =?us-ascii?Q?PETNJ6/Qgk2ry1D6NyNdD5JScqutvh9JnP869jjJT7Qmxl0g1qKMxbOw/63w?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e03ab5e3-5636-4599-1b3b-08da91c3faff
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 18:00:14.4362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsKaurdh2JsDLz517kilBA7UHlYS+L+CnQYzloONPm7UWqsb5ATmiEJXM5XAyiyq/DZfPQmbB9MDkn/453Ov02U0pgwVTmJaV6D61nBEY1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0011
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

On Wed, Sep 07, 2022 at 04:33:17PM -0700, Radhakrishna Sripada wrote:
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
> v2:
>  - Dg2, mtl xcs offsets slightly vary. Use a separate offsets array(Bala)
>  - Drop unused registers in mtl rcs offsets.(Bala)
>  - Add missing nop in xcs offsets(Bala)
> 
> Bspec: 46261, 46260, 45585
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 82 ++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 070cec4ff8a4..a2247d39bdb7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -264,6 +264,39 @@ static const u8 dg2_xcs_offsets[] = {
>  	END
>  };
>  
> +static const u8 mtl_xcs_offsets[] = {
> +	NOP(1),
> +	LRI(13, POSTED),
> +	REG16(0x244),
> +	REG(0x034),
> +	REG(0x030),
> +	REG(0x038),
> +	REG(0x03c),
> +	REG(0x168),
> +	REG(0x140),
> +	REG(0x110),
> +	REG(0x1c0),
> +	REG(0x1c4),
> +	REG(0x1c8),
> +	REG(0x180),
> +	REG16(0x2b4),
> +	NOP(1),

Shouldn't this be NOP(4)?


Matt

> +
> +	NOP(1),
> +	LRI(9, POSTED),
> +	REG16(0x3a8),
> +	REG16(0x28c),
> +	REG16(0x288),
> +	REG16(0x284),
> +	REG16(0x280),
> +	REG16(0x27c),
> +	REG16(0x278),
> +	REG16(0x274),
> +	REG16(0x270),
> +
> +	END
> +};
> +
>  static const u8 gen8_rcs_offsets[] = {
>  	NOP(1),
>  	LRI(14, POSTED),
> @@ -606,6 +639,47 @@ static const u8 dg2_rcs_offsets[] = {
>  	END
>  };
>  
> +static const u8 mtl_rcs_offsets[] = {
> +       NOP(1),
> +       LRI(13, POSTED),
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
> @@ -624,7 +698,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
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
> @@ -637,7 +713,9 @@ static const u8 *reg_offsets(const struct intel_engine_cs *engine)
>  		else
>  			return gen8_rcs_offsets;
>  	} else {
> -		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
> +		if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 70))
> +			return mtl_xcs_offsets;
> +		else if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 55))
>  			return dg2_xcs_offsets;
>  		else if (GRAPHICS_VER(engine->i915) >= 12)
>  			return gen12_xcs_offsets;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
