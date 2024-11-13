Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B67B9C6745
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 03:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACBE10E322;
	Wed, 13 Nov 2024 02:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaKuEe5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D97D10E322;
 Wed, 13 Nov 2024 02:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731464828; x=1763000828;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uDU77LL/ork7tYgH8BYtFc97UWlo2SgjMH2AWZTftEc=;
 b=kaKuEe5EKR8i9o0Fi+5jUoFaQ21GOwjg+qwwcxGJ4vBcRNUNym0X4r8I
 x1dzeq9bMjRYR4hvVTsayIqj7dV1IgweIw7VuYpA/GgZyXJpBCha6UwqL
 GbYuiP4RSMjWZNhbA9fc2OAVayEio8bAQRB4PH+xoIA7OIIdS1i4jp/mC
 atZ/Q4KmlsKCepWC9qo6bFNRb3vL9dQgITDKrEy6yTEBpxnVnsZBhiHnP
 DulFMwJmbwpLJjRah5LPyvMo21bvWicdESM8DghKrBaZeaUNyehaloIy7
 xso7vfIXPKfuuJQu7oAt+pUACWl9oTXOhP7EEvkbyjl96cIfC0aZ2ATb5 w==;
X-CSE-ConnectionGUID: 6dldPm9MSyu4vP9aQT8jTg==
X-CSE-MsgGUID: Xp3qCZgVSAuH43+YDI6F0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41959358"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="41959358"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 18:27:07 -0800
X-CSE-ConnectionGUID: koSe0+XDQ7aB8DbSTtI4nw==
X-CSE-MsgGUID: F71fMlVXTnigrLAFPT0RsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="87875266"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 18:27:08 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 18:27:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 18:27:06 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 18:27:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HT2IsmOyw5eo6uC7dmD5W1OCxdPS6W5trk62IYI0bm73NCLRRTzTdq/xkljeol4MQNhbuW9GbBc/SZ99fUdxYLKSN/GLp+1ii1Hvso7MHAeonhGXfZep1ZAAzMxbqD1+t5pYp2KkanbWsBEsDrkVGwHmvJ/evnGcpaap2xwqDwVZidJ8xk+vMrqJ0xDB7lJv/5EilAwwQCtrVWG6CAH6vZTfNte/BQ6qNVDUAlFF51x/Cafr/R5O996Lfuhu7jPkhvHA5s0hgWou9b8Bw+bEftz0dDHt2ul/Jpi7ujikC2V8vmamDh1q8oEE1nkrJ4+lq0+/YHIt3rjyOxZVnR8RYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ln0vBCfGjtkL1VwneSLIgkSUJ0xroPnaoTt3XdLof0U=;
 b=pyfvWLJV03Lwif0wZ0v/5fKfz+Cugv4ZsIF1Kb8xFRNLesfFfyF+v7Qw50Aymybx2yLHjTpjDluz9OYuA8DYKR60AfCPFGXzlWQLN/pl78OfFI+cho3NsUSFpREqd/byCCYa29JHDCdjQehofaVbTsLy5nksUQrJdv7h8yVFK0dc4bf8nJOjpbYSZjrx/PwWSlDRjiMw7RnT3QcL/5FOsO45Pc565crmpVWJO0MFxnXw3TUHm5daPahbAhN2Z81JlZ60tjZR3XyYv7Esz9wDKYeRMldRgMbYRxjn60G5qNgDlhdR+aQ6LawtI62qhxBg7JGfY19AlYIseyQw6h+GSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.28; Wed, 13 Nov 2024 02:26:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 02:26:59 +0000
Date: Tue, 12 Nov 2024 18:27:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <simona.vetter@ffwll.ch>, <thomas.hellstrom@linux.intel.com>,
 <pstanner@redhat.com>, <boris.brezillon@collabora.com>, <airlied@gmail.com>,
 <ltuikov89@gmail.com>, <dakr@kernel.org>, <mihail.atanassov@arm.com>,
 <steven.price@arm.com>, <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 0/6] Common preempt fences and semantics
