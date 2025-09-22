Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F3B91819
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F393310E4AA;
	Mon, 22 Sep 2025 13:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRuV973n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA0C10E4A0;
 Mon, 22 Sep 2025 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758548896; x=1790084896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=n0aKLN1S0xSPizmR4rwEqpfVKpR0Cxby9F64UNzLz5Y=;
 b=GRuV973n8g58VzpHWoVgdU/4isJn3jeyzfQWAtdbdILxkfq+5yfhFTkF
 HFIHbKhob9UB6XLdRJPSbss8I6P0frMSA8uHgNZUsxBcSiVuWtC34VWTR
 7zU6I0CL4MLmHr65hQReSiMlpzA4Ru6w9exmdTTRt2tAOgHIDhihQ4qRE
 9EVTqaGonLH2BhI0LVVyTDwEs69Aq2OT6Z0IBOtaaHXI0u40G5IyoAFWb
 0NImnQeVa3WshQozhopCRckUhGbhw8ItT14Gla3EmG0NN6OiQ/k7O76HL
 aBDQCvD3fiyldt7qF2y4Uso7BaPmu631XI9UNnxtdeASZKyqb2MD6GFED w==;
X-CSE-ConnectionGUID: gnk40b/YQC6dQsi2HzkJNg==
X-CSE-MsgGUID: yPsnFe2RQfm+MeMX6mXsYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64633385"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="64633385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 06:48:16 -0700
X-CSE-ConnectionGUID: jdhmkGQZSEG1tjYbPuMp4Q==
X-CSE-MsgGUID: 5iY7CJtHQ3aFGYws71/g6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180882300"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 06:48:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 06:48:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 06:48:15 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 06:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QV4vcNpU6D4n3qhtmk/KdUey5wgkkmsW6/hZEGMRgNn0CPo0kZm3EZspBKNjkvGHz0HMxSf0e4IqJufLvDkgtaGbQa4Ev78iPuPjduHFkhYXJcfu9bgl5vT9GKYWOBIoy0mb4+dQivO8Mwh67G66EjKWH6FduRqtVjWVn0kgwnE3Iw9pshRmjUmcXCd9iaLXuCrpyRhi0H1cAO8kjvG3M3xxAcDfghSgoK9FxgQpoZzLlKXTXsoly/IanyFgHURA2m9cQENmq3LIX/kZ7XZRUcpcVKJlz7pkYqH2azWloYQWnyIce903P5aP/444AX+edLkZarY9C3ZoYjYCSbC+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaYrjfutdj2BaMnqQf/ud2xOD6Gv07FVo19oqDzJ7No=;
 b=SP8fmPzliupn7qu/mSlF0LSP3mhPmLdeduGwwnHG7qPRD/mUQ0Wf8b9efou+sXqr8liaJpmich/jxvVPdtMRTt5TmdjS0WMU5fgb7+txOmT+hREBy9CpXxTnTKN2Po03Tg2DtG2hodOrbpfJ4RZP2+TrzK2ZBDhb2Nl9GekKBj20T2XYS4UJVl8DPZKPD4XiMRwGgB6/Rieal7XXgIj3SuuXFmWudJCWzDoowpk6iA+sqz1xHNMd6FWWKP23USv1ntTEWKC7YJQRsRncZftkFU/f4xr4b/RaI8tU1rlakFeRKahbumf+5esMAQ/O44wwRRUq2yRCXavhf4WQDAWXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:48:13 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:48:13 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Vidya Srinivas
 <vidya.srinivas@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH v2 1/5] drm/dp: Add quirk for Synaptics DSC throughput
 link-bpp limit
