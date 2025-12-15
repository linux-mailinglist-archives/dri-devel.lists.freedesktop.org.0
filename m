Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49E8CBF85E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0BB10E4D5;
	Mon, 15 Dec 2025 19:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvAseuJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE9910E187;
 Mon, 15 Dec 2025 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765826651; x=1797362651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=C24NGAMw6TJUwrn+NretSKqZK6FzV0tJiBK0DiM0js0=;
 b=HvAseuJaDDPYkpJeAEUFyKYkRsIEENqjFGBmJSjoPawYTnyxUQ2j8mYc
 VSIc001T96J6YTN1QiDuOERFWX/SfazjfpNKXoUoGYK+A7FgT0ecvcXpy
 pqsFlwAgvzor/HdrmxOOU/IvEfwH+OlfgPurRrDq0kgMcBleGxCFGey3k
 tgokxYXKAJZ1EjtU6gGhkZfO6J4JZZrL64qSeHbehEqpKqW9PciLHFPi4
 Ww6Xa4N6Xqydex7hidSYLHy4H3VcfarAod/JbWb9fqU1zJGpzeiaOx14z
 fPFP7801JT7Mmy6jvaCxHI+E+vCGriwFGZZ+m/TokvzmhWy2YPxKNXhqV w==;
X-CSE-ConnectionGUID: nJnc8pyzTrqIv/CtHJRscA==
X-CSE-MsgGUID: V4TD96QfTZeo6K4/Gpr26A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79106213"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79106213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 11:24:08 -0800
X-CSE-ConnectionGUID: 1BWGLk8bTXuAkO0Fk/nYKQ==
X-CSE-MsgGUID: cZvxV8NKSJia7ohk1BdzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="201986971"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 11:24:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:24:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 11:24:07 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:24:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrvsES4EYpz5sYjrsKaRnVEsOl8OzgBeWRTj9xJhnHegmzHAjs0Xto8neMAL7fwkmeF//B2UY4qSo3+2jjmqbqm/fWdOkFUsBkSaltqXUkWz9RWNwIllkWGFq6q/0qe+Z+BxtN19VGGB9pIYiOj3kqzpbh2RayQ7mazKwXykU9ToiKBmOGSdul7Djc85m2fRlmlIrat2JR5ombjuagUgxmD96ihz1S4wtWbPLudQ3o72Iwd3TlddIvNZTsj3WRRnRHp57VKwr0lzoQDAGtqyU4J7IY7eCsCcV/n9Ur4YfU1tmS39Xv21VzZmGfMOtxPuCGzx6JuZa8T6L13jeBPGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mncftLIq3/SvcRJYR4uJVqmqsHa5nke/qYAE+qR68Vg=;
 b=aR0Y8Vcj67hzuaQkEvzMaRNXE1fy/uIA/iWkjYzj4iwqEQ0PBB5+a6Et7OctzNWbdm0jiXd7p8fHtaL3fNX/X6T7JdNDEW9l1gmwIyTv7/itrTLOXrp+yf1O0gcUnvBQfbecDNFBDWYaNbLw84dApRl7isu7hRr6w3ysWY15OjpHNj4I+pockHVZYRlxqSdr+BIQBAzsKSZ/yw61jcHvJMc+ZtR59jZImIQZ1fljYK9vNykwTawa5zpxq5RRoKU7rh1RDff7opYdnzGeODhOBvx4NAlRSDifDrpxPX0reYjRWkiV4vPV7A0eZDWrz1bZ9+tU9aMTq6Tvf+HX/vJkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:24:06 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:24:05 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH 02/16] drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
