Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFEA773F5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8AD10E175;
	Tue,  1 Apr 2025 05:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOpgtrf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB9E10E07B;
 Tue,  1 Apr 2025 05:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743485616; x=1775021616;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ABFYvXz5QZDEHUJ1poV1MntM/VqRBhdJ8Y6LDo7HYBE=;
 b=XOpgtrf8pfChU3JJhwGeeP8U/TVUnsvD21IO0DVX1HvET00U5B94f+d5
 jCwkMF3Q7cWOCLK78/zV2SQT2FK4KLsKnFpINwEZo08TfhcNpzWEM+oiv
 Q+ZrOfJ6OsLhEAgjA3GvP6CA6msJwLGQNESfyVEZn6vpOY0/nqXZSB8LR
 pWnSLnH9uebUT8S/RRXCj3bju7qqHiaz1qPtx3JSNoBilmvtXWwZ6eDVV
 I/4QuKuNK7MUfme8rJlj6IfiH9ByWc+4J15unedkvG7c9Gn9o6dNTaHJN
 5pp6Rcj7vkoWGvmSwXJPmN6nktK+/2we4ZsMgUp5bdNstrJE16B6/EGxH A==;
X-CSE-ConnectionGUID: p/Ss7Bb5QE61xvxvFpyMpw==
X-CSE-MsgGUID: AbQBFybYT4SP8qHlga3E5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="32389594"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="32389594"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:33:35 -0700
X-CSE-ConnectionGUID: HxbzgO5TRAqo1PTbf3HXSQ==
X-CSE-MsgGUID: g8bWbcdmSZWYFdjSuJwKRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126040401"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:33:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 22:33:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:33:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyA1yWsNU4kJ5161GLOCztql5o6gjKJNTLWaUzCHm52gthVBRs79C1WpVZTTviHXBMVoOgGX/TlAiN10Co5O7zmbU60FtJIBblvJ7bDTqhjZaKQ/lMIqP9+618iHhdKHFJkrs0EdrGs7fGShFVlBklTnha/2/jdRgeiTkwpExQPuckD6c9mmljwAmkCj8GZ8bRm5qrx+WREngvJBuGcTYY5XlsZV3RAWw4DmQdMKaHuQ5kvEFx1E6PDT2ybRaukThcA+SigtCisve30QoP2hXqJdBkzQiwhES21XygyyQkLeMwiA8ah+8S+/hR6XIIeElN7D87X5Dj1bLGh/K+roKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=337nra4Wu00ENjrDjZYQ7hBXbE0LJLGpGAaxlwsSEg4=;
 b=B1QyRRtXgZpELsE5vAYij7L2cY0c+/Ele6IrVz6QebvjYAx0SNRPp8/9f8kbyaCJ252Z8a25IkzIwQGmJamQ92x6xgk3rDrvfJvGk9vVlgLJN11ULjAz1RjyIYZfxcEh68gLCxUzpuV6iC1UxzLZyj2i7X/2D/ZLbEvzeR6ZJf5aMAb6O8xCZkRD/srYUWbck/eUd4lhEUpNPxEo8K9YdvN3+1Cvi4y1U/MNpkxtvkPrp05X0pKR9JtJGnqtiCQ8mC6jVGjNMsj9S1P3XtfieqrS4H1k+v4vleKyAPunXsn92ripzEpUKsgmfeol8GGid6b07SSQV92+cFUJjIzBjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 05:33:05 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:33:05 +0000
