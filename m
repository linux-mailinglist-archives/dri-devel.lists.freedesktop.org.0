Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D12A43A8C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C5110E5E9;
	Tue, 25 Feb 2025 10:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTwUe7Qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8733C10E5E9;
 Tue, 25 Feb 2025 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740477791; x=1772013791;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pIUQJvOOjGWtObzjW0ecOUAwm2TSAxM95xTMWtpBBjE=;
 b=NTwUe7QwjlapGsgVDw/4UdDrH2K8J5Ph5wtA1FfmPJLqePSLpt1SMeQi
 n57qWf9b0gvlQYovlGa6T0ccsD1IajilrPg/YIF7ONGklJTcq+N70p7+n
 f5+tqauex/qQ0EOW/x+PiVQdgwMPlJAKREE35zztk0tFGzZVpnpiRlk5p
 zwP0fmmJ/63JF9ifqpc5ODap4ScKpf6LeDtH44xuH3SK9/klPtNEIxB0Z
 H9wY9HHoA/IFzOPP1UihGvbIAyO2T797zxxr3wo39EamTWYgdBw6+kXNk
 wrc8KiVZCLi1VgYxOXICi+pc7aIT+5N7d/w8jK02O94cEhhB5Ak+NVkvr w==;
X-CSE-ConnectionGUID: /3KBpLh+R+GUnVpfGDPN2Q==
X-CSE-MsgGUID: CGp9tYmpRCe7GLBaCwb6Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51912015"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51912015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 02:03:11 -0800
X-CSE-ConnectionGUID: scz3fUUfTiWEi6Mg4RH0Gw==
X-CSE-MsgGUID: TVH87vMvSkC2g6rHrdg/dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116332978"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 02:03:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 02:03:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 02:03:10 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 02:03:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQW2NSvBhkhg//G/awmSPDtIxB83EH4+Soxw6yoA6VxbhuEe+jMI1ftUAUMmS0Pvg/8Aj0HyWvM8v65B0q+G1vzY4dtpfLeNWJC4OnZ8AAxACN7UwsrazH6ap6nZsE6r1SxDugRRdaZoHIo1ZjxFSBunlANpzgUpnOlJNvjaa6RzO0O+0lRrGyyNuzlFjKXMluEVkSkQ+R2aErcMbNilC0VW8hcAfF0svSwZGLlFTvSJq4qm2dzH02ZmA8LBIhV1Sfh2TL1MjhIZVRZDfOGV24ki9dDIzztgHC9htqm08VEKIa1BusIZF4SP72pIwPIIBp9J/SSZEvfJ3fNooqdHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZAeV9hdoSijsluJIM9QqMyJRBq+GN1qveV++DyF+KY=;
 b=VR2WQJlcQXt25ExXzCxNZgHokrdsljll7wR8MiMUGmtNf2rLNLkHwpuQ3sbHfhV5iQC2+t7mhUj5lxmooRUn8VexPn50m3EC90R8sNsryrB4sPR8ToPAii+KrICJzWgUvCmEPwhfz9VlzSOQhxe8CwxXU0DIjSwPQAUHtG9XdlAV1b/QqchgIDK4z0V7jQRFmlqbLX9IlwF8ttvv7mkNp91WXIzjpwbILNeS+WAoUdeZbZnxMplvJdIkzA2Dr4t3O28dvm63fUTPabQH2IdGAh1SQ/oJWzp9phe95IrJoULZoF8JsunHihg+F8J9dpX+KKAtc7E+0Q1tkjq5GMlFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 10:03:08 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:03:08 +0000
