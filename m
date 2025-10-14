Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D62BD7B08
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 08:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941E710E549;
	Tue, 14 Oct 2025 06:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2KQ65ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6501E10E54A;
 Tue, 14 Oct 2025 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760424708; x=1791960708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f4UmS3E5gSmg83CN9c1Lete1sRpSPKr0TQAmoJ+NSYA=;
 b=f2KQ65ibduGFCWEMymVoxMUn4GOyL6glqQUNIXIqTD2c6QeebKx3+P7U
 xUz7uJRZEY/+kFv8riSPeQqt+47nA/iSGtGCbxeHbn9KL6iDySK8DLdEf
 iX8RxGOF84iHiemS3wkZ/1ZIERG4pj9zrtlv8IIYKFNMSvA83w3GpOnYq
 sMvjVMki+5Jyh5KdRMjzVHLz87c6HnR+vCWIT/1wgLo1jMhzrKv28x5Rh
 ZRP447jsWlqYTtyamdWDAl9ANttuEKSvR4BrTl9FtDBeCq9midJAKU3mZ
 M94kkF7ngcXgHE4Q2vlFtbzxGMyaTOAzwkYp6qRHREgIo7WjUaTdGuDk+ w==;
X-CSE-ConnectionGUID: tR+mcvJ/SYeW4s3KZIn36A==
X-CSE-MsgGUID: d/6S2JQMQqq0rIT/FCIn4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62465953"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="62465953"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:51:48 -0700
X-CSE-ConnectionGUID: iMNc5uD4TKWIslbcQZimCQ==
X-CSE-MsgGUID: aZ2jUIj1SkWWfBqrPVzR+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="182261602"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 23:51:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:51:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 23:51:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 23:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXkbp3LIxMCKF64ywDSKBQiYWsfUdKHTAkiEUb8a8CxnnP7muiy+iXIBED5bqfBucKJJLu80hKddJOIovUV3HXCaEoQfAkC1wVRImemKViAUK54wEcBNjJeIAe62oM+2K/5YflhIhglcN6twXUF99K3outr++cK2MryLGBXHyB0r8ezQZVPElvVFhsNfnIeEHgLv+A68msl0L2RbDeleTJ9Yi8b0G2vnU+AsJF9m/wXc9EsX+A+QDaAXnZU6sHNHzIRgepB7YUiBVsmyRryf1sO40PGds0jacRkpYn3ZHQthehUnBcDw3edSQNSuGRqLF54F2UWxHySgAKnjxqosQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BbbLsF7C4nfc5CX+oBnknqFIf//SJnBy+/7TOMTik8=;
 b=ubPX3e2Em7YDdObH/aWtR/x7xrUyWfjSRsS5TUNgezfjKtF9ud8NK/H7qf9fQoi8vC+kGXHpr8nl/8A1689lLZt/2SaVO5AsEwQBWwgflPDd6m+CaEtfpZTDRyY/W4ViC9qmBebbaTEgPBQ3sf+cYfZnUE/D2xUjt9vNeVjo2vSBMFYqyWWo11f69rMLSNST2NHm1PSeNcEz0l7afSK9cJfci3FwJELYyQhVT4uG7rPUsxA0uYVa7rE3sdczLIgwQksf0QUdRFAOH+CB6X1io6KCilIWoAO8T3LXdsKEZ6BCIh8Th8aEu8wttPcFwJMaEGnyygHCUYHMCkP8ePbiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 06:51:46 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 06:51:46 +0000
