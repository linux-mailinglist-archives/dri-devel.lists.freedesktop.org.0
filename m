Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D8A275A9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D94810E693;
	Tue,  4 Feb 2025 15:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6fkzKTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D101E10E693;
 Tue,  4 Feb 2025 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738682449; x=1770218449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=znOgqccrWbDQyXUsvs/musErc7x+1+RT62+Braol0+Q=;
 b=F6fkzKTpfWo1SABAqaemYcsWEq8i0rhl/cH1J6wpVtDwtBiPq3CzO3f+
 Qpo2RF5q27m5LpOV0cDtO2o7E0vZzDuvNj7NDtIvOWinc6H5HveUX1b75
 M++l63ahzOZrgeCyq241Dhd7GsyQpkLIzPUXkD2RJ05wNhVXOL+EqX5a6
 nYduDH2roAVyquOfgFOt/BR7tDG96gsaPjWWIrM0+gM+5t5cy6KiIwsK+
 mbyEndNRoveAhgcNOUEpavQxmauVTgjxFiaWNSJJlhC48l4LsAFRmDJy7
 nsDVv1fNZ/+qRe0+mvrO+Eaw7VljCEXfOh8AUiEg52s5w//oDrz3OSinj Q==;
X-CSE-ConnectionGUID: od3ZANuDQEqrf9O3Drub+A==
X-CSE-MsgGUID: FTzOqsimQuOSqLRxgAooRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42051847"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="42051847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:20:48 -0800
X-CSE-ConnectionGUID: 3mHBQ5pGQKOL80JY9DhCSA==
X-CSE-MsgGUID: pEVvRh+BSQqOTGnQKE4+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111070708"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 07:20:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 07:20:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 07:20:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 07:20:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKpoMlGV2tRzEJGtKqYFvWz4Dk7RQzxtbgdt9IRu4hR1bteSWhtzoitT2qSk+PudGnUnnw6aTj/1HGA0hjhhA7sV/UcERmfdgFhWocql1oYtYgFJ4p58VqPjXdyCzctuWQmbrtye19XEiFaIADQEu4HADXONE527JmAKNZTU2D3qsR71hMUCqHTEy8GAuH9tnCSFU1AWL6AoFGvxMDJLG4K1N0xxR8c6fCuSxQzpQPcaP/IIFzvpeKNbflbE2Ax8I6MZsuG2aRSlG1q2UZI8gTwR5M28CtJG1QKsO+U/KC4EYVtj3I3fJJKGzQ7xUPW6+fu6ds3viEktT9JbHcHKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+OJFxUyq46KRjwe2AmPvo2j0CVh10OMyl073X3QJGQ=;
 b=SluPI/SJIGEFWeH5/HaAldfL7dFGFTys/p75weOpRVxJUSR9lFnHkgTsqBuliUmh8PCKSwMPFC1gwqNb02ONMef39pnXQdKxNsIivvJ73nwsRsG5elwJzXS3hVT4z6vCrs9cmHS8t48o7L1jFIK9zOWoai03VTFqkLeQPGKVu2VR8+xP3AKHT+3qc5jDGqv5A5NHBKSZihLP2V5YisQpGf+OgN/LHNX6Z1wsVSLsyoadnkmzXHuRpG0rUt4ICJdWRjV3PimCdEh2oOCpLj9tG6bNdfVCcLRkSrL05qJHpS3lSIsmOBXOelej6u29MpSA20Xa6kL3dr6UhVNOlqJn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 15:20:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:20:28 +0000
Date: Tue, 4 Feb 2025 09:20:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon
 <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>
Subject: Re: [PATCH-resent-to-correct-ml 2/8] drm/xe/gt: Unify
 xe_hw_fence_irq_finish() calls.
