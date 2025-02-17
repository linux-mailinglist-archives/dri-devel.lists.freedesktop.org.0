Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D614A37A78
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 05:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1E810E303;
	Mon, 17 Feb 2025 04:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJBx8CNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3507F10E095;
 Mon, 17 Feb 2025 04:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739766190; x=1771302190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ImeOo9GdRIA/TsjJyu0172qFcSItHaduWGH4m049r+4=;
 b=dJBx8CNosWTK5xJ3/eTLFWWsxp7K7dyaO8Kx/Z7DTM83RB/Pyk55kylr
 Tnx+YH29myMfb2ts134xOJO5Gqs/pNcipHpXXdaeb6+vhyeZHc/0mg11t
 dBN06ffgkkbyzVGfc068GJuoc83E3t6obavpAVmhqF1PYjbpubBUSGp/C
 1H1jsqzyqQrQValXVDGfjUhgYNIH5B23Sei4FEQqoeOiXbegz8YqIweJw
 hYcDwhJmoKjJ/GjG9W9gCqSDuWdtqh/utfbG3lnJpAVOYa5sNBjrWKMfn
 AbSfIy06KiNsXAx1K3/niUdAXGNgryZ/5rbQXrJDjAM0bMEPAyVgHKtxu A==;
X-CSE-ConnectionGUID: xDaKFnuoS7i597XsWztXqw==
X-CSE-MsgGUID: pipCpCXDR3yuh5LchTjruA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40468319"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40468319"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 20:23:09 -0800
X-CSE-ConnectionGUID: V8hZzQdgSgackCWl8o/uXg==
X-CSE-MsgGUID: MUVPFRhASWav1E/h7pMu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="119027079"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 20:23:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 16 Feb 2025 20:23:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 20:23:08 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 20:23:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzMUYa2oma377vr1QNaJ9B2sUnTL40J02qKjq94QiGXaMcusXXZQx1e5Tiek+eeQw7N/zjiLmV1XlFyh96GNwX9Te78HMwL+G1uxwBQNTgL+Z9eZgupYqDotEiuwb80exuJYZJQ63HIuXYGSDvGCOeadJ+ns0ZR3kXRRYdsUYvNVvoTa+vj/8vLvOgPItP04Z3A0+wNx88T2fjuJxWLQ/v3/kEtAL8OQC0Kb9c1KpFN0NRSicOkjU6jWT2MVT9XL43Rldp9y1FzlahQhCgx2rTxRxElZjfs4qd05G5qOWEOfsnElyGl6gGVOyHIZDTdKMfkUxnrRG4GxX+bXIHqgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImeOo9GdRIA/TsjJyu0172qFcSItHaduWGH4m049r+4=;
 b=Xescjbn2iF6Zv80IdEJ/YE7OLh5IlIQ0X0Et23NMCgmNeZFwH6aPIoojtPlWnCtzsBA8i4TwINOsZK24vm/OYkDL5GJrbyFIhnVEirRC/ZcR9/TZWExgw5/0WtCGGLNwMSBN2omX6TO8LPdRUaOzZy1gpVXlIlkrgcdoEIqw7gRmK/7aNuNlCGarrp+FGLzNC4MCAu2KFu63isQe5PDswyVXZtEudeP2NwBsrObSZLukyiJqxlF3nsTG8a4pBFFyJGBkP7egnfpG2vc23uoHsZktg/aWKP2bkrq12jj7FKLyrNOxx/W7euHmaX6wx9GKaW+eitMbIQn/VWlJ7Aopog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 04:23:06 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 04:23:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v8 10/14] drm/i915/iet: Add support to writing the IET LUT
 data
Thread-Topic: [PATCH v8 10/14] drm/i915/iet: Add support to writing the IET
 LUT data
