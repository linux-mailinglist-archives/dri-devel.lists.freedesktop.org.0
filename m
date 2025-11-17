Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27479C63280
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6510E377;
	Mon, 17 Nov 2025 09:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbrubCsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097F010E367;
 Mon, 17 Nov 2025 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763371617; x=1794907617;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KOnE/aCIpNKaP/ZT5Qaf7KQt7vdNJPt4V0X++eviob8=;
 b=nbrubCsz2d7Hyhll52XPo0cy56rIU/UhgWDuOLXwy5//EOwKVC1cQOAm
 qBzDguZJNSOy1KzOwkwVWQ7Xl+FNKsJk9Hc83qJt5v1ixoWbc70ud/Vsw
 VTJTPmLIPIBz9P7atAA7JjFvXUIBrq5/TvWGICagR3jJgUmfn7rV+iNBb
 gwIiSrIwFGs6l7lbh+A84ELmMAbbTf9L+wQ0NB0o4Vuf18ur9lNQ80FAS
 cpnLo5ohambab9W15No2v615/MPmcy263ZhdsmcAgIKovlB3Z875avh7l
 ttP3tbWvX7x9EjkQfdIkEIhaixsTizARrhjmt1v920/h98oV+NH8B1tOD g==;
X-CSE-ConnectionGUID: mW62YgJjSRKHGXRuE+Ap2Q==
X-CSE-MsgGUID: Q8HMkzqFQym5r6Fo4UFhZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="64368417"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="64368417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:26:56 -0800
X-CSE-ConnectionGUID: CYn0dJ9vSI2xj125iG0n8A==
X-CSE-MsgGUID: AKxjkWA0T0aJdM0Mv00P1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="189649401"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:26:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:26:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 01:26:56 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5R/0OJn+X8CH82/w4DLXrqH6WnKmkvr5ULuZiL0T5JsKZliFShyFmA8PQkMx4RQ4zh7GOpX6dMbaqa8iqlqtZ6VScUHJxMEZDDS7a7LdT/6pGDrvBPZb/KYNSIBCa2S7AkexkuQFVgS7U+nKv4oz7NomaCnbyI/Q2hx4Y2arsfoWTAVu3HWMNbQl+nzsmgYXXP2n/WL18sNETBdrouOrLNH5t2FYRcx8ZtXaQHTgZVXJ0pgP6Z1IsktCBhmeas/vcP3WvgI1Z/VCDnzmczGuNRfe1IJopxfsNpKKE9BN/wz1B5y94xUrhugSfgdQrM3Y/43gAMvm9sndIFpZAoMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOnE/aCIpNKaP/ZT5Qaf7KQt7vdNJPt4V0X++eviob8=;
 b=NbKMvDWvSwYxKJqDvlZHEt82Zgnc9Pn4zXaJ+flqUeG9oarQnHjqfC0KdYYVVUCK8cFlTF7TmBuaENT8G18kAW0fkkClHOwaYzZ8IiB6MfvlrqtRBGB6KW/wj1Sx7ueKTzHIXwjrWHjrdwFFAUjvqZZcTfuFSyWUI0325XJl13F7anpVh8FFpBZlSsNlhFE78RU6DJyjjXSOgziD//hImhQzZiL+UdHAPsGq4wIeY1q25C4eP9xMtUHc+OPLafs3WFqQwa8XV+T60JI2Fbrx2PF/i+bskUZzzcljgqlbkBMg0CO6kUvHAG4CDgPf6bAK+CBocZwib6JuZVVSuOYM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH2PR11MB8816.namprd11.prod.outlook.com
 (2603:10b6:610:285::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 09:26:53 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:26:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v4 07/10] drm/i915/alpm: Program LTTPR count for DP 2.1
 ALPM
Thread-Topic: [PATCH v4 07/10] drm/i915/alpm: Program LTTPR count for DP 2.1
 ALPM
