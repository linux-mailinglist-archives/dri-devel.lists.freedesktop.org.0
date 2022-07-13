Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A76B573F6A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 00:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBCE112B94;
	Wed, 13 Jul 2022 22:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C34310ECDB;
 Wed, 13 Jul 2022 22:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657750091; x=1689286091;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p7nkOnYxa1TK7WYeAKMwUk7CrTFCZ8zLw3pedJCe8zk=;
 b=JHI14eDafTYutaeWPeTRK5quTKcIVhqpDsBdaLmlW0pmqkQATsPPS2sb
 cJfAw4R+eAHVNyx2RGhii4ZBUydqQ6Kx+3Gml8pNKrEmQFVn6eK/G68aE
 PVbUVXjz2WUWX9jcFCvaBSsNi0AWU1M35NknVhD4STuffOFAdaWC5BOn9
 p5eHbr/MC3mj6NF+qA60YNqcB7N4rp5L3ZEeTGM8uCxqU4pRO4WiyNvGX
 6dLEBankXMvS33Dve5R3Jwe+VWf1+BJBHLChSbDWYtbIh0AvUWkzJ2eQg
 aoNkVvE4F+9Br7rF4yBHDOCynk6qSuLs+zG1SOJhPLlfg92l0g/gGBDs4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="268389683"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="268389683"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 15:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="722507496"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 13 Jul 2022 15:07:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Jul 2022 15:07:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Jul 2022 15:07:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Jul 2022 15:07:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnoolRMHikZsvxX75gZCXFabg7alGYoXXyN8/Ih1C7UHuJlS37+I/8AIM8vVUIYq/YHRme251AVzdVgDoxQZfqAKKoao/JwVw6sIIUM9iZOGpO/Y9xV7/mkd5VjEbZJhZeOYTcTGfDUieAUi196+FwrwAdu7+QMkXDx+lWMXQaUWi2SyAQ54EmXo4AjDBtopseEPsXvyzaqyK5i02qakXWDmiHATkuzVn+3QyRbZFg+ONco7IpfGrZENZytDgCvZT6IJBw2raJOXp8hnC0CoTj6EnI7hWQ6G7TdFLL23RghAf4PvPjz+nRDBR858wi5Em9D5wG8vvNqani/HDIYkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coq45jvATwEtVRdrsH2xEI+3907fyy/ErNMl3wGjxIA=;
 b=AM5guZZezGnZB/e/THy8lNmxofsIY1wpdudW592p9FTB/QpWLl70aO10tC/0RcTBA4nvZUDeiC7nD7u0tRUWUs/STystSFalJ8JDTusAf4whZK+90piuCOrfttgAfrgLFgE7MEwbVnhhaK5Gt73jihI9tOXp3OfnHxxtlUYmOf1Q8zVZDA25xXvx2M+5Ib1cta4En6wzpr5QeHkV/L8hNWRLZpLhM6DR4nslMMYWYRPL5IDbw9Cz9KJU81h4VOHxLwNJSnaPU0BNavW3w9sQnyptcoiD3o1SA2vXFXxLxpTaTANmbSsiWqaFSgFcRFqDR99buiik2MzkctAHftevpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4106.namprd11.prod.outlook.com (2603:10b6:5:19f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 22:07:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 22:07:50 +0000
Date: Wed, 13 Jul 2022 18:07:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 06/39] drm/i915: gt: fix some Kernel-doc
 issues
