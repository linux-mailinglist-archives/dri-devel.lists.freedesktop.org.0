Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8BADA2F5
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 20:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C4910E159;
	Sun, 15 Jun 2025 18:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTmstr/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C85410E08D;
 Sun, 15 Jun 2025 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750011594; x=1781547594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kUrXyjYF3qgK17BqUgdYZFXLswmqVKU2kLCs7K1B5qY=;
 b=hTmstr/kKX4nRtnoA3GJ2U0Fso3REBfVvSB5NEi029vLKAqJGHSKlPje
 Uj5qkdiHl3bRvK4oUNYtnp+3zc6Y4s97HBrasy1xHMmkvVCpzf4efwwO1
 jK0iha13Q/DgtYB9K2yyUkls5yU9BRKF/m5Uzv9pwBxjA1gMhrgqI1jbf
 ZAn4vZ7jWsYhVv+1y7R9t2T1PnmN7kMD0jmcnZKwzbG+dFFRDKAZGXALR
 EJIkDxwDy87aJDJLN+XxSFtOg+o9LonY3ttJKvwyFjX6UJRJTx8IrCeBW
 Uyt+h5NGHI1Ivyw1Nxgsk2PkD6RBGPK7PHbuVSs9zZZhhsTQU79nfaQMq w==;
X-CSE-ConnectionGUID: 3m6NnwuvQFCHpgHpBxwRXQ==
X-CSE-MsgGUID: KrCVuKKuSi2trTXIFeI6aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55959550"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="55959550"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 11:19:53 -0700
X-CSE-ConnectionGUID: axb5weofQv2T3mXw5w3IlA==
X-CSE-MsgGUID: qub1o2WuQM25G1CFKSOFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="153581561"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 11:19:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 11:19:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 15 Jun 2025 11:19:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 15 Jun 2025 11:19:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLf6uv6xNtToKZNgeWz7TETiz9WYgLZG/i6a7RplLDfeEPsOSF8Azerx7p/mlrJ5OYVp+u0SBchXh1Vbk/nWQkqfMXSMh+gieq21PKugx3edtu2QzaCkoE4olKYPeCV2Dro2ms1Ro3YLoJ/PNZUwMp3ZFsONloOR8WNGt72W85nUc0HAM8JV3HzimenbbNctUanhzpToTLYzkR2BxVNDXG0134gCvMxo919/1Tnt1njCQ4/jqtYerccobR0BVeikDHA30WNyz0i1sBeRksxIHywDbK9MJyNprQl8iJYpFZM/H9lF8dLfDzKoRe47YPPY5JfvjeE8KQW6pKl4DA1hYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7B8ASDSAeF7cOk2DkNReAlGExVQKPg+YyhT1PTMdrI=;
 b=j1YctHrzZShXPvHQMB7VmuLzgPQyyinxpo1sO2iJkO6/FrbJk4t8w2ZeATIycSBSkaSDC4sXat/AoRhqD/iCuVQ5R4rDQAVcGBurDx8IFrKzqEGU30dvZ0eB+AhD1cjc/hoYfVsF5JDByfpBDaneQHOT5LZArt4lv+8kkSoamO+o1Um/aI7ek39OwJ1hSApTAl0dtC9AiSs21ZfOc9w5gtDQPHJVc+D5HGhjLu91/NR9xh7QHzoKnDw6UDrXGHD/YTpQTai8HIcokHIphAOUtwStT/JjLcAuANOocp3oTnr2S6KmEmvJQbl0SVG+FvdgZ3o1yq7ZKDfvtdoSa0tUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Sun, 15 Jun
 2025 18:19:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 18:19:35 +0000
