Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E36C2F398
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 05:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA7E10E514;
	Tue,  4 Nov 2025 04:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oum7eOBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6C910E234;
 Tue,  4 Nov 2025 04:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762228903; x=1793764903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8Oc5SndqLJLusM4WDKTt7u+BtcokWsO1tkfBQYMvInI=;
 b=Oum7eOBMvnPxZrY1vHTNrjb17gZi2fGPiEp2CC9hJ+N7/362xyfaYw8S
 5C29RxxzT/ZCScESOY5t/4CVflb5NExOC7RZoHzBSGUfikUeBpcz6+0eV
 9r3NrIxZXEI9ciOVVqi92mXOPhEl7NwfFDgqzzUfceas6YBBpQgoDwyyU
 e6DpbMobOQjJj7kppm1xUE8AhMNT4GYWVM4QvkJ1KKoEANKhxqVtqQBhM
 AoUjrovkBfbyBsYGxH28HTjxXiOrxcxLkflKtDJAvFsAnc5olwV+k5cWM
 iarxJGF8w9N+GOAt+maWMZ6quB6TDNtfcYulDqnumT/d56CWzdGgoK1uj w==;
X-CSE-ConnectionGUID: nRoTwiZvTqOe6m2RD5NsoQ==
X-CSE-MsgGUID: OhTYoEe7RQuWuor3YWOGqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81722042"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="81722042"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 20:01:42 -0800
X-CSE-ConnectionGUID: pNMEZ0wsT6+ntzYpR9PE/A==
X-CSE-MsgGUID: UE+gc5sjTjaJvsHB1Asxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="191134673"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 20:01:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 20:01:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 20:01:41 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 20:01:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cle54AAokLfS9tvCPE/zrzHSx8wrZ1K5oAsR3ex4SeuuLAMqcI4KofrRhJBdEVsXlqK11xwDFsXO0+VXd3uo1+qPLyTYtj5VVAtmVuN7gVtaerMnvupZQPqVuKzo3/6l+/r5b1lw3gUI9B7jeyrNmNga2YexAfB01dEZt/tLF3c6zNzc1/VVaiFqYdLLC5LcM72DG5i59SZHz1RNgsSV4ElqqNF1jT/QUwOWo0k8j0V9Kh0bSEAhZYxYkuVmH+zDRIkmBX8lxCqN6cho0qKASv1HotcRRCsp0lT+FlLz2iXuoeZ9F+c5Z/NQLwwdsCmt88Kolt5G4pw0Gsq1MnWg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Oc5SndqLJLusM4WDKTt7u+BtcokWsO1tkfBQYMvInI=;
 b=D/NoULWT6DJmP2kolCKle3qRIGbsnpZemyQ13+Zs+C+cIEfAAM701Wd8BmZ9MxURsd7yL2sQe9/eILWCs+C8zfPaJUrwFYaoFbSL5i17a+uLdsR5eq7TZSdgHETNUto/u7Q4KTMJAiWVgDZKnEigCkgLr2lT7ah1qKsDutIDxqZl8j0+qa2IR0VVr/b6mRb+pIXMznM0xTdtGqJCbbNgRQWNe5bKAfd+/ZdDq/gvoXFHyENuBC+azWumm1Qo/+ugFV4OMWM32YstEEpqnPMhGPI3BOB3Uc55nUjHw/xqv8V34ZBESzUWS+TfkKGkArKGUGid0DI8NsIFUEDklfix4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 04:01:34 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 04:01:34 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 01/10] drm/i915/alpm: Add dpcd definition for DP2.1
 alpm capability
Thread-Topic: [PATCH v2 01/10] drm/i915/alpm: Add dpcd definition for DP2.1
 alpm capability
