Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D40CBD303
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D554D10E240;
	Mon, 15 Dec 2025 09:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3Dw0GoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0FE10E232;
 Mon, 15 Dec 2025 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765791406; x=1797327406;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q/Uizx5faeJ9/b2es0uuodTw298HWhfNgSerOaxM0U0=;
 b=H3Dw0GoCdvCVk4LKaWib+x5ShTV8Rn9pBy2244OA8KZXE0zsAZU4Nvf/
 XQG4YRsr2Sqqk04eiOsYbU3dqbQcIJt5wYsZgDv6s08+iIIMtPPorI1ch
 K516gtGgHrBKFfB68CYI+Mgu0NSSSlxh5wNxZyGkTG6jV1DRBuq0VM/XM
 nanyNwkCAye7fuIJTjm6YipMQz8qQiGiqc7iXVhvwgbNReh1MJP6F5DTk
 KTIA0CVjUxYHuM/MnHnpz/uIpeYmwfP1vnH9eKBQ3ivynE9c7th2xmRpf
 sarHQWecUr3+Um1rrKFk6OiS7WysGqK6P37hI5kuLLelRRAA6uiEN1JMn A==;
X-CSE-ConnectionGUID: GAHR7lMrTl+UZH3fXFPCKg==
X-CSE-MsgGUID: 83LHlF5eSRGtBKGRam0Zkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="71317086"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="71317086"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:36:43 -0800
X-CSE-ConnectionGUID: ZXQa3Bd0QX6HixJZp+Sy0g==
X-CSE-MsgGUID: Zlb8ilh8SAOgY859tAlueQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="198512449"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 01:36:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 01:36:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 01:36:41 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 01:36:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTmhCWDV66/E9R26P45dBGum8N9bpi3DIAcmjCTuouf8pTtj0S5DrguGs0KxY3gRRYYNzfSd8zV6u9PENecN/MvB2bZXEJ1+oNF8GUT2wYPYJA33ci9NdjViQlU//8XMoXfP8yTbZpbuc6P43jmzAQSq+iVTTIeN04EM+y8QHVVmtq5ET7/pBGbDM+zPQshy3RIgsKAac6Bq/XgQZnKg95X74v2jX/T6DDV8drjcEO5dGyfbGELP2LsRu0WSkKB6Kp7LkfTcKn0Lkv+shrC/zJU+R3xiqCU1xngKRjRoAdJ0Kspad3kOHAh95kEp9dSMLXeThC00EGeZ6RNYyAfBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDRGPzTds115W4zDIxLhsRZNAxHF/8pA9JD1fMJ7sJ4=;
 b=uacChKa/jCkTC/KrvAh1/at1pU/FPyzmCnSSp5U4cFBm7tlVGA1h6lAifxz9Wt4ubTvNkzoKHbXIYA+VVPL2dTvUmgGSa/dQYFG0CJ/W2NmPSX564ZFAPKGTvroGB/llS0ZkNAleyo9Kjc73Wo2mbd7m3OMm0MOzJxcMQFdSu2f2yqyUU9xLXcR+HotUqt2ph3Cn7f2fJhdEF/rS84ADHdQ8S0Tm4zLSy8ckWmBbH1LHZnjIXmbdibTPYVzeXPKsR7GXNgFEBHnYifegPWEf00k1RVZeNKJent0QCRDjAET74VoHX5/gBviHIuPA+FYv1dRh4UVrrDnUKcly/XaLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:36:39 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 09:36:39 +0000
Date: Mon, 15 Dec 2025 10:36:31 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/gem: fix build for mm_get_unmapped_area() call after
 backmerge
