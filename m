Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB7E6362C2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F91810E56B;
	Wed, 23 Nov 2022 15:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8783A10E213;
 Wed, 23 Nov 2022 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669215988; x=1700751988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vRQbQKdvgyCLd8i5ON+Zj+NGee/sUImhREaGDaKsA5c=;
 b=TamqT2Sqib25rMetgSstNLS9Ko7bV8A/CjMr/SM2l07nW0YPla9Z+K3l
 /eXVmai1R+f3socSRnYPLi8utD9W1N5w+7I2FN/1heSjoHrPwfKxS4BL7
 tY96vbkQms+97cPF1fgYgNIVZVk/h4RjIuB9qFwSqb5iSjGNdufBsSswv
 m4lfqwLk9ImRF2SDctNrrSFoqGGo8QeOKyfpZPqeV/8mfmkM4ZKuHjWod
 YeJb+G1PZwR05avbqqfntkx5YsPO1Jxf6YJyEG/fQUn0s4c6CFN6NbmdD
 iaabQlzNJBu4tUxGIxFgsNucAcJf8CN5pDYRpCgW7VEujT3FG8wGX8kpR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="297445416"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="297445416"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 07:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="641825428"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="641825428"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 07:06:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 23 Nov 2022 07:06:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 23 Nov 2022 07:06:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 23 Nov 2022 07:06:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6Hzox/wYyowSuj9EvxHUvAyxKa5Z5wWeX2rTP66rhzBPkaSc0r64exYRZUBGoEGbZdz+u5WHbJdvT28FswTHT2FzZrJA3KQVMaQgdkXDt3F6nNrSDaSVo7c0wt4P/Ez933TqMsU03E0e2SYOf6PmYjtfABCI1pdG2SC98sflzng+t63pJPIkePgZ6ZPrQsmu6t8ivxuGstwsrAVVyLoPGpG2rvn8gdsLoVA+ZL7rHSK2QxJt+xvlxLzyBs+McZPjkE0jDGvf1BUPppDiPY4H1Z0dkQPLr95X8WxXn694IPYm9A8S7WojPgxuVyQslxp6s4T3DEajBcBEvrfOJalOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4YOwR8lbRXuxzZk4ld5kZ5UV/1UCHGEjJTlspshTAw=;
 b=G8xZF6iVh7tM/yUepPGz3xj5+omdIkNFF5zpBEPeoKF/Tbw76hLbKXaCn9QiKiHWXXMb1MVDfLubHgaDWmqJKqT3L24WyyW6HdfhYLqB31hGTNucQtqJa7dLtx/W8jL00DtlUnBmUZ7UMC+tRglYfR34TfD0Bfu3Hd+OmfrtcziQNv0LO33pX24flHVOee8aqulCYhRJYVYhXrVLZ1dYXffui+mZrpgwH3cmX7xM/B984kEH1iZ3ajSC6BQB3IFVu/eOaL6qiGdOUrKhBnC37O8GzZj9K4XDzkCT8+QVTY70XNertulz9E6jR7IxNdaNwewZDFBncoyCT24txhyNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 15:06:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 15:06:15 +0000
