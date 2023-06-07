Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F472599D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA6510E499;
	Wed,  7 Jun 2023 09:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BC310E493;
 Wed,  7 Jun 2023 09:09:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSJLDuUCZe23wQy0N//9UpvOiOv+VRog795VX/NfFcD+AOtIwMWCtky6KDlXnz+ecEekhZedA8Av1QMoGYuwnhWsdUQYGQ+z/nf2oEvi/oxpnDmv0WC4MC9UhMlhRU3+SHBcCzSEexbmhQyRFGUfbhMMY6/eyNb5r4axGs7JsenOILVoraDGPMIpcJGykCuDUhfjwiVD80AGgaFO2ENZnZNHrmQmGanjFbTyN4Pm/QXHVQWlvgyS7ULrq1rFHBu6RztwYAacIaWOqaZTPmU34lZhrhJT1p3XfKrCHZK5+ZQ0iz9/Xcgigr8FyifvPv2faIpDh/e7l4iGDxmQ+X6YmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/2HKBIstdrhoZ30fnFs0bOQ2MCacom4IX0r3yebsx8=;
 b=TiDFwPn3sg0BR3oBhhEY8MWU3qqJMCJUqfQi3gRRvxKHY83cPWlwpB/0lC2xLZJG5k0bCQKzONyjLLNlohLKU53jpb1VupflYPyaau2kQX/tXMp/vPINW2H7VuJ83JRVvoVjBkfQT4wbPS7JJUBnYIRF5yM+fppB6b4Z7RCFyK+yCUILYhhMTjb1vn03zYAeE9jZsMiDXRa2T1aCF/C7vDq94m90o4G37pYvBBvcxvFUAnAGxRAYdbo0ItiuMivXT3Y+VguQQ9wQwBT75c6N3VFI6dP9FuSqp7giqTiwvM2DmKcArGzWvEdTMod9jZS0M+ji2ZXFZRskHyvjwSO6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/2HKBIstdrhoZ30fnFs0bOQ2MCacom4IX0r3yebsx8=;
 b=Q68zo2qbwKqUHmvaFCqC+V2GePaZ88mmph+gZ0dfQN7Q83uqrhHtM3cyJlvIqBmD5N0t1QG7RlZuOtQs/4Gg9FjtQFQJ4397cw7tGy4zMCWmjsYIn7qU0MbPBAKC1t1+ToRSiB/qtlKTp6YPV2u2bZERhhzlRxDqzq/HKe+rV4s=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Wed, 7 Jun
 2023 09:09:32 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::458d:c45b:487:9954]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::458d:c45b:487:9954%2]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:09:32 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [PATCH] drm/amdgpu: display/Kconfig: replace leading spaces with
 tab
Thread-Topic: [PATCH] drm/amdgpu: display/Kconfig: replace leading spaces with
 tab
Thread-Index: AQHZmHuLq6dW6noRcESmCj2LcgRtza9+JXwAgAC874CAAACYgIAAKwCA
Date: Wed, 7 Jun 2023 09:09:32 +0000
Message-ID: <DM5PR12MB2469E5DA60D629BBEC0A6157F153A@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230606133328.148490-1-suijingfeng@loongson.cn>
 <CADnq5_MdNSBJuNrJC2-fRByhEoUqEJmMGATT+OrFvjqA7k4F5Q@mail.gmail.com>
 <85b7bf66-840b-c6de-a7e3-be1f49953464@loongson.cn>
 <7db6a90f-1929-5e36-3f1d-c96acb5c70a1@loongson.cn>