Date: Mon, 15 Dec 2025 21:23:42 +0200
Message-ID: <20251215192357.172201-3-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251215192357.172201-1-imre.deak@intel.com>
References: <20251215192357.172201-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: bc74686c-c584-4d96-8f63-08de3c0f8346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nf6GliLuEarJ2+MeM0PRSUvnGnzSJ0schcRDphLaS2kPkcxfSDVwNgqfIIQs?=
 =?us-ascii?Q?7WYzecx6+qJkUpCwoYcgoJj//gC0eobeUYc3npyf8R1ameg/T+qK+ibC09Du?=
 =?us-ascii?Q?ELNCF6hH3G7MI39f/S1Id2bvmmLlJVekg5Auyq2nDNc0rEowt309RlWNW9v4?=
 =?us-ascii?Q?gboARmflwl6FBXX1APiKxNyl5LjSe7CqDfY7CzwWf539kFsfYQcPjBAxwUS3?=
 =?us-ascii?Q?YyL09FRmKh/fpkqp5VFumANsUqW5sOxHrZ6IAsiTvQV2BwBOjnA4pEbHfbTp?=
 =?us-ascii?Q?w6Pu2z56U+0i4EePbDNs4076uPwUpM0u7t9YSUD3PqYhbICHalUpmy8WJp45?=
 =?us-ascii?Q?gtS4INY8edBY6YHwBlUzsVuwPvO1FzrCH9nsVC84+8Q0DXNi0eiFg6Qpd92C?=
 =?us-ascii?Q?pNaiE8Y0ti/mM4NFroOAIqK8iP59m5vhVEFVRAf2QaBcQk+Xoq5KaSH/Ds8i?=
 =?us-ascii?Q?ggxdYBqUFFivs+Ky0sgOhbIsqV0ZOC96a5/RYVdHZtGIroAZY9/u6KCVXjFf?=
 =?us-ascii?Q?8xSso+zdiWrFKS8Chz4nXruXoxO4t+5LDTftBBwgk7QyVBC2XrUiIvUJUqcC?=
 =?us-ascii?Q?X8+9pmBPAA7TbX0tRI8jxAb+NsH5ekU4omaQQNRa6JGPzyLqvib6s8MQs5DP?=
 =?us-ascii?Q?fUtf3H6sTf7eRIPc80fGn+weIARylQA5iKNjK4TfZX2SKFX/jh8tosgptUiv?=
 =?us-ascii?Q?4zo9NpG6o1S+coEHmh9u4FCUrjJHYo9p4ZOeQ/R7f2P6Nx6Iw8P5Va/F0K6k?=
 =?us-ascii?Q?CpuWMQ6xGiKtQJuuGh8VmO0Qfjlw1qU9kB69Nvc0gpROqleCQAmtzndt0Rsq?=
 =?us-ascii?Q?bbOoUkHoQahsj4xX4RHbWZjtPvWTvnglW7o+5OXhv+SH52KWNBHfRFntP9lr?=
 =?us-ascii?Q?xgriF6wZl0jYSPuZcLMXbJQYJUJCM/WfLHLedBbieuwn5HQB+VVdvH+2PcfD?=
 =?us-ascii?Q?Jp5uhx784a/Ze6uQSW7yosmepW5VKrJCq/1lulPJG7hoSUtMGbUGt9gVVifK?=
 =?us-ascii?Q?hZkB7lMu+hE72+MlOHVO7cdr+QE4LFPQNDCPfPp8mLi7n3wOizq7iVB6IN09?=
 =?us-ascii?Q?Z0Rm5kpOQOB3dDgvoy2oOu82IqBuiBfXGi3sbiTmQ3u8mTwvOo3ic+hsgKZa?=
 =?us-ascii?Q?Q+eqvHVdJsDnJC4lGL/+rcppxfMG47BYqEOFgjAj4KDCt3EpCRQFUvKB6pvo?=
 =?us-ascii?Q?kPYuSxdWegI1ItyH15E+ELHD81mG8LcTXp7hWAG1Qj2kUnwsFs0wsbhNHVL5?=
 =?us-ascii?Q?hO4tZs6usxVC1DRjeO9qLdJpyO7ZNQ2WsZdbG0vnysOUJZiFWOnWgY7zApIf?=
 =?us-ascii?Q?DUGCjnRzS4Pc7O758UtH+lqpDS/F0TJUtBRCPwOpYNBvGDbtO4kNNrTYTR2p?=
 =?us-ascii?Q?OiiaaJMa5Yf+5BrPA6BVFnjLvN7kXt8z/RcHyzXTUv6z7QA5M6px9UhoKC67?=
 =?us-ascii?Q?PvyaND/LCMdxrzAiLF1fhk01C06mr9BE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6xDuicjyCv1NKJyXcJCrySns0Q1qP4EQ3xFvktrKpRZS1iQ61tQBeR5GvIf?=
 =?us-ascii?Q?kS++0XJpp77DRB8C0vPUGqOhc1Vw4oV343RHTztMO7hYLJ8u3dwpLUe3x+s8?=
 =?us-ascii?Q?DdH7YPjrBRXxqi0i25S6Odj3suteS09g1jatSKbPfttgBIc/gbXbYymkarpe?=
 =?us-ascii?Q?UnZiQ7hg/CpGRqj9A9xlVHCXjAvcoKeD755uDBPV2UAKC6m0xEhZV+nOe2Vd?=
 =?us-ascii?Q?839dOEer9NPibkJxbfRBudSxHteJAa4reuqid4LpGOy1MGxoH/EnyLVnkNZX?=
 =?us-ascii?Q?lNYbIKj2ZQ3rCQdXDNvYN1E9EMDCKjsUebr4mfQYPm9WJmYTciaw7O/2ns2q?=
 =?us-ascii?Q?It6IbCmx2dMv9d2+LCbz/lotsFmffEG3s1UwEtwwrl98s8AlRZqMiPIFoE+d?=
 =?us-ascii?Q?W/ISUzY0JowDqmq43m0R4wck4hsROAxiP2OE5Xo2JiPy8XGLYCg8m5NRWUbo?=
 =?us-ascii?Q?Eb+SK3dy2gDc0T56Wp+igvJUQutm5NtstmrMfgdBrklwF01bMYBImz2G5kVe?=
 =?us-ascii?Q?9yBLCy9ZOh9PdKrWOnqHL39vXHjxVCOMFUm7YkA16jfhMPahrp/mjXQ5nsWq?=
 =?us-ascii?Q?oDhImhg5+xIy+vHZgztRgxqrc3OfFUwnUGPV6u+kCOkHtwzLkPp8X4QGXXIb?=
 =?us-ascii?Q?FLfl3wXoLBxPyrJhtpfGYekNRAGIsGeFyL7LZmvDfTmzJuDc0hUT+8A8vwYQ?=
 =?us-ascii?Q?THD6ZD/9spuvL53/ZNNSUyAhjq/oItUJicPk0vAmIWdMdn8X7K1xWEzpxSsU?=
 =?us-ascii?Q?INc8ZMOn6O75+DvUdl/GJtO2zHiv9BOcDQ2YKWZZd/whdJFvpYjXJJ6Sw2fP?=
 =?us-ascii?Q?u9l9peo3IFRNJx+DCdRNpJNfU3WkvQVdp8ysGq5ug8Vjo+ipaL8yOyRFdt6F?=
 =?us-ascii?Q?S/IAF8tKTru+t5M1o6ei0hyiVNbTslH6l6F59DZZQdD6QHcCeHo3AyM941Y2?=
 =?us-ascii?Q?AnUQ8CJ4bBBikqxJgSiBixuNYpn+A37ESVUKVYuPvzVktZyIn46Q0NWkvhik?=
 =?us-ascii?Q?emVItXwZmy8JzwPQ/e9KvcuqDioGtydgQlifUKjIkcQXEPUYNYTH1hqRZEFs?=
 =?us-ascii?Q?aAWC53TvHMmGpn6x6qD3BbwKPp8ePjdeMaNNVwbf+fgb18T/ssvBpfVJwGxT?=
 =?us-ascii?Q?dbwFGVmm8EWbB7RXbFsReTWeftVsJxErURjFcLgRi5dyTx+IewC8zPg5jvsu?=
 =?us-ascii?Q?jzu+nSuD5wCa9T1xsHhgsB8apOzkc9bt9hj7FxXSm3UZtW5+LqpI8a04Phne?=
 =?us-ascii?Q?zqeJfrFSMCA5AIG/q9VlKa2UKzb+7UFVu4FAxvJ8Wbvt+BTu8FGeFrwh12sx?=
 =?us-ascii?Q?mbA7mbPFkCDAINmebvaIrz6WM/wcVxO7C89Ku21NhGR1nDN/pgp+sJ0OnSZz?=
 =?us-ascii?Q?sOBq1b17e7duVbPHBgBFgumdavLp3huoCtK1gprOVuLG7HzdhNMG6vEC5tlM?=
 =?us-ascii?Q?5Dokr9Uyv5db4bUjMDLJSxFo5XdJcGKaLlOcNSyvxaXlp0GZdbJ2YHBUKOAU?=
 =?us-ascii?Q?MKbktesb34REEFSlhU+9GsfW4GGrKosARYqff4qIMcpKNVuSYS+WDW9mHWYE?=
 =?us-ascii?Q?0yS6mDr3hDUbd6UTfPrycnYmfvg/El0BGAAGIEyet2ZfW3vYE1JzuiOff9sI?=
 =?us-ascii?Q?Fh4hoP2nS/0MvfBIumZ6RXaDY3qdv38gABRAJYlQjVCJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc74686c-c584-4d96-8f63-08de3c0f8346
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:24:05.9281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukfKlJlQQunshEPHnpo+tkxNFZG4jVt+KWQXkH3RDEB2r4YrHqnq9Q+yp2r2qNAomi2gfvXfzTiMCyScggiPmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

