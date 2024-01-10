Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC182A238
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1538E10E667;
	Wed, 10 Jan 2024 20:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F1810E667;
 Wed, 10 Jan 2024 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704918494; x=1736454494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Evv0aClRMhmHH6Qx5tDf7ZIy2bkhnJAPujzLW0ctypQ=;
 b=aIcYHnQtHzrPCXsEyBBRlm0BYjO50NbnCl6c5uR0yJrQyMaBQP2jfGdU
 P2k2MNc0aiCi44O9vpJouSIGEcEjQIFwCG+dgSLT3dORMn8Mlu2kNSoJp
 vLI3ZXYKX1HzHgxZ5Z14hNGZ0eoa573KX26t/z28IKxw3pwGI0cp+e8hC
 9oYL0dAOpfM2HAwgEeuVbWDR2I/uvVnoMIZzWm3Wo2Y9sFNzYokd5767R
 B88L9W2friGJwpC5CDdnl28ZjQuO0hySt7bTbAwOZVPLFZ2T2DJrQj37g
 7md5WfqVzAa3mu1QIf4QNW1DPoY/KQWHtpJ/7OxmbHpaRqtX8zRV0zkrf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="429825294"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="429825294"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 12:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="782311105"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="782311105"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2024 12:28:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Jan 2024 12:28:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Jan 2024 12:28:13 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Jan 2024 12:28:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5VjZ+SAR2n1NqnGknxW9+oqZ88azS8eAcMLtMRjauHIu8nHPMK0X1EFmwcKlFaWOkA3c7Zu3NgPwhfDLsmWUy9PNdtRDNvRFhj5Cm1b1cGl1FTJ9pE4QRIv/o0V1ZTjxg3Sy1dFBogApsoImmazQXKbDdhvs4/Xn8HQXfLNF3N+xxXy0QNLZcPwq+tTdQkpt1wOZ8mlFS6khUoHtpKOmGHpV1RXm6TzfEMmLf/EX0ixcLympdQW0LRUHwAaU/BjDw2VxaxpYMRDa2HTwAdYidy1TY5kkdHZ80PQWPS64AyPn/kHzHiV7YMVmy8YVdjjnPgBYdHQkDIm4Vd0g0Utbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mla6vroL5J2HYcpWP5VsMZmubmteEZtkh9+mKH8iQ0E=;
 b=CFVD9ScHx7kMmUXwMox12LrNwGI+LgvzFjUK/He+djUzsef9vsvxJorbpszHiM7PVWrUH44I8M3xvZ4q9QxeSa4fHmErV+HiOhyf6g3Tx3Kqy2TSbd6tOqoKZ5zIxasrbKdKbJSyBsTvcX7dBFgqLOgvz9RdWxSPByQ8+Hlne0CvEypkO0Hlpj8ZuGFfZWp/VBnXYtebI/XNa+ZA+iHWcNGeOFfpi07E6E75H2Xn9Mxb48VpYJLNVx2gPAMC/ExBkz+p+yLZ7kpwi072M45TWIKi4grn7OxuyAMSSI25NkIOA14MFLruXBnp6R5WfQ6VTeHgAnYYcl2WNRI0m0ZlQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 20:28:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 20:28:11 +0000
