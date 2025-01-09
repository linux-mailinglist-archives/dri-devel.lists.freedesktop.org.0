Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E3A0828C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 23:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB23810EF40;
	Thu,  9 Jan 2025 22:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WqWS/kuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA0810EEB0;
 Thu,  9 Jan 2025 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736460216; x=1767996216;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D0uneVjwTQf1CaN1+wYlJUs8hcJ41LG94APM3c9pdRQ=;
 b=WqWS/kuRl893CJjv3CyZbGywq4vQMRh28P/MzjotQCZnMnFfMqBWyf5X
 fyCOPHQ6ujaSgFrp65EjA1P8cVU7wAFWofIWGiAdtRBM1KRILiAt+neq7
 kwGyHxnalsCpg7/AI1KzE75WP7zHEB5GLBC/k8m9E+ztifPMPRt1cGW5J
 D6wRCmClMAZFKhZHcF1MJ1hjwe9kQwwpCZuqYLzTtILrhjb9XlpQd00Hj
 QcWkJoNYqe36lR3tbr5PXMczzsaFo+mtL2BLamZsTGdWMnVaiurOI4k0c
 HIdqcb8wJatGJVQhuEgCYAhq7MVxXAsElFN2SgJQqzP6OuaMRPQekot8j w==;
X-CSE-ConnectionGUID: fIqpHKM+Tj250jRDXAFL4Q==
X-CSE-MsgGUID: 1wrAYuErRFW/MOvoG1FsvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36855033"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36855033"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 14:03:35 -0800
X-CSE-ConnectionGUID: OFj8ULcQTn+H7Wu2mMO6PA==
X-CSE-MsgGUID: 2BligvaCSAWOapui/OdXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="104055424"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 14:03:35 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 14:03:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 14:03:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 14:03:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLFcAhh6YUuyX7nmSaI7Ow3T06HfmPhinTa2+8EaMakCA1u8zIUJH61rEBbGc9KVcH365iSfo11YYr0Q09nyt1RaTsK4h1ow8e+DTPqxYhGPP37JSox8FYXkg57iQxMiB8ObMRUeaoQxyMCbYwsIBgXNzL/vNRxjoDpzbDyccTiJsbumBldHDIIwBN3BCwuutIA+d8wcxw+Z9dY/EneI9kmaL6oa9K4SNyqsqfz0AB+LY+jEByZI4l/QsNGSqsH3DpUVw/7hxBJDoM/6XKiFjdLa8qLajC0M/Yl9Q7il+y0Kjgz7dp5fAHZOVXBKoxuz3N5MkzUhkLScmLHcZuRE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOpl4S8jYk1akpcVlV+GA2Ip5bjbCpBF5Tw2eVEW9Zk=;
 b=UWLJYFz7UkoknF/hMBzISvmiZSR6VB++Njs8iOcMYGHG8GY/X/D/sdzoSQJod6pPspioSV/FMFDFQgjn+hs6aPZE8LVgv8RL+kFsez16ekVUuKL/FmC9fAjLz5sqWprBl1rwwBAdAbaGsmzK2o7qKSS2bly0gomUy9bUOhjw9O5Q74jDSbGUxDOGhQzN5PYQ+fj3tcjJ9v+68GrRp2OIdu0nl/FV4XolVJjCXzSGI24II/W4H4eT2Hat4VE+5Yrmp0rGdvRvm6aaQPSDsfSyjmpG78rrnqJN62EQtFvu+a8kGADsevRBRuq5mR/Qds++994gsMoZKAXYpwomA3P8PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 22:03:31 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 22:03:31 +0000
