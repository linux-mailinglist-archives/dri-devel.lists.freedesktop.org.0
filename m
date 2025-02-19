Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFCA3AFE6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 04:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154B210E1BD;
	Wed, 19 Feb 2025 03:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dbk4aMsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A1110E011;
 Wed, 19 Feb 2025 03:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739934308; x=1771470308;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aXfmSm8Y9t9n1haMiVVA5q2JTgiV5sQPrdHaROIZ7o4=;
 b=Dbk4aMsCXytfC0cBzNDkYJhX87C2iXBtR1smurOYIC8Ss5oMA0vu8Sir
 jzux03MGTnSeC0e0MiiMcyeGf5NyyxZN/Z6BT3VGfGuv788QXPcOtDpkz
 yQOYLYVsRiAE3q0w2s3YqS0Skn7C1JLnHkMw6ddR5PTvsOis//wploHrW
 r/kK2y+c7xsJBRNR1yeWFdkLxJmSV0Si23pn+oNRB5Vcg/BD3LfpMautV
 plFvI03s1a+1p/wTUs0fop6pAkfHms/JqM4HCh/HGaFy/8czhxs0tByD0
 xjhXGt/J6F36GKNu+rbTfkkuinvAZsxqbC8NfFpSEy2ZnaKa8ywoQMB8o g==;
X-CSE-ConnectionGUID: 6K8KIA7VSD6s9KIK1GZ+MQ==
X-CSE-MsgGUID: M/kukqXJTOuXvBDS3VMBIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="66012837"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="66012837"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:05:06 -0800
X-CSE-ConnectionGUID: ShIYFunpSqSNEGwGywQfkA==
X-CSE-MsgGUID: m4RwvyzpTkiELEvO/bKaQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114323325"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 19:05:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 19:05:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 19:05:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 19:05:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U68IrRsUrcpxxwG1wz870067QxHIJB2MidLggI5ZR20IJBLPXAK0Ty3AxOK6W70IITGlJ2NfisAhmTzsxwg4FMyD00oHMlwKbi8F+ZB5N9MTj/Yj8kP6PpHLKx+T1KNFLWAtrV/qfETjBmVu1WCDBj2ERb7UobvFeqKSEw567ow7BE4fatapxwQN3VmuwxeEKoIV+r2/AO6yzyPhSt6AQrHvv1efDwycD9xpnGukSuFgnPorVSI0TqhOL/jRBtEui0UQQ5IfStMxlhmsA6DkpA8PmJede9GUt4IRcEKbyaOVaePogMznQV0MZTPBgkDwznjwzByye4oPNIuEPFahkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO8bflvgy/DAhML4x+pAUKgOPfFyr4GC4nOkkRh3+uo=;
 b=gX6GAKwj+Fx8FBokdyAI7H82gZqWoYCJyXFKG8OQGS4OHNJkYC3mob+EVZfCSlrqx39RCeYheoLO3r5nfAOppvBFTg7rrq5Ulw5SO/mBC0LD26XNo2LhZEqAXEu9gaX0dlmEvgjvvoeoBBrKSj2Dy1G6SHVHNpselGR2Wh7Z3r8nbaZ9CiSbABktPB/kawy4FeuZjWjQzVt4kadevd7SXPXxJQHDxtMM8xO+PCRMDve6HtsLaDFQ8UbnSrarwuqa2MqmfMbH6cfCz2NtYtKdAXlXwp7JfVg7HrmnrrlbiCoUBrQ7LNgZyo39O5AqxkueU45pNxxMcjtOp69daNGJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Wed, 19 Feb
 2025 03:04:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 03:04:35 +0000
Date: Tue, 18 Feb 2025 19:05:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
Message-ID: <Z7VKgVlwmVOz4wKP@lstrano-desk.jf.intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-28-matthew.brost@intel.com>
 <ee155ea0-e7ef-4a5e-b409-d08b62762e5c@intel.com>
 <Z7UBiYFn3oq9dhXN@lstrano-desk.jf.intel.com>
 <91cb5b9b-84cc-4651-8d28-973650eb7c69@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <91cb5b9b-84cc-4651-8d28-973650eb7c69@intel.com>
