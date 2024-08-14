Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7574A9510FB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 02:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B7410E411;
	Wed, 14 Aug 2024 00:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCpxH5+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4E410E3FA;
 Wed, 14 Aug 2024 00:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723594741; x=1755130741;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3DDb0bSwztUJIIe2FTNVy4hH+nqUNxrtg2ydz+zEVTc=;
 b=fCpxH5+pYuN6brcTKVrSqfQ1KBH5A/y4Bukwyds571EerdKqh2OqJwWn
 qmr3l/i2n/kvfXbKSqlTKBlEyIe/T0I7lH/9tSPxH8Vz1T3sewLmWekd2
 D88EXuPaSezZFd0N6wR8cvKiXSEqJiHD4hiKjdj4oXxzri6vK25TBNGR4
 d5eNzoKGsvUVZ04xlfB3TS7HAL1+VTpCVyN/dRGZSQ632046d33ctwQTx
 99fOcQtChAfvF4Ot+ezHsKDpYeRK2GRBkE2HpGFKAMgVNBndZLhK1wvTm
 OasJAYRBE8suoe+/QfWsy4A1KvpQwZcH4qyTtaW2az5Ov3MfbjUgp5+PZ Q==;
X-CSE-ConnectionGUID: q2x3VEUqSWS0s/UyJ41yTA==
X-CSE-MsgGUID: fWSbRuCuR1iqyephMhBDzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21657537"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="21657537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 17:19:00 -0700
X-CSE-ConnectionGUID: 9Uay79mTSuyVSQl91DzLdg==
X-CSE-MsgGUID: ND2xo1meRQylidPzSI5cpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="58830084"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 17:19:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 17:18:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 17:18:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 17:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpuIqTb6YA6R71TmKTtGB9OJtgDj+EtzfUhjqBkM5iHFu2la6EIyARAlb5VIRovlw657JfEk69nI3DEOuKfl8QqC/ZH3dJCmgdIxlIXRSiAeNwndOLU6JbfF5OSx15yQjmSwRFJyxuLsJnW86CArHHp5PfyFjFkVnRwK6oMb58nXG28OVpAcwFI96RAIipBgIJKYgAM1nSGeh1AM7esKQzwuNQgDENwPDoK6SHAvMU7RhWV+wHxt+HYnd2vHil9HwE+kTGPH7ojr8laiffNu3I/9gUD+Qk9nQBHDrFKvYktIl2KQAhew0AkiN1xugJ80SydKKMUmbciZsxluQmvVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaM6D0AY5C+rhZzz1J55SeENdter+NfY+yCi/0AMC3E=;
 b=PKJj64Q47E7GVkpQ1nFFKQd14uMUXtNbIW6jhJAIGaX4efSntVCl1e5EvaCyoQezVlvJPHBRKItw7SuZQ3I0vv7ypnF8PQEMrNuPhJdXhJNAtER1gFa2yD5BKS49v6+JnKbjSFRguTI1qEtmofnMaVCMjybRtX4qpkoJvqOMMdDPU9wDe0HMeSs9rvfosVH1XrVEvzDNSHZg1HqsEnEPtJ/C297eGbNzrttoJcy4E7xGrTif2XhhOGTrjgmYD3D1gF48Uq3eN538KGPXsRsBwxaD1FsGzBwuK3py6mcJmu88SjP3AOO/Lazf5l48XDhub1H4MSBcEGaWMMKtaMEncg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Wed, 14 Aug
 2024 00:18:56 +0000
