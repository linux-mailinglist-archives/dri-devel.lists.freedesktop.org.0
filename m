Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10356871E60
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B512B10E1AF;
	Tue,  5 Mar 2024 11:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="L3TIXAf3";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="MTVoOMou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCFC10E160
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:58:37 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4258943F007862; Tue, 5 Mar 2024 11:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=Hmgl7eS1/9CmX7/4c3Im8fsAlB7wbgcXnDN6gRgnNAU=; b=
 L3TIXAf3mE3vZci1nHuZr2SalCSnz88PMMq6Iq6OwKJfygK57p/OmYZ+P/aixa73
 cU0Ivwwe9PAgUV/58V5y1gUM4m/TqkZX1VYWying5In4F4eqxWMkSmHT9FDjcJdx
 PoQjXqfjNMV3ojiKYc/PA6jMGRLVe9CewRInrIPHyl3JdZHctOoAoq3CadsUHJ9m
 fWlIY8CwiYPj/y5uXq8UFKuiKsTYI01jdpweQ3AvAxncmAllnOFVAP76uPkdtJHW
 py2aYjkRhF5ycpndhN/9FgDyLjqfFCaNTFv4oV9F/ZzMFsY/bCONZG0EZKU78RyJ
 nW0tMsYPnoRDHDgFdYUrvw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3wkw2wmnj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 05 Mar 2024 11:58:21 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 11:58:20 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 5 Mar 2024 11:58:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNWlmT6Q5uMLhzkofD7tvX9Qlk427DvqTxGG1lDE3szFvsQgOJ5g5MZKUqLiP69adQh7KU1xLqu/7j57bG4Gimg3gViYlB/yMsgml6QpEtxgZkNn1YhtxlNyW9RgRtDUVk1L6M4B/podeyNleZet9qGf9BudoOnW8bo6DtcaUurkz6NJzAQSoO8fD40wLH0B+Ij+g0iaZAi9i5yZsbiU9A4+M/kNDPqcsyV1klEizKW1JL/dUmhVX5dz3/0eZhCUmMCFG7YCSY/hAGeEvwVaQUfOKjXoPoBN6za2c6b/u08JDQO3EnH/ONpx5Zi83y7tDEInG0XslJ99qNboQLfiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hmgl7eS1/9CmX7/4c3Im8fsAlB7wbgcXnDN6gRgnNAU=;
 b=komCsSBAXJCb6SAM4KftIEfXtkJDqnBWPWZqfJX7snUau81yTcUNk7zqDj+frHEE+Qh4HksUgVwxTzfTZjtjcjSPeSkU+QBR5lP4B71RV7Dp6dwjIaNi1SKy34upoCSxcLt1x9ZnBlfcLsM8CCPE+Ep3U9cPQkVLVqjOfzOuefhLBmLuNzB3OKLUx7IQn4+VVUMXObxAIZa6TuT+4g08/anGdRb0xk4aLiBvc0E/JWVkZQZxyC6C566eudfQV5fj5uKO5pLUoDlXt5K705dPlvw+pyh3DBfrGOgZjsIiO60j89hMixbU/4TKQUt1/sCQQBQPom04bBxjCwn9D3wiZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmgl7eS1/9CmX7/4c3Im8fsAlB7wbgcXnDN6gRgnNAU=;
 b=MTVoOMouBlTvQvXiQYNNBGE1cQ79P0QjZg5fbyRMw+UViHUB5728NnxVSRuzkzwvK52G1MWb2lJ5vDt5/2jKbfvvVso9Ky9+5jo26jQAXzf4tQyBLGD/DYaF26xJoRFWjZpGaGDvx+FdofE3LSZ22+7z/MGLYqHeVR4kdh7qNU0=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB5202.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:191::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 11:58:18 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::870c:5e6e:be56:c732%4]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 11:58:18 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "aford173@gmail.com" <aford173@gmail.com>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>
CC: "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, Matt Coster <Matt.Coster@imgtec.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nm@ti.com"
 <nm@ti.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Topic: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Thread-Index: AQHabvRplvJF7SPUS0O/HtZ/w067sA==