Message-ID: <aT_Wn63528lO8fOu@fdugast-desk>
References: <20251215092706.3218018-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251215092706.3218018-1-jani.nikula@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:10:110::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a27fee-4500-4e91-7c64-08de3bbd72a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?llqcR6pc5pa+uZRtUelySfz8ZMCp07k1/CJ4AHNimriflczvVkY5oo/NcpOk?=
 =?us-ascii?Q?tXnstoDrFnyK4VdEnu7LGgX74/N77PJ80iFkEKnEX/SF1lieG3370Y6S99IH?=
 =?us-ascii?Q?pLNaX5fAh2QEykm1L12l1lsiIb52PfoI054x4e7JedkGU3vih+EZUgJ8iVTs?=
 =?us-ascii?Q?YoKoJB97YlWN8cged+pB7yzIYXhU+Sb6I6J7SZU5N3ftJKB3FKqzeYAKxrSU?=
 =?us-ascii?Q?gvqw39vP11JkY2DPShbECaz4Hura9ZKr7ZMwlWzlqmhHHo18x9MjhtyqAlUd?=
 =?us-ascii?Q?9yJKoLvIyjeSPBiYsn3BpfU47zo4Edff51aTWtdOLp/Yjos/iNfcRsiN1IVo?=
 =?us-ascii?Q?nlvUiP5hC2kqzNIk7T5C+rdumIHWbTqYJruGI2JdZub3IMQ3+BCZn7BIxoOR?=
 =?us-ascii?Q?RHeorVvKVlJmURSTs4YSeDwO5RV1gkVHNpEOQKoptoQ1G2B+vGDXzCSysnoZ?=
 =?us-ascii?Q?sDxNFhQW8DnUNMJH5dbfN9e/gkGbT6AUGN8wjeXi9od4ggULuFWkOGKzYV9m?=
 =?us-ascii?Q?K7gXUigzX6fHZjSrKKKsqGnaOeOFOXzx1bjzsP89dGNVkCm3sPNwqVNMtVDm?=
 =?us-ascii?Q?VvRLsSggA8aDQGeSjGotkEMPPiQGb8wNlUqT0CeOQ+tLIgQKzu86cgibWWHP?=
 =?us-ascii?Q?iYCGt7oYrfGVM+QCTsHG4OjSSh3FI+HUWVVufVjUqptUOa0/8JuQN/mEau6t?=
 =?us-ascii?Q?zzx6J9xykzSwz2G2XuFsbBqyNAzRqZw1zZ8DzlJdSLlMUSBzH1275qjEnvEx?=
 =?us-ascii?Q?2wIQLI+5GY+88T04TqCj60ayRGnSFF45Z3XWm0mIYIx3L1KpFaypQtXe7jlL?=
 =?us-ascii?Q?RyKAqe9AC/djggNVAdG1GRo+3Jf6THm3RL6y5xMH7NwZM8x8ev5REVhp4T5M?=
 =?us-ascii?Q?fQHJt8/pLIYpRFydauX1DHVf0L6j8hkEim1T4PnYnpGo8htuNi2JcAqanSCb?=
 =?us-ascii?Q?hbMIHH23g7DaiB8RQmypUIayflr51gGCYrZF8K5hfjRRtMt9XwjbStEXlS4a?=
 =?us-ascii?Q?pfgNj7Ny1Y9v7Wo0gYM8Qlaw2sT4BVqEVC3xQRPCS1Gdf3uSpIf8kcrCZhWO?=
 =?us-ascii?Q?/KBlOsh74KjepQq/SmkY1LqPpllK5RezN2Nip0y2Pa8TANa0s1uS/JLDnXMS?=
 =?us-ascii?Q?eYB9HrX4RpXi32cULC+y199q5I1hJWxQiDbiru2AhHtkHiTGYMjjzvdbLB26?=
 =?us-ascii?Q?UfNPASoXcCkz8i3XPa7ILLhgJcli2bxpsejYbcJL/3/STmA22QvSUHm1cLNJ?=
 =?us-ascii?Q?KUTrNfId+Fg2sXYdXe/HeWEn53XRZhm2zwXzp96qH+TiuUw8es1jvb/KluM2?=
 =?us-ascii?Q?wHvQCftZBhve9BSI/VpwD11DiQg4cMYJo3/sypCNt8qo4qYdajBJ+MjfJst+?=
 =?us-ascii?Q?mBwqKwePKU51fS/Agxw4sdj2XtH/Tdpg0NWxM8QPrl41wBRsWTWl2evaEai8?=
 =?us-ascii?Q?dWBT9epBnnoJwWN5jwenpC327CHyBZ2c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MzrcXOL4yk2bIG9zGsGNHAIWJILjCfDB66DWOhU4e11vcg7vYgEn/kzXZjS+?=
 =?us-ascii?Q?99Vbpd6/Rn9EzR3F3WhIRdO311wbLimhJTOTueOyIzxxXRmPMDpCNb2o4D9U?=
 =?us-ascii?Q?cdCJcAYEWf3AUo1ArV5gZnG/MIOMEbmEBq91QdiekrLY3IeappqvSP+QJz/Y?=
 =?us-ascii?Q?65hITnDBvsV+BLk6WqVByFCMPDfsKRtaDNbV1ITldG8jvA5o3fFTOcP6q+YR?=
 =?us-ascii?Q?noUfDbTBnCAyTb2JkvgfVQrPdYx++nLaqd2z53I/Xcv9yAFUYGB2Zlzk1c1l?=
 =?us-ascii?Q?dfibONosQVLBCjHd1wSrAqEPIfXoOUSMk+DDvLHq9tUzV2i/2WjhRWZwm5ou?=
 =?us-ascii?Q?cpbObho+yD0MY7VUpJCwJ6J84WfzjAOMs+DhkCVvkB7j7Mx+JdVP0gi4sbuE?=
 =?us-ascii?Q?nX9M6sG8Zm4zCTgAl3E6N4eq7nVHBxDQ60eBjsYMOF9S7f40HRLLAMt2pdy7?=
 =?us-ascii?Q?i1uJE1GLAmQvjFZTIqhoWCGiglchmdtTrY7HsZD1pkUDNWUbi4bMBjDIDQRQ?=
 =?us-ascii?Q?D8pH9uBPyLGv0MbR006qjo9L7k9jiTqdo75+Fgc68VOVaT0/Qrqs2zCddB5a?=
 =?us-ascii?Q?Fx5ijsyn7Gwkr4EYamDa+3p+xTs5Ns36QZ0wg5NcLppEj2EceX/dT06mgDd1?=
 =?us-ascii?Q?a5r8JNS1BkT2wJ+Nybf3WtCbwM1k/Si9tDNyZ7jnDFHz6bJgDht/mco7rGx2?=
 =?us-ascii?Q?vQE0DqZ/XEGFCrmJo6TI4bjd4FV+8tD84XS/s8TZymMFXjiPdzcilR20Jbz8?=
 =?us-ascii?Q?c9GiOvDNhGPCse96vAvK9bVHtExmOZqp8a9pg9Ujy4gRPXsvHg2DYA16Ojkw?=
 =?us-ascii?Q?DNkLmFAD3BeTXGPuNHgbaGOGuDkeeeF78+fUF0N0AL9HMimj3C7aCRcfrCef?=
 =?us-ascii?Q?M1ZZIyy+mD7WP8HKwbRzl3CvfZw9tf1kAHfDw2TsfD2H3csgKLdzTBlNlgoA?=
 =?us-ascii?Q?k1s6nw3e5kYDVTtwUba31HzVjnlt5Qzlm3QM4Fm+cNwt7LHNaqahmv1i2E3/?=
 =?us-ascii?Q?4VuFw6la2XwnKZigjHEP+YC9Y5+1z4ti97xoIE5Wu03sv8imsDRl3cULaBp3?=
 =?us-ascii?Q?PmZ4LOIS2wL4yPh+Q4esY+2xSPs3GVP0I5vG/pLPZT7pyi8BpZXC48tOpSFc?=
 =?us-ascii?Q?UgPnjF1zNI7MV3F2Fi837tkymwnwdctQRVEDKKpCN6QPBtyvGJcF8x/FO/m2?=
 =?us-ascii?Q?4EcaCboEcsWF1D0RKXWgFJ0AiZex7/uPalH1crjCFNhxMeg2W951B+181E0o?=
 =?us-ascii?Q?OKkKS+gWXaSfj+TGSaX4DpMnicOFwNyKxgZZHW8dENicC0ypVVNHGRVyfVrK?=
 =?us-ascii?Q?yfZkTzWnMexxZX5k2b3Y/xAsNqbHmHdf1FoeHYuAPHWYNZnrmZ8rWaXNT3sl?=
 =?us-ascii?Q?8so8c3Ld0TeYN0fLnIaAFWTGs3VZaeSsTkwpKhGW/D1DvRAkus8lil6fn5pV?=
 =?us-ascii?Q?zbPVyy3xFm7IkoZrj3jhuf1/xrSRah2TXAM5xUA7fwg6JwCWMfbbKoSpprGn?=
 =?us-ascii?Q?h6bOSYWW8uX68ft5CeY1GNTCI6/UYEj577irGOY0JMacmEjR/YnT3LSPVdWL?=
 =?us-ascii?Q?CRX/Safctzy1RIrSjHvodjFF2KPeK32A4haBXubIUQcGZsdInLdabmsBH7Fg?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a27fee-4500-4e91-7c64-08de3bbd72a6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 09:36:39.2643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH/jSvFZ8itfQNFk8/Crsg8ivzaxPY3qcweRpnP8wWHMutS+juARC7z982decYQwQ9vzTBH4BJd+fcEKQlpSYNdWLZRDPOBy8EsWQjE7Yn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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

On Mon, Dec 15, 2025 at 11:27:06AM +0200, Jani Nikula wrote:
> Commit 9ac09bb9feac ("mm: consistently use current->mm in
> mm_get_unmapped_area()") upstream dropped a parameter from
> mm_get_unmapped_area() while commit 99bda20d6d4c ("drm/gem: Introduce
> drm_gem_get_unmapped_area() fop") in drm-misc-next added a new user.
> 
> Drop the extra parameter from the call.
> 
> Fixes: 7f790dd21a93 ("Merge drm/drm-next into drm-misc-next")
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index bcc08a6aebf8..28d6792112be 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1303,8 +1303,7 @@ unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
>  
>  	obj = drm_gem_object_lookup_at_offset(filp, pgoff, len >> PAGE_SHIFT);
>  	if (IS_ERR(obj) || !obj->filp || !obj->filp->f_op->get_unmapped_area)
> -		return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
> -					    flags);
> +		return mm_get_unmapped_area(filp, uaddr, len, 0, flags);
>  
>  	ret = obj->filp->f_op->get_unmapped_area(obj->filp, uaddr, len, 0,
>  						 flags);
> -- 
> 2.47.3
> 
