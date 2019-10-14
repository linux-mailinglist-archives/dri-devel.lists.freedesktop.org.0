Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4FD5DF8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 10:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E3B6E14C;
	Mon, 14 Oct 2019 08:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622286E14B;
 Mon, 14 Oct 2019 08:56:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYoo6O4O+e19ow2DfvkEHkPsp8IPG0ndgjEFFwtkxufIev/LJdWLwdy3o/wJlQZAbNe6TbB8jgcncJUkBzy8snYNOxHvHSRLSENl2ZtMAtpc1Q6uVeWtfAkWsPVLpZ1Ej7BcSMS/iRMMpy4bMVoEspFzqNslLWX4E1IL0ZSVMgaBhn+blPcqtKDoKzyEdosda2QgCusT5RiKUH2Q3Y2Ug09kdEFTC4JqPjgDZkLPJGzDt1PkQKsQz3rg3SIVAsP3iJKie83mYvXX3JECJppvNa4dnBHxughrFpj6f3PcJkwKO+ynuR+IXegH9WjuNVLit89ck5uQGbwqcuLLhZyo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irB42hCin4ZzaJzcQCle7UmeL1wL4OyBcMstCKfgKro=;
 b=Q7PDmpK5eOr20utnESdyytC9UbbolghWhNnkdzid3697VtpVWn9FFE9jeFARH4kr72yarC4mDiz1xBbq6sfwHfM6f7mXzI4+21Jug+Mvo+YpX4qp2zffTl8LlDpC1IH5ek9hpm6aGq+U1qlb4zgC1e4DdvscoB7mADIl8hv+clx3jlHavcAB3EYvpKVHyx8kh/3bqVORBYTcIg7QqPnwHETahFJLp4ALxG/rL3s80inCBpWRo4GIDvhHIvnTwtvQQS1/OwJfQnWcw5ewwShnSxSqrVpYmRLOGGN3SxIbsCYt1Ra+wCZtMrw7e+0ZC/j1Mu1N1mcIvW14HGbLN+jNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4137.namprd12.prod.outlook.com (10.141.186.21) by
 DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 14 Oct 2019 08:56:27 +0000
Received: from DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::9c:ce1f:b89f:18dd]) by DM6PR12MB4137.namprd12.prod.outlook.com
 ([fe80::9c:ce1f:b89f:18dd%3]) with mapi id 15.20.2347.023; Mon, 14 Oct 2019
 08:56:27 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH] drm/drm_edid: correct VIC and HDMI_VIC under HDMI 2.0
Thread-Topic: [PATCH] drm/drm_edid: correct VIC and HDMI_VIC under HDMI 2.0
Thread-Index: AQHVcpigTjVQ3e4VoUG7esC7UCtOEadHTB2AgAErWAiAAICegIABXHRhgABFBYCAD1fDgA==
Date: Mon, 14 Oct 2019 08:56:27 +0000
Message-ID: <DM6PR12MB4137AF37BE0E2B767C53EA45FC900@DM6PR12MB4137.namprd12.prod.outlook.com>
References: <20190924052621.6851-1-Wayne.Lin@amd.com>
 <20191002115807.GT1208@intel.com>
 <DM6PR12MB41378F46947DCC2C46494AC8FC9F0@DM6PR12MB4137.namprd12.prod.outlook.com>
 <20191003132951.GE1208@intel.com>
 <DM6PR12MB413716E6DDB63FFF06C8F193FC9E0@DM6PR12MB4137.namprd12.prod.outlook.com>
 <20191004142403.GE1208@intel.com>
