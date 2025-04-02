Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A65A790CB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 16:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F23910E7E1;
	Wed,  2 Apr 2025 14:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fwV5zfUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1980610E7DA;
 Wed,  2 Apr 2025 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743603126; x=1775139126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Nv+UfiYi334Vj2bEklwc7omGZtO8waKDPtZmnD/hEhw=;
 b=fwV5zfUIoEd+CanWiz+AUu5/kQVbYWn9qK2SAVKA4w2cvD48h/ytO7Ha
 yNLYOLZqSVtElRpAbwaQIwXs9ar/jflykL9pTLUUbCiLuCnMFklAm2MCO
 mjuF+PBHWOy2Ls5HYDp2waNI3gdgoBuHKMUMvxUKBMgGQddSCiozVse8y
 2qzoIEwcvODvhqNoWkw/vTSoj5Qf3zgSPXeLrgw4iisS0U9bPYA6Lurt9
 UMXft2FFuNzvee7KeFKv+sF0X/3YEgJG/bwvp3TgyQXVaMe1j6Xg8E1mj
 aeXPa85202aa5AXt0BwMgQWTJ4aCV6wE8toauDmTEtMIc/u1zhMUiO2ZH w==;
X-CSE-ConnectionGUID: T4ci6P9pRBeCfQK9XUxUpA==
X-CSE-MsgGUID: v67HtnL7Q2urE2fIvl/jmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44677139"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44677139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:04 -0700
X-CSE-ConnectionGUID: O86ujsA0SFiARd9S4Ltt1g==
X-CSE-MsgGUID: dzmy1acqSq2IXw8IUVwb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127620415"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 07:12:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 07:12:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 07:12:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 07:12:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMZMj2zneIZoT+t4ZDXQj7HXhkgCG/dTWl1e1O6ZEKDXI5H3HqeHmzc6tb0sqrOL4UAlHBbq+G+XKAIHaPMCD7SMD8IhmitfgbDQe96KJGyIpJvs6NUy2Atzuc9/1kVwDR5yts7i82VCUhe5HhiqraqriXC2XOoXu0ipqjQZ7FTvninzf5jRrgZMjI5VfXm1ZY0DVyNp9FA1MLrjx4YzIFV23bKdAFnPhdaNOxwhElrao7SkJy8uxQvWj35138A6B5ZTSE2X3BZx4slbQWErpD+ITqfSUEof3zitJYgqnSkfM2B0JGwJ3TXqQ6WzruK3sijO9T7YDcGG+D7/HqRjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfGxvsJ/e+JrR6SZ0zItm7bxN5WZZg32/gGWH4KsMAQ=;
 b=B1WM+pQglIB+jmE1VrACL7tW2i+fwcL+P8xElwUUejLz67xP7cfQKZDu2DpWXO6mzdxlB5T/Ms656BKzlc778U1au30gVf5qICsX2Stu5QaFXgk8YS+5gAZGfOob5NpORlA1fHg0JfdF/43PYZsSPtstTMt6jPECy17Ys6HaAzwklfXuxLwQYtKJ9/lzc8S6KxEI8PQz+w4DVxF1g1vs6MPslAvnOC5nE3/IEiVLe4YXs/eYruzYJCevM1nff+Lcm/wlOAEVHkEQwkNZ0uJ3PcLnD8RPj8G1vIvoxn9xqmOTjIViNqd+EqX5r2/YbfogoGhV1W4PkVxdYW3w1vV/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Wed, 2 Apr
 2025 14:11:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 14:11:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v7 2/6] PCI: Add a helper to convert between VF BAR number and
 IOV resource