Date: Wed, 23 Nov 2022 07:06:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/4] i915: Move list_count() to list.h for broader use
Message-ID: <20221123150612.y35wdfeujdjqabsx@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221123144901.40493-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221123144901.40493-1-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd3b11a-6000-4475-2a62-08dacd644460
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rX4fJs5CLchxRtoBw8vrHr1iqQzJk74NIyxeGAkUek6M1Horzp05BhlrV7aTzpR8vRV7In8RgpYax+VBtDzB2BIIOIQEqtH1pyK6zBQX/UsHSrYMr1STYCVT+7Hu92ER1lym8BkmReiVkI6LYHdTn2LyO6uLPAUrImtxyRK6/3fDgUIe+eaHTkdgT4IIjC+Od3M4kP9r34y41ClsK38wtr/AGN3P2MyhUpSOWuUVtiWYFw3dZeaCVRGt17DUmuo9FsnvBpVkBOqpjIaX1oWa6HPnZ9BH8b3nIIMZCbneHTtItBkCxs4jqpSd1qPvHFF4R8NAOMR4JwbKBBoQhq6k5an90delCLwwNBVJcb1DcYFFph85m/zAfYvpJ/tR1lv0kDau8HsiB/Z2F+h5BDNA/6K/r262e8OJ96xf6D8D6/NWUn2G9WmLj6ixS4PwIRRerEuf8MkxZAWuHcltsj7bMGt7cKXiVbhwnxn4b4DitIrLN+JnsC5LomL/IfXIXu3IMyNwV9TmpOdpft72gvd9IbUqgvE10l28WPl6iCYDCAYcgGYnNLAhY05fxoUQM+DCqsfb96aaRwsbgjyPRBjT1AlQTbw7XG5RqSGMlK9EJ+oRXbz2UCLBgzkKRHDoitZN+g63BEbW+Yls09PS2LmXmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(6666004)(478600001)(6486002)(6506007)(26005)(82960400001)(86362001)(6916009)(6512007)(54906003)(9686003)(2906002)(316002)(83380400001)(38100700002)(8676002)(4326008)(66946007)(66476007)(66556008)(41300700001)(36756003)(186003)(1076003)(5660300002)(7416002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JYImttvTKWxQM1uyJgIIT6fCbXVHRY5sSKWAnupwK9wyax7WYZf97SBwcxWw?=
 =?us-ascii?Q?rjlI/5abvpXqj4i82GB7e3FA1M2XAJ1WXpnFhwa5RiMCV6hrkvA3VYMQmKY7?=
 =?us-ascii?Q?u+lp3dxi+k3//QqRVJO4P96g8nBcW7HRc42yVcfSOOn9PmNrurKXnTPfmBdF?=
 =?us-ascii?Q?CXLsg0j5UgGlo4As1YI02IGDaAOGjG6lo5f8GIGO6R3qh4NkSjXNc8X0PR5b?=
 =?us-ascii?Q?ByjnzFae/FG315xO8axqFMOChPqGTF6iPQWFovFHEwjfYbn+rMCTR447Ychj?=
 =?us-ascii?Q?zz9XKwJ3F0PddfmF6Tc0riW9o9CSs8TJzxnxmL2qCAC2sCoOp8uyGM2sskMN?=
 =?us-ascii?Q?TvcNMSUWCnCB2D8O9E6FVnrbP/wHlA2jtgEk2ozKKTOBThOZV0hKRZYvtVJ8?=
 =?us-ascii?Q?auDisNTXbHG5LrQkT0rhXX3w7Ei8x6tXwqpvdM5nNO4j8defLooR52d3I+tO?=
 =?us-ascii?Q?ofQfCENlLgp2ioBvqVaU40CJRi4xhMtxgzMZPHm7HNlmjkNhb4uczu614GgF?=
 =?us-ascii?Q?H/vop3eOEmsTacf6PQzESHwqTZ+b0Ny6laU2AQNI1eDIoGRxdr/C/0+LLC1m?=
 =?us-ascii?Q?KH7f6YB5nFCgVpNcQcwFtSjCYEZ+0WgMWsP4eK41cLHHSF+9+55XbQgmCQQE?=
 =?us-ascii?Q?rvXzraqOIgzUCVWRmU9wf46WultYOVji8j3m5XeC4GuU1jXE2mdxZdqiIRku?=
 =?us-ascii?Q?j5GT2id7sfn8R8KoWsFU5LOCdrk5pYAP6KM4Y6mDXNKrA9mzD3hTi0pjs1Wb?=
 =?us-ascii?Q?reCJveairS0JbYioWU4AJ5XsEVo9flXh/4l2Hzsv0NUB6apXnqZuF3O0U3y+?=
 =?us-ascii?Q?lDfDnixm87NiGa9mNHSMlSTbWoX3scLwoU4zQpI1vw9aUjgE3cWmD+L3Y/2X?=
 =?us-ascii?Q?6e4c4dcMj1sC8MJ/0lWGpo4VYV5gKTfmgDxZ41WCJbqFP/1/XaTGDrx9QXDq?=
 =?us-ascii?Q?XxmTpJTbPOOtoGqH+k/fNrGzLzBgHpEgcJ4JzrgaTOtgSDM/o463rIh0VAeM?=
 =?us-ascii?Q?JbOplOFyNIW7WOhrbRjy1tz1MtiezHws3OFZtLfB6g8VcKbmLbyDcGI9QLfG?=
 =?us-ascii?Q?4rfIaia82Yz4av1wewyFdN/RoAuxq8CN5D5/xNN9NZ/ZvCLLdr4o70viQxrH?=
 =?us-ascii?Q?RX/up8J6SRB/3rVBM7wCV7s/y6COROgHesbaq3tVBCaYD0iuTZv1ws25IAAm?=
 =?us-ascii?Q?jb74fQzlmN71nEmpX5z69JxiTRzm36g9sIuMRUsjsFA1yAKgs2pfRmfJQ6vu?=
 =?us-ascii?Q?GhG5nKLV6tCFPo7TWAtMjIk30P7V4DkvZtnpZkZS75nRaRhdZEsWeTHnddRG?=
 =?us-ascii?Q?+Fd8Q+E7UuD5SvKqe4c4KvIXy7wEd39uAKjfANgtSOYwg+McANAF9ESWMo/5?=
 =?us-ascii?Q?PmIsb2OAp793Q4O9bFdtozGGjLNCLrHI6LUElMkF6XPbmSkyiUP2W994gDIg?=
 =?us-ascii?Q?3Hcdd/n6ag+Qri4sq3SfE+UAqgjVivYncIikr70hoBEFwT2nYYMGphkrkks6?=
 =?us-ascii?Q?uTO4Br7ePd09M5qPdzeOQpj9qT425M86RHBSAe3OHyyAZHSbLjwtRDiaPfUL?=
 =?us-ascii?Q?M4L1PPIqOwwnUVUdvNCygx7uBHPiFesuWstigLhN7hGn+DPm+E/6Bo9Ul3vx?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd3b11a-6000-4475-2a62-08dacd644460
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 15:06:15.5954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8k5wNGIWGBE4I0DBuoIomu/v+/Dy7tlp6tQQDb5ChwOLDB6iwLYkxbEf0OoVr9inno7dF4VUONFJ71kgVPMGJ0uRuXOGPofqrCE/s1vQ1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5873
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kevin Cernekee <cernekee@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Jakob Koschel <jakobkoschel@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 04:48:58PM +0200, Andy Shevchenko wrote:
>Some of the existing users, and definitely will be new ones, want to
>count existing nodes in the list. Provide a generic API for that by
>moving code from i915 to list.h.
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>Acked-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v4: fixed prototype when converting to static inline
>v3: added tag (Jani), changed to be static inline (Mike)
>v2: dropped the duplicate code in i915 (LKP)
> drivers/gpu/drm/i915/gt/intel_engine_cs.c | 13 +------------
> include/linux/list.h                      | 15 +++++++++++++++
> 2 files changed, 16 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>index c33e0d72d670..b96c8217743c 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>@@ -2094,17 +2094,6 @@ static void print_request_ring(struct drm_printer *m, struct i915_request *rq)
> 	}
> }
>
>-static unsigned long list_count(struct list_head *list)
>-{
>-	struct list_head *pos;
>-	unsigned long count = 0;
>-
>-	list_for_each(pos, list)
>-		count++;
>-
>-	return count;
>-}
>-
> static unsigned long read_ul(void *p, size_t x)
> {
> 	return *(unsigned long *)(p + x);
>@@ -2279,7 +2268,7 @@ void intel_engine_dump(struct intel_engine_cs *engine,
> 	spin_lock_irqsave(&engine->sched_engine->lock, flags);
> 	engine_dump_active_requests(engine, m);
>
>-	drm_printf(m, "\tOn hold?: %lu\n",
>+	drm_printf(m, "\tOn hold?: %zu\n",
> 		   list_count(&engine->sched_engine->hold));
> 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>
>diff --git a/include/linux/list.h b/include/linux/list.h
>index 61762054b4be..632a298c7018 100644
>--- a/include/linux/list.h
>+++ b/include/linux/list.h
>@@ -655,6 +655,21 @@ static inline void list_splice_tail_init(struct list_head *list,
> 	     !list_is_head(pos, (head)); \
> 	     pos = n, n = pos->prev)
>
>+/**
>+ * list_count - count nodes in the list
>+ * @head:	the head for your list.
>+ */
>+static inline size_t list_count(struct list_head *head)
>+{
>+	struct list_head *pos;
>+	size_t count = 0;
>+
>+	list_for_each(pos, head)
>+		count++;
>+
>+	return count;
>+}
>+
> /**
>  * list_entry_is_head - test if the entry points to the head of the list
>  * @pos:	the type * to cursor
>-- 
>2.35.1
>
