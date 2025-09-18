Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB5B87080
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 23:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5A110E904;
	Thu, 18 Sep 2025 21:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhjFYy3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142B510E904;
 Thu, 18 Sep 2025 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758229955; x=1789765955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zIP7jERbMQ6pccFIWj1IkJ91LUBIX8lONLqISM/OaFk=;
 b=BhjFYy3ylR+JDxLAwaC1UUourtWZ0mH51WrRmtsSIXm0plAOSpAagHzl
 hWV9r7ew1tmRMkXaPDXwetb2/jHnSMUJ4IZJNJ8SagyxQhpOAYXE1Jnj3
 i/yWz0eh6Kf1yr1DeN96agttA/PygWg8bDaVEPKcQwqkYxw9CM/VuUNAA
 c9qXtoKgrsiJH0hoR7jbSgw99OnbkXCVlLdIk/H9jjQaSkPRyLicsaukG
 uF27fTWNIyi7YoB33l4g2fDVvGZ63WSZkPjzgZeqmWFoJ3/l6hi/epml5
 IwBxsYO/aYJGSJ0YezWI6nSNQCjZaQuVAlbb0wdK+sP9NSGj74zSn6n8s A==;
X-CSE-ConnectionGUID: 4xCnPUc7TuaLzB041weNWQ==
X-CSE-MsgGUID: H3y6wRFHQ9aTH3DbSe2MyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60506021"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="60506021"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:12:34 -0700
X-CSE-ConnectionGUID: ghFSl2rnSau6/k61KS2GrA==
X-CSE-MsgGUID: O2LYh959SHiN7aHe/bv4DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="212809456"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 14:12:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 14:12:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 14:12:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 14:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpNN4rDJTcneJupT+G9vgOBSRbjmVRsdYmK7DlvUa2tQ4vrh1nlaOVF/gfMjWWhxEyStK/Q9RI5veji5rG5HbZGWG9kLNbXtFkBxNT7d3Ft2fy79xxMgUnU+FwmolcZFH6PsJQUnwHnA+ZQPPDObc32dvSg0LG96byOqobOGrFTUYH/wbYu/NICWXQfuJBGSNUvZ9diXSfrXOjXTJn3vVUJ4VkkK0swjbjNAsawQ0mRmPd4Wp94WcXxNCLYLrgw47/Zg37WiKSVUnx3fkZFDmhmvDfkhQqgiohVgymc82HSE64Rgkc4FwxcGR+J4A6vDpOeWQsMSdDYnyhmCQYF/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYeL7iT4h9cWb5wAZC7hCqm1GFZ5uUtq2Vsida3k3oM=;
 b=DKoBpR96GkqrOmgfDrZ9cqmFm2pi1VCdm8g5ynm6s0I218mX+QHJw03bIopPpsY7Is+bSqN0Hc1ETajpLn9IwV2ZWVdVKC1vVCzuo5Kn6b0q8inEUMeGfYOQv/PyBlEpFAmY4/XEfwSeGgFnsiqjotoa2G8dpnGXKbhqhFkNWiGIqDBlyf8rPCx5n3uyldvv2LFzdmCIZTghGkfSqGqyURuVFQpdtoMi2WRt2NLHNTdt3GznVDej8T0i0ynAUTvDtz77PJqV7X4G+xWm1avYSPsvajsYyRpoT5A8NY4CnSPqO+uGnpNdtE8zix5WDwrWNS/NBkO2mGJSru5LM4eCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 21:12:29 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 21:12:29 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Vidya Srinivas
 <vidya.srinivas@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 1/5] drm/dp: Add quirk for Synaptics DSC throughput link-bpp
 limit
