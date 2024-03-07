Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61B7874EF8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 13:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023B710EDD1;
	Thu,  7 Mar 2024 12:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="oVPzQws0";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="IEI4aJRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E80310EDD1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 12:26:46 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 427CN0cm017254; Thu, 7 Mar 2024 12:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=R6sxJ1PXK1/WJsbepE4LQovASiVqgaa5Q2NTtuwwJtw=; b=
 oVPzQws07r75VZuF+aP+14qgHcYZZ2sesyHRtsAXqJoofJXqz8zTHwJdd/287VQw
 Lz2EDEQEU5KPm9i+LwqfMptUKxbatOJ1cvrpN+pDvadUEkZVE662KDVZohWppNSx
 WFmhSGsuEWBh4T8N2CMSmQPh2D7UnFUnH5Ji0+DySrBaVWcBELNt7CEPEjnHcxSP
 BRgllC4oyi5AIQkWpKPrzYUsoHkBKCk1CUdmD8BsvPUJvbwdLGnerVyp++HuIYWh
 BCNrA1bvEU5XmmeFe6IyZ5uMSqodbDX9cSMza9ujcFIeOIRo86OqmXL8T+Nx+2Y9
 njgMr8ZOTxq1e9NqAvr6/A==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wkw2wr463-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Mar 2024 12:26:21 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 12:26:20 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 12:26:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1bxxaHHke/RrWB+ooRc+D/UZRTFh6cs/kKMEJtIR6rHtMNU3tIMHvQksGmU6yt8/GrJ8zBKy/lU4xnT7enzanXpYg/OThrhq3fxF2FsgAE4NohJ6zrjGPpVEoMlDmO5tVfEfT3whf5p3uLNp77F0dGogD4tzegU+CXSY82flBceF7AtCceKmY8Cvi+WdcGQpROVskXQ6SX0lTP69bhpF8fHmvXmP2ofdJndNYYGUgF7CHoqlFdIpVyG1ou2cTzAQHHwLlE0CXkU1vSkaXZEwh3haheEf2l0VFPCEa0gmfmtsVmqu9oiw7XACHYu2SAYRcxEBcxnvAYnZ0Gip9vdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6sxJ1PXK1/WJsbepE4LQovASiVqgaa5Q2NTtuwwJtw=;
 b=GV82bX67+V74YCG2tPgA5njjUOFwHHZ5QR7BEAY46+sjpvhqDrkNg5pM9/sJZtgxb/uvpUR7SIPlSYgaQF/7xs0hKjVTQn3J3LJoOWd/M9b9JziVV067NDKVgg7nnM1TSpUp1/uOAfNlCtvT5Pg8F8uXttMSDjT1GSoLcMEv7FiBCxdDSzjQfv9+g8KtiK21SbelewGLv28azfuivl18rSDIfDY3dye/TI1LIsVttemnK2wKGAQgc25YyTy61yJ/eiZfSQ8QLZyfYhvLnxKVZBvgVxzmgprHfcfKGxlG882FoR0Xb5Pn6MnYzrAbRJNJHZu4Td/ytkY36btB8banEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6sxJ1PXK1/WJsbepE4LQovASiVqgaa5Q2NTtuwwJtw=;
 b=IEI4aJRKCL+WBKdTcOJPZA7TUz0HCR7Gt8+Csf2GcwmirtFMZk7LUKpw7KRPIXVWkdiE5HntY8vWMNEmG7R74WtABz29tGq66fmfnrLDXW36s6dm4La3/nnIgM/8gqirxO1FmE7pyUuCVP3F+puxmljKFwjPwuNW0AHr6c3n/E8=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB2588.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 12:26:19 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732%4]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 12:26:19 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "aford173@gmail.com" <aford173@gmail.com>, Matt Coster
 <Matt.Coster@imgtec.com>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "robh@kernel.org" <robh@kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "aford@beaconembedded.com"
 <aford@beaconembedded.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Topic: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Index: AQHacIqosr7f7n14rUSUbqLQjAzCzA==
Date: Thu, 7 Mar 2024 12:26:19 +0000
Message-ID: <d959159dac0effce1a80986bc87e18ffd24773b9.camel@imgtec.com>
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
 <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
 <CAHCN7xJnKNdsrs+UMvPqdkN+j8v+8UaoH=zargcKRi7dw0GLNA@mail.gmail.com>
