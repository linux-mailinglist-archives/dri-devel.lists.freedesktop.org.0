Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2F8755B5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 19:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37A810E801;
	Thu,  7 Mar 2024 18:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmPabiWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3805810E26D;
 Thu,  7 Mar 2024 18:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709834462; x=1741370462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RLPksxXuYdUA1Zgf/Z0iS+oCJMe3lwbP/HL83VzLrVM=;
 b=bmPabiWIXOcZwokD9irs9HM7+FMJpWO9soJ7qaFn5Hz+9Is0Fx6Wcmxd
 xeL4V0/yeSWHZZaCLTdVuubXdlRNIBx2kOCW0KxzWJ1l6J/1DAnPcbDXs
 GbD3leUz54fKAvnyKDVtVljKT5Wd47Iu/VtEeSn5mtdsb6T2FoOERs001
 FSprePOv8gDcQTlD1DKUVFWeLDAWJed5K1eX+x9ZZuVTRohPC3F860lV1
 6SagkCcjy7uuYRDVbzzYyxLps/Nu3JaSxx/8IVoXKV2NwrFhA1FxtLVcG
 QBuxDIFzAArhLuaIlQULiMKVoktxQHibOlAqtBvIndlGqQAfDhRUFUeVp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="21972889"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="21972889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 10:01:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10115476"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 10:00:59 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:00:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:00:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 10:00:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 10:00:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO3krLVQfb0uxxOieRTWxvDGTG+UAQi2Tlxw8UFGM3VN/6M40w9KiTCWMwOkojImxOUhOwSfEXXRT3rxR2tWRZlAr5cddGRQZ5/bHdCxeaQdN+FL9Q45qlx5DR3CWijDVdbAJutYHSuTbWW5tQpzBxsVJJ+fyQUBRiMCTG3dVWD/qYp+UxkgLYoh4RgwUz/yslM10rtYVORAoP4EOhjZHbwu6wGWn3NgylkFoPBd7OzSr1w8DEzJwlJVvc2LiO9qecHcUQbbkchvGijAHPk9DHFeCFovgy9LhIBPX9WQK0dXplIQkvfYlDZZAsGmSukStUPkAU0IMKnH6wFrotRT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kqpyg8mBHrbsEo+qLVozTt6b9sFdQDYeVWtv3TNmsto=;
 b=betZ4EZGN0XaOfQxU6fzU0sjsT2la3bo6WGu/M5Fz7T2a9nt3+YlT162Vj1BTcadNXHIPUuSEecKNdwR8LYoL2vGISQv0o/DsMuiGkOs0S+bsmCWTFJps0MaI/2dbtxWWKPxTUE97pdMFIZK0mxjDDNsJR6YiJ75dd0gxBJENL6/zoB+OeHOZUmp8/6SHZ+b13or6Of42i/MZdD3m9BNRZKYvehk3ehRVGbOeojC9hDo/foCb9FNCV0/II75x7Sx0yPIS3lJseItk2AINP38md5wLp8/80Qml5uwiua9lOrrfATme8gio/2Rm548wfwirG4Cg+OkJWvjSD2i11KbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 18:00:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 18:00:55 +0000
Date: Thu, 7 Mar 2024 12:00:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 16/22] drm/i915/hdcp: fix i915_hdcp_interface.h
 kernel-doc warnings
