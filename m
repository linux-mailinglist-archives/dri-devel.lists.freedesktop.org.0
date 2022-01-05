Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E7484C0B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 02:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ED610E223;
	Wed,  5 Jan 2022 01:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2137.outbound.protection.outlook.com [40.107.215.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1256F10E223
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 01:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OspgyuIeMEP7yQfxeSUJMXZpeaudK7ppUh5Pt290boAwYqKMioISMMjUQ+n1NTegxK1OdcdVieSZpwlLsuYgVingtvdSxxxZ9kHZvVKErvC5M8VLQPhiI/8IlCUQQF79d9AMHrBn3Spcx2IuitFI4nhJ5b6aYffHde8xlda8x/Srz6ffi68hl2fIDK3cvu4oe2X/xeCt64Z/cdKHyS9Chi5Swu2+joHnIsiGW4Y9g8JtsolpbSdTqPSfasVzq1OvfPVDt7DVpyDCTMAD24fU8vFc8vvvr9IlxPp+YDcmX4auU4+/Du9p3V23sq0J/F2QZzfbRQ3uJUSDb+71JM+K1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jT1zP8TFNV5Ee9Vk4p12idWZrSLPK7v2kKsQSZopiR4=;
 b=PTGdPaqOrJWkfAeNho+ZtU2LRFKBau3yrHqQuWzfF45vw8hWJ78SVFvrrgPtbuVtQ7O0+bwSO+A93Xo3n9T2VeQYSJv44d5i5Mdu9j1CjIYVXg0ZuqMaHDxlbpUcP68m4YrlxXlAs3nCuDqK5xMAGIi8Oq1E5+R5CxgqdrKgOb4CIGYPZIdDdMOyEaIk5BOXnqaWofknQCqSM5YiqK5gpySYD4qD6Ap2M+Z1SaixXB5sjngrFLBKIq80LhnPNTf/ywqmRaw+f4pZxMZ3Lmn+42Z84/T/xd6+pJW/aHrnKotCUJUtML7vYZzk9GhRbKj4t/OocjnqlsBHoY3goe6BdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT1zP8TFNV5Ee9Vk4p12idWZrSLPK7v2kKsQSZopiR4=;
 b=hSP9Ohr8uuji13tXtIZZy4et7MU0+0QIl3K9bIRemcW8qsmyNCReR4Xyd3LvYdU98IvJRXpPIBdG9jpvppQmnqsIOFl0arzp0ipSkp+uPOueSYndfkY3QtXNsM0cbahp8ZumdkxazJ/fWMgrNcUGqc9D2o0lWSmtvjnuP7STSxU=
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS1PR0601MB2041.apcprd06.prod.outlook.com (2603:1096:803:e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 01:17:43 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::81a5:768b:64a1:b284]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::81a5:768b:64a1:b284%6]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 01:17:42 +0000
From: =?utf-8?B?6LW15Yab5aWO?= <bernard@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IFtQQVRDSF0gZ3B1L2RybTogZml4IHBvdGVudGlh?=
 =?utf-8?Q?l_memleak_in_error_branch?=
Thread-Topic: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGdwdS9kcm06IGZpeCBwb3RlbnRpYWwgbWVtbGVh?=
 =?utf-8?Q?k_in_error_branch?=
Thread-Index: AQHX2ugw7dR2aqqt/0CHm7T8Pf0La6xMt96AgAYsGGCAACG7gIAADXvA
Date: Wed, 5 Jan 2022 01:17:42 +0000
Message-ID: <PSAPR06MB40212930193B005F6366D0CFDF4B9@PSAPR06MB4021.apcprd06.prod.outlook.com>
References: <20211116124751.31181-1-bernard@vivo.com>
 <ACIArwAdEzJlxV*UItyRxarz.9.1640948962309.Hmail.bernard@vivo.com.@PDg3emdvaGh2emEuZnNmQGludGVsLmNvbT4=>
 <PSAPR06MB40216FB1425E72891B6A6B28DF4A9@PSAPR06MB4021.apcprd06.prod.outlook.com>
 <AO6AtwCGE3lpmasg9JDLUKqP.9.1641295527410.Hmail.bernard@vivo.com.@PDg3azBmZnU0aW8uZnNmQGludGVsLmNvbT4=>