Message-ID: <61fc84b0-46f9-4f2d-91d6-29cc42386290@intel.com>
Date: Tue, 1 Apr 2025 11:02:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/i915/display: Configure the second scaler for
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-8-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-8-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 649518ab-e2fc-455c-dc4c-08dd70dead6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEhEYy8yZC9IL3F4dGVqR2NhZVluSlBPVVlLeFhySWQ0TmVGZHRGYkY3aU1k?=
 =?utf-8?B?ZVppVjNOVlp3YXFvZVQyVGhPbCt5OG1yakdvZkQ3UFRCdEtQNm9qeFZDR01Z?=
 =?utf-8?B?SnVDV3M5dENPUWh2NUlmRmI5WjY5dVBhbUZXdFd3aUNJYUxmSTBuaXVOSVA5?=
 =?utf-8?B?QmFyY0E2ajIvb1BEbTRseE1GNFRCcVQxNmcydG85Q1lGYUxyNHQxVC9nVkdJ?=
 =?utf-8?B?SjlXSEVlNDU3OWhXNGpNVndQVUtVeGYrOEJOalVKY2NmRUFyUUVEd2JkS2hw?=
 =?utf-8?B?MXRBVjVMUVFDSzhwbHBoMm9hSmljU3k3ZExCYUxWd01sWE1BZFBDaU9QVjFT?=
 =?utf-8?B?djZWVURiNlJqODlEUTl0Wlg5bnB3RXNRZkFabmFaa0MvdkswRkJORXI0RnIr?=
 =?utf-8?B?MEVLYjlBZkhTVWlDaW1iZnM3b1B2Y3NmWmxGcFg4eTVWSWpJTE9SYTd3d0xm?=
 =?utf-8?B?eElGWTVpWTdmam96R1o3V3FNbzJ1dzd3VWhXSFJNVzNGdDU3U2UrRWFFdzNU?=
 =?utf-8?B?WUoxdFRwcWpOakFFNU0rUml3d0dPV3dKZXpGVWtRQU1QVHBUNmtIWFJpaTk3?=
 =?utf-8?B?VWYzY3JacEpldk9CRDU1VlVWRk9QalorR296UjVrTTZSQTNNemhPOWFRWlgx?=
 =?utf-8?B?a2luT2k1SXR3Mm1KL2I4YjJtWGxlTnFwRlNTcFBJZm5nWkozalZsY1VtZXl4?=
 =?utf-8?B?SWxNNEJDamNDRHAwc3g4UTZtUndxait6MHI2Y2RncVBQd3hpbzNveFYxZlh1?=
 =?utf-8?B?My90SUR5b3oxTHErbXJOVlY4M1VXZGFoaG9qMWRxcUVoMmxvTEFSTXluVm5t?=
 =?utf-8?B?K29UNzJIRWVjZ0JDTy9hcUljZGpJZkhybUZQdkZvMWYyQXpRb2RPYlAwSVFD?=
 =?utf-8?B?QXhPelRoSmJ3ZU1icFJyb2hEaWIvNjF4eHF0NXE3dlZ1R3BDWm9lUnZLNzB4?=
 =?utf-8?B?K3Q2MEdEellRUXUrZ1ZFQkZRaEYxYlpMS2l1anZrMDhCY3RxNlArWTN5VnJN?=
 =?utf-8?B?cTBvV1lTNW16ZndIeERScHB2TEY1M1NQZDBxeDRmS1p5aTJCQ3grOHkzbEZE?=
 =?utf-8?B?WDh0aW8wN0NFMFo4VGRFQ3o4WDNudTUyTXNZTlFlZStKaDRGZTRrVHpSZTdR?=
 =?utf-8?B?dkFyOVBvT0w4a3FPOGNjRDFRUTdLVXg2cVl4QnhIK2pidnYzQ1pjWkJJYWJZ?=
 =?utf-8?B?SExNdkR1eDJ1YWlycnVtOHd0TDg1QW5tRUZmTmx2ZG5qbEZ1RDFZMHo3Rk0y?=
 =?utf-8?B?VUczbk5uSnQvMmJmM29ERGVYSU9mcUdPbjZLdzA5VG1BTmpWUjJKbXNlZVB3?=
 =?utf-8?B?ejBXZnRjbEpaTW5oRk1kOGU3TkV0MWJOT3ROaWhibThTNmtyanZlTlhaeVl6?=
 =?utf-8?B?V1FXU1BWUEZZNGZUOHpIb3JoS2dveHFwU01YMXNsVVhwZk9GNlBrUHVuUElG?=
 =?utf-8?B?OWpFemFOUkFCdzBsRXlzdTB4K0RIRlBpZFo4WExjM0xHeVJkNTNLNzlzUDFQ?=
 =?utf-8?B?dkRQYjFTR0xvSDV6dDJMUE5nNzNYK203b0hJUmh4OXVIbXZqc3ptc2tHdGcr?=
 =?utf-8?B?WXhzRmowRjRaUjM2YWdPUWk4cmtRVWRyc1ZBS1VrRFV6WXBFeVB0a2NEVSsv?=
 =?utf-8?B?VCtUSjZHMXMweHVXVDZlcC96azR0RElGSUk5d2tDUThQQ0FlV1EvZm5TWWtI?=
 =?utf-8?B?Z25mNG8ybVlnQXFCT1Nwc2taV2E4WktCNytLbEtMK2Nib3oxTDA2RHhMbFVP?=
 =?utf-8?B?bUs2Y1kyOG5LbHZyVW5SM1pYWHpiNDRKNktmK3FmQXdjYjU1TXBMY0dhS1dp?=
 =?utf-8?B?Y1pRM0hEWCt3WHY5RzRwaWtPd2xyN2RtQVpaNE9JU2M2bjhTU04rTzErQ3ZW?=
 =?utf-8?Q?ctqq36CHFik3N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXBnYWNNdFdYNjdCOW5xKy9qdDRiazRnbjhQeXlPWGo2dXk5WStHVDVycXpD?=
 =?utf-8?B?SFNHVWxHV3NNMFRjTUlEVTdpRzJDeTNzeEpSTzlINVR0YTNOekliRGtXVGpv?=
 =?utf-8?B?Nnd2YmdwbnZ0OWhOU0dRNS95Z1YxVDBKNXEyTTIrM1B5UFFGSHJlcFJsMGp2?=
 =?utf-8?B?allGaW0rU3FFd01XS0o2T1JtUEN6cy9uUXYwQnhJbFNMS0RMT1hBYm9iNEp2?=
 =?utf-8?B?SW5QTHphdUpsbHB6SDBkd2NpSCtnRGxSTmh4cXhZWEJvb0tobGdRTkxMRzNt?=
 =?utf-8?B?YXhBaFJnMTFweDIzTVFnQkhvSVRBbmdxN3J0MjVrYTRQMWl4SGZpa0xPdlB3?=
 =?utf-8?B?L2tJbWFkOUpxbDg2WlB2Y3k5VU1BdkY4ZVpHUXJZWGtjaTBjeTVtTGl0eEc1?=
 =?utf-8?B?amdHY1FJYmEyT0grT1VaMzlxTU9oTnJScWlzTkx5Ylh1dlJWR2dNMnRYdTZq?=
 =?utf-8?B?ZUFhMEU1cUVNL0tFY1Z3V1hKUEV6K3p5KzFsZ1NIcit2NVc0NTBHVENxVVRI?=
 =?utf-8?B?ekZiaENJVU91eW5VVUN2MFJtOXhoTHI5MWVQSVVibEtMZC9oajBZQnpNQkNH?=
 =?utf-8?B?dVMxRXdsVkNQQ2ltREo2MlJRVVpTaDA3bkNPVkJmM05PZHozQjVTVk54OU9u?=
 =?utf-8?B?R2wrMHlyeTFzaHlqRERpVmRDRVhuVUp3QWVhRDBsamxSVXpLdTBPb2hsZlBz?=
 =?utf-8?B?SnY4WllIeG1EQnlLbUsvaEk5b2wwa3l1aWZuZTdJaC92bjU5ZnVaNzVyRlo1?=
 =?utf-8?B?Uk5TWkhocSt0eitiSDFhaUNUcWtTU280OG5mdmM1bkN5TEdQd01rUHI0NDJR?=
 =?utf-8?B?VHJ5TGNuZFA4SkMxKzhyb2loZU5hS1JEaEJyV3k1cUR6MFMzM0pvQ0ZLdE9C?=
 =?utf-8?B?SHhQdFlldGhNY0xYV09WVXZOdFZGcndQbEpUMGR5V09lTTJabGlMVFhCcWdJ?=
 =?utf-8?B?aVRCR2dNeDdKMmNRR2Nqam54blNzTWI0Tm56RGlYU2E3R3d3M3d1OTNjOUwv?=
 =?utf-8?B?cmR5NDhXcXRhOU1tY2tJSUZ6d1p4YTBRMStNOWlINzBVaGdyNGdUQ3B6Y3Ry?=
 =?utf-8?B?UXQxSldnd21PNW1kTTlIVlpFdVlHNzcvUFlMYmhFOUc4c3RyS3JIWlRYUEF4?=
 =?utf-8?B?MXlTa2RkTng4dWlkWXBOdFVVdE1zSWNaeTdPa1ZDREluUXB1dHA1cGZEa3l1?=
 =?utf-8?B?Y3o1c2JDSGQyaTA1TmlGeGg2MEx6N2E2YjBjblJGMzJuY3o0VVREUHdnT0Zw?=
 =?utf-8?B?bE9kTkR6SUc1OWlac25zZEdoeC9mazdvbEpTa3NjOE9WZlhBVUdpa1dFWUpD?=
 =?utf-8?B?YnlLMXNKVmdKT1pJSkRkRTg3T1BoK05leDNWYmlmOVdXZDQ3V3R0UnpLNlps?=
 =?utf-8?B?ckFWcjhwaVFRbUtaYUV3anZ6cUo4Rml3VU5BRU9lS1JES0wwVUVLSHBRKysx?=
 =?utf-8?B?SUNndHpDd3djdDhrVm10OWR0bVFmRFFMMGloQ0VqdElKL0tBUDdFbzErbkFJ?=
 =?utf-8?B?azQvek1xSXFPVjZSdUFHVzNtMUpnbkJsaHp6VjJ4RnNDcEFVTkk5aGlmcHpt?=
 =?utf-8?B?TzBFUkR2N1hsSy83MkZqYjB2YXM3QU5KWFc1c1Vub1BpcGVRRDNaV1BlbnhP?=
 =?utf-8?B?QjZGV241b3EwU2gvVm1xVG5SU1N6Y2dCU3BRZDVEemlnVmM5VGdsTmttSjNZ?=
 =?utf-8?B?bXZYampjQ0gyN1IvbFFSSTN4MWlyWmV2TGNVWndYb2UxeVNtNHRXeWtWNis5?=
 =?utf-8?B?MEw5ZUltVG9sZmNTcjl1bFh6akFQamNYTFhRQllLT2hVM0xDYkJvd3VZVUVS?=
 =?utf-8?B?NGEwQkthSllQTElEVjArYkFFQVN2MkthNi9oc0ZWSS9rbHVKUzF1VXZrblI5?=
 =?utf-8?B?S3FUdDgwOGVQU3VZOGNCaVp4NXBZWGthdWo2a2loL1EvaHBkR3dNd1FQcDho?=
 =?utf-8?B?VXp4NHg0em1Ob0wxaS9ZOUNWRHdoU2svMExORzhnWEYyQTRhTGxSQlJ4ck5B?=
 =?utf-8?B?eHpoZ0FYMlhLeUpDZEFtNzRBZUp0T3RuajVianZVWkVDRk1oTktBRjR0bmpL?=
 =?utf-8?B?RWROV2l5VXlNbGx6N2hRUzNLR2FqVEl3WWhmcHU1VWRESlVDS1NSRWRrT2lU?=
 =?utf-8?B?OVV2NHpFajFZL3pkNlRJUXhaR0RZaVhiSTZPak1vNzBTMEFtcWRyamczaWVI?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 649518ab-e2fc-455c-dc4c-08dd70dead6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:33:05.2118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftmE5jhRjRdjbTpOlSXBcZeMJUoHCCJECGTbhroJYJ8MdWXlnjjqpcEDx5Sokjr79pAIiKdkgiB0s1xSoW9wWFdGayQFQLYcHWwbum6YRqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> sharpness

