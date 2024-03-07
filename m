Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927A874F39
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 13:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3724F10F0BE;
	Thu,  7 Mar 2024 12:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="mmllIG0r";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="lf4s8dtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B4A113797
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 12:37:47 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4277bS6h009908; Thu, 7 Mar 2024 12:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=twIqIydtf9nTycaI/E9A1jjc0XPeD0n6cEbP63ghuxY=; b=
 mmllIG0rhHBmpW/kEruJTbScKLyx+R0Fo75HsOksFHvpt1JI5yBSiK8XpVkRYQIR
 27gE3FOF5RMYsycRPzI7dIAqLgR9PJBMdgTuxYP3nJJeI+8Q49ayfIUitxnuR1Dz
 BFWJZCfMnN472v4QopvxrDwPZBtt4/gq1Ue3O9Ij4WskHNQUUqYtbQQdTCDEYw+l
 P0LFZfRAxoiaEum25aejc9uIrnVTvnzXawqT6hSLyRPlF42arltAyJT6CXrJvQPP
 aaqRSzdo6vcIyMmT1pswVsHcpSZ8Rv8zBRik5irDHLj86LFtpwodFvIXBlvDTjmX
 4rhygmf1VywbJgv96StFXw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wkw2wr52m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Mar 2024 12:37:30 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 12:37:29 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 12:37:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leLnaGAiuL4UzAGQDEYcUn11bLIPW4597ndy84w0nJUeB8F3rkQbfNDmlEpKj0oLxZF4V4xIxickAnguINMeDNYapL/N2FRpI1ORCygmc7wjdoW9D3fE95bWv1CqUcnhWfT8KU/bTSStbfy7YPyIuTwiINivUgAnrKrXtaIdXfEUklsdYXHG7fRmU/38YRLObl49xHUoio4jnK7C1/Baau1sJmNRTnFrU41t88cz2kUk2qr8HwrXdOVSz1TmFiWJ0KKizq7Dsle1+lQm1lKyfww9Eg16xq9Txc/yzsAjBw3abSodDWS5mYIx6zDzh5JuWeLy2XWE0Snc7qyJGKS9rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twIqIydtf9nTycaI/E9A1jjc0XPeD0n6cEbP63ghuxY=;
 b=mtDk4p+i/F0Epnu9A84Te16lvN8KRFWRYTMlZO49jCgrR6Dxz8/nIXMvZuuRNdmJLt0u4xwJJdPR9aCVdeA5xbUUPcdu1HbWDE2J6YNa1823moZ7UlL7JN4F+AbUL4WVoq+bRiHcGdgrBALddjFHjsxlSCzIvWkEnjbjVWh3AfoXXUZjt6gt/kHwIB4FQT5Qw+ubISZs2Cnsm7ZubfOtgQj/bqw05KAmWXk+ruhkmsc2hFVHspTsGrczj6Y0Nd3kpKl/2Mo+YSy1HqveGtjuphEJLlHzhLnFcDfPMVb3PO897OkXfzSue7GQemlRmR6xwEoPErqFvofbKTeaikV4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twIqIydtf9nTycaI/E9A1jjc0XPeD0n6cEbP63ghuxY=;
 b=lf4s8dtbc+KJZiZlQlvaG3eLEqacZh8kXZMPA1USKGG6d/P9jtFIW/WfGBpxR8l/usMxIN/8G5/8uyFkGD4ngLIOAuumJV3+0fY3YKgKsjWWzHMTfqAvIhk7oooIc7oG3kP5RPqZCBz+5z7CbkuAaJAQTZ9UhHHM3c04V5oZXDI=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB6369.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 12:37:27 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732%4]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 12:37:27 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "aford173@gmail.com" <aford173@gmail.com>, Matt Coster
 <Matt.Coster@imgtec.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh@kernel.org" <robh@kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "aford@beaconembedded.com" <aford@beaconembedded.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Topic: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Index: AQHacIqosr7f7n14rUSUbqLQjAzCzLEsN1YA
