Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2464B184EA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A48410E8C1;
	Fri,  1 Aug 2025 15:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dej1fr0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5761610E8A4;
 Fri,  1 Aug 2025 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754061999; x=1785597999;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=MW2svlAzDFmmSWbyUIGfyxi/uM63okP9aRtSFWxdltM=;
 b=dej1fr0k6njb59Y2J6Mf6lCPx31ucHEDQBTVHAD3pn0HImpCreN/wln0
 Tdz48dHopC47VwGYisoWzGvvpgrF3msL5XzgfeuPG8VDMHd+2L3C/s8wJ
 T7nLWn2qSFN9Rc8UUaU0Ts3FTe7viDrQAbQ58s3o50zcguMoYVzfUt3Sm
 ARqFtQHs55H6xuCMVBR1a++OgdHOBn7ORxtU8C0kOvIjjkzu46ORmbh8Y
 1toGPUcIOJD96BIxPcbWkhCA3hFf4FyP5gLpcTN8IWVpvgu9DsMfzf5Oq
 xRA4Y23+VStorRcALN3GKZ+6DCJhmyRwxJ70B9edz8U3Ah02IynEN3P9Z w==;
X-CSE-ConnectionGUID: KeDGr1GjTKeyV+LH5XsNHw==
X-CSE-MsgGUID: viK8/X6PStGQPEsPxC6lyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81865671"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="81865671"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 08:26:35 -0700
X-CSE-ConnectionGUID: /JqJhOBWTeGP0cCr2AAfHw==
X-CSE-MsgGUID: kR0n56cYSm2l/lenYHURxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194423076"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 08:26:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 08:26:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 08:26:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 08:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niNXodK+7PlLMd+qdypXfibJNvXWzPuXsPewdodEviLS1fJeN/ARkvcknccXn/mOriXJcSgepdpdgyI3gArePBKGD7iwurn+Pyh0m3v5MSCwhK9sYDQPYyEkapZ8GVQ9wcMDsj++O1o83PTgnXVE5QzVYECXQB94Hed1LX6Sh8btqazLv5mrRDquTexSPmj5Bf+lc7Gdd46Pfsava6GuWtjgKg2CWN1esRnrf4SzYuoXaZBZa73mWc7LXzaF3gP/J6qzpZ8ACOcC6lPLdtLmBw89Wj7lm/0CdHA2tGuijFQ1jhvMOdCqDgrNxfGePifZRDBt1g6eJHP8FuTv9cVRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRXy4YpvwzqJGhvSdSwReKeQM7qmn2mnOIORrB4yazU=;
 b=RNWfvVFbJw6aP7A1lGWTUYcT3pbZ6swsKN1qfdvQzph9cOOaEfCGMzov0xiX8ImwmH4O4bv2ZR5Ct9MKpRiAA5f0tdR6E+MupDGyGbnmBo8DJibGSv+2Dk7OAfAG1IGaec0vapDtNmbI4gHHFcnp36pNRv7lF3c7Nwz8N/hm2CqRDpgVAU89SVtZ82b1U4AvSDLkYShTCZI9RuXv+laHf7NK3zo4DH8bI3mr6WeVWkTs8seD2ibFSg8SQMDJuXlpbsyxIPSRj6ffb76LZ6cY6N8MOCfeor0hK6mNCft3W4KZmLCGPfi2a0UCvCC7xMkTnAhw4BrUai0sTpH1NEnWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM3PPF1721FD39C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 15:26:17 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8989.017; Fri, 1 Aug 2025
 15:26:17 +0000
