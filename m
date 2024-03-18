Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99F087EAC0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 15:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2616D10F7A6;
	Mon, 18 Mar 2024 14:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ga5bHmeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE3810F7A6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 14:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710771594; x=1742307594;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RUEj+zItmvSpUBi5r2gfU2cfSx9jE8/4maKXb4hNEd0=;
 b=ga5bHmeUlQR+RiiJgrMrTgsoV//AvUBdZg+N5jR93hB/06DAp19zt2E6
 VQwjF+yMBqabBOEAxwwD3vWtZS2f8igSZVO7yVGGSlx3CMtAzK6qDERDp
 xh3eYqWqkFhc8hIXQ+PAMjbqWdUgocOcreBcI44TbBxle3vjCf7UEezat
 MxPzj/N2gZMbbelVvi1bR5ei7t7NcNoOzKbpLqNASArduvqpzTUDD8mYM
 VO5be6IRcq4WRmklGRwTEH3r8QTdxGh6dNM2zTL+EijrvFmjvvd5WA/U6
 eDeqa5P9ZzL4mIEqK+8rZirYcfSq4FkFpigngAMPWI7neg0S94IVeyD7i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="28065766"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="28065766"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:19:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="44538809"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 07:19:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 07:19:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 07:19:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 07:19:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNe0J3CNlxmS3P6+jJUfGLW7+bFEZPOx9hvCNpmerFoqk7UFQI0IPPZcfdzG9LzuyMhIdAwVIAlz9Gk+A2uhBCcqTYBofSAAjMDXZuqSchoMdgLxppsKwF7GbiTUeNltQT5yONv8+gqa600OebALcc1wGMgTwYIs4owrKsUzLymX5mZj0LU9FSM2k0VPyYn2U/1mFQHXGzxnmY+BotRhM+3/C/Um6G2b91C27nMicz7KIX4WO9xuHGZOgmTfXCaLZTrJYJGPjli+8kMLyCyAa9TzQH+kkUhXrdpfXiD1EmboRjZkBEQH8im5B0t/X5eD8m8XSlJcZxW55vuK8j8uQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phk0AMjDk/Lt5i91o1rXHDzRh12uswDW47G4ZUcluoc=;
 b=mLRMPiNUCW3Z37H1iLwpbK2RjnA2CA/GnMgxiRguvqXAnXQhZikvzjVcBPV8EuUe+mvr08zM8WOQVg3zLktz3QsCbgeKaSO/FasdDbiqq2lJaVTG7mhWyZ3xFI90STODuk3j21oeD09vdEhKagT1UF9bdson5GSBgc2phCrak2U2YWNdhcWL1O428iNReKlkLS89ssZKisK0GqJw6rMhqf2KSh/V3HfWmprxq9ZNZ8+RhhNTEH5x1WOrH9/X0nolKTfmbWv3x34sRq7Nk5O3V8l4tn5fKKkPO+eYjYPFMgTSnlPMY8y3ztno8TtajzRFV3iQiYVygTkZmqPrEqPVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 14:19:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 14:19:49 +0000
Date: Mon, 18 Mar 2024 09:19:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Luca Weiss
 <luca.weiss@fairphone.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Imre
 Deak" <imre.deak@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "drm/bridge: Select DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE"