This again is part of subject.


> As only second scaler can be used for sharpness check if it
> is available and also check if panel fitting is not enabled,
> then set the sharpness as both uses pipe scaler so only one
> can be enabled at a time.

This can be improved. Avoid having one long sentence for the commit message.

Regards,

Ankit


>
> v2: Add the panel fitting check before enabling sharpness
> v3: Reframe commit message[Arun]
> v4: Replace string based comparison with plane_state[Jani]
> v5: Rebase
> v6: Fix build issue
> v7: Remove scaler id from verify_crtc_state[Ankit]
> v8: Change the patch title. Add code comment.
>      Move the config part in patch#6. [Ankit]
> v9: Refactor the patch[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c    |  8 +++++++
>   drivers/gpu/drm/i915/display/intel_casf.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_display.c |  4 +++-
>   drivers/gpu/drm/i915/display/skl_scaler.c    | 25 +++++++++++++++-----
>   4 files changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 4c41a41872bd..367a73a91ae6 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -148,6 +148,14 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
>   	}
>   }
>   
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state)
> +{
> +	if (crtc_state->hw.casf_params.casf_enable)
> +		return true;
> +
> +	return false;
> +}
> +
>   static int casf_coeff_tap(int i)
>   {
>   	return i % SCALER_FILTER_NUM_TAPS;
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 381d5e10c70d..026a2b8348df 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -17,5 +17,6 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
>   void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
>   void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
> +bool intel_casf_needs_scaler(const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index b852ffe94a10..4ffe738ad725 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -60,6 +60,7 @@
>   #include "intel_audio.h"
>   #include "intel_bo.h"
>   #include "intel_bw.h"
> +#include "intel_casf.h"
>   #include "intel_cdclk.h"
>   #include "intel_clock_gating.h"
>   #include "intel_color.h"
> @@ -4225,7 +4226,8 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>   
>   	if (DISPLAY_VER(display) >= 9) {
>   		if (intel_crtc_needs_modeset(crtc_state) ||
> -		    intel_crtc_needs_fastset(crtc_state)) {
> +		    intel_crtc_needs_fastset(crtc_state) ||
> +		    intel_casf_needs_scaler(crtc_state)) {
>   			ret = skl_update_scaler_crtc(crtc_state);
>   			if (ret)
>   				return ret;
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index 39fc537e54f0..d816dae9cec4 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_reg.h"
> +#include "intel_casf.h"
>   #include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_trace.h"
> @@ -272,7 +273,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
>   				 drm_rect_width(&crtc_state->pipe_src),
>   				 drm_rect_height(&crtc_state->pipe_src),
>   				 width, height, NULL, 0,
> -				 crtc_state->pch_pfit.enabled);
> +				 crtc_state->pch_pfit.enabled ||
> +				 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   /**
> @@ -311,7 +313,9 @@ int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
>   }
>   
>   static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
> -				 struct intel_crtc *crtc)
> +				 struct intel_crtc *crtc,
> +				 struct intel_plane_state *plane_state,
> +				 bool casf_scaler)
>   {
>   	int i;
>   
> @@ -319,6 +323,10 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
>   		if (scaler_state->scalers[i].in_use)
>   			continue;
>   
> +		/* CASF needs second scaler */
> +		if (!plane_state && casf_scaler && i != 1)
> +			continue;
> +
>   		scaler_state->scalers[i].in_use = true;
>   
>   		return i;
> @@ -369,7 +377,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   				     int num_scalers_need, struct intel_crtc *crtc,
>   				     const char *name, int idx,
>   				     struct intel_plane_state *plane_state,
> -				     int *scaler_id)
> +				     int *scaler_id, bool casf_scaler)
>   {
>   	struct intel_display *display = to_intel_display(crtc);
>   	struct intel_crtc_scaler_state *scaler_state = &crtc_state->scaler_state;
> @@ -378,7 +386,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
>   	int vscale = 0;
>   
>   	if (*scaler_id < 0)
> -		*scaler_id = intel_allocate_scaler(scaler_state, crtc);
> +		*scaler_id = intel_allocate_scaler(scaler_state, crtc, plane_state, casf_scaler);
>   
>   	if (drm_WARN(display->drm, *scaler_id < 0,
>   		     "Cannot find scaler for %s:%d\n", name, idx))
> @@ -510,10 +518,14 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
>   	struct intel_crtc_scaler_state *scaler_state =
>   		&crtc_state->scaler_state;
>   
> +	if (intel_casf_needs_scaler(crtc_state) && crtc_state->pch_pfit.enabled)
> +		return -EINVAL;
> +
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "CRTC", crtc->base.base.id,
> -					 NULL, &scaler_state->scaler_id);
> +					 NULL, &scaler_state->scaler_id,
> +					 intel_casf_needs_scaler(crtc_state));
>   }
>   
>   static int setup_plane_scaler(struct intel_atomic_state *state,
> @@ -548,7 +560,8 @@ static int setup_plane_scaler(struct intel_atomic_state *state,
>   	return intel_atomic_setup_scaler(crtc_state,
>   					 hweight32(scaler_state->scaler_users),
>   					 crtc, "PLANE", plane->base.base.id,
> -					 plane_state, &plane_state->scaler_id);
> +					 plane_state, &plane_state->scaler_id,
> +					 false);
>   }
>   
>   /**
