Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16C190E46
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 14:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0577A6E47E;
	Tue, 24 Mar 2020 13:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2676E47E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 13:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UG9C2r98ziqSdRGNvb46F9Cah/rPN+IOnrBgMTi8HnRm1ARiIPTFNRzX6icpPKDlCCYOrBMNX4L8J3/uVOnzED0VK3vGpcscWucl49wG5g0m6NeY+R5n58j5kxQoQKonugnzo7E9Kdrh4ulj1YImBmu5wWosMyjTgK6+odtORVRC9Bf3PNnC3O50sOSC/e4XIIli2C3jJ/Gqy1u/1kidsabm1VhhihZ+/8f7BsDiJA8F6DvjCL7XZuz68FpC1WwYKI/TAqWZGUVMOXECCUZhhOGPZ/2ZIs6jqYIM4qgizZvk8QKXl8SwNYha6m2H6q1SVM1dEIu5dtj0KIkSben07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqacY/Fslm1w+5HgVAafn8rleEG/MsTHztlAvUd2nms=;
 b=TWb61z1D28Eo6+pM6jtvvyIkNXiOcbPsZoeZrKuhptIpKN2oh0EvIBaEC7g4I4SklofkyynyN08k4awegXQtKG+bFRAvy5zqY58OwWA2iMS9jS3w8X7KqBbTzmTc7RLdNBBJ72RHfCpEwDHjFocTeCAH5OQLUsdDqFIh6TK2o3dmnOqSHXpf+z6p9imG1YMRYlP9GKJjKEoeNW/dWCjvs2ZNg660ehXByeHySfJCPy1buOOLDXgF3qOUf0LcjVftEIND/SKZRS7nwPNznSe6fAgZJKQKki07nNoIFIALEApP1ivrFZWwnrvkb6073X3nq5uyyetQ1yLXSvZ+cAHKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqacY/Fslm1w+5HgVAafn8rleEG/MsTHztlAvUd2nms=;
 b=iUS818hPGQPDC3O29NylJGpRz1NXeKVdR8fyq0OOrcMm8w2CXqbViPUBy04ERIUR4yDsRDPzuxloXL+lxUV3r1tnIvvqkx83EgOigH4pFYQlqMeKyatwoIl6T6TT03H+SVnVHktX4xLiqoI/cNlExt81CxvsXGDD50kBFNB/tBo=
Received: from DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) by
 DM5PR12MB1788.namprd12.prod.outlook.com (2603:10b6:3:109::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Tue, 24 Mar 2020 13:02:00 +0000
Received: from DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f]) by DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::50f0:a148:4f52:701f%11]) with mapi id 15.20.2835.021; Tue, 24 Mar
 2020 13:02:00 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dma-buf: Improve CONFIG_DMABUF_MOVE_NOTIFY help text
