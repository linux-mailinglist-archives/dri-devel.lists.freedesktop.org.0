Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E46745AC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99F710E27A;
	Thu, 19 Jan 2023 22:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013C510E270;
 Thu, 19 Jan 2023 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674166552; x=1705702552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fFJeOI5Kaqe3r5v2iWLTFXRnsQMXxnDr4lkdUq/99rU=;
 b=Z69Pkhtty/ck6t4k3tg0OeNVPgXJBAsFxcW6Gxz7lAj8GjND6qPHiiyF
 0WVvXnI7WoL0CmntosqZE6sfdmbyAxXPoxyx2psHcB3GcfA5yQVBNo3DB
 jl6WH5iVWW0U2+KZija9FJ4wvdl6XvgqKTKzTshFaWcPSGHILGW9Yk9I6
 U6xyUzJUbV8GVLzv9RrUvJU9zqB/jmqQCInngc4FYRbM9lANqp1Q+yvh0
 kqan5IHy0BloTgwkje4pfHFuYt/qQqaIr0M7s4+hr0ACkBp5zpusWx3NA
 JW4hY4sqBG9z7boXHGHJqdWQQJdsvrZXy19XgVMaEAdpRhv74j9jo0ChH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324125195"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="324125195"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 14:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692601275"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="692601275"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 19 Jan 2023 14:15:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:15:50 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 14:15:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 14:15:50 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 14:15:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRk174d2A6fKwhv+WnOJdZfF/5fYLGBoHfFI0J2EPYRALxbyjQXfoXD6o5ZMYlEmmKXHQIJnjBXlXEtsMUmssyXUucbeVsQVXfwZ//OGtUe6Cg4Wp6OeWMGk3R5R/C45POVeeld9bnnGETzabtUmy2a3VP9aPOUjcCkJ1PTNaLYciL0Gry4Zi8WcMEjkdoj+ILnZojEICqSSxNmTnQj99Hfi8cMW3DmbitL46xBEZmoLMwUMBHJixYRKIzR6fecB6yGBexQyK8JobNAdsaErW0toc1GSSg9G/xZV6FyefkNY1IX8mUx7cH5bX6sNf4J+uX24NtqT55/DCHs3E47rvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG7+EE6ebbF+1H5QZPJc3Gmi94iaPyz46kcf2Nbm8JI=;
 b=JRZV+QoQm8H9imo641hz+NqR8m+vPJrEupr+P0qcWE7zEUd8nrVnsiiCrs9HLfm6f9ajuTYQZY12yqB7DznljvRYRCOZauPmDGbv9/7Gt2v8TP79R7dQAae2bHvOcIgq9Sx8HQcc3vBtzdifRK8kmIPsMi1mhvLvmFTWESwQ/3+5n6kz4WnVl7/xAlaM+iNu4N+ZRSi3x5AVzFZUY4MRuCqD90F/UTsjwIOp0KZKV5QbBan1nsE4Xjxlp8cW5xUUjddrTjAhkTOEoImFVOnmkmVvlvChwOl2xfe/zvtZME4QBy5GqSB7HCAqGoJ9+ZdwTrdf+9xCDFjEr50zQI7L9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 22:15:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 22:15:47 +0000
