Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A2B5FF653
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 00:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4010E0E6;
	Fri, 14 Oct 2022 22:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160FD10E048;
 Fri, 14 Oct 2022 22:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665785707; x=1697321707;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LgFsNwbpdk763H739Oy2IGjI0PdaZxGuWYBxUrxIEBU=;
 b=jcw/vmHkGe0ifhygYonfGzpQR4VFyOHQaIbLtB/QvHsW91og+KjNpmnm
 onIZG/5mmaAA7Nk7mQ+qRTnp8KINNgOMHvE18ZolSCQiDErQdYOR/o0N/
 9rtdlyXeuztGvjBr/j8XMsO5PNtnihA0fGtMSMLQMqGRu6CszhrEGsWN1
 B7Auw1+bckGNpK5Kol0Y1AasU/Ai9MHxQfrbV2UVOT9C+f5V5DoMDiQRO
 W6whF+0SqVbAV64vYdzEx9ziMecnnLz/OGI4umzprkbKTxJqscTz/zG+6
 6bzeBxRvtelVNo6uECyYbUFVtSzuN4pvPUStZ2gKHqKuoMnEJqf7gigbz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="307139885"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="307139885"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 15:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="622671965"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="622671965"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 14 Oct 2022 15:15:05 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 15:15:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 14 Oct 2022 15:15:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 14 Oct 2022 15:15:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 14 Oct 2022 15:15:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geqChcPzgnanjbHhkJs7YDSShEhaM/L0QG4in0NZdidz/0WggZZiKk1CuVtpILQE846h+8yxNpDUfjMADWbNqSYn72Dyzs5PTAnWG5Zt0UL/THRY1vMTfbz4E1iQpMO1nCYWY6iXJCxsrSUKV2dtBjstOcJGh+Bxgcd4h2h/IOHfPOvBHosIKEe9vIob2UcOhvrpAkshj80sFVHUcW+HCMJ3grBELt14k/p7i+UtCVc80z7K9koXGlnT3HmdC/o1eR4nPtuzmJafSdhn7AhiUQo6ptqWCTiwKrd+Dor7B9+Jz3Zpcc21qZGwbGpCC0ZnT1LJIQGNy2UBY9MbWh8mPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqWFsa4fUjEclbB8cUW1d0RuQRLhR9Ql3vy1/rZYiO4=;
 b=PVePQhbpckCdD5y6ZErAkWEJ712Y3PyNBcbdq/dmSxuvpo7PSc+pwQWFkNKejX5yy+mSOUd7ESmVfEDcTX485DsqxAgLMaw564kAV4Z/AlfD8oN10PbZ3FJmQrNyGZIZ74U8Q7+Xpxemuw8jf+1bEQqkfiVDUgUYaft3JkeiFqdjlI3SYK7YwVd6BaZ9cfMISFU1SssLBMf3v1fT28cnQL9PL4NCiB8x6wmvHv194hd3Zffw51T6+GepuDmB3nyOHAC+PixAFnCIEjIFTQ5v95QvuwC9D7axC5tQambhhHTG+msXdkCbWck2ny8a5Ke8KLVZZDZs8L3x6RZJunfIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 22:15:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 22:15:02 +0000
Date: Fri, 14 Oct 2022 15:14:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915: Use graphics ver, rel info for media on
 old platforms
