Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA42B14C5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 21:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF6C6EE0D;
	Thu, 12 Sep 2019 19:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750079.outbound.protection.outlook.com [40.107.75.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE466EE0D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 19:21:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAZnYCqJ9/AssKqBS5dQ6Z6/8ShFXQuZRMnNsx0qW3xKRHSMeFYcVA2fFZyI7RXvF2uvOXEnkfWf7ZCVKxHCGnSYo//yvXZVHKUD04kkbWMIF90u9suB4beBGXQ+Wjnv/DpIoRU3pOLXc5WoK9jPaWVgjroXQmlTAOWT9H74PZf/lNfE165FLaZ8zzp+Q+jgyG5owf78amw1k4xd27nAtFzCm83+s9iaIHRPj3SyY/ITCO3ZBTDXAfDQPGv8FHVkjgVxtFHZRw4RqIMvqAVDmqdxJ+jOwwynJI6tXk72R6X6SJ0ZO5/0RZmAv9QC5mByqEjHVQHVfEuklwqao/4QUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QTdOfc2+659uXNRmdjI9fNcrBgOuIdThFWosb49CxQ=;
 b=nKeapo9eee0/dJ6CLOBiHz7qe3kgWMSPPoiFask5t2pp9fYwe2XPPuHO0Wu9rsi+mQumM/LFhaiSdrZSL/yERxHvBsxj50ovoMUNVEF/370I/sxGzXi8x7YSXLzMbsKWXsC9cx4sy5toG0zRPE1dGJq689+Vzdbg8QOoGN0mAueJay4tcEbTxgWpiXR2IlrJy8aXfWo1db2vfMolIskjsBaI9MbmgTrxeWvESKd/RBJxf1+RJTOihiRuft98Uo/ybJLxpLq/GwhWc2XmnHFrVPkpjm7gZ5SFJm2vr61K6O6dKQ+w8fXsRn/ByQlDACVx/z6TNFCKDVHsqGP/Ft9R8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2534.namprd12.prod.outlook.com (10.172.121.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Thu, 12 Sep 2019 19:21:29 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2263.016; Thu, 12 Sep
 2019 19:21:29 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Ramalingam C
 <ramalingam.c@intel.com>, "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Subject: Re: HDCP Content Type Interface
Thread-Topic: HDCP Content Type Interface
Thread-Index: AQHVZybpH5lguPO4sE2kRRNZBAZu6qcnrnOAgABua4CAAAmpgIAASbUA
Date: Thu, 12 Sep 2019 19:21:28 +0000
Message-ID: <0816be99-e85b-3b93-96d2-c4f007f24c6a@amd.com>
References: <10cb9f86-9d46-6654-ad9d-dcb77d6ef624@amd.com>
 <20190912074751.GB14191@intel.com>
 <57b94728-9dd5-a794-8a76-1a40dd857381@amd.com> <87ftl1zhni.fsf@intel.com>
In-Reply-To: <87ftl1zhni.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7689f2d7-5bf2-4dc3-7bf0-08d737b66951
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2534; 
x-ms-traffictypediagnostic: CY4PR1201MB2534:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB2534ED918921E8176FDF69558CB00@CY4PR1201MB2534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(53754006)(52054003)(199004)(189003)(476003)(66446008)(486006)(66066001)(2616005)(64756008)(66556008)(65956001)(65806001)(66476007)(11346002)(66946007)(6436002)(2906002)(186003)(53936002)(446003)(26005)(6246003)(6636002)(229853002)(6306002)(25786009)(6512007)(4326008)(386003)(6506007)(102836004)(5660300002)(53546011)(966005)(14454004)(8936002)(58126008)(71190400001)(71200400001)(316002)(8676002)(81156014)(81166006)(6486002)(14444005)(256004)(478600001)(36756003)(305945005)(3480700005)(52116002)(3846002)(76176011)(7736002)(6116002)(31696002)(31686004)(99286004)(54906003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2534;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vqwx16fsVowrDTxwt2b1oV0i1UxrZcJjGYisial3en60G75aoRw3nNdJbkFd5vg867pGJjxk0gWsV2Ura2m9WQkZCrGugNeVPuXh9YadjIS5ICdRcUsRhPXGoSW8PCFZaUpIixkF8228yclcZ6bzfvh4Lb9SyF5L9QxQXJMiBI81nltFe0ikMNr2E3GQuhcKtO2igK8W6vEMS1VTKP1bE7KN2lqRG65AbL1OgPCEL6MDXN1TRrZZuLK8Zj6HX40Od8UC5EcCROkRFYq187ZSqI2ScDlijncrvIyNcHrfoK5YysrsK3kO225rG4p24uzlXlq5U3CQ8z2qR3yB+W2Zi3rpidiVGTq7dnBO1cIaZLElQBraxn1v/Taa88LntBVtJoLkwn4QHtCQcTRwiHY6jwb+Aaa1bGldWIAGjR/Ovj0=
Content-ID: <716F1D486FDAE0438B9758479193112E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7689f2d7-5bf2-4dc3-7bf0-08d737b66951
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 19:21:28.8926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvn8neSKzS9nccCtkn3v4NRR0NJhuVX9ByRnu5dOUAAteOACO9o+hEQvIdhbNMcarb6KhGMXgDhV4lhH5vggeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QTdOfc2+659uXNRmdjI9fNcrBgOuIdThFWosb49CxQ=;
 b=e+rFAVMH1k7FknLj1NvCai6QC22fsqgGHEqCIk9DVe0iUNqbM4AkFepgYTgSKI/gwOPBPBPW++y7CfQfplxneDTJufu7VCRC744OxkzFi/73m9wuzonC/cYJdBWsomdpfO0eLBRzBoTXYl9sfuTBMBSCURD6QcZy2u2dunIUfoM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDktMTIgMTA6NTcgYS5tLiwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+IE9uIFRo
dSwgMTIgU2VwIDIwMTksIEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPiB3cm90ZToN
Cj4+IE9uIDIwMTktMDktMTIgMzo0NyBhLm0uLCBSYW1hbGluZ2FtIEMgd3JvdGU6DQo+Pj4gT24g
MjAxOS0wOS0wOSBhdCAxNTo1NDo1MCArMDAwMCwgTGFraGEsIEJoYXdhbnByZWV0IHdyb3RlOg0K
Pj4+PiBIaSBhbGwsDQo+Pj4+DQo+Pj4+IFRoaXMgaXMgcmVnYXJkaW5nIHRoZSByZWNlbnQgaGRj
cCBjb250ZW50IHR5cGUgcGF0Y2ggdGhhdCB3YXMgbWVyZ2VkIGludG8gZHJtLW1pc2MuIChodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzIwOTU4Lz9zZXJpZXM9NTcyMzMm
cmV2PTExKQ0KPj4+Pg0KPj4+PiBUaGVyZSBhcmUgZGlzcGxheXMgb24gdGhlIG1hcmtldCB0aGF0
IGFkdmVydGlzZSBIRENQIDIuMiBzdXBwb3J0IGFuZCB3aWxsIHBhc3MgYXV0aGVudGljYXRpb24g
YW5kIGVuY3J5cHRpb24gYnV0IHdpbGwgdGhlbiBzaG93IGEgY29ycnVwdGVkL2JsdWUvYmxhY2sg
c2NyZWVuICh0aGUgZHJpdmVyIGNhbm5vdCBkZXRlY3QgdGhpcykuIFRoZXNlIGRpc3BsYXlzIHdv
cmsgd2l0aCBIRENQIDEuNCB3aXRob3V0IGFueSBpc3N1ZXMuIER1ZSB0byB0aGUgbGFyZ2UgbnVt
YmVyIG9mIEhEQ1Atc3VwcG9ydGluZyBkZXZpY2VzIG9uIHRoZSBtYXJrZXQgd2UgbWlnaHQgbm90
IGJlIGFibGUgdG8gY2F0Y2ggdGhlbSB3aXRoIGEgYmxhY2tsaXN0Lg0KPj4+Pg0KPj4+PiBGcm9t
IHRoZSB1c2VyIG1vZGVzIHBlcnNwZWN0aXZlLCBIRENQMS40IGFuZCBIRENQMi4yIFR5cGUwIGFy
ZSB0aGUgc2FtZSB0aGluZy4gTWVhbmluZyB0aGF0IHRoaXMgaW50ZXJmYWNlIGRvZXNuJ3QgYWxs
b3cgdXMgdG8gZm9yY2UgdGhlIGhkY3AgdmVyc2lvbi4gRHVlIHRvIHRoZSBwcm9ibGVtcyBtZW50
aW9uZWQgYWJvdmUgd2UgbWlnaHQgd2FudCB0byBleHBvc2UgdGhlIGFiaWxpdHkgZm9yIGEgdXNl
ciB0byBmb3JjZSBhbiBIRENQIGRvd25ncmFkZSB0byBhIGNlcnRhaW4gbGV2ZWwgKGUuZy4gMS40
KSBpbiBjYXNlIHRoZXkgZXhwZXJpZW5jZSBwcm9ibGVtcy4NCj4+Pj4NCj4+Pj4gV2hhdCBhcmUg
eW91ciB0aG91Z2h0cz8gYW5kIHdoYXQgd291bGQgYmUgYSBnb29kIHdheSB0byBkZWFsIHdpdGgg
aXQ/DQo+Pj4gSGksDQo+Pj4NCj4+PiBBcyB5b3UgbWVudGlvbmVkLCB1QVBJIGlzIGRlc2lnbmVk
IHRvIGJlIEhEQ1AgdmVyc2lvbiBhZ25vc3RpYy4gS2VybmVsDQo+Pj4gc3VwcG9zZWQgdG8gZXhl
cmNpc2UgdGhlIGhpZ2hlc3QgdmVyc2lvbiBvZiBIRENQIHN1cHBvcnRlZCBvbiBwYW5lbCBhbmQN
Cj4+PiBwbGF0Zm9ybS4NCj4+Pg0KPj4+IEFzIHdlIGltcGxlbWVudCB0aGUgSERDUCBzcGVjIHN1
cHBvcnQsIGlmIGEgZGV2aWNlIGlzIG5vbi1jb21wbGlhbnQgd2l0aA0KPj4+IEhEQ1Agc3BlYyBh
ZnRlciBjb21wbGV0aW5nIHRoZSBIRENQIGF1dGhlbnRpY2F0aW9uLCBJIGRvbnQgdGhpbmsgd2Ug
bmVlZA0KPj4+IHRvIHdvcnJ5IGFib3V0IGl0Lg0KPj4+DQo+Pg0KPj4gVGVsbCB0aGF0IHRvIG91
ciAob3IgeW91cikgY3VzdG9tZXJzLg0KPiANCj4gQWdyZWVkLCBsZXQncyByYXRoZXIgbm90Lg0K
PiANCj4+IEluIHRoaXMgY2FzZSBhbiBlbmR1c2VyIG1pZ2h0IHBsdWcgaW4gYSBiYWQgbW9uaXRv
ciBvciBUViBhbmQgYmUgdW5hYmxlDQo+PiB0byBwbGF5IHByb3RlY3RlZCBjb250ZW50Lg0KPj4N
Cj4+IFdoYXQgaWYgd2UgYWRkIGEgbmV3IGVudW0gdmFsdWUgdG8gdGhlIGNvbnRlbnRfdHlwZSBw
cm9wZXJ0eSB0aGF0IHNheXMNCj4+ICJEUk1fTU9ERV9IRENQX0NPTlRFTlRfVFlQRV9GT1JDRV8x
NCI/DQo+IA0KPiBJbiBnZW5lcmFsLCBJIHRoaW5rIGlmIHRoZSBmaXggaXMgdG8gdGVhY2ggdGhl
IHVzZXIgdG8ganVtcCB0aHJvdWdoDQo+IGhvb3BzIGluIGNhc2UgdGhlIG91dHB1dCBpcyBub3Qg
d29ya2luZywgaXQgaXMgcmVhbGx5IG5vdCBhIGZpeC4NCj4gDQo+IFdvdWxkLCBzYXksIGEgc2V0
IHRvcCBib3ggb3IgYSBCbHUtcmF5IHBsYXllciBoYXZlIGEgc2V0dGluZyB0byBmb3JjZQ0KPiBI
RENQIDEuNCwgYW5kIGEgdHJvdWJsZXNob290aW5nIGl0ZW0gaW4gdGhlIG1hbnVhbCB0byBzZWxl
Y3QgdGhhdCBpZiB0aGUNCj4gZGlzcGxheSBkb2VzIG5vdCB3b3JrPyBPciB3b3VsZCBPUyBYIGhh
dmUgdGhhdD8NCj4gDQoNCk5vdCBzdXJlLiBBRkFJVSBvbiBvdGhlciBPUyB3ZSdyZSBjdXJyZW50
bHkgZGVhbGluZyB3aXRoIHRoaXMgdGhyb3VnaA0KbW9uaXRvciBxdWlya3MuIFdlIGNhbiBwcm9i
YWJseSBwdWxsIHRoZSBzYW1lIHF1aXJrcyB0byBEUk0uDQoNCj4gSWYgYnJva2VuIEhEQ1AgMi4y
IHNpbmsgc3VwcG9ydCBpcyBhIHdpZGVzcHJlYWQgcHJvYmxlbSAoaXMgaXQ/KSwgd2hhdA0KPiBk
byBvdGhlciBIRENQIHNvdXJjZXMgZG8/IElmIGl0J3MgYSBMaW51eCBpc3N1ZSwgd2hhdCBhcmUg
d2UgZG9pbmcgd3JvbmcNCj4gb3IgZGlmZmVyZW50Pw0KDQpOb3QgYSBMaW51eCBpc3N1ZSBhbmQg
bm90IG92ZXJseSB3aWRlc3ByZWFkLiBMb29rcyBsaWtlIGEgaGFuZGZ1bCBvZg0KcmVjZWl2ZXJz
IGFyZSBwcm9ibGVtYXRpYy4NCg0KSGFycnkNCg0KPiANCj4gDQo+IEJSLA0KPiBKYW5pLg0KPiAN
Cj4gDQo+IA0KPj4NCj4+IEhhcnJ5DQo+Pg0KPj4+IEluIGNhc2UgaWYgeW91IHdhbnQgdG8gdHJh
Y2sgYW5kIGltcGxlbWVudCBhIHF1aXJrIGZvciBpdCwgbGlrZSBub3QgdG8NCj4+PiBwcm9qZWN0
IHRoZSBIRENQMi4yIGNhcGFiaWxpdHksIHlvdSBjYW4gdXNlIHRoZSByZWNlaXZlciBpZCBvZiB0
aGF0IHBhbmVsDQo+Pj4gdG8gdHJhY2sgaXQuDQo+Pj4NCj4+PiBUaGFua3MsDQo+Pj4gLVJhbQ0K
Pj4+Pg0KPj4+Pg0KPj4+PiBUaGFua3MsDQo+Pj4+DQo+Pj4+IEJoYXdhbg0KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QNCj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
