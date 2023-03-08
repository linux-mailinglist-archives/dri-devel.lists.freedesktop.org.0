Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F36B0EB1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7465F10E656;
	Wed,  8 Mar 2023 16:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8B510E63C;
 Wed,  8 Mar 2023 16:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cuo+nn4WZuCEkZlLGbbe9MsBa0Iqh7gD+vOrxK/ZBPrNTI8wp9+mhJSbVSNm7QtWCzofnSoQGelE0Uqgwdzck3cvog1CWN9Lrz7JAr7SoX8gg0XAnafOljFnevNT6EfDIQrfniETAQI7Qt1Q2k1HjnG/Z+3cq2PF0TnL3hqAjm6J/iclOwk2LYr3hfdG04bi9ufgkKm3oIEKkeXnylQksV3voi2Pi1ATKmvz1AHsAQDV0SAgXTbyD3IWJsupX+IM1WB2CyieWvYErmYqiy4KdHuzQPWy0aTovGWrbIoqbkT+c5tCnz1gINjPCdOQf+5ceXsLzpe8j4ePF7AcFMjMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coOj4PMJMGfb2ipeUebqVxo7ulLBeL7/pKKEXhQTTjs=;
 b=kEAclY6SNlN+WGCYPVTCWy7ztvNzLoGOYOdEHaDS21EOQCdLcs+QMjQY/5L6sG9J5UXzpRMfzAuzwM11BmmSphYXTkUObbCedyJB43NsP6HGgiVsY6edE0Z7j84jwLA0Fnf5EQtVPwaaKSIYMbTCq0OSCztuSrfTwg6acylx76V0gAU5UoQoziQ5Qi9PCtCAY3mTCztdSrgIaxuazxo9C9fJCuT4a02rKAluteYD0eiSs+nL192r1jip/Dq99B+c7yY7TjvsF5e/Uxaa8Q3m30bky8N95/FrFR1I/eHM2EMZ/ZRCGdc397Z3D+GrNNLLDEIOQZEz6UGrH//5Ik03DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coOj4PMJMGfb2ipeUebqVxo7ulLBeL7/pKKEXhQTTjs=;
 b=lAqobjjYJIHPCXeQ/LtImaYa95UDk3EZRjBJT3i+UXdd7/Dlbkgh1pWXHNQY0J2qghPjFphhZxlT38cl6fhVb27+biybEOPqgIetQFrggW5E5TBO+wnhK8rYYSs7Y1NKwgiWFKoC3yd1mlx9QagJkbSKEfFKCcSt6I36LPd/pzk=
