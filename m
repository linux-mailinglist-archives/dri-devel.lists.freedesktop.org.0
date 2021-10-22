Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190443752F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 11:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBC26E978;
	Fri, 22 Oct 2021 09:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9138 seconds by postgrey-1.36 at gabe;
 Fri, 22 Oct 2021 09:57:13 UTC
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736B86E978
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 09:57:13 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M73nBQ010281; 
 Fri, 22 Oct 2021 07:24:53 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3burjyr1su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 07:24:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnRBkMG+2euy8J8zNoitLPCHvkHB1fAT453TEggDPKBIY09v/qFITF0ldr4CObPmxsR/9IMZPDW+e77Rg7wBq6Go7a86o5Fi+Ij30ZqMtWlDrKf82nii2f1og18WzlBs/mmvZ8hEkW0cboQjvWGq5VCwjKAme0xcWWcVUIZXr3UwlqXP6NLLV6dcOZStP40jSPfoSAA8l/9kngSN+EFD4BfixQpb1uUXH9aXxUPaGKa3aHJwmMyXGmfUOwKEHFW6Fq2leKIMe/04P5HbkpHOIlW+1LsfvqAb+Cr+5TrFW8ZLoliYAVgsDM22oVipkPXaQwcV+SfBzEXeE94lEbsRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImDmBO/Zg0RkZF9Xvf0lQkTb0mSLH2BIKOqkes4c+5k=;
 b=G7fH1QKLaZ+4q8h0hpt0w9WgEoXHLiAeIsV9zAEqigyoyzzcVUcz5lR1XVJz7V3aJEbOC7kbkO8FnEH+oRRoTYbpv4X5hPYGed9DgaqnYWxE76H2Y4A6gXm/qwKZwKjXrFKQaIfXQzPRfDir6eS8xt/Un0mBnmq5vvvkofe7e9BEHPm8nzZ1MLOjhR+ON7X+069zmHevZVTvv20X9htrGPWnEqLhFlin0iAFjKvGk5QKa1kV6DeO6yrMgFxYIGR7JbRmsacFZGR2Ua8iRP4dYXP7OFxsrx/mneyQNCWPqp2xUD1w8ovB2Yvlj3C+wJ0F7qaO/qW6E5XYYELwyX9F1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImDmBO/Zg0RkZF9Xvf0lQkTb0mSLH2BIKOqkes4c+5k=;
 b=VS2sFtOfQElNIiktqvaMYKr4dq3w0x4gAnzCatzQzIs8TQcm1yZaoVOUYFkWVmO7/l3GXdk0rG7sNCELlwohkcD81+sSr+SNBvg7vArpwcqDQoah90xeMmKp8b3J6P0x/MzGGirsMCLkqX5hRTkYNs0PZbF6UdiYlWs1sjjko8wEes56zkkE0Odm9I0DgIX78ndFBOyDO5V40hG7jzg+x1WhWET7ltobw/hYE3aNj9Xbb1UIMph+s/z6qnWLODLIdZWF1uzLH3c4/znCt9rZKRQhDLkHf2866Urg3lfaZFgug/6opSA0U4u4Pi6WzVM5w3IB8hEbD1T8cROmfhSkog==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5940.eurprd03.prod.outlook.com (2603:10a6:208:15a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 07:24:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 07:24:51 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/5] xen: flag xen_drm_front to be not essential for
 system boot
Thread-Topic: [PATCH 2/5] xen: flag xen_drm_front to be not essential for
 system boot
Thread-Index: AQHXxxDqTORWeHdr+U+rFmdTnLsW1KvenauA
Date: Fri, 22 Oct 2021 07:24:51 +0000
Message-ID: <63cfe3bb-93cf-2c5a-f33c-8f81d738c249@epam.com>
References: <20211022064800.14978-1-jgross@suse.com>
 <20211022064800.14978-3-jgross@suse.com>