Thread-Index: AQHcTRJ2DZ9toT88GUaHHfTmY+7DtLTh5Now
Date: Tue, 4 Nov 2025 04:01:34 +0000
Message-ID: <DM3PPF208195D8D5E3B1EDF3AA19ED034B4E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-2-animesh.manna@intel.com>
In-Reply-To: <20251103220957.1229608-2-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB8282:EE_
x-ms-office365-filtering-correlation-id: 55ea52d3-b85d-4f23-72a0-08de1b56d85c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OFBvZXFyUGF4Y1NJbUxGckdBTFdoZVZZamdKSzN1RFdQVVc2SXJZbUZtRUo5?=
 =?utf-8?B?aVdsekUyeStoa0NQNXEzNGFFbTlWWU1hZVpnQnp5blBDb1ZoT0pVeVBpZ292?=
 =?utf-8?B?dWZtc3ozOFQrM2tlZXowd2lZRm1OeTJqS0QxOXRzNUk0NnRWQTdweG1WTXNk?=
 =?utf-8?B?TjFHdVFzc0VXM0JKTitaWTZrOFF2ZjNEZ2NGeUtRU1YxOFRFUXF1OXNmdmtN?=
 =?utf-8?B?L1dQTmhrVFhhcDJ5M0VGWmZRbXlzU1BXR1V4MkxrRzlyR1c2MXczbXE1NzdH?=
 =?utf-8?B?Q0RVWktWenY2bzhNNXc1dG0xam9rRnFLQTRsTTBMeTZoQ2FCRVBNZXNDb0Fs?=
 =?utf-8?B?T2JHTnlmSGViYk1UMk8wbmZRa0xmV2RSTENJcVNvNEZKN3hPVkM4QllRU1g3?=
 =?utf-8?B?MkxoKzVyN1QzQzBvR1RBc1VWVC9nTHR3Q25xUFBobitqYVRuNXhFZXhaWVV6?=
 =?utf-8?B?WlFUMGpMYjBOZjExSytJQjkwNmRDUmxtZkErZEhOUmVzRDF6TjN1aWtVamtj?=
 =?utf-8?B?cHFUVmw0RXBjaFUxS0JST1JiZy93MTlBTjV2MFVsbzZzcnBhQjRTcTZxSFlX?=
 =?utf-8?B?NFVmQWp2WUxVeGJNeVI4aTk1WEdaaHdoSStTWHdCbkF6eXFoNnBSUHJVdFB5?=
 =?utf-8?B?SzR1dDZIQTFTTWp3OTRsQ1ByNEc4eW8rZTJCcCtMVFRZUSt4VUk5VU4xaWRs?=
 =?utf-8?B?WkdJYkhSVDdzSDZhcXZEbHRMMUR2ZENxbXgvSHQ0WkxYaXdxVEZtOTRvS3Ur?=
 =?utf-8?B?Tm5nd3FvUng5Rmt3cWRBVVVoS3NKMEJpVUxKcFJ2ZE1Dekp2VkJTMVA3WVBU?=
 =?utf-8?B?aXVaYlhWdXBWcjRISldFcnB3VENJMCtxUGhLSWhvYkVlejg0M2NrQmZoWjQw?=
 =?utf-8?B?ZWo4akwrNkxDdGI1eWMwQjdNVmJGeUFMazJPNGszWHF1MzNwQlFQdSsvMTR3?=
 =?utf-8?B?MVFpRCs4QUZwQVpVMUt4c2h4YjVqNkV3MXBOL3F1UVl2Qzh6Q3dCWSsydEl4?=
 =?utf-8?B?TUJoeVRFeld4RjkzQTY1VmFFaWFwWENrdWpkTml5RS9yQ00xNGhyNGhFSmJl?=
 =?utf-8?B?U3k5TFYyK0JWNXpTTWNVNy9ibnhyOVFHUyt6V0hEVS95Zm1uQjRNSmpHdjVp?=
 =?utf-8?B?aTZXbUY5UUJyRzBiT3pzRGdJdFZXZHdWQkpCb1FjdDlLUjg3OFpqdVdtd0Iz?=
 =?utf-8?B?eGpob3VZTnRORVZUbEdHcm0xdnM5dHZ6M1hvbnJxVVgyTkxycEVyK2pxN1hC?=
 =?utf-8?B?RWZLblRHZEpFTHZzd045YU9TZjljYzllYWRmSEpqN0lJZkE2ajZOM2ErQjhv?=
 =?utf-8?B?N2FKSkF1ajNRK0dYVXFSQ0pVSjlzcmJIZ2xvVFNkSUZnYlNZVC9jYTMrMVpw?=
 =?utf-8?B?WWJEL0xiQUdhY2pZMGNxU2pWYVlma29hUys0UEg1dVcwREdMMlJZU0pNSWZj?=
 =?utf-8?B?bzBuVVZycGg0ZVdjMnFtU3loMi9RUmt6aDdhT2RNaFlMT2d5enhGNDBYWHN6?=
 =?utf-8?B?S1NsaTB0ejBNYk0vSlVkeXZjNWR3WnFrTlJLMkhMTmRnRzVJd0V1UnJBT1Zi?=
 =?utf-8?B?QVJDemNab3Q0d3doeWx4Z0dLaEdaWVF2eTJtS3hmQ2svTW9RcmViYlJrNzVo?=
 =?utf-8?B?WkIvdUY5VGhZUm9OWGNzQmxJSTNwU2xObmFneUZycThCNWtHSEZueVZYZ3VD?=
 =?utf-8?B?NElUR00yaVVSZ1d1eWswVnVzd2dCekhYZlZKZ3QxZHhnWUlKc0tseTd0L05O?=
 =?utf-8?B?d3p2aGV6ZmZYaWxFRFR0TFpuNWVSTjd4TmdUdU1lWkJUckNNMjNNelhOY1FS?=
 =?utf-8?B?K1J1MWNGUU90eGEydmhhd3VCMmYwcGxSakNmeUFaeXh5UXFURXlmWXZnbncz?=
 =?utf-8?B?OE1HZTZuWGdFUXJLanFSWjhxTFZBbE5PcDlJTFhDeG1MUUdmemQrOUNMV2Nt?=
 =?utf-8?B?R1dudFA1RlcyckdENUN6Yi80UDFSSGNlSHQwaHByVWxSaHpSRkRSUDJRSlk2?=
 =?utf-8?B?WDkzMythVys1K0xLQXUzRmtDeEcrREZ0amFMWXVyS1FZaDRrbEZtY1k1T0F6?=
 =?utf-8?Q?jz14r1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlJ1KzFsN0s2SzlFeExNNzBRZ1hzeXdscWRLKzlMMUUwWG04UTRId2h0UXdk?=
 =?utf-8?B?dFlXMm53OVhRVkVsSDRNRldDb2JJZk5Yb2ZUV1ZDc05lL05jemxlbTc4ci9T?=
 =?utf-8?B?Q093c2t4OEdUMi9PSDN5QU82NnJhSzVBMm9HT1E2bi9jTXpJMFQvejBPTHI3?=
 =?utf-8?B?L3c1c29FSHJOaFo1ODlUcndvRXNocitVMXVDbE1MOENJN0cxRG90SCthSi95?=
 =?utf-8?B?UVM4U09XZGw1aFV2aGZtS1ZUWWVGYTRiWDUyUzU5V1poMEQ2VGhBSVZ2WFdi?=
 =?utf-8?B?cnIwZmthLzRXeEwyQ3dOMmUrUUoyVHR6b0haMzE4ZE5QaXhnZnh3c0crR29v?=
 =?utf-8?B?RjNZSGM1MU9VV2ZXdkdTM0pEbG5oNDZvbWUzZHkzUld1WlVGeFJCMzFVaVlX?=
 =?utf-8?B?NjAyZmQrcG1WWWsxNkVSdFVIcGpFVTVFU0ROZGRiTnM2b2ptVTV0UUMzVmhl?=
 =?utf-8?B?NURKaktkVGtBVnZyMHE5dzBpbjBldytkWndMb3BQSXVYbGEwZXArQXc4Rzdu?=
 =?utf-8?B?Y3p2RXA2T1ZuTHVJT2VuQmt2bVZ0TEtvVHVhb3Z3UEFmOW04WUpkSUhiZ2R2?=
 =?utf-8?B?NE56b1FvR1Jtc1hscUJiOXFtUmZhZ2h0RjlDdGdEVzdHTElzWCttWk14eWVY?=
 =?utf-8?B?UllDZUl4U09ISGRnNkdMNDRoQUE2UHoxMmh6NGNMRXlDazVMU2JDV01nK0ZY?=
 =?utf-8?B?UFZMSHpRNlJackNvN1pMTGhiaVcyZ21jcjN2WmR4anp5U3VkcnU3Q21PTCtR?=
 =?utf-8?B?MmM0ZDI2RFNoUlNKNTZHd0t5dmxmano1NEZGaTREVlBDTDFJM2xFdkIrbXZE?=
 =?utf-8?B?RmgrTk1HRkUzQUZiVWxQaXAydWFpRm5IS1FEQ0IrQUE0VDFmelkrODJraHNi?=
 =?utf-8?B?NDZ5RGRuc1hlV1p2SHNaNjJVMjJBMmxWTmMzWHI0azZhNFN3NDBMUi81d3k3?=
 =?utf-8?B?VS9BSW05THRmMzByWDJsV0JyTUhjZkdKdnhhaDAwSzN3bTNrUDFrQmNxcHVQ?=
 =?utf-8?B?WU5iQ3BHZkZ1MENpSDRlejdjcXd4TmNEdll3ZmFsM3lmUTU3TFYyY09vSE1B?=
 =?utf-8?B?MXkyejBCWFMzV1ZDTVFSSVpQOHRaY0JTQ1N0bnRDbVg4bXNXcVV5Yk9lYWxB?=
 =?utf-8?B?ZDg4b2xNcW02MmZxSEZpTHcxRGdVdDVNTFpXeU9Eem9hcDZtQzAwYTRNSzBL?=
 =?utf-8?B?K1hTTnNMNS9IbWp1VDNHZ09KZk05aC8wUWFEWHBUSDJYakhkd0JxcnExVFJJ?=
 =?utf-8?B?cjdwZElLWGxlYStnaVBYMEI4aVVTaC8yb2dhcGdZdWd0d0NmQVJSeGVqMGhP?=
 =?utf-8?B?aGdab2NrNU9GU216SWd6TUMwZEJmRlE1bGxGRkJvclhyb29wSDVMRDFIOFUw?=
 =?utf-8?B?aU80UUkrOTFJN0xScG5xVUFFK3JjVllUU0ZkeHFtRUNxYnBDWFhDY1FjdDFm?=
 =?utf-8?B?SGorOVIyc3BoeUhYK2tXM0JPajd2Yy90Tk9aNWk0ODZKekFpQXo5WUpwUWEv?=
 =?utf-8?B?NWprYW9taTd0SEU3NE9QNEpyOU56M21yWVFPbEVHclN3Qk5tM1F0VlJjZHN4?=
 =?utf-8?B?YmpHakVMRSs1QnpRV0tFRmZoOEc3VEw5OUZNSzR4bzQyN0FxYmdNNWhMWHBn?=
 =?utf-8?B?WmN2YkhoUVdvM3lBU3d3SzZsZk1OcXBTay9yejRqSG93citjd1ZQQyt2dXE4?=
 =?utf-8?B?SmtxeFE5eDBwYkd0Zk01ZU9kNWI0VUxBaStBdVdOMVRpcmVQbzc0ckVDalJF?=
 =?utf-8?B?NkUxM2d3akN4bzFCdlY5dXdENG5NWEp1TWRpNVZCeXBwSUdqd3MwRW52MWlN?=
 =?utf-8?B?MUw1Tm9QR3haekxKMkJ2bEJQeTh2cHdybGw4K29xbmVsWStoUjNNbnVoTGJ1?=
 =?utf-8?B?ZElsOVB4UDFOd3RXbnhxVHhQRGQ2bEpDRStVWW1acXBrWDFOd2ZqVUREWTF6?=
 =?utf-8?B?cXR0UHFrVlljR2IvbVNJQkkxWnJsTEVadDA5My8rZ3poQnlCUG9YbGtKTFdN?=
 =?utf-8?B?VSsrTm43NWYvWlFob2RJSTlJMjNHUHJWSDVNNFJNbTVjWlV6RGdMbGEyZFNR?=
 =?utf-8?B?Njl0TFY3NE05VDFjVGVxdHhnb2daUjZPRHR1cEEvQWpJQjV6cnIxM2FQZm5P?=
 =?utf-8?Q?CaOquqhSpLOQMlytgVggykttw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ea52d3-b85d-4f23-72a0-08de1b56d85c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 04:01:34.3697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ccIWbHxJ1yWCs9HS7ZatF8WpDMFGRo+7PlNBKdljlXbdWC8mCKAx9kszsTg7B1AltkmPMtAqHJ5Tl9KBiTUvWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAwMS8xMF0gZHJtL2k5MTUvYWxwbTogQWRkIGRwY2QgZGVm
