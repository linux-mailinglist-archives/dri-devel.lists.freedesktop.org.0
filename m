Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52900CA1952
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 21:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6574710E081;
	Wed,  3 Dec 2025 20:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEtBOoRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBE310E805;
 Wed,  3 Dec 2025 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764794692; x=1796330692;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CZv7dbnSDK/hXrAaBNu98JkOICaZmGZBEDEsFFjLT9E=;
 b=TEtBOoRB5B/9jIhl4uRPTCt/L8pRJJ4C7+UTnwR1cJFMjXMnBZ+QCnjk
 s6SVDxOLKAszGHa2c7j9+r/uIE0ddEsgN/u1I1zXa/FVEKW8wM3HPAk6+
 3cA65zsR0Mm4/T0wFi6bJ6bG3ruPZpIWqciwfxP/Gr0HvwAC2OlEKaLbE
 UUAZ4vyL1ojFTchWq71marCMta/VcRbp/+eBcKb+SVBHNZw79DSnI+MzZ
 9yn9kqB4BKQo2IzAc7F/HWvg3tgSD7MWksIcf9z862vr7jEaT6dTMNxN2
 luWnLm93qJupmLEfiSsfQRIVs2paQQBbZTrkHyw4mn7rYNPfiOat027lR w==;
X-CSE-ConnectionGUID: QUDc9r0BSouc/8I58ggcnA==
X-CSE-MsgGUID: M0Icd22kRyWeORa9eTiY1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66878654"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="66878654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 12:44:51 -0800
X-CSE-ConnectionGUID: QgpyT1sGSRuP6zBmliuFpw==
X-CSE-MsgGUID: w5VTjx/jTOCm5i88GpCF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194609922"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 12:44:51 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 12:44:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 12:44:50 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 12:44:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaH68Y02mMuTNKRXlXDbUKMGaY60uyakeu+RYgqNfav14VXbgXZJHxyqTIer4bIufLaBywikGMYMdYj7/ydsobGVTymT/cnDa2hlMDJ18uDZ2AmB3qdWtAv5dXdghtmTVY++u+Ty6Vx/573WB0l7Q+XwpCVcigHKY26PGIqpwnIch6yTRfwJRMSdJ5h0J/VT/unGNf1huoDOv6lc0QNThgb/0aEp3pAuZyseu9sRpqKjLxCdNqVqSrBfTps3rcSwWESKIDIQVvdgRYbojE5kIhQW+FgAmR0F1BUXOa9PLlrj0CB+d06huT11akY3jedMIEMGS/mqYCCGrkQ5lwbiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok8rFD3sRvejIeLkGUcdDlF4eIDIlOigBQkHBrOaOrs=;
 b=nKW1oN5Kg1vFVXKaehy4HKberROR586aeETPLe2S2A7xy84ZySl5M0BxByY6qcWFD3zrLXAST+rBjEYiv1T6DXeDn+gWwevLvI17KY8WA5gDa/++ygakgSrw7NqdREwamsOeHTJarzfFDRL6g7f5gzNLzby7quAAli4lWLwWincbwd6lL9QbOj/wXLPjOd71Dz55QTKS/vx/o41rN6KE2il4FRN6JHl0NaKAfTbBWlblvEJ1ZvwVwdwiiuUea9jq7NhV18LKzD2/GgCeKH+4uNEIwb3nNNxRJbQ5HIE7dW49sJxSml7wlLtiN1X9eYR+DTxGMP5x+WOY4WcCdiR+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8358.namprd11.prod.outlook.com (2603:10b6:930:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 20:44:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 20:44:43 +0000
Date: Wed, 3 Dec 2025 12:44:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v7 4/9] drm/xe: Stop abusing DRM scheduler internals
Message-ID: <aTChOcJb1dTaD+e2@lstrano-desk.jf.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-5-matthew.brost@intel.com>
 <9bd6778fc3d22bad2b2f8adc6bb165134ef919e5.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bd6778fc3d22bad2b2f8adc6bb165134ef919e5.camel@redhat.com>