Message-ID: <ZzQOkyyQeZ3SkcHd@lstrano-desk.jf.intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <2d634baa-89cc-4b83-a4c4-4d2ca6a4f2b7@amd.com>
 <ZzLLq3IKLnOGSea/@lstrano-desk.jf.intel.com>
 <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dcd54bc-a1e0-41cc-915f-917f1dbf5729@amd.com>
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0fc4ba-0cdc-43dd-774c-08dd038aa660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?m9vch5FYP6nQM7W6/XRPOD9BVRjIb4NjQe8eWENJFF76WM+HpEt913fBZg?=
 =?iso-8859-1?Q?2o844yDQzj3rFoHEVP6zvGkJarcX8Hqdzi/8I/o0uFDcdZa2yG1QmPjnoO?=
 =?iso-8859-1?Q?G8HfmGZuiFq7aDXreDFWGg/SI+vjgX4V4SrFNkEpFX9Tl0eHiIV1lESUdU?=
 =?iso-8859-1?Q?8i3AaeHNnwakmQmqnrYpFLKmpM0dgej7y2V8VNc3rIhOCvZ2W8ndTaFaQV?=
 =?iso-8859-1?Q?hG+g8A/D/JzG5oxZpaEh8b70uv4FFteYRiM3o/mTjAYQOFWjAbtbFfW1CI?=
 =?iso-8859-1?Q?UUhpYMqmSuezdAq4kbOsgpVDC6l1I6decwITX42avOnm4MAITa0ylZsokr?=
 =?iso-8859-1?Q?fYjilVRPgAP4BW4OwBfwhRItFj8CEZbQB6Ze97063Gj6T5oSOwhjIQ22wN?=
 =?iso-8859-1?Q?UP+K1Ow/HtHw8lOo06UZ+WcF1E89cxTvWGfG+G7rBSFs+X+aDU0tgdvham?=
 =?iso-8859-1?Q?vEEpmQLMvG+1V7tw/91U6nou6bFtzQ0o5RSykxGHeNXM1aduPKfXLCVkgt?=
 =?iso-8859-1?Q?ylx2AojxK0HywGY5+SzgwEyOSp8KTe2PnhM/qYMDPEOTzgV148Z5RFfQ/A?=
 =?iso-8859-1?Q?w2y9F08nxIBGO3PQJrQ5VBkHl5dsmcPaWvysvlTXg0r/g5njmXMA6UY15t?=
 =?iso-8859-1?Q?Todk2ub4K1pYcqWpD75ecD4d3+cED2ju/ipt2hO4gtVakZXf2hBqnhbPAJ?=
 =?iso-8859-1?Q?vCjzGmzdmGwlnD8HVHa+beVcnyuY9xxBkbIfPWiTPIb1Y7aEHRVj2041xN?=
 =?iso-8859-1?Q?iojQEf+0wcayvU639xfLmswQD9Bb3z/2QAgZND42ZscAYywyxX1WDrwFss?=
 =?iso-8859-1?Q?DapFgZG1wxtaeeMlATjT7KMJxNQP4mceRS/Nb7Czg9cafm9qhu7o1E5wJR?=
 =?iso-8859-1?Q?iqNo/AcThPPKABrpzdj0Uqm7I/rYbnDNhiNrPWYt2or7o5SvZbRla8rrr5?=
 =?iso-8859-1?Q?bFNwo672ZzKdzKzVx/XOU3yqaEtdV5fmtu4IfVlwS0Hdh+xgeC2/bSNdGO?=
 =?iso-8859-1?Q?4amopIBA80IV6Tvbq2NoMj4pMblsJXI9DUC7LThX6wcgSmTIFA4USaZxu/?=
 =?iso-8859-1?Q?LnMI1Ir6y2wpiDTcFpR++oQ2VYp9sQNPbzknz27ViqvWBjw3CI/Cs4ltg5?=
 =?iso-8859-1?Q?o2/reFK+LUzuTWlCCyeoe1KTGcs2SlTW7kU63ByMY6VTLXV+FPJVvzm9nh?=
 =?iso-8859-1?Q?qcnw6fJsEwgQ/ZDSrnxEPxJ0tNJggnPnZk3R16Cw6745uLCc6VqalcJ48Q?=
 =?iso-8859-1?Q?sfQllmJBx7V3k6ZkR51/qFybBNcoE2kI9s0oYlSEvRyrAvaf4xxkII3SDe?=
 =?iso-8859-1?Q?NOwI9r3F54zEMiBfgvc/q42qGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?um8RFKIZGytx5S8SzO0T3PtOoJc8KZOWSWM+9fPYcWlW5egFyr2faGj0vr?=
 =?iso-8859-1?Q?zgemSNcVOGrKh7V1hJ+wiwhtl8lmsODjJXqWP1O5tFY0g/h3WmayWIBbym?=
 =?iso-8859-1?Q?qequ3UGUf03jnhTJciVWKlu11ucgx0h8/Y+zmW4CEcbOJFDY3U9XD8lcmH?=
 =?iso-8859-1?Q?Srdhj/ThR6lZwG2sjH4blFV3LrokBI4fCcpsM2aUZ2FJIaaFmdMGsDULtH?=
 =?iso-8859-1?Q?6BAJrzbA7uywU41fF9ICFM3jxPU79bYXpwBlY8ZZm/gZb9W6DkQMmM2X8q?=
 =?iso-8859-1?Q?daaLFuZAD8r2s8ybR5xpNKeL0zSdUeeZ7wx8LlOUl+Jms7tnOjFe5Zc0WJ?=
 =?iso-8859-1?Q?Z27VnmJBxRDnprVJEwq3kuwKLNIb2iiJPLT3Jdf2SGzSfVHKvzFNqXcRDt?=
 =?iso-8859-1?Q?EtRvuiazX4HnxrFmAwTjlBDukddXjENC6e7F7N9g4q5GtNg55gibvxMbuk?=
 =?iso-8859-1?Q?Vu20Mn62K2FgvKG2vtZRIOq1xmgk64mjSn480J+ZGqF6SkCkLlgA27VwVR?=
 =?iso-8859-1?Q?xSghp42BHV/GUBO5Ve7PKLT2xDW++Xj8tg67MBmdQQZac9tk2mn9DWfxOK?=
 =?iso-8859-1?Q?cCvUqiG5Y8El/4dzTy1ebPSMXBdhTw71leX8kS2xmQMJBvqMK+IeF2IQwt?=
 =?iso-8859-1?Q?yDEafC95r+XzHIa6v+cCHYRyJQCLniqkg1BfaxqZ3XklSQeTbKOLlxHlK5?=
 =?iso-8859-1?Q?+xwlMI3zPN45bt6+daJq6yddQKI1w9/0gUi/LLFomxh/ZwR5TRQ+cHRZdH?=
 =?iso-8859-1?Q?WYifPXE3yoYuFyoU4S/1w6iqOA6f4IcDeL1va2e9nHNhBjC2eLHenOofpi?=
 =?iso-8859-1?Q?r9CazaG7LTXH6fI168ty5Lr9Fw4nePuamMfFZBqJjPpTq6Ju1hIitalrT7?=
 =?iso-8859-1?Q?UzLUHmP9UIMn03QUaAV6mNyV+kU0qjCy4dyxxBwfqF7LaMS4OruuHPcSxb?=
 =?iso-8859-1?Q?n/YZAoZwxgpjk4EvY67s4EHUyz003KzYQtQFZM8Jwr42ASdpmrgnNDBvMU?=
 =?iso-8859-1?Q?Kqzb+6hbI92aLLrmd86gVEZG2qg1hjCxkhC7FaCZ0U3hEwvb5gmZNFhfYx?=
 =?iso-8859-1?Q?foixdlsUynwzRzYz0n2MgZEfDI6KPpHCx+5TmKDwJ6XJFxZHa2dSjfg7A9?=
 =?iso-8859-1?Q?y1abCLgteL0yVPvjpehvQK3WApRFfxvP6hkqtn/2IxKcvnY5tG0Qyk7NDn?=
 =?iso-8859-1?Q?CTJaLaU08NeQp6xi92GQGrhi+Swastppf/n/7YisjWMEyFTJSWBrTjGZ67?=
 =?iso-8859-1?Q?JwEhEl0+Z6h0ljyNQIp/bPs1QIx2nifHTb/dv840Vbdt2L0dBT/SlJQCLY?=
 =?iso-8859-1?Q?2/YvKR4VItb2gITjjsOyTcilzFA8Dsgqc8aAlMriFWI8J/V27wZR3is4Zc?=
 =?iso-8859-1?Q?0s/RAqCVFMun7rS6o4Hv8hsv5KQwDtuVof0HQbu9oJXH7q0hnJOoWFphpJ?=
 =?iso-8859-1?Q?o+bdoKO8q2SPbLjqx6vSD7xt8aJHkvJUM0Yc17iMHHOpUdtCu6UjjlZpbz?=
 =?iso-8859-1?Q?+D6mOeATXCk/5bhuP7MAVGQwxihI/Cjldft/vrqR20g+9FshlY45AyazEa?=
 =?iso-8859-1?Q?ovYQiR2hrHezi0rCKIsBQrf+my8eMGIeo+NIrgrRQrb/LiWTjl8ta71O0B?=
 =?iso-8859-1?Q?tocuUayXwaRx9g1kSs7KfDYgtX6/vdy1stbugcTuoyyz9nuabdudgX6w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0fc4ba-0cdc-43dd-774c-08dd038aa660
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 02:26:59.0267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfOMd4zmpxcINTUanPCTD/fPIpoVrVEySByWhhRC7e2NTnF9in9C6qfv0bQ56ovsLzrwgt0kq2iqoD3ZgRbp2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
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

