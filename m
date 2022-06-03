Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640853CB7B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A243610E80E;
	Fri,  3 Jun 2022 14:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF2110E559;
 Fri,  3 Jun 2022 14:27:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBGl26kn7MvTsQd7aOJf9dbXC60YLRUKXfEYdWKiwPyTNVjIVXseq8V7EzoyoyAuvMPl+w8yiIafVz1d+DTw77nT5j9QsQCfuk2zMQIb8T/HlNoLBVOdw8CJdzVBniGsFSAPSVQrXChciJ56dZbAC2f+SATI17R/ZyHazbRt4+lK2NsDWC5+Mt1uj6AIs4+aWKDLRK9vBe/Y7lX3igpUyIDXQjurZa68kL85QDOv9WE+Cka6w+4E7X83zLlt/BvdU430lYxQDbFOS4gZJMPex8xgNVos5AoczOX9zrNkZfpRk1rW4Te+RC/m1F8DMPakNf6y6o6AOAaAfAig0rJtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NORGWeNRTUP44CaApcJV2UN8jOCTRWpqoj9wdac1iH4=;
 b=lf0kyGx1+QhwHnbUafvf3bPBpP0oI0hRPwAQsPfdwZOIyxx1XDzegj40+8wXVHK/aSCRO+QsPy2uCo2Cnc+c6k/YadVMZyiInCz8MaqWOkCCQflM9t78YTL+ucM0gK7Y1ERtATkcIsvgo+YhsBsoLTp27BQNOP5eWe3UwOuqiuemCZsu3au/yj5AlnMLtDMAvba27qFQ4oafebr4uhM0M4zuksMjAgTrqs3W7oNUNY41/zVvnpgmXqZAVLfSwDj/vtfCRjDKrtNRpDwk3PSLhhQ7DbPdHwzxl/suY22Lw6Z9+yw9KVx7RGfL4HtGTbUYJhYv6HSS+QI58bNUH/zWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NORGWeNRTUP44CaApcJV2UN8jOCTRWpqoj9wdac1iH4=;
 b=pACbScwIC7xXj3MNcETeNCYxS+N/Dta7Aic2co/JC8b7DonnvpxLnulzUoGhvLxP+rF/TC6E6mw0FdAqkYQzmOL8gvCrbisUSgD8FP42zcIvcj18DThqih9k4wAIKJsXqzcjTfR459UcW6GsNKDlQ/KECkX9Bj/iOU7xHB48NLs=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by PH0PR05MB8041.namprd05.prod.outlook.com (2603:10b6:510:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.6; Fri, 3 Jun
 2022 14:27:12 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::10c6:987:f526:83aa%3]) with mapi id 15.20.5332.006; Fri, 3 Jun 2022
 14:27:12 +0000