X-ClientProxiedBy: MW4PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:303:b9::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f72153-7c6c-42ff-5b24-08de32acc9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTJqR3Z3S3lCZXBLUklPL1ltYzRiVWNDK3FFTTFLeGtja2FxMnpIWVUwQWFM?=
 =?utf-8?B?QVFWL0ZJdHlUcWRTL0l2ejVtSW9acmx2dWp3TmdGcFVjUkJzK2ZRQmEvdlFk?=
 =?utf-8?B?US9YUHEwTTNHei9wMmM2WnYwWS9vbkhOaU82KzdlUzVBczhSYzZldUxOM0k5?=
 =?utf-8?B?RUIydXFsTjRtaHIvV1pBbXUxdjQrNmlYVW9YQkk5a0hpSGxMaHFFekZoamUv?=
 =?utf-8?B?U25FMGpkYk44TVUxd3hiMTBPTm0wK25CclZDU2o0c2JYTnJOYTBxVlRsS1VC?=
 =?utf-8?B?SjVwc2hPdldWMDliakZYRDYyNmJLSUNpaWdHbWJzVTRRamcraCtYVm9xaC80?=
 =?utf-8?B?OFduMnh5VVUzdTlQYUJ4MnlhV1EvdE9Ma1NuRTFzVGcxMUZhRnZKdER4aVhD?=
 =?utf-8?B?aDI5VnhhZXBmcFFxa2NmMTVla0h6Z1M4RkszbFUyNFlGSzBBajNtM2RTRS9q?=
 =?utf-8?B?RUtaZGx5RzRYaUkyYXVpZ3F6VXBsMm9CeEVSZHh0TnNtUVlpNlZFaDEvazc0?=
 =?utf-8?B?ZVljVXVrYlNOR0k4b0dVajRLSHo0SzZYOWZVUVYyR2RBd0t3YkF3RHpjeU8w?=
 =?utf-8?B?emlGckt6bWJjL2MydmljcTd1MnRNclZZR2ZvWjBQYy8reGtQUDUxdXB0WE1P?=
 =?utf-8?B?UnBrUW9JR05JMjhlay9xWXBmTGJuMjBaVkgxazkvdEEvN0F1dUsyL21Yb0tM?=
 =?utf-8?B?S2NyMnN0emhpUmZJRWhDclo1c0wvTzNYTDN1Vm1hU0dTc2pXOEsvN25ScDNz?=
 =?utf-8?B?cEIwaXpEWlNyMm9hUjBmYXJTN0NqNEw2SWhqeUNoajJiYncvYkM0VERRM2kw?=
 =?utf-8?B?VVR0ZVpwYlZISFVlZzVwbFJRUUxSMmdUdkI2clhqOEFsVkhPOG8wdnVNdzd6?=
 =?utf-8?B?VEdVRmtqa1ZLa2Vnc1pyV3hYZmdWemdsUHBnNUlxcjVXR3dqQXE0OFBvSHVE?=
 =?utf-8?B?L3lLTXIxcTNkK2EveFR6Tjg5MW9mc2RkV3VQZkdVVnpsQSsvTmVFaEZnVG9H?=
 =?utf-8?B?YlgrclBUaEVlWFo4bGpzNWhhRDVKZzVlalFPRDRqS1NMT3E0bXRnUlk3TzF5?=
 =?utf-8?B?djVCTFdiYytBb1lBT2VxM0VVb1NXaUpzWGk3UGJrbDVKYVVuc2dXVmpPUVht?=
 =?utf-8?B?c2dncEJvYW9aY2t0RXd3RjB5ek1JQUFaLzJMSWpGaEljaXc0RUxrQ01VS3hF?=
 =?utf-8?B?SU9lZ2VQRXo3WGlseWNweVI0eWtPUFV4MWovek1mb0RTK2JKQU4xVWdyR0JF?=
 =?utf-8?B?dERIcFIvcll1SGVieFJGcG1wN3gvZWg5M29JaDY0d1BGRjMvWndNUDlldUxX?=
 =?utf-8?B?b0U1QUh6RnU3UWhqdzZVa0MzZmlaeUFiRCtrb2FoZFZjQnZya0NkSDZpQkN6?=
 =?utf-8?B?RzM5L1VMa214U1RlWFFiMUhzZnpzY0JoaytKVFJwNGdaV29XWm9lSC9TZkFt?=
 =?utf-8?B?UVhNZFIyT2luYTdMZW5xQ0hhMVp3cm5NRCt6SnlNUUJnbWR2U2YwNXhpZ3VF?=
 =?utf-8?B?dXVRNkRuZm9EOUFFdCtIa2I5ckt1aTNDazdBRHFsTFBIdWM2dHE5ZDdPUDgr?=
 =?utf-8?B?ZXhWUkRnYktQT3IvYW12M0VuTTJWeDRFT1VqYzRnTkZYVDBCdFF0eHZoL3VG?=
 =?utf-8?B?aXRjRDRJeHY0R01aRnpraVYyRWg0M2E3L0FvRmdralJDUU9Cd2k5OWRRNmhP?=
 =?utf-8?B?cUZYNG5BZTN4Uk9ORkdESFlQRjJiZm9NMzJ1MkFRZE50bFJzRk1GaFRjSzZv?=
 =?utf-8?B?YmowZ1BwQ0tzaW1VbzRnQm95Q0NwRDlRWG1kaDNYU216WTdwMWxlNDBIK2x1?=
 =?utf-8?B?dVRoeGtENHJPSG1FVi95aGRBSVlCNFR4ckpIb09ZcjZmQVBQMTY4WUVCUDdq?=
 =?utf-8?B?TVVVMUw3dDFHRFdrVWRSVVRPMitUaWpFZmk1QnpBMm8rdlpETnl6NTdXSFJz?=
 =?utf-8?Q?NqiSd+dc25AL/RR3tfHGBvx1hLcSo8+f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xEZnFNODJHVjgreGZZdS8xM2JFa3AxTUZpN2V6WEVMSythYVI2MUtlV3RB?=
 =?utf-8?B?L2dyRGNER3BTamliT2RmcFdtRElHclZSMSt6ajdGYmZtT3ZHN0hkZDQ1S09K?=
 =?utf-8?B?cStKazVmMXZjWitkM0ViM2JpRkJ6dEZ1cldCOTdqbGpuaENnc1F2Qlh1NTMx?=
 =?utf-8?B?Q3ptZk1URGMwams3Q3ZEN2tUOUorRG1KL1lwWEg3cVF1UldqQXErVGwyZlFE?=
 =?utf-8?B?S1hzZWVmZmhKaUxRTC92WHFwTG5VVnFBTlJjUU5OdVljc09QT2NpUy9yTEZE?=
 =?utf-8?B?S3d4ZkR4K3Fqd2hXN3dXbFdBbUpST2t3MWg2UVBhb2dnSUh4dlRLNHd1S0lz?=
 =?utf-8?B?cnI1QTRhalpra3djcWpGYXdtYUt1Y0wyb2lwTHhRd2tRNWh4NDc5MHZOZHJR?=
 =?utf-8?B?VFRDUFJQSUNNWEcyNmNNK0JvcWQydTY0ckh5ZU4xRDdwOXRmVnc1Z0dXRVpr?=
 =?utf-8?B?T3U0Sy9OanNBZW1mQ1QwOGRGaXlmdnhmTVBtbmtBRHlIeTdVT0cxUmZnMnQx?=
 =?utf-8?B?Tmo1bUF0UzlqcjYyL1lkeWNiYW5aY3BzTk1UN3UxckVLclhCazlPWjh0a0p6?=
 =?utf-8?B?NVhWTXZRbVE0MmVXcVUvTWZRR0tWWTdnejBXYUpIUnNxRzIvQkdtbnl0TzQy?=
 =?utf-8?B?MkxMYk1uakV6YVJlYTBLRjlWWEs0UGIzK3ltOHFsUTNMYk9pUkx2VUpXV1Ir?=
 =?utf-8?B?T0NYeUNQTlByVUZHSDA3NTVaL3RFZWdwTldYTlRJdXhrVFVHamV0WjRlbjZ3?=
 =?utf-8?B?NEhOZU9LSnA1eFZBNW1XOUxVbXZqdDFyM2VnRlNwSlBudko4dXdCWWxQdDRS?=
 =?utf-8?B?N2F4YjlYZktqS0NpRUtwSXJoQllBWW5WRmc1WEhUSTNJMmp3Nkh6VG5EdHAw?=
 =?utf-8?B?VDU3b2pVU2UySG9WWWZ2dS96cjliai83WnlDT29WUTBDQUhmaytHdlcwOEM3?=
 =?utf-8?B?azB4MEtJbFJYM2cxT2MvOHVkeWtlQXQxdGVIUnM0ZFFnMm9aWTQ5eUN5bHRv?=
 =?utf-8?B?WFpjUDl5WWpBdGYzcXBnN0FJU25yOWZDV3RFRVFXSDZZc000TjJMd1N0bjVJ?=
 =?utf-8?B?NXgrdHdYSmlzWUJVeU1NUzJ3QWdnM295ZVBmM2Zock5RYXBNYm9xVVUvZGlv?=
 =?utf-8?B?eXBsVXRGUnVwd3hBbnBKdG1waEdjOTd6ZmF4TzZCRU9qV2JjL0E0STZOMVBY?=
 =?utf-8?B?Q3Y1bzZGR1d3eXh1QmVTNkdYcGxJYVlSWXpQazJpK3diQmdLZHo2dVk4b01G?=
 =?utf-8?B?WFllRHlWUXZvZXdoWWw0ajliM25pUWxwQlpvVFZRUkQ2NHFRcmhVL0dPY0po?=
 =?utf-8?B?Q3N2dm1QWDZJc2g0RnRiOFMxQk9oeEkyZ0psNjlEekFnNno1a2kxK3NmSTJy?=
 =?utf-8?B?K1QyYSt4UWE3NWNFZWpteWZFTzRTN3QyaCtueGx2ZE0zRFhkZlVvb0FDSEJr?=
 =?utf-8?B?aCtZak15QXBnYlRwNTJQMU1Gb253M1Era0xOWEtsaCtTNXZBNDM4bStNUG5K?=
 =?utf-8?B?MFFvSGk0QmpBakVETGJoMTBoTStYZmFkc0I3RlY1YjNNVjFESjNhTitsVjRJ?=
 =?utf-8?B?ckRsNHVkYUJYZ3Fod3FOaFVXZUV1WC84T0VycVdVdm9zRFFtcUFlaksrSjhr?=
 =?utf-8?B?b1Y0OW9hM1RhbkZXdDZTT25UQ2Qra1JjL1JMYlNaUlpoeVVBS1dBUU1PTC9u?=
 =?utf-8?B?c3VVOGdscXZ5dTNHODhmVnFHMjA3VFE5UStzcGVHV1JNRXY5Rmw4V0FOTmYx?=
 =?utf-8?B?SDlOVUFDdW11TEcyVy80dmhYSjJ1RFd5bHBmRmZEM1lRSFlBUmlQbWwzNzNa?=
 =?utf-8?B?cjA1ZS9hRjhLalAyUk05K3ZacTZlZlRLaytBTWt6SGZ3M2NTVXRxS3ZtZTNj?=
 =?utf-8?B?Rm5KcndRMGdDQkNRQ0NHYmZEZWxON1pNVE12ZzhMSmRlcXZVTXpFaEg5cnBv?=
 =?utf-8?B?cjJ4UzNudEtvelkrbkJoRGZKcUdpaTBkSzhXR1RwSVBhYmIzMWFMZlBRZnp1?=
 =?utf-8?B?dlUzSDM2UktrOEVrNFIyNjl6Y2Q3N1F6cEw4QUY5a3FSaUIwRUxaUC9mZC8z?=
 =?utf-8?B?MW9VUnlDaHFLNDRtejNQZDZQS0RIRUhtK1dUcks2M2pWSFhmaklGSVhRZzhq?=
 =?utf-8?B?eGVTcVkzMTEvaTJraEM5QXlBQloyWm95Qmh1MjlpQ0JoRElwZjBZbk9RK3lW?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f72153-7c6c-42ff-5b24-08de32acc9cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:44:43.6140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDMxj3/yPnY9aM5XC3atHMBbl9odbWcbX1TYIu0mquCjttqXQ0DylTaENydyaYhzqVxjJAE8hmjk2c8gF4EQMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8358
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