Date: Thu, 7 Mar 2024 12:37:27 +0000
Message-ID: <f5eb761e9ec30927657ed02a55e3b91abede90fe.camel@imgtec.com>
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
 <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
 <CAHCN7xJnKNdsrs+UMvPqdkN+j8v+8UaoH=zargcKRi7dw0GLNA@mail.gmail.com>
 <d959159dac0effce1a80986bc87e18ffd24773b9.camel@imgtec.com>
In-Reply-To: <d959159dac0effce1a80986bc87e18ffd24773b9.camel@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB6369:EE_
x-ms-office365-filtering-correlation-id: 59cc9f88-9f8e-4e04-ee6c-08dc3ea35928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d1EwVaHL/45M6IWj3iF8G9gm1laaqsKVBxpkjrMAjKfVi+opCGiVHe7dvqcc99j2RB1bzkXkxgIauxVJnj90KXHCQ4GMwz6Qm9DlEXxwLzYnzlS/LutpuxzITSJSdX3FunuQGi+3QxNMNaXFMtCZdXLXJ1+PL3O8taTfjQ4OP69YHJYn87+demmAp6sG8AnZvrd0cUOglt/ShteuBsJb//Kd3X7MMIL3jjE0+Exh0aSxMDRrmc4bu474+KK52GWvNck48zaFBecjv2j47UQkOqeV1dUOV4Z/HgskYCg0l1rc1rR6BV27POI1XzUF1MzxYa/4APbz0a08rXca5NaOWQgapUnF95cv5ZW5e1vcYyKM4FKBgofhqXmLNKn72Lk9Gon0l5lf+KnDxnqTTU2KfCkIWyJpDzNwuaZtpWUkWJ+tGFObXApHK0x/+hIHpVPae6c15BK7B0BkilBrAGonXER2w14adSRtWwzZxPJlxSvEFwmPvCxDrucAIvh9u6F1K1LE+tmWgcpC7rYK6APpGqrUMtLVBvVNIlNKdP68k9JJ8sLRzkUEMQHpDyw4/8efG+czCJjf7N7/ERy62k1Y2DL/95dIaSZDZqPSMlSxf3WY5o3oC5j3W7aIphtNc4Gd/xKOSayE2B6dHnTWAYIs4iumD18iwg/a2CMJsIF5ENY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk9HMWFoeHR2M0JrN1hJeG9nN3hnWnNXaUFZaEhvU09KZVpkSkhKUmVhdEh1?=
 =?utf-8?B?eXNjSjYyUzhvMTdlWU5nTHBGUFJCZHp3MWVzLzFRcjVxMUF1RWtQanVhdktK?=
 =?utf-8?B?SlpkNkF4dURhSmlGSGMrMnVTdVN1T3Q2aVNxdkdDYWVHYzhBS2FXTTh3dmdS?=
 =?utf-8?B?aXhRY2RkVk1kVTdUMVJuRDhFUUpyT3BYaEU4TU03b2hrRTBpbkhoNGNuekpT?=
 =?utf-8?B?b2FpYlhqWGVLMUZtcTMzdHNvNmtLOVhLb2lCRWZoZ2tBd1NsN3NmL2JXcC9C?=
 =?utf-8?B?aldzUXQ0czRLS3U5SFd0UnJBcHFxTmFuQmp0KzgrbUpNdlN3bE5WK1kxSVJF?=
 =?utf-8?B?ZDdFTEFGK2NBYzJXTWlLR3QybTJpYU5McWVJZGgxbWdiRzcvdEV5VU1HUm5F?=
 =?utf-8?B?QjRQb2toeVNjbWZncVYrNW5HRzdhS2p1Z2FMNVNreU1rb1RoelN5cG0xdFZJ?=
 =?utf-8?B?TVNVbUJyWTZ2V1lZVGFuRXFSL2ltY2xTdGIrUnVmTm1nSkRHd3hTNkZRSXVP?=
 =?utf-8?B?TDczU2NXVGw4V1VkSk94aWF4ZmhrR2RKbFlTcEVCYnBKRzVjMXRxeGp0V0h1?=
 =?utf-8?B?ZW5IckFJYkdTWHBFMTdUM3VCZzRDRjZJMUM5K0F6a2JvSHNwQTRVNjZBdEhZ?=
 =?utf-8?B?U1JRMDRRT29NeVRDb0dIK3NYcGNFZE5yRkVGdG16VUdnUGNja0pkZEt0OHpL?=
 =?utf-8?B?UWJIV0QrdnJjQndJNjczWmx1a2RRUDltQnUrZ1R3YkVQUkt5ZkhMclM0VWZt?=
 =?utf-8?B?Mmd3NG04Z2hjRVVtcHBvZXU2TU9BSmtyOTZ4anMzZ3Eyc1FRZFdGRjR4RjY4?=
 =?utf-8?B?MlhFSzdyMUVMZDFnOGF0V3JYRUpxVnFSc1h0VnRxVVltRUlIcThQdlZWNlBD?=
 =?utf-8?B?YXN1VUxlMzV3dDlKS3czQjZwQXpWa3JaemNvTy92TXBXdHdjYmVyS2lBS3V1?=
 =?utf-8?B?dS9nMFZ0amlUb0Rud0lST0QxaGx0UE1lanErQi9rZ1QyWWRGWktoV1RIamdL?=
 =?utf-8?B?cnVFT0pMcDVxNVpiQ1VlaDRiZlg5OUQreEpXb2dDdXEwcTJDREw5WGs0MjhU?=
 =?utf-8?B?SFdrd1VhTWJqLzQyYmVrM3BQODRwbC9PUG5pYUp6VmthY2UzVm1ITElLcDJY?=
 =?utf-8?B?cDUzNEZEVElWWGZIeDlYQzhDeEV2RGo5Z05xeXA0WnpsTGdlc0JRR3lHc09P?=
 =?utf-8?B?NTd1RElXVDcxeTZEOWp1MWl3cjc1RE9zcCtxMWZneUFMR2lFbFFUbmhUK3Y2?=
 =?utf-8?B?SUVzUXBUNlZMZFpMdTdwVmx0aGNrTUlvcElzS3hwcnUwVERQeTFvRXhndTdr?=
 =?utf-8?B?b1puK3RYcno3Tks0dytrZHhIRktnMFBERTlmVnhROUUxMmNSNyt6UEZqMWVv?=
 =?utf-8?B?cEEwU1lDNTZDdnRNZXQvLzBvN2psNDRoWVUzdEE0SVM1L3ozbEJCWDZSd3Vy?=
 =?utf-8?B?akFWbFdWVHlSOTNBbDRXeDZCR1EwckJSRjd4bStNVGR2RnRpQWplcTU1d3hn?=
 =?utf-8?B?NlZIQ3YzOThRM2tUNXRPTStJRHUzdVdWeWxXV1R1bnpWN1ZTM0trZXQ4OHVD?=
 =?utf-8?B?ZWp5ZkoveFNhaGZIVEVrN1dXdk56ZlZjWW5NVHdtSG9PT1NBOXREMklSK1lx?=
 =?utf-8?B?RUg2b0lnVUhVZU1xcklNOHZyYTdnVThKRkJYTC9ibFNwSCtFRkRGa2FxMmlx?=
 =?utf-8?B?Z0hKQWxGdjRxMGlOMi9ONVdNbWJmdTlQSHlIZ28yKzNQbG5CNmlNQzZjamF2?=
 =?utf-8?B?QmxUcGNobDJ4L2Nhd2NBTERKV2lLUzZhVm0rMUg1WlhzVUI0M3dzMmJiM3BF?=
 =?utf-8?B?U0V6SC95dHJzWmdCNWNGVFJwOXRJVlhrZ2trYys5dEtQaW9OcDZ5VEU4aTQz?=
 =?utf-8?B?SUJ6d21nYWtnMWd5UEgvSGFUWllHd2ZyOWYrejV5OFNMa2NXbkZzTGdiVHU5?=
 =?utf-8?B?TE4ySzVYeFpiVnBncFNvdzFsSEhQbk1ad25IQndnRFRQZll4bUJiZFN3dWRS?=
 =?utf-8?B?UnVuQlRsOUpqWXFkYjd1anNPRlIyUGR5bVRWSHI1VDRVVU5ZWDk0ZDNzWlUr?=
 =?utf-8?B?S0RYNjFyL0xIR1JSejN3RGl6MmZQRzk3amY4eUlaSlJRZVBsc01TRUhmbFVR?=
 =?utf-8?B?SUxzZGJXNGVxK0s0ZzVNbnRmZS9RWE5SYmtPRE9EejZuU1loQitJWHlHZTBn?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC7A59543CE77646BEAE27DBACB234AB@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cc9f88-9f8e-4e04-ee6c-08dc3ea35928
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 12:37:27.5709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4W2jUJSfdCEMoaPXkvxF0+yiOq8l3k/f6dskc4TUq+lUKjqW/caC5i+U4Kyf1wOeEMJlObNTlhKzRHYEWFGUpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6369
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: IgWc3nEOpQ6R52-ZWZT0g99mgJrkaDdj
X-Proofpoint-GUID: IgWc3nEOpQ6R52-ZWZT0g99mgJrkaDdj
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