On Tue, Nov 12, 2024 at 12:09:52PM +0100, Christian König wrote:
> Am 12.11.24 um 04:29 schrieb Matthew Brost:
> > On Mon, Nov 11, 2024 at 02:42:02PM +0100, Christian König wrote:
> > > Am 09.11.24 um 18:29 schrieb Matthew Brost:
> > > > The motivation for this series comes from pending UMD submission work by
> > > > AMD [1], ARM [3], and the Xe team, who are also beginning to look at
> > > > this. Sima has suggested [4] some common driver preemptive fences and
> > > > semantics, which we all agree on. This is the first attempt to implement
> > > > them, based on Xe's existing long-running preemptive fences.
> > > > 
> > > > The semantics are fairly simple: preemptive fences attached to a
> > > > dma-resv must wait to enable signaling (and thus preempt device
> > > > execution) until all fences in other slots have been signaled. These
> > > > semantics are necessary to avoid deadlocks when preempting a device
> > > > while a user submission is pending, and resuming device execution
> > > > depends on the user submission completing. The semantics align with
> > > > Christian's view [5], which I also arrived at independently (with a
> > > > little help from Sima).
> > > Ah! I was really wondering for a moment why you wanted to add a separate
> > > dma_resv usage for that. But I strongly think that this approach won't work.
> > > 
> > > The assumption that completion fences which depend on a preemption fence are
> > > always part of the same dma_resv object is most likely false in some cases.
> > > 
> > > At least for the AMD design what can easily happen is that we put a
> > > completion fence only into a drm_syncobj for explicit synchronization and
> > > then engines or different devices which still use kernel submissions depend
> > > on it. That can go boom really trivially.
> > > 
> > > What we do instead is to wait for the latest issued completion fence while
> > > holding a mutex to prevent creating new ones before stopping the threads and
> > wrt to a mutex...
> > 
> > A current code reference would be nice. I looked some of the code on
> > list and dma-fencing rules are broken...
> > 
> > e.g., This patch [1], takes 'uq_mgr->userq_mutex' in the dma fencing path.
> > This patch [2], takes 'uq_mgr->userq_mutex' and then dma-resv lock /
> > allocates memory. That is clearly not allowed.
> 
> No that is unproblematic. The dma_resv is only locked after the preemption
> fence is already signaled.
> 