Message-ID: <b50b25c9-8e3b-468f-beea-48ed34675e07@intel.com>
Date: Thu, 9 Jan 2025 14:03:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V2] drm/xe/guc: Use exec queue hints for GT frequency
To: "Zeng, Oak" <oak.zeng@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Morek, Szymon" <szymon.morek@intel.com>, "Souza,
 Jose" <jose.souza@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20250109120705.3021126-1-tejas.upadhyay@intel.com>
 <MN2PR11MB472815B1DD6972ACAFA2585992132@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <MN2PR11MB472815B1DD6972ACAFA2585992132@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:a03:54::31) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd7016f-cc03-42e2-3e94-08dd30f97415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFZSblB1QURKWXQxUUNDOE40Z0ZTbi9iUVVWTzN6R1dwZlY1c1F0dklUbWpu?=
 =?utf-8?B?VHZ6WEJ6c2VNTld3bFVzWjA4cjI2Y0tTU3IvcmdKaFNMOWhYTjhWUEtVZ2hT?=
 =?utf-8?B?bkszYlN5dGpqWCtyM25KNThBOE1BNUJ5SmV4WTVwbWVVTVY1bXI4OVRHTk9B?=
 =?utf-8?B?dG4yNlY5MFBTbkR1dGxuZ0I0YnplcSthSVA0cEFLc0hnYnJFbGFxU095Sk5R?=
 =?utf-8?B?V2ZXNm94RnNpVGlPNUozNlJlUzRuaVg3K29qam5NMlp2QnIxdmZ4QW5FWW53?=
 =?utf-8?B?dENURExTTnQxRjlrc2JrWGZwanFvajJlc2xIc3RvMzdHNnE3VmZ4Umd2NG8v?=
 =?utf-8?B?eGU1N0ZHUThvM05rb05TMncyNXN1ekVmRDduRUhrNGZ0LzR3V08wU3B5VCs2?=
 =?utf-8?B?UkpMV0Z3R0RmU2lzZGJzei9xcVNtMTFhdkZUZmRmT0VyeDBtZ3MvV25Pc0sv?=
 =?utf-8?B?YTluQjAwanVab2RmNFFyMlNNV2VxTkVEVkE2NkZIaUZzZkRXMERxakVodExq?=
 =?utf-8?B?MFhudkplUWtOSWQzZ3pMTjdORWJUK2E2T1BQQWQwRWkrUzNseHY1T3ZoWFNY?=
 =?utf-8?B?NUp0ZUN2MkN5S0Ruc1ZQQUhMaTNCb05VV3VENFNKRU1RS1pvckZTSHhXanRs?=
 =?utf-8?B?MGFIVStvSjllL0ppMEZ3R3grZkI1M2NUbEIxQTJhdnlWSVBpUUE5ajdiSHkw?=
 =?utf-8?B?SkJmcUtid2JIZVplaTZ5am5YQTZoYmRJdDFGUFNxUFhkM0tyTVRESTUwdS9k?=
 =?utf-8?B?aDBubTZVTlBZeVMzVzJXRWZtbGJQNGp0OUNwaHdIc2xXeTNEQU1wRmhUNHVu?=
 =?utf-8?B?ejZ4OGh2b0JJT3dyOXhuU1FwcVBFb1JPK0ppVm80SFdwMDFwbHBkb0g4UHp5?=
 =?utf-8?B?UEYxSmpnZWV6SHpPQ3F2dGRpdFpFQk5NdUZmWlpWaFNEb21UaHdzb1VXeGwy?=
 =?utf-8?B?U1FkTGY5VXlHaFdKRTJWQkRUbW1kTXBBd1lTeXVwZlluYWFCejd6SXhKaDdV?=
 =?utf-8?B?ZVBRTDBsQVM2K3RtQmNLc085TVovRmQ1MW5YcWhJNnYrbTRGd1RUUERhUW9G?=
 =?utf-8?B?MHdyZzU3WXJ2WXRsNzRRZG1OQmROQisrTmdDOVZqOFR0ZmdWdGtkRE9QdEU1?=
 =?utf-8?B?cHBRVE5vUVVWTVJGWUJybS9TZ1E1MXpJd2NZVUpibExDVUxyOXVTYUZGU1Ix?=
 =?utf-8?B?Mnc3SDBRcmNvTkNvZHhqU3ZUT01HVG94aXpDTmp1TG5NU2x0UmdJbTJ3Y1Z0?=
 =?utf-8?B?bmlqV0x3YXMwY1BZOVdnOXFDbFgzRHMzQTh5a1ZWZ0FCQUFybVUyM0hqalhN?=
 =?utf-8?B?SWhrK21DQXJ6WUNnTmoyTkpTamJqNmF0ZjRYUnkyV3IybUJyNUR1WStvdVlp?=
 =?utf-8?B?aGlmVVBOMnFONitxLy8wdXIyMnJ3L0V5ZGNMUk5Dc3c4QmFCSUVDOUdiZmJi?=
 =?utf-8?B?Wi83VVEwdVo3OE1md3dlS2I0bzNYYXJBeGdCeHNlN3V4VTQxbDZJZHMrQVlD?=
 =?utf-8?B?UldWTnp1K25rVm9GQlVVRzFUNWtDbndpYzRYaUNzM2hJbEVPUjRtditYZGZ1?=
 =?utf-8?B?QktGSjFQYnBlR2w4V1BtaktKaXZnak05bWZrQ3ROMnRBb2hXazRIdWFEeUE3?=
 =?utf-8?B?UjBRaURrT1ZuRjlrejRtU3lHdlRXcnpiU3dSRzA0bWRTcjRrU0N3bC9CVGdW?=
 =?utf-8?B?N0xOU2FpVnFXSS9YeU02QnRtbjdPM3hwRUdha2xLbktwdjVxaS9WK0o5bnE3?=
 =?utf-8?B?VFlzcnNlVHRjV3VXaU54cWM2WXlkZ21OM3pGN2tKc0JHVEhQM1VCak5DYm1C?=
 =?utf-8?B?OXJ2MURiTkdDR2F3Qk1xZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3BIcW5UU0hQK1pnQkJmWjg2M2l2K3QxM0pIWHVFOTBYV3JxZ09Ec2RLQ3Zj?=
 =?utf-8?B?WXBTN0NZejU1VnhGS0VwaEEzWHdTRjhONmtOakI2U3ZoZm8wSVZFSWdETmhl?=
 =?utf-8?B?TGwxYStGQWFMN2k3b3F0SnlQL1NKV0JjOUxiZEZzdFlRTm55SUR3NkxLMStI?=
 =?utf-8?B?aldtYlBDMkhYSmRZTUtETmZmcnNraVdYOHZuMTBIVU9Rd2FNWnJUYTZydDhp?=
 =?utf-8?B?bEVIRDR5am8vSUthK1Q5THNyS3loZDJrTENremJWR1cxWkttWjRHcExnV2Iw?=
 =?utf-8?B?UkRRMTdIRVBtcU9YSEFTMW92Q2JOb0hreXRwTC85bDNoRzVJVm1NWlJCblZS?=
 =?utf-8?B?VWtDdGp2cFlvbE9ldmo3M1BpMU5nemxsRWlUWThtSUhSckVkT1p2blZXUVF6?=
 =?utf-8?B?dHVEWWtHTzdpNzdMMnd6UHlic0hkZTB4OUlsemtvdTgyTTYzczhpN2kyQ1d1?=
 =?utf-8?B?ak8xNjlLZ05wRzRxSGtnTHd2TXdrWGo2MSsyT01PeG5KaVh2Q2t0MVJ5bnJ5?=
 =?utf-8?B?M2p1RkZrTFRHQUFiVEtHYTJZdHI1QSt6L2w3QjloYmlXRXBqRitzdVFzeWt5?=
 =?utf-8?B?bkxsSzBYbGJsdElvTTkzdGg4OE96eWNDZW5nMWRXK2FTVm43WE9zZkVVTVI5?=
 =?utf-8?B?cm0raUxPRGlYcThjWFlNTUdlYzRYSzd5MWJQNUdUdzNsR2tVclFFaWI1Ujh6?=
 =?utf-8?B?c3AxazJJZXg5Ty9JNndxZllYZ3YzZ3NLemx3OTh1TTk0MDhQbHg2cHQvZjNt?=
 =?utf-8?B?TEx0QnJqMERWWFBremtkQkg1dkVVVnBWYXhSUEdaZVpyQnJvS3R4MjQ1WVZn?=
 =?utf-8?B?ZnF1c0hZMFM3aTFmVWpEc0JLeGt4OU8xYWVHS2ZrUTUraVVMa09ieXhZQjBR?=
 =?utf-8?B?Sm5WeUhCSmhEQlBRODA1MUU5REdzdk9wUnhPNldQREhQRUlXblVRRy9uYUZl?=
 =?utf-8?B?OVpNQ2lEd0tVT0R2MDBRb25wVFJ6MkJIdE9IR3BVTjJHRExJVVJYTU96SEk5?=
 =?utf-8?B?bmdYd1N2QVp6UmRUVmp2NVZvTDFGNk1ncTZlZXBxK1VxdUdNZFA3WldFTDZ4?=
 =?utf-8?B?Q2VrYXJmUy82dHlCWHpEdjh3VkxYb01MQVBTZ0ZnaDNPd2pVYkN1c0U4OWdp?=
 =?utf-8?B?VjJGNlM1VmdaQXowekM2am5OU1NNN2kxckdNUVhwbTcvL25KZmE3NlhML0Z5?=
 =?utf-8?B?Y3VEemVnK0xENVZseStkSmpzdVhFVFlHSW10cjRmQVZCWU1iVCtESkJHQUx5?=
 =?utf-8?B?RnNYUzFZZzQ2VGlELzNvTk5tK1pMcEFUNGZtTDNMZnp5d2toT2lMR2N4UHIy?=
 =?utf-8?B?b1lFUFZmR3Y2blIyK3puWllZenRGTFpvYnVkeE1EOHRncEVza3RMWCs0dWpQ?=
 =?utf-8?B?RzUrZ3lvaVVuMVdpa0g5MFZxdFlVQUk2S043MldaTGtwN3AzUVpEOFp1MXB5?=
 =?utf-8?B?MjdjQVJ1cGpVNkdWVlRJZlhrYXZuTkNhcmZjWk5hZW96dDVPc2EvQXZGVWdt?=
 =?utf-8?B?VWRhN3dDUHBRVWdoVUpIeGpZNjJCbFBEdXN6RGRsUHcrUWN2Nzg3UzlMQWlm?=
 =?utf-8?B?ZkJqeTRzRkNJV29wZndGNEtIbkdKOWpDa1Q4K1AybVlIRVZvUk9Qai9rTVBC?=
 =?utf-8?B?NDVTYjBNVDdpN2xoYWZkYzJpTW0zRTJER0NnQVBuMnFBZ1ZxSStzMzNibHpF?=
 =?utf-8?B?TnAzMUM2VzhJYjFDbTR6ZGw1Z2RWWlhpL3hUYUlPcXhra056ZFlZbTFkMThK?=
 =?utf-8?B?SG5WUXpha3dpODFkSmlSMFJMck9ndElld3VyZi9lRnBrdm9pWVNma1JDVnox?=
 =?utf-8?B?YkhNRXBXeUd5eXZHeXExeURLN1B0RWttKzh5RE9uRjFmQ3FNVzEydjFFT2xX?=
 =?utf-8?B?M0t0YlFpT1h6cnE3clN0WXQwVEtONk5sWHFFaFpDa05DWnJvQjY1ei8xK3VY?=
 =?utf-8?B?NzMyZ2hreGtuSk9IdTkvdlJ6allWa0tscVNwNEV1bTVnUUd2bmMzZ2gxRG11?=
 =?utf-8?B?cVY4ZUhlclRCZkZ6bnVRZElhcEZKRDNuaGYzUExXTlZ5cStkQXpKc3U0ZTdL?=
 =?utf-8?B?S2FZbmpuU0dQVUlqei9xQlNtMW9meHRPUTFoM0VtcHJOanJNMEdYaGxpdkpX?=
 =?utf-8?B?anFTenVUdVFmNFJ4V0hvMkU4cm5vUm1IQmYyZXpTcFJVaUlpUlQyYkE2MzBV?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd7016f-cc03-42e2-3e94-08dd30f97415
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 22:03:31.0939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uvf0sbVv4rBLKpp4BojLmQL/p21J6CTx4uacTN49UETqZYf23YtPTkAEMJu7g8OeoFvdGol2Ln5haPur/wbwMSEbizdAJlhCNTgexCUDqbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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


