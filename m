Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E78BAF266
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 07:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99A810E667;
	Wed,  1 Oct 2025 05:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgfw91q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5B510E303;
 Wed,  1 Oct 2025 05:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759296850; x=1790832850;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Pdv+iIgggrtdX1u6W+mUdh4jnZaj+gGTbPjsqHl/rxU=;
 b=cgfw91q0XXeFl7lccytL3dxudWl/MO2WXMJZYPoyTYKsqTXSssIrsini
 65RqIKTyWWAAbMuRcYx4pSFD4uTuTBcWbp89VvrZCD5vBE4M26lDlXp97
 b4iimy3sBpLk5qc+yfMi2g47u82OwlwMDBDOvvIG1TOunat79lQFatMvs
 jqJy4b9s3TzsfEGDIIWXzhC6zS9F1mJ6DXvSluUjFJnaAur5U8rsSqJzy
 ho+Byae16q2ACHVd0cjAZKu5N2PnPMV8zH8Otl3pCuk4DOD727+Uybtnq
 9H1hGy3RmFYz7WipewJb3cXGPeEBKEZ0AKNv20ua4BxGhgEJgiyDWsXKx w==;
X-CSE-ConnectionGUID: W5vAyqwPSO+Q90ZNqZ+INQ==
X-CSE-MsgGUID: Wn3h0hHoTyi1qHRSX21qaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61731797"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="61731797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 22:34:09 -0700
X-CSE-ConnectionGUID: CdBVTf0/T7KfZNtT+wMLWw==
X-CSE-MsgGUID: v2CZgfQURTmOYLgx182SDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="179466634"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 22:31:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 22:31:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 22:31:53 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 22:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoacRliPoeiDV1r3KUKNN4HkEkYoZV+ul5psISYF7Uj0xVPkEAD1ekiVc+PpyjdMHke5NiQUokewEdYTqx0vnKPLJAN9T0kywWpFZrgoGpkNv1QpVI4D4fSsR3HsVmGFZ1VqEd0QanytBXOJWgmK5S72Xcf68m0k4ImFXYecLBs1b25+1KgADGZPUWsfdvFdtWnbhxlR9XuJDVTPU2Kxb3TnmDOuaerAz52LlNvzrWeue9oaI1bvK3ebXiDi/VWMstEBMa9DJDkwExc1pCWMgAtkPBQuUYMDfK4wj7Ex0UWQole9uNc9dGdfDWOqgDn/Cbjj2NANKids6JiMJ8BtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qh68j/8dKiymk5OesYaO5vQUeHcyhbdwzLZeZDnhOH4=;
 b=wibnWIoctoUvGxEVfLnk/6SwIWol31UkON3f+uAEHk3LB1reFNQMPn04ETMWM1xmoT+FlHsk7YzeK6Qj1HzBiLB8fXKpRizUEdZqMrSvTtaRZuyQciEqmRoOhyr2mLo4Ummq5LMuRHb+AlDUmnHNUAGyQqpInrzOjM/qQyfOsFC7zNSHOBSC0nsUmCYw8N3RE6FccVAnqCt+4Dtlmhhr/rPDedx8koY2fsJ/g1HVGq+XDCuRt7JjxmAvox5jm9ja7lq+/veA0egLbkUV/YMYlUoujX/f7S8X78dIvjEht/G8+J7wbFBB9Fe9fvmzB6fjk4E95WmqotHdGuyVaok3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 1 Oct
 2025 05:31:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 05:31:50 +0000
