Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C959566E6D6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 20:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8674E10E32C;
	Tue, 17 Jan 2023 19:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1067010E32B;
 Tue, 17 Jan 2023 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673983329; x=1705519329;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AyzX3GDicuezN4aAOjMHs79diumAhX059xrwChEKuhs=;
 b=bzYSHY6p8jHvQFx4Zod5RTYCPFk1Hd+yF5nRdG7G8Jom0h6lpwsdAZNv
 /V3mtkYCOnBVH4Ag+N6SvyZxL89/wVfSOKlrXOObTH2FQrVtxmhM24PMv
 5z8DzbGu6JgwhWvUmoqj0Rjqk0c2Iaz9wg31h185fN5LqjWkoHSERkRe7
 iTNxb4SR2lrYpjF1cZB7DPtNCDeLmS6alXgGhUIpTDkDWA2QbN8avf4gj
 huoA4mDLVIiFdx4CQXnKDS8l6g9Wbq9D1kUsQaGueK4p81EBfoAlFLh5V
 xNSql1OY/dJ5Wj03W4SJDxZWJ4kxu5leVfVyyefDRRKDG9+TTnstY31GO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="322482783"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="322482783"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 11:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="783357797"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="783357797"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 17 Jan 2023 11:22:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 11:22:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 11:22:06 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 11:22:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/nJn50eOXp2HT7SJiG4UyiV5PVGR5R/3cKS8pIuIBds5qzyyvDb1DAclLjoaxeUOtpD8JJdjU0ofRRuVlzHc4Co7GDt5q+dTb45sv7hN/CViXWnPHYFiRXYBg2s2dbVcssDc4YSATwjP9HOoaoblgK90FVSmrMCOnqGWzyZmyQY1nPgvyw7oDfDifrJwsOZZVXuFARLexSBUD/hw0RlIgB8+qxLmmkytYtenB3JcjqRZdfl/JV5SVBvvUINCL4wFImQRNP06WjujDc0j+1MotdymSsCilwMiG7hPW8UEz0izdrt44qyQrlJ0c/orUwXIL+g5/pEFXKj6igktWbd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwc1cy2buqdW0fBv0Ol+xcy10MI2JumtTMXPMkjdpzQ=;
 b=B9qmMzKIFlL3P9MRmeqI+2H3DyaG/W7htm4V6LK0GhrlldkBvl+vkailb7K9/lggNPwuXd0Ie6tU2CXrLY2fNMZKDd4LDvJDZVO5qZ+n2h6W1zzlndBwc2YdQ+xJlgOgx6Fyi/EQObwPjBV+F0B/A8B6ojrp+GupD7yDF+0jB4wJavZAwm7fRF4a1xA+Ep3RR+1Iwh7mLozdZG7CMjI23ngIu95xWJAsIAyEVuiHHq+BVYtG6xn+/wR0RoBjHZEOyvcKxNKRmgoN4OT9sLB+iomXvw0ltb1D2Lww0OdE/XkA1GISYPNwxUd4OUW6SsnkC+e0J3P/L/a++ZtvsIHF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by IA1PR11MB6171.namprd11.prod.outlook.com (2603:10b6:208:3e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Tue, 17 Jan
 2023 19:22:03 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9976:f25a:e9d3:2a0b%5]) with mapi id 15.20.5986.018; Tue, 17 Jan 2023
 19:22:03 +0000
Date: Tue, 17 Jan 2023 14:21:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/i915/display: Convert i9xx_pipe_crc_auto_source to
 void
