Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D67845D4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 17:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1970110E398;
	Tue, 22 Aug 2023 15:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF0810E396;
 Tue, 22 Aug 2023 15:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnDVXAEb9pp72mV55bhQRgJ3oBiFlGaustViNAzzDhN3QhJTxxjx4N6V6oy/fRHT1jqNMZlcCjBIIeOeWC0E3JsymYAtq9VLRw8JFaP361stexElj8TmGP9f9fPXlTaK2GT1eO/kzi8/IsEnSgJO62zmXmgauvE8ZTGBrRcB2IT3j0g/2IB0hg3ZMztWTx6opHg4Reo64aWKQypdmD0DMCFP7m7aflY82v6EQgE/tjugL6eAtwBWeyizTRI1CUkEhrWW9IZyoSBhxxpzdX9s5uUBzlLmBeIXxot+ff0ztMm9mZ4i0DGI1hZudV6fqTGVP1h6AlZj5VaUNzrzkBdEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWs6DDHmpzimPLIzq7owUBcWmm4Os5ekSg4kPPEX15A=;
 b=P5CtQzwnX3Q3r5uRqQW73asmDbJWRpYLYudcSN7Rukeof2RiNDvUcygG29XHi+IH6U3ftBo0gUPYuanyZ8F2+swwRWB2/kgKfx19RjEk83TUpf4vL4DPBclwB0qcLs9MRPV2i0uYNASEPY0n18gq/LLCf8PjG5XzueyD78tHIwX0bYBPmRZ/aYserHZtaGP3JP3tXZD+SUITd1y/or3301kb75sOPUYnbIkl2k/e4WyNZp3ETbnt69fQWR/b4y3goim+5QbNFPldYD5KuchOLgbsxnmg4c3D/o7Tl+1niM8lblA8lquU2D9l3hdtStFHcEnS0pc0+gI9/tBOIyIg4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWs6DDHmpzimPLIzq7owUBcWmm4Os5ekSg4kPPEX15A=;
 b=2WZYIg+v8KpE48eYDTt14JLAKGOK21eqsUVnlJku5fQy8FmC93pl9N24Y5LXcR6S1atESEhSbfQ9JUib4ik3Fxo6zMsWUoiM+xWPEmoplbpX3kq7o3oZ3+dx/xLVhfeZvlkpA+wOljRVr3TapW8i7NMcK4Bsbn/vFNMaCw9Nt7k=
