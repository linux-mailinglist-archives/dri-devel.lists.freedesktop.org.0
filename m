Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4407298CD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CC010E68F;
	Fri,  9 Jun 2023 11:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B4B10E68F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:56:48 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3599Jj85013211; Fri, 9 Jun 2023 12:56:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=CVMuXDgiUQmNpFRsGUpFG1KvZS/OaHsl5qg9ku/hqqA=; b=
 E5hmkoS5Y+mzhut3oKjQRA8BlMeBiYOTjGfpaT2kCWSJk1A0RPEQQmT1Wtc24sex
 +ZIQhtV583DJJzmZBkBi0f7gApY07Wx3Mv+kSA//ZGEYGsgB7k36H4WYCplYe+IE
 a5BUCRzy0/B6N/fiCyHtDkTh9KJ8xXwF2c5AcomMFAxLzFomzI+3Yv/TKgZoF5cO
 2ZI/U8tYdsNJp/SAuc9+bQ38rUkmV4L3EuOz9EzzJEQNXu0Ob4I5vuScXZ98hBGH
 EiyMNKbc2pfpVLspDCBh/w2hfCeIQrBOBHipCYPT0nqHbbY52OyjsmgHt98y4C6B
 52NYXsIflF9qEHBZLz1hVg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r3w9nr81y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 09 Jun 2023 12:56:09 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 12:56:08 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.54) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Fri, 9 Jun 2023 12:56:08 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsK/t57oWysQKvgXpSKvsBi4ft0yhhI4eH53drVzjAWWHiQoKVV1RqfYqTT5T9H/+a8b7025I+UjZm46Jfv5GQCkY2cew08w9S/semf9HV8TSF+NdsmpSVO2+47RMmbWUzafcd9J5TUM4w6KVB94kslUvte/34lgHQVooWyl1x5WReSFZXxtN3DcdpVwn4PircdLED8quGc1mWTfwg/6fLHX2xom5g2UjbufPd2bq15kdvuNCuW4DzffZIqdSD70tpwJ7QC2yxCuGBSpsL1roam7xvVFnCSI12JrTsnySDKSCUfQX1fNeYI3t5ua23o8hZI7NE2l64QDLp+r13fMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVMuXDgiUQmNpFRsGUpFG1KvZS/OaHsl5qg9ku/hqqA=;
 b=aqn3GG3NHFU4PH5LCkkrr6kct93zHJHpPHhs+NfGnugLJ4YF1OdcqlX5EyxjGE8L4LEJwizKbn8XJLIK29sYpWFWYw24rxhIES/isZAt3nXvHGoEbTIqJE6HNlsGJp0MAuNcgyQV5lSuFwq7/EQ6h4AlDiXMSmoBJfB0HEF2k3Uf48hw8RW0JqIVy4EAx4dqUWQ0KymJ4jiSDj72dd3vhXeGhC45Jzv3X++o1h/5B5YwdgHVJh6rDa21u1rFkuwSQF92vNp2W0A7RDMN31n6b10FNoJmXyO/wx8aS3H6bnncjAkAI8HDTGTFqSLxIBmK492mAnWMfEkeMPPsi+DqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVMuXDgiUQmNpFRsGUpFG1KvZS/OaHsl5qg9ku/hqqA=;
 b=bIZLSVjpjVbOpTE6RwlBWM0BED/uj1z5aIDBzwdqgG/TEGWtGwbqS4hZbyDJTezdiamHfmfllkWU823ohYa/DwApJZ6RZPue0lbhTHK/3OGO10FFmS3T3ukt9tFE0VU054Ggpp+MOGzRSnPUfuInoBxvfQCzMDVo+5YYyxv2aY4=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB7312.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.14; Fri, 9 Jun
 2023 11:56:07 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8419:9724:ffd0:21d1]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8419:9724:ffd0:21d1%6]) with mapi id 15.20.6477.016; Fri, 9 Jun 2023
 11:56:07 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "jason@jlekstrand.net"
 <jason@jlekstrand.net>, "willy@infradead.org" <willy@infradead.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "bagasdotme@gmail.com" <bagasdotme@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "boris.brezillon@collabora.com"
 <boris.brezillon@collabora.com>, "Liam.Howlett@oracle.com"
 <Liam.Howlett@oracle.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Thread-Topic: [PATCH drm-next v4 00/14] [RFC] DRM GPUVA Manager & Nouveau
 VM_BIND UAPI
