Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A563FBAE4C0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 20:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8697810E61E;
	Tue, 30 Sep 2025 18:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiGNhlzR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2FD10E16D;
 Tue, 30 Sep 2025 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759256724; x=1790792724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/bpZGVN6l0W6H3FYhLa0ePscCeA5tfoKssyivOkrPyc=;
 b=JiGNhlzRkz/RkK0TLnWaOrGjbGruEZLPrtBfZCA7evoRZIRVB9q4T7nd
 w8BN3Jo4UHS8I7fa/mOFngmLJodZp2DmXOIA8yEF0CcrRowTeJH7zDomz
 CVbPnPCzcr6ClPLzpUlxIF/o+4dhF+LAKCN5bR3k0zmJkF8/bcKlA2pqq
 wQKWhRGMeTteio3LHX2e8W8WwIonSZtiwYaa2ObpaCeb+UWmI5/uLLrKm
 QwmUOfEYrx25k4GIdeT4CYnADbhd58d/sswgBlB9TF3dkNUGGSBMSQ0x2
 LOcfbB2wHiat6uoejIXiH00IOY9awHXTJMuCOV0dFzi7yvoSoisMlwp00 w==;
X-CSE-ConnectionGUID: maVCudE+TZ6y9b5jo5szdg==
X-CSE-MsgGUID: EnVniL0YSLO0+2QKOzC9WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72140361"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72140361"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:23 -0700
X-CSE-ConnectionGUID: n7fXb/jORnWbdog08O9aIw==
X-CSE-MsgGUID: 13DxFUPnTXekLxJv+yFsgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="215724420"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 11:25:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 11:25:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 11:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFbU+MiXOKgrI6yM/k04wgGNDdxpwzvuPu00PlPI5U0IoDyYdv4v1ViivszAuAlAm9Ws3BtEORx1ng2GAdEjitaPi1wzvjdH1F2gF7p1S2SByPqLkfi6OIf9ET07ueebtWQGcqjNySOVfoj28cLzB35lapKBitiFFst6f+soN76lro3gswqeSlrbj/EPzzxkR9pdp5nAWOMFp+ZDvff8lQumAi/utxtOGSweh3geCRukG+hZM9qlWcCg3dM20R10N52oANYGi5qIE2a4ObZ740Hjc6Dp8ZCb5GcBgat6t1PkCyW1sF3PA0hDN7I9iT6T5RvfYDd5rqoqMKxZDjmnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAfPr4ZMTeSXhP9L2g6+iPuMuYtn0YkUt32WAzSRbCk=;
 b=kssS5LPwclvq1kGEvK2lYs/UJrdQ9XyCzIPE+iw5vCzD54WO94aU7fGDOv3vcOd5Ad4hWbgPFdYePd1fszqSXwiAvrKJdcBEA/AujbH9MOjxH5P0XZYVquBuMnXKu8iRpXrACX/LYVxR2Dbb5+x0swytNey7g30QS+eJgTbzs4R9t7iPnb/vVHJ9gSMzmteptHbxeIM97cl+phV2uQ7S5Ygc2x/lUg0sOsxGOEfaCAz1q9gdpJ/0V2Cl+r7hnt/GJfgTuzMToTVOCxqBbB80E0HE52/MXNaUZ6qdh/8xtENO9zz8UrTos2qjsUSqiC+8mJIogJvFX3ZkFl5N6TOZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 18:25:14 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 18:25:14 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Vidya Srinivas
 <vidya.srinivas@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v6 1/6] drm/dp: Add quirk for Synaptics DSC throughput
 link-bpp limit
