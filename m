Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF91DA5BFF5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B2C10E575;
	Tue, 11 Mar 2025 12:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLat/XlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA3610E575;
 Tue, 11 Mar 2025 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741694568; x=1773230568;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wmqQtpsNzTd/i7mA9dWr+flfg1LRFdwpMze745NsEac=;
 b=jLat/XlOMq00lO+x646RiYnRijYsMt1WsAJvDIRh/HBm8TwyEVYr1jx5
 8GJyid1F53sdBOm7TRYzQgE8w4wHYIhhERby20HxdwSBKyhsY4Zk2Fs0x
 t3TMPxHEk7i4tBo8wvOa8u7y+SUbSYHw/L2J94hqP0jYIB9j/NC7NRypO
 y2kyrqS+jpJXJsZ54bUPVBrTMAoBRwcmKekgRW1g6GSNeWZKbxUZ8Kg+J
 N6VSn6MHaCAapRIzet8pZw3g7uClEZetAbQKMQcby3g/yWqyDXd/5bTBb
 Q6er9TxFA1UXndA2aPcRe6ZiwyuSrFpZCo69ewAGd2CLPNzy/BBcH7gmb g==;
X-CSE-ConnectionGUID: WHGjXxBsRNW2J1sYX+pfSw==
X-CSE-MsgGUID: PQ3qBSgbRayrPqw7bw2SjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46376397"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46376397"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:02:48 -0700
X-CSE-ConnectionGUID: v+YVUEQbTdWvm6gUFv6pSg==
X-CSE-MsgGUID: Y/ORBzcBTnyWpV1516xQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151249633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 05:02:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 05:02:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 05:02:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:02:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaGELN22MK3jNg9vQPWmApOW8sY9Pq2BPTzY0RZMV3tRcMNlzEQYhQOEq2Nr6AdZosemmkmdq30TOPZCsCDEdVOwJNaR6RXpQiGb6ZlUUN3nj1IPKQUxnrR9ncWAPAzx9nl667FI37jrLAUbZx92CiseiOAcuagLrDgVzM1bqziQiK2fAoK30ZqYqaJsBTclLPeQzPo8RMqaRUHY0zCu5VFWn5IV0egHNYmbYwjzgc+f0U1uyyXkrZWtXJx1eNAO3h9jVwIJKh8d8XojVkY9W8I51hz7dOgldDFGU8Vy4b/1/Ec1Pdvm6ewFT756lN/cMdbZ3mKi9J1k0I1cLlt0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2JiWh1xslLdxPQUIhdSLj2EtOWbszu7cHFsnVo6pO0=;
 b=elmLvxSduN+cgZrYR/DaAqdQAd7LahY7yYaAjx5ucpQrq15KgIl8vrrVvcLgav3jWCCJGDQQ84G57iL3ialMv0eRN8sFxHm4igqp41mLEcsUk/SFiFRzm573Sb0Mdf53ew2IQzMf8r7IH1luQuZRv3I2yo3yS6+oPzBJzEh6uAvvEI82OIYPG36wAvFNE4CxNGwvHPL8I/t40xFqqAJfeDVq5JvVcMPVb88py1/FPTr3eXLJjhAN6kyqa1GQrgtfaalqwy160tbUH9u7i0QE8UiGekyEkZDcqnfEOpVMfo4iWB9GcNzlexIAYZ0yITwfOI36MwGCUGHoLOXmaVvyRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:02:14 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 12:02:14 +0000