Date: Mon, 22 Sep 2025 16:46:36 +0300
Message-ID: <20250922134637.271999-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250918211223.209674-2-imre.deak@intel.com>
References: <20250918211223.209674-2-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0282.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::14) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: c2755d18-5a79-4677-b7cb-08ddf9deac7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5+CD0bCWF/6dOdwJPRs42nElsU2XizX7jKsFsCPGV2PGEL2S2Xj99PRyVjD+?=
 =?us-ascii?Q?5wnOf9NpgIY+gzQuUxf68i5ElYAP3o/7shSO4t4GjTITBKVUbmcXJ/Mgrcuu?=
 =?us-ascii?Q?Sa9YTJ45sWVDxRivd++nd+a08qVQrwjU70jKdXMsOrnFUVrUdfii8GcHNNVe?=
 =?us-ascii?Q?aLMQB70TDeBtIdpIU1j/qw6sAeOL8bI9FL31fU3liSQx8qbEw7UB/OqGaoga?=
 =?us-ascii?Q?SeLqucg8dXSYsmLtiM9ArpZqXsd20tEvx6KLDrbItez3KDa+FYRsOhZRlRSO?=
 =?us-ascii?Q?wx9yu8r/DrCfx2eD4qOFFajKUYoNpZcGffw2kmMQkVdrlqwlr5w5tcxuPPHq?=
 =?us-ascii?Q?aioTg53JRTILUdt1haTGzUvKmAQ9rHrbyQmGfdMK4WvqhuPbp8XkzEqDFPfV?=
 =?us-ascii?Q?LyQkeiNaM6F9RpezRH+qTrOmvDqoa2hzKY4KvTFbviZklegktAJORs+NErsp?=
 =?us-ascii?Q?NnQQDnxiGbSJg6Svt1T1DKc8OzOodg8JRG6S5csE/CuMPFXlTPHEzPlKS4pt?=
 =?us-ascii?Q?L4MSEu3Zxp6Y9Z96ATOw6HSL/v3l3XhybAt9iMeUX2n1VKEf0rPqEOWHcnxY?=
 =?us-ascii?Q?28AQzDEg/MzMo+z0H3QWlWQ7JPTdd3tkOmviKKkcWzB5ZTZ0wJml5XjTTpd+?=
 =?us-ascii?Q?CsuhOkvhB16jVph3kkgNHTF7vjUpsJgFLN5GKnmb9and6Q0NaO15RcZj1img?=
 =?us-ascii?Q?TiFMvGjVXSRoOeE6UEfvoMORN50g3jV/oenC0dqAzjt8Rvlz2bI7Y9DylDi2?=
 =?us-ascii?Q?hQ4fyL75zEKJxrwainYcBgnQJGloe3TttQmeBwOhZupxRKRqDTrJ6GPfVoTn?=
 =?us-ascii?Q?E9ddXyjb88eYVeVp099lTIiQvpdei2/EPgGuJcQVh8oJaX90RE1hvy2yOnIA?=
 =?us-ascii?Q?cuEQw6Ur6f6cts213W7C6uOCrKc7u6o0tU8ZKBL2EJzuoCpakhFSEdYdncce?=
 =?us-ascii?Q?OYGaq5aE2q3XsSr2RvfDxcO9kPzLd6LfdmDIxPd3s4vQxxTYyemTNCbGY6t0?=
 =?us-ascii?Q?2bttNUYG3591k7th+jyE8bxty01WBXeh/rITl8jinc//XqmCPDIwnNeLkkIk?=
 =?us-ascii?Q?rdOrlxcYnWZqyOTzOaC9Z1fZYt7XjNcyPJQbWYReCwNF61kernLQqBxr8PAP?=
 =?us-ascii?Q?WRL8x/x5TFo1SGIuWcHlz66gfQFJC0LG1QlS8b7FvwKE/oZ3hkE7kut+TDiV?=
 =?us-ascii?Q?Iec2uaUoxt/72h8kZIAezI3wOre35M31cX04gwATL532Mk7Ps16ZITtYaFyQ?=
 =?us-ascii?Q?6uZHH8UTKv1zO83xOY/OjyAWHalZFpBU0v2BHXzbf4NjKrnLPw7bvD7aDMBS?=
 =?us-ascii?Q?aOtg4czbQz5MvlZUJ0AUpUxYcIGSg3nDXZOqkb1r3RbG1bpD8tsD3XKogFmv?=
 =?us-ascii?Q?xUc3KxrDR9rAhdHgGSUwJOihzvTfvNsDnDYsrlPXxt43qBamen8uo1kxAqxF?=
 =?us-ascii?Q?fAgMp0z6430=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XklOn4mRZNilGJO4Jxp/FlB0b/qfffLHtAIzJRy6LqDRBZUIbRbMjc2bvLN7?=
 =?us-ascii?Q?MPSTr8XlTSY0VT5+o2EUXP89Bs+UTBp0mjcfrvFSUvLc0/luNI05qK/9X95K?=
 =?us-ascii?Q?s5c6ev7kAFZzi1FBNmpNhZZpgbw8Bs1Xoayfpt+fhu1Q2fg3ai8ntXABZ6nz?=
 =?us-ascii?Q?k5l8JYrAHNvUmrRGgxKhEyQA8i7f1wrwuBK4vnTtvKaf+B7xEiTGAmgIRiql?=
 =?us-ascii?Q?I3IXjDp7YRXRiyOCVU3GMReWgScj+wxYUc9su+hST2TE25NJAevA2O/cATLC?=
 =?us-ascii?Q?RauxY9oTamwYwA9vgtEslyoNfIBbCIvpaM9TUZMRpPnp56TJFhAnChlIOIkn?=
 =?us-ascii?Q?RZnV3maZ7n0/eBI81+tMQb3WsldDrQs7lOnIB7sgetadJQKRySa/siBQnfXa?=
 =?us-ascii?Q?Ta2JF9rbQn2qRsBJoiMsFmEMcSR4ZKhu8b+8paeR2cvVg6Uym+4V7pVRCZnJ?=
 =?us-ascii?Q?Z8cbW08fFN5Yxc7i5x8hMD92TL1ips/VlhL/+5R/Xari9QmitoX910+z7fxW?=
 =?us-ascii?Q?W4jhCBGwNGJxmRaKQgb7I4MvG2MxM+BiMmeHKycrGg6I/eXpO+MtWpth6n9M?=
 =?us-ascii?Q?0Fqm9buyajsqsVDQqTPUU8cYlXuPJmwLyO5+TcZSlOX2/Hugvz8ykz7BRzWP?=
 =?us-ascii?Q?7C60fkv0mhr9uRDFklrl3FIBZsjJMHTzq7wxSv95GQL27fR9vqIvAIRhjwOC?=
 =?us-ascii?Q?sfnM6sqgKKLUkbpZnwTDk+nVn+35YKkCHcVosddTcoX/Hn0VrEklqybrVDYd?=
 =?us-ascii?Q?E4/P2a5cN18TPQuNq8PoOOofRG1KJrkWqGw9E0Xt6kjh7sTovfJ2DdejS2cm?=
 =?us-ascii?Q?E2g99NObKim7rRslinw/1iqpt0ajznN3NsB9xXCnv2e85batjJlDHhBCuQyx?=
 =?us-ascii?Q?iy7Aui/CET0xWJr43gVkmKkCPNQnXN7WdwKE0AaAmaPinvDsn/AGftkJfbkF?=
 =?us-ascii?Q?0yIMruT7MQULpMW+NlceSGva3uSt2KSDkMltCTinlyyacbyD+UNSgSi9wQix?=
 =?us-ascii?Q?eeaen5m9wHv1o9iIcJUUE61sEK9hoEI9g0U+HZCkLVpNmcHiuImgJLafYYgn?=
 =?us-ascii?Q?u+c9RHe0ZdZvv65GqWBYz25RDDXnCWKojQOwpm5qgBwEmwX5f5ew4JsmQ0MR?=
 =?us-ascii?Q?IxY7ucN4RTKuePrigOHkTSfqSwR8juQJwNf25KD8KgHdDXo6s69eMt1Tz8Ns?=
 =?us-ascii?Q?7Jubni+or371YC5E/coGnET/Nxl7k7uGf2pWF8ACM30iVKBOqsHxTW+2sKZ/?=
 =?us-ascii?Q?JoYGJ1ZzmFcTR6vi2txKeorNJGqqsorGNnUWREsSVe9StE/r852c/9LuXfwY?=
 =?us-ascii?Q?o2jx71la7iwJsDznzFCZFXD9+4zs6/04dWudpKcvjUZek5xrZ+OPKCw7kIQ4?=
 =?us-ascii?Q?I4bnJCa6GU+F5Ck3hvhcEpZhOIbxPs8rMog1WREWZpMncFaSxigKpUeywaT+?=
 =?us-ascii?Q?OWjzyouA0hqybnnpH0wbVE8lk4UVHBCSAYF8EOP3ujr2o55DJQ3nTMlDZNKT?=
 =?us-ascii?Q?SFEPlIyymGKFS689lLB8zhIXZbZGv+sJPqslbyBKT56A3Nx+cvwU6xUj0khQ?=
 =?us-ascii?Q?Vhyf64n/RPUVm1h4Mpt+gcJG3L3hX6OtlX2Fr2HkXeIYNLQXQZ2MXDnFm6OK?=
 =?us-ascii?Q?CxM2zpp4FBqPfsKANe7LnkOPcNTSN1SQfXs+RLBaPrNg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2755d18-5a79-4677-b7cb-08ddf9deac7a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:48:13.1432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOpxa5Q2dvEuvHZaNSxcO/SD8t4geK4Cq5mCApi8jqbIf+kq74bzPJm+Vn8ihn/QEqhgUdeCFIQIQETYf0OugA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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

