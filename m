Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8A16B0F13
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263110E6A7;
	Wed,  8 Mar 2023 16:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8FA10E6A3;
 Wed,  8 Mar 2023 16:43:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1EoZuqmji4st4/2xc1GTT1P96gpJmHdX1kMqRCrky+ND+cLwoSNyh59DP8tyorYyghoyEtjd2TumCKchn9eFHkE9RTum9jZ7sORUEb2kP4aRKH8lLfvD2bCp0x5u+8jSUAZS+tEews2nhtzI+8A9kZvl1nHOInJ9xJKHggsIY1BuDXC6XuUow0VbcbdF5Rj15xwcair80HQLt0ssWrGExguXGkZvFdQHYSGIr+Td/EjTdt6dLlZ1vuRBbf5S/HWAzwh2SBVkBnK5RbhivbScvXmCzpbP09MzOFfAELrJMjikOsc6eiuNvJpM8C1LE912NtFtwhJovdxkLb85e6ikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCdYtySXjCsMWhvxeZlUiAEvBDYsf+R1RhmK41SzCO8=;
 b=RBxsXvYTbrvyCwNlur8t94N/mt73QQnERllaDzVU/7G/r2u94gceDcuQV8mQUfQIrgsPxdpwquETNvx6wASeIZMQ96wA3oQsW6k2Qo2Cf36RB5Nf985w6LZjsMO8p154FKUrEi9nYBXQjuPwA5xEPvnvgroOpy5dpnj4Bqdf942oqzSf+b2M50yeawHkj00x8yEgmBRZsYdswMNBKjjWUZgFZW6eC4Mcy7Yw3rew5rNPiqTWOekXCIA48eMl/AcdO72xonvoxyi93qeuRnS0Vod9TF4RCOhnfbwofpjCAaR9/DtwbT/2m74wNSctiyaInByGflSo4U0XGjcduTDzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCdYtySXjCsMWhvxeZlUiAEvBDYsf+R1RhmK41SzCO8=;
 b=PyJmlQ9SMspRhFYuimHin+ymqiE0gMFckIwbEYVHz4FslFJ0p850t/aRSOKaXkkys6pnx1+wM7GWW9/rA1kDAssJnCzfEdiWD1h3ApoJcGweo0++5fJGIEMXj6udWL1sYJqY8NuEcrt3jXNiGhaQQQT9kjn5g0VzsF5hSKBaTes=
