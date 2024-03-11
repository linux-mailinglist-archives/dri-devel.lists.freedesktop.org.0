Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1762877C33
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 10:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC8911289D;
	Mon, 11 Mar 2024 09:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="JlPvc4rY";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="UNsxAL/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAE1112808
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 09:03:29 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42B8SFu9022336; Mon, 11 Mar 2024 09:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=NhcuuE8gfl1o8jY2MpOhmxHiOmQZ8uxPM2oAjG+Eq38=; b=
 JlPvc4rYKBgy5XzDTEefIBBZ2M0OVwfmn8EzZ24iKznHpaEP+gy2/r9QRMl70yi9
 iQMGYGwy8wzm3EtO3afH37xorm+K8r2P1ga0Nvj2pYlknmxZlFfVHK44geO8U6uI
 nUoevOG1p+MoRfiTNtVNPWLWBjHvsuvw/PgJhf+114PhUrZCQo2fWj4zYU5Fy6IB
 vBMqXRVmpSB8XVVudn6e6YC1nKUgVrqguslcuuKSnopfWqYwdQ5t+JDBM0Y8Xnhr
 UJB7Un0QMNgJJHElj5nbM0Vj0UNAR86HMc3W4e6vKyvQA+P4KipVOQw7xP5Iadb1
 GK7q/VBTGVUz4Fk8miG2zA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wrgqwue0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 11 Mar 2024 09:03:06 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:03:05 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 11 Mar 2024 09:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SehLLkO63kLyA45l0qAJneMAaYZHHCCyNQXrtKgkrFLhzSVtMjaBo8yOqESZc1tzxd4rPqtFJNGPcdw95EtpcQtJ1ImKKwgVD4c38AtcPpM9TBKCFHTGqQ4tCT3SXLbMzPGCxdxJbenQg8R2fpyMpKG90FRWr8xEXM8QQ6HjNr+HxN9i+4Lk3YWslOz3vkdqys4Sq990JgZF/P2Wh7uOSmDMIgs4dYJRlWBsrKzN5hvq16xj0bs/qtL4r5OHO5sxUxLyGtMzLCw0wDDMs0YkonpBbtjLrdzmEDqPpgPrcgnyXu4QnjjRk+RkYb8lhjo7ald4XI08KtBgduDgEc3gmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhcuuE8gfl1o8jY2MpOhmxHiOmQZ8uxPM2oAjG+Eq38=;
 b=EHMPGuCx4YvOyvKZai3wFb2Wi9U4w3Jf9U71QrMb3IFLQjKfGdDzO33Tt+HYREzyC+hEd2mO3Oar0aS6siqDz8GGFmUUzU80A/4SSwM8ncY+RDxqUKZgBPCxO3G4U1Ef3nkt7OkywcXpf187oNt7FjbWZ026GX1+wPyx1EDMH1POVPUbimrvX3EoEH1aPlQSMHsvBIHUGgIhfRqFrmpRS/9cQnukB7Sf1poAT8YkLokcQvXdxcs42SgA03rE6+oahy8iPIWq6kioHjEPkXz+km5Z+SF16GrI7bxGCQ4/2R1VcC3RUqtcCLOaPwG1DbYgmpSccLHNcM6OdG96Eo6bKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhcuuE8gfl1o8jY2MpOhmxHiOmQZ8uxPM2oAjG+Eq38=;
 b=UNsxAL/VycHCrfBCtBF8OsUxr6zdnjzojZUs7iBFLvq8oxjWipuNxrvlb90gwbdpgan281R75isLBRGSxE5r/w0K6SkIanYPGf6qD1JRnWXRyAkL3Z4GZ6POzEdNEv20Zgwu2VBkMKfyDlfUwh5UHkwyC1XxvHh5UBySHZHXsuw=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB2565.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:88::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 09:03:03 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732%4]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 09:03:03 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "aford173@gmail.com" <aford173@gmail.com>