Message-ID: <Ys9CMLm2vgwJmi3+@intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <3cb8ebff378fc0634e992eba68176ed30842572a.1657699522.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3cb8ebff378fc0634e992eba68176ed30842572a.1657699522.git.mchehab@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45adc4b0-e2eb-41c5-a0a9-08da651c1fc5
X-MS-TrafficTypeDiagnostic: DM6PR11MB4106:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYAyIEU9LrtcqYKi/Ex6C1FegAEUD/kKft3LTKFZYXdz2pjPNo6ger4DD2dpqZvIoGP+nqFIvo+epKAE6Pl0gsI8ijZwY/N9SA2nsEdiylNNCF+nJ5nAnc4XPVn3+KX1+Em05JY1bQFrufSMLLAqSubzuI1RfU9MDH8O+w1wrTViHGZSID5a9eP1aV85Pcp3qSyOLFii8id3u0aPMmvbPlzjK2eQS7ij/9U9H5sQ7mh5Tlvgm7EZzgUiLqGQ55iJewD1byCuxuPXVOsxmqgBBvqEuAqjrHr9C0+fF+TDmtZGU4dhzeO4Nh5i+aKrrTaB2S8hi0b7IuhAgYOFiLAviWc06/mQh/DcLaNGBW/NYne5kyfr3ZD7fTPpwV58n069zmK0ku8oKtuMb+OIqCynCa9hq1dzoC98qK7XSFDGupCfP7I2zq8ijr641ed7ujVRk1zl0CiHYJ4rdUF7jtX+ArBGMF0EwtXS8BpXxymmux9iGxNTF4abXY19eNW3s+dpFbheBvUF9lh5AnkfBLi1t6trBtGP/ZXM0pj4LuMwVAYteoGZ/Q6xo1IS0EGfiqw6swvhP9YTDNdESrkVyKeuCmgpJvoB9Seln/IK7sYOHohemVCb70cgcWclMXbw7Iz6c34Ouk0ml5cl/F7NcxQo0ByYwxDsdwocoZhpeIQP65UpnV4walMQTlA+1IhS458HmU9hSIoLbYRo7QSi201zDKcxOPPWTqDtEW8NCRUwAOu3+uMrmdU2nV0szr1JxnAdIRfeJUEAC2IsYZOiwaGXZuWI6kC1OBDX952WBlEC8Qs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(83380400001)(8676002)(66556008)(38100700002)(4326008)(82960400001)(186003)(2616005)(66476007)(66946007)(86362001)(8936002)(6486002)(6506007)(6916009)(316002)(478600001)(2906002)(5660300002)(966005)(54906003)(41300700001)(6512007)(6666004)(44832011)(36756003)(30864003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VrlkxnjqYpFeP5phA0NEQlCOcjIYEUkHHp6rZ5aCu+a5nAHhvsTSHmQXrKQ/?=
 =?us-ascii?Q?PHajBRZZ3NDiK7r5HNwveYDTfS2uyAF3wNjla0NE5h6PnRGyow5xCAq0n2kH?=
 =?us-ascii?Q?E3racqUROgalXs9h7Q/xrRg8Z5RHAQJqNFFvQrKwB0y0riB5r8PGjWW2ZDWU?=
 =?us-ascii?Q?C95jsoBdjdwLX88VWVG5dNH2B3ysOzFIoZCJ3ryILRHB0thqjE7rgbDnJCVz?=
 =?us-ascii?Q?Vl1ndj5aVN1DVCAoyGl2WNmCAFilp8o51WlljOWbpdN35TQUn/CqTX4BVG93?=
 =?us-ascii?Q?BCfl8nvK0y0/WNQQwRSfy7z1PN5IpIqPi5i6CzbFrowrNMwTEkffFxGmH/06?=
 =?us-ascii?Q?7kO3vz3Rx4jaTCI6xhaGzTnWhUjdlVjQZ3Q5l21Q9dwNlQMyKogTOTJJvENG?=
 =?us-ascii?Q?462G91viRoEtID7BRTebJQtDh5I2QHQ9ZKyduHXpfI+gg/9Bg4GZx7LxZJvE?=
 =?us-ascii?Q?poIhRzIRZ2M3Q34q8wK4xuFgC8QuUsIl7mVhBjyw1OUUY33/xQwwwRsBm2Tz?=
 =?us-ascii?Q?SfJWs9Hmn3lQXb1iEY7/cVcRYrIEwChVFz6eOHHMv+kgJRN+R0PSl/aG1tUd?=
 =?us-ascii?Q?GPSEVJLHOO4q3cGCI0Oegl9phJOYXAjbwJQygQLH4GT9HrbgVP6SvAH8sjSR?=
 =?us-ascii?Q?e8eYQVlBO5VSOEsfJ47xJn0kKhvhFmpuUmXiLYcALDE56oE0fPm6KdQ81Lc3?=
 =?us-ascii?Q?0jOAT8roeHn7S7rjFtw7P8Is647sNJAsMSlx8Qf5pL1eXZSD8tU22phrxsLe?=
 =?us-ascii?Q?dD7ICWWM58eBiTYiZ5+Yc4s81jjyp9zxwkEZLY1XxVH0/WWqYAmN3kEJAe+s?=
 =?us-ascii?Q?c4biunsANqVr7ZQK0YKXPS0XTFMtkCloq6JVwBR0wkdkJ2LJZjncdoabxSx0?=
 =?us-ascii?Q?PaOTXoZU0rgQnupWmoXSDaZiKFI4xGoEOSSTsCkvTFGChanET3CVnAnxrqc7?=
 =?us-ascii?Q?E8dwt0/HfZJsb0lKWJtBhuy4Wdfqg9aQvavqdHI/qPSaUcz3HT3eo7weUo5R?=
 =?us-ascii?Q?zpXwp9afVmG0NGZ/9ENeJyDBlzgK8KJOFv85je8sI3Y2Bt8FB1xE8SHFi19R?=
 =?us-ascii?Q?PYgxuhKLVEoUWrkEqY824FID5AwlgFx5SkYRByhO+qkoYXd1ejuWiPm4LPRI?=
 =?us-ascii?Q?jdKkMoxN8yR9H5NzFKuqzJ4IV+fpUbnJ+5PVFaYj6ENuQ6YlRcv3xNMSpp/+?=
 =?us-ascii?Q?VNL/6gfelSDhd4JldDPcTbkGdT6YrZciAiEVo/e4Fob5TMn9Iq3SF1qllRtJ?=
 =?us-ascii?Q?D7Piyu1K3dHxgM4JRfaJgOZ9vMsw7u6DVv/XjyaUn3aXR8m7Ps0g1IIZNzfj?=
 =?us-ascii?Q?fdPPedEuYLQ9I5Uv5r2Ujb5/4fvoDPGexBlLChQwOPJMlafC/m0ABtt/0l3I?=
 =?us-ascii?Q?BVEl7szd64UCB4B5i5re0+cd+v3vnZOest78WYvKJI9b8jAeFWMVHOnsDk5W?=
 =?us-ascii?Q?wpDd5e9J7cqEJ2AlLSt3Goccrj7HwY7xG3nzusFs48xnaGY5Y1brbY81jZxY?=
 =?us-ascii?Q?pdVLFKEDjo30K2bbMpDKsub7N30E+LbDG++IuVozU/37QTTF67lDegHHMB7J?=
 =?us-ascii?Q?uAJ09IBpC21bdeVldTNS7AOeLePKrl3+pLuOHnNiQi9YKMAEZuPMFCSJyvMN?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45adc4b0-e2eb-41c5-a0a9-08da651c1fc5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 22:07:49.8362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HS6Zlzq2HzXMpt4iKfGi+bQDccs+jx2Q6m86rc34xfkYWUUQoqhcAKssQdIjlRmvxlOFlFxh5yErSNMvsUxMvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4106
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 09:11:54AM +0100, Mauro Carvalho Chehab wrote:
> There are several trivial warnings there, due to trivial things:
> 	- lack of function name at the kerneldoc markup;
> 	- undocumented structs with kernel-doc markups;
> 	- wrong parameter syntax.
> 
>     Fix such warnings:
> 
> 	drivers/gpu/drm/i915/gt/intel_context.h:107: warning: Function parameter or member 'ce' not described in 'intel_context_lock_pinned'
> 	drivers/gpu/drm/i915/gt/intel_context.h:122: warning: Function parameter or member 'ce' not described in 'intel_context_is_pinned'
> 	drivers/gpu/drm/i915/gt/intel_context.h:141: warning: Function parameter or member 'ce' not described in 'intel_context_unlock_pinned'
> 	drivers/gpu/drm/i915/gt/intel_gtt.h:510: warning: Function parameter or member 'vm' not described in 'i915_vm_resv_put'
> 	drivers/gpu/drm/i915/gt/intel_gtt.h:510: warning: Excess function parameter 'resv' description in 'i915_vm_resv_put'
> 	drivers/gpu/drm/i915/gt/intel_gtt.h:615: warning: Function parameter or member 'i915' not described in 'i915_ggtt_mark_pte_lost'
> 	drivers/gpu/drm/i915/gt/intel_gtt.h:615: warning: Function parameter or member 'val' not described in 'i915_ggtt_mark_pte_lost'
> 	drivers/gpu/drm/i915/gt/intel_rps.c:2343: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 	 * Tells the intel_ips driver that the i915 driver is now loaded, if
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'size' not described in '__guc_capture_bufstate'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'data' not described in '__guc_capture_bufstate'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'rd' not described in '__guc_capture_bufstate'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:28: warning: Function parameter or member 'wr' not described in '__guc_capture_bufstate'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'link' not described in '__guc_capture_parsed_output'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'is_partial' not described in '__guc_capture_parsed_output'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'eng_class' not described in '__guc_capture_parsed_output'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'eng_inst' not described in '__guc_capture_parsed_output'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'guc_id' not described in '__guc_capture_parsed_output'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'lrca' not described in '__guc_capture_parsed_output'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:60: warning: Function parameter or member 'reginfo' not described in '__guc_capture_parsed_output'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:63: warning: wrong kernel-doc identifier on line:
> 	 * struct guc_debug_capture_list_header / struct guc_debug_capture_list
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:81: warning: wrong kernel-doc identifier on line:
> 	 * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:106: warning: wrong kernel-doc identifier on line:
> 	 * struct guc_state_capture_header_t / struct guc_state_capture_t /
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'is_valid' not described in '__guc_capture_ads_cache'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'ptr' not described in '__guc_capture_ads_cache'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'size' not described in '__guc_capture_ads_cache'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:164: warning: Function parameter or member 'status' not described in '__guc_capture_ads_cache'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:217: warning: Function parameter or member 'ads_null_cache' not described in 'intel_guc_state_capture'
> 	drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h:217: warning: Function parameter or member 'max_mmio_per_node' not described in 'intel_guc_state_capture'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'marker' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'read_ptr' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'write_ptr' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'size' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'sampled_write_ptr' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'wrap_offset' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'flush_to_file' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'buffer_full_cnt' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'reserved' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'flags' not described in 'guc_log_buffer_state'
> 	drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h:401: warning: Function parameter or member 'version' not described in 'guc_log_buffer_state'
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gt/intel_context.h       |  6 +++---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 ++--
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  6 +++---
>  drivers/gpu/drm/i915/gt/intel_rps.c           |  4 ++--
>  drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h | 14 +++++++-------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  2 +-
>  6 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 8e2d70630c49..91c092d5deae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -96,7 +96,7 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>  
>  /**
>   * intel_context_lock_pinned - Stablises the 'pinned' status of the HW context
> - * @ce - the context
> + * @ce: the context
>   *
>   * Acquire a lock on the pinned status of the HW context, such that the context
>   * can neither be bound to the GPU or unbound whilst the lock is held, i.e.
> @@ -110,7 +110,7 @@ static inline int intel_context_lock_pinned(struct intel_context *ce)
>  
>  /**
>   * intel_context_is_pinned - Reports the 'pinned' status
> - * @ce - the context
> + * @ce: the context
>   *
>   * While in use by the GPU, the context, along with its ring and page
>   * tables is pinned into memory and the GTT.
> @@ -132,7 +132,7 @@ static inline void intel_context_cancel_request(struct intel_context *ce,
>  
>  /**
>   * intel_context_unlock_pinned - Releases the earlier locking of 'pinned' status
> - * @ce - the context
> + * @ce: the context
>   *
>   * Releases the lock earlier acquired by intel_context_unlock_pinned().
>   */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 37fa813af766..da225f5db2a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1197,7 +1197,7 @@ create_kernel_context(struct intel_engine_cs *engine)
>  }
>  
>  /**
> - * intel_engines_init_common - initialize cengine state which might require hw access
> + * engine_init_common - initialize cengine state which might require hw access
>   * @engine: Engine to initialize.
>   *
>   * Initializes @engine@ structure members shared between legacy and execlists
> @@ -1278,7 +1278,7 @@ int intel_engines_init(struct intel_gt *gt)
>  }
>  
>  /**
> - * intel_engines_cleanup_common - cleans up the engine state created by
> + * intel_engine_cleanup_common - cleans up the engine state created by
>   *                                the common initiailizers.
>   * @engine: Engine to cleanup.
>   *
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index e639434e97fd..fca8eedee1d8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -503,7 +503,7 @@ static inline void i915_vm_put(struct i915_address_space *vm)
>  
>  /**
>   * i915_vm_resv_put - Release a reference on the vm's reservation lock
> - * @resv: Pointer to a reservation lock obtained from i915_vm_resv_get()
> + * @vm: The vm whose reservation lock was obtained from i915_vm_resv_get()
>   */
>  static inline void i915_vm_resv_put(struct i915_address_space *vm)
>  {
> @@ -604,8 +604,8 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt);
>  
>  /**
>   * i915_ggtt_mark_pte_lost - Mark ggtt ptes as lost or clear such a marking
> - * @i915 The device private.
> - * @val whether the ptes should be marked as lost.
> + * @i915: The device private.
> + * @val: whether the ptes should be marked as lost.
>   *
>   * In some cases pte content is retained across suspend, but typically lost
>   * across hibernate. Typically they should be marked as lost on
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fb3f57ee450b..8aefc427e06e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2339,8 +2339,8 @@ bool rps_read_mask_mmio(struct intel_rps *rps,
>  static struct drm_i915_private __rcu *ips_mchdev;
>  
>  /**
> - * Tells the intel_ips driver that the i915 driver is now loaded, if
> - * IPS got loaded first.
> + * ips_ping_for_i915_load - Tells the intel_ips driver that the i915 driver
> + *	 is now loaded, if IPS got loaded first.
>   *
>   * This awkward dance is so that neither module has to depend on the
>   * other in order for IPS to do the appropriate communication of
> diff --git a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> index 3624abfd22d1..58f93226b1c1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> @@ -12,7 +12,7 @@
>  struct intel_guc;
>  struct file;
>  
> -/**
> +/*
>   * struct __guc_capture_bufstate
>   *
>   * Book-keeping structure used to track read and write pointers
> @@ -26,7 +26,7 @@ struct __guc_capture_bufstate {
>  	u32 wr;
>  };
>  
> -/**
> +/*
>   * struct __guc_capture_parsed_output - extracted error capture node
>   *
>   * A single unit of extracted error-capture output data grouped together
> @@ -58,7 +58,7 @@ struct __guc_capture_parsed_output {
>  #define GCAP_PARSED_REGLIST_INDEX_ENGINST  BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE)
>  };
>  
> -/**
> +/*
>   * struct guc_debug_capture_list_header / struct guc_debug_capture_list
>   *
>   * As part of ADS registration, these header structures (followed by
> @@ -76,7 +76,7 @@ struct guc_debug_capture_list {
>  	struct guc_mmio_reg regs[0];
>  } __packed;
>  
> -/**
> +/*
>   * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
>   *
>   * intel_guc_capture module uses these structures to maintain static
> @@ -101,7 +101,7 @@ struct __guc_mmio_reg_descr_group {
>  	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
>  };
>  
> -/**
> +/*
>   * struct guc_state_capture_header_t / struct guc_state_capture_t /
>   * guc_state_capture_group_header_t / guc_state_capture_group_t
>   *
> @@ -148,7 +148,7 @@ struct guc_state_capture_group_t {
>  	struct guc_state_capture_t capture_entries[0];
>  } __packed;
>  
> -/**
> +/*
>   * struct __guc_capture_ads_cache

and many more here... :/
Hopefully this great work on the docs will make these ugly
"exported" "__" prefixes visible and we will fix them 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>   *
>   * A structure to cache register lists that were populated and registered
> @@ -162,7 +162,7 @@ struct __guc_capture_ads_cache {
>  	int status;
>  };
>  
> -/**
> +/*
>   * struct intel_guc_state_capture
>   *
>   * Internal context of the intel_guc_capture module.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index b3c9a9327f76..237019e98ede 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -360,7 +360,7 @@ enum guc_log_buffer_type {
>  	GUC_MAX_LOG_BUFFER
>  };
>  
> -/**
> +/*
>   * struct guc_log_buffer_state - GuC log buffer state
>   *
>   * Below state structure is used for coordination of retrieval of GuC firmware
> -- 
> 2.36.1
> 
