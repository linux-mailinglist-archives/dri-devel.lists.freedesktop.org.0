Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535EB229CEC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 18:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B31B6E373;
	Wed, 22 Jul 2020 16:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDD86E373
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 16:17:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SegTooqE62YTJgL/PYyJXuN//O5RKUCxi9TV2hBEizuNyFSe4D74PiVxKodhzWsjrl9w2IjcXOYUXCwu4byxZysuBcslS4LdFSVWgvtKt9H3TEBQa6FxKbVsZjLc4SYD5g5s3DF8NKLViGuvxIfQxdcdC56HxMSAvr6nxZ2wFANfJrGUrggIMgUEkRleAfqcHD3XiIHohcuR51Csy8Xv2mIwl/zeBf6lhEL/hN52Pi/Oj9t48zEy8ashmCHelu9YKnKmYHAXR/MCtsn/YHJAU8dn/ZzDrylhmbcI+bnVbUcNrpPvHwwREZDs7ZYSCd0qSztp2R0dta4eHh6awg8LOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3LLW9u1y+PopPNTEFOIY54/65ENsnmv08v4QjjRZZU=;
 b=WL3EBnCLTGT30ai7142/5OJ6AXCjZP8UP2v7XusEkAMqZG+1dKn8fqFhzvLrhRXrknkOytL5fpAvQ5Xw4ra59dLcLtOCTJHytJ0hDV+OZiUHNeV7HdGaR9fvcU7MzANl7b3rQac4a1eQXRLBocAY4kOjcEjW99PAugmzbMhtS1b6RbRLdbFXale2CNt6CdFiTqzy2pWrSXJF9BblJ6unxB3URTzVUglBFBVL8cxmIg4pedtOPxPkZYrBOaqgn5PWQAsOlsoivLyoLZ+GA4FvUQL2tosHfxmOhfWMGqE/ahei3dCeffSulLenWZY6KLXbEuaU3aeQ4oPoukg7Oq0AGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3LLW9u1y+PopPNTEFOIY54/65ENsnmv08v4QjjRZZU=;
 b=I9DcucBXympM+NCawup3n+0q3IogFnHqafZ36bSTVDNSqpiEp/guFCPLRZg/ILOetvG4xDkBHAXJ0mTt7Io39uQvdv+reaMrwyHxz5Xy0VSlToQvWyB482YUlpfCs5Fj0suMX9gaTA50wGriH6SkKe4hUle3S1LryzrpR6jCSkM=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2547.namprd12.prod.outlook.com (2603:10b6:207:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Wed, 22 Jul
 2020 16:17:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.021; Wed, 22 Jul 2020
 16:17:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] dma-fence: Make symbol 'dma_fence_lockdep_map'
 static
Thread-Topic: [PATCH -next] dma-fence: Make symbol 'dma_fence_lockdep_map'
 static
