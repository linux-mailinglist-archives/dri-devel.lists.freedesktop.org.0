Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8BAA225F6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 22:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA1E10E8BE;
	Wed, 29 Jan 2025 21:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mdr0T9WJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EEB10E1CA;
 Wed, 29 Jan 2025 21:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738187482; x=1769723482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nk0dAo6/BA843TZOicwCx00mE4EnQjP4V0CbPgn8v7w=;
 b=Mdr0T9WJOjGyulbsGHJ5NaKmEXyUp03wCWE0lFzA+uinytMM9m5nCXI2
 2vGoCIq2ETXuaxRNWiR4fmPrFFIycUK/tWQQ3J1t62lKpBOvWA5Cq4kAh
 nRQgFhXPHzWUyybVfVtF0RoGx852Sm2dUVTh6uOWDzjhirj2pO3YjmcRv
 Q4zUZAmCWhnbXZblCxasVeC4jTmAyqClFqR4jR5QeiYX/i9Qs2ie8VykE
 x8JWNqiSrNmDkrJrdU07JK4AngzrnLuu4r0QWKxgH+oB7TpgKvM+v84wS
 Pkd/Q3jF+tdhg1rxQuXP1cCgxxvLMiWtn4ihOO45rcFkyIC62wsl1MY9J w==;
X-CSE-ConnectionGUID: lbiQ6SCzTh+F7uClNgxBaQ==
X-CSE-MsgGUID: fAUp/SfRQ/iCMFKS99nm9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38755430"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38755430"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 13:51:22 -0800
X-CSE-ConnectionGUID: qQXgfwypTdO4GZV6WTgP0g==
X-CSE-MsgGUID: skDHb7zPSAKO+ul9/TRTYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109058977"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 13:51:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 13:51:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 13:51:20 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 13:51:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wq45LdK4sD3TtlSqOm2qKC3axA+a5rD6zoe0Rp822/mVikQ7PTtC0k1qYkIgjKYUFVoSD/whjV0qkw4MLSFMA7uYyENApO4zwObvEiejK2SmYc3rMDCmHKkjcVum6xXB18E93k6hgRmZUV5eXMQiTmjhZ5hKm8eTlm7jtB1olzHis+pQpCgErwxlL8uTQuzL5jmdugVZ55JCCSoniYE3v2vrib5B0cxwDuXOgMKOYvUxI1u7TZOMnZgPlvEfFlIVSYVQlf9lLHEzO/XvhMGsHu9kp7CY3sKlp/6v5D+6PONq/RjOpLFe7oIaNTJDNTglZsd8Fkju3Uz2OlKPkeDNAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8EwEelO/pVBHH+aZyTRBefhNIlj74i1bzPKaLY6ndo=;
 b=hgGEKBZcwErmkGTQRrSLiFddnFyCHUi9mmlX3LRt1ojVlK5NXv7xENqJitGW7wPrgEqT+1RG0WI92hmbyg0NWM6zI5MAzp4UfIn+YKW4kRqTBWR3CjcFvxIeXJvKTggfFjengOkXs7LeEkoTZj1bDA8YqSh0fjGrKW4upiFMahHIMJU9XHpEsMyvSynGTd0YwL8tYEdISHetXhyz93LKbcVFCPs9+fxl2quq7og+WOyw90o8mfpNUnf1Pd67AOi1gXbDcZIM2uLymI2xtWhGBURwjj+7r4S8lnEU5cQyFm1CEzWRW++hfuDKavkOrTtaqbIg1w65a91BfqAhVwb2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.28; Wed, 29 Jan
 2025 21:51:11 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 21:51:11 +0000
Date: Wed, 29 Jan 2025 16:51:05 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Karthik Poosa <karthik.poosa@intel.com>, "Reuven
 Abliyev" <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 07/11] mtd: intel-dg: wake card on operations