Message-ID: <6ed02a9d-f403-4404-9463-2675cf1279b6@intel.com>
Date: Tue, 11 Mar 2025 17:32:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] drm/i915/display: Compute the scaler filter
 coefficients
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-6-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-6-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a42729-892c-465d-e646-08dd60948f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTlYOFEyWnJJK2NHTml3bFQ5bjUzUmJqZnJjQ1dYMHF5VVF6ekFad3dTMEN6?=
 =?utf-8?B?dC9vSVU0RUF1Ky9LRG5Sc01Xb01EVkZ0dWRVZkxpZUxDaVNLUUNxMytwcmJK?=
 =?utf-8?B?OVdkMkhyOGRhSExxQU43ZldPSVBXMVMvTldZT09tSXpqZTJzcUtjNXRBejR5?=
 =?utf-8?B?dlVnUzRvYytPM0VQUjF2V1Rray9BNjZXT0tNZVNxTkZFNTJETFZqb0YzVW1N?=
 =?utf-8?B?N1dUVUJnTXBMV0lWa2xyTkJIUjVWaTlISWRSNWhSMGV1R1NzMjUxbVhFQyta?=
 =?utf-8?B?K2FBb1ZUZGtUWi9yVXNWZlR0MjFUTHFJbXFyVEQ3R0RLT2FFUmROSUlrTlMw?=
 =?utf-8?B?MVJ0SzlneERiSE5iWEVYdXBHaTFQM1NNNUhjRWxEOXNiSUFEb0E1VnJjVXFm?=
 =?utf-8?B?eTBVaDdYV2dRMWdKQzJKMy95bEpsbTlzeTZrUUs5YjVUZ1VoSGxPRHN1SzdG?=
 =?utf-8?B?b0tvVUZwR3BMS05qVXh0OU8zSHJ4M0diQUIxYUVaRVpoUWtoMU1JWE9PV3Bu?=
 =?utf-8?B?SmRmMDlxWTh6Ri9pYVJNeWlaQjZsNkVjN3oxU2NJMFlIcFVSVVhDMVdTaHc2?=
 =?utf-8?B?SCtPYzQ5a1A3dCtBMUdhQVFPanNIZGVzSlpJVTIzcjFsVjVCY0xyQmRNOE5Q?=
 =?utf-8?B?ZndEZ0lQTU1ReTQxaGJxZ05vUEtFS2QwdkRIaStpUHV0SkhWcmpRU3lwS09F?=
 =?utf-8?B?Q3VjcG1qdUlVSXo0VUt2Y2F0Qm5oZXhaWWszRlovazFSc3kxOHJweVN2MnIw?=
 =?utf-8?B?aE9velhEMDc1NUJNUEVJckdkWFpvWVlPWm9WMG8yMUlMUXNtVHkrdnpOZHBi?=
 =?utf-8?B?bGhJSzdBSFdNLzNIR1JmZGt0RmF2Z25mZ3VHT0hQOG5RMlU2TUI2TUhrdDBS?=
 =?utf-8?B?bFA0a205Z0F1MjNYM3lnblR0Mjc3Q3liREt5dEF2cHNCRjROc3FrUGRhWHZS?=
 =?utf-8?B?dXp0MHp0Z1hRcTJwWktjdURUMUdlSzZyNDVyMDRkMWNubWJCaHRPVm9paEFy?=
 =?utf-8?B?c1lUZmdNMko2VUhKbi92YW5GeDluQkNOZlJ4TXpJV2pCMmVobjBBdTdsWUpn?=
 =?utf-8?B?RTFpNzZJb2trZGViQStSeXVDelpOK29CZUhWTW8xZHBRQjUzQ092cFk1L08x?=
 =?utf-8?B?eUp2VlFicGUvaG9aM002VVlpWC9XYjhSMlV2cmMvTVBhbmtuTSt3QkFrTmh1?=
 =?utf-8?B?b0xkUXd1Tm9qbktYQWRtLzlSV3JrbVFyc0VFa0ZwNUQ2Um5LNUJtcHNkTndL?=
 =?utf-8?B?RnlyVmhIajNOTG9PK014SjJxTm5Xd1B2anBhTFdmUzRZOHJtaTF3bGVYU1N3?=
 =?utf-8?B?a3NsbGNOMEJVb1h4ZXRPblRkakl3VUJWQWN1dU5KQ0JEdm9McllyRUNSTlJy?=
 =?utf-8?B?alpUZkpqeVVLZU1pbnpKTkU2ZVEvRG5ncWJBcWVRNCtLdlZ5ZlFaZkFqdjZS?=
 =?utf-8?B?RkJIZUQydmZ2ZldpVE1aTTBMdGtTSVc0SHZZanNrQTBjUEhnMmF5RzRlTHJ6?=
 =?utf-8?B?cWFjTS9KV3ZYZUh1SWhSbDVzb09oQ0VoRFUxRFl1S3BTbVhOUFJhS21YeHJ0?=
 =?utf-8?B?VU4zbUV3bEFkeU5iSFUybjU5RW1tSkZiOVNURDlXQVdMeGFJQ1ppc0RrRjR2?=
 =?utf-8?B?aUdGSk43d2lEbWd6SGsrUkhSTC9COXBFMjQwMEUyaXpsQzN1UFBiYy9ZaUVr?=
 =?utf-8?B?Z0pGNGFPRHBjbXFvS0tRbXZIcFhsQXRFUGoyaVZnWHBEWkNiRVYrTUwrZEtN?=
 =?utf-8?B?c09CN3hNa01PcEVjZkl4aWpFQWhWcWpnUGlocnFWSU1rUVNZQVpXQ1U4NFZM?=
 =?utf-8?B?T1IxZk1NZkxKR0tqdktJMHNJNXlLc25IVTNoZHhMQ3M0OGRqMVllZmhEbkJw?=
 =?utf-8?Q?i6o47cDuhLHnV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEhJR3hjZGNYR3A3ZER2N3NTOUQ3VXQvMmh0MzFmUElwYkM4Vm5VREE5NXJ3?=
 =?utf-8?B?MjlMNjlqdnBVRWp4UUtoalgzWGV2OXZ0ektNK1FsZFZISm5VUHEyUGN3Q0xp?=
 =?utf-8?B?YUtXZkhob2FzRFg2akN6ODU4SnkzanhmZ1RMYjJwYzZvQ0Y5MlNwVUdJL3JR?=
 =?utf-8?B?a1VQa0c0TGh4bmJRVW56Wk5GL21CMFMxMmRBZEFtK1hDd2lXRS9LYUNCelMy?=
 =?utf-8?B?VDVSWWl6WUUyUFNXRGFPVHdWMnF2VGJrbU14bU9QV1JwWW9OQ3JzSlBNeFE1?=
 =?utf-8?B?MGFpV3B0cGZLc0RWRXJiQ2tvZjljMWhDSzJZZjhUak1FTG03cFhkck9NTExs?=
 =?utf-8?B?ZDBaRXEvaUV5b2FkeGlWU1FydlRmZlA4b2w1QjZvMDI3UkFjdzBKRUZlS2dt?=
 =?utf-8?B?UHFKZVdpRlpaQ1IrZE1URnVWcGVnRzhiSEVqZFhrM2k0VHpvY3BOdEJLYlho?=
 =?utf-8?B?TXoxaXhKZ1VpZ0NlbVpDTmgzb2NhdFkrNHZsaTIydGxzdEo2blZXY1VJUHQr?=
 =?utf-8?B?eUhxWG1CUmt3M1lZTEh6VWZaZjBtTjUza2VMUUpyUE5nK1ArNitWakVGbUhG?=
 =?utf-8?B?a3RGcXd3YUZNdlI3dHFySUpweWJxZkk5bm5tVUhrK1hLV0xacU9QUmFiUzdB?=
 =?utf-8?B?S0FCM2NXVlpLeUVDWURCWXBEQVdCNHRNNU9uN3BiL2o5dWFiejFEM3l6Y3hm?=
 =?utf-8?B?TWJJcUlFVTFrbXBwV2ZhYit4NHBFc0pxYUJ0M3ZFeHRtQVhVMGdXZHNwa0Jk?=
 =?utf-8?B?OHJaeURrU3hibUU5cWdSQTY5ZUVvYXNBUTd1K05FUWNSNEhMdTNFaDJMckFz?=
 =?utf-8?B?bnZmNHVvRHBMS1MvMHB0MWlPcUEzNXQ3Q0hzODg0MlZ4dDk2Wm42MTN3Y1cx?=
 =?utf-8?B?aEp2Z2ZnZWtSaEhpbndEQmRNb1RlU3kvTkUwRTljandMNVhWVysrTHpLakt2?=
 =?utf-8?B?MVBzL0F0UnFhVE9rS09pM2IzQUJIVmNUK2FOZXJ0Y3dONVo4aE4wWEhDMlRh?=
 =?utf-8?B?WWpOcWMxdTZmSzdiUnpaMDVoVEFLZmNnZkV4KytkRGJLbGxuWWwyMGVBWEU4?=
 =?utf-8?B?OUJPaEN3d2docWpxY296a3psYWh4cXZTS2Y4VmNnQVpJQzFPUDV1SlVXWEhZ?=
 =?utf-8?B?ditFdVgvd3ZnQ2xWdE5rbUxCaFpkUGtkMFVnaUJwSy85LzcyUkU3T0k1QzRV?=
 =?utf-8?B?RzRpamFGd1ZCNHJMVGlUb0JDb0NwcG43OTArRVZZZVV5QjNCRDNhdENrUk5P?=
 =?utf-8?B?djhoNU53WVllVEEvT1B5MWVmbVp2aHdwYWc3N1docmZTK25PT0h0L1VET3Ir?=
 =?utf-8?B?RFNOK3d4cUJVb2ZtcUdqZTh1dTJDL3dzSVVnV0NZaGVPeFF1cGVwSTlFQ1RY?=
 =?utf-8?B?Y1ZLNDRyMnVLdXlieVRiMkl3RnM0WFhlbThSbjIvTEt0R0RFcEoxYVBDZW1D?=
 =?utf-8?B?UUNFNDNQRkczUmNNMWl2QlJQZGhySEhvR2ptdHFXOXJpRk0rMDhxT0xKQ1dB?=
 =?utf-8?B?Vys3ZW9LWDEwYWtnZ3UwL3NuT1FPR2pHVEtSSUkveTFUWXBmWkxFU1FCUjF5?=
 =?utf-8?B?RlRXdkx5M25jS291c2J1TjhWbWo5Z290ZHVFelZjS2N0Y1kwK3R4M2FLOHF3?=
 =?utf-8?B?b3Z4QXBLS0lCM3Uxdm84RHNDbG9BQWlzS3N6MHFmWHROd3dUOFNlTmdVaDA3?=
 =?utf-8?B?elJkV3o4MkJlR0tkYlh5UjNnMFh5SWd3TVVpd1FkMVNEUCszd2lpVEc5bDlu?=
 =?utf-8?B?aXIxYlcwaDBSRkQxUGJMVnBTdzdIUjd5UDFkRWVPME1OT1IvUXBnOU4wdWZ4?=
 =?utf-8?B?QkVmTUdXVVRqZ3NEUXQzMzlHT2x5MU01NkVOQ3RySEVjelJTelJXTXd5MFYr?=
 =?utf-8?B?cVc1MzZtWVA5aThYNmdvRVU3ZVZsVnNRczJ1MW1uck1nOWRVeDdrbGZHd2FT?=
 =?utf-8?B?MXBSVXIwQkcrNnU3bVNWNzdzMS9MT0JRSnNOUXRJMk5UNEthQVNIaFNYenNh?=
 =?utf-8?B?QTZWb29ERG5YRkQvamoxZkNjbXRUalJ1d0tRQk9QN3o3Rk9CWE9zUmg3dXJo?=
 =?utf-8?B?K0x6Q1F6UHdsb1VLMS92b3JrYmVmNGljUUZ2QjVLV0RMenluZjlGcVMwVVNs?=
 =?utf-8?B?bVBTb0VFK3N1Z1ZvMkVacWg2SXZ6TkFOcW5kcy9pamVUeElkNkZ1ZFFGc2gv?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a42729-892c-465d-e646-08dd60948f9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:02:14.0858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7Obt9r2jaW6DVK43VUlz2aM9kQXVvKNqfzisSLziVb9d21rzkV9LOvjiQEzag7IX//gE5eM+CnDEbBy/6MzUWGr+jgbXQ6eg5EnD8iglbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> The sharpness property requires the use of one of the scaler