In-Reply-To: <7db6a90f-1929-5e36-3f1d-c96acb5c70a1@loongson.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1b31d252-2572-4bfa-ae72-aa80d46550f3;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-07T09:08:36Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|MN0PR12MB6053:EE_
x-ms-office365-filtering-correlation-id: aa16354b-97fb-44a1-a8f3-08db6736e82f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ateGAL8uQZRH/XhHdaZN2V1DMHXnvkO2bOVSRs3O34MiEm/yGSTL8J94K4nqph0WSiR2+o+p32oLkmv4X/n1S0LZzgguZwiiY5Nt8AXXABnKE1GMsL601bRzJWEW3MC8V3uLGcU8vAJ7UBYcaboY4cEv1/m+L+6lXfeO8QrQIY3B/0aj2eJYES5c3IbZ3/QMcUV7bLP29DD+AuCtgvOA9M4XqdSdoRF9P43jYdMNsE6MJ4h76xrcSC/VZt+DSAgHmcpWup5h5mePV72LqpheaOzNOVwtlNGPstWmAkGY9ED7PUzlfon1m/ENBLe9t4b2urOaqovzuutiObiJTmtwonvQN/X8ywf0YpO/cndFzl5YGA4RjgNnLx8gD/I115pdV3tLoLPzoMYfOHntfFj3xCv3m6eP9oze7Gph/3VgYX3Ff0SvDee2dkmu/U8rmaab6tLzruaHqqYgbcAhOnh3xhYKCX1zKSRZn/giJX+146tmP7J1WK6WIfaNMuks/rreHMA4fAKzyEdwXoh6s7ex/hCV1Qk8IbkrnWQfl/1HKYQQGiztWTJ4rRHbO5siEIX2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(186003)(478600001)(9686003)(53546011)(26005)(6506007)(83380400001)(66574015)(966005)(55016003)(7696005)(316002)(8676002)(8936002)(86362001)(38070700005)(38100700002)(41300700001)(71200400001)(33656002)(122000001)(76116006)(66446008)(66556008)(66946007)(66476007)(64756008)(2906002)(4326008)(5660300002)(52536014)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blkyeWVhakViQkE5V2k1U1dtRTE1V0k3eUlkRlFwZ00vOFRlcWpGRmp3NXB5?=
 =?utf-8?B?SU9zWWg2blNkR2JnZUQ5Rnhqemh4ZGJ3akFkczJwNXBnVFBwTUhGZjVvZmFM?=
 =?utf-8?B?K0hRS1I0UGsrbmtNMk04R2hIMU83UWtyNjhQTDlMa0tqRzB1bEd4NzBrUjZQ?=
 =?utf-8?B?MTk2dmtTWW5Oc0M3c08xcm12b0J5S1N1bWg3ODM2Q3c2OWI3ZnFwaXZKMmFE?=
 =?utf-8?B?SUFsTWVDUG8yWmhXL1ZnTmZqMGlJckw0YXgxaU55Yzl5eFFkM1Q2dVJienlO?=
 =?utf-8?B?Nzh2cnIrRXNUVG9UYUwxMUNvUGlXd0xSVFNCYWFlYjdubFhBdU1YeGJzalEx?=
 =?utf-8?B?VVQ3d2x0azZZSFVLQ2srR2wydlNrSFdHRDRudFh5TmUxalpXK0tCd2JVazRh?=
 =?utf-8?B?ZS81MStvRU9mNG9nSEp1bGp4L25uSnFqSTV5citORlUwRTQ5c1dhQUxxN3ov?=
 =?utf-8?B?a3h0RC9HWVQ1VXdUZURtbDNtblRLTUFZZkswK0lrVnpzTGxYSnJzK3d5dlEw?=
 =?utf-8?B?OFJicE1mVEVCSWZicGM2d251dEI5K1M5Y085QjZ1VnZEUTNhT0NkM21Nc042?=
 =?utf-8?B?QlU1NFE5Vnh0TU5XYmRxR2lXbkxyTmhLRDVhQVdZYTFQV2FlVllVQkFEVlc3?=
 =?utf-8?B?ZlpDNjBTVVJKY2VVdlhldE0yem4zdk5yQ2QxWTFZcWpYOFN5Mkc1SW1zYXhK?=
 =?utf-8?B?a1dPbnRkaTNzcitZYXNRYWN1UkZsRzEyNmxoT21MS2RnWFRnY0k0R0p0QXlB?=
 =?utf-8?B?VGxqNEMzQzZRNlRGclFqdjV4em44WlY1eUpQNUYrL0ZqbDgrcFcySUcrNURN?=
 =?utf-8?B?cys3Wi85ZW5LYnZSMVJuUVV0K2JjSVpvWVM4SlJpZXZRVWVKRCtQL05iQTY3?=
 =?utf-8?B?ZXpaYWFvVllhWVluZ2xnYmYyc1ZFdU5SNkFaWk5VcFlURDJpaE1LWVJuTWRD?=
 =?utf-8?B?dDF2QmExNDZ6TkVOZ2RPQXVoSm9UTXR0a0ZGVXZzUXk2ZlBhWERoOUZUZmty?=
 =?utf-8?B?ZXBiRC90U1ZRSXQrTHhjWFFXSzM4bExLVE9sMVNtQUg5dVBkbGJOTGtuNUpV?=
 =?utf-8?B?MFpwNS9Db1N4VTdEdUxJTUtNMkhxaUIzRktUc1RYRnVBcE1PMnMyUGpwMVoz?=
 =?utf-8?B?cWpWTlM2eGNxZEs4L0IyVmltS1dLZkErQU9CamwvSkJNQU1tT0x2WllkOXpF?=
 =?utf-8?B?Sit3R3V2Slg0eS9KZk93bWV6emZ1bUdUS1Fsc0Jhd2l4ZDg1THVjT3M4aktm?=
 =?utf-8?B?MnNsNk5ySHZGblBJVlpGZTMwR1k2bG15Qkx3OVUrdWZIMEh2djFPeWZGSlgx?=
 =?utf-8?B?NVk3TnYwS0Y5K0JrNXNtd2p4VDVub3pPbit3c0pQdDRDa3ZndWVqNys4OEtU?=
 =?utf-8?B?UUNzODlYcjRpSWlvVmFIU2ZsMXJ2OEJBc1YwdnZVMUx6dy9jakVzYWFIc1F2?=
 =?utf-8?B?bjhyUlFtOW43ekl5MGs5V1YxaHlGWmxPdW5wMlo1Wlp0eDY2Z0ZRZ0R6ZG9H?=
 =?utf-8?B?d1A1ODlsc3ZuZzc0WXdCb2V2K2V4bFBidjQzcHo2dEJ0ai9FVU01S0huNzFk?=
 =?utf-8?B?VVFzVFV0SGJZRC9wMmdBYWIwR3VxZG1VRjNDTC9wSlpJQVkxWmgrNG9EaUNl?=
 =?utf-8?B?QnZkOWxPamh3b2p4VXdVOE42bk11ZUVJK2RiOEZZTjRvRVlXTjZQczZWRG9N?=
 =?utf-8?B?NVYyY21vRWMrR3pnMkhTM3BOVDByTktSZ1hKeEJ3Mmx4SkVMNWpnNmplWHll?=
 =?utf-8?B?d3lXeS9ieFFvV3N0aTRiMUk1SkNyL2xYN2M5Z0xuTUFVbDU2eWZGTWpDQ0pa?=
 =?utf-8?B?VlBJUFhpM3pnVlUyN1FlK0M0dkF2QlRPS2EyUU4xcUtOZ2VTK3YvV2JSNzFJ?=
 =?utf-8?B?eE10UFJwMGs0WGhQemJ3OW8zVmtrUWJUQ3dyV2l6emwrcU5tbVdVb3RuRGJ2?=
 =?utf-8?B?RVE4aUs1ZEN3ZUhJenVDUlpjQW9YNitwRW9QbkRpRkVxbkhYK1lLWlhOaHBZ?=
 =?utf-8?B?d2VFUm5xSDBhR2lQWnBkVG9JY2l3V0VIMXdVWUgwdnlDSjNURi9UaTZQdlJj?=
 =?utf-8?B?VmpmZFZ1Q1Z0TFJ2UGtMOWZhRWVYdy9kSjZ4cndoTGoyK0ZOSXNYZWVkVGZQ?=
 =?utf-8?Q?lavM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa16354b-97fb-44a1-a8f3-08db6736e82f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 09:09:32.4289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6y4CEIDbO85gG/qcUUDACLvo6b7MlPIcKRe1ocxefO1/N5PxsiiKN/yC8GOcOjRQBx7DHDfsaEi033AYbtbbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KSXQncyBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvYWdkNWYvbGlu
