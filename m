Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF6ABDDFF
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094F610E4FC;
	Tue, 20 May 2025 14:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GG+Lnyx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72D310E520;
 Tue, 20 May 2025 14:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747753077; x=1779289077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lmXlbL38ZkmM7acLxwnxEIStt0xb/CLh9Pv2epPTWlI=;
 b=GG+Lnyx117JPLPizBSy24kHWmsKe3e/8nV1Y1o2uCtQRUOgxWkMtSa13
 FBWDbcIeuivNifPR7QT7jNtbP5CXiq0M6KUq/C5I+O/e6aGkATTbb4mlw
 Gnj0TZdCN58YZ1nNJbKdEnb8SOyKLdstGpUI4JoWMSXkiHU9YetJaZALz
 kgqEkRfBo/JE1AJmvZYan0ykrcv6gnH26aKxZtZwdFd97Y+8ELQP8DlZ4
 pkxjteKv+FycazXtARZhAq2B3g0wDQCD/6rBOLdAm6283V9RfKMAPcUyA
 lAyYcmy+2AMEP/coOjJ0JOXtgjTcPYDll2oLYlDTrJyknCoXWwwLvDwJj Q==;
X-CSE-ConnectionGUID: 3ZFmMpcjQgupQmRF8YwFaw==
X-CSE-MsgGUID: xIX7A0ukTU2YHYl/mFq/QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49623138"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49623138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:57:56 -0700
X-CSE-ConnectionGUID: wICdf85uTvGtqZ98oIbCpA==
X-CSE-MsgGUID: kjpxSqseQGKtyucT24sWUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144973614"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 07:57:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 07:57:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 07:57:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 07:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vphMdRPZWLelNI0kR7Zv7nUGZ2rNb/OE3B02ATVstUsM6d3dPthZ3Kqf6RS63hgdT54Ku4Q8wjWLlOLUFaBdBq40llXap2V0nXycIbkp32HBckjWtp/IKtjO2hYiSHSR1IhENXD05ql0q8OcIHH3ZI/9K+avEp0wZXEs4IE1ppnwqfRQxI5uG7z0uT6jeTIU7/6GLU75+u75n11SVHKlbod/xYao2sQUTJSmauJu9nn8hV/o/Xx9piqwlCXLJCxvwdX0MxOJoosfI8CGJMWXvcO5D9IrXfQToJBUCmthXT3LnPrgq+hHyfA+AFoEt8T0OYKGjG2uO44kpy+DHpuplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkVrrlzXcyY32U7PxqHFPD9YvDkPwgqhgCE08ZSg1Lk=;
 b=DlhkzF3Kqh6FQKU0dzY4Cpi10hk09Twszz+ZZ+//rIvTdUZX7pYlOU03PzOEKwjR8eaj4h9LnwTFnxGltcwOTRSyGG+HJICJib+JlRTSoq/JrPidY9KYYnsY2WXJxHbWH110D+PBOOq1wGq6fNzMAKhtdoeoKuhLMSpwtKBXeUucRjfZRWYX9afx7Z3dJNHKYm9wLtBH0KkqN9xjIxDQrJPfIy1vB/bXEmJpsgnLPwsWVRQNEBZGGfEKlgSo5zvV1RJMFJ/zTTbz5vwI58LdkmH9Lt5ffCflH0XGZh1Gve9eB7K2Lpxo5NRbaED+IyOPSppuW0tQ18prMw7CI3BxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 14:57:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Tue, 20 May 2025
 14:57:47 +0000
Date: Tue, 20 May 2025 09:57:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Simona
 Vetter" <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 3/3] drm/xe: Add WA BB to capture active context
 utilization