Received: from BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987]) by BL1PR11MB5365.namprd11.prod.outlook.com
 ([fe80::8637:9cfc:1235:8987%7]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 00:18:56 +0000
Date: Wed, 14 Aug 2024 02:18:53 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, David Airlie <airlied@linux.ie>, Oded Gabbay
 <ogabbay@kernel.org>, Maxime Ripard <mripard@kernel.org>, Emil Velikov
 <emil.l.velikov@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, James Zhu <James.Zhu@amd.com>, Christian
 =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
Message-ID: <nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <CADnq5_NwDn5DXPadzZtegUJ=y=LfVHykO7kG3edmiqRTTCxMNQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NwDn5DXPadzZtegUJ=y=LfVHykO7kG3edmiqRTTCxMNQ@mail.gmail.com>
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To BL1PR11MB5365.namprd11.prod.outlook.com
 (2603:10b6:208:308::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5365:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6f5aa4-db88-43e0-921e-08dcbbf6af66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVpxUkNRK2psMWpQcWtKeCt4cVVITUVON0dPTGJDVGgvODUrZUdWTzRoTkxB?=
 =?utf-8?B?Q0hzOHIxQkRRSFVSOHRoOENsaDdrR0cwVmI1TWY1TWY0ZkEyNUFhb1JBb2hV?=
 =?utf-8?B?SGRQbEU4SFlrbFZYSEZJSGI3dW9SVW5tRWxNcTFINlZGVEc4OG1BdGJYaThp?=
 =?utf-8?B?YkNadG0ydEUvZDN2cC92SVp6dUZlQWs5ZWgzVWV5ZVB3b0RHNUZleXZYaWlU?=
 =?utf-8?B?ejE2TTc0ZFZYcXZGOExWRWxiZ0RNL1FyNlI3N3RhNVFmdmZJZlRKL0o5OXlp?=
 =?utf-8?B?N3BIZFJ3UTdGZlhndUx5Q1AzWVZRdTVvaUVRd0wxbi8xV2hkL291ZGtCOW8z?=
 =?utf-8?B?anRsTHZLeHJycHZMRU5xRm1CZkZ6cDdOdjdJSVVPblRNYVhyY28zRWx4Ti95?=
 =?utf-8?B?Y2NVZ3dLYjVuaFdTYUh3aG54ZGlVKzBFdm9QWHlJRlNsRENPc3FXNjNIQmNn?=
 =?utf-8?B?ZFlha3dPdGZXRktxc1JEVzlRbGNEcjJ2T0hJNm93VjIzOTl1WHpOdmgvaXp5?=
 =?utf-8?B?SWNodkZFbU9qRjNiRTgvRmNleW1UdUl4MTRBZWx5UFBLRTMrMTgzWjV1cERj?=
 =?utf-8?B?OWFUK05vUm9ia1R1TkMrTy9HM1lkdDdmMndqZ1hoMkl0RGpKZElBcU94djFS?=
 =?utf-8?B?S0JmZlZWZDExZmpoU2lDeFk2TUk5V2M0N1N6REZ3NzUzendSYjNsbSsvQWJO?=
 =?utf-8?B?Mzd3cHhBQ3pzR1V3a2NVcm1EampSaEV6RGJwM3JDUmNuWWM4RmFEZHVpOUVs?=
 =?utf-8?B?TjdPVEtDcWFxZ2IvREh3RnJlSHA2dzRCL1hPZ0xCOU93Q2xmQU5UTGRSYldy?=
 =?utf-8?B?d09tNmMxL0JCYk9nU00rUUpQUXg5bzZwSUk4cVB3alZtNnFIalJFeU13cThp?=
 =?utf-8?B?SnhESytqejhPaFEwTjhFeHE3SE9sdlFmdk1vYnlyOUtEMnhrMGk4NE5VdGhm?=
 =?utf-8?B?ejVwakM0TE9CRHk0WWtyLzlBQ2o5VFhNSkFiYXlMTVJOYjJ6Z3VtRE1oeGNJ?=
 =?utf-8?B?dk5DTEdpQlgyZi9uZExlT2lMdy90UExXUHk0ZFU2V21HaXdNU0tITldJUm82?=
 =?utf-8?B?RElHekVJdlk1RDFkbmFwQkViVUZEOWEyMVRxQlhNS3dQNC9nL2d6eC82YTFM?=
 =?utf-8?B?Q2hRUjdXSkRxQTY3dVZDV3lFY3dMaUdMclMvU3BrcHNxMXl3a0xBbkhrTFVG?=
 =?utf-8?B?TGdWT2hEV3picGZJbzhyRm8wbU40RVpERUFDR1h3dmVramI0ZDY2TldvZEFZ?=
 =?utf-8?B?MzRld2d3VGo1ZGw3TW1BRnU1MUR3WGFFdjZjbHBtN1ltSkFxSjhHSmRFMHNJ?=
 =?utf-8?B?RTc1cm85M011UWpiT0FvMFVRNUtrY3RwbkdNYy9vTWFnODRtNzNKOEp2Uk81?=
 =?utf-8?B?RDRQSHR0WXQrZnRiajZ3Z0hGRnl3dnQ3VnNIRlc1NFdPcTRKZDlvNUk0RXFa?=
 =?utf-8?B?RUxnREt5djVneWxCQUIyQjFWRjZmeUVobkN6dUk3R00wbUd2QjV4bE9GOXJP?=
 =?utf-8?B?Z0JVb2RRV2RTWDZOaGFnQms0ZWpqVHJackorZnJWQUN5SnpLc1B0T2Y2dXBp?=
 =?utf-8?B?U2Y5NE1iV0lyeU9YK2dJMHdnZGNPeUxUNm15QUN3MysvenJBTmhRd0hZUk5J?=
 =?utf-8?B?VWsxck83MklpZ0dKK2h5cnVYclRPUDRHRXNCZ0RHbHR2SHJCblJ2MlM5SmJ0?=
 =?utf-8?B?ZTY2TUhDdVNyejVoMkdya3pUS1czS25oSmN2OHE3eEQ4WEUxSjVLZnUxTzM3?=
 =?utf-8?B?eVdIOWY1SG5vWHBnVUwvbUh0MURpYXV3eTIrQ2VBenhYOTNZVE1VNDVaSC9J?=
 =?utf-8?B?d2RxbkhNNnJGZmlYbFFidz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDFRVUpReXVUMUIrL3ZIR2RyQlBUUG5ZKy9wQStpdEU0VTlibXdyVHp4M0NS?=
 =?utf-8?B?ZmY1WlkycXlUU1JVY0dCWnkyVUZ3RWlvS3hNZVIxN2hBNHBrdjNIdUtXRXRl?=
 =?utf-8?B?NlR4MmppMGtLMllSQ2h1WUtpRitXU1U2OGlXSVZrR3RpSEhkNmNiQWpYUmd5?=
 =?utf-8?B?dUZkckVSL0lxdUF3bjRpb3NiTzloSGY4bWh2RFZMbnN3RUp2OW5QMTkwaXA1?=
 =?utf-8?B?S05pSFNoVnhkc3BvcHUzdG1xQ0NMaDdGd3N5bG8rNnZRTmNCcU9HZkdlb0tS?=
 =?utf-8?B?YzRESXl6YzBFZ3FXbGt0TFJPS0VWNm5mU2M3K09Rcml3QTJtUmliYUE5NGZI?=
 =?utf-8?B?TUtjM3R0ZW1SZ042NmdoVnhHYzFZaVRQR2pEOTVQOVpteG9aOEtWdGE5a3hx?=
 =?utf-8?B?Z2d3cW9QMDdqc0thM2ozVUtKWERCN3ZjTzllcC91dGlmYXJBQjQ1cjZVdk9N?=
 =?utf-8?B?RTBQeVNmMXNvSm9TYUplQjk1Wk5JYncvUXFVTDNLcEtoTk8wYjE1T3c1blZv?=
 =?utf-8?B?eUFzU0c2R0Vud0J1QUdVTXZwNkd5RkFVcVh4RmczMldzbG9BOUE4dWorM1Yx?=
 =?utf-8?B?UCtST3ZEd2RBQm5mWEVISzRMOVNyeEV1dUpSSUVneHc4S05EWGRGN1czWTRr?=
 =?utf-8?B?eGFjbis0Y2ZnRDVETDgrRWtLZkZLKzVxNXJGOGk0dmZzczVLdWcrUDVsZnov?=
 =?utf-8?B?Ym42Q05DbHdJN1N0OXhDRUZzZGhOMU8rSjIxdXozTEpOU1JQZDdOSkJVWnNP?=
 =?utf-8?B?bk40a0FQYTdoMmZweEp6MzJCZTZzdnNCN1RQeWRhYjk2eFRzd1Y5TU8rTnJv?=
 =?utf-8?B?TWUxZUd5VUFGSEhjYkVQN3JkNnEzTHJYS2psam9tTi9XcW9kMWpBcXFRTkRE?=
 =?utf-8?B?NmdNc1JtM2crallsNFhVUWVwK3UwNjNOSlpPVmdLNHlxYmlEMjFra1Q2b1hm?=
 =?utf-8?B?bWpLcW5ZejRuNjR3R2JOM2I2S0JBTXR0ZkE2SXV4ODlpUVZ2ZHJUSm96VFAr?=
 =?utf-8?B?OSt6aWVlMUdsOWdZa0JZSEJFbmdTTTRaSUYwU0orQnFPMnhUWGNNUlhhUnZi?=
 =?utf-8?B?OWlLaFlsaEM1Y0MvV3h1Qlp0OHlmNktTK1Zoa2ZsT3lMU25uaHkzZzl4OGhM?=
 =?utf-8?B?S09BNmg3QjQvdHlyci9Uc2lhQnpSeGs2Q3dScDJsYzVIQnZmN0FhN0lzd0ZZ?=
 =?utf-8?B?RVAwYzNKTkV6bnM4TFFKNTdaeW02UDNPc0o0cG5XTlJmTDJybHU3VlBJQmNO?=
 =?utf-8?B?WTMvNU91R3pCTW9YbGxyaUhsRlI4R1R5QWpUbG5QdE45OUtsU1JJY253WFRN?=
 =?utf-8?B?blROaGRNTkI3aUVyT1dDRTVxZUk4NkZXYTl6cGtuSGtTQ09YTmYxeXA5S0Q4?=
 =?utf-8?B?aHZvazMweGVYY1dDRUgxNkVHYlQzem45OTBYWTh4MmE5WVJqZGtTM0Y0YjF2?=
 =?utf-8?B?UjkyTTVybXAwbVBHMzlWZGc2bVpSN1VnVlpEZUVVQkhiM1hRdHIyZUpQcDg0?=
 =?utf-8?B?eWI2UXQ1QVg0YWlEaGFpa1dCcnJYMmZzWTBkUDRLYWZGdHoveE83Njl1T3VX?=
 =?utf-8?B?dllkNjNyU1d6cmc1clY0T3ZrY2c2L3d6Y3A1QzdKYjFtQy8zczZRWU1EOFVm?=
 =?utf-8?B?M1B6bVYyNklCU3Jjbzd1RHdjNFd2bXNxT3psdHBKM1ZVZ3lyeHR5WWJXZ0lR?=
 =?utf-8?B?NkVmRlVhR0VmTzBocXhZM2JlWVdjOXFQUS91ZnI2c1kzbmErS041WkE1SFh1?=
 =?utf-8?B?WTd5WkpkaWZOYm9oZUI3OUE0ZGhMb1VvcGhyS3ZwRHhpWDhDWGJIcFVUcCt6?=
 =?utf-8?B?ZHA3S1RRWGR5cDNjSXIvMUlaVE5xTUh2NU03YS85K3dodXUwdkpBNFI4blZz?=
 =?utf-8?B?c3cwMS9hNStpUmg2WWdwUlJxa2lFNVdVeFhtSTJUZWlMM1Y0TDlickhXYW91?=
 =?utf-8?B?eEFoRlA2N0xzZmZ0Q2dkUnlPVENndFFUQi81dUxMZlJCNUpnNnUzMXZLUDZs?=
 =?utf-8?B?S010djJhZWhPSWljS0Q3NGY4MEdleG1HMmNUNnRDYXdTQzg4UEVoSmNOdzlU?=
 =?utf-8?B?WC9UamxycXdUNloxQjV3SXk2b3hZQUU2V1QxZjF6UFl6NlFiS2xrOXNLUC9a?=
 =?utf-8?B?NVN6V1IwWWo2UWFhb3ExV0Nsa1EwOUNUOVYwQUsvYWlZekVOYlpzajhuMm1X?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6f5aa4-db88-43e0-921e-08dcbbf6af66
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 00:18:56.0547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAarSzLlPCx6U3flCAAawy/5rOOsGrqV2gWad8vdD3jAmlJwEkC2Ic4L4G6/aHQVjvBlRNOldAIfPnAhaOmRtD1r/WUGqFLmQfFc9hVE0kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
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

On Mon, Aug 12, 2024 at 01:38:38PM GMT, Alex Deucher wrote:
> Are there any objections to this series?  We have been running into
> this limit as a problem for a while now on big servers.

I don't think there were any objections, just a general lack of
interest - so there are no R-b / Acks.
If you're interested to have a go at it - I can resend it.
It should still apply on latest drm-tip.

-Michał

> 
> Alex
> 
> On Mon, Jul 24, 2023 at 5:15 PM Michał Winiarski
> <michal.winiarski@intel.com> wrote:
> >
> > 64 DRM device nodes is not enough for everyone.
> > Upgrade it to ~512K (which definitely is more than enough).
> >
> > To allow testing userspace support for >64 devices, add additional DRM
> > modparam (force_extended_minors) which causes DRM to skip allocating minors
> > in 0-192 range.
> > Additionally - convert minors to use XArray instead of IDR to simplify the
> > locking.
> >
> > v1 -> v2:
> > Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
> >
> > v2 -> v3:
> > Don't use legacy scheme for >=192 minor range (Dave Airlie)
> > Add modparam for testing (Dave Airlie)
> > Add lockdep annotation for IDR (Daniel Vetter)
> >
> > v3 -> v4:
> > Convert from IDR to XArray (Matthew Wilcox)
> >
> > v4 -> v5:
> > Fixup IDR to XArray conversion (Matthew Wilcox)
> >
> > v5 -> v6:
> > Also convert Accel to XArray
> > Rename skip_legacy_minors to force_extended_minors
> >
> > Michał Winiarski (4):
> >   drm: Use XArray instead of IDR for minors
> >   accel: Use XArray instead of IDR for minors
> >   drm: Expand max DRM device number to full MINORBITS
> >   drm: Introduce force_extended_minors modparam
> >
> >  drivers/accel/drm_accel.c      | 110 +++------------------------------
> >  drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
> >  drivers/gpu/drm/drm_file.c     |   2 +-
> >  drivers/gpu/drm/drm_internal.h |   4 --
> >  include/drm/drm_accel.h        |  18 +-----
> >  include/drm/drm_file.h         |   5 ++
> >  6 files changed, 69 insertions(+), 175 deletions(-)
> >
> > --
> > 2.41.0
> >