Thread-Index: AQHbcZ6nt+0ITS5ouUaWeDB1FhkTQbNK/voQ
Date: Mon, 17 Feb 2025 04:23:01 +0000
Message-ID: <SN7PR11MB67508F99DC74E4B2218E5E59E3FB2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-10-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-10-871b94d777f8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH3PR11MB8185:EE_
x-ms-office365-filtering-correlation-id: a589e6be-8dc2-450d-f6be-08dd4f0ac3fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UGl3TEQrMm81K2RjQ0dTMVRhSHpTSTViQ0k3QWg3cE5OTlpIQVVJU3R0cGpj?=
 =?utf-8?B?aVpRNU0yTzAvMkorU2JrbFBha1dJZ1V3bkhpeU5xazEyUWRTaEZPQnVIR3Bo?=
 =?utf-8?B?bDhlL1UydFlOTU5qbFFySEdWNTdkWTRUUTI0QWVFK1BoV1NzNDNrMzBQcFJE?=
 =?utf-8?B?Tmw3QjBlS0loY0R1OHluYmhUc3gzVVhSTmR3d1owaGNJRWRGRlIrVUFmeHFK?=
 =?utf-8?B?VzBPYVRNd1JuaVVXRUVxdWpCR2tISHVaano4b2ZIZit3S1RzS0FmeDhQeHlp?=
 =?utf-8?B?dGhuWUY1Wk5XeVE4V003Tk52NGx5ZDQvL0xvZ3piTXo3VlV4eFNVMCtrdytu?=
 =?utf-8?B?NTZ4K3BMWTh2SDkxcmtyajVpTTc3YVlCNTYzY2ROaEN5Z1dzR3FLOVlIV0JG?=
 =?utf-8?B?V29FWkVZdUZDVHJiSXNGMXJLZ3VsQXU0SG1CWktPaDI2ZDFVOFJOVUNqZUFl?=
 =?utf-8?B?SkVqSFQvRzZDZmlyR0pobm9RbVBzdnVnQ0k2M2Q2RDFwdlpLejhrclhyeWph?=
 =?utf-8?B?ZVFuUHpvbkowamtYeEQxRlFUNzNCN2pWUXFnYmdCY05xNFVGWG04T2cydndj?=
 =?utf-8?B?emVYRmpGay9Bc0l0bDlQM0VoQkE3VXl0ZFZDSVJoZjAwMkE3MG42NkpOSTRr?=
 =?utf-8?B?bWhwMlJvaVI5QmpoeGtwV3cxWTRTUjQ0VmVLUzdEUWR2eHhETThtdGtzOW9l?=
 =?utf-8?B?bko3SHcrRDNGVjIxdDQyc3c5VXRYOVRzamlJU0lkZXlHdUhUYVRIUjRRL1Ur?=
 =?utf-8?B?VFMvYlNDTUNveGpaNnVrM3U3dEM0TzdoZ0dreEF3S3hCSTZMclprRW0weGpm?=
 =?utf-8?B?NDZPbWdDNGdBaHBZV1NIUUQ5Qi8waklHTDg1QVE3YmErMmRmYURvOWhvRDl5?=
 =?utf-8?B?SmV2NHc5cE15MWo0b2dadE1MbS9kY0xFZkFwWFROa1dwN1FhOUUrWEEreDlu?=
 =?utf-8?B?REJ5UlR6WjZQSmNFRUtHTHF4TzVvQlh1RHpHM3JoVEd4UC9tQ0ljTVpTSDBm?=
 =?utf-8?B?cVBtS0F3eHc3dVhQU3Z0UmhSUlFrdWUveE82Rmw1SjZRK2N2d2YzazVaZFlu?=
 =?utf-8?B?d3pKTUpPTHlhZThCc1VWNFRZKzVQLzRoSk1Zc3BFS0Ezemk3ZlB4ZDgzeVhI?=
 =?utf-8?B?cit0bGN6ZDcxd0J5MVVTaEZtWGFWWk1kWmE0WmpGM05VSjBqWUFqZDNKYWJ3?=
 =?utf-8?B?eVFNeksxQWRFVzFVdlpSYWdkTFIvdmtGblhMQWRQYkVHREtWL3llRndFY3U3?=
 =?utf-8?B?bnFzU01WU1g2QmVPV1FHTlJJWUZqYVgzNVVtVStzWURHOVZyRy9EODRVcXhO?=
 =?utf-8?B?bk5ORU9xN3VBRDFZWXUwcUNpYTJnRUVxY2UzRElQdmRucGNmbUI3SURQd1lZ?=
 =?utf-8?B?b0duNDFKaVpIeWdXVklpUVI2MGVLSzBUNTYrZGJPRUJVMW5EVFdPbmdMVVAx?=
 =?utf-8?B?NW1CbURENlJMdzlzdzZFZjEyMDR4WXpSeUF6MXQyWkdvWXRZNE1heWxwMDNS?=
 =?utf-8?B?YnFkZVhGeUhMN3MvN21GTUdwZ1NjR09xbjhiSkx2L29lZjZXMWZicWhIVEVJ?=
 =?utf-8?B?RVVTUHJYVHhFYjRuREV3WEJjWGdKYjJOYzBNbit3V3V6R3RmUEZBdjhyaktt?=
 =?utf-8?B?VVVjajM2cURBUWo2VnNoL2gvT2F1bk5VVHovOTJjS0s1UzVKOUoyaCsrQTRx?=
 =?utf-8?B?eDRld29CTEIxcmRXQURIRUNTR2RCVXFJTjlkbmowWEZpZVlvRXZCOUh3MmQx?=
 =?utf-8?B?Y0ppdEwwbWRBWWh6dFp0R0hqMitlR2xPWmIxUDJWdlJJWHBya2NuN3JSS1or?=
 =?utf-8?B?clJkZy9jUS85YStod2kwQy9mNVV0eHJNMjNydFoxSW8rZWFCZU9TdHNTaHZU?=
 =?utf-8?B?OERYSldFa2l5VkZ0ZWhUT0VZdkcySjBkb3FSQmk4TitHYnFCWElvVFRMc2xG?=
 =?utf-8?Q?TBtL+NSTZO54HrZUIWvAo0c57FfpEgvt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THV6TVl4ZFBCaGdXN000UnUzdzdPOUs4aTMwNEV1YWw4djNFTENiT1NMZVVO?=
 =?utf-8?B?c1RWZk5GVmkvY0FJR0pzQWhtb1hOR25KVUptL3gvR0p4YnFCTCt6SVJoUDhD?=
 =?utf-8?B?dEZUZm42SW1OczhjUldWNUh2dDUwM01HMDVXZ2gxdGlEczlZMDdOWk01bkZZ?=
 =?utf-8?B?K0JCRFh6LzZ0RTJoN2d4cDhQWVYxTzdnWmdsOC9hQUlSZENidnc2NFhqMzlO?=
 =?utf-8?B?NGNaN1QzeERTVVRvcXlGQnUrTW8wRXFmUFZ3L1huZnltS3U2QXFMbWVsdTVT?=
 =?utf-8?B?UXg5QVdGaUJxVSt6ZXJ4Ym5Xbi8wenZnaUwxVEUxM2xqN0hyT0RTUXFxVGRy?=
 =?utf-8?B?OWVhM1ZmY2Nib2tWKzhpV2dWSEk0QnNvZlM2WXdvUzBKVE4vTUV1dVQzTUd1?=
 =?utf-8?B?RkI3cmUxT3ZPbEQwWmN5dHRBKzRBVGh4elBKUHFML0tIQUtDejdDdXVFcllp?=
 =?utf-8?B?ckNqY2d5L1BleFBiZGxEKzVNVFF6N3p4N0pMcnRnMGNYaXNuL1VRbnBNZmcy?=
 =?utf-8?B?VXEzQUVwZXg0Zy9ZamdjMGlSQlFxOWpIT00reEtSMG04WUVQS3Q1bms4NGto?=
 =?utf-8?B?WTlyWlg2aHFONXluLzdlaTZLUlBPalJiVHU0N2FxUFZIbnJlOUo2d0RZVEM1?=
 =?utf-8?B?TFR6TEZCV2ZJdDdVOGp6RVRTMEdOSFFXcGRLcVZXWkRrTFJQYUxDL3A1Zm9U?=
 =?utf-8?B?ei8valpTVUg2a3g4eUV6a2lINzdpOURmakcwRlBIZk1iQkdISmpFVHNVTWt5?=
 =?utf-8?B?QjAvcjNseCtrcVZidXowcnV4VVpPMlZQZEhwZ0IxVmx6bU9iNjcvUmdSQ0ln?=
 =?utf-8?B?VktJbWYyUmFoQ2VLdXoyVjNkNWhqK2RYck1Rb1hTMS9YK3E2SjNGQnNicnNJ?=
 =?utf-8?B?aXdyME51TXJRMlkxNU9Nb3dNNXZ2djIzbWFiYXpsWDJuWm9VMVptbU9XakM5?=
 =?utf-8?B?aDVxdGx1STNSOGFkaVh3NzRVQnhxcWMrQTdUaHczUjMwSnM3cWR1TFFuWnVk?=
 =?utf-8?B?QUNqaEJIY25DclhoTTZqTU5nN0J1NkZGOThJYUhlOG1uRzEwdDZlUXhnSGgy?=
 =?utf-8?B?QklNbk1pSDRINEt2dUo0U2hnb3JCZURxRFhWR3c0Kzlwc050ckxJT28ydVQv?=
 =?utf-8?B?ekwzcDJhdnlQU2E3U2VadUhOWkpyZW5iaWNvNnBOMGdvNVIzU2lHTmlMZGdu?=
 =?utf-8?B?RlRTU09YeEVUSW5KTFZqV1JUaHlzbWJxOTFGV3BsaGh2Uy9rNW5kTEtVVlA4?=
 =?utf-8?B?ZlJmdThELzZIUWtuMzlKMnF2bFlmaUs2OThkallZMVVzZFUvRWtWZWJQNmRS?=
 =?utf-8?B?Z09PL3JyL2JaOGdkekduaVo0UUtnYU5BT1dySmJQamVIaWl3SnRtNVpJNGlP?=
 =?utf-8?B?VWpRcEkwTzAwUGZxcmtmUlNibnNiR1RhZjZ4b1IxcHl2emhhT0pGS0FJbTYv?=
 =?utf-8?B?REI5NUZtL2o0RXh5YlpIMStSbTRJbFVWTXdyanNNYngrTGlFVTFJZVNOdFpD?=
 =?utf-8?B?TFduWHlrRzJGNkwreFpEb1VjV0VNaHcxSE5hVmRpZzdYam0xajdNR0NkQ3Z2?=
 =?utf-8?B?VnJzUUNJOTFkSnVhaWMwZ2ozTkdVUTl2V29xVzNOK3VUU1hDRXR3T0hQa3Fv?=
 =?utf-8?B?TTFOdmtqSWNQdnVkeU5SUUJYY1p5RWNqZ3dvUkltMkxZMldJd2tHTktwY25O?=
 =?utf-8?B?VDU1WTYxSUtpR2s1eVE4ZEppUWU5cmZpT2I5MjkxUEl0cUNBa05BTytkQ0tz?=
 =?utf-8?B?RjhrVys4RlZHWE1KcFd3VmxEZmlsQ3NjdG5GNE5rZTlKbXJoKytWUVdNVmxt?=
 =?utf-8?B?TW80MHBzdTdRNTJRU3Q1L0JZQzRiM3J5VTJzVUtQYXkzMmVaVnVtUWozN0tJ?=
 =?utf-8?B?R0I0amNWWW52THhpWi9NYzBVRUJacVNubjNTQkxYYnF6RUd2bUlGTlJBME1o?=
 =?utf-8?B?K1F6dlBNcGlKS1NwazlTUVhyQUhVekdxTFA5OEh6WElVR1RxTjQ0ZmsrS3h2?=
 =?utf-8?B?Snh4WW54aHBiNWpOVThYSFI4c3dzQWd2b3BIa0FmYW5rVysvVFdPK0RQdU9Z?=
 =?utf-8?B?bmJSWERmZG9JdURkSWtrK0l5WXpqdGI3QmZUMFZKVGJBbTFXcDRhYzd2MWZn?=
 =?utf-8?Q?4FskQt5jQ6MpR6lRvyD2Yqnh1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a589e6be-8dc2-450d-f6be-08dd4f0ac3fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 04:23:01.2780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGaZ7ovWx4fh+8BJXEAGBtRZV0abAFlrrszPUn91bQ4oWsVj0B8xqa/dD02spuxI/ZM4C4l0jIPFbG1tXHhWQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI4LCAy