> so need to set the sharpness scaler coefficient values.
> These values are based on experiments and vary for different
> tap value/win size. These values are normalized by taking the
> sum of all values and then dividing each value with a sum.
>
> v2: Fix ifndef header naming issue reported by kernel test robot
> v3: Rename file name[Arun]
>      Replace array size number with macro[Arun]
> v4: Correct the register format[Jani]
>      Add brief comment and expalin about file[Jani]
>      Remove coefficient value from crtc_state[Jani]
> v5: Fix build issue
> v6: Add new function for writing coefficients[Ankit]
> v7: Add cooments and add a scaler id check [Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 124 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |   2 +
>   .../gpu/drm/i915/display/intel_casf_regs.h    |   7 +
>   .../drm/i915/display/intel_display_types.h    |   8 ++
>   4 files changed, 141 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index ed72bccbb93f..ff34e390c8fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -12,6 +12,13 @@
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
> @@ -33,6 +40,24 @@ static const u16 sharpness_lut[] = {
>   	73, 60, 48, 36, 24, 12, 0
>   };
>   
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
>   void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state)
>   {
> @@ -88,3 +113,102 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
>   
>   	return 0;
>   }
> +
> +static int casf_coeff_tap(int i)
> +{
> +	return i % SCALER_FILTER_NUM_TAPS;
> +}
> +
> +static u16 casf_coeff(struct intel_crtc_state *crtc_state, int t)
> +{
> +	struct scaler_filter_coeff value;
> +	u16 coeff;
> +
> +	value = crtc_state->hw.casf_params.coeff[t];
> +	coeff = SET_POSITIVE_SIGN(0) | EXPONENT(value.exp) | MANTISSA(value.mantissa);
> +	return coeff;
> +}
> +
> +/*
> + * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
> + * To enable casf:  program scaler coefficients with the coeffients
> + * that are calculated and stored in hw.casf_params.coeff as per
> + * SCALER_COEFFICIENT_FORMAT
> + */
> +

