Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C573CF8608
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 13:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654F10E4DC;
	Tue,  6 Jan 2026 12:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MlQbSfMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A35610E278;
 Tue,  6 Jan 2026 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767703660; x=1799239660;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0RiskJjdF4My0ADwzI91P7sWixzDldfb6f9fJt5YDE4=;
 b=MlQbSfMAs0enW+XzVW4uHYygFzmBnb7m9Hr+NqhMLDmhrphR4MeXlXW8
 uOue//z81zSaqzDkTlvUxbKkG0QeoqU1/DsTLWkoFApR/9TRcKuss8UZr
 cA3uREBzxuIzxmaz7Zz+t3rBjeSo59I6q48pwjfoLEd9QcoCYGCpRWyZO
 SLsGBHmLJqCb96UV9as2idJtaj62O9JwyB6x6Pps/RNgv9yi72uHLZpJG
 SEsyU05KJGuDO83Wy8BbntkqlhRa7w54l2e4gOy+9sK88AB1eJYPl0qV8
 MulVhHKw1hy8DP3SnbcY4kQ+wEds+jvEJ6r3q5evPprVKFNNhe64mioaa g==;
X-CSE-ConnectionGUID: DkCe7v13T7iPbYf3Ctfnmw==
X-CSE-MsgGUID: wAOO3brkRiSSjgEIjYdsOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69139939"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69139939"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 04:47:39 -0800
X-CSE-ConnectionGUID: E/yMlAfxTmiDxwA8seO25g==
X-CSE-MsgGUID: /Pn/i68AQrypm+YFs0WhUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202703364"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 04:47:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 04:47:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 04:47:38 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 04:47:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZS1nhpRrXQ5pMIedxvo14W/ImqMWEfCR/wgMgsx0a11RXqJzjd6pXk9Xux/2B9pi2Vc9jbKaj6LaYN6xUExW5uF7lpwipoCiIfvIQq/T8pIQMzi0YR7UsF4Y4xLTqcscduALYe4W8MZV8FSMsyZwoDXvMV28lyHyuovKBwknFRfuY2k+RM3pA0BK2CLZ/4w4A4yvWdo4LERVsdi12w6yuutunt+qXgl96qgIf6C25eCyQiWzx1w6m8/XxSUoj/K3QXTiy2lW9gMeYYj/TTaijui5XymIrW2HTxwagnmlw4x9k11+DksHzTpFR+rlEe7Qomtughxdz/qQqIq4JG5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgy0dQxzAQ6fqT8gaFzZ73eUQNNGQ96Mas2XVAZIIb8=;
 b=EjisQM0LGsthctNvPKi660DmH0g+0Ccl+/DFyBmIsRLH53WNMdcfng/+7+rFdouSBVjBEh4OsQX4PXYi/JrN/RDVvbZPRpBNaDy6NXd/55ZakvhykGLsmSxmMj6fZUJ6H0hpqcIp3iwFmiolCl1uC5Q1ztpE8Vo/C9LXOoC4XwieBrDNkDZwVu2tl/xVgrqABHdzeUOjnIZs6+up07rpXIHADzFXJH9UtVWrY6oL4wyQ9aKbi87IMEq0KzOvb3AcYLTP26q1EGMgdoEjA4h/UpucauvfK85lOs5aMBkXY2ZkaJbMJJ5dFom004B9zskosp+DEthHz2rNsuqBF9SweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 12:47:31 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 12:47:31 +0000
Date: Tue, 6 Jan 2026 13:47:23 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH v2 5/5] drm/pagemap: Enable THP support for GPU memory
 migration