Message-ID: <8a461b13-4b08-44c0-9619-76b96b4d386b@intel.com>
Date: Wed, 1 Oct 2025 11:01:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/i915/display: Add filter lut values
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250926113728.606315-1-nemesa.garg@intel.com>
 <20250926113728.606315-5-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250926113728.606315-5-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6dfac8-1465-457a-e57a-08de00abd292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDgvQzFZMC9kRjNnSTFIbDdtMm1tZWovYXJnS0QvMXJ1LzlJU0RiK3lqdVY2?=
 =?utf-8?B?bFhzVVRGdWNPT29qTDlpNUxicGEwQnA1N1A5ZFJ5N0liL29WaXFSOGtlZEVn?=
 =?utf-8?B?Q0l6OGhQaGxvaXk2SEJWSHk3THRPYXZsTkZZUERWMUFvWVNWbzVTdDZ5cEEz?=
 =?utf-8?B?bGZ0YXhlODI1cHhYNVJDWlFsWTBnZ1dBUWZGcEVEZ2FqOXU0K3Q3WmlFcmpK?=
 =?utf-8?B?bHJCaVM0Q2RFZXkyVVBaNW1DR2lyeGhPa1JxZk5FK1o1bnJzaUkvVzhxajF3?=
 =?utf-8?B?WVlhWUdjOUg0blRtUEdBL2REZEVpUjRDd0ZtRkVKTjZzQm94dmdKb2Q5TW96?=
 =?utf-8?B?Q1BLWVRtK1F0bnJUdkJBdmZjQ1JZdkR0ZnlmUEFSTEM2eDVReE0yZHFpTTBs?=
 =?utf-8?B?WHkzQnVHa0MzZmFkTjNVcUFPTnJvdUhSREdra1JsVlFrZ2w1eVNKOUJSLys5?=
 =?utf-8?B?OVU3TDlEM2JCcm1HaDVCUHI3ZndFT3BLV1g3Yi85QjRPWlFPeFVkcG5TWmdH?=
 =?utf-8?B?U0hkbSthak5KYVZlZlNaRWtDNktLNE5yWkFpY3F1SE9pVXQrdHhsalpsRVRn?=
 =?utf-8?B?eklCdm1oVVVpQUUvaVFUMG0wQnloWEdKMFBQQVgyZDNaOXBZK3FIQWllQ3VB?=
 =?utf-8?B?VnkxSjhjNzZ5ZnI2MTd6TUwyd3NRMnVrM2lLQU04Z0VvVUVJQkVlZmNRcG9O?=
 =?utf-8?B?S2dBb01hLzNIMTdjK0ZRTHZtQnhaM29WOER1N3FLbHdZc3lISGQxMkhUM1Vm?=
 =?utf-8?B?R21wdEtOR1FZS1REMmN5d3EwYkJFenNDU1hXNkJTMVhhVW53VlFseEg4dUp5?=
 =?utf-8?B?MytJZHhHdzRkTldhU3ZwMDhoSVFlck9leUEyVG90NXFhRURubE5RVTU4ajIw?=
 =?utf-8?B?cm12d1B4UjF0QXVSWjJrTlcrRFhLakZ6aGVIUlh4K1RRTllFTU5IRWN3VHVH?=
 =?utf-8?B?VnpSZkhSUG4wQm5lMVBsZ1ozaUl6bVdoUHNiQjE4ekZPR21sZXIwWTBXZ1Nn?=
 =?utf-8?B?bDZsM01WUVdUV3JSMHVIblQxRFNWZXJyeU1JbUJZYlpBcldIT2l2cUsxZ2R2?=
 =?utf-8?B?VFFOOC9sVDhHQVVLYWFiV2dOcmJqaW1vUUFVV3o4L0hUb2ZBcEFYR0dHRlRT?=
 =?utf-8?B?c0xoTHFJQXIvaFc3R1ZFTktmcEJyTkpidkNSVDNyaVp3WVNtWFZ5T3gwMUp1?=
 =?utf-8?B?clhUQlB0c1Q4c2lkZ1NpVk40K3FsM0MwSGJSU1RQVDhFakhGNnpUbFdpR3Jh?=
 =?utf-8?B?ZWhyM1FUZEp6SG1xRnJseHdZaE9ONlZaaEN3bGJTMjQxZXlha3B5cXByMXUy?=
 =?utf-8?B?U2lOMG1DbTVRQnUycW9iRXNNWE4xa3IvcEV2SERlT1ljUGhoVEFOcTh5Y2E2?=
 =?utf-8?B?bW9nSkthMTMxbjJXRE1SS2ErWEl2V0NVbUxHeDFUQVV1WE9QcjNqay8wZHE5?=
 =?utf-8?B?ekdQMkNrNnNEdzNtbDFESDNxbWFENTlUR25SWm80UWJPL2tKV3JVcldSZkVD?=
 =?utf-8?B?L3BrNE9iL2R5UERwcFIrOWxGZjBHZVgzK0xNNjZwb283M0UyVEhDKzZydnZ2?=
 =?utf-8?B?NlZXa1dneW44RmxiSUNXMGIyRXN2OHVIN2JWM2pZdHo0QjJGNkJQQlZ3ZnQy?=
 =?utf-8?B?WUNLeFZVb3g1eXpsZTYrS0FIMVdFN245R1FSM3hEWEUwMUIvckZ4VWh4Z3ov?=
 =?utf-8?B?dVlaTEplU0dmY0F1MEJFbmd0NW54ek5aL0t2d3dEdkRlK2RuNDZoMDUySWZj?=
 =?utf-8?B?SnBQOGxiRWU3eUxTdVJXVjlKVER5eUZhcjBJNUxKdG9MM0lxci9ZTEd5akdW?=
 =?utf-8?B?d3ozVWNTU3J1NXgyOVZScUlmdSs3YlppcVlCRnpHc1hyUHMyU2p5VkJQY2w1?=
 =?utf-8?B?OGNvSHMrdmpUVFFSajlRT3FUR0VOLzZTNWlsM0w3MWpCc0FzdUlMS2N2Qkxi?=
 =?utf-8?Q?agyZe8rGkU8d3vhpZwM37eZAY2STXAZi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm02TWhBZk9kaW5MaG1CemtWYXJkcCtjdldDcFZaaTR3eE9uL0ltT2JzVjFy?=
 =?utf-8?B?QkRyM1RodFVuTFFES1RLaTdCWjd2WnMwVFdBQlMzL3pSRjJQRERrMlNTTGFh?=
 =?utf-8?B?M0FuTUxUbHRCWitvNmpFdU93NTQ4U25uRW9mc0xqQkdtWStENVZtanBjVW15?=
 =?utf-8?B?dHl5L3N0Z2tCVTVPenhrU2hwZmlrVUZNNGd6OXd6YVpjTldGUWxYZXZjNW9R?=
 =?utf-8?B?OUlVZmw2U0pCNUN0TmRhcVJUME5CdGh4ZTB2a3QzRlhBcllqMFZlSkE0aFF1?=
 =?utf-8?B?dUJZSWp0RDZGaWlWeW5kMXptVVY4QW5EWjBTUVdhMUMwbUVBYWVrSW4rY2Nv?=
 =?utf-8?B?THVVeFg2UVYvWXpEVnFwNENaOStkbzU5RTk1UUc2dUJMbmFZU3Ard3UwTXNS?=
 =?utf-8?B?V0s0SlpjTFFmYVN0d1l3YTVKMXo0SDBPZ1Rsd0Z3S2NnN3J2YXBneURBdzlJ?=
 =?utf-8?B?NENlRGRxd2JybDAreVg0aFJINEFWb1RZcG5NNzRZbXE2UW50YmdCSWptZUp3?=
 =?utf-8?B?cGVEREZjOGYrS3k5Z015M0JZNlhWTkM2ZmdjMXZUaXFxbEZFN1RIbXVzdG43?=
 =?utf-8?B?YjRBakRLOEIycTVZenExOXV1dEoyY0Z2dkFYbjRnK0g3bUFraWNkRUhVZ3pj?=
 =?utf-8?B?cGE1engzZ0lTM25Jdjl2OGt1SHJTVWhaZVNFMGIvbktoU0p3cUpHTnpEVXY3?=
 =?utf-8?B?cjg5UUFoRVhVcTJxMGM0UlhQQzMrUUsyNVVTekdEOG9IenoxOG9RWUlEWkQ4?=
 =?utf-8?B?M2JmQnl2S1pVVXRQK2hTaWswNy8vWXNpMmExZWxtcmZ0ay9mNW12Vm1adGlj?=
 =?utf-8?B?SERHbGR3S3l0ai92U0pFNGU4YjRUc3N6OEJ6R2FpVXVtOXBsc1BlSXBMaitL?=
 =?utf-8?B?a3BZOVJZaU9JaDl1ekpKMlMxaW94aWEvRkVmTWxRMjNRYzNIR3NlU3kwNm1Y?=
 =?utf-8?B?cHBVYVZFNjhHUWRGWlhjeVY3MVE1Qy9YMFFLOE41Y254MWQyTytOZFdqVlB2?=
 =?utf-8?B?S1BST0NiT2VTcFp1Tmx6Z2V1SkVPTFNtYzBGRE5QTWV1Ky82UVJkQ0JvS3VV?=
 =?utf-8?B?Q3NnT1NqaENqY2R1aHpoUGczWUR5ZmNDczgvdUFhZ0lIOE91aUJCMGtNdGpa?=
 =?utf-8?B?anF4ZVlvSmw2anc0cENKbHBGYzArZ1RrenhnMk5DaWNLVkxlVnJMNzBVemNC?=
 =?utf-8?B?M09Hck9OT3pYbnBRbThFWGNlMVlMZlJvV2lIbHQzNEJHem9xQjlTQjcyZGJS?=
 =?utf-8?B?UUczKzVPUjNPS3hFdjRWYnpxYm5EUGJEZ2poTmxjSGN1dG95b21RQy9QNHc0?=
 =?utf-8?B?Q2xsb3FvUDZPT0ZtRmZqcW5Ea0k2MFRwVm5aaVBvQmRhL011dko1aEg1b3BW?=
 =?utf-8?B?K0VTcmV1SVRJOHRneTlxQjJ0OG1HWXg5bnVhVU5jaFdjdGlxUVllZi9LSzdz?=
 =?utf-8?B?UXVZTWxiKzhSTzRtbldrNlF4dGlxV3VsMU1JL3BSNmF3QTZoVTBqN0xBcE92?=
 =?utf-8?B?WkJMT0ZoV3BlK1kyby9qOElTbnBmVzVVcTcrWEFEMjhjWW42OWxDa0JGcFJN?=
 =?utf-8?B?NjZGY2FyajdlZm9EeGwwVTJBL0o4TlM2WFFselVPc2VjSFNEaTFMSjN2WHNR?=
 =?utf-8?B?Vno4YWNiaGdMSmFsYWM2cmgyYmFaSlEraWFNMXR4SmptM09oZUVQTTlEYlJW?=
 =?utf-8?B?R2loRXl6N2VHd3ZSZGVEcEdYYTRtRmJrRFdJN0FjelUwS1QrditieUlsR0lR?=
 =?utf-8?B?aWhENXZqb1A2R21MUDJ4dUpuZmxsUVhzdlVCdngyR1l6cTRXc3V6U2E1dWNI?=
 =?utf-8?B?U3ZZV25FdzJianlVUUM5cWRuV3ZsSDZJVk14eXdaUG9jREUwcXVsK1VOYk5t?=
 =?utf-8?B?bzJoTlpoMWtzdUkvLytwYitjMUt5aUc3anBRVDZoQlQxS1ErZHNGV3o3S0RE?=
 =?utf-8?B?bDJXRndPOVA5RHBDc1BmZzBRNzM0VFlWSVl6Wkhqd29PRDhZWTJVbFFiSTRx?=
 =?utf-8?B?Q0FuNU04M01WMFBPd3llelA1RGJPdHQycnZNMVVpbzkyL25mbXRERjVGWlVz?=
 =?utf-8?B?R0MxTkk1dHJwL0prMVRSSXJoek4ycUFiQnZBamZEaVNKM2NsT3c1czhUYS9L?=
 =?utf-8?B?elBOTWNGOVY4cEo5bDRsc0dFSnRIQW5FNGVZWmhYM0w4TUlNaE9ieUdvUUxF?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6dfac8-1465-457a-e57a-08de00abd292
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 05:31:50.9001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5F2PTe+7GbIGrOnog/SrC8gmt7ITd8wuuKnSy4j7EYtRiyiU23DYAqXWouo480cwDkZlpWla/uJ/lAUC2JYeY/Vu9F5k48xJCczb7uYWO+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
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


