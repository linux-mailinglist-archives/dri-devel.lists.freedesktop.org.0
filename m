Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF94A2866F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 10:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE9A10E764;
	Wed,  5 Feb 2025 09:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fR0bzbCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4709A10E762;
 Wed,  5 Feb 2025 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738747446; x=1770283446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N/W7xBLWiRy6NTCFQsbPYY7PZ+Lot3YgLD5NtfKl2zk=;
 b=fR0bzbCv1B/ZIIMshnHkLmUw4hJjKirWo/1E7j0hSB9ghxqkqpNpbbwv
 Tf/caFY/BGwPgBLW261wx1XcFnfAvqCGBU1D2mrJtfpxQTn9LlWlhmX2q
 A5Uc4mI7YX8vENdqlIvaGEWjRJQEUKeDmkiIxxOdDz3xfKi0BhQ2YfxT5
 kZf2P9BqJkWv0QeOkJ+x3/rP1YFSeh5H6Kx+gVUZJFkDFS95SKOa4Ktt3
 Gptk0SgKjrSrGyFHOhcUovIHqyUIkg/JpzSHsgK+TbUxUKA6g6jGLzrQ+
 MHSbYRnLn7YNJxVyFydXERi+crZh8DRmJgyNOYy4IMbWCdieLdgg6XKq8 w==;
X-CSE-ConnectionGUID: VTypwULxTim5s2uBNIy44A==
X-CSE-MsgGUID: NNRlByFYSEa1B0cVpJsftA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64662450"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="64662450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 01:24:04 -0800
X-CSE-ConnectionGUID: ICag8bvFTIm9DqVGv6sSdQ==
X-CSE-MsgGUID: +S8sk8JdSG6AbfBry0+a7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="110641353"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 01:24:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 01:24:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 01:24:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 01:23:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFxnMwEM1wRwqXd+ZRms8Kipn5DqcHAaPAAVKcUDLNOe8+5kON5ol+pqr9XYRcfEE9UC7Uu4ZeIdeRQ4gpFQmVej3gmsMmkEeIPCeLumNtnFAe+hSprBbNbh404mt/Ua3+bUZSmVixrqkMzqySA88/xrRXrV6oqB3cuhfrV5v6+ub52wTiy5jFaXCPWlcA2MkPXzubsyQ9i6keVthPEkXscPjds70thEgPPHUCNYlm8aM52NAOH3XwhQPciDRGSZOWitz8XvqHO2IshXbAYIrw7Y+boQ3XZs0ilSWU/9m38MVK96A8PqWDz7urjGnndZ6foE3IlSdLOBsFMw0MOHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/W7xBLWiRy6NTCFQsbPYY7PZ+Lot3YgLD5NtfKl2zk=;
 b=ttMlRFy8O3imMcQYsYpFluoYH0mx5e8cIruWj7WJTnlhz4kusAYT3+uwh0HGgnpne2nB8ogegjGDPnVp1PgoYgydLuMFQ4MCVZEbBssU1yZjWIk+C8sG9nFYSvfQXkd9WAS997jHoOxljuLBamspoXQ6X/m5xYtEZltlRLlWru3VH8VCcal0dlOiPeERNAdT1ZofZuHmVN5TkuIWXhHYLj7pP+zuNlE8bteqwaPBeVHHTBx4OMH9A8P8lD+u3rDMs2rCGD+d7fNCv81sUW7otuQVS9HOOWKEW57R+TrAbd8yOEk/gNijDpd108r8R3oBH/lMI2PvJHU/nbHOdHTSMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 09:23:53 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 09:23:51 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>, "Lyude
 Paul" <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
