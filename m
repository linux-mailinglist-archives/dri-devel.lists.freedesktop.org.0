Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8117FACC31D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AD810E6EF;
	Tue,  3 Jun 2025 09:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5fOBSaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9470110E5FB;
 Tue,  3 Jun 2025 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748943135; x=1780479135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kxUitq2lj5RIxHCc76WAC28SBOZmlGwDvH4+h4bp+Qo=;
 b=B5fOBSaTyrkaAabXMhUY1Ma2qfr6o4GfT2ic4awiQPvum6ciG8XLBLea
 ATE4D84tMyc0Kmz5J2ioMQpcspfsRBNMk1CXbILZp2dRVbshRwZx7nF5K
 8qV+Rh8wpxbHA7QuN1ZLirgyyFf5RSZFFfIHPmWw8R1gVc0OEBMxC9yzd
 sky6pV6WdCS4xpyFTOkWnIUumfyFgGovWD0HW9Eowwe86WLf4ttVl/lpP
 R3lY5mqJtwQd9bjCkpM15xhWXQnAfPZE231AdGteYHZk/OmftmEzjzSDO
 nEYWR/U5zcqbRV14dU0EXqq3f77W+KBSlRo26/1WfDyovfDlSxbGz1Gfn w==;
X-CSE-ConnectionGUID: lrmu1BP9QZ2YHTIwr2cdHw==
X-CSE-MsgGUID: Ss+OIgQxRFepoit7SZx3GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68527764"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="68527764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:32:13 -0700
X-CSE-ConnectionGUID: XAfddk8YTAWLpcWwoD9VeQ==
X-CSE-MsgGUID: i6azf+5LSEOytQ+w/APKqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144688136"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:32:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 02:32:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 02:32:09 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.69)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 02:32:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvOQw/2017b19+GzIpb8lhiZOMR+y4Tmo3u+GHit0amGRlLZnxnAY37zWb6Yo8fg44OMnSyVZFx1/tZOjmMP+XTUyzYDZI8mo56z6vzieFLHgtcokZRU1AeQYCgI7+XyaW/nDZKS6by5bMR4HC3X/qfSFfHwNK7g78zY1FN2m2qwy8pJwyp0bp0Gar59h0627jpASYV2HCyGB8rljA7jRvjo4iNAECI8a1E2ItZPTDXy5hQ8Et/L8gCK3MpDI5JcLhl5yLA79LvQ7hTUj2sjY5rd0F/d39k99FzZPAO8MFOYJ4eF3DCXn1bes76lsgvkNCufWfXq6ohzUPitmHQFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXYRHipSL+oaUwI+SevO0sIKMKtZzpVk8mR5ku/QkxQ=;
 b=C4Yu06TosI6Pmw86sRD1fo5Z4Ad0ZVwH6ev1X/B6r1K6LnCfZQgp4bW0V4ZX9uD/oVIdgjAOM0IFnZ144xwbS/MJyzGxS63ont5+qc9Pvzz5/8iVhb/VYdnjK/pNbcRmsvn0/HSRLuJbTAuYKjkufQ/+Pp/yGKf6c+7arXe+zJjTkh7O6wh8abHEP9nyW9w5pYQHi1kXwvhxg3hB0WgImTSbDQumlkfxu7HhGvkZNAN0fIsL2CUCkYACn/KyE9IvB2SL4qPod5jJMetO55g1QWHT7uLlxJHyowcke0g4fH34ZkMK2hkDXY1GQQR5aviz9FtFVJ8QDXPCP1hz6vyfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ5PPFED9C9AC99.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Tue, 3 Jun
 2025 09:32:06 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8769.022; Tue, 3 Jun 2025
 09:32:06 +0000
Message-ID: <9199cb44-6db3-4a1d-87db-24d018ad0288@intel.com>
Date: Tue, 3 Jun 2025 15:01:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <frank.scarbrough@intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
 <20250603081409.1509709-5-riana.tauro@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250603081409.1509709-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ5PPFED9C9AC99:EE_
