Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F516D03074
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA9810E716;
	Thu,  8 Jan 2026 13:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5H0KLvL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E117B10E716;
 Thu,  8 Jan 2026 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767878940; x=1799414940;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BhXRlEg4SJ7BZNCLWOm5DVjfmDu37Qh7kk+OXcyx2xI=;
 b=H5H0KLvL4iYdTFWf9aPFnxU8Iv4frgE2LZqwMePAfhGA4SsflENVltu9
 Ed3Iv5QFLvWr/KbZNxCMqELM3sRNeLqoay1QUkmDXmhGSoxNu9nUYAzBD
 kxDbXC6la7fd+Oam83ExUhYSbe3znCade4q665ZVic6Vg0ANIrvWVv7yD
 5RTr68sEgEmoKkkfXiouEeDLbROIjmyLAsE3PUYFN+8LIrLoGGhF3LtII
 e4s8kPSOfVRBIu9s3J3MMOq55VRc0rXiYjhbhZG6Z3EK+mfygVgMwYAfp
 iK842fVBPFb9ew7tioJY4cw/srhl+bWQ3nKy5Ul7wlSNl9flXetUhu6f4 w==;
X-CSE-ConnectionGUID: 9VgZktY9Sh2b2b73CXAF9A==
X-CSE-MsgGUID: 2qfTj3MVR6ihr8n50FyCYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68260662"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="68260662"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 05:29:00 -0800
X-CSE-ConnectionGUID: ngdCWW7RSYqW5m4TBnVyng==
X-CSE-MsgGUID: D7sXcjqYTVik/1Yk/Ud/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="226624309"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 05:28:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 05:28:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 05:28:58 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 05:28:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvcgOLKYt7F60c+vc8UWuN/tzHZwEVEHlUaoNZ/tZewXZ9ZqGSPj6sCCaUR8mnm1uXj0EjLBiXG5/ZIs9ZfYCnl3z3aDNjeV0q7gJIt7KCDEEiUEcUL3ETbZuUNuv8ZFFZCj9TSdrsztErCsgFiTH3cphYF+dtNDnUcr6vAjVx3l2eCSBZ2DzCaB2UQ7eeMm/eREdtKoAyU0Rg0eOj6PWzkv1RzXARv30S5AFhQ4RMZnAPsl/CWwGTeqCrvUd5xUE9U1x/rGC+8CPF3/w7hA5EiADGPOgaQfcmpjpxBrQJa9W6ZpG18sowAPzVWxt/9wUWWlB6ZyruZcO4/5Ld73tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fh9pZiVo2CooMUIOkaR7wBO2IbDahpMF7sP4hJwpcPo=;
 b=eU9gU1Idsb8EBXZq2Ch8VqwvxLtWkmfFW10Uicfhb5PjKJTry4RYrmkP3K7Nqn8LyRF5xZu7MX635ziKUhkUxs+O27SC1HFdEniXCGvaoTPeGnmfVXEJtkz5h/sptd0IHH4cpaordrhzEj3ITqYLqy6wQt1eLzwHRNYAp3cci0HTfzyJ4ODRtOEHCo3/IOF+vg5pIzSs6lL+m6bKEYtmEIsEBI5Uz1IRS3C3E/a5OWThVCFn1RJPWjHRfbWKaR0eRbraAK1UiplFR2Ef/dYAF/nFfWHsdQGaq9aCe7AMh2QnJXNYTI2OCfKg35vjgy7qUltl1Cs0Mkyrej/hh8IMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 13:28:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 13:28:57 +0000
Date: Thu, 8 Jan 2026 08:28:50 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Thomas
 Hellstrom" <thomas.hellstrom@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
Message-ID: <aV-xEjo5ejSM73DN@intel.com>
References: <20251103170604.310895-1-marco.crivellari@suse.com>
 <20251103170604.310895-2-marco.crivellari@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251103170604.310895-2-marco.crivellari@suse.com>