X-ClientProxiedBy: MW4PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:303:dc::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 88060379-25da-4692-bd09-08dd509223fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fJGDRdIzzciqZphx7Nk6/zakc6vdb2UVP73egEl+oX/ZWCK4ET562fteTXHH?=
 =?us-ascii?Q?QOY7P6w/lXySxaIbLgD9mVTdXsGQqoPoDWwrHnmazLQTdOSqklZ8JFyH83Hw?=
 =?us-ascii?Q?YkjIgRyKvrW84U9UAl8HNfpv9IFat7uQn40v8XNLVNwkC2j8jgJ2fTiHA8xU?=
 =?us-ascii?Q?YzsChkB6QwQEM8jpar9gp0it2OkBswdBbXKlZddqR9ObpeOzYTGuEZXwa0Rn?=
 =?us-ascii?Q?99RqQBRLXM0dD+O9kL7LMEb1IfM13inoPKoipfaEfe4zssStmT6HjNGmvOoU?=
 =?us-ascii?Q?e/JTyCG8YnJ/crB74z3fwK6ivzqjcq+tYYB86JwftulEFeXFfz/x2exfFv9G?=
 =?us-ascii?Q?R/UiQQS7iHdjev2tlXGd5J9gUIIwi83I5GhsR7WtzOU6n3HHuxuEKdRArOpi?=
 =?us-ascii?Q?2bOlxzqBClVppJ3Z7M/jgxsQyVEq0VkD0AFjf3cQZyHCF/9K8quRK7UP5T7S?=
 =?us-ascii?Q?L+02IIOhgsKpbe5eSj58PALHmI2i6Qv7OjLovVuLKv0A2vlmN3+lqYTKrCHG?=
 =?us-ascii?Q?BTMB5liI6Wb54wm1fHFNQSpLzDGB8AjbfPW9s4AqmKJAbxNDlK6/5xhVb1zF?=
 =?us-ascii?Q?vDYy3CocSDLVAw2EMPOvO9K5GC56V8r816q3bLp0juzc3IuTo2P2Ek2j8dOz?=
 =?us-ascii?Q?xcblyLju8BSZg037ZJmwCsr6APfSbgVtcjjC3jI63oLDMWRht10RSsncAKue?=
 =?us-ascii?Q?JugbShRvByYiFkXUeM/6mpKzyAVuFLnuPNeppijtGuL8/Fcg2yIq3ivhzcNG?=
 =?us-ascii?Q?5QXmcI7TWNOzbELWf3D48m37DeCisZscKi4sA+kJXa5dl5Sc9r/JaTB/JuZ6?=
 =?us-ascii?Q?nKe/YQCka2/xMQ0FT+I5zMSCINTlD22iw0ZVvOrflRHt1dOjzi1CahAyKA5a?=
 =?us-ascii?Q?mP/iD1YOcV7ffp9htEz0Nts5430+KYZg0vERR60NCqvDeaxKZM8lr6Ejj4fR?=
 =?us-ascii?Q?EYlyFSghrhizKi6+oBQdvrBLPMrzWY0H8PPoTx1fkK5lYSNCSdPJw4sFYNwM?=
 =?us-ascii?Q?zurKvy+5jsl2ecC8SkidRmdoE5+l7+ai0gv0wfizWB0aIihx8ZeLsdjv/jfx?=
 =?us-ascii?Q?iQfHduVz/Ffyas+UfRvttAWaOBTHyGKkt4urzktAQk6TXhM9FsjBodnQa8OA?=
 =?us-ascii?Q?644zEEr2+uODN8d+htnN2z88EpbKyAo4J5mEdt2srGYf3Go6EEjXCODkBL8f?=
 =?us-ascii?Q?2ATfoa6U+zDzi7Bkdewg4y5poP/xecweb0ii2MLLSY7o2x9rzxznVqlw/+uJ?=
 =?us-ascii?Q?l+TpIl0HnitLGKvcf/w4a9p/S2QhFDb/zt1VpZMj2gjTuZtED8/9kDhzVYTx?=
 =?us-ascii?Q?fYTgJbEGVQSnmYWM0nSjaM7U30llKsTTnhmt1Hjp0oTTJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qcTptEAGrjzj4PMSgI1wSUrsPJFDd2hHqkwneBTlcvAGHjLc1rnSJKjCITs?=
 =?us-ascii?Q?YrEhJ3lFllWIeZDzUro3iDp6lRG/seRmmv0bWFAebNxjw2zP3FZM/gDdcDfS?=
 =?us-ascii?Q?0vbn0Y9lRXFkuLJOEHATmU9cpANT9AOvn+SZXgp/x6qiYsmr217JjULJhiLE?=
 =?us-ascii?Q?vKXNOetj3Es2VfjmNnyrE4Ca82YgOoThNYEn/IZS/dSScM8adTKhrYZLj8bk?=
 =?us-ascii?Q?zk2FcIcH0gq2uovq1A8AmcXhV9Tp5nDAgmu5yKVXRAhab2DEaZRDfix2j0ca?=
 =?us-ascii?Q?mWZA/yjZS9s31EQHHaNkrRgU2/RRTSdq1726x9kaAPYs1yejpr35DZ9JVoW0?=
 =?us-ascii?Q?61qbM9T1bNeYRbTwTc0jQayyUH/ap0EP6vTAtIJRogeFDnbEjRlnvE0nttSt?=
 =?us-ascii?Q?5s6XhWMSLtb7HDIpxRoGnsqw6OcMePmLieqvd9fHp8SGe15sh1cKbo6gaHar?=
 =?us-ascii?Q?yF6FiB9V9B0M4zopYP5sgKCypFGlXpeLJugI5Dw7SJBv2C4GBDDDU/Fu1mTL?=
 =?us-ascii?Q?3fn0ZVUdTP7YBDbOww0k0TaJzY2UsCRmUwOQtXsHlPlbrDH/iHnM5GiTVglo?=
 =?us-ascii?Q?COMPLqy10AgSU+27QLKLBLfomIWvuZ90axIpsaiF4vpFK+6BELdkR3hnVnyO?=
 =?us-ascii?Q?PMHVQm1yKItvnYJVh8LsLtx/0IKo6r662Gh51+vcdytnPWXGRlPanv7JQZzT?=
 =?us-ascii?Q?E/UsJa93Fd1P3xF4lu4/CTLfTRZOd21XQ8QCT2v2XE4lUBni2Bw3ibjZNQkI?=
 =?us-ascii?Q?WaLmbJ15tRkCiSr94lbDHznh4YA4vGj2pUBt1jvRwYuWhHz4hzNf3ilQFHSf?=
 =?us-ascii?Q?xtzR/hTBRIFY43Dzc2fK4beFW4qOCYsUX/7rTH3181pvxGsZc0OpPmxekDOM?=
 =?us-ascii?Q?ExXL+F5AZydyQPfUrsTcTTUh4pTFpjVOcd8UZB/ogXkPFhmhus5KMkqSuEO9?=
 =?us-ascii?Q?f53kexMcgEUEzSQ8D2GE+WEA0u3n/9Gm2OYnxrhPWHSrMT8WLUPB+27CYJWA?=
 =?us-ascii?Q?nU/eYRiQB2cmf3Vz3AINrU7SQ9kEcP+UGZesO3goSSAWFyxKZC8loe5AJBIH?=
 =?us-ascii?Q?mZRRy7rASiqnY0qRMha4R6KvNAxg0wqJ4a/IIlojohYHB5kYuPi2zqdjikCe?=
 =?us-ascii?Q?1t5oQuApIaY7vCHDi+d6aXbClY/h9xQqgXUhRYfdu0piAq/HWmAZdcwes0nS?=
 =?us-ascii?Q?UY5w0Fh7F6cKhP35DN7R38uaMmr+BzRabVQmFHCHOy3FzKhlDx0ftWOdEEfp?=
 =?us-ascii?Q?yZAoLXqt8DbPmssHopwA/y4b/H2uwiFCD1pmgIMVltJpfBdhlLVHZ9BrPROS?=
 =?us-ascii?Q?zgYPNGQygTVz63oZp7l9D1AvKK8fzsmGrEjkI+df8oCdMsy43WyqIRWh8XGy?=
 =?us-ascii?Q?GPyQcC9xQxMcxHLa0KpIkKWjdzcohwFxJGShUK4NXInwws3Ys9hdf/gI6qv0?=
 =?us-ascii?Q?X4CNWfm8W08Pf4nSBn7MpqbTZMIosIhrgyVurilcbXaPiuVMcqaqjcRTC99k?=
 =?us-ascii?Q?oWxiS6rbfgVRfnmyNChJHzFVsRwNNKTq0CF3GV9exjx0n/kJ5zEYAABpVxm3?=
 =?us-ascii?Q?Dzgq2i0dV37d5cKrPth9xnDI/oyUZKhwVAVijQFn6tq2/zr0kjuyO7PC6QNe?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88060379-25da-4692-bd09-08dd509223fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:04:35.7763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARFGCZh45M4MYLaalVvb5fdA+IVEjbqJO+e6ODXX0Ej4oKbgA49bBTKtmWANkuo/FNAx5YcTtKNTyenSHNftYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
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