On Wed, Dec 03, 2025 at 11:56:01AM +0100, Philipp Stanner wrote:
> On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> > Use new pending job list iterator and new helper functions in Xe to
> > avoid reaching into DRM scheduler internals.
> 
> Cool.
> 
> Obviously this is your driver, but some comments below which you might
> want to take into account.
> 
> > 
> > Part of this change involves removing pending jobs debug information
> > from debugfs and devcoredump. As agreed, the pending job list should
> > only be accessed when the scheduler is stopped. However, it's not
> > straightforward to determine whether the scheduler is stopped from the
> > shared debugfs/devcoredump code path. Additionally, the pending job list
> > provides little useful information, as pending jobs can be inferred from
> > seqnos and ring head/tail positions. Therefore, this debug information
> > is being removed.
> 
> This reads a bit like a contradiction to the first sentence.
> 
> > 
> > v4:
> >  - Add comment around DRM_GPU_SCHED_STAT_NO_HANG (Niranjana)
> 
> Revision info for just one of 7 revisions?
> 

Only v4 changed.

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
> >  drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 33 ++--------
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 81 ++++++------------------
> >  drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
> >  drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
> >  drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
> >  6 files changed, 27 insertions(+), 120 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index f4f23317191f..9c8004d5dd91 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -7,7 +7,7 @@
> >  
> >  static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
> >  {
> > -	if (!READ_ONCE(sched->base.pause_submit))
> > +	if (!drm_sched_is_stopped(&sched->base))
> >  		queue_work(sched->base.submit_wq, &sched->work_process_msg);
> 
> Sharing the submit_wq is legal. But next-level cleanness would be if
> struct drm_gpu_scheduler's internal components wouldn't be touched.
> That's kind of a luxury request, though.
> 

Yes, perhaps a helper to extract the submit_wq too.

> >  }
> >  
> > @@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
> >  		container_of(w, struct xe_gpu_scheduler, work_process_msg);
> >  	struct xe_sched_msg *msg;
> >  
> > -	if (READ_ONCE(sched->base.pause_submit))
> > +	if (drm_sched_is_stopped(&sched->base))
> >  		return;
> >  
> >  	msg = xe_sched_get_msg(sched);
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index dceb2cd0ee5b..664c2db56af3 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -56,12 +56,9 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> >  	struct drm_sched_job *s_job;
> >  	bool restore_replay = false;
> >  
> > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > -		struct drm_sched_fence *s_fence = s_job->s_fence;
> > -		struct dma_fence *hw_fence = s_fence->parent;
> > -
> > +	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
> >  		restore_replay |= to_xe_sched_job(s_job)->restore_replay;
> > -		if (restore_replay || (hw_fence && !dma_fence_is_signaled(hw_fence)))
> > +		if (restore_replay || !drm_sched_job_is_signaled(s_job))
> 
> So that's where this function is needed. You check whether that job in
> the pending_list is signaled. 
> 