CC: "aford@beaconembedded.com" <aford@beaconembedded.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "mripard@kernel.org" <mripard@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Matt Coster <Matt.Coster@imgtec.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Topic: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
Thread-Index: AQHac5Ls/GmWpLWg/UOXi9Pa8M97UQ==
Date: Mon, 11 Mar 2024 09:03:03 +0000
Message-ID: <f0167fb0afb354f3af33a636548b6bbc59d9e3c7.camel@imgtec.com>
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
 <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
 <CAHCN7xJnKNdsrs+UMvPqdkN+j8v+8UaoH=zargcKRi7dw0GLNA@mail.gmail.com>
 <d959159dac0effce1a80986bc87e18ffd24773b9.camel@imgtec.com>
 <f5eb761e9ec30927657ed02a55e3b91abede90fe.camel@imgtec.com>
 <CAHCN7xKLbAbdm490+Sk_mZP_WQWtMM8Qmg7WBmdZ3JqpcTPfcg@mail.gmail.com>
In-Reply-To: <CAHCN7xKLbAbdm490+Sk_mZP_WQWtMM8Qmg7WBmdZ3JqpcTPfcg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB2565:EE_
x-ms-office365-filtering-correlation-id: 1233470a-3995-4386-214b-08dc41aa0f42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nWKx0umbycbtVWVGwrpwP6QO5405L5s9acl7PIyKuDbrISfQ+zzPyWKnoFEypyuTsQPhdJBVE70TyY/TA28mGPtFBSrPNmkmJ+EWcv1Hgmq+as2PEW8o6CsjQBw/VajJbauP9Bk+uXN31/OVukiDMMYhBfFA5TdmGw2T1hxBOmFY9TbTZdd66/Ti7ZkNYWrzIUKF1pCIRxgTzUIJa/aexQnv50s1dmvcukbsrzmcL5uE5Dyu/CYDtcY9zSyFmEYCpz0EL16h6xfUpfRr5kUDjsvnH61QMWUXV9dC47pLeNR1+Ha1SALmdy/D13yHvdGj6cuM6QyUN6GCBLHS0n9DdvRzAeD0PKBZoKtXLYEyEE9iappGNMNb/gSL6XfBlwlJE6rg5tz0Qok6jeLpVpOZb7iXGu7utbHHFsUZPPEa9amvRbiy9N46j9qKZJDBI0toTUHM8lSE2+9j7XiOravqwSkWLVI1W0Uv/B8uadP+uZr7FEU+0W5l+pxpDQlQU5l9lNRxudgAs2zvgmVdojXTqkcgkv3T/plGB6eczMlf4xMqYDSVJrYioS/NQ0w3EA3YKvSb/OS/uyaYfjNs1fqIc8DW56CuKh/puhURhXuYsTnTUKXAOitqWv7nJqBdoRxhPX+rjoL73cBnqIAImPMRihlUlTzbGlnN2H2I8I/xUHc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0RkSE53NkROTkdJc3FnY2NkUi9GREtWRzY0ZjdCK2wxYXpNM3R5L2NaWCtZ?=
 =?utf-8?B?eFJ6V0xrWHJQSjVucHdvR1lmektYL1I0bVRzZ3hDZkNreFJKdE15SHpEdXlC?=
 =?utf-8?B?bzZ2dTMrV2ZzU3AvNXIzYWd3aU1BM3dTR1NjKzgzZ0UzejFaV3ZjbVhySCtH?=
 =?utf-8?B?TWJNRUNXOUtWdzAvaHZLVmpDdnRIOVBtcERGK3dvTWFqR1ZGM1VvUU9CUWdU?=
 =?utf-8?B?M0JnRVlaRVg0L3ZnSnZlNnh0bGMyTEs1K0ZXbEZPVGRueDcrd0VQak55Tlcz?=
 =?utf-8?B?WHlMSEw1RHJtZ05nSzFTc2JYRzkyTHNBSjFEMkRIZ1JRcjdlYWNEY2NUdFJU?=
 =?utf-8?B?MnFMU0hmc2VKMkw1cWhwUDgrYnIxcGp2aXRBSk5GelREOWxNT09iU2doRFNj?=
 =?utf-8?B?WUUwNURoVkJnYXdqV2MzVjlGTXZraHk4bXRQSHhpcWJEVE1UQ09XL0NBaVRC?=
 =?utf-8?B?bktLOS9kMXBIWjIrZXFtTEcxUDlSdTJsSUtRSzNoVE5Od3c4aG5pVFRZc29T?=
 =?utf-8?B?T1BENG4vTWNvNEVpU2NZVWtGQzdwUTFxS29ySkd1aUp6NDhYc0pNRmxCZTZj?=
 =?utf-8?B?T0pNNkRhRk56NTN2TWJJSHNITmZ5MWVIY01mMFh1VmJMWmxqakFlU2o0K2JK?=
 =?utf-8?B?TVU0b0x2dWY2bWhENUUxQ3krQlkwcVc1TWdnK1ZMR1pITGhWTmhQYnR4clNU?=
 =?utf-8?B?UUIrL3VBMjZsRERka2Y2VmVSYWNzWFZvc1ZXRWp3K1VYemF0R2p2NFp5L0I4?=
 =?utf-8?B?QWx4dkRNRWtHSXFCNnZVRmhBa0h0WUYySHJJdXFYK1BEOTlPL2Jub1pGcitP?=
 =?utf-8?B?YmlvQnVBTmZvOEZUTk1OUnR3c1JFZFVWWW5lam5TcXN4bnBtOUlxdGJZMk53?=
 =?utf-8?B?OXY0ZHY3eTduM0FrVzZEdFo0dGZFclk1V1o4U1ZqMC9Wb2hLL25mM29iR3Bi?=
 =?utf-8?B?TjUwNld0NmppWjdsS25uNlRyelV6djBJbFV6V2RFM1A4bU1KcU5lV2llNEln?=
 =?utf-8?B?L1dyU3BXNTNRT0pnR1pCbnZoc3lWbjk3dFRCRXdRT1lqZGt0akdoMHYrUlRr?=
 =?utf-8?B?UTJmTHJGckx3ZE9MbXFhV3VUK2Y2akJtT2pZakZweW5lVWpwcERlYURkS0tZ?=
 =?utf-8?B?ZVIwNk8vL2Vuby9VbStKTjUvL2MvcWRaWmpTMU5PMGV1RWhpZDJsazJETkxl?=
 =?utf-8?B?ZDJRZm9MV1I0cG43dlN6c1pWTG5HckFRZGhqTitJVXFsSnFURWtNdWhHR0Jv?=
 =?utf-8?B?K1d4UGxtTzRveFc5N095bGhEQ2w4cnhON3c5bkwyeUtHSDZka3VHd0dtRVlk?=
 =?utf-8?B?UWJXeWJwL2M1ZG9DcGNsSStLMldMRlVaNlNnay9VY2J3YTl6Z0tXcUF4NUJP?=
 =?utf-8?B?ZlV1ZUxNWm9yV241a2ZJYmxVK0hZVWprZzgzMjNOb1BFWmUzajNsREpubE1B?=
 =?utf-8?B?TUNpYys2NloyTUY3MjBtb3lGVE0weEhHOUk2RGp4MmtVemNvbTRrOUtUMFFi?=
 =?utf-8?B?SC9QM25uOXlTWWg5dVIrUXBkWE85cnJWdzJFUlpuUnFhYTZTeGxaWjZ3amE1?=
 =?utf-8?B?L1YxM1hNTkxya1VXTWx4S0NUdHpHYnI5dlFPNUk4NVM3eW95ZDBTRUp4cDVx?=
 =?utf-8?B?V2pnM291N2dNR1NDYWZSRDJFZnVMVW54K0VqMExHU1AxYUUwb1c3SWU5OURU?=
 =?utf-8?B?OXhYdkFLNGdNc2gzMHcxZGFFUGxuVjJHOWRTa24ra2RDTUtLY3ZUQzJiV3lr?=
 =?utf-8?B?aW1PZ1dnMmxLQi9UZFVpWEVsMzFnaVliUEZZekRaS1RkM29sQjZqZ2dGZVJl?=
 =?utf-8?B?TGh5VTJWMzNkbGEySDllK0xUMUpwSjRKcTlkdFE4YUJjb2pqUHQ4MVhDVnBm?=
 =?utf-8?B?N0Q4enFvWVZyQng3cWx3Q1hacVlic0tZOUFnTkJBVDFOUWR4TTYydi9NeEhN?=
 =?utf-8?B?QVdvNmxaVzVudFV6cnJXeXJUMzJJSjI2WmlaczA0blUydzl4R01sMnF4MlNs?=
 =?utf-8?B?TVcxVVhvcktWQW4xcW11UlowR2g1ZXFxOXBZWThHSzAxNTFFRXF4QlpGZGln?=
 =?utf-8?B?bi82cCs1a1hVQ3NjbkxDL3g1bzY0MVJma3VzM01GbG5WWE1MakVDa21aUWZa?=
 =?utf-8?B?OWxiaXlWdUFNd1FNRlRTZ2g3dTFpc1dUSlJzMEtYYkdLNGZpVGl6WVFFUHJT?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <078BA2A1B215454BA0775ED5117F2679@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1233470a-3995-4386-214b-08dc41aa0f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 09:03:03.5642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMpOa9q1vGr7HR1GTKVaTnZP+kT3LvVl2zsiNaTQHa0GDVZKSnrgsDYccxk802rEB4qCMacjUx7YskgPlFoG2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2565
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: L7RVztJCiOoTgG-mMZI4lvcqge1wyKI8
X-Proofpoint-GUID: L7RVztJCiOoTgG-mMZI4lvcqge1wyKI8
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

