Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA742B585C7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 22:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AAE10E566;
	Mon, 15 Sep 2025 20:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7DFPf5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B751F10E556;
 Mon, 15 Sep 2025 20:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757967278; x=1789503278;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pHf9C2Te4oRJEcV2QYJ6lHDLg8xrIc3bq/vYU6A/ll0=;
 b=i7DFPf5g4FkYb3Lz2EsiXQMsxNdvDC7wySbLO3D6fwuPFujefcJzVqZG
 lGXMLGjZeNS+OhsPObToTeW0eS1FPMDnO27yURRgdj6zgMeMHgc1479YL
 XIPQ2eU/IcsxEdv0AK+eNBgrUyDTaipY4p6HpSVxHvu5ZMhCsLuMki8Lu
 dWNPlRVD9CqBWt0xHme8O1Uv2yamvJEguVP1RYXZpHK8vujTkCZ7nNd1e
 gyBX85ZnXFuYidwysKu028S0GdH7T4zWSzGnreufA1+BGCMH479b7HIV5
 IIWAT+UAW9iWJWN2uWFHkB/U4qhAX7bUgua2YTP9feNQiAbJ7dLikUSu1 g==;
X-CSE-ConnectionGUID: bw6ju1DeSbWQ9gyFxc0+Jw==
X-CSE-MsgGUID: 7V9NQQsVR4qcOvvM/dXhTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60103904"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="60103904"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 13:14:37 -0700
X-CSE-ConnectionGUID: jNVJg0vmQ1a2SF1SJfEc7Q==
X-CSE-MsgGUID: uvaNVA3AQ0eTIwSmJOG2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="205708468"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 13:14:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 13:14:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 13:14:36 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 13:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUW+L9yZotJaULas8oE62Ysd1tbu36n6kubz28Zf0cu210mc8kfFXJwNRXEn2EoYFp3CfjNEPa0Us8oDrjNviVmbhI9fsfeI9bVzXGUI0UJ+uHrH1w5e0R8L+MMPXdW66jUOmUiFWEa31i5pnrOdiFoc7dOSUqrzhcQDbkBnHImkvfD/zdcREYS4IKhP/A28s6TIO6KtihZ6uxviG5pP1Y/YpEvmAypBV2AaAtxwhFMAptW/uL7Cf+ZlxItvhOUgFmzu/2RWi77mLQej4YpW+ri3DJVd5cz1Y+gRALWBay14c8n+hiYL45LdVm5JophKxWav3kfh4xBFwDJdltng6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y0DNh3tjtdEjr9fvckP3cBUoKQaGFftngDyVVKxmMY=;
 b=m85YxVF6qNRSeniY09x9H7ZaWu0ob2M2gfa4mDwnfqyun8JkBHlC4P+JXe9PVpGJkm+aASW48ipC7EqIukWxkHvnxaGIRkJR//OpZXvjp0DRn21YlEywDa6IWvngnsBrfaa0+Z80aPYRX2nydvymOnsLw3EdKMA6fL+GxAbL86j/JQ2mGcm7mbup468pZMai4aTFUNYLWYjwPZVI9wTsW1wowredP2cird3NYzgsCzXLjU9QJFmyRovWnF+JZMEm/+DW9gVZkI13bvNuj+G2IjUgb1486vxI3LUHNYUQQgKSw+kY9funxtICOF2WcZBQzoc+4Gf+n7evEWeJwzrMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPF5DFCDEDFC.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 15 Sep
 2025 20:14:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 20:14:34 +0000
Date: Mon, 15 Sep 2025 16:14:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Ilpo
 =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "=?utf-8?Q?Micha=C5=82?=
 Winiarski" <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, ?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Michael J . Ruhl" <mjruhl@habana.ai>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
