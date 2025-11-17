Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D53C63211
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372A010E309;
	Mon, 17 Nov 2025 09:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhc/hRM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8448710E309;
 Mon, 17 Nov 2025 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763371224; x=1794907224;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WvUM0zhPUnFGF5X44wA0cPR38sXf3Ya6xk7VFDK+jy0=;
 b=nhc/hRM+puswJED3kYJZrNEABXat8vSMU0XzP85p231sK2idCLDoZv50
 HT04ISyenQN+ddoO6yYfxSJHymvqseNNWoAisBFPwMgnvUiw0t1GBC0kA
 5Sdn1mxdz20UHfZCpg5lyRONdOmhPeyUQU0x7plV5kPVjrEMhg8oNCXHN
 DnPyteBHEGrAbrKyADDW+zVGz51OH44J7dUG8wd+J9snRGLGuO0Iw+MoA
 bAAUCNufQ4tvdpDu7U+ub13SKsojZ2WQHxgcNbM+G7LvuF6YZS0TndjBO
 vnrEulGtTRlf2nBUauRZW389uYM3H0uERQU72jq6VDp7ovQPEIIfLmHlL Q==;
X-CSE-ConnectionGUID: IoTNpyLFQnyT9Ru01GfnBA==
X-CSE-MsgGUID: VMNni9uRTka+f8+KY9N6ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65518245"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65518245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:20:21 -0800
X-CSE-ConnectionGUID: 0QX7ryc7TF+KZKIfV6QN+g==
X-CSE-MsgGUID: i81anTuOS1W5X8ZmOBZPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="189698149"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:20:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:20:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 01:20:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:20:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXMZX8atEFi0xnsoBF7UW4qTpjgLC8AQ9FtJHusyuGaJujNY9wCVvlT10hIQWo2Bem5dZhK7+bfXYnOz+8wYpiZv3xIrp0x0mC16UKBQx7cLcKPVYUTsJ7QQ3dZDvFoX78PgsGnmNLkMeXEB4RVYO7tOGjL+ogQnXj6JrvG8/+DEyQ97L0lqmvz6Bqun6dIYps5q1Rrm1bX/+2n8xtdDZUJf4lOl4zlaahIKgB4mWgckQHxzSeH+nPJ1SMNv94XL/0npg3DCFb8QqGK5Wk+k+ZQUEG86PEl998dyQSzWADwowAhPqhizyYb0NbN3yIQ9858zXTMmua84UAReDR4Lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvUM0zhPUnFGF5X44wA0cPR38sXf3Ya6xk7VFDK+jy0=;
 b=WO3IpHL/ZyCAQ+/wlCkbhbLXeI4uNcDIVfniw560dS/C68nWUihhE6WC3O3JsR5t1h5ukQGTKc29x8+Na2oI/nnvzR1fBVnXR2S5jBkQNWlXu/mItPiWA86HYvfxNww/7MYtaf4/sGlCWhMTxWHu3gINvoBfi+EdzgQX7HrHKDm5oL1CIwxiTiOYDb0N0b3+UR/RQa9lk/cPc3D5V4qgVNFMAn266T43/lG8zqo0r3ASc7epn+b2RGFddd3JiOxJs+uDll79mv5BwMHQR/aYYkwxHEKUTkRojg7HaOBFcdCfHLGo8Dk2u1J7hGNjKrv4wORkH8BDSg759SJ1GwS+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM6PR11MB4580.namprd11.prod.outlook.com
 (2603:10b6:5:2af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 09:20:15 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:20:15 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v4 05/10] drm/i915/alpm: Auxless wake time calculation for
 Xe3p
Thread-Topic: [PATCH v4 05/10] drm/i915/alpm: Auxless wake time calculation
 for Xe3p