Message-ID: <cdeayuczdl6ncimrrdjdbrbxn27cantuafsyikevqn7v6ziwf6@q7kowyi4chuw>
References: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
 <20250509161159.2173069-8-umesh.nerlige.ramappa@intel.com>
 <b2c8b0c2-ba9b-4fb5-beef-6e405eaf9247@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b2c8b0c2-ba9b-4fb5-beef-6e405eaf9247@ursulin.net>
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: f670e59f-d78b-49e9-bf5e-08dd97aeaf39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H9mwoGWRqwZV0+BDsjC85V+XPc8sIVZD2hqN76437UrcxhOdvllTr1kENal3?=
 =?us-ascii?Q?vilSBQTyKomVNLSZJaVRkArPRCX3bdqzcqij08qsaklFerXJmOAk2bWQZhSx?=
 =?us-ascii?Q?3auIRCW9iN/Zj334EZke+ZPD6uE65ntsYZJPkvexVHuXmxEv9m3K98nsjI31?=
 =?us-ascii?Q?TR7PMkYY73z0N+BHWxfsX7Fwf+7x2r6nmgGYKbAYGKXIoJ0Wd85J7oOnHH8s?=
 =?us-ascii?Q?0zanvj4H/PnlxvSLcv10MczVtqiMgqJ0sJ09VkZzcDMpwwl5XZW/mZMqe18s?=
 =?us-ascii?Q?jNTiAa/UuIJpEqfcMiXuAeGiloh2EQfPRF7JPePvYhrbQ1O9OAn+iAf0pzqh?=
 =?us-ascii?Q?TyR1+bwXC3LH4tSupZ86f+igBH8/QHEAtxTATItFooH8OIcxKVZ3l2HcMYyH?=
 =?us-ascii?Q?r2TyFpLrgvnFyNHXfrM1iL/d7vAWMJm1Zx92uxZqqutGMF+YxMWVVG1jqNzR?=
 =?us-ascii?Q?hkbcs+Ruu3QXI+i+Ryv7H00hmvQHibnc6EqmKh28cokw+kNPLjj3Clt4BEg7?=
 =?us-ascii?Q?oQGtlo8rj7jrnD71FmYvRMdH8CBY7eWkRp+FxHJTQtV/w3MQthFPHC2164tt?=
 =?us-ascii?Q?oL+jVBhez2EfxYlxDxwXHzhlJ2Dkvt127yhljenY/Fjkbfe0gtGoTmDZ/VaG?=
 =?us-ascii?Q?jl1c1iG7nbtqEmVJLdgNGRP9WnlE39Twpx1JbFMevKc5ahs1IG0gFu5zytxj?=
 =?us-ascii?Q?sJfvYhcTDedqSSwjoTz6TglcmKe8iS/CHfGJb5FztyjsHJxUglzDymR2XlUP?=
 =?us-ascii?Q?SGAV+97YtKk2BLivgf4Litct2YiyDRg72n3UcCa6LEQgs2EzeIgGFEJ7+aYv?=
 =?us-ascii?Q?tYykGCcMK8cxcPL6n71A2YI34winjJV+9D0lEXVyU5upM6gscrbBWMD4ofqV?=
 =?us-ascii?Q?GMoBF+et4swRY3XrXGqeZKh3H2XiTB7Bl3ZmTgk8Um/9ZL3sJssRE8yt5NvI?=
 =?us-ascii?Q?sdcTvGTGhv5iUnMLf5dZPxteNHKMvM8PlN56Gcn1P2P4tR83pPRUWjEOdwCn?=
 =?us-ascii?Q?iKOS6V5umEWelC+yWUX7F6yuAI40O7KTl9QxstpeDJEInYDBZwrod7kNewZG?=
 =?us-ascii?Q?RANS9Re/aWTK8BOomkkrVnHn6D2qJMmoB26ZPITqz5hp/QkMjJhiLwO0k46v?=
 =?us-ascii?Q?ZUw9HhJSqF2JGbyG5RQoyK2I0oQYSJZUJQisZfUbZRYW1+MKrGuSB7vv/Vyf?=
 =?us-ascii?Q?L3ur6gDfM9Hoj/ZwmpE7zarAeLUsBs0m9WKyeNn0+xKxZ5KX0I2WnKy+mS1X?=
 =?us-ascii?Q?c7RTDhKc05DD8s7J+P983tBqYo85OUYt9zxWF0VbSwLJuTT10Ex49WjIPRv8?=
 =?us-ascii?Q?A2fd7mxnj88b4OoXGmJUTJQqNzyvXybpnECXVGD8iBwA5zxLk7iSwin4E5HD?=
 =?us-ascii?Q?BPhQy4+xDTZUHPtX8XR5NjtjVcLNDOYMU50ePWgHgx3Csoc7nVT4F5BBDaLb?=
 =?us-ascii?Q?3pSeKosr7c8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IlHvhRbVl/gnO5G9bUuISh0Vj1yULKd1w2oxQzFnQu6DTSH5ftbvpYSDR1jJ?=
 =?us-ascii?Q?C0jRxNzW43XkeRp3qh++SQTzog90K6uSEhLNrS9iEAkX+j+D/wAmL2fhVgyN?=
 =?us-ascii?Q?cCMSeUqogN8Wo8eHXg1k/Aot3G07KoyAN+caDbQM6qnklIG7py8+AuTv56xM?=
 =?us-ascii?Q?DkyVOe0Fshpz5RmGKTeD4kOmLsmPOp4uF+gVTM+KjaFiJ38Ho9AjDOSPouwQ?=
 =?us-ascii?Q?5wRsnOT7MbV/PLzJf5VzUQlCVaExqtl+Xlmuelzs2qAQZXxnKSHyJGwvJNnp?=
 =?us-ascii?Q?WRQmbog99lH06EyUeXrisONKBnW0Qy99EQNx7/962vmd357k7RlT6CDd73st?=
 =?us-ascii?Q?BobNcCSSguga1LCOwBw7QgbkPZob4JerhtfXbkCBrOcupKYBnbt4t5M6/lc0?=
 =?us-ascii?Q?s6vebyt/CUR9K+g0aViVnjQ7m7PSTK6iVyIleubiM83cSzE33/64OFRRqNWH?=
 =?us-ascii?Q?Kcnyl+uTujz5GEYAo63IygZZgW1gl826j/SjbTr9VxKB2ekAM11F8jNcwxGY?=
 =?us-ascii?Q?OApEtoJkICIpDNsRrYqE96EdixErIalEymPYgXO1OHlteuelj+4ZvMIzw2jk?=
 =?us-ascii?Q?ycO6AxyCkvY8V5y9PyDtbfALm6KwScrPeTxPXOUVQBOva2v6eNGXzQ9mwEhy?=
 =?us-ascii?Q?cLV+uym8v80OawsCE83UWGzNKaYEshl6SinQE3tyLcpHVImrU0FutI/s72vp?=
 =?us-ascii?Q?a+6G34BiEdIiViZ6mSmgCyEgWAXtXU4yWmgy17Yg1sP3gA5T9x8wxm1oHCRX?=
 =?us-ascii?Q?0s3ICX7YO8roidfP10jOiD8ZKZYy3pU0HtFYtLOxhDWlryWJjxl3gcQjUMFt?=
 =?us-ascii?Q?ALyxL1D7zS21qfvE6DC48ZIlARf2jMmeGBS3JwesAx7d41SUwWDymOVUoaYL?=
 =?us-ascii?Q?Cm52vJolxLn03/eAZ10Qy8pN9eLVDHRmEV/mfrtYFS8M9ZNGJrKbQXForfEO?=
 =?us-ascii?Q?T7j5yZFTXpOw7sp+hbCFVHaRJpZakZhqYMnp9oSro1dDg8r1rvymoNwqK56t?=
 =?us-ascii?Q?QfnGJ44B7dLDhZ0qoqNGliCEL0iGjB4aNBTIq7N9trlPflHVYycYcBv21ive?=
 =?us-ascii?Q?/mhK53K3fe5Mz75z48r/dVOINgFmWr9HXaA+1069rKld+dsSemKqfaqYKvSo?=
 =?us-ascii?Q?iOglREAN+0v5X2I0q6X4IrsITIZBglyUxujCPb+KJLWAMzcnGmqPZZCRd+48?=
 =?us-ascii?Q?g+uMTuUWDE6t6r0tWgl6zzGXW3ZT+0WC6xVbefUOce6bAPp5g1QdKSk3cA1m?=
 =?us-ascii?Q?zUIZccoZaC4Yc0Pj8IyAJgSVM93l8S0RL+/0YL/+9D8xHqOV1Jfji8pT78R3?=
 =?us-ascii?Q?e6F+hSQzQaxKUkjeMjdAT+HNeCFQrspqJKIYuYDLqoh6Q6bvNLArtfTb3jHC?=
 =?us-ascii?Q?okoWszxVg3dGhj22mO5Zm918gy85HbgtcARhRhXS+eYAnfRrgbfDA1bkTPl8?=
 =?us-ascii?Q?9kyGyZDQMP1T3GpKtrXlp6UKH8vfefhJ+0oRkcvv8f87w+qklA7Muv5pU1dC?=
 =?us-ascii?Q?fiHM/BKiTSE4KgfU9nT1KxMocIImXMNR+FlfmSPoRe5Z+uPgohTFs8ICESpt?=
 =?us-ascii?Q?r6lY0N2CJHsggYGWxub2aIXlPZBxOyl3/8hcTN6w72ODbwvHtoZ3xJsHk3OL?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f670e59f-d78b-49e9-bf5e-08dd97aeaf39
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 14:57:47.8545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2GnTqVvlJFUbFy4uJ50Etek9TRhmK3VycjOYgtk99hXLNSqJo4YgAL62zdufge94OFQJF9kUSJAThFNp5n7nXpLcx0NjPaTgMSKjryM7mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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