Message-ID: <aeef242d-c6b3-4000-89e1-866f51e02744@intel.com>
Date: Tue, 25 Feb 2025 15:33:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] drm/i915/display: Load the lut values and enable
 sharpness
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
 <20250219115359.2320992-7-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250219115359.2320992-7-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: e3cb6e61-3f30-4457-1869-08dd55839aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjNmekdOMUtRdHh2OTRFdWxxbFY2dHU4S09YSGI2NWVoRVJzdXNTY21OdTJm?=
 =?utf-8?B?amRLNks5VDZ3dkpJRFphQUVpUUs5YUEyWTdiRDVHNmsrNU05Y1VNNU12Ylcx?=
 =?utf-8?B?bHRxK3Mva0hZQ3hXdG9uY1pIZ3dHTUpuczdZUmI0TGluRlFQL0VtbmRtKzZr?=
 =?utf-8?B?dDdWK2svclMzNEp2d0w4TEVxZC9XcFZyWE1Xd21rcUMrQmFQVHVrZ3ZxU3hG?=
 =?utf-8?B?ZFI4RHhUN1pGUVNWbDR1UnZ6ekFKcUxJN1psczlSNFF6K1hlUUY0aTFXc0RF?=
 =?utf-8?B?TjNHUlZaNVlWWEovM3ZSV1p5WkozOTREem5xZnBVeXAzY3RETHhpd1JjOTB4?=
 =?utf-8?B?S0VZWlZlaUp6ckUzOTdBSEIyelZhRlNiL2lVNkloTS9mSU1zcFBVUGZ1Qys5?=
 =?utf-8?B?VG5FSDhYU210a0EwSklPaEtHbFVZZHNkRUJNcklhQitGRTRCbC9jckE3NXAr?=
 =?utf-8?B?VENicFVTT0VOZFgwQnRlNWMzUzFtOVp0dFlEMUQyMWkybFFhSVJScWtrUzRv?=
 =?utf-8?B?YVg1djNqVW90VXJZUmJzek5NaXQ2VlhuRmR2TUNZV1FuaitaKzJYdTRKem1F?=
 =?utf-8?B?VEs1NHZNQ01QTGtMd3RENm1BMFFaMHVRc0dlbjVoaTlLSFhodjdvZkJ4STd6?=
 =?utf-8?B?VVNPbHREZHA1WWZTakt4QkwzTmZhMDVKeWc4N1JPb3c4SFdERkxGSXZ3dnVF?=
 =?utf-8?B?a0FGZEhqbGVzVStDb29IVTRFU1pIV3NMQjlPcGlGbWFTM2F3NGQ0UElET1cz?=
 =?utf-8?B?OTQxSk1vWHdJczk5c2dRcU0rNFJvYzdOVGRnTm9LMmdKYUpYQy96UmxRMzht?=
 =?utf-8?B?R2FyTUw1ZksrbnRPU1FYMkFYRlYyM1hhK0RnSUlSYkp4eFhENk0va1lCTkFB?=
 =?utf-8?B?dm8wbDkzU3AxYkVOV1k2MWl2Yi9MeTV0UUplTnRyS2piL1B3RWtoRngyVis0?=
 =?utf-8?B?N3dUS2RFNm5qa1hqbjFjT3hCeENlUjVUOTF0Y01XWi8xSnYyUEluRkN4T1Br?=
 =?utf-8?B?UXVNVStGTlB4Z2l0NElPdS9TMkxGR0EyQVV2TVJSYWRZVVY0T0ZvT1lMTUFh?=
 =?utf-8?B?Sm1QZWpLZThOaUJVbUJJSkh4YnRqbnI3YWhUL3hQd0d3LytvRHBBanFyQ3g1?=
 =?utf-8?B?dVVHdUpWRDA2R2tOWVZRa1V1bnlFLytIVjdVVFNRT2lmancxcHNKeVp4SFBt?=
 =?utf-8?B?RnBlK0w0cUdpZDVLYVRRQmNjUlc2dkFZZW54eGQ2ZklKWEZtWXZ1MDVWakYr?=
 =?utf-8?B?THorZG1QUWluSXhJYzlET3lyM010UmRSMEZWcXoxVXNZTDlLZFFFZEt0bXVv?=
 =?utf-8?B?QXFVMVBmTURqQWRJM1FSczd6dHBIWDYwaXovRGl2MnR0TXluQ2FIZUsveEtr?=
 =?utf-8?B?NFBDNlBiUXNLcWtQdEVOR3o5VS9seG9hMURhbXY3QUdTMGp1Slc3MEFDYms0?=
 =?utf-8?B?a2Q4d3F3UVJndHA3SGJHMExva2p0dnNGMU9QRXBDL05sSUN1Y20xWWo4VE96?=
 =?utf-8?B?TGdReTZuR3lSUTdrOHVUQWh2MUY4TU5kM2JFREJ3THVGaGZyRk1Hb1BqbFZt?=
 =?utf-8?B?ZkU4eUhDeVFrVTZTTVZOS3ZLbU5YSFkvWFJ4TklLdmFISzBCZElIeEhjOGdt?=
 =?utf-8?B?TmFjRk9LYU9SVGRsZG1nNVNuQWVUTXVLRkI3djlxL05KaEt0b0ZDTHBoTHhk?=
 =?utf-8?B?YWhlT3h3eEdmbWNob1pwN2FzYUFMRS8vdnlzcXdCK25kMmcrU1FtYzJjZXZE?=
 =?utf-8?B?blVsbTFtbnh0WndMZCtUQmZzK0hHemRtOGt6bzBjenFrYjNPdmtJbmFaeTND?=
 =?utf-8?B?SW9vY0RrelVTUldwSGpTUXh3Q2FCSlJGZGpYQ1Q3VTZGb1pEYTRSNG9xeVg4?=
 =?utf-8?Q?j656eoY4dWvPI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEdoUVpRM2tqT0VQV25tKzkwczVsS1h5akRRWWN3azFqOFhnUHRyR1kzNG9r?=
 =?utf-8?B?ZVNzNENyNmFqQTZodm5EN3pYNlVGRXJOS2ZyUVhyTm5TaTdqN2VPM2xlK0Zr?=
 =?utf-8?B?NzZ3UXFxdGowaDZwWEtEZ0VwelpRYytsUXBJczZlT0s4QjZyaURya0dqZjFP?=
 =?utf-8?B?bXB0ZUpYMWJveFFXY3FaNXRrRWw3R3JVaTcvUDFZUkUzbTUzSEc0clh5eEN4?=
 =?utf-8?B?bkZRalQ3aU5uVE9Ra0tiS1E3WlBISzROTUg5Y1NOMm9wZ1V3aTlnckdvd1hN?=
 =?utf-8?B?akJSbUlFYVhyMnV4ZG0zTEdza1p4aXhTbVVRa21IMDI4VUVrTzRZWGJqKzIy?=
 =?utf-8?B?ck04bjdGYkhiaDRtSlBiU1NmZ3lnaTdKU2lmdTVqRHNSSmd1Z3BiNDN2b284?=
 =?utf-8?B?NlRHOWt0RDdObmxoWG5DclpMRFF6Y1JiZGpRc3A5UXBYck14aXNxUE1zK2NB?=
 =?utf-8?B?SkNoLyt1RkJ1K014dFNmQ29zZjF5ZU5PTFNqZ2ZkY25PNFdKemd2VUlCMndE?=
 =?utf-8?B?blNnVGZqcXk3NG8yNWhBbWF6MStlbGRoU05MYXdhMU83NVRyU2VIcFMxK254?=
 =?utf-8?B?WXRPTGtJazcvZ0RzZWlkUHBrSzR0ZVpxY3BZbk5rTmV4LytBdyttdlBnMUps?=
 =?utf-8?B?K1VRMGVaN2pjMnRBYzg5d040SUsyVEZOY0g4ZlFDQU4wMGZhNVcvbnBnVlVm?=
 =?utf-8?B?Q0JaSFZwQzM5dVBGaDl4RGFtOGFzMHQwMVJ6WGxwWnVlT3h3TXpRQlA3S2tX?=
 =?utf-8?B?MzJXUDljVFFMYjgxUDFPQ3Y3Yk5sNUVOTGtsSmx5ajNUQmNoWUlzOTlNMUJO?=
 =?utf-8?B?eW9MVXREYWgwYnVxZGhXbkU3YUxYYlFENklyS3F2WGFLZmlJVmZKa3AyZlZ6?=
 =?utf-8?B?eSt3OGpmdit3WERrWW5kb0NwU3RNc0V6UWhJMEVuUGVFY2k2WVVRRGx4RlZN?=
 =?utf-8?B?MkRyL2xtbEVBc20yMmJiMFczOHVFMWZOSVpoQzMvalNNR09KZG15cFVvaC9w?=
 =?utf-8?B?Y1RKVWhmZ1NiLzU2dTQrQjUveVNCdUh0eTErcmRnalVBOTZjV3UwSEFZMjRp?=
 =?utf-8?B?TWU1QUhBUHhBaFB0N3Q4YWE3MXNJNnVCc3JkZTF6aVJpRGtZUXI5VkVpV3RI?=
 =?utf-8?B?dDZIWVNPdlhKSTRxY0llVkFpNlZYOXlUZ2hTZUc3M0lVcExFdTZ3Wll3MGVP?=
 =?utf-8?B?S1pWbjkyL2lORDI0ZEdUZzJSYzVMN1I1YmFZMlQyajB3d0FpS3VoS2pCQ1ZZ?=
 =?utf-8?B?MW1KWGNVdGVINTFoM0pleStla28xTFV1bHNmblZ3LzVQREp6RXJCVkk0VmF4?=
 =?utf-8?B?UzIrck94K2lQazRjaFgrQjlobmFhTTRNVWthYjZPbDlEZXpwWWsycXVjcGNB?=
 =?utf-8?B?d3E2ODFramdJbkdtNG1ZN3NIam5rVTl5T0xRUzB1eXpzUGNRNEdtODFzMmcy?=
 =?utf-8?B?YXAvb1Y4dFkzVjVicnBXWTVpdnJqT0RJNnpQYnA5V3RVTXNDMzNqc0poaDI5?=
 =?utf-8?B?Zkx2TFZTNlFUV2FLa0F6Z2xHUEJSeDFFd2tCSzBBRUd3QlVoK3p1c1R2Mzc5?=
 =?utf-8?B?NGU0Vkl4dzk5bitUZVlIQjV1NW1hKzVkUFQ0S1FPbnB6NTQ1TTU1eGgzc0Jm?=
 =?utf-8?B?a0Z1WDhPd3FYbGRKK0tJWG1McHhtM29qcXFlQkVESzJRbk0yR1lYV3dpMW5U?=
 =?utf-8?B?ZG9sdkw0N2tHTWV4SkRybmZ5Q3dNdUc0TFVpMU8xSkJsSU9HS0lBTC9ld3FF?=
 =?utf-8?B?b0dRd1IrRDR3RjhJMjhRMlo3bUJMU3N5ZEozWVU5Nlk1WXFvK1IybTM0cmRD?=
 =?utf-8?B?NWFRUUg3VGhoY0Rwb1pjVC9WNDU2K3oxNXR0Y21CSGtXWkYxWHFKQW1IcHI0?=
 =?utf-8?B?dkVyL0NSUVh4OXJ2UkE3SndMcCtVU2d5dldqS2VUd3l4YjBJQ28waG5PZ3FT?=
 =?utf-8?B?TkVSMW9uUzlTdU54TFZFTnF5c1o5TkhVS3NaQ2xlV2RzZlZ3Ui94akFaZzlM?=
 =?utf-8?B?cmVjTzZ5MEZyUWZvNDZlemthbDZ2bjNrUi9OUUdFWEpDcUprUUVFS1h4ZDZy?=
 =?utf-8?B?dW0vV2UwYlpGaE1HV2Q4aTdnSVZnNzE1VFlpakEzMmVuUG1VK2hmRzdnbjNa?=
 =?utf-8?B?VXM5cnE1TVo3elZlVEpjUlRQVmJTQ0dSV1BmejBjaWdmTmFvRjFyWm1kM3JD?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cb6e61-3f30-4457-1869-08dd55839aaa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:03:08.1254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0BiCfzJ9fjxc4YkJZcaCMbwK1pkjfimJWgNJI8K0jv/ViMRYbaxuWpkR8XYJElJFUvLevHBD1gfwbjC2G9e6axxqLq3hdXfAjxiCYwAnug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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


