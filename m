Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F9874F4E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 13:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0C10F0A2;
	Thu,  7 Mar 2024 12:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ykhYb09c";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="deQyWLtW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9F510F0A2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 12:41:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 427CaX5G031037; Thu, 7 Mar 2024 12:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=8gDExs58XGCEjmGA/flv1BnIZtXypWEDID9uv/dAte4=; b=
 ykhYb09c7iVAqFpIsJhMc4B+OCMQdE/0VWwTL6Cp+aET6ibmXBSPP+zMsDTEVnpu
 GSXQaqKuyisIv50O5DZIKVIUAHr4+nMj2U+Cbh9Lo4JzPu+pY87koFvVowQJJ+0d
 wXsafsWtqY9hpqaqmN7+hUafZBfaI5IqbPoDG5WdkCH/F2UrUlGWW0JYLYghm+Ot
 eLdCxvvr0xm2RPsg5b0hQqoDlItaCy0DrfbMyQH13hE/nfGMusTwm9aCrjl3251+
 OxDFRKmZSGxNIEdVjUjnCIlS3Ccq2EwAd+gq0ljA3S6muV7TDJLPuFcmrS5cxcTp
 prYoivZrj9MiJYhpkJsxAA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3wku8syneq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 07 Mar 2024 12:41:03 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 12:41:02 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 12:41:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoGjb9+IfHdvzH2ua9gG6o6bSyA0w291xHrX9idkm8eEJzMssVAh8n5J+YoGmbh8qBPj9rYwj5XX7prJMvLA0B09OqcEPwvLKAbauyE7GEJGg77uIcjAhxs3WOtoB+DC7y4Q4jkhHABSV8iKN+CFh/aM8BhgJ71Oqk3iyZ8PBTFAswiS+c1srff1TBEoX74hucI58hNZOUWGOV26DJO7VjeLEkCKPJ+uHJ0V0XQHe0HDK6xaHIikrI2OA51P/voweWmDDjaET733FONBAJadKW2GHNSVCzJBKGRRL0hQ7ScllCxf75nxVQES7UVD8IVofRXX3fS2m3iAO+aAg50S6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gDExs58XGCEjmGA/flv1BnIZtXypWEDID9uv/dAte4=;
 b=TZnsdQiSNnaDEUlEKOHdRek56P6s+u798XtnhM0MtDYcw9V40JIn/UOyqfNes9G7qHvi2ldjoKnzzGCU6SeuDA6lWSWND+OchOwZKe5oKno6hutyoq7cChaqvYmVSdE4jyY3S+NT+OV2Xhd2FvAZUrPjx5zcgyBSxfLDDhKg57LNmXe4PHVxq8O0czjo9Tz8Ff3n57Xa9+j2cQl4PdcFWnSHePMX9+7MFGVZCRH5Ekm6TKbZEVHU8huqMvqFGyIEcAwMIvx3gpGsaNch0TkqVZJYLmbO809+eD8IIjpliGOBOAlOQVRizG9Wc30cfolNVP/4L/a8pOcyouXlX26l2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gDExs58XGCEjmGA/flv1BnIZtXypWEDID9uv/dAte4=;
 b=deQyWLtW5eojtUrq5zyJ0hZICOFK7J40HggOTHCAZn93ob1BOnZe+V6nsZ2v4NykNi9NgYNbRF5lKXLGc34AgeSZlg5uNivr5LA2Pu00VvTsoaB4suA4PnqROfUq+QqtLE/wy8DFmKbVlcL+wxBv5bB4RXzF6pA9EOIQmP+YE4Q=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO6P265MB6332.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 12:41:00 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732%4]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 12:41:00 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "aford173@gmail.com" <aford173@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Matt Coster <Matt.Coster@imgtec.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "aford@beaconembedded.com"
 <aford@beaconembedded.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: gpu: powervr-rogue: Add PowerVR support
 for some Renesas GPUs
Thread-Topic: [PATCH 1/6] dt-bindings: gpu: powervr-rogue: Add PowerVR support
 for some Renesas GPUs