On 9/26/2025 5:07 PM, Nemesa Garg wrote:
> Add the register bits related to filter lut values.
> These values are golden values and these value has
> to be loaded one time while enabling the casf.
>
> v2: update commit message[Ankit]
> v3: Make filter_load fn name same[Jani]
> v4: Define the filter macros here
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 47 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  3 ++
>   .../gpu/drm/i915/display/intel_casf_regs.h    | 11 +++++
>   3 files changed, 61 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 4597e576b6dc..45bc67377d21 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -16,6 +16,13 @@
>   #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
>   
> +#define FILTER_COEFF_0_125 125
> +#define FILTER_COEFF_0_25 250
> +#define FILTER_COEFF_0_5 500
> +#define FILTER_COEFF_1_0 1000
> +#define FILTER_COEFF_0_0 0
> +#define SET_POSITIVE_SIGN(x) ((x) & (~SIGN))
> +
>   /**
>    * DOC: Content Adaptive Sharpness Filter (CASF)
>    *
> @@ -31,6 +38,46 @@
>    * original image.
>    */
>   
> +/* Default LUT values to be loaded one time. */
> +static const u16 sharpness_lut[] = {
> +	4095, 2047, 1364, 1022, 816, 678, 579,
> +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> +	73, 60, 48, 36, 24, 12, 0
> +};
> +
> +const u16 filtercoeff_1[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_0, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_2[] = {
> +	FILTER_COEFF_0_0, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_0,
> +};
> +
> +const u16 filtercoeff_3[] = {
> +	FILTER_COEFF_0_125, FILTER_COEFF_0_25, FILTER_COEFF_0_5,
> +	FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,
> +	FILTER_COEFF_0_125,
> +};
> +
> +void intel_casf_filter_lut_load(struct intel_crtc *crtc,
> +				const struct intel_crtc_state *crtc_state)

This should be static and should be called from intel_casf_enable().


> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	int i;
> +
> +	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
> +		       INDEX_AUTO_INCR | INDEX_VALUE(0));
> +
> +	for (i = 0; i < ARRAY_SIZE(sharpness_lut); i++)
> +		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
> +			       sharpness_lut[i]);
> +}
> +
>   void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 83523fe66c48..3edbc3ad51cf 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -9,9 +9,12 @@
>   #include <linux/types.h>
>   
>   struct intel_crtc_state;
> +struct intel_crtc;
>   
>   int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
>   void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
>   void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
> +void intel_casf_filter_lut_load(struct intel_crtc *crtc,
> +				const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> index c24ba281ae37..b96950a48335 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -19,4 +19,15 @@
>   #define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
>   #define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
>   
> +#define _SHRPLUT_DATA_A                        0x682B8
> +#define _SHRPLUT_DATA_B                        0x68AB8
> +#define SHRPLUT_DATA(pipe)             _MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
> +
> +#define _SHRPLUT_INDEX_A               0x682B4
> +#define _SHRPLUT_INDEX_B               0x68AB4

It seems the macros and the registers offsets seems to be not separated 
by tab, but spaces in some places.

Can you check these once?

As per i915_reg.h : “Indent macro values from macro names using TABs"

Regards,

Ankit


> +#define SHRPLUT_INDEX(pipe)            _MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
> +#define   INDEX_AUTO_INCR              REG_BIT(10)
> +#define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
> +#define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
> +
>   #endif /* __INTEL_CASF_REGS__ */