dXgvLS90cmVlL2FtZC1zdGFnaW5nLWRybS1uZXh0P3JlZl90eXBlPWhlYWRzLiBMYXRlc3QgcGF0
Y2hlcyBpbmNsdWRpbmcgeW91cnMncyB3aWxsIGJlIHB1c2hlZCB0byB0aGlzIGJyYW5jaCBhZnRl
ciBhIHdoaWxlLg0KDQpSZWdhcmRzLA0KR3VjaHVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24gQmVoYWxmIE9mIFN1aQ0KPiBKaW5nZmVuZw0KPiBTZW50OiBXZWRuZXNkYXksIEp1
bmUgNywgMjAyMyAyOjM0IFBNDQo+IFRvOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWls
LmNvbT4NCj4gQ2M6IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBhbWQuY29tPjsgRGF2
aWQgQWlybGllDQo+IDxhaXJsaWVkQGdtYWlsLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFu
QGFtZC5jb20+OyBTaXF1ZWlyYSwgUm9kcmlnbw0KPiA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29t
PjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYW5pZWwgVmV0dGVy
DQo+IDxkYW5pZWxAZmZ3bGwuY2g+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+Ow0KPiBXZW50bGFuZCwgSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+
OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBkaXNwbGF5L0tjb25maWc6IHJlcGxhY2UgbGVh
ZGluZyBzcGFjZXMNCj4gd2l0aCB0YWINCj4NCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9hbWQvZHJtLWFtZC8NCj4NCj4NCj4gVGhpcyBvbmUgaGFzIGEgbG9uZyB0aW1lIHdpdGggbm8g
dXBkYXRlLg0KPg0KPg0KPiBPbiAyMDIzLzYvNyAxNDozMSwgU3VpIEppbmdmZW5nIHdyb3RlOg0K
PiA+IEhpLA0KPiA+DQo+ID4gT24gMjAyMy82LzcgMDM6MTUsIEFsZXggRGV1Y2hlciB3cm90ZToN
Cj4gPj4gQXBwbGllZC4gIFRoYW5rcyENCj4gPg0KPiA+IFdoZXJlIGlzIHRoZSBvZmZpY2lhbCBi
cmFuY2ggb2YgZHJtL2FtZGdwdSwgSSBjYW4ndCBmaW5kIGl0IG9uIHRoZQ0KPiA+IGludGVybmV0
Lg0KPiA+DQo+ID4gU29ycnkgZm9yIGFza2luZyB0aGlzIHNpbGx5IHF1ZXN0aW9uLg0KPg0KPiA+
DQo+ID4+IEFsZXgNCj4gPj4NCj4gPj4gT24gVHVlLCBKdW4gNiwgMjAyMyBhdCA5OjMz4oCvQU0g
U3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPj4gd3JvdGU6DQo+ID4+
PiBUaGlzIHBhdGNoIHJlcGxhY2UgdGhlIGxlYWRpbmcgc3BhY2VzIHdpdGggdGFiLCBtYWtlIHRo
ZW0ga2VlcA0KPiA+Pj4gYWxpZ25lZCB3aXRoIHRoZSByZXN0IG9mIHRoZSBjb25maWcgb3B0aW9u
cy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogU3Vp
IEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPj4+IC0tLQ0KPiA+Pj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZyB8IDE3ICsrKysrKystLS0tLS0tLS0t
DQo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
S2NvbmZpZw0KPiA+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZw0KPiA+
Pj4gaW5kZXggMmQ4ZTU1ZTI5NjM3Li4wNGNjZmM3MGQ1ODMgMTAwNjQ0DQo+ID4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2NvbmZpZw0KPiA+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L0tjb25maWcNCj4gPj4+IEBAIC00MiwxNiArNDIsMTMgQEAgY29u
ZmlnIERFQlVHX0tFUk5FTF9EQw0KPiA+Pj4gICAgICAgICAgICBDaG9vc2UgdGhpcyBvcHRpb24g
aWYgeW91IHdhbnQgdG8gaGl0IGtkZ2JfYnJlYWsgaW4gYXNzZXJ0Lg0KPiA+Pj4NCj4gPj4+ICAg
Y29uZmlnIERSTV9BTURfU0VDVVJFX0RJU1BMQVkNCj4gPj4+IC0gICAgICAgIGJvb2wgIkVuYWJs
ZSBzZWN1cmUgZGlzcGxheSBzdXBwb3J0Ig0KPiA+Pj4gLSAgICAgICAgZGVwZW5kcyBvbiBERUJV
R19GUw0KPiA+Pj4gLSAgICAgICAgZGVwZW5kcyBvbiBEUk1fQU1EX0RDX0ZQDQo+ID4+PiAtICAg
ICAgICBoZWxwDQo+ID4+PiAtICAgICAgICAgICAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSB3
YW50IHRvDQo+ID4+PiAtICAgICAgICAgICAgc3VwcG9ydCBzZWN1cmUgZGlzcGxheQ0KPiA+Pj4g
LQ0KPiA+Pj4gLSAgICAgICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIGNhbGN1bGF0aW9u
DQo+ID4+PiAtICAgICAgICAgICAgb2YgY3JjIG9mIHNwZWNpZmljIHJlZ2lvbiB2aWEgZGVidWdm
cy4NCj4gPj4+IC0gICAgICAgICAgICBDb29wZXJhdGUgd2l0aCBzcGVjaWZpYyBETUNVIEZXLg0K
PiA+Pj4gKyAgICAgICBib29sICJFbmFibGUgc2VjdXJlIGRpc3BsYXkgc3VwcG9ydCINCj4gPj4+
ICsgICAgICAgZGVwZW5kcyBvbiBERUJVR19GUw0KPiA+Pj4gKyAgICAgICBkZXBlbmRzIG9uIERS
TV9BTURfRENfRlANCj4gPj4+ICsgICAgICAgaGVscA0KPiA+Pj4gKyAgICAgICAgIENob29zZSB0
aGlzIG9wdGlvbiBpZiB5b3Ugd2FudCB0byBzdXBwb3J0IHNlY3VyZSBkaXNwbGF5DQo+ID4+Pg0K
PiA+Pj4gKyAgICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIGNhbGN1bGF0aW9uIG9mIGNy
YyBvZiBzcGVjaWZpYw0KPiA+Pj4gcmVnaW9uIHZpYQ0KPiA+Pj4gKyAgICAgICAgIGRlYnVnZnMu
IENvb3BlcmF0ZSB3aXRoIHNwZWNpZmljIERNQ1UgRlcuDQo+ID4+Pg0KPiA+Pj4gICBlbmRtZW51
DQo+ID4+PiAtLQ0KPiA+Pj4gMi4yNS4xDQo+ID4+Pg0KPiAtLQ0KPiBKaW5nZmVuZw0KDQo=
