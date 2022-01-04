Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3FA483F41
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 10:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E555A10E590;
	Tue,  4 Jan 2022 09:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300115.outbound.protection.outlook.com [40.107.130.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FCA10E590
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 09:39:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfLZZHkrhfpx6QfM8dpDc38mVOUOXkePhS+sE+jg6NzszsY1QNXr8bK4xe0dwaUHL6VA7j1Vp8oKqhJrqdkMV8g3kuw8rTdToxFuBLWjhJcBdzXt9Q9wiRkRPJF+rgD945pfIRZMaeSg1Ie3+lU+9+pQzdrQ3C9Ow6bKc+5ll+obZE/MMt8znN6CFEVR+X2H26p9pgSlVOhcGsC6qXdXB5cPCd7JK+G6tBxxdw1gCNktjo1V1wIrzLv8SSFnCPSwe5EtCxWzaGNDYUUc3ljzrVvCVAtifRIRAeMIOFObeq+jVMN05jwHDrMRVvsBn+lwSvhDEN5zQ+k1bOONcWlgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFHgVdc+BtcM0FrXnzBJhO5G1URSiZksY0uA+6vOp2A=;
 b=GHkfu73PYJttv+eFoGMLOdhtSwyUOKVSriMDHnrXrqtax17BYZPi4qyLZQ/cv9yuhI621XPBuN+NdVegVVCMcDhIxiir8QVJ8y3Zg5he+kjImvmgJrNptimW4NgINGg3IFUzbGgd5zNCqv+rMwrLNPTgQmz4POeNyn/mH4JNWPm7BZj/zShOhDi5ji6O4z+Vchopf3KMm4NABD2eci69tCgKGZeCfm113i1AEPltAvD4yrULEAIxI48L8cyU/KO5Dc//uEPhSK/Y6LpuUacrM8ZjIiTkMzS8SoDeJKzmK3F490+UHlFx8m9/39bE2bDi83YaA0JF0zsNKUlrRiFsYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFHgVdc+BtcM0FrXnzBJhO5G1URSiZksY0uA+6vOp2A=;
 b=Y1P3CfXS9pURxM0Zs8nImt89wN+e/jEXlWmpmulWAGWjdUootYfv1pBEMSY8XxGTMevK1K9U8XRCO87E2cvqRP8BMgK0R7m1w19BWQ9e6Id3ReelhtVNrYeNnD0hBzyTp6328d0HH6sLWzmyj3K9GIbBpPbjPqoNcrBaeJyM9ws=
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PSAPR06MB4408.apcprd06.prod.outlook.com (2603:1096:301:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 09:38:57 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::81a5:768b:64a1:b284]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::81a5:768b:64a1:b284%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 09:38:57 +0000
From: =?gb2312?B?1dS+/L/8?= <bernard@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBncHUvZHJtOiBmaXggcG90ZW50aWFsIG1lbWxlYWsg?=
 =?gb2312?Q?in_error_branch?=
Thread-Topic: [PATCH] gpu/drm: fix potential memleak in error branch
Thread-Index: AQHX2ugw7dR2aqqt/0CHm7T8Pf0La6xMt96AgAYsGGA=
Date: Tue, 4 Jan 2022 09:38:57 +0000
Message-ID: <PSAPR06MB40216FB1425E72891B6A6B28DF4A9@PSAPR06MB4021.apcprd06.prod.outlook.com>
References: <20211116124751.31181-1-bernard@vivo.com>
 <ACIArwAdEzJlxV*UItyRxarz.9.1640948962309.Hmail.bernard@vivo.com.@PDg3emdvaGh2emEuZnNmQGludGVsLmNvbT4=>
In-Reply-To: <ACIArwAdEzJlxV*UItyRxarz.9.1640948962309.Hmail.bernard@vivo.com.@PDg3emdvaGh2emEuZnNmQGludGVsLmNvbT4=>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 638d1184-66b5-487f-5a70-08d9cf6607dc
x-ms-traffictypediagnostic: PSAPR06MB4408:EE_
x-microsoft-antispam-prvs: <PSAPR06MB440810CBDC60917BE65FB027DF4A9@PSAPR06MB4408.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GGOEcx6DDIya8c6yAvDKsjtt6qmSFDiU6DKr/wotsra4PTMzilhU17GcJboPaD6Hquuly3RyvaTOh1D5lKH+MfggL23UwOvorQNMkb1ksyn1Wj09t5yB+mIArkHLDf1kytbUqc2a7frq+d/ivuI+zqt9fE5yGMreAE+ZerANMcF1uiOBnoYNhE/j8g8Qo2TL+z1D93/vIH7FiU0JSiNZw21zE6ohFECbR8smcqy3qUaijwidttFuwvdMD/K52/Cxqax+wJVvbcC/7QPqsAkMXWNMGUzsF44dv71pXfs34XJbZg1CFU7BEUhwoUiR9NWMSbq7RhL5wYkPrMLezLa3o/hs+gfuaJer6T8qaNmxKmeY8iBfIx7yKHzyw2cwcchg73hJ95NlaNKudBaREoQ2LICm1w92hdMOJbLJIZjUnibKU3Ua58WUxdmdZ7urIdjqTBB5mZi5BkEC+xTyY2Fmqpuj94JnXeKqCkvdQ8CXE7kmEvVb3Ah1eploisiWl1jvkfUUkbZQrP7UM6GAzCIydtjMROgPRU/s4ZslTmmlTULZg3zE+aY38P58QtFq7BeoifihDkBxRbBHp+wDLJ7UE/J2vrczBbMpuy/zis0PNyA5UPceFb8RE6zq0GkFKJpE5Sd04txDzrFGK2rKutPHsfv3tt0OU5kt3R6cXuYHSqkkCeVROE9bn4pUrq8NpVAqQ6GrNGBDewXlEVvPh04FRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66476007)(224303003)(71200400001)(83380400001)(33656002)(38070700005)(316002)(5660300002)(26005)(186003)(85182001)(6506007)(7696005)(8936002)(38100700002)(76116006)(122000001)(9686003)(66946007)(508600001)(66556008)(55016003)(110136005)(2906002)(66446008)(52536014)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VDRQYVIyNzBqYkh4bmF1RFh4N1lkT0IvZXZsMGNxYmpNeTF1cjlvSkxaZ3pC?=
 =?gb2312?B?dTh6K1h1QkJ1UWc2cGp6VmdjREMvd3Y4N0VBSW1RMXFHTzFxckpkR3hkalBv?=
 =?gb2312?B?bHRoZFYvN3NJZHM3QlVJczB4cnJlcnN1Ui9YMmZmVHlqS2RVZ0dmUkFzZjlM?=
 =?gb2312?B?UUgvQy9qRVhkZUtOZmIrU1B3bnF4dFpFS0JTOHNERmtCb01nUU9PYmQ1bVFr?=
 =?gb2312?B?SENTK2I1WThreVFxNlkwRWdpSUlNQzdURmVIR3MyMFhaYmk1Q2d0RkpSTHQ1?=
 =?gb2312?B?VXljeHdTTXlqMGtVVHRtQVhLZ0dnRU5aR2htQnV5MkNWcFJsZE5kRnkwalh0?=
 =?gb2312?B?bElDNXlDNitRM0hEYmVUclQwVGxkbnF0Qk53azJhUXR3TlBPQUpIa1MwaEdx?=
 =?gb2312?B?ZHZPY3hmWUZrZmNmY1k5TXVDaVZWNUpvTmhPMmFCdjJjWVJ1Um9aVnlHQjhn?=
 =?gb2312?B?b0lJUERXMmF3SVVKRUtzRUVHRnh6dlRhVTJsMWdJenNNTzFiZFZCbmh5M3lJ?=
 =?gb2312?B?Z2MreW1teFArSzV5SVArZTRFSnhjNmhrd2M5WmRHRWllWU1va1RFNnVhOXhZ?=
 =?gb2312?B?M2ZNWGdsaXQ2RVRXa2UwYXlIWGpWVE1xSllCby9DWEQ1am5yeGVVVG9hSk8z?=
 =?gb2312?B?SmlJQm5oL3hwOEkwdXhtdU1mcEgydnlyeTZCNUx5WXZ3OUltL2ludFFHejhB?=
 =?gb2312?B?L2R1Y2I3cVNyZXRSS1ZrRTJISHRNK0pRdE9Ib2JjTzNyU0Zpa0dWcG5PdHBa?=
 =?gb2312?B?QXJqVjV4VXh4clZLQUNsNWs0VzRhU0luaTdKb3FhSFNYNVlHYndWZnh1QWZV?=
 =?gb2312?B?OEhjcGgraldFM1FtMHVGUks1Tit3Z1dmRmxLYUU3TDJJalZFYWtETE1hZjBx?=
 =?gb2312?B?ZU5CdnFOeTVJYWUybVhmbC9lZFVEdHhHRWUrNnpyazFMMXplclFkRXJrY2xB?=
 =?gb2312?B?aXNhVjBJd2NJUEh4ZlRYcGxOZVBnQjVycVRDbE1ZL0hsVVZ4WWQ1NzR2cGZY?=
 =?gb2312?B?dzlRTUJTT1JHQVdzQ2RpZnM1YzVkQi9xUjNPc0hZa0JTYlQxNVU5d3ErTVpS?=
 =?gb2312?B?RmRVZVF5UVZyYmp4Qk9waGlQN095OFNVSzJBTWZVbjNPcU9VZXl2ZW9nVVB3?=
 =?gb2312?B?K3Yzc0dqZW5YbzUzWUFPVFVlRXlPUCtFcU1mZGRaMm1CV200WmN6WlRaOExh?=
 =?gb2312?B?aFNRMGhUdjZqYTlQYzJsL0xZcnVEL09xL1h6UlZsTXk4bzMzT3lZNEZUeTBl?=
 =?gb2312?B?NDZTZDYwWmpRampOZThQMUtVNE1wYXNXZklhQmhTbWU4M2RsQUg2SWs5d0M5?=
 =?gb2312?B?MVVaaC9Ca1BCd21CTkptaXliMTJzZm5taVpVMlV5UWdURm8xN3NsbWkxM1pL?=
 =?gb2312?B?aUFsZDh5OW9FTFhQMnM5bTZmdzRkTnNXUUVaeVZHczhHK2F4dldMTUhza1l6?=
 =?gb2312?B?RDY0Q1gvdGt4SWFJM0Zyd3h1Yk9HMmFma09vTHc2TUJYa1VBS0NodWdXLy9V?=
 =?gb2312?B?alpZYUUyYnlxZjZ5b3FzbzVWMER4QitTb3NNaXltSzFGdnM0YzNCR282djQ0?=
 =?gb2312?B?cnJmMFhEWmZ3MzBJQm9FUjUyV2YwM1hhVFNkUWhyRWdLVVZNbHJNSEE2YVdC?=
 =?gb2312?B?TEJwRk9UTG1OYlpmYnd4RkFpL0x2cTJEV1EwSjNzVUNQWUUrTXZjMS84Yk1v?=
 =?gb2312?B?SFdncW83SXVmYVc1cENkSGxqTHJzdExtdVIxUUd4K2kzbXpieS9LRW9Sc0NT?=
 =?gb2312?B?ZHN0OGEreTkxZk9TUmRHcG5sWDNnL2FWdmRWS0l1V2xCUFZIUS9XQ2MxYkxn?=
 =?gb2312?B?aWd4ZG82UTNRTFhmN2NUUkFLWURETUF1bG5aeHQ3Rys1T3FEZ0NTV0JTVGY0?=
 =?gb2312?B?Y1JwS0tQNmtadTNQdUU0Rm5Sb09EMFAxOUt2MzNGdm9BaU1xdEIwNThZa21u?=
 =?gb2312?B?UEE0ekxaTHdZOUlJUDlvZ2xPczdzWHlXbTNIRENEUmlTaVRnczU3c0pMb2E5?=
 =?gb2312?B?ZzlUQ2dZY0ZCN2xpY1M4ZFl3RkZEWUhWQ3RSRjc2ZENVWUgxcUdBbzhEZUwx?=
 =?gb2312?B?TEhvZFdoRWtkZ2YzZmhCam1BZ2hoNk0yaUIvN1g2M0hDcHB3bTFxck1lc09s?=
 =?gb2312?B?MXBPYlpjb3VVNzlhSU5Ha2hjamlXbVg3bmI2SUp3MkJnSGtubE5XZWd4S2ht?=
 =?gb2312?B?Znc9PQ==?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638d1184-66b5-487f-5a70-08d9cf6607dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 09:38:57.3256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8glc69S/LV5GjgmdTQY4b6vsmljyx6NUAhVb5+/Jfnls9JKlev+UM5uhBtz5j5WNTP2aWSYaSigfdf9hjskF9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4408
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

