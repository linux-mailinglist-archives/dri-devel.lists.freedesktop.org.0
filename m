Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D1B06459
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87D10E240;
	Tue, 15 Jul 2025 16:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="LVIjmDAn";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="mLgh44F4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8980010E547
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 16:29:08 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 56FAKYn54078064; Tue, 15 Jul 2025 17:29:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=oRrPDs62WXl/VnRTdphvbwe9TzypxgwVIxUE2B06x2U=; b=LVI
 jmDAnT9YImOzXeYD/PqnKECdCfqDEgD1EImrwShaItarSDKXPf1uij7GiqzwvHWN
 MFxppiny+yRnbWquPdxu7Tjru2Nug72b86IiNTih16bapR9r2zLdlHTC8wFc6PrC
 OKnBmJthB9kxUR/lnZpB0s25Tvv05LtH2/Yong/KMBrzMmG0XBRB6AKCsTSeQI2A
 C+qzuxoVUDrHri0sRwkYzGpqXNyNkCvxSYKNR8lskqLeu29lcN7swKLSfuvHb0JK
 xujKhUGzcHBkZPu5waytO9Hcm0csk4iT2FEbboFwY0DyKTg0SqNhRTlNy0A+86pv
 xpMTu9gcKEInIPJKKAA==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020129.outbound.protection.outlook.com [52.101.195.129])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 47udynu1tc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 17:28:59 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Afp9MJ64xCPiie/OrRkFSDORGaf9xgk5E+GTUe3CPoGo/HgB2MSw0ayJ7UBb1C+xv8wqDDWDL8OsIQwLzE2KToAaRPKBY7FKgnj2e/kLkG8+8hQVANZgsA1wx92JQ/C3b8b1kUT5xFGQzD0K97labzoYULFmcaI20wx6hM7SQWn3GNsSrNdMhm0KAByLJsO42VzWPrIBlJ+DfZd0DFuO3W5Rmn6p14haP//g1CT/KDKY0R+pbked1tQz5kNiTJ3Ye3aDAXfEK9ZezYAHTUKp7rxf8lVCkaCPklPn8itjm/ONBxmvrVmtENVobIlmh2jxjfT+/lHPwZfPuMOvjUqZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRrPDs62WXl/VnRTdphvbwe9TzypxgwVIxUE2B06x2U=;
 b=YI7QZbODD7v2JGOybfmim4LnTjjPtGl4DBGS3aXFLXbrkcbJ/Ni4WU3LZLDj4rCXpvWORdD1N3AC2XVbOUmL9AN5MCy3MS1E7wS+NVrIRZTpI0DYxt9oaC1IL1lH+eCDsPbzILhZejXmlWydSEwllVQGcCctEWOGoQpQqlcoDqTeRjtBCWArQraZtpGD07xupGjfgUs2aAlCKSWGe8py0lUWBWxrYQuLFX1pZdJWL+a7yHcIku7YAiZ+0t1bCCN8mPbcjgoRhULb8cHcRMd6VvmbmCNihR9buqt/L2NzKUZWoLYv7jQEZCjg7+PN25KhKVwJjIFJaI49MgQyauUJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRrPDs62WXl/VnRTdphvbwe9TzypxgwVIxUE2B06x2U=;
 b=mLgh44F4EabX1xhamtCouJB1RkLYKJK6B6BInrEcuZQK7RSIl04xZMBXikro5Kax2EdoS7k4P8rz6HOYfHBhzGwg+QfdE5xROE1EhsmHyfyV21yjo5oKBFnkGFoaA0LksMscyWxJzm8RgxfV35MeVumZ+hGahs9X4JSmqyq8ACw=
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:19a::5)
 by CWLP265MB3186.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 16:28:57 +0000