Message-ID: <Z5qiyRzkdgwQ9kTP@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-8-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250101153925.865703-8-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR04CA0369.namprd04.prod.outlook.com
 (2603:10b6:303:81::14) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c68146-9bbc-410d-c3c8-08dd40af0b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HGdaaUvGjvBpYZVnmabhfug9QE9XPzXSuZRC0h0pKNM6x1qSSKsJdyX4je7l?=
 =?us-ascii?Q?p5QPzW9t47XiJ2JEvzNWRiTiWC1Of51TtFraZB7woI5et/nbh9WIGtfnQ81f?=
 =?us-ascii?Q?S7cf4LHVT2+Tn30sLjDWjM3yH5xjX+po2Se+iemlCckaruOBm5n0V6/a+0H1?=
 =?us-ascii?Q?dKk6KSZse7n6YjJrHy4AeoXfzUjUdDTYo2qKObd9DVOxcRmau8TQGOThqU3B?=
 =?us-ascii?Q?TvXnR6Yb5LtsZftNUT508trwgH9F9ZNo6NiUpCTzIcAFlmO4fwBT4LwKd4OX?=
 =?us-ascii?Q?sMjetmnm45pjNpS5hvGQVYaeqpEYgm+jW+iOIb2VPog9yVtcmUZn5sSPmS9e?=
 =?us-ascii?Q?egINKanX19lpBkTBGxk+YWky4lMmEfWlDfi/YeAFbKQhwGkO/sZGq1jm1Sbo?=
 =?us-ascii?Q?lfnHoRVcsDWxapNGf1MQk2UwS3XIanlJY96EZY85hpgIU4BDGO9r5vuEvVX3?=
 =?us-ascii?Q?LGT/q/udivTtcXg+/s/SsDhvlDW9Kq0NwrVpd7pcM+NNRLpvne8yyluXrRtH?=
 =?us-ascii?Q?QXlYglJghNNh0Hb89S3YyjYX8O/9zHRK17khdZbgFxgZEnRLA1/sZGGQlsTw?=
 =?us-ascii?Q?Q4KKl0mB3yTAT0FYxdSoXvppelGMLteEe67loHg/PhdjF7uhOMDOCklFye8G?=
 =?us-ascii?Q?B4N6sV9TXf+9rc17kFeX14VTMEWonnhv7Fg7mgrA7uznFTlsMC/iIAWcMrZs?=
 =?us-ascii?Q?zAuFKUkqrJzqRIaEMBwF9j89ZkVlbCAxjRL7De5SsQlyR4x7JAjoUVpOo+se?=
 =?us-ascii?Q?HttKzLvmQkYsupm4kdCzqXdN9W1+jDM6WnZAuGuh/HBPDi5fHhmV7rzIqXCg?=
 =?us-ascii?Q?GQV3XS7IvebZu3jL82JOn/UPtJ6h3l1yellp4kgOqx+e2xUK2lA577lT4HhM?=
 =?us-ascii?Q?T4ieYFXN6wFselijbCDJNdQJFqrPLWBhs4NiOLstHYEOaXLj2m44JQvN7cpD?=
 =?us-ascii?Q?sHaR5kuPBTiXJSSk7Chm/SsgGTvAUGNlyhYT/DHWl4OW3Jj2N6t8ByvUxf0D?=
 =?us-ascii?Q?f4aXh9JFBk/VyKYq1/zqUisZj3tRajy7aT358SyNMzRGPrEOn2yrgrAmqYNx?=
 =?us-ascii?Q?Ylk4KUhs/+fdT96eJE3iNGDE2IwaBpyepVtf1JfymRO6wjL/G1vfY0phCY+1?=
 =?us-ascii?Q?kIOxsrFY5Rz+j7c89IH7aAM5Ta3loYmOGDki+QIh6SGkr19JTqKz1lbihg2q?=
 =?us-ascii?Q?1wSloqhhveN3VzniX+Pnf1Dpdjal9w5RCnc2/tR51lL6yw+vvLb2LIWs+N2b?=
 =?us-ascii?Q?uLxDPC3vV9oiNEIgiiFVwYnOmZnY1a5Vv2eRuB7zar+kZb5bcwt8MVyMWhS2?=
 =?us-ascii?Q?+ZefZzoL0nC8+64Y27O1GL6Ua1GOnUcTM62SD1TtphxEvKqnCrsCDMpRAuBm?=
 =?us-ascii?Q?tIAYZwtUtqO7ZTylIjBGdVoVEICk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TgLi8DoDwlyuQ9xXOt6cO/xFGeSqijyjyuM59w/4WWiLD/I99Pm3lYvrr2f7?=
 =?us-ascii?Q?J38vWY1eKLFe7yE1AMdsoQBVGRIUBuqmMBCGPlowBZQmd7GPH3WBbxhavtSG?=
 =?us-ascii?Q?G8CSwYf8PuAQcn4MpTxFWz6EMj7D+fjHKdwfyqYNSXe/kGhfycXGoumoKj7h?=
 =?us-ascii?Q?zY8yf7ynMSBLBo2vOpV2LFVVSpz4gALEfCjsQI5ph49WTEGtGiRGZGmJrNlu?=
 =?us-ascii?Q?p76y1d/thLEzqkCeN9gDQlLqc13+2ZLGh0J/vo/f+VBEIaSpDdCn8/UUWDVo?=
 =?us-ascii?Q?kkXPqgziFmOLkLVyks7DpEcp60ahrOYPcHXB/v0AVtyIJhT+3tCt+iOgO/6J?=
 =?us-ascii?Q?pXBSaM6fIQsAZciHipzuknPnfp4lQnmF18FBBrLnRU8hLATjF2NjepA7pIai?=
 =?us-ascii?Q?fwRDwiJbluAgZJmXeilW522FwdSp5yRolCufaXoqOUl7gayAp6C5jZVnGT6a?=
 =?us-ascii?Q?1+0+Nai13iAhEewXi2PMC+ChnFI1gs/IXjHwxiD6GTT3wPRBoWO64Vtz+Spv?=
 =?us-ascii?Q?U+KyITbB0cu8a1myK4vSSvS/qjyLEiPudNmnaviGn0/Cbzt5/Ma28/Zgs8jm?=
 =?us-ascii?Q?362Fnkt/Tl0xUgBXMbhMwrfxO+BwanhcquoOFMfEVytYMhvcO7qfeBfLei5X?=
 =?us-ascii?Q?C6f3hNevp5hpjTi++OIBXB2HxSe0KWKIEvPJUX0BH7mNrlUsjKq6Rb2r47q2?=
 =?us-ascii?Q?DgJ/I+i+hzYg9tLNHDSA6OyV4MzNQq9q5nQVGP2VaqVEV6SXQzaXNTvpP5c7?=
 =?us-ascii?Q?a1aKnBU8h2rzmkOcjzRGzG7C/IIUqfVGBL+LO49lQPBs3ub04L0IVhpVETFO?=
 =?us-ascii?Q?fHlNSFE6EDZQd0DmK3EwZ+vkJCpz8bhPlHfDaK/M1QPffuDjliumZ/gNYz/9?=
 =?us-ascii?Q?+4gJAnYa9LJb9ebvRFhGPptK1EuKnrbZQlV8i9B+ObouKhoUmbXZI2AP+U7S?=
 =?us-ascii?Q?Cr0CC5VI+H0Gme1qN0cPCTC7VB1bVaFdVJA7EttQVYVgOXnyaKGMse2/ig65?=
 =?us-ascii?Q?P9LDrdJwhwwE/V+qU0YdxC/IA4209wvvEadnh6Vt3vivZe0j5gMVPtxQxqrN?=
 =?us-ascii?Q?7sWYJ/0r0j1icOCl2DbPhknpzNF+l2nf5RgP/H7cgsf0PZqYQ/m3WFl+N9Fk?=
 =?us-ascii?Q?tehxq3qmiQlXqY9OZUqghujEwDT2TAJNGbfk8kpNO2+OTMFvibnGc432YDhu?=
 =?us-ascii?Q?IIL36Xjh+A3EsAvXIXV3+Amrzb+r7UIxLDdQu9YgdsAbExI+nfw0AHGsGRkv?=
 =?us-ascii?Q?rFzz07+h9IPftw/Gl5/p+9vL6PEhOM957QMkTdZsnw8GYQQUjBWM2Ixv9QK3?=
 =?us-ascii?Q?/mdw+UrXicXWBGylqP7rl0SBwoXLdPH/0dCHWHK26b4BynvcgHiqmr+MwzeZ?=
 =?us-ascii?Q?/xxA9va4erqARla56xo/1MqGWjz+kQCXmeXBwCD3VgpjoRTYy3P6Mh4YI8DV?=
 =?us-ascii?Q?Q7z6CborfDGYISamgfuWB9clsEMEmzDI8p9J0oP8mg/0t9LXFztxEHGjjX9o?=
 =?us-ascii?Q?jZCTygOzcwx9dRbIrbO2NRJL8BiIUh0vxU0BtpmKOzFf8CYZNTz/hrrVjznO?=
 =?us-ascii?Q?cR2u+Y1VCGstl/3zZBCDJi576YOLqEQWhyDVWo8kA2ClUPzAyVzGEPDP8DZj?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c68146-9bbc-410d-c3c8-08dd40af0b42
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 21:51:11.1201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYA3eg6tLjsbybKEJxyyed17zKh/QJ4pZN8SDB03PToOvvm9QNvPBP1Gsl5O82DbKXfDXVPIhFm9ab8FbkDV+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
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

