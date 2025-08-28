Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FF7B3A8A3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8894210EA66;
	Thu, 28 Aug 2025 17:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjFPmNKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3626A10E06A;
 Thu, 28 Aug 2025 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756403387; x=1787939387;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=HFhFtSDHQb2+JgMSF8ZG5PCEVHiFN5TfCyG0nCsfMPA=;
 b=cjFPmNKt/pgrX/0l1ruF6S33y5mxnlTmgphpbxG4MWO5rYWs5gkJ/bXC
 PZjAS3D4HbZZKtUDV3NtF2Mqi3DFRreDhWDPAiW9E25e1zq7XyGw/FFnK
 ofrcvKDtAuzcVlQBWFP4ehQLlDYTx75UgfiIBJ8Tzm642tsnXi7Or/FU8
 EtJxd9Mxlzjl3r61dvMEZ8FkCziPYUP6RAEhnKWFtuArWt2eckcf7YviT
 3l7GE9+GCo9jpR2LnDVHZlX0GZtCur3ufQHcZTV6g4sP/jiMVywUKIUIV
 p34RDtnErV4eqRQV0CD0aKE0HA1LtAMM3fVFZOEJh6j1G/9kYwRe5nnsi Q==;
X-CSE-ConnectionGUID: EVUXUzqDTmKsnWJyXsEyeg==
X-CSE-MsgGUID: o6Tr26c0TbKligZofNqi+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="68959830"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="68959830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:47 -0700
X-CSE-ConnectionGUID: EbKArQrfRVShZ7JEFb7CHA==
X-CSE-MsgGUID: CURLVU5OT/W8R4+El947NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169695963"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:49:45 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.53)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIsGTfyeUXEXnrRTpDbwUpMdejsb00C1tObn8BUur3WRC1hj3MYyavnhF4i1qgFozNYbNidGSvUxjyvq5IAVbYMgD/1Zz3f9/7tQwbdtJLoo1X84omrYvxMqBoxUVHtYgOuQ6dv89S3GcqzM2vjgmrSeyttTc99xq68iOIDNlw7Cdyf1pqjWdsYVa2s0KzgHar4HBBrrBJfZ2IiAVdXDVTax/Du7MDJPTVt0ms1nrQZWuH5UxsFl9cjYCBN/LARpNhAjP/i84jlgtXg4C9Mg7LumI78CCvIeythCXMUbamUhfkKbDdrZMm7Xkynnf7YHxtSHxd701Fa1yTEWG1sfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB2ED3VddFIkwaJKt7bZ+Jb3WGpWKfJ4W/bG1IotS0k=;
 b=D+ZruFfxM0nnCTxFf0f8yFaLS4+I5X2eapmhJjbddVgheZ2nUITB9XiFFG8+e0xHDZva7If/WMM2JbLFhwCE0JoPIibQ1McMKzVxlmKjNceIWj5tCKj4rcNTtCUfdlN4p7D9DxArfbIVETczRY1EWg5TM4Ms5gsSzERLV91cmGbiKgfrWiLHhg91UnXm69SFhPA1xmaTimFq76G3dt74aZaIlWzCbL8pG+1EbyN5pPhcxFJcPN15VEN91csd2fCEhuXiaSfqbqLg+pbykNR5vBhLVsUtZMfau2d1ottOJefB0YJ37qF9O7D4EyJX7TkfHPdwp1flquRwjccgFACSCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 17:49:39 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 17:49:39 +0000
