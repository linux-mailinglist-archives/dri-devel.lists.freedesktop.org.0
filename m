Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFD0450794
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5596B6E0F2;
	Mon, 15 Nov 2021 14:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2950 seconds by postgrey-1.36 at gabe;
 Mon, 15 Nov 2021 14:54:03 UTC
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C1E6E0F2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:54:02 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFDhmGn017233;
 Mon, 15 Nov 2021 14:04:49 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cbrpj83w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 14:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvdlkRrvbuGwe5qU0dU0G3oZ0mpTJdur+WZl6RgcDGlBPZGDdFIi6G8NKtDvSi29z2eXVt/WcuPSbuvLE53Zwy3KvjFjkFqXtkhdjeMiWzFaVC0HHkEQAZKjPZoTAi2lmdO3rKLflhY3JDeLhm38CPxkR/0pmmW6dx1IBluVDGpS3RrvrWxSGjno4h44Ch9rjIbGXqdRes2WXq7B6qoGuOzmuUNDgpI1chQ2qANrnM8H8oBhxDg53PXbZAvuxPzvqPMP5RgP1JaJqj7Qv6Jv0tLb7w65cd1/bQgoIOStDOEM6vBk8VF8DotMjXeomPh5J7vnui68XffKFiJDOKEgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdvDzg0gK7ltXilC9ZV43mCJsJxkkgJAV7gwTIy6P5I=;
 b=jJbO1bTVcD4ZO67UPj5z9pcFhpo0SJm3mT7KQZ6vbmsJeY2QOBn/KxSE63C9Nn1MMy6orZFzmpbdWrVKRM619eDSIpviWhu1UUTQhbGDEg/3aik2zmVIa4WWec56nrkrzwzFowbRlSykGCpS5WOxnnQfLsKrbASKePtwe5QGdmvbSbgN8yrLSP8pt8cwWzPPt/dPviX/ah+GfuRVMaB5iJahcRo6NsJk3ohXIDwbLFm/QMlGg71rllrTjYWOfRvT4pN9mf9a0AAx43IkW5pC4Jntb4CMFB9ktxmIo2/vS7jIu1mBHBzrdyuDrXbp9LpQXyjMgvDE//FbfNPc+ajmEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdvDzg0gK7ltXilC9ZV43mCJsJxkkgJAV7gwTIy6P5I=;
 b=ST6LHcOA6J+vsn31D5g27/ME+PIpk3f5qB1qSV9NgTyuy/vkik/O4NRwcrRydn13JnxaSD/f7WWaaedXgvXQk/vxdFvZEhXkWs+5EvV9gdpGpt/ye6KgQjJoYoF6y5Nfo16UhNgiBj//Vcg03rWbVROZqFrEcRI/nXCSlpIR1TPXTFGX8ResPTjzCe06EexJd6vd7e3QsoATLEuPtPTzrApn07IPeDZ0epGn1pdfCcBglYBZ0PoeKk+2fHRer9GCXqzka56AyrONmY+MxvBGo/rwSPq3YuV5rrhygOY23vpGaAwMLYUMHzLcOdeTnBCr18rS7ecJMmn3fdqTcs+UUg==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3376.eurprd03.prod.outlook.com (2603:10a6:803:1d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 14:04:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 14:04:44 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bernard Zhao <bernard@vivo.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xen: fix potential memleak in error branch