On Wed, Jan 01, 2025 at 05:39:21PM +0200, Alexander Usyskin wrote:
> Enable runtime PM in mtd driver to notify graphics driver that
> whole card should be kept awake while nvm operations are
> performed through this driver.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd-intel-dg.c | 79 +++++++++++++++++++++++++-----
>  1 file changed, 67 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> index 230bf444b7fe..a84153812291 100644
> --- a/drivers/mtd/devices/mtd-intel-dg.c
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -15,11 +15,14 @@
>  #include <linux/module.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
>  
> +#define INTEL_DG_NVM_RPM_TIMEOUT 500
> +
>  struct intel_dg_nvm {
>  	struct kref refcnt;
>  	struct mtd_info mtd;
> @@ -460,6 +463,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  	loff_t from;
>  	size_t len;
>  	size_t total_len;
> +	int ret = 0;
>  
>  	if (WARN_ON(!nvm))
>  		return -EINVAL;
> @@ -474,20 +478,28 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  	total_len = info->len;
>  	addr = info->addr;
>  
> +	ret = pm_runtime_resume_and_get(&mtd->dev);

I'm glad we are not accessing the parent directly here anymore,
but to me it is still strange.
I feel that we should be using &aux_dev->dev; instead of mtd->dev.

What am I missing?

> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	while (total_len > 0) {
>  		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
>  			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
>  			info->fail_addr = addr;
> -			return -ERANGE;
> +			ret = -ERANGE;
> +			goto out;
>  		}
>  
>  		idx = idg_nvm_get_region(nvm, addr);
>  		if (idx >= nvm->nregions) {
>  			dev_err(&mtd->dev, "out of range");
>  			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
> -			return -ERANGE;
> +			ret = -ERANGE;
> +			goto out;
>  		}
>  
>  		from = addr - nvm->regions[idx].offset;
> @@ -503,14 +515,18 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  		if (bytes < 0) {
>  			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
>  			info->fail_addr += nvm->regions[idx].offset;
> -			return bytes;
> +			ret = bytes;
> +			goto out;
>  		}
>  
>  		addr += len;
>  		total_len -= len;
>  	}
>  
> -	return 0;
> +out:
> +	pm_runtime_mark_last_busy(&mtd->dev);
> +	pm_runtime_put_autosuspend(&mtd->dev);
> +	return ret;
>  }
>  
>  static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
> @@ -539,17 +555,25 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	if (len > nvm->regions[idx].size - from)
>  		len = nvm->regions[idx].size - from;
>  
> +	ret = pm_runtime_resume_and_get(&mtd->dev);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	ret = idg_read(nvm, region, from, len, buf);
>  	if (ret < 0) {
>  		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
> -		return ret;
> +	} else {
> +		*retlen = ret;
> +		ret = 0;
>  	}
>  
> -	*retlen = ret;
> -
> -	return 0;
> +	pm_runtime_mark_last_busy(&mtd->dev);
> +	pm_runtime_put_autosuspend(&mtd->dev);
> +	return ret;
>  }
>  
>  static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
> @@ -578,17 +602,25 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	if (len > nvm->regions[idx].size - to)
>  		len = nvm->regions[idx].size - to;
>  
> +	ret = pm_runtime_resume_and_get(&mtd->dev);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	ret = idg_write(nvm, region, to, len, buf);
>  	if (ret < 0) {
>  		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
> -		return ret;
> +	} else {
> +		*retlen = ret;
> +		ret = 0;
>  	}
>  
> -	*retlen = ret;
> -
> -	return 0;
> +	pm_runtime_mark_last_busy(&mtd->dev);
> +	pm_runtime_put_autosuspend(&mtd->dev);
> +	return ret;
>  }
>  
>  static void intel_dg_nvm_release(struct kref *kref)
> @@ -670,6 +702,15 @@ static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device
>  
>  	kfree(parts);
>  
> +	if (ret)
> +		goto out;
> +
> +	devm_pm_runtime_enable(&nvm->mtd.dev);
> +
> +	pm_runtime_set_autosuspend_delay(&nvm->mtd.dev, INTEL_DG_NVM_RPM_TIMEOUT);
> +	pm_runtime_use_autosuspend(&nvm->mtd.dev);
> +
> +out:
>  	return ret;
>  }
>  
> @@ -720,6 +761,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  		n++;
>  	}
>  
> +	devm_pm_runtime_enable(device);
> +
> +	pm_runtime_set_autosuspend_delay(device, INTEL_DG_NVM_RPM_TIMEOUT);
> +	pm_runtime_use_autosuspend(device);
> +
> +	ret = pm_runtime_resume_and_get(device);
> +	if (ret < 0) {
> +		dev_err(device, "rpm: get failed %d\n", ret);
> +		goto err_norpm;
> +	}
> +
>  	nvm->base = devm_ioremap_resource(device, &invm->bar);
>  	if (IS_ERR(nvm->base)) {
>  		dev_err(device, "mmio not mapped\n");
> @@ -742,9 +794,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  
>  	dev_set_drvdata(&aux_dev->dev, nvm);
>  
> +	pm_runtime_put(device);
>  	return 0;
>  
>  err:
> +	pm_runtime_put(device);
> +err_norpm:
>  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
>  	return ret;
>  }
> -- 
> 2.43.0
> 
