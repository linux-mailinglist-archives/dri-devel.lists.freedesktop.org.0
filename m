Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDDC6B144
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 19:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A388810E507;
	Tue, 18 Nov 2025 18:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxrywJEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E848310E1CD;
 Tue, 18 Nov 2025 18:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763488933; x=1795024933;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zCk0QXv9zFntJ/liP+Hi3onkKv52rGZNmiMcqH2qwGc=;
 b=dxrywJEVOAKTkRVoS+tUTZMfg0C3POLdD1qptLc64rFvApa4P0b/2HiH
 yNEcNcaen1jtXjEhyUGz/8h+YeMbt9Kctf8JJE8YrwrJ+JbgAjFAQVsTT
 kjAK1HMCu7wF/N4X5JhcBoagSvAXgFMwOvq4hmMZs+U9wMlVoXdnfdG9/
 auDH+KuqtX5oCq6c9BJvaoK7Jjv6EGT7bAiZo/4ia8VnQls2LI21hHaA4
 bcxZmByBSd3YZnk1aFH3Gca8rzlaGlCbG9abjNKO4Q+dbHY37vEqMYrnj
 4vXkorVnrQktw0JcmdBx/oFt3yeWNSqbB/EdaE99huHoFh9713IBql+wv g==;
X-CSE-ConnectionGUID: O7b84kW5TuS6hNXBBxUMBg==
X-CSE-MsgGUID: Tn0o0SCwTQSL1UUScWg2yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76975734"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76975734"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:02:07 -0800
X-CSE-ConnectionGUID: wpfW7mvXQvK7DzsilHOvow==
X-CSE-MsgGUID: XSVhsZLlQGqgnav90P8Wvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190083112"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:02:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:02:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 10:02:06 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:02:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsPu5zQJSVwYEMejiJVL0MOu0Fm+dRZr5aDprepelHers/mZN/0UfHogWDYP1gpXfwelCK+af325tmPrG201JMN2skKxSpjapB7K6X72r+gSDxTUeW+R8kHn6Ukuq8ev6UhH8I8tBpU5FFWCZaUaMPWqDdu47CSHYNDL5loKSw9Vhh06Ic0jf80Zdoi5oUqOGGGEyuVKfnwPR/opiPb2qitrEFoiBLOkLo9I7Brm6Mbdb2cacBicQ/8oMpZOhsNuT9sh54oVvAz5uWCFBK1Nm4OkbhayQ2FpJGytAE612tw3hKdpSiMlX5zabplO+uFa4FddHWNav5Venb7enrqCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kE1ja3syEbpPkSTaSKKPKnOcHhjExRJGbfvH1qSouE=;
 b=lXanijWKH22+FvWaa6MI5AQvteusMcza7vZTfm3dumZ1jClSGkxFqXk+DbNhCqXi4ugWe8r01fep9/Vkiu+IcQHx+4ZQ3lMaMAYCU8yvvGZR3SQcwdg7/RZpgz+HMn/NtFFqhgUybG6JIslpuouYfU77OEE3y0EuedbuuiA0z5pS602HVDL2OJZlovQqys+5FW8aU8QwkEQm7nVvrS6GBrUd1kUPhyl0T8h4WCCTLY8ADrsX9Q3anCuR899HKT5bXOBdNu46YdcaDDUkTImGtbWrlHqgcT6wB7qgo851OmCbQJB+TBHqMZPcGTQ9Q9NyQpkPQlpOhslgC5poAhJBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8221.namprd11.prod.outlook.com (2603:10b6:208:451::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 18:02:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 18:02:03 +0000
Date: Tue, 18 Nov 2025 10:02:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 5/7] drm/xe: Do not deregister queues in TDR
Message-ID: <aRy0mFGX8sZ/CtDs@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-6-matthew.brost@intel.com>
 <aRwVMM_RKyx1CKEI@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRwVMM_RKyx1CKEI@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: c79c196b-a534-45f2-f63b-08de26cc93db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yrIRZ+/PztDcWFL6KMvgHpdixxIqeoruxJTyr8Oejd2Kd03bFzKpil0DoVtO?=
 =?us-ascii?Q?js9zBj6aBGTs8mBKhCEjV+q8vftOX4SCXrDjpaE0QkRHz3Oo3ZGUd23vV/YD?=
 =?us-ascii?Q?qca29CZ7C55+Kz5mc6br8vbotFC1iYlQ6MEOW5D1pQhsIPgujvcxQXYISLwO?=
 =?us-ascii?Q?NX+x6q/XOoXPVETCNe6y0CBCiOszuG08J9pDeAAzvoMtXy35Npx7eKy5iJBx?=
 =?us-ascii?Q?cRZ49KoS4nMHSk5tZKmd8LNxYCOjflLikfxPb51gpdcQkL80iM9jKZH/YY69?=
 =?us-ascii?Q?xILjXhl7fPy7CIO50RaYEMQvDjCe9VD+kLQzKNswQVVmIRjns/wmL4Pc7mMw?=
 =?us-ascii?Q?KJUGdO1Krs87JyltGkTBYAiV1Eh+DXAImMwxbtVfI63OSrT5D6VfMdvBwJXj?=
 =?us-ascii?Q?wW1BMETDPT4KZtYSDqQ1nAUZuThz8T8kEzsARKHt1X5zI4rUZsonJZnLTLWz?=
 =?us-ascii?Q?keeOQwanw2vBwhI0JaHucpoEKXL0mj5Oh/KeU/3SUxwQv701q5WJd61amUQh?=
 =?us-ascii?Q?i7JieUIYg39j/Mswv2U3e56IFmDLyw84FQ3larQtaaeS4xZ7g9JCtOfUpa+d?=
 =?us-ascii?Q?/GLBAwovn8/F0fu9XFHsbzKESFpU+m1TOCmjmcfahFUKqb11HAufzDXoWvxZ?=
 =?us-ascii?Q?dSFyitBoxbkcWrOmNJSZTp6pjfqJECINSjtwPcu070uDsE0TFamlfYX5010a?=
 =?us-ascii?Q?DOhY0QTTpDZxr9tZzE69ZyeebN5wYYmlrzKQLwIFa4SalELnwSXGzR4InxHC?=
 =?us-ascii?Q?aoWcbahd7+wUpUuk0vmnQ3sskdr7sfrp1CJmPNunIHjiVQ/cNm+Cs53p0YDC?=
 =?us-ascii?Q?oe1hIq7U7L8J5C4dS/jPCkhlUz3EljS8oz5qHb/M+ZONaeQhEboVkSAJYR+0?=
 =?us-ascii?Q?zCk+UeJvk08B2wbCWgdURFpexNMXPuXh5A/lZ8xzf66+8pBgFtDqnNawlNLP?=
 =?us-ascii?Q?scGfkBkne0wstSivsaom1/CAbCZYKgWKIBdp2y644UQaerpRQbc+bkWGFF5Q?=
 =?us-ascii?Q?eXh6jKDLsobjOEHI60U3J7K00mtJAZPjnHrYP+PCufnoULqr0UJJoKndPVhX?=
 =?us-ascii?Q?dteMJvPsmDU2NCTpnlVtcPyT0DT5RPXdqwb3IBkNtDYNtbZr4wwzLGn/D+VY?=
 =?us-ascii?Q?kMS1LPsZpaqJKedRYWohHvaZYgKxVEXRVdwnS2iGF1/F95ZTpoSVP6YhmhcM?=
 =?us-ascii?Q?EqSv5rB4hNGWe3EbkUwm8jWLCbQP/cA12DyVE5p6KPBs7ik1K/6uvHhSXwVg?=
 =?us-ascii?Q?4/BxrPsrl2Sv0wDL9jCPeh7jfVR2MnGvWVpL2dYFt+ElHo9CLpqOTyfWSY/6?=
 =?us-ascii?Q?3+y3By//PELn+85TSpCIMkzjCrHP5hxpdY/b8IDpZC0IgsixHHkyYFFU1CMa?=
 =?us-ascii?Q?6PKpFcMY3iQVwPgcfl/Qy8G43NCiw3lOuHyCgi1ke4evrjDc05rvpHEz0jNJ?=
 =?us-ascii?Q?rayYiYdwqRa+hG9MZlQ4Dsmc66NGLtai?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?39yyPxbuuKLhXq6BeSzu7yCbLs0PP+Od29tKalhmX/jbby9whkF7vTQOAn/W?=
 =?us-ascii?Q?49BeYi40h2Vb1+JEbr2/iDn1LJq975FsaIQ8fklwrOBaFhwIumhIgOXglBEg?=
 =?us-ascii?Q?JATG1OuaqJw2yYP0CZsE9SEFRDnIdBpKSTXurP8NkqcGj0rqYXGuAfwJdBQb?=
 =?us-ascii?Q?6AMyKMT8Ap6UcLm+nLkgxx0r7LE7OMvz6Li8GKkRA9l5DFy4L/Ww4bW42jIF?=
 =?us-ascii?Q?Z4JWtx/JWcz2pO18pYn+1PvNSY6DM+p6P07kYtGOQi76fq0hWSIrI/Z90yh2?=
 =?us-ascii?Q?rjfD2vommAJzF9EPov1wG304rVuvmVF+3Op0e/GerxX96I8qp5pFMqRGGTs+?=
 =?us-ascii?Q?3t9I4eV8m56E3AXuCBL9LEwMY9ljQUNycqUHzO/a2jYEQKDKl3KUK8CoCjcj?=
 =?us-ascii?Q?skyU4HP4o7r9ay9SZZ0HX5kDplPBl0bkIqr+oL2FdhHnJcZ/W/fWekaV21gW?=
 =?us-ascii?Q?FC6xNeDRnAzXF/kVfzf+GgQ8gHBCgqhzPsb0ZOBnYp9ualnIekK7BUmnsCMe?=
 =?us-ascii?Q?TH82FBosL8OxyIikthBxkD1bb9cJzPs2VAEoZ/Ywy/FIB/kttghWpnCdjhJv?=
 =?us-ascii?Q?PaiANg5FnCO4hryt55Gwf618F03fdX5xo7rIkanERvj0he7Pec9hI5ehk077?=
 =?us-ascii?Q?VNYG6yln3G0pCjPJ+fqfh4DE0JRN+9GERqj+aoHEFgBZcMQJJXkfXSRRcv8m?=
 =?us-ascii?Q?LfC2VTZt0Hh9pDX2sSzb08nzYzFKLgleFjPuJ5ZXROLw/LqiCbxiKL86ikFQ?=
 =?us-ascii?Q?K43zYakKUc8a+e7hbWRkpJBy9BrsaTVaygJMI9dFQrIR5y/ZNzzcpDriqwbH?=
 =?us-ascii?Q?qJY9KyL3KDfRSUXPAB2xxeq/pnEk3J3QSTlJOZq2KSmNdbvOm6FL2Ah+tVK1?=
 =?us-ascii?Q?xnc06U5RQPfL243bzqXS1nBvpHglNEB5ax4oGBuPBCK2V9XxYmv7ex3R5Nl9?=
 =?us-ascii?Q?YQ3kSf4NNcnDWXfVPmEtLceEq3uJovEypYyP1Rn3LdBbboA2lzVteeQa+Sph?=
 =?us-ascii?Q?ARCqKpQCZ/+TAEkSK+PRNo9Z5nswx1irKjzcTCEVW6G/AKutb0nr7JRXFTXl?=
 =?us-ascii?Q?NImss592bUeVSK78oe0j7axINEqkEGC6XBz1UO4Y+tdu50hDSEC2c1WZT0kH?=
 =?us-ascii?Q?vA3TfgTZ9YIi58Fr6leEILnFny4TAhRpDvh6fHda4favNDALYAzG6M4n1ZkB?=
 =?us-ascii?Q?8EMHK2Zl5XwZpfKCAG/8A304L7fWR6S+SSeFBsvKGoVxggFIbuCjLagv8ZIY?=
 =?us-ascii?Q?uZy8q3EBgedNuxIOAp+IeQHFtNZrSn7i9EV2PBZgeNsCocFO8h8nuSITcAix?=
 =?us-ascii?Q?Fmu7fwK69tJ8mCyQQsk0gGL1LSM/I207iGa4svaMxZEqTFE4F3sFeXQWrmci?=
 =?us-ascii?Q?DZpZ564LH1vAcLI0mdeTNuNkpHDOAMacAOcjc9HqZ1ldsljvwQT3KiMu4apV?=
 =?us-ascii?Q?FDQCTRZWA3JHorsHyuOG3BB4NNMQeyChds39yb8Y2mhLv5QSfkj8mYt+KxhE?=
 =?us-ascii?Q?/8i5T24uiF4U6IE0dQMElxhvKu+TdoHwdrfEXccMGPhpeFsGNFhj5NeublfX?=
 =?us-ascii?Q?hyvxpMjCarc0Rr1SkU1dJjYMQcMqZq/7RX0jNJEHZS0g2F0jREOvsMsrO0bP?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c79c196b-a534-45f2-f63b-08de26cc93db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 18:02:03.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeXkSnNcaqQiYjMS8OqbEwGFNHQwkVuF/VWqMqgxCv1cJpWfh+dZT7m5ih2yI8/xr285bNF7vEtVJVYxKBqF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8221
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