Message-ID: <zzy5t7ba3zrkobl5ofiaylben67sycohdpzl5fnh33g7sr3fvc@tmed3yqxd7tk>
References: <cover.1709749576.git.jani.nikula@intel.com>
 <bafcefd0cdfbfad86b15d80d63d66476de917fff.1709749576.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <bafcefd0cdfbfad86b15d80d63d66476de917fff.1709749576.git.jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR20CA0032.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf3fdaa-7430-4031-1d34-08dc3ed0890d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hFr7K4/Tnqpc0+a6mwQveopdU8Lp5P8qznTTI3jpYXoPUHyV4dkW5/juUZtx39XRpmr5cPpYShUMOQdW1en/469XGptdWSsUdXu/aQdxGDl2CKL/C9vM5MmWkV74dWJ+1fMaBUy0WDWAQgJmku4DanN+TrdfQFQTwrQy+xpqhsnHj9iOnYRci4V6saS2STqj05dYaDKG+CnS+Sw+HSo783GFQBs23g/nqrJv47DMo/vQnTdy/FQ9Z4vDRvVOFpGjK5EyOhMOQ09W36q4QZeU7qtvLBy4h8RGsL0HodjpOgLILLLYfvT0JKcx31koYQQYcz69h/cz7BO3a4saOfB/WqgbL0UsbCOzWnOZmal5/fTQ3jD0luyCzB1duPW8uyP02vKGBTqA4BewFvCwqSmmMonbdxTZQw3vqEI/mCIHfhxAdlSHSvKuBW4RObQn26VdKga7D2oEPtG2wLD5xuAP7aLHH7zXMmU1uSOPVy1SspSks/Nn81vh2zRvuzsBVZYUeZIb0MtJhJGUxse9hkBB6vD3KQ43nSzv14hnLu6spk62updFAO8EtXaRgIOnWi1pOZ3LjG7LtNYvNzqU41Mle3z2ZId9gsbHuQZK2Y57mcwAsbW1bwqU3ny7CgOFcAx5dEsDT+Gztxs/pWC1dU9edUk8vSxyzMA+xmlQwm0nt2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?78nUcbGU5hkqCcyWmY5ZizOrejQBeL6sEbTanl/BEQqEelHsbh5vKfduO4jy?=
 =?us-ascii?Q?RoVdvCuj0j39W81oKr0+84SgQizbFh+S/bQGdy8mgmV2aJ9W1PI1q5yC0K+d?=
 =?us-ascii?Q?YFyD2cT2owR8rEvkZSuLB5/PjLH1E2v8l+W8+XuWC0aYqegcJd6e7kyf0oMU?=
 =?us-ascii?Q?VdiUTEJSU+sQoaoBtqv/uCtialsXUYaYWOD6D0jg1BLoG/d/tdCOL4tig+Bd?=
 =?us-ascii?Q?96eBfnx8zc+NOwzOy+kF7m5yFNfpUUGlOVdwRN1dO+c3WGXAw3QpEaCweoTm?=
 =?us-ascii?Q?P7JtJLYhcVaMnGL0mcSwOte9oVn76Vsv3QzgurkQlTS8CSZbRsEIDidJSvfJ?=
 =?us-ascii?Q?m9pC3bWgdrfvCCzp/+gw79XkgH3K5ibQfvabokUgZ3NESW/ATTjAsgh5jcc6?=
 =?us-ascii?Q?XPHoUA29vjeqbKw2WqMCUCAFV5Ns6MjxT8cssT0/lLs3kDwb8eSTgonXQ9mJ?=
 =?us-ascii?Q?nxWMTvYcSvgpwU4B8WqsUjxdt61kJzEBYKgvS68TpYaMu2zJ+Uzj3B/YRdrJ?=
 =?us-ascii?Q?dATeVMLdlHJku9mU0Jl43QNCihOWkI+TMXclY4358wDbFLD29Qosg/OJIeIC?=
 =?us-ascii?Q?oYrpzEzKTw+ymE6uYnoNhSSThBVrT6vFFcVFijfp4SIiGuuySmBRW9D2VhjJ?=
 =?us-ascii?Q?7CPH+bezddlQ6Hvs57EOnq2Yp8QvyKAFnMnVg3FFVCLg21c4ZZ0M1TXZ811V?=
 =?us-ascii?Q?gVjxq9HtjxT6rp8P0Iqmn1LwW+OcKeTIwdC7CFIsbmYHGVzadJkApmKMHG1E?=
 =?us-ascii?Q?b/cEjbDBk8QUkvJJpEsGS0me/86LHKhrREtpe3MwPqIiu2FWltb3XIhzYpVF?=
 =?us-ascii?Q?pOv5edh+6f9ydFuog98JpF1BpSyHWM8x6B9uQqSU5KxqDOKxo2hYWB2Iz5RL?=
 =?us-ascii?Q?QhpWoUtvF0rjqfFLvxJoRbDMB+R4p4Cb1wZEkIW4qedl1aij35SNmkhCANp5?=
 =?us-ascii?Q?VGLND4M2ONyrFaEOkSFR0EeNmVvacFRZyHVWygY3Gw97tgBkNELGjUo2CERS?=
 =?us-ascii?Q?oVfKs/IreLRWYu/CRvPgQT1SmXTgSUU3/9wN2QICuxh6SijAA66BfDJVRE35?=
 =?us-ascii?Q?lCrgwlUDO29c+qQUHTfEnIe4m9J8PBVM5ZagyD2DZYiOhpbr3MlFD7BOhvKE?=
 =?us-ascii?Q?y+rbitDuubhHfqKWCtoeVxCkbbEzzRpxFALmmAf7Xpn+Jm1a5VfvwogbvIQv?=
 =?us-ascii?Q?CDLis6kwAOtCpoc51QN6zh2wuPP0Q07/aauI8dfaF6HXPOtWMmt+FmmAnMjh?=
 =?us-ascii?Q?CMg0o28yNZx0P0lNXkVcZCwRGZmzl/xIa25R9cLlnjJtMgj0bXS5fSZkBkvM?=
 =?us-ascii?Q?1xbRTpGr2N+bHQOrpvrE4wx9qYqJX9aIpVMJWCpyknksqfhs17myb7zMNzRo?=
 =?us-ascii?Q?5zWs7HJea2u9RQ2suHG4ldhLATtTKiQR32DAA2+ZeQ+Yvj4ixRSfa4xVHEkY?=
 =?us-ascii?Q?/VWHwqzG35BHgeB0DxgZnv+BVM4g9gjHS146sZsBgaIc9JuvZomTxx+rgxv8?=
 =?us-ascii?Q?N9+BQH2+wGYWEBye2Jue4+Iqe6H4qJT7Gij+7COZGfnfK6wpl4yHDkVij9ox?=
 =?us-ascii?Q?K18x66R2tx5L5IzPxSFPyXUsn6VTnpymYezhfhmSBIqizynZq36T33RrJP3/?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf3fdaa-7430-4031-1d34-08dc3ed0890d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 18:00:55.5024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmMTVapyk4gG8aG/dpV8J5VDYCGoWHxXO6G189oAqhtjz8E8P0eBy8z/AErBz9nDyabFQr972ZOfAQFbxbAlISBfDU6aktTLYm39h0oXbNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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