Date: Wed, 2 Apr 2025 16:11:18 +0200
Message-ID: <20250402141122.2818478-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402141122.2818478-1-michal.winiarski@intel.com>
References: <20250402141122.2818478-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c8a69d-f97d-4f38-820e-08dd71f04bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXFyVXRsY1diVTdIcHBaWk9PTG1wMUR5WUQ0ZmEzNWQ2UEkrZGtTYzYwU1l2?=
 =?utf-8?B?K0M3UGE1eGZhOTVpSUFsQ2NYVUdGWkR2SUQycFpjeXM2T3ZvNmdqRVhsYWpE?=
 =?utf-8?B?VUZQUTdIOWw1RndRYlhFaVN5YXBuWWNwdGFpQnFwem9YQVQ3QS9sZU1QMzly?=
 =?utf-8?B?c1B1a1g4SURmZFBoNzZVTmIrTHVrN1lnbitMSENLL0R4bmpJUnR0QVJtUVFS?=
 =?utf-8?B?RDJmM1pFKzkrUzEwclp1TzNoaEFBTCtXWitHZkZzVlRGUndUNVh4cHQ1RTVz?=
 =?utf-8?B?MEhwNGNCS1ZSN043bE9hYVA3ZmZ0YzNIUUs4TnZ4aFlHbWVCOFJxb0RXRWFD?=
 =?utf-8?B?NEdjVFNuRm1DSnoyTWdYeU9HTytwUmxVbTdBdE45RWhXR2tEOHhPQlpEeW1Q?=
 =?utf-8?B?VENZT043M1VpTHFwVVJwMnRJZHFwUGZOaXY1WFZUdSs5SXV0dDBNdlRlbGxN?=
 =?utf-8?B?a1pJNUZXSjJqNkVUK0M4bFZEb0ZIamZscGVWS1dCWFppNU5GTVh4ZTVFY29v?=
 =?utf-8?B?VG5teWd4djJPWkhoRllFWVFqNGhvbWhxS3lLK1crMWsyS09Nbm90UVJYYmpU?=
 =?utf-8?B?dmk5cW9wZjQ5bEZGd2I5RzZxcHdFUDI0TkNIL2JlbDBhYjg0ZlBIMUpHTEYv?=
 =?utf-8?B?YW95eSsxQzhzNXREdmo0MEd3RGQvNTk1dnJRa2h6bW9VN0w4a2pHRUlGdlFu?=
 =?utf-8?B?TFZGUWF0MU9NSjd0Tmk3Um01UEhvNlRqT0J2WmlyRXZ1eEl6MktOTTkvNDZF?=
 =?utf-8?B?a0ZPeXBOYzd5N1VRRGVrTFNBRXcwWjJUclEyNk5hUHEwQzZOZmwzNUFzYVFO?=
 =?utf-8?B?VDZrNkQyMGRzSFNqSEdNTW9PZk9IOFVtNmNDK283MERDT01qUjNqNjRxcW0x?=
 =?utf-8?B?WjkxcjVsNHhQeGU0RmplQUdHaTFhWTRTSmNIYXdCZDhnNHUvaklzcUZRRmhx?=
 =?utf-8?B?QkJpa2M0MTVBU1JEZ2FUY2ZjL2hHYjBuUkFIeGdVVTZGVFNWOWlEN2Uxbzg4?=
 =?utf-8?B?NE9ldWxvL1NxaUlpallFVlpyWGRsOExqdEcwR1NydnR2ZHZqKzdIRVd4K3Vl?=
 =?utf-8?B?Vmk2czdlOFpQY1YxRWZpaFlydzRqM3Z0RnRybjQ5c0REWkluR1h6SGRiMEFw?=
 =?utf-8?B?STBYaXc0c2JKK0lubC91czIxaXlKK29nWWZzemErVlJIVEtaQVhsTXlyeG50?=
 =?utf-8?B?ME5lRHUydk5mQ0V4QUhJS25kR1g3Q2doVkJqSjQ5YjFnUzFPVVpRemRXZlla?=
 =?utf-8?B?dUNBTDBBTDFMaStvMUNKdjl2OVdHS3pJS1czcytTaFN3TUdaaGZtMmVCWmlp?=
 =?utf-8?B?QjdieEFMR05kOHl5S1JOandUd0xHOXFSbiswUzVFYlhKRkNvL2djeUwxS2hK?=
 =?utf-8?B?RUlXVUs1WSt4OTltYXd1SDRrcWg3cUtVTTFCTFh6a0hWM3V2UGpyRzNWU0pK?=
 =?utf-8?B?ck0vVCs3QmJxQUxwV3pwZ0dMRG9KbzVYcmRZZ2Y2WlFjeGhFOE9yeFF3dnMv?=
 =?utf-8?B?aEdhUjVtbGszVS9XcGpMbHZvWFJlUTN0c3BHRkdDV1ovU3hrWXhXbjhCL3lU?=
 =?utf-8?B?TURyUDRhaS9DN0ViUElNOWNlVm9YNkRaODhnb1FZelFBcHIwQm1hYUJENG0w?=
 =?utf-8?B?OWJIRi9QTElpa2tTS2phb2tibjIwNld2SUlZeHRJa1BQcXY4aUxzL09HVDBZ?=
 =?utf-8?B?OHdYMThMRnphU203c1prSDR6cE9ZOVNVTGl3bC95eFAwSXZSZ01rZWNTN0g2?=
 =?utf-8?B?Z3dvR1NMUE85djhVMjNRMkFIUkM2TUxKWnBUM2U1VXBiWE5PRWhHQXRRMmVz?=
 =?utf-8?B?OGR5c3NGL1JLTzIzdzFJSEdnaEJNb085elFzdXNjN2xWdFgyOWpjeW9veHM3?=
 =?utf-8?Q?tL49RiGcOI6lY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWx6Y0R0MnJ5TGMyeFBrQ3Zyd0dGS1FESW5rVjdES2QvZkdMVERXc0xSQ0hP?=
 =?utf-8?B?WkphUnRnT2JBYldRVVZ5bG9PaHFwTlBJTmRoK1RTYTZtSjNEcFUzbmJ2bGpW?=
 =?utf-8?B?b0tmSDB1Vkwrd0Rmc0ZleE9iakVyS0NsOUpUcGVLeVNITWdBVG9Ma2dBYUx3?=
 =?utf-8?B?eHFJci9IS2E4eDZYVzYvUGpIUTllVzVGbjl2Q0ZWWG9SNk5FcVRaVitCTSt3?=
 =?utf-8?B?OUw4blo4bFpmQVZqTk0yOHhVSU52YWROWklmeERZai9mTnBkWUZ0V1IyT2ln?=
 =?utf-8?B?UHJURVlJNjNjMHJSbU91Rk5IK2Q2NlBCSS9mQTJwWWVncW5RTHRVUEwrUzRW?=
 =?utf-8?B?UVMwc0l5anNxNEp1aXFNVHBuR0N4cys4a2NkQlA1K3NPcmdqc2J5ZUYxMkI0?=
 =?utf-8?B?dzlSbjd2NTl3MDkyeGdZVmhsMU5hUlNkaXJMM2VsWlBwSWV5SDhIeitTVEVV?=
 =?utf-8?B?WlNXaEc3eW56ZWJZVFlYczYvaVBoL2lSOGhMbFBMTXUvaUtOM1NKdGFtdEZB?=
 =?utf-8?B?VURwYlQrRFk1am11dXNUbUE5THpSZUpZSFZlNWtvTENDdWtnV2RBcXpMdDZN?=
 =?utf-8?B?TjZYUzd1NnluYUJvMDBZSXVSM1ZSU0NHM20xSlhCbXg4NFdWenVTNWNQQ2tj?=
 =?utf-8?B?ZlVxYnZ6OGt0a0FyOHhUM2Q1WHRoNUcyVHhzU1RnMG9PbHI2U2JicHdLVUFr?=
 =?utf-8?B?QUhhK2NVL3pBVXVLRnhpMGJFK3RnUTJOOXNDRThRL2pRdlVhdTFRc2puZDhQ?=
 =?utf-8?B?d1RTT0drQTBWSVg1cnMxV09JdEcycXRtR0FsQXU2SG5SYXBTZnhyZVNIRElU?=
 =?utf-8?B?Qmd3Uk1KZ0NncEhKa2xNYXlnTzRraXI4azdZeVdqOHMrbkVmWXk4aExtY1BL?=
 =?utf-8?B?Rk9CL05OelhwS1dPTFBCNkFLVWJOVzlxTnNFY1hwMzNWRzU2d1I1ZGJ0RGRi?=
 =?utf-8?B?aHJETzI0TnRqMVlMUnEzcmJ1a29HNklEUmR5aVZKUnhSbmloVGhVd25SSFgr?=
 =?utf-8?B?c0FsekpXSVZldGhSRm54aERRNHhxbnhYRFZBbUtDb3RhODIxaWtnTHBYYU12?=
 =?utf-8?B?WVprT3N5VjFmNWxuOGdadzloZXdEL2RsQ1pUK0tNRXY5U0JYaUVUSXRPMThG?=
 =?utf-8?B?T0EzdGJJczdCNVZrZk5YSTZHSG1zOXZrNTVVT21UUHIxYUtVYjk1VlJwZnZL?=
 =?utf-8?B?REJwS3YwTElwYVZqOFRoUElVVlZ0UkdoU2RjclAwdHFuMktVNkhidkhqRzU4?=
 =?utf-8?B?T2Q0UTFQS3h4SFdvL1F0SjNIMU56MUI3OHBKaDNsUlBOY3plTEc1TG9zSWE3?=
 =?utf-8?B?Qm9uRDNoK3Z5U1VvVUhENjhJbnE2UE5BRzRMakhjRG51WGJlcmdXUnI0Sncz?=
 =?utf-8?B?ZEJZQXFPY2plZjl2L2hvU0VPNHZQUERuUU9NSUI0YnpUZHF0S09nWmFKVEh6?=
 =?utf-8?B?UlYzdHZpcE1HdDY3S3lRbDhGNElSZ0VDNXRrZERpTGdXQnVsd25CTkxHRmNn?=
 =?utf-8?B?SmoxUGthTlRwYzhCVXdvRzVHNDQ3WmQwMWZuZTJvZDlHNmtrRThDbnFpSnln?=
 =?utf-8?B?TU0rTW9tMzhiMDdZKzZNRFZDOVp5OTcyMFVGVUVrWndrUEl5RlZWOTU1UEw3?=
 =?utf-8?B?ZktaOE9LRXFCcVRZZTJnK3Y5ZUtGc25telkzTk4rVGpQUkFOak1zbGZ4MGVU?=
 =?utf-8?B?TWR1UmlLY2dBT0NlZjEyYlpVeDJWdERxdVJ2SE5JYnBjMHFwUzNmVFBsMjVh?=
 =?utf-8?B?amJNSVF6b0hYWGNVUzdNMndYRENZSEhSWDlpSkJ2Q3ZtYnpJUWN5R3FxMlp0?=
 =?utf-8?B?V1QwcFNJWWhxbW5LZXBISHljbDVhaDk5c1M0NG8rZFVZSFl2RWp2MmVOR28z?=
 =?utf-8?B?bk1WOTczWVIvU3hhbVVnWjl2ODJOajRZcFlvaWdZMGFDUmorY285YnJOYlYw?=
 =?utf-8?B?OXgxdXVxNTV4OHhsQTBrK080UFFtNUlVc2Z3cFRQYzVkcThPZzUyaWF5Z3dF?=
 =?utf-8?B?K21icy9KVDN1UUU3QzdmS2FZZ1hoaTJ4OGN6enFnSlN1V2ZXeWNMMjQ4NHBM?=
 =?utf-8?B?enV0bHliblNwU05oNjV4NUJwSlJHS3VVQlBDaFRKaXV2a3I2M3Y0Y1Q1L0Iy?=
 =?utf-8?B?SzU2a0puRlhGZ25mTEFGbWdLdXlnd2tzbmQvNW1UN0IybjdVRnNxNVBBd0Q1?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c8a69d-f97d-4f38-820e-08dd71f04bac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:11:43.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lS6gXxDbDo3onBE/Pbb/HeFbJUjgcyrRI8D4sO8rtNJEaEiXQqmHPyL+yWvLaILiLQ3YCh7jOqTpjoDi0v5iaYMsg3NSvRoCPy2rmoK7JFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