In-Reply-To: <20211022064800.14978-3-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99a71d77-93d6-45ed-9a89-08d9952d0996
x-ms-traffictypediagnostic: AM0PR03MB5940:
x-microsoft-antispam-prvs: <AM0PR03MB5940E2FD6F852DE4AAFF64DBE7809@AM0PR03MB5940.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fyJxnzigc6FWLbOlEv92G3q95IH0qqCTn88Cixytfqi19a7zfQ9FLMFOjHRE/aL4ZCqzyxULByeJReSZYL58pMEYEU3dZG6f/F+Bs2HQ4gEg3wBkUNS9GwCaa+4TZhk68IxtRInTKhwQRMEM+IbUfGHTy+psDjp58sRc2AFuKrQgl/gwkOKYtZyKc03TfmN9YlJbp1Sc6BeLbX/1VcKMCCn7fwjLLECTsRwSymVxElk3Ikagj6tK0nGn8yXzZfXR8Ch+GdBseB/wAC9zqe7o62pTLEhGm6i7DTrARmUya5ElX5pvszoeLufFw3Z0SRkdGGM8nOqFqVuGj11do9pQpefLc2xOCvEtZDk+xQh0bjjv3zjlYyQBj9O1gNuiftpt549X1HBb8cVt7moQb6LSXdfhPHutwahoAKnVWGi0NNIyKBPyaFWCIMECtO8GTK18H09fwj3tUJPZJoiwOBqyxWj8qih0fVcafByxP+81it2dHKM9TDK3ZiUDHh5vUEMrkDewHJjRcIg0ELyM15dzvWA8Laa/QH7QYt5r4YWf/SlcvtEltyrDqc8TFGjVd4N1UY9e6WqlCLhg6ScH2S0un8P2XwPUVmTNMqW7DcopkBupROvct30W6gqyojIXfDpuRDa2i61iBngZzuHujShWK4K8BREubkODr3hMex6691QeEEJkXD0OSjH7czKdvqLxqQIbCMCBSk1sYkkimqNehmJbQyl7dDdwFnCLHjxwBVT3b4S0UIJulcCLMx5XcHGd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(186003)(66476007)(76116006)(4744005)(6486002)(66946007)(2616005)(26005)(66556008)(91956017)(6506007)(8676002)(53546011)(71200400001)(5660300002)(8936002)(122000001)(38100700002)(2906002)(38070700005)(54906003)(110136005)(36756003)(6512007)(31686004)(31696002)(508600001)(64756008)(66446008)(86362001)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmVSRkdjV0diYzlZZ05wWUlLQUtTMHZyV2trOVQ4TmNqZi9YZzZBeE1iYzhF?=
 =?utf-8?B?dnJ6NDNyMEU5MlQ3cjd5MStzR3oxamhBT0Q4UTdWZkYyaFBWUUU0UGFjK3F6?=
 =?utf-8?B?RUZLVVg2b2U2cVpYcWxzT2V5VGhRbThoYXFTSHJKRFNQNCtULysyY3g1MWU5?=
 =?utf-8?B?c3VKNTMzR0JSQzJqL3AyTUFLdWxnYXhrckt6YlJLYlU4enZTUU8vbkl2MW0z?=
 =?utf-8?B?eU9PUkJ3Sm4yWVI5MXFmSkdMMktGWHVSb3dCdmExSkRVcjFkY3AxdU1pOHd6?=
 =?utf-8?B?UXdHT3lkakVKTFNQRUx5blBwdmRtUkFDYUFhOHBKWFp3TTRXeXViSUdiT1BS?=
 =?utf-8?B?dUlqcGZ2YlNCYUdPU3RwWjc5YlVZcTF0ZXhkVlVJdXVNV0hKRi92T3kyUUNt?=
 =?utf-8?B?NG9hTm5RZFNyS2ViVXBCaXg1b2hVeGlBZmlJbGFwKy9HT0kvMzI5L3JHcTFn?=
 =?utf-8?B?bWpKRXBKNUU5QVlYU2tyNFZKemVIZ3F2S0h2d0N4Wk9uWEJnMlloZUN1azE4?=
 =?utf-8?B?WDk4RllxajVlcFNlZ2plQUxlc0taSWhyMjJGTVhqYllIWGZhNitvajhUeGln?=
 =?utf-8?B?NXJST0xxdGpJS0xteEtRcDA4Y2pOUWROaDdJSjVlc0dMN3dlV3owMU1Ed1Qz?=
 =?utf-8?B?Y245Ym1wVjVXeG1oNnlDRjJGUTc0V05PWStEakl4TFh6anl6YXpyc2paQUYy?=
 =?utf-8?B?OVgyMU9GS0J4eVNWQXdZYWRxSytpUHlBazJZcG1KSGFjcG96dHZpSWVkaEhx?=
 =?utf-8?B?VTEyMFRNS2RtZTVLUGxjQk1DS3VUcUtHcG5VTXVSK3dLL1JleWI1L0FSNGdO?=
 =?utf-8?B?SHd0R2ZiUEE5YUljVUZYb044ZmI3ejFpaFgxMDZHRmQyMU1BbzRCeFJvM0d3?=
 =?utf-8?B?S0R5bjM0aFBKOFVCdEVQR1VBMFJ4eGh3QTR5dlk3VUt4bHl0ZFg5UTZEdloy?=
 =?utf-8?B?UjNqY2FrUm1obHRNUmZnT3RIL0Y3ZHAvLzUxT0pnZHBWSnl0dkFFS0JKZU5j?=
 =?utf-8?B?dlpZSGZVZ001ODB1a0Q0OGpVS1dqZC9ReEhoOGZtbGV6Q0I4YTRRL2lRQ1Z0?=
 =?utf-8?B?NUVyL2oxd1dzS1dYemtxSDd4Rlh1cnY2d3hiYnhyVU9QU1YrSXNQUE52cnZn?=
 =?utf-8?B?YnUwMktySjFuMjhiNUpMalQ0UVpxb2t3QnRMT3BrNWJCWjVZODFVdVVFNEpu?=
 =?utf-8?B?Ni9FMHpsdlN5aHh3amlLOHZyWEdybDFYQXlkeHV5R3dtK2p0akhMejN5SXRl?=
 =?utf-8?B?YUVnVHJWS25xbS9Qd3A4VXFqeVhWK0VOUnI5YzI2dEg5NjVoY0pMaW93YXY2?=
 =?utf-8?B?QlpIREtQcGZmZ003amgwYVEra1ZzQnVFQWcyaHNWemYxQ05QcDkrdFlJZ1NV?=
 =?utf-8?B?OSt2U0FwMXhCYmhSelp2Y3NEaEg0OVVKQndXQkFqWlNYR1ErdWVkWlkvaEtM?=
 =?utf-8?B?OThFcnVjR0VVc1EzQnkxVVRlTlR1WldSYmpCTExTQ1NvblNIY1RvYWVOQXVR?=
 =?utf-8?B?VFNnaXRqMjVCK2ljUW9qbTNvOXE1QlVseW85ZGxMUG84RTdYUnArbnNoNnNT?=
 =?utf-8?B?dndPSWFJVTlyWUlpdXRvWC81ZC9TcG5iSkVpbzZpZ2VrV0tKQ2JLRDI5ZmZk?=
 =?utf-8?B?MkZUVVNPV0plVXpESXNnQzZlbXNBSEttWkphRFdtOTFCT1h2TDNnUncwYUlV?=
 =?utf-8?B?dEl0NTlVL3RpbHpyRFA3aDdtS3RQamNPK2xCMFExbnJxVG1LQjFrWHlkd2NW?=
 =?utf-8?B?UCszMUlxNUl5N294N09RMGlWTURmdlh5ZUZDUWR6bnRNWmhBd3VzQ0kxNXRx?=
 =?utf-8?B?Njl0aU5HMndBZlJqWTM4ZHFZRlRDN1FRZ2ExN2o0b1ZGZTRxTHV4L0lmVk5w?=
 =?utf-8?B?Y084L2hSOEV2UkxJNm83ME1xNEhURGJvYWE3KzhNN0tzKzJZYytLNVFSUFEz?=
 =?utf-8?B?SUdXc2FnSWtpVkZTdHJyd2R4MndyTFQ1M3VTMXpUSGVwNzhkdEZ5bmNtRUZn?=
 =?utf-8?B?UDE1S2pPMk93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B410ABFF3F727A47B21676DF15EA1DE1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a71d77-93d6-45ed-9a89-08d9952d0996
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 07:24:51.6119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oleksandr_Andrushchenko@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5940
X-Proofpoint-GUID: zbwEZ-90WaMM4tze-hqmI4wxp5BTC7zD
X-Proofpoint-ORIG-GUID: zbwEZ-90WaMM4tze-hqmI4wxp5BTC7zD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_02,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110220039
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

