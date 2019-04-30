Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B3AF174
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA2A8945B;
	Tue, 30 Apr 2019 07:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4D58945B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:36:00 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4973.eurprd08.prod.outlook.com (10.255.158.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 07:35:58 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::6841:2153:b91f:759]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::6841:2153:b91f:759%4]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 07:35:57 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [v1, 2/2] dt/bindings: drm/komeda: Adds SMMU support for D71
 devicetree
Thread-Topic: [v1, 2/2] dt/bindings: drm/komeda: Adds SMMU support for D71
 devicetree
Thread-Index: AQHU/ydZVkhRNHPXX0aJoYulI/NjeQ==
Date: Tue, 30 Apr 2019 07:35:57 +0000
Message-ID: <20190430073549.GB9516@james-ThinkStation-P300>
References: <1556605118-22700-3-git-send-email-lowry.li@arm.com>
In-Reply-To: <1556605118-22700-3-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a5673a1-fcc8-4338-78c1-08d6cd3e7bcc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4973; 
x-ms-traffictypediagnostic: VE1PR08MB4973:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB49738867D3A15D569F0D2025B33A0@VE1PR08MB4973.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(346002)(136003)(396003)(376002)(366004)(189003)(199004)(53936002)(52116002)(14454004)(76176011)(102836004)(71190400001)(71200400001)(9686003)(6512007)(81156014)(4326008)(186003)(6862004)(256004)(8936002)(7736002)(25786009)(305945005)(26005)(8676002)(6246003)(33656002)(81166006)(66066001)(6636002)(2906002)(33716001)(66446008)(11346002)(1076003)(5660300002)(6436002)(64756008)(3846002)(316002)(66556008)(66476007)(386003)(6116002)(86362001)(486006)(446003)(66946007)(476003)(54906003)(68736007)(6486002)(6506007)(478600001)(99286004)(97736004)(229853002)(55236004)(73956011)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4973;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QWtoqMQWlprJ0TD37xLwWdACSr20XiDm4KvXy5q4sugSI3u67Bm9aB0WVcJRH2KCLGJSw/Uem3RzSyhHyfWgbA3k0mBOUPQLwAI0cMs0vvsFCpdznLqrolE2bnAs2m6RDVIAQle6ROWIgVGcPa27AkS46rowlCYsuUft8peTWB+bHzd/7ecfBxlvsUwI2sZeBN6QlqEJnBp9SlIT4vcshsoQcSc8OoczE+QNNx27ZVJrwl2gZcFlIresPrQdexuXNms93+c/frvgsbQelDi0eTCyFbxmk1/Y53QvjL4/QCxjY9rpmGftyF0XqEDfAPZY5cLbSXo1d2CVBx4zhEDycMAZM+dv6YhYidhDrszK20LmcOB/gdK/+fms1r5BKKhreu+j3/9OUMuuDixSu3Ag4zQcJCQnujk/iRNWl6fY79k=
Content-ID: <989FF78681E14844A96650083EC0D567@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5673a1-fcc8-4338-78c1-08d6cd3e7bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 07:35:57.8186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4973
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go6iQ+1x4JpEwMcwnKDDHRtlLRzUn0NQUZfcb0X8Pmg=;
 b=JcvCqi4x2XVq4Z6AyZ6kOLpnyB8JtWzEK5xTu27Gw2CoqFpTLVb//HGjzRQTOR4c8zClDYUzDmE4Nxb7fzDV0T/mqdm6dfyv2ShwUkNxZAoBYIbGZFlnfG/ppwJ4nwjjOqLni2SUgp0PVDjrM10vbVUhv9JV7YYxSynky0SFgv8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDY6MTk6MzRBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBVcGRhdGVzIHRoZSBkZXZpY2UtdHJlZSBkb2MgYWJv
dXQgaG93IHRvIGVuYWJsZSBTTU1VIGJ5IGRldmljZXRyZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
TG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0K
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50
eHQgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IC0t
IAo+IDEuOS4xCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2FybSxrb21lZGEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQKPiBpbmRleCAwMmIyMjY1Li5iMTJjMDQ1IDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Fy
bSxrb21lZGEudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYXJtLGtvbWVkYS50eHQKPiBAQCAtMTEsNiArMTEsMTAgQEAgUmVxdWlyZWQgcHJvcGVy
dGllczoKPiAgICAgICAgLSAicGNsayI6IGZvciB0aGUgQVBCIGludGVyZmFjZSBjbG9jawo+ICAt
ICNhZGRyZXNzLWNlbGxzOiBNdXN0IGJlIDEKPiAgLSAjc2l6ZS1jZWxsczogTXVzdCBiZSAwCj4g
Ky0gaW9tbXVzOiBjb25maWd1cmUgdGhlIHN0cmVhbSBpZCB0byBJT01NVSwgTXVzdCBiZSBjb25m
aWd1cmVkIGlmIHdhbnQgdG8KPiArICAgIGVuYWJsZSBpb21tdSBpbiBkaXNwbGF5LiBmb3IgaG93
IHRvIGNvbmZpZ3VyZSB0aGlzIG5vZGUgcGxlYXNlIHJlZmVyZW5jZQo+ICsgICAgICAgIGRldmlj
ZXRyZWUvYmluZGluZ3MvaW9tbXUvYXJtLHNtbXUtdjMudHh0LAo+ICsgICAgICAgIGRldmljZXRy
ZWUvYmluZGluZ3MvaW9tbXUvaW9tbXUudHh0Cj4gIAo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzIGZv
ciBzdWItbm9kZTogcGlwZWxpbmVAbnEKPiAgRWFjaCBkZXZpY2UgY29udGFpbnMgb25lIG9yIHR3
byBwaXBlbGluZSBzdWItbm9kZXMgKGF0IGxlYXN0IG9uZSksIGVhY2gKPiBAQCAtNDQsNiArNDgs
OSBAQCBFeGFtcGxlOgo+ICAJCWludGVycnVwdHMgPSA8MCAxNjggND47Cj4gIAkJY2xvY2tzID0g
PCZkcHVfbWNsaz4sIDwmZHB1X2FjbGs+Owo+ICAJCWNsb2NrLW5hbWVzID0gIm1jbGsiLCAicGNs
ayI7Cj4gKwkJaW9tbXVzID0gPCZzbW11IDA+LCA8JnNtbXUgMT4sIDwmc21tdSAyPiwgPCZzbW11
IDM+LAo+ICsJCQk8JnNtbXUgND4sIDwmc21tdSA1PiwgPCZzbW11IDY+LCA8JnNtbXUgNz4sCj4g
KwkJCTwmc21tdSA4PiwgPCZzbW11IDk+Owo+ICAKPiAgCQlkcDBfcGlwZTA6IHBpcGVsaW5lQDAg
ewo+ICAJCQljbG9ja3MgPSA8JmZwZ2Fvc2MyPiwgPCZkcHVfYWNsaz47CgpMb29rcyBnb29kIHRv
IG1lCgpKYW1lcwotLSAKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