In-Reply-To: <CAHCN7xJnKNdsrs+UMvPqdkN+j8v+8UaoH=zargcKRi7dw0GLNA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB2588:EE_
x-ms-office365-filtering-correlation-id: 45e25124-b854-4a3f-70d3-08dc3ea1cab9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qaFkYEhI+oCl4s+cLIPZdFcLuTNpnsvEjY9Zfh1Yb4UeyLhrNQrnl280Q4F0azZJ6iJNnr29i/2qhtH6AFPb2RQGAWLgLY5V2sFKzd6nT9Qbuc4hsx/YGKrXlM5tGTsgI/OyxNp7VEfcqMU+oUkUNN58Mi6v+vE/mZsGsWKiP3NuJ9fyZWjaioFl1/HOtEQvjTfpStJEc8DR47LJ0CC1KepmEVaJ8ziFIdfXh9SDx5gv+QmemwbR6xO33gZyl4VMVMRCCGNgCU6sylOQfUj0F/jJGPTCD84byfIFs4GADk3Xn3CyKhy1qsauEZf+FpXB9fDQpP2erH33piDqH2FIHwlmECVrHYC3DsRigoEvaC8I/L4GfnGM5pg5ovV9judAKZpx1ckXEz37LaYW05vGuVhcWXO5fJHBF2qOO10+YG+tZDLMsHuHC+HLufjP1HnBDOZMTOTbo0pxM9xP4P2TmONylYxJ/S3R/hFo4MmHxAs/vk6gIqt2tGrk/8DmE4sTiRb70DBf6HQwk5DE/zdYizD9ozl7wzVGWo0+n2Va3ZwWHNpF0E3DjE+73jQnatv4Wx/Y1hMmFus1HNhjtViYaV4ezm64EWYXHkBE7GglElm43fuHGi+qXlaJ2mOeKbQ1V9jnNAKxx6DknWBHmzyAMsApvwnnHjV1ii9Lzp9bD4A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVVSZ3RYbW5YLzBhL1U3WU5XMUxVSmNxUkN6eHhnalNtby81K2x6UDE4WWI3?=
 =?utf-8?B?SkNjNk1JNFBBczhKQmFjU0tGWGFDaFdaTzhEWFZuUVY3K0xWYldYeStrTkJ3?=
 =?utf-8?B?VktURjVkZHBHTGtrTHJ3K0pqZUJkWTVINysxUnVpZ0UrR0xRMGxjTlovZnZI?=
 =?utf-8?B?UXBLTVkycW9ZcUY2R3ZUK3BzS2hOUVZmQjc4RStjSnBrbWdlbUZCMUowODUx?=
 =?utf-8?B?TWVkVUJSNmFEVTc0L2pjaFJFTGVlWFdYSHQvOWNHa1pUSUN3V0F2Z3lwMlpY?=
 =?utf-8?B?MUlybERGeFNuVjFSZUdRc3JXOVJqMGd1Vi83eUN0aGJrWHdOeDhFVGEzd3pn?=
 =?utf-8?B?bmZuTDdiSDdXOXlEYjQ4T0NPRkF5SUowSjR2WXBDdHFDK2JTdjQrbUU1U1Yv?=
 =?utf-8?B?ejByZHhDUjhVNmpJTjUydVBUQ3VrTm0zbGkzUzZPWjBvVm9nVGFHYjhaRENR?=
 =?utf-8?B?WFJBb2czOXdBTmx1SVZuTEhNSVgrOW9vWC9RcUQzbENyb0NiVk5mWS83NUsy?=
 =?utf-8?B?bDdzajRCQ3hCWUZGSURoMEVqblc2NU91Qi8yNmlpUk9NVXRHZVY0S0tZRHE5?=
 =?utf-8?B?M2tTbWdtN2lQUDdkcDhTREU4R0g5Qml6eEc1Q3ptKzJLVzdPUlZBcWZ3cjhH?=
 =?utf-8?B?bUUzUWlGd2JCQXQxaGZFRzVOZ3A5YWRKTkM5aWRRcEg1Rmo5Vjltb00waExX?=
 =?utf-8?B?NEE3UmN5VkxRTGhtd1crZEIrM2V2Znlid0JTc2FDVkloNEZvcGJ0UFdKTFBL?=
 =?utf-8?B?ZDFWZGdVMXpVYW8zU0pFZ1NzeXBiWlB0aEZRSWYzclVOZlNLWE1lZGVsTG5s?=
 =?utf-8?B?c0VhREJMaUhCSGZsN1RneUlFSHdYOTYvSUpCZEQ4WDQwcDRZUEpvS3gvT1VK?=
 =?utf-8?B?MHJaQTI4bFp0aVk0UnlDUGFvKzNyam1LaXNwd2pjZmZXTFl6cCsrd2NvODlC?=
 =?utf-8?B?VVdJVi9OSi8vZmpuNWErZlVoLzhsMWNWcWNDTk9IRFVSeGI1dXdTaW1udkxw?=
 =?utf-8?B?VU1vOFVsait2b2tqWXFPbjc2RVgzOGd3aFRnU2NQNGFmRDQzVkZPQ3FoUmdV?=
 =?utf-8?B?dFQrQyt2MktiSi9rcXRCaVZIUGprcnB4NWNuelBhTEVkazQvbjZIUVlaQUpZ?=
 =?utf-8?B?ajRQTjNIcXE0eGtNc0dLOU0zeURJWVBNU1JmUjNyS3pnMEJBcERtc2JpNml2?=
 =?utf-8?B?b0o1N0doRTNmMThKQ1hpNnlDS3ZoMnF4WFh6cXYyTS9UcWpnMCtMc3FtYnRY?=
 =?utf-8?B?T2U4QzVvYTRHTHdUdVZ0UFZpUlN4aWVOTVRXVGxHZ3dHVi9VdCs4S3o5bDc1?=
 =?utf-8?B?TkQrcFlDc3ExTVRUOS9TZnBVSndBWGlZQTk4RkpjZmFVTDJXSWN3c3hIUmlT?=
 =?utf-8?B?YWtYWGQ0dXNDTFJxVXM3NW5uN1lCdWc2THNJVjRMc0paMS96b0g5UUpxNSs3?=
 =?utf-8?B?dVMvcTBBUVJ5TThuenpvTnJObVdrOUdBenRLU3JyRWRMT2hNc2J1ZzFmME9l?=
 =?utf-8?B?dTlJU3J5MHpoUndnWG9HeVkrS2ZGazlzbCsrQWs1Q3JuL21WRmFHanM1Vlg1?=
 =?utf-8?B?Mkl1ZDZYWjN3S1hidkQybWpRMnZwMXdIdU52NWdCYzJSNGJWc25JR2xzdWNH?=
 =?utf-8?B?LzNxanByRkhrTWdZeW9NUkF3aGczS3prd0Fob25PRXU5NmI4d2NDSk5pMGhr?=
 =?utf-8?B?RUhsMUNMR0hNYi81ZWd5SkJnY0hja0ZQblhOVG91Z0JBOCtZRUcvYjRURHAw?=
 =?utf-8?B?ajBJYWtyMWxCMjhER0Zwejc2MCs3RkYzcEZWWVFlM3A0a0RVNHMxMDdkMW1X?=
 =?utf-8?B?aTljdFhnRmlrcTRwSFo5V3BPd3N4bnNndDRlZUJ4THlWRWpNZ3V2aUZVTk40?=
 =?utf-8?B?NVkvUktQZVB1N0hERExMa2N0Wmp6RmtBRjFoMko2Tk9DSExseHlNYTJlYkNK?=
 =?utf-8?B?V0E3RGxpVzVkNTJHV2dTNjh2TUsxME13YVJMZkVtbTRKbnIxd0pFaWtSQVJQ?=
 =?utf-8?B?NjJiL3ZlQjU3RW5tVWZCRG4rWHBrdmJ6d011c3Y1S0tDRzF5anZtUHo2MWZX?=
 =?utf-8?B?N2hEOGNoTmRORnpkMmF2VDczek9la1BBM0lTWjlQbWUwL2V2b3JhTFJhUFBy?=
 =?utf-8?B?U0FhVXpyVk1adnBybW5EQU9OOVBBQnF3eWJId0U0bmZxdzhIZzl1VEdScElr?=
 =?utf-8?B?dmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F93579F9FA7F2145BFEB50A804FBC18F@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e25124-b854-4a3f-70d3-08dc3ea1cab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 12:26:19.1027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: olKiG5bZBDVNjBi8vCX8GtnX5FEytycov4x0dvTyxQDmPzhLI2ZJJerzRqj0vzDqPeuY7Jg0jLwVayL1CEchfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2588
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: bvz6LIGkndGJ6VQQ6cX1MQJ6ZByMoB42
X-Proofpoint-GUID: bvz6LIGkndGJ6VQQ6cX1MQJ6ZByMoB42
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

