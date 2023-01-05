Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304DF65EAA7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E508810E6FA;
	Thu,  5 Jan 2023 12:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AEF10E6FA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672921662; x=1704457662;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LzqI6pLpGEcfyKimY20IWfm5/MrrsvgZ513Rx8ZeAEs=;
 b=ePGsD3hqWYpNovpMB4sXLLKa4nEudSRja5tdF6AKfZsN6GIlgzyFVysI
 UuxbZEs3+S+mJuBa1/iABZ5p4Ij9bbIB+PfjlHI+45YAEfLuFq5cw5Xql
 NtZ14R4pNOPpsrfvdBnjJBwDbmvofRgP7L04Cv7V1wwIQ+DqeL4anhUFK
 sctW1rY80j4kqvJcBXbkz7gPs/r8AKAnGKh95683YK0G7V5dD8hRYyyH/
 pPTJXKxblt4U9a+xo62DSHZzL7RiIcuOHfG6MvyAjs1C4hkqopW81RBee
 2+RELl4QQnO17KriTXOvAXPFBMxhJAaZgV7YJSeNEo9oSCpH+w1Gfgnu/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="384483998"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; d="scan'208";a="384483998"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 04:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="763115145"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; d="scan'208";a="763115145"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2023 04:27:40 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 04:27:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 5 Jan 2023 04:27:40 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 5 Jan 2023 04:27:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6mtdxzfToGKy7UnDwo9U2Le02Ogmbus7j/Ub4zjggx97dMh8WdrPb8P/RMNdHRx5VPZ8AQyp9Gi3vNLdIC2aq1CzNSOjHD4/TYfXxR53KAoGlfJftiX1f6Zm5koQ7S5fGf7qFsqjv1cYK1sV2I1gK+AehcNcBo8B9m9CzfYC4Gdik92JSxE4DcHek5vwSb+wNZIRVFJ0wXwhEfaH4t9ZP6S18U19HFYtYjyW9M6UL18o3kVIyBDZsbzYuUWMmfNmZhtxtVBiwlI1Cfn5JDJnt6TBPqVy8524StXg9AWDgXvkLfJza6RsjdXucbdGrd0GTaYAYgq37SyoBPJ7Gw8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEaQ9gvCSVr8eUaiXNIYUU5AZJAaOB5fNtPf0VNUZdU=;
 b=NAJf5loKHoq2FNxhfO5IzxKWh4582loHY3U2iuKWCfrds2LESqTtiYFec+Jb3aiXbXHs0cShLKaDFUie4EhcATg1uysvedn/1YYCAWOkRhdpwIxoagS5crjN6OXftxW5p2ZQDtP3GX1hjD2fQ2KT+7nT3Vcngouba9GxBi7z374HEkL/Hg15G4LiQXRxIHc0TaUopNiH+rqsGJFjsqh/48Q7EW7Nx6cnxbthsUZGJ6JgoAcu6uD46vDGW5wG2d9Si0mQIuodVCOn2vD/o0v4NzU8lWrlW90pFAZjAm8MyzxTBSabitDnWgNk2SvtRWKGn8++7BOGMQcv74xu6ycfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 12:27:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%8]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 12:27:38 +0000
Date: Thu, 5 Jan 2023 07:27:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: document better that drivers shouldn't use
 drm_minor directly
