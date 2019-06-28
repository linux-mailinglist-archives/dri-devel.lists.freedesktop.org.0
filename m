Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0815961B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BB56E851;
	Fri, 28 Jun 2019 08:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::70a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4B26E872
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 02:47:44 +0000 (UTC)
Received: from MN2PR04MB5886.namprd04.prod.outlook.com (20.179.22.213) by
 MN2PR04MB6064.namprd04.prod.outlook.com (20.178.246.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Fri, 28 Jun 2019 02:47:16 +0000
Received: from MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635]) by MN2PR04MB5886.namprd04.prod.outlook.com
 ([fe80::397b:3922:4027:f635%3]) with mapi id 15.20.2032.016; Fri, 28 Jun 2019
 02:47:15 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1] Adjust analogix chip driver location
Thread-Topic: [PATCH v1] Adjust analogix chip driver location
Thread-Index: AQHVLNugE9/A6NeXyUKRWvLnNCDN26avZSmAgAD4qwA=
Date: Fri, 28 Jun 2019 02:47:15 +0000
Message-ID: <20190628024706.GA15852@xin-VirtualBox>
References: <20190627112939.GA4832@xin-VirtualBox>
 <20190627115705.GB5021@pendragon.ideasonboard.com>
In-Reply-To: <20190627115705.GB5021@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:203:36::13) To MN2PR04MB5886.namprd04.prod.outlook.com
 (2603:10b6:208:a3::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba850830-1590-4269-d1c7-08d6fb72ed9e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR04MB6064; 
x-ms-traffictypediagnostic: MN2PR04MB6064:
x-microsoft-antispam-prvs: <MN2PR04MB60643654A34E0DB02EE57AD0C7FC0@MN2PR04MB6064.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:206;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916004)(376002)(366004)(136003)(396003)(346002)(39850400004)(189003)(199004)(99286004)(54906003)(71190400001)(64756008)(33656002)(71200400001)(73956011)(66946007)(256004)(33716001)(6116002)(66446008)(3846002)(66476007)(66556008)(316002)(6436002)(446003)(6486002)(9686003)(6512007)(25786009)(11346002)(486006)(305945005)(7736002)(6916009)(229853002)(5660300002)(107886003)(102836004)(478600001)(6246003)(53936002)(66066001)(68736007)(81156014)(81166006)(386003)(6506007)(8676002)(26005)(4326008)(186003)(8936002)(86362001)(52116002)(476003)(14454004)(1076003)(76176011)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6064;
 H:MN2PR04MB5886.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NEKTT//hZ+3bcmuNUUwAJm05zc+IRf8L0V20DrFmQOJ6hpNjdSjTTa3SpGNHUDoRmyLQKKENTAlXrq1imQ1i+5yVOx92NxjIMM+cRxz6XsTWNruVdhyGRcaimQ+0yp8GrwTi9OHMGz0NPfXS8UAMuDEf8Dt4uZwPn0n4fgGq5XWWNv2/MdwCOt3L5mpYiVW1L8aKoBlurh7YHEilaC8FM0bW/CX8WZA3nFB2lxd4fqASvRQVknisoGDRc5WDWK6l9wP3DoqpE49ord3QLarC/U7ZRN2RGG7HX7y+pPSfc4npDEcRBL8WGQI0z3zORV6EfDjL9AGicQxmAz6oWnrHD91P0jC/on64cmk/HyhXyKeU65lGh7W6rxhDo1I+7rBpXcpIgNySvG0nPdLAXXz0dG7m6jNwh76CmNrT6TRMQp8=
Content-ID: <E2924B82224C67428ED1F9DBC2F39F66@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba850830-1590-4269-d1c7-08d6fb72ed9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 02:47:15.6962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xji@analogixsemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6064
X-Mailman-Approved-At: Fri, 28 Jun 2019 08:29:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector1-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0aQfs3hM5dq3yk3p+3nLXDuX67plqyfQS+VG7fiM2Q=;
 b=dnBKyUYqCG9ojAT9K5dX1kRTDu5u5d2ppWVCi8+Xo7JAmgitH6AidlXbaUsi1b/bEjZ+1R2DV2MZwSLOCVuGj4mBT2V7KS4kzlt8OyKQxrDmEfj57Vf7QFd/dYFf13B7BUDtudrnstBmMAbr4lEEuR3d6szlflWEvs010SyMkjo=
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
 David Airlie <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sjoerd.simons@collabora.co.uk" <sjoerd.simons@collabora.co.uk>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDc6NTc6MDVQTSArMDgwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIZWxsbyBYaW4gSmksCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4g
