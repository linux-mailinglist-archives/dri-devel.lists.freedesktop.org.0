Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E07A8755BD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 19:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C92210EF8A;
	Thu,  7 Mar 2024 18:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j56XHLo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEE010EDAA;
 Thu,  7 Mar 2024 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709834572; x=1741370572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qXgXp7JOtQUU2ZRPAIFhpBFjKvhbBYKL/hP6UNWcUjI=;
 b=j56XHLo3TYhnjxUy3p4ozQIOfqI3ebu9ipKDuhLAT+b8jLBVB4A2t+S2
 qiAVr+sL4xy0VpnimxYuE8lzkZ26kdQZcgXhdPMP/AaB3VSWze1Z3lyeQ
 7dIDvMGJgIN0syreDhziYsUvgCrVSQSvTuAOUAExvue4OoPNhsVXy63JL
 O5Po9Kzl0oc6u6KNqhGhCl2WRqJsofxT9GogH/6ACJS6jLCOsTAI8PWkJ
 v4ZrdGpj4ACgmBiqCjV13zrXK4fURut7k220472QgBFeXFbBYk1SRu2kU
 NVxDkHD18UnOcP9wdHkyj0dgpqLpoyg7kk57FbSYUtkvTu3PrMjFTaIhn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8281790"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="8281790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 10:02:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10259947"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 10:02:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:02:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:02:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 10:02:40 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 10:02:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVlbjcpKu77KzkS9zcX2bTwUyrAUiE/RO816oMPc8qKYAxV6kimV4zSGf5BjKugs3XDBrwKcohHSNho5m87XEy+R20XPkUu2Rf/9Grl9dU01tw5d+j5L9w7S44zgUNmFu+mMttQc+Bc5ovczbW7k2gsdYELIltVIChf/HN9MWh7ys2wpyXjKEE9+muztOvSBSSuqcD89HoFKOOuRXL2PFySUpro7FN/VkNfqG1dk4otl8o3PW7wrddNV9YpQBeSx7ltbixZM+ZNcSpLe9tExkK5bkqPndPWZ7CGSZY7K2wa6QdFRUozpreF+j2FbgSfI2TFmGJJnDPHS/9hRdqy8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oF3xVygz1sqzOFwAvgOOcGYVxzxTBEDGrHLXQ63D/BE=;
 b=hSj8mi2hLOPh4jpKf5C9ZYCzz1tfypcYe14zrHJU+IklxZHCf39/nPtZ04t7Wl62XgAGEC28K4I2GCnFxUCLymNUY7f0pqK1WwMtzSmr5A8Jz1D+xFGvjyRZ7HHWZoXb8wdCykPAyPFggm0Gt479LhU5QIxBSKqbHSr5Oh4A2bSgdsWHQ6TBIDDcqV0g5mmmC1G33e8+O0gs7xlZX8P37Irgn3+wQMxwHaUFJNaG+an+LcSFE9HarQ/q5wRYkF3aOowpm95iSNYN3/ntsnHV+DSm3Oe04JgiB3ejH8/JuJgBdxl0TKcHP8dJCzaaeoOEqXQmK7KOMxLtoZyS0J3QXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 18:02:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 18:02:35 +0000
Date: Thu, 7 Mar 2024 12:02:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 17/22] drm/i915/pxp: fix i915_pxp_tee_interface.h
 kernel-doc warnings