There are multiple places where conversions between IOV resources and
corresponding VF BAR numbers are done.

Extract the logic to pci_resource_num_from_vf_bar() and
pci_resource_num_to_vf_bar() helpers.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/pci/iov.c       | 26 ++++++++++++++++----------
 drivers/pci/pci.h       | 19 +++++++++++++++++++
 drivers/pci/setup-bus.c |  3 ++-
 3 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 8bdc0829f847b..3d5da055c3dc1 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	if (!dev->is_physfn)
 		return 0;
 
-	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
+	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
 static void pci_read_vf_config_common(struct pci_dev *virtfn)
@@ -342,12 +342,14 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
 	virtfn->multifunction = 0;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
 		if (!res->parent)
 			continue;
 		virtfn->resource[i].name = pci_name(virtfn);
 		virtfn->resource[i].flags = res->flags;
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		size = pci_iov_resource_size(dev, idx);
 		resource_set_range(&virtfn->resource[i],
 				   res->start + size * id, size);
 		rc = request_resource(res, &virtfn->resource[i]);
@@ -644,8 +646,10 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		bars |= (1 << (i + PCI_IOV_RESOURCES));
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		bars |= (1 << idx);
+		res = &dev->resource[idx];
 		if (res->parent)
 			nres++;
 	}