In-Reply-To: <AO6AtwCGE3lpmasg9JDLUKqP.9.1641295527410.Hmail.bernard@vivo.com.@PDg3azBmZnU0aW8uZnNmQGludGVsLmNvbT4=>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04d96dc4-a6e8-46d8-3a16-08d9cfe92c55
x-ms-traffictypediagnostic: PS1PR0601MB2041:EE_
x-microsoft-antispam-prvs: <PS1PR0601MB2041260813521F44A1CEF019DF4B9@PS1PR0601MB2041.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: avPppxaXEgTVCVdw5OFQbr3IlhWFpfhk+pW/N8kLY2rI9ioHL5FULqLxWzq/ABtyPd0Pvgip5FWf7qjiOQpB/VoH7gVwTIaoxHfzwMqwpric/aVRWWyAMBZFhop+9Ca9HPlITZsL/kD4PtuNTT8axzwTcPYz73k+NZkil9kv2hRpdkm9QrRbTzcl7o/1L5d3QbRRxijTt02Wyrjj47ONcjUhP8CV/vXOZNrqDrNf/DdxtjlECMOQIPIAaRtd92RR0qn124TAluAJyNfxkK46uG3xr74eYGECaE6D/ejsZPt7dhjnVqDyDgPymJE8JxSR2QcH5YPnCxLgwkU/MCXiCGgc5giIWcwpU224uKRrrFfcjqTgTZ+YUKfR0MnrmxDRxPGcU5xMinqwZZ1B5UMQIEEnrt5lQeXpabwyCt8sZA9EQ4DXVy5+UiBKAfxNAxzvNY2v0R5MGmVWQGfjisZfJGa+cotdu9ovDezR+nC5siB+0UaV3MYv/ZtrVt8Hdm+Onl4H+UMyvufpM6bQ0+yMe2Ue9xfds1+uXNVXGH7UaevdrToequq5A0MlJZAFMn1jOabcasOJhruwz4mKg/2GIiqozZManZaQ+VCuyK/9i30/W+tOvaB3NY0KInKJIbfDsUIpMN1P8CZ8/joQiCz9XBasc0HG2hAp0dznfAVwjrpckqYEh+sxcEu7+D5+WlAzk9PqF1xgXmbtc8rwSMKVKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(85182001)(76116006)(224303003)(186003)(38070700005)(33656002)(38100700002)(26005)(66476007)(66556008)(52536014)(66446008)(66946007)(86362001)(8936002)(7696005)(6506007)(64756008)(55016003)(508600001)(71200400001)(5660300002)(316002)(122000001)(83380400001)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkJ4bGJKcHUvSEtqMFlhc0JnZVRpV3RYcS9zSFF2TFQvSGVXd3BHaENVaGpW?=
 =?utf-8?B?aHV2eXUwSFNmNjNjNmMwRlpjTFlkWGRmZ2pXMGlQZ2U3bGQ2Y1h4R3JMMzBo?=
 =?utf-8?B?UXJLYUpkWmNUMnU0TVNSNHMvSFYrMUduWnFWN2NKbW12Z1NFaitta2U2UlBp?=
 =?utf-8?B?STA5TUtSQkFaWkQwdldxV1QvaEE3T3hlSWVVSnk5WDJrNGFPREdOU2k5Zm1m?=
 =?utf-8?B?ZXVPYmRqNWpheitEQVpzUHRTb00vSnZpNytiSTdLRklFNXplK3RManR0ZXly?=
 =?utf-8?B?anVnVEYxK0Q2b1pYck5RRE54TSs4c0RrY0orSVdNUy9xR1RUUDc0M0M1ZSs1?=
 =?utf-8?B?dTBjbU8vTUdwMGx6UCtCbU9Pblc1eTB2Mk5XazZreUkyTk55UG10VjAyMUdO?=
 =?utf-8?B?anpPa3hObTBVaXczTEJ4YU05RTJjQ3l4c2FKTFg3NTBpbFk4S3hlbEdCWW55?=
 =?utf-8?B?amM3NGZnSVFCeElmaWYrc1N2ZzNMUVBOTEdMMmNDUGNGYkluelFIcWZaMTRy?=
 =?utf-8?B?L3FJUXF0U2k3UUNucUU5UmIzTGtVUnpTVHZYODJqd0taeUxUSlNBN0hiS1FM?=
 =?utf-8?B?Y1FTVk02R1ZMcW8rTVdtaEhqQTgxZlV4Mm51b0IwbWMvcUkzRjlMK05lT0ZM?=
 =?utf-8?B?ZjJvWmtSZExoU0xjZ2pGQUhITnRTUXRVOXlrQkJ4QUZnaEgzLzA1N0Z2NDh0?=
 =?utf-8?B?SjRlV01ISlVLVno3MGFUcCtUbGtiTDJhN0FYNzVNQ09FdVBrNDNyWWFlNUdO?=
 =?utf-8?B?cFFTRWNrVDhKMFlUaEJCYWVBTmZwcEtNbWZvaTB5TVZ6UTJ0MWMxemp0WVFN?=
 =?utf-8?B?M092aDA4Qm1QS0ZRWkNUNEEvZ29kTG9ybmlNSmpDNjVMRUU1aE5Ib2hBKzBF?=
 =?utf-8?B?VXg5SHVUeGV0TjJaaTVrTlkwaUwwajdNWWJGN2hRSmFYUG1odGZ0ZVcrZHNn?=
 =?utf-8?B?RFk3QU9TMDZtZWNEM2g4c21VR0czby9FU2pZSEtndjVXbG1VM3ljbG5yUGQv?=
 =?utf-8?B?V1JoUTFMUUhnTmRDYWdFNlNyM216NCs4amN3VTdxL3FlUkc4SnpMTXVCME9x?=
 =?utf-8?B?Qkw5YlVHOEhyUFhoRE11NDN5d25Vc2UxS3RtbXVBME1vM2wrOVhELzlMUUVD?=
 =?utf-8?B?Rk1ZdWM2QXYrVmN6RmVBZGQwRjRvSEtNVVpyZmg3QkdWQWd6eEkzRGs4Qlkv?=
 =?utf-8?B?MTVNZlNMOW1nUUdUYkovNVNQZUZwZW9HZnIrVUQ4cXl4V2t5VzlvVGJhWWpV?=
 =?utf-8?B?QVJBWGpXbU8zYi9PaWk2M1RFeHR6VU03V2k0TDBIMHQwRXJ3YVZPZzNzR0hE?=
 =?utf-8?B?ODYwbnM3eUFPWTdZWlJRQjduQkhEdmV6NnhKTTBxRjNDTG5MRWNUV1puMUpK?=
 =?utf-8?B?R2RteGZDUllFdWlCdFBpdERCNktkWWNXeVBlRXJVZGFpRXROdzk3d1IraEox?=
 =?utf-8?B?d0FxamhDaERjVWNIbXBoclVzZTRXY3dUMUlTVlRvRTJydTNwZVB4a2x5dk9K?=
 =?utf-8?B?OFVIR2FjMjFTZmhmdEwyZmw5VitZdkRqU2M1OHpBNis4Ni8yam5FVUFiaDNk?=
 =?utf-8?B?T1h4TUdscmdFcVQxWUdpY1crek5SaFV5M05kSTMrZVFZSytCMDdoUDNpNDRn?=
 =?utf-8?B?d2RlVzZHNFJXMktDbGk3UDBVMHg4RE1vNGJ1aW13Mjg3NGFCRUFwdXdwUFdM?=
 =?utf-8?B?ZE5sK0l0Wk4rd3ROQlJSaHpJeHBsTUlpZ2hWQUcwcGt3UnZ1NmVXS1NUT2hJ?=
 =?utf-8?B?RmpoeUpyZytIZlVicUhiZFRXV3dnek5VODEyR0IvalJZV1JHVjZmNTZZUjJy?=
 =?utf-8?B?eFk0WTlmTTd3QTRoZE9DOWQyeGpPYTgwZUxBbVZzTWI0U1N1eDNZWVcxckww?=
 =?utf-8?B?VVg0OGgyTTcwZk1keTFHSEZHTWhFbnA1K1dZWm54K3IzZDJ0bzFGdEwyNysv?=
 =?utf-8?B?TStnak9HTDQ0WGZoKzltYWJIWTFPOEVxQ3lIM1NLYzFGMDFNb011RXBYV1A3?=
 =?utf-8?B?YTZxUkZpYlhNdldjaUtVUGpIODdiNTNNWGVhZkFNbGJxV253ODdtRkVtSm5x?=
 =?utf-8?B?ZWpDMEdsRGVMMFMwYUdSWjNiQmR6d0wxYlpUdFo1SFZIYklFM1IyemlHamsy?=
 =?utf-8?B?RllTZk1CS2hvaVFWTDdZL1B5TFhERGp5Zm1zay8zLzlDVnNsWExOZmZ2djd6?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d96dc4-a6e8-46d8-3a16-08d9cfe92c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2022 01:17:42.5717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+8W6XiIf5a+bQoarw51bJa6+k/Em8K5jX1FL1t5CwGHmtGMKzR5EG850z5E/TyDxpVH+5TmGZcbm3ffcqQPiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB2041
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

DQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IGJlcm5hcmRAdml2by5jb20gPGJl
cm5hcmRAdml2by5jb20+IOS7o+ihqCBKYW5pIE5pa3VsYQ0K5Y+R6YCB5pe26Ze0OiAyMDIy5bm0
MeaciDTml6UgMTk6MjUNCuaUtuS7tuS6ujog6LW15Yab5aWOIDxiZXJuYXJkQHZpdm8uY29tPjsg
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1h
eGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPjsgRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K5Li76aKYOiBSZTog562U5aSNOiBbUEFU
Q0hdIGdwdS9kcm06IGZpeCBwb3RlbnRpYWwgbWVtbGVhayBpbiBlcnJvciBicmFuY2gNCg0KT24g
VHVlLCAwNCBKYW4gMjAyMiwg6LW15Yab5aWOIDxiZXJuYXJkQHZpdm8uY29tPiB3cm90ZToNCj4g
LS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IGJlcm5hcmRAdml2by5jb20gPGJl
cm5hcmRAdml2by5jb20+IOS7o+ihqCBKYW5pIE5pa3VsYQ0KPiDlj5HpgIHml7bpl7Q6IDIwMjHl
ubQxMuaciDMx5pelIDE5OjA5DQo+IOaUtuS7tuS6ujog6LW15Yab5aWOIDxiZXJuYXJkQHZpdm8u
Y29tPjsgTWFhcnRlbiBMYW5raG9yc3QgDQo+IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+OyBNYXhpbWUgUmlwYXJkIA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZCANCj4gQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgDQo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4g
5oqE6YCBOiDotbXlhpvlpY4gPGJlcm5hcmRAdml2by5jb20+DQo+IOS4u+mimDogUmU6IFtQQVRD
SF0gZ3B1L2RybTogZml4IHBvdGVudGlhbCBtZW1sZWFrIGluIGVycm9yIGJyYW5jaA0KPg0KPiBP
biBUdWUsIDE2IE5vdiAyMDIxLCBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IHdyb3Rl
Og0KPj4gVGhpcyBwYXRjaCB0cnkgdG8gZml4IHBvdGVudGlhbCBtZW1sZWFrIGluIGVycm9yIGJy
YW5jaC4NCj4NCj4+UGxlYXNlIGVsYWJvcmF0ZS4NCj4NCj4gSGkgSmFuaToNCj4NCj4gVGhpcyBw
YXRjaCB0cnkgdG8gZml4IHBvdGVudGlhbCBtZW1sZWFrIGluIGVycm9yIGJyYW5jaC4NCj4gRm9y
IGV4YW1wbGU6DQo+IG52NTBfc29yX2NyZWF0ZSAtPm52NTBfbXN0bV9uZXctPiBkcm1fZHBfbXN0
X3RvcG9sb2d5X21ncl9pbml0IEluIA0KPiBmdW5jdGlvbiBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
cl9pbml0LCB0aGVyZSBhcmUgZml2ZSBlcnJvciBicmFuY2hlcywgZXJyb3IgYnJhbmNoIGp1c3Qg
cmV0dXJuIGVycm9yIGNvZGUsIG5vIGZyZWUgY2FsbGVkLg0KPiBBbmQgd2Ugc2VlIHRoYXQgdGhl
IGNhbGxlciBkaWRuYHQgZG8gdGhlIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2Rlc3Ryb3kgam9i
Lg0KPiBJIGFtIG5vdCBzdXJlIGlmIHRoZXJlIHNvbWUgZ2FwLCBJIHRoaW5rIHRoaXMgbWF5IGJy
aW5nIGluIHRoZSByaXNrIG9mIG1lbWxlYWsgaXNzdWUuDQo+IFRoYW5rcyENCg0KPlRoaXMgc2hv
dWxkIGJlIHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpIaSBKYW5pOg0KDQpUaGFua3Mg
Zm9yIHlvdXIgY29tbWVudHMsIEkgd2lsbCByZXN1Ym1pdCB0aGlzIHBhdGNoIQ0KDQpCUi8vQmVy
bmFyZA0KDQo+DQo+IEJSLy9CZXJuYXJkDQo+DQo+PkJSLA0KPj5KYW5pLg0KPg0KPg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4NCj4+IC0tLQ0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgfCAyMiArKysrKysrKysr
KysrKysrLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0K
Pj4gaW5kZXggZjNkNzllZGE5NGJiLi5mNzNiMTgwZGVlNzMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jDQo+PiBAQCAtNTUwMSw3ICs1NTAxLDEwIEBAIGludCBk
cm1fZHBfbXN0X3RvcG9sb2d5X21ncl9pbml0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21n
ciAqbWdyLA0KPj4gIAkJCQkgaW50IG1heF9sYW5lX2NvdW50LCBpbnQgbWF4X2xpbmtfcmF0ZSwN
Cj4+ICAJCQkJIGludCBjb25uX2Jhc2VfaWQpDQo+PiAgew0KPj4gLQlzdHJ1Y3QgZHJtX2RwX21z
dF90b3BvbG9neV9zdGF0ZSAqbXN0X3N0YXRlOw0KPj4gKwlzdHJ1Y3QgZHJtX2RwX21zdF90b3Bv
bG9neV9zdGF0ZSAqbXN0X3N0YXRlID0gTlVMTDsNCg0KVGhpcyBpcyBzdXBlcmZsdW91cy4NCg0K
T3RoZXIgdGhhbiB0aGF0LA0KDQpSZXZpZXdlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGludGVsLmNvbT4NCg0KDQo+PiArDQo+PiArCW1nci0+cGF5bG9hZHMgPSBOVUxMOw0KPj4gKwlt
Z3ItPnByb3Bvc2VkX3ZjcGlzID0gTlVMTDsNCj4+ICANCj4+ICAJbXV0ZXhfaW5pdCgmbWdyLT5s
b2NrKTsNCj4+ICAJbXV0ZXhfaW5pdCgmbWdyLT5xbG9jayk7DQo+PiBAQCAtNTUyMyw3ICs1NTI2
LDcgQEAgaW50IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2luaXQoc3RydWN0IGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyICptZ3IsDQo+PiAgCSAqLw0KPj4gIAltZ3ItPmRlbGF5ZWRfZGVzdHJveV93
cSA9IGFsbG9jX29yZGVyZWRfd29ya3F1ZXVlKCJkcm1fZHBfbXN0X3dxIiwgMCk7DQo+PiAgCWlm
IChtZ3ItPmRlbGF5ZWRfZGVzdHJveV93cSA9PSBOVUxMKQ0KPj4gLQkJcmV0dXJuIC1FTk9NRU07
DQo+PiArCQlnb3RvIG91dDsNCj4+ICANCj4+ICAJSU5JVF9XT1JLKCZtZ3ItPndvcmssIGRybV9k
cF9tc3RfbGlua19wcm9iZV93b3JrKTsNCj4+ICAJSU5JVF9XT1JLKCZtZ3ItPnR4X3dvcmssIGRy
bV9kcF90eF93b3JrKTsgQEAgLTU1MzksMTggKzU1NDIsMTggQEAgDQo+PiBpbnQgZHJtX2RwX21z
dF90b3BvbG9neV9tZ3JfaW5pdChzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwN
Cj4+ICAJbWdyLT5jb25uX2Jhc2VfaWQgPSBjb25uX2Jhc2VfaWQ7DQo+PiAgCWlmIChtYXhfcGF5
bG9hZHMgKyAxID4gc2l6ZW9mKG1nci0+cGF5bG9hZF9tYXNrKSAqIDggfHwNCj4+ICAJICAgIG1h
eF9wYXlsb2FkcyArIDEgPiBzaXplb2YobWdyLT52Y3BpX21hc2spICogOCkNCj4+IC0JCXJldHVy
biAtRUlOVkFMOw0KPj4gKwkJZ290byBmYWlsZWQ7DQo+PiAgCW1nci0+cGF5bG9hZHMgPSBrY2Fs
bG9jKG1heF9wYXlsb2Fkcywgc2l6ZW9mKHN0cnVjdCBkcm1fZHBfcGF5bG9hZCksIEdGUF9LRVJO
RUwpOw0KPj4gIAlpZiAoIW1nci0+cGF5bG9hZHMpDQo+PiAtCQlyZXR1cm4gLUVOT01FTTsNCj4+
ICsJCWdvdG8gZmFpbGVkOw0KPj4gIAltZ3ItPnByb3Bvc2VkX3ZjcGlzID0ga2NhbGxvYyhtYXhf
cGF5bG9hZHMsIHNpemVvZihzdHJ1Y3QgZHJtX2RwX3ZjcGkgKiksIEdGUF9LRVJORUwpOw0KPj4g
IAlpZiAoIW1nci0+cHJvcG9zZWRfdmNwaXMpDQo+PiAtCQlyZXR1cm4gLUVOT01FTTsNCj4+ICsJ
CWdvdG8gZmFpbGVkOw0KPj4gIAlzZXRfYml0KDAsICZtZ3ItPnBheWxvYWRfbWFzayk7DQo+PiAg
DQo+PiAgCW1zdF9zdGF0ZSA9IGt6YWxsb2Moc2l6ZW9mKCptc3Rfc3RhdGUpLCBHRlBfS0VSTkVM
KTsNCj4+ICAJaWYgKG1zdF9zdGF0ZSA9PSBOVUxMKQ0KPj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+
PiArCQlnb3RvIGZhaWxlZDsNCj4+ICANCj4+ICAJbXN0X3N0YXRlLT50b3RhbF9hdmFpbF9zbG90
cyA9IDYzOw0KPj4gIAltc3Rfc3RhdGUtPnN0YXJ0X3Nsb3QgPSAxOw0KPj4gQEAgLTU1NjMsNiAr
NTU2NiwxMyBAQCBpbnQgZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfaW5pdChzdHJ1Y3QgZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3IgKm1nciwNCj4+ICAJCQkJICAgICZkcm1fZHBfbXN0X3RvcG9sb2d5
X3N0YXRlX2Z1bmNzKTsNCj4+ICANCj4+ICAJcmV0dXJuIDA7DQo+PiArDQo+PiArZmFpbGVkOg0K
Pj4gKwlrZnJlZShtZ3ItPnByb3Bvc2VkX3ZjcGlzKTsNCj4+ICsJa2ZyZWUobWdyLT5wYXlsb2Fk
cyk7DQo+PiArCWRlc3Ryb3lfd29ya3F1ZXVlKG1nci0+ZGVsYXllZF9kZXN0cm95X3dxKTsNCj4+
ICtvdXQ6DQo+PiArCXJldHVybiAtRU5PTUVNOw0KPj4gIH0NCj4+ICBFWFBPUlRfU1lNQk9MKGRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2luaXQpOw0KPg0KPiAtLQ0KPiBKYW5pIE5pa3VsYSwgSW50
ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQoNCi0tDQpKYW5pIE5pa3VsYSwgSW50ZWwg
T3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyDQo=