Message-ID: <aMhzougLzpfw2wWw@intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
 <b918053f6ac7b4a27148a1cbf10eb8402572c6c9@intel.com>
 <ewypjj64siaswcfvfzgxihwrflb6k6pz2mrfuu4ursdldwnqlm@ignlhd73keck>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ewypjj64siaswcfvfzgxihwrflb6k6pz2mrfuu4ursdldwnqlm@ignlhd73keck>
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPF5DFCDEDFC:EE_
X-MS-Office365-Filtering-Correlation-Id: fcd48488-b216-4dcf-75d2-08ddf4947c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OGMGqsPj3UkXAGJTokDnTl/kyL89o35/jbylSbRNIyjTT4X0tY+21s/pyK?=
 =?iso-8859-1?Q?9GW3FsuFXKW26KPjp5nN7ng/0nFCEpv7+xhM6bXwHAvUBild9ihUbuhzEp?=
 =?iso-8859-1?Q?P9BcGXPkL/ls813J/pU4Ya17g7hmOSSAB3qZ8EQlKO2WiF1DK3gJQYrNaj?=
 =?iso-8859-1?Q?MPGbSM224FQt9vZWSr3i6KGAIClIxk3tqRakIbJfvJG9Quhd6a8vTiu+tr?=
 =?iso-8859-1?Q?qTHXANBaiaYtsrHJdz/kPA8VQjVQBmUpdnN8C+4xW+s/+SMO3M42/rtJv3?=
 =?iso-8859-1?Q?9uwl1rLl0gGag6nhUsNm4om4cQCA5b+fkd87gy++YzQbut+IPlblO+RwyW?=
 =?iso-8859-1?Q?ZVxN8ikOtMG/D1soSMCFbTl1Ooc2XmPrTIU/OtkDPTmgpPhVvtDRXm6epn?=
 =?iso-8859-1?Q?KRjx33K6rhEEVTK74ns6BrfzvUwc6Ao2xqZWRmdEMc6kqPiw/akuaHVHCe?=
 =?iso-8859-1?Q?O7EgvPsLf14L0VZJJ8XxyCRELbQ2bv7l5iujA5hnD0UTkaKh08TCJV3y5t?=
 =?iso-8859-1?Q?ElXl7FApcj5j2WhBDQrd0zSCfFpdNIJAehxxkG/egss1ygKk7Nz0KN6YtA?=
 =?iso-8859-1?Q?8N4jRO+UDMuvqyeTwckOmwoVkodQNjtDbhgUb5zFkKCLmWLKwZeanwPG6D?=
 =?iso-8859-1?Q?5LYkV3d0jQ5xUp4Ps57lMbBmtgiY2TBITp+myE2HzLCSGkr19avK/62Kcg?=
 =?iso-8859-1?Q?85CC4tItbcl5eWbxzrRj+KUkOVYzYLV8r9kbwrHXun5r6gLPcwHSDCmdZw?=
 =?iso-8859-1?Q?qCHZhmnl3ohOgUoFhg0Q8RvxHqK9rRiq/Qa12NhTD3lZxrXJszLr0mq4Kl?=
 =?iso-8859-1?Q?KWi4P/amf2i4prhww/oUNDWyOPd5wNaakEVzX/XPYL0mfhVRAva0KHFl6E?=
 =?iso-8859-1?Q?EtW3TA7LPcagXejQs//qlkYjJjZP0RIqZUSGLSKT8Bzv/qv0Vzipdcn2oh?=
 =?iso-8859-1?Q?dnqlt0FwNV2YzfxXtrragZ/T8M6NYPRDGgxbeyPboNwtEEQpjLf8MQkJpp?=
 =?iso-8859-1?Q?dK/bod/BdQjx+5hv3Q/B6+P+82b7yED9kq4iyde8Wcf3Bt6HI2LYQXpHV7?=
 =?iso-8859-1?Q?+vQDm4YQ9IME1abT+lcOW2vRE2yI3bxPzYO5Sp0DnJV4YKOw1wqNhQMVMi?=
 =?iso-8859-1?Q?ANUgnjtNuyge4zw5EXyFgV78Nzsi8sSBC+xJEg2wS3PUTYI5mlMN5t5MNE?=
 =?iso-8859-1?Q?soP0zbT080fET8MG1k78gkg5PNm1DVLhwSI2v6uVRfvqczqd5KSfX/l+nI?=
 =?iso-8859-1?Q?t7esYGhQ1J4o6kHpIeTZ9KZRgiYF0C3EKa1l9eWXB3fOApIxslq5JSIV5O?=
 =?iso-8859-1?Q?MCKjAAueK3bLz6a/5c90TnETHDd843ES78+ESfIjlwNz7q4K5n+TrYXLa5?=
 =?iso-8859-1?Q?1kEddYzLp49ma209F+CSg+Z9tjx8RoVxEVoVp7/JKTGAY1NYFEpwHdkKhM?=
 =?iso-8859-1?Q?RO6t0IHy2g5gHSwf4FJlELVKvJnlpZ+XdNw03cwdlgvjfC1ls1euNtYjGJ?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?p+PpOtpUIneIZzVQdvibmvAcz9rJBYqZ0LuTbH64NVCLuvW61We34LfaY0?=
 =?iso-8859-1?Q?Xy4k7LWZExYmaDLLpxJzCDimFROjRqEhMbLkffWYjrNOPYWoB2f08w0pJm?=
 =?iso-8859-1?Q?EEunigPDeL7Y9I3bd6ladi4sXsqmgIOim1CCCUrQeuR6u0jtxH4TGuv6NI?=
 =?iso-8859-1?Q?1lMmFtrGPnV52rjXEUw8dM8E4jBf/OlYyvq9l69biUwuE+17xwHsjJqDVM?=
 =?iso-8859-1?Q?jHzZnMXB2uPLuILhGRo+/nUlopYvCmSDzgzkeBr23bATGaiA6ZGb5NEcKA?=
 =?iso-8859-1?Q?fL/irrMqMXKGdqUxbqwpWQs+QxonN6qoc4q7WCls6+K9eS5hSmWuGXTW7s?=
 =?iso-8859-1?Q?HFB1AIOjvdr2YK4BE8rmFqQco3W8S/lysEPsyrGweHmV8oIilC6FjJ/MN9?=
 =?iso-8859-1?Q?ELnCWUrTH5PJG6mCdvMY50gBWLlROQqrQycReGIVdJIs9TTqhIxgNphfz/?=
 =?iso-8859-1?Q?AkQSkQogWENZu3ZBkP3s+QP4RwjEJI6rBH7Ps+sB4pIBn9l5127LEOwTWl?=
 =?iso-8859-1?Q?5EcBRbzVm2eipnJVwGZOUKjHVS+vH6QKTdv8oheQloNp4BYjzV7yjQww2+?=
 =?iso-8859-1?Q?igW+ZyHRCtSfOXDeJHPReJZGAIt46Dwv3Ey0JjJUFmc43icSimhG1jmpdY?=
 =?iso-8859-1?Q?tB6Vykv+eHclZZSRoLPGcr5guUEzJ/rmWHh4tuoeTnybCqx4Tnhj/bdSAm?=
 =?iso-8859-1?Q?eEhjgZ6WcAEb6QqF5MCeg6HO7HpML80TSyokGbhVqcB1JBf1E7canyTst2?=
 =?iso-8859-1?Q?ZUAss0t10AvEIUms1Y+9sc+uvj2P+zye0nhozkuTd45Nkd1lEeY81cQj+f?=
 =?iso-8859-1?Q?hwCkfefWJvaFGC9z1+xfuW2sSk39ucFxhaIjRQ1iKGEsWtVJ2hjcbDdsO8?=
 =?iso-8859-1?Q?UcfxkpNVB66FddU2Ipw3EEhV6mHyAla9jxYWJE6LHwv00nAhgViAqu7K+d?=
 =?iso-8859-1?Q?euFdz8GrrjtcjuOWCtlk+ZphCwtDtVZnQ3mterENUqUVpbaT+pjdZzsJsO?=
 =?iso-8859-1?Q?VeNxTlEZesOcNmxpAHbJCDPn/tsZ0MKeoorFtFQVq+7uq/LpcRbbBriUcU?=
 =?iso-8859-1?Q?ds7YJNpkFvNBOVB+xbkSfdeuvYqLOlRzN2q+yjPCnonhEOlFrkwjuVFQq8?=
 =?iso-8859-1?Q?qlUwSvczLMmqoFyr90aTKyl0XmyO8NYv9ALo+2KVPrNzoLgf9xk6CG/uwz?=
 =?iso-8859-1?Q?c9NEnHqHmy0i44/krB0AkWT0OKx5xXRlOaYnF9LIDX7LK1qWupNYbtqo/e?=
 =?iso-8859-1?Q?Ex6H0jARDnJGe3N92/y+qCl8Zuu0+bx7vwyxJOK0y5iRSU2+MfAO9kDYRc?=
 =?iso-8859-1?Q?ikgEb3gG3K1Cbj3bs/A5DgnB/kPN+ipQ9g371767uzy0RL9kNf3cs0jYgT?=
 =?iso-8859-1?Q?D/LpIjno5jv3wBmoiLvhRkj4OquGzZkiFTML1KpNG6RoiufI4lX+tsN/6s?=
 =?iso-8859-1?Q?H0zGuXMw4CYwEC1jhu1p1/CtsWzmpwL50jMefh1EgvUb5MgApjaX4HE7LT?=
 =?iso-8859-1?Q?i8gvp5Ox9X/KHZslmOCyjnKk1HsqiR+CluK4BmAMxJmxuoCtx/qHwitnZC?=
 =?iso-8859-1?Q?vdt04vcIufI8SIB/cYh1s5BqAnJA/05xmm/sF3cTHuqdMAdT9tnkL/BXV5?=
 =?iso-8859-1?Q?znqnBygVWraisuAgBqSeiw0HYUjUEfFJ5le+8VOa+mxNqlZujfSnZ+rA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd48488-b216-4dcf-75d2-08ddf4947c73
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 20:14:34.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6ecu9lSKLIgEqr4yy97Vkih3w/Tu1LeaAR78KEH5gIWccRtE8DHJ7yAOa5c5mNFcwI+NfN/wtT1/1s37TFmhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5DFCDEDFC
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