T24gVGh1LCAyMDI0LTAzLTA3IGF0IDEyOjI2ICswMDAwLCBGcmFuayBCaW5ucyB3cm90ZToNCj4g
T24gVHVlLCAyMDI0LTAyLTI3IGF0IDA1OjUwIC0wNjAwLCBBZGFtIEZvcmQgd3JvdGU6DQo+ID4g
T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMzozMeKAr0FNIE1hdHQgQ29zdGVyIDxNYXR0LkNvc3Rl
ckBpbWd0ZWMuY29tPiB3cm90ZToNCj4gPiA+IEhpIEFkYW0sDQo+ID4gPiANCj4gPiA+IFRoYW5r
cyBmb3IgdGhlc2UgcGF0Y2hlcyEgSSdsbCBqdXN0IHJlcGx5IHRvIHRoaXMgb25lIHBhdGNoLCBi
dXQgbXkNCj4gPiA+IGNvbW1lbnRzIGFwcGx5IHRvIHRoZW0gYWxsLg0KPiA+ID4gDQo+ID4gPiBP
biAyNy8wMi8yMDI0IDAzOjQ1LCBBZGFtIEZvcmQgd3JvdGU6DQo+ID4gPiA+IFRoZSBHUFUgb24g
dGhlIFJaL0cyTSBpcyBhIFJvZ3VlIEdYNjI1MCB3aGljaCB1c2VzIGZpcm13YXJlDQo+ID4gPiA+
IHJvZ3VlXzQuNDUuMi41OF92MS5mdyBhdmFpbGFibGUgZnJvbSBJbWFnaW5hdGlvbi4NCj4gPiA+
ID4gDQo+ID4gPiA+IFdoZW4gZW51bWVyYXRlZCwgaXQgYXBwZWFycyBhczoNCj4gPiA+ID4gICBw
b3dlcnZyIGZkMDAwMDAwLmdwdTogW2RybV0gbG9hZGVkIGZpcm13YXJlIHBvd2VydnIvcm9ndWVf
NC40NS4yLjU4X3YxLmZ3DQo+ID4gPiA+ICAgcG93ZXJ2ciBmZDAwMDAwMC5ncHU6IFtkcm1dIEZX
IHZlcnNpb24gdjEuMCAoYnVpbGQgNjUxMzMzNiBPUykNCj4gPiA+IA0KPiA+ID4gVGhlc2UgbWVz
c2FnZXMgYXJlIHByaW50ZWQgYWZ0ZXIgdmVyaWZ5aW5nIHRoZSBmaXJtd2FyZSBibG9i4oCZcyBo
ZWFkZXJzLA0KPiA+ID4gKmJlZm9yZSogYXR0ZW1wdGluZyB0byB1cGxvYWQgaXQgdG8gdGhlIGRl
dmljZS4gSnVzdCBiZWNhdXNlIHRoZXkgYXBwZWFyDQo+ID4gPiBpbiBkbWVzZyBkb2VzICpub3Qq
IGltcGx5IHRoZSBkZXZpY2UgaXMgZnVuY3Rpb25hbCBiZXlvbmQgdGhlIGhhbmRmdWwgb2YNCj4g
PiA+IHJlZ2lzdGVyIHJlYWRzIGluIHB2cl9sb2FkX2dwdV9pZCgpLg0KPiA+ID4gDQo+ID4gPiBT
aW5jZSBNZXNhIGRvZXMgbm90IHlldCBoYXZlIHN1cHBvcnQgZm9yIHRoaXMgR1BVLCB0aGVyZeKA
mXMgbm90IGEgbG90DQo+ID4gPiB0aGF0IGNhbiBiZSBkb25lIHRvIGFjdHVhbGx5IHRlc3QgdGhl
c2UgYmluZGluZ3MuDQo+ID4gPiANCj4gPiA+IFdoZW4gd2UgYWRkZWQgdXBzdHJlYW0gc3VwcG9y
dCBmb3IgdGhlIGZpcnN0IEdQVSAodGhlIEFYRSBjb3JlIGluIFRJ4oCZcw0KPiA+ID4gQU02Miks
IHdlIG9wdGVkIHRvIHdhaXQgdW50aWwgdXNlcnNwYWNlIHdhcyBzdWZmaWNpZW50bHkgcHJvZ3Jl
c3NlZCB0bw0KPiA+ID4gdGhlIHBvaW50IGl0IGNvdWxkIGJlIHVzZWQgZm9yIHRlc3RpbmcuIFRo
aXMgdGhvdWdodCBwcm9jZXNzIHN0aWxsDQo+ID4gPiBhcHBsaWVzIHdoZW4gYWRkaW5nIG5ldyBH
UFVzLg0KPiA+ID4gDQo+ID4gPiBPdXIgbWFpbiBjb25jZXJuIGlzIHRoYXQgYWRkaW5nIGJpbmRp
bmdzIGZvciBHUFVzIGltcGxpZXMgYSBsZXZlbCBvZg0KPiA+ID4gc3VwcG9ydCB0aGF0IGNhbm5v
dCBiZSB0ZXN0ZWQuIFRoYXQgaW4gdHVybiBtYXkgbWFrZSBpdCBjaGFsbGVuZ2luZyB0bw0KPiA+
ID4ganVzdGlmeSBVQVBJIGNoYW5nZXMgaWYvd2hlbiB0aGV54oCZcmUgbmVlZGVkIHRvIGFjdHVh
bGx5IG1ha2UgdGhlc2UgR1BVcw0KPiA+ID4gZnVuY3Rpb25hbC4NCj4gPiANCj4gPiBJIHdyb25n
bHkgYXNzdW1lZCB0aGF0IHdoZW4gdGhlIGZpcm13YXJlIHdhcyByZWFkeSwgdGhlcmUgd2FzIHNv
bWUNCj4gPiBwcmVsaW1pbmFyeSBmdW5jdGlvbmFsaXR5LCBidXQgaXQgc291bmRzIGxpa2Ugd2Ug
bmVlZCB0byB3b3JrIGZvcg0KPiA+IFNlcmllczZYVCBzdXBwb3J0IHRvIGJlIGFkZGVkIHRvIHRo
ZSBkcml2ZXIuICBJIG9ubHkgdXNlZCB0aGUgQVhFDQo+ID4gY29tcGF0aWJsZSBzaW5jZSBpdCBh
cHBlYXJlZCB0byB0aGUgYmUgdGhlIG9ubHkgb25lIGFuZCB0aGUgZXhpc3RpbmcNCj4gPiBiaW5k
aW5nIGRvY3VtZW50IHN0YXRlZCAibW9kZWwvcmV2aXNpb24gaXMgZnVsbHkgZGlzY292ZXJhYmxl
IiB3aGljaCBJDQo+ID4gaW50ZXJwcmV0ZWQgdG8gbWVhbiB0aGF0IHRoZSBBWEUgY29tcGF0aWJs
ZSB3YXMgc3VmZmljaWVudC4NCj4gDQo+IFRoZSBjb21tZW50IGlzIHJlbGF0ZWQgdG8gdGhlcmUg
YmVpbmcgYSBmZXcgbW9kZWxzL3JldmlzaW9ucyBvZiBBWEUgWzFdWzJdWzNdLA0KPiB3aGljaCB3
ZSBjYW4gZGlzdGluZ3Vpc2ggYmV0d2VlbiBieSByZWFkaW5nIGEgcmVnaXN0ZXIuDQo+IA0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4NCj4gPiA+
ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhh
Nzc0YTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+
ID4gPiA+IGluZGV4IGE4YTQ0ZmU1ZTgzYi4uODkyM2Q5NjI0YjM5IDEwMDY0NA0KPiA+ID4gPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaQ0KPiA+ID4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaQ0KPiA+ID4gPiBA
QCAtMjM1Miw2ICsyMzUyLDE2IEBAIGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZjEwMTAwMDAg
ew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgNDA4PjsNCj4g
PiA+ID4gICAgICAgICAgICAgICB9Ow0KPiA+ID4gPiANCj4gPiA+ID4gKyAgICAgICAgICAgICBn
cHU6IGdwdUBmZDAwMDAwMCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gInJlbmVzYXMscjhhNzc0YTEtZ3B1IiwgImltZyxpbWctYXhlIjsNCj4gPiA+IA0KPiA+
ID4gVGhlIEdYNjI1MCBpcyAqbm90KiBhbiBBWEUgY29yZSAtIGl0IHNob3VsZG7igJl0IGJlIGxp
c3RlZCBhcyBjb21wYXRpYmxlDQo+ID4gPiB3aXRoIG9uZS4gRm9yIHByaW9yIGFydCwgc2VlIFsx
XSB3aGVyZSB3ZSBhZGRlZCBzdXBwb3J0IGZvciB0aGUgTVQ4MTczDQo+ID4gPiBmb3VuZCBpbiBF
bG0gQ2hyb21lYm9va3MgUjEzIChhbHNvIGEgU2VyaWVzNlhUIEdQVSkuDQo+ID4gPiANCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4ZmQwMDAwMDAgMCAweDIwMDAwPjsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgMTEy
PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiOw0K
PiA+ID4gDQo+ID4gPiBTZXJpZXM2WFQgY29yZXMgaGF2ZSB0aHJlZSBjbG9ja3MgKHNlZSBbMV0g
YWdhaW4pLiBJIGRvbuKAmXQgaGF2ZSBhDQo+ID4gPiBSZW5lc2FzIFRSTSB0byBoYW5kIOKAkyBk
byB5b3Uga25vdyBpZiB0aGVpciBkb2NzIGdvIGludG8gZGV0YWlsIG9uIHRoZQ0KPiA+ID4gR1BV
IGludGVncmF0aW9uPw0KPiA+ID4gDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMTE5IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzRBMV9QRF8zREdf
Qj47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyAxMTI+Ow0K
PiA+ID4gPiArICAgICAgICAgICAgIH07DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgICAgICAgICAg
ICBwY2llYzA6IHBjaWVAZmUwMDAwMDAgew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHBjaWUtcjhhNzc0YTEiLA0KPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLHBjaWUtcmNhci1nZW4zIjsNCj4gPiA+
IA0KPiA+ID4gQXMgeW91IHByb2JhYmx5IGV4cGVjdCBieSB0aGlzIHBvaW50LCBJIGhhdmUgdG8g
bmFjayB0aGlzIHNlcmllcyBmb3INCj4gPiA+IG5vdy4gSSBhcHByZWNpYXRlIHlvdXIgZWZmb3J0
IGhlcmUgYW5kIEnigJlsbCBiZSBoYXBweSB0byBoZWxwIHlvdSBsYW5kDQo+ID4gDQo+ID4gSSBn
ZXQgdGhhdC4gIEkgd2Fzbid0IHN1cmUgaWYgSSBzaG91bGQgaGF2ZSBldmVuIHB1c2hlZCB0aGlz
LCBidXQgSQ0KPiA+IHdhbnRlZCB0byBnZXQgYSBsaXR0bGUgdHJhY3Rpb24sIGJlY2F1c2UgSSBr
bm93IHRoZXJlIGFyZSBwZW9wbGUgbGlrZQ0KPiA+IG15c2VsZiB3aG8gd2FudCB0byB1c2UgdGhl
IDNEIGluIHRoZSBSZW5lc2FzIGJvYXJkcywgYnV0IGRvbid0IHdhbnQgdG8NCj4gPiB1c2UgdGhl
IGNsb3NlZC1zb3VyY2UgYmxvYnMgdGllZCB0byBFVUxBIGFuZCBOREEgZG9jdW1lbnRzLg0KPiA+
IA0KPiA+ID4gdGhlc2Ugb25jZSBNZXNhIGdhaW5zIHNvbWUgZm9ybSBvZiB1c2FibGUgc3VwcG9y
dCB0byBhbGxvdyB0ZXN0aW5nLg0KPiA+IA0KPiA+IElzIHRoZXJlIGEgd2F5IGZvciB5b3VyIGdy
b3VwIHRvIGFkZCBtZSB0byB0aGUgQ0MgbGlzdCB3aGVuIGZ1dHVyZQ0KPiA+IHVwZGF0ZXMgYXJl
IHN1Ym1pdHRlZD8gIEknZCBsaWtlIHRvIGZvbGxvdyB0aGlzIGFuZCByZXN1Ym1pdCB3aGVuIGl0
J3MNCj4gPiByZWFkeS4NCj4gDQo+IFN1cmUsIHdlJ2xsIGtlZXAgeW91IHVwZGF0ZWQgYXMgdGhp
bmdzIHByb2dyZXNzLg0KPiANCg0KT2gsIEkgZm9yZ290IHRvIGFkZCwgaW4gdGhlIG1lYW50aW1l
LCB3b3VsZCB5b3UgZmluZCBpdCB1c2VmdWwgZm9yIHVzIHRvIGNyZWF0ZQ0KYSBTZXJpZXM2WFQg
YnJhbmNoIG9uIEdpdExhYiB3aGVyZSB3ZSBjYW4gaW5jbHVkZSB0aGVzZSBwYXRjaGVzPyBXZSBj
YW4gY3JlYXRlIGENCmNvcnJlc3BvbmRpbmcgTWVzYSBicmFuY2ggdGhhdCB3ZSdsbCB1cGRhdGUg
YXMgd2UgcHJvZ3Jlc3Mgc3VwcG9ydCBmb3IgR1g2MjUwLg0KVGhpcyBzaG91bGQgbWFrZSBpdCBl
YXNpZXIgZm9yIHlvdSAoYW5kIG90aGVycykgdG8gdGVzdCBhbmQgaG9wZWZ1bGx5IG1ha2UgaXQN
CmVhc2llciBmb3Igb3RoZXJzIHRvIGNvbnRyaWJ1dGUgd2hpbGUgd2Ugd29yayB0byBnZXQgc3Vw
cG9ydCBpbnRvIGEgZ29vZCBzdGF0ZS4NCg0KPiBUaGFua3MNCj4gRnJhbmsNCj4gDQo+IFsxXSBo
dHRwczovL3d3dy5pbWFnaW5hdGlvbnRlY2guY29tL3Byb2R1Y3QvaW1nLWF4ZS0xLTE2bS8NCj4g
WzJdIGh0dHBzOi8vd3d3LmltYWdpbmF0aW9udGVjaC5jb20vcHJvZHVjdC9pbWctYXhlLTEtMTYv
DQo+IFszXSBodHRwczovL3d3dy5pbWFnaW5hdGlvbnRlY2guY29tL3Byb2R1Y3QvaW1nLWF4ZS0y
LTE2Lw0KPiANCj4gPiA+IENoZWVycywNCj4gPiA+IE1hdHQNCj4gPiA+IA0KPiA+ID4gWzFdOiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvaW1hZ2luYXRpb24vbGludXgvLS9ibG9iL2Iz
NTA2YjhiYzQ1ZWQ2ZDQwMDVlYjMyYTk5NGRmMGUzM2Q2NjEzZjEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxNzMuZHRzaSNMOTkzLTEwMDYNCg==
