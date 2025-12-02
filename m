Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECFFC9AA74
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DB810E5A9;
	Tue,  2 Dec 2025 08:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+zf4ALF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F42810E590;
 Tue,  2 Dec 2025 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764663631; x=1796199631;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vcJvZ9N6z92218wsemWsBTAuPvEYfI8eqSxh+n/2xN0=;
 b=X+zf4ALFW8+du764jjwt80AWusf2QtFbDC/Eo5MI2LWVadG3M9uJqrsS
 K6v44KBab6SOnyeJiuvgfhZ65y+RSd9tvzsKvnhTY6PUmHesUqkcaLQsW
 WpjtmQ72XKJh+0kCzrmkU3/F6F5RkCuHJ7dKJ2C7rwVTffaOUW2/pP+Ie
 fyBZMElXXOO/jhq91Bvfi/RBtxY4zQl3bIlvcssj4CF68+gjSNItp4vLh
 hbINBgIy1sem3iK0DW+exkhHJKUW+vBCjaYdC1NR5QpgG4ZiTkYbbTdz+
 St8xu3VcPhHImhVVloSwWGiJXF4L6merLBlGQNE3zeuCD+agfqL+Np7im w==;
X-CSE-ConnectionGUID: QEJaVvcRRa2uTEnI3L/bKg==
X-CSE-MsgGUID: I8HQf0MBRFy+B9Kp0MYV+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78087744"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="78087744"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:20:30 -0800
X-CSE-ConnectionGUID: +rGf7cFBT/2RGV6qQdpDLg==
X-CSE-MsgGUID: IS4UdFO9Rmqk0DKNwIqwHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199262663"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:20:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:20:29 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 00:20:29 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:20:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZSodV7mLAjHc4Si2bzdMHoyVVlF+fdDeb5Ul4kqtiWOqPf78r4hwPHV/iCjGdzflmLT1UwyXh7998zjABurYpKlJm7gtKOeF/Kpx3LigdOQ9/2N6FJD7fw9GLRUERcXLY25WRYgvA1u02d2QqsPHc7WSuZBirg76ANPbIe2d46gWeDAuj5l+bBP+Ha29evNPjo/+blVdCcj7e0eRq5TycOZS1Hfx4mTmY3Mby7avp9slRGVrkngG/+1pNFmXNlLa0mpzJl6/0pg/sS4soa17pCflA9nAB9Pc5Z11yt/YxmYqu18d6WDWiZYl4UNbdWvjyuu2us4pkl5td5rySSPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inZY+hj58Zh2x2iC2Fq+26CaOWeAro+1+QJIKOeAhCk=;
 b=J0yZhdujfKr11d8LAd3dsy0wkiHb66o5gIQB4HCPRfK1lieU7SIZylYLko/NIEaqgaNAbIHLqv1lLG9Lyu19BuW6b5WO68tpOUN8IbVGT0JADgptlWpxUbBNrEc9NCLeFpyxYEnsTVn8xuYfU31StaMCSy3YBTJeNs+QBBuwS/TUJvWNC4H7ROqzWPIGAJqvg0auqaaKMOYe7bRpV/VyZy2Y0seOTj/luelLT9zgMy2lAxAUZdu6AwY0y73IVfzfgsmyIIo5+lehJ8M6FNbOYv0MNy9rwq04mf0z+x7W83UZyvHMQ3rDMwNC8hED/f4cNdcSMfkkNpYk/6cx7nDobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM3PPF7D18F34A1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 08:20:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 08:20:20 +0000
Message-ID: <b2864e72-6e2e-426b-8bab-855ec55a8a78@intel.com>
Date: Tue, 2 Dec 2025 13:50:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7,04/15] drm/i915/color: Create a transfer function color
 pipeline
Content-Language: en-GB
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Uma Shankar
 <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>,
 <alex.hung@amd.com>, <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251201064655.3579280-5-uma.shankar@intel.com>
 <a0e0f7ea-8fc0-44a0-9b32-0538bff42601@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <a0e0f7ea-8fc0-44a0-9b32-0538bff42601@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM3PPF7D18F34A1:EE_
