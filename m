Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C1B42D03
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE0310E958;
	Wed,  3 Sep 2025 22:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jX8EmWWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701D710E958;
 Wed,  3 Sep 2025 22:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756939942; x=1788475942;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jrq1Gew9tEg/JRYj/YzwZPTWnD5ACHkFXbTjiLmiFeM=;
 b=jX8EmWWNvziC9p+1fU3jcRLcDxf1kmdEjybG3wNoxL2K+38zqf4mutzx
 lUVnaTNIzzkGZrxHeTGOQOB6vN72JG+eTmRQAEXhnw/Hz238EpOmOTVJ+
 nU4QtGLAgJfK3m81f/JOFE0FIYBCQq0lTDsh5dtQgdtWuw96RyWZctafP
 U5FbZLxpxIyyL1fRGOtqmQ7q7RMnVewGQpea1FpjchTUblfLBBoZWYzT/
 asYmAOQyh4FoBD8X9GPFePrjbBcvfgbjkyQwStvz5xmlqt56PfJ9ENA/o
 EPQ6DJ1lPMjtLDhUT5h/EKzaHrkg7ZZZMaUZyd0zA0aleKu72/GVG1ZPF A==;
X-CSE-ConnectionGUID: liOmmxL+SzeJUlrZ/VN9HA==
X-CSE-MsgGUID: npBBVglASZC9YghuQcnAQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76717078"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76717078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:52:22 -0700
X-CSE-ConnectionGUID: ROnd+npqRQyl6Dwaypxa4w==
X-CSE-MsgGUID: spgH4Y2DT8GHnYetlvQBDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171012314"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:52:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:52:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 15:52:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 15:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNF2PGcGTbrKHJ2CR3U4kCygmL0jqsHR92pduYAoVu84+5OGVULX8dTm9CY4cA01nSNpIyyqsjNbnSFOSCjuxWya6QrDorQh82e2bubsX3jb+GnnJrY97q+6QFSnign5Ll+rEboVKlmK+FMg1b4wTYtWZirbXMNPA8Sdi8SSypHD7GG3rQTKxS9hY1PXAUWVJDMw59CwuaNiW4EPTkL0hnrQJo3lCf7Y91DnSfzR0fuAKXvfoIAkTwsl0W3DwVihBBBRn94t0MN+3Jkah2++Ay1B3rMTBymjcRrKkk7bJhWKY+w5irM2iSbF26QMSo/530F6EqI0RosjDIZ6kqVaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJd40AB4964ApElnwkboZ+VcwfcEuajoxemPRe853Qo=;
 b=rTE/ZsLeTKc5tOyMzB7TY0BMifYRMNb/GvfBAOis5jD13NYn5rPEF/gDkvU8y+6TQCp6SiW9+/VsOmFhkGkUAKHyC0P8BtFqj3oqbAxdDLccfETYgavL6517H4Qd52kzzOCFpDGOM4NT9hylafbVn2thGSERS3fRf9M8yjFiOO4xJZLdI+uqj671CuQU3ja7rz/cXXqHRbqpE2rR4rNPbhu3Ew03VIv2zOLygvUUM+88g2aaano1lApiyjXEZABPfqV/2Wkfp9az08O8rufSvf360ux9RM9gFTcAFfJ0WJ0h7bHS+3iSdOwLtthzLuqt+dkcT+SMetMSPu58Nnp6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 22:52:18 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 22:52:18 +0000
