Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E1BB4730
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 18:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5551A10E803;
	Thu,  2 Oct 2025 16:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DslH0iSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED9C10E37C;
 Thu,  2 Oct 2025 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759421405; x=1790957405;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dZCFFYXHxYWalq3a8bC0OoPjRlO148TJ5x+b2vSL9EI=;
 b=DslH0iSfU/7uLjwwJAXsuLH7Catiguawe6CDzajGGA77XUo74Ht00AO4
 Mtj30sPtNxn8FYt4M8dbfZueFLlI6m2zlS/PxcYjnyxUGiPTyzryOawce
 XmS0/Ga9DTi4G0jwUpcpfaKivmH7qjJijmMN1aweFGkFAQWpejzzPcLaj
 QEHw7uG8mfHkmiXHmEeae5ONTG3qZJutqvH3u7dzdL0r31YKW9jOAeC1B
 I2sLFAOy+SAlMx4eFaeKjq33wkVnjEL2wEEw7993eOxzCfT4B9pvbWahm
 MbDb9H9S0KcPhrMOf17Utoh84KoVOMat10tX/GCOosuQONVwhYJ5HK49B w==;
X-CSE-ConnectionGUID: zipjd4ndQ3KW36XF3/+fDg==
X-CSE-MsgGUID: Wn7h1ZBFQS2C1EdCn/XTEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73060382"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="73060382"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:10:05 -0700
X-CSE-ConnectionGUID: mfqq0hucRCa+AXb+R2eIFA==
X-CSE-MsgGUID: dJR5K8isR6u0Oi8/Dk37sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="202819626"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:10:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:09:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 09:09:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGp2W4goKtFWUEwqt80/LFa3C6pPD/lqRuRLeu9liGfaZ+PSHYwJmHfW28wWR7Afh/dfoKVS/UYTqrGi6bSbExa2Q7E5NBVCMGyCG7p1O90+qsOI2VkgrE98PvK3X7wovyYxVMTlU/ydcau2gEEVxiHexdiHSqNTzYL2lCRSzFGSChoZDBr92wqFXi5P6zpDYcPGm4xe/5Lrvscc1nUW8b1ly2Tx6E85n3Nxdj/ec5NFg6J7O2JV/FbAYVLw/iwmOipIMno1eSh798UOodJRqpl7z77i+7VS9S9nSFirHORIq3+02kdJyALi/kLR7U31CaToZRlMksKV4baZpyFNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQAFS3f+G1ZgKxNg0P0pcDA5/B817S2xKYT0oeuT250=;
 b=lIS7rR0e652Z5a+u2r4NQekJ0QxqOsbAyM6Y0bJCCiosMPEwlWan3eb91eDXu7H5zpXJpPlsMFdGSB9f+xnimLdH4PhuZ4QvNnza6YJb22R4j1tYhvp/C9R9cCgZreEgbkHsL2XUk7NnwsNvaxKbwsVs4Xt/O5v9++zqk/vqNp4V8ybmnjN5RG/ocuj/87BAsBbGHOSPSXSdpZXzZWhnjEnKz+CB0aOzJgGFumCQYdeKD/m3ctU2BksCQ/+nLF0dcG0GcgqlrN7M3eoCSSxNc+E+Ozcba0ZS374deHyPwSsWfkQuCHpz/ZBhQ83jTNcgQaQvmMOuUIjo+cpKWxVoiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 16:09:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 16:09:39 +0000
Date: Thu, 2 Oct 2025 11:09:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
CC: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, "Icenowy
 Zheng" <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simon Richter <Simon.Richter@hogyros.de>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] PCI: Release BAR0 of an integrated bridge to allow
 GPU BAR resize
Message-ID: <n7syfqiqbtoqmb4zpxuec44vpnwfgbzfhuviknjibbf7dezmpk@joeksfvzd3hw>
References: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
 <20250918-xe-pci-rebar-2-v1-1-6c094702a074@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918-xe-pci-rebar-2-v1-1-6c094702a074@intel.com>