Yes, during GT reset flows (think a device level reset) it is possible
we stop the scheduler between the window of a job signaling but before
free_job is called. We want avoid resubmission of jobs which have
signaled.

> >  			sched->base.ops->run_job(s_job);
> 
> Aaaaaahm. So you invoke your own callback. But basically just to access
> the function pointer I suppose?
> 
> Since this is effectively your drm_sched_resubmit_jobs(), it is
> definitely desirable to provide a text book example of how to do resets
> so that others can follow your usage.
> 

Yes, but drm_sched_resubmit_jobs() does some nonsense with dma-fence
that I don’t need here. Honestly, I’m a little unsure what that is
actually doing. We also use this function during VF restore after
migration. This is a multi-step process that needs to operate on the
same set of jobs at each step of the restore. That’s what the
restore_replay variable represents—it marks a job at the very beginning
of the restore process, and each step along the way ensures execution
starts at that job. Techincally once we here in a VF restore jobs can
start signaling as the hardware is live. So some of this really is
vendor-specific.

> Can't you replace ops->run_job() with a call to your functions where
> you push the jobs to the ring, directly?
> 

Yes, we could, but that function isn’t currently exported. Also, in
future products, we may assign a different run_job vfunc based on
hardware generation or queue type. So using a vfunc here makes sense as
a bit of future-proofing. Of course, we could also have a DRM
scheduler-level helper that invokes run_job for us.

Matt

> 
> P.
> 