Date: Tue, 30 Sep 2025 21:24:45 +0300
Message-ID: <20250930182450.563016-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250930182450.563016-1-imre.deak@intel.com>
References: <20250930182450.563016-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 476a0f34-0c0c-4566-259a-08de004eb2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bk5ZaWtPNlpTUkRIYXJncTJPSlZNNWZMS2JHTU90bjkxQWJwcXQxekU2Vklx?=
 =?utf-8?B?SlJxNGFjZklGbnRjZys5QTl5Sy9qV2RuTDFWMVdQOXBObHI1bHBPZ1dvVnZJ?=
 =?utf-8?B?b2lCcTdPUlBRaCtOUjcrbTVDNGpkQ1M3NjhTS1pORnBYbjd4ZzJZZVE5M1Ur?=
 =?utf-8?B?WmM5TnE4MFZnL3BDNWFITUtEbXRPM2s2MCtSbzZxakNIWWRZV3gvL2RwUGhs?=
 =?utf-8?B?RG84T2FyeXAxTC9mVWhTdzduMDFLS0lsVjRnMTB4Q2wzam1RRlF4UFhKTnJ3?=
 =?utf-8?B?am8xUHF5RjkvSzl4QzZRbGFuV2NlUVVhZGxWZ295V29yQ3RPTENGOUwwYmht?=
 =?utf-8?B?bWoxR28yZWc4ZW5uV3FTZXRNblJCZDZqVlRCNlVTVXRsY2ZCa2pqNWEwendx?=
 =?utf-8?B?NU85Y1djUHVHZEVaM0V2NHNqbHc3NjBPOFlycXdEK2RWTnd3K1AzTDRpM1Zo?=
 =?utf-8?B?T1BEcnNMbzBVOFVRbkZORGRuVFRPazRTOVZsT0w2OWdUY0ZIUHc2Ri9oT3Jm?=
 =?utf-8?B?ZVUxYWdUQVZwaWlyZzJqK0pKK0hvYUZ2M2dVdFV3R0pPVGlSNG9McnVtekts?=
 =?utf-8?B?UERubVBZS3U1NmdITUl0Z1RRdmdrNDc1ajgvRnJXMldtVVE2cjFpTERsNUQ5?=
 =?utf-8?B?eU82REhoSzRRZEQyekRBQnNuYXhUbkNacW5GR05ieUphckd2MEtCa091N0VN?=
 =?utf-8?B?ZExjYWtiYjZ5dHg0NFJxTlZ5ZGVST3R3MERVS3RoTzMvditFY0Nma3R1dGdR?=
 =?utf-8?B?NENqQ2Y3alRlYzh4dmozNE4yZWJNT1pXbk1uWHZwQ1AzVkRDVk5BcTZhclY5?=
 =?utf-8?B?MmphK0tqYnhWWEpJbS9ka0hSNXhNSGkvL0Q2RzBhOGV1UWhkVTdqakVxNHZ2?=
 =?utf-8?B?NUxBMHh1UVlXTDYrK3lXeXM2UGs1MVFZNE95M25xTXZscGRpbFV6Yy9rZXEx?=
 =?utf-8?B?T1hHeFpvRWwwTVpBbzNWWjhqQkY5eHMvclVkUHdUdEQ1MjlFOXZ0UHJuck5P?=
 =?utf-8?B?Y3NVY3ZNUW1BWUIwYUVreUpXa0FOVWdvbzR0d3RSYTVWTzNVNmlKRlZnQ1FF?=
 =?utf-8?B?ZzllZWIza3gzUTNuRXVvYlhHa0lSWmU0SEF1QnpIMjVCMjVPd25zR3lwMkZx?=
 =?utf-8?B?Ritrbmk1ZE1VNEk3andlWCtXVDNqajYzd1dIRFQ0SiswY2U5OG9WU09YcjN2?=
 =?utf-8?B?eXkrelRaK2laNE1mWUtieW1MWmMxUXdlS2ZWYWdydHp4QUdjYjhxdU9pNkdn?=
 =?utf-8?B?Mk85SGxEOFFTRWhMNVBrbmNLSHdncVNDL0Zrb0l1TlJTWUVFOEk3dGx5QlZr?=
 =?utf-8?B?TWlkb2QzajNEbS9PaFYwWmFmYThaaVQxc1VpNDNjNFJyUnBiSlNrTEE2Y3Bw?=
 =?utf-8?B?b0ZKTW1hRDNVUkdJWVlhMmorZHQ0dDdhemMzVDBET2psQjZhb3JwNzVOYzIx?=
 =?utf-8?B?aUtQT1l0ZlI3dWpwemdUM3FEVHM5UWdHdmYrM3FrWWxTRCtOU0FPSnpKZHdI?=
 =?utf-8?B?c1NNQklrK3JmTjNWMzJQUnkwMVlweUJDYWZqdW1pZjA0Zm5oSkhiNGpqZEVH?=
 =?utf-8?B?YkdTeDNkSGxKaytkbGlMcDhsYW11OXNvM2Q2cTVwOHVmZkhjbnliS1MzNWJO?=
 =?utf-8?B?dENYMkpvdkUxaElEcnBGTVY3Y3RnaUFXQ1JjdXJGek9nUVFZQ01SalJ4ajRq?=
 =?utf-8?B?YzhrUGF1MXM5d1hHM1prbnZKQUVSRGRBUHVsN1JmeUhWQUNKZjBpVFBnT2Jo?=
 =?utf-8?B?blhmNGI0UDhzdmZ4cHZWVExDM2RrVWIvVkllMC8yRjcxSy9tRWx3SjZxTlNQ?=
 =?utf-8?B?T1BYS1NYSDJFcmE5cGVidlhGbDkvN2NmbjZNbmdkK3BvUnA1Y3d6eTZSL2g4?=
 =?utf-8?B?d1lZNnhwN3ZyUHZTZXlSdHpoY1p2VHZQN1I3cjhNMi9kbmVvd2w4am8yYlVY?=
 =?utf-8?Q?9p0WRU/JaoDF+33WmpZrAyRFpYGQ/upB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZpVXFXZzFHQnhYOE9PbUhtWWNSbWZrQ3MxcmowT013S2pqMXdzYUgvbmhW?=
 =?utf-8?B?VkpMLzY1aUNWWTlhVVFPclN2YU0rMnlMSlA3WmdBOUJjeGMrWmI2UXVGUzdD?=
 =?utf-8?B?Zmx2K1l6bkpIOVFndWhUKzB5dHhKNmI2VERPZXBiUi9VSDdwSmVZVDVFNDVo?=
 =?utf-8?B?RmNpT2Zhc21URzFKZDdGWWU3K3d4TVBReDdSS1l6VzRZU3Zsd2dnaUVla0dH?=
 =?utf-8?B?b1B1YWFKaEFYd0dRQkdCYmpFSXNVZTFHUmhoUlNXbFY0QWZob2E0YXpFcjJa?=
 =?utf-8?B?VzBwWkpzK2p1Y0VoWkF0cURUOGRnV3lubUQ1RHQrNjVDWE5hMG0xSk1HRG9q?=
 =?utf-8?B?dVhqamtESExWZ3FMdVI3cjY4Ty9Bb1VPS0NCb2I2SW1MU0loakJHdHM0Z2RC?=
 =?utf-8?B?aTM5Q0dHRm9pdTdKMzNPc1dGYzUvc3psWk1uRmRBSjhiREhia1NPb0wxUmR6?=
 =?utf-8?B?N1hKdCtUVFBjV0FXcTdNRE1DM3BHRTZWSG41eDNvVGVTU2VScUp5YytsM2R5?=
 =?utf-8?B?RW96SUYzVkZEV1ExaEFkUUI2aGJFT3NUQjllWDUvN0ZrczA2emxHTis1S0N5?=
 =?utf-8?B?cWdDdW9KZFl4T2lySzZsRm9HOGkxeGdjWE9LSnZGa1hIaHhTMDJ5bXhPOUg2?=
 =?utf-8?B?MXhTVlhMWlp2L041VTk1RnNOaW1ZV2VxNWk3WWpjY0UxazU4KzF4ZVBoWnZU?=
 =?utf-8?B?YU1vTk1Tb2RrbGEwVmFCa0djSnJFRzlvdVlHRCtUTFA0NmQxbzFBdXNRUTB5?=
 =?utf-8?B?MEVDTjB3TlN1S1VSYmpWNFNtdDFUQXJkOFRPcXpNcXBNbzNNTzdQcmdvQVkr?=
 =?utf-8?B?YXQrb05GamdBQURjMWtyM3NZNVcrVkNBNVdzaXhkL3YxWDZIQy9vR0tQQ1FO?=
 =?utf-8?B?b0hydmFsTk5FSHFiMTFBUXB0TWYydElHU3p6enhmK2M2MWZXU0NEdmNpQnFu?=
 =?utf-8?B?aThRZHZlY09hY25PeWtEdlNTOTZMMmx5VTlpYmJFamYxeTNDUWtxOVRRMWZ3?=
 =?utf-8?B?SEhvNDZ4cVBIaml1NC9TenVLckZBZjBiclF6Nnd4bTN6Si9TS0tmclRtaWx6?=
 =?utf-8?B?RW5HUlhrbTNQQ1FpZHhCQXJ3THVoZnhOeWdScG1ydkpXQmNva0F1R1R5aW92?=
 =?utf-8?B?RHFZeXJwZFY4L00ycEtCME8vUnczeHZhb21QbzN6SzFhdHprZng1Z1BCVmNh?=
 =?utf-8?B?ZDEzK2kwL0ZqNENtbFpNM1VSTCtzam9YOXI3NUJFdDBuaGdxeHNnakh5R2c5?=
 =?utf-8?B?dXFVUmJzQ2Zkd1NqT3dGZkZQMVY3T1hZZ011RzhjbnVtdWJka3NhUFdFeHpu?=
 =?utf-8?B?eFVqU0JTYWUzMzdueExqMDB3WElKSmM1NXFSZTVVWG4rbjlNdnhzdlc2d1Zs?=
 =?utf-8?B?blVvUDd5NjlTTXo4eGp6N2NEWEI5aVcyUjd3YXRocGlqUDIwRjEzSWE3Mnc5?=
 =?utf-8?B?OFVJYjZKSzl4cllqdGJpVTJ6VkVjMko3RGRmbFBLaUptbkNyWEkxUnQ5Mzh2?=
 =?utf-8?B?RWovbVhOMEVIaTdncWJZMFJnbGhGRGd6c1dJcGdiOEpvZEg3dGQxNUJIaHJ2?=
 =?utf-8?B?d0FiTWNYd1c0dG5lMkJEMTlxd1RRcFl6bndxYkVXR2NDN3QzbTVRK3RQcU9j?=
 =?utf-8?B?cnhZMktBNnM3NzQzRDVhM0lGR1kyeE9BMlJmdkFwMXB1TzVQcng4V3RKQ0xI?=
 =?utf-8?B?bytSQjJyb0NUWGtxTVQ0Y1FHa3J1UnBNTHNLaFpkcWJzaFBuazlCVVhNbXg5?=
 =?utf-8?B?RnBDL2V3NFNNalkwWE5sTGVsOWlHL1V5aFk4bzZGSy9hc2s3WUJHRzBGUEl5?=
 =?utf-8?B?UXgrRFNkV2RFeHovU2VzOXpwK2hwNlhIcjlHbm1DQXRuemRaTnJSK2tlMFl0?=
 =?utf-8?B?U1ZYenJBUmJRcVUvU04xMXBuV29zY0w5YWtvNUdINWNwMW5DSGl1OUNBcm1i?=
 =?utf-8?B?SXZrRWwwMUNNbzVOaC9DZVluRFRiWGxsTHAzK05qR2tJM1p4cGNWRG9JOXUr?=
 =?utf-8?B?TWtMOU5uZUN3QVV6aHpVdmIwYjN4UGtjc204ODA2UEhXWXQ5QkZpbEEvbkFO?=
 =?utf-8?B?ZkJ1NXpIdk9raUtkU1g1YXVPQ2thSTRsWkhqa3V5M2N0SzlmamI1bWVBdkE2?=
 =?utf-8?B?QVY5cjh5dENqeUZjK09vSTBMR3JJMWx4bzRrSXhtS1RxV1FWdVpZZno2SzVt?=
 =?utf-8?Q?gIj4+yYpTm3IishnlQ4C8gz+hRQ779LskjOtMlrs4eTN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 476a0f34-0c0c-4566-259a-08de004eb2f3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 18:25:14.4522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvPECTK9z4yfr5kCP0HiL6XpBcygUCDUOaOVgAlxVQRqWCv8nm5RaEhQCdida1XvZRcYeEWMKYAfY+z/KBq/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
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