From: Imre Deak <imre.deak@intel.com>
To: <stable@vger.kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.4.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
Date: Thu, 28 Aug 2025 20:49:26 +0300
Message-ID: <20250828174932.414566-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::12) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: e36fa39e-9850-4eaf-a27c-08dde65b4293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gyz7tv0/ybhjcwpW3w5BzrLLO42zUjLoNaufgRNRkJYWchEbrwMtuqQuSSJZ?=
 =?us-ascii?Q?BLhVXLXgTVGm/6uYXI+4IsVr3jYQXD4abpO9C6U17mu+5OTvsHjAQQbbG09t?=
 =?us-ascii?Q?LzELUnOW+a5reNOTd7WYdkyEfJPQwL8mqdAT4CzowdZcaphhIOwQxYW2QMMk?=
 =?us-ascii?Q?zyjC2mt6Plxjh0wvSKjBQEvMDguYZuPn9A8kXXI1PcXSotMJSZ3YDYXJwVg8?=
 =?us-ascii?Q?eFGrjdn93liR4lz/kvOughgdD/4aj7DwcpQA4VzC7CwfLrLtIkkyFNBKfNj5?=
 =?us-ascii?Q?yQwNomoEqQ/QmB+umvUplCSiCWv0Fka1P4D+HBp9ksLzn++dpeRylzwtTfI7?=
 =?us-ascii?Q?n+ycAfTw4N5wDH+IT7P6TAzeEN69AQJeOYROqfRdcQkwRwtIRObFujoc7PY8?=
 =?us-ascii?Q?tj8t2JZsY2XnvdWXo0dZ39uZKEY1FyrXvqDxxzdigqStevUavmFTRjgAfVr0?=
 =?us-ascii?Q?rzEbebOTyxlhkC9fYL+ClhpOxB+2M2m2OI/fj9l4pFTZyp0j/qU5ieuE9aT7?=
 =?us-ascii?Q?i6fyzNXrbOfR1Mh63PWKBfTOfexZI1RoaOv8E4FpKuAUUgXVkp7QNv9u5fo2?=
 =?us-ascii?Q?7QKNTuzbvMzMaBUmOW4FbPMzJ/AVPWUGVzYtH/WFCBhurJO4hZMeo4b1ViJ6?=
 =?us-ascii?Q?MyLTKkOG/lTzXGTtmmlv5FInOcwT2iHiVXhzz7v7hz9wD+qgtX8rssUIvPcq?=
 =?us-ascii?Q?TS3M76g7+KvHw145WnDTZzNMwD4z3Jdh88UQX71IehhBYSPqAEkyon3KdWfF?=
 =?us-ascii?Q?FFei/Q7sS3Tf2XOapYYjXfnkn7m1MziDWWRwlpEOWWPBNA/vf8FzvQRUdzOM?=
 =?us-ascii?Q?NdvD6ZP89sJPLiVjLAks0PjsLa7of7bu37e4NytOfefSZJ+w53bwKlrFtO4h?=
 =?us-ascii?Q?weeX4Fd9kGXwX90H6bkJN3exquVERxmHxoFRvF6ryTACx8/+jHAXl34Q4AA8?=
 =?us-ascii?Q?ZrtVN0DeIAuIRfx2Ir+NCHRSI/EwGUDZYPBjkPCJgcul9m7JYCywQwE0DWWg?=
 =?us-ascii?Q?GwjmREwzqcfxsXS5UWioiRAaT/Kcn3u7MW9LyDo/CmS/6ImSCFIAUppXxwum?=
 =?us-ascii?Q?EB+TR+A7vw70I1XlU/ipaBjWvqvN1qZLhZDFN+NWsHFbGmI/80wnGZvIx+Eh?=
 =?us-ascii?Q?TFS8LPVYwdVDESyRj95CgZ70FPtXMSkgrhDkqGaiD+wqNY5cA98G3/nTRjQj?=
 =?us-ascii?Q?b38oZU1/CqCbv7X+4YXg8qZTZxprsw6c8ah6G4DJ5rmEmRLWj/ypM7X2LcOd?=
 =?us-ascii?Q?LgXJ8t6PxMCmXD8OD+EGL49UVaH1oSoIv7gIRFubeu3D20H6BxsTEhk0yw5q?=
 =?us-ascii?Q?3HNIDXpbZw2SwM2pv276YP3OYAAkWR5x0UtMwJMuRH1BWQGR6iztvMLJ3jQh?=
 =?us-ascii?Q?5WoGxI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nU+B3sdgF4X5C/Nm/WwcBbyv02XjnCh/j8ufADqjDkPHkG4JfjS3gGyX0ush?=
 =?us-ascii?Q?TAppRY7+PjHPDp6ncCQak+ZlJ8/BJ0Cf+UxHAtDb5evEFJ4wznrmVTNhCkFZ?=
 =?us-ascii?Q?U4/n86PY3BDAUr6uWcR45XCXENzMOgYx4zg/8HuP8dRP1bw9nDIABL5dsZxV?=
 =?us-ascii?Q?c5RZ+ExGkroWbMHcyFPnmB9RIJrY9PLPidXgeqfIlyRiYwwauIuIDyHH/7xT?=
 =?us-ascii?Q?E7jRVkuwbENVbp/mQ8gy060Ki6pfNvEpjqIPBuuyup1Hr8nIgI4xeUFcZIJB?=
 =?us-ascii?Q?F6/JdTPSfto2ntC9pCZKF1w0DyfZDAimgo0FhWLgYvKjuqtc4+9wAO15Wwp8?=
 =?us-ascii?Q?XxILBlM7H7kUnbDNRgdvycL7OR165nrc+lrijb3eyFso4ww+Iy6NuCXmUtvb?=
 =?us-ascii?Q?x0OYMqxRmF6Nr9yhdsj9oG8HOcCHbMGj0+C+PRA0GozIXH1xCpsYsKCAUxUl?=
 =?us-ascii?Q?aTRrAuvDBxvuYx0PfzEp/JRfp45g6zhiCycIMcFdeUDG0TJyMwcO74e7goKj?=
 =?us-ascii?Q?QCkzq9KgCCDx3BJ4gIH3zgONExUrK3TEkSxbghQ9bPJOllsO3Azi9X1Iec+9?=
 =?us-ascii?Q?TbJ2Ca2WV9sNbHiNb0AhjJqbz/6M+W01s0AW4eDdbMeRtd3t3AuUAY4fex2T?=
 =?us-ascii?Q?k82Cp5nss9PJyi5IW/JgeYzAHyfajSw02vih8OGtn3nnFYMDs0zP+zna0EgD?=
 =?us-ascii?Q?mgF1KThlAFCqc66WD6+yxadLnlm0B2swVI1qCtJHhZoz2QhRxZnvuSqO/Sr/?=
 =?us-ascii?Q?ee/GUwxXWwcBPXeauuCJSoWiqeMqJ5Lh3YWgDxvezdVoJIzkVloGanutUYio?=
 =?us-ascii?Q?0XAHpSErn1t4Ek8VIDykNc/DBVAaAQC5Wn9T5c/lptQjskPU8tr6TSH2n1hc?=
 =?us-ascii?Q?pHjr5a3GU+wgoShjzmG4uMaKpwj2zbCPOcaYe7jY7SjE/JZT1QJgF2pir0vL?=
 =?us-ascii?Q?qcsI2em4Uc4pNstD+tpIYXpeQgyxjzAJoEbc7n5IahpdEXqyb784JnczO3FG?=
 =?us-ascii?Q?e4hYu6Dn+S/Onhb9rMFc1Hp29i41OfCO0l5GXRMWKQgcAkWSiglX4lx740a9?=
 =?us-ascii?Q?nlkmW4LfFqE9nl7Pgr25Yy1pkd/L9qAoJg813fs9zSiApPaAgo9uQU6MTubH?=
 =?us-ascii?Q?7C4r2gJsejaL5ViZMTlr3qnaZW/qNHl1T40gPx0zmk+CBNXR8MW1AUSGj5Up?=
 =?us-ascii?Q?b6RjUOShsIJo0P3XMmx7Gn9/gO6r5Ng6WlwE5nsXSql7eugAujL9aB6pR174?=
 =?us-ascii?Q?E79IH5xSF/oCCW5i97xrWy7UbFrmSHRroi9oEvcKZ+BntWAXemK9d8/zygQb?=
 =?us-ascii?Q?rPYZ020MsfCK1yzbvle60LXaskAfy+h3j1mxFfs8GnS1GaMUcsDlX0N3D1yB?=
 =?us-ascii?Q?RfOtANKhBZzwOxZjGa5jTzi6dbiVznFzD5PHp+2p/Bgrqy9EtMB/bKaoICgg?=
 =?us-ascii?Q?lpDEVxCOHA3A0/XY5KoWomNL9EgQtAvZHP1f0F2paRBb1CyhVyGQBxZ7UYYc?=
 =?us-ascii?Q?Oi/RnSJIi6uom57su80MDleJZPBs4Ua566bCYCZC9HiF+h9tR6HZjF1ByGdh?=
 =?us-ascii?Q?Hc3r0r2FVkLjjZQgFlrc+zSh4bFNdXTDEpH/bzwtpgSiC12CjnKtv4CWbSG/?=
 =?us-ascii?Q?PqTrBTtar72MbtHOwC06R6WyzU/Uv7tyJKcVm2fFO3o5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e36fa39e-9850-4eaf-a27c-08dde65b4293
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:49:39.2479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gj1D5epHQXbHS60lTZdyqW+hNwsRP6VSbzr6Zx+hnjz8iy1komxmyHvgsk0HIyPsQPdq7wYAqpbjVqQ8kO7zZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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

This reverts commit 2402adce8da4e7396b63b5ffa71e1fa16e5fe5c4.

The upstream commit a40c5d727b8111b5db424a1e43e14a1dcce1e77f ("drm/dp:
Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS") the
reverted commit backported causes a regression, on one eDP panel at
least resulting in display flickering, described in detail at the Link:
below. The issue fixed by the upstream commit will need a different
solution, revert the backport for now.

Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Sasha Levin <sashal@kernel.org>
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 4eabef5b86d0..ffc68d305afe 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -280,7 +280,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * We just have to do it before any DPCD access and hope that the
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
-	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_LANE0_1_STATUS, buffer,
+	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV, buffer,
 				 1);
 	if (ret != 1)
 		goto out;
-- 
2.49.1

