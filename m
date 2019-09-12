Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28743B14C2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 21:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E936EE0C;
	Thu, 12 Sep 2019 19:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780089.outbound.protection.outlook.com [40.107.78.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FE16EE0C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 19:19:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyfdkYklBzFwetZ4C+3dRjfa1ezdl5NsdowyheiqDJIg1RD2fulBIT3s35Xy19bB2+nLKwa941UGz+NZrXtnly82pTNAD0yCg2b0oCn5cFcn17Iho0znYoMr0ZnSjqpHgpT92PLbY6IpIYB9F7kIgOWC0Sdbjn8s+cxPOhvj0p5GbCO+jmS9ByOcNCFEnALFH9sU2e2cttrtnrtJK8cTv3Jrqfzyujy/0PCGwtFWSm0yhnaP7Uv0J7gPUIs0sMNa3fINvmKT0ZatIW0ro+gyANK40ZWXT4/oSZFKBGzv0G28YQ4yPoBkTAenDDbVAo18YFyL9uLffEYv9CxB2Z6pZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZV3l1rNM0znmOewmAutfaJx55nTKurJr3uI4hGTIoE=;
 b=jlaBAOnmKY3HB7XNPkii1uVUXFxpMoP3waJZyUu0bKbJsoiGhiK5p2b045dHvkDNyuCEZGYw4t5jcaRAn8uAsbYMQzAyW9Tnq1ND+k/iNiVir4no7Pnf2brE1eCA9ggRL7BXNSDRiFh7VMobEWAJyNF65E4jzIfTTRpK6SSVM3dD46kCLGyENcVgQtq7BRwYvcFrn5PxbjzjmoK6DPCYuHog3Y+yJ9k8Wvz9TXHNL0zk6i377t4sEmXZa2WN7dV3WblTAVE2jtxy2Maf4CjsQuYfd/OmhOP7N1z/H3PCing0nGP+fCzQ0lJkT9HCz5SBxF3aTk0KaaBeHuLsFc7cAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0199.namprd12.prod.outlook.com (10.172.78.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.19; Thu, 12 Sep 2019 19:19:44 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2263.016; Thu, 12 Sep
 2019 19:19:44 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: HDCP Content Type Interface
Thread-Topic: HDCP Content Type Interface
Thread-Index: AQHVZybpH5lguPO4sE2kRRNZBAZu6qcnrnOAgABua4CAAAduAIAAS3IA
Date: Thu, 12 Sep 2019 19:19:43 +0000
Message-ID: <c69b11b5-5f37-608a-cfce-8cb093659c57@amd.com>
References: <10cb9f86-9d46-6654-ad9d-dcb77d6ef624@amd.com>
 <20190912074751.GB14191@intel.com>
 <57b94728-9dd5-a794-8a76-1a40dd857381@amd.com>
 <20190912144936.GA20976@intel.com>
In-Reply-To: <20190912144936.GA20976@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YT1PR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::34)
 To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 609fa264-7db3-4f88-475f-08d737b62abc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0199; 
x-ms-traffictypediagnostic: CY4PR1201MB0199:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0199D0C49942CC53807223768CB00@CY4PR1201MB0199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(53754006)(199004)(189003)(52054003)(7736002)(102836004)(186003)(53936002)(5660300002)(25786009)(6306002)(6916009)(6512007)(316002)(256004)(14444005)(486006)(99286004)(36756003)(476003)(2616005)(58126008)(26005)(76176011)(6436002)(52116002)(14454004)(4326008)(31686004)(53546011)(81156014)(81166006)(54906003)(3846002)(2906002)(446003)(31696002)(6506007)(6116002)(386003)(6486002)(6246003)(66446008)(64756008)(66556008)(66476007)(66946007)(3480700005)(229853002)(478600001)(305945005)(8676002)(11346002)(71190400001)(71200400001)(65956001)(65806001)(66066001)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0199;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jGfyKSx0AoShjMtuTo31psjuMnrjtrsNmZMD+zlkEEFyx1bOGRSuM3fV1Kr5Yh8eL4Fjqg3VTK5SVKLOUaxAhx75WIPxtWF4SOItNs4HcLpCB4L5jqc+7fju4pCl/pGRpYqHhrWqmffz/gPDIGSzGZUzIXGuDUy0DMpgESFDjSiBO4BLa7ArYskyfDzyePE10zvdwGQSgLM/RCAqE/1uAmBmgDgeBkoAm4VWPr1LN4xOQFJdoa9ITe5Csm6DKX9eVZ9/i42AbuKt83Dcur39RnMSXtkpk6arj/l91q3pTbPv0X9RsoPsqk45CRaqU4O1NLmolxbjvZdxfHNxc7ZyHllcKR8It1oj2H2rvvY1GbuPZdp/5gJ7OabPBNtbkx6eeznBKBo9zwoJzuV8fWYGDyqB8IjNRG7gW7mtQ7CRrKY=
Content-ID: <2028F5B5CC6E84438AA7664400FE0738@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609fa264-7db3-4f88-475f-08d737b62abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 19:19:44.1430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dEoWh0lqjNJStfGsR+xj48wqaztdHkS2gBn9YVFBwnWobxwcrI0Ik9NbplfavENkq9Vjai/N+wYVe6RzvWVMiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZV3l1rNM0znmOewmAutfaJx55nTKurJr3uI4hGTIoE=;
 b=CT8wWxyiNZtd/IzPrSXj07gDJF5FWOENnVhuNyRbn3p+sBvCXboeVJ1p3Pgg4klOp1o2J+iUffdD36yrV3sgmb9sV3nXq2+H9XZhkfEy0ERbDT4RpxJ1m75hQBGMrO9NtGPxyTMOwnMmk+XsxCNSGkwESgC48VOzY4wXtScYZ2E=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0xMiAxMDo0OSBhLm0uLCBSYW1hbGluZ2FtIEMgd3JvdGU6DQo+IE9uIDIwMTkt
MDktMTIgYXQgMTQ6MjM6MDUgKzAwMDAsIEhhcnJ5IFdlbnRsYW5kIHdyb3RlOg0KPj4gT24gMjAx
OS0wOS0xMiAzOjQ3IGEubS4sIFJhbWFsaW5nYW0gQyB3cm90ZToNCj4+PiBPbiAyMDE5LTA5LTA5
IGF0IDE1OjU0OjUwICswMDAwLCBMYWtoYSwgQmhhd2FucHJlZXQgd3JvdGU6DQo+Pj4+IEhpIGFs
bCwNCj4+Pj4NCj4+Pj4gVGhpcyBpcyByZWdhcmRpbmcgdGhlIHJlY2VudCBoZGNwIGNvbnRlbnQg
dHlwZSBwYXRjaCB0aGF0IHdhcyBtZXJnZWQgaW50byBkcm0tbWlzYy4gKGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMjA5NTgvP3Nlcmllcz01NzIzMyZyZXY9MTEpDQo+
Pj4+DQo+Pj4+IFRoZXJlIGFyZSBkaXNwbGF5cyBvbiB0aGUgbWFya2V0IHRoYXQgYWR2ZXJ0aXNl
IEhEQ1AgMi4yIHN1cHBvcnQgYW5kIHdpbGwgcGFzcyBhdXRoZW50aWNhdGlvbiBhbmQgZW5jcnlw
dGlvbiBidXQgd2lsbCB0aGVuIHNob3cgYSBjb3JydXB0ZWQvYmx1ZS9ibGFjayBzY3JlZW4gKHRo
ZSBkcml2ZXIgY2Fubm90IGRldGVjdCB0aGlzKS4gVGhlc2UgZGlzcGxheXMgd29yayB3aXRoIEhE
Q1AgMS40IHdpdGhvdXQgYW55IGlzc3Vlcy4gRHVlIHRvIHRoZSBsYXJnZSBudW1iZXIgb2YgSERD
UC1zdXBwb3J0aW5nIGRldmljZXMgb24gdGhlIG1hcmtldCB3ZSBtaWdodCBub3QgYmUgYWJsZSB0
byBjYXRjaCB0aGVtIHdpdGggYSBibGFja2xpc3QuDQo+Pj4+DQo+Pj4+IEZyb20gdGhlIHVzZXIg
bW9kZXMgcGVyc3BlY3RpdmUsIEhEQ1AxLjQgYW5kIEhEQ1AyLjIgVHlwZTAgYXJlIHRoZSBzYW1l
IHRoaW5nLiBNZWFuaW5nIHRoYXQgdGhpcyBpbnRlcmZhY2UgZG9lc24ndCBhbGxvdyB1cyB0byBm
b3JjZSB0aGUgaGRjcCB2ZXJzaW9uLiBEdWUgdG8gdGhlIHByb2JsZW1zIG1lbnRpb25lZCBhYm92
ZSB3ZSBtaWdodCB3YW50IHRvIGV4cG9zZSB0aGUgYWJpbGl0eSBmb3IgYSB1c2VyIHRvIGZvcmNl
IGFuIEhEQ1AgZG93bmdyYWRlIHRvIGEgY2VydGFpbiBsZXZlbCAoZS5nLiAxLjQpIGluIGNhc2Ug
dGhleSBleHBlcmllbmNlIHByb2JsZW1zLg0KPj4+Pg0KPj4+PiBXaGF0IGFyZSB5b3VyIHRob3Vn
aHRzPyBhbmQgd2hhdCB3b3VsZCBiZSBhIGdvb2Qgd2F5IHRvIGRlYWwgd2l0aCBpdD8NCj4+PiBI
aSwNCj4+Pg0KPj4+IEFzIHlvdSBtZW50aW9uZWQsIHVBUEkgaXMgZGVzaWduZWQgdG8gYmUgSERD
UCB2ZXJzaW9uIGFnbm9zdGljLiBLZXJuZWwNCj4+PiBzdXBwb3NlZCB0byBleGVyY2lzZSB0aGUg
aGlnaGVzdCB2ZXJzaW9uIG9mIEhEQ1Agc3VwcG9ydGVkIG9uIHBhbmVsIGFuZA0KPj4+IHBsYXRm
b3JtLg0KPj4+DQo+Pj4gQXMgd2UgaW1wbGVtZW50IHRoZSBIRENQIHNwZWMgc3VwcG9ydCwgaWYg
YSBkZXZpY2UgaXMgbm9uLWNvbXBsaWFudCB3aXRoDQo+Pj4gSERDUCBzcGVjIGFmdGVyIGNvbXBs
ZXRpbmcgdGhlIEhEQ1AgYXV0aGVudGljYXRpb24sIEkgZG9udCB0aGluayB3ZSBuZWVkDQo+Pj4g
dG8gd29ycnkgYWJvdXQgaXQuDQo+Pj4NCj4+DQo+PiBUZWxsIHRoYXQgdG8gb3VyIChvciB5b3Vy
KSBjdXN0b21lcnMuDQo+Pg0KPj4gSW4gdGhpcyBjYXNlIGFuIGVuZHVzZXIgbWlnaHQgcGx1ZyBp
biBhIGJhZCBtb25pdG9yIG9yIFRWIGFuZCBiZSB1bmFibGUNCj4+IHRvIHBsYXkgcHJvdGVjdGVk
IGNvbnRlbnQuDQo+Pg0KPj4gV2hhdCBpZiB3ZSBhZGQgYSBuZXcgZW51bSB2YWx1ZSB0byB0aGUg
Y29udGVudF90eXBlIHByb3BlcnR5IHRoYXQgc2F5cw0KPj4gIkRSTV9NT0RFX0hEQ1BfQ09OVEVO
VF9UWVBFX0ZPUkNFXzE0Ij8NCj4gImNvbnRlbnQgdHlwZSIgaXMgZm9yIGRlZmluaW5nIHRoZSBz
dHJlYW0gdHlwZS4gQWRkaW5nIGFuIGVudHJ5IGludG8gaXQNCj4gc291bmRzIGxpa2UgcG9sbHV0
aW5nIGl0Lg0KPiANCg0KRm9yIHN1cmUNCg0KPiBTZXBhcmF0ZSB1QVBJIGZvciBmb3JjaW5nIGEg
SERDUCB2ZXJzaW9uIG1pZ2h0IGJlIG5lZWQuIE9yIHdvbmRlcmluZyBvbg0KPiB1c2luZyB0aGUg
c3lzZnMgb2YgY29ubmVjdG9yIGZvciB0aGlzIGRpcnR5IGpvYiE/DQo+IA0KDQpEaWQgYSBiaXQg
bW9yZSBkaWdnaW5nLi4uDQoNCk9uIG90aGVyIE9TIHdlIGdvdCBhIG1vbml0b3IgcXVpcmsgZm9y
IGEgZmV3IGRpc3BsYXlzIGFuZCBhbHNvIHNvbWV0aGluZw0Kc2ltaWxhciB0byBhIG1vZHVsZSBw
YXJhbWV0ZXIgdG8gZm9yY2UgZGlzYWJsZSBIRENQIDIueCBzdXBwb3J0Lg0KDQpJdCBsb29rcyBs
aWtlIHRoZXJlIGFyZW4ndCB0b28gbWFueSBxdWlya3kgcmVjZWl2ZXJzIHNvIHRoYXQgbWlnaHQg
YmUgYW4NCmFjY2VwdGFibGUgc29sdXRpb24uIEknbSBzdGlsbCB0aGlua2luZyBhIGNvbm5lY3Rv
ciBwcm9wZXJ0eSBtaWdodCBiZQ0KdXNlZnVsIHRvIGZvcmNlIGEgY2VydGFpbiBIRENQIHZlcnNp
b24gYnV0IG1heWJlIEknbSBvdmVydGhpbmtpbmcgaXQuDQoNCkhhcnJ5DQoNCj4gLVJhbQ0KPj4N
Cj4+IEhhcnJ5DQo+Pg0KPj4+IEluIGNhc2UgaWYgeW91IHdhbnQgdG8gdHJhY2sgYW5kIGltcGxl
bWVudCBhIHF1aXJrIGZvciBpdCwgbGlrZSBub3QgdG8NCj4+PiBwcm9qZWN0IHRoZSBIRENQMi4y
IGNhcGFiaWxpdHksIHlvdSBjYW4gdXNlIHRoZSByZWNlaXZlciBpZCBvZiB0aGF0IHBhbmVsDQo+
Pj4gdG8gdHJhY2sgaXQuDQo+Pj4NCj4+PiBUaGFua3MsDQo+Pj4gLVJhbQ0KPj4+Pg0KPj4+Pg0K
Pj4+PiBUaGFua3MsDQo+Pj4+DQo+Pj4+IEJoYXdhbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