Message-ID: <xrotgqvs3n2zuifbhnjhhnylbn7nuo4isjorsscyyt7bpyiice@wnisn6x2jbrb>
References: <cover.1709749576.git.jani.nikula@intel.com>
 <f39bd169d27483aca7bed07929b87869bf8927fe.1709749576.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <f39bd169d27483aca7bed07929b87869bf8927fe.1709749576.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ecd759-ec4b-4aad-5891-08dc3ed0c45f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7SvSB1OVzRYcF+HSV04gUwsP1cncHOupPGO3dTgvogiHm5OUSWqxl4TGGipvX6MQ3kd62BFmhXnUK7bIDlMdF6+5sGaAqfOlPsOyTtXl0s0WCyXByFzEZZXHWKbIqa1iKPz+QoGic2J6HwiuISrHQ5ilkCSqmu2wsK5u4OXDhISvIc4DJCaqU+IjXUqhNjclzdzgTU+CsjzgjS4n8w5g3ShYEA28oVgvk/IKubTa1zfHWvyP7QrtlbI10VtfYjjYtX6mx1bTSuDhG+2K6G37fQpZywgYdDt3FYZ1sMreyxjHAgJIU83Nn8Exn+jV/MZOIusYDlIwJK+aKAIKCjScaAtCu8o5+CVwDIfTVVKtm1x4QfR8lok+jVewo4idHtBYz1U4Kf62BCqmmQhu22sN2eki9sm9rZ2Ouh/C91o28ygRxDcgMWrw1+lgyFfBc7b++OOfyM1eOwsaks2XdrAraldsecFOddV9zPT7+wo1kFZHqh7OEHnjMxxA1HR4MKkWHf5bw+JvxXI/1f0Lh18DdJuH5EBd0dRyR2a6EgbHw8cL/n6lN4WgvWJaS8ZzSoVZZrpctW9RGvXY41iNWEKzpVqjFss33m8kM4MIrOGiyOskdKWNGMliM2MYCeZ4lLQKou9XA+CjR/kJWP7aJr+kKvz+MNpw0zRBo+Tq/R/+Cw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IA/5s/9uS50MhHvav6nJ89eFncZVIL2lbhXRGApqMD/4A5wiIGaBVa62xvSB?=
 =?us-ascii?Q?qOQFl+RXz0VQ4+O0TzPA4hk6B6RmfSqbSE4KMRqcxqhBUChLvH0Qwf6/dGQc?=
 =?us-ascii?Q?ucUCtBqw2WLLGsZLqBdDAG18WYZsYvKdt+mkvDWZtC7bdtbsdw/wK7Xa48bw?=
 =?us-ascii?Q?mGYkQpKB+fJ00cgbccBponIXXjt+h83ReupSKCn9q3b0hjPDGPMiWiOjDbnC?=
 =?us-ascii?Q?TeJj+i/TZ00vw0T08g7LPD99TX+RW6pxgwbTvPlPnxICQaWrOrvRaDRUmrNs?=
 =?us-ascii?Q?oVVyodSfcbGMZ/o94kCAiK1k9d6Jh+0uMPpaclIdZUyWU0d1Ss2SjWTCcVL1?=
 =?us-ascii?Q?DDWCYRN2Nop53JW02YL6KeBfw0nKmSbA7G1CJrWhHRer2aq3YrZxrAiocEjh?=
 =?us-ascii?Q?SaT+ycWuh4sLl+kl3xeVql6KooJcXtK+lK+E7zQiIbzpcHUNo53rMQvKC9UQ?=
 =?us-ascii?Q?w98xme1F2t1C0XHtn1pikcWzGYYBKf65JBTf4qWlnzxKWy/t6T7AN7MtVbGj?=
 =?us-ascii?Q?djV2Fhm6g/7mvT0z7JYeb1V4hQzt3OzBLWjLmAeJ6eGjgUpOm4xKaoF00LHE?=
 =?us-ascii?Q?/dBDezMS0b1XiEsR3DLhpojoHcASyxu5AfRbjYvsdiep6eIKWozDCcX6oiG+?=
 =?us-ascii?Q?X8Luuiu+K/RsiwLZVU/YIJxroxS2U6ljM8rR+uYQuk1I7+/SBUuS6uxf0oz2?=
 =?us-ascii?Q?1i283Q9Msm53QbT/sz/tDmqJh1LDKa5X4n/Iezu9pbmRjhNIc1g7LDPvpeOJ?=
 =?us-ascii?Q?dXtUowwREKlo9j3tSqVahp0QgXft6wZEFnwggQj629FMDH5ULiL0MNEbNkrw?=
 =?us-ascii?Q?OPCslnLjBHvxKKO+bih8duzA70NE7h4LhzgbUkGkZCAxGKhvtPda9I/BGTmY?=
 =?us-ascii?Q?OTHJleGHtGpaG3YkDmnZt0TTLn76GgMiJXzoxqZS2t+jHr9kEcb7wWz/hotg?=
 =?us-ascii?Q?wXjjnIp7m6Q6qmd0XGoGbhejnmbEt1vuCXPnz8pHZ4516aRyiynN0BHr4sSj?=
 =?us-ascii?Q?7P20zySdSs5jBTQv1IA75MaZHdM1fFmF++B/hTdYNeo/Np+Ll7WWtkuW/hSn?=
 =?us-ascii?Q?ElHUkLBTm4q2FdXOW8+ZK+vJbhF0EUujUaV9Ga2L5vz/CdgGwYrNKf5cYSta?=
 =?us-ascii?Q?6TjEXTWgOixEoTF/blmrn07zz0tgppBpzIinlcxTZK+vl3lu3QMwpmmBmbYM?=
 =?us-ascii?Q?VgBcC4HyoZ1EB6UUMQ6efsLEy0VFYPSwy7GqgUJTEvGyhyhl4BBClz+kXPl+?=
 =?us-ascii?Q?zbi9CFeIl5VQnIhQ87bCsjTt3Kw3hr3dETYwiosdvaVsqQ7XCBmNqHMiR8Sq?=
 =?us-ascii?Q?B7mj4f6QIZPOne5sqChK8BtEJQN5nvNXjKBRdv25nsxg22mtdGMZ0vKN8EH3?=
 =?us-ascii?Q?qhGE5S0l03rFyF21ecJZOZPqGTuRfYMuaUIiW4bycKr7iw9CJ3XLOwOxuFqd?=
 =?us-ascii?Q?qSrVUPBMD/38Hx1gyVF9qIUWj8o6Pw1Gw+eStmeFdCQ6JMkK6wMn6LIJKFhc?=
 =?us-ascii?Q?l+sY2fy4bCrhKmw0ZWAspceiO77kZAJQiBBvFcsabEHhqo3kYffB1xLMfMbG?=
 =?us-ascii?Q?abz4uimjSZRGRZ1yciIwTFrYGjE7hfTB6oSCcXo+wLhnaQ9n/kArdqsxTs4u?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ecd759-ec4b-4aad-5891-08dc3ed0c45f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 18:02:35.0041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RvyG8EH0Z6e3amGyUZTytZrR5wemFHomFqj2gS5bW7nNAkw7ek9LBWRpduvh/dx6jQMikDNT6v303td5ZLqHZX92x5og1N58o1p7gkFINk=
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