Thread-Index: AQHZmMazG2PFLAis/0WnT3tapfBvdq+CYTAA
Date: Fri, 9 Jun 2023 11:56:07 +0000
Message-ID: <f5723444623b41d58f93c3f0ab662e9b37105765.camel@imgtec.com>
References: <20230606223130.6132-1-dakr@redhat.com>
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB7312:EE_
x-ms-office365-filtering-correlation-id: 2d180528-d99e-4fbf-584b-08db68e0826e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w5r0diTF/+kXg1KZJ1VpnoCIrcaP2wS4PQQcZDdaF0evRt8HLhNz7FM6Krp8r8h+UcMr9JwMz2diy+RvHEqPagOcgCea8IMmjJGSEGFcbFLt/NODFrGy4O/N9jFuwTb/z3kOVCLOlEoaiNiI/sRbt1muzJJxqNIZVlfVPtg9z/2q6hQ+TfYQmvVIJy6Pe8FThN4uNcY8MXtUE5NgMNh3jhuIWI9iTeKSSPOE5ZXTDHzkNWt0evVpdB1w7hGypiDqw5NCH2BzhrywfM6LAWa6WFx6BUXBwA+ts0DwS6nm/wehKZQij6LOQ39EMXev6ofKarE1D9ny8EZMdQxw73HHOs1l0EDnlTBUJsNYriCc72vStuYncdMEDojLIV8K25se5YdgIfuqm++ACHLrq6CSIaf3RvhDQnOlskKACMjRjkkwtuH59VWW9mBADkSvq8vG98P1MfK+VVR2WkQViQbPB+LRE85vp1YLNyF1sfPZWFwcATFB43UHFiHvQa6OCMn9p7xjCBN/nivNxv4qe/7kOor805UcbROxP7C1KxwAlot37SdtMX9aVLF3TW+5YQHVK8UYP09YOwFZt+Ez/z8vTA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39850400004)(366004)(136003)(346002)(376002)(451199021)(6486002)(478600001)(71200400001)(36756003)(2616005)(186003)(66574015)(83380400001)(38100700002)(86362001)(38070700005)(921005)(122000001)(26005)(6506007)(6512007)(966005)(8936002)(8676002)(41300700001)(5660300002)(7416002)(2906002)(91956017)(110136005)(54906003)(76116006)(4326008)(66946007)(64756008)(66446008)(66476007)(66556008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkxRMlpYVmNTZnY0OHhzYjdRWlUxNWxjLzZCbFFDSS8vWUZycDd6RGt4RUxO?=
 =?utf-8?B?U2x0dVVmK0JRUmFxay9kbFFuRFFtOEJzMmYwYzBmK3QySzV1NDBoUDRJTmZP?=
 =?utf-8?B?NUVlTUdyY2EvNWd6WUZhd3ZOVFU0dTc5VDFhZlZOSHU1RkR4UEZqenp2clhD?=
 =?utf-8?B?a0oxcDE4L1lwb0VHTENlTk1tOXJ5T0liU2tzcU1uZDI5aitBcDRvZC9YTzdP?=
 =?utf-8?B?UURzYWhoL0FGK1pFNUwzWWFhTiswRityMDRkMyt3US9FdVB6blJGTTloS1l3?=
 =?utf-8?B?S1B4S0tUMndVTVhxbm9uQjVNV2g1bzBwemwvTEI3QlhTWUlzNVFab21vUkU5?=
 =?utf-8?B?TzZwSFNYMmVBemRFdEpHd0I1WExCaDZBd0VHL1R6a2VEejBva0lBUm0vQ3By?=
 =?utf-8?B?Zk9vQlhqaUxqNnNqS0tWR1V5SkVOSHBOWEJ1YjY2Q1N1VldmZ0J5Q1BPT1A3?=
 =?utf-8?B?MytaazFKajY1RWoxc1VZM3d5aUE4MVJKY3Zaam50VjdJcmxGRGhCM2Q1RDZj?=
 =?utf-8?B?RGhzZWlINDBHcXpCU1RtOFhtOGJ3Y3JNZnF1UnNpa2pWL2JjNHl5NWsxSVNw?=
 =?utf-8?B?QmEvdE5LR3E4Uk9ROGFMTnQ0U2UrYnVTSlo1NTBFODc3Z3JDK2JsU1RPT2lP?=
 =?utf-8?B?cDFnakVNdTlpVVc0ak5oTTdWdXA1RDBKcGpmVnZ4L3BReEdwMk9nYUM1bE5i?=
 =?utf-8?B?V0tWazdWRnRsQW5Yd2c3RW5lbWwxbGUyeFZ3Lzk3ZWNkUVVGdnVmM0owYW5y?=
 =?utf-8?B?cTdacXZ4bXQ0bXpXaHJwbTlnR29mN2VKRFdkMytCRWxxOEp4Uzg4NTZhMUpH?=
 =?utf-8?B?YUIzYkVoUVlwdDN4UGhBYW1uSWVKbVdramRrMzNoR2ZpYVcvcHhtUmliZlkx?=
 =?utf-8?B?aDJVcWFMY2JEOTJ6K2pqTkQwdE14WUlhWW9yZFM1OHZ1RG1XNURSc1hnRERw?=
 =?utf-8?B?bGlrQUZDZlROZ2FQNHdqNE92SUhNeGNJNk92L05TOTZicFpXYnVoVHA1cGF5?=
 =?utf-8?B?SUU5MkZiVzJxeDVEVGRISktSVGF2NGgyQjV1SXpBZHdkdjRubThXNWVyVmNq?=
 =?utf-8?B?RWhqQUcwWVdrSHlDR0lPMmUwN1RnOVhVa2M4VjVtUzFKeDRDQU1MeTUzODRL?=
 =?utf-8?B?cmhKNTA4OC9IKzV2V2F3aFFqeWhNWWJaa3RlYnQxSkRrZU11dzcvaC9weWFr?=
 =?utf-8?B?Y3YxMndrdEwxazhtbmRBdnNFMHdUdnY4OGpZa1J3QmZqZWJrV25tamdIWWhw?=
 =?utf-8?B?OS9KS0p0aFFrMkh2K2N4NklmY1VzQTFNajc5MlorTDNVd1hyelljcEZML1dq?=
 =?utf-8?B?NHB3NmJiNGsza2UrbFFpS3dCU2hLSmhITlMvZktQTFFBWE5rYTIybXJmZ25Y?=
 =?utf-8?B?ekxXcGM4b3lwNExuRXZ0WndrZEdpS3ExYWdWRWZjOG1KVTdpRENHcUgyWk5q?=
 =?utf-8?B?aWd3RmVJeFh5STAvRGZnUUExNDFjc0xvbmdBQmIvK3ppb1p4dElBc2dsY0Zj?=
 =?utf-8?B?UFVhcC9jSWhrYi8rTEdVZ202SXFsY0pOcExFdTc4RldqSDFydE5hWUV1WVZ5?=
 =?utf-8?B?dzdLSFo4VElXRzVJcjBvK2RNKzBVQURXWHZpODIxQXBKWmtrVnRPWjJ3YmZ5?=
 =?utf-8?B?VlI3THY4VVUzeXBsWXljamJxcm1VV040M1NSSWYxQm81YVczUlRvMlJZMldN?=
 =?utf-8?B?OFNTd2RZenpsU2o3bmhBYTUxZENRbDE5ejRaQ29qeG8wWW1mTWVhSzhkMVB4?=
 =?utf-8?B?US9oL0Iza2pVcWl1Ynp4V0RNZ2lDWWVTQUJ1bFk1Nnd5eU1GMmFvdytORHB3?=
 =?utf-8?B?UVFrdm1YdWdCNDZDeGdISVBNNFNPb3NlQ2dJL0FLa3RPZDNRMG5IL3N1eTlG?=
 =?utf-8?B?bVRxb0VzL3pKWnZBWVZZcGJDVUxPNEZnSVluUUMvVjNPTktxMy9uc3B6THlv?=
 =?utf-8?B?MkZWQllsbFJnZy9XK3AyYmhKcnNJSURzWHFCQkJKY2pSLzdBalBuY3hZdU5q?=
 =?utf-8?B?dUZ0VDlrdkUzcVJ0alpabm54RXgzSHpSbjF1QVRibStpS1laWHdKOVFxQ2Vs?=
 =?utf-8?B?ZmpIRU0yaHNlNUtEM1psNDRHWEIvbnd6ZzB4WkRBRmlEZWR3Z1pPOU1QaXpn?=
 =?utf-8?B?ODlkVklKbWcrNkFtZEpyZ3IwY3d5bHhpMXBaN3ZFMVhJVXVuT0tXOGNOSmp1?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86984F17FC4CEC44A4CF4F468CD26DA1@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d180528-d99e-4fbf-584b-08db68e0826e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 11:56:07.2990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMT0/fzaNU2FaWa7TuFEwCk5coTsauwWNf0iGqf6WNDsivbqB8ypQJKuKFcj2zJTUrbhSl2EHfKhMKA9jytY0KMLh7nloXhIrUc7xyPluAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7312
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Jtn6ElJ70EUe7hU90NzMZXfzoI24bekj
X-Proofpoint-GUID: Jtn6ElJ70EUe7hU90NzMZXfzoI24bekj
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA2LTA3IGF0IDAwOjMxICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiANCj4gQ2hyaXN0aWFuIEvDtm5pZyAoMSk6DQo+ICAgZHJtOiBleGVjdXRpb24gY29udGV4
dCBmb3IgR0VNIGJ1ZmZlcnMgdjQNCj4gDQo+IERhbmlsbyBLcnVtbXJpY2ggKDEzKToNCj4gICBt
YXBsZV90cmVlOiBzcGxpdCB1cCBNQV9TVEFURSgpIG1hY3JvDQo+ICAgZHJtOiBtYW5hZ2VyIHRv
IGtlZXAgdHJhY2sgb2YgR1BVcyBWQSBtYXBwaW5ncw0KDQpJIGhhdmUgdGVzdGVkIHRoZSBkcm0g
R1BVVkEgbWFuYWdlciBhcyBwYXJ0IG9mIHVzaW5nIGl0IHdpdGggb3VyIG5ldw0KZHJpdmVyLiAg
VGhlIGxpbmsgYmVsb3cgc2hvd3MgdXNlIG9mIHRoZSBkcm1fZ3B1dmFfc21fW3VuXW1hcCgpDQpm
dW5jdGlvbnMuICBJIHRoaW5rIHRoaXMgaXMgYmFzZWQgb24gdGhlIHYzIHBhdGNoZXMsIGJ1dCBJ
IGhhdmUgYWxzbw0KdHJpZWQgaXQgbG9jYWxseSB1c2luZyB2NCBwYXRjaGVzLiAgV2Ugd2lsbCBi
ZSBzdWJtaXR0aW5nIHRoaXMNCmRyaXZlciBmb3IgcmV2aWV3IHNvb24uDQoNCmh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9zYXJhaC13YWxrZXItaW1ndGVjL3Bvd2VydnIvLS9ibG9iL2Rl
di92My9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmMNCg0KSW4gYSBwcmV2aW91
cyBpbmNhcm5hdGlvbiwgSSB1c2VkIHRoZSBkcm1fZ3B1dmFfaW5zZXJ0KCkgYW5kDQpkcm1fZ3B1
dmFfcmVtb3ZlKCkgZnVuY3Rpb25zIGRpcmVjdGx5LiAgSW4gc29tZSBub3cgYWJhbmRvbmVkIHdv
cmsgSQ0KdXNlZCB0aGUgZHJtX2dwdXZhX3NtX1t1bl1tYXBfb3BzX2NyZWF0ZSgpIHJvdXRlLg0K
DQpUaGUgb25seSBwcm9ibGVtIEkgZW5jb3VudGVyZWQgYWxvbmcgdGhlIHdheSB3YXMgdGhlIG1h
cGxlIHRyZWUgaW5pdA0KaXNzdWUgYWxyZWFkeSByZXBvcnRlZCBieSBCb3JpcyBhbmQgZml4ZWQg
aW4gdjQuICBPbmUgY2F2ZWF0IC0gYXMNCm91ciBkcml2ZXIgaXMgYSB3b3JrIGluIHByb2dyZXNz
IG91ciB0ZXN0aW5nIGlzIGxpbWl0ZWQgdG8gY2VydGFpbg0KU2FzY2hhIFdpbGxlbSB0ZXN0cy4N
Cg0KSSBkaWQgZmluZCBpdCBxdWl0ZSBkaWZmaWN1bHQgdG8gZ2V0IHRoZSBwcmVhbGxvYyByb3V0
ZSB3aXRoDQpkcm1fZ3B1dmFfc21fW3VuXW1hcCgpIHdvcmtpbmcuICBJJ20gbm90IHN1cmUgdG8g
d2hhdCBkZWdyZWUgdGhpcw0KcmVmbGVjdHMgbWUgYmVpbmcgYSBub3ZpY2Ugb24gbWF0dGVycyBE
Uk0sIGJ1dCBJIGRpZCBmaW5kIG15c2VsZg0Kd2lzaGluZyBmb3IgbW9yZSBkaXJlY3Rpb24sIGV2
ZW4gd2l0aCBCb3JpcydzIGhlbHAuDQoNClRlc3RlZC1ieTogRG9uYWxkIFJvYnNvbiA8ZG9uYWxk
LnJvYnNvbkBpbWd0ZWMuY29tPg0KDQo+ICAgZHJtOiBkZWJ1Z2ZzOiBwcm92aWRlIGluZnJhc3Ry
dWN0dXJlIHRvIGR1bXAgYSBEUk0gR1BVIFZBIHNwYWNlDQo+ICAgZHJtL25vdXZlYXU6IG5ldyBW
TV9CSU5EIHVhcGkgaW50ZXJmYWNlcw0KPiAgIGRybS9ub3V2ZWF1OiBnZXQgdm1tIHZpYSBub3V2
ZWF1X2NsaV92bW0oKQ0KPiAgIGRybS9ub3V2ZWF1OiBibzogaW5pdGlhbGl6ZSBHRU0gR1BVIFZB
IGludGVyZmFjZQ0KPiAgIGRybS9ub3V2ZWF1OiBtb3ZlIHVzZXJjb3B5IGhlbHBlcnMgdG8gbm91
dmVhdV9kcnYuaA0KPiAgIGRybS9ub3V2ZWF1OiBmZW5jZTogc2VwYXJhdGUgZmVuY2UgYWxsb2Mg
YW5kIGVtaXQNCj4gICBkcm0vbm91dmVhdTogZmVuY2U6IGZhaWwgdG8gZW1pdCB3aGVuIGZlbmNl
IGNvbnRleHQgaXMga2lsbGVkDQo+ICAgZHJtL25vdXZlYXU6IGNoYW46IHByb3ZpZGUgbm91dmVh
dV9jaGFubmVsX2tpbGwoKQ0KPiAgIGRybS9ub3V2ZWF1OiBudmttL3ZtbTogaW1wbGVtZW50IHJh
dyBvcHMgdG8gbWFuYWdlIHV2bW0NCj4gICBkcm0vbm91dmVhdTogaW1wbGVtZW50IG5ldyBWTV9C
SU5EIHVBUEkNCj4gICBkcm0vbm91dmVhdTogZGVidWdmczogaW1wbGVtZW50IERSTSBHUFUgVkEg
ZGVidWdmcw0KPiANCg==
