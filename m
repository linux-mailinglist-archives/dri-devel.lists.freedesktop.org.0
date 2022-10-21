Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6CE606CE9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 03:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA60610E4D2;
	Fri, 21 Oct 2022 01:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eastusazlp170110004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FFF10E42A;
 Fri, 21 Oct 2022 01:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jskh8nc7aJ6d+Y1fm0yfdBp8OBPvMafxVPzsOf6+9z5SeFWxnbY4mk+6Q37DFw0U8fW5qKDn0VbbSLew40H7fQ/ovPGwTvxItJPcUaaWlMUfw+o/5/XB1x3Ft2rAcpA2EyeswormnA3edKMqHaG0m7TsbBDMpbF5dic0RnorBX6rlwmetXHmJ1UrfCrV2czwCuLRGT4ySAR2uOePMhqgh5d08jiqwlJoD9DkgP21lPrHBKSOW2qK0fPd8iOfUJf2Fb/3vB54GjQej8zmJRU3iTFL28FSaM9DMjvN6OiaU9+vOEmGXX2FsjRzfeMQe/J4fZ6Xfr1fRoNZ+M2abfTjwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81P7vsT8Xwl3FLMKqdQZdB9l89VcyMvVKv/Q50583FA=;
 b=etp40x5rFmhKeGPK5tbY5VPcOqtHdOAhcvKQN5nuIgGt0traCSMdgHeFIE7g/jqM5ssPeYgpxfzai40usEQ8Go8C5gfcH50rJkN6oEGaCzTQlXbNpenpzjf/KZVUs6NobVPOcIenpKaPpXuYdUOeCsy/mEq1Eo0EW6bvDk6Xro2/8y2VyyXXGj0rqnnTJ1PNmDJEm+nEoL6QkZ0pRIlDq7BxMgsjZK6sxmnXoGOKW9dgHV/cqZOnNrnNlhz0ODaHL1J0D9dInqFlcNhPKt1l78QNsgb3uzAkecP0W7jyCENyfUlNhUl/Zrh0n6SzTmmBUwzzEFwogw/UrG4KSw+8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81P7vsT8Xwl3FLMKqdQZdB9l89VcyMvVKv/Q50583FA=;
 b=dh0iRO7KunsZM3AR3gcPa5xVbgoR3r/odvJwWCpfA8On/xfeU23xoAg60QNVsfJLm3DsRpnS/TTwEMjRVK6SsUhdlF7jY/w3zkh87iL+jAxtWPN9Qmdav3h1GK1L71SfJP1/VMkLuMjwcn8SDmQJGdf4IfT3ij5xmVjuXhPQT+c=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by BYAPR05MB6294.namprd05.prod.outlook.com (2603:10b6:a03:cf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.10; Fri, 21 Oct
 2022 01:11:25 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::d893:b27e:529:35ae%7]) with mapi id 15.20.5746.017; Fri, 21 Oct 2022
 01:11:25 +0000
