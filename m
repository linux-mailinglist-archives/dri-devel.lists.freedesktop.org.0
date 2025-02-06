Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1144A2ADE1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 17:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFB610E8C4;
	Thu,  6 Feb 2025 16:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEW1T7v7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190B110E8C4;
 Thu,  6 Feb 2025 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738859670; x=1770395670;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c0bmeImyveGyvN0PiYS67PZbWH8pzQa5oIGKmJMtQvg=;
 b=QEW1T7v7FrBOhu6+4Q5c6LXU1I8icQfT7Q2jIELPOpGNeuonID2u9GMA
 4qSQSAqx8V53LlloQgye6pmxk/w8tnO0zbPKwx0y039FH31zLYeGLTHTG
 SEL+4U3+zmBT//T6Im8Se/vBbvljygqrR8OD9jAlyiwJ1IL8pTne0N8Gp
 Rz3seiGpJb7FAWlyrswu+jhmtqvmrajOoXxHGMJ9x247s+igt0JUn0onB
 lA2csMrW5k/m0VpDv/sAMNgEzGTnHeWpdICAgz1zHvj3wPKtgL9YM9hXU
 8VMwCuXuVx5DUYb70jtoke/YXphxc7R5QhnyjROBoE0Lwti7Qk+fvmsOY g==;
X-CSE-ConnectionGUID: sF/1Hq+lQsm58NBV8yW5ug==
X-CSE-MsgGUID: vUkP+Gd8Q0uBvnEoctFyww==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43134058"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43134058"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 08:34:29 -0800
X-CSE-ConnectionGUID: KBiLpawtRjG6hdYKOQeFAw==
X-CSE-MsgGUID: iCRGTxyTSXKHQS8FfQOZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="116249883"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 08:34:28 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 08:34:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 08:34:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 08:34:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxQD0hDvpdSo9Ix4hJq/7TRmw1HY76T6WBIkrAux2WTtMC5Nd89KsTyuGILMphPcbbw5cYgIfPH2jkMCCcPDOYUpDX96eJfZlGJCR45UaKCMy8m0IJwK6BwyjGHCy0JhX7sZpFYcn9Zz75PD1mEh5whIR93ZogL1vrNSairZ2bk+85RuaaAs3ngquIEUr+frGbgDIyGlyESiksQ7m0fjwoZdTJim6H2UOslvh8DFTPqTXG1SqlH+BP+HnayPqzX2+uHpA8hcf1F6gfrV9YY9cW7Sr76N8Qtz/uXW9ujXZ5J97AUlt+5t27y5D1C6qcBpFMYF8ARGm0Gvy+C4OWc0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiOL5RWRrX1lhmUvYZY9+GY4cNuBgG2Ywd+qbm/Y0s0=;
 b=gWFrNj5AwJs4aXgKCkzcdrnjTo2QdJ659EOQg7ZS7h5eLXor+dpsOCe7LkZSukHDEbFOB3YMubf1hNXoXwWNSgB19NSmftK4aRJccmKw5QSpjA/NWCzQe644RrSTB1ZBlbHKRPzDq4Fe9o8VuBP86oEyQAi9phqYIH23cjo5aDGN4/Bhb+qXc75yIOODzDmke+pcVenBJFBx2YpQqikU9jw6d76EjwXBy6j8ApiujFkc/Yl39M+WlLFPPAndngW5DFLZG96keDmjCXWAyVJo1dRRCUjxJa96v1WerV7IW60zNqY/t6nKfZoAyUZw88ZJazmzy7JTd8ENVcFpeJz8BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7725.namprd11.prod.outlook.com (2603:10b6:208:3fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 16:33:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%3]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 16:33:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Fix uninitialized pointer read in
 xe_vm_bind_kernel_bo
Thread-Topic: [PATCH] drm/xe: Fix uninitialized pointer read in
 xe_vm_bind_kernel_bo