Date: Wed, 10 Jan 2024 15:28:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/doc/rfc: Remove Xe's pre-merge plan
Message-ID: <ZZ791rf5J-mwcce4@intel.com>
References: <20240110190427.63095-1-rodrigo.vivi@intel.com>
 <xcb5zvot4465q2n3y7bf7pz2fr6um4nntgfk2wdzxghzurz4ky@yqviz73ktgqs>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xcb5zvot4465q2n3y7bf7pz2fr6um4nntgfk2wdzxghzurz4ky@yqviz73ktgqs>
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 292f709c-1109-495a-41e2-08dc121aa9e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1bZu75N74pE+baTmb7i+zfk60OrH/35qQuo8lPHvp7ravHNBeTYDWLSY22cFhfi1JlpCr+U+a5UNga4aBOrLs15XpC10195DuJ6lHBGy+ncrXY9gbRGFpF6CGBk7uo/eNLuYqmne0F3lKPQq/gtPKvLEQC5AquirXEdeJfDSvGaaDvrwjQACwVENupEvS9c9rP9agil59bWx9aeGh8w4QUEp/cd3KraRU1w8gL9G6KKDBisb/6yxA+PPpBapY7WZ7d6/j7eSxpO8cGUf3Hvmf8R2AVkGpiwaLC6eRnLKfzyYgwXVXOBXTvV62Y2+R0lFBWT+kPerIuw6nSoibM9xAVAh2KpRBXCa7FG4m5Su20dHgicCkV5Ws29qVIN3vgll0joUA/CXb9XVjeMVxPHEa9r3mDasrQJsAFjrr1GnreN/p8pq7A7LJLu4MERb2kdxd05leJcyDcbTYOiue214zk+fjCPiNYtURkSPp3jt7jqUYRNVSRKT5ByxDugkr//at4qkCvyQC5Ts9FGpuS08dNPeInHKFcARbwQX88CEMmj2+TEr2VYKl1/vGLSUKwboIB5m+JLv4C1b0f0FDyrbUs+VHPzB2P5tbppsHkMF7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(376002)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(478600001)(6486002)(6666004)(26005)(66574015)(6512007)(66556008)(6506007)(86362001)(82960400001)(83380400001)(66946007)(316002)(66476007)(6636002)(966005)(37006003)(5660300002)(66899024)(41300700001)(36756003)(30864003)(38100700002)(4326008)(2906002)(450100002)(6862004)(8936002)(44832011)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3g4b3BlVU5kRTFseUJvLys1czcxakxNallCS1BsQ3Z3NUZ1a0xLWXpZN0hj?=
 =?utf-8?B?Yy8wWTlrQ0RJNktIZnhlWFpKV1RSd2NqcXM4UW5qWUg2eVdTY1VoVVNsWGRy?=
 =?utf-8?B?WGJDbzZ3cXVyYXdDdWYweEhlTE94Q05GS1pjMG5hNHNKdzlPeDVJZEJBSGNS?=
 =?utf-8?B?eng1dnZqcGlmNk93NnZrTDFXWXBiS0dqaSt5L3N2MnFCMFB2UWdoSHBBekpq?=
 =?utf-8?B?NkhwY28rWDlZMnNiZ3hhZnFCUXp2eHdCUFB6WHFvYnN6VFYveW5qNTJEcHI5?=
 =?utf-8?B?clpEQU4vdEN4Rk5HU2ZFYk1DTjhLQVBFNjBBWlBmUFdwUnQ5cVRJYmpjL1VY?=
 =?utf-8?B?aXNhOVVyME9xMEVBTERURnYvZ1lQZ1VpeG1FelNCN0d0S0lYSExCTVM1NHV4?=
 =?utf-8?B?VXUyZk1EM2xhOUVXZnBsN055ZkdlOUNEcUI4NnJhR3EwejJHZUVxazhUbDIy?=
 =?utf-8?B?TkFZanh5VXdhU3Eva1l4MTE4aTYrNDBIMG90YUFOQzUwTjgzNytsWTBGeEVl?=
 =?utf-8?B?ZDNsUHRxUW5IZHMxNUNEOEEzWjlMcVFlOFFKSDNVNXVmVVIwK0N6eExYQlZJ?=
 =?utf-8?B?czc5RjZxM1E3NXgvRGZqdjh0andYQ2lFNzg4STFKWUtsWENnVDZsak9PbU1G?=
 =?utf-8?B?M2dKZGRXa0VJcmk4enpRcE9ZMlFwSTJrK01rOGdaTWJqYXcyV2QvMll2dDNw?=
 =?utf-8?B?cEtnUmRKcTdaYVcwYkxFVUtlOWZFVmIza1VIZU40QkZCM3Q2SnlETCszZEdj?=
 =?utf-8?B?U2l1U2ZqVEhmSk9PMDNKWkNVb2ZRRTZWTU0yYzlkTTdJYWFRc2xpekpETnZn?=
 =?utf-8?B?dUx3SFhHR2E2dFptKytaQm1WT3FRVFJCdCtRcEh3d05RVFBqUUExUkxYWWN2?=
 =?utf-8?B?QkkyTS9sL0kyOTJUYXZaaHBPcDZoSHNHcHBmWWRrbitjSU9QMUk5ZmsyMllq?=
 =?utf-8?B?a09hQW9xWmRpdWVWMitnRm1KM3VySGxIMEsxcXg3TDllWWw3VXNHejRMdHMr?=
 =?utf-8?B?NXVSTmFsSEQ1MXd6RWpXUmFsYm15TEpSZFFoTVUxWmUvNFptSUxPSHA4bjg1?=
 =?utf-8?B?ZlpWUnQ4VFBKbWN6aFFxNGdaYnNVWWRnTEhTZ0tMUDk2enVyY1FiQTBYU24z?=
 =?utf-8?B?NTFUYTRMaDFZWjBDK0lDVDc4S1hYUVVJSE9TSGxBZkYvMkNBNEhhV3ZGL1Nk?=
 =?utf-8?B?b2xza2NXelFTbm9GdzZtUXBGdTFZRHRoYU1ZM3EwZmx6UHZ3RWVIV01pQ2FO?=
 =?utf-8?B?U2ZEYUdLUFpoYzlEZi9DRTlWaC9HbXhLL0N2RjdvMUhRRXVvV3ZJN1FOVDg4?=
 =?utf-8?B?RWMzcjZ4VkwreFFwOFZIZzVyZTJxd3I1Z25iR2lpd1RyZnpleDQvcmFJUGo3?=
 =?utf-8?B?U2h0M2JIZ2JCUkJnUjFsTU0wNmdpOVRseElmdEtrMWZIRlR1Tzd0blp1R3ow?=
 =?utf-8?B?WnpsZGdRRFhvMDVNczRPMFB3SC9tUzdoY2pnOG5nT3NXVjRxT3Z6Q3Z5WEUv?=
 =?utf-8?B?YXcxVmFGZWJOMEpZejNUUzFZcDBjZWNFWGZON3lmRno5SEpYQzh5NTV1NWx5?=
 =?utf-8?B?NVFoK3NpRjlvWVU0TmdIV3JBTkx0N3A2cFora1BSSWNRRVQ0bFd2RFRwdE1P?=
 =?utf-8?B?aGd3QXYraHFCMUJySzhOOEt0dVpBUGc1NEJlMVpDQms1dzZjb2V0dGw0ZEtj?=
 =?utf-8?B?ZFlSZjduaWlaVGJJbnlvTVFnSE9pb3FvQUNKSllMOXl2SnkrZGZYZTR0b2pH?=
 =?utf-8?B?b2xPNmM1VEE1NStYZmluUE14SlBmU0pzWWFZNWMxbEpLbVBlVmN4NUZDNTRF?=
 =?utf-8?B?enhPcmxiK3lJSUtyNDVTcExHV2ExVlZaNFpxSDBnSzVjeXJEM2VzQUEzK1RM?=
 =?utf-8?B?VkFJTDNSYVZLSlIxay9SM1hzK1pyVnlJTVlENm5QUC93aDZsTnY2YW9EbENF?=
 =?utf-8?B?SFpSazFkWHhnNHRXcTRYOVZWcHFRblRURDhOckJPaG83RDJSMUNhbDJSNlZE?=
 =?utf-8?B?TnNRa2RmTnBNN0FVaWdzOVIyci91aGNZV29pellxRTVtZStpeXdhS2hkVElB?=
 =?utf-8?B?Z2RPYm1Mc01nQXZNdnpaOVV1OUdBODBDdnZLVWNOZ1k3elVwMGFGcCtVaHNw?=
 =?utf-8?B?WEhOWGJEaVgxcWt1S3FacXRjNUtuVGhwTkRZY0tkZ1VsMlNJRWliT3FCeEpv?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 292f709c-1109-495a-41e2-08dc121aa9e2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 20:28:11.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWL2b3aewhmGWO5Z4IysCFPDlCaAPcrOhwimiQ0SzPSdrN1C49Xg9LnpKGd1/xmhDpdYU1Gs8r3B6k8GVmWrgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5358
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 02:07:38PM -0600, Lucas De Marchi wrote:
> On Wed, Jan 10, 2024 at 02:04:27PM -0500, Rodrigo Vivi wrote:
> > The last TODO item here that was not marked as done was
> > the display portion, which came along with the pull-request.
> > 
> > So, now that Xe is part of drm-next and it includes the
> > display portion, let's entirely kill this RFC here.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks, pushed to drm-misc-next.