LS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IGJlcm5hcmRAdml2by5jb20gPGJlcm5hcmRAdml2
by5jb20+ILT6se0gSmFuaSBOaWt1bGENCreiy83KsbzkOiAyMDIxxOoxMtTCMzHI1SAxOTowOQ0K
ytW8/sjLOiDV1L78v/wgPGJlcm5hcmRAdml2by5jb20+OyBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnDQqzrcvNOiDV1L78v/wgPGJlcm5hcmRAdml2by5jb20+DQrW98ziOiBSZTogW1BB
VENIXSBncHUvZHJtOiBmaXggcG90ZW50aWFsIG1lbWxlYWsgaW4gZXJyb3IgYnJhbmNoDQoNCk9u
IFR1ZSwgMTYgTm92IDIwMjEsIEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4gd3JvdGU6
DQo+IFRoaXMgcGF0Y2ggdHJ5IHRvIGZpeCBwb3RlbnRpYWwgbWVtbGVhayBpbiBlcnJvciBicmFu
Y2guDQoNCj5QbGVhc2UgZWxhYm9yYXRlLg0KDQpIaSBKYW5pOg0KDQpUaGlzIHBhdGNoIHRyeSB0
byBmaXggcG90ZW50aWFsIG1lbWxlYWsgaW4gZXJyb3IgYnJhbmNoLg0KRm9yIGV4YW1wbGU6DQpu
djUwX3Nvcl9jcmVhdGUgLT5udjUwX21zdG1fbmV3LT4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jf
aW5pdA0KSW4gZnVuY3Rpb24gZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfaW5pdCwgdGhlcmUgYXJl
IGZpdmUgZXJyb3IgYnJhbmNoZXMsIGVycm9yIGJyYW5jaCBqdXN0IHJldHVybiBlcnJvciBjb2Rl
LCBubyBmcmVlIGNhbGxlZC4gDQpBbmQgd2Ugc2VlIHRoYXQgdGhlIGNhbGxlciBkaWRuYHQgZG8g
dGhlIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2Rlc3Ryb3kgam9iLg0KSSBhbSBub3Qgc3VyZSBp
ZiB0aGVyZSBzb21lIGdhcCwgSSB0aGluayB0aGlzIG1heSBicmluZyBpbiB0aGUgcmlzayBvZiBt
ZW1sZWFrIGlzc3VlLg0KVGhhbmtzIQ0KDQpCUi8vQmVybmFyZA0KDQo+QlIsDQo+SmFuaS4NCg0K
DQo+DQo+IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMjIgKysrKysr
KysrKysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMN
Cj4gaW5kZXggZjNkNzllZGE5NGJiLi5mNzNiMTgwZGVlNzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiBAQCAtNTUwMSw3ICs1NTAxLDEwIEBAIGludCBkcm1f
ZHBfbXN0X3RvcG9sb2d5X21ncl9pbml0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAq
bWdyLA0KPiAgCQkJCSBpbnQgbWF4X2xhbmVfY291bnQsIGludCBtYXhfbGlua19yYXRlLA0KPiAg
CQkJCSBpbnQgY29ubl9iYXNlX2lkKQ0KPiAgew0KPiAtCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9s
b2d5X3N0YXRlICptc3Rfc3RhdGU7DQo+ICsJc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3Rh
dGUgKm1zdF9zdGF0ZSA9IE5VTEw7DQo+ICsNCj4gKwltZ3ItPnBheWxvYWRzID0gTlVMTDsNCj4g
KwltZ3ItPnByb3Bvc2VkX3ZjcGlzID0gTlVMTDsNCj4gIA0KPiAgCW11dGV4X2luaXQoJm1nci0+
bG9jayk7DQo+ICAJbXV0ZXhfaW5pdCgmbWdyLT5xbG9jayk7DQo+IEBAIC01NTIzLDcgKzU1MjYs
NyBAQCBpbnQgZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfaW5pdChzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1nciwNCj4gIAkgKi8NCj4gIAltZ3ItPmRlbGF5ZWRfZGVzdHJveV93cSA9
IGFsbG9jX29yZGVyZWRfd29ya3F1ZXVlKCJkcm1fZHBfbXN0X3dxIiwgMCk7DQo+ICAJaWYgKG1n
ci0+ZGVsYXllZF9kZXN0cm95X3dxID09IE5VTEwpDQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiAr
CQlnb3RvIG91dDsNCj4gIA0KPiAgCUlOSVRfV09SSygmbWdyLT53b3JrLCBkcm1fZHBfbXN0X2xp
bmtfcHJvYmVfd29yayk7DQo+ICAJSU5JVF9XT1JLKCZtZ3ItPnR4X3dvcmssIGRybV9kcF90eF93
b3JrKTsgQEAgLTU1MzksMTggKzU1NDIsMTggQEAgDQo+IGludCBkcm1fZHBfbXN0X3RvcG9sb2d5
X21ncl9pbml0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLA0KPiAgCW1nci0+
Y29ubl9iYXNlX2lkID0gY29ubl9iYXNlX2lkOw0KPiAgCWlmIChtYXhfcGF5bG9hZHMgKyAxID4g
c2l6ZW9mKG1nci0+cGF5bG9hZF9tYXNrKSAqIDggfHwNCj4gIAkgICAgbWF4X3BheWxvYWRzICsg
MSA+IHNpemVvZihtZ3ItPnZjcGlfbWFzaykgKiA4KQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4g
KwkJZ290byBmYWlsZWQ7DQo+ICAJbWdyLT5wYXlsb2FkcyA9IGtjYWxsb2MobWF4X3BheWxvYWRz
LCBzaXplb2Yoc3RydWN0IGRybV9kcF9wYXlsb2FkKSwgR0ZQX0tFUk5FTCk7DQo+ICAJaWYgKCFt
Z3ItPnBheWxvYWRzKQ0KPiAtCQlyZXR1cm4gLUVOT01FTTsNCj4gKwkJZ290byBmYWlsZWQ7DQo+
ICAJbWdyLT5wcm9wb3NlZF92Y3BpcyA9IGtjYWxsb2MobWF4X3BheWxvYWRzLCBzaXplb2Yoc3Ry
dWN0IGRybV9kcF92Y3BpICopLCBHRlBfS0VSTkVMKTsNCj4gIAlpZiAoIW1nci0+cHJvcG9zZWRf
dmNwaXMpDQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiArCQlnb3RvIGZhaWxlZDsNCj4gIAlzZXRf
Yml0KDAsICZtZ3ItPnBheWxvYWRfbWFzayk7DQo+ICANCj4gIAltc3Rfc3RhdGUgPSBremFsbG9j
KHNpemVvZigqbXN0X3N0YXRlKSwgR0ZQX0tFUk5FTCk7DQo+ICAJaWYgKG1zdF9zdGF0ZSA9PSBO
VUxMKQ0KPiAtCQlyZXR1cm4gLUVOT01FTTsNCj4gKwkJZ290byBmYWlsZWQ7DQo+ICANCj4gIAlt
c3Rfc3RhdGUtPnRvdGFsX2F2YWlsX3Nsb3RzID0gNjM7DQo+ICAJbXN0X3N0YXRlLT5zdGFydF9z
bG90ID0gMTsNCj4gQEAgLTU1NjMsNiArNTU2NiwxMyBAQCBpbnQgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3JfaW5pdChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwNCj4gIAkJCQkg
ICAgJmRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGVfZnVuY3MpOw0KPiAgDQo+ICAJcmV0dXJuIDA7
DQo+ICsNCj4gK2ZhaWxlZDoNCj4gKwlrZnJlZShtZ3ItPnByb3Bvc2VkX3ZjcGlzKTsNCj4gKwlr
ZnJlZShtZ3ItPnBheWxvYWRzKTsNCj4gKwlkZXN0cm95X3dvcmtxdWV1ZShtZ3ItPmRlbGF5ZWRf
ZGVzdHJveV93cSk7DQo+ICtvdXQ6DQo+ICsJcmV0dXJuIC1FTk9NRU07DQo+ICB9DQo+ICBFWFBP
UlRfU1lNQk9MKGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2luaXQpOw0KDQotLQ0KSmFuaSBOaWt1
bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcg0K