Thread-Index: AQHacIy1Bhy4cfmIokGdlMPwFUZbpw==
Date: Thu, 7 Mar 2024 12:40:59 +0000
Message-ID: <63199ea3af86986545fcec4e81fa3a38f18a160f.camel@imgtec.com>
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-2-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-2-aford173@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO6P265MB6332:EE_
x-ms-office365-filtering-correlation-id: 6a01403e-dbc7-4ceb-762f-08dc3ea3d7b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UnIxa5VUl8qiFQ4e6JKHVHyDlZh/WaMuCLgSFmt4Yr9Ewksd2Mc82gzPC0uMrJhWRdEdzTnKsO8Ko3LKYAgp0cFAMih1fnrcDpg2tHVLNb9R0uW4Pj0BHurx5xsh8XwLhM3Cbrr7qQlVdE0ueaV7hzI6hgzSr/SwFudIT8qXCVBIiah+E/8A+K5S9y4AX4wRXj+4VpUnBB23Gr0dQ8TDTQSsLJVYuMIHpmsLFgBm7/fMrO+qBdeAh977Mjbr81rk7r95+TESL9daFm+d2DXybYv9F1gDSa0Ei/UbEbK0Q5q5jQIRSEAL01w6ch+quv6R86xTDqCQI0oFcGo/zeHCUHUlGLh4GS2NkaKwRP1/+4KjdjHVItUubejiGDzxwIdk4Iq6UlHphkBpw7cz6zaysKJmYRseBwHLdOD51Z6BmuZfAC6K6XWl6jPkEYbgmPI9bsIaTUieOs3wDOBYdAIl3YD0g3dR6ZMOrXxXaKZIQ/mOJYRibqopjgE2PZA5xaxZys0T7iKUHw2AcfgGZ2SDraLaIlcXlCC/t6nINPjj80poWH28ZBg/T4Yje/m0S9+U7kBB8LCsKSTr8O8NkjOY5s9gRakROIT89ffUnJzw8EkKa+DUX2ao4Z9YeZVfYhtsn/rClX5yxPRHbXySpyUGT6EF+sLBELweqfuvDyXPNQo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDQ0SHY0eTZqZ0JZZ0FhZGMrV0RVWlFpVUljb1JvSFFaOG1QMjhNdmhMS09I?=
 =?utf-8?B?U2JkZDM4bDAwVFRhUm9DVVdjWkl0MmFEMnN4YVZac2hiRG5SWnV0VEhzQkFv?=
 =?utf-8?B?TzhQR0R2WkZ4bzlqdkU0UVVuZ1k2VExvZmdZUWxXNzU5WFRyYWhpTWRFRkVY?=
 =?utf-8?B?RitqZzFlYnQxOERhcFp2NHFPcTdyeXNwY0NZdWFTRXlSVkZWclJPTU41YnhP?=
 =?utf-8?B?ZTNSVy96RHFyS25EakRiYWFzbjB5OGQyRkNkSG1pR1R0OERyM3NXYnQ1SjJO?=
 =?utf-8?B?eEdsaG5tOEZNNXlRY2VvOFhPQXowU0RzaDNIbFduNUdadThVTHI5T3l3emNN?=
 =?utf-8?B?RHJvY3MvNWZ3eVFhRGNzWjVsVTBnRzh6b1NjVTFyNFVweFRNVXV2azNVRU10?=
 =?utf-8?B?eHRQUldRdzhHYTRZTzJGcDhzUnN5ZTJFMjNrR05hdU1TY2laS21ZVXBsRWRy?=
 =?utf-8?B?eTYvOCtQME1wN3hxUnlUUTVOckgxT01UZ0J5UUlaV003aGJ5NTdFR3lmdFlM?=
 =?utf-8?B?aXJpQmY2UHliVi94dnV4WGtZZExKQndNMC9vQUk0aDkvdUpnUy9tWWRQaUsz?=
 =?utf-8?B?MS9mbmxGbmZlM3l2Zk9WTnp6R3JGaWpTZXF5RUxSRDZQc25oM0Njb0ZJMjBZ?=
 =?utf-8?B?SWlDOXJvSTkvUjZtSmhyUW1Dem4yUXpDMTF2R0RVRmU4NnF3UjMwY1JMemtE?=
 =?utf-8?B?WnduNlZORWVINU1KeDZaVzlrVEFKSER5STZ0bmhCcTEvaGRDek5aN2t4eUlR?=
 =?utf-8?B?UXl6Vk42NXhwYWd2cXNocVRPZFAyTkllT1M3WVlZTjNnSVFZMFhqNWVtR3dY?=
 =?utf-8?B?SXcvMzkyUWJObUxxR2dHQTQxTTNHYjJvNkRLbEhtTU1HRGtRazNQNnJmOWpy?=
 =?utf-8?B?ZXVTY2NWQUk2b0xFNTJXNXAyOWU4RFdQOWZLRGFYMzZuZmlldnMzdFdyamNa?=
 =?utf-8?B?N2MzbEpaZ2NUWGRDUDA1Tkg4RjlnanpmODlHYTZPWWZLV2l2dkdwSkxERFl5?=
 =?utf-8?B?Y051VktHNlhoaktFZnVHVkV0S0Z3bklTeUdlSUxTSHFZUHVsc21BUDFuTTFB?=
 =?utf-8?B?VmZUN0NjRjducGpMT296N3Vmd25ZLytGM2ViVjZDR2lJL1kvYlRRclZGcUhB?=
 =?utf-8?B?TnhqOU9KUFYxN0pNRG1mVkNUUTQ3b2hoZW94VVFWMjNVbjF4ZFFkeVUzRWhr?=
 =?utf-8?B?Vk55amJ3L2p5aW1SQjlOL1B5M1FuWVh1NVJuaG1MOHFRUWRmMTZVWGZnM0Vo?=
 =?utf-8?B?ZWxGT1d1VXNIcEJEZUlMV2ZoYWEzdkFObFNKb2kyQklIZWdlSlN5UVIzWW11?=
 =?utf-8?B?ZHJkM0k1SGZlQm81dExMc3dIeXlZOWJXVjJrV25EczZvckdlU096dnExc3NS?=
 =?utf-8?B?QnI5VnJTM2NQcXJGTGhCVGtOck5EUXB5WVg0NHJDVG9pV0tpdEtTYmlpM3Vi?=
 =?utf-8?B?TVBEaFVZUnhsUERJRzZZb1QvQkRBN3p6UnRYVkRkQkllTndOV2VHTWVKUmMx?=
 =?utf-8?B?NWkxWFVNRVFFQnFocHpuZ2oyWllyUERCSFZnTVl2QVlGbUFGYnE4ZzBDaTBz?=
 =?utf-8?B?UU8rakNBbWtnUmVYMFIwWXltaTd2OXhNei9JU2NMbFVzbG1RY25mb3pzSGxM?=
 =?utf-8?B?RGVKT1ZoTjJ4SWYyWGk2ZXdZZ2JoQmFYYS9qcXl3UWE1K0FZUE4yWkhBYjFj?=
 =?utf-8?B?SUJsL2ZNREV1YTk2ZUt4U09JVVlKRXY0Qm1hY0swdDN0cXFMdHA3YTk5cGFm?=
 =?utf-8?B?dHdrcHJMV2UzTTF6Rm9tbGZMUzQzdWdWYzJKWWFSK2VGTzkrcEQ0Uzhqblo1?=
 =?utf-8?B?Znp6N25EZzJLeTViS2VFMXk0dU1pZkt2ZVJqeElZSTh4blRVYkZ5QlhQK09D?=
 =?utf-8?B?MFpXekx0SDBuR2ZhVjFLYU1WWHg5aGszQS84V21sa0wzOFNpVHhqQ3lFRmlG?=
 =?utf-8?B?VTJtOUE4eis5cWF5ZU9LRXpnT2ZLMkJiS1doUGVhaEtOb3VSRFVjT3JyVGQr?=
 =?utf-8?B?cFF5T3JXV3d4VFdKM0l4S1hEQWFmaHFPVU5sYVJEVHhDTjE3WG1RN2swQ3FX?=
 =?utf-8?B?WTQ3RHU2cDJOWDBZV2Q2bDRJbXEzZzhhaGtUYStEZVRCMlE0ZGt1K28rZWVn?=
 =?utf-8?B?K1lNQk5RSUZxM3VtTVZ2dWN0R21sRHNzWnlHcXNqcWIvKzNBL2VaeXA5NVlG?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B33F0BC7C925B940A79203908A24EF35@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a01403e-dbc7-4ceb-762f-08dc3ea3d7b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 12:40:59.9578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4y3ALSTs0AYrde8CKEZfPBUgw+eMTGWHjS+t7M1QHVbJn4hUsKltGhNNUkhu1EPh/ixYRcB6VznWPIPs3pLAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6332
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: VYv9s0DYP8_nSgm-ulRLVSFeMOwcOynQ
X-Proofpoint-ORIG-GUID: VYv9s0DYP8_nSgm-ulRLVSFeMOwcOynQ
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