Message-ID: <qvwe46oojvk2njtotvsvvs6a4nbluic566mn7hykqc6uu2pdll@rrkvzms6jti3>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <20250204132238.162608-3-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250204132238.162608-3-dev@lankhorst.se>
X-ClientProxiedBy: MW2PR16CA0038.namprd16.prod.outlook.com
 (2603:10b6:907:1::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 53883f73-bf0c-42aa-f403-08dd452f7499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mi/ZAabExzYHrpkBSGm75cQespYV+A2NOPFDru9o2F08Axf0vAmZkrAmzZPK?=
 =?us-ascii?Q?pG3JNf+eFm8+6rUdg8phJJYbfulxKXo/ywPGU4sNQn6ip8O5QgtqZAqB6RYn?=
 =?us-ascii?Q?drAr++bNxx3G9pQlCV+rcU4ro4lg15rdYpzXDvg90cRIBuYaRRo3Upev9IXB?=
 =?us-ascii?Q?2wDi6kqN96fYCTHFeSqNJ+pZeMK/I2rF24kEQYE733jqQreVMy2m+TGB6xty?=
 =?us-ascii?Q?lfqpsU1sogLW7IxmoDPGwkuAOHAu5+Ga7yn0yw5f8X4+TnQin1cxlF8eHT6f?=
 =?us-ascii?Q?07TTp4i26oK79nU9mY11NFezGjSz4TxQuojEO7wxvaPvKZHdTglaMkjy9MtV?=
 =?us-ascii?Q?wUfKkAvbkrTPG8yiwQRNhI6Oa9T98Gjwd6NUD8JAtTIt5ptaQlHpJjVXt3qd?=
 =?us-ascii?Q?W6ePf6YDX7+taOfEm/9TJNQHA24C4XanduuYXPjb60v38V+UPFrINcjeOj75?=
 =?us-ascii?Q?GrM+ki8dHjmbyhpBaGAcjNeYEUc4pwxcIWExlQ5AMjfbCUTdKYKZ79TNcIxC?=
 =?us-ascii?Q?fJjW2J0tAmMCNweDrgdyAgIU6J3WIcfiQin1+Hdlv1sFQ0JNiCuSRH56OHC0?=
 =?us-ascii?Q?lU0SLO+1shfg5Czy/eIvC3VDE9mP+GJwKZQq/vB7lB9e85SrGX400HiFknOI?=
 =?us-ascii?Q?vcD6kEYN8CMJrQRShEgJI4LPyevkFZcv8yNt/K7PI4mqXJkbs80CNekT4pxh?=
 =?us-ascii?Q?J9FW+pq9lX1sYBck1xvbqzxqL+mPeA58GMLp4UxrCX1TLSeyF41hHl9F77kI?=
 =?us-ascii?Q?dkOsiqEVxNj6RJXU5AdzABmB2RC9Zwl/eVb6vyE34wKeyesVMqLXOTm2IUCz?=
 =?us-ascii?Q?Yg4+aTw2Uvu8bxWwEHGkQPXLcTRfbm0zjx2csRXdiy/fOP5J54qUF9/2cmNa?=
 =?us-ascii?Q?ugMFYwT1IKzNP5XfkOY/EZnppFvUC+Mmn8dnUlLtYBqhHZ7mcvvGGkoOP0nU?=
 =?us-ascii?Q?gKIrL7UT+hiPqX7Oiz9ZHMcwMCINuGpRLzZ7+6xQzPnSOi7UM+U3862e6MIB?=
 =?us-ascii?Q?/co2j2tFqxvUBzA7HKf/Ot1skJpdxsXU8YocfUkgJmT5bw8TXQfmd36OjLCC?=
 =?us-ascii?Q?zYF5vRrCc8x/DdihqfSJrR/RLCLcTDRJZpE5TFKXXc6ANjmejpxE9/A1Skn0?=
 =?us-ascii?Q?/qfBPfqr9oHucXAWFbIcLDzi1tB7HisqTLdtBmL0tnsoJerbS+XTsve8znYo?=
 =?us-ascii?Q?z2GKpAr6J4fFKMG0gGczymtOvgIbDaPJhVvkXrG+CvwiuykL4zXiqIw1tPYF?=
 =?us-ascii?Q?28TefRLB6qjUpgzw35bq1If2F+B1Q7xaAY1A99517tcUr/Z4/b+Pb+ShnPZU?=
 =?us-ascii?Q?n2Ku5iX1CrUGawjldJj73uyg2k5SgvLn6oQsewWwTNAhlng0Cu1CSO54aKlu?=
 =?us-ascii?Q?8KGeQekSHOcXKCzHt7R8GHLbXP/8E8S3trR5hdmCSaZDW4pcJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UkrT/lsUr8Np/316UOnJ6YW5N+t4+4V8tyeAEoaJkdcHL7yy1SiOxlt/gRa+?=
 =?us-ascii?Q?fn2rtWy6OpqlFAo4nZCxYPr3iw16wSjGgTGaAwiavXAQihkvg+T1qwXpoytL?=
 =?us-ascii?Q?IQfNsdjdwcAkM1v2LTjIlGdrP1qbUXwJS13vUURfdtMjXfBLEZy6sRt4x7+d?=
 =?us-ascii?Q?MkHhG973ZJm8xThll4BDRnlRwDDv0d0W0pXT1gLpl2m/AF7jhEP3q7zN7HVh?=
 =?us-ascii?Q?8Ilgh/j2OHV5EKXSZsWwIiN+iQofKQv7A+isljNWdxl1imyj51oRAhjJsSts?=
 =?us-ascii?Q?s0COLp2R7cOCKF3srIYLdmtugc9Q6xI8by5VmDocQeZ5tc7Tu6FMajNuhz+b?=
 =?us-ascii?Q?XFr3SbxWH2zVrX71KhsSeTcox04KgvyM0TO0Ax9b6GPaEJYtSd1tc2UZXedI?=
 =?us-ascii?Q?SIppS5/7jSTywBucyzbNRc+srF85FeANzwywz/R4v1ku9+zAak9LVuMubH5a?=
 =?us-ascii?Q?MDYo0UbMdbI1cpGCgfXm1bhyaIL7FDuxG+Skp1KqQNT2yCd6H+aoibhn5IXa?=
 =?us-ascii?Q?j1RFHGCeCqkwB25NO93TskuXhHNyVvBsEkN5tq7flEKsg2y50yqVvS7/1ZPm?=
 =?us-ascii?Q?4WuqsqjL6sYtohxzT4xpx1/PAB5gKaCUZJ8Y1gnrSi4b0wUG58zyR7dwTfne?=
 =?us-ascii?Q?GF7ouRpNlZmRwJysajNKvn2hLV557WS7AYFnQif2kHUyFtN3kSdGFRIglslX?=
 =?us-ascii?Q?8FWJINsdJIXm11XGkwZVhjAaUVu/DI4oCMuGBisU8RAu1qFB+mNF76fr94eW?=
 =?us-ascii?Q?tpCw7QGyOjtp8alhw6vhtVCR2AIZxCFx+IDkL66ITPsmYmSNsvvMEVhu4R1h?=
 =?us-ascii?Q?sNQP4yNjfterTf6542X2q99kjf8DDv656nQNfVAoa0mE5L++wDAS2B/TAmGa?=
 =?us-ascii?Q?mDiMx2TOPQZA1lE8ppwaLyRC2KD233xlgvOqoxPsM8pUNrnLML/p6jAWP2u2?=
 =?us-ascii?Q?SG3skhWYaKnih6sdZzbommqnRE9NxHE1AUPHPqAsKNFBmuVE9B5Uo/7qXop5?=
 =?us-ascii?Q?Ih2BdXc01LcEf5aLsJXneEraynaY1dcPJGDPDI/SGaQrLTYYzeHCMSNn6HZk?=
 =?us-ascii?Q?b2t2y+x2PPtKjpV8n8MZJnDse1M3F5poKZzwILMhfJ4uY5xYVYrkt5fuX2Sn?=
 =?us-ascii?Q?Bt2xutwSNKkIrW+GidFF77oeYZ2ol/XCSP5oYwC0doB0Oci6mVxcBouHlfyh?=
 =?us-ascii?Q?F7Dm6xiMbwtOFVeHrdwnEShJ7po8iiTNgp4HtZlgMZOB7swk//ceg4CY8Uid?=
 =?us-ascii?Q?gPtWCl0A5SJ92UHi24AjMKNiCmd6NYVcQbzd6aHRFPFjnEUvO0EX5JaHBkRv?=
 =?us-ascii?Q?XSW5nZV5SGrN9fXCSrvhLclLRbee/DSAzy4KBHQbmJw1HxSpGUaf2pzHoirb?=
 =?us-ascii?Q?YrU40+NsTplVoMdatkPIcPWXlZ8/+v9ZyAmG8ma7JzfjfhGVE15m1c0CnNSd?=
 =?us-ascii?Q?LuekA3CyBbfVKFBsM50WtgV6iWV2FGSxZmUz45Il84rcLDCwmBohqAbb+Y8g?=
 =?us-ascii?Q?dMmL3phd/mnav1vpAKre4A5ZJqLGk9iuZYKtZWq6uLs21bI/u41aMsPhCMME?=
 =?us-ascii?Q?bHpbAD7RmONzCDdSJAmy3fddp17py1Yq8qUKrljaYRhzBQoyqt+Ww/hH9T4Y?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53883f73-bf0c-42aa-f403-08dd452f7499
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:20:28.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5HGK9Ey3jfE4fVCSB/gtPmX0nxaT5553+sro/oCO4cEKbdHIKMq1VEo9tTDQyU9tLSO3LDPnTZObrdDGAGN63nG9zpmV7YfINPHi/uyd7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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

On Tue, Feb 04, 2025 at 02:22:31PM +0100, Maarten Lankhorst wrote:
>Those calls should be from xe_gt_init, not the diverse amount of places
>they are called.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/xe_gt.c | 31 ++++++++++++++-----------------
> 1 file changed, 14 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 01a4a852b8f43..943bab94119fa 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -408,13 +408,11 @@ static void dump_pat_on_error(struct xe_gt *gt)
> static int gt_fw_domain_init(struct xe_gt *gt)
> {
> 	unsigned int fw_ref;
>-	int err, i;
>+	int err;
>
> 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-	if (!fw_ref) {
>-		err = -ETIMEDOUT;
>-		goto err_hw_fence_irq;
>-	}
>+	if (!fw_ref)
>+		return -ETIMEDOUT;
>
> 	if (!xe_gt_is_media_type(gt)) {
> 		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>@@ -455,9 +453,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> err_force_wake:
> 	dump_pat_on_error(gt);
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-err_hw_fence_irq:
>-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>
> 	return err;
> }
>@@ -465,7 +460,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> static int all_fw_domain_init(struct xe_gt *gt)
> {
> 	unsigned int fw_ref;
>-	int err, i;
>+	int err;
>
> 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> 	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>@@ -543,8 +538,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
>
> err_force_wake:
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>
> 	return err;
> }

the two parts above should be fine and is similar to what I've sent on
my probe cleanup:

https://lore.kernel.org/intel-xe/20250131223140.4144292-7-lucas.demarchi@intel.com/


>@@ -596,35 +589,39 @@ int xe_gt_init(struct xe_gt *gt)
>
> 	err = xe_gt_pagefault_init(gt);
> 	if (err)
>-		return err;
>+		goto err;
>
> 	xe_mocs_init_early(gt);
>
> 	err = xe_gt_sysfs_init(gt);
> 	if (err)
>-		return err;
>+		goto err;
>
> 	err = gt_fw_domain_init(gt);
> 	if (err)
>-		return err;
>+		goto err;
>
> 	err = xe_gt_idle_init(&gt->gtidle);
> 	if (err)
>-		return err;
>+		goto err;
>
> 	err = xe_gt_freq_init(gt);
> 	if (err)
>-		return err;
>+		goto err;
>
> 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
>
> 	err = all_fw_domain_init(gt);
> 	if (err)
>-		return err;
>+		goto err;
>
> 	xe_gt_record_user_engines(gt);
>
> 	return 0;
>+err:
>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>+		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>+	return err;

this however is moving to the opposite direction from

https://lore.kernel.org/intel-xe/20250131223140.4144292-6-lucas.demarchi@intel.com/

Lucas De Marchi

> }
>
> /**
>-- 
>2.47.1
>