On Wed, Mar 06, 2024 at 08:31:21PM +0200, Jani Nikula wrote:
>Make the documentation match code.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> include/drm/i915_hdcp_interface.h | 18 +++++++++++++-----
> 1 file changed, 13 insertions(+), 5 deletions(-)
>
>diff --git a/include/drm/i915_hdcp_interface.h b/include/drm/i915_hdcp_interface.h
>index 4c9c8167c2d5..a9f2ee576de8 100644
>--- a/include/drm/i915_hdcp_interface.h
>+++ b/include/drm/i915_hdcp_interface.h
>@@ -54,7 +54,7 @@ enum hdcp_ddi {
> };
>
> /**
>- * enum hdcp_tc - ME/GSC Firmware defined index for transcoders
>+ * enum hdcp_transcoder - ME/GSC Firmware defined index for transcoders
>  * @HDCP_INVALID_TRANSCODER: Index for Invalid transcoder
>  * @HDCP_TRANSCODER_EDP: Index for EDP Transcoder
>  * @HDCP_TRANSCODER_DSI0: Index for DSI0 Transcoder
>@@ -106,7 +106,7 @@ struct hdcp_port_data {
>  *			    And Prepare AKE_Init.
>  * @verify_receiver_cert_prepare_km: Verify the Receiver Certificate
>  *				     AKE_Send_Cert and prepare
>-				     AKE_Stored_Km/AKE_No_Stored_Km
>+ *				     AKE_Stored_Km/AKE_No_Stored_Km
>  * @verify_hprime: Verify AKE_Send_H_prime
>  * @store_pairing_info: Store pairing info received
>  * @initiate_locality_check: Prepare LC_Init
>@@ -170,14 +170,22 @@ struct i915_hdcp_ops {
> /**
>  * struct i915_hdcp_arbiter - Used for communication between i915
>  * and hdcp drivers for the HDCP2.2 services
>- * @hdcp_dev: device that provide the HDCP2.2 service from MEI Bus.
>- * @hdcp_ops: Ops implemented by hdcp driver or intel_hdcp_gsc , used by i915 driver.

you are just moving what was already there, but may be a good
opportunity for small fixups?

>  */
> struct i915_hdcp_arbiter {
>+	/**
>+	 * @hdcp_dev: device that provide the HDCP2.2 service from MEI Bus.

				  ^provides


>+	 */
> 	struct device *hdcp_dev;
>+
>+	/**
>+	 * @ops: Ops implemented by hdcp driver or intel_hdcp_gsc , used by i915

extra space before ","


anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	 * driver.
>+	 */
> 	const struct i915_hdcp_ops *ops;
>
>-	/* To protect the above members. */
>+	/**
>+	 * @mutex: To protect the above members.
>+	 */
> 	struct mutex mutex;
> };
>
>-- 
>2.39.2
>
