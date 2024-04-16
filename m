Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216B8A768D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 23:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06B910F398;
	Tue, 16 Apr 2024 21:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ClsEtT0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A2B10F395;
 Tue, 16 Apr 2024 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713303117; x=1744839117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OYloXOW+pVUsAv5sWB7ShcScrhNNDqdxXNkirC2ikYE=;
 b=ClsEtT0G+J5wfBXXGWVKPt/nY5DUgQAWwdpBRcAGkVOgyc5KulsDPS+Y
 KEsqO/kfSDL4WEDcXlqIx24zhXiImwm9PlA1Mf9cA420eCTzicOzVTpxp
 W92Zbbeoe/9sPsgtmYJtKeBsKwY2cxy8iwYmeRyFpyeNFkcwmjk65gCXI
 NKe5DTxYx1P8JSl15QtHLa0ypgMfW5Q9KUo4buSiVTn+ygxRJy6KHRavh
 FvKI580/ReQTORQk6NY/DLFoj18xEViApHc+xOXg20BetPHoC1WxNEcW0
 6Vq6Mx9wK1DCHot2lNsR7c8uWAKDKKkb4Zo4CAIpSLhejK52cewZDgmmZ g==;
X-CSE-ConnectionGUID: 3/XpTqBNRDaX6Cab2Ofrlw==
X-CSE-MsgGUID: OwSCuKfZQx6lBaSy0OPBhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26283951"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="26283951"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 14:31:56 -0700
X-CSE-ConnectionGUID: 9d3S+wprQq+XuyQP+kskhQ==
X-CSE-MsgGUID: mZxQWUW0SIqDEoJpUghw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22446643"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 14:31:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 14:31:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 14:31:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 14:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrAWftOqREWvVTQSwuXHEBkNbqc3IrRz44HLtdq2P/ob+JIN5YQOarVSmHgLGzn1HMcwKmQjV79DfP4d+AyUC3rDs5nAptYSDn+vCO40DBZROV+n1z4O6Py+hIgASFlMSRkoHkicddfQvKPztu4y4tL8K8EEgST7M6CCg4aCx72ainNo1ch0PvA2lyv7fP/O53DSbBYEq0VXRY2K46rKSJIdCxINIYSNx+uwN7HsBUb2cpISrIBS3l+qPp/cSMGqVsAQYz6KsiCbu9AXJKtHmRA/h4zmQwUSkQUbOiqq/rjR2i474Kia9YneuDmaxF5v8pmk2VpSkL73wQRwI5AzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtmDKeOCodLt4J1yBBVCXMojRCda10F4zsJ2EmvNSds=;
 b=b8xwIO9fwJRoyFbvdwAmS+brp9guDRl7qWTU0ORGeT3fmQJ9Ss2cSRyPX/DgSeqCOu1Zl6Xrk7ZuFR3VcORMFwagm5b8L7PDYoP45m4p1g5875+VPOsBsXH5woXzgYLAomIh/UOaIuSH6njNCedb8lBPlkDdUvNKjjcDLrVmXJY+BLHKAGILwkYKiQVxAeegSZ2Wp+eT5PvCE7kmfSJzkzSFHkb5PdKFzxpk5E6Orz1sx4KMQzNE+cPFTqfp7Fc+T8QbG5AMoVYLigvmNBHonTuI8mZm6+AKcA23Iunv/h08sRMfFzbOWd+DLeRaowbsy1y5T+1IHYKvbrBFT9bQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MN0PR11MB6009.namprd11.prod.outlook.com (2603:10b6:208:370::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Tue, 16 Apr
 2024 21:31:53 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 21:31:53 +0000
Date: Tue, 16 Apr 2024 17:31:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH] drm/dp: correct struct member name in documentation
Message-ID: <Zh7uNpPTUdaRkC7g@intel.com>
References: <20240405065159.439145-1-mitulkumar.ajitkumar.golani@intel.com>
 <Zha79kKYTltfOtDA@intel.com>
 <IA1PR11MB6348E9B9AFE0EED886F7F240B2052@IA1PR11MB6348.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6348E9B9AFE0EED886F7F240B2052@IA1PR11MB6348.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|MN0PR11MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c01277-ecd9-40a4-f1b4-08dc5e5ca22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tT/wk/JmllELVA9cxUjndqb573W/B52HhaTvaG734bSo5y/xzEfKXInbOHzg66rotu36amqXCtetWoHSQBNYGZ99saY+QChOOZO5GnY1cvmxVAtWQ/Fkou6iTDC5ZiwocuLHwHIOPrxmsxPgo+2Pnr0Wl87eQnQmvJtAsoZeMUfhf64YVIpKPXK3MAC2YUY7MvHpxyTMlb79Hk8o5CkcMRc8+dsTRmMgv98sxwkBl1bKVVNNaHk+M1esZerl24bXf/xoOn7UXkMjfZCZ6UqxSkO7VFWcoksQ4XJzNGk1k8c8dpBgYGGwCm5SX7z41sK3fF2/779OfH/XeOBgOohJaTRxXDgCTElKZDcTVCVniUSSK2VzdqW8vMtFp8zymYKh/nZdoZ7vU7pSQSWsUTBzuL0Ffl2IxKU09rJ0MjVcc6H/PN11UdcdHj3tGvi27k1o67PkWWBseNKIzVsZ+OVafDOGS8MiSHN5/RHSS/PZU1r3+47/+Bjn6q4Lnpnm545UKvaL40gfKV1df3RYpcZhh1GWDqlvD2SZZIRYeHJO8+U2dvMQrkWl7+zUnl3douk6aId1ZHrAEROTFi4FKuztpfDxve4yeE+nGpgLFUsm7HDEmBNGA8+lOtChMJTrhWUq7OsCjnNRCFYEAJDApxWenA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mLdmB1v9fp8+mdjwE6vRJsVcMktpcfwYJ92AU1kn5u5zs6sn8dW3IJTCN49C?=
 =?us-ascii?Q?el0fHVcBEk9QOd/qnSOkxUddxhbff7dQ1D2Tixec20jsxuvGqm6TD8gNaZVp?=
 =?us-ascii?Q?I2B7s06Out0rtVqtubpyDRM8JbJd0hDyd0FIUxJlGy3meHZ4a2nHLiznoCbM?=
 =?us-ascii?Q?cmioIWiEVR+M1cOe2JnYzVTdAnIJUWYnsajNFMT2NYG1+dX4zt5mwNMyFL+6?=
 =?us-ascii?Q?FyxGwH26ZkIgVBKnKXmp/yu1DgsdgdUuXlLXkuzxVQHNNfe/PhkxjJyAeLwg?=
 =?us-ascii?Q?jsuIwcmOR5TQbnMHO6k7IljM/aa2OU4i/sAslZH1qLwU3+3J8uGxwEUf875J?=
 =?us-ascii?Q?8ewUXxAAn+DZCcS6CLSlLaGG7DBtC3MEW+2FWkOE5nQleXc2XSYUOhPBHG8V?=
 =?us-ascii?Q?3o4adXwiXEPQr23+MXyXIVgCPeJbmK3goCqtwP6B5IejFzakjRuB8kt7Z5It?=
 =?us-ascii?Q?YXe5x38P6Cw6xBEq+R0nArK8ARJhjQM1Pz7LEVincDZrcYzLMthc/RghC6GC?=
 =?us-ascii?Q?pEoHZ79zbU9DtjK4G7TLIECOkL4Rw4YubA2lgpP0aviSpxRXZSprFU6qQG+e?=
 =?us-ascii?Q?fmzDYTtaaIwNLoRqg9U/wuTsFO+eppDgophtVNFsHgdDimfcbUYFZjBJgmpL?=
 =?us-ascii?Q?WzYwKW1S4kytXePVNMh9OYcgbPCIcFr/v9HKVZg4xKzpie194Q6iIElFts/f?=
 =?us-ascii?Q?WM9zISUmJW1OiVW0uPHCpwfHFly2HqYqdSzd/cYpUfgl3s8AUWr4MFUJLeN8?=
 =?us-ascii?Q?8DEvFpzGTqrQ+9Ty4JHMRCtpgT2id6wBmLUiqfBMe2bXf+8Ej4mK07iFCM/s?=
 =?us-ascii?Q?GicW+RNIShiHumyRY4SETjw4gvykqfA7AwoeCbBuyFFchJQhP4G69SH02Kh7?=
 =?us-ascii?Q?mISo3e8iMiBmQX+mVzVYHEACHUrqxlcpu6QNvSiG2fquSpo0zBUFjOZCyCZV?=
 =?us-ascii?Q?uFlJ9h69qG3Vh8Hk8XuFFrOlk1Cnk6/c3EaFheZCGFsjbLXSvf3K36xcDj6G?=
 =?us-ascii?Q?LcRA+8r3VNyE1mgCCt1B7GOUpA2g4O9YB0gFhhwLO29mzSZhMJQNUE0TVUMb?=
 =?us-ascii?Q?yyc1UL5esb9LTAAn1yF10w6GkdoAXC4MTVlsYzLtDh8+rjaM5e1WCPNx8Sj3?=
 =?us-ascii?Q?P8xUdF0WZyav2wy2Lrb8KMNxfKQmhO/eTWJh0XB7QzwZqo48OGCsNO8AMFeQ?=
 =?us-ascii?Q?sH7k2Hz1chw040wcNBJtIp9VwcgEdvoLvmwAoClD3Lz1YALwoDyEuRh07YVz?=
 =?us-ascii?Q?+L5L0XL8taLhdW/pWaYmCkTPQUHsw/Zv9sUYETyuLAJNO6xPQdrFeNYKKslZ?=
 =?us-ascii?Q?lL+M2HN7BVlxzOjDO9w+/BEcccsJIx+ZN9EsCG6e+ibVjMF4QO+v6G2GfOXl?=
 =?us-ascii?Q?s1Sgd2L2ut57FrJDbNXtBeStZS6TaY6ZH5T2N+emzz5LMzFpmwpJM5uJKTyp?=
 =?us-ascii?Q?2Nb9BRcJJAAE/UvMDj6OYHeUqRLTXSED6LAkpNR1mX36xIU8ew38aSgBd1Tf?=
 =?us-ascii?Q?qX9GYpqWb8esm/bACA4dPvySFTxiJcSShRDxTBll8W9wLmKIB51h1WUbU78k?=
 =?us-ascii?Q?TLrMCHmWnjgntANewiUMRqFzEnViShMBpE5a1NEiHrdeUJ7r0dhTYMA6jAkf?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c01277-ecd9-40a4-f1b4-08dc5e5ca22f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 21:31:53.6411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1GpMZITQYFR+54m+xR/T/ZbKdpE6NottSApQ/uzwm7xJawuWOor2QH8OCoBdg+dsplDSPwT2O/N0bMnaK8/9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6009
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