Message-ID: <ddc725e1-8906-4e03-8590-c75c0ea351f4@intel.com>
Date: Thu, 4 Sep 2025 00:52:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/xe/pf: Add a helper function to get a VF's
 backing object in LMEM
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
 <20250903223403.1261824-4-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250903223403.1261824-4-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0116.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::45) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d84bc7-5a53-41be-e439-08ddeb3c88a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEE1WVFnOG04SGU4WEFXYTBxWHhpUEd0T1N0bmxhd2lkYUFJMStDbXI4cjlo?=
 =?utf-8?B?S05YTWNEL09IR1pTYmEzVkplY2NHWHhScHQ1cmtTNFljakF3MWVBYTd5cjh6?=
 =?utf-8?B?OTNKSWI5YjJiUDVKV2pOd1FMOHVubForSDE0VDFGeFh5Zm5Sbzc1WndTZU5H?=
 =?utf-8?B?QjFOWVpnVlFoNW11WVJOMGo5dXZOdG5TemZGSzNGY1NKb0xTWCtUL3AzZERp?=
 =?utf-8?B?WVZVU3oraEorY2V2dzVhdVcxTmU4NTdQVFZBTElJWFMwdmhFQ0tXVjJoRlNF?=
 =?utf-8?B?UU4wbVYyR1g0YTZnNlFnZVd6Y081UDBmMVpEaHIyVytHQkppQkVZcnNIOHRx?=
 =?utf-8?B?Z3FUS01jVTdhY3gwOFRON3RZSURrQVVIdUtHMGZ1V2hpdFJRS1A0VDRRdDhK?=
 =?utf-8?B?RlR3T2FhcGUwN3c0SlZqNEM5QnNzV0JCclJ5MXJjbHl4NG9LMjc5RFhYQ1lP?=
 =?utf-8?B?Q0gzSVFsL0VPMlgzYlgvakdOaGR2a0RFVmtDb1d5WW02WVByakRwaGhTMkZy?=
 =?utf-8?B?aGdnTHJ3WGN2b0NhcUNvblY4NEdaL3F3YVI0aDEzcjltNXBocUNlVENCbmtq?=
 =?utf-8?B?Q3M2Y0JZU0NzNmNSSldKaDFZdGtkczZlazJmY3l5YWIwZ1hZSE5CcHpaZG1F?=
 =?utf-8?B?TmtJRXF4OVJXY29sUEpjSHZUMGNCekVyTjlEbFhDczd2N25RU1BDWnRzWWFq?=
 =?utf-8?B?NytSSE00Y0FIdXVQMkpuaUlsZ2RvREVjTE9LUjlJMjdwZERxOFJzSS8yaUZ3?=
 =?utf-8?B?bUs1QS9RWEV5VzA2a0VUNmxHS0JuNXdUaDJUemwxZ2daVUJac0wwU25zWmFI?=
 =?utf-8?B?UXpNcW5mWnN6VzQzVEVOdGJNQzZQSEN2L1RoNGJpNGNKK25vR1J6bnRkbmpG?=
 =?utf-8?B?SkV6Z3JaeTBkejJzWEU0Qzhrc0FiTW1wTVVQb0IwM2xid1ZTMWdnSi9YWTN6?=
 =?utf-8?B?TENNblg3MG1uaVhzdUhuTmlISmZObnBMckp3TDdyRFNXVUlPZTNuTS9TbjFG?=
 =?utf-8?B?VW5ORFBWLzlhZzlzUDZYUzJmTzJaRVAyUWdnTHc0M0NLSVBaMG9lUlg2YVFT?=
 =?utf-8?B?elFQS1ByS3ltdVdvS2U4anRmaS9vVzFrWnoxUXRBRS85YStkZkhJQ0psSWdF?=
 =?utf-8?B?YXpjU2xvd2REZHZ6YmJ5RlJaUHhnSXEreHR5NnRIbWNOQnZ0R3RiVGR3TGJa?=
 =?utf-8?B?ZFZSdy9DYk5VWVE5WFA2UU9DUCs5V1dnOUh1TVNwTk5LVmhEK3ltZGkvK0tJ?=
 =?utf-8?B?N0JvcWFtMU1IUXdRb29ZKzVPa1hETVZzeXk4TE9KTXJXYVBLV2Q1WU91NjYr?=
 =?utf-8?B?QUtxMlNzVmNMa1VWK0lqelE3ejdLWUhhcWloTEhTR0tMRlF5UUZpQzJnOW5p?=
 =?utf-8?B?a1NRbGxtYy93QXUveHE5RE85dmc4TjlUSXpTbGczVFV3YTF5dVdkT1BoUS9N?=
 =?utf-8?B?aGhpNUFRMjQvZUZsSEN5ZVY3YUQ1RkFjUGtVbTRXallBOVhLQ3d0VU5oYmov?=
 =?utf-8?B?dW9WY2J3c2FyYmtSMEtSVEFUK0RhUkhXQjU5ZzhjeEVRVXNjOHR4Ui9hbm5R?=
 =?utf-8?B?em85RG4vZW12c2d0SnUrb0Vva2FhUm1HQVNWSkVJejBYMmk5YnEvd3Y2ZzV3?=
 =?utf-8?B?dkpBMStVeGJXeE1SOWJPMUphclV6cHh6MitBTW9RWDE1NHhHcm9va21palNk?=
 =?utf-8?B?cmRPdnNMbVViR3Vmc004RGx5NG5ldnVieWFHM0MvTy9SY3FVdXQ2Q3ZBRGFh?=
 =?utf-8?B?MG5xTWJDbXFHazdlU0N1TXJsOU5KMXNnVmpWRVNrRnk2Qyt4VnBhVWpQcU9L?=
 =?utf-8?B?TGxTeWsxNThrK01HL3p0SmQvS3p3NlArajZSek1OQzRCRHBTbTdobng1b04v?=
 =?utf-8?B?bFRIZittSTR6S2Z3RUlQcUtjNXdnTjIzRnNhVU14dlBXNHYxcnNNSTlKWlhm?=
 =?utf-8?Q?FzlGwlyec5U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHB3dlYwL0VVNXFNTGtHZkozY21BOTFvQXlOd041b2RmWXkzSUdWUkhvTnRr?=
 =?utf-8?B?MURsK1RNdDZxcWFtTWJObmQ3N2hBV2pHN0JIS3FPdGpDVzBadmszL3NhUFlR?=
 =?utf-8?B?MVBlOUdMVE1mQUVydWc2MldVNEZ6R3I3TXkrUVRWUWptU01RYkVsLzh5RWlE?=
 =?utf-8?B?SzNjWld3M21pTkF2ZXEzcGNTRTczc3pJZUt5TkVUM1o1M2NEMkVaU3pkamIz?=
 =?utf-8?B?Q3d1bExkZ0RVQ0ZvZVNMNWJwTnZ4d0NkNTY5azk5elZJTjRVR2h5dHFVQUFI?=
 =?utf-8?B?ZXlKdUh6djFWc1FXN0VVd1pFWDFhVk00TU1YalNBVmxOS0dXSDdyTnV3djZU?=
 =?utf-8?B?NDJYUVVBeS9vZDZ4dkQySWNhNVA5MkFaYWl0ZTlCUldhbEtENVNiMEo4S1N5?=
 =?utf-8?B?NHNSb0dob3hWMUJkWFhZZGtMT0k3RmRNM1BiUGpmdmk5Zk5mV1d4RVN4alVV?=
 =?utf-8?B?aEc0RHhmWGtKS1lpMmt1aGxIS2g2SFVwRlk0LzJjNS83TXkzN20rUCtWQlBZ?=
 =?utf-8?B?NU1aaDV1T29RTGxDd2I0dGx3ak4xTGRWV2U0TnF0YmlrVUh4NTZUOHhQMUFn?=
 =?utf-8?B?cWtFS2VrcDlnY0l0NDZVdWlJQ3VCTEpUWUE2eVYxMDdiQm11ai9nQzh5bmc5?=
 =?utf-8?B?VU5BakpoUnRIamwwb0IrMFBsRUdzTE1OdHJUMFVEb25yeEo0RE05YS8zM2po?=
 =?utf-8?B?emJZbks5YkhJRDdabXd1TndmRkJVR3h1VlhsRVBDQ1ZBVVgvLzduQ1FlYmEy?=
 =?utf-8?B?VzM4cGREN1ZVL2YxaXB3MEc3cmdpa1lTMWo3Z1JOb0o3dlBmZFlKSldOMytP?=
 =?utf-8?B?S3IwVW1va0cxZ1F6WHNoSUpSemk4blVtL3NLMWZCZ21KdmVWYkYxdUVrYzhQ?=
 =?utf-8?B?ZFlOWk5QSXVrRDR2VHNBYjhuMEVTQzY1QWtKdUVlT1VwRzRkdFlmOTZOZHV4?=
 =?utf-8?B?d1oxazM5RE5QcDFaUXJyamd2NVUzdSsyaG0vQjdudHBuK05UY3BzdVRhUlFv?=
 =?utf-8?B?MTF3c3VkY0FaREJQeDdCa0lhQi9wRkZ3aFlHODRnM0JveURLT1U3ZDQ4ZXo0?=
 =?utf-8?B?bHo1R25qSE5nVGdQZEpVWmh6OTFYandhU0tOQi93SFhrT0dTZjFYR2EyTG5x?=
 =?utf-8?B?dG5MZWpoNzRpRm80OFY0TlJFMFY2K0J0VURoODk3eC9PRGg5UUtLS3hVNjlj?=
 =?utf-8?B?NXhQYkx1VjM0czFxa1QxMHJhWFc2aElNM2JxdVFpc3hCVU0rMFkzMS9zMjE5?=
 =?utf-8?B?enp0VjkrWXRvRUZkQWlRMk1XMEdES1UxZ1BEckdYbXpxR2tFQ2ozSXVVckpG?=
 =?utf-8?B?OFY0UXE2TFRiaXJOMkt4WVdXU1dOV1VHenJPRjJNUGZPa3dKRmUxZTBycFMy?=
 =?utf-8?B?SWFaMjZRekQzdDcyUHdwRFV4bnhQWHNhMVZkRUtqcG84ZnhoTjFHVlNBT0ZN?=
 =?utf-8?B?ZXRjZndRS0pqcldxN2xnMGNKRWQzblpNcHNnYWliWUloUCtiY2VYcVRLb3BU?=
 =?utf-8?B?MVc3T2Z4eHZxZzZ2djJ2b3Q2RGNrNjVnVm8xbGEzZ09zbjFvVTRMWWdYQnRQ?=
 =?utf-8?B?eEVUNm5NSjhiMlpJaFlrSkN5L2wwOWxHcjlLTThhWVhEZmFoRmlhTUZCV2Fo?=
 =?utf-8?B?d1J5RnVQT3pmMmlrMTVxbFlBUGttVWdYN04wUE9weldZeEgySFI4a0cyYnkx?=
 =?utf-8?B?dFpybDdrRGVvdmhCV1oyU0ZHWDY4anAwMHo1QjBEWXk5eDJnMmVFTTNqWGFS?=
 =?utf-8?B?a2RsUUoxc2g4VllHb2dmMWoxcU5qRVoxdGxtUG5ZaHdrNDJJcGkrNmxCL1Yx?=
 =?utf-8?B?NnNPYjhSdzdobFFQMitQQ1BhMTV3UTcrK2Y4V0g3VHRIbExxS3VlMVBQdFZS?=
 =?utf-8?B?dVBNb0xOT0xwYURBQURXWFhaQUhua0lCUlNZVVA3TTVGbUpPNDJUUy9vVFNO?=
 =?utf-8?B?MDU1TVEvdEVncFowRVJHaE9sRENnMjZTSFJxQVBvb05VQUtLaVcyUFR5LzV0?=
 =?utf-8?B?QjVSUFp3ZFZoT21uRTg3UDFzYjdNbWlGUTEwbURjUUswUzc4bXlUTXNFNEpG?=
 =?utf-8?B?N3BLdm9SVmlMKzBHbmQ1THBhMWJEcWhDKzA4QzJoVEo3cTVxWWtoekJBQ3Jt?=
 =?utf-8?B?K011aStMVEpWOUlncW53S3hnK0VYWHlWcURmMlBjQjM1NTdHQUJMUjI5L3Bu?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d84bc7-5a53-41be-e439-08ddeb3c88a3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 22:52:18.1708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjV3ekXg5QZJ6FystaGesdR4dxxVrGBOxsCruxAN/eAMwjS0FzPthan6tdVDeU2y5P+6pIFZO0qN1NYJOGE6VQD7HZcsRbNdpnoDf6UZWxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
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