Thread-Index: AQHbeK5Zcn4m+kCFCUqJxTJpOsnsxrM6eDGg
Date: Thu, 6 Feb 2025 16:33:43 +0000
Message-ID: <CH0PR11MB5444102E18D922D2FF328077E5F62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
In-Reply-To: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7725:EE_
x-ms-office365-filtering-correlation-id: 58991fd3-808b-41be-e884-08dd46cc0575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9AIhIjNciL154dcFGVOA9A9fttji0QdDLLoOS0S9TdZNd31ggqj8ElROuWtB?=
 =?us-ascii?Q?N60o+ejvgU3hTK1qwCAT1vrbCKUTVky0IHpeW0Zb0OM2vzomrupiZo8Xg+Z6?=
 =?us-ascii?Q?7TM3KlHWOtufxtrvMaKH8l1jkOw/Aj51t8vm0inX+f0hGXQLXDE8RwqXYSmd?=
 =?us-ascii?Q?/mhX22SmPx9S5mdt1evX04DsYXZs01t/hMFimHY87597r4qsYAQXRPD2eLaM?=
 =?us-ascii?Q?8Jj92U/YBs7wMz7yYd1RdvabbnsEP3klbUnAVj0MlFnHXO1kdqQm3Aj7+9n+?=
 =?us-ascii?Q?47qKd69uJX2vUve9Vmk8oUtej60ezQzDAc7bWNlkYQi9yB09aRGYzY6DmCX3?=
 =?us-ascii?Q?1yQL965ShGZQQ796b3B0Go9EuFWWQH8dsd97zhjyMKVY4CVQ4UHhohmc7Q9g?=
 =?us-ascii?Q?Kd5Sf9E5fzXy0xhhyE4/qB3K8eYYCr/X4WuOlDb+yPiwZidvRNwx8gPHvpj6?=
 =?us-ascii?Q?DMeIy/P5KGFnhuis1tc7nplbJZ7RoDWEsTqClodH44x/ywRT47xArmhlABHk?=
 =?us-ascii?Q?MLoeM4GgW2GEWQ1EhLJQ5wNiJeJ0rry4tgznG1OOOZAMJA9qjhuvSVVx/52V?=
 =?us-ascii?Q?yhbVtTICVLNzVdV7w1YWMXbszKUL1rU9K8KSm9xBK2IiNutllc7dWGqfJnf/?=
 =?us-ascii?Q?Qdqgt8p4UiDkIrpjQ1FP3uvnEBazPSBtSXkFtWdyu8AdOb0X7EzfxLvwMi+O?=
 =?us-ascii?Q?vvkhJ46iLx63hrw5Rrc4W1B7KIRMSTSMW0U8tqhnsFIJ8ybET5pMKsPgrBwF?=
 =?us-ascii?Q?0WSr6sRX814EH0E83Vo1Tx1GTST/Ko/X19F7GcdwTRdaq1HwyUMCAx8Nz9eg?=
 =?us-ascii?Q?9Sil3bzjgNHmMA46RezBLNFbB3mjncpDKj9NghM2A6jCovy6loxvkS9acK4K?=
 =?us-ascii?Q?K88L1MIgimnvrZdMYYvx4i5ey3J9glpLm2tXil8t7dAwpUMh6o3O6m9fLidL?=
 =?us-ascii?Q?i2pv8542tpmzl35r3zL3SCyuDiDETzSgc8M+lMpfqtaJtpgYp0xGT8nEkOXg?=
 =?us-ascii?Q?yv0Fa/osJQzaudcM8OfK//kTSc4s7XLtT/YvOXQU3Q2mh824G114+iKVu3L/?=
 =?us-ascii?Q?wDVrejxMiR/Ch2kmuDTKzrwxn7y1FiVRmcOXv7ybixu2Qx1XDxjC/0hqPJDq?=
 =?us-ascii?Q?UZGtYSvOblV3nQJspUJ0W/UIJkULOwR69fBKzHD3/v68Cx2LrifhnluId2kd?=
 =?us-ascii?Q?AmhuFJexOrthAXd6ch/TKd6x1IrQRbb7WBJZhzM4ZK1WF1petRxQBsKaWVdx?=
 =?us-ascii?Q?MQc3KwgKpIjus/cdjtTg1og9CXVQdHTTO5y1sSZ6Uqh7LNjGXfMJK4fPFtkd?=
 =?us-ascii?Q?6MqvMqP7dp6P0zT2w8fIzFYEkJLW9n9n/5qeqEmi04FwA75xJsIhecUr9laq?=
 =?us-ascii?Q?o1d1Mipn98YzfkHoPfihvvfyw+DOyEasl64lBde5T0Ivf7cC8rqoOYpIYb1m?=
 =?us-ascii?Q?Sfju5Ig0XRGeXSHkC6NMzd90IdruERXV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q9Wb1zrpiyuzUfW5UHlmSymwitTRIjP9m/avg3xUjAa13Ft7rHKD1fwc0ulx?=
 =?us-ascii?Q?gyY6rF5UBvMZeD5p9Gy/X9rRLGkD1f9LGeG3eHef6J3uEmJEgMJ5KualcQdr?=
 =?us-ascii?Q?ikxLkJMjspimINaElY4W6acn5T8Adho/JEFNNUvcrcAaMBCfpyIKHhpSrHoK?=
 =?us-ascii?Q?4rJoiXnflSGy9q+x8oSLR1MOLJOiIkIUNOVQJQ5dKYLSscUxXywmWFuBMvWx?=
 =?us-ascii?Q?tgQ2vMpcGDmEOMq3/yQF0oN5wyhqifltmYho1Bb0lXtA/AXrohz4Z0R/qW4H?=
 =?us-ascii?Q?BVwj9jqWmbH2PWGESOcui5UGr+BPLRQZWjlXy7vR931WYdlzwgmbJceJMhg0?=
 =?us-ascii?Q?bNnyrAIX4rhYeB9X5LVELFtuVDiFSrMXyMpmMBFgU/wzg51fEmpw3T1idVHL?=
 =?us-ascii?Q?jQ28H7teGk36irUyS/1jVqBtOSHERBHfaqIzR2+McSNGtEhOhGayJDDQgQI5?=
 =?us-ascii?Q?Qi2ipXUE18Zb7pcJphEPENDyiR6lA/YwHyDHqpa99L6cNej7VQDukb6tWsrv?=
 =?us-ascii?Q?1Fh8CbHl24gdo69YwILMUqh8ovsDXGbkEcSTbR86uUgK5e94YUCui01s7WH9?=
 =?us-ascii?Q?NLA9kpOx0JMyOXjfhCCP1nouD9RBTLhPMNtlAegaG43BwI4pG/6ry8abtcI1?=
 =?us-ascii?Q?w9B9Juk0cCT+jZ1oNnb9VQOdOFoWvCcXTip9J84cCcv4uIA5EJNfUakfS9Cx?=
 =?us-ascii?Q?14Uuxe6IVazpCYJcqxmv94NYyfj8aG7pEwR4Jfv9tp79LnDnCLvbPvfwh6F7?=
 =?us-ascii?Q?/C2vp7PREfJ5QXCZ8T/m4N/yYk6NUalF9oMbbAI4kPuDuQgOhL6pVgfs270y?=
 =?us-ascii?Q?V7P0s786DmiK5EA/2m1oyOgYg4lnmRQYXwDosfcGtnI7qqnh924//0Hli8zm?=
 =?us-ascii?Q?mmKZEb+qhUvRIFzmSFgOw9YVD+yikHYK27MtOLWpw2KOt0/3AfpZW4M5um9a?=
 =?us-ascii?Q?Q6KmAbDloXvAxgXWOLFqoDHi6+V0XrMsX3F8E89K6L3fxTxnnfq21hOtLPf8?=
 =?us-ascii?Q?Ijhl4cNS4+ehWqw5MlINYFdmq7DhRGWoTXENoTLteXt9Tfnw0hYFIRHeKhp9?=
 =?us-ascii?Q?lOHj+MDMM7xuA19ZBeJcnpyiuUPcElgPCwMhU4lzEyc1j6VqALGA6jwecasZ?=
 =?us-ascii?Q?HA6MgCMPLpwLl/u60gTIIKgssmSXBvMsQqYSs+efwQFoYGu1CrXUaspcqoBv?=
 =?us-ascii?Q?J691zg8rm8Fpd61Ddgu3lRZqfILkj24vtNhYHIsssble0Csd2wmMnGKwoIMN?=
 =?us-ascii?Q?rehgK9gsT0VTzgfUE95Z3PMhFosOSD7YnbIASOW7uB+9I002bYNa+2ILD5c2?=
 =?us-ascii?Q?GE/R+aUOKFENb/oegfgfPSHwbpSrxMn1W+zOx1e/TkSSYCOgBM6D0CPEzRLD?=
 =?us-ascii?Q?2MWZNtlXLbMo7u9C/ERf0WvfYr4zlDbQ0wVLroBDKIsPxvJhwWS1kmhphM1V?=
 =?us-ascii?Q?JGSQ/j6HfbaR/Y0+o2CXKvVLi7qbsS6eXFArcfFPqnLW2YdI8bf90ncjnm14?=
 =?us-ascii?Q?YfhBf8L74aN3DCFcBQXK3lQNvIkccuaK8ExTPGK1HdXLVy8ILAGmq07OVTH8?=
 =?us-ascii?Q?RYfoK8zZ34qDU+eDLYuAU0+7tTWfW8hD+wH8wfR+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58991fd3-808b-41be-e884-08dd46cc0575
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 16:33:43.5065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zO2lgF275QEXh3dEpFF6pNKy3eNhN2tbXdVadUp9mv+nZyqqf3akDA2QozeaQOhUPtalTttBS/ukjz/KSZojbLJw524jkvEnjyVYsRK1o8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Dheera=
j Reddy Jonnalagadda
Sent: Thursday, February 6, 2025 5:47 AM
To: De Marchi, Lucas <lucas.demarchi@intel.com>; thomas.hellstrom@linux.int=
el.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Cc: airlied@gmail.com; simona@ffwll.ch; intel-xe@lists.freedesktop.org; dri=
-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Dheeraj Reddy J=
onnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH] drm/xe: Fix uninitialized pointer read in xe_vm_bind_kerne=
l_bo
>=20
> xe_vm_bind_kernel_bo() declares the variable fence without initializing
> it. If an error occurs before fence is assigned a valid value, the
> function may return an uninitialized pointer.
>=20
> Specifically, this can happen if:
>=20
> - vm_bind_ioctl_ops_create() fails, leading to release_vm_lock error
>   path
>=20
> Initialize fence to NULL at declaration.
>=20
> Fixes: dcdd6b84d9ac ("drm/xe/pxp: Allocate PXP execution resources")
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

Fair enough.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d664f2e418b2..b6ca53ede904 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3184,7 +3184,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm=
 *vm, struct xe_bo *bo,
>  {
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops =3D NULL;
> -	struct dma_fence *fence;
> +	struct dma_fence *fence =3D NULL;
>  	int err;
> =20
>  	xe_bo_get(bo);
> --=20
> 2.34.1
>=20
>=20