Some Synaptics MST branch devices have a problem decompressing a stream
with a compressed link-bpp higher than 12, if the pixel clock is higher
than ~50 % of the maximum throughput capability reported by the branch
device. The screen remains blank, or for some - mostly black content -
gets enabled, but may stil have jitter artifacts.

At least the following docking stations are affected, based on testing
both with any Intel devices or the UCD-500 reference device as a source:

- DELL WD19DCS, DELL WD19TB3, DELL WD22TB4
- ThinkPad 40AN
- HP G2

At least the following docking stations are free from this problem,
based on tests with a source/sink/mode etc. configuration matching the
test cases used above:

- DELL Dual Charge HD22Q, DELL WD25TB5
- ThinkPad 40B0
- Anker 565

All the affected devices have an older version of the Synaptics MST
branch device (Panamera), whereas all the non-affected docking stations
have a newer branch device (at least Synaptics Panamera with a higher HW
revision number and Synaptics Cayenne models). Add the required quirk
entries accordingly. The quirk will be handled by the i915/xe drivers in
a follow-up change.

The latest firmware version of the Synaptics branch device for all the
affected devices tested above is 5.7 (as reported at DPCD address
0x50a/0x50b). For the DELL devices this corresponds to the latest
01.00.14.01.A03 firmware package version of the docking station.

v2:
- Document the DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT enum.
- Describe the quirk in more detail in the dpcd_quirk_list.
v3:
- s/Panarema/Panamera in the commit log.

Cc: dri-devel@lists.freedesktop.org
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 4 ++++
 include/drm/display/drm_dp_helper.h     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 5426db21e53f7..1c74fe9459ad9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2551,6 +2551,10 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Synaptics Panamera supports only a compressed bpp of 12 above 50% of its max DSC pixel throughput */
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x22), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x31), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x33), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
 };
 
 #undef OUI
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 52ce280970151..e438c44409952 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -828,6 +828,15 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+	/**
+	 * @DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT:
+	 *
+	 * The device doesn't support DSC decompression at the maximum DSC
+	 * pixel throughput and compressed bpp it indicates via its DPCD DSC
+	 * capabilities. The compressed bpp must be limited above a device
+	 * specific DSC pixel throughput.
+	 */
+	DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT,
 };
 
 /**
-- 
2.49.1