X-ClientProxiedBy: BY5PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::41) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ffb479-e839-4367-3208-08de4eb9e012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X3C88FwvjDoPf3iMOyXP8BDwfozhzhjv0FVz2E4HH1X8UNjXJKVPi/BTArY5?=
 =?us-ascii?Q?5Lkh6UbcWnl+mGJsdJcUx6O/sRc1loxwJS9ac8gtfSrqKOt7K7Q6mQqvCCEr?=
 =?us-ascii?Q?2RzYKtqd+m1XNvHi76qCceJMzIWpvbWcFPXTl61btZsJXbxZml+WQH5pQ8G0?=
 =?us-ascii?Q?QWVjlVDDmWPtWNWCJcGX458VwuRP+5YktcZfLARKSnGn/ZweDoooOVmsRFZU?=
 =?us-ascii?Q?4L4aUPdZ2LkLhacZT4yDK4rUUDuwsKRhDDb5EKGQHU5IDP0iVKc/JUQ6N4ks?=
 =?us-ascii?Q?343LYJyzUIVmczoV876bWMUFHmuFf6gl1ISsUUc7krCJ0qY6oIb/JMKEY8w+?=
 =?us-ascii?Q?ofZpnrOrqHLYjPb+WN47IAzRFgfElNzCy0JyR6kem3+uHAImkjP+ZNaYXKJv?=
 =?us-ascii?Q?yjU4qJLYn3JDUeYnsW9XvNWmsgURqp9/N470ffFXDtVj5evgJW9ELbqMnw0s?=
 =?us-ascii?Q?d6z1Zqirx5PmFBwGMagv90MpAW5PBDhw1SF11dpbGsJvn44nddkXtKMjFpih?=
 =?us-ascii?Q?GmvbPeZULqPOy+5hyq7YrJkmOM2QKMLN8tM2IJYDu4gqdQJ9r//SiRVBtiYI?=
 =?us-ascii?Q?B38UyLUIg92ECkzJm6o8bpTU7CaoxgchtnmJaCTiC1Wg50QAYIJCDW/bfeg3?=
 =?us-ascii?Q?vGvqO3GaQTdOxEzByPh77zBalThawVQdXRfVv9XFBGHt3xRH7969lbodG4/V?=
 =?us-ascii?Q?zDNGNIliXS8lr+rsGBSk1nIXwuXC7NODOT3CC2XOh7tsX1ODuAPk0jSGtEeA?=
 =?us-ascii?Q?ig34TWOf5YcZbby3nFkFSnsmQpYWNQJz1udMlRClpAWlG6QKSjJLgumqb5ej?=
 =?us-ascii?Q?BKarQX0gd1Tom9PK2F3thwbtosWftGmWsCAmsor4wRdbGRxzgh20+NgHX4tL?=
 =?us-ascii?Q?nSTr2HLU8p8o2ebr0qmHNxY6H0sCKHeQOu2BqaRN2nvKLq2x29BgXv7UMbqh?=
 =?us-ascii?Q?cb9kYrDGaZaMTLhvb2TWQFMk1QFujRPX+z/gI2NgnHnV3WiCZdsGjaRm/oEB?=
 =?us-ascii?Q?v454aVP7GtNSY7a5dkjW3F6hwN9EKwmPhvUVx72gXoqRvPbqVtkigrBxi0Qz?=
 =?us-ascii?Q?eSVu90uO3em2cXIw3iur8h8QBGrlTd+i42kr1s/yKwULnvkGoUTrRLcbR1K0?=
 =?us-ascii?Q?d1ryQW4HFt02nBUTRGbduUVqxdLlv+Szmy8WgQietgQ+5njrV+UNJ8O0bes5?=
 =?us-ascii?Q?1MCadsn20kkAjnamsBqdMRLNza27s5annyqvAQnxoYnsq2au9FSr6FDBY+nc?=
 =?us-ascii?Q?jvVkwIbrRgDPILY7WlVtUS7VfC9s0zKWQcItAMONj31JMOEWlGSsD9iRB2Ys?=
 =?us-ascii?Q?0U9BNJ7nC3yOUMCvhswDeuPzJDc9MjbJxODTysTVU0L1Z2jDhrZiYPZpGfeO?=
 =?us-ascii?Q?wNrCCtlpAzd5wT/iMPw34gC4tyHaBw3piLs/U6uNrIeI2F7XEwDjnpk0LQJU?=
 =?us-ascii?Q?U7HEkCeJWA9y/BNEIvyg5z5TIzml9vbN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jeOxvWxGniG0Igox3wwSY1Wliq1qch1FIxptGTlF/fT4Cx0koAEwjhjQF5i7?=
 =?us-ascii?Q?9ILeWOSpybhxerhdnoqPIvmhjNzixt2Ob2DIiFmX1tjCBUwudJLOH6RbdQmG?=
 =?us-ascii?Q?K6XaXoFlSsqSqu3Nwncug8Pd+0c2hw5t9xZX2tvEQOv2RPeSRDDGRAU9Vhiw?=
 =?us-ascii?Q?tY8i5ldMHcn7HbZrdRtGv2dLxscPG4jSl9HKTxYZsDZEo6DKwcPZYL3h86ef?=
 =?us-ascii?Q?G/p/fW67Vb+TgEVXQZ77Hp+CqZn1deQAk4mDO/9H0aox9oDr5+/QLIqBwUIG?=
 =?us-ascii?Q?dAkzPYARV53s7OXM/wWxL84ELgzh9Oq+yEgmE6hVDDGk9fAEIV4jYtB1hING?=
 =?us-ascii?Q?TPwQ8LB+Eex7uus/xS0gkzVBtU3WkxG581tL6Yus7HT/cdW6zObjNeNVaEuq?=
 =?us-ascii?Q?YTz7+R0Ynp+4iICX/GDT3tlTxbeczUoUgGQHBpanujVGa0D0q6Q80ZA+gHcy?=
 =?us-ascii?Q?B4xeZjm0ta/oNBh2ig6jKypIDkXEA90WUi6oBwTC8H+zCmToLWSj2B2fjZvB?=
 =?us-ascii?Q?GnGXpN9toXbXQz+UcUx+oO+HpT3Nu3KCn2o6nuTt8i9C96JVPJWXqPoINaP5?=
 =?us-ascii?Q?zsclfg0vdTjbS91OwaXpgz12EtILzXYNvElIEQHVcxgjvTb/iyJY4VQjPv9q?=
 =?us-ascii?Q?KtUFnd6tMjYrCv5Cc0hPX450Rj43zCso5A45I94IIx2lNPcOqhUsE919McZw?=
 =?us-ascii?Q?k3jQTX/QT5V9mxgJigZf9InLCGXN82Dz8C4DnKfZsHvETEgY9WB22nk+fugn?=
 =?us-ascii?Q?phesR2OaDF2QG9jmhGmUAQq8P53HTGTTBCSAhdGJcpkbatKTuPJq4jppqgtq?=
 =?us-ascii?Q?ifcI5ahaKuJkvAhZb10/4dmGp4ajZ1dKnxhPpOoBGS8KSFg0xD2L2HiBauSF?=
 =?us-ascii?Q?P9la4NbB8eCqlqwyYGFHLfbRhEQuzN7BWiqoc2aLOtxJZx7zaWEJkGmxU4n1?=
 =?us-ascii?Q?WT0tjDbQaEtBXgcGDkyBd3qa03AF5eH8byvagIPSwgQXhxkHyyGUpXsT9X+Z?=
 =?us-ascii?Q?dNdsGSXi1RMn/wd3WP7ERJRYHrnYACL8NVremsIFTGODaJ6EbFf9EHh1BZC+?=
 =?us-ascii?Q?+bct7d6Y3e3wlXgyyltEHNIEH79YV69GKDf+bC0PgZeQtdPTTf7wp4Zj0PNe?=
 =?us-ascii?Q?ZYjEVzItriGqA1g2GRbM9sI6fGOeUfqg6qIUvPsDc42p6R1TeMkybXkYCYPN?=
 =?us-ascii?Q?a2pDzIn5DPSdsCqo9AkFwVeN74GvA2yxz3NsnCRkwAbXPUNYdIYxOhLkg6Hz?=
 =?us-ascii?Q?gJ5DwGfzUHSPKcD1O8cQ7ngZeUEnPFLS0FSKmsleZ4BnxWkjZ/UKQLxaDMqs?=
 =?us-ascii?Q?50cBgStVm/xyV+w53axdW7FWm/d3vIcfhPj9tLCP9fNx8x9sH3pKI/Frgqad?=
 =?us-ascii?Q?1yza/Ogj6IldM2wHNluk4mTM1/UvsI+dQyuVB6QTfZyncAWas3ih59T+J+m8?=
 =?us-ascii?Q?USvM8/7QVWyOsFM/MaEM56FDH9iXgS2qkmU7uZsWqObpKaiZWKYcUJ/pQLFc?=
 =?us-ascii?Q?TSBSsOSoIdZpVAZ1U9lNdDfS9fGKREF+rgDOlbOMwckpI8JdabT9ArLjhXVI?=
 =?us-ascii?Q?vp2AWXi82wKKl14A8vXei34kSeRUCfCPjlROqvrUjKvKifFSabRM/IuVg4xo?=
 =?us-ascii?Q?2SYwd469lmW7xS3N32lXanYBM0lp02YGykkTl1e6Rukd9wjREKb3WAYIVYyL?=
 =?us-ascii?Q?At9S669QyWTd9FZQmATYjd3UidagVkE9YdtI0M8ghIpiV6fW6Em2phizDfpm?=
 =?us-ascii?Q?IvVd8Akcvw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ffb479-e839-4367-3208-08de4eb9e012
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:28:57.0912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sHHOgMCli9emlhm2KE/IUoi4pd9OGUohSBwnCY7iY67y/Ga2cYLgWCW2cdVxeHtYlWNvRLcGUxGYvDxDpFHQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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