From: Zack Rusin <zackr@vmware.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Topic: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Thread-Index: AQHYdpeKjA+fIeSl9UGD1Oezsoj+Fa09u26AgAADaYA=
Date: Fri, 3 Jun 2022 14:27:12 +0000
Message-ID: <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
In-Reply-To: <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 737091bd-bae7-4b48-a603-08da456d2684
x-ms-traffictypediagnostic: PH0PR05MB8041:EE_
x-microsoft-antispam-prvs: <PH0PR05MB80410BF8C5CD6F19D91F5AFDCEA19@PH0PR05MB8041.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SkOXthtx90pJW/ZvgH8muUO29BYd1YiOX0Gpxs1timSK3YvSqVRwTm7eRdVMUEGPL21QkiYcTENWFJJZQOIXb1BPmN/ojNESoRxu4Ll1qz0BP29Anpd31cNPUAmnbVVATxbBarsPswh7fvkkY5jabRMxQWA1LEconHtcj8XTBkeCPWvNdeJjab4nyhL2ApO+og4V/+LiEXKCAbkWIrSET0rjUtUrpO+5+Yyhb97fVQhhIt9imj7IXZWf7M9lEzzDc1kM5pdUFfmIoBtBcnMMXGy8/gchFlfWUPkaVsicJhbJfShY8hVTfmjPh/iDrSJPXcdqWkTFL7XBQaqA7Wj/vopxPqzWtLmkvD68Dw7cN/A1FHPSHDP+agYXQkiAciLaV8BkPne4UtdoGTVCNjQNKJZYBZNU4F87HGoe1d3MGD6Jyt9deHy+93kBNfypypbBgeIyPPDuHhDY9JJy6pDIV9+Vifu+JfyIpOD/YoRWAPszrXrHDhSs71HavgRaryBKuVRNe7ffAP9gNMHU8RZh/VM7OurEnpAC3z1x9qSCPc4Q9GGxBlrEfxlESP22z8AqaH9o2V5CqucsmfGoLUJs/UqWVhmWo88bvSSA9GoMLfpu2wq/DSvmIeII/Bk/ekO6mhbazdp48I4DeKOWoh8+mm8L2a1sjnIdF7jxRqjtwc4hspTuaNF52WXloCRs0yO6/QY/vQGkxHzVdSGVCrGFBKNQIUUWKpgESrXoas6hOkfWILzQYJMwhPBPANYc2DgHe0Zx7phfCRaxl8dxhkXeakhJMsF+rMfPgBWJrFPGhQs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8676002)(2616005)(2906002)(66446008)(508600001)(66476007)(66946007)(45080400002)(316002)(6486002)(71200400001)(36756003)(86362001)(53546011)(966005)(6506007)(6512007)(6916009)(26005)(54906003)(8936002)(38100700002)(4326008)(91956017)(33656002)(66556008)(64756008)(76116006)(186003)(38070700005)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlhOSEdGS0x0Vk5XY21qcVd2c0hOL0lqZGRRUWdPWGpFN0R3TEZ2WDk3VXJt?=
 =?utf-8?B?YXFKejZod2tDTm11WlBhRFpzTGFPYjd0TmthWG9pSkJwK29tSjc3Ym9HOTJr?=
 =?utf-8?B?VUNtMFZ4aTZWRGMrSWFZVVkyRCtyR0RxSjlXOURwbXpTUTJra2p1bTBFTEJW?=
 =?utf-8?B?SkhLbG1QRjNrZzJHZkg0NlB0RDJtLy9FU0p5RVhkRXBHNkdjbDMveDVkK1oz?=
 =?utf-8?B?UnFhQXZMclpnWmE3aituZjZVeEkveVZvVERjWlpxem54VFo3Qi9oU1pOZjV1?=
 =?utf-8?B?bVVsZXBVcS9jM1ZtOVVtU2lhemJqeDNwMXRlaC9VR0FjM0FyY0Y2RjJYUmtT?=
 =?utf-8?B?U3hreVRyeForZUM5WTNJaVA4blNpU0FIdHJxSnVKR2pnRWoydHAxUnhMU2dM?=
 =?utf-8?B?K0NmMXRzYnJQOVlNam5KNTNhdmxEL2taV2lGcTZzT2dZcGZQRmI1c1BxOVVE?=
 =?utf-8?B?NUtUOFMzTlVSMVk5dDhoeHh2UE90Vlo0ZjJ5djIzMk5teG5FeDFmZTJWelhG?=
 =?utf-8?B?N25UcHJ3UWhrbmNqK3hFSm96Rnp5b1hQMGtObk9OU250Y1BMc2NlcEhCS2Ux?=
 =?utf-8?B?c1FIakxkbHAvMW9DNDI3cWVpODV6ejVJTnIvTXg4cEJYYjNUTmNCYTM4ZVNU?=
 =?utf-8?B?SWhVc0Nob3EzeHFEZzh4emtoUER0dnB1M1UwaDVJZmRGYUhPcEJHd1NlY0J0?=
 =?utf-8?B?RGxuSDkzbkJ2QWdNbDlTK1VVdWxSWlg3a1BmTENBQSszRmIyWXBFbU1GY2Ra?=
 =?utf-8?B?dnUvN052QVovS0lPV0RhUHU4U2dTM0Q3R3VOWXNXTnpmd1hOSCtZbENwcUl1?=
 =?utf-8?B?N29Kam1BaTZvS3FTZUFRaUJxdDE1VVUyTFhGbVBJNElORzNRMGovTHRLYVg0?=
 =?utf-8?B?anJCdXVaTE5pN0hBZ0t3VVB4RlU2c253OUpydVZhTHJUQVFVUUlMNXhFT3Zz?=
 =?utf-8?B?R1Q4MkpacnRmMWNnbzJFY09CYWFWNkxxSVBYVUZmSWJlb1ZzK1pvQWxBVEht?=
 =?utf-8?B?RDJUK2ZKU3FRaEdtSFVBeTdibm13RzJ1ZldWVVF3Wjk0R2dJZmN0bUhsOE4v?=
 =?utf-8?B?VjI5SkhkS3pvdzcvTmJ1MmVpK01ZMUFaa3d1ZXF6ZzMzL0VZRGdqSkNKeGxR?=
 =?utf-8?B?YmttRE9kTFp3WjkzeW9IYk50V3ZpTEJKblJNUlhvbFRTU3FlZUEwalluZG8y?=
 =?utf-8?B?Tmo1dnhUK2xmQXFQSnhOdC9pTEliamFIQ0VmTlNSQ3dqVm1WYUhWWFVLQUVh?=
 =?utf-8?B?elppcEkxdzgrd0M5amtiTlg4azc5NTJhazBEZ1pxTXB0dEJ2RVNyMlhUaENO?=
 =?utf-8?B?MllST25jN21tTzZ6aDB0alpNQzh0SSt4cnhCa080SGRJSDRYaHUzWUR2YTB6?=
 =?utf-8?B?MXJkMTQ0RmJyWGtoNXBzRGpwNnJjNVBVZmlQelloVFRIWUNmc2VsOWdSWEtW?=
 =?utf-8?B?ZE5Dck5tcnVSc3pscEIrNXgyTytnZmR0c2ViQ2h2SEJUakZ6dkJqRjcwaGtv?=
 =?utf-8?B?Y202MG1iQ0o0Yi9JTFpGOTF5bGY3Wi9lbWZIeUFGYk5xa2ZtOHdXL2VyWUJS?=
 =?utf-8?B?R2l0YVF5WmtKSUhyVTdQRnRiMWcvVEhOUmtjZEpxbitla0RyWk81bElKcUMr?=
 =?utf-8?B?YmhnTnJCcGlkaG1yemJ4OE5La0RheC93T2c5RnZ1NlZGLzdtUWdSWWwzSm95?=
 =?utf-8?B?NnJKSDMwa3VmL2JieWUrV0IwZlVndE1UUy9UUlh0TkpZOXkvWEt0elZlSWFy?=
 =?utf-8?B?Wm8rUXZJZjVXNFFLN0NReDhoeEsxVnZoK01IYmV4V2xMQzU0cFFsVDU1VHph?=
 =?utf-8?B?RHdLN2VLR0wwME1mMGttOVd5ZGwxc3loYVBLdldlMWlCV0ExUEJkZWRDZjNG?=
 =?utf-8?B?aVJiNE9nZkdGd01BOWxBRnVoTVRmbC9neGtNcUF3bXFtRmh6bThRNm1RM0tV?=
 =?utf-8?B?RlNTU3AvRHV6amx5Wmc0WXUyTkQ4ZFR1RlFOeWNubTZTOVJWZHA2cEdHWVcv?=
 =?utf-8?B?bFFyNjc1TFd4cDBNY0hLWW11MVBEelB2RzYxcXRvdkN5QjZraGJsQmFGdVlQ?=
 =?utf-8?B?NGVVZUtiZFJodXhtM2svQktiWGZxNDI2NjZkN21uZ2llbnBuN0x0Nmt1UEM3?=
 =?utf-8?B?amFHV09vMXNNaUlIbWErRUNvUDNSMzB0NmtFTnh0MG85ME50b3FJT0xUTU9X?=
 =?utf-8?B?OUwwTEdTSU9UWnd5MXZyS0ZSeWtYbHd4a2VRYlNiOThhT20vdE9tNnFnanhH?=
 =?utf-8?B?WmZkN3NlSWhzejdXb1VJcW1Ed3RLN2JaakVlbU9oQ1hHWEtMeEJ5WG9lanN3?=
 =?utf-8?B?MnBuTWlkc2hzNENGcjZDUlVCdTJBaUVYR0Q2a1ByUUhLVmE5TklXQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91DD46542B4CFC4BB56D1B3F9B56909A@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737091bd-bae7-4b48-a603-08da456d2684
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 14:27:12.6169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKkeor3kG8Vmnaq2QCTgDQXO28CJNGhUmFzSZRJwHXOyWg0lHVtqmDRGF9voSnCrp/w7Mg2Wq8EEzdBMfVIcAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8041
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
Cc: Martin Krastev <krastevm@vmware.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IE9uIEp1biAzLCAyMDIyLCBhdCAxMDoxNCBBTSwgU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gUGxlYXNlLCByZWFkIHRoaXMgdGhyZWFk
Og0KPiBodHRwczovL25hbTA0LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZhcmNoaXZlcyUyRmRyaS1kZXZl
bCUyRjIwMjAtTWFyY2glMkZ0aHJlYWQuaHRtbCUyMzI1OTYxNSZhbXA7ZGF0YT0wNSU3QzAxJTdD
emFja3IlNDB2bXdhcmUuY29tJTdDMDUxNDFjYjgxMjAwNGU5NDdmMDQwOGRhNDU2Yjc2ZTIlN0Ni
MzkxMzhjYTNjZWU0YjRhYTRkNmNkODNkOWRkNjJmMCU3QzAlN0MwJTdDNjM3ODk4NjI1MTQwMjM3
MDI4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0MmYW1w
O3NkYXRhPSUyQlpVRzBPRkM1U1hDOCUyQm0zRDkzQWxpVDBWTkpIYmMxQUV3bmhWQW53OFdRJTNE
JmFtcDtyZXNlcnZlZD0wDQo+IA0KPiBJdCBoYXMgYSBsb3Qgb2YgaW5mb3JtYXRpb24gYWJvdXQg
dGhlIHBpdGZhbGxzIG9mIGN1cnNvciBob3RzcG90IGFuZA0KPiBvdGhlciB0aGluZ3MgZG9uZSBi
eSBWTSBzb2Z0d2FyZS4NCj4gDQo+IEluIHBhcnRpY3VsYXI6IHNpbmNlIHRoZSBkcml2ZXIgd2ls
bCBpZ25vcmUgdGhlIEtNUyBjdXJzb3IgcGxhbmUNCj4gcG9zaXRpb24gc2V0IGJ5IHVzZXItc3Bh
Y2UsIEkgZG9uJ3QgdGhpbmsgaXQncyBva2F5IHRvIGp1c3QgZXhwb3NlDQo+IHdpdGhvdXQgb3B0
LWluIGZyb20gdXNlci1zcGFjZSAoZS5nLiB3aXRoIGEgRFJNX0NMSUVOVF9DQVApLg0KPiANCj4g
Y2Mgd2F5bGFuZC1kZXZlbCBhbmQgUGVra2EgZm9yIHVzZXItc3BhY2UgZmVlZGJhY2suDQoNCkkg
dGhpbmsgVGhvbWFzIGV4cHJlc3NlZCBvdXIgY29uY2VybnMgYW5kIHJlYXNvbnMgd2h5IHRob3Nl
IHdvdWxkbuKAmXQgd29yayBmb3IgdXMgYmFjayB0aGVuLiBJcyB0aGVyZSBzb21ldGhpbmcgZWxz
ZSB5b3XigJlkIGxpa2UgdG8gYWRkPw0KDQoNCj4gT24gVGh1cnNkYXksIEp1bmUgMm5kLCAyMDIy
IGF0IDE3OjQyLCBaYWNrIFJ1c2luIDx6YWNrQGtkZS5vcmc+IHdyb3RlOg0KPiANCj4+IC0gYWxs
IHVzZXJzcGFjZSBjb2RlIG5lZWRzIHRvIGhhcmRjb3JlIGEgbGlzdCBvZiBkcml2ZXJzIHdoaWNo
IHJlcXVpcmUNCj4+IGhvdHNwb3RzIGJlY2F1c2UgdGhlcmUncyBubyB3YXkgdG8gcXVlcnkgZnJv
bSBkcm0gImRvZXMgdGhpcyBkcml2ZXINCj4+IHJlcXVpcmUgaG90c3BvdCINCj4gDQo+IENhbiB5
b3UgZWxhYm9yYXRlPyBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gaGVy
ZS4NCg0KT25seSBzb21lIGRyaXZlcnMgcmVxdWlyZSBpbmZvcm1hdGlvbnMgYWJvdXQgY3Vyc29y
IGhvdHNwb3QsIHVzZXIgc3BhY2UgY3VycmVudGx5IGhhcyBubyB3YXkgb2YgZmlndXJpbmcgb3V0
IHdoaWNoIG9uZXMgYXJlIHRob3NlLCBpLmUuIGFtZGdwdSBkb2VzbuKAmXQgY2FyZSBhYm91dCBo
b3RzcG90cywgcXhsIGRvZXMgc28gd2hlbiBydW5uaW5nIG9uIHF4bCB3aXRob3V0IHByb3Blcmx5
IHNldCBjdXJzb3IgaG90c3BvdCBhdG9taWMga21zIHdpbGwgcmVzdWx0IGluIGEgZGVza3RvcCB3
aGVyZSBtb3VzZSBjbGlja3MgaGF2ZSBpbmNvcnJlY3QgY29vcmRpbmF0ZXMuIA0KVGhlcmXigJlz
IG5vIHdheSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gZHJpdmVycyB0aGF0IGRvIG5vdCBjYXJl
IGFib3V0IGN1cnNvciBob3RzcG90cyBhbmQgb25lcyB0aGF0IGFic29sdXRlbHkgcmVxdWlyZSBp
dC4NCg0Keg==