> 
> thanks
> Lucas De Marchi
> 
> > ---
> > Documentation/gpu/rfc/xe.rst | 234 -----------------------------------
> > 1 file changed, 234 deletions(-)
> > delete mode 100644 Documentation/gpu/rfc/xe.rst
> > 
> > diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> > deleted file mode 100644
> > index 97cf87578f97..000000000000
> > --- a/Documentation/gpu/rfc/xe.rst
> > +++ /dev/null
> > @@ -1,234 +0,0 @@
> > -==========================
> > -Xe – Merge Acceptance Plan
> > -==========================
> > -Xe is a new driver for Intel GPUs that supports both integrated and
> > -discrete platforms starting with Tiger Lake (first Intel Xe Architecture).
> > -
> > -This document aims to establish a merge plan for the Xe, by writing down clear
> > -pre-merge goals, in order to avoid unnecessary delays.
> > -
> > -Xe – Overview
> > -=============
> > -The main motivation of Xe is to have a fresh base to work from that is
> > -unencumbered by older platforms, whilst also taking the opportunity to
> > -rearchitect our driver to increase sharing across the drm subsystem, both
> > -leveraging and allowing us to contribute more towards other shared components
> > -like TTM and drm/scheduler.
> > -
> > -This is also an opportunity to start from the beginning with a clean uAPI that is
> > -extensible by design and already aligned with the modern userspace needs. For
> > -this reason, the memory model is solely based on GPU Virtual Address space
> > -bind/unbind (‘VM_BIND’) of GEM buffer objects (BOs) and execution only supporting
> > -explicit synchronization. With persistent mapping across the execution, the
> > -userspace does not need to provide a list of all required mappings during each
> > -submission.
> > -
> > -The new driver leverages a lot from i915. As for display, the intent is to share
> > -the display code with the i915 driver so that there is maximum reuse there.
> > -
> > -As for the power management area, the goal is to have a much-simplified support
> > -for the system suspend states (S-states), PCI device suspend states (D-states),
> > -GPU/Render suspend states (R-states) and frequency management. It should leverage
> > -as much as possible all the existent PCI-subsystem infrastructure (pm and
> > -runtime_pm) and underlying firmware components such PCODE and GuC for the power
> > -states and frequency decisions.
> > -
> > -Repository:
> > -
> > -https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
> > -
> > -Xe – Platforms
> > -==============
> > -Currently, Xe is already functional and has experimental support for multiple
> > -platforms starting from Tiger Lake, with initial support in userspace implemented
> > -in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in NEO
> > -(for OpenCL and Level0).
> > -
> > -During a transition period, platforms will be supported by both Xe and i915.
> > -However, the force_probe mechanism existent in both drivers will allow only one
> > -official and by-default probe at a given time.
> > -
> > -For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe instead of
> > -i915, the following set of parameters need to be used:
> > -
> > -```
> > -i915.force_probe=!5690 xe.force_probe=5690
> > -```
> > -
> > -In both drivers, the ‘.require_force_probe’ protection forces the user to use the
> > -force_probe parameter while the driver is under development. This protection is
> > -only removed when the support for the platform and the uAPI are stable. Stability
> > -which needs to be demonstrated by CI results.
> > -
> > -In order to avoid user space regressions, i915 will continue to support all the
> > -current platforms that are already out of this protection. Xe support will be
> > -forever experimental and dependent on the usage of force_probe for these
> > -platforms.
> > -
> > -When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
> > -
> > -Xe – Pre-Merge Goals - Work-in-Progress
> > -=======================================
> > -
> > -Display integration with i915
> > ------------------------------
> > -In order to share the display code with the i915 driver so that there is maximum
> > -reuse, the i915/display/ code is built twice, once for i915.ko and then for
> > -xe.ko. Currently, the i915/display code in Xe tree is polluted with many 'ifdefs'
> > -depending on the build target. The goal is to refactor both Xe and i915/display
> > -code simultaneously in order to get a clean result before they land upstream, so
> > -that display can already be part of the initial pull request towards drm-next.
> > -
> > -However, display code should not gate the acceptance of Xe in upstream. Xe
> > -patches will be refactored in a way that display code can be removed, if needed,
> > -from the first pull request of Xe towards drm-next. The expectation is that when
> > -both drivers are part of the drm-tip, the introduction of cleaner patches will be
> > -easier and speed up.
> > -
> > -Xe – uAPI high level overview
> > -=============================
> > -
> > -...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
> > -
> > -Xe – Pre-Merge Goals - Completed
> > -================================
> > -
> > -Drm_exec
> > ---------
> > -Helper to make dma_resv locking for a big number of buffers is getting removed in
> > -the drm_exec series proposed in https://patchwork.freedesktop.org/patch/524376/
> > -If that happens, Xe needs to change and incorporate the changes in the driver.
> > -The goal is to engage with the Community to understand if the best approach is to
> > -move that to the drivers that are using it or if we should keep the helpers in
> > -place waiting for Xe to get merged.
> > -
> > -This item ties into the GPUVA, VM_BIND, and even long-running compute support.
> > -
> > -As a key measurable result, we need to have a community consensus documented in
> > -this document and the Xe driver prepared for the changes, if necessary.
> > -
> > -Userptr integration and vm_bind
> > --------------------------------
> > -Different drivers implement different ways of dealing with execution of userptr.
> > -With multiple drivers currently introducing support to VM_BIND, the goal is to
> > -aim for a DRM consensus on what’s the best way to have that support. To some
> > -extent this is already getting addressed itself with the GPUVA where likely the
> > -userptr will be a GPUVA with a NULL GEM call VM bind directly on the userptr.
> > -However, there are more aspects around the rules for that and the usage of
> > -mmu_notifiers, locking and other aspects.
> > -
> > -This task here has the goal of introducing a documentation of the basic rules.
> > -
> > -The documentation *needs* to first live in this document (API session below) and
> > -then moved to another more specific document or at Xe level or at DRM level.
> > -
> > -Documentation should include:
> > -
> > - * The userptr part of the VM_BIND api.
> > -
> > - * Locking, including the page-faulting case.
> > -
> > - * O(1) complexity under VM_BIND.
> > -
> > -The document is now included in the drm documentation :doc:`here </gpu/drm-vm-bind-async>`.
> > -
> > -Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
> > -the second driver supporting VM_BIND+userptr appears. Details to be defined when
> > -the time comes.
> > -
> > -The DRM GPUVM helpers do not yet include the userptr parts, but discussions
> > -about implementing them are ongoing.
> > -
> > -ASYNC VM_BIND
> > --------------
> > -Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > -Xe merged, it is mandatory to have a consensus with other drivers and Mesa.
> > -It needs to be clear how to handle async VM_BIND and interactions with userspace
> > -memory fences. Ideally with helper support so people don't get it wrong in all
> > -possible ways.
> > -
> > -As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> > -various flavors, error handling and sample API suggestions are documented in
> > -:doc:`The ASYNC VM_BIND document </gpu/drm-vm-bind-async>`.
> > -
> > -Drm_scheduler
> > --------------
> > -Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
> > -drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
> > -resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
> > -not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
> > -drm_sched_entity.
> > -
> > -Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
> > -some consensus needs to be reached between Xe and other community drivers that
> > -could also benefit from this work, for coupling FW based/assisted submission such
> > -as the ARM’s new Mali GPU driver, and others.
> > -
> > -As a key measurable result, the patch series introducing Xe itself shall not
> > -depend on any other patch touching drm_scheduler itself that was not yet merged
> > -through drm-misc. This, by itself, already includes the reach of an agreement for
> > -uniform 1 to 1 relationship implementation / usage across drivers.
> > -
> > -Long running compute: minimal data structure/scaffolding
> > ---------------------------------------------------------
> > -The generic scheduler code needs to include the handling of endless compute
> > -contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
> > -drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
> > -completion fence.
> > -
> > -The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
> > -this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
> > -drm driver, including Xe, could re-use and add their own individual needs on top
> > -in a next stage. However, this should not block the initial merge.
> > -
> > -Dev_coredump
> > -------------
> > -
> > -Xe needs to align with other drivers on the way that the error states are
> > -dumped, avoiding a Xe only error_state solution. The goal is to use devcoredump
> > -infrastructure to report error states, since it produces a standardized way
> > -by exposing a virtual and temporary /sys/class/devcoredump device.
> > -
> > -As the key measurable result, Xe driver needs to provide GPU snapshots captured
> > -at hang time through devcoredump, but without depending on any core modification
> > -of devcoredump infrastructure itself.
> > -
> > -Later, when we are in-tree, the goal is to collaborate with devcoredump
> > -infrastructure with overall possible improvements, like multiple file support
> > -for better organization of the dumps, snapshot support, dmesg extra print,
> > -and whatever may make sense and help the overall infrastructure.
> > -
> > -DRM_VM_BIND
> > ------------
> > -Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
> > -fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
> > -development of a common new drm_infrastructure. However, the Xe team needs to
> > -engage with the community to explore the options of a common API.
> > -
> > -As a key measurable result, the DRM_VM_BIND needs to be documented in this file
> > -below, or this entire block deleted if the consensus is for independent drivers
> > -vm_bind ioctls.
> > -
> > -Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
> > -Xe merged, it is mandatory to enforce the overall locking scheme for all major
> > -structs and list (so vm and vma). So, a consensus is needed, and possibly some
> > -common helpers. If helpers are needed, they should be also documented in this
> > -document.
> > -
> > -GPU VA
> > -------
> > -Two main goals of Xe are meeting together here:
> > -
> > -1) Have an uAPI that aligns with modern UMD needs.
> > -
> > -2) Early upstream engagement.
> > -
> > -RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
> > -track of GPU virtual address mappings. This is still not merged upstream, but
> > -this aligns very well with our goals and with our VM_BIND. The engagement with
> > -upstream and the port of Xe towards GPUVA is already ongoing.
> > -
> > -As a key measurable result, Xe needs to be aligned with the GPU VA and working in
> > -our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
> > -related patch should be independent and present on dri-devel or acked by
> > -maintainers to go along with the first Xe pull request towards drm-next.
> > -- 
> > 2.43.0
> > 