On Wed, Feb 19, 2025 at 08:29:53AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 19-02-2025 03:24, Matthew Brost wrote:
> > On Thu, Feb 13, 2025 at 11:58:27PM +0530, Ghimiray, Himal Prasad wrote:
> > > 
> > > 
> > > On 13-02-2025 07:41, Matthew Brost wrote:
> > > > Migration is implemented with range granularity, with VRAM backing being
> > > > a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
> > > > TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
> > > > SVM range is migrated to SRAM, the TTM BO is destroyed).
> > > > 
> > > > The design choice for using TTM BO for VRAM backing store, as opposed to
> > > > direct buddy allocation, is as follows:
> > > > 
> > > > - DRM buddy allocations are not at page granularity, offering no
> > > >     advantage over a BO.
> > > > - Unified eviction is required (SVM VRAM and TTM BOs need to be able to
> > > >     evict each other).
> > > > - For exhaustive eviction [1], SVM VRAM allocations will almost certainly
> > > >     require a dma-resv.
> > > > - Likely allocation size is 2M which makes of size of BO (872)
> > > >     acceptable per allocation (872 / 2M == .0004158).
> > > > 
> > > > With this, using TTM BO for VRAM backing store seems to be an obvious
> > > > choice as it allows leveraging of the TTM eviction code.
> > > > 
> > > > Current migration policy is migrate any SVM range greater than or equal
> > > > to 64k once.
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/133643/
> > > > 
> > > > v2:
> > > >    - Rebase on latest GPU SVM
> > > >    - Retry page fault on get pages returning mixed allocation
> > > >    - Use drm_gpusvm_devmem
> > > > v3:
> > > >    - Use new BO flags
> > > >    - New range structure (Thomas)
> > > >    - Hide migration behind Kconfig
> > > >    - Kernel doc (Thomas)
> > > >    - Use check_pages_threshold
> > > > v4:
> > > >    - Don't evict partial unmaps in garbage collector (Thomas)
> > > >    - Use %pe to print errors (Thomas)
> > > >    - Use %p to print pointers (Thomas)
> > > > v5:
> > > >    - Use range size helper (Thomas)
> > > >    - Make BO external (Thomas)
> > > >    - Set tile to NULL for BO creation (Thomas)
> > > >    - Drop BO mirror flag (Thomas)
> > > >    - Hold BO dma-resv lock across migration (Auld, Thomas)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_svm.c | 111 ++++++++++++++++++++++++++++++++++--
> > > >    drivers/gpu/drm/xe/xe_svm.h |   5 ++
> > > >    2 files changed, 112 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 0a78a838508c..2e1e0f31c1a8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
> > > >    	return drm_gpusvm_range_end(&range->base);
> > > >    }
> > > > +static unsigned long xe_svm_range_size(struct xe_svm_range *range)
> > > > +{
> > > > +	return drm_gpusvm_range_size(&range->base);
> > > > +}
> > > > +
> > > >    static void *xe_svm_devm_owner(struct xe_device *xe)
> > > >    {
> > > >    	return xe;
> > > > @@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
> > > >    	return 0;
> > > >    }
> > > > -__maybe_unused
> > > >    static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
> > > >    	.devmem_release = xe_svm_devmem_release,
> > > >    	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
> > > > @@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > > >    	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
> > > >    }
> > > > +static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > > > +{
> > > > +	return &tile->mem.vram;
> > > > +}
> > > > +
> > > > +static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > > > +				       struct xe_svm_range *range,
> > > > +				       const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > +	struct mm_struct *mm = vm->svm.gpusvm.mm;
> > > > +	struct xe_vram_region *vr = tile_to_vr(tile);
> > > > +	struct drm_buddy_block *block;
> > > > +	struct list_head *blocks;
> > > > +	struct xe_bo *bo;
> > > > +	ktime_t end = 0;
> > > > +	int err;
> > > > +
> > > > +	if (!mmget_not_zero(mm))
> > > > +		return ERR_PTR(-EFAULT);
> > > > +	mmap_read_lock(mm);
> > > > +
> > > > +retry:
> > > > +	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> > > > +				 xe_svm_range_size(range),
> > > > +				 ttm_bo_type_device,
> > > > +				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
> > > > +	if (IS_ERR(bo)) {
> > > > +		err = PTR_ERR(bo);
> > > > +		if (xe_vm_validate_should_retry(NULL, err, &end))
> > > > +			goto retry;
> > > > +		goto unlock;
> > > > +	}
> > > > +
> > > > +	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > > +			       vm->xe->drm.dev, mm,
> > > > +			       &gpusvm_devmem_ops,
> > > > +			       &tile->mem.vram.dpagemap,
> > > > +			       xe_svm_range_size(range));
> > > > +
> > > > +	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> > > > +	list_for_each_entry(block, blocks, link)
> > > > +		block->private = vr;
> > > > +
> > > > +	/*
> > > > +	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
> > > > +	 * creation ref can be dropped upon CPU fault or unmap.
> > > > +	 */
> > > > +	xe_bo_get(bo);
> > > > +
> > > > +	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
> > > > +					   &bo->devmem_allocation, ctx);
> > > > +	xe_bo_unlock(bo);
> > > > +	if (err) {
> > > > +		xe_bo_put(bo);	/* Local ref */
> > > > +		xe_bo_put(bo);	/* Creation ref */
> > > > +		bo = ERR_PTR(err);
> > > > +	}
> > > > +
> > > > +unlock:
> > > > +	mmap_read_unlock(mm);
> > > > +	mmput(mm);
> > > > +
> > > > +	return bo;
> > > > +}
> > > > +
> > > >    /**
> > > >     * xe_svm_handle_pagefault() - SVM handle page fault
> > > >     * @vm: The VM.
> > > > @@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > > >     * @fault_addr: The GPU fault address.
> > > >     * @atomic: The fault atomic access bit.
> > > >     *
> > > > - * Create GPU bindings for a SVM page fault.
> > > > + * Create GPU bindings for a SVM page fault. Optionally migrate to device
> > > > + * memory.
> > > >     *
> > > >     * Return: 0 on success, negative error code on error.
> > > >     */
> > > > @@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    			    struct xe_tile *tile, u64 fault_addr,
> > > >    			    bool atomic)
> > > >    {
> > > > -	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
> > > > +	struct drm_gpusvm_ctx ctx = {
> > > > +		.read_only = xe_vma_read_only(vma),
> > > > +		.devmem_possible = IS_DGFX(vm->xe) &&
> > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > > +		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > > > +	};
> > > >    	struct xe_svm_range *range;
> > > >    	struct drm_gpusvm_range *r;
> > > >    	struct drm_exec exec;
> > > >    	struct dma_fence *fence;
> > > > +	struct xe_bo *bo = NULL;
> > > >    	ktime_t end = 0;
> > > >    	int err;
> > > > @@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> > > >    retry:
> > > > +	xe_bo_put(bo);
> > > > +	bo = NULL;
> > > > +
> > > >    	/* Always process UNMAPs first so view SVM ranges is current */
> > > >    	err = xe_svm_garbage_collector(vm);
> > > >    	if (err)
> > > > @@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	if (xe_svm_range_is_valid(range, tile))
> > > >    		return 0;
> > > > +	/* XXX: Add migration policy, for now migrate range once */
> > > > +	if (!range->migrated && range->base.flags.migrate_devmem &&
> > > > +	    xe_svm_range_size(range) >= SZ_64K) {
> > > > +		range->migrated = true;
> > > 
> > > 
> > > shouldn't this be set to true, only once xe_svm_alloc_vram is successfull ?
> > > In case of bo alloc failure retry wont enter here.
> > > 
> > 
> > No. The point of this is try to migrate once to avoid a live lock case
> > of concurrent CPU and GPU access. Once we have migration policy, I'd
> > suspect memory marked as prefered VRAM only try once too. If memory is
> > marked as VRAM only we'd retry to a limit and if reached kill the app.
> > We can work of those details when that code lands. Until then, trying
> > once seems reasonable.
> 
> I understand what we are trying to achieve here, and it functions well.
> However, my only concern is member name "migrated" gives the impression that
> it will be set to true only if the range has been successfully migrated to
> VRAM.
> 

s/migrated/skip_migrate ?

> > 
> > Matt
> > 
> > > > +
> > > > +		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
> > > > +		if (IS_ERR(bo)) {
> > > > +			drm_info(&vm->xe->drm,
> > > > +				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
> > > > +				 vm->usm.asid, bo);
> 
> This log is also misleading, we dont retry vram allocation in case of first
> failure.
> 

How about...

"VRAM allocation failed, falling back to retrying fault,"

Matt

> > > > +			bo = NULL;
> > > > +			goto retry;
> > > > +		}
> > > > +	}
> > > > +
> > > >    	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> > > > -	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
> > > > +	/* Corner where CPU mappings have changed */
> > > > +	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > > > +		if (err == -EOPNOTSUPP)
> > > > +			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> > > > +		drm_info(&vm->xe->drm,
> > > > +			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
> > > > +			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > > >    		goto retry;
> > > > +	}
> > > >    	if (err)
> > > >    		goto err_out;
> > > > @@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> > > >    	dma_fence_put(fence);
> > > >    err_out:
> > > > +	xe_bo_put(bo);
> > > >    	return err;
> > > >    }
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 0fa525d34987..984a61651d9e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -35,6 +35,11 @@ struct xe_svm_range {
> > > >    	 * range. Protected by GPU SVM notifier lock.
> > > >    	 */
> > > >    	u8 tile_invalidated;
> > > > +	/**
> > > > +	 * @migrated: Range has been migrated to device memory, protected by
> > > > +	 * GPU fault handler locking.
> 
> The range is not necessarily migrated to device memory if migrated is true.
> 
> > > > +	 */
> > > > +	u8 migrated	:1;
> > > >    };
> > > >    int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
> > > 
> 