Received: from CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2]) by CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3e50:ef31:dd73:3bd2%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 16:28:57 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Frank Binns <Frank.Binns@imgtec.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH 2/2] drm/imagination: Use struct_size_t()
Thread-Topic: [PATCH 2/2] drm/imagination: Use struct_size_t()
Thread-Index: AQHb9ZXijS4Ql5NNw0iNCjNigw9GRbQzX/IA
Date: Tue, 15 Jul 2025 16:28:57 +0000
Message-ID: <7c2dcc953227e79bdabb4c7e4d071907c5ae643b.camel@imgtec.com>
References: <20250709-flex-array-check-v1-0-8adeb0bf0cde@imgtec.com>
 <20250709-flex-array-check-v1-2-8adeb0bf0cde@imgtec.com>
In-Reply-To: <20250709-flex-array-check-v1-2-8adeb0bf0cde@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB5009:EE_|CWLP265MB3186:EE_
x-ms-office365-filtering-correlation-id: 1c1df745-15bf-4d0f-1200-08ddc3bcb2a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SkVwS2Q5eGNrTDBBa0g3cnhmMDBRUUxjaHRQYllxS2hCN3NOZm9oWUlSVGpw?=
 =?utf-8?B?bm8rRk5hcWVWdE9BbTNEMitYRHRoN3lUdTd3ZG15S1A5M1MrUEpoSFdCMm80?=
 =?utf-8?B?RENjQjMybmprVjhBb29JVG4vSWxjL0NhRmprOFg0Qk5TTTdRTHdmeWMyYmRO?=
 =?utf-8?B?NTAveVIyL0RIakxGRjFQVFZWeFBtNWtxM0d2UjQyb2FUOWRXVTBldXQ5SDM3?=
 =?utf-8?B?dkJZRmtSVHU5OWJtTDZsV0lTdlNsZ1loemI3Z2tyYjVRV001bGRwUmpqT0xi?=
 =?utf-8?B?ZS9vQzljcGpzTnFPSnZnNU5oalBGT1JFZEpqQkkrditFS1l4WGwwcWc1c1J1?=
 =?utf-8?B?c242YjQvODlrQnhsTlBQR1ozTHN2OGZPaFJ2Qm9WRFhzRE9jMXRyT0h5UHpx?=
 =?utf-8?B?UHlrSEd1ZmMvUytZT0tRSm9XcnlkZ2dzWm56a1BsbmlGeGlqWkdWb1RZNEV0?=
 =?utf-8?B?aUY0dXVtVGdWSDkrMnlSOHg2VjBueERMS1JXQ1ZwNWFidnNvbkpkNGhDYURO?=
 =?utf-8?B?eWZ1MG9WQXAxTVduMXUxZGlZcmVGRmQ0OVJ2bEJ1WTR1OVFZS2g1bnRWVTFB?=
 =?utf-8?B?T2VaYy9GY2RlTTlUVWRrTmNwNnMvM3lwSkt6czhJK2xqNkIwbCtNOFhzMkZT?=
 =?utf-8?B?Q2tWSW91U3VNOGcyUlNCY0JITFRqR1E5SlFOZUl6NTg5QTFMVERHbUhoU244?=
 =?utf-8?B?V0kwZmdtMlhXVEhtM3VIdFhpQ0gyZHFyZ2pqVS82b2RUaWhnSUFrb0V2Vk93?=
 =?utf-8?B?cFQ0WFhYcm02YWRvTHBkRWJCVkxhZVRxdWV6MTE2eFlEeGErS0QwODRtS25l?=
 =?utf-8?B?MVY0MXV6NVVTTnFRUzRzZlVDZ1NNekRlWHlGa0xJMDc4Rkh4NlhlaUZndHIw?=
 =?utf-8?B?VUZ2eERUejR0czlDYUVMbjRESWs0c29LaHVLajd1V3h3SFh6ZUZaMnRoZnJV?=
 =?utf-8?B?eFJoV3NvQ1dyTmtKbUVxUytNelpnKzNKVmY2Ym1HcFV6Vi9CR3JzckVaZFhi?=
 =?utf-8?B?VHI4TnJUd2RYcXhKTlRkbE1TWCtnL2hMQXI0d0pidk8zWnRvaGVDNXdKQS8v?=
 =?utf-8?B?YlFCcklNMGljK2hjb25QUnZQbWJCbE8wcE1SM0Ewb0ZOTlZBQzBSdzhEYXJX?=
 =?utf-8?B?T0V6dlBnT3JXTnd3UE1lUVRHaDNqdXZOVHF5Z0JEcU51WFNrVzMvcEw1TVV0?=
 =?utf-8?B?WE5BRVh1UHhBaWVHWDQ1ekFUaWE4dmZ0d2Y0dkoxeVpCUzlwK08rcU5EQkZL?=
 =?utf-8?B?WWw2TmlCUERVZDlxYWxyTFlyT2FHQytzNkpDbEtiUHRLQkVUaWUxeWpvbUgw?=
 =?utf-8?B?ZDBEWUtGdUZBMzN6bm9qMTFJTUgxWkMzWkZ6YXdnSGFZcm9nekVydUN1RlNW?=
 =?utf-8?B?NWJibEwvaVZRTzducm00T2phMEd4ejdHeDA4UkFGYVRVNlJ3SWIzRUNmaWgx?=
 =?utf-8?B?RmZPOVYrenZGN3oweVpycThVaTVIZy9US2RtVmNZSzM0Zis4L3ZOQW9KU2tB?=
 =?utf-8?B?NjlXMGVtQnJPVlhnV1BsQ3NQZXR6K3Z6MGh6K0FxWVJDRjE5N3hpZTFpelF6?=
 =?utf-8?B?RGNJcG1TS1lQbzg0UHNvTzExcHRSL0dEVml5NS92aC8vMDkvUThiSWJjeUlD?=
 =?utf-8?B?L1NWMVVnbm5YRDhVemk5OFZuMjZoZ3l3RFN4LzVlUzdORWxESFJWdjFXWkQ4?=
 =?utf-8?B?Q21lUlFJdkltVjg5ZlhIbEM2VDNUS1Rtak13QzE5RnRpb1d2WjRYL3haWTFG?=
 =?utf-8?B?cWNGVGI5YlBSTGtsQWxBNnpBVjJzcTl1eVM4eHVIYTJqRDJ6RXJDY1ZDYzVu?=
 =?utf-8?B?R0tqanhyVnhYSGlGWkoyUFZrY2gydXZSNVpOSTErN0lsNDVjVE5jM1NNVk9D?=
 =?utf-8?B?TE9wa1hoVkluV2ptaUwxWmFLSWNwKzc5eUMxSzRmb3V6cFFROEFJclFMUTNJ?=
 =?utf-8?B?M0RXdTFabmFWVVE4Y1lKNkpsU0xUcEJMMnl2aXpmcmtXVzJTOXNlKzdDK2VG?=
 =?utf-8?B?dytXci9lczVRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WENjdEt2bUJSOUxTMHUwTktKS29SeFBveWk2RUk0aWt3L214eExPMDRlcjBu?=
 =?utf-8?B?RXF5T3lIdXora3JzdjVRbVh4Vm16ZHRwK0xMbXp2NHRRblRBakhSZlpiMTBv?=
 =?utf-8?B?K25nZUdheEhBZDVBUXFSS0dwL2h6cGlEam1ZMHpLWC9uZElPNlZLeFljQXFo?=
 =?utf-8?B?bW1ZUUloSHlhczFxLzJJNFJya3lhekgrMVV6d0t2dldwWmdBamVURlhQUjly?=
 =?utf-8?B?T0N2eWhaOU1lcXZjcHZ5K2dmL2RJdnV0THVZdWNiODNranpZclRRdVlkSXdi?=
 =?utf-8?B?bTR3bEZUQllHQVo2a084cDkvTmFhZnJVcmRCZ0pmekxLTTc5L0JCZGN4Wit6?=
 =?utf-8?B?cjAwVWtnR0hxb3dDU1MyWFdkNlRSY1JwYnhvcnJISCtrQ3pkVDJ6YmZhdi9B?=
 =?utf-8?B?MCtITDFWVFVFK3EwZGNuaVpMSzYzdkdaSWMvcXA3cWcyZ0puck5BajBpN2VK?=
 =?utf-8?B?WUZBTU9OdGpobU9CeG9jNWdDZk1PSW9QOUpHZ24zQ3RTVDZWaDhvVHR0NTZE?=
 =?utf-8?B?TE1takJnS1J2UzRQUEE0UXNUMWdZNC9wdjVrempvbHYyU2pqa2t3V3hMOXZo?=
 =?utf-8?B?aEZYZldoQ215cFc1K0RRL1QwWEZhK2NZcUZWbExEcHMveG8yNS9jMnI1OVJM?=
 =?utf-8?B?NHAyWUVVb0VBM1I2ZFZKQVVBeFp2Z3J3UXV5SmJzKzZiS0ZXR1dPUC8vejZv?=
 =?utf-8?B?Q2IrYTcvMjlrTkNxcHptY3N4ZlhuUEpqQkRUWVpuL1FsNW4vTnVaa0hkM1Fn?=
 =?utf-8?B?cmovS1JPcVN5NlhsZjRrcmFwL3hDQkg4R2FHbUU2dlhUSEp1TStFUU1CbXV6?=
 =?utf-8?B?MkxUM3ZMd2orWVdjZGdpOVoxdWVwcHpHaTdmZm5kUjJQR3BYQjFjcjdkRHdP?=
 =?utf-8?B?OXY0eWJNNHRhc0RjQXBqZEZ3b2RXR05KaE9IRWtGdFZkNnRkNEFCcE9LUGxN?=
 =?utf-8?B?dDloRG5BSlh5YmlaQS9adjBZK04vV1Nkejk3WXcwc0oxQ3hRK0dHdElKU2NQ?=
 =?utf-8?B?T05RajBVZU1YbUxIMHE5a01qM3o2bGYxdXNmeUZKYkZHSERHdlFzSGMwSk11?=
 =?utf-8?B?cG90cm9VRXZ2VDJXaXpyMHNuQ1BqK2Y0N2J6MG1ydWRMY3ozbmNQeFBvOWYx?=
 =?utf-8?B?NXk0ZjMvYi83NzNSOUszYWR5YUlPNWk1Rm9jbDdSZmdUZGNqMzJWSTlJMFU1?=
 =?utf-8?B?enBqWXRQaFZ4NXl4eURza0JiUEIvTUszYWxSVE1nd0FzYzVldk92V3Z1U2k4?=
 =?utf-8?B?M3I2TVBnUit0YUFhWlB3Z1V3QjdCVzFvZXVMQ2FCZEpXdmwzemxjK1JhMEJN?=
 =?utf-8?B?WDFySUdYSmR1cWpCaC9tU1djREs5S1Ixd2JibUNKVlR0WlRaK1dDQWE5NGlY?=
 =?utf-8?B?VmJDWU5tQy9BSDdCN205end0cWJMTWFER24yZGNDekJIbVUxd01ENkFicVU4?=
 =?utf-8?B?VGwyUU9oeVBJSldTRGN5djF4TDZwV3pMS040dzBWbjlQb0hQSWtkZHJ1Qmlr?=
 =?utf-8?B?ZkZIOGlyL2xBZGFqR2JVUEJ3WDNWaWxiOVRjMUtjaFU3L0NLQWg0SVN5QVZO?=
 =?utf-8?B?bEVCcEVvQ25Dci9RL0FWdWxZeGMwS3p6V2cvdVlsSzlGbEcvQStTNzZ0amsy?=
 =?utf-8?B?NHpsL215aFY3cENucjlJK3p5K0xOcWlyemMwSnU1NjFzR3FnZ0FYck5sOEl5?=
 =?utf-8?B?VmpVbkd1NHF5dTJ1a2FCMXBlbXRoZHhzQ3h0S1hHcWxSbVFiN1ZtZk5jSEFw?=
 =?utf-8?B?akZHa2t0TU0xMHVhazhIYnRsOVVEd1pON3pSSG5Nb0ZzaTVlbWN2N0lJbGNi?=
 =?utf-8?B?ZFprK0puYzdhU1R5NGZBK2tkci91NUxmOGc2MHF5ZitxbEdxN3JSZGNYTXZs?=
 =?utf-8?B?Qm8vcTU2L3VqNnMveUJyWWxUVEhySWRSVXlqd05VSW5IcFFUaXQzTUptSysx?=
 =?utf-8?B?dTg4c2R5ZlpmY1YzbXQ3SkVoc3h0U1JRQi9qaFRpQkVXWmo3R1hWUnBXU0lQ?=
 =?utf-8?B?OTlHbks1aldxRXBtYVMzaFhqd1h5ZG5rUVdvZjlxNlMvQ2dtSHBhR3V0aCsy?=
 =?utf-8?B?ci84NitQaGlWQ0xCQTZxekJrUjJqQzJRR0hKemFWWUNuVUd0T25DbGpwaUQ1?=
 =?utf-8?B?OTV1OHVRTmYxbTNIbmxIaDJGZnBWeGJKY0hLcmhTNXN2U1FNMmtTUEw4WXg0?=
 =?utf-8?B?dVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <928F655616A44C4AAB62464090E0E1A2@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB5009.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1df745-15bf-4d0f-1200-08ddc3bcb2a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 16:28:57.3827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kjenWmO8uAeHArbuYuevuTRAAresl6zPCp0DRQPdgpgd4GdyN9Uz2shnknYkfzWkKo/YcP3XogODpTlXM3YQqNDQbp0um63ACnRWzn/m5ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3186