Thread-Index: AQHcVJkip2ATh0GRaEqmTjsYm1d6KrT2naSw
Date: Mon, 17 Nov 2025 09:26:53 +0000
Message-ID: <DM3PPF208195D8D875AC833595F936FD4DBE3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-8-animesh.manna@intel.com>
In-Reply-To: <20251113120119.1437955-8-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH2PR11MB8816:EE_
x-ms-office365-filtering-correlation-id: cb1e3ef2-f9e2-4a3e-962b-08de25bb7218
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dVNhVllBdlltc0ZLcjNmR05ZMytkWEliZk1RRmk5QlFGSWNQazBDcnd4NzR2?=
 =?utf-8?B?NzVDRUhvZG5XV1lvUFBWMUdObHFNUXVCNVFqRHNXN05rZkg2VW1BeDVWUkpJ?=
 =?utf-8?B?UFhJWEtBN0NjZDZLdTFxZFJlOE1nRUpHM29xb21pVzk2RzJsSXlwQXMrSk9t?=
 =?utf-8?B?cjA2Y2Ywbm1ZdE1PZ3c0TmdPVlpGMFV0a0FJU1dNVTMySHU3UHRmTng0MDNC?=
 =?utf-8?B?eTFzemV3cmxnbnFBdUIrbERCMk12UGJTd0h0WW5rUW1UUVBLMUowbG9PaFR2?=
 =?utf-8?B?clVRbHhwdkd0Z3JNYkdBdkhxdGpTZExtN2N0K0JWNW1SUkZtQTBYQU5kbUVo?=
 =?utf-8?B?dlFDTEtTSEtvSEFMVjF6YTVSWFVIVm01Q3dsa0NYMWFxV1FtZXZzNFVjenhX?=
 =?utf-8?B?a0NMYU96bEtBc00zV0Y4eTlOOE1UWEc0RktocFF6NzduYWNTVzlPSXJRV2Js?=
 =?utf-8?B?V2l0UGtFMGxYdUtwZDNEWUNCMHVmWkpoRk5rd1kzUHEwT1lGejlQUTV2L1hN?=
 =?utf-8?B?N1hxWS81bHJEOFJwaWtDUjJQZElHdFJpOXR2aUUraEJBN1hQUWVqR3Q5d3FI?=
 =?utf-8?B?WmRISm9QQktPK1JCNVNmNDV0WGNYNEprNzQ4eHJ3eERDcFdwQkxGcHZVNmRY?=
 =?utf-8?B?YUpOaCtlR3o2WEk3d1pwdEt3b0NKejBNaFFQR1pycXpGcFByOTdkVmx6alRF?=
 =?utf-8?B?eXVGYS92d1AvVTZRZ3hXTFAxcUdTSHErQWZTeGpuZ2ZMVmZpb1NQV3FkQ0xv?=
 =?utf-8?B?V1lScUFNeTh1OVhHT3hEQThxTVF4MGRKYmE2WWdMUjBqSllVYlZGTjhiOXk3?=
 =?utf-8?B?bzJoWjl3dVB1MCsrdWJtbmx0cVlIVGdSTHpBeDdRQ2FLdVVDM25tWEUwY002?=
 =?utf-8?B?YU5QTXQ5bFJMT2w5OFJ6ejE5Vkw5U0Z3T3lCTFkvdWZNazB1MlEyakdvUnN0?=
 =?utf-8?B?ZE1laDVqNVl0V0FGN2VUZml6MitSNDZUclVldHpxYldNSXdtK1ZJNER3ZFNr?=
 =?utf-8?B?ZFM4UUswQnFFSVJyRVV2Z2x2elhUUnM5ZEdHTDhDVXRzWjV4dGlYNUwxTXRS?=
 =?utf-8?B?YUJ2YjkwRFZJMTFEZExpSlU5L2hqakNXZlRZdktBcmxRNzEra3V6L1YyTWs3?=
 =?utf-8?B?eENFU0wybFljdXRhZlc3TmxHSERyb0tGdWxpM2xmOGd4bCt4M0lLSUNmUHdH?=
 =?utf-8?B?Rk9kTTFKZUlUeUJGdEd0M1ZWTWNQT29TOWpweWNFRFRxcGRVeHEyWW0vM1pX?=
 =?utf-8?B?M3dIbDZqVmFJd21xWmFSSFNoNlY3dDdLbHZpQWhYbElQRzNjS2Z2NlE5c3JG?=
 =?utf-8?B?K1h1aWIrUGx4RzMvR0VERUd5cFc2QXFmU1NqN3lQaVQrYkZ4WW10dTBzZ0c3?=
 =?utf-8?B?eE5WcUg2RSsza2tZOGFpcEpXT0EzSGkzb2RRWSthSStWNnVmYVU4dGd1aHQ1?=
 =?utf-8?B?VmV0aDhjMzdjeGVqcmtoZFVSR2pyenhWWC9yb3RjaHA3NjRPRE1YMnd4Zytl?=
 =?utf-8?B?QlVDQmRFRGVaWXd5cHZBT3hZSWRVaVZzMHhVWFVjTll0MGVQZGNrYi9GOGpU?=
 =?utf-8?B?ME1IQW1LYWoyVDlvd0FRS3BSMXJRRlhBZlBnNnBZQzVzeXZyTmdtWnpIaWRO?=
 =?utf-8?B?aEs1MldzUDd1aEZyRzJzcjBqSUd2d1lBVGFnUVBzczhISXphS1I1aXNEL0po?=
 =?utf-8?B?cXZobllLZVhTbURCMHBuNjhITVpqWWZIaUNpUisrRVFyVnVzeWYrc01NS3hN?=
 =?utf-8?B?N1RUQ0RUdUl0cDg3bWVDUHd2VEtPOHVydGUxd1ZrTDI2TXNIY1d0L0pHdmJ5?=
 =?utf-8?B?ZmE5ZHpBd2pPd1VubnZ4VHo2dE5KTU5XLzN0VHJyNkxsNkFQM3BUKzRqUjF0?=
 =?utf-8?B?UE9haFA4VnRJSjRIYm4zTkVDNXc1VXZtc3U1d1FQV3NhRmZpbDFDNTdpR2lQ?=
 =?utf-8?B?MDlFVG5mcUE3RXpxdG5ZTTBMNjRnTFhtVFgwYjhqTWhtWnJwQUFDcVVFSVhB?=
 =?utf-8?B?ZmRtTTAvOXhJOWxJcFExZ3lDY0xNYWhsZjVsamlzdTdPWndKOWR1UHBBYVEz?=
 =?utf-8?Q?iiWNSA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUYvZEY2OFJxZThBQmJ3UVAralVIc1A1b1R4emZ5U0p3Rld5Wm1qdVVxQlIx?=
 =?utf-8?B?KytINmM0WkR6d2l2SC9tWWZQaERHQnptRlF2cEJGN3NucEhkUlRDMFIrMGFG?=
 =?utf-8?B?TVRMWkswcnV5bndsYlNyelY5dFhmWHJoOGZrRlNXbStqR1NjWFkrYSsvMkVS?=
 =?utf-8?B?V3hiUTZEOTU2Zkh6aHZxdFRoSVZ0NWlvb09WTExFWWtBVk43MVFOb1VxNjU2?=
 =?utf-8?B?ZjBObHZuY3l6amRLMGZpeG9zR1BzVVdlNWRVbmlqT1hYUmxjcFNxdUF2NEJq?=
 =?utf-8?B?VUNUTDRzQVBkekRISENMZVJqUk15N1NlcnNDcWE3dGdhd1lCQU9FVmRqOVVk?=
 =?utf-8?B?QmtxRU02K3VUT0M3M1AwMjhZRk1ybHlGMGlJcnZLZkpLRHIvREs1YjY4SVpi?=
 =?utf-8?B?N0YvYzJ0RGYxTGVEQTBleHpDOVB5VHBobEFRb0J1TVVqSENqci9iWjFNYWZR?=
 =?utf-8?B?cmNkcVR3L0I3eFMzZm5sNWpLVUkvSTlkNHVDNzhlM3Nwa3lsaHIwbzdaMzk4?=
 =?utf-8?B?ZVpBcmJGMHNocG4rVmVURFQ0dzhydm9XWkFZRXVpaXhoaFBHQklod3NyTy93?=
 =?utf-8?B?N1ZRVDFacVd4d3BpZkJPdUdITG1XOTRiZUFBeC9NcHQrajExWjcxWkpxSWZl?=
 =?utf-8?B?U2xwWmM1T3htTHRWeEdrQUVoOU91M3NMeEhROUs3RnZZOUNRUWZJUjB1SGMr?=
 =?utf-8?B?bXl2M0dzb2Q4OENJdGVmaGZFVWpRdERSQSt1alRTQnBXMnJaR3BxR3U0OEtU?=
 =?utf-8?B?L0Jwblg0QXdyM1hPMlBOUFQyY3hjOVJMUHZxTmM5K0I3cVpYK3Z0aW8wN2gy?=
 =?utf-8?B?NWNiL1hSU1lVcDJzU3FucytoSmwzVWt1THBmVkZBdEhzbWpIL1JXUWdGOFor?=
 =?utf-8?B?SVozMWdHSTVIOFBFcndBdEtxV0FyS3p4YUtlSXhMZGUzaENBOGpla2VuVFls?=
 =?utf-8?B?S09QcCsvcVY4b0RGR2RqWS8zRlllaWo2a29yNk43VUVBZTRDcWJkRDliZlpx?=
 =?utf-8?B?NmlLcytRdkVFUDdwZ2laVkQ0OUhzeDZ1Q2YwR0dWNjNoVS82bDN4cjJXcURY?=
 =?utf-8?B?MGxlWENqV3pxdWEycTVnU3NEdXVERXBEdHRITGxRQmRZdWpVZXYrbHI2R0h2?=
 =?utf-8?B?V0ZYU1IvSVN6SGdVNXRsU09vQm4wR1VOYys2S0J3ei9qemlkb3doWjlmc0ZO?=
 =?utf-8?B?RWZWb2U3OUhFRExrVnYrMHRIRnBuUGZGWTRvdjB2SDJxdkxQY0llTVBhRldY?=
 =?utf-8?B?NE5rTWIxVTlCZjI1MkhneXBpbkNrU2RpYXpaRlhiQlgrbWxsakNKRE1KK2Zj?=
 =?utf-8?B?VnU5VWMzSGp2ZmdON09iaVlyWnNkSXFoRzkzTGFTTmswanVCM2pvc2h2RE01?=
 =?utf-8?B?ckMxUTB0RVlkSDcxSEtRaGdCbVRBSE51ZFFzajFrbHYzVncrN2VlRkE5VVVq?=
 =?utf-8?B?dlA5MnpBY2RNMTdRUVZocktVYXFmZy9Ca0QvdFJQOVE5clErU2JyNHB3OGRT?=
 =?utf-8?B?NTVBZjFEeUN0M0ZNQy84OWl6N1lKQTBrZHUrUkYrRlJxTEdwbDE3OXNrdEFa?=
 =?utf-8?B?dlhQVDZuZk1scHlSVWU3bFZYVXo3MGdaTVVJeG9UWTJuS3REckN6QnlWYzJq?=
 =?utf-8?B?bG1ueG8zVHZOblVNbVdqQU0wUUJDWlUxSVpZRTlTN2RSUUlERmpSTG5UOC81?=
 =?utf-8?B?ejN1cXdhWXBpYXpBNmRxVXhUTjU1eWZIblVMTzhqV0pjSnROYmpFR2tUcnZO?=
 =?utf-8?B?T1FFRmNIVmp3OVhXcHFTczhDTUJXWCtTNGlaNHV2R21PYTNDeEI5SXVoY1Nr?=
 =?utf-8?B?ODFoZEhMUFkveDF0VklPWXV5NllsVGVJVksyMUhqNmxYUUVRd0JqaFhwMnkz?=
 =?utf-8?B?czJ3dlZUbWVBakl3YTZZc0dhbXV0OGdLUWgvN2JVd3JIN1RkeEdFWTUxMDNT?=
 =?utf-8?B?OEQ2WE12bFNMbDFHajF4Y3YyOEp0eGJ6NEZ2QmsxNWhLRjliT09nUFp5OFI3?=
 =?utf-8?B?UEo1Z1hKc2FkZ2lTNHFJTjNZREZwUitFd2dmYW5SeTNEUXNkVFZHVmprOXlr?=
 =?utf-8?B?OGYvS3V1a2pNeUp1L2ZwK3JCSUtLeWZISDhUWGtnT0ExOGFuUjhvZ0xOdDRK?=
 =?utf-8?Q?HUX970e35gcT3S13nhdb+DWWY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1e3ef2-f9e2-4a3e-962b-08de25bb7218
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 09:26:53.6210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Oay5xDu8ROfS2pMbuNOn1pSrEhf5cyyNKOn0GtVH8y1MQr9BdB5sAahpNrj44OnP3o3U8E+vrX8gJtZc+DXvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8816
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjQgMDcvMTBdIGRybS9pOTE1L2FscG06IFByb2dyYW0gTFRUUFIg
Y291bnQgZm9yIERQIDIuMQ0KPiBBTFBNDQo+IA0KPiBJc3N1ZSBhIEFVWCB3cml0ZSB0cmFuc2Fj
dGlvbiB0byBEUENEIERQX1RPVEFMX0xUVFBSX0NOVCAoMHhmMDAwYSkgd2l0aA0KPiB0b3RhbCBu
dW1iZXIgb2YgTFRUUFIgYmVmb3JlIGxpbmsgdHJhaW5pbmcuDQo+IA0KPiB2MjogQ29zbWV0aWMg
Y2hhbmdlcy4gW1N1cmFqXQ0KPiANCj4gQ2M6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5k
ZXJAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1h
bm5hQGludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9s
aW5rX3RyYWluaW5nLmMgICAgfCAxNiArKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190cmFpbmluZy5jDQo+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kcF9saW5rX3RyYWluaW5nLmMNCj4gaW5kZXggYWFkNWZlMTQ5
NjJmLi5kNjk0YzI0NzQxNTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBfbGlua190cmFpbmluZy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZHBfbGlua190cmFpbmluZy5jDQo+IEBAIC0xNjI0LDYgKzE2MjQs
MjAgQEAgaW50ZWxfZHBfMTI4YjEzMmJfbGlua190cmFpbihzdHJ1Y3QgaW50ZWxfZHANCj4gKmlu
dGVsX2RwLA0KPiAgCXJldHVybiBwYXNzZWQ7DQo+ICB9DQo+IA0KPiArc3RhdGljIHZvaWQgaW50
ZWxfZHBfdXBkYXRlX2x0dHByX2NvdW50KHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ICsJ
CQkJCWludCBsdHRwcl9jb3VudCkNCj4gK3sNCj4gKwkvKg0KPiArCSAqIFByb2dyYW0gb25seSBm
b3IgRFAyLjEgYW5kIHJldHVybiBpZiBMVFRQUiByZXZpc29uIGlzIGxlc3MgdGhhbiAweDIwDQo+
ICsJICogd2hlcmUgMDozIHJlcHJlc2VudHMgbWlub3IgcmV2IGFuZCA0OjcgcmVwcmVzZW50IG1h
am9yIHJldg0KPiArCSAqLw0KPiArCWlmICghaW50ZWxfZHBfaXNfZWRwKGludGVsX2RwKSB8fA0K
PiArCSAgICBpbnRlbF9kcC0+bHR0cHJfY29tbW9uX2NhcHNbMF0gPD0gMHgyMCkNCj4gKwkJcmV0
dXJuOw0KPiArDQo+ICsJZHJtX2RwX2RwY2Rfd3JpdGViKCZpbnRlbF9kcC0+YXV4LCBEUF9UT1RB
TF9MVFRQUl9DTlQsDQo+IGx0dHByX2NvdW50KTsgfQ0KDQoNCllvdSBuZWVkIHRvIGJlIHdyaXRp
bmcgdG8gQUxQTV9DVEwyW051bWJlcl9vZl9MVFRQUl0gYXQgc29tZSBwb2ludCB0byB3aGljaCBp
cyBub3QgYmVpbmcgZG9uZSBhbnl3aGVyZQ0KSSB0aGluayB0aGlzIG5lZWRzIGEgc2Vjb25kIGxv
b2sgdG9vLg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICsNCj4gIC8qKg0KPiAgICog
aW50ZWxfZHBfc3RhcnRfbGlua190cmFpbiAtIHN0YXJ0IGxpbmsgdHJhaW5pbmcNCj4gICAqIEBz
dGF0ZTogQXRvbWljIHN0YXRlDQo+IEBAIC0xNjYwLDYgKzE2NzQsOCBAQCB2b2lkIGludGVsX2Rw
X3N0YXJ0X2xpbmtfdHJhaW4oc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+
IA0KPiAgCWludGVsX2RwX3ByZXBhcmVfbGlua190cmFpbihpbnRlbF9kcCwgY3J0Y19zdGF0ZSk7
DQo+IA0KPiArCWludGVsX2RwX3VwZGF0ZV9sdHRwcl9jb3VudChpbnRlbF9kcCwgbHR0cHJfY291
bnQpOw0KPiArDQo+ICAJaWYgKGludGVsX2RwX2lzX3VoYnIoY3J0Y19zdGF0ZSkpDQo+ICAJCXBh
c3NlZCA9IGludGVsX2RwXzEyOGIxMzJiX2xpbmtfdHJhaW4oaW50ZWxfZHAsIGNydGNfc3RhdGUs
DQo+IGx0dHByX2NvdW50KTsNCj4gIAllbHNlDQo+IC0tDQo+IDIuMjkuMA0KDQo=
