Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFDBD3A1F0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907DB10E366;
	Mon, 19 Jan 2026 08:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VS9xqT/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD8110E348;
 Mon, 19 Jan 2026 08:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768812217; x=1800348217;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B+vRlI5jpEzkQwuEmH8FFfoOJ03Lpwacg7eEb+Rnf6U=;
 b=VS9xqT/js/EjjGhKBryj3hjjkxcYbeFDL5YGdGuV6yxYGZCVlANotiqz
 NkKTpGacrR90XXocufiePprGgjn9rOlUM5AsugX/fpQl3GRNoX1qpBnl9
 aBNwe41iLe7AgDcswXnrOBS3XKTcr80cHU1oD4XjCDVFvHnwUi4uVPQN6
 HdhS5Lpcxeb+QBIeFQsC4REfswauqNghovns7lJyAzMTWTCeLk/feHGor
 ZYlvNS/i5xHepxkQPwpuhzJjpmDujQl+rWVMRUT27onDsboH5goXLWQxs
 3vmwg7qv2A5Stba5c+rg9f7HDTBHQkW+1eDAlSoyQg5thCTu9lyvEf2AK Q==;
X-CSE-ConnectionGUID: t0VRUOhTQFeDJJZ7ECkq8Q==
X-CSE-MsgGUID: vWGWBrq2S1aDyJyKRcjyfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69219136"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69219136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 00:43:36 -0800
X-CSE-ConnectionGUID: A1cT8ohBTCSt72vePN1hOQ==
X-CSE-MsgGUID: eOsR1H3aS6eSollVSDTHrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="210317881"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 00:43:36 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 00:43:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 00:43:35 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 19 Jan 2026 00:43:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXsg1OXtsJQoAChiGjSc61xphOxbQpcdAQggYIKIM93/P3Kf4KofKLx4Ra6TYXVYIyP89E9VbaigcuJtUHgJICe3EkaR9VEjirpl1VEfKBp+xXhZPZhdFPJuHyZWGtCZOLrjHQDIHAocnpx5ZYCV19UMP54nLVnjDvDY7MpYQ1D64NxU9QwLMe8HTOuyrSlrb1AFboJIzp812/44au977fs4C85iEBg9Ig+MpfwutiR7+0nAmhIC9W+OxCB/IhReKOlTQdYb51n6q0wfCp6acKiYH8jjjnjzT9ZOJsn9KcpJQyivrLfmhcOEJnV8D1VO5nnbdfqoGdLJVFTlxyuUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Fx8z0koYSH8cDr7BqUf8Krr9Ar9akpKQzm/IUFuiRo=;
 b=IhwdGCsS0k5EezV5879xcSd2DUAtJNFzNT5Pib9YuPOmAcyheUwugDwALV4nDtaC6OxMSv89t/OoBTWLf2dgETaGx85bXNfFBh3NF/QINtSlkvykedMYmFzcvrO3Cv+9Db1SEf2bLqEJBLUVVuOGoOuHN1OxwXgPFI4HpnHgjAZe3ReMLfeyjZGAqYl0ClyWrscfqhoRm9drYQ3SE5cgl6P/aHrkU6ZzDvTxuxysEKg4iPfCu55tUkIPUKV25DaQENmWJXKP9c9igHKJVlNRl4dHux+3tcTcx3LsjtpT6trZ8a13CdYeuUeV4BR7o01WVq2NFCqUO3QRsK/YI6+tjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA3PR11MB9303.namprd11.prod.outlook.com (2603:10b6:208:574::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 08:43:28 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 08:43:28 +0000
Date: Mon, 19 Jan 2026 08:43:17 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/selftests: Defer signalling the request fence
Message-ID: <cfkh5td7ktxjrbuxfwj6mblbjvwzlcumzv53fbl5xajad3gtmq@3q3zagouql4x>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260116193354.80806-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260116193354.80806-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: LO4P123CA0454.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::9) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA3PR11MB9303:EE_
X-MS-Office365-Filtering-Correlation-Id: 697fd1ba-1ca0-4e3b-307c-08de5736d129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnRLeEVzZWhXVVdmUXR2aCtzcElPS2xLRFNnTnk0T2p2QzV4YmNPMHhRU2Vp?=
 =?utf-8?B?WkVSNkpYTCtBa3N1Z1NSYjc2SDZxckFCckM0NmxWTTR3UjFLcHhKc2ptRkVT?=
 =?utf-8?B?RkdidlJqWUgxQ3dFTUVYWGRTc2I3Rnd6ZGhYSzNpQkxyelFOelR3bG5xRWlh?=
 =?utf-8?B?Rk5FdlBZYlUzZ1Rhd0s2OVlqY3lqOFdmYVlHNnBuQXpEYVFMazNjcncvK0c2?=
 =?utf-8?B?V0NLREhFLzcxMGhWUTh6dCsxazVyNVA5WDZvNWdLRFA5QVNPSG1xRWVqekc3?=
 =?utf-8?B?c0pKK1FSL1BtNGNSVWVKenVWQ0NQRmhTa0VJU1JsMTQ0eDJqMmNsTG44WUtx?=
 =?utf-8?B?TkJCMithZ05BazNNcldIczVrckpUTFVVUmlQTDh2czBZbm5JdThscUdhQTEz?=
 =?utf-8?B?YjJZM2FZcGpnak9KMjA2WWlCQytmS2R0T254U0tBT3oxUHEwdW14MlhvS2Vi?=
 =?utf-8?B?dEoxeHlQU3FGVVB1WVlmMmYwaU9kczZNUDFhV3d4eUNtYzg1N2hUbHl6a0Rn?=
 =?utf-8?B?dUtWV1BVRDFXdTRlRjRPbi9lMERzTXFLeGZESlJyUWVJNDhKZ0duY1AvL1pr?=
 =?utf-8?B?aFU2V3VUS2pES0wzcmVVbVk4cnpCL1B2QzY5NStvbXR2Snp6TTc3dDNPckwv?=
 =?utf-8?B?UFBYK2ZZTE1Tei91a0Jnbk1uWVVCOXRiTDRCNzdXODd2amV3NHkvaGNsaXlR?=
 =?utf-8?B?cUxEN0VwaDRyWUI3NXFuSG81WDJqMUgwRlpRcWxldzZmalNnb0FkUnlvZWI0?=
 =?utf-8?B?alRZOWlRemVmWkpQb0VzMXh5VUphWGdacTArWHUycFVOWW0rOVg3VDZDRnR4?=
 =?utf-8?B?QUFuZFhXelBrRFNadXVsWFpmZnBBVzJQQ0FpTmpwZ0c5YVdPY2tjamgxNVh4?=
 =?utf-8?B?SEpPbWlic2ZvZGVmNkhKRFhxdndOc1FXZEllQXVacms2MGQ3WnBHVGNkYnZ5?=
 =?utf-8?B?cmVnYnBGNm1waHFSLzJlQ09RMUk1N0cxR04xUnVNMXBkUjlReFpaM3AzTDFl?=
 =?utf-8?B?TXFIY2FXQmozazJ6K2xyK1JRd1pRL20zMVJJTllXcURtYzZoVXk3MGMxQTdT?=
 =?utf-8?B?cjRFRk9pSldyb0J4QXE3c3hvRWIyM1JaUm9zY0paZVJicHhxQU5aVllncnZm?=
 =?utf-8?B?ZXRURWVHK1c0bkJNRVM1L2VueEo2RzZxMWxxd2NLUWM3NzM5dWIvOG5wdDNN?=
 =?utf-8?B?OUtpR3B0Qnh6NVdPdTF1NzFyNm9QajRRa1psanJOK0xjN250WGhkV0xhTEdU?=
 =?utf-8?B?b3Y0UXVFVVdhQmY0WlZmSkFQVmN6M01BTDlwakF5WTdhc3JGSytBZEUwUWxR?=
 =?utf-8?B?bXpQK0ZsZm5sR2M0aTQxbm1nK3FuV3l3MXN0WGE3bWV0UmdsQlZvd3IwUyt6?=
 =?utf-8?B?R1BqWHlGY281R25rK3huWVpMKzMrZkVESTY5bFF4N2pLeWtDK0lyOVNhdm8x?=
 =?utf-8?B?ZFFFTWYzTUdBemc4WVEyZUlpZTBUQ0RwUDlHQXRBOERPSlNHRUd0VWVIVFhQ?=
 =?utf-8?B?YjhXcVhtRlJkZnZMZkhGL1dmMGFOYnhQOU95N3dDNCtsTTFZTGQvU1hPV29t?=
 =?utf-8?B?Sisrb25VbGduMFNSdFNoUzh2dWdmUWdDWGdVdVJ5Mm1WYTVzQTc3dzRZcHFK?=
 =?utf-8?B?bU04Vmh4KzhnME1sV1g0TmZiRWxaUUpsdmV6OTRNcHN0aW81d2ZvYkJMeXpB?=
 =?utf-8?B?RHZ2aUJPUHlvZXhQWm56aU8vbGk1UnVXMndhVWN6bDJhZDNDc0d5NTh3UU1z?=
 =?utf-8?B?dWZYZENZWExPbDBuNnhZRy9SVllodUVkVVNjc0g1cGxHTkw0UVRkdEJ1ZXBw?=
 =?utf-8?B?T3dPRHM1cFRZL0d4ZmxmZkltQW5ZU0VFZmtOcmIrRXovK3NjL280VWo2UVV4?=
 =?utf-8?B?Ump3bUdDcTBvRndvcFQxRWFWWlpSaWx3dDRBSVhnY2lyd0QwQUhQSkFEUmxr?=
 =?utf-8?B?VTUzb25PUys3T1hJTzFJSEVzRms0Q3pLUjlONnFTaHMwZ241MzVJRTVUQUM3?=
 =?utf-8?B?eUo1T1laNmltbzdWNjRSaHJTWVA5U3k4TzUzUTdLMHQrQksydXBoZU9GaHpr?=
 =?utf-8?Q?aUjvGA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJzMVRnaXFHU3k3bU5oTVJMRHlWSmlaeERoUThoaHVRc1d0K1l3Uk0remVn?=
 =?utf-8?B?YVU3WjRSSTA4VnpRazBEbG16TFd2OVRUWWJueStvbktZQy9wK3luSTdRbCtl?=
 =?utf-8?B?YlJKLys3allaQ3dwaDg3Ry9YRFcxcTVUTXhMdFZvYWRocko0Mm1pMU1FRVdk?=
 =?utf-8?B?dW1qV1NhZU5QZ1NWZ050UWRzZHQ5SHJRN1NYUHpkWmdMOUlJaGs2WGd1RVk2?=
 =?utf-8?B?S2xkamJjRXJydkIxcE5IRkVDVGhqVjZJZWsya0VIOWJLYVVvWi9UallkMWxw?=
 =?utf-8?B?K01CQXROYkJLanJYR3RYcVAyaEhrdzFZUXNTWTYySGFsSkVHZzJtSlJDakEw?=
 =?utf-8?B?YXVMSDBZc055MDlDSCtmT2JaQTBjUkwyeWNXZko5OXBQdTNRQisvQkpiUmxJ?=
 =?utf-8?B?NWpxS2k3dXZNS3ZUQnBtZVdvNzhBNjNLeHRLZjlzeGhVSFpEMWNCK3VpWGhO?=
 =?utf-8?B?NGFhbEIzcjlrbVR3NERybytZTjM2YkdCQ211SWpCVEVyR1NEWTNDUU9qTmlT?=
 =?utf-8?B?ODI4M3ozWlNYcXozd1BFV1cwTjd1OFZlSWwyZ3NvZllBN2FJRGM4bVE0KzhW?=
 =?utf-8?B?WjVhZVNob2RsVEY1eVB3NEd0Z2RzK2FQdVNWQkpCRXJoWnBlY1llWk10MS9G?=
 =?utf-8?B?bTQrZVVIaFdwUEVzRGVScllYNnJzTE83ZlYrVjlrRFAzRjZMYkNvbWxMZ1dm?=
 =?utf-8?B?NmE5WG9sdWV6TzRIbHJ6cTU3TkYweVh5ZWc0Zkt3Y1Y1VFBwZ3EvQm4xTUZO?=
 =?utf-8?B?UHJGdktyZVZYanlMT0lPOVF0cldESzBMOEFsOEZSOTZSK2IxT0RUbHh1bnl5?=
 =?utf-8?B?WXVLSlRWTGp5Rm0vaXRrTmZRciswTUM3RllneVZCRVVCVThCSGY3bmdxU1Ax?=
 =?utf-8?B?S2Fha3V6UzRNRGpqdUlEOWQwZlRkRHg3MGNKNDZZVm1ZOGRnMHpCUUlFWVJU?=
 =?utf-8?B?aHBBcDkxc05EMTZiWHJET09WcU00cHphdjEvbm1BUno4eXRSVGlxWkFtUG9I?=
 =?utf-8?B?OVlqZzdpdEo1WlBNZGZ3OWxubENVNStDUUs0ZDJUbklnaCtuMlZ3dUdZY1Qw?=
 =?utf-8?B?MGtPWG1jNG8rWDdSSDJaL2JDcTBwWU56Y0M2Ym5lZ0lzNUhzRFRSU21RVks2?=
 =?utf-8?B?ayt4TFN4VGtReDI1a1BPdVFhaWxvTEVpVjJtQ08yME5Hem1Qekk2aEpCNFND?=
 =?utf-8?B?MWFodmdDTVZaRkU4SmQ5M001cGg3RmlGbHIzdWdmcE1sQTV0WDlRWE1MeHB1?=
 =?utf-8?B?L3NnWUNBUWo5V1dtK1RSWVgyV01iZmJianRhb1l6ZC80UVJRbERNTVBJdUNn?=
 =?utf-8?B?RU4rVVdtN09LVm1wbTR5OHF6cVlmUURoMWxPOTlOaU9QeGVpU1d5YzBlbG1G?=
 =?utf-8?B?eUhxNUpDZlloSlEyS0ZRcUYzMjRXMGUwZ2d5cmlEZWpVT3NDZTNYSnB4Q2Qx?=
 =?utf-8?B?WTJSdHo4Ry9hTUR5WG9pczhscnpUcExQbTVDT1VDcFg0T3cydXdIemU1NmZh?=
 =?utf-8?B?d0pVVWpiOUhndlFDcFIzb1dDcGJET1pCcjJDOVArRWNmZytQRjJFR0RTNkJT?=
 =?utf-8?B?ejJWZVpkc0oxbmhZUkJOcWZtcWk0M25hTFh6eEtxS2Q5RFZDWTUxcjJoa3ls?=
 =?utf-8?B?dUJnMGJLOTJ3bTRxMDFuRDZtMGxzNkNWZDNEc0liN0t6cjAzRnBWZjZmckJ5?=
 =?utf-8?B?UWpkT0pCb3hJdjFrWHY1NzJjbmIzSXdScVB6SjJWZmpwSW1qcXZFWGhFUS9N?=
 =?utf-8?B?SmwrMTQrNzhoNWpmY3h2MUFEMzljL2JSd3hZTXo2WmhiT3dtUE8reklXZWxY?=
 =?utf-8?B?V3BjaUVNcFNjNDBxNGtSUlNXb2hQNStabWRobnBRNEdDRmNPRnlWbXRjam9C?=
 =?utf-8?B?K0s2Y1VURzBYOG5RM3hDZnRGTXRmRUlEVy9STWdLaFIwa1crSjdDRk4xbnJD?=
 =?utf-8?B?RVdXcFlkb0JibGlxMTJ1dnBFa2ZzNEtEcUVHVkczRTBlck8wUWdoTWkyQjRn?=
 =?utf-8?B?dTV4eXlnVllvR3lnWEdpa3pFaUJSUDM0dmJIcTlMYlc4T1ljUVJKVjEzdlVZ?=
 =?utf-8?B?R21nY0JhWDlEMGNOZ2RlckROU3NhT0k5Uzc1dTltRE9LYVU4WXQwaHRrczY0?=
 =?utf-8?B?TmpYeGx4L0g5TS9LTmNKYzZrMHNXL1ZzU2RZemUzbDIxbUlSM2JzWHBUbUpS?=
 =?utf-8?B?Ymo5RDVUOGNvL1dmUm9KRnBSRXdIYTUrTkhpSUdWSXZ6cEFqNVpOYldSYURR?=
 =?utf-8?B?a1k3OCs4bUpCS1YwaGVUNVFDK1RnOFFMT2R4WTFxalRiOGhPc2J1Tm80MWVi?=
 =?utf-8?B?MVoyaUNRT1o3NCtWN0l4SStwb1JLMGQzSzhMUmVsMmM2aGRlUUp5ZGJINUNh?=
 =?utf-8?Q?FnX0W1OxHl2k3YXQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 697fd1ba-1ca0-4e3b-307c-08de5736d129
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 08:43:28.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QyvvGk49lLYkPr8AGq2qZ/D19NVlLni5qDclS8pv0H1tXSVj+XXb3oYMBEfoIeAgMI47mkTY/r8/jLDhOi9gRKrNwOzzMQOhQm4zKjgC4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9303
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