Received: from PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 by IA1PR12MB6411.namprd12.prod.outlook.com (2603:10b6:208:388::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 16:27:01 +0000
Received: from PH7PR12MB5831.namprd12.prod.outlook.com
 ([fe80::3bb0:da9a:5a44:8e32]) by PH7PR12MB5831.namprd12.prod.outlook.com
 ([fe80::3bb0:da9a:5a44:8e32%4]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 16:27:01 +0000
From: "Zhuo, Qingqing (Lillian)" <Qingqing.Zhuo@amd.com>
To: Maxime Ripard <maxime@cerno.tech>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Subject: RE: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Thread-Topic: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Thread-Index: AQHZUaEy/DMbuWA+vUWS5MTAKPyPlK7xDf0AgAACV4CAAAHGEA==
Date: Wed, 8 Mar 2023 16:27:01 +0000
Message-ID: <PH7PR12MB58315E9E7362E8A750393B6FFBB49@PH7PR12MB5831.namprd12.prod.outlook.com>
References: <20230308093408.239331-1-qingqing.zhuo@amd.com>
 <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
 <20230308161945.svooztnablyvm75e@houat>
In-Reply-To: <20230308161945.svooztnablyvm75e@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-08T16:26:59Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=cd8331b4-1e21-47ff-951d-f4a333d38137;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-03-08T16:26:59Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: c88622a8-9b5a-4ae8-bb46-b3e5c3eca7df
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5831:EE_|IA1PR12MB6411:EE_
x-ms-office365-filtering-correlation-id: 9182fe2c-6e0a-467e-929b-08db1ff1f243
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YLh8xz+hIyhul4fz1eoIT939/2IC9a/IVglprG79B+oDpQA6Qn79V9uimjz3kNMmkRQQLHxrbX8AAQ01ExusqUIbWRIYJWYN9bfK/IHZSdE1LQ2nkv3p09TNSYS4fwMYZJYDixfcyxbgi7SdSq+E4u/YGXj7Js0x3UQhYdCmN9LzKLG+WAUZVb5p6wy8P3X1kn/qbmYhETx75NisEKZTpJcKYXEsOx1AsJEo5HWN5+4rRrIkN+NPflu9WumwIh9twdVOUTyK4NminteybBrSKjqV3lYq16gHpemuiVEPozyZCaucf8U0Y7wZUb6BHQcYtcgHMItX6eSrQ+/g/LliPouRhUdmq/reSrTbIZvijNz6VZp/loHT3rBjNAHwcIcI1gxAw7xCpLq5pUYVjRGml3cFAvFKTAIrrL6Kl+vsBP2hAWMc/DVpd7lpUtp+RVa1eHHEUFM0FUOtOENl+aIfW6yRDwgIsiWwaA8h+/Jd0k9RIUNdgrLn7EppOokBpn2DKwO97k8uo6ogqxpttTIX9lG27z7BD9iL95BFvdQFXwLnD+SfUW78HIwSQvN4XnraoqtgVohdegbTdq2/9lLwlcvFcwhlfbVvbTBNPkPJQA+M9SlBvKOCsVwW83My5cBmDdqfhJa+gq7mxbiyMmWLqNYxKN1DIqBNHWt1ThzgMHFUpJSzO9HoTFf3QtyjAHPnPXJrHek6rV3Mmu40L0BjSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5831.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199018)(316002)(6636002)(110136005)(54906003)(83380400001)(86362001)(33656002)(55016003)(64756008)(9686003)(186003)(41300700001)(26005)(5660300002)(53546011)(66556008)(4326008)(66476007)(478600001)(2906002)(7696005)(6506007)(66446008)(8936002)(8676002)(66946007)(71200400001)(76116006)(122000001)(38100700002)(52536014)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OCt3d29iVzc5OTAvWGtTeGJUSmlVeDA4RkRkbjllaFdGY0ZKcE9RUUUyMVJu?=
 =?utf-8?B?ZmY5ZFQwUVFubVk2VnhyTUp1T2NBY3Z2d1BnS0VLT1RmN3FiTndxelpydklR?=
 =?utf-8?B?bGdCbUJDNXZiUWl5ejNnc0l5R2ZyKzJ2SXRQT2orWDJESVJDdS96QjRhdlM1?=
 =?utf-8?B?L092c2tmUjUxMmpFYUZRY0I0dFJkZis1bnZBa3FQTm0xZE9mYWZyNG91MnFL?=
 =?utf-8?B?SkJOalpLTDd4SlVZazFQWFhyb2l4Y3lIb0Z5ck5uK0g5WDhTRGtmWEJTMmtL?=
 =?utf-8?B?NlVBRkE5K2tUM3UrYlROY001aDBEaWJRTDdMNlNEOXVKMzRqWkZJUEszWlhz?=
 =?utf-8?B?RUtwVncyeXNwUWZTTTdVWFJSWDF1K0VFRnpETk1DUG1rTXF1VnhyaFBCVk5l?=
 =?utf-8?B?OFdNaVp6T1lQTjJrZXh5eEY5RGcyQmJycDNON2hYc1ZXRW9ZRExyVG9ER2V0?=
 =?utf-8?B?b0RZTHMzbFordG5PK2RXM1ovYU04VndKOGxxa0J0bHVMc3ZtQmhORDZwZHN3?=
 =?utf-8?B?dEgxek9uS2lkeXZzN2hVVm5mNDlVU3llTURPY2xYb2hBNHl2VVR0ZlFCbWxP?=
 =?utf-8?B?eHM0c2FSL2p3UFIvMW5qQ0VlU2dCckYzZy9GUzI2L1ZXVE55SHhpUy9QSU1D?=
 =?utf-8?B?VkNNbzJQb21zWWsrSUh2TU1wMEZxaHBlRHdNSnhMZVR1cmQ5TGxsTDdOS0lI?=
 =?utf-8?B?QmRsNHRWSHVRK0J6TWR6YXlxZUdJU21RM3MveDZ6ZVIzczlJRmRZNHlYUDFr?=
 =?utf-8?B?L0EwWVRROVdSWFR6Kzl6SVQ1cEFpVFI1RXBwWjhXNFgrdy9SS0FmQmJWUHBL?=
 =?utf-8?B?WXpSeFMrRE1ORWVwV2NhMDRWYm5kNVNKb2RhZXdhYXA3QmxCam51ZHh2WVBz?=
 =?utf-8?B?c2VsbXVBRVowRGRMOENQMUYxd28rS21oN3prK3o0Y2c0V2liYkU5N3FJWG1v?=
 =?utf-8?B?bjlLWHhUeDREaFZqVDVpRnJIYUgzTDNsSWowTEUyVFhyS3dqZDZlZWFFSm5E?=
 =?utf-8?B?dVRMMmVpMFduaWRuV3lmVnNrcVI0em1oSTc2ZEZOQ282MUl6aGhibXVsZmxl?=
 =?utf-8?B?eVRpc0llQWRESWpDRHpITE5EaTV4dE1xNGg0ZEE0V3MzR3pPaFFUSW94MDFO?=
 =?utf-8?B?ZmJUemkxem51NEtyZWpQT3BBQkJ5UVMxZWZUWTBUV3JLTVA5eDN5RUo5OGtB?=
 =?utf-8?B?R2pna21uNUFVTTJxNldoNlBXVTRxbHl2c3VJQ2NCKzRCR05Mak45S2NuNm1a?=
 =?utf-8?B?RWNyRFJSVDZqZ3VsQzR6eTBUSVMrRFRLVlZ4MHBLNDJhRVNDdVRrczRzMzgz?=
 =?utf-8?B?K3F1TFhsa0tKY0JLc1drcWJRK1YrTGN3bm9TMUV5R3Y4YWQzTndQakIwcm0v?=
 =?utf-8?B?Z1VzdW9YRE1hZk1zUUJvaS84bGttQUsxNCs1SnU0bU44U0pRbEFWV2F3RmlL?=
 =?utf-8?B?VXZDM0JrTFgrVHYxOUZ1QTdVS3U1dFczUUlzSmFWNDcxVHZ3QWRMU1AxWGdl?=
 =?utf-8?B?eXRYMFRmTDN1ZEJobUw1SEpmeFRwc1BncXZjeE4rNWhMNjljSU1nNGVydFNH?=
 =?utf-8?B?QjlReFBDa3ZpUVNHenRFbU43S2FCVUNEdER3Y1VNbUtVUStTZmFFblBPNEMw?=
 =?utf-8?B?a2lOSk5LMFpPWUo3a2E0djkrQzBpUk5lY0d6cytUemVqbnBhNUFpb3JhTzU3?=
 =?utf-8?B?OXI3UDN5eG82R1JoU1lwNGxyNFF5ZDFtak5QU0RRWkwrMmlnOFpISmppSHNY?=
 =?utf-8?B?Q2FxYjdXWFdJT1NiZlpsbUVuRHRsRit5ZDB6T1YralpZZDBnS3NUR3hmSjNU?=
 =?utf-8?B?cUhlRTZjcVhDRlpGTVQwSG5qUmV0UmNFdyt1ZUlyNVI4OTU3TkpqT0U4Tncv?=
 =?utf-8?B?Z2F4MmRLRVRldnB5S0k2U2ZiZVU4YXF4WjNLb2JoSHI4VHBRVCtaMFVsaDQ1?=
 =?utf-8?B?NG5MVjVodk1ocng5Z0lyZlBRbnJ3cHRPSEdhVHduQzBFUmJzbkdmRWpGdnZV?=
 =?utf-8?B?eWtYcnJnUEw2QXVhMmZTM01oVnRkLzFXaUhkUWxYNjlreWJ3N1hzWjhUUjkz?=
 =?utf-8?B?VHhlUGFzY1BzZ3RqRG9kQjBYdGhBUktGOFg5QkNRdFMxNUtEMmtwZkxOZXd6?=
 =?utf-8?Q?WWds=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5831.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9182fe2c-6e0a-467e-929b-08db1ff1f243
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 16:27:01.4682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0AXjme510Aq5vrZUqDFMBiUz7tw4KdDMH4eZdSAF2n/kygIMci4W+jiw4CvNphtE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6411
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
Cc: Emma Anholt <emma@anholt.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCj4gSGksDQoNCk9uIFdlZCwgTWFy
IDA4LCAyMDIzIGF0IDExOjExOjIyQU0gLTA1MDAsIEhhbXphIE1haGZvb3ogd3JvdGU6DQo+ICsg
dmM0IG1haW50YWluZXJzDQo+IA0KPiBPbiAzLzgvMjMgMDQ6MzQsIFFpbmdxaW5nIFpodW8gd3Jv
dGU6DQo+ID4gW1doeV0NCj4gPiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmM6IEluIGZ1
bmN0aW9uIOKAmHZjNF9oZG1pX2JpbmTigJk6DQo+ID4gZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRf
aGRtaS5jOjM0NDg6MTc6IGVycm9yOiBsYWJlbCANCj4gPiDigJhlcnJfZGlzYWJsZV9ydW50aW1l
X3Bt4oCZIHVzZWQgYnV0IG5vdCBkZWZpbmVkDQo+ID4gDQo+ID4gW0hvd10NCj4gPiB1cGRhdGUg
ZXJyX2Rpc2FibGVfcnVudGltZV9wbSB0byBlcnJfcHV0X3J1bnRpbWVfcG0uDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogUWluZ3FpbmcgWmh1byA8cWluZ3Fpbmcuemh1b0BhbWQuY29tPg0KPiA+
IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgMiArLQ0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyANCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyBpbmRleCA5ZTE0NTY5MGM0ODAuLmVkZjg4MjM2MGQy
NCANCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMNCj4gPiBAQCAtMzQ0NSw3
ICszNDQ1LDcgQEAgc3RhdGljIGludCB2YzRfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQ0KPiA+ICAgCSAqLw0KPiA+ICAgCXJl
dCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gPiAgIAlpZiAocmV0KQ0KPiA+
IC0JCWdvdG8gZXJyX2Rpc2FibGVfcnVudGltZV9wbTsNCj4gPiArCQlnb3RvIGVycl9wdXRfcnVu
dGltZV9wbTsNCj4gPiAgIAlpZiAoKG9mX2RldmljZV9pc19jb21wYXRpYmxlKGRldi0+b2Zfbm9k
ZSwgImJyY20sYmNtMjcxMS1oZG1pMCIpIHx8DQo+ID4gICAJICAgICBvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShkZXYtPm9mX25vZGUsICJicmNtLGJjbTI3MTEtaGRtaTEiKSkgDQo+ID4gJiYNCg0K
PiBUaGUgY3VycmVudCBkcm0tbWlzYy1uZXh0IGJyYW5jaCBkb2Vzbid0IGhhdmUgdGhhdCBjb250
ZXh0IGF0IGFsbC4gV2hhdCB0cmVlIGlzIHRoaXMgYmFzZWQgb24/DQoNCj4gTWF4aW1lDQoNCkhp
IE1heGltZSwNCg0KVGhpcyBpcyBmb3IgYW1kLXN0YWdpbmctZHJtLW5leHQuDQoNClRoYW5rcywN
CkxpbGxpYW4NCg==