Remove extra line from here.


> +static void intel_casf_write_coeff(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int id = crtc_state->scaler_state.scaler_id;
> +	int i;
> +
> +	if (id != 1) {
> +		drm_WARN(display->drm, 0, "Second scaler not enabled\n");
> +		return;
> +	}
> +
> +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	for (i = 0; i < 17 * SCALER_FILTER_NUM_TAPS; i += 2) {
> +		u32 tmp;
> +		int t;
> +
> +		t = casf_coeff_tap(i);
> +		tmp = casf_coeff(crtc_state, t);
> +
> +		t = casf_coeff_tap(i + 1);
> +		tmp |= casf_coeff(crtc_state, t) << 16;
> +
> +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
> +				  tmp);
> +	}
> +}
> +
> +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *coeff,
> +					  u16 coefficient)
> +{
> +	if (coefficient < 25) {
> +		coeff->mantissa = (coefficient * 2048) / 100;
> +		coeff->exp = 3;
> +	} else if (coefficient < 50) {
> +		coeff->mantissa = (coefficient * 1024) / 100;
> +		coeff->exp = 2;
> +	} else if (coefficient < 100) {
> +		coeff->mantissa = (coefficient * 512) / 100;
> +		coeff->exp = 1;
> +	} else {
> +		coeff->mantissa = (coefficient * 256) / 100;
> +		coeff->exp = 0;
> +	}
> +}
> +
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	const u16 *filtercoeff;
> +	u16 filter_coeff[SCALER_FILTER_NUM_TAPS];
> +	u16 sumcoeff = 0;
> +	u8 i;
> +
> +	if (crtc_state->hw.casf_params.win_size == 0)
> +		filtercoeff = filtercoeff_1;
> +	else if (crtc_state->hw.casf_params.win_size == 1)
> +		filtercoeff = filtercoeff_2;
> +	else
> +		filtercoeff = filtercoeff_3;
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++)
> +		sumcoeff += *(filtercoeff + i);
> +
> +	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
> +		filter_coeff[i] = (*(filtercoeff + i) * 100 / sumcoeff);
> +		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
> +					      filter_coeff[i]);
> +	}
> +}
> +
> +void intel_casf_enable(struct intel_crtc_state *crtc_state)
> +{
> +	intel_casf_write_coeff(crtc_state);
> +}

