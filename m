Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF56ABF1FE
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 12:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBD710FD0A;
	Wed, 21 May 2025 10:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eF2muq3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E145510FD04;
 Wed, 21 May 2025 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747824336; x=1779360336;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/eBKaLdhkCm8ujyU9Zqz/YW8eUYimqafcffAGvQ05jo=;
 b=eF2muq3lZhMQxgizYCtpIhndLHnjd2zHbmEw+9szXk4TBp4JOfYpI56b
 NlMF4ohpcbUNrkE7y8ofTEff8xcznx1GC9fast0Ns5ldiTUIH2LPlSCL1
 SOVG5JDc5VW+3zUwnqeDQayCY3FVNNnotaatYT6nL8vdtNHq3XnOw6B9g
 yFko3+Ygv02EgqsmxonJtryr2jpLLv6yi7ToIQN7sioEY3qr9rHkCw0qE
 F50Ren8mOLWPgzlfo9xNiFc7bc+5GlU94g7Y5ZCdqC3me85ramJH/cvZe
 Dav4JOMlb89XNzfoF/JkGpYnv15xEacM7QhcahG1cM3YYHvXPyLo+WdQk Q==;
X-CSE-ConnectionGUID: xItysBK4REqfamyn9YntDQ==
X-CSE-MsgGUID: Gtrn1zcVT3abQIvfJqt8EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53592542"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53592542"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 03:45:35 -0700
X-CSE-ConnectionGUID: RuIKFPkHTjmbfWH0DPF9nA==
X-CSE-MsgGUID: jUnELHGgRheR8GHgOoQlQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140429869"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 03:45:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 03:45:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 03:45:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 03:45:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auowogTRzPFjuU/wwIQlqdCnQvXydsJJwTXAK2sBy9ttc5FyOfPiA5hhQOZqYlZ/0p8SDjkOjgWw5O7jBnPGeICBM96SEmPCaZU6+9r+sbSDVNt+dgpp2r3qbAmw1nozMrYy9K//DfcZCjKeegX4u1r+XL6oC/9k0XHOqHkHFfh4ED41ma3Qub9BBo3EXCha3s+S7TrRZpBto51ex0RXxYBe+IXttWwM8bemGitV1piYFffN/xp/YO+tkAdk4QoyLZGjih0M+bHH/bL/8s8EYqeQex0d+ZL7eqN5Ytw8EwyF2FVS9w6lGj1JRNZMSYWQMzx+aDuDKL/qyyFmhVBIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyoIqPdPRCZ9X1ropPy8WtkgeF9f3t6xjGhRQwCV5/o=;
 b=hzJ6B0TEedGxK5crAkzVWO2ZxMZ1QjodW5Qk99LmvlTeisjBjseBSpLMfsMYKfqh7taHtdUPwDtlaGP3IU236hCLen6Qfv66HxWqqC4kHYN48ln83MKn9SylUP7082Gq0YPC3HBYE1dbPHQ0ryWIHxd0TG+ZytWQ+BCxmQ1SDUvTjIY4VzikLBSbnP1ljmtm420V6zGwFwJHGxgDHq0GRFsYtRZmOloyZ164tL0mlbRa3XEvx1/J9aclT+Bh65Ap5R0z1kDAwf1V9fkSkNfEN98+IxrI5cIrVYgl5OS6uxwzZwwMk9ItvoxokNz9WMm7Gzn0NS0pV321dJj5miy3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH8PR11MB8013.namprd11.prod.outlook.com (2603:10b6:510:239::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 10:45:33 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 10:45:32 +0000
Message-ID: <132216ae-bc1b-40ba-878a-b6d250104882@intel.com>
Date: Wed, 21 May 2025 16:15:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] drm/dp: Add Panel Replay capability bits from
 DP2.1 specification
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250521093240.2284835-1-jouni.hogander@intel.com>
 <20250521093240.2284835-3-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250521093240.2284835-3-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH8PR11MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 1354b36d-73b8-489d-d9e5-08dd98549c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aS9jeS84dUl5aU05NnM5SzRWMHB3RDk0ZGNFQlJOd29mWEVmRXVaUWUwMTZh?=
 =?utf-8?B?Z1Q0VS9WSDN3cGFXR1czL2lCSnV4bHY3dmhRS0Y2ajJEUEdua21iQjFFZnl2?=
 =?utf-8?B?RnN6UFdMSjJLK2hoWkd6NkZETi9FNXRkeno2NW5aZGhCcnhaWkxvUmQvSk44?=
 =?utf-8?B?TExvVVNmNVhXb2Q4UDdOV0pFMnZZLzU3NCtHUENDK1ZQTEVpemhlang3VWgw?=
 =?utf-8?B?NldCaWJZc3JWZzRJS0huL3VzWVBNS2ZKZ2RnaERuQmVSTVVVaytCSit3OEQy?=
 =?utf-8?B?Um1vU0YwZllTRWpTRTJ6NVlxSFMvYjI5dEFGWExzWmlqNGxZSW9MdlBBWXdM?=
 =?utf-8?B?Sk5LVkx6YXBGeDFlb0xQTzNEYjBQZ2N1a2IrelBHUEp0TU56Z1pldm9qNURE?=
 =?utf-8?B?c1d3dUpBZTNJQmovY1EvZVlOK2FuWmJMYWhOSU1WQy9sUDZPczhFY1c4ejRO?=
 =?utf-8?B?WHQ2VFRhVmtsN1JhZ2ZVSDF0QVdRMG44ZmlBdTVkLytPcUlKVjZHU0tadnBn?=
 =?utf-8?B?R0RneUlCQ0ZxZHJldXRiOWEzOEV4bjRpRVBNWTF4MGtOSEJmQkYzcDVrYVhH?=
 =?utf-8?B?c2x4NVRDQzM1MCtYK21NdGtuWXNDNDhDbk5uS0ZHNHlBMmk1dTJzWnJtUEsw?=
 =?utf-8?B?clc5bjBLTnRPbStSWUZTdXp4WlNiTWRya21EcmFQVThFblFHaWZzeU1rQk42?=
 =?utf-8?B?aEcyc1VFbVAyMHhsT3Z3LzNEYm45SUxPU0YreW1PUjBVSnpIQmx3TkpVd2lN?=
 =?utf-8?B?Y09XWUlWYkdoMFJIWWlPdHBkU0RITTVxc2JER2JNRkNBOXNtTlJMN2EvTXJV?=
 =?utf-8?B?eXY2WHRUdUlJNE5XOEtHSXFBOXROQjRESWdVM0U2MmJDRlNlaHFwKzVhOWtN?=
 =?utf-8?B?c3Byd1Y1aXhIS0NodW9yajJJMm50MDBJd1ZFMEh0dzZseDZuVWp0OXI1d2pP?=
 =?utf-8?B?S2ZBTU9KWnhwNzRQcHF2U0EyNWFwdE5UUWpBeUt5SnplcG9jcStNTzRVaGtP?=
 =?utf-8?B?bjlZSjZHUlpzRkU5cGl4eDlEbmJKeDRoem8vdVNuSFh2cUpJT2FxaXZRUzZ3?=
 =?utf-8?B?TjRyeklGV0FpcWNxZjk5S0gyNFFlQ0tKL04yMmZyTjVKdldyNjlxbzJzY0Zs?=
 =?utf-8?B?VWpRcmw3bVI4V1c2S2FhWHBBazRlaDhYczJzU1ZoSVROUVBNVEdENUFtRllo?=
 =?utf-8?B?OVlwVVQ0aUltak84bklMdVpob3U2YS9wYWZNK2N4SmlMMXR2ZTl4SjcrVHBo?=
 =?utf-8?B?OGFwbWMxUXg1TlRZaG5GUGdqa1pUeG54elBLMGhHVGkvd3pSaE9YRVA3ckR0?=
 =?utf-8?B?OXJHb3BzeW1oNVdaTnJWNU1MN1d2NXN2WUlzT2FrZUJ2QTNGOWxZN2xuWHZj?=
 =?utf-8?B?YTR0djVXUkk4WlkrYTBkaDlROE5aTmFNRUpkQkl4TVpyUzF4NHQxT3FMT3BJ?=
 =?utf-8?B?ZXo4OE12OE4xbWpEREhqd1NzYW43MHNyMjdCSDlKSDhPMU5FRXdzeEZYaUlY?=
 =?utf-8?B?TlpnWVJNYzVRQm5GaEJ5Q1BYK3EvSXF4SWtQck50bmZrWkRRYzRhQWEyeWly?=
 =?utf-8?B?bmZmblpLNTJGLy9Vb0tKekFYUEZQcWEyZGFtRDVaaXhtdU40TXdFT2J5Qkts?=
 =?utf-8?B?SW1JSStadzMrU0s5NGk3ODMrTzE2L2Q4Q1pZRjFPaGlEUUJ4N0ZQcEJER3FN?=
 =?utf-8?B?WDIwQkxpT2NQZkdUZjcwRzVvYzNmSUpYaXphalUySFY2YnJBTFJqV3k4UmJN?=
 =?utf-8?B?ZGtDQlJleWhTYlIwYzBUSXlYV2c2dGJia25OQ0NyajkyOFBVMzdYTFJiRms3?=
 =?utf-8?B?YzVQOEhNMktLMWRYUjZwaXBPckhScytNd1ZMRmdGYlhHWHd5azdjcDJWN0I5?=
 =?utf-8?B?V25WUVNTdWduV1liUllmRlJMaTkxMktmTDBYZm1sNy9LNHVHVWdOcXUrZjVB?=
 =?utf-8?Q?SMorvT2Vlds=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXZnME1ybVk3UkxzSWV4VFRBd2s4RWhFVWY3SjFYMVlIUWM0NE9ZLzhnK3o1?=
 =?utf-8?B?bmhzQVFjdkdSa01SSkZFRjFZSXI0MVhBNnkvNWFEWTdtb0d1VE1qVFc2YzI5?=
 =?utf-8?B?dXllZ2pLTk1oVXhsbytSRlRrN2RmYW5XdVRJYUkybGkwTHdjKzhMV1hpRC8r?=
 =?utf-8?B?ZStxNkwvcERMbE0xeWdIL3hJeWdtR3FpaXcwSSt1aFI2RUc2Yjg5dlQ4eFRi?=
 =?utf-8?B?OU5JekNIeXlkNWpvUDkzL0NQK2pRVkdGVXMzL0lGSTV0bnMxaitGWE92SHZq?=
 =?utf-8?B?YkVGbWNPZ0JDNFF3Y2RZWCtIaS9zTUVnSXJkSkpOQ1Zza1lUWlhacTFTZWxR?=
 =?utf-8?B?cXYvS3ZRbTZIdzNuOWV1Z2MxNGs2dEdONHhlYnIyd3YrWUthY1hxTm1DcXpi?=
 =?utf-8?B?WWtieW4rMDdMYm1oTkdWalN4dUdBNUxtNkp0QUdSbjZ1TGZoZ3F5ckE2VzJS?=
 =?utf-8?B?VnQxbXpWMzdZVmFnOWlHaWtBVlUvS1JSMXdZRzdIM2VOSXMvRnFweVN4UzhU?=
 =?utf-8?B?WFhzN0FiaFVsdDArbmVpcmhRSWNESU1pTVR1My9ma1VxK1F0K3h2bmc2aXFL?=
 =?utf-8?B?djJPRndCT0FsbTlYTHU4TjM0Uy9jRzRZSWVjZWtMNmJzVjRUSjZ5WlQ3Umww?=
 =?utf-8?B?bk1qK0doVW85dHR6RVJCWHN5a3liRlZiT3dnRmhUVnIxYkYyZnM5YVYzcjhD?=
 =?utf-8?B?aEtCa0VJc0ZPaVZvaTRkV2xSSGhVY0JKRTgzRUlBeXBaeWlHcnhWYStCckli?=
 =?utf-8?B?TXc5SHY2VWRoSXMvUFdIN3VMdHo0LzBMWG51RjNlSkJoN0hJU0VWUy8xaG1h?=
 =?utf-8?B?OVErU3FjbndhUlc4L0dGdENpZlF2SThVZ0c2VzUvRWJxdkIyN1lGbGptdmpm?=
 =?utf-8?B?RkhaV3R4VVlNcnovVlRiZ1lTNk5Qb1lDSE5OT3h3V094Z2ZqZDN3VlU4NWNJ?=
 =?utf-8?B?bURtN1VQVnIvRDRzNkRUbTQ2bHdKQUpRL0JsalY1NE5EQndWSjZJbmxzNkpJ?=
 =?utf-8?B?dWJTS2k1TW5mZzlXVUdEMGZwYWU4OFR6N1hPcTdhRTJVWW1IcWpLRnl1NGM3?=
 =?utf-8?B?dDdDM1ZHb0t3bDlWM3NvYmhtR0piSDFBVXhxeVRVVytTRDJITC9ud3lFWnZr?=
 =?utf-8?B?bk44RzJibXJ0cm1ZM3BBd1g4a2Y4dW13RzBZYlVBd29oeGwwajBBNW8rbmtM?=
 =?utf-8?B?TjZMcWhIMVJjay9hT1VFSXF3ODVTaUVyNEhRd2hMSzFZVGRFSEtmUUdqc0tz?=
 =?utf-8?B?c2ZNRmNXTUEvQUxRYVhoTkwzc0h2SjVrTmhEdEFuSGhYckhhanJNblNJbVNW?=
 =?utf-8?B?eFd0cHRxaUtsazRWZ0syT25FbEVFYThoTzdacVRKN05UMkFxajNVZG5Mc0N5?=
 =?utf-8?B?Z3g0L3ZIMlZPR0hBb25PV0Z3VXhaVzVhbGs3dXRQa0pncnpLaVlSVWZHZktq?=
 =?utf-8?B?SGUxZ0dINDk1L0lmNFZET1dJZnVuOXpJYk9EY2YwaXVqb3lINnlCMEdSQ1du?=
 =?utf-8?B?aXUxcFBQeWVJM1FTVC9KL1RST3p6aXpPZTdmMC9vam9oR2ZLQzlVU3lhMkZN?=
 =?utf-8?B?TEowb1M0clQ2bkRlaGlkb2VoM2VYRnN0U3l1RlIyZlY1ZTZGbGtqR1dpbzZS?=
 =?utf-8?B?dnEvUmRhNFZXZmFWbHJEb1ZjQ1Z6MmtZd2FSeWlDNnJTMUdKVjE5QkkyZ2dx?=
 =?utf-8?B?aEZEdUUyanFnRlZoazBLSnVEWHZpQ3BFZTVJdDZQSjVYaWlhdlY4YmZuQVI0?=
 =?utf-8?B?U1VYTi9OTHdXOEhHOVFjZlVDQ0NiSnMxYVVvaVh2RXMzcCttOGxMWlpPZ1NB?=
 =?utf-8?B?WjJpck9ySVROOTcxSG96YXcyRHFTRk95UmhNaDhmcUxmMk0rTEhOQjVMTSth?=
 =?utf-8?B?aWFUL1p4VXI2S1RwS2pmWUd4MjVlTTJPSTJBTE9nTENNR0xhZ0xLWDdnTjZO?=
 =?utf-8?B?NWZCeDU3enJhNitCMmlJWEhtaTk3cDBYRld2Qk9KRjN0eUpZbVdDQlhHOGhI?=
 =?utf-8?B?VSs1aDF6YVFsaGg1OTRTTUlhNHZ5a2UwcGFnSk9PbGFGWU9ONWhOZithYm5I?=
 =?utf-8?B?ZmtVa3gzZTBKc0UxMFZXNUFpUmJXL3VaNmduTU5XenpGV25naTNXeGtRYWNi?=
 =?utf-8?B?WFBuQmtUdU8xVkM2ZEM2N3JqdlFnRmFjM2Y3TFZkMU1Ebk5hUkJmemdvRFM4?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1354b36d-73b8-489d-d9e5-08dd98549c5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 10:45:32.8538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA/jM+nTFOapSlxh2ltT9UvFJQHeSY8QuPzqa9SN/78FP3mj67GZMhPnaM9WQT69Bv6jW9n1xmbU03RuKgmRyivRtsZYCO+U51kqAH5wEGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8013
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


