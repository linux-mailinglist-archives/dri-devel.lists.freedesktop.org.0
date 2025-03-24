Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C2BA6D2E2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 02:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AC510E0C6;
	Mon, 24 Mar 2025 01:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSugsE88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE0B10E0A0;
 Mon, 24 Mar 2025 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742781092; x=1774317092;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8qXlhxQ/dNHZjD+NtJlPqj/MyQM86bPKg/vKB2sWbD8=;
 b=cSugsE88zoxgRASD+hrrueh9q8c9OrnV3xoToPfdDWemccTTYhAm4gZZ
 4j2ngm+rdrT6wI0/He3RpS3Zcr1NAAlAgzgDAI1KMexeHR6NC6XVcJdPs
 xiyAH1g3xs9h83PYP4h6R1mlc46WePHBvqW8C3QEpkMjpRUB6/+CQ+kLP
 xnnyHL5Q9Mo8S71+GuDfqoGLL72GAu6sQzjSE9WVx58K9Dj3CDRud+JWR
 L+VMXJGw4qqWjvt89p3qlEg7rOuBTejCYut81zZbwypfwsKT7DunYn2XD
 FTLV7JDlQOZv7ZA/kQBn+aZnxL1giZUdosI3EGpx2ZPAy1ABl+4j2QYvM A==;
X-CSE-ConnectionGUID: B51qTwcgRsewo0HwmDOqjg==
X-CSE-MsgGUID: sxtMBXXdSIOJCYmVYnC/VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="61488687"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="61488687"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 18:51:30 -0700
X-CSE-ConnectionGUID: z+uNQtOOR0q1sZAohWZ6Fg==
X-CSE-MsgGUID: +HfMHDiBT8aNMCAsjW+jsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124687316"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 18:51:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 23 Mar 2025 18:51:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 23 Mar 2025 18:51:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Mar 2025 18:51:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0h2cOMyfyZtm7+HUIUIEgUi95ihNwR9uqdI/pM1mOGF3ZIXhNXGKjFCjD6N9szJKtSbawuj/QfqixcZMuqifJ9DZ/tfkOR0Q/rW1ngCwKt7vTQs8klIKmgAdRH8rxpypSTE1bWb+sGAMvkX39AQ/jeL4l20kuiHMKw4CAtdiUQpsVZuIDeYyTl+PUvzdBJ6xVbEi8eUxzrHawg5w2KSz9r9wDk2b2F/b0YOfvjL7GlKDmfLA5l9NJt4xsvrtlI4Tk1UP4kHeyq03zVsDwKs0m5vRQ9zcm6RDrtcHdDXF7AFvc2WN6Mz7OEkzTlCVQYD/B0DhkU1FXWOF/TIdiO4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1n6Z84sQCZnMlqMlAeuZ0qMMkvrTrKsCxoyIiAVt9g=;
 b=d4geBMKe+D48mPCNuSlwqXTTqKxPAyfc6vq/7v6/Ch4eOrauQkAxA6zMkQcsqGbP5WjktQzc1ESgITUOCgTxd6tYCA5BnHWZXga7KomdkhgajSO31NOu+0IedbM0zGwM4wIRZxbID7+fYBu5qXLTcW9IjMBfnSfSGufz7OPY8oicDDM6gHUsRv0MkodCCcH27Qd/EV3dWEhdxPikghXLqdtbb9MEFafB7T1r00Pkj8IhjFMJDHRXdFRlBO7lO8Jb6qS40zGM8tHI/tAmoGCHMgskCuVPozSXHiwNYfegXGKN9nOwjYtaJkwG4IJjJ7OouGRRxr2Desy8aYxX1TZLMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 01:51:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 01:51:26 +0000