Some Synaptics MST branch devices have a problem decompressing a stream
with a compressed link-bpp higher than 12, if the pixel clock is higher
than ~50 % of the maximum throughput capability reported by the branch
device. The screen remains blank, or for some - mostly black content -
gets enabled, but may stil have jitter artifacts.

At least the following docking stations are affected, based on testing
both with any Intel devices or the UCD-500 reference device as a source:

- DELL WD19DCS, DELL WD19TB3, DELL WD22TB4
- ThinkPad 40AN
- HP G2

At least the following docking stations are free from this problem,
based on tests with a source/sink/mode etc. configuration matching the
test cases used above:

- DELL Dual Charge HD22Q, DELL WD25TB5
- ThinkPad 40B0
- Anker 565

All the affected devices have an older version of the Synaptics MST
branch device (Panarema), whereas all the non-affected docking stations
have a newer branch device (at least Synaptics Panarema with a higher HW
revision number and Synaptics Cayenne models). Add the required quirk
entries accordingly. The quirk will be handled by the i915/xe drivers in
a follow-up change.

The latest firmware version of the Synaptics branch device for all the
affected devices tested above is 5.7 (as reported at DPCD address
0x50a/0x50b). For the DELL devices this corresponds to the latest
01.00.14.01.A03 firmware package version of the docking station.

v2:
- Document the DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT enum.
- Describe the quirk in more detail in the dpcd_quirk_list.

Cc: dri-devel@lists.freedesktop.org
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 4 ++++
 include/drm/display/drm_dp_helper.h     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 5426db21e53f..1c74fe9459ad 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2551,6 +2551,10 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Synaptics Panamera supports only a compressed bpp of 12 above 50% of its max DSC pixel throughput */
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x22), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x31), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x33), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
 };
 
 #undef OUI
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 52ce28097015..e438c4440995 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -828,6 +828,15 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+	/**
+	 * @DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT:
+	 *
+	 * The device doesn't support DSC decompression at the maximum DSC
+	 * pixel throughput and compressed bpp it indicates via its DPCD DSC
+	 * capabilities. The compressed bpp must be limited above a device
+	 * specific DSC pixel throughput.
+	 */
+	DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT,
 };
 
 /**
-- 
2.49.1