In-Reply-To: <20191004142403.GE1208@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.68.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fae6979-a7f1-4e35-7c22-08d7508465f3
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB320994E957CACC212333B4ECFC900@DM6PR12MB3209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(13464003)(199004)(189003)(2906002)(229853002)(52536014)(66574012)(11346002)(476003)(66066001)(186003)(5660300002)(53546011)(6916009)(26005)(478600001)(486006)(446003)(54906003)(316002)(6506007)(102836004)(76116006)(71190400001)(86362001)(76176011)(9686003)(66556008)(6116002)(256004)(3846002)(66476007)(71200400001)(6246003)(7696005)(66446008)(64756008)(99286004)(6436002)(91956017)(81166006)(8676002)(81156014)(55016002)(8936002)(14454004)(74316002)(4326008)(25786009)(305945005)(7736002)(66946007)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3209;
 H:DM6PR12MB4137.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4N//4VxeBCKPNxlckeI0eceSpOZjttuHNjzQ47NLUvZFZVi2QN/xkjXigNQiHPpbP79OHQP5v4mZ4hN8vIY2hgefkmEeF9rcfkOXrBo6lhmAzY6yjMhUgz7ahV4oxQ8gKk4969WuqGl4vZJaudyyT3BsNqRJqHSOz4EGRSoGmbO4JI43iRZDjN/vqcoEljOTR8mLAs1z7WWUaTW/ebORTwJ6my540MTAR+5Y1o38wba+7R8kgY1Sc1H/BpmPuvoZplCVHx+CIc14qCtv8cQioLCSld3eHPSReMQ8Q4w8nR6ObC6nAh6gX8oxtgkqE3t9c7dmDTNAzWrXOZI1ZlRZ1gAWOnEMVrn7rz/MY5GDtusSybEQqtZLohpXb0eZNRL4SDitq2ZLSFGCpPBzzUIgAWC1w9b7h3IP+/vPlRIzoPI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fae6979-a7f1-4e35-7c22-08d7508465f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:56:27.0814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmhi1EZMHmBb5oNggnWda2VNo5Vq6ehY3jvIFcaJvoZG1DSkHNOKmbkjPMfmjoaAdIZQp95qJaOIrYUHQe+hhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irB42hCin4ZzaJzcQCle7UmeL1wL4OyBcMstCKfgKro=;
 b=S8i3QGtrqwwUKlw925d5BdxTNO34IcFIoEAdJQo/C9HX+iUiFGDPP5kTifYFgZRpLSO9IyObD89XsTrM7u/qgV/rr2CVD7FZcDKZLIes4LRTGb11vhbD1RS3W+OYdrq0w0kCtpkzHWPfVllm6K1c3FPzVxc9lZk8A/p79bBNuRU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Wayne.Lin@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgNCwg
MjAxOSAxMDoyNCBQTQo+IFRvOiBMaW4sIFdheW5lIDxXYXluZS5MaW5AYW1kLmNvbT4KPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IExpLCBTdW4KPiBwZW5nIChMZW8pIDxTdW5wZW5nLkxpQGFtZC5jb20+OyBLYXpsYXVz
a2FzLCBOaWNob2xhcwo+IDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+Cj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL2RybV9lZGlkOiBjb3JyZWN0IFZJQyBhbmQgSERNSV9WSUMgdW5kZXIg
SERNSQo+IDIuMAo+IAo+IE9uIEZyaSwgT2N0IDA0LCAyMDE5IGF0IDEwOjQxOjIwQU0gKzAwMDAs
IExpbiwgV2F5bmUgd3JvdGU6Cj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgo+ID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMywgMjAxOSAyMToyOQo+ID4gVG86
IExpbiwgV2F5bmUgPFdheW5lLkxpbkBhbWQuY29tPgo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Owo+ID4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PjsgTGksIFN1bgo+ID4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBhbWQuY29tPjsgS2F6bGF1c2th
cywgTmljaG9sYXMKPiA+IDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+Cj4gPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBkcm0vZHJtX2VkaWQ6IGNvcnJlY3QgVklDIGFuZCBIRE1JX1ZJQyB1bmRl
ciBIRE1JCj4gPiAyLjAKPiA+Cj4gPiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAwNjo0OTowNUFN
ICswMDAwLCBMaW4sIFdheW5lIHdyb3RlOgo+ID4gPgo+ID4gPgo+ID4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMiwg
MjAxOSAxOTo1OAo+ID4gPiBUbzogTGluLCBXYXluZSA8V2F5bmUuTGluQGFtZC5jb20+Cj4gPiA+
IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IDxkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4g
PGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgTGksIFN1biBwZW5nIChMZW8pCj4gPiA+
IDxTdW5wZW5nLkxpQGFtZC5jb20+OyBLYXpsYXVza2FzLCBOaWNob2xhcwo+ID4gPiA8TmljaG9s
YXMuS2F6bGF1c2thc0BhbWQuY29tPgo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vZHJt
X2VkaWQ6IGNvcnJlY3QgVklDIGFuZCBIRE1JX1ZJQyB1bmRlcgo+ID4gPiBIRE1JIDIuMAo+ID4g
Pgo+ID4gPiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAwMToyNjoyMVBNICswODAwLCBXYXluZSBM
aW4gd3JvdGU6Cj4gPiA+ID4gSW4gSERNSSAxLjQgZGVmaW5lcyA0ayBtb2RlcyB3aXRob3V0IHNw
ZWNpZmljIGFzcGVjdCByYXRpby4KPiA+ID4gPiBIb3dldmVyLCBpbiBIRE1JIDIuMCwgYWRkcyBh
c3BlY3QgcmF0aW8gYXR0cmlidXRlIHRvIGRpc3Rpbmd1aXNoCj4gPiA+ID4gZGlmZmVyZW50IDRr
IG1vZGVzLgo+ID4gPiA+Cj4gPiA+ID4gQWNjb3JkaW5nIHRvIEFwcGVuZGl4IEUgb2YgSERNSSAy
LjAgc3BlYywgc291cmNlIHNob3VsZCB1c2UgVlNJRgo+ID4gPiA+IHRvIGluZGljYXRlIFZJQyBt
b2RlIG9ubHkgd2hlbiB0aGUgbW9kZSBpcyBvbmUgZGVmaW5lZCBpbiBIRE1JIDEuNGIgNEsKPiBt
b2Rlcy4KPiA+ID4gPiBPdGhlcndpc2UsIHVzZSBBVkkgaW5mb2ZyYW1lcyB0byBjb252ZXkgVklD
Lgo+ID4gPiA+Cj4gPiA+ID4gZWc6IFZJQ18xMDMgc2hvdWxkIHVzZSBBVkkgaW5mb2ZyYW1lcyBh
bmQgVklDXzkzIHVzZSBWU0lGCj4gPiA+ID4KPiA+ID4gPiBXaGVuIHRoZSBzaW5rIGlzIEhETUkg
Mi4wLCBjdXJyZW50IGNvZGUgaW4KPiA+ID4gPiBkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21f
ZGlzcGxheV9tb2RlIHdpbGwgYWxzbyBmb3JjZSBtb2RlCj4gPiA+ID4gVklDXzEwMyB0byBoYXZl
IFZJQyB2YWx1ZSAwLiBUaGlzIHZpb2xhdGVzIHRoZSBzcGVjIGFuZCBuZWVkcyB0byBiZQo+IGNv
cnJlY3RlZC4KPiA+ID4KPiA+ID4gPiBXaGVyZSBpcyB0aGF0IGJlaW5nIGRvbmU/IFdlIG9ubHkg
c2V0IHRoZSBBVkkgVklDIHRvIHplcm8gaWYgd2UncmUKPiA+ID4gPiBnb2luZyB0byB1c2UgdGhl
IEhETUkgVklDIGluc3RlYWQuCj4gPiA+Cj4gPiA+IEFwcHJlY2lhdGUgZm9yIHlvdXIgdGltZSBh
bmQgYXBvbG9naXplIGZvciBub3QgZXhwbGFpbmluZyBpdCBjbGVhcmx5Lgo+ID4gPiBDdXJyZW50
IGNvZGUgaW4gZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9mcm9tX2Rpc3BsYXlfbW9kZSgpIHdpbGwg
Y2FsbAo+ID4gPiBkcm1fbWF0Y2hfaGRtaV9tb2RlKCkgdG8gc2V0IHVwIHZlbmRvcl9pZl92aWMu
IEJ5IGNoZWNraW5nCj4gPiA+IGRybV92YWxpZF9oZG1pX3ZpYyh2ZW5kb3JfaWZfdmljKSB0byBz
ZWUgaWYgdGhlIHZpYyBpbmZvIHNob3VsZCBiZQo+ID4gPiBjb252ZXllZCBieSBhdmkgb3Igbm90
Lgo+ID4gPgo+ID4gPiBCdXQgaW4gZHJtX21hdGNoX2hkbWlfbW9kZSgpLCBjb2RlIGRvZXNuJ3Qg
ZW5hYmxlIG1hdGNoX2ZsYWdzIHdpdGgKPiA+ID4gRFJNX01PREVfTUFUQ0hfQVNQRUNUX1JBVElP
LiBJIHRoaW5rIGl0J3MgZHVlIHRvIEhETUkxLjRiIGRvZXNuJ3QKPiA+ID4gc3BlY2lmeSA0SyBt
b2RlIGNvbnZleWVkIGJ5IEhETUkgVklDIHdpdGggcGFydGljdWxhciBhc3BlY3QgcmF0aW8uCj4g
PiA+IEJ1dCBpbiBBcHBlbmRpeCBFIG9mIEhETUkgMi4wIHNwZWMsIGl0IHNwZWNpZnkgb25seSA0
ayBtb2RlcyB3aXRoCj4gcGFydGljdWxhciBhc3BlY3QgcmF0aW8gc2hvdWxkIHVzZSBWU0lGIHRv
IGNvbnZleS4KPiA+ID4gSGVuY2UsIHdoZW4gdGhlIHNpbmsgc3VwcG9ydCBIRE1JIDIuMCBhbmQg
c2V0IHRoZSBtb2RlIHRvIGJlCj4gPiA+IFZJQ18xMDMsIGNhbGxpbmcKPiA+ID4gZHJtX21hdGNo
X2hkbWlfbW9kZShtb2RlKSB3aWxsIHJldHVybiB2ZW5kb3JfaWZfdmljID0gMyAoVklDXzkzIGFu
ZAo+ID4gPiBWSUNfMTAzIGFyZSBoYXZpbmcgdGhlIHNhbWUgdGltaW5nIGJ1dCBkaWZmZXJlbnQg
YXNwZWN0IHJhdGlvKS4gVGhlcmVhZnRlcgo+IHdpbGwgc2V0IHRoZSAgZnJhbWUtPnZpZGVvX2Nv
ZGUgdG8gMC4KPiA+ID4gSG93ZXZlciwgVklDXzEwMyBzaG91bGQgdXNlIEFWSSBWSUMgYWNjb3Jk
aW5nIHRvIEhETUkgMi4wIHNwZWMgKG9ubHkKPiA+ID4gVklDOiA5MywgOTQsIDk1ICYKPiA+ID4g
OTggc2hvdWxkIHVzZSBWU0lGKS4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCB0cnkgdG8gcmV2aXNl
IHRoYXQsIHdoZW4gdGhlIHNpbmsgc3VwcG9ydCBIRE1JIDIuMCwKPiA+ID4gZHJtX21hdGNoX2hk
bWlfbW9kZSgpIHNob3VsZCBhbHNvIHRha2UgYXNwZWN0IHJhdGlvIGludG8gY29uc2lkZXJhdGlv
bi4KPiA+ID4gQnV0IGZvciBlYXN5IHJlYWRpbmcsIEkgYWRkIGFub3RoZXIgZnVuY3Rpb24KPiAi
ZHJtX21hdGNoX2hkbWlfMV80X21vZGUiIHRvIGRvIHNvLgo+ID4KPiA+ID4gU2VlbXMgcmF0aGVy
IGNvbnZvbHV0ZWQuIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgYWRkIHRoZSBhc3BlY3QKPiA+ID4g
cmF0aW9zIHRvIGVkaWRfNGtfbW9kZXNbXS4gT3IgaXMgdGhlcmUgc29tZSBwcm9ibGVtIHdpdGgg
dGhhdCBhcHByb2FjaD8KPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgdGltZS4KPiA+Cj4gPiBTaW5j
ZSBIRE1JIDEuNGIgZG9lc24ndCByZXF1aXJlIGVkaWRfNGtfbW9kZXNbXSB3aXRoIHNwZWNpZmlj
IGFzcGVjdAo+ID4gcmF0aW8sIG1vZGVzIGFzIHRoZSBzYW1lIHRpbWluZyBpbiBlZGlkXzRrX21v
ZGVzW10gYnV0IHdpdGggZGlmZmVyZW50Cj4gPiBhc3BlY3QgcmF0aW9zIGFyZSBhbHNvIGV4cGVj
dGVkIHRvIGNvbnZleSBWSUMgYnkgVlNJRiB0byBIRE1JIDEuNAo+ID4gc2luay4gTWlnaHQgY2Fu
J3QgZ3VhcmFudGVlIHRoYXQgdGhlcmUgd29udCd0IGJlIGFueSBjb21wYXRpYmlsaXR5IHNpZGUg
ZWZmZWN0Cj4gd2l0aCB0aGF0IGFwcHJvYWNoIHdoZW4gdGhlIHNpbmsgaXMgSERNSSAxLjRiIC4K
PiAKPiBJIHRoaW5rIGFkZGluZyB0aGVtIHNob3VsZCBiZSBmaW5lLiBCdXQgd2hpbGUgY2hlY2tp
bmcgdGhlIGV4aXN0aW5nIGNvZGUgSQo+IG5vdGljZWQgYSBmZXcgcHJvYmxlbXMsIHNvIEkgc2Vu
dCBvdXQgc29tZSBmaXhlcyAoY2M6ZCB5b3UpLgoKVGhhbmtzIGZvciB5b3VyIHRpbWUgYW5kIHNv
cnJ5IGZvciBsYXRlIHJlcGx5LgpJIHdpbGwgdHJ5IG91dCB0aG9zZSByZWNlaXZlZCBmaXhlcyBh
bmQgbGVhdmUgbWVzc2FnZXMgdGhlcmUuCgo+IAo+IC0tCj4gVmlsbGUgU3lyasOkbMOkCj4gSW50
ZWwKCi0tCldheW5lIExpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