A DSC sink supporting DSC slice count N, not necessarily supports slice
counts less than N. Hence the driver should check the sink's support for
a particular slice count before using that slice count. Add the helper
functions required for this.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 82 +++++++++++++++++--------
 include/drm/display/drm_dp_helper.h     |  3 +
 2 files changed, 61 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 19564c1afba6c..a697cc227e289 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2705,56 +2705,90 @@ u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
 
 /**
- * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
- * supported by the DSC sink.
- * @dsc_dpcd: DSC capabilities from DPCD
- * @is_edp: true if its eDP, false for DP
+ * drm_dp_dsc_slice_count_to_mask() - Convert a slice count to a slice count mask
+ * @slice_count: slice count
  *
- * Read the slice capabilities DPCD register from DSC sink to get
- * the maximum slice count supported. This is used to populate
- * the DSC parameters in the &struct drm_dsc_config by the driver.
- * Driver creates an infoframe using these parameters to populate
- * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
- * infoframe using the helper function drm_dsc_pps_infoframe_pack()
+ * Convert @slice_count to a slice count mask.
+ *
+ * Returns the slice count mask.
+ */
+u32 drm_dp_dsc_slice_count_to_mask(int slice_count)
+{
+	return BIT(slice_count - 1);
+}
+EXPORT_SYMBOL(drm_dp_dsc_slice_count_to_mask);
+
+/**
+ * drm_dp_dsc_sink_slice_count_mask() - Get the mask of valid DSC sink slice counts
+ * @dsc_dpcd: the sink's DSC DPCD capabilities
+ * @is_edp: %true for an eDP sink
+ *
+ * Get the mask of supported slice counts from the sink's DSC DPCD register.
  *
  * Returns:
- * Maximum slice count supported by DSC sink or 0 its invalid
+ * Mask of slice counts supported by the DSC sink:
+ * - > 0: bit#0,1,3,5..,23 set if the sink supports 1,2,4,6..,24 slices
+ * - 0:   if the sink doesn't support any slices
  */