Date: Tue, 14 Oct 2025 06:51:35 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Avoid lock inversion when pinning to GGTT
Message-ID: <icdq4hcqnjh34duzx5jlgajmespgj7rj6yiboq3of7fmvt5rev@eu5s5uislnk4>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
 <20251008161258.3568573-6-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251008161258.3568573-6-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DB3PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:8::48)
 To CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6a8f2d-cab2-4698-8ea1-08de0aee240e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzZVK2xteUxtYWVIbENFOE5aUG5MclllQW9Ya3lrSUUzWFV4K1R5cXY3V1E0?=
 =?utf-8?B?a2d5ZEZQYWV6TFJWdzM3S3pQWXBXcjdqUlZCM1ZrUHFodmdmWTJKdi90eW14?=
 =?utf-8?B?blZEMGNOV0p3Y0ZhRVhFelRZY01iT3ZKVjVYMm1CWlRUQTg3S1drM2NKQlVT?=
 =?utf-8?B?ZWhKV0M5dWVEOGE4WjEzTjlaY1h5d21FNUt4dUZyeVFEeVdhV2hsRkd6Y1Fi?=
 =?utf-8?B?Y25QUThqa0xjM3ZKa0ExcVpPV0N2eC90K1EwRWo0ODJvbmJheitkUitLNG5x?=
 =?utf-8?B?UVVOVEdOTnJ3RGJ1b3RuUUxpVTluZnQ4Mk1DWCs5eGQrdkJ6dDNteHNlWERE?=
 =?utf-8?B?UHdwTUtkaVdDMGVOeDhiWUV2WkZrbnZCcGh2TDNTWnpDS0dBRTdWb2VWaVhW?=
 =?utf-8?B?M0MvR292L2k3ekozMmlvbUh4Y3BvM0RrT1NSTUJ2MlRnTUVsQ2h6TEZ0TGZU?=
 =?utf-8?B?MjRHZzhibXBXSml6S3VqRHNRMFNhYk1yazBaWnlNaVBxSkkzVGQ3bVBzRXM3?=
 =?utf-8?B?R3dkNGYzc3FYdFdISUVuNkR4UXpIdXE5LzRXVDZINmIxYnZNdzhoVHgzeTJV?=
 =?utf-8?B?MmJNZnNCcHY0c2U0K0I4SkZZaG9wcXZkR1Y3dXJ2aVdDNVpnUmFmTGlJUGov?=
 =?utf-8?B?ZHdKREkrQ1Q2b0xkd2UzVFFxQ2JQMkR5UTZ5RkN6elIrVmdNZ0RuS2FVWnhm?=
 =?utf-8?B?WjlMUm5EemVKUTlMTDVmZExGQ2RtamsrWTlSd2Vpd1E5N1Rib09zWHVJejZx?=
 =?utf-8?B?UHFWMzhOeWo4U2RqRlJiZzZTYkpxUTBoQVlGVkVJVFloZ2hqdUlLcE5jNHAr?=
 =?utf-8?B?czBqZi9VVlFOYk40OHFNTHRvaTBVa0RsWHpjemtvQk40UTlBWG1oZlFpMm9j?=
 =?utf-8?B?ZEYxaVRNM1NJUVdmY3VMeDVXd1RBUTBFN2hjdzNmTW0xdEVFeWErMTdSRDR0?=
 =?utf-8?B?YkRIcy90RjZZUjhKaWJhNkpqK2NaK1hEcXhjcWE1Ny96a1BlNUtuMFNZOHI4?=
 =?utf-8?B?QXhNVm5rL1dtVDJEa1ZxZE96Y2p6dkx1bTZ2eDJ2dWptL2RHbzVnQTdsczBZ?=
 =?utf-8?B?bnpiRXVSNHRlSCtYR09oM2FwSWNCei9raXlTQUtSMnJvRTA0M0l4TW5jUHMw?=
 =?utf-8?B?L0xZM2Z4QzhjWEx6Ukp2a3R0ai82UHM5cGdIdGhHb1Z4em5jOFVTaThkdTEx?=
 =?utf-8?B?QkU2Q3Z4RlFLamU2dzA0V0kvZzVpSi9hajB1djdyOHZRaWVSN3RGRmNPQWJi?=
 =?utf-8?B?dGZkazNNdHc1RGRobHpiRzV4bTdoSEZxYVkrdmFZeURuRHZMQlVzVzR1Mm5r?=
 =?utf-8?B?cU84elg2TnAwRWtwemV4d0o2U0UrOVVKR0dWZmdpSGhDUkRUTnlEUWgySCtH?=
 =?utf-8?B?YkZBT24vakZwT08vOFdOMUFJVzF3OXNSbTk3clMyRzA2b29iVThFL0ZtUlcx?=
 =?utf-8?B?THc1TnVrR3JyZytOQVIrazV6dHBtNFl1Q1dGQXluaWt2ajByU1FtZ05LMXYz?=
 =?utf-8?B?Qnl1bHJneVRaTkxxMmNrL04vRllDZFppelQ3MEI0dHJ3d1VWWktuaHdyN3ds?=
 =?utf-8?B?b2tmcU1CMjlzaVZpZUVLajF2N2pOOTFRdm9OcWhQSmhvQjJsam5KK3ZTd2RH?=
 =?utf-8?B?RGI1N1VENjdGQTNLZFlka2h4eHZRTzBOV3JTVTZ6RGl0NUxnNFhzc0l1dFZX?=
 =?utf-8?B?K21OQmdSbTZkUVoxMUxscmtOYVRDNVhvZUM0VWFUcnZiZHBlUFFFNG0zNkdM?=
 =?utf-8?B?c3BGdzJYaWswTlBsYkVibmJJQXVvU1l1Yy9sVnIxbTN5YVdaV2s1Vmt4aElU?=
 =?utf-8?B?bFlZT3RHdG5uWkNZa2w3djlIOHI1eW1MOWZXMVNSR2RMRERSNnRnRHJzSHdM?=
 =?utf-8?B?dEdLMVBRZWtPNkM3RjVaMEtpMml4SUJDUWlHazF3cXhaQ3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTR3NDBtMEt5K3BWYW9BY00zOXlzZFBpV3dHMjRDcTdObEplSFltUWVtYWsz?=
 =?utf-8?B?K0ZkWEZyMzR6U0tMUlM2QlhMZEZWa0RJTWVFUE42OWNuTWw4ZTQvMFhwZDZp?=
 =?utf-8?B?ZHdlOUErYnZqaEZvR0NPWjRRUlFob2tTdHNxaWdMR3JQNTNiaW4xVnVZejQr?=
 =?utf-8?B?VWNtaktlcGNINVptZ21McUU1dEg5NUVkOWJHQ1lQZXE2R3RRaGs2S0pZMzZ2?=
 =?utf-8?B?SWNMdW9naG0xT2owekJMaUs5bGMrWmpGb2dXNVlheEwycU5ROWpIMm9QZ0t0?=
 =?utf-8?B?VldWVjJiZU04cnlHeHZ3d041eWNTdk5qcFA4TEZ5ZE1TY3VSZ1lucE5DSDlp?=
 =?utf-8?B?RmlnNStrdExXa2RCVDRxdktnQ0t6STJtb2NpTnF4cTU3WWVhTG5uTmdtSURC?=
 =?utf-8?B?dUZvSTdBVndtN3NEMUFRWndVR1YwZHF0QXNuMVRidmM4b2lCT2VNWG9EdWdj?=
 =?utf-8?B?MWNiQ25wK3ZLcmNCa2lCVUgwNDhOOXhWVTIvUmFvN1N5TkNPZU9iYXV5RTRy?=
 =?utf-8?B?OEpJeDZybnNaSUlMMENyK3dTOUpGYjZ1T29Db05IK3dJbW9GaHg3THVJQmI3?=
 =?utf-8?B?MkpRWGJNVExaWGE2Sm5vclY3aGxwMytYQ2h5dGh3ekxhcU9mTktwK21sMW1q?=
 =?utf-8?B?ZE1lVi84R1pyREdGWDBnS29QYjNMNUh2azFncFVHcXo0R0tsZ1l2MGx0eENv?=
 =?utf-8?B?Z3NvbDNGbnVmTS8zYW5oRUtsMVV0dzhGZU1ia1htbFNMNi96ekFIZzFtcUZZ?=
 =?utf-8?B?ZjBVOXUwV0U3SjJsMHQvV3llUXFRNnQwc2FtVFhSdm5DQXYvOEtRMVFNUFEw?=
 =?utf-8?B?ZnhXT1R0a3cwTysxanNBZFRROGJqdjQyL29Hb3luLzdBNDNKMmt6QmZ1Q2Nh?=
 =?utf-8?B?dVBqMFFqWFE4UFVNTmcyWWhoaDBOVjJSZ09WZytvQ1RYTmw2RlYwY0V5c2ZR?=
 =?utf-8?B?MDlnblRPOTdmSVVRSEpkdVdGUHdOL2xLenVjNWl4MVRUMHZoai8rTldBUVdD?=
 =?utf-8?B?TUk4NnlaeStlNU5SRm1RdUcwN0tWQ2crQkQ4bnJKc29QWEdlaCtrdG5CU1dE?=
 =?utf-8?B?RVpiZVhKZ0xFZFgrWnVMK0QwcXVwUnh2bWtXZ0N5TkQ1dGlDc1NWUXNzd2sz?=
 =?utf-8?B?aSt3KytkZGlzbnFDT3ljMTE0eVdFR3RvcmdlWjlyaFI3MGlibEIrZloxcjNM?=
 =?utf-8?B?QlBSTW5pT2wvT200VGF5Ym93eHoxN0puWmxoVnlFVHhwejJNT25UZ1RudCt5?=
 =?utf-8?B?ZkhRazFOMzRSOTNJcDJBenhUUWNsNW5oQUlHZGZKM0pRTXIrNGFLQkhxMUNG?=
 =?utf-8?B?TEg3Q3RRUnBMZU1UZGZ5M2VHRmh4S2szSVdJa0ZkQno1WVNzY1BZUnFEdzZH?=
 =?utf-8?B?ZGhkOTlETkp1ZTNiMklSU1lVNG1GMjI3TGtSUkFZOE0xbGkrakVYcXdmNHNQ?=
 =?utf-8?B?c1ZCT1NFTXU5b2FCMU5LT3FPeW56ZG5hWnJzZ3dqNkF3NFNpdmt6Q0p3cmh4?=
 =?utf-8?B?WnY0NmZmZE5ZRFFTSTU1T3lMaTlUWnRhWVo0U1RuWmg1YzZVai9wYzZlc1FW?=
 =?utf-8?B?ZmhFdGcraWp2QVZoa1VSbGM4T2NHdEtKNXdGL05rcWdMTCtQTWlPb1J4N0Vv?=
 =?utf-8?B?TXgxS21zNHM4eUtKZTZZNEhSVFU1TUVpQzFxaDVYVFlMVTRGSWI4b3M3R3Ev?=
 =?utf-8?B?RUNLZ3h2SllsQ0lRaDJHQ3lRVXlETi8vV2ptbk5XWXlaa3MvaWtyTkYyVUdD?=
 =?utf-8?B?NHh4cDZzVnFqVzc5Y2tYYnNxdXFjM3JOYm5zaVJEZXlZek9kdjlHNFpoMC9U?=
 =?utf-8?B?RHFYMVM0UEhLdUNKemhYUEFUTFBMUFJoMGUxbm03dW9HU0s1NDRUNDI5ZGZh?=
 =?utf-8?B?SnV3Q1lPNU9YY0l1MTBjeXVaVTYxSWw1OUZpUm1kZFdrWTQ3ckFIMkNWYks0?=
 =?utf-8?B?TWRyd0JaUWdvZTJVOCtCTG9QY1VBQVBibEZQMnhTZkFZclllTTdIRWpjZ2s5?=
 =?utf-8?B?VWU4SkE5VnJxYmZwTkU4QkhjNnNtYkVUSFJGR0I4ZUoxUVg0d2N3b0RQRXRi?=
 =?utf-8?B?Wkk5ZTN5QlA1dU1WL1dCOEZpaDhCMG0ybEpwRk03czVtU0s0YUsybGR0RHUv?=
 =?utf-8?B?M21XNThlSW9WY3VFM3JvYVlYRXRxVEk2cEV3aXBFK3VnNXEzbGo0NVZZelg4?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6a8f2d-cab2-4698-8ea1-08de0aee240e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 06:51:45.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lroFGm8bv14msdljNF+XxKLFiMimLlcSVCkDivefhLnAHCn3En/nqKCQHU1Wgs3Mx8wgk1slyIg97b6gBVw5vsq+CmpnpLLgFTiY0qkxhUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
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

