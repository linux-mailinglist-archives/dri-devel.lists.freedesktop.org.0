Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C658A3573E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 07:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB17B10E47D;
	Fri, 14 Feb 2025 06:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHhhRspj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DD210E47D;
 Fri, 14 Feb 2025 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739515167; x=1771051167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mMLBS275gUFLXBRxFa1I/neQvvtMzu3mGlrCa4gJCAk=;
 b=gHhhRspjQsPHv5uThmbMJsM8dlxWjlZF4Zkg//84syFOFg9ikOIed0wk
 NHXHoEdMGoRzrtorOkLJwJcBj0PxfVqlmnjrsOZM0JSVhSn1T7Gs/xEus
 wgt3PB+TIL942tKeAxOETzOmLXFF7vndCT2TG8BatpNs4glkXvGVQ+aqQ
 cvnRbtQVBYlAjqoUuidhiC0BTCvlOUuY1GFlPgA9yxtYzA94e37e6FC73
 1n0jj0th8WcbGQTXVg8fKjSsIRj0VP5sa57FUt5xruGPmGWy1bCJblDUI
 2i31SBLYCXryMhuYhdpTvwTLwB2L6Pz4qYc62PIaROxktNQKjzuoPNzF9 g==;
X-CSE-ConnectionGUID: XRgVVc3lQ7u990rkiLnNCw==
X-CSE-MsgGUID: taNbuhS0SUO5UCdZc/ayFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39441297"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="39441297"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 22:39:26 -0800
X-CSE-ConnectionGUID: Yt5ilPptQfu9/IexZ5AStw==
X-CSE-MsgGUID: TyR+lqR2RcaMQiWUuADvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113236229"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 22:39:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 22:39:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 22:39:25 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 22:39:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAHcUC66Z5zodXx21SSc5SZM6cwKnXIuy5RO1CpvkZju0SowOrORmdLwy26nkUzrAX3dHC+Eo9pi8+FB+/x/QiHCa1f+djlSMavUsAjMezfjBDW/XnZIuDx8o02+4MfFYr8ewBoBQPNAKPVEc7fDKLwuBLClA2cDe682kAGKPh/ZibJlKy7GCUAxHjiwAxnr9T2wc5p4avnUfeuoI/0oz50asmlwJfS/4UvpCUx6RdsJ3JYWOIEo8+zsaUu/zGa5cUzFdnYuYch5JbNERbsIeubnR0HBtMOhiaB+LKRbR8RllkEZp1yiDqvMTSa/58rkJtbWJQtptYKqcoHhhgBGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMLBS275gUFLXBRxFa1I/neQvvtMzu3mGlrCa4gJCAk=;
 b=mm7w9ybsSggNFSXFDYnnEmDIGwJlFLHTx6NovJpVmqTm67IQwCzY3zF6lI+9Uuuv+WUFHttD/eHen97NY1qe0GKpvmADeFCRGTIyM8gs6an9hNcbr/dtbCFplPB0/I4J6a0AH4DGFfxpE7cpAURk+ydXqYU/XuSUYy68oltk/roQuyjMje+4QN3TLSCG17yYxskPIEP1Ni1+8KXZ7hwDNQ9UH+uIsMxE8XG9YXdPqqWxXeeDfgjzXgQuSVn0Hq3vr5eWX/joycfCwgyY6P5N8oVctUPHgsY/Ydui5HXlRlVIeR9+kcGN2mhpbcSC3iErH5cudw47CUSBoeYvKkPGQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 06:38:37 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 06:38:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Topic: [PATCH v8 01/14] drm: Define histogram structures exposed to user