Received: from BN9PR12MB5146.namprd12.prod.outlook.com (2603:10b6:408:137::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 15:41:18 +0000
Received: from BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe]) by BN9PR12MB5146.namprd12.prod.outlook.com
 ([fe80::858f:e2c1:3f1e:fefe%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:41:18 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sasha Levin <sashal@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH AUTOSEL 6.1 08/10] drm/amdkfd: ignore crat by default
Thread-Topic: [PATCH AUTOSEL 6.1 08/10] drm/amdkfd: ignore crat by default
Thread-Index: AQHZ1Oz2K5/DU8VzoE6tCep/WzsKHK/2c/iQ
Date: Tue, 22 Aug 2023 15:41:18 +0000
Message-ID: <BN9PR12MB5146E3C94A2A6CB87138B2BCF71FA@BN9PR12MB5146.namprd12.prod.outlook.com>
References: <20230822113628.3551393-1-sashal@kernel.org>
 <20230822113628.3551393-8-sashal@kernel.org>
In-Reply-To: <20230822113628.3551393-8-sashal@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=621ce9a8-c81c-4322-b095-aa46689fcef0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-08-22T15:40:06Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5146:EE_|LV3PR12MB9188:EE_
x-ms-office365-filtering-correlation-id: 15adb4ac-d526-42ef-8368-08dba3263a11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zgyRstBrIo6woMWHcyWYb1bPBJLMJOP6AEODplp4mi6lTOPYPcH8UG0YeheMjG6iomSXoxqF/kCmBHmH43dJnhO9XFu9HB7LtAff7XAGCd8RTfnu8DMj5USiHHp+key1h9jqgwGB7BR6vy5uknQV2and8V4nkc6/06W9aAwlwooECB5C8yktxxSpyalVRzT8I6BY1CbTsASmwTzZKIEJZIta51r2Yl3m/AcDFkz1AmWUUnxJh+sQEIujs8wR/GYi6R0mPTBqTltgy7YL9TeVLMgTmAhAzoRSmDizJG2JZLPTJFVpuGyuCkeQS5YfL2zmN/el+xsd0fLSUwfVQNRB8+SzE3rXsxbIKe33nIugLC/oMzJa8xSaPkgBd0KuW7TS4m/83nZVo7Q8mwNFa3T7oyxFc7v1h9ux6nCi+CitZw+aQpMtLXxpwIMzhXq/9g+OQLieneVkAChvM3xOnXCzelGUv9vULQW3SuoQkMyJBg8K1lcl68d6OOQjlCYHo3bgcSDCt1EdbCQnO6xtYmElo2YgSv7yKHk627Qh6lkKSqQaRZO1xKTxDfOeTY9JqVf9tEcMN+p97IWvloOpMJB3QixXyFsi8Zj2HsBR11AdOe9ybmOYgBlcLhuDy8Mcozss
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66446008)(54906003)(66476007)(64756008)(66556008)(76116006)(316002)(9686003)(110136005)(8676002)(4326008)(8936002)(41300700001)(122000001)(478600001)(55016003)(71200400001)(66946007)(38100700002)(53546011)(6506007)(66574015)(2906002)(83380400001)(86362001)(7696005)(38070700005)(5660300002)(26005)(33656002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFBqbmh6S2tSeHFPa0p1VnRTQ2dhRHIvd04zWDgwd3FvV1kwK0dRZWNVUzNQ?=
 =?utf-8?B?UFJwUC9WbWdGTlJUMmFUZFpFblY0Tk5kbjhNbWhoL25sTGFxWUZtYkdIOG1y?=
 =?utf-8?B?VUhJMFdaZ2wrSElLZWo5VDE0OEpGKzQwS1pMWURsblc3dXJLUW1ZaThUQXF3?=
 =?utf-8?B?N2R0NmIxbGx5TU9xZkpQam5hT1N6SjhsTFRQQ1Awams5VGlYdkhjekd0eVVU?=
 =?utf-8?B?Y09VU3ZPc05TWlk4RmZhdmpoM3hkVC9iNWF6bFFReE53azRnLzdpWUgzMFNy?=
 =?utf-8?B?SjdIOTVoTlhCMVhxNGlTelIwR3QrdDlNbmgrc05jU1BqVWdNSEJJT2FkemMy?=
 =?utf-8?B?Y2NwN0dIQTNONGZvRWhxTTd1QkVNOUdrL1RScGs5ZUozOUx1WUc5MmpvVzBt?=
 =?utf-8?B?dEdMdjZiMEhIcS83SjRiMmx4MFhjZE9Sd3A4dGFWQnp6VTRGSWpPRDBuNVJJ?=
 =?utf-8?B?Wm41UUd2Z0FGZjQ3L3ZMNnNtZWIzUUdldGE4SVY3MG10TXdDMmF3cElYM3d6?=
 =?utf-8?B?YWg2aWREWWlxK05WcEJkZFkvM1czOGhvUEVmd1BWbnJ5N0tiUGpjZU5Pc003?=
 =?utf-8?B?bHFWekNEb3ZKUERkMzlNVWZhSmpDSnZ1cTY0azNoSThNc01YSllCbERPUDZ2?=
 =?utf-8?B?a1l5MGppSXVaTlBOdGVWY1ZESE85OWRFNzNmSGZDZmlYcmRWWXE2L2ltalI5?=
 =?utf-8?B?ZW9mZHE0UHZKZ01SUzFhN1o2N1FlQjlqbVR0U1B3TmdRVlpOcUtqZFBIWDFW?=
 =?utf-8?B?dUd3TklBWmxvMFZjWTZQMi81SURVaDlUb0R3WllLUFJGQzJ6OXJNdG1YYmo0?=
 =?utf-8?B?eGUrYzZQZVB1UDQ4SWIvaURRZEZtWW0zTGc5R2JaUHg4M01LVjVxRzk3bmxs?=
 =?utf-8?B?WjcxL2R4aUJBcWJMNE94OFI3T2VEUXVpSVp3Z3N6L3k2TDFhbGRvWndhL2ZL?=
 =?utf-8?B?TTFzTGRQU3NHVHlVNnlKRnBxOXM5eEpjTEYzdWxIZ050aHc1a24xTTZPeDhX?=
 =?utf-8?B?MlpUTDZ5eVZtaHNMVFUxWHF1Z3RSRVlTRG9SRkxoUFBUM3JZblV4QjZIYUFT?=
 =?utf-8?B?V2hqYy9ONWxoWFBzMmNMdENJdHFBMUFYV2YycWJVSkIvNUpLMHZscWhWdWVR?=
 =?utf-8?B?M0V1b1NlSGc2dWJMNzlBMGlzVlluSkpnQVFyK21ESGZDNkRPSEFrV0x0eVVi?=
 =?utf-8?B?TDlTdCsxdEpRb2tVV1BhK2I1cmdxZ0FRVlNJd3Q1VFgvYzFxVkxKeWxtZDJ5?=
 =?utf-8?B?YjBqbjRzekRKNk5kZmlBVnM1ZkgyRlUxMElMakJmaUUrd1pYS3c4TER4S3lo?=
 =?utf-8?B?WjROaGxKVVhqaW1PZjBDNy9udUhvOW5wOEJjeDRwTDFzOHgrbndWeTNHZUo1?=
 =?utf-8?B?OU5mRHlNQ0hXaHJKT21RbnJDeDl2dWhTZ3l3cG5XdGt6TjRHZ296K0ZlMVRP?=
 =?utf-8?B?TDYvd01ZNm5lVXVVMk1RWWU2NFAvdXk3RHFnS2k1c2p0NDdZWmQ0UEFPMG4z?=
 =?utf-8?B?TlVHM2RqWndMYjRSeU5RUUhDbDliYkpWUzY0OGFja1MwZ0VKZzN1M0VYS2Fm?=
 =?utf-8?B?Y3RyU0xZcGxvQnRqN2FONmo3Mm1Zd21aL2swQjJFVUFxeDZRYzFYdkVlLzgv?=
 =?utf-8?B?NHdKeWpadGd0WmJrUTd6eG9WOHQzakhyUUx6Q2NuNHdpbjllbTVYaXFoWUlk?=
 =?utf-8?B?T1NPUW9uVkIwU09GSU40ajc1L3dJYnRBQWNrWW1IbmhRcVQweFZzUElNbmsx?=
 =?utf-8?B?WDRKS1gwekRVRXh1MWhURS8zZFY1RU1DY0grRFllNzBXbHdZWUVQZ3NWcTJK?=
 =?utf-8?B?V1o3UERPZVJoSGRQUG9XUGJsZ1RKRXdzTVhQT0pRZDlMQk5EMlE3aGZqUHhI?=
 =?utf-8?B?bWJyRjBrdnhCQ2VESkRlV1pIVWtDeFY5THFhSURnSEM4VTMzb3FFazlNU2hU?=
 =?utf-8?B?OWtWbVFBeTVMMFBzb3ozS0N2YUZHSU1DNTQ4K0E1bGg2eGNjbXo3NG5wZElz?=
 =?utf-8?B?WUtTYllLVGZhS1NnQlk3M2tPZXJsdE9hcjZHUnBwdDk3RTNhaGFFY2ljQWZp?=
 =?utf-8?B?WWxFUzBzVDczRmhBNS9uMFdZSDVUekIxSDhlYmkrZ3pHOEFLamQ2SWZRZWN5?=
 =?utf-8?Q?09wY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15adb4ac-d526-42ef-8368-08dba3263a11
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 15:41:18.0745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Otgx9KIZ1JPXNrUFv2XSuI3P6u2FBxHnTHL9X0SjAb7uSJ9dpEPIJ84iw/bmbZ25IIoB4fEbRgMsK8etcXVR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyMiwgMjAy
MyA3OjM2IEFNDQo+IFRvOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLdWVobGluZywgRmVsaXgNCj4gPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+OyBL
b2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsNCj4gTWlrZSBMb3Ro
aWFuIDxtaWtlQGZpcmVidXJuLmNvLnVrPjsgU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PjsgUGFuLA0KPiBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNvbT47IGFpcmxpZWRAZ21haWwuY29t
OyBkYW5pZWxAZmZ3bGwuY2g7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0ggQVVUT1NFTCA2
LjEgMDgvMTBdIGRybS9hbWRrZmQ6IGlnbm9yZSBjcmF0IGJ5IGRlZmF1bHQNCj4NCj4gRnJvbTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPg0KPiBbIFVwc3RyZWFt
IGNvbW1pdCBhNmRlYTJkNjRmZjkyODUxZTY4Y2Q0ZTIwYTM1ZjY1MzQyODZlMDE2IF0NCj4NCj4g
V2UgYXJlIGRyb3BwaW5nIHRoZSBJT01NVXYyIHBhdGgsIHNvIG5vIG5lZWQgdG8gZW5hYmxlIHRo
aXMuDQo+IEl0J3Mgb2Z0ZW4gYnVnZ3kgb24gY29uc3VtZXIgcGxhdGZvcm1zIGFueXdheS4NCg0K
DQpUaGlzIGlzIG5vdCBuZWVkZWQgZm9yIHN0YWJsZS4NCg0KQWxleA0KDQo+DQo+IFJldmlld2Vk
LWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gQWNrZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gVGVzdGVkLWJ5
OiBNaWtlIExvdGhpYW4gPG1pa2VAZmlyZWJ1cm4uY28udWs+DQo+IFNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgfCA0IC0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2NyYXQuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMNCj4g
aW5kZXggZTQ1YzZiYzhkMTBiYi4uYTlmYTQ3NzJiMmQzNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfY3JhdC5jDQo+IEBAIC0xNTQzLDExICsxNTQzLDcgQEAgc3RhdGljIGJv
b2wga2ZkX2lnbm9yZV9jcmF0KHZvaWQpDQo+ICAgICAgIGlmIChpZ25vcmVfY3JhdCkNCj4gICAg
ICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4NCj4gLSNpZm5kZWYgS0ZEX1NVUFBPUlRfSU9NTVVf
VjINCj4gICAgICAgcmV0ID0gdHJ1ZTsNCj4gLSNlbHNlDQo+IC0gICAgIHJldCA9IGZhbHNlOw0K
PiAtI2VuZGlmDQo+DQo+ICAgICAgIHJldHVybiByZXQ7DQo+ICB9DQo+IC0tDQo+IDIuNDAuMQ0K
DQo=