That's kinda cheating, fragile, and a pretty poor practice IMO. Your
driver though.

> The problem is currently that we have separated the signaling worker from
> the resume worker. E.g. the mutex is dropped in between.
> 

Again, can you share any code refs? See below, will share work shortly.

> > 
> > Perhaps this is fixed in your current code base though.
> > 
> > [1] https://patchwork.freedesktop.org/patch/593210/?series=133345&rev=1
> > [2] https://patchwork.freedesktop.org/patch/593211/?series=133345&rev=1
> > 
> > > signaling the preemption fence.
> > > 
> > Right, that works and is functionally equivalent to the intended purpose
> > here.
> > 
> > I left out a key detail: when a user fence is converted into a dma-fence
> > and exported in a syncobj or syncfile, it must also be installed in all
> > of the VM's dma-resv bookkeeping slots (i.e., in VM's dma-resv and all
> > extobj dma-resv mapped in the VM).
> 
> I don't think that this is something we should do.
> 
> > Before exporting a dma-fence, the VM must be validated + resumed, and
> > you must hold all dma-resv locks, so the above is trivial.
> 
> Hui? Why should we hold all the dma-resv locks for that?
> 
> We only hold the userq_mutex to make sure that no user fence is created
> while we are in the signaling path of the eviction fence.
> 

I reason that the user fence -> DMA fence IOCTL (and vice versa) is
essentially another version of the rebind worker, which also performs
the fence transformation and installs fences in the preempt slots to
guard against unwanted preemption while a DMA fence has been exported.
It seems to work quite nicely.

> > If you're using gpuvm, just call drm_gpuvm_resv_add_fence. I assume AMD has a
> > similarly simple call.
> 
> Nope, we try to avoid locking all BOs in the VM as hard as we can.
> 

Why? Calling in to perform fence conversion shouldn't be all that
frequent and simplifies things.

