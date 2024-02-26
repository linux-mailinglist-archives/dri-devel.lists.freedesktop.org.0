Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD8B8668D3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 04:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AEE10E5F5;
	Mon, 26 Feb 2024 03:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zy6FaIST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D4310E5F5;
 Mon, 26 Feb 2024 03:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708919113; x=1740455113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TO4OAEAu+yj2WYfETyfwdj+0hN5MdRW68pcCjlPQO5A=;
 b=Zy6FaISTC4YgtplDBWPeLGs9SW203jDzlRKDB3s6SmjvEH3dv7jfAanU
 w3TSsVC0eFl8piXU5CPzt/b/tmmFVTxEQr6tReeUDB8B4xA5bgaZ60YtU
 LwWNZvOowJh5eg0zQ3X3TeOXUsC3fUbulIwkyFBmeYL27sryL5xXucVRj
 0pOpq2ZsXf1H/QHNrVzwKWVLlmreGyVOI8veCh6GK4gaxq6RUDAafm3RC
 7R9+ZcQY0/Yc3FwV6kasNi8DFaqsunxAmAhn845Mt6k1h2MpkLeB8FOSc
 llAFUTX+hWtVEIc8AMdYpWh0pLCcLPe7ysDUlpbSTHJxlRkv/19h9ul+m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28611800"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="28611800"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 19:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="37526490"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 19:45:12 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:45:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:45:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 19:45:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 19:45:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb9hHa7n+OuCpGfjHxKZNJi2zxFpHRPx5PtMjHh23lRM/Ck6xVRSfhnecuxG0SwHPLXT8T3jEbj9Xefg8hwlKSJofnQj/HMyd6eOnRYyKu7Qeqgn9FtGMx3HQCoSIZTTrXgE9Ht4YkxVfD+Dw0BTQg5x1+tJ13yR9NPGSl4lC/wffmdLJJUbNmjqRCcb5u+fq5ijp/4fzUr1ZK+sCh03CIMjlcTvT0xt12nz1lb9bBiwrmdiFOcJ5hNIvPKUUPYmrx7Ky68w8dBjosHdPk5FbmogKPBo1KnY69qh3ky4403nMDkq1yWsR3enCxUi1OKFvoSYktjTbKC2K5SKBs70ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53GP58xtJ0k3lo+jEEqx4kkpp2k5vzbMPo/uyneJwPE=;
 b=FraXeIi2LVdj5RyVCwLS6fp72sDChZTZeE/s/1ZEclbRbFLgsYBkuAZAJnGM4O/gDxykpyRhWvdMzEbuwZbunk6X4iYxp1egAWQzgqUhXWEakljY5eaoefShpgW9owSOORsbX/OggCsIagViGoyy3+OXgfjuiZATbs5VN4mjIH6YGZVap1P9e9QRj8JLMk8vsmYcngwPrvSnu+6h/r3dsLscARLs2e7V481TwMppNj+r/1B4lk8NcMGx4zg3HzOg8oDnRgXJY5rNge96aaWwR2jpvaHZK1RbJosJhqNsofyD7BCJbfzZ3AobmuNpV53fDpwCa/Rb7ijW8pZi8sduFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7333.namprd11.prod.outlook.com (2603:10b6:8:13e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.24; Mon, 26 Feb
 2024 03:45:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 03:45:09 +0000
Date: Sun, 25 Feb 2024 21:44:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Oded Gabbay <ogabbay@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Koby Elbaz <kelbaz@habana.ai>, "Michael J. Ruhl"
 <michael.j.ruhl@intel.com>, Francois Dugast <francois.dugast@intel.com>, Dave
 Airlie <airlied@redhat.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH 2/3] drm/xe/mmio: fix build warning for BAR resize on
 32-bit