Thread-Topic: [PATCH] drm/xen: fix potential memleak in error branch
Thread-Index: AQHX2dM/C7peAofhs0mLDS2TsBGiLKwEn9OA
Date: Mon, 15 Nov 2021 14:04:44 +0000
Message-ID: <ea5cd96c-304b-c623-924d-cf8443455216@epam.com>
References: <20211115034504.4993-1-bernard@vivo.com>
In-Reply-To: <20211115034504.4993-1-bernard@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfbc2cf7-0852-4745-d5b0-08d9a840e076
x-ms-traffictypediagnostic: VI1PR0302MB3376:
x-microsoft-antispam-prvs: <VI1PR0302MB3376F2E1B2D446827AF3F0B6E7989@VI1PR0302MB3376.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TDZoGIa6X86gZLV1gN/v44d/5S9iHhpzOK8f/Fvc7X39L7Qs+wQ8h/HD3EQEW0fSMC/yQFlZiRjaD+dOdHHBSQaNaPFd47oRQJ7EM+94ftmeZaD4MV6935ArzVrdbMzPWpgJdl5sTpfisYouk2ba9oK673mcvl8ph6+AAJjwHk5TTvYJAKjY1Gg8yuRGnxV6BXHMviSLUQHA4k66U+yLkU7/ZHo2z+KmQj9KcX8ubQ6Veqr2KYggGEr9TRAAP5+Qlt8kLOgs1B18K20dlb1SgBhZ4eYFLA6ER5O+Dcv/hMgcYH0UJiMvficjGfpUm6byVGnw4gZVMbCb6l+z3gg1qy96A+wfqmiBPbRG9mqKRTunWWSA7Yb7k6wgguI1NqYp8/oCZnPDps6903tFLDBiOxvYoXZjT4blmEFBwSXoVUQorEiu5bReVYPV00O5hjuBixOrxmPjgrDHo8MRzvn4kYCH9YCx7Mw2vbf2oN7LbpI8zFFl5HRze6he1OVueZFX3aNNzJ42cFnvg+WHtXDLCYc6WrFcIwsFbbukj5s30qrQCQmmfMGLrFggnEHX0Mi3YPqMp23H+eNn2npFGHGPacnMowIiv9UOFpehxojsG2Pi9bzi2T4INw5cRxjOxEyOFAZOVViIaj1nYD4fQYwBPQOGsVM2Tl5XmmHeB0Wgr61KZnoweDCSIq1uJQrC1dvLrXEgrbvdJSVL1Num4kab5pKLSzgKrmo6NfMQgl8wzKqTdey9FFOX/03Tpfx7cxlZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(8676002)(122000001)(86362001)(5660300002)(66556008)(38100700002)(66446008)(64756008)(76116006)(91956017)(66476007)(66946007)(186003)(38070700005)(31696002)(6512007)(2906002)(31686004)(508600001)(53546011)(6506007)(6486002)(8936002)(36756003)(83380400001)(2616005)(316002)(110136005)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHNSZU5VSEVZY0JzS2VTQmRuWWJ5WnVzSjk1OE0xQjBZS0dxTnhEWHV3QlRG?=
 =?utf-8?B?N1BFZWdhTEFUU3piSjdqMWdIZTV3YW1OdXFNSkJPTTdkdnVCa0pMY0pCMXJ5?=
 =?utf-8?B?WXlaa2xzdCtNMTZiVjB4d2RaM0dhejA4cGtLd0VlVG5aMnYrQVZZamxSQ2Fs?=
 =?utf-8?B?Um9ORllFUzc5QlVYUFV3K292cE52ZXByMG9DREpTNjZNd2NESXBMbmNMOHJs?=
 =?utf-8?B?bGlJc2JtZjFmREJheFRacHBaVWMwZEJsL1dSbDEwRThOY251NGxrZXdwZjRp?=
 =?utf-8?B?OXFKQlZUMXYvQjNMSkJqdWp1V2pJMXQ0ZEZjRThFTXMyaWhvQVpXZ2grUlVu?=
 =?utf-8?B?dHg3bjZQSWxCSVhJQ2lQc3ZMOS9mRnNtR0JzcXQyRHNXaEQ4dWEyYStQMVk0?=
 =?utf-8?B?ZTBqOTc2aVhzc3JlWDJ2UlVvSFJjbFBnZ1c0c2MraXRaLy8wVzBITlppY3Q1?=
 =?utf-8?B?TWtUM2I5Rm1hRDBTYklweDAwcjBXblZoKzVWQkF0NERuTjhKQnpCQ0F6VE1p?=
 =?utf-8?B?UlREd3JXVktHOE5ickZKR0RuYjBERVV2eUNBcXZyMHIxL0JwSm0xdWlmSUJQ?=
 =?utf-8?B?RlZkWXNlbjYzdUw2SVRUcnZ4Zk1BNVNFQTUyaHY5SUpSNDlpR2Jpc3UrY3cx?=
 =?utf-8?B?MWNGcGhiRkZRa00rK2FWNjhwdnNkeFZqK3J2eEdJRXV6WDFnbGl6TG04aWhy?=
 =?utf-8?B?aTg5dmNwZ3FnR3lTdHdyODJSRDJIb3F6YjlnN2ZvSGk3YkpjaldwMnhtbktP?=
 =?utf-8?B?VGNRZWdsaklGZG9uZExzcFFUd0ZtS3dqclJHUlRld1VibEp4OS9NaFdiaUdH?=
 =?utf-8?B?bndvZldHS1lKUitEMTNuWTYrMDdvOTROZ0lVeElvSDAwSStXSldVK0VHVkRj?=
 =?utf-8?B?NDBTSEFldzdWT2RCM0pzd3NFT3duNTRwa0xEZ0NyV2kzSW9TcnVMV0k1a25k?=
 =?utf-8?B?bDV5c09FeVZwNWx1Z1JKQ0FJUGNjSmZ3M1J2VVFiQVRMUXdzVFc0QnNmbldN?=
 =?utf-8?B?dkw4Tm1vTnBSTjJiVGpvbFNyaitYK2FTbEFoSDJjc0RTL3JiVFpkQnVkM093?=
 =?utf-8?B?YmFBM0hXc3BIdHpKVjNMMVl4SG5sUmhxUXpRYzZYcFcyd3VMNDEvemtPb0tR?=
 =?utf-8?B?UVVtQkpvK203OUk2UHlkalZaMW9CcVFKT0ZRREg2ZnZhRFI4K1JHOFA4T3gr?=
 =?utf-8?B?dlRtWTJiR0tmZlE1T01McmtSTmRMK3NEY1Y5cXVMMENGbXVTa1c2UnBrUEJk?=
 =?utf-8?B?eUExSytqNzh6aXhOaWZQeFVITGxlSktvalY1eE9DZjJ2Zjd0cVpxWkxhTFRR?=
 =?utf-8?B?bkFVREtlL3JyekFCY2laRUoyUi9VQUw1UVdwZWMwazJaNVp6UlJMV2E1S1Nx?=
 =?utf-8?B?eHlmcFBhcGNTYzQxeWJPNkRQZjBIUkZDeTdTN3Y5aDdTMzU4Vjk2a1NYT3B3?=
 =?utf-8?B?S1BHSk9ya1pHVFcyamFYbmtmVkxUdG1CSmxDZzdwYWpkTWo5Um1ZWitvM2FV?=
 =?utf-8?B?VCt6N3UrWWEweEVENjNKSDBIZjQ5cmg1U0RZWXZkckFRbDZmUm9hTDgxZFoy?=
 =?utf-8?B?K0oxcUw0T2VDRy9Kc0tCNU1zRXFLWlE0ZnVKSk5TcG12ZW5NNGdNdVExUTZu?=
 =?utf-8?B?Tm9ZYTNEWFpJcCtPNTgvdHhFSHR0My8zWklxbjVoanoyNTVFdXdKRnZCcFVG?=
 =?utf-8?B?Zm1WdFJ2UmY4dFhIZHMrVGFLSEdiZ3hEZHpGQWlWRGQ1djVKZHlzWjl3ZVNH?=
 =?utf-8?B?NEZnc1M2YzZDeS84OUpMeGRmZ0E4RkJpN1lPMjhVUFF3MDFwQ0xxV2N2SXZz?=
 =?utf-8?B?cXVQMGRZSEJZb1U4Z0lrVkt1a1dGVlY0RC9jbUQ4a3Y0SnJwdkVscXZISnVU?=
 =?utf-8?B?ZWR3aFIyWGl0M0hvVEJFOWpjL295UlppT2dqZTY0YmN3akE0VitJbm9aeHNj?=
 =?utf-8?B?VzJud0t0VjRzK1JYaVphdDhvaTJEVFZQZlVybFVHaVJxYm42SXBMdWFnaXZk?=
 =?utf-8?B?Z3R3aTZGVWQ3NGlpZjNtKzlNZERrUDVrKzdraHJMREx3ZVMydzFWMEZ1R29m?=
 =?utf-8?B?UElWZ3RvRE9tVGdkSEQ4NTFnLzNITFhTOXpQMjN2eVVuRlh4Z21QTFZuNVZD?=
 =?utf-8?B?Ny9XWFo3dkJwQlZ1Wm9wQUQ1QXJCUzUxY0FOMzByZGxCZERTcGJKb2kxekR5?=
 =?utf-8?B?YWxGdDJsWkVHcnlQeVVTUjV3WE5La3JhWXR4S3YwTUVVQXZXendsSWJydnJF?=
 =?utf-8?B?Tjc5T09nbnl2cncybGZGbEtKOSs0YXdNYTdlQ1ZSS3djZ2xqelRGN0lBditC?=
 =?utf-8?B?REg1QVgzQUFxcmZRTFA4UWFWS2psMnZsREZGWStrajNnYnRqcXdCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE2404875A343F4AA74F8EB8F7B45349@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbc2cf7-0852-4745-d5b0-08d9a840e076
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 14:04:44.5320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2oORsUDdmffVqZT00DTwgLdpKeXy0Ft5FOPG3EkmL7tZ+q10xCsyfRBI/oQ16B1ZD2GDHxrjA/CDosEcCiCTfRwUEa9Tjg+HF17UMXmos/ywCMDjlGySo0h0Na4Gzfqn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3376
X-Proofpoint-ORIG-GUID: ATgmAinecZTS0cwAs60zwV-HfSzFi8Pc
X-Proofpoint-GUID: ATgmAinecZTS0cwAs60zwV-HfSzFi8Pc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111150076
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