SGksIEp1ZXJnZW4hDQoNCk9uIDIyLjEwLjIxIDA5OjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
PiBTaW1pbGFyIHRvIHRoZSB2aXJ0dWFsIGZyYW1lIGJ1ZmZlciAodmZiKSB0aGUgcHYgZGlzcGxh
eSBkcml2ZXIgaXMgbm90DQo+IGVzc2VudGlhbCBmb3IgYm9vdGluZyB0aGUgc3lzdGVtLiBTZXQg
dGhlIHJlc3BlY3RpdmUgZmxhZy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPg0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxv
bGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMNCj4gaW5kZXggOWYx
NGQ5OWM3NjNjLi5iYzc2MDUzMjRkYjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udC5jDQo+IEBAIC03NzMsNiArNzczLDcgQEAgc3RhdGljIHN0cnVjdCB4ZW5idXNfZHJpdmVy
IHhlbl9kcml2ZXIgPSB7DQo+ICAgCS5wcm9iZSA9IHhlbl9kcnZfcHJvYmUsDQo+ICAgCS5yZW1v
dmUgPSB4ZW5fZHJ2X3JlbW92ZSwNCj4gICAJLm90aGVyZW5kX2NoYW5nZWQgPSBkaXNwbGJhY2tf
Y2hhbmdlZCwNCj4gKwkubm90X2Vzc2VudGlhbCA9IHRydWUsDQo+ICAgfTsNCj4gICANCj4gICBz
dGF0aWMgaW50IF9faW5pdCB4ZW5fZHJ2X2luaXQodm9pZCkNCg==