On 5/21/2025 3:02 PM, Jouni Högander wrote:
> Add PANEL REPLAY CAPABILITY register (0xb1) bits.
>
> v2: comment about DP2.1 changed as DP2.1a
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   include/drm/display/drm_dp.h | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 3371e2edd9e9..c0579f827999 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -554,8 +554,14 @@
>   
>   #define DP_PANEL_REPLAY_CAP_SIZE	7
>   
> -#define DP_PANEL_REPLAY_CAP_CAPABILITY			0xb1
> -# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED	(1 << 5)
> +#define DP_PANEL_REPLAY_CAP_CAPABILITY					0xb1
> +# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT			1 /* DP 2.1a */
> +# define DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK			(3 << 1)

Thanks for clarification about DP2.1 a.

IMHO if we are using the shift 
DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT1
then perhaps DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_MASK should be:
(3<<DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR_SHIFT)

Also the DSC decode capability can be the unshifted:

#defineDP_DSC_DECODE_CAPABILITY_IN_PR_SUPPORTED0x00
#defineDP_DSC_DECODE_CAPABILITY_IN_PR_FULL_FRAME_ONLY0x01
#defineDP_DSC_DECODE_CAPABILITY_IN_PR_NOT_SUPPORTED0x02
#defineDP_DSC_DECODE_CAPABILITY_IN_PR_RESERVED0x03

We can use shifted macros too but imho, these would be easier to re-use.

Regards,
Ankit


> +# define DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR			(1 << 3)
> +# define DP_PANEL_REPLAY_DSC_CRC_OF_MULTIPLE_SUS_SUPPORTED			(1 << 4)
> +# define DP_PANEL_REPLAY_SU_GRANULARITY_REQUIRED				(1 << 5)
> +# define DP_PANEL_REPLAY_SU_Y_GRANULARITY_EXTENDED_CAPABILITY_SUPPORTED		(1 << 6)
> +# define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
>   
>   #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
>   #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
