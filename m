Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA38517B47
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 02:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F0C10E6BD;
	Tue,  3 May 2022 00:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2111.outbound.protection.outlook.com [40.107.215.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2FE10E6BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 00:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTw3/RF97vZqwzCb+NOBYZLz7oD24uUmQrdKZ6N4cqwfzMCJ+bm0aHsAouzypBy65XlprQYEYcA+nnkRXeGi7kXS9fucARBtnZHcE9JJxX1w8Z5PBZmR0cUokfUE+oz707mLGhF7xV73bj7bLgnlWx6Wz2gbmPj9P2ghqvJRTLzVQ0fIyqRq2NX3dLffvggnONuMuyu0kbyX/SdYJ+kfqxLdAXExtFH8PNW+Hk7J8uvrD9E7bwnGqBvb/PR8AyIS18UtuBLLy6ZuWju0KPTovBokKY+lO9cQqd5z7HPE+T+8WZGqN/GjPaWCfU7kiZ7uvrl+xp86oZ1xLclGKfitWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyt0zbSA9EncCtKO+WZuhm3r/t73RvvNG+xqfHc3QDU=;
 b=U9h71VB1wbPxQB3g/TQBbVcI/YoSk9a/gKYtbtynZKI88pz7jua2aAYhWataOxkTiut5pxZ1g+4SSnGsJlpo1FA289OL4bbL9R4DtZGO5etYSWLqBbiLl1Mkvr0uWCJ0e7z9RDoFdKIzoVRegobP6rhX3hp7j3PNeOFtsv+sZipR8C3yFK9PI+vLVK2dPAGLk54vywsCxFhXfaIIIqFDGCHY+4Fnih07+OksMQ4b7Hu6lM66uHu/6EHkxB0pXQ4Ufvy7xfPnCJR/i7eeJ06carQqecTKrFmmVaAuQCaUn9+GwEQvxSXjP4S5AX44+tjEOWWmg2iUvwcNIMYjSHVEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyt0zbSA9EncCtKO+WZuhm3r/t73RvvNG+xqfHc3QDU=;
 b=ixiwcqOWbLxmwNXyvcpHEYrQr6KkmS90IdkQ+lEB2+PVGU8r/kH4rS8jqwygErsy6YdE7WQfev+MPdrCJhMbzhYAGvIPZjhggt4w7n0BCL2x3Er1K7E+nWVeJ9dbIiSEyRAKOpVnyx1+kCXs9CrW3uFpHOzRWEN9wV95RaPm4z23dLmjYHHBLDNyxBsS5nNxhwJs2tvdg84khDdXVZ0rhRzLnNTxaLM5hEEmPHyYiTKRm/I+A2upytVXKAsONopXfCHHA2jObG/H81L1xolcJl4ma6HBHxVpOnjQJkXxuZsh58kTAF5sRoGyhL6CHiaiNO2M+p75g/w+MlBlLgaaxQ==
Received: from PSAPR06MB4805.apcprd06.prod.outlook.com (2603:1096:301:9a::13)
 by HK0PR06MB2513.apcprd06.prod.outlook.com (2603:1096:203:67::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 00:38:06 +0000
Received: from PSAPR06MB4805.apcprd06.prod.outlook.com
 ([fe80::a42e:36cd:2398:4736]) by PSAPR06MB4805.apcprd06.prod.outlook.com
 ([fe80::a42e:36cd:2398:4736%8]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 00:38:06 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Topic: [PATCH] drm/ast: Atomic CR/SR reg R/W
Thread-Index: AQHXq5TM0RiIoM3rJkSmAmQ7phtcuqusmKiAgA+eivCAZDgvEIAAfg2AgAQ8d3CA5+HcgIAAp9MQ
Date: Tue, 3 May 2022 00:38:05 +0000
Message-ID: <PSAPR06MB4805914FEC5EF65B0D1CC6BC8CC09@PSAPR06MB4805.apcprd06.prod.outlook.com>
References: <20210917072226.17357-1-kuohsiang_chou@aspeedtech.com>
 <7c128e03-842a-57b3-0c11-24fed9d4d126@suse.de>
 <HK2PR06MB3300C768B6A3C390A7D1BBC28CAA9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <HK2PR06MB3300EB8A7BEB41907FB7FC5F8C6A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <4a7ce84d-faef-4fb2-d36d-5cff2fba8ecf@suse.de>
 <HK2PR06MB3300A0A69348024725AFD4BE8C6D9@HK2PR06MB3300.apcprd06.prod.outlook.com>
 <869155ca-cf9c-d334-c815-56f0e9eb2b2b@suse.de>
In-Reply-To: <869155ca-cf9c-d334-c815-56f0e9eb2b2b@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 535aa55b-cbcc-4e5d-be51-08da2c9d305b
x-ms-traffictypediagnostic: HK0PR06MB2513:EE_
x-microsoft-antispam-prvs: <HK0PR06MB251303AF25183327C62F08D58CC09@HK0PR06MB2513.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4rtBP3WRnY/WobPrlCaTGKuRw/FD0rlRkgjspF8S0EEvJopXZcjXCIrMvWF+DWaiBUBAS/Cc4ISCYs78cshTD68fusRZpgG7ExoMUaaGydEZyAouVKPpDxYuiJGU4zBndXVNXOWTIB3jwE7+oWogmO7yh/RDupIeB+ejL66Yu8vZ9tEEmsAGj4zczCG3Gd1OVm59GJroo0Q2IkETDUFLN6oCqDcB2dkWPXFVW5A0msY7Hw5cAl34hce+6p0ERrB/59FOZtaZNC+XqSpJe/GBzcA/JbgR4kmsnhO7TODjFvzrCgVh3V+PzmjxPPwvkBni4q9XguEv728UTy5VBYhI+NGMTJjptYgOntLx9b9716E3U80rd0HPxHagJBQxYQY4Tgg1SERm1tbMAIZihdrkdogsrOpO0Sv/NBFIoAGX0Qb6j+SMLq6yrfHGZIPvTkV1X8lv7i+jn/leofRZpPFIpzE0J0pugnCSdAeAbAuS7vwzATvI2k5NkJ8Zn/DPobLYQHlug3Adsqk6218zk2lfeid85IiuXYueZ6dg5d8Y5XhPEm4ivwoPU/ed1ix3wa60yRd7Neyowx1Zni45mofqo84ZUL+dlzU9wD5ReTzcU6DZqM9SXW0dYkaG95il2rk/n+XLXSf+G4JDGjtrcuuFMjEto6/VXPEAwPdStK0i1lQZiYqL7yJPxF6AG5Gl2fIG5iZF+tOX17vHK4Q90QDfVtKHS15P5ZGiAn1YwgQjVnmB474ab7SnWyNLayHb9an0C4xth7sjo4FI9C06Vt6yFjdShOKRbKIDCp2zShRV/os=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4805.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(366004)(376002)(136003)(396003)(346002)(4326008)(8676002)(66574015)(52536014)(71200400001)(2906002)(66476007)(66446008)(66556008)(66946007)(64756008)(26005)(86362001)(316002)(8936002)(5660300002)(33656002)(38100700002)(38070700005)(122000001)(76116006)(966005)(508600001)(110136005)(54906003)(83380400001)(186003)(6506007)(107886003)(55016003)(9686003)(7696005)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVU3d0R0NFJhYlBhTXAzMmlEdS9tazhLMG1mUVZ3SEpocW93cVByK2VjN1Zy?=
 =?utf-8?B?bFZsNFF4MVBadTEvSEo4a2grOVhaOVNnS1lzODRKczA5QTh4eVR5NlFyOHAv?=
 =?utf-8?B?bS8yUVhPRlNwdUpIdzFEb3NSb1dRejlvczVnb1puY2hyNHFvVTltS1BuUVFi?=
 =?utf-8?B?RVMwVjVxTW9FcS84V2oxUkJHYSttRWovd1BzR1IrbC9rN0hUWHFYN1V2YVNP?=
 =?utf-8?B?Q3BsWmVxVVEwcm1YMUo5Z2tHQVNpQUFmNUxzRmtvUFNNc1JtbHZhZHE1cDdB?=
 =?utf-8?B?ZkJCM2tZWXBPOUhORGJFRFFjNThwOForVm9kMUlBY2dSRnBkZUhZOGU1clB5?=
 =?utf-8?B?eHlSVlEwbm40MFFsVEkrOGVEc2llUFRMbnk1OFZOWmpXVHMxNmxmaG10RlUy?=
 =?utf-8?B?eXI4VWQzZGJkaDMwQ0tlYVNmRjlPREdjcXpNTkZOUWdXMWJjUmRuN1Q1Y2da?=
 =?utf-8?B?S0F4ZWNlUHBjM2lEbmZmUGJaWmtuNXAzMGdsaTFxV0VEdDBRRnR0UkZuR3BZ?=
 =?utf-8?B?SGVKMmp3NksyZzBoS3JxYU5FNy9qWnEzWWxTbVVKblVxMzI2cG5QZHR1VW1H?=
 =?utf-8?B?cmM5ajRTMlhTdGljTzBFY1duQzN1VktNME5OTU9HVUpXU0dFNUdxblVURDBq?=
 =?utf-8?B?YUFjWHFCQkVqYzRlZ2xqWUw2UVRzMjdiOG15ZHRUdXcrd3pNWG9xOVo3ZzV2?=
 =?utf-8?B?RkFBNVU3Rm01OVBrMVladi9mbi9tY0hqeXg3Q1lMZVl5SU5QMG5OOGphVmJ6?=
 =?utf-8?B?YWg1bUZZc2xMcjVvQTEyMXJKV2M5WklpMnRucWY5NllvODVVZVRGZHR4cDVn?=
 =?utf-8?B?NEN6OHZZREEvSDhpR0VkWDBrbld5T0lBbFh3RkNIUGZNeFh2NmZOQUlXWkdZ?=
 =?utf-8?B?Sm5tOWpSZjNuQmViNXQxOGlRcVZqM0RJV2kySHg0SGk5Ykw2dEZqUVljMjJT?=
 =?utf-8?B?RVN5Tzk3MWpuUVVVSU9qU0hpajE2cUQ5NGtHcmVlMlRWcW9LeTZuV2JyaUY5?=
 =?utf-8?B?Myt1SVlmNlJFQVNLWktGeHNDb2Vjb3Rqano1dVdnUjgxTkxNc0RqOXgvZlJK?=
 =?utf-8?B?NkNKUGUxM0JaYklTcXBNOWIwdldCTFI2OUFnL1FUdzNqU3NrRmhpSEhVdHVq?=
 =?utf-8?B?N2dIbEVqaUtheHJMbGRielVCUkNXbmxVeVFnb1huUkRyclpjdHdPbVc4RXY5?=
 =?utf-8?B?NFUzaWdyMFRyNjBDaUsvR3N4cnRUZGRWbUN2am1GUEdFK25JL0RoNGVrdkRG?=
 =?utf-8?B?eWZwWkdoTFN2THRoVmRYdUVBYlVKUXZ5UmxKTkdtS2ZRYjQvU0N6U3pOUytX?=
 =?utf-8?B?YTlBUFVZRURyNUpNOWxzeEJOQ3pxcEZWcEhscHprKzN0NVl2T1hPcUhUVmI0?=
 =?utf-8?B?UDd2dFlISXNPUmhieHV0a1dzN0NpaU5RWkdubmY0TW1nZkRQVk8vdldYek5t?=
 =?utf-8?B?VU45K042Z1hjSVVIaHFFSXQ5Z2V6dDMyb1ZpQXFIdDFnbVZGTlRXS1ZMaU5D?=
 =?utf-8?B?eVI3d2pJbUU4UVFUWHluRld2a3RpaFZPYXFZczVXVVM0MDUrRnBWVTVSaGdK?=
 =?utf-8?B?cmlkNGtuczZEdWhmSzNoOVNJcUEvdVRwMDJBZFI0TWVlMzN4SWFHSHhLc0x1?=
 =?utf-8?B?cUFPVkxZaVJqWFRsTHE5WTM0MlVnMWJpaHl0RkFnaURsekVERnNjL2UrRnFG?=
 =?utf-8?B?bTNTZlB1QWwyZlAwYWRnUGhlckRFVEJHMUYrU2xPQ29Xa3BGK3EwMUtiUllk?=
 =?utf-8?B?UUVKRHhRV2NRS1g4Rlp6MEgxLzl2cFR6dzZsWDZIMDVlNVZ2YzQwOGlCVVdt?=
 =?utf-8?B?T21iQ25JbDRZVDh2elRBYmVOZUJqM1huWExsY21RK1JreU1LVVdnR0Rwd0JF?=
 =?utf-8?B?VHFMYlBNZDBnRFBLbS82TTlQckdHQU56L2s5eFBXK29wckxnZHd4WEkvNHhH?=
 =?utf-8?B?MUtEbXFmcjZ0dGdicmUwOFRXTU5xSVJnYUxaVUhVTkF1TmhGZTFiYWZPak1y?=
 =?utf-8?B?UTJJY3l1RmRKdUlXblE5VXJPQTBJa3l2dE1IanBNL2NuRGhHamZsUE1tSC9t?=
 =?utf-8?B?Z1d6eUJwYnNycnR5emFnanNoYWZ5NWtPQjRYbzFYYkRmNHVjQkFRTGV5K3hX?=
 =?utf-8?B?T0EvdmlKOVAwd3o3d1lPbUVVTi8xK1ZtZURMZFY1R3JISDNncEVRUi9mQ1V1?=
 =?utf-8?B?clg3cDBjV2srRUtYOTJYS1FTMVlNdjBQY1pwTnBBMHFCMHVaUlBLMHNJNFox?=
 =?utf-8?B?eXVHcXpxbmorZTJsbk1Vc1NtS3BoaUxtNWpJNUp3ektiTnFXaHZkNERBUjF5?=
 =?utf-8?B?Z0N3b0RkamM4bm1pQkdKcWE5WnQ0a0lFMUtPSVpsVEY3N05OaWNIZWphL3Rz?=
 =?utf-8?Q?5PvqbJA7dfx7WG2o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4805.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535aa55b-cbcc-4e5d-be51-08da2c9d305b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 00:38:05.8995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ta4bill8Tq5jb3Rdg3Oks8/OxkC2hEEbx/3jprhiT3RrZeY2UijDVDn7vLfUVtvemw3ntFYTpwsiPmXKEbzorPlnUeIS7w/Byc9F/C3zgb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2513
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, "airlied@linux.ie" <airlied@linux.ie>,
 =?utf-8?B?5riF5rC05L+uKG8tc2hpbWl6dSkt5Y+w54GjTkVD?=
 <o-shimizu@nec.com.tw>, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>, Arc Sung <arc_sung@aspeedtech.com>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLA0KDQpUaGFua3MgZm9yIHlvdXIga2luZGx5IGFzc2lzdGFuY2UuDQoNClJlZ2Fy
ZHMNCglLdW8tSHNpYW5nIENob3UNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IFRob21hcyBaaW1tZXJtYW5uIFttYWlsdG86dHppbW1lcm1hbm5Ac3VzZS5kZV0gDQpTZW50OiBN
b25kYXksIE1heSAwMiwgMjAyMiAxMDozMyBQTQ0KVG86IEt1by1Ic2lhbmcgQ2hvdSA8a3VvaHNp
YW5nX2Nob3VAYXNwZWVkdGVjaC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpDYzogUnlhbiBDaGVuIDxyeWFuX2NoZW5A
YXNwZWVkdGVjaC5jb20+OyBhaXJsaWVkQGxpbnV4LmllOyDmuIXmsLTkv64oby1zaGltaXp1KS3l
j7DngaNORUMgPG8tc2hpbWl6dUBuZWMuY29tLnR3PjsgSmVubWluIFl1YW4gPGplbm1pbl95dWFu
QGFzcGVlZHRlY2guY29tPjsgYWlybGllZEByZWRoYXQuY29tOyBBcmMgU3VuZyA8YXJjX3N1bmdA
YXNwZWVkdGVjaC5jb20+OyBMdWtlIENoZW4gPGx1a2VfY2hlbkBhc3BlZWR0ZWNoLmNvbT4NClN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hc3Q6IEF0b21pYyBDUi9TUiByZWcgUi9XDQoNCkhpDQoN
CkFtIDA2LjEyLjIxIHVtIDAyOjM4IHNjaHJpZWIgS3VvLUhzaWFuZyBDaG91Og0KDQo+IEknbSBu
b3QgZ29pbmcgdG8gbWVyZ2UgdGhpcyBwYXRjaC4gQXMgSSBzYWlkLCBJIGRvbid0IHRoaW5rIGl0
IGZpeGVzIHRoZSBwcm9ibGVtLiBNb3VzZSBtb3ZlbWVudCBhbmQgcmVzb2x1dGlvbiBzd2l0Y2hp
bmcgc2hvdWxkIG5vdCBpbnRlcmZlcmUgd2l0aCBlYWNoIG90aGVyLiBUaGUgRFJNIGZyYW1ld29y
ayBzaG91bGQgZ3VhcmFudGVlIHRoYXQuDQo+IE9LLCB0aGFua3MgZm9yIHlvdXIgY29uZmlybWF0
aW9uLg0KPiANCj4gSSBjYW5ub3QgcmVwcm9kdWNlIHRoZSBpc3N1ZSwgYnV0IHRoZXJlJ3MgbW9z
dCBsaWtlbHkgc29tZXRoaW5nIGVsc2UgaGFwcGVuaW5nIGhlcmUuIEhvdyBjYW4gdGhlIHN5c3Rl
bSBzd2l0Y2ggcmVzb2x1dGlvbiBhbmQgY2hhbmdlIHRoZSBtb3VzZSBhdCB0aGUgc2FtZSB0aW1l
Pw0KPiBTdXJlLCB3ZSB3aWxsIGNoZWNrIGlmIHRoZXJlIGlzIGEgMTAwIHBlcmNlbnQgbWV0aG9k
IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUuDQo+IFRoYW5rcyBmb3IgeW91ciByZXNwb25zZXMuDQoN
CkkndmUgYmVlbiBhd2F5IGZvciBhIHdoaWxlOyBzb3JyeSBmb3IgYWxsIHRoaXMgdGFraW5nIHNv
IGxvbmcuICBJJ3ZlIG1lYW53aGlsZSBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVt
LiBJdCBoYXBwZW5zIHdoZW4gR05PTUUgY29uY3VycmVudGx5IHRyaWVzIHRvIHNldCB0aGUgdmlk
ZW8gbW9kZSBhbmQgcmVhZCB0aGUgYXZhaWxhYmxlIHZpZGVvIG1vZGVzIGZyb20gRURJRC4gUmVh
ZGluZyBFRElEIGlzIG5vdCBwcm90ZWN0ZWQgYWdhaW5zdCBjb25jdXJyZW50IG1vZGUgc2V0dGlu
ZyBvciBjdXJzb3IgbW92ZW1lbnQuDQoNCkkndmUgcG9zdGVkIGEgcGF0Y2hzZXQgdGhhdCBzaG91
bGQgZml4IHRoZSBwcm9ibGVtLiBTZWUgWzFdLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpb
MV0NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIyMDUwMjE0MjUxNC4yMTc0
LTEtdHppbW1lcm1hbm5Ac3VzZS5kZS9ULyN0DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IAlLdW8tSHNp
YW5nIENob3UNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+Pg0KPj4gSGkgVG9t
YXMsDQo+PiBHb29kIGRheSENCj4+IE1heSBJIHVuZGVyc3RhbmQgdGhlIHJldmlldyBzdGF0dXMs
IG9yIGlzIHRoZXJlIGFueXRoaW5nIEkgY2FuIGRvIHRvIGltcHJvdmUgaXQ/IFRoYW5rcyENCj4+
DQo+PiBCZXN0IFJlZ2FyZHMsDQo+PiAJS3VvLUhzaWFuZyBDaG91DQo+Pg0KPj4gQmVzdCBSZWdh
cmRzLA0KPj4gICAgCUt1by1Ic2lhbmcgQ2hvdQ0KPj4NCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhv
bWFzDQo+Pg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogS3VvSHNpYW5nIENob3UgPGt1b2hzaWFu
Z19jaG91QGFzcGVlZHRlY2guY29tPg0KPj4+IC0tLQ0KPj4+ICAgICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9tYWluLmMgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+
Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgDQo+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgaW5kZXggNzlhMzYxODY3Li4xZDhm
YTcwYzUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+Pj4gQEAgLTQxLDI4ICs0
MSw1MiBAQCB2b2lkIGFzdF9zZXRfaW5kZXhfcmVnX21hc2soc3RydWN0IGFzdF9wcml2YXRlICph
c3QsDQo+Pj4gICAgIAkJCSAgICB1aW50MzJfdCBiYXNlLCB1aW50OF90IGluZGV4LA0KPj4+ICAg
ICAJCQkgICAgdWludDhfdCBtYXNrLCB1aW50OF90IHZhbCkNCj4+PiAgICAgew0KPj4+IC0JdTgg
dG1wOw0KPj4+IC0JYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4+PiAtCXRtcCA9
IChhc3RfaW9fcmVhZDgoYXN0LCBiYXNlICsgMSkgJiBtYXNrKSB8IHZhbDsNCj4+PiAtCWFzdF9z
ZXRfaW5kZXhfcmVnKGFzdCwgYmFzZSwgaW5kZXgsIHRtcCk7DQo+Pj4gKwl1aW50MTZfdCB2b2xh
dGlsZSB1c0RhdGE7DQo+Pj4gKwl1aW50OF90ICB2b2xhdGlsZSBqRGF0YTsNCj4+PiArDQo+Pj4g
KwlkbyB7DQo+Pj4gKwkJYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsNCj4+PiArCQl1
c0RhdGEgPSBhc3RfaW9fcmVhZDE2KGFzdCwgYmFzZSk7DQo+Pj4gKwl9IHdoaWxlICgodWludDhf
dCkodXNEYXRhKSAhPSBpbmRleCk7DQo+Pj4gKw0KPj4+ICsJakRhdGEgID0gKHVpbnQ4X3QpKHVz
RGF0YSA+PiA4KTsNCj4+PiArCWpEYXRhICY9IG1hc2s7DQo+Pj4gKwlqRGF0YSB8PSB2YWw7DQo+
Pj4gKwl1c0RhdGEgPSAoKHVpbnQxNl90KSBqRGF0YSA8PCA4KSB8ICh1aW50MTZfdCkgaW5kZXg7
DQo+Pj4gKwlhc3RfaW9fd3JpdGUxNihhc3QsIGJhc2UsIHVzRGF0YSk7DQo+Pj4gICAgIH0NCj4+
Pg0KPj4+ICAgICB1aW50OF90IGFzdF9nZXRfaW5kZXhfcmVnKHN0cnVjdCBhc3RfcHJpdmF0ZSAq
YXN0LA0KPj4+ICAgICAJCQkgIHVpbnQzMl90IGJhc2UsIHVpbnQ4X3QgaW5kZXgpDQo+Pj4gICAg
IHsNCj4+PiAtCXVpbnQ4X3QgcmV0Ow0KPj4+IC0JYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGlu
ZGV4KTsNCj4+PiAtCXJldCA9IGFzdF9pb19yZWFkOChhc3QsIGJhc2UgKyAxKTsNCj4+PiAtCXJl
dHVybiByZXQ7DQo+Pj4gKwl1aW50MTZfdCB2b2xhdGlsZSB1c0RhdGE7DQo+Pj4gKwl1aW50OF90
ICB2b2xhdGlsZSBqRGF0YTsNCj4+PiArDQo+Pj4gKwlkbyB7DQo+Pj4gKwkJYXN0X2lvX3dyaXRl
OChhc3QsIGJhc2UsIGluZGV4KTsNCj4+PiArCQl1c0RhdGEgPSBhc3RfaW9fcmVhZDE2KGFzdCwg
YmFzZSk7DQo+Pj4gKwl9IHdoaWxlICgodWludDhfdCkodXNEYXRhKSAhPSBpbmRleCk7DQo+Pj4g
Kw0KPj4+ICsJakRhdGEgID0gKHVpbnQ4X3QpKHVzRGF0YSA+PiA4KTsNCj4+PiArDQo+Pj4gKwly
ZXR1cm4gakRhdGE7DQo+Pj4gICAgIH0NCj4+Pg0KPj4+ICAgICB1aW50OF90IGFzdF9nZXRfaW5k
ZXhfcmVnX21hc2soc3RydWN0IGFzdF9wcml2YXRlICphc3QsDQo+Pj4gICAgIAkJCSAgICAgICB1
aW50MzJfdCBiYXNlLCB1aW50OF90IGluZGV4LCB1aW50OF90IG1hc2spDQo+Pj4gICAgIHsNCj4+
PiAtCXVpbnQ4X3QgcmV0Ow0KPj4+IC0JYXN0X2lvX3dyaXRlOChhc3QsIGJhc2UsIGluZGV4KTsN
Cj4+PiAtCXJldCA9IGFzdF9pb19yZWFkOChhc3QsIGJhc2UgKyAxKSAmIG1hc2s7DQo+Pj4gLQly
ZXR1cm4gcmV0Ow0KPj4+ICsJdWludDE2X3Qgdm9sYXRpbGUgdXNEYXRhOw0KPj4+ICsJdWludDhf
dCAgdm9sYXRpbGUgakRhdGE7DQo+Pj4gKw0KPj4+ICsJZG8gew0KPj4+ICsJCWFzdF9pb193cml0
ZTgoYXN0LCBiYXNlLCBpbmRleCk7DQo+Pj4gKwkJdXNEYXRhID0gYXN0X2lvX3JlYWQxNihhc3Qs
IGJhc2UpOw0KPj4+ICsJfSB3aGlsZSAoKHVpbnQ4X3QpKHVzRGF0YSkgIT0gaW5kZXgpOw0KPj4+
ICsNCj4+PiArCWpEYXRhICA9ICh1aW50OF90KSh1c0RhdGEgPj4gOCk7DQo+Pj4gKwlqRGF0YSAm
PSBtYXNrOw0KPj4+ICsNCj4+PiArCXJldHVybiBqRGF0YTsNCj4+PiAgICAgfQ0KPj4+DQo+Pj4g
ICAgIHN0YXRpYyB2b2lkIGFzdF9kZXRlY3RfY29uZmlnX21vZGUoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdTMyDQo+Pj4gKnNjdV9yZXYpDQo+Pj4gLS0NCj4+PiAyLjE4LjQNCj4+Pg0KPj4NCj4+
IC0tDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4g
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KPj4NCj4gDQo+IC0tDQo+IFRo
b21hcyBaaW1tZXJtYW5uDQo+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4gU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueSAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+IEdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg0KLS0NClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K