Thread-Topic: [PATCH] dma-buf: Improve CONFIG_DMABUF_MOVE_NOTIFY help text
Thread-Index: AQHWAdxnNjO+QByiSEyZjlLb45QsJw==
Date: Tue, 24 Mar 2020 13:02:00 +0000
Message-ID: <2a885065-48fc-48f8-95bf-8a55aa46d66c@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-originating-ip: [2a02:908:1252:fb60:d499:4acd:5ca0:7c60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3a6553be-8b05-47f3-555c-08d7cff38a87
x-ms-traffictypediagnostic: DM5PR12MB1788:
x-microsoft-antispam-prvs: <DM5PR12MB178883E59CE0703716ADA85583F10@DM5PR12MB1788.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(76116006)(8676002)(81166006)(81156014)(66946007)(186003)(66556008)(64756008)(66446008)(86362001)(4326008)(66476007)(31686004)(31696002)(71200400001)(91956017)(478600001)(66574012)(8936002)(6506007)(6486002)(6512007)(316002)(5660300002)(2906002)(9686003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1788;
 H:DM5PR12MB1578.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wkeagOsqew72ugBAJlOv7715+5X/hufWhlVebxp0+N9gdmo2CpTztVu//AGy9WyJ4UhK3iXCPlpgQVV5ez6sN4n38ybAbGOUT3WLM1OrmaPm+M8mVaUlJDf+y5l9mo6E+xkSEJHyEUmqqqFdhDpfoFH4S2dZ7QF4wB2Mts2wyDZNqe5RlgtGL+ObFRL4IdfBK5QYJCwWX6evyLQ5cLDHNCzCxQax0em4zDedwbaid4Yy8j2eupSNY5H1gGxd+zGLzdQfusuiRVHOrdqXrHo1BEnqpG/bpFeOMKVMN5TDHzIjOoO4UGql/POlf0u3xKZLQzQT2AG9Ow7LmobCPMR4JdD7kpnXUuxKZVzQTkCul559cWkHr81vNJJelFoMY/y3tFdIMPWlbtqwKtJ4XetXt1gZEKS0tNKY8nV6gKuNPpJaz7AVX+laEB2ZlJsLiA6+
x-ms-exchange-antispam-messagedata: w+2UfUhIMRXQKaFpkWqpX4WCf2BLTMcBD2BXBlm9iqJc5pdayaPgXAVYcwthfclJEck3ES4Lt8HKTrPxV5WxHOKnczus0/sAMmmQfeGFTjsjSCIc40GnNpPJUstEc10xknnO1I9eoSB63i2pn3beIYJWnPNsb+3hvsvhH7neJgvvaNaj8pr6FnOs8rvasJn60U61JektOKOePSzDnDCBLg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6553be-8b05-47f3-555c-08d7cff38a87
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 13:02:00.2053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24jzkazkMOBoD3DVtua+PQnreYHzbzfgQ/1mv75+pg9yna2W5UXK1WUFUKvkKGXw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1788
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0648270494=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0648270494==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_2a88506548fc48f895bf8a55aa46d66cemailandroidcom_"

--_000_2a88506548fc48f895bf8a55aa46d66cemailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDI0LjAzLjIwMjAgMTM6NTQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPjoNCkltcHJvdmUgdGhlIGhlbHAgdGV4dCBmb3IgdGhlIENPTkZJ
R19ETUFCVUZfTU9WRV9OT1RJRlkgc3ltYm9sIGJ5Og0KICAxLiBSZW1vdmluZyBkdXBsaWNhdGVk
IHNpbmdsZSBxdW90ZXMsDQogIDIuIEFkZGluZyBhIG1pc3Npbmcgc3ViamVjdCwNCiAgMy4gRml4
aW5nIGEgbWlzc3BlbGxpbmcgb2YgInlldCIsDQogIDQuIFdyYXBwaW5nIGxvbmcgbGluZXMuDQoN
CkZpeGVzOiBiYjQyZGY0NjYyYTQ0NzY1ICgiZG1hLWJ1ZjogYWRkIGR5bmFtaWMgRE1BLWJ1ZiBo
YW5kbGluZyB2MTUiKQ0KU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KLS0tDQogZHJpdmVycy9kbWEtYnVmL0tjb25maWcgfCAx
MSArKysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvS2NvbmZpZyBiL2RyaXZlcnMv
ZG1hLWJ1Zi9LY29uZmlnDQppbmRleCBlZjczYjY3ODQxOWM2ZDg2Li45NjI2NjczZjFkODNhZTY0
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9kbWEtYnVmL0tjb25maWcNCisrKyBiL2RyaXZlcnMvZG1h
LWJ1Zi9LY29uZmlnDQpAQCAtNDMsMTEgKzQzLDEyIEBAIGNvbmZpZyBETUFCVUZfTU9WRV9OT1RJ
RlkNCiAgICAgICAgIGJvb2wgIk1vdmUgbm90aWZ5IGJldHdlZW4gZHJpdmVycyAoRVhQRVJJTUVO
VEFMKSINCiAgICAgICAgIGRlZmF1bHQgbg0KICAgICAgICAgaGVscA0KLSAgICAgICAgIERvbicn
dCBwaW4gYnVmZmVycyBpZiB0aGUgZHluYW1pYyBETUEtYnVmIGludGVyZmFjZSBpcyBhdmFpbGFi
bGUgb24gYm90aCB0aGUNCi0gICAgICAgICBleHBvcnRlciBhcyB3ZWxsIGFzIHRoZSBpbXBvcnRl
ci4gVGhpcyBmaXhlcyBhIHNlY3VyaXR5IHByb2JsZW0gd2hlcmUNCi0gICAgICAgICB1c2Vyc3Bh
Y2UgaXMgYWJsZSB0byBwaW4gdW5yZXN0cmljdGVkIGFtb3VudHMgb2YgbWVtb3J5IHRocm91Z2gg
RE1BLWJ1Zi4NCi0gICAgICAgICBCdXQgbWFya2VkIGV4cGVyaW1lbnRhbCBiZWNhdXNlIHdlIGRv
bicndCBqZXQgaGF2ZSBhIGNvbnNpc3RlbnQgZXhlY3V0aW9uDQotICAgICAgICAgY29udGV4dCBh
bmQgbWVtb3J5IG1hbmFnZW1lbnQgYmV0d2VlbiBkcml2ZXJzLg0KKyAgICAgICAgIERvbid0IHBp
biBidWZmZXJzIGlmIHRoZSBkeW5hbWljIERNQS1idWYgaW50ZXJmYWNlIGlzIGF2YWlsYWJsZSBv
bg0KKyAgICAgICAgIGJvdGggdGhlIGV4cG9ydGVyIGFzIHdlbGwgYXMgdGhlIGltcG9ydGVyLiBU
aGlzIGZpeGVzIGEgc2VjdXJpdHkNCisgICAgICAgICBwcm9ibGVtIHdoZXJlIHVzZXJzcGFjZSBp
cyBhYmxlIHRvIHBpbiB1bnJlc3RyaWN0ZWQgYW1vdW50cyBvZiBtZW1vcnkNCisgICAgICAgICB0
aHJvdWdoIERNQS1idWYuDQorICAgICAgICAgVGhpcyBpcyBtYXJrZWQgZXhwZXJpbWVudGFsIGJl
Y2F1c2Ugd2UgZG9uJ3QgeWV0IGhhdmUgYSBjb25zaXN0ZW50DQorICAgICAgICAgZXhlY3V0aW9u
IGNvbnRleHQgYW5kIG1lbW9yeSBtYW5hZ2VtZW50IGJldHdlZW4gZHJpdmVycy4NCg0KIGNvbmZp
ZyBETUFCVUZfU0VMRlRFU1RTDQogICAgICAgICB0cmlzdGF0ZSAiU2VsZnRlc3RzIGZvciB0aGUg
ZG1hLWJ1ZiBpbnRlcmZhY2VzIg0KLS0NCjIuMTcuMQ0KDQoNCg==

--_000_2a88506548fc48f895bf8a55aa46d66cemailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <5A3C7C8CF9DF6C4797713837A083F201@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDI0LjAzLjIwMjAgMTM6NTQgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW4gJmx0O2dlZXJ0JiM0MztyZW5lc2FzQGdsaWRlci5iZSZndDs6PGJyIHR5cGU9ImF0dHJp
YnV0aW9uIj4NCjxibG9ja3F1b3RlIGNsYXNzPSJxdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAu
OGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj48
Zm9udCBzaXplPSIyIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExcHQiPg0KPGRpdj5JbXByb3Zl
IHRoZSBoZWxwIHRleHQgZm9yIHRoZSBDT05GSUdfRE1BQlVGX01PVkVfTk9USUZZIHN5bWJvbCBi
eTo8YnI+DQombmJzcDsgMS4gUmVtb3ZpbmcgZHVwbGljYXRlZCBzaW5nbGUgcXVvdGVzLDxicj4N
CiZuYnNwOyAyLiBBZGRpbmcgYSBtaXNzaW5nIHN1YmplY3QsPGJyPg0KJm5ic3A7IDMuIEZpeGlu
ZyBhIG1pc3NwZWxsaW5nIG9mICZxdW90O3lldCZxdW90Oyw8YnI+DQombmJzcDsgNC4gV3JhcHBp
bmcgbG9uZyBsaW5lcy48YnI+DQo8YnI+DQpGaXhlczogYmI0MmRmNDY2MmE0NDc2NSAoJnF1b3Q7
ZG1hLWJ1ZjogYWRkIGR5bmFtaWMgRE1BLWJ1ZiBoYW5kbGluZyB2MTUmcXVvdDspPGJyPg0KU2ln
bmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuICZsdDtnZWVydCYjNDM7cmVuZXNhc0BnbGlk
ZXIuYmUmZ3Q7PGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3Rl
Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0K
PGRpdiBkaXI9ImF1dG8iPlJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnICZsdDtjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20mZ3Q7PC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+
DQo8ZGl2IGRpcj0iYXV0byI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+DQo8ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+DQo8YmxvY2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46
MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4N
CjxkaXY+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXY+
LS0tPGJyPg0KJm5ic3A7ZHJpdmVycy9kbWEtYnVmL0tjb25maWcgfCAxMSAmIzQzOyYjNDM7JiM0
MzsmIzQzOyYjNDM7JiM0MzstLS0tLTxicj4NCiZuYnNwOzEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoJiM0MzspLCA1IGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2RtYS1idWYvS2NvbmZpZyBiL2RyaXZlcnMvZG1hLWJ1Zi9LY29uZmlnPGJyPg0KaW5kZXgg
ZWY3M2I2Nzg0MTljNmQ4Ni4uOTYyNjY3M2YxZDgzYWU2NCAxMDA2NDQ8YnI+DQotLS0gYS9kcml2
ZXJzL2RtYS1idWYvS2NvbmZpZzxicj4NCiYjNDM7JiM0MzsmIzQzOyBiL2RyaXZlcnMvZG1hLWJ1
Zi9LY29uZmlnPGJyPg0KQEAgLTQzLDExICYjNDM7NDMsMTIgQEAgY29uZmlnIERNQUJVRl9NT1ZF
X05PVElGWTxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBib29sICZxdW90O01vdmUgbm90aWZ5IGJldHdlZW4gZHJpdmVycyAoRVhQRVJJTUVOVEFM
KSZxdW90Ozxicj4NCiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBkZWZhdWx0IG48YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgaGVscDxicj4NCi0mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgRG9uJyd0IHBpbiBidWZmZXJzIGlmIHRoZSBkeW5hbWljIERNQS1idWYg
aW50ZXJmYWNlIGlzIGF2YWlsYWJsZSBvbiBib3RoIHRoZTxicj4NCi0mbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZXhwb3J0ZXIgYXMgd2VsbCBhcyB0aGUg
aW1wb3J0ZXIuIFRoaXMgZml4ZXMgYSBzZWN1cml0eSBwcm9ibGVtIHdoZXJlPGJyPg0KLSZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB1c2Vyc3BhY2UgaXMg
YWJsZSB0byBwaW4gdW5yZXN0cmljdGVkIGFtb3VudHMgb2YgbWVtb3J5IHRocm91Z2ggRE1BLWJ1
Zi48YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
IEJ1dCBtYXJrZWQgZXhwZXJpbWVudGFsIGJlY2F1c2Ugd2UgZG9uJyd0IGpldCBoYXZlIGEgY29u
c2lzdGVudCBleGVjdXRpb248YnI+DQotJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGNvbnRleHQgYW5kIG1lbW9yeSBtYW5hZ2VtZW50IGJldHdlZW4gZHJp
dmVycy48YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBEb24ndCBwaW4gYnVmZmVycyBpZiB0aGUgZHluYW1pYyBETUEtYnVmIGludGVyZmFj
ZSBpcyBhdmFpbGFibGUgb248YnI+DQomIzQzOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBib3RoIHRoZSBleHBvcnRlciBhcyB3ZWxsIGFzIHRoZSBpbXBv
cnRlci4gVGhpcyBmaXhlcyBhIHNlY3VyaXR5PGJyPg0KJiM0MzsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgcHJvYmxlbSB3aGVyZSB1c2Vyc3BhY2UgaXMg
YWJsZSB0byBwaW4gdW5yZXN0cmljdGVkIGFtb3VudHMgb2YgbWVtb3J5PGJyPg0KJiM0MzsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgdGhyb3VnaCBETUEt
YnVmLjxicj4NCiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IFRoaXMgaXMgbWFya2VkIGV4cGVyaW1lbnRhbCBiZWNhdXNlIHdlIGRvbid0IHlldCBo
YXZlIGEgY29uc2lzdGVudDxicj4NCiYjNDM7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IGV4ZWN1dGlvbiBjb250ZXh0IGFuZCBtZW1vcnkgbWFuYWdlbWVu
dCBiZXR3ZWVuIGRyaXZlcnMuPGJyPg0KJm5ic3A7PGJyPg0KJm5ic3A7Y29uZmlnIERNQUJVRl9T
RUxGVEVTVFM8YnI+DQombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgdHJpc3RhdGUgJnF1b3Q7U2VsZnRlc3RzIGZvciB0aGUgZG1hLWJ1ZiBpbnRlcmZhY2Vz
JnF1b3Q7PGJyPg0KLS0gPGJyPg0KMi4xNy4xPGJyPg0KPGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9m
b250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8YnI+DQo8L2Rpdj4NCjwvZGl2Pg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_2a88506548fc48f895bf8a55aa46d66cemailandroidcom_--

--===============0648270494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0648270494==--