Date: Sun, 15 Jun 2025 11:19:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>, <jgg@nvidia.com>
Subject: Re: [PATCH v2 01/10] mei: bus: add mei_cldev_mtu interface
Message-ID: <aE8Op8K5kzImW6XU@unerlige-desk.amr.corp.intel.com>
References: <20250606175707.1403384-1-badal.nilawar@intel.com>
 <20250606175707.1403384-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606175707.1403384-2-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: abd074b4-c362-424b-7e8d-08ddac392eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzJNRS9CYVpPc3VqcDVQK0JOYUhINFdkeG03N2wwQktSdHpEMjBuaDIweHpS?=
 =?utf-8?B?dlNrSzhvWk5xVE1Renh1OGd0aG0xM0p0YnM3UjhRQ0w4MXhRVEQ1U3BQdkor?=
 =?utf-8?B?NjJabjZPT0ZIakV4ajBmV1FVZllTQlJrTTVnQU5vTitDQ3Y5ZFRZR293dmVG?=
 =?utf-8?B?VWRSTW1qV3c5aldXWXdId2xWVUh3Umh4MHBQekxCblV4NEg1bmlVTXFWVXVj?=
 =?utf-8?B?OXh2K2tSWmZYUys1QjhUUUtNLy9sK3NOdUlxWFF1eExYT0Q0WkpmbkV2UVAy?=
 =?utf-8?B?b0Q4ZEJVMDMrZU5vbi84SnZ2dytjY1lXdWNDODBkUDVwZ2hLYTdaSUh0WFF0?=
 =?utf-8?B?MnJIM0lhUkY4MG51Ym8vNmVIUDdiYkhOTWtHUEo1QVFvQzNFMHQ4bE1NdUFY?=
 =?utf-8?B?VXNpS2tpbllEMlRjbWFuV1plRncxZDZzR1lTSzlPcmQvSytweWF1M21nODVq?=
 =?utf-8?B?VDU1VFJnNHE5c2hXVFgxb1RhNkpZdmtyb2lMZnczcGIzeSsrOUJhNFgwUUdk?=
 =?utf-8?B?WExTdGhyaFRvWDRzemUxK3NYNUdpNndGK1ZrMGRoUXRnUnhnUmhxR1gxa3A1?=
 =?utf-8?B?eXQ1VkxWc0ZtblRLR2hGdVBxWXlDWHF0N1d3bG02U1RHUnMrd3JuSnZPUkpM?=
 =?utf-8?B?MitHcUdZR3lNK1BCTCtGblkrcVVXa0NFTXB2RnJrVGNUeTBPeHdJb3MrVWZp?=
 =?utf-8?B?TkFQOHlBV2hsSFhIS0hHYUdjbDBUMisrR1NPYStmdm81eXpPanJHSFJJa1VV?=
 =?utf-8?B?TW4xbkFGclJhTWZZRTdSVGNUbjBzbUd0d1FsZ0l1UmdkRW9Ncm9UVXJjemND?=
 =?utf-8?B?cmtldFN0c2QwZnoyZ3pFNUVDakdoUmZCMjQ1VmhrNWR1ek5xWW40cWo5TkZ1?=
 =?utf-8?B?ekFLSFNXWEYxTVlqOU5EYWFVS3g2K282clhVdkxKcmd6MGlRY2o0ZVd4L0Vx?=
 =?utf-8?B?SXJWM09kK3lOcWFCVkNJNkdZNmxJNU1RbmZyRVBudjRIT29hRThGM29pb20x?=
 =?utf-8?B?S1h4NThMUENzaXVoWTRSZ1ZoM2F1YVVjV2hlb05JdlBvOW9EUkRQekFKaUMz?=
 =?utf-8?B?ZmsrTEtvOUR4ZWdZYUtHaG9DR3FJcG1HV2dBMWJsc1AwQk1Ob2JKaENVNXVa?=
 =?utf-8?B?ZmY2NDdIWThacGdzbWNVWEF2bEwyZGFMZ3ZIRWJibGhKK2E3ZGVuK0p1YVhj?=
 =?utf-8?B?NkNLQWJVZ05mL3F5cm5STnl1U2NHRGgrNlpWNEJCYkdlaVBib1cwbERkQ29v?=
 =?utf-8?B?UWFQdTVkRm0xamZ3R1FsUytaRWRZNzB5ZmNuNVM1a1FHaVM4cEJucHRwTlpV?=
 =?utf-8?B?QUZOenpSMjJxQzlRQVY0ZXJXZ1NwSkVMTXRrOXVnbEU4Vk5PaXVUU2EyUVRF?=
 =?utf-8?B?Mmo3cXB5ZVkwWTdRL3dIMDJYSSt0L20xNVRrOEg1U1FZNGJiRkZVSW9reGE2?=
 =?utf-8?B?S3NDUllNaGtLcEpXczZXWXRrZjVXTTM1UG0veGFLVTM2UXE3ekJ5Q2o4OFFu?=
 =?utf-8?B?bHBSR0hjRHpMdWlmS2swcDJnWW9oQjdkQnJVeE1ING44UzdRU2NoaVNzdkIz?=
 =?utf-8?B?OEhKM1ZKMkRSSFZ2QmVzNW5TUCtGd2RSZXhxR2I5bWE3WEVwS1VpMGEyVUZP?=
 =?utf-8?B?RkFFTndabmhSUkJqMDNkcmk0R2NuRmo3dVU1dk4yanloUXZ1bzdxK1dPSTFT?=
 =?utf-8?B?RnlYK1A0cURhcFRkeFhHSGp5bWJrSlNoTnV2K2dyYVdMVHVxbDIvbE5BOVhy?=
 =?utf-8?B?ckhmZ1FJQm5FbW1QWnovRG1XNGpZbDBtd3pldnRZYVlkczZrVS9oZ1BURDRY?=
 =?utf-8?B?eVduL0ZWWEowakFjRFk1cXJ4YThpbStrdUZ6MjVnT2xJZjUyZkp5eUxMbnVj?=
 =?utf-8?B?elVQMG5xNEVIZ3gzYW0yMnBUUWdTUnBCcXJVd0NPZU1xUExBakp6SmEzMXgv?=
 =?utf-8?Q?hhipi77DCjY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmNJZCtCTEdEZ0J2dHA0UkZnKzRRanE3bzNUaUNldlJWN1VtUjZhVmdvNEw2?=
 =?utf-8?B?Y3ZmVmIrZUYyM3JpZzBVOFdsQ1lsa1gwNDdCSEtocmJrRUw1dnR3dzRwc2d3?=
 =?utf-8?B?ZGNrVmUzZFA5K0VMd200RytiNnN2WG1KRitjTGhEd1orNmZScktGekZGSTdn?=
 =?utf-8?B?NG90YW1pZWlqUHkzUVZWOGJmT01ZWkVEa1I2cHF5T2NxeTdXbEpwR2N2cHBl?=
 =?utf-8?B?Nzdmb2ZZbE1QZ2l2MWZyVVQxVnhiYVFYdGlmUXYza0ZNdEdHbXcxMFllSHVN?=
 =?utf-8?B?ekJwcm1PUFZrNzVENVczeldzdHl1ZG1aVW9ub1dhR0ZtQUFGYitQWEhQYXFR?=
 =?utf-8?B?OEc4RFVISmlETE9FaWtJMW95azZiL1Qza3g2T0s4ekg1MGpYdVA2Z2NRNzRX?=
 =?utf-8?B?d1NWZDdKM3k2YzNJYlVtR0t2WnFGOFY2ZnBidkUyZFZvb0hudGJnNTlUNmJQ?=
 =?utf-8?B?aW9PRG1DTGRIMGhqT2p1cHN5Qy8wTWR3RzBabXlnV2FkaG5PWjBtT1JDTTNR?=
 =?utf-8?B?MitiRys0YnZaUExpWFFuallGV3pUSy91Z1N5Ui9mMkhCYWZQVDJzYkt0ZHhV?=
 =?utf-8?B?MDRMcUs2SXQ0N2Z4ZVkyaUpxS2hNRktmQWxlTS8vY0VIQjZ2amVIUWNqMzNV?=
 =?utf-8?B?NVlnNE84ZE1aeGhLVGk0YWcxNC95WXVuUUdEVjl6cVpuVnBnZXpaeE14M0xs?=
 =?utf-8?B?bGlUV0lhcEo1ZllWMVF6QlkxR3pNaFkyWWxEdXRpV0daZ0o5aWk4cXEva2g1?=
 =?utf-8?B?b2t4TE52N2JKNVVubEs3VjV5TU4rMlk0S0EzQ3ZwUzgyQ0N0OVVDL2FDd2VF?=
 =?utf-8?B?RXVBcmZURFZzeEJMaENzeXRKckQ4a2dyMzVkU1BSNExtUXF4SGRnaFkxYXJE?=
 =?utf-8?B?SFhzMWRqSmc3anAzVjVVSDAvTGJ3UVNkeFowNmJMdll4TlkvTExJNE9rSWNP?=
 =?utf-8?B?WHgwSXc4NzBvSExJU3ZmZDdMcG9oMXVrRlVkU0drSXM4VmJvbUMxMURvWGFL?=
 =?utf-8?B?U3h4K3Mra1dvVGNYNktIdjdOUklEd1BaWlpBeXFESmxZNlhjTEY0dUdHbWRI?=
 =?utf-8?B?UWFvcmZ1ZWtXLy9kbkdpR3l4OU1DZ3ZobU9POEs3eVc5MmlXUndkdDE2L0lE?=
 =?utf-8?B?R1duNHo0VHNjLzg5RkprOWpCOTZGWitzU01xRWUxdUdqS0hVYjNrYWxMcU5y?=
 =?utf-8?B?NDFJQzEvWDlqV2hyQi9NSmNtdWFNeThWTHQ1YmwzbFRQWWxFb1VrY2VNQjRU?=
 =?utf-8?B?VXlVTkt1T3FZbWNQZnJzMDdkVzYwQStqZW04Q01JRXlNOUNhNlVWVlErQlBF?=
 =?utf-8?B?RjBmVkhDUGRVMjgyaGNmcy9rbm5ZMGgvdWZNQlQxYzlnaDZOSjBGbmxmc0dJ?=
 =?utf-8?B?Y3lETko3VUU2dDZoRG4wTHNWdlJ3dXdBNEFCTE1Ra2lKSG5JSkFabkM0Z0dH?=
 =?utf-8?B?N2NWTW8yY2hlOTFqS1FBbW5GNnBDZUZLMi9UZTM4N1d1VGNuSU1wY05WbVpX?=
 =?utf-8?B?cXR3VTZmL3pRS0hmUTJvNE1vaGtpN2gwa2pBQUJkMkZnSitlWXU0cndEZzlt?=
 =?utf-8?B?QmFzNWJXcUMvNS9BSlZiQjhBS0w5S3BTaXp2dVNXZk5VcDIzbXRnejFEc3ls?=
 =?utf-8?B?cmY1VzRMNG5jRHNGTUtFSytFNWZvbjZkbGJVbUxkM05UdlFyU2hEaWMwdVJl?=
 =?utf-8?B?MmdiWVRRbkY5TlFJdi8zeW40di8zQWFYeVFRTTN4U0tYMFE4WE1MVVdPZHk3?=
 =?utf-8?B?VUhYNXB5dXMveGhwU2hycHZhZ0MwaDRPbzc3RkpWd01vTW5vY0dDWWlLbFpR?=
 =?utf-8?B?cjdVa3ZQTE1EenBPK3NkUE1kT0ZTaG9QaTRxRzhYays5ajJ4N2VtampQWlhQ?=
 =?utf-8?B?NUU4dzdkVVBtcHBUSGUwVWRDSitXWWdmRmNCZWhwU3VTYlNPMG1MVXczM2dQ?=
 =?utf-8?B?ZmdKNEU0NkZYZzV4TFhEYlRBaEhlRzg2bW10ZG9sWERMOGlGVG5lWVhsK0M4?=
 =?utf-8?B?aHZia25CN0FQenJUVFkrREZXWmo2U2cwUnlBeEJDdnQxdzI0Z01GNE54R0Zs?=
 =?utf-8?B?L1V1RTJ0Q1BRaDZ6M29kd0wrcHVYTWF2RTliek9xaVZFY1VWWlRmbTJXZzJL?=
 =?utf-8?B?RG9ud0gzS1dqZ3NBdk4wa3VZOGJTaWp5SGxydDZ4OGlCMkxDZGhlRURJVDBk?=
 =?utf-8?Q?ilA8PPgfA4Y37/0z90sih4w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abd074b4-c362-424b-7e8d-08ddac392eca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 18:19:35.6369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8ZT1l98ez9qM64RIlZzrUPDnXQypBiOGVHbtU3H0mtX1UPBQiBPs5IpKJPdzaZh02eSaaXAUj6uMVL9kSiv77bPLBHXUIwnngIsB/HV/PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
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