SGksIEJlcm5hcmQhDQoNCk9uIDE1LjExLjIxIDA1OjQ1LCBCZXJuYXJkIFpoYW8gd3JvdGU6DQo+
IEluIGZ1bmN0aW9uIHhlbl9kcm1fZnJvbnRfZ2VtX2ltcG9ydF9zZ190YWJsZSwgaWYgaW4gZXJy
b3IgYnJhbmNoLA0KPiB0aGVyZSBtYXliZSBwb3RlbnRpYWwgbWVtbGVhayBpZiBub3QgY2FsbCBn
ZW1fZnJlZV9wYWdlc19hcnJheS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBaaGFvIDxi
ZXJuYXJkQHZpdm8uY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1f
ZnJvbnRfZ2VtLmMgfCA4ICsrKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9u
dF9nZW0uYw0KPiBpbmRleCBiMjkzYzY3MjMwZWYuLjczMmMzZWVjMDY2NiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYw0KPiBAQCAtMjIyLDE1ICsyMjIsMTkg
QEAgeGVuX2RybV9mcm9udF9nZW1faW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsDQo+ICAgDQo+ICAgCXJldCA9IGRybV9wcmltZV9zZ190b19wYWdlX2FycmF5KHNndCwgeGVu
X29iai0+cGFnZXMsDQo+ICAgCQkJCQkgeGVuX29iai0+bnVtX3BhZ2VzKTsNCj4gLQlpZiAocmV0
IDwgMCkNCj4gKwlpZiAocmV0IDwgMCkgew0KPiArCQlnZW1fZnJlZV9wYWdlc19hcnJheSh4ZW5f
b2JqKTsNCj4gICAJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+ICsJfQ0KVGhpcyB3aWxsIGJlIGRl
bGV0ZWQgb24gdGhlIGZhaWwgcGF0aCBvZiB0aGUgaW1wb3J0IGJ5IHJlbW92aW5nIHRoZSBHRU0N
Cm9iamVjdCwgc28geGVuX2RybV9mcm9udF9nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQgd2lsbCB0
YWtlIGNhcmUgb2YgdGhpcw0KPiAgIA0KPiAgIAlyZXQgPSB4ZW5fZHJtX2Zyb250X2RidWZfY3Jl
YXRlKGRybV9pbmZvLT5mcm9udF9pbmZvLA0KPiAgIAkJCQkJeGVuX2RybV9mcm9udF9kYnVmX3Rv
X2Nvb2tpZSgmeGVuX29iai0+YmFzZSksDQo+ICAgCQkJCQkwLCAwLCAwLCBzaXplLCBzZ3QtPnNn
bC0+b2Zmc2V0LA0KPiAgIAkJCQkJeGVuX29iai0+cGFnZXMpOw0KPiAtCWlmIChyZXQgPCAwKQ0K
PiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCWdlbV9mcmVlX3BhZ2VzX2FycmF5KHhlbl9vYmopOw0K
PiAgIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gKwl9DQo+ICAgDQo+ICAgCURSTV9ERUJVRygi
SW1wb3J0ZWQgYnVmZmVyIG9mIHNpemUgJXp1IHdpdGggbmVudHMgJXVcbiIsDQo+ICAgCQkgIHNp
emUsIHNndC0+b3JpZ19uZW50cyk7DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=