Message-ID: <7fz7tg63pul4frzik7g6z5j365mia2yg5e7iyo2ukpzkj7t4dc@tlsculuypoc7>
References: <20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-v1-1-52a42a116286@linaro.org>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-v1-1-52a42a116286@linaro.org>
X-ClientProxiedBy: BYAPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ed1841-d6c7-479d-dd41-08dc47567833
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeH423FZIpMeRjhwvYpmixJz5cIN+E0g5Jv6fvOY5y+GcgdpWrSgZHzaXT52F4oFSHLiOh3GgXwoiNz6NTPEveftxqlqP1IPom9MjowBfSaJ8Td84SYt9VNXpIIwa/a5gY4640FFOrYnxklrHz/DDPUSWWndpj9pxw+VaM7xo5e+m3V52RMCrfJ+wH7RkMIS7UIZ8CPWzQpGVSXmBB8d8QrL4xBL0tJiViTyd02vsRjYtmOL5rwQc4EpPCWbUDZy7PhSiznf/a5iJu3m++mcV05Z5ly/yoD41yRKVIU7R1YTrkozdCQcckKzpaHxkViQ398vsmWAhAo0MNB9HZO2EiEt6EwHyI2QlUkoUPZDP893dO7R7Xr1RqdpxpaNfAp84oegyTTLtMkxrwBMp4Z2ReLbaFCn6RVgm+9Vf0CVeMMn/aI6BtgABO79/T0t1AMjLXHtcr6BGhQfOXSx7QmvNaoc1ewqDTwPQZ1Q+GM5Pnw8zosnYtmXtJMR534uO2loRwNp9lc0GW0NEkmraGuJDGJ94m1zLn3a3CIkXIZlxQCpsR60j8Hakvey6CLb494Thq/BoBn2IH9RVF13S+P0jgC+3IqMOQ6pjRtihae+NqjliO5+BAV0/4M7SNDJq1Nc3/lTB8AeMUm/gNFLT0A7Pwrel4jxBzj+F8556XpYmuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BbKx86nNiuo7yVZGtSRJ0feItdk7Y7b2PJdK8e2p+Cw7cQdNaxfbYO6PY3?=
 =?iso-8859-1?Q?nIadFMPUQuYVHiu+fztUIMc/EPwfSOL/etOENQfnZ+Uh5d/zxV0EN9VuyJ?=
 =?iso-8859-1?Q?tw7p45keVuizW2anRAuiTFVxMOfraEHd5AwK5nvDYZ8Xy4lRV6s/ae1+1S?=
 =?iso-8859-1?Q?IluYIL/LlaD5w682m5aTXZmTYiIVgDaoKtsGB2yQFz9PYmn20zi5GF41Es?=
 =?iso-8859-1?Q?uRUgE/9V+K/C2SixIX7HiorytxogZfBpP1ql+HYJWojokppPfZGeMZbe3D?=
 =?iso-8859-1?Q?D+YdeEo2mooMJ3Es6XUmamfaVSzBXavDeT4o6mWfgPhjQd1X8E3JFkGpJA?=
 =?iso-8859-1?Q?Ungf0R/9oN/TOiJ9lzEAscFNgBIVNrkjwIOchLIa64jCFO0uhb/swyzvZh?=
 =?iso-8859-1?Q?kYfhcTRTHTFnh069a5AXGay5tYEd/ajvU4YPxlsJHEf4BIcVd+OLoTLDSR?=
 =?iso-8859-1?Q?3esp1eEM8fj1FTrkG0mrLFr0sKs3mSzNtUkyvg0XLnC9kxVEatqMQx9FYO?=
 =?iso-8859-1?Q?MiW4NJkqaAsg+vLLfrp0xSOMem+o3wBzY7DtNM2ArcXx55Pp0dTyz9WaO5?=
 =?iso-8859-1?Q?3aBp3Jn0wd8VY5NG32kTkB7WpQOcjIBoJiEBy4LSo+FqCW9CmIK9uPSuSp?=
 =?iso-8859-1?Q?rHtAdzhyOzy4XoVgVDasS9/P6tWUjNkOMA5bsFlBfQRiSOIy3YKLMoS5bb?=
 =?iso-8859-1?Q?0ev1bBg5Gi06jfSjpvObDerUXGJ+evSiuQ4sMdTA0SMpk2HmFD9aS2D+ul?=
 =?iso-8859-1?Q?yuAAZLUWdD05Ywp3gb9SbHjFTEsQe+DEGc4BksS3NQwL+1l80Kqrt8ZYVn?=
 =?iso-8859-1?Q?k0JTMwJc01D3+g4DUODlpCfuVXAE/LbTv3X1aYKAzIHqhEcFXd0Fcu6OPa?=
 =?iso-8859-1?Q?zitdG3pHNGk+trMKpYGRe0s1u5/Y3EGD1YadwqgWSvlxawVGQsX/r9mMJd?=
 =?iso-8859-1?Q?++9OxinrxvLxYndTko5Sjuu/PuKqnXcELSzgVBve5tLoh1ZWEQOv+c3tWA?=
 =?iso-8859-1?Q?1w/oOfb1p2CL7KizNBPakODuTSsk4IcONgY1oar6AkK3fWABVJf6Y1zZQb?=
 =?iso-8859-1?Q?AYC93gySFcMyChlc46zmQMcgATnDB5nqwzFNFlsKRH+FRu2xVsDpqkfzW7?=
 =?iso-8859-1?Q?nGT+nkxtbqvq2R9jMRNuG3zIv7yGGFzmCFDffAfia4ed4ZsvAbIbEYkUDt?=
 =?iso-8859-1?Q?/EIUBCOZ1wC4b4+K9xbYgKmpiRjf9cY4WW+bYKFqBIWGZ0k7+AIc9ShHUP?=
 =?iso-8859-1?Q?VIPI6LkNqC9mmB1setqe69qn6JlQRo833YZ9v7CuuABo2BGn5NKvPTmkb5?=
 =?iso-8859-1?Q?Je7w9WpGdF2AhRcxqPKOb/E/YkzIL78RJzP4xlDGcbB46okQ0k3eOARzbb?=
 =?iso-8859-1?Q?MXO5Di/MfFPpEnVvtATv59N2O0GQiwe8Py1x/HxFbi+NyG2FRvRSPqIh82?=
 =?iso-8859-1?Q?F3CY6PKvoO6TIt0E9jqLbMV+X4VH1GQWLI9lCsqK+8ks1fyg/IGU4apvJE?=
 =?iso-8859-1?Q?SO1A8wIM0lwhNuXSu6WS/3+CAGG25zaWwG5JA+L89tFzZduwvdTdddmAlk?=
 =?iso-8859-1?Q?IdnvDfDk9QhGJ9Ie2HDokZW1ALZOLR4fgbBgrkTvMk5v0Nq+8DmFdQ0ytR?=
 =?iso-8859-1?Q?VpfYkDfx5Lc+obLIe+ByUMzxEGHnajsqtrGXpxYuB/Q64Ss+eD3HfXvQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ed1841-d6c7-479d-dd41-08dc47567833
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:19:49.0079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEKfu6gbQEHgi8Xi0pMbZHGjH1NVbLYGkE8GbjRUY2MZf3XAyZvzsu+JnosjpW2WQb8+jKysflwrHJ2t1QcusDVp6O7unl2gto9J0Xi/ghA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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

On Mon, Mar 18, 2024 at 03:16:21PM +0100, Neil Armstrong wrote:
>This reverts commit e3f18b0dd1db242791afbc3bd173026163ce0ccc.
>
>Selecting DRM_KMS_HELPER for DRM_PANEL_BRIDGE leads to:
>WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
>  Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
>  ...
>
>and builds with CONFIG_DRM=m will fail with the above kconfig
>warns and then multiple linker error.
>
>Reported-by: Imre Deak <imre.deak@intel.com>
>Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
>Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>Fixes: e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE")
>Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