X-ClientProxiedBy: SJ0PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:a03:333::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bf72f1-71eb-464c-799e-08de01ce16a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZgWR1ur7GaK/cl9DKhnI/jwzaGlqWCI8mOl85XwTvj7A5KzIzTYbcu0tC2?=
 =?iso-8859-1?Q?x8zcSbJLG4AMr/q1/OyJdxjcu9mhtZFVpc6dZzQNqOK2u36VrQxEDL1qmE?=
 =?iso-8859-1?Q?h4NHE6b8fqm+ecX3vQwbg14oRcJMqtUECfPBLEK9xvss+aejh8xFw+uexA?=
 =?iso-8859-1?Q?dgCrcG8CO78WZyFf/300j+mm6SpMHbhGTDGbmgFgM4tEuGcbYuL9Y1GFAH?=
 =?iso-8859-1?Q?G0VVWUe8Vr4d39z5LrOeUftBXRlPrkclzaNklFxuT2wNzM8cyA0s/1Nk5E?=
 =?iso-8859-1?Q?OJXlzwvQLAFdSM5zBIrGw+FFKr1P0g+29SyymG1sgWMzu1RIwhULUA0s3C?=
 =?iso-8859-1?Q?4B4crGyPDJSmpV/VnbZO9Yo7ZLX4vg8qOBWyjUK0Y5Y20o+Crz2N+cUzsT?=
 =?iso-8859-1?Q?+hPynXupZfexH3oRTnlhlC0alcKY7nD9mf6N5aP3pXTlN3sWjWtLoM97GU?=
 =?iso-8859-1?Q?D6qRILmL9AEhH9xGIslE+aa2UlnSDEUEcDML24hSlXPAhuZF2N2i3eC2a7?=
 =?iso-8859-1?Q?YteVh+d+EttmVifVzliJ9+m+4t4awjAiqmPw9HZTxEgBbTnNMUJSVylT1R?=
 =?iso-8859-1?Q?Q+zU9GJ02KBC5AlWh8axOsWoM8fBT1wOiVyoQPP2yhc8P22qNxpp3pcLKg?=
 =?iso-8859-1?Q?2ooB1p5ocO8eRAHAO+oIFqZ1mbxPHHyiWkgRL9uxtVJiqpHShve+DEUSgL?=
 =?iso-8859-1?Q?pXVMFHoxaOQKMTCW/41WVz9pQIGmKC/0Fha9IT3xaROPotnvkuu1lvMbTD?=
 =?iso-8859-1?Q?rjhMgmg/40YUFhKRQcZYGT/ti3/6/8XQ14sjTUf1QmPupgxkjE5RaQcZCy?=
 =?iso-8859-1?Q?jL3AD5dIkwl0bfMYcfNzWav6XV1rp6JNOXoTpv4wl208/BGr1wbzVWFBAy?=
 =?iso-8859-1?Q?mC6nEHwyW7XQ6Lf1/2+tKaij3FuCl9yauYwaYqjvnQOONGsfuIlLz1rk8s?=
 =?iso-8859-1?Q?8EbzoIJd955id/3qQqTXD1K/SLsThEdHP3MbQxhvuWjxYme53XfaomrMgf?=
 =?iso-8859-1?Q?HPXZy3nU5g76J7llyYHuhzvxP3alEQSHgqY0/T9JbPoSA4v0zVgzpCNrXp?=
 =?iso-8859-1?Q?pE8j690gK59o0Qj0ZyUfzmiv3g9VsX97cOYhydHoi6NO17Tes+6h7F1PoS?=
 =?iso-8859-1?Q?RKDU8vr2EoqHbNtNcjbkxPglb0j8ufS0cExDyc1SiEm/pjbwwSANY40vvR?=
 =?iso-8859-1?Q?ZxBo+Sa1kzd/tLth5t5NODtiFgAzmM62KNgIv8GCoZx6thp/T9AOkt6hZs?=
 =?iso-8859-1?Q?KWIi8RIqk6667qgJ9MzkzBzZlI4VAiTuNdJgRpmSq+I0XB/xQ0ZZqkJnsi?=
 =?iso-8859-1?Q?XZQliEYI/jShUsEkhPjnh4XfCcUVtqBuOjh2YlYMqDmfch5aWyTs7LEcXD?=
 =?iso-8859-1?Q?mVTuvwsTupaGjNeri7S0uYchFzHoGqjgWs7J8/+qWyIF/ymKOVqFKssBt7?=
 =?iso-8859-1?Q?V9WKPrjDdbMLFO+cY+DFGvyNxiKkr55HIKXmzuhpl1XeKMIQpXLMDdLfI3?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GQ7rg+kSuRbzAvNCI2uIOSS5jzC5hp16yJv84bFsecK4vV/pXTaVUdwEWu?=
 =?iso-8859-1?Q?41d5mv4A74WBZUWL7oRQmX5Fj5t9udBA5CKgj8X7jJW7hXW0jhnbQyPJp5?=
 =?iso-8859-1?Q?Rfz+xSSTMnNQjVqT8+U8lpaGINJDi0dVAQiMmQGu2JJN2BdQT4wVJX7VI6?=
 =?iso-8859-1?Q?5c0pJGe2484Nzqrj2bdkrndhMB6F6qYaC0s3dvqArC//0n7Av4lG/vzKoe?=
 =?iso-8859-1?Q?NfJkl96ObeysSTCdnBn4ZUUYsBC1fNaDwGfZZcl0/t6DRnhQ1JqPFWVtUp?=
 =?iso-8859-1?Q?Rvn8pZe+jB75J2Nt3tZ+rVI3kIr+BcrZGC6crrKSxbygxmZFqpHESnPdSt?=
 =?iso-8859-1?Q?/tpNeU3g/SYeG2Sq16aoC27STZITDI319yQ3qeepOEUbEOijLsGopfbo4Z?=
 =?iso-8859-1?Q?352GlcDEvNQcLyWzar6DcGbMKumMPiYqpHxOTnMge01Z01d+ZLswbT++go?=
 =?iso-8859-1?Q?tJCv58ZynXdP94V9vhtW7klNwkF1kWs21ywG1aaevg8wl0PZKPBIVAUT5B?=
 =?iso-8859-1?Q?o5KqDAlcwXbT3ZMpeksemxZjjusDoRgzwRu8OGLCI+y9MBq1QwjSz7nHVJ?=
 =?iso-8859-1?Q?5CfStj+UakXLVCsqVmKR6br3HJnw/fI//Ltrff0FOJ5A/NpKkJjdSH/sZF?=
 =?iso-8859-1?Q?NxCKw5LYjyFGHptgsNXk9zZu7nDsUzfP2TkPAryFQz2gcvAteedcKbWd9S?=
 =?iso-8859-1?Q?ACwYEfAGEXa5rBw6ea+QyB5pQz5eLt8s8dX8HXF6RNIFngAsXZnjMCQ/Ux?=
 =?iso-8859-1?Q?WGrmmdFWsjTsV6a48/4NCeCTybkyqHOjQE7yu016yMwEE7pFgqOiS89aat?=
 =?iso-8859-1?Q?r3c1vzR/B4Wdgnx67V5TcSUhkn8hXdnacw9EGHh7Dx0nPqEcVbL9u+8o2c?=
 =?iso-8859-1?Q?alVEAqw96T7jfJ6wVU3fk2d1kyFc3Exn3DUDbxoAlIBLhF1cVZ5vBOu0Xy?=
 =?iso-8859-1?Q?xPuYw48A0dyhZ4IOmTEjsaigItYgi4dUwIZ9GGxCS+OFttL/3op7Vlpc6l?=
 =?iso-8859-1?Q?oGJRfV2TBtchskl3yi7qurZPSVT2mEX4q13mZfIQm3KHkcGVessQqQT6IJ?=
 =?iso-8859-1?Q?bYemiSW8MSsiMn3WRQSWAAn2cf7z33FnPQuMeIhehHiUdtpuZ+lC7WgeIp?=
 =?iso-8859-1?Q?p+D6G9UCEL71UbfFpxnOkDYjcC0kVed1poKxigR5aeReUlJPqqa5PSMR4N?=
 =?iso-8859-1?Q?14/Dx4gPRYM9N8UQ+K7fC6KPV65cQzg6q2uERf8DKmVhYVJ1Fd1/C638SZ?=
 =?iso-8859-1?Q?pg0DE55e6A7raVvY9wUsogZYWu+msWE3KeCXfwuTxX+jkP+fI4RIpmZ7qy?=
 =?iso-8859-1?Q?IztQJegNALcpwR2L9hZgYR/1KMQa0yp7hzT3hPt/hpFz/lIOtxgR4otv5X?=
 =?iso-8859-1?Q?zLfWWXBALviD1HCTWxj4rWIwpxBMRLoD99mhuiPE7xKYDe2HZZx2pnG9G9?=
 =?iso-8859-1?Q?oN6QT/5/L5hc9zzBu1jLY/ZA6FaCkriRWhfsTvX/PIzLylmMpzJRF1+T0I?=
 =?iso-8859-1?Q?QMgBcRrHDl183hRpy9BHA4tmld84hZEQDZr/Wx2Tx1tbJQyo1naFCQL7ca?=
 =?iso-8859-1?Q?0bJ/MecwFN1MdRkePfI0mbmI49FZ/vdO7DdYWUAC+0ekjCmNVm9Oqxaf8E?=
 =?iso-8859-1?Q?4cvhqKzEX3WgrFA5FL3NO5Y8b0MgiidnNe0s3i5TN9hdbtfCFBKoYhxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bf72f1-71eb-464c-799e-08de01ce16a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:09:38.9690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD64SRuRUPKkgo5nkE31vB67jSpGcsld2q9H8EdWT0utyDDDfLlr33i2Wv6S3ckqCb2c/60l4ocf5ITh7yEpYFNV3cTBvFdniQNMY3ddKkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