On Tue, May 20, 2025 at 10:01:59AM +0100, Tvrtko Ursulin wrote:
>
>Hi,
>
>One question below in the context of the missing workarounds series I 
>am working on:
>
>On 09/05/2025 17:12, Umesh Nerlige Ramappa wrote:
>
>8><
>
>>+#define CONTEXT_ACTIVE 1ULL
>>+static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
>>+{
>>+	u32 *cmd;
>>+
>>+	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
>>+
>>+	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
>>+	*cmd++ = ENGINE_ID(0).addr;
>>+	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
>>+	*cmd++ = 0;
>>+
>>+	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>>+	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>>+	*cmd++ = 0;
>>+	*cmd++ = lower_32_bits(CONTEXT_ACTIVE);
>>+
>>+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
>>+		*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
>>+		*cmd++ = __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
>>+		*cmd++ = 0;
>>+		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
>>+	}
>>+
>>+	*cmd++ = MI_BATCH_BUFFER_END;
>
>Matt Roper raised the suggestion in another series that we should 
>always use the iosys helpers for writing into mapped BOs. Later I 
>realised this code uses the same shortcut as I did. I probably even 
>lifted the concept since I placed my function right next to this one. 
>:)
>
>So question is what is the definitive recommended way to write into 
>mapped BOs? Is the direct writes shortcut acceptable, or this also 
>needs changing?

right, I missed that during review. We may have a problem in !x86 if we
have __iomem here. So yes, we need to change. So probably:

cmd = &lrc->bb_per_ctx_bo->vmap;
xe_map_write32(xe, cmd, MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET);
xe_map_write32(xe, cmd, ENGINE_ID(0).addr);
...

maybe we could add an iosys_map_wr_many() that would be a variadic
version with offset incr and hopefully the check for is_iomem in a
single place. Another option would be a local buffer that we memcpy at
the end.

+Thomas Zimmerman / +Sima

Lucas De Marchi


>
>>+
>>+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>>+			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
>
>Btw here code uses the iosys helpers. It is a different BO but they 
>are created/mapped the same AFAICT.
>
>Regards,
>
>Tvrtko
>