Date: Fri, 1 Aug 2025 18:26:04 +0300
From: Imre Deak <imre.deak@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shradha Gupta
 <shradhagupta@linux.microsoft.com>, Nicusor Huhulea
 <nicusor.huhulea@siemens.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "cip-dev@lists.cip-project.org" <cip-dev@lists.cip-project.org>,
 "jouni.hogander@intel.com" <jouni.hogander@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "rodrigo.vivi@intel.com"
 <rodrigo.vivi@intel.com>, "tvrtko.ursulin@linux.intel.com"
 <tvrtko.ursulin@linux.intel.com>, "laurentiu.palcu@oss.nxp.com"
 <laurentiu.palcu@oss.nxp.com>, "cedric.hombourger@siemens.com"
 <cedric.hombourger@siemens.com>, "shrikant.bobade@siemens.com"
 <shrikant.bobade@siemens.com>
Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and
 build/runtime issues
Message-ID: <aIzcjMgUttb1UpVt@ideak-desk>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
 <aIp6UgiwtDU1Ktmp@ideak-desk>
 <DB3SPRMB000631927D36A721EAE657F3E626A@DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DB3SPRMB000631927D36A721EAE657F3E626A@DB3SPRMB0006.EURPRD10.PROD.OUTLOOK.COM>
X-ClientProxiedBy: DB7PR05CA0063.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::40) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM3PPF1721FD39C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f062445-bb61-4f11-acea-08ddd10fc275
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RQ0O7ZjzxHdfGO6lwmC/cxEClelcp8OZOFQ4VSSwKvTIBb4cr4IViQ8J7jDr?=
 =?us-ascii?Q?SfGn4xxAPppOxjT7PT/W9awlRwOBSBIwwkCN8xxblHEUZWVEqqlHuOf4Rur5?=
 =?us-ascii?Q?0lI+Xsj7RLmcimm1rwNuu6SO0Za/vgbKxOukXiOycOoz0SUqlAUt2Az0f6Td?=
 =?us-ascii?Q?zEsia4SFFYtTZNlS2YJ4bNF/1LzhBy7AJ4ZvKbDWC+GtZYNTVtvtqOu78juB?=
 =?us-ascii?Q?F2cd/APyP8mt6b33SUuC3tRv9y03tfLjHnaBcm94ZKRPQIws/ZvlgORkRWja?=
 =?us-ascii?Q?9/G2DmWlPaKiUFQJD1VPpwMT/FNEI8l25CjkOSbR49HUy7xVrEgUF7KeuDfG?=
 =?us-ascii?Q?2XOnIecrGN+0+ZHejE8VwuwJnzyGJMbNgeDSAOXXSFN7kfQPBdbLPY/op13W?=
 =?us-ascii?Q?ILSO/5pjqgeKYM+k8OeUdVRbYOusYLSbs/jIU2W8zyH2aK7JDlh5OJWDMKxG?=
 =?us-ascii?Q?bXLRjSY1YjioH93v9r4clOO60da7TqL58PiXcwJ/t62kicxd8AyJ6HEwbfxT?=
 =?us-ascii?Q?QyE5VW7eihfpG6tHIscb5ORCkMH8cORYrpebKXPQzuPtiRquKI/Y3jOQtWJg?=
 =?us-ascii?Q?ZEiw8PNzyQm9tXAI8TwqrBivh0rZ0oiyX3qamN2j2n+yKg6RFNJLxfpATseb?=
 =?us-ascii?Q?95qhyLzMNzNzmQNKeoBs55i2YiZqaT5xPh2ew1A6TIz1gAxK0WiR0q8onPGF?=
 =?us-ascii?Q?UAKlaBENc6vevKcfbbuK2O1uImHM0B20CP7+725OdPiROqz4kPF0etwTUBUY?=
 =?us-ascii?Q?PziL8q6PZy+c6zjdX7YztuWB5iHNoYykk71nagje8T52Oy9n0CZkUeUTYcvV?=
 =?us-ascii?Q?lbjZIasOAVdIZxiBprITsty9+Imv1Q0m8OU7B0jqWZB5yENzIMyPk7ZwG4vi?=
 =?us-ascii?Q?umbmY7ja+RvI3PNjoo0ETpgylAVxNlmwoZoaSiIzx7FBLTjVlMSz91YBJXjQ?=
 =?us-ascii?Q?SdV02KC6l1U+VSOMsf034/rKSItFsn3WuWyULGn+awCDgJRU65FUDD79OCRl?=
 =?us-ascii?Q?NrU8BNiHW0uac9MaDzz7hURqz/Y3Lu+nbqXw8siTDYOxPhIQfCpIrGfLQesB?=
 =?us-ascii?Q?TvgoF6+Dy5hxZ9JtMbCNhp7308wfzLiXPFgaMKu0JlS6Ksrez2XQpXhhkexX?=
 =?us-ascii?Q?3XHwK7khrkqlKY17Szn9isO5U4O7ckUIfJsDQ/pMJu97J/HA51tKi0UkE1U7?=
 =?us-ascii?Q?UHFq/c8h+3ThMfCrvS/72Dj0OoxHXHt4lcnd0jcOd1CWoW6rs0ykqubnAPCG?=
 =?us-ascii?Q?VPEe4xfr69rZQoU9rD36vscnrA64/eK3xAV56Zz8cyUmeWWc1OO17r+n1CAU?=
 =?us-ascii?Q?uK8uIgeFHXdX/PmkRF+Asm4w1KKj6c5TT2uoMZ+pYAC3UbetluTwyR9DC0yH?=
 =?us-ascii?Q?4+76jfFef1mTDUfTKh2+UWCdS6lY0YitWC9+zTubGhtEzmRXXYPWX6YPydNZ?=
 =?us-ascii?Q?d6crHzigPRY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n7XnNgSowaJV4drgGv8PSZdZgZrvDClc0JQzds322hqstp2HDdVDDJYW6jw1?=
 =?us-ascii?Q?MFnptoieQoqqtILv6FVkhiG4tAgzstOULk9CQx+xd4v1I1ATTaKkuVtYgowB?=
 =?us-ascii?Q?Y2TF8olrLgz/x8J2bZtXAk1RIH9EHMI+nrZSGKzyCDoVQ88d2H8sulML6Rjf?=
 =?us-ascii?Q?P6WKOdfAPL9dySFoGr5hQZcvg1D7Pb7SWcDH6f7fCm0/k1+6Oq1/pUPcvcHl?=
 =?us-ascii?Q?iUOuYvNwJHzR70dXe3ogYJljBo6RC/T+53dX8bEnABIUdUkWtbAp6nY5kx/d?=
 =?us-ascii?Q?JrHQJUqEkJO7FckSe6eQQhvKMfp2MZ/1Cxvw+6z2pOTnjlgP8Nf2QJT4QsRo?=
 =?us-ascii?Q?78ZOgTrObQSmVKeAgTrCx6dlQ+wZJlKj0kumgktEFdj+CTlWuEphskldZeUn?=
 =?us-ascii?Q?yJH2OKhO6WX5I7FACwP7kA2VAvcQZQ+ViZS1iSZ9aY+6YntKre2s/gwFBKH3?=
 =?us-ascii?Q?PvZUNstZREZv2vNez4Iwe4TPzoXS7bqq0Fc5YPjjVMEs43Ync7jmUH9ysuDT?=
 =?us-ascii?Q?b7nstwKPJdS4BIJUXl7qz14YlI0brUq60t4hDVxVq0Rh4vCCYhQZ5B6Ybm9S?=
 =?us-ascii?Q?Ai361YbXgr4+9DYn2w00EGqjwY4G6u5oDf/fcwBVVl+54sLHLdyD4jAUHDQG?=
 =?us-ascii?Q?0aSLEj+6cpSfIoJuVYI9XCiVJulYOtAD0Fi933zczDFJ20H6q9X5UwACTkbI?=
 =?us-ascii?Q?l/6PTNQs8lgSVH5UX2XYKk2vbsEOezipexdc8rKwlcs9jYu1SyOoJXysNdQK?=
 =?us-ascii?Q?o8apI5vKaK+stI2zKhwjugtHDXkuATyJmMSHAVSph0wK39c1Ms/0LudiW/9L?=
 =?us-ascii?Q?b0VrPufi2FBd7CQ5Rpmgn00E4ZfajMB9wVA2YuFKKoUnrgUAx/kX37s5gKWi?=
 =?us-ascii?Q?2+pkTs410m1fN+Ur2FdxtF90atQdhoOUjHtm9ctUBWV1/dQhv1Sr/9ij3DP+?=
 =?us-ascii?Q?oiAOT1N5h2JyiOZB1JvJIN5wk0muZNlJJ330l6ZdUHZLR+accT9WQfeuNHIq?=
 =?us-ascii?Q?vJ0VjmzjaMpsUjhpS04B5Vaya0wDADQgIlj/y6yUjOov84wfP4O9/3zjACrx?=
 =?us-ascii?Q?+prx3LTcMWEox/AWE+AEcTzV1v35qcsoVMMAy/7pAWwquafJ/4+KvlS5LnJO?=
 =?us-ascii?Q?aIaEt51XMqHV94aPsH10krwAzASP/lWLEBe7SuZ3XG/oD6ykylYjko9YwjqR?=
 =?us-ascii?Q?nlDkotBLh7HNCQB30rQDP8FvLNZ3YA1uMxnwmDrTdBU77xS25fauFnryVYCP?=
 =?us-ascii?Q?gf4S3oKe3sc/jf90yFv77x4zvo3yyZcthwjOZWMloUdVkSURVaiJlS7HJ9xp?=
 =?us-ascii?Q?YXe34Wmc+vq5R4uF3rAgGYcoCeoBmGPnlSpvG2KXhy4ixG6MpZ+j1bav9Ltt?=
 =?us-ascii?Q?v8UjRfqZHN79vWX5OSmaDlGywGcQF0ERuUUrQSW8vTUwpuFgeLkbQ+j3ea3L?=
 =?us-ascii?Q?nMx5v519IvTs0LsWif2SUwLoWPf0cJVCZtfZ2zFCNLdoVksgX2JSgQw4Tmd0?=
 =?us-ascii?Q?AvWHMD8gUm7PVzm60nzPOYuxuiQWsf1JztcGSm1G1FW1xbTYcvvfQCTOzjqa?=
 =?us-ascii?Q?8xLuOn9GD1YOn4xPvJwD6Q3OPHXuaaG2yLEbfP0I0mPdqewy8eU7RBGJhuRv?=
 =?us-ascii?Q?oZjnWf8nOwJ/B0+0SbthgkMLoT8rbc7vo2XlDh82sTK7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f062445-bb61-4f11-acea-08ddd10fc275
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 15:26:17.7342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9viPxlETusLoPAmryFb+U+9EpHnbB+y1DxZLBjSca441AiixbnaD1CAI57M8AT27uYpbEtsVxSXnbVbH0sYSCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1721FD39C
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg and Shradha,