X-MS-Office365-Filtering-Correlation-Id: f725828f-af23-4d86-8842-08de317ba167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3IrNHNMUEMrWC9neEhCOEJqUllsMlhtTDRFRURkbFVrL2tCQVNkc1N6V0FX?=
 =?utf-8?B?aHU4cFJGbVZma1huRDlaZGx4c01GM1B1L0tqWE5ZT3pBN3U0V0xWZ0dYQVB6?=
 =?utf-8?B?TXpqVnV1SDhNRXprcC9PKzkzeEhSOFAxU01RQSs5bnhjdFY5am1NT2tSZ2Zx?=
 =?utf-8?B?RVJvRzdjVlFKbkgybnpxQ3ZRdW1Odi9mRk5xc1d3VUQ1UWFiblIzR2lwbGxQ?=
 =?utf-8?B?U0UwMzY4M0JtRWQ0NmpZREttcjM3K09IOGtEcC9lZWhXRTBLU2pnd0dpTk92?=
 =?utf-8?B?TlZIYm9YU1Zqci9va3Z0SVBzb3hUK2hGRnBHcWV0SDhuQmE4aEVwUlpMaEVO?=
 =?utf-8?B?OVRvbmdrWHR0bUJoVllYZU5KbXNaNkZuaitUMXZiYSt1Ym5tZGNXbTRYbzNS?=
 =?utf-8?B?UmV5NkROdHB1VXlXUUZQcDJxQjZEaVBwRUFDbEJvUjFXeldQMDlMb2pzL3M2?=
 =?utf-8?B?cEpIdHg0V2h2K3IzTXEyTnRzd1ExT1Z1OGpINlVvdzhIQWFwOGR5MGN1VnZJ?=
 =?utf-8?B?NUZjL3lHUXAwd1hkZi94K0VkYjVVdDZSWDRvQlJlMVpLUWYyaVZLdlpkTzRC?=
 =?utf-8?B?SzY3UDVGRUp6M1FQZFJ0a0lPUndtSnJCdytNWFpQSG50NUpidTA0VGJHUjV6?=
 =?utf-8?B?V1A0YXdqT1NabXFxckNacmo3cTh4VXQ0MDNraTRycDEwT2xzMWJFbDdPWlNX?=
 =?utf-8?B?MW8yRW05YVZDSW5pc1RHckhpNThpVnhsR3h4di9TQ0psbXZPT2dtWkR5K0VJ?=
 =?utf-8?B?MDl2RGZTQ1orOGJGbW5UQXg2THNWV09oVUpsSFJCeURIVng0SytWZml4eDhM?=
 =?utf-8?B?SHprNWM5MmFQa1k0bHNRcmxsQXNMZzdvUDdVbGxWWU9yVlF0dktsRkJDbVRn?=
 =?utf-8?B?cFBUQnp2OUw3K2RsY3JkRFRMcytOcWMzSEVjTjlITjliZ0NzTlRGdGZOamtK?=
 =?utf-8?B?UWVHRk1oWUNqSHNlaUd5Y1pjUXZVSVN0WVJac0thb2ZtdU1sYU4yWnRETzRZ?=
 =?utf-8?B?Y2VyQkROZVlMSzEzMWxhanU3aHRYVTZUdGdUa2x5TmwwTDNRd2R2eUkxd0hC?=
 =?utf-8?B?MG1sazBZeW82dmJPaldOWXNRSTBBaGJndUx4L2ZzMmN3aXVmNkU4ckFJUjhL?=
 =?utf-8?B?bVhLNUIzT1lTSEVyR0hJTTJ4dkJlcnZ1dGVzUWpXODNLWXRhWldNejdlcXRP?=
 =?utf-8?B?WGsxcElkK29lYTdLZjV2ZWRJQnFyQ3dsVlhTTnJyV2VWbTF5Y24xeUNXc09i?=
 =?utf-8?B?aEJTWTI2em9lV0V5UG1YYTUxbFpCaVRBSzZsREFPd1pIU3g0UXVvTkJCc1Fn?=
 =?utf-8?B?L1pKRXJMK250bG5QdDdvWFMxYVpFeFB2UTZ3ZjFJL0ZsTFRuYTdhaW5yOUNn?=
 =?utf-8?B?eXpqZDAzUWx6LzcrNmt1cGd2TDJZZVN0Zm1mRnZScW5tdUdHU3hFMTFDekdY?=
 =?utf-8?B?OVZkZ3p2ankrb0gzYXNhZG9HRzZ0Q0tvZ2N3Rkx5Um5vOCtFN2Q4V0l1MGR1?=
 =?utf-8?B?REhla09SMHF5RG1JVC9FRDVKdk1VbGxLZ0lVQXkwZWxoQVlJejgraDdJZEtp?=
 =?utf-8?B?Q0F6RmR1djR6RS9JUmRndjFuL1UwRWdQOHV4MlNFNUJtc0EyNEZQSndaTlRp?=
 =?utf-8?B?TW1MUWVqQm4vY3FqMHlnL0VIbmFRRmtFMFBoUUpWQXByOGhGTHk0M3IraVVJ?=
 =?utf-8?B?cWdPcWcxRjJTaGdoS0lrS3NtclkyRnVqNGlOeDJSU3NOa01SQndPeFE0ZVlS?=
 =?utf-8?B?QWlEVWlTM1dza0l0TGo1TUJ1bU9XUkN4MU0vUTBUQS9PUUJtTFM0U1hWV3g2?=
 =?utf-8?B?ZUpZY3RxcEpVdHBydXNZbGdJWDdxd25PUHEzRXh0Y2RnQldoTkRPL3RNYjNT?=
 =?utf-8?B?ajIybkY1ckx0ZEpBWlh1QVEwOHc4Vk05N0dYMTMxdXJSYWJvOU5ldlVabGgy?=
 =?utf-8?Q?U3opK8kBzPgtB/TacmxMhxSqRnSUTlrV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmVSTzRwa0xTd2RBWjcrZWYwZ2xSS2M2RlYwWGRvWjNPQm5aZlBVMmJXVTRG?=
 =?utf-8?B?Smk1RTV1S3o1NFZJTWNINytNdHlRSlBRb0ZvNkRaM2RtNGIvNmFNNGNHYnI2?=
 =?utf-8?B?aWp5d3dXanhzWm9tR3d4U1NiMXQzaEtqVlVwMkduOXpBV2F0Z001QWptNmEz?=
 =?utf-8?B?MVpyekdvUGZldHF5YUd2eC9lUGpVM1FBNkV4YXRPWmRVRmxrVjA3U1RIRkhR?=
 =?utf-8?B?amFqdmE0ZmI5Zm95OEI4SGtkTDZCUkt5VHoxVGp1SitTVzdDTnFjNE1OaGp2?=
 =?utf-8?B?YnBpYlQrN3JQNE1CSnpHT2hVcVhDUGpWT1R0Q1AyQ0E3SFlKQVF4RFUxN29X?=
 =?utf-8?B?ZnZpaVhuVTdENzYxell4SCtLLzJoVkJEeHhOd3Z6RlIrRElFakVUeG5BeEx0?=
 =?utf-8?B?WUd5N3Y3MlVENmg5enFlbFpmWkJnclRodWVJYi9XZkl0eSsxcTR5R1htYTlP?=
 =?utf-8?B?SUZPcjlmUGZ1eEJoWURjTDRwWCszc3A3QVJDTnRvLys5M0ErVnVjUFgycnky?=
 =?utf-8?B?dStBdEJzeWFyVWJPWU9EdnFpK1l2TlVTNjFDZ2ZiNW9tVGZuUWEwZk9uaDJU?=
 =?utf-8?B?ZzZRbFZ1ZlRYL0JwUUNlMjZHQ2UzOGNRTVVickJXaklFcXV6cERCbENzRzdE?=
 =?utf-8?B?L3lnYXVmRjJmU09SMUZaT1lqeWpFZjdOdGtoTk0xOGIwL1hzVi9vYkNnRUZI?=
 =?utf-8?B?TTVtWEdEZ1ViUys1akl4ZUFqS2tFeHI1aXFTREwrL1NBSDdseFdXYnZPNlNq?=
 =?utf-8?B?U2xHdkJCSWZ0eE43TlNmTFBFSk9HVHZjQVYzUDNQNGYvcDlFRnJ4VGdRam5q?=
 =?utf-8?B?LzdLdmNjTGx4Tzc4UHpTRWVwSHlXN1c4L29VU3VGblJGdVBUWnVHQ2R4a1dO?=
 =?utf-8?B?Zm43YnRvNnJ3SlBiMHVFVW04U2ZJbkpTSmFwQzlzSU0xcG9ZVWRDWHlHNkxy?=
 =?utf-8?B?NFd2NEhoQUxmaHZ4QmlwTCtsUmwwbkxtaTdpbTQzZ1E2Q3EwV1BjVEJ1OHY3?=
 =?utf-8?B?WGY2dFN5WFlLUnBLbGc1eU9XWlpuOVRkZWdnSFJDbUlQeC9FeXVaUEJLemti?=
 =?utf-8?B?RTY2cmk1RkY1enByR1lMQWY5VVAzUU01QVhkZ1NiWWFPU21FTGUxSmVWZkw2?=
 =?utf-8?B?ZzUzVkhsc0w4ZWx4SFBBSHlXYzlYUDBYditzeGtGc3V4ek5VSDVsMkdoUnlp?=
 =?utf-8?B?UzR6WWFjWkJuYzVta1g4WkNQcmFrcnVNUE5FcExiNkJCSHdTdWdTbEM5VnNy?=
 =?utf-8?B?V3Q0VVdQSXRYcTVoc3dQOG5aYXFYNmlKbEVMUWdsckpvUGh1eXBjK0NhQXVk?=
 =?utf-8?B?TklQcmdmNUY2STIxRmlrUW1oNjJXTEJPd0VnT21tYUc4YlZXTkNoMlFSYmls?=
 =?utf-8?B?YS9EOXBYbWRtS2ltazRtNDJDNjd6TThCZ0dpTUFWOVVVbG5JN0lkQmFtdEQy?=
 =?utf-8?B?ZG15NFU5WVBPUDlwVDA3ZjZMM2FBSkRvOW9YcXpUbVAzUkhwRnM4Ym9KaW0w?=
 =?utf-8?B?Y1F5YTRmSE16UGJSelNsUXdaYmo1eHpmVkxNM2R0UjdXekpmcnQ5SHNrTGtl?=
 =?utf-8?B?V2poeU42ckY5cWdSRGFFQ2ZXSkdlVlIzMVRJSTJVNU8wRVdRUHNKeUhaZjZi?=
 =?utf-8?B?ejFSR3d4eVpBRXFkclpUVTZNdkdxVnlER2dKR2QyY2NNak9pWEJCYlB6VXpn?=
 =?utf-8?B?Wnk3NDVjaTdmNGxacGtRc0krRkxsRVI2b3BNUHAzQS9oNi9ySlZVV2NUTjM0?=
 =?utf-8?B?NVVOTHk0eEdKK2M4NFpjd3E5TlUzN1FORmo1RnhRSitKQVdtK0tEdGt4dytG?=
 =?utf-8?B?NnNOK2lWVWYzWU05WGFIWnE5SHBZNWJiblA1RE0wRmg1SjdSMzFvM3BZbC9X?=
 =?utf-8?B?eXg3MVhZS1A3TXVzZXpHMUxOL1JIT2FXRHZrNGx6T0dJdGNURGdSdzdoWlIy?=
 =?utf-8?B?Zmk3NnB1VXlsaVBIR0ZJZ1FELzkxSTZlbVNadGFqM2xhWWxDNTdNTEhXZWZv?=
 =?utf-8?B?bEVZSlJHSWFmUU9DQ1ZpSXBtRFR5c2RZb2hEVStjUTdaejBRQ2locStkdTRa?=
 =?utf-8?B?QnBBVk05dnBNMUlRaWlNSWlERndOZWFYOWkrbmhPOE5zN0MzZkl0bjNBZTM4?=
 =?utf-8?B?c3l6bW1Sd1ZUNFR5a3NRdk9LdVFiVHdZaGc0cUU3SUVKSlIxSldPZHRKaTU4?=
 =?utf-8?Q?QErG04T+MMOQ/7W9/RDWgsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f725828f-af23-4d86-8842-08de317ba167
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:20:20.1489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8Fc9apvQoybpD6ubXRRsWobXUNcqo14IYRGTzriZV2tXhVfj/DlBjqfAkJj+sfXZX7NjSxmL7WqmeXJIXBVsoS7WYLbMVG+oWCuZGOupbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7D18F34A1
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