-u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
-				   bool is_edp)
+u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+				     bool is_edp)
 {
 	u8 slice_cap1 = dsc_dpcd[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
+	u32 mask = 0;
 
 	if (!is_edp) {
 		/* For DP, use values from DSC_SLICE_CAP_1 and DSC_SLICE_CAP2 */
 		u8 slice_cap2 = dsc_dpcd[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
 
 		if (slice_cap2 & DP_DSC_24_PER_DP_DSC_SINK)
-			return 24;
+			mask |= drm_dp_dsc_slice_count_to_mask(24);
 		if (slice_cap2 & DP_DSC_20_PER_DP_DSC_SINK)
-			return 20;
+			mask |= drm_dp_dsc_slice_count_to_mask(20);
 		if (slice_cap2 & DP_DSC_16_PER_DP_DSC_SINK)
-			return 16;
+			mask |= drm_dp_dsc_slice_count_to_mask(16);
 	}
 
 	/* DP, eDP v1.5+ */
 	if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
-		return 12;
+		mask |= drm_dp_dsc_slice_count_to_mask(12);
 	if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
-		return 10;
+		mask |= drm_dp_dsc_slice_count_to_mask(10);
 	if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
-		return 8;
+		mask |= drm_dp_dsc_slice_count_to_mask(8);
 	if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
-		return 6;
+		mask |= drm_dp_dsc_slice_count_to_mask(6);
 	/* DP, eDP v1.4+ */
 	if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
-		return 4;
+		mask |= drm_dp_dsc_slice_count_to_mask(4);
 	if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-		return 2;
+		mask |= drm_dp_dsc_slice_count_to_mask(2);
 	if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
-		return 1;
+		mask |= drm_dp_dsc_slice_count_to_mask(1);
 
-	return 0;
+	return mask;
+}
+EXPORT_SYMBOL(drm_dp_dsc_sink_slice_count_mask);
+
+/**
+ * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
+ * supported by the DSC sink.
+ * @dsc_dpcd: DSC capabilities from DPCD
+ * @is_edp: true if its eDP, false for DP
+ *
+ * Read the slice capabilities DPCD register from DSC sink to get
+ * the maximum slice count supported. This is used to populate
+ * the DSC parameters in the &struct drm_dsc_config by the driver.
+ * Driver creates an infoframe using these parameters to populate
+ * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
+ * infoframe using the helper function drm_dsc_pps_infoframe_pack()
+ *
+ * Returns:
+ * Maximum slice count supported by DSC sink or 0 its invalid
+ */
+u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+				   bool is_edp)
+{
+	return fls(drm_dp_dsc_sink_slice_count_mask(dsc_dpcd, is_edp));
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index df2f24b950e4c..85e868238e287 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -206,6 +206,9 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 
 /* DP/eDP DSC support */
 u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
+u32 drm_dp_dsc_slice_count_to_mask(int slice_count);
+u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+				     bool is_edp);
 u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 				   bool is_edp);
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
-- 
2.49.1