On Wed, Mar 06, 2024 at 08:31:22PM +0200, Jani Nikula wrote:
>Make documentation match code.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> include/drm/i915_pxp_tee_interface.h | 19 ++++++++++++-------
> 1 file changed, 12 insertions(+), 7 deletions(-)
>
>diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
>index 7d96985f2d05..653e85d6e32b 100644
>--- a/include/drm/i915_pxp_tee_interface.h
>+++ b/include/drm/i915_pxp_tee_interface.h
>@@ -14,12 +14,10 @@ struct scatterlist;
>  * struct i915_pxp_component_ops - ops for PXP services.
>  * @owner: Module providing the ops
>  * @send: sends data to PXP
>- * @receive: receives data from PXP
>+ * @recv: receives data from PXP
>+ * @gsc_command: send gsc command
>  */
> struct i915_pxp_component_ops {
>-	/**
>-	 * @owner: owner of the module provding the ops
>-	 */


isn't the other way around the more common one? i.e. document the
struct members closer to their declaration.

> 	struct module *owner;
>
> 	int (*send)(struct device *dev, const void *message, size_t size,
>@@ -35,14 +33,21 @@ struct i915_pxp_component_ops {
> /**
>  * struct i915_pxp_component - Used for communication between i915 and TEE
>  * drivers for the PXP services
>- * @tee_dev: device that provide the PXP service from TEE Bus.
>- * @pxp_ops: Ops implemented by TEE driver, used by i915 driver.
>  */

... which you follow here.


Lucas De Marchi

> struct i915_pxp_component {
>+	/**
>+	 * @tee_dev: device that provide the PXP service from TEE Bus.
>+	 */
> 	struct device *tee_dev;
>+
>+	/**
>+	 * @ops: Ops implemented by TEE driver, used by i915 driver.
>+	 */
> 	const struct i915_pxp_component_ops *ops;
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