On 2/19/2025 5:23 PM, Nemesa Garg wrote:
> Load the lut values during pipe enable.
>
> v2: Add the display version check
> v3: Fix build issue
> v4: Rebase
> v5: Add HAS_CASF macro. [Ankit]
>      Add scaler_id check while reading state. [Ankit]
> v6: Modify the disable condition.
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_crtc.c     |  3 ++
>   drivers/gpu/drm/i915/display/intel_display.c  | 32 +++++++++++++++++++
>   .../drm/i915/display/intel_display_types.h    |  2 ++
>   drivers/gpu/drm/i915/display/skl_scaler.c     | 32 +++++++++++++++----
>   4 files changed, 63 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index 5b2603ef2ff7..b8bd255e9555 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -391,6 +391,9 @@ int intel_crtc_init(struct intel_display *display, enum pipe pipe)
>   
>   	drm_WARN_ON(display->drm, drm_crtc_index(&crtc->base) != crtc->pipe);
>   
> +	if (HAS_CASF(dev_priv))
> +		drm_crtc_create_sharpness_strength_property(&crtc->base);
> +
>   	return 0;
>   
>   fail:
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index cf807e0931ea..38f333e78031 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1065,6 +1065,25 @@ static bool audio_disabling(const struct intel_crtc_state *old_crtc_state,
>   		 memcmp(old_crtc_state->eld, new_crtc_state->eld, MAX_ELD_BYTES) != 0);
>   }
>   
> +static bool intel_casf_enabling(const struct intel_crtc_state *new_crtc_state,
> +				const struct intel_crtc_state *old_crtc_state)
> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return is_enabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
> +}
> +
> +static bool intel_casf_disabling(const struct intel_crtc_state *new_crtc_state,
> +				 const struct intel_crtc_state *old_crtc_state)
> +{
> +	if (!new_crtc_state->hw.active)
> +		return false;
> +
> +	return (new_crtc_state->hw.casf_params.casf_enable !=
> +			old_crtc_state->hw.casf_params.casf_enable);
> +}
> +
>   #undef is_disabling
>   #undef is_enabling
>   
> @@ -1211,6 +1230,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
>   	if (audio_disabling(old_crtc_state, new_crtc_state))
>   		intel_encoders_audio_disable(state, crtc);
>   
> +	if (intel_casf_disabling(old_crtc_state, new_crtc_state))
> +		intel_casf_disable(new_crtc_state);
> +
>   	intel_drrs_deactivate(old_crtc_state);
>   
>   	intel_psr_pre_plane_update(state, crtc);
> @@ -1679,6 +1701,8 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
>   	struct intel_display *display = to_intel_display(state);
>   	const struct intel_crtc_state *new_crtc_state =
>   		intel_atomic_get_new_crtc_state(state, crtc);
> +	const struct intel_crtc_state *old_crtc_state =
> +		intel_atomic_get_old_crtc_state(state, crtc);
>   	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>   	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
>   	struct intel_crtc *pipe_crtc;
> @@ -1772,6 +1796,9 @@ static void hsw_crtc_enable(struct intel_atomic_state *state,
>   			intel_crtc_wait_for_next_vblank(wa_crtc);
>   		}
>   	}
> +
> +	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
> +		intel_filter_lut_load(crtc, new_crtc_state);
>   }
>   
>   void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
> @@ -6880,6 +6907,11 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
>   			intel_vrr_set_transcoder_timings(new_crtc_state);
>   	}
>   
> +	if (intel_casf_enabling(new_crtc_state, old_crtc_state))
> +		intel_casf_enable(new_crtc_state);
> +	else if (new_crtc_state->hw.casf_params.strength != old_crtc_state->hw.casf_params.strength)
> +		intel_casf_update_strength(new_crtc_state);
> +
>   	intel_fbc_update(state, crtc);
>   
>   	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 1320ff888fdd..a06f01d62606 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -937,6 +937,8 @@ struct intel_casf {
>   	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
>   	u8 win_size;
>   	bool casf_enable;
> +	bool strength_changed;

strength_changed is not used anywhere.


> +	u8 strength;
>   };
>   
>   void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 9d687298a9a6..03f0e800c8e9 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -10,6 +10,7 @@
>   #include "intel_display_trace.h"
>   #include "intel_display_types.h"
>   #include "intel_fb.h"
> +#include "intel_casf_regs.h"
>   #include "skl_scaler.h"
>   #include "skl_universal_plane.h"
>   
> @@ -946,7 +947,7 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
>   
>   	/* find scaler attached to this pipe */
>   	for (i = 0; i < crtc->num_scalers; i++) {
> -		u32 ctl, pos, size;
> +		u32 ctl, pos, size, sharp;
>   
>   		ctl = intel_de_read(display, SKL_PS_CTRL(crtc->pipe, i));
>   		if ((ctl & (PS_SCALER_EN | PS_BINDING_MASK)) != (PS_SCALER_EN | PS_BINDING_PIPE))
> @@ -954,14 +955,33 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
>   
>   		id = i;
>   
> +		if (HAS_CASF(display) && id == 1) {
> +			sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
> +			if (sharp & FILTER_EN) {
> +				if (drm_WARN_ON(display->drm,
> +						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
> +					crtc_state->hw.casf_params.strength = 0;
> +				else
> +					crtc_state->hw.casf_params.strength =
> +						REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) - 16;
> +				crtc_state->hw.casf_params.casf_enable = true;
> +				crtc_state->hw.casf_params.win_size =
> +					REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
> +			}
> +		}
> +
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			crtc_state->pch_pfit.enabled = true;
> +
>   		pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, i));
>   		size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, i));
>   
> -		drm_rect_init(&crtc_state->pch_pfit.dst,
> -				REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> -				REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> -				REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> -				REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
> +		if (!crtc_state->hw.casf_params.casf_enable)
> +			drm_rect_init(&crtc_state->pch_pfit.dst,
> +				      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> +				      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> +				      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));

This is doing a lot of things again. Need to split into separate patches.

Regards,

Ankit

>   
>   		scaler_state->scalers[i].in_use = true;
>   		break;