X-Authority-Analysis: v=2.4 cv=IbOHWXqa c=1 sm=1 tr=0 ts=687681cb cx=c_pps
 a=6pT/+DikuWq1hv4MnjPuDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=kLnDKzXfk2bAhl7vrD4A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: XJQrYariwtVNI3C_4D97ih_WS4pvQB1D
X-Proofpoint-ORIG-GUID: XJQrYariwtVNI3C_4D97ih_WS4pvQB1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwOCBTYWx0ZWRfX8tK+LVYlvsmR
 bi6Xg5s7GJwGkNvcnK87QZ1JJntSzaa8xHkJ/h+U8QpIOG8umkLvP7lB4W5cY91SYy+FsKLG1ED
 ZCp3Rct7Qp39+B14sNdtPDTDWmxX8xDI0m1ZYTiwIyM8i0PeXmFXyoAkklGyzO/30Ogbnf5luwz
 cVEFjdH/OrUVLV8+eZB14dD4u+h3TQghHHPUOOxxcqGx+PML8AZMwWZXcAu8hwTXmccAUISu7AZ
 +g2dRv24v9RWK4G5e/Ud+TXhk/OGZmfYrGMedb+gpRPdIqLDBtGftGwkn1H7FKAETemq/d+lVEG
 OUht47nd3c8wRQ+43ikZkd7D92VeZvAdL3v9dzoqn/Yy8gTLcqASY/gJ+OSDn+jlnNyQY0HwjTs
 NaZpYKxt
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

