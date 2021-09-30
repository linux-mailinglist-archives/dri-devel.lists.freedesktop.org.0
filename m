Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A4941D921
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 13:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFB46EB7F;
	Thu, 30 Sep 2021 11:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300127.outbound.protection.outlook.com [40.107.130.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40C86EB7A;
 Thu, 30 Sep 2021 11:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJ0h8knE4FNQJN5gkAFJTkI3P0a0Ei2xt3h72ET8+c7XnQdhL044cSK0Mh6ja4MCPF2eeScGohE2JtZ3v5QXCSD8gpZq7H7mmRS+X6uREu/kvOMoKv/VvBJYnOqzvcxJuON9Eo5eC6Yxj21UIH1s/FOEOgYcfXkgJXlLXW63I4YhV0Xf5YSRZwR3sUtxPi8cuNcskbFbiCAqd1hABEk3sZQLQ+Cpva3QoNiY4mYrVymh5LwPLX+AQNOy5uUCy3fd9yQIpYVOO1uMkC7lg/9Fra9Wq+u1z9IDJs5EL1F3Flf90zmivZ6HsmFcLfy5c+jTHAqjUQhMgJBxtqPwhTfyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pBfIUU1h11D2MnafGbQFmqy1Rvh9m5PSKBdIkgl1BKY=;
 b=kt3zTA0xvGDp1Wnb3ZvD4amhKrAPCXvV+FJo7nxQhn+GT4IqDp0owIvEJjW1yd75dRMr1CX+qUBGPaCuH+j+hTwhWjUVoP+0gGD6Nr7Q2NpJZAM/ide94LjHtgGpZAFna9pMGsj8wWbAHGVnYpPPhZb+3TqC9e7gWhIaUVwXdc7POxLDJj0Iqvhid4JyOaPHyWCxikTTbIsvJgbZKI4ZFrfGYoM2NnZpdmWvFDepdcWG5LRgljLlkn4x6Izr8uK77qlK/L+gj0xBMqiE/o1B+fqAh58/V1s9Y3vBIc4vrLGkmM5qcc3ncuq3r9az/xtVzGJ2+5vK1/+OKdH2lLI7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBfIUU1h11D2MnafGbQFmqy1Rvh9m5PSKBdIkgl1BKY=;
 b=ehm9uICJx8CK8lbsK3Y7bfHV9Pv3KYWhTxxILGBNsrO56yKrO7NbebwzgIP9hbKBNraGfQDZ//AW+x6bNS+8yhG3cjMwYyFVYGR7kKKKtjPSZx+vIoQVqCkKESAJJ+UnzaJvcOU1HIKt5Rv9CRwxSwHxamkRwUUyvk7ghsD5VlE=
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK0PR06MB2196.apcprd06.prod.outlook.com (2603:1096:203:4b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 11:54:17 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::80d9:d4e4:300f:3156%5]) with mapi id 15.20.4544.023; Thu, 30 Sep 2021
 11:54:17 +0000
From: =?gb2312?B?ufnV/b/8?= <guozhengkui@vivo.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Simon Ser
 <contact@emersion.fr>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhou, Peng Ju"
 <PengJu.Zhou@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>, "Gao, Likun"
 <Likun.Gao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, kernel <kernel@vivo.com>
Subject: RE: [PATCH] drm/amdgpu: fix some repeated includings
Thread-Topic: [PATCH] drm/amdgpu: fix some repeated includings
Thread-Index: AQHXtd+jnd+Qk/24r0K3G7/0oSByiau8XP+AgAAKC3eAAA/TUA==
Date: Thu, 30 Sep 2021 11:54:16 +0000
Message-ID: <HK2PR06MB34922067627E3951C991B678C7AA9@HK2PR06MB3492.apcprd06.prod.outlook.com>
References: <20210930094239.7435-1-guozhengkui@vivo.com>
 <AGiYadRf5XyGUqLxwu3ykKzfwM2BgZo4yCAaEXdQiYfH2dbyKmipDNrclnI2lZH3HzNh71VBy5QKz3O4fFvQETjTI9hoKzKHjZNBz9ERKI8=@emersion.fr>
 <AIAAqwDqEh5BcgkyUT78Xaql.9.1632999287613.Hmail.guozhengkui@vivo.com>
