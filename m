Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158CAD6FEA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1F56E5F9;
	Tue, 15 Oct 2019 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730098.outbound.protection.outlook.com [40.107.73.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA306E1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 03:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+J2h+VZ2WnvSn8b73n4oMQmxkkzngUD0j1DVkXRMcSQWNNZ5ET0KsKZ+0VJEimfT1dRjFZpYNVTt0ILtfUy9LkeqkdtRoF7wwhBzOvMrKBrvytMcUP7wEU5akqS2MGGrAoSPudb+DPwz4tFW5a8wn69em3MxG8lcFuPhPUv19ZRyCHTmaHx0NgUE5ar1rQn7dLUe93HdmoK/bZ6I54wfeRQRJBKh4fPC8XY0se+1l5gQ4CvpSOUn2PJ4fembUrFI2chklV/W1qlja7klVpXCpJ7YC3Yw+vo4Z+IDVi9WSkHNPHXb+9pwFifbOwMThmL3bUv6LvwZ3fArpQS5sMrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d80GwwOIkGn7PAa7+DdYtObkJHfV4UlhDCj04ShgP1s=;
 b=QYrDPsPZLAbg0Yq433VKnaAwp5xM1KRpWudCy6QnIXNZ6vojANGVDTUc+JlOO828T02oeZb/BEGbIDVtvEOq5GBTazu6I4PywITHIe3XcXE/Ctn/NYCOD5NWJIP9OZllAFmRXMUFaizmjCffXpAbSIejJQguC5Xao+4cE44CiHTVfgcmZmI4lb/swxZTOhqd0zxIyKkvHxDgNP3mAnzagpvTyA3/aWDkOacdd7vYdW8wmJK61dlqunBgQT2ePhSOqBHgg9iD1Q1qq1XhlOHuMd0XSdZ0ae0sRWrlHfHZoYfqgka70J8lupliQTKJIIv1b7EILNz/atgQdTBjfQPbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB5197.namprd04.prod.outlook.com (20.178.6.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Tue, 15 Oct 2019 03:03:00 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 03:03:00 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVf9qi2ZQPn8IAhkqsNtop++SEM6dVTGmAgAAZ3gCABBGvAIABQksAgABQGAA=
Date: Tue, 15 Oct 2019 03:02:59 +0000
Message-ID: <20191015030250.GA11971@xin-VirtualBox>
References: <cover.1570760115.git.xji@analogixsemi.com>
 <CGME20191011022154epcas3p1a719423a23f8bf193b6136e853e66b04@epcas3p1.samsung.com>
 <75bb8a47d2c3c1f979c6d62158c21988b846e79b.1570760115.git.xji@analogixsemi.com>
 <3c6067de-9f3c-b93c-f263-fa5dd09c3270@samsung.com>
 <20191011125418.GE4882@pendragon.ideasonboard.com>
 <20191014030238.GB2390@xin-VirtualBox>
 <20191014221610.GK23442@pendragon.ideasonboard.com>
In-Reply-To: <20191014221610.GK23442@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::30) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0eb85643-6c7f-4788-e88f-08d7511c2f7c
x-ms-traffictypediagnostic: SN6PR04MB5197:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB5197CB6E1EA5934DCE1915F7C7930@SN6PR04MB5197.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(396003)(376002)(39850400004)(366004)(346002)(189003)(199004)(71190400001)(54906003)(33716001)(66946007)(99286004)(305945005)(26005)(7736002)(86362001)(186003)(7416002)(71200400001)(5660300002)(66556008)(66476007)(14454004)(64756008)(66446008)(1076003)(66066001)(478600001)(966005)(6512007)(6916009)(256004)(6306002)(53546011)(3846002)(6116002)(386003)(6506007)(8936002)(9686003)(14444005)(33656002)(316002)(2906002)(25786009)(446003)(6486002)(11346002)(476003)(486006)(6246003)(52116002)(4326008)(102836004)(81156014)(81166006)(107886003)(8676002)(6436002)(229853002)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5197;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nCY8e8wWzzWu1ZiRHVfc/BmypzO4fYMXPlQUQKg5b3yUXCVYIV25PUfVTcFTj6QaWe3mrcd5+1zzi4fdUwXi4NT3p8SQe2T38Q1VcW/KiT+kc49XbxJz7tCMRtbpjVXvJgddR1+5IdeGKcWD0uY56wdH8LpsBtACJwuQwalAC9TwJsZ7eO7FfxXabHbEEqK1dOTzfMnFdZAD3wu9UnEUYoMCbr/eLtJWtjdJ5ILG2wzKwmAIGwDTw0LaRxBUqHEGWQpzL9MWQTRhU482/z3SWS6ktwm1M/j8GQuFUVr2808o5UHZdSgYX1vcDnL1e6trLnWIAMp+QcZbtSHMwarkQK2e0WHIlW6DecFrds+paSKqaFsyAvNU8IVN71zCe6uDC5RkgR/zwfABBHk87C9qk/uRZIyYUhKvyfgk3WBVCxOPwCMiO0sEWOeahByiHVNKuFEtpF/aRUKcNliLTd36yQ==
Content-ID: <AD3DBB8972A3BB47ADF3029370BB7AEF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb85643-6c7f-4788-e88f-08d7511c2f7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 03:03:00.0559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7dUDx6AqxbNoKIN4DlEgHoCMefIldj7bkqUxGVou5NqpSl0MKzEqnB/opZsdVvbdoAih30b8Bh7tahs9hVK8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5197
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d80GwwOIkGn7PAa7+DdYtObkJHfV4UlhDCj04ShgP1s=;
 b=TLkvG/LSzYXBIYOD+VL9UGyVESpZ6n5Cm/xOyGTvfGlk6wMw0OPH3deO02kILAg+XgE8uQzcbJvf7aVwa56vWw66MmgsQEWqjs/WCF5rF02vcZdp+wrRMVm0H791DiC+liShqRMT4s44PFojlqX9bpKEqqsoBVjThlwccAdUYXY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwKCk9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDAxOjE2OjEwQU0g
KzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGkgWGluIEppLAo+IAo+IE9uIE1vbiwg
T2N0IDE0LCAyMDE5IGF0IDAzOjAyOjQ4QU0gKzAwMDAsIFhpbiBKaSB3cm90ZToKPiA+IE9uIEZy
aSwgT2N0IDExLCAyMDE5IGF0IDAzOjU0OjE4UE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3Jv
dGU6Cj4gPiA+IE9uIEZyaSwgT2N0IDExLCAyMDE5IGF0IDAxOjIxOjQzUE0gKzAyMDAsIEFuZHJ6
ZWogSGFqZGEgd3JvdGU6Cj4gPiA+PiBPbiAxMS4xMC4yMDE5IDA0OjIxLCBYaW4gSmkgd3JvdGU6
Cj4gPiA+Pj4gVGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBU
cmFuc21pdHRlciBkZXNpZ25lZAo+ID4gPj4+IGZvciBwb3J0YWJsZSBkZXZpY2UuIEl0IGNvbnZl
cnRzIE1JUEkgdG8gRGlzcGxheVBvcnQgMS4zIDRLLgo+ID4gPj4+Cj4gPiA+Pj4gWW91IGNhbiBh
ZGQgc3VwcG9ydCB0byB5b3VyIGJvYXJkIHdpdGggYmluZGluZy4KPiA+ID4+Pgo+ID4gPj4+IEV4
YW1wbGU6Cj4gPiA+Pj4gCWFueDc2MjVfYnJpZGdlOiBlbmNvZGVyQDU4IHsKPiA+ID4+PiAJCWNv
bXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzYyNSI7Cj4gPiA+Pj4gCQlyZWcgPSA8MHg1OD47Cj4g
PiA+Pj4gCQlzdGF0dXMgPSAib2theSI7Cj4gPiA+Pj4gCQlwYW5lbC1mbGFncyA9IDwxPjsKPiA+
ID4+PiAJCWVuYWJsZS1ncGlvcyA9IDwmcGlvIDQ1IEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gPj4+
IAkJcmVzZXQtZ3Bpb3MgPSA8JnBpbyA3MyBHUElPX0FDVElWRV9ISUdIPjsKPiA+ID4+PiAJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gPj4+IAkJI3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+Pj4K
PiA+ID4+PiAJCXBvcnRAMCB7Cj4gPiA+Pj4gCQkgIHJlZyA9IDwwPjsKPiA+ID4+PiAJCSAgYW54
XzFfaW46IGVuZHBvaW50IHsKPiA+ID4+PiAJCSAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlf
ZHNpPjsKPiA+ID4+PiAJCSAgfTsKPiA+ID4+PiAJCX07Cj4gPiA+Pj4KPiA+ID4+PiAJCXBvcnRA
MyB7Cj4gPiA+Pj4gCQkgIHJlZyA9IDwzPjsKPiA+ID4+PiAJCSAgYW54XzFfb3V0OiBlbmRwb2lu
dCB7Cj4gPiA+Pj4gCQkgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47Cj4gPiA+Pj4g
CQkgIH07Cj4gPiA+Pj4gCQl9Owo+ID4gPj4+IAl9Owo+ID4gPj4+Cj4gPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogWGluIEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT4KPiA+ID4+PiAtLS0KPiA+ID4+PiAg
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCAgICAgICAgICAgfCA5NiAr
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA5NiBpbnNlcnRp
b25zKCspCj4gPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1sCj4gPiA+Pj4KPiA+ID4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL2FueDc2MjUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9hbng3NjI1LnlhbWwKPiA+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
Pj4+IGluZGV4IDAwMDAwMDAuLmZjODQ2ODMKPiA+ID4+PiAtLS0gL2Rldi9udWxsCj4gPiA+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2Fu
eDc2MjUueWFtbAo+ID4gPj4+IEBAIC0wLDAgKzEsOTYgQEAKPiA+ID4+PiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+ID4gPj4+ICsjIENvcHly
aWdodCAyMDE5IEFuYWxvZ2l4IFNlbWljb25kdWN0b3IsIEluYy4KPiA+ID4+PiArJVlBTUwgMS4y
Cj4gPiA+Pj4gKy0tLQo+ID4gPj4+ICskaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1LnlhbWwjIgo+ID4gPj4+ICskc2NoZW1hOiAiaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgo+ID4gPj4+ICsKPiA+ID4+
PiArdGl0bGU6IEFuYWxvZ2l4IEFOWDc2MjUgU2xpbVBvcnQgKDRLIE1vYmlsZSBIRCBUcmFuc21p
dHRlcikKPiA+ID4+PiArCj4gPiA+Pj4gK21haW50YWluZXJzOgo+ID4gPj4+ICsgIC0gWGluIEpp
IDx4amlAYW5hbG9naXhzZW1pLmNvbT4KPiA+ID4+PiArCj4gPiA+Pj4gK2Rlc2NyaXB0aW9uOiB8
Cj4gPiA+Pj4gKyAgVGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBI
RCBUcmFuc21pdHRlcgo+ID4gPj4+ICsgIGRlc2lnbmVkIGZvciBwb3J0YWJsZSBkZXZpY2VzLgo+
ID4gPj4+ICsKPiA+ID4+PiArcHJvcGVydGllczoKPiA+ID4+PiArICAiI2FkZHJlc3MtY2VsbHMi
OiB0cnVlCj4gPiA+Pj4gKyAgIiNzaXplLWNlbGxzIjogdHJ1ZQo+ID4gPj4+ICsKPiA+ID4+PiAr
ICBjb21wYXRpYmxlOgo+ID4gPj4+ICsgICAgaXRlbXM6Cj4gPiA+Pj4gKyAgICAgIC0gY29uc3Q6
IGFuYWxvZ2l4LGFueDc2MjUKPiA+ID4+PiArCj4gPiA+Pj4gKyAgcmVnOgo+ID4gPj4+ICsgICAg
bWF4SXRlbXM6IDEKPiA+ID4+PiArCj4gPiA+Pj4gKyAgcGFuZWwtZmxhZ3M6Cj4gPiA+Pj4gKyAg
ICBkZXNjcmlwdGlvbjogaW5kaWNhdGUgdGhlIHBhbmVsIGlzIGludGVybmFsIG9yIGV4dGVybmFs
Cj4gPiA+Pj4gKyAgICBtYXhJdGVtczogMQo+ID4gPj4+ICsKPiA+ID4+PiArICBpbnRlcnJ1cHRz
Ogo+ID4gPj4+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4+PiArCj4gPiA+Pj4gKyAgZW5hYmxlLWdw
aW9zOgo+ID4gPj4+ICsgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHBvd2VyIG9uIGNoaXAgY29u
dHJvbCwgUE9XRVJfRU4gcGluIEQyLgo+ID4gPj4+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4+PiAr
Cj4gPiA+Pj4gKyAgcmVzZXQtZ3Bpb3M6Cj4gPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjogdXNlZCBm
b3IgcmVzZXQgY2hpcCBjb250cm9sLCBSRVNFVF9OIHBpbiBCNy4KPiA+ID4+PiArICAgIG1heEl0
ZW1zOiAxCj4gPiA+Pj4gKwo+ID4gPj4+ICsgIHBvcnRAMDoKPiA+ID4+PiArICAgIHR5cGU6IG9i
amVjdAo+ID4gPj4+ICsgICAgZGVzY3JpcHRpb246Cj4gPiA+Pj4gKyAgICAgIEEgcG9ydCBub2Rl
IHBvaW50aW5nIHRvIE1JUEkgRFNJIGhvc3QgcG9ydCBub2RlLgo+ID4gPj4+ICsKPiA+ID4+PiAr
ICBwb3J0QDE6Cj4gPiA+Pj4gKyAgICB0eXBlOiBvYmplY3QKPiA+ID4+PiArICAgIGRlc2NyaXB0
aW9uOgo+ID4gPj4+ICsgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBNSVBJIERQSSBob3N0
IHBvcnQgbm9kZS4KPiA+ID4+PiArCj4gPiA+Pj4gKyAgcG9ydEAyOgo+ID4gPj4+ICsgICAgdHlw
ZTogb2JqZWN0Cj4gPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ID4+PiArICAgICAgQSBwb3J0
IG5vZGUgcG9pbnRpbmcgdG8gZXh0ZXJuYWwgY29ubmVjdG9yIHBvcnQgbm9kZS4KPiA+ID4+PiAr
Cj4gPiA+Pj4gKyAgcG9ydEAzOgo+ID4gPj4+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiA+Pj4gKyAg
ICBkZXNjcmlwdGlvbjoKPiA+ID4+PiArICAgICAgQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gZURQ
IHBvcnQgbm9kZS4KPiA+ID4+IAo+ID4gPj4gCj4gPiA+PiBEZWNyeXB0aW5nIGF2YWlsYWJsZSBw
cm9kdWN0IGJyaWVmWzFdLCB0aGVyZSBhcmUgZm9sbG93aW5nIHBoeXNpY2FsIGxpbmVzOgo+ID4g
Pj4gCj4gPiA+PiBJbnB1dDoKPiA+ID4+IAo+ID4gPj4gLSBNSVBJIERTSS9EUEkgLSB2aWRlbyBk
YXRhLCBhcmUgRFNJIGFuZCBEUEkgbGluZXMgc2hhcmVkPwo+ID4gPiAKPiA+ID4gSXQgd291bGQg
YmUgbXVjaCBlYXNpZXIgaWYgd2UgY291bGQgaGF2ZSBhY2Nlc3MgdG8gbW9yZSBjb21wbGV0ZQo+
ID4gPiBpbmZvcm1hdGlvbi4gSSBiZWxpZXZlIHRoZSBEU0kgYW5kIERQSSBwaW5zIGNvdWxkIGJl
IG11eGVkLCBidXQgdGhlcmUKPiA+ID4gc2hvdWxkIGJlIG1vcmUgRFBJIHBpbnMgdGhhbiBEU0kg
cGlucy4KPiA+Cj4gPiBZZXMgRFBJIHBpbnMgbW9yZSB0aGFuIERTSSBwaW5zLgo+ID4gCj4gPiA+
PiAKPiA+ID4+IC0gSTJTIC0gYXVkaW8gZGF0YSwKPiA+ID4+IAo+ID4gPj4gLSBJMkMgLSBjb250
cm9sIGxpbmUsCj4gPiA+PiAKPiA+ID4+IC0gQUxFUlQvSU5UUCAtIGludGVycnVwdCwKPiA+ID4+
IAo+ID4gPj4gLSBVU0IgMy4xIFNTUmMvVHggLSBmb3IgVVNCIGZvcndhcmRpbmcsCj4gPiA+PiAK
PiA+ID4+IE91dHB1dDoKPiA+ID4+IAo+ID4gPj4gLSBTUzEsIFNTMiwKPiA+ID4+IAo+ID4gPj4g
LSBTQlUvQVVYLAo+ID4gPj4gCj4gPiA+PiAtIENDMS8yLgo+ID4gPj4gCj4gPiA+PiAKPiA+ID4+
IEhhdmluZyB0aGlzIGluZm9ybWF0aW9uIEkgdHJ5IHRvIHVuZGVyc3RhbmQgcG9ydHMgZGVmaW5l
ZCBieSB5b3U6Cj4gPiA+PiAKPiA+ID4+IC0gcG9ydEAyIHlvdSBoYXZlIGRlZmluZWQgYXMgcG9p
bnRpbmcgdG8gZXh0ZXJuYWwgcG9ydCwgYnV0IGhlcmUgdGhlCj4gPiA+PiBwb3J0IHNob3VsZCBi
ZSByYXRoZXIgc3Vibm9kZSBvZiBBTlg3NjI1IC0gdGhlIGNoaXAgaGFzIENDIGxpbmVzLCBzZWUK
PiA+ID4+IGJlZ2lubmluZyBvZiBbMl0uCj4gPiA+PiAKPiA+ID4+IC0gcG9ydEAzIGRlc2NyaWJl
cyBTUzEsIFNTMiBhbmQgU0JVL0FVWCBsaW5lcyB0b2dldGhlciwgYW0gSSByaWdodD8gSW4KPiA+
ID4+IFVTQi1DIGJpbmRpbmcgU0JVIGFuZCBTUyBsaW5lcyBhcmUgcmVwcmVzZW50ZWQgYnkgZGlm
ZmVyZW50IHBvcnRzLAo+ID4gPj4gZGlmZmVyZW50IGFwcHJvYWNoLCBidXQgbWF5YmUgYmV0dGVy
IGluIHRoaXMgY2FzZS4KPiA+ID4gCj4gPiA+IEkgYmVsaWV2ZSB0aGF0LCB3aGVuIGNvbm5lY3Rl
ZCB0byBhIERQIGRpc3BsYXkgKGVpdGhlciBEUCBvciBlRFApLCB0aGUKPiA+ID4gRGlzcGxheVBv
cnQgc2lnbmFscyBhcmUgb3V0cHV0IG9uIFNTMSBhbmQvb3IgU1MyLiBJIHRoaXMgcmVhbGx5IHdv
bmRlcgo+ID4gPiBpZiB3ZSBuZWVkIHR3byBzZXBhcmF0ZSBwb3J0cyBmb3IgdGhpcywgaXQgc2Vl
bXMgdGhhdCBwb3J0QDIgYW5kIHBvcnRAMwo+ID4gPiBzaG91bGQgYmUgbWVyZ2VkLgo+ID4KPiA+
IE9LLCBJIHdpbGwgbWVyZ2UgdGhlIHBvcnRAMiBhbmQgcG9ydEAzLCBhbmQgdXNlIGEgZmxhZyB0
byBpbmRpY2F0ZQo+ID4gd2hldGhlciB0aGUgY29udHJvbCBpcyBleHRlcm5hbCBjb25uZWN0b3Ig
Y29udHJvbCBvciBub3QuCj4gCj4gQ291bGQgdGhpcyBiZSBpbmZlcnJlZCBmcm9tIHRoZSBjb25u
ZWN0ZWQgRFQgbm9kZSA/IElmIHRoZSBub2RlCj4gY29ubmVjdGVkIHRvIHRoZSBlbmRwb2ludCBp
cyBhIGRpc3BsYXkgY29ubmVjdG9yIG5vZGUsIHRoZW4gd2UgaGF2ZSBhbgo+IGV4dGVybmFsIGNv
bm5lY3Rvci4gT3RoZXJ3aXNlIHdlIGhhdmUgYW4gZURQIHBhbmVsLiBJZGVhbGx5IHRoaXMgc2hv
dWxkCj4gZXZlbiBiZSBkb25lIGF0IHJ1bnRpbWUsIGJ5IGNvbW11bmljYXRpbmcgd2l0aCB0aGUg
ZHJtX2JyaWRnZSBvcgo+IGRybV9wYW5lbCBjb3JyZXNwb25kaW5nIHRvIHRoZSBjb25uZWN0ZWQg
bm9kZS4KCkkgdGhpbmsgdGhlIHBvcnRAMiBzaG91bGQgYmUgcmVtb3ZlZCwgaXQgY291bGQgbm90
IGJlIGluZmVycmVkIGZyb20gdGhlCmNvbm5lY3RlZCBEVCBub2RlLgoKPiAKPiA+ID4+IE1heWJl
IGl0IHdvdWxkIGJlIGdvb2QgdG8gYWRkIDJuZCBleGFtcGxlIHdpdGggVVNCLUMgcG9ydC4KPiA+
ID4gCj4gPiA+IFRoYXQgd291bGQgaGVscCB3aXRoIHRoZSBkaXNjdXNzaW9uLCB5ZXMuCj4gPgo+
ID4gQXMgd2UgZGlzYWJsZWQgVVNCLUMgZmVhdHVyZSBpbiBhbng3NjI1LCB3ZSBjYW5ub3QgZGVm
aW5lIGEgVVNCLUMgcG9ydC4KPiAKPiBJdCdzIGZpbmUgaWYgdGhlIGZlYXR1cmUgaXNuJ3QgaW1w
bGVtZW50ZWQgaW4gdGhlIGRyaXZlciwgYnV0IHdlIHNob3VsZAo+IHN0aWxsIHRha2UgaXQgaW50
byBhY2NvdW50IHRvIGRlc2lnbiB0aGUgRFQgYmluZGluZ3MuIE90aGVyd2lzZSwgd2hlbgo+IHNv
bWVvbmUgd2lsbCB3YW50IHRvIGFkZCBzdXBwb3J0IGZvciBVU0ItQyB0byB0aGUgQU5YNzYyNSBi
aW5kaW5ncywgdGhleQo+IG1heSBmaW5kIGl0IGltcG9zc2libGUgdG8gZG8gc28gaW4gYSBuaWNl
IGJhY2t3YXJkLWNvbXBhdGlibGUgd2F5Lgo+IFRoYXQncyB3aHkgYW4gZXhhbXBsZSB3b3VsZCBh
bHJlYWR5IGJlIHVzZWZ1bC4KT0suCj4gCj4gPiA+PiBbMV06Cj4gPiA+PiBodHRwczovL3d3dy5h
bmFsb2dpeC5jb20vc3lzdGVtL2ZpbGVzL0FBLTAwMjI5MS1QQi02LUFOWDc2MjVfUHJvZHVjdEJy
aWVmLnBkZgo+ID4gPj4gCj4gPiA+PiBbMl06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci50eHQKPiA+ID4+IAo+ID4gPj4+ICsKPiA+ID4+
PiArcmVxdWlyZWQ6Cj4gPiA+Pj4gKyAgLSAiI2FkZHJlc3MtY2VsbHMiCj4gPiA+Pj4gKyAgLSAi
I3NpemUtY2VsbHMiCj4gPiA+Pj4gKyAgLSBjb21wYXRpYmxlCj4gPiA+Pj4gKyAgLSByZWcKPiA+
ID4+PiArICAtIHBvcnRAMAo+ID4gPj4+ICsgIC0gcG9ydEAzCj4gPiA+Pj4gKwo+ID4gPj4+ICtl
eGFtcGxlOgo+ID4gPj4+ICsgIC0gfAo+ID4gPj4+ICsgICAgYW54NzYyNV9icmlkZ2U6IGVuY29k
ZXJANTggewo+ID4gPj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NzYyNSI7
Cj4gPiA+Pj4gKyAgICAgICAgcmVnID0gPDB4NTg+Owo+ID4gPj4+ICsgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiA+ID4+PiArICAgICAgICBwYW5lbC1mbGFncyA9IDwxPjsKPiA+ID4+PiArICAg
ICAgICBlbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSBHUElPX0FDVElWRV9ISUdIPjsKPiA+ID4+PiAr
ICAgICAgICByZXNldC1ncGlvcyA9IDwmcGlvIDczIEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gPj4+
ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gPj4+ICsgICAgICAgICNzaXplLWNl
bGxzID0gPDA+Owo+ID4gPj4+ICsKPiA+ID4+PiArICAgICAgICBwb3J0QDAgewo+ID4gPj4+ICsg
ICAgICAgICAgcmVnID0gPDA+Owo+ID4gPj4+ICsgICAgICAgICAgYW54XzFfaW46IGVuZHBvaW50
IHsKPiA+ID4+PiArICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2RzaT47Cj4g
PiA+Pj4gKyAgICAgICAgICB9Owo+ID4gPj4+ICsgICAgICAgIH07Cj4gPiA+Pj4gKwo+ID4gPj4+
ICsgICAgICAgIHBvcnRAMyB7Cj4gPiA+Pj4gKyAgICAgICAgICByZWcgPSA8Mz47Cj4gPiA+Pj4g
KyAgICAgICAgICBhbnhfMV9vdXQ6IGVuZHBvaW50IHsKPiA+ID4+PiArICAgICAgICAgICAgcmVt
b3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbj47Cj4gPiA+Pj4gKyAgICAgICAgICB9Owo+ID4gPj4+
ICsgICAgICAgIH07Cj4gPiA+Pj4gKyAgICB9Owo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