could you please check the comment below about the 4ad8d57d902f backport
commit in the v6.1.y stable tree and if you agree with the reasoning why
it has an issue, then suggest a way to resolve it?

Also, AFAICS, other stable trees are not affected, since the original
5abffb66d12bcac commit got only backported to the above v6.1.y tree, but
please confirm this.

On Fri, Aug 01, 2025 at 02:37:04PM +0000, nicusor.huhulea@siemens.com wrote:
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Wednesday, July 30, 2025 11:02 PM
> > To: Nicusor Liviu Huhulea (FT FDS CES LX PBU 1) <nicusor.huhulea@siemens.com>
> > Cc: stable@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > intel-gfx@lists.freedesktop.org; cip-dev@lists.cip-project.org;
> > jouni.hogander@intel.com; neil.armstrong@linaro.org; jani.nikula@linux.intel.com;
> > maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse.de;
> > airlied@gmail.com; daniel@ffwll.ch; joonas.lahtinen@linux.intel.com;
> > rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com;
> > laurentiu.palcu@oss.nxp.com;
> > Cedric Hombourger (FT FDS CES LX) <cedric.hombourger@siemens.com>;
> > Shrikant Krishnarao Bobade (FT FDS CES LX PBU 1) <shrikant.bobade@siemens.com>
> > Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and build/runtime issues
> > 
> > Hi Nicusor,
> > 
> > thanks for the report and the root causing effort. The patchset itself has a few
> > issues:
> > 
> > - commit cfd48ad8c4a9 ("drm/i915: Fix HPD polling, reenabling the output
> >   poll work as needed") you backport fixes d33a54e3991d
> >   ("drm/probe_helper: sort out poll_running vs poll_enabled"), but this
> >   fixed commit is not part of the 6.1.y stable tree which you are
> >   targeting.
> > 
> >   Similarly commit d33a54e3991d fixes c8268795c9a9 ("drm/probe-helper:
> >   enable and disable HPD on connectors"), which is not part of 6.1.y
> >   either.
> > 
> >   This means the issue commit cfd48ad8c4a9 is fixing is not present in
> >   the 6.1.y tree, as the changes introducing that issue are not present
> >   in that tree either.
> > 
> > - The compile errors the patches in your patchset introduce would
> >   prevent bisection, so fixing up these compile errors only at the end
> >   of the patchset is not ok; the tree should compile without errors at
> >   each patch/commit.
> > 
> > Looking at v6.1.y and the patchset I suspect the actual issue is the
> > 
> > commit 4ad8d57d902f ("drm: Check output polling initialized before
> > disabling") backport in v6.1.y, which had the
> > 
> > -       if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
> > +       if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
> > +           !drm_kms_helper_poll || dev->mode_config.poll_running)
> > 
> > change, not part of the original
> > 
> > commit 5abffb66d12b ("drm: Check output polling initialized before disabling"). i.e.
> > the original patch didn't add the check for
> > dev->mode_config.poll_running. So could you try on top of v6.1.147
> > (w/o the changes in the patchset you posted):
> > 
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > b/drivers/gpu/drm/drm_probe_helper.c
> > index 0e5eadc6d44d..a515b78f839e 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -250,7 +250,7 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
> >         unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
> > 
> >         if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
> > -           !drm_kms_helper_poll || dev->mode_config.poll_running)
> > +           !drm_kms_helper_poll)
> >                 return;
> > 
> >         drm_connector_list_iter_begin(dev, &conn_iter);
> 
> Thank you for your thorough explanation, especially regarding the
> bisecting issue. I hadn't anticipated that by fixing compile errors
> only at the end of the series, I would make bisection unreliable.
> 
> I have tested your idea/fix and it works. HPD polling works reliably
> on both devices. I can see the polling in logs when display cable is
> not connected.
> 
> Since this fix is mostly your solution, would you prefer to submit
> yourself, or would you like me to resubmit it as a v2 and credit you
> appropriately ?

Thanks again Nicusor for the effort to root cause this and for all the
tests.

Greg, Shradha, as described above I think in the 4ad8d57d902f backport
commit in v6.1.y it was incorrect to add the

	dev->mode_config.poll_running

condition, as the original 5abffb66d12b commit was not the one adding
this, in that commit that condition was only part of the diff context.
OTOH, adding the check for this condition causes an issue in the i915
driver's IRQ storm handling in the v6.1.y stable tree: after
dev->mode_config.poll_running gets set (during the first connector
detection in drm_helper_probe_single_connector_modes()), the

	drm_kms_helper_poll_enable()

call in intel_hpd_irq_storm_switch_to_polling() will not any more
schedule the output_poll_work as expected. Thus after an IRQ storm, the
HPD IRQs get disabled, but the HPD polling will not run and so the HPD
detection will not work as Nicusor described above.

If you agree with the above and the above proposed solution to remove
the dev->mode_config.poll_running check from the v6.1.y tree, then what
would be Greg the correct way to do this?

Thanks,
Imre