Message-ID: <aV0EVEk-CMyI5OPr@fdugast-desk>
References: <20260105111945.73292-1-francois.dugast@intel.com>
 <20260105111945.73292-6-francois.dugast@intel.com>
 <aVviQ6VcADOqiG/j@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVviQ6VcADOqiG/j@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: df75406f-9ab9-441e-aa7b-08de4d21c1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QSz5GEWOj0TkEh/HV7CBnm2YmPdeKsleN6V+GSPdzsbRdIGZXnwY91ZRZy?=
 =?iso-8859-1?Q?LU8lCkneT9pk8dQKR0ySRxedmdOe95+qGF+ZmLDOfSdvGue9elPg8NAoU+?=
 =?iso-8859-1?Q?w3+H22j9OefjPckbxLqClWzCsaoY7gj/Rb73CCQfECinRtBADP6taQ8OQl?=
 =?iso-8859-1?Q?+zGwzTkaAimZToIrS6LgjNs4WxXx9Oa+cc2VUzIgvQJntnpCCWeIpaw+9R?=
 =?iso-8859-1?Q?FoA8G5X46xB68YoPVQhSUPuvnmIqoasbhGOMjwgJPoCkPnH0xqrDkjgl64?=
 =?iso-8859-1?Q?T+JfUYb+Rdd3Y2DfUFtARLYtCpZ2EbxRBVvhX6bS6LjgMTw+J64BzR2ha8?=
 =?iso-8859-1?Q?OXOGbm5R9NWB6bMMo66aoyeRAkPf/7A9VW/x75jZAoAmeH2VZ46yZfdiai?=
 =?iso-8859-1?Q?RPIMxAZbELX/0de57I27/O2dxaDHM5NYciO6aZhelyeXys1OMUH6izWmoM?=
 =?iso-8859-1?Q?8Cq1QmGWWRt0dNvEiNPTsKYz9ycPxBjX2+mlP1t7hFjgQdtGu9f9A63BYk?=
 =?iso-8859-1?Q?jbEfUervLrgwx/H+XCQ5FMDenjotNbJ9hm7626R964S/Z+HSSc+jBY24rH?=
 =?iso-8859-1?Q?2Km7UL/iaim304yLmrIdZ21EiNJiemDLLVIuzprdjRUvElOrd990UcV7BM?=
 =?iso-8859-1?Q?nPUjDpWPB0kdappaUsNWcel5TbunL5y3FQk/LYTgMcLFPRCEXXfLyMbI5l?=
 =?iso-8859-1?Q?VzAGM6xGF3pCXVfLpRD2X+Tz6Tx3DRyCpkX81YtzkrHbEnkF12oqF7Rq48?=
 =?iso-8859-1?Q?/3zfvTIcITZOo1Xhh5MnwQ0/NYbqlKZWNCx5yubYg5Oa0pDAZkdb+6FvuY?=
 =?iso-8859-1?Q?rIij6jOHjIti+J3+GYvOu8UbZ5qSOOkgzpTdIwoomDjxxPTE5p4fwvKDHz?=
 =?iso-8859-1?Q?qzPlgyf2hgjNowspqtr6DthqAmjHsH4BJls3DZG2Od+wEjm1KALTDUbfyH?=
 =?iso-8859-1?Q?r0JjaGvH2spGjUMlqM/kCCziBEaThZqt/O0qF/gt/qLkUmDEZd4Ne0LoLy?=
 =?iso-8859-1?Q?MA8lBGpMjB2zdIDaJI0fIeY1TQRzGs+AqPDnjfk9tNW8IiLnruTeNy++qJ?=
 =?iso-8859-1?Q?EnK79rBAGGb60Z73ZpbcqDQyCf99oPkzMlFKTBr5fSoNNpwE9p4fPsUHY2?=
 =?iso-8859-1?Q?xgn/Txw6jcP3K5sUEGAbmkD+RvWNWhxBpWE6JK17wY34WUa/0K+NSCkZMX?=
 =?iso-8859-1?Q?ISOiEkkIH8NMFEjCCBCDkI8Lg99gD1uNCZOVlMHbByp5+ef0Q2cEa1mj+w?=
 =?iso-8859-1?Q?kbO8U/CwByhrWVig4Ae9poItf8mjob4kC9sVYq3NvGZR81BLQvsbgFH8oY?=
 =?iso-8859-1?Q?F4JgwaZKKxyW9EhblnL55svA0oz7vR/S/WxLk5KVzmH9GMpA2W3fULJ0sj?=
 =?iso-8859-1?Q?dY0ReFWZxblO1xHGk9tQtZ1T9kgT8Qe3mChKc+HF+toOkSxDRDOGSsqe4/?=
 =?iso-8859-1?Q?onxN6sbZJ3cxhcPF17OvnH/r5qCtZ+1RF8vQL1ZHfU5gm9rjkwTsRj+92V?=
 =?iso-8859-1?Q?FYzLFMe0BdI6KtIVIryGWw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8IdlwKqwhbvnEac8J3h88TOwDTYF7KmJHr6Lkq5QosEAH5Qmt2E6F3bP/2?=
 =?iso-8859-1?Q?iqR3MFBaQYIPsueKTPuzYpkCzzoUbZ86M4ihQNQ/xx4+j1Inhu0vG7cs5u?=
 =?iso-8859-1?Q?Kh7hxqPLzfR4lpNsG0FATru5lm+gngiRbRgKhlXIGPngRclX48dFg2hexo?=
 =?iso-8859-1?Q?i9gw/98eT6gjkjICXRatKcXEsdce90/VNSAzafb53vRRUts6RFdSKfpAUo?=
 =?iso-8859-1?Q?CcVPaFDf9LP+GwgGeXLI2LqV4qU8XNxfpP/EwF0mK/Y+41mHjLLp71jJVN?=
 =?iso-8859-1?Q?3trHRFDM/0ZZ0GO9RGeLNBD97UWB27a8zSpcU6OXlZzuyBq+VOo3PLpKPM?=
 =?iso-8859-1?Q?hRAI9eG4puH7nuNmSgZgWu9XAMmp2lRmy2uOckep4QvNKhxTcdajy/SYG/?=
 =?iso-8859-1?Q?Oddb9xEs53UpqUdKz32ZUcoa7czNOiyzehy0hOJyppQ+K1T+RV1Vht6YvU?=
 =?iso-8859-1?Q?pKo8+z+4VQ/aznuWm3pOJ2Da7hWZuIHib3N/v5enUg8IQMUNoR7YjHCQ/E?=
 =?iso-8859-1?Q?qLlR7egCATf6ingiYP3WqJZuRgOEu4rM4PYbITiagfvLJSQD+R+EIBPrvk?=
 =?iso-8859-1?Q?x085I2F++9i1C0UIKaLUOz3Yq/7YhfACfV0CRUjUpz7GjVCwaS2ud3GZxH?=
 =?iso-8859-1?Q?idRjZgcbSq1sz0mSpNlV8TPDy4DjHr8E6PT/5jblD23GA1J0EuQdFgfMS8?=
 =?iso-8859-1?Q?hY/U3q8utYwyPPsCZ/chxcStJS6S5HkIs5RKTC5lg1/j4M9lXJxjXZzP4s?=
 =?iso-8859-1?Q?n0P7OofRW9XhW/opIN7OtDJW6WIbTrTx4wAvKSWVZRrcnurx/PwwccZi/p?=
 =?iso-8859-1?Q?xajVuDQoX+OXTY17pb6ZeCML2DNwHGl+p8tza+i2AVXEQzQxzTDUOZXCNA?=
 =?iso-8859-1?Q?HaPP8SfEOXm2R6ai4jvsYLTl7eL0UnLq5aYsCA3lzp2/urDmZoyERNw0cG?=
 =?iso-8859-1?Q?r176j2voRQYUIOz17AGFgRG89cqW8xYXnGjz7k2SVli3molhmko0dnqOgj?=
 =?iso-8859-1?Q?xp4W36BpY9PU68Ru5JNfe+RNRQUY6K2nIrU7Ba+MZgJGp/MfU9noALrTnN?=
 =?iso-8859-1?Q?6sJ+0DkdxGuDP779q1IgtYWxw74W1uo0DagNlk82GkNHvRe9oWx9QnYzH1?=
 =?iso-8859-1?Q?12ApPxyfCpIGYUIiFrCa/kzJ0fb2N6YilRvKdOgGRC+vs3F52lsmx6FriI?=
 =?iso-8859-1?Q?kBc3x20vLqX5xlzEucRHdE7xT7Lv/+Jc9CcrKdcxErmQ2gkoT46qK/id0E?=
 =?iso-8859-1?Q?Luu+e7w7Ru/p9gLEI68IJ/ufCAUkxMdTELzx2hT9vP7rauwjyU5Svl7ZHi?=
 =?iso-8859-1?Q?zTjBa7Eh87dvD2OgyjZ+xE0Jk61PTeMU8IOzozrNCR8R3NXVudhqYR2eTC?=
 =?iso-8859-1?Q?VugjMgrYqEJ41lwJI3kt7edb5WId/O/vuRxyBZ72h8wu1dflTxHvq9bc1c?=
 =?iso-8859-1?Q?GaULMVESYZ46vCEXARkWtTNLYks9cdi4Du2nxNMCqqTrQIQ7l2Hn5x/kNM?=
 =?iso-8859-1?Q?I3EHCRsdAr6T9dcrZjQ5WeJhIRRNpTINKOmHFaLeKKeP3CvV/1iXSoZt8+?=
 =?iso-8859-1?Q?onpBc3j0hVMXBviRsnPbYAun+ESEkzz13GgQaKNLW6kAyMzWj4tJT54gjs?=
 =?iso-8859-1?Q?6yhtGqNKW7Yt3xbuP3OOKHQZ9IrpgJ4VIn2CHQ7/hQ9NQaCUlzRhojlK2g?=
 =?iso-8859-1?Q?2Bem9x/MIaLw1Jee+Hf1wRhxRYTdxDLdN3fhJ27hLhZuok1Dw0h22w0hgN?=
 =?iso-8859-1?Q?igRBihEY/HdpEwvIwvCOjRvP7dNCjhmxOu6bR5VM8Upy9rFM/ePeW5Yy1v?=
 =?iso-8859-1?Q?lBLeAzP8TuMS9694GpiWdsTvP8XVCag=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df75406f-9ab9-441e-aa7b-08de4d21c1db
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 12:47:31.6248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2cUNRHFdpAFr/NfZtsPIOGxNQp7NwIOG1XoFGX8YUU8ae/8cKA1d39sn/Hlf04GCiZHXgDsI9f3Fkb/JGnXAjM5KNMxfsB/ZABO48y/JNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
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