Subject: RE: [PATCH v5 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Thread-Topic: [PATCH v5 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Thread-Index: AQHbdiqXYbyan+GiZUa6rXzMR96x3LM4coTw
Date: Wed, 5 Feb 2025 09:23:51 +0000
Message-ID: <SN7PR11MB67500488D041BD81053420E7E3F72@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
 <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-3-c865d0e56d6e@linaro.org>
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-3-c865d0e56d6e@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CO1PR11MB4932:EE_
x-ms-office365-filtering-correlation-id: 84987d95-4381-47a6-7900-08dd45c6cddb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?N1NvNWVUTy9HWjFYbU1MeHI3eWc4bHhLZlBuMmNmVDFxTEZvQ2o2WGxoZ0VL?=
 =?utf-8?B?bEFqVVNHRDRFcW9vMXp5T1U0dXc3alUwOVo4VXoxaWFXaWozWmdFaE5EN3lw?=
 =?utf-8?B?NkZsUWk4YkhnQnNZR3FvdTJGZXQ2NFBac1FpeEVXS3laaE9wS3JOSW9yRk5S?=
 =?utf-8?B?Um9XRy9hZnByZVgxeHBZbG9iSmpGNjVveGZzMngwbkhmYnFjanFYWnlDc3J4?=
 =?utf-8?B?Lzh1L25kUUp0d3RQN2lNZ1V6MlM1Q3VnOXgyTUdQYVErV0xmK3VBVWE4bUh6?=
 =?utf-8?B?V3crY3NmZXAzVlJMUElXa0dGa3ZxOWFzenltQzZmVk5YbnBoZXZTSlQwYyt6?=
 =?utf-8?B?NnpOaXcwL1kwWWxIUk1ucCszTjd5YU1CeTU5SWRHVnRKRnN6cG9ubjJlU2JX?=
 =?utf-8?B?aVNZMWYxUkFoZXZHWE5BTGZ1dEZabEpSRERxd1NxNFNndm1YQ1hqS2kyeUpn?=
 =?utf-8?B?MldZLzFzTUVRVnN1a3gwYXB0ZlBNcGFnaVl3WXFuVGFUMFhVMkZTU21kNzVq?=
 =?utf-8?B?NGxSUzVjSVVrODg0bEN3TWZwdnpXS2Zjcy8wMEJDT0gyNC8wS21iemtLZnQ2?=
 =?utf-8?B?TGROcFRSeWdJbW12bDk5YUc0RlFlckJHT1JpMXV6bmV6RmNBMnZuTFB4TlpU?=
 =?utf-8?B?WnpuaUUvTWcxNFBheGtSMno0US9IZFRxeWdBc1B4YnV6UUdyZDJscnM1dC9O?=
 =?utf-8?B?bjBDTExVVDVDMXEyNC9uRDZVQ1RYZmh3NnpVc1pZSis4TzdodkU4SVpQZkFO?=
 =?utf-8?B?eXl5RGd6djZYU2RCN3VURXlDUlBtUkY3U1hjRXdqaFVTWnJ1SlE1SHdvU2pQ?=
 =?utf-8?B?Y01TZDdkSEVCbHhEcFU1VVc2dWYzRGsvNEh0RGZJRm5kNk5keHRVMGVzYjdR?=
 =?utf-8?B?YWo2Q3pXZkpaaVJyOWJ6QnFqNG5OVDQxaDVHY3RuTEcvVEYwYUUxNmI4QXox?=
 =?utf-8?B?TjFIOS9JWExOVmNQaG10S2dDU1lrRkZ4cjZVRTMzeFhMMjUxalRNNFpMN09s?=
 =?utf-8?B?aHlxZ0U1Yk1TS0N0aG1CZ0lwVUs5RXUzdCtyaGloZERFODF1aHBickVkN2Zy?=
 =?utf-8?B?OTFjYTloelFFdjJvS2JVQXJqeTB0ZGFEa2pGZktoSVlvWXhvOXlnbHF3L3Br?=
 =?utf-8?B?YkhON3F2Nmw2dGRFZ2R4UkZZWHJLWjllRzdoT0ViOVFyRUVxRlAyWkFrQ012?=
 =?utf-8?B?ejB3aVRWZm5WdTlGWU96a0U5Ujl3dGEwVnRvNjhkcmhtd09GeDhGWUhDQ3Qx?=
 =?utf-8?B?NGNTNUo3dUF6STFKSlllbmxubmdnUUszT3RQVGdWTkQyMnhiS3pWMWthOEd1?=
 =?utf-8?B?U25iaEdXREhXT1lkbTBuc1lSOGdVMGpHRmt0NXdMUC9YUHRIRUp3b0hna0h4?=
 =?utf-8?B?NFlENU9wRDlYQTBSb0tmVlRjSWowV245Vmp1NVBsd294ZEJWa3A3ZGYvSk1j?=
 =?utf-8?B?aVZ1S3M4aW1LZWtzVi9EYXRuQVRBaFlRTWRzK0pjTm5lby9aRXFkbmxFWE4w?=
 =?utf-8?B?anliVjhQeXlwUFNSYUJrMnJkYmo5M0ZIYzJMM1dVSHV4TGhRdkpsR3VIRXVv?=
 =?utf-8?B?b2toTjZSTVR1empWK0J3L2JvZEZGeFZoUzZyaStiRjgybjB5ZTZLQzAvTHcv?=
 =?utf-8?B?WlpnK3BScS9uam9rNjVDSlN3MWdPNUV4WHJScitFOHg4d0c0dUpTVmhOOXlm?=
 =?utf-8?B?TDhUa01ISE9KeEpwbENUM0xGeUZPVkFQc3pST1JzY3RnQnBlenpUczNHdUtP?=
 =?utf-8?B?YmJhS3VxNzlmNTRCV1VqYjMzNHYrcHJPMmRaMko0RlhGVGlHdEYrK3QvK2w2?=
 =?utf-8?B?Um8wNGUwcjQ5akdhWnZ1UjZvMTkzS0FwZmlXRU9CMGFDMXVDZGdQTFNHNVNK?=
 =?utf-8?B?dGdyMEh1ZFJRUzVUbkptUi8xNzhkQUhMOUtxOTc0Rk5xNjBubzZjK3prTnkx?=
 =?utf-8?Q?qIEqtVE2JCDO2QLwB/rv01znSpyelp5W?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVZmSVVSQ3FiU3RRTnNDcTkvTTdhK2dGMGxMcU1iODErVUVUVmNEQTZ5UlJV?=
 =?utf-8?B?YzZHSWx5dGdHR25yZGtVMVlqSlhOUVh0aFFUb2kzTThuaTFyR2k2Z0NiajhH?=
 =?utf-8?B?NGdTRjh6cFFPeHR1NWZXYlVhZ2JZbThieFlrNkc0QXJZTElDUEF5dTJpQ1dm?=
 =?utf-8?B?bXl1dklmTGxRQ0QxaXlBWnIvWG12ZFRkcmwwckpNYVduWko1alYveWZJZmxq?=
 =?utf-8?B?MVp4N2pGN1FpejVzcFpnWFNSeXczd3c2QlduM2VLRVBpNFphYzF6dTBhTVk4?=
 =?utf-8?B?SjlySUFneHpHdThHa0RYNW9tU3FIdTNvUWdmQmRnRDZpbHVZVFA2MU1tSzhj?=
 =?utf-8?B?QmZmU2dxSFJiWnJwUy9DcjRkZjdzS2xKWk5vd1pLZE13SjVOQWdTTy8rZ21W?=
 =?utf-8?B?RHFQQk9UcmtMTFBoalo0YksrdGFLbEpGTncxSmRNZmNOb3V0YTYyc3FsaG1i?=
 =?utf-8?B?MDVuL1FreTVPeS91cm9xRURQWitZWi9ubFh2ZlE1N0VtN1cweWRiSGtzb1dQ?=
 =?utf-8?B?M3VGaGR1YWdaMUFxRDhOVHhEM3A1bkttazBUNEZrOTliengvUlQ4VGdVckwz?=
 =?utf-8?B?Y1ZxZDRkL3F6VU9mMnlEbTAvZDIzNnpaNjB2UHdTZjJLbThycHZ2WEtCUTE5?=
 =?utf-8?B?Zk52RW5GV0x4OVIxMXJDbUxoTFcxQk1lRTdWSVkzS3FwazdENXJ0RWkxY3VQ?=
 =?utf-8?B?MlNySHlINUI1YlY4N0ROT1VDUDFjRmhBeld3SEFGc0pjR0FURlBrVWNnTER2?=
 =?utf-8?B?R0M1RG9XSHRpVTdMNlJuWG1lT2pMc0R3LzBNL05LbGFzQjZ0UmZMRURlc21M?=
 =?utf-8?B?SXBzUHMzMUIyMTV1ME56OW9sTFFPYjc1dUtYSWVCOEdwZ0FWQTIraVhHdmVV?=
 =?utf-8?B?OEFCdXBINzh3cjVKUFBnWU5xR2hKT1NWdE1EUDBzTERLRFFwY2RxTnVzMDFu?=
 =?utf-8?B?RjhsbE4vTmZiZzJEdmN2cC9jbzhncG5ibi9FSnFvQklYZnQwd096V2JqZzBk?=
 =?utf-8?B?eFhVYnlkZU00VzZrTnJ4V29UNUVEbEpFVVdKZXdMQVVyd3JzWTFqWEgzLyt2?=
 =?utf-8?B?UW5VWlAwRFhtdjVnL2kxTm9CWWdiRGFFTU1reVNEQ2RWV3RVczFzdENPRElz?=
 =?utf-8?B?b3c2S3J0bWhKOHpKcVJDNjZjalNqenIvWkpBYVVsRlJTeGxITDBqYWl3cEFR?=
 =?utf-8?B?a05JdDRlclBmSFlneUVvaTJ2WElvYTNNUVdiOTJha29YQXRqeFdNVHFBYkhw?=
 =?utf-8?B?VXFUT0J4eThPL0hTZGVlajZ4SHljbVlqd0xFYmxHc0VQNUc5WVJuV09uRnYy?=
 =?utf-8?B?MzI2ZWhRYWZvOHByR29Lem9sTlZ6QXMrY2lPSXcwQlpDVW9nYmZTNGJaZkFS?=
 =?utf-8?B?K3FaY2g3QXpLSUhpOFZQYWRyNy9jQlYxZVZET0E1bThkeWhQV01ENnBtdGJC?=
 =?utf-8?B?ZUFRUzdOWUNJT2JmZS9NUDhjbCthQS9XdS85VkIrSHlBVkVGWU01ekN2dzVC?=
 =?utf-8?B?ZmNxeTNOOUpEbXV2WWZldHN0ODE1VElkd1d4N1ZvTm5Yd2I1U0RrY2pnbWtB?=
 =?utf-8?B?OEZiWTZuSXphTkdVZ2g0NFUzMElDN1Z1RUZjYzhjbWZkRTVCS3ppYkJYbnMv?=
 =?utf-8?B?bTZHdFE5QzRDYVNZRGFVYUxsS0djb2E5TWNpM2Vmc05OQ0xwTXJHK1Q3bDJB?=
 =?utf-8?B?WUYzZ0RQZFNHUDU3aDhwcGJiS05KMXoweVZNRU9CSW4wcEVFWUZFWm8yZitn?=
 =?utf-8?B?cHZ4SGFYOGZueitWb3dGd09GamF5enNSSTg4Y0VtbkZTRVl6RDhOODlzSzd3?=
 =?utf-8?B?bFdOQTFQNzI1d1RJb3YyWXZTSTYrTHBhYXlVM2JKVGt6ajQ4M2JiYUVSbmdJ?=
 =?utf-8?B?RTh4eVpPa0ZuVExlNUJyT0hFcHFTd2FPTHBMZFR0c2YvYnZXYVZISlZVK1I4?=
 =?utf-8?B?N01VWWErNlpXMEdBRUwzRnJSQlFrbldsQ2FKOFNRdld4RXcrcE1rM3F3OU91?=
 =?utf-8?B?TE1rcDJHZjVzS0N6SmM5WExQc2xFeGtBWFo2VFJjSVgrdU0wejJOZGEzeVlD?=
 =?utf-8?B?eElRejhud1cvbk9NSCtqNmFHNEpMRXU4czZISnN0cWVVdjRLcENNWkx4Q001?=
 =?utf-8?Q?7pLwX3Bdh85lJmGz5Ba0CyXnN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84987d95-4381-47a6-7900-08dd45c6cddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 09:23:51.5468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N8VbzH2ic0J8nW2q/PtA2EUG/B9o7AcdP0lXuxovZ1hrKB6HDPYxYmi3Fu64nZHlBQeEre2l8ERkI0iUPaiIxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBYmVsDQo+
IFZlc2ENCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAzLCAyMDI1IDQ6MjggUE0NCj4gVG86IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhp
bWUgUmlwYXJkDQo+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT47DQo+IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBT
aW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBLYXJvbA0KPiBIZXJic3QgPGtoZXJic3RA
cmVkaGF0LmNvbT47IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+OyBEYW5pbG8NCj4gS3J1
bW1yaWNoIDxkYWtyQHJlZGhhdC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXgu
aW50ZWwuY29tPjsNCj4gVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IEpv
b25hcyBMYWh0aW5lbg0KPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IFR2cnRr
byBVcnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD47DQo+IFJvYiBDbGFyayA8cm9iZGNsYXJr
QGdtYWlsLmNvbT47IEFiaGluYXYgS3VtYXINCj4gPHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb20+
OyBEbWl0cnkgQmFyeXNoa292DQo+IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+OyBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj47IE1hcmlqbg0KPiBTdWlqdGVuIDxtYXJpam4uc3VpanRl
bkBzb21haW5saW5lLm9yZz4NCj4gQ2M6IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5l
bC5vcmc+OyBLb25yYWQgRHliY2lvDQo+IDxrb25yYWR5YmNpb0BrZXJuZWwub3JnPjsgSm9oYW4g
SG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IG5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4g
eGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZzsN
Cj4gZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgQWJlbCBWZXNhIDxhYmVsLnZlc2FA
bGluYXJvLm9yZz47IERlYWssDQo+IEltcmUgPGltcmUuZGVha0BpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFtQQVRDSCB2NSAzLzRdIGRybS9pOTE1L2RwOiBVc2UgdGhlIGdlbmVyaWMgaGVscGVyIHRv
IGNvbnRyb2wgTFRUUFINCj4gdHJhbnNwYXJlbnQgbW9kZQ0KPiANCj4gTFRUUFJzIG9wZXJhdGlu
ZyBtb2RlcyBhcmUgZGVmaW5lZCBieSB0aGUgRGlzcGxheVBvcnQgc3RhbmRhcmQgYW5kIHRoZQ0K
PiBnZW5lcmljIGZyYW1ld29yayBub3cgcHJvdmlkZXMgYSBoZWxwZXIgdG8gc3dpdGNoIGJldHdl
ZW4gdGhlbSwgd2hpY2ggaXMNCj4gaGFuZGxpbmcgdGhlIGV4cGxpY2l0IGRpc2FibGluZyBvZiBu
b24tdHJhbnNwYXJlbnQgbW9kZSBhbmQgaXRzDQo+IGRpc2FibGUtPmVuYWJsZSBzZXF1ZW5jZSBt
ZW50aW9uZWQgaW4gdGhlIERQIFN0YW5kYXJkIHYyLjAgc2VjdGlvbg0KPiAzLjYuNi4xLg0KPiAN
Cj4gU28gdXNlIHRoZSBuZXcgZHJtIGdlbmVyaWMgaGVscGVyIGluc3RlYWQgYXMgaXQgbWFrZXMg
dGhlIGNvZGUgYSBiaXQgY2xlYW5lci4NCj4gU2luY2UgdGhlIGRyaXZlciBzcGVjaWZpYyBpbXBs
ZW1lbnRhdGlvbiBob2xkcyB0aGUgbHR0cnBfY29tbW9uX2NhcHMsIGlmIHRoZQ0KPiBjYWxsIHRv
IHRoZSBkcm0gZ2VuZXJpYyBoZWxwZXIgZmFpbHMsIHRoZSBsdHRycF9jb21tb25fY2FwcyBuZWVk
IHRvIGJlDQo+IHVwZGF0ZWQgYXMgdGhlIGhlbHBlciBoYXMgYWxyZWFkeSByb2xsZWQgYmFjayB0
byB0cmFuc3BhcmVudCBtb2RlLg0KPiANCj4gQWNrZWQtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFr
QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWJlbCBWZXNhIDxhYmVsLnZlc2FAbGluYXJv
Lm9yZz4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFs
QGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIC4uLi9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
cF9saW5rX3RyYWluaW5nLmMgIHwgMjQgKysrKystLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5n
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2xpbmtfdHJhaW5p
bmcuYw0KPiBpbmRleA0KPiA4YjE5NzdjZmVjNTAzYzcwZjA3YWY3MTZlZTJjMDBlNzYwNWM2YWRm
Li5jNWJhZDMxMWVkZjdiOWE1Y2ViYjYzM2I5DQo+IGU5NjkyYmFlMzk3ZjllZCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5n
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3Ry
YWluaW5nLmMNCj4gQEAgLTExOSw5ICsxMTksNiBAQCBpbnRlbF9kcF9zZXRfbHR0cHJfdHJhbnNw
YXJlbnRfbW9kZShzdHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLCBib29sIGVuYWJsZSkNCj4g
IAl1OCB2YWwgPSBlbmFibGUgPyBEUF9QSFlfUkVQRUFURVJfTU9ERV9UUkFOU1BBUkVOVCA6DQo+
ICAJCQkgIERQX1BIWV9SRVBFQVRFUl9NT0RFX05PTl9UUkFOU1BBUkVOVDsNCj4gDQo+IC0JaWYg
KGRybV9kcF9kcGNkX3dyaXRlKCZpbnRlbF9kcC0+YXV4LCBEUF9QSFlfUkVQRUFURVJfTU9ERSwN
Cj4gJnZhbCwgMSkgIT0gMSkNCj4gLQkJcmV0dXJuIGZhbHNlOw0KPiAtDQo+ICAJaW50ZWxfZHAt
Pmx0dHByX2NvbW1vbl9jYXBzW0RQX1BIWV9SRVBFQVRFUl9NT0RFIC0NCj4gDQo+IERQX0xUX1RV
TkFCTEVfUEhZX1JFUEVBVEVSX0ZJRUxEX0RBVEFfU1RSVUNUVVJFX1JFVl0gPSB2YWw7DQo+IA0K
PiBAQCAtMTQ2LDYgKzE0Myw3IEBAIHN0YXRpYyBib29sDQo+IGludGVsX2RwX2x0dHByX3RyYW5z
cGFyZW50X21vZGVfZW5hYmxlZChzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwKSAgc3RhdGljDQo+
IGludCBpbnRlbF9kcF9pbml0X2x0dHByX3BoeXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwg
Y29uc3QgdTgNCj4gZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pICB7DQo+ICAJaW50IGx0dHBy
X2NvdW50Ow0KPiArCWludCByZXQ7DQo+IA0KPiAgCWlmICghaW50ZWxfZHBfcmVhZF9sdHRwcl9j
b21tb25fY2FwcyhpbnRlbF9kcCwgZHBjZCkpDQo+ICAJCXJldHVybiAwOw0KPiBAQCAtMTcyLDIy
ICsxNzAsOCBAQCBzdGF0aWMgaW50IGludGVsX2RwX2luaXRfbHR0cHJfcGh5cyhzdHJ1Y3QgaW50
ZWxfZHANCj4gKmludGVsX2RwLCBjb25zdCB1OCBkcGNkW0RQXw0KPiAgCQlyZXR1cm4gbHR0cHJf
Y291bnQ7DQo+ICAJfQ0KPiANCj4gLQkvKg0KPiAtCSAqIFNlZSBEUCBTdGFuZGFyZCB2Mi4wIDMu
Ni42LjEuIGFib3V0IHRoZSBleHBsaWNpdCBkaXNhYmxpbmcgb2YNCj4gLQkgKiBub24tdHJhbnNw
YXJlbnQgbW9kZSBhbmQgdGhlIGRpc2FibGUtPmVuYWJsZSBub24tdHJhbnNwYXJlbnQNCj4gbW9k
ZQ0KPiAtCSAqIHNlcXVlbmNlLg0KPiAtCSAqLw0KPiAtCWludGVsX2RwX3NldF9sdHRwcl90cmFu
c3BhcmVudF9tb2RlKGludGVsX2RwLCB0cnVlKTsNCj4gLQ0KPiAtCS8qDQo+IC0JICogSW4gY2Fz
ZSBvZiB1bnN1cHBvcnRlZCBudW1iZXIgb2YgTFRUUFJzIG9yIGZhaWxpbmcgdG8gc3dpdGNoIHRv
DQo+IC0JICogbm9uLXRyYW5zcGFyZW50IG1vZGUgZmFsbC1iYWNrIHRvIHRyYW5zcGFyZW50IGxp
bmsgdHJhaW5pbmcgbW9kZSwNCj4gLQkgKiBzdGlsbCB0YWtpbmcgaW50byBhY2NvdW50IGFueSBM
VFRQUiBjb21tb24gbGFuZS0gcmF0ZS9jb3VudCBsaW1pdHMuDQo+IC0JICovDQo+IC0JaWYgKGx0
dHByX2NvdW50IDwgMCkNCj4gLQkJZ290byBvdXRfcmVzZXRfbHR0cHJfY291bnQ7DQo+IC0NCj4g
LQlpZiAoIWludGVsX2RwX3NldF9sdHRwcl90cmFuc3BhcmVudF9tb2RlKGludGVsX2RwLCBmYWxz
ZSkpIHsNCj4gKwlyZXQgPSBkcm1fZHBfbHR0cHJfaW5pdCgmaW50ZWxfZHAtPmF1eCwgbHR0cHJf
Y291bnQpOw0KPiArCWlmIChyZXQpIHsNCj4gIAkJbHRfZGJnKGludGVsX2RwLCBEUF9QSFlfRFBS
WCwNCj4gIAkJICAgICAgICJTd2l0Y2hpbmcgdG8gTFRUUFIgbm9uLXRyYW5zcGFyZW50IExUIG1v
ZGUgZmFpbGVkLCBmYWxsLQ0KPiBiYWNrIHRvIHRyYW5zcGFyZW50IG1vZGVcbiIpOw0KPiANCj4g
QEAgLTE5Niw2ICsxODAsOCBAQCBzdGF0aWMgaW50IGludGVsX2RwX2luaXRfbHR0cHJfcGh5cyhz
dHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLCBjb25zdCB1OCBkcGNkW0RQXw0KPiAgCQlnb3Rv
IG91dF9yZXNldF9sdHRwcl9jb3VudDsNCj4gIAl9DQo+IA0KPiArCWludGVsX2RwX3NldF9sdHRw
cl90cmFuc3BhcmVudF9tb2RlKGludGVsX2RwLCBmYWxzZSk7DQo+ICsNCj4gIAlyZXR1cm4gbHR0
cHJfY291bnQ7DQo+IA0KPiAgb3V0X3Jlc2V0X2x0dHByX2NvdW50Og0KPiANCj4gLS0NCj4gMi4z
NC4xDQoNCg==
