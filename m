Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B56D3AD3A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFD710E4B1;
	Mon, 19 Jan 2026 14:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJL9d+Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA07210E4B1;
 Mon, 19 Jan 2026 14:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768834583; x=1800370583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KhJJgMuZEjDJndzzv7tD1c8oa1xWLiJaibTBAAkbWmc=;
 b=LJL9d+LspVmmf4MPOHsgy3kh9/QKTHBahfoLYP9BQonXDfV9TCz/7Oee
 3h3dPJYHIElfnQyi60UubtSQXdR4Sy4sw/z2gJkAeVhxeATE9UvGBcTCE
 J10aYTxw7dH9laH6QbXo12E5LPwtq78nHSaR3YT0xa+VYphw63z1MGO5W
 Tje4ybj+j8Pk+8Iq3XDfb5UU3JdX16YyFAQgpjm9EcMQGUXVSLA79Wbqs
 V0GayAsv055OOAGjFgNZQUA7oUWS4jhtNa02Teo0P9nccfh7RjTCWHHdS
 qo9gvFnFf+eBH4NhVGSRhlXVXB8KhlNmwlL/2HalnmhyMN3y103iBoBdY g==;
X-CSE-ConnectionGUID: NKoRpsUsRguAb54bW2H+MA==
X-CSE-MsgGUID: DLPhtBVgRhyaqaO/RGUhiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95520116"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="95520116"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:56:22 -0800
X-CSE-ConnectionGUID: /drbFS+dTmSM6NV3GqR17Q==
X-CSE-MsgGUID: mEHxPuwhShi6Wtb7BLt14A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="243468945"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 06:56:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 06:56:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 06:56:21 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 06:56:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVSeqxaMPdWAYYDBbZ4is+R1AdskG1DltiQuKihYv9zaCiTrHtrYn99+CHKYm/kqHebiBWgma63EDxSDc0PqeZFNjMOuoBoZ0meMqEHHT58fH0R6MFcchXL71CTB4CbziMKL2hyjINy043fDtxVIkwYrBfcRl4HhIm8PtC0VgS7xZfiWCdCL5x1KshNZ71lqqIQ0M4EsJne8q6d1pziWl6r+htgVauBfVF8+wLhiu3Ea8+BQ6uePPZ2cPGOUTk2Brx/7T5htsI3Fw1GUYG9Pf9agBLZVqpPkLe0+33d9rC2im1hTc8O4E6YaNJpl3/9dluZGjcZNtS5L4Q/jWVcJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJftEuX4BvGtyjrJCAP07NkOAeOl+ieLp69r8prYZ20=;
 b=qsRy79PVc3AKdLRY4UfkXT0WJxyO4bdypG7w2/3tHXtcbxdQ2bUIE97dRgJUIFVUKJt3ThJNaoBEhX9RglqoYWHcZlzI8baKy7bkcpv/uoTJj9wOgYpIr13cdMhkYNn06C8w4YhFywjHRUHkB3vX3pFbSY2amvTTnOGTnoW3LCteINZ4yp+RUcG6OvFbjJMh8id2xpohMMPXoPLXCKRjeuuYXqcspdraxRe+RhEWHw1IOL1VBTwBcQCtXbeIFupz/QrZ6zTx0Q1Gx1YQnTUwWYVvfI/MUOb0e3+fJx5riUSTmh8f23gi4BwP6s+4ytUtcjuc2VgK0Rlm6TPDMVYkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by BL4PR11MB8847.namprd11.prod.outlook.com (2603:10b6:208:5a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 14:56:19 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:56:17 +0000
Date: Mon, 19 Jan 2026 14:56:06 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Message-ID: <iblv3rpsvbxv5eic6i6nneanqdovuloprnksyxxgvkz5miwmdu@7usprrsui25o>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
 <3333011.vfdyTQepKt@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3333011.vfdyTQepKt@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|BL4PR11MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: cffe3d8e-954b-4c6d-af69-08de576ae5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUozYWYwRXJFcDZnbVhSK25LTWIrbnhZbC9YNmE2TXhUa2t4WGdNMXFLMGZm?=
 =?utf-8?B?Y1pYQ1dZTWkwdlhtNXByQkRCQkxTaU5VVEFxbC80TWJpWitwUlNjU1lLMUNq?=
 =?utf-8?B?Y09yYVlBZDZUT1l3dDcvWGdmVFU4aUdVdGwvMjVvZmhmWHlGOXlRRWFaMHRz?=
 =?utf-8?B?U0NpM3F0ZzdHT0hLZ2N1MkVVRWx3VXl0U2MvL1ExelVkNTh4dkxERHVBTXJI?=
 =?utf-8?B?TjNzS25hL01aekN6TkZCZUh1OFNFTGZGMDJpTExsNG1aV0NHZXkwL2N4OCtn?=
 =?utf-8?B?bCtXM3VyejJCOFJoY3lBMHFCbUVFZGI1cExLcXNndnJtTnlBa3VqcXkxd0J3?=
 =?utf-8?B?bWl0TlRId0FhVTlUeWNNK3RwazBwTVdEazhyWStZUldKYXVaaUpjRGFpRmJr?=
 =?utf-8?B?T3lJb0xKc1JiUHJGSUxOOFRXVzhWMHVzNXQxaTM2SkV1cFJ5YW55S0lkKzBu?=
 =?utf-8?B?QTdTSkU3akswUE5EQklOTE5hajBYMXV3Q0dDeThUWVdBeVJuRmxzWkFjVTlt?=
 =?utf-8?B?dDhRNGNyb0NwVEtLY2JKWjliSGJ1MW9OWFVUYzRnL1dIeTY1WEVPaFNnL3E0?=
 =?utf-8?B?bDZpc2JGZGlXcE0xaUU5YXJUTmRweHZRRis2VnZxY2R0VVFuUzB6cUNwY0l5?=
 =?utf-8?B?Lzd3b0VhbnNIQUcrcWY1M0FYN0hiWjZ4OFZlYWUzOWtReTdtSGVVcnJQYlBo?=
 =?utf-8?B?WGxUOG9ab05Ja29kV1FreEk3Y05ualBhN25LZW5BS1duZzM5RDZpem9IcUZw?=
 =?utf-8?B?K040eVVVSDluZ0lLNjFtOHVmelo5U1FZV0t1NE1Nb1lyRnpvaTJ2alVvR0hF?=
 =?utf-8?B?blpMbUdmTDA0Q0FZZ3NjSnp3dTJtZzQ5S0V1Q0dhWlBtcnRpVkVPb0xnY3U1?=
 =?utf-8?B?UTRVMklzZjNmZE1QUVhUd0hxa3BIVEZRYW9vWDZMeWNHVU50ak9ENU43U1cx?=
 =?utf-8?B?UWJWVGNmc0NXTjMyQ05GMFZINGJyU1RTejdTcGM3SlBWWG11Y0NHbDV1MXJS?=
 =?utf-8?B?ZG9hd0xJWW42emNsTEhKWkJvYUxIS0xOaEVJSzNaL0JhWW5GL09pckdsN0lD?=
 =?utf-8?B?dHZBQmpsb2lPSHA5V0F4SUhidS9xVVFYZVNjV1RUVjJJQmFNT1d4aXVxUmZX?=
 =?utf-8?B?am53clVObW5WKzZDcHBWK3R2VFZpSGpuN2xkdTVIQ2lUL0NQTGNQc0tUcmpS?=
 =?utf-8?B?YUtnWVZ2WllzN0tVRVNZOFFPem1DVm5tRFE0NVNGc3JXVzROL0k4SFEybi9a?=
 =?utf-8?B?YzVKVHVOalVSbDBueFlIbG44Q3lCblZtd3V6RHhBSlNGSXV3L1F6MDBOQitG?=
 =?utf-8?B?dWRqQWRqUUZMMjZ4Z3BrTjdCWkxKRGxDOVhmQ2lPZWZjb1lMSVhTS3dpQ1N4?=
 =?utf-8?B?blVoSktuRWpvbHFsTlBsWGt5dFZGa2RvUjhsWEdBbkMxQndpU1Q1VmZwVEdp?=
 =?utf-8?B?ZWdNUlg2RjRrZko3Y3VZOXZQZVlDVzkvd3VzeEhlZDNtaFRnbTBPQ0dKS2Fo?=
 =?utf-8?B?dUFsYU1yREI4cTZnMTRYUE9CbzBFb3JGSUhYcDNHOWU2UUV5aVpNZmg2OGN5?=
 =?utf-8?B?UlBzVk44QTNPTW9xMG02TmVRdGJvN0wrYk05TmVtbWJLMTB1UG9QQkVMYUov?=
 =?utf-8?B?S25Ea2RaZTc5TVpneTBadWE4M05BS3hvSk9CUUNjZEt4cTlFRnBBNCtsRWg1?=
 =?utf-8?B?cWJGL256b1FHTkg5T0NQQ28rR1Vza1lKVk9wcXdWTHprTEIvNlJ4RDRZYzNM?=
 =?utf-8?B?andRaGI4Q0phQjVlN0J1M1lQb2pMYjhaeFc0M213UlRKcU5ubTN3c29DcTZE?=
 =?utf-8?B?Mk9WN3o1dHhSbUQ2Tkd0ZVQrYlNKTTJvV2UzTVRTdm5CQkdURVJLN0crUUVK?=
 =?utf-8?B?b2ZGMjljSi80SHJmdTl1eGVzZERTOFRITVJrbEtZSDkrdHkzOTAxZnpmQ2FN?=
 =?utf-8?B?eGVtY3RKVU83akpNbDdySUQya2VCN010KzFZL040eHAxbE5VWGh4a1dIZmNP?=
 =?utf-8?B?aXBHM1VjTWcya2RuZ3VxT2U5c3FSNUFhUENMVnU3TmkvZWltUGJCWGwwMkMr?=
 =?utf-8?Q?s4/jf3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1BZREtDY1NFYWlpYUFqb2NaQUI5ektZZnE3KzBLOHJSUHJHSkdLOUQ5YTI0?=
 =?utf-8?B?Vm5JbVpuL29uc3VxVEt0Tk9OV3JEUDZ2OUhsUjRCRldvVVhTalVnZ2RPYm5D?=
 =?utf-8?B?Y0d3Zjhma01EeDdzTlpCVDcyK0FFTHJoeWY0d2VZZElrTTl1YzF2d2duRTJz?=
 =?utf-8?B?TnB2YkdDS1hWOHExNXhLYXdJbFlOUGpkZFk1RVBCdjRpQktNem1IVldMZ0FM?=
 =?utf-8?B?eUZtNjl2OGhWWVZCR0lITEU4ZUhqNllzYU9CeW92Kys4SmpPL25nUEkrNmlD?=
 =?utf-8?B?cjlWOC9XV0I3dGFEWTlMVzZVYXhlTk5ZOVBPNk1FZ20xTFp1UVAwdlZpUTRz?=
 =?utf-8?B?RnJ3K2d4elFrakFDRTFzbzQySzN0ejZEVStSd0ZBZmNRWWdYWk1zWGlVd0JL?=
 =?utf-8?B?cG1hNi9tSStHK3NZRzlDeVlqOEFvbmJNYWdVM3pnT3ZJTjlJNlQycVF0Zlg4?=
 =?utf-8?B?R1A0OTdWZUNJdnIzdUpJRUNwYm9MK09telRnQ1FMTWJyRWFNTW00ajhIckdR?=
 =?utf-8?B?UWI0alg5Qm51MFdSZ2hpSmRiM3VZZTN4b0JseXNSR1hXdi9iUlRNajRDQ25Z?=
 =?utf-8?B?ai9kN0ZnaUZxMU5hbEtaR3orY2VteHRMY3QyUkxPZ1FEbmRaYy9OZEtkWHRZ?=
 =?utf-8?B?UmFRa0tRK1FYd2lKVi9wSFZlNmlKbTBwQTRZR2Q1RDQ0d2tvMVFheEFZU251?=
 =?utf-8?B?cklScUFoSnVLdkFxTFc5a1RwMDlLU2NEa2orVkdWa1ltZy9MdUtCdDBVVyto?=
 =?utf-8?B?YmcwdFdqazJTcVFzWWo3MDNvYmF0YXcydHhUczgxTmJJQnhJYzZuRER2cEdP?=
 =?utf-8?B?OWF2TXhvVFEvQVk2dFIrZWtuL1gyY1prQU96ZUdMQms5Nk1XanZIOEU1bnNh?=
 =?utf-8?B?Nk5KYjZPQlpvQ1JCWURDTW9ySktOTTdvbUJTMUJ6cmN1Q3pUYUNMQkJpNXdj?=
 =?utf-8?B?Y0RvRmNKSTZjMWg4c2ZvY0VzRy9xZjQvVkZ0SG5FSnRQbkFUT21la0diaGJR?=
 =?utf-8?B?cVZBbUlPVXc5MHU5ZXJpZVRxUVhVenVPK0wrb1pPQktJb3lBa0hPQk5hNG1C?=
 =?utf-8?B?enBJamhnMGFwaml4OVJYM1ZoeGdTM3p3QjFoa3lSTTNrWi9oTmtwd2EvdkVD?=
 =?utf-8?B?THRxYVVsampyTTNTSWJRd3JsejNkVGRhN2N4ck5vQTRlS2owVDAvTHZtUnMv?=
 =?utf-8?B?alZLWFFkNHJFcFBrRHZiRDFvZUk3SE0ydC9GQ014cGx0WGhERUJoWjVKekI0?=
 =?utf-8?B?SGxBODZ6a3YwMXQ2NWo2ZkZNUTQ4cVc3NThQNEsrSE5NWEpIcWJxK291K243?=
 =?utf-8?B?ZGhkNlBRdDMreldrYzRPaWs4cFI3TUdiREt0T29HUlFmL2JmZnF5TW1uN0Ny?=
 =?utf-8?B?ZFJjS1ozdWdhdUxtcUhDSFFObmQ2bEc2bkQwZlFHaGhQZkhLajFYVlhSb3FV?=
 =?utf-8?B?ZWxEaTh5KzdFdmJWLzk3dngwL0FWUDMxQ2svOHdTVmkvNG03bVpmVjBiUVp0?=
 =?utf-8?B?anM3c1dmRm8xVHh2VUhydlNjdk54bWEvVWZ5dStWUktQRnBWc3MvblFBa0FX?=
 =?utf-8?B?dTVjUEJLb0JxU3o4WGlUcUdkWXhTOXdONjFjVU5uZk93MXBMVG9CSk5KYnpp?=
 =?utf-8?B?WmZrZGpZTVVBZjBYM29MS2xvSVh4b1NlRlVPTWNWVGUxMURlNXZQRlRzZk1S?=
 =?utf-8?B?WDEzMnJ1ME1PdVRKZ00xSGl6WjZvdHY2TWh0M1djaVlOc2VpaWZ4bzFpc3NF?=
 =?utf-8?B?U1U2ZnlTT21IbWZrYjlYbG5NZDlZaDBXcENOeVpJWVVtSk80S1NrK3BSUUlZ?=
 =?utf-8?B?S0pHc0tCU0JGS0JWUlR3S3NicmFnS2hCcHlmS3AzOHlqbmhUOUt0QktMT2lZ?=
 =?utf-8?B?MlZMVStYcFQrd21FbDc4TGtIa29UbFlhS2ZzSjZXSU1wbVhiOERVNGxZL3VI?=
 =?utf-8?B?S1dIOFNyTjArazc1TW1KVlVUVVFKMkpGbzRvcURsbVZ5cFBUZ0dydDZDallE?=
 =?utf-8?B?RzJyQ05SZlA0Smt5eG5kSjQ1UjY2K2lPYlhFYUxuYjdkMWNJQUY3ai9PU2VS?=
 =?utf-8?B?RnZ5KzF3T3hLMFo4TmNGZmdKbTNLRXYybDltUXVMWGdhWlBqcjhxdG1QbGMv?=
 =?utf-8?B?RkJweldhekhVam5FRENCTHJ6Zm1vMkpBbHdvbHlxN1lFNit3eUw5WlEvTTZE?=
 =?utf-8?B?MlBDZkExYnlpaklTMWFrUmdvVGlGTHVNUE9hOU9yRTE3allPTll0QTVMM3BB?=
 =?utf-8?B?c0FIQVRNK0ZucmVkYnFRSTRHVHR2WG5jVjdMVUxRL1ZIRjE1T05uSXpsb0ZE?=
 =?utf-8?B?VldjZFNpYUhnVTZHYTFzQlR6M0taS2ZFd1kya1IvMWNiazVZRWY5bnlvakhy?=
 =?utf-8?Q?ZDOzRGOMC91RiCMw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cffe3d8e-954b-4c6d-af69-08de576ae5a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:56:17.3267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zl1bP7HFtn9Mt4bov2+tRtwicu78AJq53p25qkSOXyvlZX2gcOy1uw3+P+TZtvvqpYEq6cirwB5gpo1lBPoc1QKB3obYPLhSLpWv4gbaDo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8847
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

> Hi Krzysztof,
> 
> On Monday, 19 January 2026 11:16:02 CET Krzysztof Karas wrote:
> > IGT mmap testing in i915 uses current task's address space to
> > allocate new userspace mapping, without registering real user
> > for that address space in mm_struct.
> > 
> > It was observed that mm->mm_users would occasionally drop to 0
> > during tests, which reaped userspace mappings, further leading
> > to failures upon reading from userland memory.
> > 
> > Prevent this by artificially increasing mm_users counter for the
> > duration of the test.
> > 
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> > Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> > ---
> > During testing I also found out that this problem affects
> > another function, __igt_mmap(), which also utilizes userspace
> > VMAs.
> > 
> > v2:
> >  * use mmget/mmput() (Jani);
> >  * include __igt_mmap() in the scope;
> >  * change comments and commit message;
> > 
> >  .../drm/i915/gem/selftests/i915_gem_mman.c    | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > index 0d250d57496a..82ab090f66c8 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > @@ -916,6 +916,13 @@ static int __igt_mmap(struct drm_i915_private *i915,
> >  	if (err)
> >  		return err;
> >  
> > +	/*
> > +	 * Get a reference to tasks's mm_struct to artificially increase mm_users
> > +	 * and ensure the kernel does not try to clean up the userspace mappings
> > +	 * of the current task during the test.
> > +	 */
> > +	mmget_not_zero(current->mm);
> 
> What happens if that fails?
This cannot really fail, it may return false, if no other
references are currently held, which has its own implication
that I overlooked:
if mmget_not_zero() returns false, then we probably should not
call mmput().

On the other hand, I observed that the issue does not occur if
mm_users is 0 since the beginning. The problem only arises when
we go from mm_users == 1 to mm_users == 0.

However, I think it would be better to use unconditional mmget()
to better show our intentions and ensure no tampering with
userspace takes place (if the test works with mm_users == 0 and
with mm_users > 0, as long as the condition remains unchanged
throughout the test, then we could force the latter to ensure
stable userspace state accross every test run).

This was a bit lenghty, but does it answer your question?

-- 
Best Regards,
Krzysztof
