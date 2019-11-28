Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9ED10C549
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711D56E784;
	Thu, 28 Nov 2019 08:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788546E784
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 08:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN9gKKrvwkbRaFwLN0/GNNbLntztlh9kqr8D+4o4CdqVm8q4kzKZE26plPGyv030aqjcsx8AqywMvNJ5bHvfj5FEYKZnHG3+92+9ffCz++aQ+R+9sX2BcS83t77UKdW8cztSd6A5gYKpjzara3i/+emzhyec6679rkBpv09kbXOF9HjHiQP9m27+Soeh/4/RvY5rKmPEpBQXRXcCZuBbk7Fl6QaGIOsCahaFhY6RR3LlSG3bo4SzfmwK58G8+N5YOuYH+3veL8dZubx4SNuUbvWLpoamoqTJ27sz3dlJq5m3VzFSsGr4Cklhr3D6z8VwoZTiSMWQJt7cOm8KSlODiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwE2oQR5lwCM1/sx4R6m/lc32hGZsBr955dCdI1EkL4=;
 b=A/PxVVC1hQEU1jOEjOPpr8+D6VD+EvZM0Km2zM/DchVfM/x9v6Xgh7Ajin+oZFE9LgkYEEDuJrIMVvZBhkQrha/h2gurgNcTaJnv3BHGwssAtnqoLct4pw2Ou9HAKlPi6htS6RbtcSrb8Ug2UvJFxWxSTQJvNRNmH6c9fAWq85Xoq8s0cNAu5+bTl5Q4HNTboKMHchWh758uEKu8xcr0qaFlSB3Bs0pxkD2J36LgX+7YesVPWaV0RcSTWgE7vFuzUWute3yHeZ0AcDtcYmQOSpi4mTEVjzewZJYqtE0IKVz7rJj+xzpO48jmJ590xWwLXQCmJkriO5hPvVlpA/oLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com (20.179.24.74) by
 VI1PR04MB4880.eurprd04.prod.outlook.com (20.177.49.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 28 Nov 2019 08:39:41 +0000
Received: from VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::9056:3486:95b8:4eff]) by VI1PR04MB6237.eurprd04.prod.outlook.com
 ([fe80::9056:3486:95b8:4eff%4]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 08:39:41 +0000
From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [EXT] Re: [PATCH] drm: fix HDR static metadata type field
 numbering
Thread-Topic: [EXT] Re: [PATCH] drm: fix HDR static metadata type field
 numbering
Thread-Index: AQHVpTDonNbf5j/+IEiOiFgD+u80BaefIQ+AgAEjT4A=
Date: Thu, 28 Nov 2019 08:39:41 +0000
Message-ID: <20191128083940.GC10251@fsr-ub1664-121>
References: <1574865719-24490-1-git-send-email-laurentiu.palcu@nxp.com>
 <20191127151703.GJ1208@intel.com>
In-Reply-To: <20191127151703.GJ1208@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 09e49c6e-afec-4cde-c5dc-08d773de8356
x-ms-traffictypediagnostic: VI1PR04MB4880:|VI1PR04MB4880:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4880C624B96E7111E431FC47FF470@VI1PR04MB4880.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(189003)(199004)(6512007)(3846002)(9686003)(229853002)(6116002)(71200400001)(76116006)(71190400001)(6486002)(6436002)(478600001)(186003)(11346002)(446003)(76176011)(6506007)(86362001)(33656002)(26005)(102836004)(14444005)(2906002)(25786009)(256004)(44832011)(305945005)(6246003)(7736002)(91956017)(1076003)(66574012)(316002)(54906003)(64756008)(66446008)(6916009)(66066001)(66556008)(14454004)(66476007)(66946007)(4326008)(5660300002)(81156014)(8936002)(8676002)(81166006)(99286004)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4880;
 H:VI1PR04MB6237.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t3oR8ULZ1AWH6nz3sJhwd3ZKYnGMrRtyP5TfFk3drmwSFk9OzFr4+ghvncualL1cBj7hRq/b4/dv+d9LFFl2OQytGvaAbOrbmKbTDgMAy2Ao2JfJ/KRTBUxClzYubqfF2bcv+5t1N8VNaBlAgzqvivsrIUs37n7pKtIrfxO1AZolwnT9EWUqQjtSfQBAGyHN9KKZAnR8pmPeaTw+38crwUoX96AYv3KHPtFPxvyAXCvcTczBhJ63xCXQJp8QiVT9JFUwFbslG/D7VhuaZfGrK1blJxsVdZJMaEHlKlNy7voKyIR1zZHEuo6SDeLdG2qeTvTJ0Kcgea6fOOjvjZd7lXfCQ/MJMWhwr+2pA53Gg+3v8My/tbYPKqovuU++OR8QxUrR/pSrB1Bxoa66DqhxhcsJV3mxJLK7jRMPxLeKWIiPuEm1R9zZSEeEjXRXp6oS
Content-ID: <09903457459C43408EEE994B2177CD2A@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e49c6e-afec-4cde-c5dc-08d773de8356
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 08:39:41.8401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CS22ezZ32Q5KAusHAkiI5CbG2jO6vgP59J8gxaH8/lzDH7fiazvaXwNIffJoBmmDBjJx2nAPR3XH+JUn3KncUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4880
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwE2oQR5lwCM1/sx4R6m/lc32hGZsBr955dCdI1EkL4=;
 b=k0x+MnprbybL1tchdAwfF34RH/Ik+VuLB+GpHSapyq//VQw2PShL+gXmTtC2zbKVYvSCTBbB/TpRFsec4D2nlnTIn5ATB9r9kVvv4ZP5qePqW9BeMbY/gYIYllC9k8ijQjMqu37mbI6e9PTdr9m82KL6E/J9doeTiFRHW8Mm+Lg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.palcu@nxp.com; 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Uma Shankar <uma.shankar@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDU6MTc6MDNQTSArMDIwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IENhdXRpb246IEVYVCBFbWFpbAo+IAo+IE9uIFdlZCwgTm92IDI3LCAyMDE5IGF0
IDAyOjQyOjM1UE0gKzAwMDAsIExhdXJlbnRpdSBQYWxjdSB3cm90ZToKPiA+IEFjY29yZGluZyB0
byBDVEEtODYxIHNwZWNpZmljYXRpb24sIEhEUiBzdGF0aWMgbWV0YWRhdGEgZGF0YSBibG9jayBh
bGxvd3MgYQo+ID4gc2luayB0byBpbmRpY2F0ZSB3aGljaCBIRFIgbWV0YWRhdGEgdHlwZXMgaXQg
c3VwcG9ydHMgYnkgc2V0dGluZyB0aGUgU01fMCB0bwo+ID4gU01fNyBiaXRzLiBDdXJyZW50bHks
IG9ubHkgU3RhdGljIE1ldGFkYXRhIFR5cGUgMSBpcyBzdXBwb3J0ZWQgYW5kIHRoaXMgaXMKPiA+
IGluZGljYXRlZCBieSBzZXR0aW5nIHRoZSBTTV8wIGJpdCB0byAxLgo+ID4KPiA+IEhvd2V2ZXIs
IHRoZSBjb25uZWN0b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEubWV0YWRhdGFfdHlw
ZSBpcyBhbHdheXMKPiA+IDAsIGJlY2F1c2UgaGRyX21ldGFkYXRhX3R5cGUoKSBpbiBkcm1fZWRp
ZC5jIGNoZWNrcyB0aGUgd3JvbmcgYml0Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggY29ycmVjdHMgdGhl
IEhETUlfU1RBVElDX01FVEFEQVRBX1RZUEUxIGJpdCBwb3NpdGlvbi4KPiAKPiBXYXMgY29uZnVz
ZWQgZm9yIGEgd2hpbGUgd2h5IHRoaXMgaGFzIGV2ZW4gYmVlbiB3b3JrbmluZywgYnV0IEkgZ3Vl
c3MKPiB0aGF0J3MgZHVlIHRvIHVzZXJzcGFjZSBwb3B1bGF0aW5nIHRoZSBtZXRhZGF0YSBpbmZv
ZnJhbWUgYmxvYiBjb3JyZWN0bHkKPiBldmVuIGlmIHdlIG1pc3JlcG9ydGVkIHRoZSBtZXRhZGF0
YSB0eXBlcyBpbiB0aGUgcGFyc2VkIEVESUQgbWV0YWRhdGEKPiBibG9iLgo+IAo+IEhtbS4gQWN0
dWFsbHkgb24gZnVydGhlciBpbnNwZWN0aW9uIHRoaXMgYWxsIHNlZW1zIHRvIGJlIGRlYWQgY29k
ZS4gVGhlCj4gb25seSB0aGluZyB3ZSBzZWVtIHRvIHVzZSBmcm9tIHRoZSBwYXJzZWQgRURJRCBt
ZXRhZGF0YSBzdHVmZiBpcwo+IGVvdGYgYml0bWFzay4gV2UgY2hlY2sgdGhhdCBpbiBkcm1faGRt
aV9pbmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YSgpCj4gYnV0IHdlIGRvbid0IGNoZWNrIHRoZSBt
ZXRhZGF0YSB0eXBlLgo+IAo+IE1heWJlIHdlIHNob3VsZCBqdXN0IG51a2UgdGhpcyBFRElEIHBh
cnNpbmcgc3R1ZmYgZW50aXJlbHk/IFNlZW1zCj4gcHJldHR5IG11Y2ggcG9pbnRsZXNzLgoKSSd2
ZSBiZWVuIHRoaW5raW5nIGFib3V0IHRoYXQgYnV0IHdlIG1heSBuZWVkIHRoZSByZXN0IG9mIHRo
ZSBmaWVsZHMgYXMKd2VsbCwgZXZlbiB0aG91Z2ggdGhleSdyZSBub3QgY3VycmVudGx5IHVzZWQu
IEknbSByZWZlcnJpbmcgdG8gc2luaydzCm1pbi9tYXggbHVtaW5hbmNlIGRhdGEuIFNob3VsZG4n
dCB3ZSBhbHNvIGNoZWNrIG1pbi9tYXggY2xsLCBiZXNpZGVzCmVvdGYsIHRvIG1ha2Ugc3VyZSB0
aGUgc291cmNlIGRvZXMgbm90IHBhc3MgaGlnaGVyL2xvd2VyIGx1bWluYW5jZQp2YWx1ZXMsIHRo
YW4gdGhlIHNpbmsgc3VwcG9ydHMsIGZvciBvcHRpbWFsIGNvbnRlbnQgcmVuZGVyaW5nPwoKSG93
ZXZlciwgQ1RBLTg2MSBpcyBub3QgdmVyeSBjbGVhciBvbiBob3cgYSBzaW5rIHNob3VsZCBiZWhh
dmUgaWYKdGhlIENMTCB2YWx1ZXMgZXhjZWVkIHRoZSBhbGxvd2VkIHJhbmdlLi4uIDovIEFsc28s
IGlmIHRoZSBDTEwgcmFuZ2Ugb3IKdGhlIEZBTEwgdmFsdWVzIHBhc3NlZCBpbiB0aGUgRFJNIGlu
Zm9mcmFtZSBleGNlZWQgdGhlIHNpbmsncyBhZHZlcnRpc2VkCm1pbi9tYXggdmFsdWVzLCBJIGd1
ZXNzIHRoZSBzaW5rIGNhbm5vdCBnbyBsb3dlci9oaWdoZXIgdGhhbiBpdCBjYW4KYW55d2F5LiBJ
biB3aGljaCBjYXNlLCB3ZSBkb24ndCByZWFsbHkgbmVlZCB0aGUgcmVzdCBvZiB0aGUgSERSIHN0
YXRpYwptZXRhZGF0YSBibG9jayBhbmQgbnVraW5nIHRoYXQgcGFydCBzaG91bGQgYmUgb2suCgpU
aGFua3MsCmxhdXJlbnRpdQoKCj4gCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudGl1IFBh
bGN1IDxsYXVyZW50aXUucGFsY3VAbnhwLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgv
aGRtaS5oIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2hkbWkuaCBiL2luY2x1
ZGUvbGludXgvaGRtaS5oCj4gPiBpbmRleCA5OTE4YTZjLi4yMTZlMjVlIDEwMDY0NAo+ID4gLS0t
IGEvaW5jbHVkZS9saW51eC9oZG1pLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaGRtaS5oCj4g
PiBAQCAtMTU1LDcgKzE1NSw3IEBAIGVudW0gaGRtaV9jb250ZW50X3R5cGUgewo+ID4gIH07Cj4g
Pgo+ID4gIGVudW0gaGRtaV9tZXRhZGF0YV90eXBlIHsKPiA+IC0gICAgIEhETUlfU1RBVElDX01F
VEFEQVRBX1RZUEUxID0gMSwKPiA+ICsgICAgIEhETUlfU1RBVElDX01FVEFEQVRBX1RZUEUxID0g
MCwKPiA+ICB9Owo+ID4KPiA+ICBlbnVtIGhkbWlfZW90ZiB7Cj4gPiAtLQo+ID4gMi43LjQKPiAK
PiAtLQo+IFZpbGxlIFN5cmrDpGzDpAo+IEludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