SGkgQWRhbSwNCg0KT24gTW9uLCAyMDI0LTAyLTI2IGF0IDIxOjQ1IC0wNjAwLCBBZGFtIEZvcmQg
d3JvdGU6DQo+IFVwZGF0ZSB0aGUgYmluZGluZyB0byBhZGQgc3VwcG9ydCBmb3IgdmFyaW91cyBS
ZW5lc2FzIFNvQydzIHdpdGggUG93ZXJWUg0KPiBSb2d1ZSBHWDYyNTAgYW5kIEdYNjY1MCBHUFVz
LiAgVGhlc2UgZGV2aWNlcyBvbmx5IG5lZWQgb25lIGNsb2NrLCBzbyB1cGRhdGUNCj4gdGhlIHRh
YmxlIHRvIGluZGljYXRlIHN1Y2ggbGlrZSB3aGF0IHdhcyBkb25lIGZvciB0aGUgdGksYW02Mi1n
cHUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4N
Cj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1
L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwNCj4gaW5kZXggMjU2ZTI1MmY4MDg3Li43Yzc1
MTA0ZGYwOWYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwNCj4gQEAgLTE0LDYgKzE0
LDExIEBAIHByb3BlcnRpZXM6DQo+ICAgIGNvbXBhdGlibGU6DQo+ICAgICAgaXRlbXM6DQo+ICAg
ICAgICAtIGVudW06DQo+ICsgICAgICAgICAgLSByZW5lc2FzLHI4YTc3NGExLWdwdQ0KPiArICAg
ICAgICAgIC0gcmVuZXNhcyxyOGE3NzRlMS1ncHUNCj4gKyAgICAgICAgICAtIHJlbmVzYXMscjhh
Nzc5NTEtZ3B1DQo+ICsgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OTYwLWdwdQ0KPiArICAgICAg
ICAgIC0gcmVuZXNhcyxyOGE3Nzk2MS1ncHUNCj4gICAgICAgICAgICAtIHRpLGFtNjItZ3B1DQo+
ICAgICAgICAtIGNvbnN0OiBpbWcsaW1nLWF4ZSAjIElNRyBBWEUgR1BVIG1vZGVsL3JldmlzaW9u
IGlzIGZ1bGx5IGRpc2NvdmVyYWJsZQ0KDQpBIG5ldyBzZXQgb2YgaXRlbXMgc2hvdWxkIGJlIGFk
ZGVkIGZvciAnaW1nLHBvd2VydnItc2VyaWVzNnh0JyBhbmQgdGhlIFJlbmVzYXMNCm1vZGVscyBh
bG9uZyB0aGUgbGluZXMgb2YgWzFdLg0KDQpUaGFua3MNCkZyYW5rDQoNClsxXSANCmh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9pbWFnaW5hdGlvbi9saW51eC8tL2Jsb2IvcG93ZXJ2ci1u
ZXh0L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnIueWFt
bD9yZWZfdHlwZT1oZWFkcyNMMTYtMTkNCg0KPiAgDQo+IEBAIC01MSw3ICs1NiwxMyBAQCBhbGxP
ZjoNCj4gICAgICAgIHByb3BlcnRpZXM6DQo+ICAgICAgICAgIGNvbXBhdGlibGU6DQo+ICAgICAg
ICAgICAgY29udGFpbnM6DQo+IC0gICAgICAgICAgICBjb25zdDogdGksYW02Mi1ncHUNCj4gKyAg
ICAgICAgICAgIGVudW06DQo+ICsgICAgICAgICAgICAgIC0gdGksYW02Mi1ncHUNCj4gKyAgICAg
ICAgICAgICAgLSByZW5lc2FzLHI4YTc3NGExLWdwdQ0KPiArICAgICAgICAgICAgICAtIHJlbmVz
YXMscjhhNzc0ZTEtZ3B1DQo+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk1MS1ncHUN
Cj4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OTYwLWdwdQ0KPiArICAgICAgICAgICAg
ICAtIHJlbmVzYXMscjhhNzc5NjEtZ3B1DQo+ICAgICAgdGhlbjoNCj4gICAgICAgIHByb3BlcnRp
ZXM6DQo+ICAgICAgICAgIGNsb2NrczoNCg==