On Thu, Apr 11, 2024 at 12:55:29PM -0400, Golani, Mitulkumar Ajitkumar wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Wednesday, April 10, 2024 9:49 PM
> > To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> > tzimmermann@suse.de; mripard@kernel.org;
> > maarten.lankhorst@linux.intel.com
> > Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Nautiyal,
> > Ankit K <ankit.k.nautiyal@intel.com>; Nikula, Jani <jani.nikula@intel.com>;
> > sfr@canb.auug.org.au
> > Subject: Re: [PATCH] drm/dp: correct struct member name in documentation
> > 
> > On Fri, Apr 05, 2024 at 12:21:59PM +0530, Mitul Golani wrote:
> > > Correct struct member name to 'mode' instead of 'operation mode'
> > > in 'drm_dp_as_sdp' structure description.
> > >
> > > Fixes: 0bbb8f594e33 ("drm/dp: Add Adaptive Sync SDP logging")
> > 
> > Probably good to avoid this 'Fixes:' tag, and only use that for real code bugs.
> 
> Thank you for inputs.. I understood and I will take the future note. Please suggest if required to update the change with new revision or we can take care while merge.. ?

I can remove it while merging.

I just need an ack from drm or drm-misc maintainers to merge this through
drm-intel-next.

Sima, Dave?

> 
> > 
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > drm-misc folks, ack to get this through drm-intel-next, where the original patch
> > is?
> > 
> > Thanks,
> > Rodrigo
> > 
> > > Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > 
> > > ---
> > >  include/drm/display/drm_dp_helper.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/drm/display/drm_dp_helper.h
> > > b/include/drm/display/drm_dp_helper.h
> > > index baf9949ff96f..6799f57d635c 100644
> > > --- a/include/drm/display/drm_dp_helper.h
> > > +++ b/include/drm/display/drm_dp_helper.h
> > > @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
> > >   * @target_rr: Target Refresh
> > >   * @duration_incr_ms: Successive frame duration increase
> > >   * @duration_decr_ms: Successive frame duration decrease
> > > - * @operation_mode: Adaptive Sync Operation Mode
> > > + * @mode: Adaptive Sync Operation Mode
> > >   */
> > >  struct drm_dp_as_sdp {
> > >  	unsigned char sdp_type;
> > > --
> > > 2.25.1
> > >