aW5pdGlvbiBmb3IgRFAyLjEgYWxwbQ0KPiBjYXBhYmlsaXR5DQoNCipEUENEDQoqQUxQTQ0KDQpU
cnkgdG8ga2VlcCBhYmJyZXZpYXRpb24gaW4gdXBwZXJjYXNlDQoNCj4gDQo+IEFkZCByZXF1aXJl
ZCBkcGNkIGFkZHJlc3Mgd2hpY2ggd2lsbCBiZSBuZWVkZWQgdG8gZW5hYmxlIERQMi4xIGFscG0u
DQoNCkRpaXRvIA0KDQpPdGhlcndpc2UgTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFs
IDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiANCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8
am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5h
IDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL2RybS9kaXNwbGF5
L2RybV9kcC5oIHwgNCArKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1f
ZHAuaCBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gaW5kZXggZTRlZWJhYmFiOTc1
Li5iNGJhY2JjZjEzMGUgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2Rw
LmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiBAQCAtMTUxMiw2ICsx
NTEyLDggQEANCj4gIC8qIFNlZSBEUF8xMjhCMTMyQl9TVVBQT1JURURfTElOS19SQVRFUyBmb3Ig
dmFsdWVzICovDQo+ICAjZGVmaW5lIERQX1BIWV9SRVBFQVRFUl8xMjhCMTMyQl9SQVRFUwkJCSAg
ICAweGYwMDA3IC8qDQo+IDIuMCAqLw0KPiAgI2RlZmluZSBEUF9QSFlfUkVQRUFURVJfRVFfRE9O
RSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhmMDAwOCAvKiAyLjAgRTExICovDQo+ICsj
ZGVmaW5lIERQX0xUVFBSX0FMUE1fQ0FQQUJJTElUSUVTICAgICAgICAgICAgICAgICAgICAgICAg
ICAweGYwMDA5IC8qIDIuMSAqLw0KPiArI2RlZmluZSBEUF9UT1RBTF9MVFRQUl9DTlQgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhmMDAwYSAvKiAyLjEgKi8NCj4gDQo+ICBlbnVt
IGRybV9kcF9waHkgew0KPiAgCURQX1BIWV9EUFJYLA0KPiBAQCAtMTY5MSw3ICsxNjkzLDcgQEAg
ZW51bSBkcm1fZHBfcGh5IHsNCj4gICNkZWZpbmUgRFBfRFNDX0JSQU5DSF9DQVBfU0laRQkJMw0K
PiAgI2RlZmluZSBFRFBfUFNSX1JFQ0VJVkVSX0NBUF9TSVpFCTINCj4gICNkZWZpbmUgRURQX0RJ
U1BMQVlfQ1RMX0NBUF9TSVpFCTUNCj4gLSNkZWZpbmUgRFBfTFRUUFJfQ09NTU9OX0NBUF9TSVpF
CTgNCj4gKyNkZWZpbmUgRFBfTFRUUFJfQ09NTU9OX0NBUF9TSVpFCTEwDQo+ICAjZGVmaW5lIERQ
X0xUVFBSX1BIWV9DQVBfU0laRQkJMw0KPiANCj4gICNkZWZpbmUgRFBfU0RQX0FVRElPX1RJTUVT
VEFNUAkJMHgwMQ0KPiAtLQ0KPiAyLjI5LjANCg0K