Also, it's likely that only a few locks are involved, as not too many
external BOs are mapped within a VM (i.e., most BOs share the VM's
dma-resv lock).

> > Now the ordering works inherently in dma-resv and the scheduler. e.g. No
> > need to track the last completion fences explictly in preempt fences.
> 
> I really don't think that this is a good approach. Explicitly keeping the
> last completion fence in the pre-emption fence is basically a must have as
> far as I can see.
> 
> The approach you take here looks like a really ugly hack to me.
> 

Well, I have to disagree; it seems like a pretty solid, common design.

Anyway, I think I have this more or less working. I want to run this by
the Mesa team a bit to ensure I haven't missed anything, and will likely
post something shortly after. 

We can discuss this more after I post and perhaps solicit other
opinions, weighing the pros and cons of the approaches here. I do think
they function roughly the same, so something commonly agreed upon would
be good. Sharing a bit of code, if possible, is always a plus too.

Matt

> Regards,
> Christian.
> 
> > 
> > I'm pretty sure if converted your code this solution it would work,
> > there are however a couple of bugs in this post which I have fixed.
> > 
> > This is a common solution based on existing components which I'd lean
> > towards rather than some new component.
> > 
> > Matt
> > 
> > > That code could of course be made some driver independent component.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > Implemented via the new dma-resv slot DMA_RESV_USAGE_PREEMPT, a common
> > > > embedded base preemptive fence class with driver operations, and updates
> > > > to the scheduler to adhere to these semantics.
> > > > 
> > > > The current Xe long-running preemptive fences have been converted to the
> > > > new common code, and UMD submission is expected to follow (hopefully)
> > > > shortly thereafter in a subsequent series.
> > > > 
> > > > Not intended to be presented as the final solution, but rather to
> > > > kickstart serious discussions on this topic.
> > > > 
> > > > Matt
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/113675/
> > > > [2] https://patchwork.freedesktop.org/series/114385/
> > > > [3] https://patchwork.freedesktop.org/series/137924/
> > > > [4] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011577
> > > > [5] https://patchwork.kernel.org/project/dri-devel/cover/20240828172605.19176-1-mihail.atanassov@arm.com/#26011853
> > > > 
> > > > Matthew Brost (6):
> > > >     dma-resv: Add DMA_RESV_USAGE_PREEMPT
> > > >     drm/sched: Teach scheduler about DMA_RESV_USAGE_PREEMPT
> > > >     dma-fence: Add dma_fence_preempt base class
> > > >     drm/sched: Teach scheduler about dma_fence_prempt type
> > > >     drm/xe: Use DMA_RESV_USAGE_PREEMPT for preempt fences
> > > >     drm/xe: Use dma_fence_preempt base class
> > > > 
> > > >    drivers/dma-buf/Makefile                    |   2 +-
> > > >    drivers/dma-buf/dma-fence-preempt.c         | 102 ++++++++++++++++++++
> > > >    drivers/dma-buf/dma-resv.c                  |  43 ++++++---
> > > >    drivers/dma-buf/st-dma-resv.c               |   2 +-
> > > >    drivers/gpu/drm/scheduler/sched_entity.c    |  29 +++++-
> > > >    drivers/gpu/drm/scheduler/sched_main.c      |  50 +++++++---
> > > >    drivers/gpu/drm/xe/xe_bo.c                  |  22 +----
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c          |   3 +
> > > >    drivers/gpu/drm/xe/xe_hw_engine_group.c     |   4 +-
> > > >    drivers/gpu/drm/xe/xe_migrate.c             |   4 +-
> > > >    drivers/gpu/drm/xe/xe_preempt_fence.c       |  81 +++++-----------
> > > >    drivers/gpu/drm/xe/xe_preempt_fence.h       |   2 +-
> > > >    drivers/gpu/drm/xe/xe_preempt_fence_types.h |  11 +--
> > > >    drivers/gpu/drm/xe/xe_pt.c                  |  12 +--
> > > >    drivers/gpu/drm/xe/xe_vm.c                  |  22 +----
> > > >    include/drm/gpu_scheduler.h                 |  15 +++
> > > >    include/linux/dma-fence-preempt.h           |  54 +++++++++++
> > > >    include/linux/dma-fence.h                   |   1 +
> > > >    include/linux/dma-resv.h                    |  24 +++--
> > > >    19 files changed, 326 insertions(+), 157 deletions(-)
> > > >    create mode 100644 drivers/dma-buf/dma-fence-preempt.c
> > > >    create mode 100644 include/linux/dma-fence-preempt.h
> > > > 
> 