T24gVHVlLCAyMDI0LTAyLTI3IGF0IDA1OjUwIC0wNjAwLCBBZGFtIEZvcmQgd3JvdGU6DQo+IE9u
IFR1ZSwgRmViIDI3LCAyMDI0IGF0IDM6MzHigK9BTSBNYXR0IENvc3RlciA8TWF0dC5Db3N0ZXJA
aW1ndGVjLmNvbT4gd3JvdGU6DQo+ID4gSGkgQWRhbSwNCj4gPiANCj4gPiBUaGFua3MgZm9yIHRo
ZXNlIHBhdGNoZXMhIEknbGwganVzdCByZXBseSB0byB0aGlzIG9uZSBwYXRjaCwgYnV0IG15DQo+
ID4gY29tbWVudHMgYXBwbHkgdG8gdGhlbSBhbGwuDQo+ID4gDQo+ID4gT24gMjcvMDIvMjAyNCAw
Mzo0NSwgQWRhbSBGb3JkIHdyb3RlOg0KPiA+ID4gVGhlIEdQVSBvbiB0aGUgUlovRzJNIGlzIGEg
Um9ndWUgR1g2MjUwIHdoaWNoIHVzZXMgZmlybXdhcmUNCj4gPiA+IHJvZ3VlXzQuNDUuMi41OF92
MS5mdyBhdmFpbGFibGUgZnJvbSBJbWFnaW5hdGlvbi4NCj4gPiA+IA0KPiA+ID4gV2hlbiBlbnVt
ZXJhdGVkLCBpdCBhcHBlYXJzIGFzOg0KPiA+ID4gICBwb3dlcnZyIGZkMDAwMDAwLmdwdTogW2Ry
bV0gbG9hZGVkIGZpcm13YXJlIHBvd2VydnIvcm9ndWVfNC40NS4yLjU4X3YxLmZ3DQo+ID4gPiAg
IHBvd2VydnIgZmQwMDAwMDAuZ3B1OiBbZHJtXSBGVyB2ZXJzaW9uIHYxLjAgKGJ1aWxkIDY1MTMz
MzYgT1MpDQo+ID4gDQo+ID4gVGhlc2UgbWVzc2FnZXMgYXJlIHByaW50ZWQgYWZ0ZXIgdmVyaWZ5
aW5nIHRoZSBmaXJtd2FyZSBibG9i4oCZcyBoZWFkZXJzLA0KPiA+ICpiZWZvcmUqIGF0dGVtcHRp
bmcgdG8gdXBsb2FkIGl0IHRvIHRoZSBkZXZpY2UuIEp1c3QgYmVjYXVzZSB0aGV5IGFwcGVhcg0K
PiA+IGluIGRtZXNnIGRvZXMgKm5vdCogaW1wbHkgdGhlIGRldmljZSBpcyBmdW5jdGlvbmFsIGJl
eW9uZCB0aGUgaGFuZGZ1bCBvZg0KPiA+IHJlZ2lzdGVyIHJlYWRzIGluIHB2cl9sb2FkX2dwdV9p
ZCgpLg0KPiA+IA0KPiA+IFNpbmNlIE1lc2EgZG9lcyBub3QgeWV0IGhhdmUgc3VwcG9ydCBmb3Ig
dGhpcyBHUFUsIHRoZXJl4oCZcyBub3QgYSBsb3QNCj4gPiB0aGF0IGNhbiBiZSBkb25lIHRvIGFj
dHVhbGx5IHRlc3QgdGhlc2UgYmluZGluZ3MuDQo+ID4gDQo+ID4gV2hlbiB3ZSBhZGRlZCB1cHN0
cmVhbSBzdXBwb3J0IGZvciB0aGUgZmlyc3QgR1BVICh0aGUgQVhFIGNvcmUgaW4gVEnigJlzDQo+
ID4gQU02MiksIHdlIG9wdGVkIHRvIHdhaXQgdW50aWwgdXNlcnNwYWNlIHdhcyBzdWZmaWNpZW50
bHkgcHJvZ3Jlc3NlZCB0bw0KPiA+IHRoZSBwb2ludCBpdCBjb3VsZCBiZSB1c2VkIGZvciB0ZXN0
aW5nLiBUaGlzIHRob3VnaHQgcHJvY2VzcyBzdGlsbA0KPiA+IGFwcGxpZXMgd2hlbiBhZGRpbmcg
bmV3IEdQVXMuDQo+ID4gDQo+ID4gT3VyIG1haW4gY29uY2VybiBpcyB0aGF0IGFkZGluZyBiaW5k
aW5ncyBmb3IgR1BVcyBpbXBsaWVzIGEgbGV2ZWwgb2YNCj4gPiBzdXBwb3J0IHRoYXQgY2Fubm90
IGJlIHRlc3RlZC4gVGhhdCBpbiB0dXJuIG1heSBtYWtlIGl0IGNoYWxsZW5naW5nIHRvDQo+ID4g
anVzdGlmeSBVQVBJIGNoYW5nZXMgaWYvd2hlbiB0aGV54oCZcmUgbmVlZGVkIHRvIGFjdHVhbGx5
IG1ha2UgdGhlc2UgR1BVcw0KPiA+IGZ1bmN0aW9uYWwuDQo+IA0KPiBJIHdyb25nbHkgYXNzdW1l
ZCB0aGF0IHdoZW4gdGhlIGZpcm13YXJlIHdhcyByZWFkeSwgdGhlcmUgd2FzIHNvbWUNCj4gcHJl
bGltaW5hcnkgZnVuY3Rpb25hbGl0eSwgYnV0IGl0IHNvdW5kcyBsaWtlIHdlIG5lZWQgdG8gd29y
ayBmb3INCj4gU2VyaWVzNlhUIHN1cHBvcnQgdG8gYmUgYWRkZWQgdG8gdGhlIGRyaXZlci4gIEkg
b25seSB1c2VkIHRoZSBBWEUNCj4gY29tcGF0aWJsZSBzaW5jZSBpdCBhcHBlYXJlZCB0byB0aGUg
YmUgdGhlIG9ubHkgb25lIGFuZCB0aGUgZXhpc3RpbmcNCj4gYmluZGluZyBkb2N1bWVudCBzdGF0
ZWQgIm1vZGVsL3JldmlzaW9uIGlzIGZ1bGx5IGRpc2NvdmVyYWJsZSIgd2hpY2ggSQ0KPiBpbnRl
cnByZXRlZCB0byBtZWFuIHRoYXQgdGhlIEFYRSBjb21wYXRpYmxlIHdhcyBzdWZmaWNpZW50Lg0K
DQpUaGUgY29tbWVudCBpcyByZWxhdGVkIHRvIHRoZXJlIGJlaW5nIGEgZmV3IG1vZGVscy9yZXZp
c2lvbnMgb2YgQVhFIFsxXVsyXVszXSwNCndoaWNoIHdlIGNhbiBkaXN0aW5ndWlzaCBiZXR3ZWVu
IGJ5IHJlYWRpbmcgYSByZWdpc3Rlci4NCg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3Jk
IDxhZm9yZDE3M0BnbWFpbC5jb20+DQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+ID4gPiBpbmRleCBhOGE0NGZlNWU4M2IuLjg5MjNkOTYy
NGIzOSAxMDA2NDQNCj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3
NzRhMS5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0
YTEuZHRzaQ0KPiA+ID4gQEAgLTIzNTIsNiArMjM1MiwxNiBAQCBnaWM6IGludGVycnVwdC1jb250
cm9sbGVyQGYxMDEwMDAwIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8
JmNwZyA0MDg+Ow0KPiA+ID4gICAgICAgICAgICAgICB9Ow0KPiA+ID4gDQo+ID4gPiArICAgICAg
ICAgICAgIGdwdTogZ3B1QGZkMDAwMDAwIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0YTEtZ3B1IiwgImltZyxpbWctYXhlIjsNCj4gPiAN
Cj4gPiBUaGUgR1g2MjUwIGlzICpub3QqIGFuIEFYRSBjb3JlIC0gaXQgc2hvdWxkbuKAmXQgYmUg
bGlzdGVkIGFzIGNvbXBhdGlibGUNCj4gPiB3aXRoIG9uZS4gRm9yIHByaW9yIGFydCwgc2VlIFsx
XSB3aGVyZSB3ZSBhZGRlZCBzdXBwb3J0IGZvciB0aGUgTVQ4MTczDQo+ID4gZm91bmQgaW4gRWxt
IENocm9tZWJvb2tzIFIxMyAoYWxzbyBhIFNlcmllczZYVCBHUFUpLg0KPiA+IA0KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4ZmQwMDAwMDAgMCAweDIwMDAwPjsNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDExMj47DQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSI7DQo+ID4gDQo+ID4g
U2VyaWVzNlhUIGNvcmVzIGhhdmUgdGhyZWUgY2xvY2tzIChzZWUgWzFdIGFnYWluKS4gSSBkb27i
gJl0IGhhdmUgYQ0KPiA+IFJlbmVzYXMgVFJNIHRvIGhhbmQg4oCTIGRvIHlvdSBrbm93IGlmIHRo
ZWlyIGRvY3MgZ28gaW50byBkZXRhaWwgb24gdGhlDQo+ID4gR1BVIGludGVncmF0aW9uPw0KPiA+
IA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxMTkg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcG93ZXIt
ZG9tYWlucyA9IDwmc3lzYyBSOEE3NzRBMV9QRF8zREdfQj47DQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgcmVzZXRzID0gPCZjcGcgMTEyPjsNCj4gPiA+ICsgICAgICAgICAgICAgfTsNCj4g
PiA+ICsNCj4gPiA+ICAgICAgICAgICAgICAgcGNpZWMwOiBwY2llQGZlMDAwMDAwIHsNCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscGNpZS1yOGE3NzRh
MSIsDQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLHBj
aWUtcmNhci1nZW4zIjsNCj4gPiANCj4gPiBBcyB5b3UgcHJvYmFibHkgZXhwZWN0IGJ5IHRoaXMg
cG9pbnQsIEkgaGF2ZSB0byBuYWNrIHRoaXMgc2VyaWVzIGZvcg0KPiA+IG5vdy4gSSBhcHByZWNp
YXRlIHlvdXIgZWZmb3J0IGhlcmUgYW5kIEnigJlsbCBiZSBoYXBweSB0byBoZWxwIHlvdSBsYW5k
DQo+IA0KPiBJIGdldCB0aGF0LiAgSSB3YXNuJ3Qgc3VyZSBpZiBJIHNob3VsZCBoYXZlIGV2ZW4g
cHVzaGVkIHRoaXMsIGJ1dCBJDQo+IHdhbnRlZCB0byBnZXQgYSBsaXR0bGUgdHJhY3Rpb24sIGJl
Y2F1c2UgSSBrbm93IHRoZXJlIGFyZSBwZW9wbGUgbGlrZQ0KPiBteXNlbGYgd2hvIHdhbnQgdG8g
dXNlIHRoZSAzRCBpbiB0aGUgUmVuZXNhcyBib2FyZHMsIGJ1dCBkb24ndCB3YW50IHRvDQo+IHVz
ZSB0aGUgY2xvc2VkLXNvdXJjZSBibG9icyB0aWVkIHRvIEVVTEEgYW5kIE5EQSBkb2N1bWVudHMu
DQo+IA0KPiA+IHRoZXNlIG9uY2UgTWVzYSBnYWlucyBzb21lIGZvcm0gb2YgdXNhYmxlIHN1cHBv
cnQgdG8gYWxsb3cgdGVzdGluZy4NCj4gDQo+IElzIHRoZXJlIGEgd2F5IGZvciB5b3VyIGdyb3Vw
IHRvIGFkZCBtZSB0byB0aGUgQ0MgbGlzdCB3aGVuIGZ1dHVyZQ0KPiB1cGRhdGVzIGFyZSBzdWJt
aXR0ZWQ/ICBJJ2QgbGlrZSB0byBmb2xsb3cgdGhpcyBhbmQgcmVzdWJtaXQgd2hlbiBpdCdzDQo+
IHJlYWR5Lg0KDQpTdXJlLCB3ZSdsbCBrZWVwIHlvdSB1cGRhdGVkIGFzIHRoaW5ncyBwcm9ncmVz
cy4NCg0KVGhhbmtzDQpGcmFuaw0KDQpbMV0gaHR0cHM6Ly93d3cuaW1hZ2luYXRpb250ZWNoLmNv
bS9wcm9kdWN0L2ltZy1heGUtMS0xNm0vDQpbMl0gaHR0cHM6Ly93d3cuaW1hZ2luYXRpb250ZWNo
LmNvbS9wcm9kdWN0L2ltZy1heGUtMS0xNi8NClszXSBodHRwczovL3d3dy5pbWFnaW5hdGlvbnRl
Y2guY29tL3Byb2R1Y3QvaW1nLWF4ZS0yLTE2Lw0KDQo+ID4gQ2hlZXJzLA0KPiA+IE1hdHQNCj4g
PiANCj4gPiBbMV06IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9pbWFnaW5hdGlvbi9s
aW51eC8tL2Jsb2IvYjM1MDZiOGJjNDVlZDZkNDAwNWViMzJhOTk0ZGYwZTMzZDY2MTNmMS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpI0w5OTMtMTAwNg0K