Hi Krzysztof,

> The i915_active selftests live_active_wait and live_active_retire
> operate on an i915_active attached to a mock, empty request, created as
> part of test setup. A fence is attached to this request to control when
> the request is processed. The tests then wait for the completion of the
> active with __i915_active_wait(), and the test is considered successful
> if this results in setting a variable in the active callback.
> 
> However, the behavior of __i915_active_wait() is such that if the
> refcount for the active is 0, the function is almost completely skipped;
> waiting on a already completed active yields no effect. This includes a
> subsequent call to the retire() function of the active (which is the
> callback that the test is interested about, and which dictates whether
> its successful or not). So, if the active is completed before the
> aforementioned call to __i915_active_wait(), the test will fail.
> 
> Most of the test runs in a single thread, including creating the
> request, creating the fence for it, signalling that fence, and calling
> __i915_active_wait(). However, the request itself is handled
> asynchronously. This creates a race condition where if the request is
> completed after signalling the fence, but before waiting on its active,
> the active callback will not be invoked, failing the test.
> 
> Defer signalling the request's fence, to ensure the main test thread
> gets to call __i915_active_wait() before request completion.
> 
> v3:
> - Embed the variables inside the live_active struct (Andi)
> - Move the schedule_delayed_work call closer to the wait (Andi)
> - Implement error handling in case an error state - the wait has
>   finished, but the deferred work didn't run - is somehow achieved (Andi)
> 
> v2:
> - Clarify the need for a fix a little more (Krzysztof K., Janusz)
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
The change looks good to me. I also agree with suggestions from
Jonathan that he wrote in his review - since you increased the
common code between live_active_retire() and live_active_wait(),
you could put some parts into helper functions in a future
patch.

However, current version should be enough for now to get the
issue fixed:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
