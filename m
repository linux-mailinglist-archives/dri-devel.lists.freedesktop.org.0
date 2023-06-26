Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166F73E0AA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC05F10E1F9;
	Mon, 26 Jun 2023 13:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E851210E207
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:31:19 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35Q9LMwE027110; Mon, 26 Jun 2023 14:31:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=489//49xi0O74jt4mXVgEgSwRyIt3cC2YSZ9f/SCPEA=; b=
 nqEMiDZNm7J8FX4f0aMgLLXB/SYG9yAj2wPowjTWo/ychQaxcVGI4mztptRylfhx
 6hhX3+vnjDslbzpJXCTUyq+gn0XvkSsmRa+E0mWV8CBYrJO8Doa+LCucLqhmJA7V
 5lIErNfkbzqmgSiI/LORy6wI0anR2Fxyfu+s2Pip8ejMCdqE3uTlH0hOBKzXp2yJ
 0ouW+KcORF6NpVUl8HSJXxtA+vuIoeCBlIXb/l1PmtbKrmL9ouA1kPfLMbcYzH5w
 Nh0zfNfgLJ+2k72VRWsSJtfL3an4urvGb8GV3OZQtSOtHj0G6mqt5XR//xvKMQb0
 iEDj4DkgMcQy93o5RFnVsw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3rdqngsj90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jun 2023 14:31:02 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 26 Jun 2023 14:31:01 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.58) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 14:31:01 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikeWyBJI0xOR8NytrJI3h6uppCuxXIrUETdn7uj2rStgrqz4wJ8v6ggNwr9X47S2odRBRkotD7Ug63Eo7NAGx1fPrazXlr4aGoy4P2AlAcZAAZHNb/2gsQMKCWmoIeA3cZD7lLdwPdPb1HLRpeaGFNXEQ2XqDgL66x1aevc32jRgM4UKzlTnZfPSZUyZ7od3nxZSgVyi6n3kY8M1flSPSzRsDPzmGhk4qc283B4QSS28aOcba74CbZYq53mU67nd773A/ku1SAW6zl+Mvu8PdrkNRCLoO23IsRaV9yhAzQokgImZ5XHFgLChZyVnC0vCo26J15UOAZPc0BVRxGuWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=489//49xi0O74jt4mXVgEgSwRyIt3cC2YSZ9f/SCPEA=;
 b=IDYObOy/Bd5emzZq2fMF9lTDxJDX3hyCTr8Xh8waiH5f7XitbiIusKoIQjjZLb0ZJyuvS/1Gw5r7fBikN/rKaAG+vxrWTrSFhvIR9ZqBeuaTFGR4WXqDyWgjQS5Gr/gcTaZO0nBnAxQ5NVnEkbU1UAJrlzj+BN7dH9mV18NzIosPE8T3OC4/yymUq7ZV96OHJx7NVZ+QAMJJKQgh5eH7r8OijPp1Rh7xWAeGNuBVnO3h1nHqQKbfi96pXVOzh5N7AZUbt+SaaLIRKfduQIPf1501o5bnT28AJ2smtcLDOs6SR0PeQiefeGfiBFF/tq6aOzUESFSfcNH4G6bmMLDAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=489//49xi0O74jt4mXVgEgSwRyIt3cC2YSZ9f/SCPEA=;
 b=MUDka0Sn7JNox92eG96kZuHnS44CQ4DDXHfILgtX1ybtgZBk3KkYt96xSc8Rimhm2Cz82M0hZ5uTiQ4h4RCEETA5trsaNHA2dEXhc22j4rqrgMdjsO7YPdCF7NCBqZNCCZg/sjLpRZkTBDBcsoGNtGm9Ddu+24tQ2a5tFqL8nlY=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB6324.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 13:31:00 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c%3]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 13:31:00 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "hns@goldelico.com" <hns@goldelico.com>, Sarah Walker
 <Sarah.Walker@imgtec.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