Hi Janusz,

> On completion of i915_vma_pin_ww(), a synchronous variant of
> dma_fence_work_commit() is called.  When pinning a VMA to GGTT address
> space on a Cherry View family processor, or on a Broxton generation SoC
> with VTD enabled, i.e., when stop_machine() is then called from
> intel_ggtt_bind_vma(), that can potentially lead to lock inversion among
> reservation_ww and cpu_hotplug locks.
> 
[...]
> Call asynchronous variant of dma_fence_work_commit() in that case.
> 
> Fixes: 7d1c2618eac59 ("drm/i915: Take reservation lock around i915_vma_pin.")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14985
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 25e97031d76e4..20deb01c0e5fe 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1595,8 +1595,14 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>  err_vma_res:
>  	i915_vma_resource_free(vma_res);
>  err_fence:
> -	if (work)
> -		dma_fence_work_commit_imm(&work->base);
> +	if (work) {
> +		/* don't risk lockdep splat against stop_machine() */
> +		if (i915_vma_is_ggtt(vma) &&
> +		    intel_vm_no_concurrent_access_wa(vma->vm->i915))
> +			dma_fence_work_commit(&work->base);
> +		else
> +			dma_fence_work_commit_imm(&work->base);
> +	}
>  err_rpm:
>  	intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
>  
> -- 
> 2.51.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
-- 
Best Regards,
Krzysztof