Thread-Index: AQHbcZ6GaXhgZ7mp1kK5PNksT3xoN7NGcbKw
Date: Fri, 14 Feb 2025 06:38:37 +0000
Message-ID: <SN7PR11MB6750AEE4BC0324DC53217762E3FE2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-1-871b94d777f8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SN7PR11MB6726:EE_
x-ms-office365-filtering-correlation-id: 9879f35e-5d2b-436b-f196-08dd4cc23645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?R0lZaWZjT2NmdldJMm9IRzJxNjBaWEg5NFdsZzI4MFY4OTZUTzJrdkJ5L29Z?=
 =?utf-8?B?OVVjdWxkbEp2VzV1dCt4aEtuQVFVNGVvQjJtS0FqdlgybDdLTlk3V3RPdC8y?=
 =?utf-8?B?U0hyZVVGdWJ5cDE3SHZqMXYxV01uUXpMNWdaOHEveFhlLzQxZC93a0hDU3Vl?=
 =?utf-8?B?dXhPUlkyb0h6eHZic1BEWFRsRy9ITGlKUUJ3cklXU3RrRFNMQUhFNEkwdTF6?=
 =?utf-8?B?WUw1SU9OTVNEU3prZUhFbmh0UzNkNHdPMlZFbGRFbTNsWEIrOXE1WTlUOG11?=
 =?utf-8?B?Zy81cXpHeWNNN0RRR2VPb1J0aTUrSFR6MDRqSERiTG5hR0VzT01DZVZER1ZO?=
 =?utf-8?B?UDJkMUwzWk9iUWNxdlJJK20weURGNUxINHRrbmNzeVRMV2hmNnFiVHd5dllK?=
 =?utf-8?B?aVpHRWIzZWV2bHVLaFkrVDNTNHh1OVRDR1pFckgwMnlWOERrenlDOWNPWkFE?=
 =?utf-8?B?LzhRY1ZnVkhnaDRjck55Qlo0SC9Yc3hxYzNlMkdaU1hNRktKSUhXMWlMRW5t?=
 =?utf-8?B?RmptSkxJVHhvc2Q1SUNSTGkzcjY3aWx0RGdSWGk5MW9pVStqNEJFcGtkUkpa?=
 =?utf-8?B?SGlPRENkR3pqTU92bzl5amdFZjVBQU84cGx4UkZiWHNCMnBNa21FTXdmWFpB?=
 =?utf-8?B?VTRsOWx5UTNiYytHOGZ4MnFsTnBCWUNhMnhQTDkzTHRRc3VTa3k1bFlxRGx4?=
 =?utf-8?B?THU4Y05RNVJGdHdZVWxHRGVYNEE3SDFJSnNUaHlrZHIrdHlPSmlONlBQUklD?=
 =?utf-8?B?NWVRV1VHcWdSZXl1ZWxmOGZxNkhwOGVIWXZUc2hGOUc2akVwTWZXNkZoUzlw?=
 =?utf-8?B?dVJlSFJraGxyckVpaVVCZG5VZS9kb0NxdHVKVW9yZ3FMMDY5K1RRRXhsdkd1?=
 =?utf-8?B?bjE0M2xyNXpSdmRiazg1Ym44TDAwUGFERFVOK0lKQVNWQ0RtUHl5RzVkMWVp?=
 =?utf-8?B?R2FaNEpScitleGh3SWVpcjJFdUNWRmxsWUl6bXE5cjQySktIdy9CMURyM2lJ?=
 =?utf-8?B?aEd3TXBodTlsR25OT3AycitRaDBqeU5VeEc4eFFQcUFBdGlscy95bDBrVzNV?=
 =?utf-8?B?cnVrT0NZYngyc2VoMnU0Wm9ieE1OZ3dHaFhMY3hMZ2U4Um13dlhsbWVaSkV3?=
 =?utf-8?B?a2dXTWhLR0VGTFhWeXRmSVhZMUoxMnN1YmNEdU03ZmJXTlBVbndZcnMrT2d6?=
 =?utf-8?B?UEVhdWlTUk4zdUxvNFJNL2lTL0VBL2NTVFI1RFRkWkNaRC81ZVA3V3VXbDV3?=
 =?utf-8?B?cW1BelFPNEQ0QkFjWjFMVFlGcWRpSHA2QW1tWnkrNWZOOTFXN2RUUkdsU1dB?=
 =?utf-8?B?alFsdDA0MkhrVEw4U21FNnRQLy9QaVVuVGFYVlMwZ1h3ZTdrblpIdW9mbXF2?=
 =?utf-8?B?VGhXVCtFbjd1NC85OTAvSnNwQ1dJaUIzcWVaRkdlWkhHNEF2bzlBUHphaUNs?=
 =?utf-8?B?bEd4TXgvUGt0bC9Rc2ZRVjBqallkajhOb01YVDZKd05uRENMeWtJVWhKemJi?=
 =?utf-8?B?emdlUWo5cGV4NSthci9pcjBqSE5TWldialBucm9mN0s5N2VqKzVDd1gxYXFD?=
 =?utf-8?B?ZXpMMGxVak1NcmZQNnBZZEJpNkJpVjdpRVROR1dPVmkwRDdhN3RLNG5WZi91?=
 =?utf-8?B?OHdyOU9PZ2FPNXRzVE1qZHZURXNMQ0lYTjByai9JaG1HZWRMdmlwdkhqS2hm?=
 =?utf-8?B?ck1ySnlEWkNLR05QNmdUbGZSOGFLWjFJR2FlNC82YTlMbEVBWHBXWjJtRS9Z?=
 =?utf-8?B?UGZDM2JXdkRkUEFlSkJobjFGMjZueGgvcEpmc09iOEsrWUJpRXZEZEEzOWJZ?=
 =?utf-8?B?YXpmVFJXdGVRZGhGTlVWTXRCazYrd0FzS0JPekZiOFpPaktwbDc1NDlSVXln?=
 =?utf-8?B?SUJ2ZkVadEk3NXRLRytPcFhaVnVsSlR5L3FBYUpXNGd4aUliSUg4bzJleGdS?=
 =?utf-8?Q?LboZxKxd8DYlwkft7d74inRKeOdCgTvC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dm4xRGVZc0dkVWpldkc1OGoxaVpYYlN4cGpNbXRFQVdod3hiTzNBT2FOaXlF?=
 =?utf-8?B?YkRyOU0xczAya2ZnTW5ueUlkM3FQUUhTUlZJVFNSY0xaVzY5bU1ONjNWenFi?=
 =?utf-8?B?RDNaSEw4aGw3eDFBS2phcmVaQmU0TDFkVjVBdWhrQ3d6UGJZWk1rT1JQNGNC?=
 =?utf-8?B?cEFxeUJWTVMyckxrNzhCMytXY0V1THV6RzhRQklNZHVDQ2JwaE41cmFPZDcx?=
 =?utf-8?B?ZTVWRGJEdDBKQ3hoOG9raThaWUdtMEVNK0R2Z0l2MVZUeDh6Ni9FcG95OHRS?=
 =?utf-8?B?Z1pxK3k0TXR4UGszbE1FWlFLby81M1FaVFloSUNBZkdTcmlFTW9QVDkxditm?=
 =?utf-8?B?VUsxV1duZTBGRWp3Q21uUjhtUU9WQ0FCTS9lWXBoZFJnd3Y3VGZ3MzltUG1S?=
 =?utf-8?B?b3NXZ1REZ3owR3JUL2U4dVp5NVlTSWVEMDdocW4xT3EzMnowdjB4YXFnZ0NZ?=
 =?utf-8?B?ZkM0MDBYc3J0YmpzQUM5bDdGL1BrTDhjaDZBeVo5b3pRQkxPeW56L1k3ZWR3?=
 =?utf-8?B?TGtOS3FlYllwMGNVVTlmOFhFRUt4VzkvOTcwR21FdVFKVWM4WDFUdWNKUXBh?=
 =?utf-8?B?YjBueVB1QXVhd1NidDdGZGhDVnBDeXNIL2laYnBXZE1HK0o3eldhMmFIMTFD?=
 =?utf-8?B?dE9VWFFQRXFMMnhCaWIweEMzTi9rYW9MZS8wWm9oMEdSUDV1Rm5xajhValk0?=
 =?utf-8?B?ZnlscS9sdWtxdEo5V1JYUEoySWR5b1pTdTQrbUpRVmpIS1pjN2xpb2k5eER6?=
 =?utf-8?B?WlNiY2xyOUpwcGF1dlJ5dXlQbnh5NzhxTHRlbHFJQllOMThTV0FCSDZVVU4w?=
 =?utf-8?B?d3B4Z0FqaWRyTEY0ZEh2TW8vSDFOR2p5V0Jac29hcy9qWjJuVTJCWk5ybTZQ?=
 =?utf-8?B?djJSSlFUclFDVkdmY21oN0NwaU9HbXBkM01HZDhubVJjY3MxR0pFNmgyaEU2?=
 =?utf-8?B?RVgwaTBwc0VsWXdmU1dzbGUzdFBaVCtVOHM2ZmlXL1BzbmlleHRXRE05SHpq?=
 =?utf-8?B?REY3YzN4OVdBb0xkd3dVODdlM2krcGkrbHRoSmY2T0lKL3F0cFgwdS9oRWRa?=
 =?utf-8?B?bDllNUl2NU5UVU5aZjlYNi9OSTB2YUtHdHVrdFgzS2lzK3lJZVFhUHMyWlRZ?=
 =?utf-8?B?UkZKNkFkZG03dTY4OE91a2dNeTVnenJSL2dNR2ZHMFNMQ0RoL04xbytyeHls?=
 =?utf-8?B?ZFRBb1lkN3p5RS96TnBYNTBocm9ZY3VpTEg1NW1pSGRNb2RmL2lBQTRsam9P?=
 =?utf-8?B?RDRRQ1h2NEZGOHZMVVkrQlphK0RnSUE3eU9lbzEwYU9xYnVkUkFteEV1TElI?=
 =?utf-8?B?RzVaUTUybnR2RWY5ZG5FSHBZVGlSWHpmQzI2cGdhejd0M1BZUXpRNEZTN2gx?=
 =?utf-8?B?bEdVbkJVZGRjTnRIbzdqMXRGRkdNN21ucUdOK1BaMDZUby9Qc1FFWUxJUm40?=
 =?utf-8?B?alFvWmIrSVFwOHBuTE5yUGtNcUZlVHhSMGlkTmtjdTUxdmkxemYzcjh6bm42?=
 =?utf-8?B?MTdlK1d6NEduekxHdWNGTmZrUDdWWm5vTzRZSGE0NkRFOXRPTTZoUGdHZHlI?=
 =?utf-8?B?S2gzMkNUTGFHbjNoV3cvK2xUTzZpdGRvSnI1UjBZeHo1cHFCcUw5SnFRcS9x?=
 =?utf-8?B?TkI3ZGhBUlU2VEd3MG9wSnp5R0pacHlUUGI0MkFKQi8vcHdnTXZ3OFR4emlS?=
 =?utf-8?B?bjFsd3JBZngwaXBVRTh2VjRGUVhrUk0yaHB1bkZkWXhrb0NSeExFZ0JXZkcv?=
 =?utf-8?B?UjkyTWNyVjliSXEyV2NVdFIyOFpEWGkyNGw4Zkx5c1NNZksvdWdVNVZpV21E?=
 =?utf-8?B?S0pSc3FLMXlLUzZUSTNHVkVyUEdmTU9CYVlxSTFHemt6N0dTckZDbytRNzBt?=
 =?utf-8?B?blhCZHhiQXVRNTZTTUo0cWZlN3o3NXhXVnVlemdLTzlNY1BiWWYzQ3JqZnpw?=
 =?utf-8?B?WldVQVRwVU10SU5iZWhPbVh0My9tREM4d1ErUEpIcjM2a0JZOXpxd2RETjAx?=
 =?utf-8?B?OWprN2NrSk1pclV4a1hBREFnSkgyU3JsMHVFM0JSeUpzWmlNNkNDVTNBOHFP?=
 =?utf-8?B?enQwWVJhK0I5SVdDN2gvRGk2c0dMWWZ4T2tjekJEV3FDMVFTdG9ZTzdYOEU4?=
 =?utf-8?Q?G9COn6lOirNTSxVbH/Ixg+0MY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9879f35e-5d2b-436b-f196-08dd4cc23645
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 06:38:37.4118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NURnLy7zNUfK3FW+JPIADjQ6hwNekW5V2o003SBcHSefL3fIWM2dkJKEl/XN9jeUDF/zONniwoJh/GGeDDVXIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
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
aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjggMDEvMTRdIGRybTogRGVmaW5lIGhp
c3RvZ3JhbSBzdHJ1Y3R1cmVzIGV4cG9zZWQgdG8gdXNlcg0KPiANCj4gRGlzcGxheSBIaXN0b2dy
YW0gaXMgYW4gYXJyYXkgb2YgYmlucyBhbmQgY2FuIGJlIGdlbmVyYXRlZCBpbiBtYW55IHdheXMN
Cj4gcmVmZXJyZWQgdG8gYXMgbW9kZXMuDQo+IEV4OiBIU1YgbWF4KFJHQiksIFdpZ2h0ZWQgUkdC
IGV0Yy4NCj4gDQo+IFVuZGVyc3RhbmRpbmcgdGhlIGhpc3RvZ3JhbSBkYXRhIGZvcm1hdChFeDog
SFNWIG1heChSR0IpKSBIaXN0b2dyYW0gaXMganVzdA0KPiB0aGUgcGl4ZWwgY291bnQuDQo+IEZv
ciBhIG1heGltdW0gcmVzb2x1dGlvbiBvZiAxMGsgKDEwMjQwIHggNDMyMCA9IDQ0MjM2ODAwKQ0K
PiAyNSBiaXRzIHNob3VsZCBiZSBzdWZmaWNpZW50IHRvIHJlcHJlc2VudCB0aGlzIGFsb25nIHdp
dGggYSBidWZmZXIgb2YgNyBiaXRzKGZ1dHVyZQ0KPiB1c2UpIHUzMiBpcyBiZWluZyBjb25zaWRl
cmVkLg0KPiBtYXgoUkdCKSBjYW4gYmUgMjU1IGkuZSAweEZGIDggYml0LCBjb25zaWRlcmluZyB0
aGUgbW9zdCBzaWduaWZpY2FudCA1IGJpdHMsDQo+IGhlbmNlIDMyIGJpbnMuDQo+IEJlbG93IG1l
bnRpb25lZCBhbGdvcml0aG0gaWxsdXN0cmF0ZXMgdGhlIGhpc3RvZ3JhbSBnZW5lcmF0aW9uIGlu
IGhhcmR3YXJlLg0KPiANCj4gaGlzdFszMl0gPSB7MH07DQo+IGZvciAoaSA9IDA7IGkgPCByZXNv
bHV0aW9uOyBpKyspIHsNCj4gCWJpbiA9IG1heChSR0JbaV0pOw0KPiAJYmluID0gYmluID4+IDM7
CS8qIGNvbnNpZGVyIHRoZSBtb3N0IHNpZ25pZmljYW50IGJpdHMgKi8NCj4gCWhpc3RbYmluXSsr
Ow0KPiB9DQo+IElmIHRoZSBlbnRpcmUgaW1hZ2UgaXMgUmVkIGNvbG9yIHRoZW4gbWF4KDI1NSww
LDApIGlzIDI1NSBzbyB0aGUgcGl4ZWwgY291bnQgb2YNCj4gZWFjaCBwaXhlbHMgd2lsbCBiZSBw
bGFjZWQgaW4gdGhlIGxhc3QgYmluLiBIZW5jZSBleGNlcHQgaGlzdFszMV0gYWxsIG90aGVyIGJp
bnMNCj4gd2lsbCBoYXZlIGEgdmFsdWUgemVyby4NCj4gR2VuZXJhdGVkIGhpc3RvZ3JhbSBpbiB0
aGlzIGNhc2Ugd291bGQgYmUgaGlzdFszMl0gPSB7MCwwLC4uLi40NDIzNjgwMH0NCj4gDQo+IERl
c2NyaXB0aW9uIG9mIHRoZSBzdHJ1Y3R1cmVzLCBwcm9wZXJ0aWVzIGRlZmluZWQgYXJlIGRvY3Vt
ZW50ZWQgaW4gdGhlIGhlYWRlcg0KPiBmaWxlIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0K
PiANCj4gdjg6IEFkZGVkIGRvYyBmb3IgSERSIHBsYW5lcywgcmVtb3ZlZCByZXNlcnZlZCB2YXJp
YWJsZXMgKERtaXRyeSkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4u
ci5tdXJ0aHlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUu
aCB8IDY1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgN
Cj4gaW5kZXgNCj4gYzA4MjgxMGMwOGE4YjIzNGVmMjY3MmVjZjU0ZmM4YzA1ZGRjMmJkMy4uYjhi
N2IxODg0M2FlNzIyNDI2M2E5YzYxYg0KPiAyMGFjNmNiZjVkZjY5ZTkgMTAwNjQ0DQo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2Ry
bV9tb2RlLmgNCj4gQEAgLTEzNTUsNiArMTM1NSw3MSBAQCBzdHJ1Y3QgZHJtX21vZGVfY2xvc2Vm
YiB7DQo+ICAJX191MzIgcGFkOw0KPiAgfTsNCj4gDQo+ICsvKioNCj4gKyAqIGVudW0gZHJtX21v
ZGVfaGlzdG9ncmFtDQo+ICsgKg0KPiArICogQERSTV9NT0RFX0hJU1RPR1JBTV9IU1ZfTUFYX1JH
QjoNCj4gKyAqIE1heGltdW0gcmVzb2x1dGlvbiBhdCBwcmVzZW50IDEwaywgMTAyNDB4NDMyMCA9
IDQ0MjM2ODAwDQo+ICsgKiBjYW4gYmUgZGVub3RlZCBpbiAyNWJpdHMuIFdpdGggYW4gYWRkaXRp
b25hbCA3IGJpdHMgaW4gYnVmZmVyIGVhY2gNCj4gK2Jpbg0KPiArICogY2FuIGJlIGEgdTMyIHZh
bHVlLg0KPiArICogRm9yIFNETCwgTWF4aW11bSB2YWx1ZSBvZiBtYXgoUkdCKSBpcyAyNTUsIHNv
IG1heCAyNTUgYmlucy4NCg0KVHlwZTogU0RSDQoNCj4gKyAqIElmIHRoZSBtb3N0IHNpZ25pZmlj
YW50IDUgYml0cyBhcmUgY29uc2lkZXJlZCwgdGhlbiBiaW5zID0gMl41DQo+ICsgKiB3aWxsIGJl
IDMyIGJpbnMuDQo+ICsgKiBGb3IgSERSLCBtYXhpbXVtIHZhbHVlIG9mIG1heChSR0IpIGlzIDY1
NTM1LCBzbyBtYXggNjU1MzUgYmlucy4NCj4gKyAqIEZvciBpbGx1c3RyYXRpb24gY29uc2lkZXIg
YSBmdWxsIFJFRCBpbWFnZSBvZiAxMGsgcmVzb2x1dGlvbg0KPiArY29uc2lkZXJpbmcgYWxsDQo+
ICsgKiA4IGJpdHMgaGlzdG9ncmFtIHdvdWxkIGxvb2sgbGlrZSBoaXN0WzI1NV0gPSB7MCwwLC4u
Li40NDIzNjgwMH0gd2l0aA0KPiArU0RSDQo+ICsgKiBwbGFuZSBzaW1pbGFybHkgd2l0aCBIRFIg
dGhlIHNhbWUgd291bGQgbG9vayBsaWtlIGhpc3RbNjU1MzVdID0NCj4gKyAqIHswLDAsMCwuLi4u
NDQyMzY4MDB9DQo+ICsgKi8NCj4gK2VudW0gZHJtX21vZGVfaGlzdG9ncmFtIHsNCj4gKwlEUk1f
TU9ERV9ISVNUT0dSQU1fSFNWX01BWF9SR0IgPSAweDAxLCB9Ow0KPiArDQo+ICsvKioNCj4gKyAq
IHN0cnVjdCBkcm1faGlzdG9ncmFtX2NhcHMNCj4gKyAqDQo+ICsgKiBAaGlzdG9ncmFtX21vZGU6
IGhpc3RvZ3JhbSBnZW5lcmF0aW9uIG1vZGVzLCBkZWZpbmVkIGluIHRoZQ0KPiArICoJCSAgICBl
bnVtIGRybV9tb2RlX2hpc3RvZ3JhbQ0KPiArICogQGJpbnNfY291bnQ6IG51bWJlciBvZiBiaW5z
IGZvciBhIGNob3NlbiBoaXN0b2dyYW0gbW9kZS4gRm9yIGlsbHVzdHJhdGlvbg0KPiArICoJCXJl
ZmVyIHRoZSBhYm92ZSBkZWZpbmVkIGhpc3RvZ3JhbSBtb2RlLg0KPiArICovDQo+ICtzdHJ1Y3Qg
ZHJtX2hpc3RvZ3JhbV9jYXBzIHsNCj4gKwlfX3UzMiBoaXN0b2dyYW1fbW9kZTsNCg0KRG8gd2Ug
cmVhbGx5IG5lZWQgX191MzIgZm9yIGhpc3RvZ3JhbSBtb2RlIGRvbid0IHlvdSB0aGluayBhIF9f
dTE2IHNob3VsZCBzdWZmaWNlPw0KDQoNCj4gKwlfX3UzMiBiaW5zX2NvdW50Ow0KDQpOaXQ6IGJp
bl9jb3VudCBzb3VuZHMgYmV0dGVyLg0KDQo+ICt9Ow0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVj
dCBkcm1faGlzdG9ncmFtX2NvbmZpZw0KPiArICoNCj4gKyAqIEBoaXN0X21vZGVfZGF0YTogYWRk
cmVzcyB0byB0aGUgaGlzdG9ncmFtIG1vZGUgc3BlY2lmaWMgZGF0YSBpZiBhbnkNCj4gKyAqIEBu
cl9oaXN0X21vZGVfZGF0YTogbnVtYmVyIG9mIGVsZW1lbnRzIHBvaW50ZWQgYnkgdGhlIGFkZHJl
c3MgaW4NCj4gKyAqCQkgICAgICAgaGlzdF9tb2RlX2RhdGENCj4gKyAqIEBoaXN0X21vZGU6IGhp
c3RvZ3JhbSBtb2RlKEhTViBtYXgoUkdCKSwgUkdCLCBMVU1BIGV0YykNCj4gKyAqIEBlbmFibGU6
IGZsYWcgdG8gZW5hYmxlL2Rpc2FibGUgaGlzdG9ncmFtICAqLyBzdHJ1Y3QNCj4gK2RybV9oaXN0
b2dyYW1fY29uZmlnIHsNCj4gKwlfX3U2NCBoaXN0X21vZGVfZGF0YTsNCj4gKwlfX3UzMiBucl9o
aXN0X21vZGVfZGF0YTsNCj4gKwllbnVtIGRybV9tb2RlX2hpc3RvZ3JhbSBoaXN0X21vZGU7DQo+
ICsJYm9vbCBlbmFibGU7DQo+ICt9Ow0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBkcm1faGlz
dG9ncmFtDQo+ICsgKg0KPiArICogQGNvbmZpZzogaGlzdG9ncmFtIGNvbmZpZ3VyYXRpb24gZGF0
YSBwb2ludGVkIGJ5IHN0cnVjdA0KPiArZHJtX2hpc3RvZ3JhbV9jb25maWcNCj4gKyAqIEBkYXRh
X3B0cjogcG9pbnRlciB0byB0aGUgYXJyYXkgb2YgaGlzdG9ncmFtLg0KPiArICoJICAgICAgSGlz
dG9ncmFtIGlzIGFuIGFycmF5IG9mIGJpbnMuIERhdGEgZm9ybWF0IGZvciBlYWNoIGJpbiBkZXBl
bmRzDQo+ICsgKgkgICAgICBvbiB0aGUgaGlzdG9ncmFtIG1vZGUuIFJlZmVyIHRvIHRoZSBhYm92
ZSBoaXN0b2dyYW0gbW9kZXMgZm9yDQoNCkkgdGhpbmsgeW91IGNhbiB3cml0ZSB0aGUgZHJtX2hp
c3RvZ3JhbV9tb2RlX2NhcHMgaW5zdGVhZCBvZiB3cml0aW5nIGhpc3RvZ3JhbSBtb2RlDQpTbyBw
ZW9wbGUgY2FuIGRpcmVjdGx5IGp1bXAgdG8gaXQNCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwN
Cg0KPiArICoJICAgICAgbW9yZSBpbmZvcm1hdGlvbi4NCj4gKyAqIEBucl9lbGVtZW50czogbnVt
YmVyIG9mIGJpbnMgaW4gdGhlIGhpc3RvZ3JhbS4NCj4gKyAqLw0KPiArc3RydWN0IGRybV9oaXN0
b2dyYW0gew0KPiArCXN0cnVjdCBkcm1faGlzdG9ncmFtX2NvbmZpZyBjb25maWc7DQo+ICsJX191
NjQgZGF0YV9wdHI7DQo+ICsJX191MzIgbnJfZWxlbWVudHM7DQo+ICt9Ow0KPiArDQo+ICAjaWYg
ZGVmaW5lZChfX2NwbHVzcGx1cykNCj4gIH0NCj4gICNlbmRpZg0KPiANCj4gLS0NCj4gMi4yNS4x
DQoNCg==
