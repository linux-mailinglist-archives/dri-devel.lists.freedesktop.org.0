Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F03FBDBC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 22:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB9089D3E;
	Mon, 30 Aug 2021 20:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F6289D3E;
 Mon, 30 Aug 2021 20:58:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="216501615"
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="216501615"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 13:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,364,1620716400"; d="scan'208";a="530658468"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Aug 2021 13:58:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 30 Aug 2021 13:58:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 30 Aug 2021 13:58:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 30 Aug 2021 13:58:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 30 Aug 2021 13:58:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhorU+ch+JdZZvGHOkpdYkBJnuz/RON3YsGQovIKsllxAxt73z1vuBiaysHSwvMT78X2dXA404mPvFeM7KKEIkziUnbpb8Ixab3aObFSnhlOmlCs0P6vq0XRnmQ2yTyJaa/e1w8urcmJVFXLSgbpNRFHuAmGSttrB416YVxl/HS+exGfU1/KEmAqNUi2vr5izNFAqSVOlFURCh3pTMjK9ZpHadpbem7Jp5BkoaPib1fUIAmAPO82SBcJKmEEV+6ntpvEbFM4BYah9LxF08kzAts7KpKuSGzTJNGEaiElSZ4Cy9G/quRlnnmavi4POBMPl6JBL55dNOHHAjldzb/IGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp+iBzyaM4/7WscjKUhx8NjIHMF9OK54H6yaDQMLvXM=;
 b=eV/N+BcL0JM8dZFsNcqd0x8Oe9uFv3jt26ZCsZmNek6/E//S33Ei+eAxdnGMzxilHhM2H7woTpj8WKm6fMlQCfbXR73efTsnpxtv+n5oBrqtj2RU5TfozCVVzhx1h+KsacjGAW7CWnnR1BGWztmFoaPCQ6csX46VoQapT/3cOJqZaldxZcJ6QLMQrUS2AYa5Q8d6ie8SzxIAyzJtkN7gSeOny7yxb6tGbK+9jPeI9Q8HzMVwAnNL8ssSBC3pjxAPJ4u8qJezqMtMyEjhoryvVJ6QrWgmOfEMcteG5P2d7d+jeef74VXwuXF6EdAs8at7GgBzm3ysgCAttplN/CAHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp+iBzyaM4/7WscjKUhx8NjIHMF9OK54H6yaDQMLvXM=;
 b=f49y/Go6p6yEbegMmASS562Asoyt1rBUcbQjPUoX1xA5ZxwD+6hOul0spBzlas/jD1JcuKe1Emfn5B6I0ywc+x7WarNngj9HWXvMyjsTY6kI1vXqi4nxMBQarH3HX41CkE662J2LAulnuo3kYIRg5JZgJ046fOQe7u7UXP0Z4jg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1706.namprd11.prod.outlook.com (2603:10b6:3:b::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17; Mon, 30 Aug 2021 20:58:47 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 20:58:46 +0000
Subject: Re: [PATCH v7 02/17] mei: pxp: export pavp client to me client bus
To: <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Vitaly Lubart
 <vitaly.lubart@intel.com>, Tomas Winkler <tomas.winkler@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-3-daniele.ceraolospurio@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <2cc0fd3a-7f75-9279-01f6-8002492a3be5@intel.com>
Date: Mon, 30 Aug 2021 13:58:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210828012738.317661-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:a03:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23 via Frontend
 Transport; Mon, 30 Aug 2021 20:58:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc0a2bd-9d0a-4cee-b04b-08d96bf8f589
X-MS-TrafficTypeDiagnostic: DM5PR11MB1706:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB1706F2079EF1162357768777F4CB9@DM5PR11MB1706.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BWZr9xm5EFZKLXD1cc8uKpSGXadVtMmnFq9CSQQRpG60A5wY78QncPU4DBT4eF2eNKFVHyBVzOxM2LGoyMf99SsoijTMNeAFmY/GV/UigzRD3Yaq/K+K6i3MjGcbVvxddcFmX5BCHe+11U8nPAYQBVJF8RsGwwZTEomQSs7hC1dpQ/On/jDaNlrIPMbCjvEYsI5zG4grF6wAj+bYYqBE7XPTVE88/NcsVUJTRso8jEexofp5sIc/Q4Gtl2j2K1FlCWdWWqoKFRNsDWuYA1mG2p/fcrwtdktxyORhiLZbmE5gv2T+McvP0HXm3YnufycMqozCiyyG2IWKDaijsGi4cAp+oy4doa3ltQWF91DkBBdaGEUJ+oFaSAS5KDmZPTXoa4vyeJHfBrvc3M5Pa+QY2AHyDKEfwJm1ECo5vq38fs7mZtEO1dt5/SL3pye9nbw8OTSof/6D4BOg/D2LrtI4KwVd/2bl0aAi9BEmxIwCVTUe2A0+iPCIjWSchl5lY5sDQSd9vCy/hwgCLjU1S+dTzDjh64aDZj+4qtyzrdlWrFxWmuTx7sm9PW3ehnbklil6qeu/7pKO+/qIn0bY1/CcLXLgoUvOVqTjoqXBjLAktUfxSshYvNpidBm1TpsQAow8hheALPZzGRvm1/I6JvAhCHkR3SEYsnH/GnckstNJemhx4tXpBRpJ3m1G5RfWg8bT1nFsSDl4Wui+/aCFQBNmaX0SUwyVEsfPCb4ti+MjNBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(107886003)(8676002)(54906003)(66476007)(2906002)(66946007)(31686004)(6486002)(66556008)(6916009)(86362001)(186003)(36756003)(6666004)(38100700002)(316002)(450100002)(83380400001)(16576012)(31696002)(956004)(478600001)(8936002)(2616005)(53546011)(5660300002)(26005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWlrbEROVTc1bTVQZG05OVh0ajJLN0dFa0FaVGpiRUk1UXJ4SXh5Y0RiNEhI?=
 =?utf-8?B?WitzbVhya0ZMSG5lMjhva3lMejBwUndNVGl5WXhDYkwyc0ZDcWVZRFp0NkFk?=
 =?utf-8?B?SzY5aGVyZ0F4VTQvWGNiS1RzVkxsMU4xbVZUZFgzazIvOUVNc2VPNGo4dE9I?=
 =?utf-8?B?anN1ZFA1MjVOeDlPaWdTWk1NSG9SYlNRVENqWXlvZnRianNMcVphRDhKaDFw?=
 =?utf-8?B?KzBCZGNEdjNid284b2lDQzFWd1JtVEEyUEtZTEtxWFdhdHNUNFYxS3FDbFZI?=
 =?utf-8?B?SXVwT1kzWityZmcwdXJwK0lvUWxlc2NyV2Z1Zk9jblhiVXRGVjc1ajJqZ3RI?=
 =?utf-8?B?RHZTYXFnd0hHYW1tMHhRRG5aK3kwSllzRjVTSWN4NUk0NjZlQXh0TlI5akhO?=
 =?utf-8?B?QnlSZVYrSHlTeUlBV3B2RHZ5K1NuamxQMGx6NlU5YktPVUFFRkJxV29hUmJY?=
 =?utf-8?B?RWVOa1FsdWFXUTl6WEJkNzFtTklwcjd1NHRSVTY5cThiK1Q3cTl0dWxWZlZp?=
 =?utf-8?B?U2Rud21tWE1FQXFtSzJYQUU2U1haMXFrc0p2TldzS1ZWa25NNXdBTlRraldY?=
 =?utf-8?B?TTVRMnFxQ29EV1dELzZYemt2ai9tUWI1S0syajBYU05lOXhRUGlpRHArdk1F?=
 =?utf-8?B?emxyOStOdThvSVdwbW1sbWVVQVoxaDg1UlQvVEpLSDAyQzF4VDVLWGNnbkxa?=
 =?utf-8?B?RUtpQjRHeTYxRFpPdG55U0VvaS9XRFVMWUNHVkhDK2ZYUUgrcG5JZWd2UlB0?=
 =?utf-8?B?OXErVGRJOHRrQzZlOTBhSTJFSmJUNTZFRDlvb0lrNHZubWdGTy9INFlGNjNq?=
 =?utf-8?B?NWJqUWk3QTBEYkRqNmJUSFhGWGFlQS8wdGxlN1VVcm5MWGM2UVVKZEowbTdk?=
 =?utf-8?B?TWNpNXVBc1NjaFFFWFBXWllQMlJHcVJ3YklNMHBKRDIwMUdwKzJ0akFUZWs4?=
 =?utf-8?B?cnhUK3ZIQk55WGdKWS85WHJ4MFUzbVBMUk02dCsvME13VHlmWnQxV3VROCsr?=
 =?utf-8?B?T0oreGEvTHBHWGxWbkdyVThZN01DZVhpOWFoVGZOODhRQXhUNy9ITGVraDQ3?=
 =?utf-8?B?N0JrenRhU3Nvcnk0OG1JeDF0K3FLLzhaVVVFcmZsaHJIdzVrQ1pqYkQ5LzJ2?=
 =?utf-8?B?UEw2SVRiWDhKWUVhQldueDRZSGxEZXhhak0rbmlMeWVjU3V6dlZNd2ZsMW8z?=
 =?utf-8?B?WjdLRUxnakRYTFhCbVArbDM3VlV6Vm9ta0pua1QzSGQ4bnhtR0R5am5XMzJi?=
 =?utf-8?B?RkhZQ2JSOHE0QzJIWUllU3hzKzg4UFVUeHovVWxJVzM0RXBDRkZJTEI4ci9o?=
 =?utf-8?B?aWZxNGR4TVZFbksvNVh6M2RybWliMWVtMU8zZGZnVFNSazR5OFl5L2t4R1d0?=
 =?utf-8?B?d1JOcEJMeEtYQWRuVEplejNLY1puY0FKSWc1U0xxSmNUc3Z0cUU5Tk9sZHoy?=
 =?utf-8?B?WVRsd0JjWXRZVnVGdTROc0ZJSzZHZkdBZS95RGNnWEViYmc0ZGxwcTBzY3RK?=
 =?utf-8?B?anYvQVg3WkNma2plaUluakN2bktkTnBPS2hQMlFXMURMQXA0a2o4REtTcG5J?=
 =?utf-8?B?MEhGRVRkUCtCang0cXBuYno4cEJya1dkcy91MlFDZTVxVXY2WXRnTUROL1BG?=
 =?utf-8?B?MUxSWGFpSldmcHhqczc3Z3BGQjdzSGYrR2RqY3RpUTEyTFk1dW5RNG1pa1hv?=
 =?utf-8?B?dE9WcFZvZnppcFF5bmVhcnFUSTZHMUVQL1dnazN1NnU0cGZqZXNZRW9sUXIz?=
 =?utf-8?Q?rlvTwUek1761E2jc5r4bjrRstsD1P1Ee8V7RXNN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc0a2bd-9d0a-4cee-b04b-08d96bf8f589
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 20:58:46.6243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBNx21prm9HT3UoTVan8OnscX4AWez2Iput0kqoOmU9WhIcLpiCeNZJ/g41zyVYRmzwydw/d4JLWnOGJ8ir3jw9x1O7KPyBWFgffAtrSJU4=
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



On 8/27/2021 6:27 PM, Daniele Ceraolo Spurio wrote:
> From: Vitaly Lubart <vitaly.lubart@intel.com>
>
> Export PAVP client to work with i915 driver,
> for binding it uses kernel component framework.
>
> v2:drop debug prints, refactor match code to match mei_hdcp (Tomas)
>
> Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v1

I forgot to remove the "#v1" before sending; Rodrigo did say his review 
stands on the last series and the patch has not changed.

Daniele

> ---
>   drivers/misc/mei/Kconfig       |   2 +
>   drivers/misc/mei/Makefile      |   1 +
>   drivers/misc/mei/pxp/Kconfig   |  13 ++
>   drivers/misc/mei/pxp/Makefile  |   7 +
>   drivers/misc/mei/pxp/mei_pxp.c | 229 +++++++++++++++++++++++++++++++++
>   drivers/misc/mei/pxp/mei_pxp.h |  18 +++
>   6 files changed, 270 insertions(+)
>   create mode 100644 drivers/misc/mei/pxp/Kconfig
>   create mode 100644 drivers/misc/mei/pxp/Makefile
>   create mode 100644 drivers/misc/mei/pxp/mei_pxp.c
>   create mode 100644 drivers/misc/mei/pxp/mei_pxp.h
>
> diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
> index f5fd5b786607..0e0bcd0da852 100644
> --- a/drivers/misc/mei/Kconfig
> +++ b/drivers/misc/mei/Kconfig
> @@ -47,3 +47,5 @@ config INTEL_MEI_TXE
>   	  Intel Bay Trail
>   
>   source "drivers/misc/mei/hdcp/Kconfig"
> +source "drivers/misc/mei/pxp/Kconfig"
> +
> diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
> index f1c76f7ee804..d8e5165917f2 100644
> --- a/drivers/misc/mei/Makefile
> +++ b/drivers/misc/mei/Makefile
> @@ -26,3 +26,4 @@ mei-$(CONFIG_EVENT_TRACING) += mei-trace.o
>   CFLAGS_mei-trace.o = -I$(src)
>   
>   obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
> +obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
> diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
> new file mode 100644
> index 000000000000..4029b96afc04
> --- /dev/null
> +++ b/drivers/misc/mei/pxp/Kconfig
> @@ -0,0 +1,13 @@
> +
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2020, Intel Corporation. All rights reserved.
> +#
> +config INTEL_MEI_PXP
> +	tristate "Intel PXP services of ME Interface"
> +	select INTEL_MEI_ME
> +	depends on DRM_I915
> +	help
> +	  MEI Support for PXP Services on Intel platforms.
> +
> +	  Enables the ME FW services required for PXP support through
> +	  I915 display driver of Intel.
> diff --git a/drivers/misc/mei/pxp/Makefile b/drivers/misc/mei/pxp/Makefile
> new file mode 100644
> index 000000000000..0329950d5794
> --- /dev/null
> +++ b/drivers/misc/mei/pxp/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (c) 2020, Intel Corporation. All rights reserved.
> +#
> +# Makefile - PXP client driver for Intel MEI Bus Driver.
> +
> +obj-$(CONFIG_INTEL_MEI_PXP) += mei_pxp.o
> diff --git a/drivers/misc/mei/pxp/mei_pxp.c b/drivers/misc/mei/pxp/mei_pxp.c
> new file mode 100644
> index 000000000000..f7380d387bab
> --- /dev/null
> +++ b/drivers/misc/mei/pxp/mei_pxp.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2020 - 2021 Intel Corporation
> + */
> +
> +/**
> + * DOC: MEI_PXP Client Driver
> + *
> + * The mei_pxp driver acts as a translation layer between PXP
> + * protocol  implementer (I915) and ME FW by translating PXP
> + * negotiation messages to ME FW command payloads and vice versa.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/uuid.h>
> +#include <linux/mei_cl_bus.h>
> +#include <linux/component.h>
> +#include <drm/drm_connector.h>
> +#include <drm/i915_component.h>
> +#include <drm/i915_pxp_tee_interface.h>
> +
> +#include "mei_pxp.h"
> +
> +/**
> + * mei_pxp_send_message() - Sends a PXP message to ME FW.
> + * @dev: device corresponding to the mei_cl_device
> + * @message: a message buffer to send
> + * @size: size of the message
> + * Return: 0 on Success, <0 on Failure
> + */
> +static int
> +mei_pxp_send_message(struct device *dev, const void *message, size_t size)
> +{
> +	struct mei_cl_device *cldev;
> +	ssize_t byte;
> +
> +	if (!dev || !message)
> +		return -EINVAL;
> +
> +	cldev = to_mei_cl_device(dev);
> +
> +	/* temporary drop const qualifier till the API is fixed */
> +	byte = mei_cldev_send(cldev, (u8 *)message, size);
> +	if (byte < 0) {
> +		dev_dbg(dev, "mei_cldev_send failed. %zd\n", byte);
> +		return byte;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * mei_pxp_receive_message() - Receives a PXP message from ME FW.
> + * @dev: device corresponding to the mei_cl_device
> + * @buffer: a message buffer to contain the received message
> + * @size: size of the buffer
> + * Return: bytes sent on Success, <0 on Failure
> + */
> +static int
> +mei_pxp_receive_message(struct device *dev, void *buffer, size_t size)
> +{
> +	struct mei_cl_device *cldev;
> +	ssize_t byte;
> +
> +	if (!dev || !buffer)
> +		return -EINVAL;
> +
> +	cldev = to_mei_cl_device(dev);
> +
> +	byte = mei_cldev_recv(cldev, buffer, size);
> +	if (byte < 0) {
> +		dev_dbg(dev, "mei_cldev_recv failed. %zd\n", byte);
> +		return byte;
> +	}
> +
> +	return byte;
> +}
> +
> +static const struct i915_pxp_component_ops mei_pxp_ops = {
> +	.owner = THIS_MODULE,
> +	.send = mei_pxp_send_message,
> +	.recv = mei_pxp_receive_message,
> +};
> +
> +static int mei_component_master_bind(struct device *dev)
> +{
> +	struct mei_cl_device *cldev = to_mei_cl_device(dev);
> +	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
> +	int ret;
> +
> +	comp_master->ops = &mei_pxp_ops;
> +	comp_master->tee_dev = dev;
> +	ret = component_bind_all(dev, comp_master);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void mei_component_master_unbind(struct device *dev)
> +{
> +	struct mei_cl_device *cldev = to_mei_cl_device(dev);
> +	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
> +
> +	component_unbind_all(dev, comp_master);
> +}
> +
> +static const struct component_master_ops mei_component_master_ops = {
> +	.bind = mei_component_master_bind,
> +	.unbind = mei_component_master_unbind,
> +};
> +
> +/**
> + * mei_pxp_component_match - compare function for matching mei pxp.
> + *
> + *    The function checks if the driver is i915, the subcomponent is PXP
> + *    and the grand parent of pxp and the parent of i915 are the same
> + *    PCH device.
> + *
> + * @dev: master device
> + * @subcomponent: subcomponent to match (I915_COMPONENT_PXP)
> + * @data: compare data (mei pxp device)
> + *
> + * Return:
> + * * 1 - if components match
> + * * 0 - otherwise
> + */
> +static int mei_pxp_component_match(struct device *dev, int subcomponent,
> +				   void *data)
> +{
> +	struct device *base = data;
> +
> +	if (strcmp(dev->driver->name, "i915") ||
> +	    subcomponent != I915_COMPONENT_PXP)
> +		return 0;
> +
> +	base = base->parent;
> +	if (!base)
> +		return 0;
> +
> +	base = base->parent;
> +	dev = dev->parent;
> +
> +	return (base && dev && dev == base);
> +}
> +
> +static int mei_pxp_probe(struct mei_cl_device *cldev,
> +			 const struct mei_cl_device_id *id)
> +{
> +	struct i915_pxp_component *comp_master;
> +	struct component_match *master_match;
> +	int ret;
> +
> +	ret = mei_cldev_enable(cldev);
> +	if (ret < 0) {
> +		dev_err(&cldev->dev, "mei_cldev_enable Failed. %d\n", ret);
> +		goto enable_err_exit;
> +	}
> +
> +	comp_master = kzalloc(sizeof(*comp_master), GFP_KERNEL);
> +	if (!comp_master) {
> +		ret = -ENOMEM;
> +		goto err_exit;
> +	}
> +
> +	master_match = NULL;
> +	component_match_add_typed(&cldev->dev, &master_match,
> +				  mei_pxp_component_match, &cldev->dev);
> +	if (IS_ERR_OR_NULL(master_match)) {
> +		ret = -ENOMEM;
> +		goto err_exit;
> +	}
> +
> +	mei_cldev_set_drvdata(cldev, comp_master);
> +	ret = component_master_add_with_match(&cldev->dev,
> +					      &mei_component_master_ops,
> +					      master_match);
> +	if (ret < 0) {
> +		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
> +		goto err_exit;
> +	}
> +
> +	return 0;
> +
> +err_exit:
> +	mei_cldev_set_drvdata(cldev, NULL);
> +	kfree(comp_master);
> +	mei_cldev_disable(cldev);
> +enable_err_exit:
> +	return ret;
> +}
> +
> +static void mei_pxp_remove(struct mei_cl_device *cldev)
> +{
> +	struct i915_pxp_component *comp_master = mei_cldev_get_drvdata(cldev);
> +	int ret;
> +
> +	component_master_del(&cldev->dev, &mei_component_master_ops);
> +	kfree(comp_master);
> +	mei_cldev_set_drvdata(cldev, NULL);
> +
> +	ret = mei_cldev_disable(cldev);
> +	if (ret)
> +		dev_warn(&cldev->dev, "mei_cldev_disable() failed\n");
> +}
> +
> +/* fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1 : PAVP GUID*/
> +#define MEI_GUID_PXP GUID_INIT(0xfbf6fcf1, 0x96cf, 0x4e2e, 0xA6, \
> +			       0xa6, 0x1b, 0xab, 0x8c, 0xbe, 0x36, 0xb1)
> +
> +static struct mei_cl_device_id mei_pxp_tbl[] = {
> +	{ .uuid = MEI_GUID_PXP, .version = MEI_CL_VERSION_ANY },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(mei, mei_pxp_tbl);
> +
> +static struct mei_cl_driver mei_pxp_driver = {
> +	.id_table = mei_pxp_tbl,
> +	.name = KBUILD_MODNAME,
> +	.probe = mei_pxp_probe,
> +	.remove	= mei_pxp_remove,
> +};
> +
> +module_mei_cl_driver(mei_pxp_driver);
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MEI PXP");
> diff --git a/drivers/misc/mei/pxp/mei_pxp.h b/drivers/misc/mei/pxp/mei_pxp.h
> new file mode 100644
> index 000000000000..e7b15373fefd
> --- /dev/null
> +++ b/drivers/misc/mei/pxp/mei_pxp.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2020 Intel Corporation
> + *
> + * Authors:
> + * Vitaly Lubart <vitaly.lubart@intel.com>
> + */
> +
> +#ifndef __MEI_PXP_H__
> +#define __MEI_PXP_H__
> +
> +/* me_pxp_status: Enumeration of all PXP Status Codes */
> +enum me_pxp_status {
> +	ME_PXP_STATUS_SUCCESS			= 0x0000,
> +
> +};
> +
> +#endif /* __MEI_PXP_H__ */

