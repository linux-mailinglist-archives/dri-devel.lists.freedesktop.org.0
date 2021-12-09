Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DFC46EE85
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9831010E38D;
	Thu,  9 Dec 2021 16:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B8E10E116
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 07:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNtMBSc4LRO0FE1+YQonx+WmlK//1Kx8a0WBX9wQcFrhvq7M19hYly/BlKZBe8SoE0LLosRt6buBulYXWTdsiBCkL5a1yLPnuRP4Nd/F2wWf3wNhO1CMf0piyjDqvrNFATuUqe7g+yhmPPnmxnbs83+V/UWxzUEPP8x/uv0FFqnmLjB44b4QNtyPSkrT8RsxN2V60Rdz/lRZ+U7th8uRH798nZcbH0+U+xxq8Y2+LCLt8w2/fXCwCIARHQ9jl21ojZwviIwpCu0UydiwG95KsmM8Bca8EiJoclCW10D1+ovzdhqdn735oZC/wRpegR2shGHlWgzXIq+iyF4cprvS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQBzHchHvpYW7gZXdBbehVDU6oMRIDterwvWcjqWiFg=;
 b=Z4xyra6flh2JoC+7T5qN2+wWohloznmTBuiis8wQ4X3S7z3s1xwQVbU7KUZjav9WlS8LRdq0Ja6ikN8u2SOlYP9gajdqtRZw6fbbMZ3Tamr6lM9zVhjdTZElKcPh9WbXOWC+yPuDhgK8eh/YYlitepww/8FwZMhW1A9Vmahl/P1xnG68l+vr7UuVZguB81gVBkDBhksWlmwz9vCFH6pKmM6O6mOT46mEOeFJbEFG6I2jaqz3EPde8ghTCXcJeoZvrx0ovqGyUDfKf0E1tERLHqIbwS9TvVBDI7+uwExO9uiUo7ft5cyCycAbnqocTiLe9XF25jgQtQuH2W9vw/WJFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQBzHchHvpYW7gZXdBbehVDU6oMRIDterwvWcjqWiFg=;
 b=BNKAEMNvy/SzKPtlBPC5rKkKRt1FQJgYu9FFQGlMeuh9fcDMZVYqWagyiCLe1Xit99xGPbjZxHU+6eeS1ACHMea0GvG8MnzAkf3bZTwNl0S110LoFNrPMtvO110ssd0GeJt91c1ZxZLLIPPcMbSpAvfPonAajgeOvlUJya7vAFw=
Received: from DM6PR05MB7099.namprd05.prod.outlook.com (2603:10b6:5:14e::10)
 by DM5PR05MB3500.namprd05.prod.outlook.com (2603:10b6:4:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10; Thu, 9 Dec
 2021 07:33:37 +0000
Received: from DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::eca1:ac54:5509:47dc]) by DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::eca1:ac54:5509:47dc%4]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 07:33:37 +0000
From: Martin Krastev <krastevm@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Zack
 Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Bump the minor version
Thread-Topic: [PATCH v2] drm/vmwgfx: Bump the minor version
Thread-Index: AQHX7KdqY5UMazPBmkeozKGCeeuO+qwpxNAA
Date: Thu, 9 Dec 2021 07:33:37 +0000
Message-ID: <0ddf6527e8395201dbb23456a8f6f9217391ae8a.camel@vmware.com>
References: <20211206172620.3139754-13-zack@kde.org>
 <20211209024924.3298137-1-zack@kde.org>