On 9/4/2025 12:30 AM, Vivek Kasireddy wrote:
> To properly import a dmabuf that is associated with a VF (or that
> originates in a Guest VM that includes a VF), we need to know where
> in LMEM the VF's allocated regions exist. Therefore, introduce a
> new helper to return the object that backs the VF's regions in LMEM.
> 
> v2:
> - Make the helper return the LMEM object instead of the start address.
> 
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index c8f0320d032f..e01f5b340999 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1542,6 +1542,29 @@ u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid)
>  	return size;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_get_lmem_obj - Get VF's LMEM BO.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * Return: BO that is backing VF's quota in LMEM.
> + */
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt,
> +						 unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config;
> +	struct xe_bo *lmem_obj;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	config = pf_pick_vf_config(gt, vfid);
> +	lmem_obj = config->lmem_obj;
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return lmem_obj;

note that this bo pointer might be stale outside master-mutex
as now nothing prevents other code or user to unprovision VF

I guess you at least need to use xe_bo_get()/put()
and/or introduce some logic that would mark this BO as used

> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_set_lmem - Provision VF with LMEM.
>   * @gt: the &xe_gt (can't be media)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 513e6512a575..bef459003de1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -31,6 +31,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsi
>  int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>  				       u32 num_dbs);
>  
> +struct xe_bo *xe_gt_sriov_pf_config_get_lmem_obj(struct xe_gt *gt, unsigned int vfid);

and please place this declaration as last one in "lmem" group

>  u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
>  int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);

