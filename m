Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8C8BA789
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AE410EE2B;
	Fri,  3 May 2024 07:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpU7Lngw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E460110EE2B;
 Fri,  3 May 2024 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714720771; x=1746256771;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A3O61M6TRGAWsgQq+ASzHP7GKr5+uhzqIyMMZ/KHE8M=;
 b=BpU7Lngw1/vfaQ3bKJ4YvjYzvrNOsDWt5o6XnVROJY9ifVS3qNqTsHGq
 WZjDzDf7sv3YUww3H4VSE5+cHB9kZQbJvXA/N9+4WyuRyNzVMVy3673Eq
 g9tQTP+McTIFIb6OV76t/q1YWrLxYcHdMd52gGyppduA09N4yaI9WaXSa
 arAm3pwACkNdOq4X0vhpBuWZIw7HkwPDOYNljYPM/hyjJ5LUL30th/CBj
 4BYHY90101tFDDuRCkgeCQdR2zQnxLwekCd11Jzic5rIydSfHQcU5ACS6
 Snm7AeCBygSiM18NdPK7Fx7wWui7vo45RYRFgUm5t77U2fAcN5MuPJfjg w==;
X-CSE-ConnectionGUID: 79Mc3MGvRfCa5y65yfh0XQ==
X-CSE-MsgGUID: t89C0zNNTeGhfqlDK8eSnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="33031265"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="33031265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 00:19:22 -0700
X-CSE-ConnectionGUID: iIMbbribQR6GLdpDkk/xsg==
X-CSE-MsgGUID: z3ob3Ds+S/2qI3RFOHkg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27780725"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 00:19:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 00:19:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 00:19:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 00:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lz6rgfzU2YpoTENMgjokD1MY3Gnmb57zLdb0aLJ60mNRpADELwgPL2X/PvQybmt8rFOIua/qfp3F6J41+pQcZpR48EsPKyYuBPfRcx6J8XvEilZaDCj171bz+vZ5xCPaEDzkdolJufK0QAXLYUWJ/3nufTefuPs6vkRunXz3a3zB+c9OqxI/RBuTQrn/C2hxpW58EHJ8b2rfsWOSqru4mB6OFvCvIf36T5iNwnxZKchKKJBM6VaBtfoINh0CHTINMYAndt8Zuu7ngl09ulWexLgz20m7UKGWCgx5pJsazjH6VExhojvm8n9vY+O//SxYDI0Jfiz6/1rmeMum9xLirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3O61M6TRGAWsgQq+ASzHP7GKr5+uhzqIyMMZ/KHE8M=;
 b=ZmnKTvclr2SvHXs05bAB2TKVstwAyGmZpbECesR57hWo2kgroOqD0w59tZL69QdzjzsFMRQ9zijBWhnsIqOR2lBY+VXyBYLo+8b+TdF280CuMiFml5BxMp6edtpoo01a0nVnY9paC0IZXzDMRjAysNh7xDfUYgaU9G5qep04QeTB6P5T+aNc3mPY+p5g7Wfwz3iKZZ8iOWK0rSagZLU1odh94PgUlUYxr7jrTB354x6vguMrpps2vmPdsAgWLgGnw/4dOMfu8ODjnDpFfUoYp2t5QWO3jUr+cax8mOIpJG3TkVd9pFbMrCGEL5/wZ2QIhQHdVbxOsCvkT8hW+iI75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB7634.namprd11.prod.outlook.com (2603:10b6:510:28d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Fri, 3 May
 2024 07:19:17 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 07:19:16 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v3 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Topic: [PATCH v3 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Index: AQHalnjV67PoszZcv02I3ugSYPFh3rGFJ3aA
Date: Fri, 3 May 2024 07:19:16 +0000
Message-ID: <914be5e4dc5c6bebb03511637fb104126f141247.camel@intel.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-5-animesh.manna@intel.com>
In-Reply-To: <20240424183820.3591593-5-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB7634:EE_
x-ms-office365-filtering-correlation-id: 7de1766a-d20b-46a6-bc02-08dc6b41578c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?OGFpYmxPdmlHRSt6MFhxd0lMT1BMZFBuUTY1cVNaenlYK1FKS0FnSkdReTJ5?=
 =?utf-8?B?ZlRYVXphajhQZG12Tk9wNzRvVXdFN2hZWTRBcG1PSUxwNkc5YzBBWHM5ODVz?=
 =?utf-8?B?V3g2eWFZcnhoUExkYVljTlhxKytEZGRnRStVRklRZjNVOVJ6L1plV3grTXVQ?=
 =?utf-8?B?QkJjVEtZbS92ZmYvTWpqQ1BoWkwyMUdnSFNoa3hlU1M1Ritsbko4SEY3emJH?=
 =?utf-8?B?S2NUL2EwcTVKeDZHbjliK1VhTVJCb3p4Q2MrMXZaTm95dW1OY085NExLeUJi?=
 =?utf-8?B?RjRScEwra3U5QjVua0dQcERaTklnZmczRHFRZ09udE96VElGS3FKcnJFaExM?=
 =?utf-8?B?RkRsdnBDU2ZIbkwzeFppQXRuRXVtOHdyVEEwZnFBZUUvZXZWMlFMR1FqWDdD?=
 =?utf-8?B?T3NvbWZXNVJ0Tm9DOUVjc1FiQkpxNlg3eXFOQWZRQnN4eWNnM3VSR0ZWUGN5?=
 =?utf-8?B?bkZvUTFxMUlTWUFGKzFBd2gxVWl3UkQxQ1ZmN1BaeWhrSE5na0dibnZrZEYr?=
 =?utf-8?B?bTFqYVJvNDdIUXJNeFhiZFlRWVlaZElhbjJsMkE5L0tiOTB2VUxmL3p4RkZO?=
 =?utf-8?B?eUxjMDVqaUZSS0htVERlUHg5eEJDRGN6OURKQVdKam5tUzBtVHhoeFZyUzFF?=
 =?utf-8?B?cDBudkhURGYzY01QdGNkVWN6dDlTdHI5OFgrYWpkV3BjcHF4aFBxeXA4akVh?=
 =?utf-8?B?OTlxbzcza1paVVFlSFZkejBONElVQTV5bHBzU0ZMODZGTTU0ZHN3Y0NWMkxT?=
 =?utf-8?B?d3JLL3hndFhUZzAxOXozbkJWSmMzNzRleE9CT3J2ZklRa1dGZUh1UDQwS0Ix?=
 =?utf-8?B?V25uaHJ6TjF1SmRad0oyRG5OcGx1U3ZMVVNVK1YyRzRsZ0E0ZlJuZnB4RXhL?=
 =?utf-8?B?WXdMN3U0ZXRncFhhUEZzZmFTQ3MySWpWV2lwRiszZmhzUEZvWFVDeWNBUXU1?=
 =?utf-8?B?Zlp1c0lhSG5NRzFQMjlubVJJMm1hemwzSEVOcjhCMXNlYitMbGtzbjFrOU0x?=
 =?utf-8?B?eGRWaDNpUXFUNzI3ck40cUg2U2lSMnpXNDZ0TU5ZZE83WFpuRFdORGNnOG5w?=
 =?utf-8?B?KzRRdWdhT0RrMWdWcWZhajNMYWZ1a2Z5QUN4S3VMSVhlZW52R1JsZDhwNHpv?=
 =?utf-8?B?bTVIT2IrNVhWRE9IaVkyTktJa0thV08wWnpRcUc3cmpUVVovR1ljVGxlVjJN?=
 =?utf-8?B?Szd1ZEQ4NU9RSGwvbHdJZFdqdDhIZStIQ0FXS0VZTlNPTmprMm0rMVdsdytn?=
 =?utf-8?B?dlVuSjRzTTdlNGJqVlErZEZBNENYVmJCOEhoR0pFazZnaXkrcG1jTTdUdCsx?=
 =?utf-8?B?L1RLQVJ0TjNuQ0VaTWU1VzRwTGE0T1d5RHh4MHB4UTd2L0c3SFN6WUhrbnlO?=
 =?utf-8?B?bkUzay9hdkx5UDB4YmliK0FvOXB4STNJZ1QyZ1BlcDFFK1JDQ3QzMDA4YjZW?=
 =?utf-8?B?d3NqbDhQRTh0bmp2dlpWTlVpVjB0K3pVczZJT0Frb05oZklEVlFLejViUUMv?=
 =?utf-8?B?ZGhyc0tTTldGcC93SGorVXl0WTc5UDhGVzFkWGdZdjdWdklRMzg2NEFmbXAx?=
 =?utf-8?B?L0lFM29jZUM1TU9mZklTZlVabE1VOUp3N21PZFNKN1R4elJKaGpCNkZrTWJ2?=
 =?utf-8?B?ZjRobFJIK2YwN3VNKzFvZUpBcUxpaWlLOFZvWllLckRaNXRBdHJ3Mm9MWHhO?=
 =?utf-8?B?dFZXRTlOUU01UGFFZGtPanZDd1VIbGcremQ5T3UzU1ZrSzhaOU05UU4yMlRB?=
 =?utf-8?B?K1BGSjBnT3BMcTd1UnFuUzBjamRCNUdYSElnVDcrS29VSEZ4UkJrK25sMGdi?=
 =?utf-8?B?S1VYKzd2YUFuSVJma2RkQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzFuSzdsU0s3MlBGNE8wQnU5V3M5WmNQczA2TzBiNVdoeUZaSHppR1ovMVJN?=
 =?utf-8?B?YUplUDlvcFZwZnhkNHhvYVVUK3JIblZLN1NPUmJRNTZEZHpOaFBjNHQraXJO?=
 =?utf-8?B?QVJFSncrRlVqU3dpNmtGQ2daZlVid0QvY2hGbGpCTERUUC9KZWFZbjBsRGxL?=
 =?utf-8?B?dUxmbTRMeW02R2MxZWdhUHQrZ1hrNWJlcFhoRnZKSzdlMHRldGgwcHpzTUZ5?=
 =?utf-8?B?REt3aVdLTTFPeUpnMVdLVGcyTngvc21McWhVb0poaGNpNWtVZjNFRGFLR2dp?=
 =?utf-8?B?ZVZpQVdZKzNPc2lETzF6eTM0NUdWNFRWQW5ZR2lhL0ZxU1pIckcwU3FBR2c4?=
 =?utf-8?B?TXg4VTFTL3B5V0dNVlFrR3NreHByZTRIQkUvbTd0eDFOUG8xRnVRSXU2VDQy?=
 =?utf-8?B?NFlFN2RaQVQyTGhucXExZ3RvWm1qc0NGSytSZlc3ZkZ2alhBOWthQVlIMk5S?=
 =?utf-8?B?YUdlM2szYlY1b1J4ZGhGbU0zRTI1bVUvWlZRZDBTWVFrZ3hHTWhsdGE0TG9j?=
 =?utf-8?B?S3lLV2ExQ3V4R2dSYStCM2NYdkhVeVJtWEhIQTBmTDJ4Z0JWRy91WkJ4d2Rt?=
 =?utf-8?B?ZTZ0MTJQNEMwN2tENWVTaEluTlNrdUJMTzBoeTRJdnBPMkNRTHJVZjgrbm1V?=
 =?utf-8?B?VVFxaWt0clRzdlVQeDZZRTFFNXV2aGErQnR0alFQY0hNMnBTNllOUGNoUUx3?=
 =?utf-8?B?NVVyK0dtRHYvaldTdGpPYnA3WVVtUk5wT0RNbjhqbGFidHZPREltOHdkWldM?=
 =?utf-8?B?RTNCSHU2d29sWkFzYzZLZklacmdhd2kzcnVRUHdUaWVacTgyOXk2dVVuRWxj?=
 =?utf-8?B?b041SERGRkdhbW5XWFhkNERVdTlZUzBXUm9OVm9SU3FqK1c3YXJpVEIvbGdS?=
 =?utf-8?B?bU1MVE8wRmM1Y0FRUGdheGpZTzUwMGJXbXNkVkNZS2hrVFJIUWNNb2MwM3Ra?=
 =?utf-8?B?Q1hUN3dESEpYTjU4aDFhU3ROTTZBMjJPTFlKQ1hDa0RzQXpaemxxSkpDU2VS?=
 =?utf-8?B?Qyt3clI0SEFSWEtnWmFSZHRkVmh2L2pMQlQ2TEY1TEZSWEVzZWNjS1dRdnJu?=
 =?utf-8?B?b1VacTJwL2hDaW5oa3dWV2ZjMDUzYWQwak9wRWlrN3NjLzA1bFY2RnQzZlha?=
 =?utf-8?B?WWtJdFdYZVNxZnFWdEIxL3RETElBMUh6Z295YkJoc2toVHNCV1QwYjFDQUVx?=
 =?utf-8?B?QlBPeDVTNnl2d2R6UkFhVHQvc2U1ME5GTWdRcDlwc2FHOTBMa01Nb2dWK0c3?=
 =?utf-8?B?VjRaLyt3aGNwcGNaVWhOWW9XZ0pQUzVJdzhmOW5YUFRnNUU3b1pJZWxRQnlJ?=
 =?utf-8?B?aWp5SDNaQlN0NzlPbzFTcDhoaXRaSEU4QU1ZS3RWcUtPdFFZcTlBYXRjODhT?=
 =?utf-8?B?cmlJSVZYNGxFMDBQYTRqMld6T1NPUmFKaWx4TTNMaGdadUozL1UvKzVmbHBv?=
 =?utf-8?B?bmxib05KUkpFZ05JZEJxbkU5UC9JeVdJQVVtS3lUZVIzTWdHN3p1Q0FvY0V4?=
 =?utf-8?B?RDZxVGlMQWkwMWV3Z3F2VGFxQ09nYmJUMnB6OWFncm0yK3E5THdvWVRWVnB3?=
 =?utf-8?B?bGlXNSs4Rlo4K0g4dXFhcmRXeEN2TlRpM2RFdG1pdTIxN3J0eXZKZDAwRURF?=
 =?utf-8?B?eWpROTJNOHYzM3JFTUJmOTU4OW12ZnU2cGcyWVJVN2NFU0JGQklPSzQ0VTlI?=
 =?utf-8?B?RkwraFk5UklJRGZ1WUR3WnpIT0NKVk1wY0lHdXUwOXR4MDUyR1NVOWpyREp0?=
 =?utf-8?B?STQ1UzdGSUtPUktHNmlOa2ZqNWFjRVF0OHVqZVJoVGtWMnJPSU1pUTg0VWZy?=
 =?utf-8?B?ZkVXVE81UUhGUFJxRVo4WmRkelVLamJwM2Fpc04vdVNodDFpTm85dUhaWlkw?=
 =?utf-8?B?ZzlEYmR1TnFWbXNuL293U2lKbDVqYVdqWEtzYStTVG55TzROaGtSV2RYVmt2?=
 =?utf-8?B?SVBmTVpqbk1YTG9qZVNldVk0bFkyQitmRDlYdWUvSGNQUEZGNnBUTUxWWldj?=
 =?utf-8?B?UWJoSzgySjM2T3ZRRlgrNHhmNk04RWs1cjFtcmNxajU5M2N5cTZoei9qbTlZ?=
 =?utf-8?B?THFIYnVlZVRmWkdoUVVlV2pYVDRLYlZweVFzWFpwNjhnanlCUU5QamhIQXVq?=
 =?utf-8?B?TFZueGxDUEZTS3pmY2hQQWNPQW54V3N2dldHVzlsS1JVcFRxcWYwdzZuN2VG?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <705CB3809FD5D3469444D2230187A79E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de1766a-d20b-46a6-bc02-08dc6b41578c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 07:19:16.5119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e5MQj/CdiIyhAoMjhA1mE+MQs1+RYkTBwcP6SQLY4Y5YCHWIY0+ViAQz5TJ1Wv/YN4dQVZkJjRBqNmu4smh0yby1bqiQelUHR8GARKIzAEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7634
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

T24gVGh1LCAyMDI0LTA0LTI1IGF0IDAwOjA4ICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOgo+
IExpbmsgT2ZmIEJldHdlZW4gQWN0aXZlIEZyYW1lcywgaXMgYSBuZXcgZmVhdHVyZSBmb3IgZURQ
Cj4gdGhhdCBhbGxvd3MgdGhlIHBhbmVsIHRvIGdvIHRvIGxvd2VyIHBvd2VyIHN0YXRlIGFmdGVy
Cj4gdHJhbnNtaXNzaW9uIG9mIGRhdGEuIFRoaXMgaXMgYSBmZWF0dXJlIG9uIHRvcCBvZiBBTFBN
LCBBUyBTRFAuCj4gQWRkIGNvbXB1dGUgY29uZmlnIGR1cmluZyBhdG9taWMtY2hlY2sgcGhhc2Uu
Cj4gCj4gdjE6IFJGQyB2ZXJzaW9uLgo+IHYyOiBBZGQgc2VwYXJhdGUgZmxhZyBmb3IgYXV4bGVz
cy1hbHBtLiBbSmFuaV0KPiB2MzoKPiAtIGludGVsX2RwLT5sb2JmX3N1cHBvcnRlZCByZXBsYWNl
ZCB3aXRoIGNydGNfc3RhdGUtPmhhc19sb2JmLgo+IFtKb3VuaV0KPiAtIEFkZCBESVNQTEFZX1ZF
UigpIGNoZWNrLiBbSm91bmldCj4gLSBNb2RpZnkgZnVuY3Rpb24gbmFtZSBvZiBnZXRfYXV4X2xl
c3Nfc3RhdHVzLiBbSmFuaV0KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmlt
ZXNoLm1hbm5hQGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAgfCA0OAo+ICsrKysrKysrKysrKysrKysrKysKPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5owqDCoMKgwqAgfMKgIDUgKysK
PiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaMKgwqDCoCB8wqAg
NCArKwo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jwqDCoMKgwqDC
oMKgIHzCoCA0ICsrCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMKPiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jCj4gaW5kZXggMTNiYWMz
ZThjOGZhLi4zYmI2OWVkMTZhYWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9hbHBtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uYwo+IEBAIC0xMSw2ICsxMSwxNiBAQAo+IMKgI2luY2x1ZGUgImludGVsX2Rw
X2F1eC5oIgo+IMKgI2luY2x1ZGUgImludGVsX3Bzcl9yZWdzLmgiCj4gwqAKPiArYm9vbCBpbnRl
bF9hbHBtX2dldF9hdXhfbGVzc19zdGF0dXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkKPiAr
ewo+ICvCoMKgwqDCoMKgwqDCoHU4IGFscG1fY2FwcyA9IDA7Cj4gKwo+ICvCoMKgwqDCoMKgwqDC
oGlmIChkcm1fZHBfZHBjZF9yZWFkYigmaW50ZWxfZHAtPmF1eCwgRFBfUkVDRUlWRVJfQUxQTV9D
QVAsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICZhbHBtX2NhcHMpICE9IDEpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiBmYWxzZTsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gYWxwbV9jYXBzICYgRFBfQUxQ
TV9BVVhfTEVTU19DQVA7Cj4gK30KPiArCj4gwqAvKgo+IMKgICogU2VlIEJzcGVjOiA3MTYzMiBm
b3IgdGhlIHRhYmxlCj4gwqAgKgo+IEBAIC0yNDIsNiArMjUyLDQ0IEBAIGJvb2wgaW50ZWxfYWxw
bV9jb21wdXRlX3BhcmFtcyhzdHJ1Y3QgaW50ZWxfZHAKPiAqaW50ZWxfZHAsCj4gwqDCoMKgwqDC
oMKgwqDCoHJldHVybiB0cnVlOwo+IMKgfQo+IMKgCj4gK3ZvaWQgaW50ZWxfYWxwbV9jb21wdXRl
X2xvYmZfY29uZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBpbnRlbF9jcnRjX3N0YXRlCj4gKmNydGNfc3RhdGUsCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fY29ubmVjdG9yX3N0YXRlCj4gKmNvbm5fc3RhdGUpCj4gK3sKPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGRwX3RvX2k5MTUoaW50ZWxfZHApOwo+
ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlID0g
JmNydGNfc3RhdGUtCj4gPmh3LmFkanVzdGVkX21vZGU7Cj4gK8KgwqDCoMKgwqDCoMKgaW50IHdh
a2V0aW1lX2luX2xpbmVzLCBmaXJzdF9zZHBfcG9zaXRpb247Cj4gK8KgwqDCoMKgwqDCoMKgaW50
IGNvbnRleHRfbGF0ZW5jeSwgZ3VhcmRiYW5kOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBjcnRjX3N0
YXRlLT5oYXNfbG9iZiA9IGZhbHNlOwoKRHJvcCB0aGlzIGxpbmUuIEkgdGhpbmsgY3J0Y19zdGF0
ZSBpcyByZXNldCBiZWZvcmUgZG9pbmcgdGhpcwpjb21wdXRlX2NvbmZpZwoKPiArCj4gK8KgwqDC
oMKgwqDCoMKgaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmIChESVNQTEFZ
X1ZFUihpOTE1KSA8IDIwKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47
Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmICghaW50ZWxfZHBfYXNfc2RwX3N1cHBvcnRlZChpbnRl
bF9kcCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgaWYgKGNydGNfc3RhdGUtPmhhc19wc3IpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKGludGVsX2FscG1f
Y29tcHV0ZV9wYXJhbXMoaW50ZWxfZHAsIGNydGNfc3RhdGUpKSB7CgpJIHRoaW5rIGl0IGlzIGVh
c2llciB0byByZWFkIGFuZCBoZWxwcyBhdm9pZGluZyBiaWcgaWYgYmxvY2tzIGlmIHlvdToKCmlm
ICghaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhpbnRlbF9kcCwgY3J0Y19zdGF0ZSgpKQogICAg
cmV0dXJuOwoKVGhpcyBhY3R1YWxseSBicmluZ3MgdXAgYW5vdGhlciB0aGluZzogZG8gd2Ugd2Fu
dCB0byBzcHJlYWQgaW50ZWxfcHNyLmMKcG9sbHV0aW9uIGJ5IGNvbnRpbnVlIHVzaW5nIHRoZXNl
IGJvb2xlYW4gcmV0dXJuIHZhbHVlcz8gSSB3b3VsZCBwcmVmZXIKY2hhbmdpbmcgaW50ZWxfYWxw
bV9jb21wdXRlX3BhcmFtcyByZXR1cm4gdmFsdWUgdG8gIm5vcm1hbCIgaW50CmFwcHJvYWNoIGFu
ZCByZXR1cm4gMCBvbiBzdWNjZXNzLiBUaGlzIHdvdWxkIG1lYW4gb25lIG1vcmUgcGF0Y2gKY2hh
bmdpbmcgaXQuCgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb250ZXh0X2xhdGVu
Y3kgPSBhZGp1c3RlZF9tb2RlLT5jcnRjX3ZibGFua19zdGFydCAtCj4gYWRqdXN0ZWRfbW9kZS0+
Y3J0Y192ZGlzcGxheTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3VhcmRiYW5k
ID0gYWRqdXN0ZWRfbW9kZS0+Y3J0Y192dG90YWwgLQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkanVzdGVkX21vZGUtPmNydGNfdmRpc3Bs
YXkgLQo+IGNvbnRleHRfbGF0ZW5jeTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Zmlyc3Rfc2RwX3Bvc2l0aW9uID0gYWRqdXN0ZWRfbW9kZS0+Y3J0Y192dG90YWwgLQo+IGFkanVz
dGVkX21vZGUtPmNydGNfdnN5bmNfc3RhcnQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmIChpbnRlbF9kcC0+YWxwbV9wYXJhbWV0ZXJzLmF1eGxlc3NfYWxwbV9zdXBwb3J0ZWQp
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3YWtldGlt
ZV9pbl9saW5lcyA9IGludGVsX2RwLQo+ID5hbHBtX3BhcmFtZXRlcnMuaW9fd2FrZV9saW5lczsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWxzZQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd2FrZXRpbWVfaW5fbGluZXMgPSBpbnRlbF9k
cC0KPiA+YWxwbV9wYXJhbWV0ZXJzLmZhc3Rfd2FrZV9saW5lczsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmICgoY29udGV4dF9sYXRlbmN5ICsgZ3VhcmRiYW5kKSA+Cj4g
KGZpcnN0X3NkcF9wb3NpdGlvbiArIHdha2V0aW1lX2luX2xpbmVzKSkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNydGNfc3RhdGUtPmhhc19sb2JmID0g
dHJ1ZTsKCmNydGNfc3RhdGUtPmhhc19sb2JmID0gKGNvbnRleHRfbGF0ZW5jeSArIGd1YXJkYmFu
ZCkgPgooZmlyc3Rfc2RwX3Bvc2l0aW9uICsgd2FrZXRpbWVfaW5fbGluZXMpOwoKPiArwqDCoMKg
wqDCoMKgwqB9Cj4gK30KPiArCj4gwqBzdGF0aWMgdm9pZCBsbmxfYWxwbV9jb25maWd1cmUoc3Ry
dWN0IGludGVsX2RwICppbnRlbF9kcCkKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gZHBfdG9faTkxNShpbnRlbF9kcCk7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oCj4gYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaAo+IGluZGV4IGM0NWQwNzhlNWE2
Yi4uYjk2MDJiNzFkMjhmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfYWxwbS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hbHBtLmgKPiBAQCAtMTAsOSArMTAsMTQgQEAKPiDCoAo+IMKgc3RydWN0IGludGVsX2RwOwo+
IMKgc3RydWN0IGludGVsX2NydGNfc3RhdGU7Cj4gK3N0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRl
Owo+IMKgCj4gK2Jvb2wgaW50ZWxfYWxwbV9nZXRfYXV4X2xlc3Nfc3RhdHVzKHN0cnVjdCBpbnRl
bF9kcCAqaW50ZWxfZHApOwo+IMKgYm9vbCBpbnRlbF9hbHBtX2NvbXB1dGVfcGFyYW1zKHN0cnVj
dCBpbnRlbF9kcCAqaW50ZWxfZHAsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlKTsKPiArdm9pZCBpbnRlbF9hbHBtX2NvbXB1dGVfbG9iZl9jb25maWcoc3RydWN0IGlu
dGVsX2RwICppbnRlbF9kcCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGludGVsX2NydGNfc3RhdGUK
PiAqY3J0Y19zdGF0ZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUK
PiAqY29ubl9zdGF0ZSk7Cj4gwqB2b2lkIGludGVsX2FscG1fY29uZmlndXJlKHN0cnVjdCBpbnRl
bF9kcCAqaW50ZWxfZHApOwo+IMKgCj4gwqAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgKPiBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oCj4gaW5kZXggZDk0ZjUwYzZk
YzZjLi41YTBmZmQ1YWE0OGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5X3R5cGVzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaAo+IEBAIC0xNDA1LDYgKzE0MDUsOSBAQCBzdHJ1
Y3QgaW50ZWxfY3J0Y19zdGF0ZSB7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyogZm9yIGxvYWRp
bmcgc2luZ2xlIGJ1ZmZlcmVkIHJlZ2lzdGVycyBkdXJpbmcgdmJsYW5rICovCj4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBkcm1fdmJsYW5rX3dvcmsgdmJsYW5rX3dvcms7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoC8qIExPQkYgZmxhZyAqLwo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgaGFzX2xvYmY7Cj4g
wqB9Owo+IMKgCj4gwqBlbnVtIGludGVsX3BpcGVfY3JjX3NvdXJjZSB7Cj4gQEAgLTE4MzUsNiAr
MTgzOCw3IEBAIHN0cnVjdCBpbnRlbF9kcCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1OCBmYXN0X3dha2VfbGluZXM7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qIExOTCBhbmQgYmV5b25kICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGJvb2wgYXV4bGVzc19hbHBtX3N1cHBvcnRlZDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHU4IGNoZWNrX2VudHJ5X2xpbmVzOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgdTggc2lsZW5jZV9wZXJpb2Rfc3ltX2Nsb2NrczsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHU4IGxmcHNfaGFsZl9jeWNsZV9udW1fb2Zfc3ltczsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCj4gYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiBpbmRleCBlMDVlMjVjZDRhOTQuLjU2
MzczOWM2MDE0YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMK
PiBAQCAtNDgsNiArNDgsNyBAQAo+IMKgI2luY2x1ZGUgImk5MTVfZHJ2LmgiCj4gwqAjaW5jbHVk
ZSAiaTkxNV9pcnEuaCIKPiDCoCNpbmNsdWRlICJpOTE1X3JlZy5oIgo+ICsjaW5jbHVkZSAiaW50
ZWxfYWxwbS5oIgo+IMKgI2luY2x1ZGUgImludGVsX2F0b21pYy5oIgo+IMKgI2luY2x1ZGUgImlu
dGVsX2F1ZGlvLmgiCj4gwqAjaW5jbHVkZSAiaW50ZWxfYmFja2xpZ2h0LmgiCj4gQEAgLTI5OTcs
NiArMjk5OCw3IEBAIGludGVsX2RwX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVy
Cj4gKmVuY29kZXIsCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3Zycl9jb21wdXRlX2NvbmZpZyhw
aXBlX2NvbmZpZywgY29ubl9zdGF0ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2RwX2NvbXB1
dGVfYXNfc2RwKGludGVsX2RwLCBwaXBlX2NvbmZpZyk7Cj4gwqDCoMKgwqDCoMKgwqDCoGludGVs
X3Bzcl9jb21wdXRlX2NvbmZpZyhpbnRlbF9kcCwgcGlwZV9jb25maWcsIGNvbm5fc3RhdGUpOwo+
ICvCoMKgwqDCoMKgwqDCoGludGVsX2FscG1fY29tcHV0ZV9sb2JmX2NvbmZpZyhpbnRlbF9kcCwg
cGlwZV9jb25maWcsCj4gY29ubl9zdGF0ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2RwX2Ry
cnNfY29tcHV0ZV9jb25maWcoY29ubmVjdG9yLCBwaXBlX2NvbmZpZywKPiBsaW5rX2JwcF94MTYp
Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9kcF9jb21wdXRlX3ZzY19zZHAoaW50ZWxfZHAsIHBp
cGVfY29uZmlnLCBjb25uX3N0YXRlKTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZHBfY29tcHV0
ZV9oZHJfbWV0YWRhdGFfaW5mb2ZyYW1lX3NkcChpbnRlbF9kcCwKPiBwaXBlX2NvbmZpZywgY29u
bl9zdGF0ZSk7Cj4gQEAgLTY2MTIsNiArNjYxNCw4IEBAIHN0YXRpYyBib29sIGludGVsX2VkcF9p
bml0X2Nvbm5lY3RvcihzdHJ1Y3QKPiBpbnRlbF9kcCAqaW50ZWxfZHAsCj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgaW50ZWxfcHBzX2luaXRfbGF0ZShpbnRlbF9kcCk7Cj4gwqAKPiArwqDCoMKgwqDC
oMKgwqBpbnRlbF9kcC0+YWxwbV9wYXJhbWV0ZXJzLmF1eGxlc3NfYWxwbV9zdXBwb3J0ZWQgPQo+
IGludGVsX2FscG1fZ2V0X2F1eF9sZXNzX3N0YXR1cyhpbnRlbF9kcCk7CgpIb3cgYWJvdXQgYXV4
X3dha2UgPwoKPiArCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOwo+IMKgCj4gwqBvdXRf
dmRkX29mZjoKCg==