On 12/2/2025 1:26 PM, Murthy, Arun R wrote:
> 
> On 01-12-2025 12:16, Uma Shankar wrote:
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add a color pipeline with three colorops in the sequence
>>
>>          1D LUT - 3x4 CTM - 1D LUT
>>
>> This pipeline can be used to do any color space conversion or HDR
>> tone mapping
>>
>> v2: Change namespace to drm_plane_colorop*
>> v3: Use simpler/pre-existing colorops for first iteration
>> v4:
>>   - s/*_tf_*/*_color_* (Jani)
>>   - Refactor to separate files (Jani)
>>   - Add missing space in comment (Suraj)
>>   - Consolidate patch that adds/attaches pipeline property
>> v5:
>>   - Limit MAX_COLOR_PIPELINES to 2.(Suraj)
>>     Increase it as and when we add more pipelines.
>>   - Remove redundant initialization code (Suraj)
>>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   .../drm/i915/display/intel_color_pipeline.c   | 97 +++++++++++++++++++
>>   .../drm/i915/display/intel_color_pipeline.h   | 13 +++
>>   drivers/gpu/drm/xe/Makefile                   |  1 +
>>   4 files changed, 112 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.c
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/ 
>> Makefile
>> index 7c19d5345d88..ca5c69d1cb08 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -241,6 +241,7 @@ i915-y += \
>>       display/intel_cmtg.o \
>>       display/intel_color.o \
>>       display/intel_colorop.o \
>> +    display/intel_color_pipeline.o \
>>       display/intel_combo_phy.o \
>>       display/intel_connector.o \
>>       display/intel_crtc.o \
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/ 
>> drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> new file mode 100644
>> index 000000000000..1415f94dd3e3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> @@ -0,0 +1,97 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#include "intel_colorop.h"
>> +#include "intel_color_pipeline.h"
>> +#include "intel_de.h"
>> +#include "intel_display_types.h"
>> +#include "skl_universal_plane.h"
>> +
>> +#define MAX_COLOR_PIPELINES 2
> Should this be same as INTEL_CB_MAX defined in intel_display_limits.h ?
>> +#define PLANE_DEGAMMA_SIZE 128
>> +#define PLANE_GAMMA_SIZE 32
>> +
>> +static
>> +int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct 
>> drm_prop_enum_list *list)
>> +{
>> +    struct intel_colorop *colorop;
>> +    struct drm_device *dev = plane->dev;
>> +    int ret;
>> +    struct drm_colorop *prev_op;
>> +
>> +    colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>> +
>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>> plane,
>> +                          PLANE_DEGAMMA_SIZE,
>> +                          DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>> +                          DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +
>> +    if (ret)
>> +        return ret;
>> +
>> +    list->type = colorop->base.base.id;
>> +    list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop- 
>> >base.base.id);
>> +
>> +    /* TODO: handle failures and clean up */
>> +    prev_op = &colorop->base;
>> +
>> +    colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    if (ret)
>> +        return ret;
>> +
>> +    drm_colorop_set_next_property(prev_op, &colorop->base);
>> +    prev_op = &colorop->base;
>> +
>> +    colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>> plane,
>> +                          PLANE_GAMMA_SIZE,
>> +                          DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>> +                          DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    if (ret)
>> +        return ret;
>> +
>> +    drm_colorop_set_next_property(prev_op, &colorop->base);
>> +
>> +    return 0;
>> +}
>> +
>> +int intel_color_pipeline_plane_init(struct drm_plane *plane)
>> +{
>> +    struct drm_device *dev = plane->dev;
>> +    struct intel_display *display = to_intel_display(dev);
>> +    struct drm_property *prop;
>> +    struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>> +    int len = 0;
>> +    int ret;
>> +
>> +    /* Currently expose pipeline only for HDR planes */
>> +    if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
>> +        return 0;
>> +
>> +    /* Add "Bypass" (i.e. NULL) pipeline */
>> +    pipelines[len].type = 0;
>> +    pipelines[len].name = "Bypass";
>> +    len++;
> Code for creating Bypass and COLOR_PIPELINE property is there in 
> drm_core and is exported as drm_plane_create_color_pipeline_property()
> 
> Can this function be used to avoid code duplication?

Makes sense. Would be added in the next version.

Regards
Chaitanya

> 
> Thanks and Regards,
> Arun R Murthy
> -------------------
> 
>> +
>> +    /* Add pipeline consisting of transfer functions */
>> +    ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
>> +    if (ret)
>> +        return ret;
>> +    len++;
>> +
>> +    /* Create COLOR_PIPELINE property and attach */
>> +    prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
>> +                    "COLOR_PIPELINE",
>> +                    pipelines, len);
>> +    if (!prop)
>> +        return -ENOMEM;
>> +
>> +    plane->color_pipeline_property = prop;
>> +
>> +    drm_object_attach_property(&plane->base, prop, 0);
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h b/ 
>> drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> new file mode 100644
>> index 000000000000..7f1d32bc9202
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __INTEL_COLOR_PIPELINE_H__
>> +#define __INTEL_COLOR_PIPELINE_H__
>> +
>> +struct drm_plane;
>> +
>> +int intel_color_pipeline_plane_init(struct drm_plane *plane);
>> +
>> +#endif /* __INTEL_COLOR_PIPELINE_H__ */
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 3420725c4ba8..89f922d745ba 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -235,6 +235,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>       i915-display/intel_cmtg.o \
>>       i915-display/intel_color.o \
>>       i915-display/intel_colorop.o \
>> +    i915-display/intel_color_pipeline.o \
>>       i915-display/intel_combo_phy.o \
>>       i915-display/intel_connector.o \
>>       i915-display/intel_crtc.o \

