Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13183116A05
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9656E375;
	Mon,  9 Dec 2019 09:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760103.outbound.protection.outlook.com [40.107.76.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E516E093
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 16:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2eaV/dIXNq2Jt78SxRzb5cQ1jIhEmirTZ57xzsOj3ZvflXBRU3PtY394aTUIJ+LCvhVEU2nOkAWfqU61dj+3HaqXXZ8SxqBNaUEIPF7VHPhStz7CCDh7ZMTYMpNe6Lby/qz4iHSynKWxXHnVO130kMowPUEgbKvEuxvDmPd4oq7e9s94Xv8zH47AeTZCkTlS69SfQtHTKWjXcpwBbAqWz+5h89VtfK44HMrSMhXRR7CvXVDJBIXpcSi/j5uVclp1v1CM52bIi/NuTXpUBkjVCsYMM7hnbSNNxgr1HsaQ7mO28MO0elu7Emtj3nd+J9VCkc5Jn029EH11VwsNdhBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDU1HHm83zVOITBPaC2iqmu/hy2Td4uNl0fWfJaBY28=;
 b=BBPT9f9ck6Gxd+rV2yHR7kVUVfW0HKVlbOCS3i/MTDQ45Vxx3fYCV3SLC/sO9sc0inftS47Ps1EbF8lCG7keMUtg9KoZNVHroTbGCNRO1s8mbdktZKmHRh58+ggzTjj3dQNBilZr8cqFhABFI8oeCm22JkN3PrurwUVaVM96fPE5TDO4KAPAC7oFrMAB6btJsJlQ3V/NXs0sbPHNwCynx4SBxl2ezt8pr4UI5beVZRqRO51n8M34F2mJe1tnzNQnWJitObMioLcAQzDl2BCZZ/RuLH6kR+NrCMUj0cbJjBZJlxfFjF3unJ5xOo2I6cgGkdwELVotT+t5xdgYyUM1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from CY4PR21MB0629.namprd21.prod.outlook.com (10.175.115.19) by
 CY4PR21MB0152.namprd21.prod.outlook.com (10.173.189.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.1; Sat, 7 Dec 2019 16:28:28 +0000
Received: from CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::ed94:4b6d:5371:285c]) by CY4PR21MB0629.namprd21.prod.outlook.com
 ([fe80::ed94:4b6d:5371:285c%4]) with mapi id 15.20.2516.003; Sat, 7 Dec 2019
 16:28:28 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "b.zolnierkie@samsung.com"
 <b.zolnierkie@samsung.com>, KY Srinivasan <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 "sashal@kernel.org" <sashal@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "info@metux.net" <info@metux.net>,
 "arnd@arndb.de" <arnd@arndb.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, Dexuan Cui <decui@microsoft.com>
Subject: RE: [PATCH v3] video: hyperv: hyperv_fb: Use physical memory for fb
 on HyperV Gen 1 VMs.
Thread-Topic: [PATCH v3] video: hyperv: hyperv_fb: Use physical memory for fb
 on HyperV Gen 1 VMs.