In-Reply-To: <20211209024924.3298137-1-zack@kde.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e3f863c-58f2-478f-2e1d-08d9bae636cb
x-ms-traffictypediagnostic: DM5PR05MB3500:EE_
x-microsoft-antispam-prvs: <DM5PR05MB3500BFE60FE9696E7307E992AE709@DM5PR05MB3500.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XGWqeMW77jcztDojap5zwkerxQmNE9teqSY7T4E1fIScChwGa/Wh3QE2mjAxRtE7NnCYbYOWqFnoRsxcbIfzqDQV+MdbJq8DlNaUBLCxelUvRQkLzmOu+rRI+rPEwL5/Zu4/ucFmQWXWZNbuLKV1iAI7b7RRB0lwkIuCJ6TmCHqtMheDqSawipNUbqFjLyjumU1jXeSjAsShemXq3xWEibAdF93leE+wfQollIp0hqp7HdBvjqeRoD8EQ/S7y4B4poRbrX9R6cZxouapEa+Iwxv51yIjNILBvwuKU+hhH5yw9x/H0apAnBC8XvuOYeOfgPx/a5a1JGMwzgbqTzK27IboPRfFQhHf+xePC6J4O1E69Qtu3lqLNzdQp0UyYoC/8v97MsHfIVycBk0yT56mFLfRs4EqX1iSXNZljy7ZADCSIt3xf5Si+mldenbLpgyG5uHmsU7byScZ2cC5JNnUzJxarHFi5KKV6KCcarq8AGuBUVS4Sg+myuVZLr6e5aFtqOizIRMbdaz6skvDX3Hm00B8Kpwboux5XflzHz3HssgAQFbI6QELPYEqqXoHO7SN5/dYVbwwyZY9i+3P6T3uFsy0Keds6SSw/pQ/4D/+/FpZeataoKeQfIjBPvU1TPGD9PZtZNQs6cqJ6IqTp1fF1MYj1Jpl6oSwxl6fV3QxEkNHwR0swcy6XmBYHlKkyASXPYeNooV1GB3Ril/wZA9kjGsZM7pkoruiNPiOFIBP/9GiV/jO93cENtme0pRb/h7n
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR05MB7099.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(508600001)(5660300002)(83380400001)(316002)(64756008)(6486002)(110136005)(38070700005)(66946007)(71200400001)(91956017)(6506007)(4326008)(122000001)(6512007)(66556008)(38100700002)(36756003)(186003)(2906002)(8936002)(86362001)(26005)(8676002)(107886003)(76116006)(6636002)(66476007)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkNkRTVHSnZKUHNZZUE1Mi91UlJIWGxvQVJ4TGtlSHBWT1lqd0xmMkkwRW41?=
 =?utf-8?B?c0R5MW1VbnB5SDhyK0llSkprcUdUbGxSZEFIQkJGK3VlQXFpeXFWVnhXNUh1?=
 =?utf-8?B?emhlTWc0eHpPYTVWQzdVOFdLUlpnbWFUVit2ZFpaNzVyK05nSmVPZEthMnA1?=
 =?utf-8?B?Q2xtNVhTZE1GVEZSYXo3RklxMC9MM21MK1dKL3NYRTI4NmRnYUcvV0JMMDNl?=
 =?utf-8?B?WHMxd1o0K01jeWJnQlhnZXFLdFYrTmJKeldtREV6eHRLcXZmQ2hKRUsvb2dZ?=
 =?utf-8?B?UHlycmNpMC9TZmR1aHJmVFh5UEQwcm5VMjdoMHZ6ZHlCMTJ2eTIwZVEyRnVT?=
 =?utf-8?B?dUU4Z05xNDhZd2hvT1hhMWd1TGdZZ1Zsd3NrcFlqVTF4MjhISFpsd24za0tz?=
 =?utf-8?B?ZlRuTXRhVjFtV1B6NHhuR3JWc2dNWXUyYkNHWmxFUWwrY1d1cFlsaTk5WDhG?=
 =?utf-8?B?eXJuUVJxVGpkWXpvRmd3WGdnNnBlZzV5VXFpOGcyRDZmODVEWFY2VlBOSGRi?=
 =?utf-8?B?aFVuNUF1bjFtM3dCQVdMNUlRS0VrY1VwM1dOWVJVS3lpSndkYXIwMWVnaTV3?=
 =?utf-8?B?TUk1aTMvMHBQTkgzMWtmaXdwdWZxdUxaU09ycU5mU25jdE5mbW5WQ0pjaHNt?=
 =?utf-8?B?VUIwaE9jeWJyVEc1b1lyYklqWEJmZzVaUlVXN1djb2phMEpUOFJHbDBVMjBr?=
 =?utf-8?B?Z1VDODQ1V3dXSWtYOUF5WkozQ0UvQlNjenVNN0ZLWnhpcEErc2tIUFZBeVF3?=
 =?utf-8?B?N0RCLy9uQWd3bWl4d1QyNVhrN21nS3QyT2JRNU52NEpBYURaYXBBd0hMT2Nz?=
 =?utf-8?B?OGRUVjh4MzdOK2dlUWRGY1kxN2RsOFFyelRZdk1YKzdqbXFDUVdXalMvaEVH?=
 =?utf-8?B?K3Rxa2FvYldSZlR1a2l4MTViMTJaYjJFa2VUWmFVN3ZBUWJGSXRqdVVUVHgy?=
 =?utf-8?B?N1d6djdodzdRVFc0M1J4M2Jham9BQnhYVXBLbEtRR0w0SmQ0YW1vUTdidGho?=
 =?utf-8?B?MHgrWTNMSmxPMkJKRms5Umg1TEViV3M4d1BSWFdvK3hQNWF6Z3Y0VHFmTWdL?=
 =?utf-8?B?RmtsOHBFVEd6NlcySW51RENtOHBvbFN3aGpZNnBjM2U4K2R5T0JSSU51aU53?=
 =?utf-8?B?OFVhOW1zTm56SEY0a0hYRWkrbU5MTmtKTS9QNFhxdmtCYzJENjlBbmhoY09V?=
 =?utf-8?B?dDFEVEZCRHhLOW5pclFPSVpkckw2QUdiaVR5dkZCZHp1Z1ZGVVFVNUdIM0pZ?=
 =?utf-8?B?TC83MTFpdjVlU050eVVudjZMZloxWGZJNS82N3Jaa3YwcEkwTVJjemk2Q3Nz?=
 =?utf-8?B?b3V1YU9Da05GZS9QVCtlcTVWVm0vb3NZcFZJV2pubmx6ejJlK1pxbEp4Zk56?=
 =?utf-8?B?MEtZYzltRlZINUZTTzJySTZVd3pEa1k1KzEzR2NrVVdsRWxyQnZVTGluMnM3?=
 =?utf-8?B?cTBxMUdJV2xFWnl4TXFDVmFHc0pyMzVHc3hsZlk3N0NDeXpKSE0wZmJ2WDA1?=
 =?utf-8?B?cG1veit3ZTdDY1NaMGNsaWM3OTdTZGNLRlo1Vmc5Y2xLSXZjeWtxKzg1QmQ3?=
 =?utf-8?B?c2FnSk5NRUIreFBKUXNCRkdKSmhWekY0UmFkZmpyMUZrOWpPUy9UWnF2QmQ4?=
 =?utf-8?B?SlIvZndwWXV1Q0dxd2Z6enVLckk1SmNvcDUwOTRvTDBnT3M0cTFyYTVKdjdS?=
 =?utf-8?B?eUxXV2xHZXNvWlN1aHZVOVF2bmFqbzc2M3pUcU5EOGp2b0dZUW1ZMHpSUG5P?=
 =?utf-8?B?V055NktKUG45Sm1yNjFxZDVya21ieWxnV2pqQnIrV3FGL2JmbUdLb1N1VGpH?=
 =?utf-8?B?RnluZ3RINjJORnc5N3luSVRFNG1JNnByT0hrOHpOVnpKZkJPVzBmYjc3RXlj?=
 =?utf-8?B?aXpyM0wrZDRlbk1FUE90Tzc0WEhTbTMwM1NqMW5VdFpwOHVscyt6SFIzZDFt?=
 =?utf-8?B?Ukg4WDFYY29EOUF3Y1p4NDdlZVdUZkNyTHpDNzZaMHF2SkRVSndXSmR4T0Rm?=
 =?utf-8?B?dlQ3cHJDc1prNi9yL0VvT0M0bVFLbUFYYnlUVVFFVnl4NmdkRFMyS1BhM3Bt?=
 =?utf-8?B?RnpvdkFlN1Ftb2V3bVUvWjMxR2FSeUYxVThROUpqcjBZNGt3UGVWL0NTT2pK?=
 =?utf-8?B?NUZmVDFkTGw1NGFLaERkcG5uTFFUc3ArdVhjYWQ3T0FXVmlOazFueURkSFlk?=
 =?utf-8?Q?ZjYRUBmf7k4kj3nFYJHSyEI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2692BF566260A64F855CEA973CF43358@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB7099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3f863c-58f2-478f-2e1d-08d9bae636cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 07:33:37.2876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qlII66TivTmSwh0Sgk9eQjnGbOUSiU34Ty2PkOkg/MNhpO15yYqC2k3cO7LGF0g4y8Oky3bYbVtDQHAPp3nucA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB3500
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
Cc: Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTEyLTA4IGF0IDIxOjQ5IC0wNTAwLCBaYWNrIFJ1c2luIHdyb3RlOg0KPiBG
cm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiANCj4gdjI6IE9sZCB1c2Vyc3Bh
Y2UgZG9lc24ndCBsaWtlIDMueC54IGFuZCB3ZSdkIGxpa2UgdG8ga2VlcCBpdCB3b3JraW5nLA0K
PiBzbyBsZXRzIGp1c3QgYnVtcCB0aGUgbWlub3IgdmVyc2lvbiB1bnRpbCB3ZSBoYXZlIG5vIGNo
b2ljZS4NCj4gDQo+IFdpdGggR0VNLCBHTDQuMywgc3RhdHMgYW5kIHJlbW92YWwgb2YgYSBsb3Qg
b2Ygb2xkIGNvZGUgaXQncyB0aW1lIHRvDQo+IGJ1bXAgdGhlIG1pbm9yIHZlcnNpb24gb2YgdGhl
IGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5j
b20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oIHwgNCAr
Ky0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuaA0K
PiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oDQo+IGluZGV4IDE3NjBiYTFi
MGQ0YS4uNGVjMmI5OTM1MWNmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYu
aA0KPiBAQCAtNTQsOSArNTQsOSBAQA0KPiDCoA0KPiDCoA0KPiDCoCNkZWZpbmUgVk1XR0ZYX0RS
SVZFUl9OQU1FICJ2bXdnZngiDQo+IC0jZGVmaW5lIFZNV0dGWF9EUklWRVJfREFURSAiMjAyMTA3
MjIiDQo+ICsjZGVmaW5lIFZNV0dGWF9EUklWRVJfREFURSAiMjAyMTEyMDYiDQo+IMKgI2RlZmlu
ZSBWTVdHRlhfRFJJVkVSX01BSk9SIDINCj4gLSNkZWZpbmUgVk1XR0ZYX0RSSVZFUl9NSU5PUiAx
OQ0KPiArI2RlZmluZSBWTVdHRlhfRFJJVkVSX01JTk9SIDIwDQo+IMKgI2RlZmluZSBWTVdHRlhf
RFJJVkVSX1BBVENITEVWRUwgMA0KPiDCoCNkZWZpbmUgVk1XR0ZYX0ZJRk9fU1RBVElDX1NJWkUg
KDEwMjQqMTAyNCkNCj4gwqAjZGVmaW5lIFZNV0dGWF9NQVhfUkVMT0NBVElPTlMgMjA0OA0KDQpS
ZXZpZXdlZC1ieTogTWFydGluIEtyYXN0ZXYgPGtyYXN0ZXZtQHZtd2FyZS5jb20+DQo=