On Mon, Nov 17, 2025 at 10:41:52PM -0800, Niranjana Vishwanathapura wrote:
> On Thu, Oct 16, 2025 at 01:48:24PM -0700, Matthew Brost wrote:
> > Deregistering queues in the TDR introduces unnecessary complexity,
> > requiring reference counting tricks to function correctly. All that's
> > needed in the TDR is to kick the queue off the hardware, which is
> > achieved by disabling scheduling. Queue deregistration should be handled
> > in a single, well-defined point in the cleanup path, tied to the queue's
> > reference count.
> > 
> 
> Overall looks good to me.
> But it would help if the commit text describes why this extra reference
> taking was there before for lr jobs and why it is not needed now.
> 

This patch isn't related to LR jobs, the following patch is.

The deregistering queues in TDR was never required, and this patches
removes that flow.

Matt

> Niranjana
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_submit.c | 57 +++---------------------------
> > 1 file changed, 5 insertions(+), 52 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 680696efc434..ab0f1a2d4871 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -69,9 +69,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > -#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
> > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
> > +#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
> > 
> > static bool exec_queue_registered(struct xe_exec_queue *q)
> > {
> > @@ -218,21 +217,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > }
> > 
> > -static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > -{
> > -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > -}
> > -
> > -static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > -{
> > -	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > -}
> > -
> > -static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
> > -{
> > -	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > -}
> > -
> > static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> > {
> > 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> > @@ -1190,25 +1174,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > 		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > }
> > 
> > -static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > -{
> > -	u32 action[] = {
> > -		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > -		q->guc->id,
> > -	};
> > -
> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > -	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > -
> > -	set_exec_queue_destroyed(q);
> > -	trace_xe_exec_queue_deregister(q);
> > -
> > -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > -}
> > -
> > static enum drm_gpu_sched_stat
> > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > {
> > @@ -1326,8 +1291,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 			xe_devcoredump(q, job,
> > 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> > 				       q->guc->id, ret, xe_guc_read_stopped(guc));
> > -			set_exec_queue_extra_ref(q);
> > -			xe_exec_queue_get(q);	/* GT reset owns this */
> > 			set_exec_queue_banned(q);
> > 			xe_gt_reset_async(q->gt);
> > 			xe_sched_tdr_queue_imm(sched);
> > @@ -1380,13 +1343,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		}
> > 	}
> > 
> > -	/* Finish cleaning up exec queue via deregister */
> > 	set_exec_queue_banned(q);
> > -	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > -		set_exec_queue_extra_ref(q);
> > -		xe_exec_queue_get(q);
> > -		__deregister_exec_queue(guc, q);
> > -	}
> > 
> > 	/* Mark all outstanding jobs as bad, thus completing them */
> > 	xe_sched_job_set_error(job, err);
> > @@ -1928,7 +1885,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > 
> > 	/* Clean up lost G2H + reset engine state */
> > 	if (exec_queue_registered(q)) {
> > -		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > +		if (xe_exec_queue_is_lr(q))
> > 			xe_exec_queue_put(q);
> > 		else if (exec_queue_destroyed(q))
> > 			__guc_exec_queue_destroy(guc, q);
> > @@ -2062,11 +2019,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > 
> > 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> > 		clear_exec_queue_destroyed(q);
> > -		if (exec_queue_extra_ref(q))
> > -			xe_exec_queue_put(q);
> > -		else
> > -			q->guc->needs_cleanup = true;
> > -		clear_exec_queue_extra_ref(q);
> > +		q->guc->needs_cleanup = true;
> > 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
> > 			  q->guc->id);
> > 	}
> > @@ -2483,7 +2436,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> > 
> > 	clear_exec_queue_registered(q);
> > 
> > -	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> > +	if (xe_exec_queue_is_lr(q))
> > 		xe_exec_queue_put(q);
> > 	else
> > 		__guc_exec_queue_destroy(guc, q);
> > -- 
> > 2.34.1
> > 