Thread-Index: AQHVrCj6DBOdT46Ti02yKFHky2sSFKeu2nXg
Date: Sat, 7 Dec 2019 16:28:28 +0000
Message-ID: <CY4PR21MB0629C3DA1201A3FB51A7F486D75E0@CY4PR21MB0629.namprd21.prod.outlook.com>
References: <20191206113220.1849-1-weh@microsoft.com>
In-Reply-To: <20191206113220.1849-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=mikelley@ntdev.microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-07T16:28:26.6621293Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=0161c020-b57f-47ae-89d9-4ca338008b7a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [24.22.167.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b53482a8-21e6-42fc-22fe-08d77b327e07
x-ms-traffictypediagnostic: CY4PR21MB0152:|CY4PR21MB0152:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR21MB015299340C8D27D5DCBC9D9DD75E0@CY4PR21MB0152.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0244637DEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(305945005)(6636002)(186003)(71200400001)(5660300002)(10090500001)(6506007)(66476007)(66556008)(9686003)(64756008)(110136005)(71190400001)(316002)(52536014)(86362001)(26005)(74316002)(10290500003)(8990500004)(2906002)(7416002)(8936002)(102836004)(229853002)(7696005)(33656002)(8676002)(1250700005)(66946007)(99286004)(4326008)(81156014)(55016002)(76176011)(478600001)(81166006)(66446008)(76116006)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR21MB0152;
 H:CY4PR21MB0629.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a5gHl9OrTfyDJ+7d5eD9EaVMrFBA/J4mZCYjR9oia5/XLUWR5YXA3kcMO46PZK4soqj70FGxwsDgqxTDz0T2DqqqIkRVlgdSv4bOmEqmojE8cfBgIJAQV24aNypLXbMBlN5+loy4TSK64EEdOh8WuUK7V3LZnjdnf8lUNDFZFQXLisQTNVZG+FazgXr8SVBtwqgIw1TqaRF5Mi7PiXrP3aDwUDGGJfv55bhqyhGWGZeaGRfelFhWviOGwGYJxR0WJfohK5RDuXOAWpLaokyjFB5LgGixOCBkwQQEoz3ZFdUbWlX6cbykAwq0DAl6oiZBkvbKLnrksyit9aTQ4lgiGX9hCGUnLJq2W4rBaKClIHt0ca7VVwjZzlDNmsw+cENjSoOqXNShA8yu8oa19tbncU+pM4HBuz1Tn6uFVFvcOLOl/0x93ksHH2uCCd7iolpR9016VytMLFswFPLYwZtOOkERMO/sfp2F9k5vP3luwManJZ2tDiYmur96XYTJ7xUs
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53482a8-21e6-42fc-22fe-08d77b327e07
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2019 16:28:28.5024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCs/WruEtQ+V+D/dnhQHW3EpsD5tjUOuu41ySIYNz10nMtx8cSFSayGB4u0v4lrgGRGAHAhedb0HcAK5CHqxoqEoPDF2IrVSY1i9xctRZqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0152
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDU1HHm83zVOITBPaC2iqmu/hy2Td4uNl0fWfJaBY28=;
 b=OxQPxA9brOxD7qpl3/ibBaDFP97rGQn7jKH5YFYlKZjX/0ak4ow3vfWxLt45TFfoPYpg92aRj2kgyGsLQHk7ViSS5W+dZx9RJSkApBP8ZGq9LDp3pkYZ8wnXXpspw6fukIonVmP6P6kHoMM6Fj7gmpgfwpVMhl+3e5EdswZMZd4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=mikelley@microsoft.com; 
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
Cc: kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogV2VpIEh1IDx3ZWhAbWljcm9zb2Z0LmNvbT4gU2VudDogRnJpZGF5LCBEZWNlbWJlciA2
LCAyMDE5IDM6MzIgQU0KPiAKPiBPbiBIeXBlci1WLCBHZW5lcmF0aW9uIDEgVk1zIGNhbiBkaXJl
Y3RseSB1c2UgVk0ncyBwaHlzaWNhbCBtZW1vcnkgZm9yCj4gdGhlaXIgZnJhbWVidWZmZXJzLiBU
aGlzIGNhbiBpbXByb3ZlIHRoZSBlZmZpY2llbmN5IG9mIGZyYW1lYnVmZmVyIGFuZAo+IG92ZXJh
bGwgcGVyZm9ybWVuY2UgZm9yIFZNLiBUaGUgcGh5c2ljYWwgbWVtb3J5IGFzc2lnbmVkIHRvIGZy
YW1lYnVmZmVyCj4gbXVzdCBiZSBjb250aWd1b3VzLiBXZSB1c2UgQ01BIGFsbG9jYXRvciB0byBn
ZXQgY29udGlndW91c2UgcGh5c2ljaWFsCj4gbWVtb3J5IHdoZW4gdGhlIGZyYW1lYnVmZmVyIHNp
emUgaXMgZ3JlYXRlciB0aGFuIDRNQi4gRm9yIHNpemUgdW5kZXIKPiA0TUIsIHdlIHVzZSBhbGxv
Y19wYWdlcyB0byBhY2hpZXZlIHRoaXMuCj4gCj4gVG8gZW5hYmxlIGZyYW1lYnVmZmVyIG1lbW9y
eSBhbGxvY2F0aW9uIGZyb20gQ01BLCBzdXBwbHkgYSBrZXJuZWwKPiBwYXJhbWV0ZXIgdG8gZ2l2
ZSBlbm91Z2ggc3BhY2UgdG8gQ01BIGFsbG9jYXRvciBhdCBib290IHRpbWUuIEZvcgo+IGV4YW1w
bGU6Cj4gICAgIGNtYT0xMzBtCj4gVGhpcyBnaXZlcyAxMzBNQiBtZW1vcnkgdG8gQ0FNIGFsbG9j
YXRvciB0aGF0IGNhbiBiZSBhbGxvY2F0ZWQgdG8KPiBmcmFtZWJ1ZmZlci4gSWYgdGhpcyBmYWls
cywgd2UgZmFsbCBiYWNrIHRvIHRoZSBvbGQgd2F5IG9mIHVzaW5nCj4gbW1pbyBmb3IgZnJhbWVi
dWZmZXIuCj4gCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBIdSA8d2VoQG1pY3Jvc29mdC5jb20+Cj4gLS0tCgpbc25p
cF0KCj4gKy8qCj4gKyAqIEFsbG9jYXRlIGVub3VnaCBjb250aWd1b3VzIHBoeXNpY2FsIG1lbW9y
eS4KPiArICogUmV0dXJuIHBoeXNpY2FsIGFkZHJlc3MgaWYgc3VjY2VlZGVkIG9yIC0xIGlmIGZh
aWxlZC4KPiArICovCj4gK3N0YXRpYyBwaHlzX2FkZHJfdCBodmZiX2dldF9waHltZW0oc3RydWN0
IGh2X2RldmljZSAqaGRldiwKPiArCQkJCSAgIHVuc2lnbmVkIGludCByZXF1ZXN0X3NpemUpCj4g
K3sKPiArCXN0cnVjdCBwYWdlICpwYWdlID0gTlVMTDsKPiArCWRtYV9hZGRyX3QgZG1hX2hhbmRs
ZTsKPiArCXZvaWQgKnZtZW07Cj4gKwl1bnNpZ25lZCBpbnQgcmVxdWVzdF9wYWdlczsKPiArCXBo
eXNfYWRkcl90IHBhZGRyID0gMDsKPiArCXVuc2lnbmVkIGludCBvcmRlciA9IGdldF9vcmRlcihy
ZXF1ZXN0X3NpemUpOwo+ICsKPiArCWlmIChyZXF1ZXN0X3NpemUgPT0gMCkKPiArCQlyZXR1cm4g
LTE7Cj4gKwo+ICsJaWYgKG9yZGVyIDwgTUFYX09SREVSKSB7Cj4gKwkJLyogQ2FsbCBhbGxvY19w
YWdlcyBpZiB0aGUgc2l6ZSBpcyBsZXNzIHRoYW4gMl5NQVhfT1JERVIgKi8KPiArCQlwYWdlID0g
YWxsb2NfcGFnZXMoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8sIG9yZGVyKTsKPiArCQlpZiAoIXBh
Z2UpCj4gKwkJCXJldHVybiAtMTsKPiArCj4gKwkJcGFkZHIgPSAocGFnZV90b19wZm4ocGFnZSkg
PDwgUEFHRV9TSElGVCk7Cj4gKwkJcmVxdWVzdF9wYWdlcyA9ICgxIDw8IG9yZGVyKTsKClRoZSBh
Ym92ZSBsaW5lIGlzIG5vIGxvbmdlciBuZWVkZWQuICByZXF1ZXN0X3BhZ2VzIHdhcyBwcmV2aW91
c2x5IGFuCmFyZ3VtZW50IHRvIGEgcHJfaW5mbygpIHN0YXRlbWVudCwgYnV0IHRoYXQgc3RhdGVt
ZW50IGhhcyBhcHByb3ByaWF0ZWx5CmJlZW4gcmVtb3ZlZC4KCj4gKwl9IGVsc2Ugewo+ICsJCS8q
IEFsbG9jYXRlIGZyb20gQ01BICovCj4gKwkJaGRldi0+ZGV2aWNlLmNvaGVyZW50X2RtYV9tYXNr
ID0gRE1BX0JJVF9NQVNLKDY0KTsKPiArCj4gKwkJcmVxdWVzdF9wYWdlcyA9IChyb3VuZF91cChy
ZXF1ZXN0X3NpemUsIFBBR0VfU0laRSkgPj4KPiArCQkJCSBQQUdFX1NISUZUKTsKPiArCj4gKwkJ
dm1lbSA9IGRtYV9hbGxvY19jb2hlcmVudCgmaGRldi0+ZGV2aWNlLAo+ICsJCQkJCSAgcmVxdWVz
dF9wYWdlcyAqIFBBR0VfU0laRSwKPiArCQkJCQkgICZkbWFfaGFuZGxlLAo+ICsJCQkJCSAgR0ZQ
X0tFUk5FTCB8IF9fR0ZQX05PV0FSTik7CgpXaXRoIHRoZSByZXF1ZXN0X3BhZ2VzIHZhbHVlIG5v
IGxvbmdlciBiZWluZyBuZWVkZWQsIHRoZXJlJ3Mgd2FzdGVkIG1vdGlvbgppbiBkb2luZyBhIFBB
R0VfU0hJRlQgc2hpZnQgdG8gY2FsY3VsYXRlIHJlcXVlc3RfcGFnZXMsIGFuZCB0aGVuIG11bHRp
cGx5aW5nIGJ5ClBBR0VfU0laRS4gIFRoZSBzZWNvbmQgYXJndW1lbnQgYWJvdmUgY291bGQganVz
dCBiZQpyb3VuZF91cChyZXF1ZXN0X3NpemUsIFBBR0VfU0laRSkuICAgVGhlbiBpdCB3b3VsZCBi
ZSBleGFjdGx5IHBhcmFsbGVsIHRvCnRoZSBzZWNvbmQgYXJndW1lbnQgdG8gZG1hX2ZyZWVfY29o
ZXJlbnQoKSBiZWxvdyBpbiBodmZiX3JlbGVhc2VfcGh5bWVtKCkuClRoZSByZXF1ZXN0X3BhZ2Vz
IHZhcmlhYmxlIGNhbiBiZSBlbGltaW5hdGVkIGVudGlyZWx5LgoKPiArCj4gKwkJaWYgKCF2bWVt
KQo+ICsJCQlyZXR1cm4gLTE7Cj4gKwo+ICsJCXBhZGRyID0gdmlydF90b19waHlzKHZtZW0pOwo+
ICsJfQo+ICsKPiArCXJldHVybiBwYWRkcjsKPiArfQo+ICsKPiArLyogUmVsZWFzZSBjb250aWd1
b3VzIHBoeXNpY2FsIG1lbW9yeSAqLwo+ICtzdGF0aWMgdm9pZCBodmZiX3JlbGVhc2VfcGh5bWVt
KHN0cnVjdCBodl9kZXZpY2UgKmhkZXYsCj4gKwkJCQlwaHlzX2FkZHJfdCBwYWRkciwgdW5zaWdu
ZWQgaW50IHNpemUpCj4gK3sKPiArCXVuc2lnbmVkIGludCBvcmRlciA9IGdldF9vcmRlcihzaXpl
KTsKPiArCj4gKwlpZiAob3JkZXIgPCBNQVhfT1JERVIpCj4gKwkJX19mcmVlX3BhZ2VzKHBmbl90
b19wYWdlKHBhZGRyID4+IFBBR0VfU0hJRlQpLCBvcmRlcik7Cj4gKwllbHNlCj4gKwkJZG1hX2Zy
ZWVfY29oZXJlbnQoJmhkZXYtPmRldmljZSwKPiArCQkJCSAgcm91bmRfdXAoc2l6ZSwgUEFHRV9T
SVpFKSwKPiArCQkJCSAgcGh5c190b192aXJ0KHBhZGRyKSwKPiArCQkJCSAgcGFkZHIpOwo+ICt9
Cj4gKwo+IAoKRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdvb2QuICBUaGUgbW9zdCByZWNlbnQgY2hh
bmdlcyB0byBodmZiX2dldG1lbSgpIHdvcmtlZApvdXQgdmVyeSBuaWNlbHkuCgpNaWNoYWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