Cj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMTE6Mjk6NDdBTSArMDAwMCwgWGluIEppIHdyb3Rl
Ogo+ID4gTW92ZSBhbmFsb2dpeCBjaGlwIEFOWDc4WFggYnJpZGdlIGRyaXZlciBpbnRvICJhbmFs
b2dpeCIgZGlyZWN0b3J5Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW4gSmkgPHhqaUBhbmFs
b2dpeHNlbWkuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMCAtLS0tLS0tLS0tCj4gPiAgZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArLS0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcgICAgICAgICAgICAg
ICAgICB8IDEwICsrKysrKysrKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAyICsrCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS97ID0+IGFuYWxvZ2l4fS9hbmFsb2dpeC1hbng3OHh4LmMgfCAgMAo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UveyA9PiBhbmFsb2dpeH0vYW5hbG9naXgtYW54Nzh4eC5oIHwgIDAKPiA+
ICA2IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4g
IHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3sgPT4gYW5hbG9naXh9L2FuYWxvZ2l4LWFu
eDc4eHguYyAoMTAwJSkKPiA+ICByZW5hbWUgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS97ID0+IGFu
YWxvZ2l4fS9hbmFsb2dpeC1hbng3OHh4LmggKDEwMCUpCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tj
b25maWcKPiA+IGluZGV4IGVlNzc3NDYuLjg2Mjc4OWIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
S2NvbmZpZwo+ID4gQEAgLTE2LDE2ICsxNiw2IEBAIGNvbmZpZyBEUk1fUEFORUxfQlJJREdFCj4g
PiAgbWVudSAiRGlzcGxheSBJbnRlcmZhY2UgQnJpZGdlcyIKPiA+ICAJZGVwZW5kcyBvbiBEUk0g
JiYgRFJNX0JSSURHRQo+ID4gIAo+ID4gLWNvbmZpZyBEUk1fQU5BTE9HSVhfQU5YNzhYWAo+ID4g
LQl0cmlzdGF0ZSAiQW5hbG9naXggQU5YNzhYWCBicmlkZ2UiCj4gPiAtCXNlbGVjdCBEUk1fS01T
X0hFTFBFUgo+ID4gLQlzZWxlY3QgUkVHTUFQX0kyQwo+ID4gLQktLS1oZWxwLS0tCj4gPiAtCSAg
QU5YNzhYWCBpcyBhbiB1bHRyYS1sb3cgRnVsbC1IRCBTbGltUG9ydCB0cmFuc21pdHRlcgo+ID4g
LQkgIGRlc2lnbmVkIGZvciBwb3J0YWJsZSBkZXZpY2VzLiBUaGUgQU5YNzhYWCB0cmFuc2Zvcm1z
Cj4gPiAtCSAgdGhlIEhETUkgb3V0cHV0IG9mIGFuIGFwcGxpY2F0aW9uIHByb2Nlc3NvciB0byBN
eURQCj4gPiAtCSAgb3IgRGlzcGxheVBvcnQuCj4gPiAtCj4gPiAgY29uZmlnIERSTV9DRE5TX0RT
SQo+ID4gIAl0cmlzdGF0ZSAiQ2FkZW5jZSBEUEkvRFNJIGJyaWRnZSIKPiA+ICAJc2VsZWN0IERS
TV9LTVNfSEVMUEVSCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtl
ZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUKPiA+IGluZGV4IDQ5MzRmY2Yu
LjAyY2I0Y2QgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxl
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL01ha2VmaWxlCj4gPiBAQCAtMSw1ICsx
LDQgQEAKPiA+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiAtb2JqLSQo
Q09ORklHX0RSTV9BTkFMT0dJWF9BTlg3OFhYKSArPSBhbmFsb2dpeC1hbng3OHh4Lm8KPiA+ICBv
YmotJChDT05GSUdfRFJNX0NETlNfRFNJKSArPSBjZG5zLWRzaS5vCj4gPiAgb2JqLSQoQ09ORklH
X0RSTV9EVU1CX1ZHQV9EQUMpICs9IGR1bWItdmdhLWRhYy5vCj4gPiAgb2JqLSQoQ09ORklHX0RS
TV9MVkRTX0VOQ09ERVIpICs9IGx2ZHMtZW5jb2Rlci5vCj4gPiBAQCAtMTIsOCArMTEsOCBAQCBv
YmotJChDT05GSUdfRFJNX1NJSTkyMzQpICs9IHNpaTkyMzQubwo+ID4gIG9iai0kKENPTkZJR19E
Uk1fVEhJTkVfVEhDNjNMVkQxMDI0KSArPSB0aGM2M2x2ZDEwMjQubwo+ID4gIG9iai0kKENPTkZJ
R19EUk1fVE9TSElCQV9UQzM1ODc2NCkgKz0gdGMzNTg3NjQubwo+ID4gIG9iai0kKENPTkZJR19E
Uk1fVE9TSElCQV9UQzM1ODc2NykgKz0gdGMzNTg3Njcubwo+ID4gLW9iai0kKENPTkZJR19EUk1f
QU5BTE9HSVhfRFApICs9IGFuYWxvZ2l4Lwo+ID4gIG9iai0kKENPTkZJR19EUk1fSTJDX0FEVjc1
MTEpICs9IGFkdjc1MTEvCj4gPiAgb2JqLSQoQ09ORklHX0RSTV9USV9TTjY1RFNJODYpICs9IHRp
LXNuNjVkc2k4Ni5vCj4gPiAgb2JqLSQoQ09ORklHX0RSTV9USV9URlA0MTApICs9IHRpLXRmcDQx
MC5vCj4gPiAgb2JqLXkgKz0gc3lub3BzeXMvCj4gPiArb2JqLXkgKz0gYW5hbG9naXgvCj4gCj4g
Q291bGQgeW91IHBsYWNlIHRoYXQgbGluZSBqdXN0IGFib3ZlIHRoZSBzeW5vcHN5cy8gZGlyZWN0
b3J5LCB0byBoYXZlCj4gdGhlbSBhbHBoYWJldGljYWxseSBzb3J0ZWQgKHRoaXMgY291bGQgYWxz
byBiZSBkb25lIHdoaWxlIGFwcGx5aW5nKSA/Cj4gQXBhcnQgZnJvbSB0aGF0IHRoZSBwYXRjaCBs
b29rcyBnb29kIHRvIG1lLCBzbwpPSywgSSdsbCBzdWJtaXQgbmV3IHBhdGNoLCB0aGFua3MhCj4g
Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcK
PiA+IGluZGV4IGU5MzBmZjkuLmRmZTg0ZjUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgvS2NvbmZpZwo+ID4gQEAgLTEsNCArMSwxNCBAQAo+ID4gICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ID4gK2NvbmZpZyBEUk1fQU5BTE9HSVhfQU5Y
NzhYWAo+ID4gKwl0cmlzdGF0ZSAiQW5hbG9naXggQU5YNzhYWCBicmlkZ2UiCj4gPiArCXNlbGVj
dCBEUk1fS01TX0hFTFBFUgo+ID4gKwlzZWxlY3QgUkVHTUFQX0kyQwo+ID4gKwktLS1oZWxwLS0t
Cj4gPiArCSAgQU5YNzhYWCBpcyBhbiB1bHRyYS1sb3cgRnVsbC1IRCBTbGltUG9ydCB0cmFuc21p
dHRlcgo+ID4gKwkgIGRlc2lnbmVkIGZvciBwb3J0YWJsZSBkZXZpY2VzLiBUaGUgQU5YNzhYWCB0
cmFuc2Zvcm1zCj4gPiArCSAgdGhlIEhETUkgb3V0cHV0IG9mIGFuIGFwcGxpY2F0aW9uIHByb2Nl
c3NvciB0byBNeURQCj4gPiArCSAgb3IgRGlzcGxheVBvcnQuCj4gPiArCj4gPiAgY29uZmlnIERS
TV9BTkFMT0dJWF9EUAo+ID4gIAl0cmlzdGF0ZQo+ID4gIAlkZXBlbmRzIG9uIERSTQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvTWFrZWZpbGUgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L01ha2VmaWxlCj4gPiBpbmRleCBmZGJmM2ZkLi5k
NGM1NGFjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9N
YWtlZmlsZQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9NYWtlZmls
ZQo+ID4gQEAgLTEsMyArMSw1IEBACj4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5Cj4gPiArb2JqLSQoQ09ORklHX0RSTV9BTkFMT0dJWF9BTlg3OFhYKSArPSBhbmFs
b2dpeC1hbng3OHh4Lm8KPiA+ICsKPiA+ICBhbmFsb2dpeF9kcC1vYmpzIDo9IGFuYWxvZ2l4X2Rw
X2NvcmUubyBhbmFsb2dpeF9kcF9yZWcubwo+ID4gIG9iai0kKENPTkZJR19EUk1fQU5BTE9HSVhf
RFApICs9IGFuYWxvZ2l4X2RwLm8KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2FuYWxvZ2l4LWFueDc4eHguYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgv
YW5hbG9naXgtYW54Nzh4eC5jCj4gPiBzaW1pbGFyaXR5IGluZGV4IDEwMCUKPiA+IHJlbmFtZSBm
cm9tIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCj4gPiByZW5hbWUg
dG8gZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmMKPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaCBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54Nzh4eC5oCj4gPiBz
aW1pbGFyaXR5IGluZGV4IDEwMCUKPiA+IHJlbmFtZSBmcm9tIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgtYW54Nzh4eC5oCj4gPiByZW5hbWUgdG8gZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng3OHh4LmgKPiAKPiAtLSAKPiBSZWdhcmRzLAo+IAo+IExh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