Thread-Index: AQHcVJkeCpXo+gYYKku7c6q003bGtLT2lXrQ
Date: Mon, 17 Nov 2025 09:20:14 +0000
Message-ID: <DM3PPF208195D8D3F4BCC7EB56041E588D1E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-6-animesh.manna@intel.com>
In-Reply-To: <20251113120119.1437955-6-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM6PR11MB4580:EE_
x-ms-office365-filtering-correlation-id: 9a06be57-4316-469d-2c2e-08de25ba8481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZEVhWTI5NXEvaHRMbzM4WXV5V1ozckFaRjBTSkpzTkw1K0pFVHlEUnVEUDNl?=
 =?utf-8?B?VjlwRWQrY3d6RlpqQU5OZ0FjYkpGV1ZwV1VISXFKclNjSE4zZVJERnAyT0cz?=
 =?utf-8?B?UHJ0RFdiZVdMNzQ5cFhjVktvRE02T1NRc1N6Nm5nWlFyWXFjSWlkZWhDV0dS?=
 =?utf-8?B?WjNYeTVsRTNNT3JvYXdoQWRTR2ZoQVcrOXo0U3NIQTZ6bXpWVDA4cnE5YnRO?=
 =?utf-8?B?ejZhbXR6S09kd3YxTHptZmJYMGcwQmd0MWgyWDgyYkl2VlNlSmtZbU1NdmRM?=
 =?utf-8?B?TGl6WUtMNmRTdGdpNWlJcFplYVNROVA4a0FGTnpmeDhpMWR3cHZESVBWMVgv?=
 =?utf-8?B?VWQyNUMyZTl3TXRhVzRNVTMyNFFBbFdZNk83RWY0VldWcEJzMmtsZythTWl3?=
 =?utf-8?B?TlpKZWlpS3JxS3dNY0dwUXdrMGNPZHZPUGRTQytyZkVEYW11WVo1SUtIWlha?=
 =?utf-8?B?YUpvbForcEo5VnNSSGFuQVpHMVVlbjg5VmtZdGJLNEUrWEFMUHcxMlJxNEVu?=
 =?utf-8?B?TWh3UE1wVEQwazZKdFQ2QXduSmhkdnNucE5rTEdrenArejJhNjkyVEw3RjRV?=
 =?utf-8?B?MWZCbElsK1F0T1g1VTlLSmZZY1ozd0tPU1JQUTZyOVVUZHU0L0Q2TTA1aU1E?=
 =?utf-8?B?eHlHQmc1U1hlTDZHZmdVTml2WmlFQnRab2U4bGpkekJNTHEvQmkrK2NVN2Fj?=
 =?utf-8?B?cldrWVcwdXBlbzMrcncvaGJldFExWVR3Mlo4Q0FvaWZLTG0rUGt1cDNMTmE5?=
 =?utf-8?B?ZXVMUG0rNFhETlhieWVubkZGc3JrRmFrR3YxZkNTZ3hERXFvYXhLRG10ZHlF?=
 =?utf-8?B?TVBwUFl6ZkFXQm96QitDbW15eEVqdTJzZVBFVlRlOWhUMDlhdlJlKzREVTVP?=
 =?utf-8?B?MzVHdXZMSzhpdzdQdzBsSDNtUVdodHZmQ3pGemloeEdIbktHKy9WSkYxaGNN?=
 =?utf-8?B?NEczSU9KaFNYTkFjNXZib0tWUERlMFdScVVUOHJjQXFDSDFCdkVZeWt6OUtQ?=
 =?utf-8?B?bURmaHVValpmTkVtdHptd3k2LzFWZE1zdFIzQXJQVFVtNVp1UnZvbnBoMTBn?=
 =?utf-8?B?aHkzKzhMb1AwU2FvWkxzdDdCbHJHTks4UWRSSHJhOEgzeTBaV3pTNnN5bm11?=
 =?utf-8?B?Rngwc2xFZXJLZTB4aEFIWEkzUHAwd2xrZWJNTTBCWGJaOW9ZVFhoQldBYm9Z?=
 =?utf-8?B?aDRjUE92TEY1WHFBZGJDNTVPRTVjNjhEU3cxMytPUmUwZE5mUUtQTVFSMURx?=
 =?utf-8?B?QTg1ek1xVjc1QmJsMjBuZ2F1a3YwTkFObmhTRGh1RFpqdUhOc0RRYTJvY0pF?=
 =?utf-8?B?Rk9PL0RLQW43U08zdnVqcW9XbU0yWmYxSVpxR29WcElWQ1h1RHppQUw3Ymxx?=
 =?utf-8?B?YjRuU0ZqZzFJQkRYa0poZzBNYW04YnNNQmZmWFB4TmZPMWZhRlVZczhFcmxm?=
 =?utf-8?B?azQzWHhIWW44dUpvZS9ibVdZTkwxNnBEdnh0YTcxUDB2Smh4SG4rZ3p3RUhI?=
 =?utf-8?B?YjR3aE4vdHdMc0JQRms0Ylo1emY5K3N2RVRjK0IrWjBUZ21uWjFYalZlYnBF?=
 =?utf-8?B?VTkxSzI3bkg5NXo4WnovbVlWV2dPRVpxS01tdHQzak9Lbmx6bmRjMEV5dXRx?=
 =?utf-8?B?RFhhM0k1TnRxb2NkOElkdUdXUS9YRmdub25NaXhQVy9mR3MyR1lxMUdlZm5S?=
 =?utf-8?B?T2lmZ2tQVWJRcjZvT0lFektFV3pGZGozMVc2RDVneElFMVBPbWRXMFlTMHVu?=
 =?utf-8?B?N2RadFhudkdPYTJVL3k0ZXI4N0R6VnJpSUZiWVhUSU9lRFVXVlo4cHQ0ZFg5?=
 =?utf-8?B?T0x1eFFmQkxzbGJqOExTUU1hRGpXbkxsL3RvUzZZZlVBNlF1MzVKdHRTK0ZT?=
 =?utf-8?B?ZmhTVTQzd0Z1aEFpaFNVMGg3QUM2MTFFekxLR1RDR1lnYWlMUlJuZGxwemNH?=
 =?utf-8?B?cEJXQzBuTTdQeXV2VCtSdERzeE1Ha2hrazVkQjkwQnlqbUVWUHJ3QVFIcUhu?=
 =?utf-8?B?QmFqc284cVN0RGtiSm10TlhySTBUUHV3UlVDU0ViTTZyVittTmt3cmNPWDZO?=
 =?utf-8?Q?+j2qQ4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFBNSnJUTDdEWHJFNXBjdVlCRGpRbGx4MWwwL2VCVmxxOFhzQzRFQ0NHaEJP?=
 =?utf-8?B?clI0KzNaL2xYRHhPYjlZYVBTTFJBNXpYQkY1YXBCajU3dHJkdm1sZzZYOERq?=
 =?utf-8?B?QVlDR2U3aHl6Tm9qUHpJNDdOOFI2SVVyVk8wQzZMMTVTUEoraER0eExFaU1B?=
 =?utf-8?B?ZVVROW92d0Fsb3hpRDBGWW5hUmIvNXo5RTk5bG1mTVJ5dFMxSlJORnJjL3hS?=
 =?utf-8?B?QnZScHNSYXZXRWdnbUFPV09idG5sQldSUmNrSFBac3ZyUE1lZW02Q2dDa1VK?=
 =?utf-8?B?VWJpN0FTL0V6L3RNbk1IeEthTmhlSXFxNFgyczBNTFZ0VWtZKzhDMlZMZFk5?=
 =?utf-8?B?bGQ5VE0wTWdWWU5BZWYzemtzOU8zdVM5Z3VLVGlLNktjZGN4ZG90ZzVuVkZY?=
 =?utf-8?B?b1pxUFNqTnUrbkhZWi96ZWY0R0hSRm8vOVk3eFBLWE9jWU8rNy83K1JjMytN?=
 =?utf-8?B?NWRzNEY5QUhzRkgxQkR4ckpTQU05NzIyUkNDY0w5UmsyR3Blb2pSQTNaTUxZ?=
 =?utf-8?B?dVBlQnA4NER2bGsyS1ZyZHlJd2wvaUJHbnM2NGVZaFRyRWZMSGYvVzQ3WDlX?=
 =?utf-8?B?YVo1WHdvNW9tN1pPY25nNUF4WFhlOG8zS216UGI2d2pmWU4vTUlSckZoWVhk?=
 =?utf-8?B?aWU5TmkrY2E1aEIyK3EwQzZMTEFYNlhDdmFuUjFFclg2VThHM21DTGdKTXNp?=
 =?utf-8?B?UkxUVHljWDhXeE12TDZJUStCbEdZQVdDcU5Bdng2S0RwMk5jaU5DbVFyK1Rj?=
 =?utf-8?B?WE1ZKzlUTHFXeDhReWlTem5ya1F5clBiU0F3MWVrU1Z0TmhJbHhzY3BqaFhZ?=
 =?utf-8?B?bllNMVlNcThadnU3dFJvMWFqOWlMV3BaRFpIK1dkckhYeEhTQi9pNTg3Sjcw?=
 =?utf-8?B?SkdMS25UeXdJQS9ZY2huQ0l5Znd1WmhNZXlxTjVmenVYZlVrSXhoaWcrY0tP?=
 =?utf-8?B?bW14SHE1NXovVHhDY1JuSUpnUURwMlRzU1NVOFF1am9LYzlnakQwZTc2SklN?=
 =?utf-8?B?bVNaTEdiY3RqY3dPU0pWRlJmVWlSMk4yY2tqTGcydXh6VFA5UklJeVFWS0NT?=
 =?utf-8?B?NFBZV3pHcEpuUFdVQTdWa3pHNUh1R3d4RjdKYTlkYUN6RU5ER1lHYm9NYUtB?=
 =?utf-8?B?Z0JWSWdqN3RjTk9QZDllM3B2aCt5ZDYwdUpBNFZ5R0hPcHhJWHBqNlQvR3JP?=
 =?utf-8?B?NXVUSEhidVVGUWhEYnNpOTkwRVhhRVo5OXNTYkkvQVp6c2NtZnI3d0cxN3Mv?=
 =?utf-8?B?bnNXQ0o5eXgrdFBiajdLaEN2THExMW55SzVhdm1uRG1mS2xGanArNEdCeXZo?=
 =?utf-8?B?UUl3MTB5ZEtkc3lwdmFsRGQ0TGo4MW90QmVNREJmemNZbnpWZm9udFVsRmsr?=
 =?utf-8?B?UkYvdVZaRUM4S3hXTVpFV3B0N2xISURRQldHczBpdDRXZnEzZ0RZZXRpZDAz?=
 =?utf-8?B?ZGV4ZGwvQytmdnNOU3VXQVVXL28zb3BCSnZXV2EwL2RoaTRCV1p1cXBxQmdj?=
 =?utf-8?B?QkpmUDlKdm5DbXhYWUhaSWY0NGpzZmxaa29vOUxtVm02MTRPT1N5azRmdm9y?=
 =?utf-8?B?TjFhSlNBMGpMVXhHdXRhQzJ4T21mR0UrSXRYQTVhZkJtZWdIdi9ybExnWGZB?=
 =?utf-8?B?bjgzSUsvU0g5T2R6Y1FWckhyNVNMdmNyVGlrZXoySGpSeFZYbFdXZjFwNGcz?=
 =?utf-8?B?N1VUTlMzL1RVNU1FaGhmYVQ2dTBWckdLckZ5VFhmM1hIVkw2eXd2WHpjTFJH?=
 =?utf-8?B?UHZqeStqN2xJQmxnME9oenYvV1M0OWg3cTJTR1pRSnl4YUFNSTBSVkVleTdY?=
 =?utf-8?B?UXAvSUdheGRQY1JIcWJXcHV1cmFld0luQnh6Y3JFVDZUVGl3YjY1cFZWUGRu?=
 =?utf-8?B?VUdXM01XcXJKQXVFaUtPdkpING8xRW1jZlpTUmh4VHF6b3YreFV4d01OMlpO?=
 =?utf-8?B?VkQzYW4xQXMvYk1FR3NTZXQzeW9Vc1JFQ01JUFBFT0JTTXdOcVJDK1VNSkxt?=
 =?utf-8?B?aWtzMmMvcWw0WEExbXpPMHFjaCtBaDlZVzgycmdyNEtRMC9qZGZFQlNhZnRI?=
 =?utf-8?B?dUxxTEh2YVVoaGpsdW1xL2JRdVZJNk9DWUtldjREWWw3R0dkZ2wxbVREYU9j?=
 =?utf-8?Q?TOJfDRb6ZMXZMq+oTyMM7c+0k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a06be57-4316-469d-2c2e-08de25ba8481
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 09:20:14.9880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MPrtkQJN/IjhZgv7yWmacFV+tHjMUkweaC8rVz8RYTFLvlcsp3dHpa9HCgHNYZYv+xtkxhkiKLVCh0q1wqH0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMDUvMTBdIGRybS9pOTE1L2FscG06IEF1eGxlc3Mgd2FrZSB0
aW1lIGNhbGN1bGF0aW9uIGZvcg0KPiBYZTNwDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3IgYXV4bGVz
cyB3YWtldGltZSBjYWxjdWxhdGlvbiBmb3IgRFAyLjEgQUxQTSBhcyBkZXBlbmRlbnQNCj4gcGFy
YW1ldGVyIGdvdCBjaGFuZ2VkLg0KPiANCj4gdjE6IEluaXRpYWwgdmVyc2lvbi4NCj4gdjI6IFVz
ZSBpbnRlbF9kcF9pc191aGJyKCkuIFtKYW5pXQ0KPiANCg0KQWRkIEJzcGVjIG5vLiBoZXJlDQoN
Cj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYyB8IDYzICsrKysr
KysrKysrKysrKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2FscG0uYw0KPiBpbmRleCBiNGI4NzRkZDM3MjUuLjgxNDcyMjU0YWI3MyAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gQEAgLTEwMCwyMyAr
MTAwLDY0IEBAIHN0YXRpYyBpbnQgZ2V0X2xmcHNfaGFsZl9jeWNsZV9jbG9ja3MoY29uc3Qgc3Ry
dWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+IA0KPiAgc3RhdGljIGludCBn
ZXRfdHBoeTJfcDJfdG9fcDAoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3Rh
dGUpICB7DQo+IC0JcmV0dXJuIDEyICogMTAwMDsNCj4gKwlzdHJ1Y3QgaW50ZWxfZGlzcGxheSAq
ZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoY3J0Y19zdGF0ZSk7DQo+ICsNCj4gKwlyZXR1cm4g
RElTUExBWV9WRVIoZGlzcGxheSkgPj0gMzUgPyAoNDAgKiAxMDAwKSA6ICgxMiAqIDEwMDApOw0K
PiAgfQ0KPiANCj4gLXN0YXRpYyBpbnQgZ2V0X2VzdGFibGlzaG1lbnRfcGVyaW9kKGNvbnN0IHN0
cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlKQ0KPiArc3RhdGljIGludCBnZXRfZXN0
YWJsaXNobWVudF9wZXJpb2Qoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gKwkJCQkgICAg
Y29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ICB7DQo+ICAJaW50
IHQxID0gNTAgKiAxMDAwOw0KPiAtCWludCB0cHM0ID0gMjUyOw0KPiArCWludCB0cHM0ID0gaW50
ZWxfZHBfaXNfdWhicihjcnRjX3N0YXRlKSA/ICgzOTYgKiAzMikgOiAoMjUyICogMTApOw0KPiAg
CS8qIHBvcnRfY2xvY2sgaXMgbGluayByYXRlIGluIDEwa2JpdC9zIHVuaXRzICovDQo+IC0JaW50
IHRtbF9waHlfbG9jayA9IDEwMDAgKiAxMDAwICogdHBzNCAvIGNydGNfc3RhdGUtPnBvcnRfY2xv
Y2s7DQo+ICsJaW50IHRtbF9waHlfbG9jayA9IDEwMDAgKiAxMDAwICogdHBzNCAvIGNydGNfc3Rh
dGUtPnBvcnRfY2xvY2sgLyAxMDsNCj4gKwlpbnQgbHR0cHJfY291bnQgPSAwOw0KPiAgCWludCB0
Y2RzLCBlc3RhYmxpc2htZW50X3BlcmlvZDsNCj4gDQo+IC0JdGNkcyA9ICg3ICsgRElWX1JPVU5E
X1VQKDY1MDAsIHRtbF9waHlfbG9jaykgKyAxKSAqIHRtbF9waHlfbG9jazsNCj4gLQllc3RhYmxp
c2htZW50X3BlcmlvZCA9IChTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y2RzKTsNCj4gKwlp
ZiAoaW50ZWxfY3J0Y19oYXNfdHlwZShjcnRjX3N0YXRlLCBJTlRFTF9PVVRQVVRfRURQKSkgew0K
PiArCQl0Y2RzID0gKDcgKyBESVZfUk9VTkRfVVAoNjUwMCwgdG1sX3BoeV9sb2NrKSArIDEpICoN
Cj4gdG1sX3BoeV9sb2NrOw0KPiArCX0gZWxzZSB7DQo+ICsJCXRjZHMgPSA3ICogdG1sX3BoeV9s
b2NrOw0KPiArCQlsdHRwcl9jb3VudCA9IGRybV9kcF9sdHRwcl9jb3VudChpbnRlbF9kcC0NCj4g
Pmx0dHByX2NvbW1vbl9jYXBzKTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAobHR0cHJfY291bnQpIHsN
Cj4gKwkJaW50IHRsdyA9IDEzMDAwOw0KPiArCQlpbnQgdGNzID0gMTAwMDA7DQo+ICsJCWludCB0
bGZwc19wZXJpb2QgPSBnZXRfbGZwc19jeWNsZV90aW1lKGNydGNfc3RhdGUpOw0KPiArCQlpbnQg
dGRjcyA9IChTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y3MgKw0KPiArCQkJICAgIChsdHRw
cl9jb3VudCAtIDEpICogKHRsdyArIHRsZnBzX3BlcmlvZCkpOw0KPiArCQlpbnQgdGFjZHMgPSA3
MDAwMDsNCj4gKwkJaW50IHRkcyA9IChsdHRwcl9jb3VudCAtIDEpICogNyAqIHRtbF9waHlfbG9j
azsNCj4gKw0KPiArCQkvKiB0ZHJsIGlzIHNhbWUgYXMgdGNkcyovDQo+ICsJCWVzdGFibGlzaG1l
bnRfcGVyaW9kID0gdGx3ICsgdGxmcHNfcGVyaW9kICsgdGRjcyArIHRhY2RzICsNCj4gdGRzICsg
dGNkczsNCj4gKwl9IGVsc2Ugew0KPiArCQkvKiBUT0RPOiBBZGQgYSBjaGVjayBmb3IgZGF0YSBy
ZWFsaWduIGJ5IERQQ0QgMHgxMTZbM10gKi8NCj4gKw0KPiArCQllc3RhYmxpc2htZW50X3Blcmlv
ZCA9IChTSUxFTkNFX1BFUklPRF9USU1FICsgdDEgKyB0Y2RzKTsNCj4gKwl9DQo+IA0KPiAgCXJl
dHVybiBlc3RhYmxpc2htZW50X3BlcmlvZDsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgaW50IGdldF9z
d2l0Y2hfdG9fYWN0aXZlKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ICsqY3J0Y19z
dGF0ZSkgew0KPiArCWludCBwb3J0X2Nsb2NrID0gY3J0Y19zdGF0ZS0+cG9ydF9jbG9jazsNCj4g
KwlpbnQgc3dpdGNoX3RvX2FjdGl2ZTsNCg0KTWFrZSB0aGlzIHN3aXRjaF90b19hY3RpdmUgPSAw
IHRoYXQgd2F5IHRoZSBlbHNlIGJsb2NrIGxhdGVyIGlzIG5vdCByZXF1aXJlZCANCg0KPiArDQo+
ICsJaWYgKGludGVsX2RwX2lzX3VoYnIoY3J0Y19zdGF0ZSkpIHsNCj4gKwkJaW50IHN5bWJvbF9j
bG9jayA9IHBvcnRfY2xvY2sgLw0KPiAraW50ZWxfZHBfbGlua19zeW1ib2xfc2l6ZShwb3J0X2Ns
b2NrKTsNCj4gKw0KPiArCQlzd2l0Y2hfdG9fYWN0aXZlID0gMzIgKiBESVZfUk9VTkRfVVAoKDM5
NiArIDMgKyA2NCksDQoNCkkgd291bGQgbGlrZSBpZiB5b3UgaGFkIDM5NiBhc3NpZ25lZCBhcyBh
IHZhcmlhYmxlIG1sX3BoeV9sb2NrX2xlbg0KDQo+IHN5bWJvbF9jbG9jayk7DQo+ICsJfSBlbHNl
IHsNCj4gKwkJc3dpdGNoX3RvX2FjdGl2ZSA9IDA7DQo+ICsJfQ0KDQpTaG91bGQgeW91IG5vdCB0
YWtlIGNhcmUgb2YgIHRoZSBtc3QgdXNlIGNhc2UuDQoNClNvIHRoZSBzd2l0Y2ggdG8gYWN0aXZl
IGxhdGVuY3kgc2VlbXMgd3JvbmcgaGVyZSB3aGF0IHlvdSBhcmUgY2FsY3VsYXRpbmcgaGVyZSBp
cw0KVF9zd2l0Y2hfdG9fYWN0aXZlID0gMzIgKiBESVZfUk9VTkRfVVAoKDM5NiArIDMgKyA2NCks
ZmxpbmspDQpTd2l0Y2hfdG9fYWN0aXZlX2xhdGVuY3k9IENFSUwodF9zd2l0Y2hfdG9fYWN0aXZl
L3RfbGluZSkNCkFuZCB0aGlzIG5lZWQgdG8gYmUgd3JpdHRlbiB0byBBTFBNX0NUTDIgd2hpY2gg
eW91IGFyZSBub3QgZG9pbmcgc2VlIGJlbG93IGNvbW1lbnQuDQpBbHNvIHlvdSBhcmUgbm90IHRh
a2luZyBpbnRvIGFjY291bnQgdGhlIGZhY3QgdGhhdCBmX2xpbmsgaXMgaW4gTUhaIGFuZCBpbnRl
bF9kcF9saW5rX3N5bWJvbF9jbG9jayBnaXZlIHZhbHVlIGluIGtIWiBzbyBwcm9iYWJseSBsb29r
IGludG8gdGhhdCB0b28uDQpTdGlsbCBub3Qgc3VyZSBob3cgZl9saW5rIGlzIHRoZSBpbnRlbF9k
cF9saW5rX3N5bWJvbF9jbG9jayBjYW4geW91IGV4cGxhaW4gdGhhdCB0b28/DQoNCj4gKw0KPiAr
CXJldHVybiBzd2l0Y2hfdG9fYWN0aXZlOw0KPiArfQ0KPiArDQo+ICAvKg0KPiAgICogQVVYLUxl
c3MgV2FrZSBUaW1lID0gQ0VJTElORyggKChQSFkgUDIgdG8gUDApICsgdExGUFNfUGVyaW9kLCBN
YXgrDQo+ICAgKiB0U2lsZW5jZSwgTWF4KyB0UEhZIEVzdGFibGlzaG1lbnQgKyB0Q0RTKSAvIHRs
aW5lKSBAQCAtMTM2LDEzICsxNzcsMTUNCj4gQEAgc3RhdGljIGludCBnZXRfZXN0YWJsaXNobWVu
dF9wZXJpb2QoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+
ICAgKiB0TUxfUEhZX0xPQ0sgPSBUUFM0IExlbmd0aCAqICggMTAgLyAoTGluayBSYXRlIGluIE1I
eikgKQ0KPiAgICogVFBTNCBMZW5ndGggPSAyNTIgU3ltYm9scw0KPiAgICovDQoNCkxvdCBvZiBj
aGFuZ2VzIGluIHRoaXMgZnVuY3Rpb24gYW5kIGhvdyB3ZSBjYWxjdWxhdGUgZGF0YSBzbyB0aGUg
Y29tbWVudCBhbHNvIG5lZWRzIHRvIGNoYW5nZSBoZXJlDQpUbyByZWZsZWN0IHRob3NlIGNoYW5n
ZXMuDQoNCg0KPiAtc3RhdGljIGludCBfbG5sXw0KY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUo
Y29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNfc3RhdGUpDQo+ICtzdGF0aWMg
aW50IF9sbmxfY29tcHV0ZV9hdXhfbGVzc193YWtlX3RpbWUoc3RydWN0IGludGVsX2RwICppbnRl
bF9kcCwNCj4gKwkJCQkJICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUNCj4gKmNydGNf
c3RhdGUpDQo+ICB7DQo+ICAJaW50IHRwaHkyX3AyX3RvX3AwID0gZ2V0X3RwaHkyX3AyX3RvX3Aw
KGNydGNfc3RhdGUpOw0KPiAtCWludCBlc3RhYmxpc2htZW50X3BlcmlvZCA9IGdldF9lc3RhYmxp
c2htZW50X3BlcmlvZChjcnRjX3N0YXRlKTsNCj4gKwlpbnQgZXN0YWJsaXNobWVudF9wZXJpb2Qg
PSBnZXRfZXN0YWJsaXNobWVudF9wZXJpb2QoaW50ZWxfZHAsDQo+IGNydGNfc3RhdGUpOw0KPiAr
CWludCBzd2l0Y2hfdG9fYWN0aXZlID0gZ2V0X3N3aXRjaF90b19hY3RpdmUoY3J0Y19zdGF0ZSk7
DQo+IA0KPiAgCXJldHVybiBESVZfUk9VTkRfVVAodHBoeTJfcDJfdG9fcDAgKw0KPiBnZXRfbGZw
c19jeWNsZV90aW1lKGNydGNfc3RhdGUpICsNCj4gLQkJCSAgICBlc3RhYmxpc2htZW50X3Blcmlv
ZCwgMTAwMCk7DQo+ICsJCQkgICAgZXN0YWJsaXNobWVudF9wZXJpb2QgKyBzd2l0Y2hfdG9fYWN0
aXZlLCAxMDAwKTsNCg0KSSBkbyBub3QgdGhpbmsgeW91IGhhdmUgdG8gIGFkZCB0aGUgc3dpdGNo
IHRvIGFjdGl2ZSBsYXRlbmN5IGhlcmUsDQpTd2l0Y2ggdG8gYWN0aXZlIGxhdGVuY3kgYSBzZXBh
cmF0ZSBmaWVsZCBpbiBBTFBNX0NUTDIgc28geW91IHdpbGwgaGF2ZSB0byB3cml0ZSBpdA0KV2hp
Y2ggbWVhbnMgeW91IG5lZWQgdG8gY3JlYXRlIGFub3RoZXIgdmFyaWFibGUgdGhhdCB5b3UgZmls
bCB3aXRoIHN3aXRjaCB0byBhY3RpdmUgbGF0ZW5jeS4NCkgvdyB3aWxsIGludGVybmFsbHkgbWFp
bnRhaW4gQXV4IFdha2UgdGltZSArIFN3aXRjaCB0byBhY3RpdmUgbGF0ZW5jeS4NCkkgZG9uJ3Qg
c2VlIHlvdSB3cml0aW5nIHRvIEFMUE1fQ1RMMltTd2l0Y2ggdG8gQWN0aXZlIHRpbWVdIGhlcmUg
b3IgYW55d2hlcmUgZWxzZSBkaWQgeW91IG1pc3MgaXQ/DQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5k
cGFsDQoNCj4gIH0NCj4gDQo+ICBzdGF0aWMgaW50DQo+IEBAIC0xNTQsNyArMTk3LDcgQEAgX2xu
bF9jb21wdXRlX2F1eF9sZXNzX2FscG1fcGFyYW1zKHN0cnVjdA0KPiBpbnRlbF9kcCAqaW50ZWxf
ZHAsDQo+ICAJCWxmcHNfaGFsZl9jeWNsZTsNCj4gDQo+ICAJYXV4X2xlc3Nfd2FrZV90aW1lID0N
Cj4gLQkJX2xubF9jb21wdXRlX2F1eF9sZXNzX3dha2VfdGltZShjcnRjX3N0YXRlKTsNCj4gKwkJ
X2xubF9jb21wdXRlX2F1eF9sZXNzX3dha2VfdGltZShpbnRlbF9kcCwgY3J0Y19zdGF0ZSk7DQo+
ICAJYXV4X2xlc3Nfd2FrZV9saW5lcyA9IGludGVsX3VzZWNzX3RvX3NjYW5saW5lcygmY3J0Y19z
dGF0ZS0NCj4gPmh3LmFkanVzdGVkX21vZGUsDQo+ICAJCQkJCQkgICAgICAgYXV4X2xlc3Nfd2Fr
ZV90aW1lKTsNCj4gIAlzaWxlbmNlX3BlcmlvZCA9IGdldF9zaWxlbmNlX3BlcmlvZF9zeW1ib2xz
KGNydGNfc3RhdGUpOw0KPiAtLQ0KPiAyLjI5LjANCg0K
