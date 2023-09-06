Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193D7933D0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 04:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549FF10E566;
	Wed,  6 Sep 2023 02:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW2PR02CU002.outbound.protection.outlook.com
 (mail-westus2azon11013005.outbound.protection.outlook.com [52.101.49.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A45910E566
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 02:44:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGXdHY2boTC5XbbvMAy8HVq1aajK5nS1hDpEAZxyRWnxfPNb4JTPZ0dvXKUcEWJ35QY7sH5jjQgKFOQpdJRWbI6ZN9TOPLSMxR+pWP8qvjnffKz0nJHmzQXQUw/Leh58yE3hSRS0W444azFVbb7WeBiq0jWWqE4nGv8VmcHeQnaHr7ehSqsPzrw94HmfNlNls9r1uGOqpQIrn+4WreEMdhT7fztzJKVCqWtm8CuDDbGO10wdhqeG3hfoEljb8nmyIrgETmccPTjeZHwyDZeozC0GrKk5GwDdcH+YG9FqBgcHvQ4c0yldLMkEZgYTg5GaWG1THsfwNpE8bkL0KIucAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgnsEnFBnl8urpn9YEdrlDyC1oYHn03/nU8rCtv0zqI=;
 b=OD5CTOPh/w+Agp3AK/lzWQB0wv93FV0wM4nNVSGh/t+tvN9YuuPCvIZppvbk4NrOevYnpnOFa5gyhqAGj4O1IrYV4AlsSgj1gsd9U4YSyXFUBdB/bAYn/Fnz3u5J4hX4+PU6Lkk80q5OOfRAFLmPwQNrts5pe9ESHq3fmMD3mFJJ3N/QNdWMozmt1NA0juYMonYZQP6EIjDjS8IEZs+EMwoONrLkIOSDJuHxUUoaCS+i1uxwTPVJboGGKTKW7xCr2+yLye3rU9CQvdb8+KZIf01seM00hHwmjjZ2SbpLEN52xrhc8AkNj0zNTwqCUl86snG2j7Af+Q1uDGlZXrWT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgnsEnFBnl8urpn9YEdrlDyC1oYHn03/nU8rCtv0zqI=;
 b=cC77j2F6by+z1XCzv/gr+ugg/rIgEXAaSitRASI0MSVGWbZiY1zZJRQAQuVcLX1kW1uiDacofqLKMKENbruEA6BS5ndgKo2TDGnI/XagIfzvpsoNBcgYRJ3U/uSnLqwZaxYYTYM1qW4ZxMVW6qu2OXMry2RQSRgkB3HaKHDTU8U=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by PH0PR05MB7703.namprd05.prod.outlook.com (2603:10b6:510:21::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 02:44:40 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::9e05:acf:9240:addd]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::9e05:acf:9240:addd%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 02:44:40 +0000
From: Zack Rusin <zackr@vmware.com>
To: "konstantin.meskhidze@huawei.com" <konstantin.meskhidze@huawei.com>
Subject: Re: [PATCH] drm/vmwgfx: fix typo of sizeof argument
Thread-Topic: [PATCH] drm/vmwgfx: fix typo of sizeof argument
Thread-Index: AQHZ3+ANyqlotNH93UKSCXFhrXK+vrANGGiA
Date: Wed, 6 Sep 2023 02:44:39 +0000
Message-ID: <0d304850d6b3e0071dac7928f8dc7c92b25f1a92.camel@vmware.com>
References: <20230905100203.1716731-1-konstantin.meskhidze@huawei.com>
In-Reply-To: <20230905100203.1716731-1-konstantin.meskhidze@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|PH0PR05MB7703:EE_
x-ms-office365-filtering-correlation-id: 6df229ac-dbdc-44e5-40d0-08dbae83376c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZKGS2+IhysARwY9zAoYaqQaX4CiO45sPatAH4MZiriRKlTJlXY1yEQW5JWZTP2de7Qm+RKR42vVYrLAOK6bAxJP2kcw7GlsmwTJuekbwcNQACwmwta4BmLY218U15oOqImsxir2r6tue4qOjMSjEtCmIpnZlGpa3CDmA4UkRGVMDJwAyTpnHW9kSUirlzCCNmi+VPhcmxRFSY4fiNBSuCpUGjMWBBHzyQhWJaWHI8NIXvuabuq6cvvtmzO+S4+UO620dUH4mzEHllk6fKEJjn24rqvgIQ9w3b3PmBBu3Mvn3pUXGMsgkQcDBeF2ZGgU0tC3b1g7hLGp7JjeP3lgXLgBFABLrOZFTW5CvTiYuNIhsLHz+lnb9wJg0ZIWAVIGFcQcV6VOmKcnp/DMjWAF4j0IBEqsOXvow8amQDmNcrslVUbysAGCzIWHxhmoK1+rZnKPA7fisuKE1cpY3Taa5vl7n10h+l9J0rcd3pG6AOGHp7nTSTsz5DHgnCtHx/FkZdt9cXH2301xick/OfihSZCUbcoFiwud7zATR8aBre7Rfbo4mkkynR8TIE5rE9h8KzE9AZNgspcNdnM0aQcYNyA92k8WWo0WEujzs3OCkaGfsKPbloy0d2SSEvuijYasb1QgZaVHLmQVu8TJ+KwO+3IGrwiL927XOh7lOkxclDwQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(1800799009)(451199024)(186009)(8936002)(8676002)(4326008)(5660300002)(41300700001)(316002)(6916009)(2906002)(19627235002)(478600001)(6506007)(6512007)(6486002)(71200400001)(26005)(2616005)(83380400001)(66946007)(76116006)(54906003)(64756008)(66446008)(66476007)(66556008)(38100700002)(38070700005)(122000001)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHpueWpnZ2lNZ2h6cGtlVDRCOTNWYlR6bmhiOXppbDF1Z0VkLzhVTHVUcFc4?=
 =?utf-8?B?UDVybEVoano2Q3pnckVRSkxVL205OUp2N3p6V3pQZHNzMExmYURveXVFQjJy?=
 =?utf-8?B?angwVFcxQzhmd3NqeVRBV2pzSEVaMzRjbnVTbFlVWEdUYnZNdTBjUEdpQUJ4?=
 =?utf-8?B?T2grZkJ1QVpMV1BXRS8yeG55dGtVb0VLc25SRjhxOGRvNDkzN3B2Q1MrYS9V?=
 =?utf-8?B?d1lSM05qSWRqK0tpamZiR244TTdSQm16N3RNNVdzckltQk5RRkV0WFBSUzZn?=
 =?utf-8?B?WmdmOStVL2h1QlZpVURHY1E3cmxHaHMwV2pwbmxxcVA0ZTYvcjBjZXdYQ2da?=
 =?utf-8?B?d3hta3gyeDJKWU9HTE5uUzFqc3RsQzArdUxZZVJXelhubVFkSlFkajRZeWd4?=
 =?utf-8?B?Y2Q0Y2pFK0ZydSttYlNOWmQ0T1llNkRLdW8wc2RpTjlrZXgrNFMxQmE3eWhP?=
 =?utf-8?B?dFNEQlZmeURPNUpjUGtSRXdOMy9kNE4zRkpPUWN2SGFwMUxkYlF4ZVdOTW9t?=
 =?utf-8?B?REwwR1pjaVBheGpHK2dEcnZMV1c2UGRFd3RKZnQyQzBNOUNKcDJGU1hTMDl1?=
 =?utf-8?B?QmRSYm9DWWpXOVhIWUhYakk0Rkhqeng3bndUQkhWcVVNYmppSGhhKzBYWU5J?=
 =?utf-8?B?YzA3dVVtRXVkZjBNNHZzN0FUVGY2cmg0eFJtVE04UHJpNDIxTVpZYUJIZmg5?=
 =?utf-8?B?RFBZZVVEU2lGbDhaVmRBR2Znc2VNK05VZktqNkVLNk9EbTdjeDVRcHp3TXJN?=
 =?utf-8?B?MWhaUEVKeUhYTnI3L3I1R3Nrb0tlTEVIbEpOY2srWkxoRDRUYzlGT2pnSGpl?=
 =?utf-8?B?Rmk2ckhxTk5MeUdtK0Q5RGc1dlVmYzFLdWU4VXQ4WndueUZNNzQ1alB1b1Nv?=
 =?utf-8?B?b2Y3REUyaFg1MDBHc0dOUU10Qk9seUF0Z1lKVnRBTGc2RDVLSmkydFFYQnNJ?=
 =?utf-8?B?dDlxcG9yaTNhaEUxYTBhbGViK1gvVXpKWUx2SW4vaUV0NmhCd0Z3dzZheUha?=
 =?utf-8?B?aFlLcDF3NkRHb3RLWlYvU0RUZDFrS3Y0QnJHNUhObmFIckJOcVdsWGhnV0Z5?=
 =?utf-8?B?MXZEUWUweUIwTWR0UFc1TzNwS2dpT1h0aUZ0OUFveWV0V2dSdWJFTkNiUlVV?=
 =?utf-8?B?YlZKdEY1Ti9YOGZpd2tIdHJKQm1HOFhTNVhWYUpBcFZRaG5RS3ZHM1JjRHV6?=
 =?utf-8?B?TS9BVmxwWHlVZm03dDVVUGFhME5QL1U2VjF2dmNjYlZEVHR2K1VJT0hDRTZD?=
 =?utf-8?B?UDlnVjJsTjY4YnpvK2pXclI3VUtNZ2Q2VllwL2dRREVoWUIwSGl6bTcyc29Q?=
 =?utf-8?B?akpmUHRxOUtmL1czY3prSWUyc2FEU0FlTVVZNC8wOG80Vm9PV2dzQVR5eEJ2?=
 =?utf-8?B?VVlFSVhBN2pSZ2E5dnByK3Z2aHhQcHBwUXdaTms2eGRNei9oYktXM2Jic1dk?=
 =?utf-8?B?SGkyTzEwV0ZjOW1NKzJnSldla0ZaWVVGc0FSSFRQZ1g2TEtuSDBFYVdUV2ZB?=
 =?utf-8?B?M2trUlVCVldjUzRpZDBpT1hhVERDR1VVVGlVQXZMWDNyNmRuTGxUQngxUjBy?=
 =?utf-8?B?WG1zVi9CeGROL0wxS1BLT0c2bnJiYmRaY0RhbWg5V3p1R2lLRXMwRWdBU3k4?=
 =?utf-8?B?d0dCeUlxa0REbnZjL1FDUHdJUUFsb2dPRlp4TWpCWnQwNE5kMkQyVHMzdzBm?=
 =?utf-8?B?MG9DQmtZaWVPYUFnK3FFbmEzQkdKVm4rT0NPRUVpOUo4YktwTkhLWkt5bTBG?=
 =?utf-8?B?b2JLbDZZa1NNMFlweE55bDRxUlJzeTFWSTlIaWI2Q2JkSWxPVHNwc1RkT2JX?=
 =?utf-8?B?L2pkZjlNc1pZWU41S2YvODRlNUJCNTNCbXd1Rml3SlRoL2pqcGxFdTlJQ0VN?=
 =?utf-8?B?VjJ4Rm41cUdhU1hmZXl6ZVhpRzY3NVZKK1JFLzgvZGExUlo0RVFJY2NaMGVj?=
 =?utf-8?B?MjNCZVB6R3JieWk4QlpJTkg2MmxUWktDa2ljZkIveFFUU2ZrcEdwb3IxcXBB?=
 =?utf-8?B?em9WaUxwbTlvR0pJME9tek04dDArbkptV2NPLzcyOUNPV3dkbUhFckxKUDlC?=
 =?utf-8?B?QW9CWVltMUVZUm9OWmkya3M4OHZtRXlpcUY1RjlGcHJKMmFoaEN4V2xPU0Uv?=
 =?utf-8?Q?QBEqhb/NuVwXCMwhxAB//akNC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F47FA9214A44E46BDFE82EBD0240AD7@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df229ac-dbdc-44e5-40d0-08dbae83376c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 02:44:39.6336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAHMHqE0mhSt8tSRveN1qQElCtV25ZRb5TipmxuXvWmvVZk1I6LrTokiGJz4FtgM4ilG8Y7KbCOo2HCGOU62QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB7703
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
Cc: "thellstrom@vmware.com" <thellstrom@vmware.com>,
 "yusongping@huawei.com" <yusongping@huawei.com>,
 "artem.kuzin@huawei.com" <artem.kuzin@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTA1IGF0IDE4OjAyICswODAwLCBLb25zdGFudGluIE1lc2toaWR6ZSB3
cm90ZToNCj4gU2luY2Ugc2l6ZSBvZiAnaGVhZGVyJyBwb2ludGVyIGFuZCAnKmhlYWRlcicgc3Ry
dWN0dXJlIGlzIGVxdWFsIG9uIDY0LWJpdA0KPiBtYWNoaW5lcyBpc3N1ZSBwcm9iYWJseSBkaWRu
J3QgY2F1c2UgYW55IHdyb25nIGJlaGF2aW9yLiBCdXQgYW55d2F5LA0KPiBmaXhpbmcgdHlwbyBp
cyByZXF1aXJlZC4NCj4gDQo+IEZpeGVzOiA3YTczYmE3NDY5Y2IgKCJkcm0vdm13Z2Z4OiBVc2Ug
VFRNIGhhbmRsZXMgaW5zdGVhZCBvZiBTSURzIGFzIHVzZXItc3BhY2UNCj4gc3VyZmFjZSBoYW5k
bGVzLiIpDQo+IENvLWRldmVsb3BlZC1ieTogSXZhbm92IE1pa2hhaWwgPGl2YW5vdi5taWtoYWls
MUBodWF3ZWktcGFydG5lcnMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLb25zdGFudGluIE1lc2to
aWR6ZSA8a29uc3RhbnRpbi5tZXNraGlkemVAaHVhd2VpLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYw0KPiBpbmRleCA5OGUwNzIzY2E2ZjUuLmNjM2YzMDFj
YTE2MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1
Zi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2V4ZWNidWYuYw0KPiBA
QCAtMTYxOSw3ICsxNjE5LDcgQEAgc3RhdGljIGludCB2bXdfY21kX3RleF9zdGF0ZShzdHJ1Y3Qg
dm13X3ByaXZhdGUgKmRldl9wcml2LA0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoFZNV19ERUNM
QVJFX0NNRF9WQVIoKmNtZCwgU1ZHQTNkQ21kU2V0VGV4dHVyZVN0YXRlKTsNCj4gwqDCoMKgwqDC
oMKgwqDCoFNWR0EzZFRleHR1cmVTdGF0ZSAqbGFzdF9zdGF0ZSA9IChTVkdBM2RUZXh0dXJlU3Rh
dGUgKikNCj4gLcKgwqDCoMKgwqDCoMKgwqAgKCh1bnNpZ25lZCBsb25nKSBoZWFkZXIgKyBoZWFk
ZXItPnNpemUgKyBzaXplb2YoaGVhZGVyKSk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgICgodW5zaWdu
ZWQgbG9uZykgaGVhZGVyICsgaGVhZGVyLT5zaXplICsgc2l6ZW9mKCpoZWFkZXIpKTsNCj4gwqDC
oMKgwqDCoMKgwqDCoFNWR0EzZFRleHR1cmVTdGF0ZSAqY3VyX3N0YXRlID0gKFNWR0EzZFRleHR1
cmVTdGF0ZSAqKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgodW5zaWduZWQg
bG9uZykgaGVhZGVyICsgc2l6ZW9mKCpjbWQpKTsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB2
bXdfcmVzb3VyY2UgKmN0eDsNCg0KSGFoLCB5ZWEsIHRoYXQncyBhbiBvbGQgb25lLiBUaGFua3Mh
IEkgY2FuIHB1c2ggaXQgdGhyb3VnaCB0aGUgZHJtLW1pc2MgdHJlZS4NCg0KUmV2aWV3ZWQtYnk6
IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQoNCnoNCg==