Message-ID: <Y7bCNYSqqZKyCTKW@intel.com>
References: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
X-ClientProxiedBy: BY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5242:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7365e5-6d00-463b-f12d-08daef183b12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hnuhfceHiOSLTk6CTOqVtc8nqPZzZTEHKFPzvRcoQY9mlGjuZ1j3VvMmhWN6fIkQA1GP4jSWycNQ2nSOjdVqKSjx5rZjxq7DVwNU3SYzCk4G/XbscACGWSsERaiBCUvtjDz87l0Jn9N2lETxzjgLYWOjXRDv2QFB47QAnVIYLgXJJbn3v73+crTJDg0GHVfHpqQyHg8Q+C1Esb0J+CMGRTVO43tvYuXt6V86wSidQy1nAU4hu3GiaEraxYgPHHSi4aSe5ZMc5Rtre76kusibgsi8tEUjQGI1JH8wdFrlAeXcjouS8Nwc4MIakksaIvIBgAb1cK65zwfvjb1JzBeLMwvwIGeBupuNxGMuPgF+2fQaNfjcuo86tWGa0syOWI6JliuqAk1FUfguzvzxwD+91SeyDxkizPLEnmxcIcHf3ReJDKC7hkI+zHudSF8oqt6wCk20qgJOrymFqVJqWYn8unOusCDvpolncMp/Nd9s7RJ7RDbYQAmVqolf/qASb4GlxGEFAGylfJeUMu6nVLELKmfjBGTtQDsJSX6Rfdn/FPVSjKaSrU71ihPC7dkZmajQY0TlNZrMl+tzzoM/UQ+MHzOrt5qSmZSERJv5CyoGWuq/y5tvySLJ0MlCm0dGeH83rgYZupm5VHuQNOCJv2vKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(5660300002)(2906002)(8936002)(44832011)(8676002)(41300700001)(6666004)(4326008)(66899015)(6486002)(66946007)(66476007)(6916009)(54906003)(66556008)(316002)(478600001)(6512007)(26005)(186003)(6506007)(107886003)(66574015)(83380400001)(82960400001)(38100700002)(2616005)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KXgXvAhyaAo2vvz14BhX2ls7D7JEPbT/QAzo5a48CJ17GIFG36lJMSwdC4?=
 =?iso-8859-1?Q?5g4QGsbieRKGFuoPD7X4bYlRO9RqMtH1akqY5VKJnD8hEo5S7vn6NPKJQD?=
 =?iso-8859-1?Q?P8kARGU7q7hUP3qm6Fmd3Fp5plHZKPQBmgW42hnEoc4OapjUIBu6//tO83?=
 =?iso-8859-1?Q?WQvQS6Ock21GuQC9IJx6kNq9wEtpIn2VWWJngbypMiEMtfkCqyeXFobRjq?=
 =?iso-8859-1?Q?8yIQAbcEjH6pu4+T65VD6WaDPuiRBfsUqaxN7qmD0uu8bHAjJ0VjmUglca?=
 =?iso-8859-1?Q?lzE3BXYlpd3IfZaD2qCuXfjmY4+EYNsc27LbyBnkDHVyjSeP2Yby1u4SHU?=
 =?iso-8859-1?Q?yA5RdfMlD6sLjFOMgzcQsbCR0PVHFlFUS8cbvRLTloGAjFFaQwN9HW+z5p?=
 =?iso-8859-1?Q?LT3sDTP3wG5flvQ6WCiqUZHi7g2W5nitOJhZCOkyUNlpKEANbiFMQr0IZu?=
 =?iso-8859-1?Q?MCJ++jKZTVhVGxB1AFK1XdraKfL6Bic2MVq+aYr/wOzUOm4wZ/w0kwftDU?=
 =?iso-8859-1?Q?RypNofZH6M0OM5ZdoW7+DtuI1qNuQjZEb+KG9Jj7rUAyrtUuAk9RhIO/cg?=
 =?iso-8859-1?Q?c5u3aafkIdMxWqBcIXwslall+44bvxxYxWopKLb89L5ZWTkx4a+rQHchb7?=
 =?iso-8859-1?Q?uE1LDPaZ4dpYMVjNfoIfASWM6CSWhuTBO3v1gmRWy9ODE0wRagz8r2KQ4T?=
 =?iso-8859-1?Q?UXIhnlLoRqYiQ0gWPguLhbDA88ukPG3YQ/11KAhV6eEvcI6JcfRCZp9ubb?=
 =?iso-8859-1?Q?flIiBOGTxW9Q/g0Hnxb2YimXoOkqEOgq0evJF4GZHjzobanTrTjBGa3v7/?=
 =?iso-8859-1?Q?uXOBmHu06NIP8cTxiqavaq3h3/3GVNc9fNJvatXlj7gCyW+Bv/W8qK6IPD?=
 =?iso-8859-1?Q?aYjDheHGZXT+COqSWcKlkZtwHQS9p8Ds47Y8dOe8vnHkINV/g2qYUkyHOL?=
 =?iso-8859-1?Q?neUGt80L3xTigeqR3IJPkQ5M3EU6SH9HoiVDNn5lk39oWiPV+eG9GxcuMm?=
 =?iso-8859-1?Q?lnFXM3lmcXmD2X5caCb9wgATI340zVsy2xzn4xr3guw0PCeXZdT0XCchYB?=
 =?iso-8859-1?Q?rcEnXfPyhtQ0Hlb0vP1ey/Fl0ndHWlkyfrg8pFcxCOj1l9c5GYsH1V4MxC?=
 =?iso-8859-1?Q?slslPTXVG9GV4KNrLLyPgZfqYEoGfDFXjVR4Z0JgD5Vbs8h+uVj6YxffEs?=
 =?iso-8859-1?Q?DDSKQ/v1I2Ez+VtOmVKXHoaMEUI2V1XgIBwFlKiP05bkEDclpeovdgY0w+?=
 =?iso-8859-1?Q?ZUjwCU8yWutCYeGFHkpf6atOBVUelrY3t3lc9ONuULA8kZZwCiYa8LOzOs?=
 =?iso-8859-1?Q?QBomQn01mXzTEEsnU3dlV0X872p3bJ6gksUngjKSbfvc0WvWDlkc0OEBja?=
 =?iso-8859-1?Q?/EYE6Tou1asMjuw51ukNJyIfTx2aLhSJBWIWOCtDQpUL/020UlZrAMHFZ6?=
 =?iso-8859-1?Q?tdiocRgT0o+jxCOEDjwFnxkrT00ljqJCUCoOStY+vXi3+Y8ffs+X1ohC0x?=
 =?iso-8859-1?Q?mzgkuqozrknlidXKeiTqbTeVpjDxLIn2EJUb69bzqdOpxsmpo4NTPiEuFu?=
 =?iso-8859-1?Q?vP5DyNnKm1h+RQIKBtqG7rjTjG6hzaiT6/UUrFLbMrgArBXU5eMR3+Ubg2?=
 =?iso-8859-1?Q?1Z9u3KVqgfGaqHEgEgDkjlWEKciA2Dm/QG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7365e5-6d00-463b-f12d-08daef183b12
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 12:27:37.8665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5Wl/ezZ4r77HaT35S+PgzfOGBhm/pwW38/xXMDgsRWHtIJECZuO4NOZbf5Zhf2t6fv4MYNHe9FlVEIEfMUSAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
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
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 10:17:54PM +0100, Daniel Vetter wrote:
> The documentation for struct drm_minor already states this, but that's
> not always that easy to find.
> 
> Also due to historical reasons we still have the minor-centric (like
> drm_debugfs_create_files), but since this is now getting fixed we can
> put a few more pointers in place as to how this should be done
> ideally.
> 
> Motvated by some discussion with Rodrigo on irc about how drm/xe
> should lay out its sysfs interfaces.

Thank you!

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  include/drm/drm_device.h | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 9923c7a6885e..b40e07e004ee 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -87,10 +87,23 @@ struct drm_device {
>  	 */
>  	void *dev_private;
>  
> -	/** @primary: Primary node */
> +	/**
> +	 * @primary:
> +	 *
> +	 * Primary node. Drivers should not interact with this
> +	 * directly. debugfs interface can be registered with
> +	 * drm_debugfs_add_file(), and sysfs should be directly added on the
> +	 * hardwire struct device @dev.
> +	 */
>  	struct drm_minor *primary;
>  
> -	/** @render: Render node */
> +	/**
> +	 * @render:
> +	 *
> +	 * Render node. Drivers should not interact with this directly ever.
> +	 * Drivers should not expose any additional interfaces in debugfs or
> +	 * sysfs on thise node.
> +	 */
>  	struct drm_minor *render;
>  
>  	/**
> -- 
> 2.37.2
> 