Date: Fri, 19 Sep 2025 00:12:19 +0300
Message-ID: <20250918211223.209674-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250918211223.209674-1-imre.deak@intel.com>
References: <20250918211223.209674-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d01bc67-03f7-4e0b-e747-08ddf6f81375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MrFYiOG4RsSMdV4Ptg6pG0MNTElAJQTPrsTgdq6XSkgQ6aSeOzX9W/EikfqD?=
 =?us-ascii?Q?3yHRwwGWNASH/3s6KOSeRumtMTuxdawo4xLUxEYJWwoIXZfyOVIRT7my5z5y?=
 =?us-ascii?Q?z67KfuLvSHIBNY2cL1TMdKZYTVDjYaRcYqiuQAJlWUoiHP7SgqE2dHWY1KvX?=
 =?us-ascii?Q?kybBc9NhFT1y2gjowLCPpvVx9rehZHvwvExsSXt/APx65BEFG8qMD2VZPxPX?=
 =?us-ascii?Q?CddVZBeMtKdz3wJAd6r0Qn+134zcHnfmD6EDbSR6uuYHgrKIEoH1BqIrXMFU?=
 =?us-ascii?Q?FgyD8HKyIZSWLVi9tI2yeMJg6TroBHVo2Da33yXelsqbPHeMC1aeFo2oZ3u0?=
 =?us-ascii?Q?swTHtBHpSCjvsnqtlah3mecVmMFADO2StJfOsFZAbvXoBPO4ESslQGkN7UrX?=
 =?us-ascii?Q?OodmKb/EhhWTuTfZdHIattQ2Vdk2+3DPtTXz7zm6EijUBNw7xjkV/TBO0uMu?=
 =?us-ascii?Q?2kHGHIuBx/q6U+oOuxxlcSq9v43Qud+Hg+02r1LlqfCwF5V9T5S8mYYYXmaf?=
 =?us-ascii?Q?PhdA9QWN1KpqfFOMZGu8oqrzd5Iri2uEH5JfZsiZBY1LZR6gWHnlkjoD6pHd?=
 =?us-ascii?Q?GOxF+2rD3F9U2c88T3wqgQtbwapnS9vpGasuLgSQ2E86/rM/J2Y7EXP+PKfD?=
 =?us-ascii?Q?WNpCKyWHKk+D2EC8usEv3mXHnpp7i9BdpOaHTpfBAXCo2KpRuJjvMBF0gWgo?=
 =?us-ascii?Q?vAK32H0TShJJ3mS9fUkHQBnvqHysxgnIKg6eJcT44cx1sEv16sBHZb8EF3IM?=
 =?us-ascii?Q?QMGQ2OpN0eiDBR7Itb0WYWMXY6EvVZYXPJT5LhY6S8WfrgsGz4m7o77ADt4e?=
 =?us-ascii?Q?MRy7T8mndSKBesw2dpoL5FxITGUvg5RldiyQ2qz1xdfpgo20LME3CPFVEkym?=
 =?us-ascii?Q?sHKc3aYc0ekBILrQF22Buq143aILBm//u3Pm34d+O9x9u8zj8L0yBjn6ei2g?=
 =?us-ascii?Q?dgqonYntB88xpacQlv5EiPqOdHaNCBH1zgowkuqUdyYohjXd0JPpZbwIZyFj?=
 =?us-ascii?Q?G6XD531QlOlMkNi2w8VB2OHdVHGwxOUoEiYIudlWkvej4lCfnN+tGE3/+ht9?=
 =?us-ascii?Q?9fVN0/U65aLeq9yV02fvsepUAl1866KUhXvD9rsTGRBXklckApWyQG5NFWM9?=
 =?us-ascii?Q?6Hf1e1h8fTCQ7j3OxKzACwfS4T+pxTObyEw/esc3sDGPSOcocCuhWDrxxaCi?=
 =?us-ascii?Q?gPHC/geuYAlADQ6swD40ypFnfAobToFg53hfDvJwScZqukhlyebUB6UXLJGU?=
 =?us-ascii?Q?lGaO8cWCxi2XSHVGZvzgOHu+Wr8uCXuUSRvIuplikeQwd7W2a5G2wak+5b2U?=
 =?us-ascii?Q?70Kd+OkAtnPIlm2YDjIquFSChBYvFKEMqLaNBwaZMrl5SaixejATZad8iGIF?=
 =?us-ascii?Q?Y1uRZJD0WYflzunvYme4VnCaS2vBOlxBz7qpdK6c2+30ZyibtGvrFiBQ4b6x?=
 =?us-ascii?Q?Q0JIl7Svv0s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ThpUefHxzr5iK06p652VHskfjDrr1SCSz2NlPgffYpqUfcfeWdPQuYuEKJ51?=
 =?us-ascii?Q?LaNFHlFX2pPb58XB/ru7ttkxkixjuI6VgrC0uf9Xt4kbxKpMhMlLEQIRi5Ma?=
 =?us-ascii?Q?m8gs3dek7eeH2WSObAIlrZrRDWX+tOD61flvv9kbaJnDe1X4Y7M/M7jALObf?=
 =?us-ascii?Q?XOYbKbLWdQqpxSI+K9aJJWbIZ3QvdFIQWYKXiiJW7Q4XkkBjWGIWQbhE1Y2y?=
 =?us-ascii?Q?BzRjrYb7YKZ/lT5VeimYeD6wk+dICEImwkjsUC9Ghqb0NwlwG+hmcZCiHgFx?=
 =?us-ascii?Q?66lYwvNSkd1/E5Gea2VBOsqvcQh7vnyqsQvqZR0i+LYLMV6pu3vSsIWNFNa9?=
 =?us-ascii?Q?4yYKpAeFrjzXabznIzdqUEw81tGr65jUv6XQ+tU0V0N7/JDRHg3mhX1MxY46?=
 =?us-ascii?Q?HPVBJXkVNxD+qMGYuN8SU0dHkpmRcZrQ2FtSrVR9lcrX4s37DVPubbJk5BKA?=
 =?us-ascii?Q?w4AxIYKN5rUJuqMZobwxEPWIi37gN9EDWIKetrU8oRoUH9yZU7Zw5MpHHCF4?=
 =?us-ascii?Q?mw4WgqmAx5lR8BOncbvORByQ9Q7Re8M6nd2MzyxAbbv0b6KSMzxSS3I6LTV1?=
 =?us-ascii?Q?fmhv/di5Tf6QHnNtZkFP+jxhAnGnCuJo8dzMpqxuNvp0SfycTde2LkyYY8/L?=
 =?us-ascii?Q?Jgps74AithauCoCTSpmknseJuX326JoJ3oUkKPpR151HSD6Q7ZnCZhQ3rdjH?=
 =?us-ascii?Q?8pH3AFKHazcEx9/62NMLvfFvQDWBzzQ2nS7s7y0TUF8c9M5CbqWof/bKjfFA?=
 =?us-ascii?Q?qR/nJrQQQyYi1abexR8X2ylOc3EJYMLzeFvkOPIjKTIbqV18QtUb7XfpI+YQ?=
 =?us-ascii?Q?P2LlNHNeQiRwfBtf+TgSo0Ojb1AbHr3478Bqq0RE9dYsLBcKCn14MzaBHojN?=
 =?us-ascii?Q?K2OYT6bZ3Lyojf/F0hZ6kShBxRbgFlQhupCDjW53iO/u6jJAnFpSwt6MzZXb?=
 =?us-ascii?Q?6sb+4qavuzQMDJ9k9DXsULdnWdSf1rOo7rYp5GWzfP6lOa29ybV1n26i/uNY?=
 =?us-ascii?Q?wkJUeTqZa6cK8JYmzPrhBkCQ74Ct0u9evk7ovssuQi3o2oGi5fsbJXPFarEz?=
 =?us-ascii?Q?RKSXOnEPHC7cl+TH0uiqanJsL5NW8PyR3NA1vFaIGdjOR5FJ1BeUJnFtu90X?=
 =?us-ascii?Q?Gn2aB6/J3fKDQmEIwB+0knXgGf3SkwpoiGNxLfJXzJCgEboIAPmKiiugRF9L?=
 =?us-ascii?Q?qbwOGO38xf+N5/kp81HIdw4sK7LbqOFsJglITByHGr6QPnB5V/5/SHnzQLS5?=
 =?us-ascii?Q?Bu+Afkq/gOH5Q6DCNzEGdMdRFac1dZ7/j0LSuN0crNftMEal/gTLrOJkHDek?=
 =?us-ascii?Q?ury5h0Ur3sV4ZCsR2qVpGfh/ueJcyk3OPE11xHrLAK4sZESZnlWCznC2Uk7N?=
 =?us-ascii?Q?e1vv3fR/0yPOnlOu+9IYEjyrtjbWCkzN8OPFJbAXrz4PZBNW8ba0CQ06I4aa?=
 =?us-ascii?Q?PVZcrhVhaOUmw9pB68p/lTcPOnRLbkdkq6sCEa2uABS3yipo8tvVRsKsBMzL?=
 =?us-ascii?Q?3mNKQXUsR9Tc8QQL+zCFcSujYCSWmqyv8SL21g7bRhDIspnFS8PlOpLzC8hl?=
 =?us-ascii?Q?M3JW2DAzDR1uMAj2H5Iha05DLuyowSxrKtkJNFdCAvonyuMZM5pd9QFufoOu?=
 =?us-ascii?Q?3DnQtWTjhUXC3pZqKiq7gySmmzBle5vGFFNvZfdxbGkS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d01bc67-03f7-4e0b-e747-08ddf6f81375
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 21:12:29.6792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jc3Yj7IetL0MZDK0vhHbqZDh/cDYgXX024qd+sk32EvYTsH2HNV++TL84aEeMGZwANy9jcIg0ulJEjY9nKtXiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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

Cc: dri-devel@lists.freedesktop.org
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 4 ++++
 include/drm/display/drm_dp_helper.h     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 4aaeae4fa03c3..80dfa32e88992 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2543,6 +2543,10 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Synaptics PANAMERA branch devices having a pixel clock dependent DSC compressed bpp limit. */
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x22), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x31), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x33), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
 };
 
 #undef OUI
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 87caa4f1fdb86..30297aadd5ff9 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -820,6 +820,10 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+	/**
+	 * @DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT
+	 */
+	DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT,
 };
 
 /**
-- 
2.49.1

