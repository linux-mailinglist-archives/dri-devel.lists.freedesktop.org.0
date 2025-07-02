Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971DAF6376
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 22:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AA010E22E;
	Wed,  2 Jul 2025 20:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUStQt+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694E910E22E;
 Wed,  2 Jul 2025 20:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751488836; x=1783024836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BORz57LdSyBhd5fxNn/cXEub4m9SrrpLKn69XS1M6zQ=;
 b=VUStQt+A4Hm9M8b4qpuTwePInwPXSrdXJi5qCFjPHxXzrRu0jVOqL5Nn
 agw8+fDihrbqRmhwqPBvnYE7EK0QDqcIGdI0W57tBflm1DZLrTrvbqMaU
 3kzW2RmzsvTt7wHh1QZB9MHOLbKyDy+A/7MyKLwYMtuJORwKYbnvetRQh
 naQIEUf7sawbzYlxtrWOHHcEZWVmxOOGNW1PTIaCzQj6ykQ61K0qFHq+q
 saBRLBpAn6Gla5w+wb3LT4lMJceKhP9kqiMW/MFyV6lq1fRhwZIc9d/TQ
 mA6UTe4KxV0dotpAIkYB3o01hvTJjprG1ZFud8LnGDY/XvtVQtrh78UFm Q==;
X-CSE-ConnectionGUID: sL5q6A1bQ7GKTGsUYcDEVg==
X-CSE-MsgGUID: P3UTWTnwQci0lkAqAvWYQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53946670"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53946670"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 13:40:36 -0700
X-CSE-ConnectionGUID: i2kRnefIS3q4O82yZDh3kg==
X-CSE-MsgGUID: OPodsXM0RxqWzDcUs5gtrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="159865575"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 13:40:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 13:40:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 13:40:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 13:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRBQwDH77KJTlhHAlW4UGhxYrDTRcLnLCtCSRF1ZiZjBBx7b/15wCAm3j+X87OvBNCMvBzYhWbxYm+ZpgHfVERvlaWQY7Qcy/B3Rbew80bm8I80se51HchK2KsEP0WukJvjp3wKTEoTqk0ZMq4wtcZBX8fjSL5QEmB/4HflA9v8gFDDiXiZ5Y2h2z1tbSd5mmah3T4RLTQ45utGAt4snGayheHjqXdRxbx+nUBrIRw9okYt8A+d25qWMAW+16wWdbxQYhC9ZMF22JZmhrxcdJBlN9lE397rKhjKdE93dKKugBiEOjWDweTyfc2JfJvS10Gi0Kduyooigy0aODbIVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afX0IFyNIvjzHdXNhEaebpkgL0ZQqZs7ZZwSx+REhBk=;
 b=D/1pzZDRrl7b1b4TWtrG6OYc+ysH+CbIEnb+cnlDSrbb2S2wDozdkjdbB5Y4ZTNZzpTMyFvpnPDFAzxIWHQlxtRamWeuqrECbrFUDPeTfu258rSTY0dzp4iMFm45QZGIeUxoYnHfsDAo6WH3Aphrdqa8vGiDqxH+6kGdNY5U3F6Mdudz6G66hEiupr/dbuoCx/Ux8UHun+74iy1UpNgG3JQSTXiHzTfrquVPtzE9Qfcy4hc4mP4N31qIDxGVsIR/9VAiNGhKpgjNsuda520ZymtAQA+nRICJL0BkZovbytszKYBuWVwOKv4Iz7+MPDHRikMSgkZTLZWHz2lW3B0Kyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Wed, 2 Jul
 2025 20:40:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 2 Jul 2025
 20:40:05 +0000