On Thu, Sep 18, 2025 at 01:58:56PM -0700, Lucas De Marchi wrote:
>From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>
>Resizing BAR to a larger size has to release upstream bridge windows in
>order make the bridge windows larger as well (and to potential relocate
>them into a larger free block within iomem space). Some GPUs have an
>integrated PCI switch that has BAR0. The resource allocation assigns
>space for that BAR0 as it does for any resource.
>
>An extra resource on a bridge will pin its upstream bridge window in
>place which prevents BAR resize for anything beneath that bridge.
>
>Nothing in the pcieport driver provided by PCI core, which typically is
>the driver bound to these bridges, requires that BAR0. Because of that,
>releasing the extra BAR does not seem to have notable downsides but
>comes with a clear upside.
>
>Therefore, release BAR0 of such switches using a quirk and clear its
>flags to prevent any new invocation of the resource assignment
>algorithm from assigning the resource again.
>
>Due to other siblings within the PCI hierarchy of all the devices
>integrated into the GPU, some other devices may still have to be
>manually removed before the resize is free of any bridge window pins.
>Such siblings can be released through sysfs to unpin windows while
>leaving access to GPU's sysfs entries required for initiating the
>resize operation, whereas removing the topmost bridge this quirk
>targets would result in removing the GPU device as well so no manual
>workaround for this problem exists.
>
>Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Link: https://lore.kernel.org/linux-pci/fl6tx5ztvttg7txmz2ps7oyd745wg3lwcp3h7esmvnyg26n44y@owo2ojiu2mov/
>Link: https://lore.kernel.org/intel-xe/20250721173057.867829-1-uwu@icenowy.me/
>Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>Cc: <stable@vger.kernel.org> # v6.12+
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>
>Remarks from Ilpo: this feels quite hacky to me and I'm working towards a
>better solution which is to consider Resizable BAR maximum size the
>resource fitting algorithm. But then, I don't expect the better solution
>to be something we want to push into stable due to extremely invasive
>dependencies. So maybe consider this an interim/legacy solution to the
>resizing problem and remove it once the algorithmic approach works (or
>more precisely retain it only in the old kernel versions).