@@ -811,8 +815,10 @@ static int sriov_init(struct pci_dev *dev, int pos)
 
 	nres = 0;
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
+		int idx = pci_resource_num_from_vf_bar(i);
+
+		res = &dev->resource[idx];
+		res_name = pci_resource_name(dev, idx);
 
 		/*
 		 * If it is already FIXED, don't change it, something
@@ -871,7 +877,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 	dev->is_physfn = 0;
 failed:
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		res = &dev->resource[pci_resource_num_from_vf_bar(i)];
 		res->flags = 0;
 	}
 
@@ -933,7 +939,7 @@ static void sriov_restore_state(struct pci_dev *dev)
 	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
+		pci_update_resource(dev, pci_resource_num_from_vf_bar(i));
 
 	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
 	pci_iov_set_numvfs(dev, iov->num_VFs);
@@ -999,7 +1005,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
 {
 	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
 	struct resource *res = pci_resource_n(dev, resno);
-	int vf_bar = resno - PCI_IOV_RESOURCES;
+	int vf_bar = pci_resource_num_to_vf_bar(resno);
 	struct pci_bus_region region;
 	u16 cmd;
 	u32 new;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index adc54bb2c8b34..f44840ee3c327 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -693,6 +693,15 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	return resno + PCI_IOV_RESOURCES;
+}
+
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	return resno - PCI_IOV_RESOURCES;
+}
 extern const struct attribute_group sriov_pf_dev_attr_group;
 extern const struct attribute_group sriov_vf_dev_attr_group;
 #else
@@ -717,6 +726,16 @@ static inline bool pci_resource_is_iov(int resno)
 {
 	return false;
 }
+static inline int pci_resource_num_from_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
+static inline int pci_resource_num_to_vf_bar(int resno)
+{
+	WARN_ON_ONCE(1);
+	return -ENODEV;
+}
 #endif /* CONFIG_PCI_IOV */
 
 #ifdef CONFIG_PCIE_TPH
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 54d6f4fa3ce16..281121449fc0b 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1885,7 +1885,8 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
 	bool *unassigned = data;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
+		int idx = pci_resource_num_from_vf_bar(i);
+		struct resource *r = &dev->resource[idx];
 		struct pci_bus_region region;
 
 		/* Not assigned or rejected by kernel? */
-- 
2.49.0