Message-ID: <Y8b1V7TwesqmB4Hv@intel.com>
References: <Y8K2SS/zNiPAmLsS@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y8K2SS/zNiPAmLsS@ubun2204.myguest.virtualbox.org>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|IA1PR11MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 486979fc-c7ae-4d8c-e693-08daf8c01d21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: or5cVK3Q27z2vho05X20+Ge5XLShbOfHNTCUOBTxqIlW5HJq9thnzAXsnkKwBMDcmsDkPJJ8e9F8wXQsdJl/764JyKl52CGCgTuR/pQhoUPFNjgqFh3aDiq0EusBRiErXp/KgsrD9b+IsBfvEdlUUHRdKLjNeWVqdN9eJstdugPHohb2x+K+Let1z9eHnJ405Av/Ie8WcK2miAT4LrBrEKu/vinXrE2Rlcm3uYeWDzUg9Rhwfz9xD2B5RauMejBCLWvAZyqL/icJJVO9+fn95GmsUf0mHKHv1Z7ChKzToJ0+jY4OoU8yV0GUx2Zr9UfVJdlSi2bVOjNFw3P9EY0eZF3DSSGc9pjs+gz2hQ+l6RdRFY284s1s/q2fIh7Dw6xFxPv9k38awHkTnaGGg+xiiNoA1CpMAHUFnBmyK2N1OC6aPKXWV+m3wAWurNFNBtkYKHmvJE2SLUeF7RJGSwfknhKBgNAe3e3/WntrEPKy9Dh6kG1Pmk1p+3DqUMQmzPrTcRyF/DTyACRk4NX9mwcesaviDPcO2UJDCDx7VIR/WL8W0ZuUKWL/J/T/xLhzOcTzkfIPekdxGGrs+63BA9wMew1uLYeApRocp3v0m5DEBT2njThj71cPJ6zGBD9IYVZMHVhnk51v1D5YjG50yieA8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199015)(82960400001)(38100700002)(86362001)(8936002)(41300700001)(36756003)(44832011)(5660300002)(7416002)(316002)(8676002)(66556008)(66476007)(66946007)(6916009)(4326008)(2906002)(2616005)(83380400001)(6486002)(186003)(6512007)(6666004)(26005)(54906003)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3iAK0yRdkPiWP4Mi7QLLDnR0OKgUHmWes4Cv9XtgnmcU2Xt0oA2Naee5mIli?=
 =?us-ascii?Q?K9RAPQCJKdiSy8ONMTWBB+aQuL+QvHneYJviPDOAJuQCyAZJMoK9X+sDQHQ/?=
 =?us-ascii?Q?q262W8wXsLVneFmsUAgiEEiQTSC9SFHdj48Ked82DqEXl4+WvxGtJIZVOuKs?=
 =?us-ascii?Q?9Y/QJ4l2I932iQ6mDe3i22boYi6m6aiW0OFWVH/cpLnELuRNvv3UbZiSjmBi?=
 =?us-ascii?Q?mvawNYC7p9mp1UBCj//ZoW+ttxwC8FizVcRA7FodPelEs4NqD5+Vmb2q1I0u?=
 =?us-ascii?Q?KBpoGRFVDMcnRGDY9lq5LvUYP8Lw1Tec9p1+pLUW+MTlVguT3M3vYKRDtJ6W?=
 =?us-ascii?Q?OcwqiLj6ud8rdrYIKfHGRePayCbzNC+jeslQRztJ9a27CkgeXH6NR1QbbyYg?=
 =?us-ascii?Q?MVdJgdbinVJmAuQ/6zGMlL9qPsLCcUC57jAMHhcIdczgtu2iTVzYVF8K59Qz?=
 =?us-ascii?Q?Yw547M79lHYXDDQlAfW4dCgKM8+g8FZJJcr/cqlBB2zDNVLxx8lPA5ykoRfu?=
 =?us-ascii?Q?sl3xqo5MXU7O9KA9riR3VdW/OZhcGN64P3DdtQlRMZBAhBuDyoufQgZ/O6es?=
 =?us-ascii?Q?feoJw/BbZxY+WRxu8VeYABouDS9XKMr0lakpQbErqfWq+hTrEQLKh0md5wUW?=
 =?us-ascii?Q?M5i7l4AQqz+n/QnkSaAFJ5SFUfu4OPbcrOtwfOqdOgLlM7EFa6c9q4hqbvOs?=
 =?us-ascii?Q?0Q8cZKbtui9CeK8BkIPSDPTYEo4L95A8sOXDO9/jUivof3vGp71p2EtxcvP7?=
 =?us-ascii?Q?AAkbK21avZyID2RELhJeyFyLU7zXD15TY72Y1fyf3iL1tKTYF2zAhn4vKvIA?=
 =?us-ascii?Q?hXTbIVdlFkV6AoPyv9aRNvVkhfpsLfhxSZEbam0TRksiKZ8Ar5DDHOICGte9?=
 =?us-ascii?Q?gwT/oadbgtj255iNCgm9tVJM3x/VHaiLZXD3i9e6O+s2NzFVuB8FM54b+uMQ?=
 =?us-ascii?Q?+Nk0D+jxscJyOcla36orWIkiGo+QYiq4ARCdUjCCzkSU7ME633WQrEBLXR2o?=
 =?us-ascii?Q?qPP/YcPue3W8dJoZcVnZzprAQCyfDlUurSH2esiNpmRmWm81P1Nt3fbnQJDq?=
 =?us-ascii?Q?PxwT/N7UdZmSQ2jes2D+WDkMm0vHlYAoaARRj8kVa4UOfqP9zvTQopGcRisU?=
 =?us-ascii?Q?mmckQxQSAmyPrAOturQQsBxnCWGKCAJWysrd1bgwM3erhlgCfQ5Je5VYcUnj?=
 =?us-ascii?Q?VpWKuIiUDFI1Q+/epJ2sw8vFlAKcdHOW8Fd+Kg3IfNsdEpFpBO+rA2/8m5LN?=
 =?us-ascii?Q?6BiiOF77Dx6VlA1qrQSYJV3L8Pu6ZoHhqhSj7oOu1J5YU9NtH+7+gVg28khg?=
 =?us-ascii?Q?qY7He8KXT5HLakrMcLvegSK1bZ9vCrLqpsLoz6djLegLDt6nIeB3KtOjxN7R?=
 =?us-ascii?Q?KveiDm1D5ECDOXTYWeIoMYZDTLmNISZtM6sMb+7UFhO35kVTEnkgkMCSefUB?=
 =?us-ascii?Q?S2EJsmkZhmc4+iJ6U3861OO3O8DG8P+zhoENAuw4TV4vJXE3SVaECyelIRty?=
 =?us-ascii?Q?GuDILeNSGIAg2Ke/UpE/o1oM0WkEGbuN2jbI+qPPzBawan1nOpszPMBZ91MX?=
 =?us-ascii?Q?axdjD1mOBcSkHc9gfic8l67SAtaWNtTuC+mOOPElv2P5RP0fsT6ZIQyILu1W?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 486979fc-c7ae-4d8c-e693-08daf8c01d21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 19:22:03.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+mWxV8yGniI3Q7Tf9tBVIcbfWcOHF5oqVnUA2PlcfPQh7c/vNOMI9Z9PBQ88ZqA9wNBGqeMhMFsPH3HIr59sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6171
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, Praveen
 Kumar <kumarpraveen@linux.microsoft.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 14, 2023 at 07:33:53PM +0530, Deepak R Varma wrote:
> Convert function i9xx_pipe_crc_auto_source() to return void instead
> of int since the current implementation always returns 0 to the caller.
> Issue identified using returnvar Coccinelle semantic patch.

could you please share the coccinelle commands and files you used here?

> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Please note: The change is compile tested only.

np, our CI liked it.

I liked the clean up as well:
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c | 23 ++++++-------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> index e9774670e3f6..8d3ea8d7b737 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> @@ -72,14 +72,13 @@ static int i8xx_pipe_crc_ctl_reg(enum intel_pipe_crc_source *source,
>  	return 0;
>  }
>  
> -static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> -				     enum pipe pipe,
> -				     enum intel_pipe_crc_source *source)
> +static void i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
> +				      enum pipe pipe,
> +				      enum intel_pipe_crc_source *source)
>  {
>  	struct intel_encoder *encoder;
>  	struct intel_crtc *crtc;
>  	struct intel_digital_port *dig_port;
> -	int ret = 0;
>  
>  	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
>  
> @@ -121,8 +120,6 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
>  		}
>  	}
>  	drm_modeset_unlock_all(&dev_priv->drm);
> -
> -	return ret;
>  }
>  
>  static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
> @@ -132,11 +129,8 @@ static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
>  {
>  	bool need_stable_symbols = false;
>  
> -	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
> -		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> -		if (ret)
> -			return ret;
> -	}
> +	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
> +		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
>  
>  	switch (*source) {
>  	case INTEL_PIPE_CRC_SOURCE_PIPE:
> @@ -200,11 +194,8 @@ static int i9xx_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
>  				 enum intel_pipe_crc_source *source,
>  				 u32 *val)
>  {
> -	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO) {
> -		int ret = i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
> -		if (ret)
> -			return ret;
> -	}
> +	if (*source == INTEL_PIPE_CRC_SOURCE_AUTO)
> +		i9xx_pipe_crc_auto_source(dev_priv, pipe, source);
>  
>  	switch (*source) {
>  	case INTEL_PIPE_CRC_SOURCE_PIPE:
> -- 
> 2.34.1
> 
> 
> 