This is not required here. Lets introduce this later.

With above things addressed:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index faeed50de2ba..507a3fe49753 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -15,5 +15,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
>   void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
>   void intel_filter_lut_load(struct intel_crtc *crtc,
>   			   const struct intel_crtc_state *crtc_state);
> +void intel_casf_enable(struct intel_crtc_state *crtc_state);
> +void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> index c61755a401ff..0305604b4c87 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -30,5 +30,12 @@
>   #define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
>   #define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
>   
> +/* Scaler Coefficient structure */
> +#define SIGN                           REG_BIT(15)
> +#define EXPONENT_MASK                  REG_GENMASK(13, 12)
> +#define EXPONENT(x)                    REG_FIELD_PREP(EXPONENT_MASK, (x))
> +#define MANTISSA_MASK                  REG_GENMASK(11, 3)
> +#define MANTISSA(x)                    REG_FIELD_PREP(MANTISSA_MASK, (x))
> +
>   #endif /* __INTEL_CASF_REGS__ */
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index ccaf9dd4f6a8..b96dec938185 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -931,7 +931,15 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct scaler_filter_coeff {
> +	u16 sign;
> +	u16 exp;
> +	u16 mantissa;
> +};
> +
>   struct intel_casf {
> +#define SCALER_FILTER_NUM_TAPS 7
> +	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
>   	u8 strength;
>   	u8 win_size;
>   	bool casf_enable;