Message-ID: <qybrvc6fwxjnnt4lwuf2xmdbhznvwzz2bhmlm6m57bze65f6xf@rxbkx74kv6k7>
References: <20240224121528.1972719-1-arnd@kernel.org>
 <20240224121528.1972719-2-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240224121528.1972719-2-arnd@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2b4d36-322a-466e-2d74-08dc367d5419
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPm/x34I8EqT/LpjaNS2iQdtto7a186Mb71fzB3fznLVxZggGgZ9uFe5oCMuJHnrIK1RwcOxV9C8x/1UkgLKZYElJVmt9AYAAwQnkTsoQ+aHT5LsdLkbSXIyKHTSRoeZhDJ+O5cB3Z6rRDSi4yGxLag4yWRCrBtULb2pMBjwLMHxzjEiugIn0d6rJJOqnKGrdQhXA2PR3LzYCHDQoRHAV9Wbi5fEjg8/MXx96XGiCBuaWtWAIMRYRSrSj5VNdICxx3/OycMW8y2jGO5lmNyzfNoFr0IKafK6XuP7bAqVUxTTQD2rBYLs/qRCFjk+iI2Qq7uVYcIipE1eBkiH/SE4pPcc6oBlXqvIx/6vNFlypGsP7xBgb6QzvgtWIY08caeDZQJ85PzNJZ4X/k6x5mEyosd8Bjr8NvZNt+vYuRCcM1Ni7ZQ++lTgaISa25vLtp6/UAqk7F1ht25O8HtxhlzHJCgvkIjY2KuSxGTKquEDZEFw9oyshqYSb6J7+df6Bi9yoE9BOMgXaPnkq19jDJ/RO2mYDsQ5Esg7PnBX2B8AP72qf6zDp7hGQ2MSJb9CwsQVbdrPaa/P7KLZKz+3E3mK/jRMJbly8X58gO9GyHOCxWAT0VqKU5bwXUZ5fyb5ZSJKFHcXZ36bI1DcwLhhLuvruIFIRe5ilMz1jOEYklvTnAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B5JNGb5lAGSyOqgn5mY+wEAdt6qHwuWFzsHQ3stvjt6i2XDmiWUL71m3c1Oq?=
 =?us-ascii?Q?OqAPOvDtlRRyElVfFKOw6JPZ40CSMozBW+e7LSl3dSK0YrIvSIJ9INj8I1zB?=
 =?us-ascii?Q?+q27SCkwi93hdsyTBfjDPihFBNg4E3O5oQVpD4OQ4Oo3LdoAQwUK1zIPO6I3?=
 =?us-ascii?Q?Yz1bw7H1ki3tsdIcaUdektRC8lv8Y6UyOdIbBaO+eNqmeJaE+hqJmqp23sUf?=
 =?us-ascii?Q?IkbhwJ9Pk0YRBOIJ40HhgkBLNAykZjPUZTC6IpOSYY6Fw08Nzo0k7btL/ZJN?=
 =?us-ascii?Q?lePDtp8USY3QtODTAl7bmvJ29IUpW25sDOjqUzuio1/XVW59p8aIW3COvfxn?=
 =?us-ascii?Q?111ljeLuJxTVnYjtcowXmAiEWMum+NGmBttX9YSm8NPzfgsZpaYE9rGj+55C?=
 =?us-ascii?Q?pih5xucX2GSzB/9Ceee8XHS602TOQoNSqOpL3rbOGh0l25OiGFhVZyVVaQJ8?=
 =?us-ascii?Q?giFJGr6LGA6jpwroOT5jkv/RUu6QBXK/qDdomFZLLdZood3Q4JBg3Rs4xKlF?=
 =?us-ascii?Q?WHMDQftpL0HA0o1NBE+OYrEMzzssBOdZBIUJASMgxGIRmZeiw59VJj8qhvAY?=
 =?us-ascii?Q?hq3c/9OBItmpowx/nFb0UdWRg85fHOXRyZ16xAfVpNEPrJdwTdwHNqADFj4q?=
 =?us-ascii?Q?vJ7NI7OsYWv19gUR7JoMLIgH03bT2GALetGApAM0x77cilr5DWYe/QkM4X8t?=
 =?us-ascii?Q?9+ClrR1s1osPrfY0v3rq2L+eUxoxAtV4sWOZJsnSD9bcKSqDMlv5JAVD7VRV?=
 =?us-ascii?Q?TwOzoeBLKJZJhmrVgwHKun7IZPNaycZCL7eawmci2vODGIJIbTums5t5wF2l?=
 =?us-ascii?Q?d04+jJEttvb6dAcJlgbarR8yMQLY/zsHoqJMRCBI10CUqAns/94BlcRx93tE?=
 =?us-ascii?Q?PyNLuT/jQLJB5CWEawxO9D4DTseRBnmijwhZnDM8nqoRJs46TgogIRj+Hmtp?=
 =?us-ascii?Q?sLzvxn2aqKgAqgdTogIbvy9EJwAm9Tqx0JNvleqU3oYWt0whYgthhAJ3fX+t?=
 =?us-ascii?Q?ViO+la43uB8maxNQmYKO2B720Equ33Hyk6XsLhoOsAb5Xma1kRaEr7DvuXEc?=
 =?us-ascii?Q?AbYmMZQ/h6WURdwRXwArEyXk6cS5OnZTJRcc3fr4tgpV2nx75/LkRfU3Gj0F?=
 =?us-ascii?Q?viFETng7+DvGpF1jP4NK3mliROc27/rP9+b8PAn+Uc7OFbRuvGuu+7/hNOLF?=
 =?us-ascii?Q?FCdbnRFwiuz3eL20XEEmRFBWXlChI0ea4eOknJXekXz60Nnj/+QAXX22Rg8v?=
 =?us-ascii?Q?qLhzaACYaJui2mwMByuC0gu3osLYA4QPs5PuReeb4mpyW1yz+HpC8KNZWlcT?=
 =?us-ascii?Q?Mf4220tnUC5SpGtmo81hA4Rwa4CxCCJ9za4XlHS2yZNUt5eN7c9aFtdSqO2e?=
 =?us-ascii?Q?50HTJ2+aiWGNZeViq6L0WzN62jB6nlCrMx21uveTyNTd99YI16WV5JVhqjs8?=
 =?us-ascii?Q?AfojNyn+qb62fhqVlRUu2+nLjhzw4d4nGeBx/47uyXZu0Bixey8qzaVZPLgi?=
 =?us-ascii?Q?nk6m7RNzhOLQMGfK1ARKdZfhGoxpeNlWmz2dA8nqd6lWpvMqSY6DZD4Xbhlr?=
 =?us-ascii?Q?HCpoU0P37hXjcEVUECYsS//AlUwl6ZeutHIK6SbKtWL8bc5S9hhSlo4fTzQZ?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2b4d36-322a-466e-2d74-08dc367d5419
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 03:45:09.0851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88MxFlvvAW63UUtljVdYhVkpgrXprd8nQiZhQIV9ZXLiPF0D/6iKyWNWxF1xHudTjUX55rnWirfBC1+fl0/F4RPdcY8yU4sdBIJGgn/Hl5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7333
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