Date: Sun, 23 Mar 2025 20:51:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yue Haibing <yuehaibing@huawei.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 -next] drm/xe: Fix unmet direct dependencies warning
Message-ID: <vh3lphftnfscwhb7lwjjdsxfkkcmugeiroxkkay4ocgpka5m2c@r5fpwvm3jz2i>
References: <20250323114103.1960511-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250323114103.1960511-1-yuehaibing@huawei.com>
X-ClientProxiedBy: MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b951150-981f-47ca-6441-08dd6a76637d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9i6NKoLUgCUWwdWpc/UAQ/d8dPEXR6MkFkRLs/xKm1DX7uU/i/AM6y4O8Rw+?=
 =?us-ascii?Q?aBTT6C4gHxdgnqAdNI/mOTMEr+njMa7UoYCIlnm6gHIfuWpc9yOpyX5sSoIC?=
 =?us-ascii?Q?reWL43uB2hJskJYyDvYjxe8R61sxM/ttFHjiWmS71124/z4L+rNw5Sv3v9WY?=
 =?us-ascii?Q?O/DXs5nOK+0dvcDqdOw22Z2b5WUox73Zj/13UXByBjxVBy2mLqrwVZ0l+KvP?=
 =?us-ascii?Q?Z+0nwA0IMpa51TrPM84C+fJ2G4FDmf6FDVdH3ioCdT7kEnLryI+fxMxmxtnW?=
 =?us-ascii?Q?B+9MNY/c3g4O+x9TrXH3gp2FJ1VRgLrID2Zl011VvRv5ZwFDVdCBlnctyCZm?=
 =?us-ascii?Q?sTnu3xQJZZ6GIq2+g6j8TpUdsxKljIIPMsyDq94BVYnF4xU8eNl+berXeZgJ?=
 =?us-ascii?Q?o+2ve/HjfPtmkaKouMSbzHiw9VVzeDWwAGnytyhfC/RW2btmAy/sq1QAY+oW?=
 =?us-ascii?Q?NHvmCyviZoiTGKCv0AjcklC40lZGlSfRHaP5bGQuRZOjwkkmBmSerV8AJyaB?=
 =?us-ascii?Q?TkVtVH05bxl7BND2OCS8lf+w093+vrM37852UwWisjAf6wObM52FWKYQO8Of?=
 =?us-ascii?Q?MxaOY8iFBfZlFKbGsEisOE9ZeWxqaArWkwfojCTWtKao7coDMEni95rqmlua?=
 =?us-ascii?Q?FjRT5UMAC9bc/wxNnNM0SGCC3u/uzGf2dKQj+DdtzGzYPV6W/TQXPXREGiLL?=
 =?us-ascii?Q?uQdzJGTT1sh6mDNKoS6Jk9EEthVdh55guSBbPmZ2jDBdJreIjYC/AxEZdfA+?=
 =?us-ascii?Q?3ViTbj/MRi75iK0GRfowNWABX2B0UYMn/hskml70nKpiBnKyqzOALIW07Q+c?=
 =?us-ascii?Q?cK/Ec9m50uKRvZU0e6BroXTYKER4PxEA4281JHA6MYtLPbJI+DOKhRK70EKO?=
 =?us-ascii?Q?dYAtxiSIDd2dkZp30kL8ASk4FsdRVhRBoFOExATdJlN5ZMc6kNmpjqMooSIH?=
 =?us-ascii?Q?VmgpcqeqDn8o7cTkP5ji0dyoYoOPEUPJs6zTwwHgEuA1LxUfXHXeSHU6HjU6?=
 =?us-ascii?Q?JaIE2LwC2lQGUrNszAiB+bOE/+TA1GBJHRO7x48oAA+z4cAZGJ5xkyQHHS8U?=
 =?us-ascii?Q?tsv5BX7hMOZiMsRItw5gWm0vukP0Cf8akStb6A+I3H3MlcQIKukPWSaTJSnv?=
 =?us-ascii?Q?f8Ia9+Q4lQuO5cTohoa/FO8JvHQ4/r5iqoMKjBWuUa94+C+z0cN94Kyaqqx2?=
 =?us-ascii?Q?IK0Zedpo6x/ME5AwhqjBYgd4+kkJ6jBWuuuqEfaJ1v3odXBq7p96I40gPsAR?=
 =?us-ascii?Q?zBrjTg0aU9bgrNVOE2wEbL9ULQFehNQrpF2lWV+MdzfqTu1jV46p0tnZIE1j?=
 =?us-ascii?Q?HtWpJKG0pxDgYTfOr8KCs482HQ0fp7NrBG8Q1FXX9b/L6tt9/VBT7sX8buaV?=
 =?us-ascii?Q?94RWMGyZVYZ0CIOOEp9crpmXzk1T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nCmxtXzZym4YOnxhaRm641kxdFt0J/qrzghwdoL+gmppn7WjJ1jxuoqp18lE?=
 =?us-ascii?Q?L0y37g7M3ABsFoVMpsLbzVVS7fWkrJSbRiUgAnMJKgHCy15d1BCOaMUoKKCl?=
 =?us-ascii?Q?aDzmgvO/hrWhttKVDAqWVcN1DGFX9kGCpylJD56iP7jEUccaTcwgqxUCFh+s?=
 =?us-ascii?Q?6ZOF/SkXmTlyZ09+Yj4dGg0fdUGfU5+dBybIgWfk5x74gmUeGunWzFLh26Jb?=
 =?us-ascii?Q?Amor8iP5zXpESy9ovjSbBMsW203ZcpZJUSffvb8oL7fHf23P3Ncb2iVZG0TK?=
 =?us-ascii?Q?FszuwsayaOglQnMqKxB8vYpmaH8kKTJwZ9nTapMbP0tUhXmyGvTnkKbiNDu9?=
 =?us-ascii?Q?dtiC1ng+lSbnfRQrQUTryQewi9pMdoE+lQ0IDnHFiRkrTJN69rTzcUJ913mr?=
 =?us-ascii?Q?O3ULx3KcHaCUcpXlbzfDHLOYvWb5DWdwYdX+2Xi4U+inxBslW18H/k0YhFk/?=
 =?us-ascii?Q?uJoMf/fh869lRHhPqb6DdKexUuMzjDTc2DHW/K7T+QDaU2e9y6pPH8uFAy5d?=
 =?us-ascii?Q?5yT4sMTy6162F0nSoVCCoXCvabA3GRUNouV+PwPvFRE7yxuGOiY5iySbfA3D?=
 =?us-ascii?Q?EzesSGKoHz4w67WCZEPpMFZB5KVVuYIB3IR9P7Dnf9jNQxUfuKOztXCh6MGw?=
 =?us-ascii?Q?dh/z14D9DydgJ4Wg24X5Ku139FJTDyYT/4gJd4daXUNA8xJ8qHt05BddKLRG?=
 =?us-ascii?Q?M67pBumXwGfZVcoXEwjKi6HDBJTrhm0LjaoUiAh7GoplcO7LkVaZkzI6YssX?=
 =?us-ascii?Q?dhjGWqIGbDTZ2ko+W6BAAlrp6KinnYAcFI/bVAj8q6hUebK2HD1Df1qVtqj8?=
 =?us-ascii?Q?vn8a62kMI12YAhHF+ocTqmDWRYtaqqrtn+AQNk3TCa96bMZxRZ9DYbxA5e4u?=
 =?us-ascii?Q?svbviSfO1COGrjCTSRpQeRCmtXBMGjw6IgF3Dl8w2aj21Y8UMjqsrxZOPcGh?=
 =?us-ascii?Q?cum+4m7KMFzZaqcEJR5UvPZUtc3srNf65FRbWF2DoBXUCjc9e2/NPdlg0KJ8?=
 =?us-ascii?Q?NGIa8LfrdNX+vXD8Qa18T+J+0UmW50XMPTk3XehmTcAWH7pk/TGvP3AHrh9p?=
 =?us-ascii?Q?bj24+7UxrtblRmQwah/DQ3L+VAM9IRRbXX2GFsV7NorGG2ZO/SODTNOMgx4x?=
 =?us-ascii?Q?gQFJMh5ALCzvJ617egsjZRYnSj59TDAUOIYQpQDrWG91tY1d1kAQDopMMv8v?=
 =?us-ascii?Q?nCHTKLt4SSEJESuqJY0zbbaxjaOIZIYu4QK9knSjF6lTlEHIp5W3uX5cj/pk?=
 =?us-ascii?Q?kNG0oUXxxKbrz1inzSeqWTIuiS0AGZs28GIe2HK100Qf0tGDuw08Cnb3iElv?=
 =?us-ascii?Q?JU+zdICDz8fMOrLDoR3w0FnArn5jIHJKOKGD3M8tnmk5W45OQBUlgvD12tFz?=
 =?us-ascii?Q?PeQHZqt1kM7wKv5nEcFf8O3ZdvtGkqmAY5MSGTQD+AIbSEypuzuoeivllVxq?=
 =?us-ascii?Q?8jRsHFNZe3d6tLp7Ou1EBTpEcqdn5z9XO0hFfaNJmARWjZQUnTvfzm5P1BfD?=
 =?us-ascii?Q?n7qT51bVGmsHj7jK1Zw5hL5vxzeNgiI74jkKr77DhURWYpf+wnaCh75KpZS1?=
 =?us-ascii?Q?DJdXeqEVBhvVwnfIF1qJOO0vl71A/ckD2mc9FEGNAF+zElPAXX0joOjgJmHj?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b951150-981f-47ca-6441-08dd6a76637d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 01:51:26.6254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hm5K9A8Bc5yyouDf3eM2Pckqop3KA/8/Z3GsgQ7KkLHhTzGKsw7B7c7GK+/BlMUAj2UtWuHL2JEZ3jk4gNULQ1Mf9ITjHvQudcPvazOx7Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
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

On Sun, Mar 23, 2025 at 07:41:03PM +0800, Yue Haibing wrote:
>WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
>  Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
>  Selected by [m]:
>  - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]
>
>DRM_XE_DISPLAY requires FB_IOMEM_HELPERS, but the dependency FB_CORE is
>missing, selecting FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION is set as
>other drm drivers.
>
>Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I will apply it soon to drm-xe-next.

thanks
Lucas De Marchi

>---
>v2: select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION instead of select FB_CORE
>---
> drivers/gpu/drm/xe/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 7d7995196702..5c2f459a2925 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -53,7 +53,7 @@ config DRM_XE
> config DRM_XE_DISPLAY
> 	bool "Enable display support"
> 	depends on DRM_XE && DRM_XE=m && HAS_IOPORT
>-	select FB_IOMEM_HELPERS
>+	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
> 	select I2C
> 	select I2C_ALGOBIT
> 	default y
>-- 
>2.34.1
>