On Mon, Sep 15, 2025 at 07:24:10PM +0200, Andi Shyti wrote:
> Hi,
> 
> On Mon, Sep 15, 2025 at 03:42:23PM +0300, Jani Nikula wrote:
> > On Mon, 15 Sep 2025, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > > PCI core provides pci_rebar_size_supported() that helps in checking if
> > > a BAR Size is supported for the BAR or not. Use it in
> > > i915_resize_lmem_bar() to simplify code.
> > >
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > Acked-by: Christian König <christian.koenig@amd.com>
> > 
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> > 
> > and
> > 
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> Just for some random noise on commit log's bureaucracy: why do we
> need both Ack and R-b? I think R-b covers Ack making it
> redundant. Right?

reviewed-by is a more formal attestation of the entries in the
submitting-patches doc, saying that he carefully reviewed the work.

acked by is to state that from the maintainer perspective of that file
the file can be merged through any tree.

in the drm trees nowdays our tooling is enforcing acked-by tag if
the patch is touching domains outside that drm branch itself.

if a committer tries to push a patch without ack from the maintainer
of that domain it will be blocked.

So I believe it is a good idea to keep a separation of the meaning.
Carrying a technical review of the patch in question doesn't necessarily
mean that you, as maintainer, is okay of getting that patch merged
through other trees.

> 
> Andi