Bjorn, would that be acceptable? If so, please let me know if I can take
it through the drm tree together with the second patch to have this BAR
resize fixed for BMG.

thanks
Lucas De Marchi


>---
> drivers/pci/quirks.c | 23 +++++++++++++++++++++++
> 1 file changed, 23 insertions(+)
>
>diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>index d97335a401930..9b1c08de3aa89 100644
>--- a/drivers/pci/quirks.c
>+++ b/drivers/pci/quirks.c
>@@ -6338,3 +6338,26 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
> #endif
>+
>+/*
>+ * PCI switches integrated into Intel Arc GPUs have BAR0 that prevents
>+ * resizing the BARs of the GPU device due to that bridge BAR0 pinning the
>+ * bridge window it's under in place. Nothing in pcieport requires that
>+ * BAR0.
>+ *
>+ * Release and disable BAR0 permanently by clearing its flags to prevent
>+ * anything from assigning it again.
>+ */
>+static void pci_release_bar0(struct pci_dev *pdev)
>+{
>+	struct resource *res = pci_resource_n(pdev, 0);
>+
>+	if (!res->parent)
>+		return;
>+
>+	pci_release_resource(pdev, 0);
>+	res->flags = 0;
>+}
>+DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa0, pci_release_bar0);
>+DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0x4fa1, pci_release_bar0);
>+DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_INTEL, 0xe2ff, pci_release_bar0);
>
>-- 
>2.50.1
>