Date: Wed, 2 Jul 2025 15:40:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Christian Koenig <christian.koenig@amd.com>,
 "Huang Rui" <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, <intel-gfx@lists.freedesktop.org>, 
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/ttm: Remove unneeded blank line in comment
Message-ID: <yfbfom6lhfpwkohp4s7pl6gslpfq4lydnlief57re2zglcbdko@3fxews47vjvw>
References: <20250630144154.44661-1-jfalempe@redhat.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630144154.44661-1-jfalempe@redhat.com>
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: afe95e7a-0001-452c-5fef-08ddb9a8a01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fxSVWyhWA92Flm7qurCjxYf1qZJG6K0CEGlNVryHcx0gDVP/nUd8fymRrhzm?=
 =?us-ascii?Q?bnXBmddyLDVJieKbla79nTNVS0+mn83GpQWXoKdRol34eynvS4LyYOFIMX+i?=
 =?us-ascii?Q?9GnOU8Zci2p9OYFjqN9lr1n+VkcuyZcdAbaKT8MSCUEi1qvoDkqRQYnNNuez?=
 =?us-ascii?Q?Vr3q4l1DXVmD0oyjUePB45zYQhmMzQnz9+OZ5L5wFoAGJA0YxTHAeZaZwD5B?=
 =?us-ascii?Q?PeqIn0xiUWgRSWAIgfWiZk7VZmjaiC4WuMmEkfPyZ8xCPCMQlDjKFc2V0qDP?=
 =?us-ascii?Q?cWMDO8BpNaaKSZZEMg7vrUaNE8lcZsXq1UClKDb6eezW9bRQkB9YDP8HBVOF?=
 =?us-ascii?Q?1lbMwhsiVq/vj3C2cMC20jfWL8nJq6nbCahtrC5RfmY8uL1LHf5HCO3bhWIJ?=
 =?us-ascii?Q?d2T62WCK/ncJkUm+CHlYZzOczfporBoYXRI0CI4ClkAQYpR4GuZBw/1Nzt8u?=
 =?us-ascii?Q?GTno94G4/yNu8V4krGOXwFrh77uzvq7jchmBfrNul+Hq8J/O5Qeiuj2GGISw?=
 =?us-ascii?Q?s5msDW+NNdXQ4l+7pYNh0FDy3+oeUg+eEM7FuihGfkhbEU3eeBxPl16VNrsy?=
 =?us-ascii?Q?cIJ7B2ndZW8ciOjxoipoN4XCFvFLI3MxOGdGzWsqMjdK84LPtSes6m1TvPR9?=
 =?us-ascii?Q?fgxN99bneFgsZ2RlDDyUrytNCklK6PmI/npbddvEfigm2rGP5ZmpDpE1V2NN?=
 =?us-ascii?Q?Dm6d4lK87pW6uKlsZfUDJ1UpMT2SwsZgkqEp+qulLfEM3LSdOmOttQDPrNiq?=
 =?us-ascii?Q?m2nHxpsx5kaDGa7Rk8hc6dpagwBgc2yCuwWBO7F285GnwfgRRvaWD67E9Hiy?=
 =?us-ascii?Q?HoJCy2GQqEGi88hgXCuCtEnbssCKYQ/tcdxXwBH5fK+nhVxSYnt744etXj3a?=
 =?us-ascii?Q?KYbZv86UQLxZq6dNGscFu1u8sGwASENbhPp4y3CPVl0XVP9tPkahiDp1Hvf8?=
 =?us-ascii?Q?b3icKQJC4TE7V18seG20E02dbGjQmX5SL1rMMOfrbZXwQDU6K7aBjsaDEIqI?=
 =?us-ascii?Q?sZY8fTxOHP9FHnTc0cuOjP+ieJ1tIJIFnOZ5kcR5Q0tOjj0hq+M88emq6hhQ?=
 =?us-ascii?Q?/1kdBbJ0u3ooPQMphNplq6DlQjDZBBOnt6nSumnSeQ7se1bwt190/jw1yaqR?=
 =?us-ascii?Q?DJWXAlB1AdQOrW6vvM1RsSz4mtsuy/VHEQL7Zxbm0c/JuSvuOepazSDmOVdS?=
 =?us-ascii?Q?+sD0q5rZ1RrLelyAVcywwPCybYSRwi9FHv46f7t8MWpaIF/9UyCNS18P1iUJ?=
 =?us-ascii?Q?bR6vwGbiGRrqVl0Q23SFyJx6ysnPxPkc/h7AsqtRyzaSx39VAV9jS+2H+tDt?=
 =?us-ascii?Q?wQf2YSQYQ9qMh/xvTZliOfKGYk+6Ao8VHItv14cDQ/OWVtsZwL4cWSM6d89x?=
 =?us-ascii?Q?oOLp3ZzMZipR2LHCbBTIJasXZ+Cyh/PxnN5nGBnZPIPOd7SMqnmQqKGKxKls?=
 =?us-ascii?Q?YqVZK/exEOY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ERnMsJZlL/cPPyG+DNIIRns2X5kUO3KEeTrRvHDZ9JX+jYa+Bvb5lUdgZQYC?=
 =?us-ascii?Q?965OikTvevDdtU0xpXWVKZkSj/Ggg2BcUT4Y3TythaSS+HRCHPItxn+pZW2q?=
 =?us-ascii?Q?T6IvCZf2UAG1ww2N0LmVIJSHbCvpfcxll7pk406V6UJS/gJnK8NnNC4wUEib?=
 =?us-ascii?Q?BGrn/0ASIv2hGvY1VDpZ3NHYHTYke5CeroVfoCWveEo5/y7Ciszxoec0mvpm?=
 =?us-ascii?Q?lRRX94ikEHjWnPbEdLnGkGR9SZo+5m0xcJESBR+K65znpENyMxoDmBfHRQQc?=
 =?us-ascii?Q?4ctljAv0hTrrC0qbeQlOkOWugHcgtdMlIhAaM2h/2N3OvS4PvnQMBiVDz4Oy?=
 =?us-ascii?Q?cvr3jrB9wVIQL6jwzRGRYceDXJ+iklcEn08ZpNniKu8L6TdxdDyBPbbE2lO2?=
 =?us-ascii?Q?VAU3z/m00QYxa+y/L93SndRZHQ+qp05i90XieQEreLkAjr3fWpZYiY3zbYyN?=
 =?us-ascii?Q?RDnLd5pHxgZCu9E29zdwRUNsokmd/oR5Un5Zzm6aTVAWjzhrpwpJ5ECqFjTP?=
 =?us-ascii?Q?JrqoIxJn3fiih8L4R9ASJa3EjfJOM5+JweP7ujzZQrynvTDVjrChjtWHOanG?=
 =?us-ascii?Q?N5FV8byT9pJL+aFQJkB3ILXLpOrpyKHj357Nmv0FUSyWL3ejnokoX/IQNGVs?=
 =?us-ascii?Q?u4tFG+ghZAFF15pvPOWewpPzxFbuK7qBJ7zV49NywEF746Wnn/JXoiKoV8FA?=
 =?us-ascii?Q?2AVxdlwEXp/wUvWNPgDxo+CzfdoeojhPOrcYHD1BOJLckv55ULYm93NaotWr?=
 =?us-ascii?Q?XL94cy1aIFhQE4ilpTuTmHnnxkl3py6pm+xmNeVAZQ+QzSv3Mjo6x1QD6Az9?=
 =?us-ascii?Q?RWnH0sxeNZL3JBsEL5JSinM2czZmflfY5RmQThZAlqtv9YmWQB+uz/b1Hi8S?=
 =?us-ascii?Q?pVcHIuY5474FNMDL1migxSBn0C798NOeakRusvk++fR4LcVp8biTqrefLBiT?=
 =?us-ascii?Q?LUvi2STh2I9NER+ijiHyqQW4hyx1ec64yxAdsvjZP69JjafGRNyHGB34ITnV?=
 =?us-ascii?Q?q1Siy9MiUJD47rrdG7OLk1OH4EHHyZ5f50N7dw9ww52hixDW8VltDmusyoRG?=
 =?us-ascii?Q?c3ImROhSNZM9G3UWObWd/xZIcb7XkWQutV6DJWg2Brn9HB3eORmH2GecKuqS?=
 =?us-ascii?Q?2B0xyTpmYeiV64OO/Bct5J9NwR77oa1Ex84+YPapNyRQ5zpGo67CJGI31zko?=
 =?us-ascii?Q?8e9+xPPUB52ZbirjtjbrTicR6exziHRTLQRm1jKcjRSuxOom2WYgeipp6NQm?=
 =?us-ascii?Q?FTsY5w4I1ONjwiKMg7Z4p9uQO2B7wd7/HuubDDyQkDqhinmHIb26paiDrI0Z?=
 =?us-ascii?Q?Okv9NPDzoIPqg1z/p5miw7U+ooCOstl6Ybkz4Eie4xOT3uJvtz9gnPq3S5bW?=
 =?us-ascii?Q?rORqNSmjmYryL49lIOk/DldI27+E6wuwreDP19/ggsszPYXXlBlp/rZ1yTHS?=
 =?us-ascii?Q?1ua6umQL82CSSGwEuvCBFNFKIbmOfnhmzHHsQP3jyKqJRL13XxcPr/lQaNTb?=
 =?us-ascii?Q?d6U4t/eE34/dJwPaeXPyW3oejygyfcz5Oy233h1Fuja94SwS7A8mgdoNRBiy?=
 =?us-ascii?Q?mdSG7tC7KvRFrRij7wFY+g4QTmrHSoKrdwIT8PHD6BdAY697WqsWXB0IPq0r?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afe95e7a-0001-452c-5fef-08ddb9a8a01b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 20:40:05.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTAS1vBmQ+lvdCeU13tFNEF/UqYW6wsFJi4akU6mNSNqvPRXBU7kOeCF+c48t+dKwPFq1y/BoGZ5HEUWdNQHBipZUJPpVI1VvSnDPM8ZBdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

On Mon, Jun 30, 2025 at 04:41:08PM +0200, Jocelyn Falempe wrote:
>There is an unneeded blank line in the documentation of the function
>ttm_bo_kmap_try_from_panic().
>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202506290453.NeTXAb7S-lkp@intel.com/
>Fixes: 718370ff28328 ("drm/ttm: Add ttm_bo_kmap_try_from_panic()")
>Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>---
>
>Can this be merged through the drm-intel-next, as this is were the
>offending commit was merged.

Applied to drm-intel-next, thanks!

[1/1] drm/ttm: Remove unneeded blank line in comment
       commit: d6a59ee852758bc69c4cc821954db277a2bd5b93

Lucas De Marchi