On 1/9/2025 9:37 AM, Zeng, Oak wrote:
>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
>> Behalf Of Tejas Upadhyay
>> Sent: January 9, 2025 7:07 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Nilawar, Badal
>> <badal.nilawar@intel.com>; Belgaumkar, Vinay
>> <vinay.belgaumkar@intel.com>; Mrozek, Michal
>> <michal.mrozek@intel.com>; Morek, Szymon
>> <szymon.morek@intel.com>; Souza, Jose <jose.souza@intel.com>;
>> De Marchi, Lucas <lucas.demarchi@intel.com>; Upadhyay, Tejas
>> <tejas.upadhyay@intel.com>
>> Subject: [RFC PATCH V2] drm/xe/guc: Use exec queue hints for GT
>> frequency
>>
>> Allow user to provide a low latency hint per exec queue. When set,
>> KMD sends a hint to GuC which results in special handling for this
>> exec queue. SLPC will ramp the GT frequency aggressively every time
>> it switches to this exec queue.
>>
>> We need to enable the use of SLPC Compute strategy during init, but
>> it will apply only to exec queues that set this bit during exec queue
>> creation.
>>
>> Improvement with this approach as below:
>>
>> Before,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --
>> kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>    Device: Intel(R) Graphics [0xe20b]
>>      Driver version  : 24.52.0 (Linux x64)
>>      Compute units   : 160
>>      Clock frequency : 2850 MHz
>>      Kernel launch latency : 283.16 us
>>
>> After,
>>
>> :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --
>> kernel-latency
>> Platform: Intel(R) OpenCL Graphics
>>    Device: Intel(R) Graphics [0xe20b]
>>      Driver version  : 24.52.0 (Linux x64)
>>      Compute units   : 160
>>      Clock frequency : 2850 MHz
>>
>>      Kernel launch latency : 63.38 us
>>
>> UMD will indicate low latency hint with flag as mentioned below,
>>
>> *     struct drm_xe_exec_queue_create exec_queue_create = {
>> *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>> *          .extensions = 0,
>> *          .vm_id = vm,
>> *          .num_bb_per_exec = 1,
>> *          .num_eng_per_bb = 1,
>> *          .instances = to_user_pointer(&instance),
>> *     };
>> *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
>> &exec_queue_create);
>>
>> Link to UMD PR : https://github.com/intel/compute-runtime/pull/794
>>
>> Note: There is outstanding issue on guc side to be not able to switch
>> to max
>> frequency as per strategy indicated by KMD, so for experminet/test
>> result
>> hardcoding apporch was taken and passed to guc as policy. Effort on
>> debugging
>> from guc side is going on in parallel.
>>
>> V2:
>>    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned
>> for other hint(Szymon)
>>    - Add motivation to description (Lucas)
>>
>> Cc:dri-devel@lists.freedesktop.org
>> Cc:vinay.belgaumkar@intel.com
>> Cc:Michal Mrozek <michal.mrozek@intel.com>
>> Cc:Szymon Morek <szymon.morek@intel.com>
>> Cc:José Roberto de Souza <jose.souza@intel.com>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
>>   drivers/gpu/drm/xe/xe_exec_queue.c            |  7 ++++---
>>   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c            |  7 +++++++
>>   include/uapi/drm/xe_drm.h                     |  3 ++-
>>   5 files changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> index 85abe4f09ae2..c50075b8270f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>> @@ -174,6 +174,9 @@ struct slpc_task_state_data {
>>   	};
>>   } __packed;
>>
>> +#define SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE
>> 	REG_BIT(28)
>> +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE
>> 	REG_BIT(0)
>> +
>>   struct slpc_shared_data_header {
>>   	/* Total size in bytes of this shared buffer. */
>>   	u32 size;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 8948f50ee58f..7747ba6c4bb8 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -553,7 +553,8 @@ int xe_exec_queue_create_ioctl(struct
>> drm_device *dev, void *data,
>>   	u32 len;
>>   	int err;
>>
>> -	if (XE_IOCTL_DBG(xe, args->flags) ||
>> +	if (XE_IOCTL_DBG(xe, args->flags &&
>> +			 !(args->flags &
>> DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)) ||
>>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>   		return -EINVAL;
>>
>> @@ -578,7 +579,7 @@ int xe_exec_queue_create_ioctl(struct
>> drm_device *dev, void *data,
>>
>>   		for_each_tile(tile, xe, id) {
>>   			struct xe_exec_queue *new;
>> -			u32 flags = EXEC_QUEUE_FLAG_VM;
>> +			u32 flags = args->flags |
>> EXEC_QUEUE_FLAG_VM;
>
> You are mixing internal and external flags here. Args->flags is an external definition. Note the current value of
> DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT conflict with the internal definition of:
>
> #define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
>
> I think the better way to do it is, define an internal value for this purpose, such as:
>
> #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>
> Then write: if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> 		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
>
>
>>   			if (id)
>>   				flags |=
>> EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
>> @@ -626,7 +627,7 @@ int xe_exec_queue_create_ioctl(struct
>> drm_device *dev, void *data,
>>   		}
>>
>>   		q = xe_exec_queue_create(xe, vm, logical_mask,
>> -					 args->width, hwe, 0,
>> +					 args->width, hwe, args->flags,
> Use internal flag also here if you do what I said above
>
>
>>   					 args->extensions);
>>   		up_read(&vm->lock);
>>   		xe_vm_put(vm);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index df7f130fb663..ff0b98ccf1a7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -992,6 +992,19 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>
>> +static int xe_guc_pc_set_strategy(struct xe_guc_pc *pc, u32 val)
>> +{
>> +	int ret = 0;
>> +
>> +	xe_pm_runtime_get(pc_to_xe(pc));
>> +	ret = pc_action_set_param(pc,
>> +				  SLPC_PARAM_STRATEGIES,
>> +				  val);
>> +	xe_pm_runtime_put(pc_to_xe(pc));
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_start - Start GuC's Power Conservation component
>>    * @pc: Xe_GuC_PC instance
>> @@ -1052,6 +1065,9 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>
>>   	ret = pc_action_setup_gucrc(pc,
>> GUCRC_FIRMWARE_CONTROL);
>>
>> +	/* Enable SLPC Optimized Strategy for compute */
>> +	xe_guc_pc_set_strategy(pc,
>> SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>> +
>>   out:
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   	return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 9c36329fe857..88a1987ac360 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -15,6 +15,7 @@
>>   #include <drm/drm_managed.h>
>>
>>   #include "abi/guc_actions_abi.h"
>> +#include "abi/guc_actions_slpc_abi.h"
>>   #include "abi/guc_klvs_abi.h"
>>   #include "regs/xe_lrc_layout.h"
>>   #include "xe_assert.h"
>> @@ -400,6 +401,7 @@ static void
>> __guc_exec_queue_policy_add_##func(struct exec_queue_policy
>> *policy,
>>   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum,
>> EXECUTION_QUANTUM)
>>   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout,
>> PREEMPTION_TIMEOUT)
>>   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
>> +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_ctx_freq_req,
>> SLPM_GT_FREQUENCY)
>>   #undef MAKE_EXEC_QUEUE_POLICY_ADD
>>
>>   static const int xe_exec_queue_prio_to_guc[] = {
>> @@ -414,14 +416,19 @@ static void init_policies(struct xe_guc *guc,
>> struct xe_exec_queue *q)
>>   	struct exec_queue_policy policy;
>>   	enum xe_exec_queue_priority prio = q-
>>> sched_props.priority;
>>   	u32 timeslice_us = q->sched_props.timeslice_us;
>> +	u32 slpc_ctx_freq_req = 0;
>>   	u32 preempt_timeout_us = q-
>>> sched_props.preempt_timeout_us;
>>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>>
>> +	if (q->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> Use internal definition
>
>> +		slpc_ctx_freq_req |=
>> SLPC_EXEC_QUEUE_FREQ_REQ_IS_COMPUTE;
>  From the codes above, I feel the user hint flag better be named as
> Something like DRM_XE_EXEC_QUEUE_COMPUTE_HINT
>
> I feel this is slightly better than LOW_LATENCY as low latency is a result
> Of applying some frequency policy designed for compute task.
We had this discussion while implementing it on the i915 side. It's 
better to keep it engine non-specific, that way non-compute(3D) contexts 
can use it as well.
>
> A related question is, does this new policy affect power consumption? Usually
> Higher frequency implies higher power.
>
> Do we only want to keep such frequency policy during submission time, or
> Same policy is intended for whole execution time?
SLPC will switch to aggressive frequency strategies when that particular 
context is switched in. Other contexts are not affected. There is 
definitely a power impact since we are aggressively ramping the 
frequency for this context.
>
> The answer of above question would lead to some interface design such as
> Whether we need to introduce interface to disable the compute frequency policy.

It can be disabled on the fly for any context, since this is just 
another SLPC param. However, I believe the upstream policy is to not 
mutate the context after it has been created.

Thanks,

Vinay.

>
>
>> +
>>   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>>   	__guc_exec_queue_policy_add_priority(&policy,
>> xe_exec_queue_prio_to_guc[prio]);
>>
>> 	__guc_exec_queue_policy_add_execution_quantum(&polic
>> y, timeslice_us);
>>
>> 	__guc_exec_queue_policy_add_preemption_timeout(&polic
>> y, preempt_timeout_us);
>> +	__guc_exec_queue_policy_add_slpc_ctx_freq_req(&policy,
>> slpc_ctx_freq_req);
>>
>>   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
>>   		       __guc_exec_queue_policy_action_size(&policy),
>> 0, 0);
>> diff --git a/include/uapi/drm/xe_drm.h
>> b/include/uapi/drm/xe_drm.h
>> index f62689ca861a..bd0150d2200c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1097,6 +1097,7 @@ struct drm_xe_vm_bind {
>>    *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
>>    *     };
>>    *     struct drm_xe_exec_queue_create exec_queue_create = {
>> + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT or 0
>>    *          .extensions = 0,
>>    *          .vm_id = vm,
>>    *          .num_bb_per_exec = 1,
>> @@ -1110,7 +1111,6 @@ struct drm_xe_exec_queue_create {
>>   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY
>> 	0
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY
>> 	0
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE
>> 	1
>> -
>>   	/** @extensions: Pointer to the first extension struct, if any
>> */
>>   	__u64 extensions;
>>
>> @@ -1123,6 +1123,7 @@ struct drm_xe_exec_queue_create {
>>   	/** @vm_id: VM to use for this exec queue */
>>   	__u32 vm_id;
>>
>> +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(0x1
>> << 1)
> I wonder why flag can't start from (0x1 << 0) here.
>
> Yes I did see the v2 comment of below:
>
>   - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned
> for other hint(Szymon)
>
> but this is regarding the definition of a flag used in exec_queue_create, and this
> is the first time we use this flag in *this* uAPI. It shouldn't conflict with UMD's usage of hint flags
> in *other* uAPI
>
>>   	/** @flags: MBZ */
> Remove this MBZ comment
>
> Oak
>
>
>>   	__u32 flags;
>>
>> --
>> 2.34.1