On Mon, Jan 05, 2026 at 08:09:39AM -0800, Matthew Brost wrote:
> On Mon, Jan 05, 2026 at 12:18:28PM +0100, Francois Dugast wrote:
> > This enables support for Transparent Huge Pages (THP) for device pages by
> > using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
> > split folios and loop multiple times over all pages to perform required
> > operations at page level. Instead, we rely on newly introduced support for
> > higher orders in drm_pagemap and folio-level API.
> > 
> > In Xe, this drastically improves performance when using SVM. The GT stats
> > below collected after a 2MB page fault show overall servicing is more than
> > 7 times faster, and thanks to reduced CPU overhead the time spent on the
> > actual copy goes from 23% without THP to 80% with THP:
> > 
> > Without THP:
> > 
> >     svm_2M_pagefault_us: 966
> >     svm_2M_migrate_us: 942
> >     svm_2M_device_copy_us: 223
> >     svm_2M_get_pages_us: 9
> >     svm_2M_bind_us: 10
> > 
> > With THP:
> > 
> >     svm_2M_pagefault_us: 132
> >     svm_2M_migrate_us: 128
> >     svm_2M_device_copy_us: 106
> >     svm_2M_get_pages_us: 1
> >     svm_2M_bind_us: 2
> > 
> > v2:
> > - Fix one occurrence of drm_pagemap_get_devmem_page() (Matthew Brost)
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/drm_pagemap.c | 77 +++++++++++++++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_svm.c   |  4 ++
> >  include/drm/drm_pagemap.h     |  3 ++
> >  3 files changed, 76 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > index 05e708730132..1ea8526ce946 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -200,16 +200,20 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
> >  /**
> >   * drm_pagemap_get_devmem_page() - Get a reference to a device memory page
> >   * @page: Pointer to the page
> > + * @order: Order
> >   * @zdd: Pointer to the GPU SVM zone device data
> >   *
> >   * This function associates the given page with the specified GPU SVM zone
> >   * device data and initializes it for zone device usage.
> >   */
> >  static void drm_pagemap_get_devmem_page(struct page *page,
> > +					unsigned int order,
> >  					struct drm_pagemap_zdd *zdd)
> >  {
> > -	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > -	zone_device_page_init(page, 0);
> > +	struct folio *folio = page_folio(page);
> > +
> > +	folio_set_zone_device_data(folio, drm_pagemap_zdd_get(zdd));
> > +	zone_device_page_init(page, order);
> >  }
> >  
> >  /**
> > @@ -522,7 +526,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  		.end		= end,
> >  		.pgmap_owner	= pagemap->owner,
> >  		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> > -		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE | MIGRATE_VMA_SELECT_COMPOUND,
> >  	};
> >  	unsigned long i, npages = npages_in_range(start, end);
> >  	unsigned long own_pages = 0, migrated_pages = 0;
> > @@ -628,10 +632,13 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  
> >  	own_pages = 0;
> >  
> > -	for (i = 0; i < npages; ++i) {
> > +	mutex_lock(&dpagemap->folio_split_lock);
> > +	for (i = 0; i < npages;) {
> > +		unsigned long j;
> >  		struct page *page = pfn_to_page(migrate.dst[i]);
> >  		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> >  		cur.start = i;
> > +		unsigned int order;
> >  
> >  		pages[i] = NULL;
> >  		if (src_page && is_device_private_page(src_page)) {
> > @@ -658,7 +665,23 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  			pages[i] = page;
> >  		}
> >  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> > -		drm_pagemap_get_devmem_page(page, zdd);
> > +
> > +		if (migrate.src[i] & MIGRATE_PFN_COMPOUND) {
> > +			order = HPAGE_PMD_ORDER;
> 
> Can we assert the folio order is HPAGE_PMD_ORDER? Eventually mTHP could
> be enabled on device folios where the order could be different than
> HPAGE_PMD_ORDER. I suspect we will need some small updates the GPU SVM /
> Xe to support mTHP and this assert would pop telling us we need to fix
> GPU SVM.

Yes good idea.

> 
> > +
> > +			migrate.dst[i] |= MIGRATE_PFN_COMPOUND;
> > +
> > +			for (j = 1; j < NR_PAGES(order) && i + j < npages; j++)
> > +				migrate.dst[i + j] = 0;
> > +
> > +		} else {
> > +			order = 0;
> > +
> > +			if (folio_order(page_folio(page)))
> > +				migrate_device_split_page(page);
> > +		}
> > +
> > +		drm_pagemap_get_devmem_page(page, order, zdd);
> >  
> >  		/* If we switched the migrating drm_pagemap, migrate previous pages now */
> >  		err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> > @@ -666,7 +689,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> >  						mdetails);
> >  		if (err)
> >  			goto err_finalize;
> > +
> > +		i += NR_PAGES(order);
> >  	}
> > +	mutex_unlock(&dpagemap->folio_split_lock);
> > +
> >  	cur.start = npages;
> >  	cur.ops = NULL; /* Force migration */
> >  	err = drm_pagemap_migrate_range(devmem_allocation, migrate.src, migrate.dst,
> > @@ -775,6 +802,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> >  		page = folio_page(folio, 0);
> >  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> >  
> > +		if (order)
> > +			mpfn[i] |= MIGRATE_PFN_COMPOUND;
> >  next:
> >  		if (page)
> >  			addr += page_size(page);
> > @@ -1030,8 +1059,15 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
> >  	if (err)
> >  		goto err_finalize;
> >  
> > -	for (i = 0; i < npages; ++i)
> > +	for (i = 0; i < npages;) {
> > +		unsigned int order = 0;
> > +
> >  		pages[i] = migrate_pfn_to_page(src[i]);
> > +		if (pages[i])
> > +			order = folio_order(page_folio(pages[i]));
> > +
> > +		i += NR_PAGES(order);
> > +	}
> >  
> >  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
> >  	if (err)
> > @@ -1084,7 +1120,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  		.vma		= vas,
> >  		.pgmap_owner	= page_pgmap(page)->owner,
> >  		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> > -		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > +		MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> > +		MIGRATE_VMA_SELECT_COMPOUND,
> 
> The alignment was off here - e.g. my vi settings make the original code
> look like this:
> 
>                 .flags          = MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
>                         MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> 
> Since you are changing this line can you fix the alignment?

Sure.

> 
> >  		.fault_page	= page,
> >  	};
> >  	struct drm_pagemap_migrate_details mdetails = {};
> > @@ -1150,8 +1187,15 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> >  	if (err)
> >  		goto err_finalize;
> >  
> > -	for (i = 0; i < npages; ++i)
> > +	for (i = 0; i < npages;) {
> > +		unsigned int order = 0;
> > +
> >  		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > +		if (pages[i])
> > +			order = folio_order(page_folio(pages[i]));
> > +
> > +		i += NR_PAGES(order);
> > +	}
> >  
> >  	err = ops->copy_to_ram(pages, pagemap_addr, npages, NULL);
> >  	if (err)
> > @@ -1209,9 +1253,26 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> >  	return err ? VM_FAULT_SIGBUS : 0;
> >  }
> >  
> > +static void drm_pagemap_folio_split(struct folio *orig_folio, struct folio *new_folio)
> > +{
> > +	struct drm_pagemap_zdd *zdd;
> > +
> > +	if (!new_folio)
> > +		return;
> > +
> > +	new_folio->pgmap = orig_folio->pgmap;
> > +	zdd = folio_zone_device_data(orig_folio);
> > +	if (folio_order(new_folio))
> > +		folio_set_zone_device_data(new_folio, drm_pagemap_zdd_get(zdd));
> > +	else
> > +		folio_page(new_folio, 0)->zone_device_data =
> > +			drm_pagemap_zdd_get(zdd);
> 
> Is this if statement needed? I believe folio_set_zone_device_data can
> just be called.

Yes we can probably do so no matter what the order is.

> 
> > +}
> > +
> >  static const struct dev_pagemap_ops drm_pagemap_pagemap_ops = {
> >  	.folio_free = drm_pagemap_folio_free,
> >  	.migrate_to_ram = drm_pagemap_migrate_to_ram,
> > +	.folio_split = drm_pagemap_folio_split,
> >  };
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index fa2ee2c08f31..05dba6abbcc8 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1760,6 +1760,10 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
> >  	if (err)
> >  		goto out_no_dpagemap;
> >  
> > +	err = drmm_mutex_init(&xe->drm, &dpagemap->folio_split_lock);
> > +	if (err)
> > +		goto out_err;
> > +
> >  	res = devm_request_free_mem_region(dev, &iomem_resource,
> >  					   vr->usable_size);
> >  	if (IS_ERR(res)) {
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index 736fb6cb7b33..3c8bacfc79e6 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -161,6 +161,7 @@ struct drm_pagemap_ops {
> >   * &struct drm_pagemap. May be NULL if no cache is used.
> >   * @shrink_link: Link into the shrinker's list of drm_pagemaps. Only
> >   * used if also using a pagemap cache.
> > + * @folio_split_lock: Lock to protect device folio splitting.
> >   */
> >  struct drm_pagemap {
> >  	const struct drm_pagemap_ops *ops;
> > @@ -170,6 +171,8 @@ struct drm_pagemap {
> >  	struct drm_pagemap_dev_hold *dev_hold;
> >  	struct drm_pagemap_cache *cache;
> >  	struct list_head shrink_link;
> > +	/* Protect device folio splitting */
> 
> I don't think you need this comment as we have kernel doc.

This is redundant but it is to avoid this checkpatch warning:

    -:248: CHECK:UNCOMMENTED_DEFINITION: struct mutex definition without comment
    #248: FILE: include/drm/drm_pagemap.h:174:
    +       struct mutex folio_split_lock;

Francois

> 
> Nits aside, patch looks good.
> 
> Matt
> 
> > +	struct mutex folio_split_lock;
> >  };
> >  
> >  struct drm_pagemap_devmem;
> > -- 
> > 2.43.0
> > 