In-Reply-To: <AIAAqwDqEh5BcgkyUT78Xaql.9.1632999287613.Hmail.guozhengkui@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7614512b-534a-4b0e-2d8a-08d9840907de
x-ms-traffictypediagnostic: HK0PR06MB2196:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2196CF6A148A79ED6CB73AFAC7AA9@HK0PR06MB2196.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /gvBn3xRBo7Pwnx5b/Wlb7MBCNYnktVrhL2qK6XiDCCUFxOv6dm5bu9gYVaP05+S2rZ4pwUiWS013u5JlVfPEYjg3L1GA7k2nBH3nfAcaDWJ4TMgE+OzX0x3bXM79HYVoaj8p4x4yXiSfnXSnjFAVreduQu3Ol0rdLfs7NkiAg1HN49d/wumV6Mos6ObI9opARm1B/cHGN2ac/QtJ3Rxc0gkl+HKccWwOkLeJtC4jzWV+WnNzQ07vSkEm17vG22CkEjF7bw1rNDUaL3SPGjWfjdzCxJ9+H1afPPeikJT1tK2io80fBL4pSUfUhvxCFer8ymwJ8+kjKTzMDQZeKijELH9UP7Sh3l6gtZBi+KVYFAAIVzMT68v/pNjWYX6WOXvGZg8fONfA+xuX4TH4L6/+BoV/eUb4EKXfTKoddcCHlkH2YnnfL7CrxgBqki6ll51UlWqxD4yMAX8Rq6NgwU+cbM3GvevfkxL6ukEfmYtNDzgIhPK8oovbH40uqIc4qRnErdBkfT+UP4syJjlwNwsut+SNkPi7QuW0sDYYzdJDryXZgpATv3FGYmQupjZi7P1uIQqIiojL17Z+XYYwTtg45GzXPHXQPT4/v19jcqs6q9buiQyOO9UyNK/HBhRvYFoPpnLnxtj0LJWIkcAeu9Zk5nEVRMuIQ1cgR0Oeq0TK0ZdAcdBIvOl6ph/hH6Z9c7yycRlMscCOlT98te2ddGV2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(33656002)(76116006)(7416002)(55016002)(2906002)(71200400001)(9686003)(26005)(86362001)(85182001)(186003)(4326008)(52536014)(316002)(66946007)(66556008)(38070700005)(7696005)(8936002)(6506007)(66476007)(8676002)(66446008)(122000001)(38100700002)(5660300002)(54906003)(110136005)(107886003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Y0w4ZkJZSVZFdmxUQlEwRjY5SWRzMUhvYWxWeDAyOW5ENkw2bXhqdm1pS291?=
 =?gb2312?B?VEIrMUgwWlZaNFBwdzJXanczQ1dDOUdWanJialplYWVIRW90VGNHRHdSVkxT?=
 =?gb2312?B?WXBLOEpmL3FCYmhnQVdkLzBoT1Mvbjl6TjY1YTZLSXBwVHdaclcyeW1LeDVq?=
 =?gb2312?B?WEo2ZTBlRFR6M0IyZllmek1ScEc5bkNMV2UwbUJoTGswNTJGaVdPYWlBcVlJ?=
 =?gb2312?B?Rk5zVVdzMFdJb3JCVlZYUDRsbitmeVhvTFpSREFTd2dsUXpCd0dmak9FMzZM?=
 =?gb2312?B?UFlFcDQ4bjFzY3AzcjNaMHFMVmV6RXZlaEZyZFlFQWVYTmxVcjFHQmxVbmRJ?=
 =?gb2312?B?ZVFVY0hjdVFab3V0V1NsM3RXVFdUSUV3azdaZmx1WUdZVEFSRHZxUmFHLzFx?=
 =?gb2312?B?T3FVbW1ybFFLRWhKUVByNFhKb2NSTlRGL3ZLQzQyQUVMWGFTV3JtUTZ4c0J6?=
 =?gb2312?B?ZjVJc2F3S3dUTmZtck1NOCtYR2h5RVdLdkhFcVVITkxUMkhYaVd1d3VtRk8y?=
 =?gb2312?B?Z3ZxVVVBQS9PNVgxQWJmMVFuN3J0RXhGMUQzcEJobm9OUkppM1NuVlhGdUJH?=
 =?gb2312?B?VHVHQWpvdXRyUUxlR24yVW9iMmV0eWZsM3krRmhHWEk4aFpONDlJYXh1ZUcr?=
 =?gb2312?B?TXZXL3E2WGIzU1NzNzhsYS9Rb2trMWVkemlUSVVvNW9rWTNNNm4vemFhUjFC?=
 =?gb2312?B?ZUs3Q2hHRVd1b0xPaSswaXQvTXd6MDNRMmU0NjdFaG1GeitLNk8xNU10YTkr?=
 =?gb2312?B?aWN3c3JlQ3dZN1dlSUZCaGJkY3g5dklwM3MzRndBeGg2WEdTdUlBVDlhQUtY?=
 =?gb2312?B?d21RYlB1R0I3czZ1NmZ6TnhCdFNkeDlpbVd0U2svdTA5VHhzL3FYaEVGR1R5?=
 =?gb2312?B?WWpubGxodHEwNVFlN1dQQ1g4R3pqRHNvY2tMaHN1WVYxTXhmMGFsZUhaRzZE?=
 =?gb2312?B?VW5ndU9pMHhPVk56cU9WV2VCbjZRK1VaUTgyWTRyQVhVcktkT3V2S2owNHA5?=
 =?gb2312?B?eVFQbGV5Z05hREIwRVNFK1RXM3FjUmYvMDRmbXJ1cVY4ak8zdFI2NXVMTW5N?=
 =?gb2312?B?ZWE3R1cvZ0RYYTUzdE9zODMrSkNRdFJGR0RUZFVCSDNaMC8xNUpFVG5wdzhY?=
 =?gb2312?B?SkNWUkd2TjRiTVFLeXBoeTBNNS94SGNMelBYL1pVQTNhdzdjbDM0QzczY1BO?=
 =?gb2312?B?ZzFGcUZicHEyWmxMb1JJZm43OWEwRnFQa2J6Q3FYSnlQdzk3aWlLN1B1SUJD?=
 =?gb2312?B?RmVCbkVFcmJ3dk43YUovY2diTzI2QVlYaFlQMWxGNmpoQ3QxWlRObnRrVlBm?=
 =?gb2312?B?a2xZbnlGYjdvSno1czEzK1dwWmtMOVNadGZuUERMVmNUYWI4dFdWMklXUUpZ?=
 =?gb2312?B?UE9YQjR2QkNwS01pUFFuR1dBcDZwbVd5Um9FNUdKOXQzM1ltYVR2bEN4MW5k?=
 =?gb2312?B?T3RIQWlnc1ZXZXFZcUl3UjlJUjRzTmYremFWZHgxNG1sT0svUzNmc0NCeVRv?=
 =?gb2312?B?S3BwWjZHai9WVTJjM0NXQStvV1NLOHJZcEhmSlZMK0J5eEtPT3E5N2ZydVly?=
 =?gb2312?B?a3F0dTRpRXRSV2J5cmJKZjlhbXRFOEdmZ1ZkOE9DTHV2S2hqSk1TNTAzVU5m?=
 =?gb2312?B?U0tDZVBWNDNQempzNUZCdUNtUzBpNnpSSlEzYTVYVDRoQ1lKR0NETkhxN2wy?=
 =?gb2312?B?amhZUGE3SExhSDdvNTJIdlJyWEtHbk9pSjZJMFIrK3E3bkZ3MFlENVg2YjRn?=
 =?gb2312?Q?n/4RM5YWQ/Y63T9bBk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_HK2PR06MB34922067627E3951C991B678C7AA9HK2PR06MB3492apcp_"
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7614512b-534a-4b0e-2d8a-08d9840907de
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 11:54:16.9490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iWCTMQl/FdLYiQZJmg57tFdWy0jnevD5dYMc8qNgdwS16gu67Ri+OVASnQKZe+6Fd5M61HUWr5K0JJCpztG50A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2196
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

--_000_HK2PR06MB34922067627E3951C991B678C7AA9HK2PR06MB3492apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

QWN0dWFsbHkgdGhlIGR1cGxpY2F0ZXMgdGFrZSBwbGFjZSBpbiBsaW5lIDQ2LCA0NyBhbmQgNjIs
IDYzLg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rp
c2NvdmVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5j
DQppbmRleCAyOTFhNDdmNzk5MmEuLjk0ZmNhNTY1ODNhMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYw0KKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jDQpAQCAtNDYsMzQgKzQ2LDMyIEBADQoj
aW5jbHVkZSAidmNuX3YyXzAuaCINCiNpbmNsdWRlICJqcGVnX3YyXzAuaCINCiNpbmNsdWRlICJ2
Y25fdjJfNS5oIg0KI2luY2x1ZGUgImpwZWdfdjJfNS5oIg0KI2luY2x1ZGUgInNtdWlvX3Y5XzAu
aCINCiNpbmNsdWRlICJnbWNfdjEwXzAuaCINCiNpbmNsdWRlICJnZnhodWJfdjJfMC5oIg0KI2lu
Y2x1ZGUgIm1taHViX3YyXzAuaCINCiNpbmNsdWRlICJuYmlvX3YyXzMuaCINCiNpbmNsdWRlICJu
YmlvX3Y3XzIuaCINCiNpbmNsdWRlICJoZHBfdjVfMC5oIg0KI2luY2x1ZGUgIm52LmgiDQojaW5j
bHVkZSAibmF2aTEwX2loLmgiDQojaW5jbHVkZSAiZ2Z4X3YxMF8wLmgiDQojaW5jbHVkZSAic2Rt
YV92NV8wLmgiDQojaW5jbHVkZSAic2RtYV92NV8yLmgiDQotI2luY2x1ZGUgInZjbl92Ml8wLmgi
DQotI2luY2x1ZGUgImpwZWdfdjJfMC5oIg0KI2luY2x1ZGUgInZjbl92M18wLmgiDQojaW5jbHVk
ZSAianBlZ192M18wLmgiDQojaW5jbHVkZSAiYW1kZ3B1X3ZrbXMuaCINCiNpbmNsdWRlICJtZXNf
djEwXzEuaCINCiNpbmNsdWRlICJzbXVpb192MTFfMC5oIg0KI2luY2x1ZGUgInNtdWlvX3YxMV8w
XzYuaCINCiNpbmNsdWRlICJzbXVpb192MTNfMC5oIg0KDQpNT0RVTEVfRklSTVdBUkUoImFtZGdw
dS9pcF9kaXNjb3ZlcnkuYmluIik7DQoNCiNkZWZpbmUgbW1SQ0NfQ09ORklHX01FTVNJWkUgICAw
eGRlMw0KI2RlZmluZSBtbU1NX0lOREVYICAgICAgICAgICAgIDB4MA0KI2RlZmluZSBtbU1NX0lO
REVYX0hJICAgICAgICAgIDB4Ng0KI2RlZmluZSBtbU1NX0RBVEEgICAgICAgICAgICAgIDB4MQ0K
DQpzdGF0aWMgY29uc3QgY2hhciAqaHdfaWRfbmFtZXNbSFdfSURfTUFYXSA9IHsNCg==

--_000_HK2PR06MB34922067627E3951C991B678C7AA9HK2PR06MB3492apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@MS PGothic";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"MS PGothic",sans-serif;
	mso-fareast-language:JA;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">Actually the duplicates tak=
e place in line 46, 47 and 62, 63.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">diff --git a/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discove=
ry.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">index 291a47f7992a..94fca56=
583a0 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">--- a/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_discovery.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">+++ b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_discovery.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">@@ -46,34 +46,32 @@<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;vcn_v2_0.h&q=
uot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;jpeg_v2_0.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;vcn_v2_5.h&q=
uot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;jpeg_v2_5.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;smuio_v9_0.h=
&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;gmc_v10_0.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;gfxhub_v2_0.=
h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;mmhub_v2_0.h=
&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;nbio_v2_3.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;nbio_v7_2.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;hdp_v5_0.h&q=
uot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;nv.h&quot;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;navi10_ih.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;gfx_v10_0.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;sdma_v5_0.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;sdma_v5_2.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">-#include &quot;vcn_v2_0.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">-#include &quot;jpeg_v2_0.h=
&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;vcn_v3_0.h&q=
uot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;jpeg_v3_0.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;amdgpu_vkms.=
h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;mes_v10_1.h&=
quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;smuio_v11_0.=
h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;smuio_v11_0_=
6.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#include &quot;smuio_v13_0.=
h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">MODULE_FIRMWARE(&quot;amdgp=
u/ip_discovery.bin&quot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#define mmRCC_CONFIG_MEMSIZ=
E&nbsp;&nbsp; 0xde3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#define mmMM_INDEX&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#define mmMM_INDEX_HI&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">#define mmMM_DATA&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF;mso-fareast-language:ZH-CN">static const char *hw_id_na=
mes[HW_ID_MAX] =3D {<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_HK2PR06MB34922067627E3951C991B678C7AA9HK2PR06MB3492apcp_--