Date: Tue, 5 Mar 2024 11:58:18 +0000
Message-ID: <76065296ad514898e2b8c29cd921c104b3692ae0.camel@imgtec.com>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
 <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
 <CAMuHMdVf7ophCwKt-n_N-LBHV4+t14Gjb4d1O0T8FDk_9xMFtA@mail.gmail.com>
 <CAHCN7xJ65RP8TO7cS0p5DwE6zru5NEF0_JA+8siT_OpSeLD7pA@mail.gmail.com>
 <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
In-Reply-To: <CAHCN7x+EnSU8qk5dBFco=0vkeknGq18qEN7vFmZs0_q83T_3+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB5202:EE_
x-ms-office365-filtering-correlation-id: b8ebf973-45b2-448d-67bf-08dc3d0b8bfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fYePKdKSdYRaQ/U2G29jByDsHBy+d2sztFXc+iMxHE60mK6wUssfi+rk5YDru0Jv/8YmMV27ys6diulY3oYHvjZ9aEn3vjYuSc24T86w4hczPpUj2Kwzr0acBNRDcuC7eqNU6pJyYJX91yYJ7jyUERWpfl9qpJZjkXf1YYobK6/fm/aJ8KFIo2sKlWwFg/ZUjcKQCnu9d0L2PwN6EbZoCl7aoa78/9LUyxe+s20s6CrXiWaB/c2QTKNXIxwOC2Zc5HMTN4KjeE63/wH4c1g5Chc9i5S0P578DyaSOOJclsOeqkB2dS2krl9XUrRehf3ndzpwXiTjMuKJh6Is+EpJExrCnyz24LiXrrM1KNiw1RAF7Zb3RPg7BaDAUqeyQ48Xs9UE4hk4tRQMn6zlnMkfs1dnS/R0JOMAzudvm5xaZvDkRYAfzdR4cOZ9YtMkJ88dpLLIIoGcEFIYm700gfW5J/A+7wNwM+IXOIJmlR6f3JqQ5wQeQ1fo1uU9HQb3mQPyDpp6Y4moPNtNW9Xq12p/wYoAbcPP/Pzrr9GMj5PWegZhkO2pDs42cBNuC4Q4X9HEZPD+5fGmY+hCyWMqpkCEXvfZ1WI3U9/BjcFSJt8vMPwSU7T20MqXbpCXRsXTAN1cvlqgaUuqP0oQe4p0DMS7yBRtOYgqS+wwAX6MECv53ps=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUtMOFJ2dlJGVGRIWE9CbDlUQXpWaEhBdXpiTkJHTFhLc1JSN0tEQWFGeUpr?=
 =?utf-8?B?M08xSE8rWFNZWDRFdEZUSXBhcGNEeFdRM09zc2lSNkxiNEZvK1BRd2YyL3VZ?=
 =?utf-8?B?YlhFdEFicHNMdEVjaVF1VmUycEN2QVVxWnZIc3lqeXhKMCtERlZRa214ZWo4?=
 =?utf-8?B?cGtuTlBpanBxMFRFdURRbzlRM1crWDA2NTNvdWtnTG9JRHZJNi8xcXo3RTdj?=
 =?utf-8?B?S3E4NUFOT0x0QWxtUUk5d3lBYWN3UlY2NmRySk9GM3VkQUcvTWtXRXNZRmd6?=
 =?utf-8?B?N1d0S0ErM3hvK0owakJsUTBZMnB3SkRjUldtb2ZxNkpPWWpMVVAvdEwrdml3?=
 =?utf-8?B?UU1tSXJQL1A5eDI0SkFSY2s4cFRwM1VYRm10NG5pN3pkQytnVDdsVGlXRHJV?=
 =?utf-8?B?dFFpWnJ3akUyRDJUbnhDcWxJeXV4VnhoOGZnNHR0N0NzVTgxQmFHVFBHNXdu?=
 =?utf-8?B?TmhON3V3SjVLY3ovYjgrb3NOQXMwc29Tb2pPZVZFTFpIMVN5dVREMUt1bEhr?=
 =?utf-8?B?emxQZ0dNNUZMRVdLQW5UVXN3MjNnZ2Q5aWRUaCtKdGZ1OFRRUkpDTVNNMENv?=
 =?utf-8?B?TTZOZXZEUTFIdVAzblpTQ2ZTTjNnM3RDWE56NVdZY3pYT3NSTWF2LzBVTXR4?=
 =?utf-8?B?a1VxSlZ6d2VJWGVya3V4U0tQQ04wZDY3V3lNTlJPRmNyaTcySkxBY3Z4TGhR?=
 =?utf-8?B?bkF4Wm5UWlllMXE0UzhjTjNjKzNRQzFtNWRhNlRFY0gzdHlYVURRK3REdWpy?=
 =?utf-8?B?Ymtha1VsUjFYMFR0K0xYUCtWWk1hUzBLL085L2cwQnBkSzBKWldRQllMcmx2?=
 =?utf-8?B?bXZtRnpmYW40S2hPYVhQS2JDRUNZVGhBb3dvZEY3V1FJS21BRVpMaU50SGVT?=
 =?utf-8?B?c0VqN0h1bGV6MVRvdmtUVmRuS2VOclVvVGo5V1M1UmFtdjdnb3BGbFN2Y08z?=
 =?utf-8?B?RWtSc1VuelVXcjhSdVJFNnlkYW5ENzB3UTdrL0lxbnNpSytXR2N4MVZzY294?=
 =?utf-8?B?S0JPQzdOZG9jWThNUXlSby94bUVhV2c2ZXR1d2NFTXhub3kzZjBnWkFvOEox?=
 =?utf-8?B?UmcreEs5cHNDMEgvNWpyWDUzYk00S0QzdkJGR0FMQTVPY05HNDlRcDNJUjlD?=
 =?utf-8?B?dGxRZFNMMnFaYTJwL0h1UEY4azFGVWtMOFV3M3RKWXNDL2hqaGovYjZKcXhW?=
 =?utf-8?B?VWpEbVMvU3FFR0ROMllib2dLZnFVNmNPTXl1QzJRc1VsOEovVEF4RjEwbkV6?=
 =?utf-8?B?MS9jVUJDMW9NVTBKZ21ZTVluSFZ5RUphQkZMd2duODNYL2I0VUVpM1ZGckxj?=
 =?utf-8?B?V1VQNFZNM3hCOEJxOHpuSVJ6Vmh6TmcyUFdFM21nZE51VDVZRlQvcTV5bFdv?=
 =?utf-8?B?NHRqWjhENnRPNmZod3k1MVRBK1hPd05GVTFVQmc5bVZXMjNxSExoQzlsRDBS?=
 =?utf-8?B?bmVHZjlERGFoc0dVZzZlak5sMHpwVVdDc3NlRzRORkl6dnB5Q2tSZ0xMWG1U?=
 =?utf-8?B?V3ByWXN6emhpbTNSQVVtU0xRRGY5NFVJbTFFU2Y0bWFHZ3VEWnRsMDk2TldB?=
 =?utf-8?B?TUFib2krQjJyM3BTWkVUZEx2TFBjTllrOGk0NC9wdXhMNlFZQlpqQTlNY2xu?=
 =?utf-8?B?c2h0a3M1REhtQjZ5TlhHbnluU1g5WlNOZGhVU2dzd05DNDRhaytUM3VPeVlz?=
 =?utf-8?B?VzhDWmNoZjlsdGFoWm5EYm9KUWFjZnF2UmdzMHpacGUxbm5ZUGhFZjA3cG9W?=
 =?utf-8?B?LzJucGo0bVdSTTVHZTNrS1NkcGdjQkg0RW9nQTZkN0dhd1EvNGRtMjdYdGZV?=
 =?utf-8?B?RlJJNmVDSFFTakdyRE5iWTRGQlhRZ2duOGRxRytVVzMzUzBnNzJySER5Mi9N?=
 =?utf-8?B?ZVlqc1lBT3BaSmdTZVhlc2t5ZVJ0QU14d1hCWTVDeENqNHZ4UmltVGl4V0lT?=
 =?utf-8?B?aWpyMUNxMlJwVWhUa1ZYNGlsUjhXeFh5RDg1Ris3SHJpMjZXMTJEaDN2b1dl?=
 =?utf-8?B?ZWFpYm5JNEtxOUR3RkcxazNVdHJHUmM4dTg3NktVNExVSWpuY0ZyRlFXL2M3?=
 =?utf-8?B?YzJwMnY1WGZvMnNxcFBxcWEyKzIwbzMwb3FLRGtWR05CS1VuOG5CbFFxb2dj?=
 =?utf-8?B?YUdHOXkxOHk4cEVhRTJiOElnWkpMNElIb1RHUEVheVVRVklYTnVlKzhLMHJn?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DDFA38A7ADAC44B8D8966B3EABE9EC9@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ebf973-45b2-448d-67bf-08dc3d0b8bfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 11:58:18.1604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 206jVKDQr3ITW5yD9aeSBN9pIlx8GfALD8H6Y2L4nLDXmmbOQEW8rDe+WgKJHTad4nw8aKduJ04A9KQqd8Py8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5202
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: wrctVmlocKiUulvaQfp2QVypoVKxXrGo
X-Proofpoint-GUID: wrctVmlocKiUulvaQfp2QVypoVKxXrGo
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