Received: from PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 16:43:24 +0000
Received: from PH7PR12MB5831.namprd12.prod.outlook.com
 ([fe80::3bb0:da9a:5a44:8e32]) by PH7PR12MB5831.namprd12.prod.outlook.com
 ([fe80::3bb0:da9a:5a44:8e32%4]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 16:43:24 +0000
From: "Zhuo, Qingqing (Lillian)" <Qingqing.Zhuo@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Subject: RE: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Thread-Topic: [PATCH 1/2] drm/vc4: Fix build error with undefined label
Thread-Index: AQHZUaEy/DMbuWA+vUWS5MTAKPyPlK7xDf0AgAACV4CAAAHGEIAAAeAAgAABwACAAAB48A==
Date: Wed, 8 Mar 2023 16:43:24 +0000
Message-ID: <PH7PR12MB5831E6EA8077B036EB0BE54EFBB49@PH7PR12MB5831.namprd12.prod.outlook.com>
References: <20230308093408.239331-1-qingqing.zhuo@amd.com>
 <ac8fed53-6f05-6ec7-9ef5-61110cd83c0b@amd.com>
 <20230308161945.svooztnablyvm75e@houat>
 <PH7PR12MB58315E9E7362E8A750393B6FFBB49@PH7PR12MB5831.namprd12.prod.outlook.com>
 <20230308163248.u7rvtadhlre3yua5@houat>
 <CADnq5_NYnb1j9RnurMP2-TU4nAQRsPH8hsn_YXoiPZZ4woXOnQ@mail.gmail.com>
In-Reply-To: <CADnq5_NYnb1j9RnurMP2-TU4nAQRsPH8hsn_YXoiPZZ4woXOnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-08T16:43:22Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=8528188e-1036-4b6f-b37c-350ac3ed4d3e;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-03-08T16:43:22Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: c7a9b577-d288-471e-931d-72b89f2f7374
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5831:EE_|DM6PR12MB4233:EE_
x-ms-office365-filtering-correlation-id: 019b29f9-45d6-49f7-7384-08db1ff43c1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dUFHLOEebTM4Ac0PUdm14rhnLTUe9oAe9Ttboe12+78AAKLCrSYSfrVTT6sDvWP0ea45tDFd7ECNpm76Bqhf4ylizfZ3dsgI1wzLEWDQR7rGcwQrFFjq0s5Rq8nri4Hd3Yrc6TpUNryxRCu4d8R7HDNaz/mM+hA9BqlShY69Z+I82XCWZk7NytTm5YFP9VBuZCFHABfqDlCWWTQoTRJ+sGnyWMWWG7MnWKsT9krw71ohAfrFedA+vuX1IBI5XKRn3fdLbP/dg2geOq2WbYRc3lUd46GCMoGFpA9VLQAqu+j6xJAHIOU7lUX7HEZ5AcKF24H23AWjpd4VdZs1wGMZNGcyxo/WLXHogfmwQ0UUP8SLhmuObEp3VOqy73T1FTqKOivPSe7pddEH3JnnCHonAeG4PVL/OSuh9m5nqK5BMEuEUHslj9TFi7OLsAmIWzL+3n6PXZtBWQgejMoa/4utTa7RE9aJHjQEwzIoAnpGPB5/IfZAG57KdZq5OOioQjZRq9l1zhC9mLVUlSvGkbOlsTy4IniLDvrvcMev/c29qq5I5dQLv29icR927Voj4VNF7u8o+RmJJJ/Wv/Yc1v25Yy72zjFPPwbRBmzZZYWZWqQq5GVNqkYbyWc5MgLzAXrYxA6nNOGq78z3xZH1h5J7DPlm2frq60SaDuqlZbs2YAH2b71ZTZZ92u95vGZ3RKRSYFxby+xnO99Up5QUWV1sHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5831.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(38070700005)(41300700001)(71200400001)(8676002)(54906003)(7696005)(110136005)(83380400001)(316002)(86362001)(76116006)(64756008)(33656002)(4326008)(66556008)(66946007)(66476007)(5660300002)(478600001)(8936002)(66446008)(52536014)(55016003)(38100700002)(2906002)(122000001)(9686003)(186003)(6506007)(26005)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWxwZW0xUTNuSFhkT3VBSENIV016djExbnlSSmpoWmxkdDdSR00wQzJyc25i?=
 =?utf-8?B?Wm9aQ1ZZRmJBWVdsZnplT0xWaFFCZWVhWXBPeUJXN1BmTzYycXJhWG9VSm9E?=
 =?utf-8?B?dnhlUVlMQ1JGZGpKS2x6SDhxV3VJWDh2MVhQOTM2eURuRUpUdW5sTUo0NUdF?=
 =?utf-8?B?aDVmZ096VFBuUFhtcEhaY1lxbm5Uejh5V240UU5mNVNFNTJQU0dIUzZNY3hh?=
 =?utf-8?B?Z2RKcjBDdTRJQWFsMmgyUnZVaUV1aVk1T09XV2xsU1crNzJaamNmd0NDU1Zt?=
 =?utf-8?B?eE9qNWhFWDlJK3hkVTJkSGZMdW9UMEVNbGRzWE5SbkF3Z0xFM2FpazBTM3h2?=
 =?utf-8?B?YmpLRmJrOE9RSDZJdy93bUdTOVZkanBoOWZwL3dhSStiT2E0VnJTdTJHYjBt?=
 =?utf-8?B?L2xlejAwTUY4S2xGUUl6K1ZxWVF2c0I5L21tS1F2V2EyYXE1ZzMvblZYRXJz?=
 =?utf-8?B?cUxhZ0RtdzM0N24vbDBqVUZkZTRnYkJUU0YwY2NVaFZsWTU5WmlCeHZEbEZH?=
 =?utf-8?B?T3htKzQ2L1g2WnBlcDlPa0NZa2l0aWx6bXNUTG91MGJOdjhGenc2RFBRRFFC?=
 =?utf-8?B?TDFpaWRGa0cwTzgra2dmTU82Q0hyV3lTZzJYVDZ4UWoralVFbjlUMmNZZ3J3?=
 =?utf-8?B?M00xUlhPLzJLc2d3OW9oVFF4anpyamZZWWFGQXk1Z2VXL3MzeHg5Ym5Sb1BZ?=
 =?utf-8?B?N3Y1Z2xvNDlaaFpzclpYQkRCZGxnRUxTMmJPNUtOQ1NFd2pHdHJrNGtPRis5?=
 =?utf-8?B?cjVjRVJZZ2FXaWYzQUlXd1BNd3Q0Mkl0MjNNNVBsVFkxYXhROEFUSFg1dXlC?=
 =?utf-8?B?RnFlMlBUUXo1UzVPSENQWEdyUnVYRkwwcDhCaWcyeVVmT0EvRGNPTCs2cGFZ?=
 =?utf-8?B?THZ0TjRYMU1peFlNbERyZ2g3a3BDckNpb2kzaGx6dDc3dlNxQ3NjUmVFVXo2?=
 =?utf-8?B?bW1IRjBHbHhyMXJkZUh1OENqeGQvWWVlMzM2UDhkZHBjekhsQjJTS082cTdz?=
 =?utf-8?B?UW9yMTExWmpIZmorelBCVjZPd0tveXZHZW93OUt2c3VjcGNWZDNjS1dCcG5N?=
 =?utf-8?B?T0IvVEl3YkYwNWV3dEZORkZWVUtqQVRnM2hCTHlKR1F2SWQ3eEVmbjZPLzJo?=
 =?utf-8?B?bXNDdmVoK3FzbHczRkp3YWhVZ3NRbGpNTDJmOTIzTXRRR1dUeUNtWnRQWU92?=
 =?utf-8?B?YUk5eDJieFBON2N0VkYrbi96cVgyVGJwb25WbTRSRzhsQlBzWHJiY29ZSzcy?=
 =?utf-8?B?V0RIOGM5a1JTdEVKVmJjRU1GVGp5ZXp2cVRCaVk3TmM4R2lwR0FTNnZKRDhT?=
 =?utf-8?B?ejJtN053a1NHQzJ6S1R2Sk5QV1hGTERGL0k3b005WnlidlgxQ1VmcFl6YllV?=
 =?utf-8?B?MGRsNW9uQjNJcVdITzN1UExhQ2g4Nmo4TlVWd0lrdDZpcTZCQVdsVVpOV2NK?=
 =?utf-8?B?UXhYZG5MUExIY054UEg1eTlzV05maVJvNHoyOXM5UU1LVE5TYVJCam9jOTJQ?=
 =?utf-8?B?VFdoTFI4STlIZWQzbFpZRGllY2I2amZQNnRLSVp4NUJoQm5xaVJtTzVkQmpF?=
 =?utf-8?B?ZmdnSmhvNnVoTldVb3JvOWEzcU5CeUh0WDhTSTF1aWFWbG83ZGg4MXlmdU5m?=
 =?utf-8?B?bTJ2NlVJVmFWOEFDQ2FzVFBjWFhYK0phQ0FmR0IzUGF5ejc5aXJxZUg0UVhl?=
 =?utf-8?B?YzB4MUlQZkluckJ6ZHE5b0V0QzRiR2RYMnVEQ0JwVklCZmlwVS9sWVMwZ2Zi?=
 =?utf-8?B?UW5Tc1RVQWNleXU3OTV6SE53ZFNNQUY0L1FKbmZVdTBtaXpBT2RRMGFGMWQ4?=
 =?utf-8?B?M3lTRzQ1ZVZudHpOZldiaGIwNGhkOHpsMEdIaUNWMUtSU2ZrUEtjL2lNRUxq?=
 =?utf-8?B?TURPdzJiandlUlV4bVRuSGU3cktKNzEwTkRxVFNmRGVyek4vMXdLdUJ5MDFM?=
 =?utf-8?B?c29zanlBUjhsVWdMdzNBL3Zxd3M2aVMxbi9pUzBtaEYvVHZ6emV3UjZ4bWs0?=
 =?utf-8?B?ZGVYMzdpTkswYVpsNGlObG5KNmd5S210TVVwZmhzd2ZHUVRQOHV2Yi9QYVZn?=
 =?utf-8?B?bGNmMkQwZDBYcFNZZExDaXhKRHMvcG5VdEd1QnBOcHNNeXVBcEpSeCtSaHlw?=
 =?utf-8?Q?3CE8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5831.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019b29f9-45d6-49f7-7384-08db1ff43c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 16:43:24.3567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJGPTbZfDEGF3GclYWJUm+ZezlTCyZsDUMZUBSm9qinN5KP1sHOC7qbu8ClSFFec
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233
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
Cc: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCk9uIFdlZCwgTWFyIDgsIDIwMjMg
YXQgMTE6MzIgQU0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdyb3RlOg0KPg0K
PiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNDoyNzowMVBNICswMDAwLCBaaHVvLCBRaW5ncWlu
ZyAoTGlsbGlhbikgd3JvdGU6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxd
DQo+ID4NCj4gPiA+IEhpLA0KPiA+DQo+ID4gT24gV2VkLCBNYXIgMDgsIDIwMjMgYXQgMTE6MTE6
MjJBTSAtMDUwMCwgSGFtemEgTWFoZm9veiB3cm90ZToNCj4gPiA+ICsgdmM0IG1haW50YWluZXJz
DQo+ID4gPg0KPiA+ID4gT24gMy84LzIzIDA0OjM0LCBRaW5ncWluZyBaaHVvIHdyb3RlOg0KPiA+
ID4gPiBbV2h5XQ0KPiA+ID4gPiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmM6IEluIGZ1
bmN0aW9uIOKAmHZjNF9oZG1pX2JpbmTigJk6DQo+ID4gPiA+IGRyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X2hkbWkuYzozNDQ4OjE3OiBlcnJvcjogbGFiZWwgDQo+ID4gPiA+IOKAmGVycl9kaXNhYmxl
X3J1bnRpbWVfcG3igJkgdXNlZCBidXQgbm90IGRlZmluZWQNCj4gPiA+ID4NCj4gPiA+ID4gW0hv
d10NCj4gPiA+ID4gdXBkYXRlIGVycl9kaXNhYmxlX3J1bnRpbWVfcG0gdG8gZXJyX3B1dF9ydW50
aW1lX3BtLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBRaW5ncWluZyBaaHVvIDxx
aW5ncWluZy56aHVvQGFtZC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgIGRyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2hkbWkuYyB8IDIgKy0NCj4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyANCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMgaW5kZXggDQo+ID4gPiA+IDllMTQ1NjkwYzQ4MC4uZWRmODgyMzYw
ZDI0DQo+ID4gPiA+IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF9oZG1pLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jDQo+
ID4gPiA+IEBAIC0zNDQ1LDcgKzM0NDUsNyBAQCBzdGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpDQo+ID4g
PiA+ICAgICAgICAgICAgKi8NCj4gPiA+ID4gICAgICAgICAgIHJldCA9IHBtX3J1bnRpbWVfcmVz
dW1lX2FuZF9nZXQoZGV2KTsNCj4gPiA+ID4gICAgICAgICAgIGlmIChyZXQpDQo+ID4gPiA+IC0g
ICAgICAgICBnb3RvIGVycl9kaXNhYmxlX3J1bnRpbWVfcG07DQo+ID4gPiA+ICsgICAgICAgICBn
b3RvIGVycl9wdXRfcnVudGltZV9wbTsNCj4gPiA+ID4gICAgICAgICAgIGlmICgob2ZfZGV2aWNl
X2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2RlLCAiYnJjbSxiY20yNzExLWhkbWkwIikgfHwNCj4g
PiA+ID4gICAgICAgICAgICAgICAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2Rl
LCANCj4gPiA+ID4gImJyY20sYmNtMjcxMS1oZG1pMSIpKSAmJg0KPiA+DQo+ID4gPiBUaGUgY3Vy
cmVudCBkcm0tbWlzYy1uZXh0IGJyYW5jaCBkb2Vzbid0IGhhdmUgdGhhdCBjb250ZXh0IGF0IGFs
bC4gV2hhdCB0cmVlIGlzIHRoaXMgYmFzZWQgb24/DQo+ID4NCj4gPiBUaGlzIGlzIGZvciBhbWQt
c3RhZ2luZy1kcm0tbmV4dC4NCj4NCj4gSSBkb24ndCBnZXQgaXQsIHdoeSBpcyB0aGVyZSBhIHZj
NCBwYXRjaCBpbiBhbiBBTUQgdHJlZT8NCg0KPiBUaGVyZSBpc24ndC4gaXQganVzdCBoYXBwZW5z
IHRvIGhhdmUgYW4gdmM0IGRyaXZlciB3aXRoIHRoaXMgaXNzdWUgd2hlbiB3ZSBicmFuY2hlZCBp
dC4gIExpbGxpYW4sIHBsZWFzZSBkb3VibGUgY2hlY2sgZHJtLW5leHQgb3IgbGludXgtbmV4dCBm
b3Igbm9uLUFNRCBkcml2ZXJzDQoNClRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93IGFuZCBhcG9s
b2dpZXMgZm9yIHRoZSBjb25mdXNpb24hIFdpbGwgZm9yIHN1cmUgZG8gaW4gdGhlIGZ1dHVyZS4N
Cg0KVGhhbmtzLA0KTGlsbGlhbg0K