X-MS-Office365-Filtering-Correlation-Id: c5768c51-3304-407a-f1b5-08dda2818133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2NjdjJVeWlrVXFkS24wemFoeG1sdDhZZDdEZ295WXlJQU9VN1krVERDTnAx?=
 =?utf-8?B?RDJrdVBIT1EzUHdUeE9STTY3R3UvQmpSZUlOSHQ4MXIwdndVZHdzWmNrZkFl?=
 =?utf-8?B?U0lqSjNoR3dVRy9GNTZhSTBiZkM5cHFHUlFCcTN5Tm1RamUrTTZzeVgxZG9G?=
 =?utf-8?B?akI3WUR0bU5NVXZ6RlB1eDdBZmxCZEtuMisramJMTUlkZFJMT3Azc3I2YXpJ?=
 =?utf-8?B?bHNOYmhQdGR2SUJrTkYreDhHaWFJMHc4dkU4QjlwS0dsWEQ1UGhHR0w1Y2NJ?=
 =?utf-8?B?Z3NocEJGTE9ZMlZOSS96L2prWEFmRzhKZndDcVJvaGZmd0I5VkJ1emt5NEdS?=
 =?utf-8?B?U3NoQ2VtYzVtUC96Y0FaU2grNFEzV1pMZFAybGtKeCtkUklSaGlCcUMyMDEz?=
 =?utf-8?B?TXd1RTZQM2JISWtEY3dkL1ZSM3lpaWFZU1ZCNnZFMzJld1lLQTdkTnM5Wlhi?=
 =?utf-8?B?bDZuNzg3K2lwMWlxTU9vVlJBTUp5Y0QrZm41OHY0N1NoR01PYy9idi9HenpI?=
 =?utf-8?B?VkNJMmhuMmtSRFYrelBaNk84VGdqR2ZPWW16T1JjaldPNGNKOXNrZGJ1TmVr?=
 =?utf-8?B?RE9oanZhTlFsQVJlVUxlL3RiTEF1dElRdUhsejFlbGJhODFkaXc3aHFMTXk4?=
 =?utf-8?B?cDQ0QzBuV28xYmgvSlY2SzVTMTd2ZjdMaTNNcGNlYTQydm1Vd3ZRdWx4YVJi?=
 =?utf-8?B?UkJVSjRUeEdRT0pxMFlDSHh0U2xpT1NjdmYyakhJN2l0dzRDYlErUHpGVG9K?=
 =?utf-8?B?ZkYxc2p0UWVwUmRHMXNRYTN4aEMwT2V3eXFPaTRwZU12ZG9nZUZWL29mN3Y4?=
 =?utf-8?B?eHlXVTdTUDdtT3MzWnU4SUUvUVZ2blhHNVQvdm1nUHNkaHg0dVk0ZHhTNlUy?=
 =?utf-8?B?bVZtV1g3SmpkcEMrdFJXNm5vTStlMUhIRnZHQnc2cGxMbm90WkUzdUNyNGlk?=
 =?utf-8?B?SnRBdVcvQ2grZlF5TU1uMDBvWkY5MTJyZ2NhdXIzQVRZWDBLWWRVRldRWmxz?=
 =?utf-8?B?OUpGSUlxSU0vMmt5bU56S3dKcWhoVTFOSDZJYUdOS0t0NWgvc3VNUFByREtB?=
 =?utf-8?B?UEZJYkdyc2JMdUlyZ1crOXJDSlgvMkFScnlTZURqeUo4alV0MHF1QlFhWXdO?=
 =?utf-8?B?NzlXajNXcnUrejdtVzN3MjBqdEFxY3I5N2F4Q3p4KzIvekRCdlpxWTJPbDM0?=
 =?utf-8?B?VEI0bHF2ajlOMzdYekJxdnFFQ1hsNVB1RHNFc3dSRVlNUjZJQ3psZS9hS3Vq?=
 =?utf-8?B?MW95WlVOVGNNVytGVmJrcE1haGk2V3BWWEZDMlN6cmVmRm1QMXdEeFN0SGpB?=
 =?utf-8?B?RXV3N29NamhaYjdjdDFQanRqSVdJVzRWU2V0K0tqdmpWVDZ4MFhmUTVzRGdR?=
 =?utf-8?B?eGJYNnl6S1FoQXlvNk9STHp0MHhtdzFWYUVJTFE0QUxQZDBodzBRR2JjVGEv?=
 =?utf-8?B?dWhxTEh3ZnFuMzhOYUlPSzN6Wmw4dHdhSXBXRU5tQzdNeFluS29VTFpOcVlF?=
 =?utf-8?B?bkxoR245QlVNR3IwaSszVnI3c0hZL3N3T0pGdzBSNVpMTmdBMEQ2ZlIrcWR1?=
 =?utf-8?B?SWlZdkdtK1FxdUo4VWRWc1A4bkNxMnd4d0hUMzkyWlVYTWlzdGkzYTY5aitG?=
 =?utf-8?B?RFZVYitNdWp1WG5hdUFBL2pLRWwvQmxDUnJqNE53WjU5Vjl2VlZaVTJoY2lQ?=
 =?utf-8?B?OVRMTVRxa1RjaWFqbFB2RXN5YTN4MFdYZG1DZHc1LzBUaGNOanluQnJIOFFm?=
 =?utf-8?B?TDhwK0ZuMkRmdkQxRmY0L3hsTGM4bnNsM0xPbWk5bVFyRm9JL281RzlxVHVZ?=
 =?utf-8?B?Z2NZQzdlVE55ZnFPWmE2NVYzSk0wOXpJVkJZaGN2WVVJZlgyM0k4R3VITThq?=
 =?utf-8?B?VU4yb2h3NGo0ZnBRcXRZbk9oMU1OakRWcFE0VStMcUYzbXVJRUQ3dzRQTHNr?=
 =?utf-8?Q?EZKKPQcndac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVFGYVZUaXBndFBEazYvYlp0MEVacHZyb1lac3VsNSs4ZVpuZFdDRHFJeEU4?=
 =?utf-8?B?a1lVZ1pWdWFPYmlJVnJ6dC9jMjJWMWN2ajZNMlo4S2R1L3JlQXpkcThwa3FY?=
 =?utf-8?B?M3RvdURXekpKLytYS0lOMUI0ZzVybU5EOVJxUG90QlIxaHVwaVZBcSt3MW5w?=
 =?utf-8?B?dDJ1NStmTTZoWGQxd09naUdnemkrbk5hbHlNZ0hRVDlPc1NkeGZQRlBSRjhG?=
 =?utf-8?B?MEVsMmt6Q2Y0ZWs2UDRoY1RHc0Iva3FzVTZtY3ZobDdvZFl6WWpCcVlweWx6?=
 =?utf-8?B?cFUwSEJjZXQ2ZzhOMHhna1lpS0tRaUkyQ2xZQ2lxYlRqY0U3VC9vMEc2eWJF?=
 =?utf-8?B?cERnNG0vb3Z6b1lQUEdJaTZQRlhvbmxHdlBSV3ZSOXA4UEJHbm1rTnFUaFVT?=
 =?utf-8?B?SWxtSUZsZTc3dWlJeCtZa1ZtR1NFRmhyb3EyQy9rdHFOUnRnWHlteEwxdmxx?=
 =?utf-8?B?WU9MZTkreDIrQ01UazIvcEV2YXY2WlRDbDdlaXV4ZHZLLzZBZ3ZuZVQ5dzN5?=
 =?utf-8?B?SzROZ05rbXhYMDNaUEJKcjlsUElMdmN3OXVzTExMRFh6RVh5bTJheTFqRHp6?=
 =?utf-8?B?aVp4Snlid0FlQXU1ZkRaZWtUUVM4Q3FwdFpGSUtNWFJXL1k0KzZ5akFQd2h3?=
 =?utf-8?B?STY3Y2FxM0RjVzQvNWNRSnRrT0h1cnVabHZmdUtGbWRUbXJLZVNYaElhVDJ3?=
 =?utf-8?B?MjNKRTQ5Zk9vUlRzVFdmZ3RIWFNoU3pkN1NhNzZLTXUxRjRxNHhTajFFcklO?=
 =?utf-8?B?Q1U2L1psSVJXditlMEVQeHVHWDJqTm15SFRvUFVNS05sdnlHMjhTaERJZmwz?=
 =?utf-8?B?QU1SMXpwRnl4QzBBMzJTT2srZGlIMEp6RFgxUnEzQUJQZ3hLKzU0eWtEZVRo?=
 =?utf-8?B?NWtVYktORTZVTC9vT0hGM1B5UHlLdnI0Z1Z1NGZuN3VycEdvVTBkbmJJSW1p?=
 =?utf-8?B?MTlzMkVQNDBFOFBoY0lOdng1WStyN2oxUmRqL2VVT3p0cEVQVnpWSnA3aU8w?=
 =?utf-8?B?V1NaczltYUFTMVZYRHppNzAxOGJ3T1ZSVXBBZ3hHQUpVOHpKcExIOVZ3V3Z4?=
 =?utf-8?B?TFZVNjlxZEkyZExKeFo4V3g2b2crMWY1RnBWcGZDRUFaMnVBeWtBYmhoN200?=
 =?utf-8?B?SXZYSWRvUnE2bTNSK1duUXMvN1EzZ0lrN0NIc3pvQkJkUVlJZFl4UmtlMjc2?=
 =?utf-8?B?VEI0YXlIUEdCSkRrUXAraFlNZnZFTDg5S29XZjgydkJMMkhjVHVEN01TMDU0?=
 =?utf-8?B?SEtVb3NFdzIxUjZFNERJMnVkbW1wSCtteVNaWkgraFlDb2ZYQnFVWlRLaGd2?=
 =?utf-8?B?R2RRWXpoY0Mwam4wYjNjWGhxUGVZY0F0LzIycVZKSmsvbUhvNDFDcjF1MjI3?=
 =?utf-8?B?dWpBLy83N05NNVgzTmpsZVU5RG0rR05zYmpHbUVuNHZWcXRKS1Jnc1drellJ?=
 =?utf-8?B?NUZsU2FHQWU3dVAyZTB3WW5SN3JrYkpaclhvNEJKQmk4cVI0Nlk3aWtKQm83?=
 =?utf-8?B?bVIzWjgyd3ppZHNIdHFPR0M3SU1obEw0elU4TDN6bDlYeVZ4NUNpNm1Uam5H?=
 =?utf-8?B?dXN1aUdMUU4rM0c3ZEhzbHZ4YUQrUFJQeU94ODFpbmxmZWVRVUttaGJXYThS?=
 =?utf-8?B?TEhoZmR3bDNFSmMvSk8ySHVSOFJ1ZHVYREpvMHRTSmJ2Wkd3am5pbHJZTXQ4?=
 =?utf-8?B?WnlUcFRwajVHY1Z1ZGxVK3JmbGZRREY5NkhZK0dObW1FOWg1UzJ4a1A1OWMv?=
 =?utf-8?B?WnhTZHpxd3Zmd0JTV2Z0bmJweWJTT3Q3NEE2WE9qeHpsd1pjRmhNMi9IeGFZ?=
 =?utf-8?B?TElvU3QxWmlhVllUTXg2ZE9LWmNHVGExcnVza01kLzc5T3krZXF5V2pWOXlZ?=
 =?utf-8?B?RmVpOEpmdHFYaDA5cVpXenRseVVWbFJqbTlvVHZqaUN5UldFTUpSTllEY0ZL?=
 =?utf-8?B?SVprTWdBVzRnOEdPN1ZicHlwazRJREpGRy9BRWJvQzRZSTVaRHdDbGJLVkQ5?=
 =?utf-8?B?MkNFVU16aVZEMFdSUVFQSVRuSkFZWlpiNlpsVlhidDBueENsYWhPLzltbU5Z?=
 =?utf-8?B?dS9KTjFGcVo2K1h4Ni93cTJsUE5GTXY3QW83aXkyaDYraVhhVmtvZ1doK2lN?=
 =?utf-8?B?bnU4clVSODhIY0JHbFd6bFNTSHhSRVNKSG1PczcxYjNhVnZYMlJEZHdyK2pk?=
 =?utf-8?Q?LTHYRjMxUCfLsx/5orP08aU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5768c51-3304-407a-f1b5-08dda2818133
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:32:06.3286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8qApIapX0/Jne2M5V1taclSWLp6MDvl1DFIv9ni+NXaXVJaHxYCxCs3i8temrbkKEj0Yv/ZQOJhaTvzvMlERFcXGyfAn2InzAGQal4/x8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFED9C9AC99
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