T24gV2VkLCAyMDI1LTA3LTA5IGF0IDExOjA0ICswMTAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
VGhlIGhlbHBlcnMgZm9yIGRlYWxpbmcgd2l0aCBmbGV4aWJsZSBzdHJ1Y3R1cmVzIGV4aXN0LCBz
byBsZXQncyB1c2UgdGhlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgQ29zdGVyIDxtYXR0
LmNvc3RlckBpbWd0ZWMuY29tPg0KDQpSZXZpZXdlZC1ieTogQWxlc3NpbyBCZWxsZSA8YWxlc3Np
by5iZWxsZUBpbWd0ZWMuY29tPg0KDQpUaGFua3MsDQpBbGVzc2lvDQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3F1ZXVlLmMgfCAxMSArKysrKy0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3F1ZXVlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3F1ZXVlLmMNCj4gaW5kZXggNWE0MWVlNzlmZWQ2
NDZhODYzNDRjZDE2ZTc4ZWZkYjQ1ZmYwMmU0My4uMDk0YTg1NDU3NmE1YTYzZjU2ZTU2YWNkZWJm
MDFiZGY1NDJhZTRkNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9u
L3B2cl9xdWV1ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcXVl
dWUuYw0KPiBAQCAtMyw2ICszLDcgQEANCj4gIA0KPiAgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdl
ZC5oPg0KPiAgI2luY2x1ZGUgPGRybS9ncHVfc2NoZWR1bGVyLmg+DQo+ICsjaW5jbHVkZSA8bGlu
dXgvb3ZlcmZsb3cuaD4NCj4gIA0KPiAgI2luY2x1ZGUgInB2cl9jY2NiLmgiDQo+ICAjaW5jbHVk
ZSAicHZyX2NvbnRleHQuaCINCj4gQEAgLTM1LDkgKzM2LDggQEAgc3RhdGljIGludCBnZXRfeGZl
cl9jdHhfc3RhdGVfc2l6ZShzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gIAkJCXJldHVy
biBlcnI7DQo+ICAJfQ0KPiAgDQo+IC0JcmV0dXJuIHNpemVvZihzdHJ1Y3Qgcm9ndWVfZndpZl9m
cmFnX2N0eF9zdGF0ZSkgKw0KPiAtCSAgICAgICAobnVtX2lzcF9zdG9yZV9yZWdpc3RlcnMgKg0K
PiAtCQlzaXplb2YoKChzdHJ1Y3Qgcm9ndWVfZndpZl9mcmFnX2N0eF9zdGF0ZSAqKTApLT5mcmFn
X3JlZ19pc3Bfc3RvcmVbMF0pKTsNCj4gKwlyZXR1cm4gc3RydWN0X3NpemVfdChzdHJ1Y3Qgcm9n
dWVfZndpZl9mcmFnX2N0eF9zdGF0ZSwNCj4gKwkJCSAgICAgZnJhZ19yZWdfaXNwX3N0b3JlLCBu
dW1faXNwX3N0b3JlX3JlZ2lzdGVycyk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgZ2V0X2Zy
YWdfY3R4X3N0YXRlX3NpemUoc3RydWN0IHB2cl9kZXZpY2UgKnB2cl9kZXYpDQo+IEBAIC02NSw5
ICs2NSw4IEBAIHN0YXRpYyBpbnQgZ2V0X2ZyYWdfY3R4X3N0YXRlX3NpemUoc3RydWN0IHB2cl9k
ZXZpY2UgKnB2cl9kZXYpDQo+ICAJCQlyZXR1cm4gZXJyOw0KPiAgCX0NCj4gIA0KPiAtCXJldHVy
biBzaXplb2Yoc3RydWN0IHJvZ3VlX2Z3aWZfZnJhZ19jdHhfc3RhdGUpICsNCj4gLQkgICAgICAg
KG51bV9pc3Bfc3RvcmVfcmVnaXN0ZXJzICoNCj4gLQkJc2l6ZW9mKCgoc3RydWN0IHJvZ3VlX2Z3
aWZfZnJhZ19jdHhfc3RhdGUgKikwKS0+ZnJhZ19yZWdfaXNwX3N0b3JlWzBdKSk7DQo+ICsJcmV0
dXJuIHN0cnVjdF9zaXplX3Qoc3RydWN0IHJvZ3VlX2Z3aWZfZnJhZ19jdHhfc3RhdGUsDQo+ICsJ
CQkgICAgIGZyYWdfcmVnX2lzcF9zdG9yZSwgbnVtX2lzcF9zdG9yZV9yZWdpc3RlcnMpOw0KPiAg
fQ0KPiAgDQo+ICBzdGF0aWMgaW50IGdldF9jdHhfc3RhdGVfc2l6ZShzdHJ1Y3QgcHZyX2Rldmlj
ZSAqcHZyX2RldiwgZW51bSBkcm1fcHZyX2pvYl90eXBlIHR5cGUpDQo+IA0KDQo=