Message-ID: <20221014221459.p5nr3smkobdkbpio@ldmartin-desk2.lan>
References: <20221011153851.3781507-1-radhakrishna.sripada@intel.com>
 <20221011153851.3781507-2-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221011153851.3781507-2-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: MW2PR2101CA0036.namprd21.prod.outlook.com
 (2603:10b6:302:1::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b72558b-964d-4d80-4231-08daae318a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /7feGrL5PaYEtoonQWSD0Z5KhEcm2TEpuneqdMqVzpQwy+nOx9ekXAgKO+pZOhwyOt9holq53EAznowVBnfRpUZ5XZUcea5Rm/lphEwIOM/heioeTE05fVDlWVDA3NJadNhayWW2/dKdVhgBpQDnqAuTHtX6RLxGEJAMVrdQUN2NOqbgjrG607R+DVJuuH7BxQdONGjxrKbpVAYdW9/ALJctQDpZufdR6AKslCnabVhpGCKyKSiU6KHHsErcmyegElCSMhTyP5vn3JDLTb2bb55PBx70qjgNcEYjY7iekHoaTZMGVsnHy71xc7Mg+hZLz/JWmYbugdWD/yXmRer45b1MXuCqGgAJX0fOXndncqyU+D/YNHAaaiNLx9G3KmXI/Oznn9QSuZ+x6wkectn6SyKefwg0xSBZk3p2Jb/4qOCR3qoo4xi7kmFs4vKffHGix+PuhIhiFpsrDRfnAfcmklLldgYWHWN/BePbLpRiJAZakcAdWbFOdc1DpoS4q+r2nP6kwwtI2yk0SDB5Su9pDshzUbjvZ39x0oQUGxZdZfQN9ak2RASarLaKCEiDRHiQ40Ya3w0r4nJToWnvXN9I1eI/m2kNh2W96uvximr8nJ1ZnqQnApXMKpccVqpQEQN+JdYVNqGg+GrtYPm2E0gSn8PGXS0qAxkMlrtpVa/3rfs+1OSyJQnQgGVDglnWzhZ1HH/wdcAmrNKj+iLkbtdp6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(1076003)(186003)(478600001)(26005)(6506007)(83380400001)(66574015)(6486002)(9686003)(2906002)(316002)(66556008)(6862004)(6512007)(8936002)(450100002)(66476007)(66946007)(6636002)(8676002)(4326008)(5660300002)(41300700001)(6666004)(38100700002)(86362001)(82960400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DoLn9ahAxPX4ztTSJqVDo+qlM+pCNsamYy6pNj4bfvpW4dHULDF9xJar9e?=
 =?iso-8859-1?Q?i9rtFdkZo693JD+wLF9oTLQm8E2W+wlW+jKJeDH8Jr2J5hY/VUT9injhBi?=
 =?iso-8859-1?Q?KxgGjkEmPrN+vj8X81ke0uG+yh2t/fedaMXUJH6cj/pyDI+w5x6MPTRtLo?=
 =?iso-8859-1?Q?O8258u/aX9YJ0xLZ7+EYZ83yAXw4ey36vzQXl9AXF7F00Bh3Fi0uGrPiLV?=
 =?iso-8859-1?Q?+6tLI6nI5qcJ4us8FWwq+kRQNDM6jUypyIJM036XFFgh2uQSWnp6eXojtx?=
 =?iso-8859-1?Q?rUvpwQl41HIETjvRt+o81P7jmtFqpviNkix2RGckAFYWJnBGRW76ekmGQ8?=
 =?iso-8859-1?Q?L23Za7NbBDklxWwsIMFiewYl49GbmLOt/ULMwhyJuTD8elLyWHUgPdAff8?=
 =?iso-8859-1?Q?Uc9wTbSyP5y+OzUWR9tEOkxXLpxqmaCSezqfpsOg+CGavO7Ijw256tPWAq?=
 =?iso-8859-1?Q?ql5cezM1eQ74RcFaVbNjedY6Cj/u+xaxZJ0OMpHgpkdpF/Ei7vinXPV/0U?=
 =?iso-8859-1?Q?Ekl6YRoXCPpuCoJyOgx//0KPjHPYzovcaOwQvnHFAJLJaLv7MKTNOttCYL?=
 =?iso-8859-1?Q?b8Lw9aYe3sh4LXdHMMLmBlWH3wPcD9bo46lCXrwNMe5qFfno6eMPQxJm0s?=
 =?iso-8859-1?Q?hkXU/D3yPf1K7lDNLlBn4dyMWsxw5qB+GZXkK2qT1YpWSU07XQro5reDAC?=
 =?iso-8859-1?Q?A3ZCqd2VgkV7nmSv93YVSoCOncBx6VocrUK74w5y+BzyGYrY72dw8+MhF3?=
 =?iso-8859-1?Q?aF7ndmNfDwNANgvT8g+/Xz2n3GJxdSlWQaE3ehpIXNw3XHjtG6K5q2VNop?=
 =?iso-8859-1?Q?bI0tHyApE75B75qtzmIxDeCtT7Fk32SVjx/58sjmClaCwQ+ssoX6xUWGXN?=
 =?iso-8859-1?Q?h8GnLE5J1D/UlmcHpRCgLcruutdcyqfksp3dobUkCm2hCyjOoWvm/VBDu4?=
 =?iso-8859-1?Q?YZCA+JmZZ6FWfgLX/EyMUZLfNVvw5462QaYJJcR/Xz318aogii50UUc5Ll?=
 =?iso-8859-1?Q?bPaNUjlbBM5iJhfVMu+Q64//Zzxt/SaokAhYG7S+a4CUpp8mFvjE5asB8x?=
 =?iso-8859-1?Q?l4fr9vHxpMFik8PzFDwW6t8hamCOZo02N5LXgLQ4BeEHSCcf5E36PdditL?=
 =?iso-8859-1?Q?1Dchz7rCwAq7eTC5EPmNHCd8tguNkqjNssd6bx+0LvQfd1E4BdkGsmlfbw?=
 =?iso-8859-1?Q?hK0CWrL2NXUqLRhqlqxAr4r64Fl3T5slzLatux+Ad5FQdtmqpO3LIcPNpX?=
 =?iso-8859-1?Q?8dt318c5B8AW8VVUrtc804xhPD0Y656X25kmQpmigWDHFNa0lMJmKs53C0?=
 =?iso-8859-1?Q?zy4CiT355GbC1khcBygA2G/T5JM0Lil5osIJPm5NvInT+smpbvueFSuPL9?=
 =?iso-8859-1?Q?b0cFEm81OtDe+IEN8H7j+gFzeZ/sXuLRNUTyTLMFL5hyHWonDdzF75wbTc?=
 =?iso-8859-1?Q?lDhNWzYvrJt7AhNKZZWvW+lFA2CZ/Ktmqje2utHe0I4sR6O60m800vU2GY?=
 =?iso-8859-1?Q?2jjdFs9FeNjKMJV3nzmjAtLdtcF3h+2/fOF9KFSJNEb0jzxC4hyoWASYoi?=
 =?iso-8859-1?Q?9lPlf+Z5cPcif66SPIiV8UFJdUZRcz52hwkayzJyM7JfHdjPmn9Om9CCDe?=
 =?iso-8859-1?Q?OOOWwLhnShSFigfIXBSH99ysFkPBz5vKjNuUTnSJpksy5MV40os8uAJA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b72558b-964d-4d80-4231-08daae318a46
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 22:15:02.4243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIv6qVEFoSIkwcioye/+QQzBQHbX/PE7ZQUadvSbv9SLbGvqqkmm5JrctsYoRTRUXrNSqmTqlVMS88B7THENwGilfPrytNXkB4pRv7A5SSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
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

On Tue, Oct 11, 2022 at 08:38:51AM -0700, Radhakrishna Sripada wrote:
>Platforms prior to MTL do not have a separate media and graphics version.
>On platforms where GMD id is not supported, reuse the graphics ip version,
>release info for media.
>
>The rest of the IP graphics, display versions would be copied during driver
>creation.
>
>While at it warn if GMD is not used for platforms greater than gen12.
>
>v2:
> - Use simple assignment to copy contents of the structure(JaniN)
>
>Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch version from hw")
>Cc: Jani Nikula <jani.nikula@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/intel_device_info.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
>index 37267c662dc6..1dc1fb29a776 100644
>--- a/drivers/gpu/drm/i915/intel_device_info.c
>+++ b/drivers/gpu/drm/i915/intel_device_info.c
>@@ -329,8 +329,16 @@ static void intel_ipver_early_init(struct drm_i915_private *i915)
> {
> 	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
>
>-	if (!HAS_GMD_ID(i915))
>+	if (!HAS_GMD_ID(i915)) {
>+		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)->graphics.ip.ver > 12);
>+		/*
>+		 * On older platforms, graphics and media share the same ip
>+		 * version and release.
>+		 */
>+		RUNTIME_INFO(i915)->media.ip =
>+			RUNTIME_INFO(i915)->graphics.ip;
> 		return;
>+	}
>
> 	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
> 		    &runtime->graphics.ip);
>-- 
>2.34.1
>
>