Thread-Topic: [PATCH v3 00/17] Imagination Technologies PowerVR DRM driver
Thread-Index: AQHZngYUAoHFWBW9YEaEPwaoHR+3kK+NYHoAgA/IXIA=
Date: Mon, 26 Jun 2023 13:31:00 +0000
Message-ID: <ccfae572cb6a5ba70eea273e641b66cd7f6fe58b.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <CACRpkdYAAxvHLfEGFwaHQYvZRNhySNo7gSVEBSgGP-pusBwBnQ@mail.gmail.com>
In-Reply-To: <CACRpkdYAAxvHLfEGFwaHQYvZRNhySNo7gSVEBSgGP-pusBwBnQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB6324:EE_
x-ms-office365-filtering-correlation-id: 0141f1b1-c783-43d5-dc9b-08db764994a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4iKajeYjtf0FJBq7HnH+1ndE2cdJM5B43QcgeHnce3cyvi9Ef3kGvVzhu7SFLUD8SW4EsYo+Nzm8x69qC+5VIvcRAoLRN/a69Vnz2RTrmyQhnZ5ghdER2jYtjWybxpGZNQ/mWVXAlirh9MAFjWfCFWwmcur5dWnztOqILdafZpWUBsMrzBBbAcQ5a/dsHciZXVN0bM0Sv6vME/6TG0cgF1JhWvxAtrSqyXldcrrvZ/Mj8nH2DP85QtagQQGqWopHaDWqK+yYXj1kysIMVGVmJAZBx6aDdyhtXONqxIcVh+FJN8XcqlXu3qzn4AhVUKn7IUlOk+ZI0tt0H/B97ZPWzAnxsN+cy3aZvSvXeC5b/dQ00MCzdmoHhCQn3YW5odDyQqHkUA32KHf2oLEwpTjP1OUPaqM+/ImO8Bp4ZZNbu2291572x5V9BZzWsJmzizOAcuKiB/5ix0fTk7zZyk1RP5lWmgqFLPU8TBF+ilaNbPX3BvuVs0+rkl2jvNc7eTlNttRt2HAedXAx7bpEeGPG6wfWWKmilUutX7xx732bmcP7jzx0T5qetMW4SGbKSxNRyGFT7NTl4bGTWSyHXIW95wllRYbYVKhzxGX1J2pCv3glCj0lvRbDtR3awYVYpuLjJfKK1wxpmVurkfD48izyjQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39850400004)(366004)(451199021)(2906002)(6486002)(71200400001)(38100700002)(122000001)(2616005)(83380400001)(53546011)(26005)(186003)(966005)(41300700001)(86362001)(110136005)(54906003)(478600001)(38070700005)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(36756003)(4326008)(316002)(6506007)(6512007)(7416002)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWEzaGtMdmFJNGx5N3VhZVBueXVXcTNLZlg3Tk1JYWxGSURrdkp3VllRdElH?=
 =?utf-8?B?QWhzN1VBWk0yaHNZZ0xzNFBNZ1RIeXFWcEVRd21aak9pdmwvYi9HRDNKamd2?=
 =?utf-8?B?eFdvaFdxRFFFYjI3WHZHaVJWQWVlVW9qcEhKcG9WbHA3NnRtckNBY0ozaU9C?=
 =?utf-8?B?TUc3K2tTZVN4NmtLdVo1TDhHNHFVaVFQYWVtRWVQNzFCTmxnczF0MTVyM2Zx?=
 =?utf-8?B?VG9nTDlySlRqSTJLL0k2bnJuMGNXM3kzMHV1OVB0UDJ4OEVpZy93czh5cUcy?=
 =?utf-8?B?UmlncHpHMnA3VTI0MENFRTZwUFQzU3ZiWUp4OEhDcnRMcGNqMU5UR0lUWWZF?=
 =?utf-8?B?WllDSFQwRm9neFd5QTNVNlBLcHo1RlNvYnJqQTN3cE1VUGxRZW1oYlNpNGUy?=
 =?utf-8?B?N1pmZ0pRNnJQMVh1TFRqclR5Q2FlU1ByQXRsbmtUZWJ6UkJlMDFWcFhleEg3?=
 =?utf-8?B?WTgwT2NiaEMycWt2WUtsY1g3WkFRMlZYUW95SGlXU1BITCtZbDFDSnlwdmha?=
 =?utf-8?B?VmRVbFZMc05KVzNMZXRaY2NLQU5XQ0tXempZcDkrN1VyT0hGdE9lN21JSnF1?=
 =?utf-8?B?bDhHdGY2NE9pRWJPa3JRV2tBSFhUcmJPeFQ2MXQ4RkZmeVAyNENVdXd1bmpT?=
 =?utf-8?B?cC8rUE4vMkJaUmNxMUYwSFhieklwN2pMQTV1NVNndmlzSUVkTmJVL2N0Uytr?=
 =?utf-8?B?ZXYxRmFGWUJlSHIxd0pxdHFUQ1F4c1UxWHJsUDBWTTZjVWx1MWN3b0dWQWVo?=
 =?utf-8?B?aXljd010VFdPS2pUY1A2NUppY2VSUzh0MzdKZyszZ2tlbkp1WmgrWlAxdTVM?=
 =?utf-8?B?RlhlLzR0bHA5Rk9XaS9ob0xVRVV3L0VEQ0tsTlBaZVhUczc5TG5UUlZNY3Nt?=
 =?utf-8?B?VFFCNVk1N0lPZ3EyRUI4U0VOMGpMN0MzV3FPb1FPenZqbUYyWWJzZVpHaUpC?=
 =?utf-8?B?RnduRU5WKzBhbkQ1TVd3NmM4NlB1dWpzeVBNNW9hK0srZCtZRmRRd0t4RkhT?=
 =?utf-8?B?Y3hONis0QWhDdGZKU3pPM0JUZnY3MW1JQ05nODdnczdIMlNvaUliYXZXWjNC?=
 =?utf-8?B?cVRQQWdVdVBpcGsrOWhJMjFESUtXcEdNckQ1VUxBc2VFTFFnb2dBdko3cVgy?=
 =?utf-8?B?OXl0MmN6ZGVLSmhKZ282V01kd3c2UjZSSzIyd3N2aFprT2Z6amROMHI5dlJB?=
 =?utf-8?B?Zk9JLy9sV0tkckVmR0NJU2dVWHlSK1hsTG1MV256bmZSUklZVTVuM1FlbVg3?=
 =?utf-8?B?Q1Zncm03ZTlRU0o1Y3MwaUxmc01xUndoN1JzbUxENGlKNTR6NVZTTWxBUTZY?=
 =?utf-8?B?ajlSK0NCK3AyQ0F2RHprSmVWNkxzQXdxd0FPbFRTK3gyemhRSzlCSk9lQmZq?=
 =?utf-8?B?YW53ZS8zYTdtMStZa2MwS3FpTmxJcldZblY5UjRmbUZVWCszZHlRdkNFTHJv?=
 =?utf-8?B?ZnhBaGFCMlRFZzFKLzJucUM3WVh0S3U5RmpYWUtaQ05qZC8xaWZVVmdkSzlk?=
 =?utf-8?B?YlE5Q2hBcU0xcXNPMTQ4NGxDSjFGL29HMVBza0ZHVUQ4TG41MVlieGUwckpG?=
 =?utf-8?B?RzkvNmNRTEFFaGRTVzRyZ1BHTk90L2dkL21MbXZRd0V5MW9WQUx0SWVvbmxE?=
 =?utf-8?B?UnR3aVo2US9IeHgycW4xL0Zpb1VRck41SnRXQTB6dW9Yc05UWHBDSzV6OWlt?=
 =?utf-8?B?c2VJblVQZERZK2pDUXBEem5pRU44aU5DTE5QZFVSWnF1K20wWmVTZDczaWc0?=
 =?utf-8?B?NDQvWHBUUFVzZTJzTVRNK2ZJSGNpMXpCcDgxaUd5WXQ2TjlnWjZHNDhiRDdq?=
 =?utf-8?B?ZklQaDJyZHFYTkt5NWNWcFB2bDl2RU13YUFCYzlpZjRqVkoxbU94V05qeGZY?=
 =?utf-8?B?eUJaUG1FajIzR0FVQnpJR1VLNG43ZGZWMUJ3Z2hXRDVCZUpXVVQyNjBJY2hh?=
 =?utf-8?B?R2NvcTVCaHJxQXVSc0RvdWVobGZBQWFKN2dsdGtPNmZDNitMc3JTaG8rTHhU?=
 =?utf-8?B?d3Z6TEpWVE9CQTRtNHBTVzREczMxYXRlRmNBbGwwNU9TZktQQ3ZHcFZhKzZv?=
 =?utf-8?B?SlIxTUE3MFA0R2pIeitESlE5am12dVJtOHNsdS9ZMXFEZlhOM00vY01CTTYv?=
 =?utf-8?B?eDNoTnFIUHJEMmFXSmJhVVNOWmpRM3lzN0g4cXlyNi9ZMHd5UkxtL3RMb3Z2?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84F7D469B6B849409B162FD5B7F3858B@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0141f1b1-c783-43d5-dc9b-08db764994a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 13:31:00.0994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAWQiVblDzSwDnqimUfP8CP7xYUfBFhWx82UYo8fOgzuueuSuWfhLgfZxxSgIhpOe+zaJqYqxvqj62odJXkEnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6324
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 4YAqYsMqIDQoW1ka6BoNfcTLPAT0oGDG
X-Proofpoint-ORIG-GUID: 4YAqYsMqIDQoW1ka6BoNfcTLPAT0oGDG
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMsDQoNCk9uIEZyaSwgMjAyMy0wNi0xNiBhdCAxNDoyOSArMDIwMCwgTGludXMgV2Fs
bGVpaiB3cm90ZToNCj4gSGkgU2FyYWgsDQo+IA0KPiB0aGFua3MgZm9yIHN0YXJ0aW5nIHRoaXMg
bG9uZyBhd2FpdGVkIHdvcmshDQo+IA0KPiBPbiBUdWUsIEp1biAxMywgMjAyMyBhdCA1OjIw4oCv
UE0gU2FyYWggV2Fsa2VyIDxzYXJhaC53YWxrZXJAaW1ndGVjLmNvbT4gd3JvdGU6DQo+IA0KPiA+
IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlIGluaXRpYWwgRFJNIGRyaXZlciBmb3IgSW1hZ2lu
YXRpb24gVGVjaG5vbG9naWVzIFBvd2VyVlINCj4gPiBHUFVzLCBzdGFydGluZyB3aXRoIHRob3Nl
IGJhc2VkIG9uIG91ciBSb2d1ZSBhcmNoaXRlY3R1cmUuIEl0J3Mgd29ydGggcG9pbnRpbmcNCj4g
PiBvdXQgdGhhdCB0aGlzIGlzIGEgbmV3IGRyaXZlciwgd3JpdHRlbiBmcm9tIHRoZSBncm91bmQg
dXAsIHJhdGhlciB0aGFuIGENCj4gPiByZWZhY3RvcmVkIHZlcnNpb24gb2Ygb3VyIGV4aXN0aW5n
IGRvd25zdHJlYW0gZHJpdmVyIChwdnJzcnZrbSkuDQo+IA0KPiBUaGlzIHNlZW1zIHRvIGJlIGEg
ZmFpcmx5IGdvb2Qgc3RhcnRpbmcgcG9pbnQsIGEgYml0IG9mIHRyYWRlLW9mZg0KPiBiZXR3ZWVu
IGxhdGVzdC1hbmQtZ3JlYXRlc3QNCj4gYW5kIHJlY2VudCBlbm91Z2ggZGV2aWNlcyB0aGF0IG5l
ZWQgYWZ0ZXJtYXJrZXQgc3VwcG9ydC4NCj4gDQo+IEkgYXNzdW1lIHlvdSBhcmUgYXdhcmUgb2Yg
dGhlIGNvbW11bml0eSBleGlzdGluZyBhcm91bmQgU2VyaWVzIDUNCj4gKHNob3VsZCBiZSB0aGUg
aW1tZWRpYXRlDQo+IHByZWRlY2Vzc29yIHRvIFJvZ3VlPyk6DQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVucHZyc2d4LWRldmdyb3VwL2xpbnV4X29wZW5wdnJzZ3gNCg0KQWN0dWFsbHkgd2Ugd2Vy
ZSB1bmF3YXJlIG9mIHRoaXMgY29tbXVuaXR5LCBzbyB0aGFuayB5b3UgZm9yIHBvaW50aW5nIGl0
IG91dC4NCg0KPiANCj4gSSBkb24ndCBrbm93IGhvdyBhY3RpdmUgdGhvc2UgcGVvcGxlIGFyZSB0
aGVzZSBkYXlzLCBidXQgSSBjYW4gc2VlIHRoYXQgYSBicmFuY2gNCj4gd2FzIHVwZGF0ZWQgZm9y
IHY2LjQtcmMzIGp1c3QgdGhyZWUgd2Vla3MgYWdvLg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bnB2cnNneC1kZXZncm91cC9saW51eF9vcGVucHZyc2d4L3RyZWUvcHZyc3J2a20tNi40LXJjMw0K
PiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBnb29kIGZvciBjb21tdW5pdHkgYnVpbGRpbmcgdG8g
bWFrZSBzdXJlIHRoYXQgeW91IGdldCB0aGVzZQ0KPiBwZW9wbGUgaW52b2x2ZWQgaW4gcmV2aWV3
aW5nLCBlc3BlY2lhbGx5IG5ldXRyYWwgc3R1ZmYgbGlrZSBkZXZpY2UgdHJlZSBiaW5kaW5ncw0K
PiBidXQgYWxzbyB0byBtYWtlIHN1cmUgbm8gYXJjaGl0ZWN0dXJhbCBjaG9pY2VzIGFyZSBkb25l
IHRoYXQgd2lsbCBtYWtlIGl0IGhhcmQNCj4gdG8gcmV0cm9maXQgYSBwcm9wZXIgZHJpdmVyIGZv
ciB0aGUgb2xkZXIgZW5naW5lcyBpZiB0aGlzIGNvbW11bml0eQ0KPiBkZWNpZGUgdG8gd29yaw0K
PiBvbiBpdC4NCg0KT24gdGhlIGZhY2Ugb2YgaXQsIEknZCBpbWFnaW5lIHRoYXQgaXQgd2lsbCBt
YWtlIG1vcmUgc2Vuc2UgZm9yIFNHWCB0byBoYXZlIGl0cw0Kb3duIGRyaXZlciwganVzdCBiZWNh
dXNlIGl0J3MgZGlmZmVyZW50IGVub3VnaCB0byByZXF1aXJlIGEgZGlmZmVyZW50DQpkZXNpZ24u
IEZvciBleGFtcGxlLCBTZXJpZXM2IG9ud2FyZHMgdXNlcyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50
IGZpcm13YXJlIHRvDQpTR1gvU2VyaWVzNS4gQW5vdGhlciBwb3NzaWJsZSBhcHByb2FjaCBtaWdo
dCBiZSB0byBzaGFyZSBjb2RlIGJldHdlZW4gdGhpcw0KZHJpdmVyIGFuZCBhIGZ1dHVyZSBTR1gg
ZHJpdmVyIGJ5IGV4dHJhY3RpbmcgY29kZSBvdXQgaW50byBhIGxpYnJhcnkuIE9mIGNvdXJzZSwN
CndlIHdvbid0IGtub3cgd2hhdCBjb2RlIHRvIGV4dHJhY3QsIGlmIGFueSwgdW50aWwgc29tZW9u
ZSBzdGFydHMgd29ya2luZyBvbg0KdXBzdHJlYW0gU0dYIHN1cHBvcnQuDQoNCj4gDQo+IFNwZWNp
ZmljYWxseSBJIHdvdWxkIGFzayB0aGF0IHRoZSBEVCBiaW5kaW5ncyBpbmNsdWRlIGFsbCBvbGQg
YW5kIG5ldyBQb3dlclZSDQo+IGhhcmR3YXJlIGluIG9uZSBnbywgdW5sZXNzIHRoZXkgaGF2ZSB2
ZXJ5IHNwZWNpZmljIGhhcmR3YXJlIGRlZmluaXRpb24gbmVlZHMsDQo+IHdoaWNoIEkgZG91YnQu
DQoNCkknbGwgY29tbWVudCBhYm91dCB0aGlzIG9uIHRoZSBvdGhlciB0aHJlYWQuDQoNCj4gDQo+
IEFsc28gSSB0aGluayB0aGV5IGNvdWxkIHVzZSB5b3VyIGhlbHAgdG8gZ2V0IHRoZSBwcm9wZXIg
ZmlybXdhcmUgZm9yIHRoZSBvbGRlcg0KPiBoYXJkd2FyZSBsaWNlbnNlZCBwcm9wZXJseSBmcm9t
IEltYWdpbmF0aW9uIGFuZCBpbmNsdWRlZCBpbnRvIGxpbnV4LWZpcm13YXJlDQo+IHNvIHRoZXkg
ZG8gbm90IG5lZWQgdG8gc2hpcCBmaWxlcyBvbiB0aGUgc2lkZS4NCg0KU3VyZSwgd2UgY2FuIGRv
IHRoaXMuIEkndmUgYWxyZWFkeSBnb3QgYXBwcm92YWwgZm9yIHRoZSBleGlzdGluZyBTR1ggZmly
bXdhcmUgdG8NCnVzZSB0aGUgc2FtZSBsaWNlbnNlIGFzIHRoZSBSb2d1ZSBmaXJtd2FyZSwgd2hp
Y2ggY2FuIGJlIGZvdW5kIGhlcmU6DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZnJh
bmtiaW5ucy9saW51eC1maXJtd2FyZS8tL2Jsb2IvcG93ZXJ2ci9MSUNFTlNFLnBvd2VydnINCg0K
SSdsbCBzcGVhayB0byBOaWtvbGF1cyBhYm91dCBuZXh0IHN0ZXBzLg0KDQpUaGFua3MNCkZyYW5r
DQoNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQo=