On Sat, Feb 24, 2024 at 01:15:00PM +0100, Arnd Bergmann wrote:
>From: Arnd Bergmann <arnd@arndb.de>
>
>clang complains about a nonsensical test on builds with a 32-bit phys_addr_t,
>which means resizing will always fail:
>
>drivers/gpu/drm/xe/xe_mmio.c:109:23: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>  109 |                     root_res->start > 0x100000000ull)
>      |                     ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
>
>Previously, BAR resize was always disallowed on 32-bit kernels, but
>this apparently changed recently. Since 32-bit machines can in theory
>support PAE/LPAE for large address spaces, this may end up useful,
>so change the driver to shut up the warning but still work when
>phys_addr_t/resource_size_t is 64 bit wide.
>
>Fixes: 9a6e6c14bfde ("drm/xe/mmio: Use non-atomic writeq/readq variant for 32b")
>Fixes: ea97a66a2218 ("drm/xe: Disable 32bits build")

this second Fixes should not be here? How would "disabling 32bits build"
break 32bits build? I think just the first one is enough, otherwise
237412e45390 ("drm/xe: Enable 32bits build") is your next good
candidate.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
> drivers/gpu/drm/xe/xe_mmio.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index e3db3a178760..7ba2477452d7 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -106,7 +106,7 @@ static void xe_resize_vram_bar(struct xe_device *xe)
>
> 	pci_bus_for_each_resource(root, root_res, i) {
> 		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
>-		    root_res->start > 0x100000000ull)
>+		    (u64)root_res->start > 0x100000000ul)
> 			break;
> 	}
>
>-- 
>2.39.2
>