T24gVGh1LCAyMDI0LTAzLTA3IGF0IDA3OjMxIC0wNjAwLCBBZGFtIEZvcmQgd3JvdGU6DQo+IE9u
IFRodSwgTWFyIDcsIDIwMjQgYXQgNjozN+KAr0FNIEZyYW5rIEJpbm5zIDxGcmFuay5CaW5uc0Bp
bWd0ZWMuY29tPiB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjQtMDMtMDcgYXQgMTI6MjYgKzAwMDAs
IEZyYW5rIEJpbm5zIHdyb3RlOg0KPiA+ID4gT24gVHVlLCAyMDI0LTAyLTI3IGF0IDA1OjUwIC0w
NjAwLCBBZGFtIEZvcmQgd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDM6
MzHigK9BTSBNYXR0IENvc3RlciA8TWF0dC5Db3N0ZXJAaW1ndGVjLmNvbT4gd3JvdGU6DQo+ID4g
PiA+ID4gSGkgQWRhbSwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGFua3MgZm9yIHRoZXNlIHBh
dGNoZXMhIEknbGwganVzdCByZXBseSB0byB0aGlzIG9uZSBwYXRjaCwgYnV0IG15DQo+ID4gPiA+
ID4gY29tbWVudHMgYXBwbHkgdG8gdGhlbSBhbGwuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT24g
MjcvMDIvMjAyNCAwMzo0NSwgQWRhbSBGb3JkIHdyb3RlOg0KPiA+ID4gPiA+ID4gVGhlIEdQVSBv
biB0aGUgUlovRzJNIGlzIGEgUm9ndWUgR1g2MjUwIHdoaWNoIHVzZXMgZmlybXdhcmUNCj4gPiA+
ID4gPiA+IHJvZ3VlXzQuNDUuMi41OF92MS5mdyBhdmFpbGFibGUgZnJvbSBJbWFnaW5hdGlvbi4N
Cj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gV2hlbiBlbnVtZXJhdGVkLCBpdCBhcHBlYXJzIGFz
Og0KPiA+ID4gPiA+ID4gICBwb3dlcnZyIGZkMDAwMDAwLmdwdTogW2RybV0gbG9hZGVkIGZpcm13
YXJlIHBvd2VydnIvcm9ndWVfNC40NS4yLjU4X3YxLmZ3DQo+ID4gPiA+ID4gPiAgIHBvd2VydnIg
ZmQwMDAwMDAuZ3B1OiBbZHJtXSBGVyB2ZXJzaW9uIHYxLjAgKGJ1aWxkIDY1MTMzMzYgT1MpDQo+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhlc2UgbWVzc2FnZXMgYXJlIHByaW50ZWQgYWZ0ZXIgdmVy
aWZ5aW5nIHRoZSBmaXJtd2FyZSBibG9i4oCZcyBoZWFkZXJzLA0KPiA+ID4gPiA+ICpiZWZvcmUq
IGF0dGVtcHRpbmcgdG8gdXBsb2FkIGl0IHRvIHRoZSBkZXZpY2UuIEp1c3QgYmVjYXVzZSB0aGV5
IGFwcGVhcg0KPiA+ID4gPiA+IGluIGRtZXNnIGRvZXMgKm5vdCogaW1wbHkgdGhlIGRldmljZSBp
cyBmdW5jdGlvbmFsIGJleW9uZCB0aGUgaGFuZGZ1bCBvZg0KPiA+ID4gPiA+IHJlZ2lzdGVyIHJl
YWRzIGluIHB2cl9sb2FkX2dwdV9pZCgpLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpbmNlIE1l
c2EgZG9lcyBub3QgeWV0IGhhdmUgc3VwcG9ydCBmb3IgdGhpcyBHUFUsIHRoZXJl4oCZcyBub3Qg
YSBsb3QNCj4gPiA+ID4gPiB0aGF0IGNhbiBiZSBkb25lIHRvIGFjdHVhbGx5IHRlc3QgdGhlc2Ug
YmluZGluZ3MuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gV2hlbiB3ZSBhZGRlZCB1cHN0cmVhbSBz
dXBwb3J0IGZvciB0aGUgZmlyc3QgR1BVICh0aGUgQVhFIGNvcmUgaW4gVEnigJlzDQo+ID4gPiA+
ID4gQU02MiksIHdlIG9wdGVkIHRvIHdhaXQgdW50aWwgdXNlcnNwYWNlIHdhcyBzdWZmaWNpZW50
bHkgcHJvZ3Jlc3NlZCB0bw0KPiA+ID4gPiA+IHRoZSBwb2ludCBpdCBjb3VsZCBiZSB1c2VkIGZv
ciB0ZXN0aW5nLiBUaGlzIHRob3VnaHQgcHJvY2VzcyBzdGlsbA0KPiA+ID4gPiA+IGFwcGxpZXMg
d2hlbiBhZGRpbmcgbmV3IEdQVXMuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT3VyIG1haW4gY29u
Y2VybiBpcyB0aGF0IGFkZGluZyBiaW5kaW5ncyBmb3IgR1BVcyBpbXBsaWVzIGEgbGV2ZWwgb2YN
Cj4gPiA+ID4gPiBzdXBwb3J0IHRoYXQgY2Fubm90IGJlIHRlc3RlZC4gVGhhdCBpbiB0dXJuIG1h
eSBtYWtlIGl0IGNoYWxsZW5naW5nIHRvDQo+ID4gPiA+ID4ganVzdGlmeSBVQVBJIGNoYW5nZXMg
aWYvd2hlbiB0aGV54oCZcmUgbmVlZGVkIHRvIGFjdHVhbGx5IG1ha2UgdGhlc2UgR1BVcw0KPiA+
ID4gPiA+IGZ1bmN0aW9uYWwuDQo+ID4gPiA+IA0KPiA+ID4gPiBJIHdyb25nbHkgYXNzdW1lZCB0
aGF0IHdoZW4gdGhlIGZpcm13YXJlIHdhcyByZWFkeSwgdGhlcmUgd2FzIHNvbWUNCj4gPiA+ID4g
cHJlbGltaW5hcnkgZnVuY3Rpb25hbGl0eSwgYnV0IGl0IHNvdW5kcyBsaWtlIHdlIG5lZWQgdG8g
d29yayBmb3INCj4gPiA+ID4gU2VyaWVzNlhUIHN1cHBvcnQgdG8gYmUgYWRkZWQgdG8gdGhlIGRy
aXZlci4gIEkgb25seSB1c2VkIHRoZSBBWEUNCj4gPiA+ID4gY29tcGF0aWJsZSBzaW5jZSBpdCBh
cHBlYXJlZCB0byB0aGUgYmUgdGhlIG9ubHkgb25lIGFuZCB0aGUgZXhpc3RpbmcNCj4gPiA+ID4g
YmluZGluZyBkb2N1bWVudCBzdGF0ZWQgIm1vZGVsL3JldmlzaW9uIGlzIGZ1bGx5IGRpc2NvdmVy
YWJsZSIgd2hpY2ggSQ0KPiA+ID4gPiBpbnRlcnByZXRlZCB0byBtZWFuIHRoYXQgdGhlIEFYRSBj
b21wYXRpYmxlIHdhcyBzdWZmaWNpZW50Lg0KPiA+ID4gDQo+ID4gPiBUaGUgY29tbWVudCBpcyBy
ZWxhdGVkIHRvIHRoZXJlIGJlaW5nIGEgZmV3IG1vZGVscy9yZXZpc2lvbnMgb2YgQVhFIFsxXVsy
XVszXSwNCj4gPiA+IHdoaWNoIHdlIGNhbiBkaXN0aW5ndWlzaCBiZXR3ZWVuIGJ5IHJlYWRpbmcg
YSByZWdpc3Rlci4NCj4gPiA+IA0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3Jk
IDxhZm9yZDE3M0BnbWFpbC5jb20+DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+ID4gPiA+ID4gPiBpbmRleCBhOGE0
NGZlNWU4M2IuLjg5MjNkOTYyNGIzOSAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNpDQo+ID4gPiA+ID4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaQ0KPiA+ID4gPiA+ID4gQEAgLTIz
NTIsNiArMjM1MiwxNiBAQCBnaWM6IGludGVycnVwdC1jb250cm9sbGVyQGYxMDEwMDAwIHsNCj4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyA0MDg+Ow0KPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICB9Ow0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgIGdwdTogZ3B1QGZkMDAwMDAwIHsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0YTEtZ3B1IiwgImltZyxpbWctYXhl
IjsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGUgR1g2MjUwIGlzICpub3QqIGFuIEFYRSBjb3Jl
IC0gaXQgc2hvdWxkbuKAmXQgYmUgbGlzdGVkIGFzIGNvbXBhdGlibGUNCj4gPiA+ID4gPiB3aXRo
IG9uZS4gRm9yIHByaW9yIGFydCwgc2VlIFsxXSB3aGVyZSB3ZSBhZGRlZCBzdXBwb3J0IGZvciB0
aGUgTVQ4MTczDQo+ID4gPiA+ID4gZm91bmQgaW4gRWxtIENocm9tZWJvb2tzIFIxMyAoYWxzbyBh
IFNlcmllczZYVCBHUFUpLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwwIDB4ZmQwMDAwMDAgMCAweDIwMDAwPjsNCj4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDExMj47DQo+ID4gPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSI7DQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gU2VyaWVzNlhUIGNvcmVzIGhhdmUgdGhyZWUgY2xvY2tzIChzZWUgWzFdIGFn
YWluKS4gSSBkb27igJl0IGhhdmUgYQ0KPiA+ID4gPiA+IFJlbmVzYXMgVFJNIHRvIGhhbmQg4oCT
IGRvIHlvdSBrbm93IGlmIHRoZWlyIGRvY3MgZ28gaW50byBkZXRhaWwgb24gdGhlDQo+ID4gPiA+
ID4gR1BVIGludGVncmF0aW9uPw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxMTkgSVJRX1RZUEVfTEVWRUxfSElHSD47
DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lz
YyBSOEE3NzRBMV9QRF8zREdfQj47DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
cmVzZXRzID0gPCZjcGcgMTEyPjsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgfTsNCj4gPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgcGNpZWMwOiBwY2llQGZlMDAwMDAw
IHsNCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVz
YXMscGNpZS1yOGE3NzRhMSIsDQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJyZW5lc2FzLHBjaWUtcmNhci1nZW4zIjsNCj4gPiA+ID4gPiANCj4gPiA+ID4g
PiBBcyB5b3UgcHJvYmFibHkgZXhwZWN0IGJ5IHRoaXMgcG9pbnQsIEkgaGF2ZSB0byBuYWNrIHRo
aXMgc2VyaWVzIGZvcg0KPiA+ID4gPiA+IG5vdy4gSSBhcHByZWNpYXRlIHlvdXIgZWZmb3J0IGhl
cmUgYW5kIEnigJlsbCBiZSBoYXBweSB0byBoZWxwIHlvdSBsYW5kDQo+ID4gPiA+IA0KPiA+ID4g
PiBJIGdldCB0aGF0LiAgSSB3YXNuJ3Qgc3VyZSBpZiBJIHNob3VsZCBoYXZlIGV2ZW4gcHVzaGVk
IHRoaXMsIGJ1dCBJDQo+ID4gPiA+IHdhbnRlZCB0byBnZXQgYSBsaXR0bGUgdHJhY3Rpb24sIGJl
Y2F1c2UgSSBrbm93IHRoZXJlIGFyZSBwZW9wbGUgbGlrZQ0KPiA+ID4gPiBteXNlbGYgd2hvIHdh
bnQgdG8gdXNlIHRoZSAzRCBpbiB0aGUgUmVuZXNhcyBib2FyZHMsIGJ1dCBkb24ndCB3YW50IHRv
DQo+ID4gPiA+IHVzZSB0aGUgY2xvc2VkLXNvdXJjZSBibG9icyB0aWVkIHRvIEVVTEEgYW5kIE5E
QSBkb2N1bWVudHMuDQo+ID4gPiA+IA0KPiA+ID4gPiA+IHRoZXNlIG9uY2UgTWVzYSBnYWlucyBz
b21lIGZvcm0gb2YgdXNhYmxlIHN1cHBvcnQgdG8gYWxsb3cgdGVzdGluZy4NCj4gPiA+ID4gDQo+
ID4gPiA+IElzIHRoZXJlIGEgd2F5IGZvciB5b3VyIGdyb3VwIHRvIGFkZCBtZSB0byB0aGUgQ0Mg
bGlzdCB3aGVuIGZ1dHVyZQ0KPiA+ID4gPiB1cGRhdGVzIGFyZSBzdWJtaXR0ZWQ/ICBJJ2QgbGlr
ZSB0byBmb2xsb3cgdGhpcyBhbmQgcmVzdWJtaXQgd2hlbiBpdCdzDQo+ID4gPiA+IHJlYWR5Lg0K
PiA+ID4gDQo+ID4gPiBTdXJlLCB3ZSdsbCBrZWVwIHlvdSB1cGRhdGVkIGFzIHRoaW5ncyBwcm9n
cmVzcy4NCj4gPiA+IA0KPiA+IA0KPiA+IE9oLCBJIGZvcmdvdCB0byBhZGQsIGluIHRoZSBtZWFu
dGltZSwgd291bGQgeW91IGZpbmQgaXQgdXNlZnVsIGZvciB1cyB0byBjcmVhdGUNCj4gPiBhIFNl
cmllczZYVCBicmFuY2ggb24gR2l0TGFiIHdoZXJlIHdlIGNhbiBpbmNsdWRlIHRoZXNlIHBhdGNo
ZXM/IFdlIGNhbiBjcmVhdGUgYQ0KPiA+IGNvcnJlc3BvbmRpbmcgTWVzYSBicmFuY2ggdGhhdCB3
ZSdsbCB1cGRhdGUgYXMgd2UgcHJvZ3Jlc3Mgc3VwcG9ydCBmb3IgR1g2MjUwLg0KPiA+IFRoaXMg
c2hvdWxkIG1ha2UgaXQgZWFzaWVyIGZvciB5b3UgKGFuZCBvdGhlcnMpIHRvIHRlc3QgYW5kIGhv
cGVmdWxseSBtYWtlIGl0DQo+ID4gZWFzaWVyIGZvciBvdGhlcnMgdG8gY29udHJpYnV0ZSB3aGls
ZSB3ZSB3b3JrIHRvIGdldCBzdXBwb3J0IGludG8gYSBnb29kIHN0YXRlLg0KPiANCj4gVGhhdCB3
b3JrcyBmb3IgbWUuICBEbyB5b3Ugd2FudCBtZSB0byBtYWtlIGFueSBjaGFuZ2VzIHRvIHRoZSBz
ZXJpZXM/DQo+IEkga25vdyB0aGVyZSB3YXMgc29tZSBkaXNjdXNzaW9uIGFib3V0IHRoZSBudW1i
ZXIgb2YgY2xvY2tzIGZvciB0aGUNCj4gUmVuZXNhcyB2YXJpYW50cy4NCg0KSSdkIHNheSBsZWF2
ZSBpdCBhcyBpcyBmb3Igbm93LiBXZSdsbCBhZGQgYSBjbGVhbmVkIHVwIHZlcnNpb24gb2Ygb3Vy
IERUDQpiaW5kaW5ncyBwYXRjaCBhZGRpbmcgJ2ltZyxwb3dlcnZyLXNlcmllczZ4dCcgdG8gdGhl
IGJyYW5jaC4gWW91IGNhbiB0aGVuIHJlYmFzZQ0KeW91ciBzZXJpZXMgb24gdG9wIG9mIHRoYXQg
YW5kIHNlbmQgb3V0IGEgR2l0TGFiIG1lcmdlIHJlcXVlc3QgZm9yIGluY2x1c2lvbiBpbg0KdGhl
IGJyYW5jaC4gRG9lcyB0aGF0IHNvdW5kIG9rYXk/DQoNCkknbGwgbGV0IHlvdSBrbm93IG9uY2Ug
d2UndmUgY3JlYXRlZCB0aGUga2VybmVsIGFuZCBNZXNhIGJyYW5jaGVzLg0KDQpUaGFua3MNCkZy
YW5rDQoNCj4gDQo+IGFkYW0NCj4gPiA+IFRoYW5rcw0KPiA+ID4gRnJhbmsNCj4gPiA+IA0KPiA+
ID4gWzFdIGh0dHBzOi8vd3d3LmltYWdpbmF0aW9udGVjaC5jb20vcHJvZHVjdC9pbWctYXhlLTEt
MTZtLw0KPiA+ID4gWzJdIGh0dHBzOi8vd3d3LmltYWdpbmF0aW9udGVjaC5jb20vcHJvZHVjdC9p
bWctYXhlLTEtMTYvDQo+ID4gPiBbM10gaHR0cHM6Ly93d3cuaW1hZ2luYXRpb250ZWNoLmNvbS9w
cm9kdWN0L2ltZy1heGUtMi0xNi8NCj4gPiA+IA0KPiA+ID4gPiA+IENoZWVycywNCj4gPiA+ID4g
PiBNYXR0DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gWzFdOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvaW1hZ2luYXRpb24vbGludXgvLS9ibG9iL2IzNTA2YjhiYzQ1ZWQ2ZDQwMDVlYjMy
YTk5NGRmMGUzM2Q2NjEzZjEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRz
aSNMOTkzLTEwMDYNCg==