Thread-Index: AQHWYEOSyGRQTP/tOkOtXHKQYv/U9Q==
Date: Wed, 22 Jul 2020 16:17:19 +0000
Message-ID: <dc5e3b19-2087-44ab-a28c-ddb38ff8861a@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2a02:908:1252:fb60:a9b1:7286:e493:7e98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 742d54bd-791f-4313-2cdb-08d82e5ab525
x-ms-traffictypediagnostic: BL0PR12MB2547:
x-microsoft-antispam-prvs: <BL0PR12MB25479459FA29DD12AFA8FEC083790@BL0PR12MB2547.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:175;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jb5G5ZXUtTYHkQJOiMXL8ONv7vae7n+cpM/RBS02CX5ITtWz6tVo0mpxXFKOew3WVeQNU7Yfz2+yJqsp3M1xOG8ao7a0jCWzZvd+As//9ggkpGwH40ZUlgueaiAgUoZOPy/YZY+nIUeP4JhEH/Ojw1c77rP+qZdZkIjZDTjVTiS6c1rxYEh/nAz7nuuBQTPWzBJmL2PGqBnfw4Mk5Jk2KMaV9D3TrffYSsUO9nNITmXWxYB6+WhhQLm1XYk8tvIjs+9gIlU9oefaruEjV6p+rypWY9dNjVnfsJEpklgMgaRfPK4BnYq/cgcDZSIerqKMwSK/VQzIJEc1WkWzrbIDbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(54906003)(6506007)(9686003)(478600001)(6512007)(31696002)(4744005)(316002)(31686004)(71200400001)(5660300002)(4326008)(83380400001)(66446008)(64756008)(66556008)(66476007)(2906002)(6486002)(8936002)(86362001)(6916009)(186003)(66574015)(76116006)(91956017)(66946007)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yebmDVNSjRIFOTKPvlb6sS5O9ObxEwC1eGQ1zWN80bVZv5eoVe9AG5fYWwZNATw3117eLOkzjz/JM16C2iQG0xKxtvz1DyfGvLyUKuwcMPalZOJzB0P0ZYIQQlcWDd+WXeAguAt5xhjXgWUu+lqupqi/myEDT50TIdhi7/zdqlenx50it0/4hdP01bmwIcZm6VQZ2lrLJaTyq8/uZgEY9tjrhShtQkAQJMmAVmsVztk0cO5MABOzeLv156+2Zmn0J7BxZ516dgiT6SJxsffpYdMBsM4B8NcmFgUaVw/onQhTZnHXZTMlpN3AolhF68cuHDl/dVknGhacPQWDRD4W/GRCpiubsT4XPNBfJlH+tGn42de9UgNwADTDtoAyxTMt7JcyV827WEvpizpOXZ34sGdpNSYJizy0MjAIuWVDaT/ghDgC3iyGBnS6ZLnwFWOtP7MzRohTGGLUjpKjhg5D9sFKnxDaqtvXSPizyJbSU8gfNvPJpEuILlYJcr05q9gWfg1l9VoJWd18peLsE2RonZawfK6wBFFnkm9IXkhAYojZudfA7Xetn9vp/bW3ISBp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742d54bd-791f-4313-2cdb-08d82e5ab525
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 16:17:19.2232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1Zy5qtdfWtmAfeoHBia8EiFJSD3yg46EDV37PEu2JZDGfjDRR0VH2gKw9U+HMo6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2547
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hulk Robot <hulkci@huawei.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1569924516=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1569924516==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_dc5e3b19208744aba28cddb38ff8861aemailandroidcom_"

--_000_dc5e3b19208744aba28cddb38ff8861aemailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjA3LjIwMjAgMTg6MDQgc2NocmllYiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFA
aHVhd2VpLmNvbT46DQpUaGUgc3BhcnNlIHRvb2wgY29tcGxhaW5zIGFzIGZvbGxvd3M6DQoNCmRy
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYzoyNDk6MjU6IHdhcm5pbmc6DQogc3ltYm9sICdkbWFf
ZmVuY2VfbG9ja2RlcF9tYXAnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
DQoNClRoaXMgdmFyaWFibGUgaXMgbm90IHVzZWQgb3V0c2lkZSBvZiBkbWEtZmVuY2UuYywgc28g
dGhpcyBjb21taXQNCm1hcmtzIGl0IHN0YXRpYy4NCg0KRml4ZXM6IDVmYmZmODEzYTRhMyAoImRt
YS1mZW5jZTogYmFzaWMgbG9ja2RlcCBhbm5vdGF0aW9ucyIpDQpSZXBvcnRlZC1ieTogSHVsayBS
b2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2Vp
eW9uZ2p1bjFAaHVhd2VpLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KLS0tDQogZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5j
ZS5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIGIvZHJpdmVycy9k
bWEtYnVmL2RtYS1mZW5jZS5jDQppbmRleCBhZjFkOGVhOTI2YjMuLjQzNjI0YjRlZTEzZCAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYw0KKysrIGIvZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS5jDQpAQCAtMjQ2LDcgKzI0Niw3IEBAIEVYUE9SVF9TWU1CT0woZG1hX2Zl
bmNlX2NvbnRleHRfYWxsb2MpOw0KICAqICAgY29uY2VybmVkLg0KICAqLw0KICNpZmRlZiBDT05G
SUdfTE9DS0RFUA0KLXN0cnVjdCBsb2NrZGVwX21hcCAgICAgZG1hX2ZlbmNlX2xvY2tkZXBfbWFw
ID0gew0KK3N0YXRpYyBzdHJ1Y3QgbG9ja2RlcF9tYXAgZG1hX2ZlbmNlX2xvY2tkZXBfbWFwID0g
ew0KICAgICAgICAgLm5hbWUgPSAiZG1hX2ZlbmNlX21hcCINCiB9Ow0KDQoNCg0K