From: Zack Rusin <zackr@vmware.com>
To: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Thread-Topic: linux-next: build failure after merge of the drm-misc tree
Thread-Index: AQHY5OBxrA8oizfR2kqEvPpC/wzSg64YClIA
Date: Fri, 21 Oct 2022 01:11:24 +0000
Message-ID: <766bcc80a2b5d395a4606d27f0032d52fea22dc7.camel@vmware.com>
References: <20221021110234.51f9ab66@canb.auug.org.au>
In-Reply-To: <20221021110234.51f9ab66@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|BYAPR05MB6294:EE_
x-ms-office365-filtering-correlation-id: 623eeca2-533f-4582-69fe-08dab3012c97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XVv/p9jgerQpzKq4UkeLknFieEkPzBTrYqtF1nXDixw80Bbsk5cMvRNapV7iBjjrt24vLfkXG7IRrGulSesuihrAe2OBy0TJ+Ar5fvfKDkMJrCL9oujf74075HbqeB5dJWM/k43u/4D5amkmfHDfPXsAfqBNF6P/uJRWPAbk4Sp1E5m2Uoxu2gL0iuS/Rp+kgbdDMZ/JkdfBit8S0EyLrfCyfwzr8bMDYE4/ohLJ8S2YALvkIS9brQBOq6nT2sBolcLvOuMpSRNVAYBr2DHXx8Q3iiyHo4D+lk3yrpq9zK+QvDznKXSsR92R/oIsOq+QfZLghcwt3sJwZAwlhu3SGYeHFDXSkNuqH8doLho2FFXPxnxSm+O6pU9anhpWEm6uTleaaS2eJBXHhZ414ZbMkhQH6+rUYtqmwbpsXLmc5zXKBOVCoRbDTXv+cQlBTWY3wz7Fp2Nk7luGFquxNFe178isMvO3HxJoI4UmNhvp/brLubXy/y+KwoxVto3Aw4rzVwIGcot391mihtMF0/JgiAI0VnFFhioNzAqntPW0Xggps8sys9AEeu5+QxOEWu8rpxofcCf4zCJDi6zoDSgj5aCLmu0NiO32jzVHP1fG8a3izBCb6bltSsuu8t48BgxeUl9iJ7k4sKMowacbeHQrkvoO+/zAeY54IKlX9APBMPenwDOFv9OFpiTheTBsCxS9GxGSLTAMJOs2nfGmTVsD0a3ZJqxoIUeGR9V6xmkzqNe2BxMH8vd1zpDm0dKdUj4oLi+INZTGu4Y/CtcgG5Dj0g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199015)(4001150100001)(66946007)(110136005)(316002)(36756003)(38070700005)(86362001)(38100700002)(2616005)(26005)(91956017)(66556008)(8676002)(4326008)(186003)(6506007)(122000001)(54906003)(478600001)(6486002)(5660300002)(4744005)(8936002)(6512007)(66476007)(71200400001)(64756008)(83380400001)(2906002)(76116006)(41300700001)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTFpcmNjQU1jSnpHN3k2cDRRMlFTMm9HTzJkSTkrQlY2d2VqVS9EWHN2a2pL?=
 =?utf-8?B?VzdFWjlnWkR3dXVXWXZ3RjU2dE5VYk51U2M1RjVZcnlkSGcwMEZVYVhKWS9C?=
 =?utf-8?B?OGpSMm5tRHF6WGNrSEhoM1k2K2pQTEZ1dzJ0VklHNDJuMEhBOFl3VllPeHZ4?=
 =?utf-8?B?V2ZIWVQ3U2hqS3NPTHl0NFQrUDg5ZXk4ZFZ3REVsYUEvTHlDbFhwTUU5bDlI?=
 =?utf-8?B?K3FzejFqTU5kZlFDK2FubDF6L2QrT2o0b1Fhb0F2SmRESG51cXk1blZ6aitD?=
 =?utf-8?B?MEZWeFRMdkcwWWNJMDZFTlpieXN2enVzYU91dDI2YUE3cktodFE0RHVrSG1Q?=
 =?utf-8?B?VE5OSUoxOExFeWJCc1czTWNRVm4wYm5ZYlpOd01NR1RlNCtUcVBJTm9lQVAw?=
 =?utf-8?B?dEJsMS9keVNmTm9BeitTRWRZcWFUQ2tma3RiK2hhRFduVWhVSzl5TG1EUFla?=
 =?utf-8?B?S1hNQ3pPMEdmdER6Q1ZuUEZQZkVtMFJhTXhPeHhDc0dTUW9LVE96dFJuQUVO?=
 =?utf-8?B?K1NlcW1Ua1RrM0NEQTlJZnpSaUVLWTJiZFZmbU90QTBXN1hFQW5EN0plL25D?=
 =?utf-8?B?QlVOZHI5MGZkblZTUDlxbXJLVE85TVZTSVRUWjVRMVBIMUhIeTFaVk1aS2ZG?=
 =?utf-8?B?WUMxbnE2dCtsVEEyZGtIblJmSXVVU3liT3RaQk8zNEh4T0ordWFKb01qKzhJ?=
 =?utf-8?B?M2RXc0M1MTJjOWltZS9rT3dPOTFFRVFsTG94MmZUbVNFU3BEbFduYTFzWlRG?=
 =?utf-8?B?RjFCVlhobkJmNDBncmtvWWp4S2lybThqNkI4NWxFMmRrZ1BpckJDOTVGWFVW?=
 =?utf-8?B?TlVoVnUyRWNySEVBeTRJSEV3ZDNqaFhENGdmYWVDRUd6a2w0d0kxK3cwSmJz?=
 =?utf-8?B?VkFld3B6L0pnWG1UZjZZcWxhbERCSXNEa09oNzFaT0NvWlVoQlJpNmR3RzVZ?=
 =?utf-8?B?Y1ZRM3JKQkVZejl2UGFuaEJhb2VrL0JzTFFEc0ZFQ0NGRG44WElSVVFrbXVL?=
 =?utf-8?B?bS9VTmVDak1KdzFCZllveW0rQnhvZjNNWjh1aTNaWXRid2F1eExXWXRZSlVE?=
 =?utf-8?B?bTcrVllKMGYrMWJzSS93cFpvUFRRaGJQUU0zYjFUaVNxK2xCeG1GdTVpV2Uw?=
 =?utf-8?B?VWwyempEeWgvU2VhL08zV2Z0YkhWYXlHbXRPT0tWd3hZKzhQdCtlRGpucVNz?=
 =?utf-8?B?UkZGWmNnQ2hzUmFpcVBxNDhCYmlyTEtzbHFQeFFkaXordlVqMzN6UEJ6VWll?=
 =?utf-8?B?RFc0cVB1cHcyVFE2ZVE1RmU3TGtiZ1hpaFNBWDdNREFkUnRCSG1ncnFseDBn?=
 =?utf-8?B?eU13ayt2RlpZdUp6Q2lCdHVwc3hqVmRNTVRRL0ZNbjlJZ25PMDBnRDUrNzhu?=
 =?utf-8?B?a0NHQXEzeGU2amlHbDlwV1pqNmp5NnNNek1VeTA2YUhHZ2RPYXowTVJhZk9w?=
 =?utf-8?B?L3RCTGpNTzdBV0hGdUx0eXJoU1M1WmNsalhoWHg1TTJOanJPakVmbC85aTc1?=
 =?utf-8?B?eGc1WVJSczNuTjZiTitTOUlweXFXYXRIZGk0TGU4SmpXR3ptZi9hRlNRNlBK?=
 =?utf-8?B?K0xMVllXMU9SY1pGSEtHdVJkL3JOeCsyVE5XTy9HK1ZUV3IyQzFXeHNTVnpZ?=
 =?utf-8?B?MmhNUU9hZ2hjZ3Iwd25sbmkycXZCMmZrZjJpNEhRUXRUbFZnMmpHcmZUUDlv?=
 =?utf-8?B?cDQzcnFyZ2E4d2dZcG9LMGdTQXJkWTd6UXRvNUdMOUV6T2Q4M1psODFRemNu?=
 =?utf-8?B?ZUs5dmZIaU1qcmZxQi9RQi9WQ1laemZtTjRvaG5RUDg0RHk5a3czeTV3UTRj?=
 =?utf-8?B?TjVZMU1Qd25sNHI0ZTJkTnZOT1NSSTVsMVBFeHRmUHVFWjdYZThqWTBGaHJX?=
 =?utf-8?B?MFRxS0U2OWJJdEJNU1g5ajJoVGV3NzVtSnNSVkptUmp2UEhNTytkWkx3dW82?=
 =?utf-8?B?S2I4VUxKL2V0dFVDazhLeldGNS9lTWczWERtYSs5eXZXQk9oVFJzdEI4TDdW?=
 =?utf-8?B?TWhMVm5IR3ZoU1JiLzlsWllwOVp4c3JYT2syc3JyVnBLVVJUaHVBWG1rRUlu?=
 =?utf-8?B?V0dMb2RhRkcwb2FGY3NxaDlvbStvbGlDYmVxaExSUXRlSU9yYldJY0luR3dT?=
 =?utf-8?Q?zCwR+8kPH2BVlJIgk+zT76LmV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6091B9487545804390A025956804F42B@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623eeca2-533f-4582-69fe-08dab3012c97
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 01:11:25.0650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gBiEV1X/wEXyrLczEdRmM481f5r2e1JGEtmgEZ7H5J58tvDcYwm/0UA/HNjSB/ikR9k4uxrYWCU01e+ts+lLgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6294
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
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTEwLTIxIGF0IDExOjAyICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBBZnRlciBtZXJnaW5nIHRoZSBkcm0tbWlzYyB0cmVlLCB0b2Rh
eSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NA0KPiBhbGxtb2Rjb25maWcpIGZhaWxlZCBsaWtl
IHRoaXM6DQo+IA0KPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYzog
SW4gZnVuY3Rpb24gJ25vdXZlYXVfZGlzcGxheV9jcmVhdGUnOg0KPiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYzo2NjI6Mjk6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg
J2RldmljZScgWy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQ0KPiAgIDY2MiB8ICAgICAgICAgc3Ry
dWN0IG52a21fZGV2aWNlICpkZXZpY2UgPSBudnh4X2RldmljZSgmZHJtLT5jbGllbnQuZGV2aWNl
KTsNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+DQo+IGNjMTog
YWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQo+IA0KPiBJbnRyb2R1Y2VkIGJ5
IGNvbW1pdA0KPiANCj4gICA3Yzk5NjE2ZTNmZTcgKCJkcm06IFJlbW92ZSBkcm1fbW9kZV9jb25m
aWc6OmZiX2Jhc2UiKQ0KPiANCj4gSSBoYXZlIHVzZWQgdGhlIGRybS1taXNjIHRyZWUgZnJvbSBu
ZXh0LTIwMjIxMDIwIGZvciB0b2RheS4NCj4gDQoNCkhpLCBTdGVwaGVuLg0KDQpJJ3ZlIGp1c3Qg
c2VudCBvdXQgYSB0cml2aWFsIGZpeCBmb3IgdGhpcy4gSSdtIG5vdCBzdXJlIGhvdyB0aGUgYm90
cyBhbmQgSSBtaXNzZWQNCml0LiBUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdyENCg0Keg0K