MDI1IDk6MjEgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gQ2M6IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47IGRt
aXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZzsNCj4gTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjggMTAvMTRdIGRybS9pOTE1L2lldDog
QWRkIHN1cHBvcnQgdG8gd3JpdGluZyB0aGUgSUVUIExVVCBkYXRhDQo+IA0KPiBVc2VyIGNyZWF0
ZWQgTFVUIGNhbiBiZSBmZWQgYmFjayB0byB0aGUgaGFyZHdhcmUgc28gdGhhdCB0aGUgaGFyZHdh
cmUgY2FuDQo+IGFwcGx5IHRoaXMgTFVUIGRhdGEgdG8gc2VlIHRoZSBlbmhhbmNlbWVudCBpbiB0
aGUgaW1hZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVy
dGh5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2hpc3RvZ3JhbS5jIHwgNzANCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uaCB8ICA0ICsrDQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbS5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYw0KPiBpbmRleA0KPiA0ZjNkY2Jh
YmZlOTZlOTU1YTY1ODc0NzE4MjcyYzRiZWI1M2IwODI3Li5hYTAyZTdjZTQyYjkzMGE4NThkZTRh
ZDdlDQo+IDBkMzlkOTNmYTdkNDI5OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9oaXN0b2dyYW0uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbS5jDQo+IEBAIC0yMCw2ICsyMCw3IEBADQo+ICAvKiBQ
cmVjaXNpb24gZmFjdG9yIGZvciB0aHJlc2hvbGQgZ3VhcmRiYW5kICovICAjZGVmaW5lDQo+IEhJ
U1RPR1JBTV9HVUFSREJBTkRfUFJFQ0lTSU9OX0ZBQ1RPUiAxMDAwMCAgI2RlZmluZQ0KPiBISVNU
T0dSQU1fQklOX1JFQURfUkVUUllfQ09VTlQgNQ0KPiArI2RlZmluZSBJRVRfU0FNUExFX0ZPUk1B
VF8xX0lOVF85X0ZSQUNUIDB4MTAwMDAwOQ0KPiANCj4gIHN0YXRpYyBib29sIGludGVsX2hpc3Rv
Z3JhbV9nZXRfZGF0YShzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0YykgIHsgQEAgLTIyMyw2
DQo+ICsyMjQsNjAgQEAgaW50IGludGVsX2hpc3RvZ3JhbV91cGRhdGUoc3RydWN0IGludGVsX2Ny
dGMgKmludGVsX2NydGMsDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAraW50IGludGVsX2hp
c3RvZ3JhbV9zZXRfaWV0X2x1dChzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0YywNCj4gKwkJ
CQlzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmJsb2IpDQo+ICt7DQo+ICsJc3RydWN0IGludGVs
X2hpc3RvZ3JhbSAqaGlzdG9ncmFtID0gaW50ZWxfY3J0Yy0+aGlzdG9ncmFtOw0KPiArCXN0cnVj
dCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5ID0gdG9faW50ZWxfZGlzcGxheShpbnRlbF9jcnRjKTsN
Cj4gKwlpbnQgcGlwZSA9IGludGVsX2NydGMtPnBpcGU7DQo+ICsJaW50IGkgPSAwOw0KPiArCXN0
cnVjdCBkcm1faWV0XzFkbHV0X3NhbXBsZSAqaWV0Ow0KPiArCXUzMiAqZGF0YTsNCj4gKwlpbnQg
cmV0Ow0KPiArDQo+ICsJaWYgKCFoaXN0b2dyYW0pDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiAr
DQo+ICsJaWYgKCFoaXN0b2dyYW0tPmVuYWJsZSkgew0KPiArCQlkcm1fZXJyKGRpc3BsYXktPmRy
bSwgImhpc3RvZ3JhbSBub3QgZW5hYmxlZCIpOw0KDQpQbGVhc2UgYWRkIC9uIGF0IHRoZSBlbmQg
b2Ygc2VudGVuY2UuDQpOaXQ6IHN0YXJ0IHRoZSBsb2cgc3RhdGVtZW50IHdpdGggYSBjYXBpdGFs
IGxldHRlcg0KDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCWlmICghZGF0
YSkgew0KPiArCWRybV9lcnIoZGlzcGxheS0+ZHJtLCAiZW5oYW5jZW1lbnQgTFVUIGRhdGEgaXMg
TlVMTCIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwkvKiBTZXQgRFBT
VF9DVEwgQmluIFJlZyBmdW5jdGlvbiBzZWxlY3QgdG8gSUUgJiB3YWl0IGZvciBhIHZibGFiayAq
Lw0KDQpUeXBvIHlvdSBtZWFuIHZibGFuaw0KDQo+ICsJaW50ZWxfZGVfcm13KGRpc3BsYXksIERQ
U1RfQ1RMKHBpcGUpLA0KPiArCQkgICAgIERQU1RfQ1RMX0JJTl9SRUdfRlVOQ19TRUwsDQo+IERQ
U1RfQ1RMX0JJTl9SRUdfRlVOQ19JRSk7DQo+ICsNCj4gKwlkcm1fY3J0Y193YWl0X29uZV92Ymxh
bmsoJmludGVsX2NydGMtPmJhc2UpOw0KPiArDQo+ICsJIC8qIFNldCBEUFNUX0NUTCBCaW4gUmVn
aXN0ZXIgSW5kZXggdG8gMCAqLw0KPiArCWludGVsX2RlX3JtdyhkaXNwbGF5LCBEUFNUX0NUTChw
aXBlKSwNCj4gKwkJICAgICBEUFNUX0NUTF9CSU5fUkVHX01BU0ssIERQU1RfQ1RMX0JJTl9SRUdf
Q0xFQVIpOw0KPiArDQo+ICsJaWV0ID0gKHN0cnVjdCBkcm1faWV0XzFkbHV0X3NhbXBsZSAqKWJs
b2ItPmRhdGE7DQo+ICsJZGF0YSA9IGt6YWxsb2Moc2l6ZW9mKGRhdGEpICogaWV0LT5ucl9lbGVt
ZW50cywgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFkYXRhKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsN
Cg0KTmV3IGxpbmUgaGVyZQ0KDQo+ICsJcmV0ID0gY29weV9mcm9tX3VzZXIoZGF0YSwgKHVpbnQz
Ml90IF9fdXNlciAqKSh1bnNpZ25lZCBsb25nKWlldC0NCj4gPmlldF9sdXQsDQo+ICsJCQkgICAg
IHNpemVvZih1aW50MzJfdCkgKiBpZXQtPm5yX2VsZW1lbnRzKTsNCj4gKwlpZiAocmV0KQ0KPiAr
CQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IEhJU1RPR1JBTV9JRVRfTEVO
R1RIOyBpKyspIHsNCj4gKwkJaW50ZWxfZGVfcm13KGRpc3BsYXksIERQU1RfQklOKHBpcGUpLA0K
PiArCQkJICAgICBEUFNUX0JJTl9EQVRBX01BU0ssIGRhdGFbaV0pOw0KDQpEQVRBX0JJTl9NQVNL
IGlzIDA6MjMgZm9yIFRDIG1vZGUgYW5kIG9ubHkgMDo5IGZvciBJRSBJIHRoaW5rIHlvdSBzaG91
bGQgY3JlYXRlIGEgbmV3DQpJRSBEQVRBX0JJTl9NQVNLIGFuZCB0aGVuIHdyaXRlIHRoZSBkYXRh
Lg0KDQo+ICsJCWRybV9kYmdfYXRvbWljKGRpc3BsYXktPmRybSwgImlldF9sdXRbJWRdPSV4XG4i
LCBpLCBkYXRhW2ldKTsNCg0KRHJtX2RiZ19rbXMNCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwN
Cj4gKwl9DQo+ICsJa2ZyZWUoZGF0YSk7DQo+ICsJZHJtX3Byb3BlcnR5X2Jsb2JfcHV0KGludGVs
X2NydGMtPmJhc2Uuc3RhdGUtPmlldF9sdXQpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+
ICsNCj4gIHZvaWQgaW50ZWxfaGlzdG9ncmFtX2ZpbmlzaChzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50
ZWxfY3J0YykgIHsNCj4gIAlzdHJ1Y3QgaW50ZWxfaGlzdG9ncmFtICpoaXN0b2dyYW0gPSBpbnRl
bF9jcnRjLT5oaXN0b2dyYW07IEBAIC0yMzUsNg0KPiArMjkwLDggQEAgaW50IGludGVsX2hpc3Rv
Z3JhbV9pbml0KHN0cnVjdCBpbnRlbF9jcnRjICpjcnRjKSAgew0KPiAgCXN0cnVjdCBpbnRlbF9o
aXN0b2dyYW0gKmhpc3RvZ3JhbTsNCj4gIAlzdHJ1Y3QgZHJtX2hpc3RvZ3JhbV9jYXBzICpoaXN0
b2dyYW1fY2FwczsNCj4gKwlzdHJ1Y3QgZHJtX2lldF9jYXBzICppZXRfY2FwczsNCj4gKwl1MzIg
KmlldF9mb3JtYXQ7DQo+IA0KPiAgCS8qIEFsbG9jYXRlIGhpc3RvZ3JhbSBpbnRlcm5hbCBzdHJ1
Y3QgKi8NCj4gIAloaXN0b2dyYW0gPSBremFsbG9jKHNpemVvZigqaGlzdG9ncmFtKSwgR0ZQX0tF
Uk5FTCk7IEBAIC0yNDcsMTANCj4gKzMwNCwyMyBAQCBpbnQgaW50ZWxfaGlzdG9ncmFtX2luaXQo
c3RydWN0IGludGVsX2NydGMgKmNydGMpDQo+ICAJaGlzdG9ncmFtX2NhcHMtPmhpc3RvZ3JhbV9t
b2RlID0NCj4gRFJNX01PREVfSElTVE9HUkFNX0hTVl9NQVhfUkdCOw0KPiAgCWhpc3RvZ3JhbV9j
YXBzLT5iaW5zX2NvdW50ID0gSElTVE9HUkFNX0JJTl9DT1VOVDsNCj4gDQo+ICsJaWV0X2NhcHMg
PSBremFsbG9jKHNpemVvZigqaWV0X2NhcHMpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWlldF9j
YXBzKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCWlldF9jYXBzLT5pZXRfbW9kZSA9
IERSTV9NT0RFX0lFVF9NVUxUSVBMSUNBVElWRTsNCj4gKwlpZXRfY2Fwcy0+bnJfaWV0X3NhbXBs
ZV9mb3JtYXRzID0gMTsNCj4gKwlpZXRfY2Fwcy0+bnJfaWV0X2x1dF9lbnRyaWVzID0gSElTVE9H
UkFNX0lFVF9MRU5HVEg7DQo+ICsJaWV0X2Zvcm1hdCA9IGt6YWxsb2Moc2l6ZW9mKHUzMikqaWV0
X2NhcHMtPm5yX2lldF9zYW1wbGVfZm9ybWF0cywNCj4gKwkJCSAgICAgR0ZQX0tFUk5FTCk7DQo+
ICsJKmlldF9mb3JtYXQgPSBJRVRfU0FNUExFX0ZPUk1BVF8xX0lOVF85X0ZSQUNUOw0KPiArCWll
dF9jYXBzLT5pZXRfc2FtcGxlX2Zvcm1hdCA9ICppZXRfZm9ybWF0Ow0KPiArDQo+ICAJY3J0Yy0+
aGlzdG9ncmFtID0gaGlzdG9ncmFtOw0KPiAgCWhpc3RvZ3JhbS0+Y3J0YyA9IGNydGM7DQo+ICAJ
aGlzdG9ncmFtLT5jYW5fZW5hYmxlID0gZmFsc2U7DQo+ICAJaGlzdG9ncmFtLT5jYXBzID0gaGlz
dG9ncmFtX2NhcHM7DQo+ICsJaGlzdG9ncmFtLT5pZXRfY2FwcyA9IGlldF9jYXBzOw0KPiANCj4g
IAlJTklUX0RFRkVSUkFCTEVfV09SSygmaGlzdG9ncmFtLT53b3JrLA0KPiAgCQkJICAgICBpbnRl
bF9oaXN0b2dyYW1faGFuZGxlX2ludF93b3JrKTsgZGlmZiAtLWdpdA0KPiBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGlzdG9ncmFtLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2hpc3RvZ3JhbS5oDQo+IGluZGV4DQo+IGI0NGJhM2FmYzk0Zjc5
ZjI5MWY0ZTVlYmRkMDRkY2Y5NDM0YjQ4YTQuLjA5OTlkMTcyMGM3YWJlZTg5MDdjNzc4OTZlDQo+
IDRiMWU2ZmY3NTYxNjBmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2hpc3RvZ3JhbS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfaGlzdG9ncmFtLmgNCj4gQEAgLTE4LDkgKzE4LDExIEBAIHN0cnVjdCBpbnRlbF9k
aXNwbGF5OyAgZW51bSBwaXBlOw0KPiANCj4gICNkZWZpbmUgSElTVE9HUkFNX0JJTl9DT1VOVCAg
ICAgICAgICAgICAgICAgICAgMzINCj4gKyNkZWZpbmUgSElTVE9HUkFNX0lFVF9MRU5HVEggICAg
ICAgICAgICAgICAgICAgMzMNCj4gDQo+ICBzdHJ1Y3QgaW50ZWxfaGlzdG9ncmFtIHsNCj4gIAlz
dHJ1Y3QgZHJtX2hpc3RvZ3JhbV9jYXBzICpjYXBzOw0KPiArCXN0cnVjdCBkcm1faWV0X2NhcHMg
KmlldF9jYXBzOw0KPiAgCXN0cnVjdCBpbnRlbF9jcnRjICpjcnRjOw0KPiAgCXN0cnVjdCBkZWxh
eWVkX3dvcmsgd29yazsNCj4gIAlib29sIGVuYWJsZTsNCj4gQEAgLTQ1LDYgKzQ3LDggQEAgdm9p
ZCBpbnRlbF9oaXN0b2dyYW1faXJxX2hhbmRsZXIoc3RydWN0IGludGVsX2Rpc3BsYXkNCj4gKmRp
c3BsYXksIGVudW0gcGlwZSBwaXBlKTsgIGludCBpbnRlbF9oaXN0b2dyYW1fYXRvbWljX2NoZWNr
KHN0cnVjdCBpbnRlbF9jcnRjDQo+ICppbnRlbF9jcnRjKTsgIGludCBpbnRlbF9oaXN0b2dyYW1f
dXBkYXRlKHN0cnVjdCBpbnRlbF9jcnRjICppbnRlbF9jcnRjLA0KPiAgCQkJICAgc3RydWN0IGRy
bV9oaXN0b2dyYW1fY29uZmlnICpjb25maWcpOw0KPiAraW50IGludGVsX2hpc3RvZ3JhbV9zZXRf
aWV0X2x1dChzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0YywNCj4gKwkJCQlzdHJ1Y3QgZHJt
X3Byb3BlcnR5X2Jsb2IgKmJsb2IpOw0KPiAgaW50IGludGVsX2hpc3RvZ3JhbV9pbml0KHN0cnVj
dCBpbnRlbF9jcnRjICppbnRlbF9jcnRjKTsgIHZvaWQNCj4gaW50ZWxfaGlzdG9ncmFtX2Zpbmlz
aChzdHJ1Y3QgaW50ZWxfY3J0YyAqaW50ZWxfY3J0Yyk7DQo+IA0KPiANCj4gLS0NCj4gMi4yNS4x
DQoNCg==