On 03-06-2025 13:44, Riana Tauro wrote:
> Add support to handle CSC firmware reported errors. When CSC firmware
> errors are encoutered, a error interrupt is received by the GFX device as
> a MSI interrupt.
> 
> Device Source control registers indicates the source of the error as CSC
> The HEC error status register indicates that the error is firmware reported
> Depending on the type of error, the error cause is written to the HEC
> Firmware error register.
> 
> On encountering such CSC firmware errors, the graphics device is
> non-recoverable from driver context. The only way to recover from these
> errors is firmware flash. The device is then wedged and userspace is
> notified with a drm uevent
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
>   drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>   drivers/gpu/drm/xe/xe_hw_error.c           | 65 +++++++++++++++++++++-
>   4 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> index 7702364b65f1..fcb6003f3226 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -13,6 +13,8 @@
>   
>   /* Definitions of GSC H/W registers, bits, etc */
>   
> +#define BMG_GSC_HECI1_BASE	0x373000
> +
>   #define MTL_GSC_HECI1_BASE	0x00116000
>   #define MTL_GSC_HECI2_BASE	0x00117000
>   
> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> index ed9b81fb28a0..c146b9ef44eb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> @@ -6,10 +6,15 @@
>   #ifndef _XE_HW_ERROR_REGS_H_
>   #define _XE_HW_ERROR_REGS_H_
>   
> +#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
> +#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
> +
> +#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
> +
>   #define DEV_ERR_STAT_NONFATAL			0x100178
>   #define DEV_ERR_STAT_CORRECTABLE		0x10017c
>   #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>   								  DEV_ERR_STAT_CORRECTABLE, \
>   								  DEV_ERR_STAT_NONFATAL))
> -
> +#define   XE_CSC_ERROR				BIT(17)
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index fb3617956d63..1325ae917c99 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -239,6 +239,9 @@ struct xe_tile {
>   	/** @memirq: Memory Based Interrupts. */
>   	struct xe_memirq memirq;
>   
> +	/** @csc_hw_error_work: worker to report CSC HW errors */
> +	struct work_struct csc_hw_error_work;
> +
>   	/** @pcode: tile's PCODE */
>   	struct {
>   		/** @pcode.lock: protecting tile's PCODE mailbox data */
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 0f2590839900..ad1e244ea612 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2025 Intel Corporation
>    */
>   
> +#include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
>   #include "regs/xe_irq_regs.h"
>   
> @@ -10,6 +11,8 @@
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   
> +#define  HEC_UNCORR_FW_ERR_BITS 4
> +
>   /* Error categories reported by hardware */
>   enum hardware_error {
>   	HARDWARE_ERROR_CORRECTABLE = 0,
> @@ -18,6 +21,13 @@ enum hardware_error {
>   	HARDWARE_ERROR_MAX,
>   };
>   
> +static const char * const hec_uncorrected_fw_errors[] = {
> +	"Fatal",
> +	"CSE Disabled",
> +	"FD Corruption",
> +	"Data Corruption"
> +};
> +
>   static const char *hw_error_to_str(const enum hardware_error hw_err)
>   {
>   	switch (hw_err) {
> @@ -32,6 +42,54 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
>   	}
>   }
>   
> +static void csc_hw_error_work(struct work_struct *work)
> +{
> +	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> +	struct xe_device *xe = tile_to_xe(tile);
> +
> +	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_FW_FLASH);
> +	xe_device_declare_wedged(xe);
> +}

Any specific need for worker to set wedging any significant impact on 
making it synchronous call?


> +
> +static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hw_error_to_str(hw_err);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mmio *mmio = &tile->mmio;
> +	u32 base, err_bit, err_src;
> +	unsigned long fw_err;
> +
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		return;

why platform specific check here ? I remember having similar error on 
PVC (reported by root tile).
  > +
> +	/* Not supported in BMG */
> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
> +		return;
> +
> +	base = BMG_GSC_HECI1_BASE;
> +	lockdep_assert_held(&xe->irq.lock);
> +	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
> +	if (!err_src) {
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
> +				    tile->id, hw_err_str);
> +		return;
> +	}
> +
> +	if (err_src & UNCORR_FW_REPORTED_ERR) {
> +		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
> +		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
> +			drm_err_ratelimited(&xe->drm, HW_ERR
> +					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
> +					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
> +					     err_bit);
> +
> +			schedule_work(&tile->csc_hw_error_work);
> +		}
> +	}
> +
> +	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
> +}
> +
>   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>   {
>   	const char *hw_err_str = hw_error_to_str(hw_err);
> @@ -50,7 +108,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>   		goto unlock;
>   	}
>   
> -	/* TODO: Process errrors per source */
> +	if (err_src & XE_CSC_ERROR)
> +		csc_hw_error_handler(tile, hw_err);
>   
>   	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>   
> @@ -101,8 +160,12 @@ static void process_hw_errors(struct xe_device *xe)
>    */
>   void xe_hw_error_init(struct xe_device *xe)
>   {
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
> +	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
> +
>   	process_hw_errors(xe);
>   }