--_000_dc5e3b19208744aba28cddb38ff8861aemailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F1A47B2396812A4FA1FFB3049F204C70@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDIyLjA3LjIwMjAgMTg6MDQgc2NocmllYiBXZWkgWW9uZ2p1biAm
bHQ7d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbSZndDs6PGJyIHR5cGU9ImF0dHJpYnV0aW9uIj4NCjxi
bG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1s
ZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj48Zm9udCBzaXplPSIy
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPg0KPGRpdj5UaGUgc3BhcnNlIHRvb2wgY29t
cGxhaW5zIGFzIGZvbGxvd3M6PGJyPg0KPGJyPg0KZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5j
OjI0OToyNTogd2FybmluZzo8YnI+DQombmJzcDtzeW1ib2wgJ2RtYV9mZW5jZV9sb2NrZGVwX21h
cCcgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz88YnI+DQo8YnI+DQpUaGlz
IHZhcmlhYmxlIGlzIG5vdCB1c2VkIG91dHNpZGUgb2YgZG1hLWZlbmNlLmMsIHNvIHRoaXMgY29t
bWl0PGJyPg0KbWFya3MgaXQgc3RhdGljLjxicj4NCjxicj4NCkZpeGVzOiA1ZmJmZjgxM2E0YTMg
KCZxdW90O2RtYS1mZW5jZTogYmFzaWMgbG9ja2RlcCBhbm5vdGF0aW9ucyZxdW90Oyk8YnI+DQpS
ZXBvcnRlZC1ieTogSHVsayBSb2JvdCAmbHQ7aHVsa2NpQGh1YXdlaS5jb20mZ3Q7PGJyPg0KU2ln
bmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gJmx0O3dlaXlvbmdqdW4xQGh1YXdlaS5jb20mZ3Q7PGJy
Pg0KPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8
L2Rpdj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1
dG8iPlJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnICZsdDtjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20mZ3Q7PC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0i
YXV0byI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+DQo8YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDti
b3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+PGZvbnQg
c2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXY+LS0tPGJyPg0KJm5i
c3A7ZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jIHwgMiAmIzQzOy08YnI+DQombmJzcDsxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oJiM0MzspLCAxIGRlbGV0aW9uKC0pPGJyPg0KPGJyPg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1hLWJ1
Zi9kbWEtZmVuY2UuYzxicj4NCmluZGV4IGFmMWQ4ZWE5MjZiMy4uNDM2MjRiNGVlMTNkIDEwMDY0
NDxicj4NCi0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYzxicj4NCiYjNDM7JiM0Mzsm
IzQzOyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYzxicj4NCkBAIC0yNDYsNyAmIzQzOzI0
Niw3IEBAIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2MpOzxicj4NCiZuYnNw
OyAqJm5ic3A7Jm5ic3A7IGNvbmNlcm5lZC48YnI+DQombmJzcDsgKi88YnI+DQombmJzcDsjaWZk
ZWYgQ09ORklHX0xPQ0tERVA8YnI+DQotc3RydWN0IGxvY2tkZXBfbWFwJm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IGRtYV9mZW5jZV9sb2NrZGVwX21hcCA9IHs8IS0tIC0tPjxicj4NCiYjNDM7c3Rh
dGljIHN0cnVjdCBsb2NrZGVwX21hcCBkbWFfZmVuY2VfbG9ja2RlcF9tYXAgPSB7PCEtLSAtLT48
YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgLm5h
bWUgPSAmcXVvdDtkbWFfZmVuY2VfbWFwJnF1b3Q7PGJyPg0KJm5ic3A7fTs8YnI+DQombmJzcDs8
YnI+DQo8YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8
L2Rpdj4NCjxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_dc5e3b19208744aba28cddb38ff8861aemailandroidcom_--

--===============1569924516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1569924516==--