SGkgQWRhbSwNCg0KU29ycnkgZm9yIG5vdCByZXNwb25kaW5nIHNvb25lci4gSSd2ZSByZWNlbnRs
eSBqdXN0IHJldHVybmVkIGZyb20gcGF0ZXJuaXR5DQpsZWF2ZSwgc28ganVzdCBjYXRjaGluZyB1
cCBvbiBldmVyeXRoaW5nLg0KDQpPbiBUaHUsIDIwMjQtMDItMTUgYXQgMTE6MjIgLTA2MDAsIEFk
YW0gRm9yZCB3cm90ZToNCj4gT24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMTE6MTDigK9BTSBBZGFt
IEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gT24gVGh1LCBGZWIgMTUsIDIw
MjQgYXQgMTA6NTTigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+IHdyb3RlOg0KPiA+ID4gSGkgTWF4aW1lLA0KPiA+ID4gDQo+ID4gPiBPbiBUaHUsIEZl
YiAxNSwgMjAyNCBhdCA1OjE44oCvUE0gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3Jn
PiB3cm90ZToNCj4gPiA+ID4gT24gVGh1LCBGZWIgMTUsIDIwMjQgYXQgMDE6NTA6MDlQTSArMDEw
MCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gPiA+IFVzaW5nIHRoZSBJbWFnaW5h
dGlvbiBUZWNobm9sb2dpZXMgUG93ZXJWUiBTZXJpZXMgNiBHUFUgcmVxdWlyZXMgYQ0KPiA+ID4g
PiA+IHByb3ByaWV0YXJ5IGZpcm13YXJlIGltYWdlLCB3aGljaCBpcyBjdXJyZW50bHkgb25seSBh
dmFpbGFibGUgZm9yIFRleGFzDQo+ID4gPiA+ID4gSW5zdHJ1bWVudHMgSzMgQU02MnggU29Dcy4g
IEhlbmNlIGFkZCBhIGRlcGVuZGVuY3kgb24gQVJDSF9LMywgdG8NCj4gPiA+ID4gPiBwcmV2ZW50
IGFza2luZyB0aGUgdXNlciBhYm91dCB0aGlzIGRyaXZlciB3aGVuIGNvbmZpZ3VyaW5nIGEga2Vy
bmVsDQo+ID4gPiA+ID4gd2l0aG91dCBUZXhhcyBJbnN0cnVtZW50cyBLMyBNdWx0aWNvcmUgU29D
IHN1cHBvcnQuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIHdhc24ndCBtYWtpbmcgc2Vuc2UgdGhl
IGZpcnN0IHRpbWUgeW91IHNlbnQgaXQsIGFuZCBub3cgdGhhdCBjb21taXQNCj4gPiA+ID4gbG9n
IGlzIGp1c3QgcGxhaW4gd3JvbmcuIFdlIGhhdmUgZmlybXdhcmVzIGZvciB0aGUgRzYxMTAsIEdY
NjI1MCwNCj4gPiA+ID4gR1g2NjUwLCBCWEUtNC0zMiwgYW5kIEJYUy00LTY0IG1vZGVscywgd2hp
Y2ggY2FuIGJlIGZvdW5kIG9uIChhdCBsZWFzdCkNCj4gPiA+ID4gUmVuZXNhcywgTWVkaWF0ZWss
IFJvY2tjaGlwLCBUSSBhbmQgU3RhckZpdmUsIHNvIGFjcm9zcyB0aHJlZQ0KPiA+ID4gDQo+ID4g
PiBJIGFtIHNvIGhhcHB5IHRvIGJlIHByb3ZlbiB3cm9uZyENCj4gPiA+IFllYWgsIEdYNjY1MCBp
cyBmb3VuZCBvbiBlLmcuIFItQ2FyIEgzLCBhbmQgR1g2MjUwIG9uIGUuZy4gUi1DYXIgTTMtVy4N
Cj4gPiA+IA0KPiA+ID4gPiBhcmNoaXRlY3R1cmVzIGFuZCA1IHBsYXRmb3Jtcy4gSW4gdHdvIG1v
bnRocy4NCj4gPiA+IA0KPiA+ID4gVGhhdCBzb3VuZHMgbGlrZSBncmVhdCBwcm9ncmVzcywgdGhh
bmtzIGEgbG90IQ0KPiA+ID4gDQo+ID4gR2VlcnQsDQo+ID4gDQo+ID4gPiBXaGVyZSBjYW4gSSBm
aW5kIHRoZXNlIGZpcm13YXJlcz8gTGludXgtZmlybXdhcmVbMV0gc2VlbXMgdG8gbGFjayBhbGwN
Cj4gPiA+IGJ1dCB0aGUgb3JpZ2luYWwgSzMgQU02Mnggb25lLg0KPiA+IA0KPiA+IEkgdGhpbmsg
UG93ZXJWUiBoYXMgYSByZXBvIFsxXSwgYnV0IHRoZSBsYXN0IHRpbWUgSSBjaGVja2VkIGl0LCB0
aGUNCj4gPiBCVk5DIGZvciB0aGUgZmlybXdhcmUgZGlkbid0IG1hdGNoIHdoYXQgd2FzIG5lY2Vz
c2FyeSBmb3IgdGhlIEdYNjI1MA0KPiA+IG9uIHRoZSBSWi9HMk0uICBJIGNhbid0IHJlbWVtYmVy
IHdoYXQgdGhlIGNvcnJlc3BvbmRpbmcgUi1DYXIzIG1vZGVsDQo+ID4gaXMuICBJIGhhdmVuJ3Qg
dHJpZWQgcmVjZW50bHkgYmVjYXVzZSBJIHdhcyB0b2xkIG1vcmUgZG9jdW1lbnRhdGlvbg0KPiA+
IGZvciBmaXJtd2FyZSBwb3J0aW5nIHdvdWxkIGJlIGRlbGF5ZWQgdW50aWwgZXZlcnl0aGluZyB3
YXMgcHVzaGVkIGludG8NCj4gPiB0aGUga2VybmVsIGFuZCBNZXNhLiAgTWF5YmUgdGhlcmUgaXMg
YSBiZXR0ZXIgcmVwbyBhbmQvb3IgbmV3ZXINCj4gPiBmaXJtd2FyZSBzb21ld2hlcmUgZWxzZS4N
Cj4gPiANCj4gSSBzaG91bGQgaGF2ZSBkb3VibGVkIGNoZWNrZWQgdGhlIHJlcG8gY29udGVudHMg
YmVmb3JlIEkgc2VudCBteSBsYXN0DQo+IGUtbWFpbCAsIGJ1dCBpdCBhcHBlYXJzIHRoZSBmaXJt
d2FyZSAgWzJdIGZvciB0aGUgUlovRzJNLCBtaWdodCBiZQ0KPiBwcmVzZW50IG5vdy4gSSBkb24n
dCBrbm93IGlmIHRoZXJlIGFyZSBkcml2ZXIgdXBkYXRlcyBuZWNlc3NhcnkuIEkNCj4gY2hlY2tl
ZCBteSBlLW1haWxzLCBidXQgSSBkaWRuJ3Qgc2VlIGFueSBub3RpZmljYXRpb24sIG9yIEkgd291
bGQgaGF2ZQ0KPiB0cmllZCBpdCBlYXJsaWVyLiAgRWl0aGVyIHdheSwgdGhhbmsgeW91IEZyYW5r
IGZvciBhZGRpbmcgaXQuICBJJ2xsDQo+IHRyeSB0byB0ZXN0IHdoZW4gSSBoYXZlIHNvbWUgdGlt
ZS4NCj4gDQoNCllvdSBtYXkgaGF2ZSBub3RpY2VkIGZyb20gb25lIG9mIE1hdHQncyBlbWFpbHMg
dGhhdCB3ZSBub3cgaGF2ZSBhIHNldCBvZiByZXBvcw0KKGxpbnV4LCBsaW51eC1maXJtd2FyZSBh
bmQgTWVzYSkgaW4gb3VyIG93biBhcmVhIG9uIGZyZWVkZXNrdG9wLm9yZyBHaXRMYWI6DQpodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvaW1hZ2luYXRpb24vDQoNCldlJ2xsIGJlIHVzaW5n
IHRoaXMgYXMgYSBzdGFnaW5nIGFyZWEgZm9yIHdvcmsgdGhhdCBpc24ndCByZWFkeSB0byBiZSB1
cHN0cmVhbWVkDQp5ZXQgKGluY2x1ZGluZyBmaXJtd2FyZSBiaW5hcmllcykuDQoNCg0KPiA+IGFk
YW0NCj4gPiANCj4gPiBbMV0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZyYW5rYmlu
bnMvbGludXgtZmlybXdhcmUvLS90cmVlL3Bvd2VydnIvcG93ZXJ2cj9yZWZfdHlwZT1oZWFkcw0K
PiANCj4gWzJdIC0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2ZyYW5rYmlubnMvbGlu
dXgtZmlybXdhcmUvLS9jb21taXQvZmVjYjNjYWViZjI5ZjM3MjIxZmUwYTIwMjM2ZTVlMTQxNWQz
OWQwYg0KPiANCg0KVGhpcyBpcyBub3cgdGhlIHBsYWNlIHRvIGdldCB0aGUgZmlybXdhcmUgZm9y
IGRldmljZXMgdGhhdCBhcmVuJ3QgeWV0IHN1cHBvcnRlZA0KdXBzdHJlYW06DQpodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvaW1hZ2luYXRpb24vbGludXgtZmlybXdhcmUvLS9jb21taXRz
L3Bvd2VydnIvP3JlZl90eXBlPUhFQURTDQoNCldpdGggdGhlIGZpcm13YXJlIGZvciB0aGUgUmVu
ZXNhcyB2YXJpYW50IG9mIEdYNjI1MCBiZWluZyBmb3VuZCBpbiB0aGlzIGNvbW1pdDoNCmh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9pbWFnaW5hdGlvbi9saW51eC1maXJtd2FyZS8tL2Nv
bW1pdC9mZWNiM2NhZWJmMjlmMzcyMjFmZTBhMjAyMzZlNWUxNDE1ZDM5ZDBiDQoNClRoYW5rcw0K
RnJhbmsNCg0KPiA+IA0KPiA+ID4gVGhhbmtzIGFnYWluIQ0KPiA+ID4gDQo+ID4gPiBbMV0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGlu
dXgtZmlybXdhcmUuZ2l0Lw0KPiA+ID4gDQo+ID4gPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gPiA+
IA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPiA+IA0KPiA+ID4gLS0N
Cj4gPiA+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gPiA+IA0KPiA+ID4gSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dA0KPiA+ID4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
