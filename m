Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB246D2129
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFEF89E26;
	Thu, 10 Oct 2019 06:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710117.outbound.protection.outlook.com [40.107.71.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B207D6EA7D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 03:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPJYZBc3wJ9gkNNMnEHpj1i+HPGEhVEIqukdC33Enrde0mUzhtJNny7VJyp2B5VPp+T/c6NU+sjGWe+MeGjmps8YNw6q5zQgYZDpgAQojg9K3azbB1J6VknsDDXS9SBIllomyFfUw52JcqDZE1C9LqXp27X5kVdjMCJzqUl89+X0WiNL1TSGZYi3roQnffDDV21vEQ75Fe/yLcuPIGwECDZtfeafO4qEkYNMvDPKhUmqvRCzXpUiyXpN7IrQpv2z3erFZlH6e5fFOE4fhVk7xrD7npPqhyLcYlb2MECqJCwDb7YcJht7mBbyT+TxjjY2CLFOQ1x394hB9QjvVqBywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itIcGg1VwFukEfeYFSdX4m+CFNJIWOltcoqvNKIS7gY=;
 b=ipNWzYzWFpbgErA9MDBFgRG/KGmL81enURxSx98JgErSPOv/AvPY7nzmEWGRgcoWEEJXqr3NkCb/G2KKISwUCQ0UnaEt3wBVjyeJSIDpIPFshB7kwJA/fRNINNj/gE8jRADZ/arG1ERaFx8yCcKbjKXamY6OyGnT11kAZvu0dRAiye63kzqV0Lflgo8Ev2XOzZcbL9rGacdUxvtUxMET6oGGkxaYxUGjDyax5jEE2STlpn1AVEUTX7ISVeCY5WqtG93wZlw+bHDtmherbG+3tkMV419taTOwYBviKnV/xY5lPN1bS0r8rw9oUhfpYUUTm/QfIWGNnumdqvf2heOdlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from SN6PR04MB4543.namprd04.prod.outlook.com (52.135.120.29) by
 SN6PR04MB4013.namprd04.prod.outlook.com (52.135.82.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 03:38:40 +0000
Received: from SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87]) by SN6PR04MB4543.namprd04.prod.outlook.com
 ([fe80::c55e:6c70:adbb:cf87%5]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 03:38:40 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVfoO4ZRVMsEYORESrPx4IOG5NEadSN+6AgAEDXgA=
Date: Thu, 10 Oct 2019 03:38:40 +0000
Message-ID: <20191010033822.GB10005@xin-VirtualBox>
References: <cover.1570588741.git.xji@analogixsemi.com>
 <82d9e3d505699da8f32069844b3cfe7c9fbfd0f1.1570588741.git.xji@analogixsemi.com>
 <20191009121003.GM22998@pendragon.ideasonboard.com>
In-Reply-To: <20191009121003.GM22998@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:203:36::24) To SN6PR04MB4543.namprd04.prod.outlook.com
 (2603:10b6:805:a8::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e19dadbc-6f2e-4284-d440-08d74d335643
x-ms-traffictypediagnostic: SN6PR04MB4013:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR04MB4013E36999DEBFC22C4E2FB6C7940@SN6PR04MB4013.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(136003)(396003)(39850400004)(376002)(346002)(366004)(199004)(189003)(81166006)(386003)(6116002)(3846002)(7736002)(186003)(64756008)(86362001)(316002)(66476007)(66946007)(7416002)(26005)(8936002)(66446008)(66556008)(4326008)(102836004)(6506007)(8676002)(6916009)(99286004)(81156014)(476003)(11346002)(446003)(486006)(305945005)(52116002)(76176011)(107886003)(229853002)(6306002)(6512007)(9686003)(54906003)(6246003)(256004)(71190400001)(14454004)(33716001)(33656002)(6486002)(2906002)(6436002)(478600001)(66066001)(5660300002)(25786009)(1076003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4013;
 H:SN6PR04MB4543.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wi8fnq0cTwS8Stbe9WsLD0hRNevJ74A3sG2XqPmMG6D8ChYmBhkJ3RKACoUzRBom/LO3ePHkDRJcuwThqeckhJBheSPtPyYT3RxsfqfjZ75bBdQ1+/T3atqaJIxMmHf00Ihi9b4AYBtD/72UvWbh+cN4wmTcQecnNjoMUZTlk5wmK1c9z0mnrDY75Kd4KltHJitO6TvYkEiPy+IL2lBDmfdT9el7XYaVl7aNC27Rdsz1UKXLeI6JVCKilXIuZSdJL+Gewb792NcFkHZ5KqDXMyWr6mfPXpMhd1oKpITFoP0xn4ud32UZ2A/asD1WggV7FmlpCU9SMQubvoidl1fsJ4Aih4meR4OVpDdBFnZwuYQ6KqyZjynn6dFIp3IvuTyTKaPYjo/GmMufU0ctGULM3dmrdveVdmoq4Pq1Ak/MXGGXY1wKqn67JrdP3qSyoDvmoN7onKQutmvSu5YXoK1U8g==
Content-ID: <277EF7BA861E9D4F924E8A7EF332BAE0@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e19dadbc-6f2e-4284-d440-08d74d335643
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 03:38:40.7186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z96CJP5CSINPu43Cb1Y4YphPuuAagBpvpKgGqIs78Df8oJe/3f54iKkk8lnUdSDLEJVBITgo+VvzvSKUuicrbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4013
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itIcGg1VwFukEfeYFSdX4m+CFNJIWOltcoqvNKIS7gY=;
 b=Mvpunx0rzXCJLNN26aioFWMq6WqeYtwfWhu7NI4dhtbYlYx3MHdBD+Vj6NsgSNjYi+CCcq2UjRkiGKPe8aF3D7MiNpf2gBTyv44LVNU8SnQA+EbL5eu1KgSiYnbGJYrGENdv6F+d96z1BPpHe/jn36X9C0hHaBEWWGAj4lzfUWs=
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
 Sheng Pan <span@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBQaW5jaGFydCwgdGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLgoKCk9uIFdlZCwg
T2N0IDA5LCAyMDE5IGF0IDAzOjEwOjAzUE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gSGkgWGluIEppLAo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFdlZCwg
T2N0IDA5LCAyMDE5IGF0IDA5OjI3OjA3QU0gKzAwMDAsIFhpbiBKaSB3cm90ZToKPiA+IFRoZSBB
Tlg3NjI1IGlzIGFuIHVsdHJhLWxvdyBwb3dlciA0SyBNb2JpbGUgSEQgVHJhbnNtaXR0ZXIgZGVz
aWduZWQKPiA+IGZvciBwb3J0YWJsZSBkZXZpY2UuIEl0IGNvbnZlcnRzIE1JUEkgdG8gRGlzcGxh
eVBvcnQgMS4zIDRLLgo+ID4gCj4gPiBZb3UgY2FuIGFkZCBzdXBwb3J0IHRvIHlvdXIgYm9hcmQg
d2l0aCBiaW5kaW5nLgo+ID4gCj4gPiBFeGFtcGxlOgo+ID4gCWFueF9icmlkZ2U6IGFueDc2MjVA
NTggewo+ID4gCQljb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDc2MjUiOwo+ID4gCQlyZWcgPSA8
MHg1OD47Cj4gPiAJCWVuYWJsZS1ncGlvcyA9IDwmZ3BpbzAgNDUgR1BJT19BQ1RJVkVfTE9XPjsK
PiA+IAkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW8wIDczIEdQSU9fQUNUSVZFX0xPVz47Cj4gPiAJCXN0
YXR1cyA9ICJva2F5IjsKPiA+IAkJcG9ydEAwIHsKPiA+IAkJCXJlZyA9IDwwPjsKPiA+IAkJCWFu
eDc2MjVfMV9pbjogZW5kcG9pbnQgewo+ID4gCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbWlwaV9k
c2lfYnJpZGdlXzE+Owo+ID4gCQkJfTsKPiA+IAkJfTsKPiA+IAl9Owo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCAgICAgICAgICAgfCA3OSArKysrKysr
KysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKykKPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1Lnlh
bWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwLi4wZWY2MjcxCj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1sCj4gPiBAQCAtMCwwICsxLDc5IEBACj4gPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+ID4g
KyMgQ29weXJpZ2h0IDIwMTkgQW5hbG9naXggU2VtaWNvbmR1Y3RvciwgSW5jLgo+ID4gKyVZQU1M
IDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rp
c3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCMiCj4gPiArJHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIyIKPiA+ICsKPiA+ICt0aXRsZTogQW5hbG9n
aXggQU5YNzYyNSBTbGltUG9ydCAoNEsgTW9iaWxlIEhEIFRyYW5zbWl0dGVyKQo+ID4gKwo+ID4g
K21haW50YWluZXJzOgo+ID4gKyAgLSBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgo+ID4g
Kwo+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4gPiArICBUaGUgQU5YNzYyNSBpcyBhbiB1bHRyYS1sb3cg
cG93ZXIgNEsgTW9iaWxlIEhEIFRyYW5zbWl0dGVyCj4gPiArICBkZXNpZ25lZCBmb3IgcG9ydGFi
bGUgZGV2aWNlcy4KPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+
ICsgICAgaXRlbXM6Cj4gPiArICAgICAgLSBjb25zdDogYW5hbG9naXgsYW54NzYyNQo+ID4gKwo+
ID4gKyAgcmVnOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgaHBkLWdwaW9zOgo+
ID4gKyAgICBkZXNjcmlwdGlvbjogdXNlZCBmb3IgSFBEIGludGVycnVwdAo+ID4gKyAgICBtYXhJ
dGVtczogMQo+IAo+IFlvdSBleHBsYWluZWQgaW4geW91ciByZXBseSB0byB2MSByZXZpZXcgdGhh
dCB0aGlzIGRlc2NyaWJlcyB0aGUKPiBpbnRlcnJ1cHQgZ2VuZXJhdGVkIGJ5IHRoZSBBTlg3NjI1
LiBJdCBzaG91bGQgYmUgcmVwbGFjZWQgYnkgYW4KPiBpbnRlcnJ1cHRzIHByb3BlcnR5LgpPSywg
SSdsbCBjaGFuZ2UgaXQgdG8gaW50ZXJydXB0cyBwcm9wZXJ0eS4KPiAKPiA+ICsKPiA+ICsgIGVu
YWJsZS1ncGlvczoKPiA+ICsgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHBvd2VyIG9uIGNoaXAg
Y29udHJvbAo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgcmVzZXQtZ3Bpb3M6Cj4g
PiArICAgIGRlc2NyaXB0aW9uOiB1c2VkIGZvciByZXNldCBjaGlwIGNvbnRyb2wKPiA+ICsgICAg
bWF4SXRlbXM6IDEKPiAKPiBDb3VsZCB5b3UgcGxlYXNlIG1lbnRpb24gdGhlIGV4YWN0IG5hbWUg
b2YgdGhlIGNvcnJlc3BvbmRpbmcgcGlucyBvbiB0aGUKPiBjaGlwIGZvciBlbmFibGUgYW5kIHJl
c2V0ID8KT0ssIEknbGwgbWVudGlvbiB0aGUgZXhhY3QgbmFtZSBvZiB0aGUgY29ycmVzcG9uZGlu
ZyBwaW5zIG9uIHRoZSBjaGlwLgo+IAo+ID4gKwo+ID4gKyAgcG9ydEAwOgo+ID4gKyAgICB0eXBl
OiBvYmplY3QKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgQSBwb3J0IG5vZGUgcG9p
bnRpbmcgdG8gTUlQSSBEU0kgaG9zdCBwb3J0IG5vZGUuCj4gPiArCj4gPiArICBwb3J0QDE6Cj4g
PiArICAgIHR5cGU6IG9iamVjdAo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBBIHBv
cnQgbm9kZSBwb2ludGluZyB0byBNSVBJIERQSSBob3N0IHBvcnQgbm9kZS4KPiA+ICsKPiA+ICsg
IHBvcnRAMjoKPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4g
KyAgICAgIEEgcG9ydCBub2RlIHBvaW50aW5nIHRvIGV4dGVybmFsIGNvbm5lY3RvciBwb3J0IG5v
ZGUuCj4gPiArCj4gPiArICBwb3J0QDM6Cj4gPiArICAgIHR5cGU6IG9iamVjdAo+ID4gKyAgICBk
ZXNjcmlwdGlvbjoKPiA+ICsgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBpbnRlcm5hbCBw
YW5lbCBwb3J0IG5vZGUuCj4gPiArCj4gPiArICBwb3J0QDQ6Cj4gPiArICAgIHR5cGU6IG9iamVj
dAo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0
byBub3JtYWwgZURQIHBvcnQgbm9kZS4KPiAKPiBJIGRvbid0IHRoaW5rIHRocmVlIG91dHB1dCBw
b3J0cyBpcyBjb3JyZWN0LiBQb3J0cyAzIGFuZCA0IGFyZSByZWFsbHkKPiB0aGUgc2FtZS4gSSdt
IGV2ZW4gdW5zdXJlIGFib3V0IHBvcnQgMiBhbmQgMywgc29tZW9uZSB3aXRoIGJldHRlcgo+IGtu
b3dsZWRnZSBvZiBVU0ItQyBhbmQgRGlzcGxheVBvcnQgd291bGQgYmUgaW4gYSBiZXR0ZXIgcG9z
aXRpb24gdG8KPiBjb21tZW50LgpJIHVzZWQgaXQgdG8gZGlzdGluZ3Vpc2ggZGlmZmVyZW50IG91
dHB1dCwgcG9ydEAyIHVzZWQgZm9yIFVTQiBUeXBlLUMKb3V0cHV0LCBJIG5lZWQgaXQgdG8gcmVn
aXN0ZXIgZXh0ZXJuYWwgY29ubmVjdG9yIHBvcnQgbm90aWZpZXIKaW50ZXJmYWNlLCBhbmQgSSB0
aGluayBpdCBpcyBPSyB0byBjb25iaW5lIHBvcnRAMyBhbmQgcG9ydEA0Lgo+IAo+ID4gKwo+IAo+
IFlvdSdyZSBtaXNzaW5nIHRoZSAjYWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMgcHJvcGVy
dGllcyByZXF1aXJlZAo+IGZvciB0aGUgcG9ydHMuIEFzIHRoZSBkZXZpY2UgaXMgYW4gSTJDIGRl
dmljZSB3ZSdyZSBsdWNreSB0aGF0IHRoZQo+IHBhcmVudCB3aWxsIHNwZWNpZnkgY29tcGF0aWJs
ZSBhZGRyZXNzIGFuZCBzaXplIGNlbGxzIG51bWJlcnMsIGJ1dCBJJ20KPiBub3Qgc3VyZSB3ZSBz
aG91bGQgcmVseSBvbiB0aGF0IGx1Y2suCk9LLCBJJ2xsIGFkZCBpdC4KPiAKPiBSb2IsIGhvdyBk
b2VzIHlhbWwgc2NoZW1hIGhhbmRsZSB0aGlzID8KPiAKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0g
Y29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gcG9ydEAwIHwgcG9ydEAxCj4gPiArCj4g
PiArZXhhbXBsZToKPiA+ICsgIC0gfAo+ID4gKyAgICBhbnhfYnJpZGdlOiBhbng3NjI1QDU4IHsK
PiAKPiBUaGUgbm9kZSBuYW1lIHNob3VsZCBkZXNjcmliZSB0aGUgZGV2aWNlJ3MgZnVuY3Rpb24u
IEhvdyBhYm91dAo+IGVuY29kZXJANTggPwpPSywgSSdsbCBjaGFuZ2UgaXQuCj4gCj4gPiArICAg
ICAgICBjb21wYXRpYmxlID0gImFuYWxvZ2l4LGFueDc2MjUiOwo+ID4gKyAgICAgICAgcmVnID0g
PDB4NTg+Owo+ID4gKyAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4gKyAgICAgICAgcG9ydEAw
IHsKPiA+ICsgICAgICAgICAgcmVnID0gPDA+Owo+ID4gKyAgICAgICAgICBhbng3NjI1XzFfaW46
IGVuZHBvaW50IHsKPiA+ICsgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfZHNp
X2JyaWRnZV8xPjsKPiA+ICsgICAgICAgICAgfTsKPiA+ICsgICAgICAgIH07Cj4gPiArICAgIH07
Cj4gCj4gLS0gCj4gUmVnYXJkcywKPiAKPiBMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