On Fri, Jun 06, 2025 at 11:26:58PM +0530, Badal Nilawar wrote:
>From: Alexander Usyskin <alexander.usyskin@intel.com>
>
>Allow to bus client to obtain client mtu.
>
>Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/misc/mei/bus.c     | 13 +++++++++++++
> include/linux/mei_cl_bus.h |  1 +
> 2 files changed, 14 insertions(+)
>
>diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
>index 67176caf5416..f860b1b6eda0 100644
>--- a/drivers/misc/mei/bus.c
>+++ b/drivers/misc/mei/bus.c
>@@ -614,6 +614,19 @@ u8 mei_cldev_ver(const struct mei_cl_device *cldev)
> }
> EXPORT_SYMBOL_GPL(mei_cldev_ver);
>
>+/**
>+ * mei_cldev_mtu - max message that client can send and receive
>+ *
>+ * @cldev: mei client device
>+ *
>+ * Return: mtu or 0 if client is not connected
>+ */
>+size_t mei_cldev_mtu(const struct mei_cl_device *cldev)
>+{
>+	return mei_cl_mtu(cldev->cl);
>+}
>+EXPORT_SYMBOL_GPL(mei_cldev_mtu);
>+
> /**
>  * mei_cldev_enabled - check whether the device is enabled
>  *
>diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
>index 725fd7727422..a82755e1fc40 100644
>--- a/include/linux/mei_cl_bus.h
>+++ b/include/linux/mei_cl_bus.h
>@@ -113,6 +113,7 @@ int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
> 				mei_cldev_cb_t notif_cb);
>
> u8 mei_cldev_ver(const struct mei_cl_device *cldev);
>+size_t mei_cldev_mtu(const struct mei_cl_device *cldev);
>
> void *mei_cldev_get_drvdata(const struct mei_cl_device *cldev);
> void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data);
>-- 
>2.34.1
>