On Mon, Nov 03, 2025 at 06:06:03PM +0100, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> The above change to the Workqueue API has been introduced by:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> 
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
> 
> The old system_unbound_wq will be kept for a few release cycles.

I'm sorry for the delay here, but could you please refactor this commit
message?

The first part of this commit message is the true justification for your
original work, not for this patch here.

Except for your last phrase, which indicates, some wish of removing
the unbound_wq, it doesn't state clear on why we should change the
unbound per the dfl (default?).

Perhaps the authors of these cases below wanted to be unbound,
but choosing the default will make us to be tied to whatever
default might become in the future.

Right now both unbound and dfl are identical. In the future
you are planning to remove the unbound, but what about the dfl?
Any plans or possible changes? If no change is planned to dfl,
why create default and simply not stay with the unbound one
that is much more clear on its intention?

Thanks,
Rodrigo.

> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 2 +-
>  drivers/gpu/drm/xe/xe_execlist.c    | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 4 ++--
>  drivers/gpu/drm/xe/xe_oa.c          | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c          | 4 ++--
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 203e3038cc81..806335487021 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -362,7 +362,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  
>  	xe_engine_snapshot_capture_for_queue(q);
>  
> -	queue_work(system_unbound_wq, &ss->work);
> +	queue_work(system_dfl_wq, &ss->work);
>  
>  	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>  	dma_fence_end_signalling(cookie);
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f83d421ac9d3..99010709f0d2 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -422,7 +422,7 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
>  static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>  {
>  	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
> -	queue_work(system_unbound_wq, &q->execlist->destroy_async);
> +	queue_work(system_dfl_wq, &q->execlist->destroy_async);
>  }
>  
>  static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 18f6327bf552..bc2ec3603e7b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -543,7 +543,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	spin_lock_irq(&ct->dead.lock);
>  	if (ct->dead.reason) {
>  		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
> -		queue_work(system_unbound_wq, &ct->dead.worker);
> +		queue_work(system_dfl_wq, &ct->dead.worker);
>  	}
>  	spin_unlock_irq(&ct->dead.lock);
>  #endif
> @@ -2186,7 +2186,7 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>  
>  	spin_unlock_irqrestore(&ct->dead.lock, flags);
>  
> -	queue_work(system_unbound_wq, &(ct)->dead.worker);
> +	queue_work(system_dfl_wq, &(ct)->dead.worker);
>  }
>  
>  static void ct_dead_print(struct xe_dead_ct *dead)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a4894eb0d7f3..4e362cd43d51 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -967,7 +967,7 @@ static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
>  
>  	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
> -	queue_delayed_work(system_unbound_wq, &ofence->work,
> +	queue_delayed_work(system_dfl_wq, &ofence->work,
>  			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
>  	dma_fence_put(fence);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 63c65e3d207b..d3a0e0231cd1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1064,7 +1064,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
>  	struct xe_vma *vma = container_of(cb, struct xe_vma, destroy_cb);
>  
>  	INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
> -	queue_work(system_unbound_wq, &vma->destroy_work);
> +	queue_work(system_dfl_wq, &vma->destroy_work);
>  }
>  
>  static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> @@ -1823,7 +1823,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
>  	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
>  
>  	/* To destroy the VM we need to be able to sleep */
> -	queue_work(system_unbound_wq, &vm->destroy_work);
> +	queue_work(system_dfl_wq, &vm->destroy_work);
>  }
>  
>  struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
> -- 
> 2.51.1
> 