Date: Thu, 19 Jan 2023 17:15:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the drm tree
Message-ID: <Y8nBDk/CRozNvkQs@intel.com>
References: <20230119131222.4b7697c1@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230119131222.4b7697c1@canb.auug.org.au>
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: aab55321-48f9-49e0-413a-08dafa6ab722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AfHTFpZ3EoPAEzvMN4RDyLHuIT0t1cpAOT1lPSTFkZa5dhTWTC5TSvcPR7cLfwzLbY+06r4Hw1jdhrPz8U2E5PIMzsPYd2JkN6DquCdbXmIS1IMR5DHk/I5gtDyClJCbiziBc4MB8STnQKXLonCGORT0gdntIx9LDO698W83BHITbr9e4bthvauiUwlEs5SHfn4BZ2jsJ87ajD+AfZgBcXJKnaWaKN/7/G1mag0Ua1rl9hNCUREFy6MSisIKxzi1FPmQELWZs7272n+TjchBh6v9OTYLOuyO1jd5rNYz8d76yYzrNF/Ax8kD3Lhzog4GOMPZHZVSD0QYmHu+VKzH8RNnqn0JmJpjjawe1oIer+QHvflqFQpCa09a206jjDnSW9mMw/V3fVp79pAq/vy/kxDHdzdS20pXpeGLcCu3Z5VjbIPlRwQ3NxlrQkbWsgEnI9rQR64eK3jskvZGGEAy6GE9ZGtzGbJ8uBRf51YokQmbWT4VIpq0+eEc3JOMDVhRQwllJ863o5Qq+/w/7f4gOGdnlpMLD9Xcw8/zcPP8n4EkQKYN6fd3QbPsmtsdIbnCdFnHK7b3/I3i5weOa56tMcSsFmrdlq64T5QU2nEqlmc8TYAOfSY5It+x5XJl4S/p8A6nLQnFuVHBRzQZdQ2T6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(478600001)(86362001)(66556008)(66946007)(2906002)(8936002)(5660300002)(44832011)(66476007)(82960400001)(38100700002)(316002)(54906003)(53546011)(6666004)(6506007)(6486002)(36756003)(26005)(8676002)(4326008)(41300700001)(6916009)(2616005)(186003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9nMESbcnBX/FJJprEa7eAPwqxNy3TEFpvHE1ypwV4QfGTinRCY0VNDqnFhMT?=
 =?us-ascii?Q?QxaUUaW/eS1nKw+xvNPlwqzUyNX2XQMbEzrGc4IhTmeoAAFK1Ni0T8gyQRMk?=
 =?us-ascii?Q?lRTeYSoApot0SWSW+LxjpaqRw/051dFsp+WYwQFUZ5hfa019h8nX4HlGZxOm?=
 =?us-ascii?Q?Sdysu7282pWW3OlirTJWXYWhrJ5CGlp07mFVJSy3Tqbug0hXmoyiK8xcccf9?=
 =?us-ascii?Q?wt8fkkf5Zy9+nvozQIy0JA3K9Mivu1hC09YptFPOqLh3c0L3nB3MT6WnTAiO?=
 =?us-ascii?Q?wgBhGxrM2gf49H7EXvt4wVU1vh4zmR1VUaJPlvV5BZ8DxT4Tc4I6RotWtSsr?=
 =?us-ascii?Q?4nvNeZDtchcNLgCdfgPCEMsWx2pSev8qixdSeBFy0J977vrpbVeYf1Veh0p/?=
 =?us-ascii?Q?8TCs64QCvWp8cwcS1aJ4x7h9xbfr0sFWHpIjqOIUO2S3ftc/3yslW3zF9UQh?=
 =?us-ascii?Q?vRwpXNiEaJkepy2XP1aeXxzpxnyoWmCRZlxgRUo8Pe5E2InsRaJN24xiAG9A?=
 =?us-ascii?Q?CYxTV8rGT8BC/d7qaWF5ZMg/cphx9WlNsxqwYTApmyCkaTZAUlu54VSl3Uvx?=
 =?us-ascii?Q?muXRNFoxy4EKV8YQgTfxjU2aVDF3Wjsm3XK1wRRT/ZE1sCqgB9dH+pf9lzKu?=
 =?us-ascii?Q?LkD9DC+9Zy951nigF2XA6QfaO/NA+8uannfKSktdraCZNBYErab5Q3cFoU4T?=
 =?us-ascii?Q?fyUesKYCYHdHvDlyOJOSBhzwDFTibMYlOk4gbeeIg40XM1T1vQgNd0Ile2Pt?=
 =?us-ascii?Q?th0mlcflq40SW5TUNUuZf4Xcq5BEkC3fn3kojk+jeF5IgJ5V1xdJqMAsHGJW?=
 =?us-ascii?Q?AcnOOu9DXfFRy2+9qc4wS0zpepmhMMpuaj6qJ8MMu1uUiMmseDnOH9k+ArqP?=
 =?us-ascii?Q?aowgnlGo/aK0/thlb7+vj6cHsxRNKukhO4DeTWATJf4wCmhDo95NOqD8Xd3T?=
 =?us-ascii?Q?h1WSWj5Y1AVKU4Q7ZI0Xj5GsG4YyAy6C/xzKVkCSKl2GSUIKgn4g0lQXHeXJ?=
 =?us-ascii?Q?GbkE+ihbsXX0Y7Kx4N93r3YaqHzsssutPobaYt9d1OU4HH0Yb4PXwCzS3rjw?=
 =?us-ascii?Q?RkfBNTnJTGQW/0tZtqUl3UEnl1bbDz1fmIxJJJo3MZmLUHxq6s/da/Macxp5?=
 =?us-ascii?Q?wvkYBU2jnMTkSv6OKPPk4JVTQ328ZOQwf/yIFBocfjxbu/SbYFA5pe5W/vah?=
 =?us-ascii?Q?643ESEUmFSfUtqNfnFQrTJS/8eCOdZcc7a6Fy3pSvmbOOBT2XyQpmYCuNUDb?=
 =?us-ascii?Q?6aqLG8JdneVTjVdpzK9jf8+nlbnIs/qIB6QSOl56kmTkmVHTFiH1s2PInXKU?=
 =?us-ascii?Q?4IlIGBicGKqKUVuHABGXIVaqiZbZtCqP/d2xWIt2a9Fko2Bl7NYmMRX7xQSw?=
 =?us-ascii?Q?HkYzA4R7GbGwmoeS0K+jaZHxnu0MbhzsAh+uQTwIRzCMdlqtDGiM5/p4qC2I?=
 =?us-ascii?Q?RURDQ31D69Tv2f1WhSteXUgotkmNm5m0uPgNpjXHIAXoDPQ83kU9PHcR22Lu?=
 =?us-ascii?Q?yxvJxJ0Rnr+eZBriuBQKgstejc6xv4jWfFcd8M79Zk5uaGffSiFvHpq5aaBI?=
 =?us-ascii?Q?UwtUeoPsS77RHn1FZ4S5cKR35nE8cdsvIH80nBa4h12OzxDSDz0+WycT5Wvg?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aab55321-48f9-49e0-413a-08dafa6ab722
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 22:15:47.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6VfKVssIcRrW9J8VThntORGmskb3vs/4J5eFO/BpgYh0HgqroSgmUMeagTdLWA7slYQQO+pW+4yMjSSqnIiRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 01:12:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from drivers/gpu/drm/drm_fb_helper.c:33:
> drivers/gpu/drm/drm_fb_helper.c: In function 'drm_fb_helper_single_fb_probe':
> drivers/gpu/drm/drm_fb_helper.c:1968:24: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?

It's a silent conflict of

cff84bac9922 ("drm/fh-helper: Split fbdev single-probe helper")
with
d1d5101452ab ("drm/fb-helper: Set framebuffer for vga-switcheroo clients")

The resolution is to reintroduce the dev declaration there in
drm_fb_helper_single_fb_probe()

+	struct drm_device *dev = fb_helper->dev;

I hope it helps.
Thanks,
Rodrigo.

>  1968 |         if (dev_is_pci(dev->dev))
>       |                        ^~~
> include/linux/pci.h:1151:25: note: in definition of macro 'dev_is_pci'
>  1151 | #define dev_is_pci(d) ((d)->bus == &pci_bus_type)
>       |                         ^
> drivers/gpu/drm/drm_fb_helper.c:1968:24: note: each undeclared identifier is reported only once for each function it appears in
>  1968 |         if (dev_is_pci(dev->dev))
>       |                        ^~~
> include/linux/pci.h:1151:25: note: in definition of macro 'dev_is_pci'
>  1151 | #define dev_is_pci(d) ((d)->bus == &pci_bus_type)
>       |                         ^
> In file included from include/linux/atomic/atomic-instrumented.h:20,
>                  from include/linux/atomic.h:82,
>                  from include/linux/console.h:17,
>                  from drivers/gpu/drm/drm_fb_helper.c:32:
> include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
>   299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>       |         ^~~~~~~~~~~~~
> include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
>       |                       ^~~~~~~~~~~
> include/linux/pci.h:541:23: note: in expansion of macro 'container_of'
>   541 | #define to_pci_dev(n) container_of(n, struct pci_dev, dev)
>       |                       ^~~~~~~~~~~~
> drivers/gpu/drm/drm_fb_helper.c:1969:46: note: in expansion of macro 'to_pci_dev'
>  1969 |                 vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
>       |                                              ^~~~~~~~~~
> 
> Caused by commit
> 
>   cff84bac9922 ("drm/fh-helper: Split fbdev single-probe helper")
> 
> interacting with commit
> 
>   d1d5101452ab ("drm/fb-helper: Set framebuffer for vga-switcheroo clients")
> 
> from the drm-misc-fixes tree.
> 
> I have added the following merge fix patch.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 19 Jan 2023 12:42:56 +1100
> Subject: [PATCH] fix up for "drm/fb-helper: Set framebuffer for vga-switcheroo clients"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 97049a26fca2..5e445c61252d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1942,6 +1942,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
>  					 int preferred_bpp)
>  {
>  	struct drm_client_dev *client = &fb_helper->client;
> +	struct drm_device *dev = fb_helper->dev;
>  	struct drm_fb_helper_surface_size sizes;
>  	int ret;
>  
> -- 
> 2.35.1
> 
> -- 
> Cheers,
> Stephen Rothwell


