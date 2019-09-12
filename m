Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59AB110B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 16:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3854B6ED88;
	Thu, 12 Sep 2019 14:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740088.outbound.protection.outlook.com [40.107.74.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BC96ED88
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miQBy0FgolsmikhNL103zElTk9OhIEIe+Xbtwbbh1Ff5AAHf0+fkWC0d983tS7BDz3QDB+Ua0wBLq3NgFLhY3/jHe4qjT3aBrGDsb38HxOAmjmJR1llK7T7ASDVZkC9OewPouJsQce367PxoJOXvHUR+e+FaIsNV2RDU87147wPujpv0+98XFvYkyv8dmsBHe7qgM6ZAXHxjE1k/Vm8wv6PYH0QzZFvE6UJK/GGtrsxGQ/kqSzfq63rI13Jzw8h3MisWHNLPyZygKeBnfvA7m2v0r9dgnscQbn9HHiMGGL/YDxV04pLsbktS2twCBn13umJkFq4FiXYnEaV1nbt5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX6iCKDKfV1I55UxeeBhA/4WZGoVgAtHKUgDhJMEAuk=;
 b=fVpcXvFHutL0T7amIvWv62TI19XUX0Ls+M0t08WReJQdVz+o/sUmYdojGyDyDjrQPdIaTCyE4PcIryk7IU11GMigUmWDCOpUqSmlCVaYmi/I46FaXHktfmZ7kLLfNUJBSL0WFHg0vWpTjQpxS7STQvFM6n1fg6Zd6CDZw2IhOM0Y7cyAB9sycJdiVyYJs7p5CCZ8kCtiiwjnzytpMWfr3ua+eSqF6WgndEva5CXekQf9L4MWgntM3zU4VKf8Pj02mCgEgzP+8dnSdJz8QJSojS3hF2q7Pj0CqIejG2SPhI2xlACYBehk+Db3UUe9HKgzHOIb+JUEAikaH/3qGA3b/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0071.namprd12.prod.outlook.com (10.172.79.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 14:23:05 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2263.016; Thu, 12 Sep
 2019 14:23:05 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Ramalingam C <ramalingam.c@intel.com>, "Lakha, Bhawanpreet"
 <Bhawanpreet.Lakha@amd.com>
Subject: Re: HDCP Content Type Interface
Thread-Topic: HDCP Content Type Interface
Thread-Index: AQHVZybpH5lguPO4sE2kRRNZBAZu6qcnrnOAgABua4A=
Date: Thu, 12 Sep 2019 14:23:05 +0000
Message-ID: <57b94728-9dd5-a794-8a76-1a40dd857381@amd.com>
References: <10cb9f86-9d46-6654-ad9d-dcb77d6ef624@amd.com>
 <20190912074751.GB14191@intel.com>
In-Reply-To: <20190912074751.GB14191@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a479713-e4d0-4edd-d5d3-08d7378cb9f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0071; 
x-ms-traffictypediagnostic: CY4PR1201MB0071:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0071DFA9E4EADF9F82492B468CB00@CY4PR1201MB0071.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(53754006)(189003)(199004)(52054003)(386003)(66476007)(66556008)(64756008)(53546011)(66946007)(6506007)(26005)(66446008)(476003)(6636002)(99286004)(66066001)(65956001)(65806001)(14444005)(102836004)(52116002)(76176011)(256004)(110136005)(54906003)(71200400001)(58126008)(2616005)(71190400001)(446003)(11346002)(316002)(5660300002)(3480700005)(31696002)(36756003)(305945005)(486006)(31686004)(186003)(7736002)(8676002)(3846002)(6116002)(6486002)(25786009)(81156014)(81166006)(14454004)(478600001)(53936002)(6512007)(2906002)(6436002)(229853002)(4326008)(8936002)(6246003)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0071;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tK/FPwSCotonokb6+Uq+/K8A/ayGfYYSzCxAAzP0rzd4i8Wxs/gCs2PQECs5E26rgz9tRe51yL8zxnuia5B7oL1uzMPxo6qgVXaXCzaebSsRzIolxeTDhtt/kzw6yTVbMMYuPJYFsNZeOYWUdvlUu61hrmpiBaWApAhLHmGTJfhJZ4tvDrQTpeMQ1pM883lIXzkJIJ305VeCsuPqy6nx8ROr1dihg7qX2oJoPLdS6XoRT5yFBvwjKWEJ417WA0y4w49/jgQjhp9wxKkgwCFyjbiNdVOTgGYjS0JI+SYFO1JLDoEzg38wJqZWo8Zp4H5ejQF2bXyXsrjjG6lXUhmtntlKDXJSS9RkpjVxNmjeNvSeHOK2YgnABmH61s4IXSD77Bloc7oKEbmCkBgQU2VUB8KE43Oqgmh46E7y1PDA5RY=
Content-ID: <8A88D567729F7D4B8B42F75487E3C380@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a479713-e4d0-4edd-d5d3-08d7378cb9f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 14:23:05.4062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lG2zdCiJpo+C0oZD8r4QOYDuQgGoeSoUCxn9OTKP06lPKM7N6K0/w9qV7owPxC7plYJq+wg+zLGrkM4G1LPKVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX6iCKDKfV1I55UxeeBhA/4WZGoVgAtHKUgDhJMEAuk=;
 b=QJV22T8DjVvDIfnfodpX+tUx5pOVeKu0djSiHkBHVKphVJJvP3BEJ1JFD440audw7dwskgwO2jPXMFBTFTdyE1xQ0yjisjw3wGQ7JrUqPfYky/HKRXltYWiFOnfhGP9ajxn38CCJVwGfmBKumJtAtZHqg1T3DDzoxgdPGr9DiYI=
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

T24gMjAxOS0wOS0xMiAzOjQ3IGEubS4sIFJhbWFsaW5nYW0gQyB3cm90ZToNCj4gT24gMjAxOS0w
OS0wOSBhdCAxNTo1NDo1MCArMDAwMCwgTGFraGEsIEJoYXdhbnByZWV0IHdyb3RlOg0KPj4gSGkg
YWxsLA0KPj4NCj4+IFRoaXMgaXMgcmVnYXJkaW5nIHRoZSByZWNlbnQgaGRjcCBjb250ZW50IHR5
cGUgcGF0Y2ggdGhhdCB3YXMgbWVyZ2VkIGludG8gZHJtLW1pc2MuIChodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzIwOTU4Lz9zZXJpZXM9NTcyMzMmcmV2PTExKQ0KPj4N
Cj4+IFRoZXJlIGFyZSBkaXNwbGF5cyBvbiB0aGUgbWFya2V0IHRoYXQgYWR2ZXJ0aXNlIEhEQ1Ag
Mi4yIHN1cHBvcnQgYW5kIHdpbGwgcGFzcyBhdXRoZW50aWNhdGlvbiBhbmQgZW5jcnlwdGlvbiBi
dXQgd2lsbCB0aGVuIHNob3cgYSBjb3JydXB0ZWQvYmx1ZS9ibGFjayBzY3JlZW4gKHRoZSBkcml2
ZXIgY2Fubm90IGRldGVjdCB0aGlzKS4gVGhlc2UgZGlzcGxheXMgd29yayB3aXRoIEhEQ1AgMS40
IHdpdGhvdXQgYW55IGlzc3Vlcy4gRHVlIHRvIHRoZSBsYXJnZSBudW1iZXIgb2YgSERDUC1zdXBw
b3J0aW5nIGRldmljZXMgb24gdGhlIG1hcmtldCB3ZSBtaWdodCBub3QgYmUgYWJsZSB0byBjYXRj
aCB0aGVtIHdpdGggYSBibGFja2xpc3QuDQo+Pg0KPj4gRnJvbSB0aGUgdXNlciBtb2RlcyBwZXJz
cGVjdGl2ZSwgSERDUDEuNCBhbmQgSERDUDIuMiBUeXBlMCBhcmUgdGhlIHNhbWUgdGhpbmcuIE1l
YW5pbmcgdGhhdCB0aGlzIGludGVyZmFjZSBkb2Vzbid0IGFsbG93IHVzIHRvIGZvcmNlIHRoZSBo
ZGNwIHZlcnNpb24uIER1ZSB0byB0aGUgcHJvYmxlbXMgbWVudGlvbmVkIGFib3ZlIHdlIG1pZ2h0
IHdhbnQgdG8gZXhwb3NlIHRoZSBhYmlsaXR5IGZvciBhIHVzZXIgdG8gZm9yY2UgYW4gSERDUCBk
b3duZ3JhZGUgdG8gYSBjZXJ0YWluIGxldmVsIChlLmcuIDEuNCkgaW4gY2FzZSB0aGV5IGV4cGVy
aWVuY2UgcHJvYmxlbXMuDQo+Pg0KPj4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cz8gYW5kIHdoYXQg
d291bGQgYmUgYSBnb29kIHdheSB0byBkZWFsIHdpdGggaXQ/DQo+IEhpLA0KPiANCj4gQXMgeW91
IG1lbnRpb25lZCwgdUFQSSBpcyBkZXNpZ25lZCB0byBiZSBIRENQIHZlcnNpb24gYWdub3N0aWMu
IEtlcm5lbA0KPiBzdXBwb3NlZCB0byBleGVyY2lzZSB0aGUgaGlnaGVzdCB2ZXJzaW9uIG9mIEhE
Q1Agc3VwcG9ydGVkIG9uIHBhbmVsIGFuZA0KPiBwbGF0Zm9ybS4NCj4gDQo+IEFzIHdlIGltcGxl
bWVudCB0aGUgSERDUCBzcGVjIHN1cHBvcnQsIGlmIGEgZGV2aWNlIGlzIG5vbi1jb21wbGlhbnQg
d2l0aA0KPiBIRENQIHNwZWMgYWZ0ZXIgY29tcGxldGluZyB0aGUgSERDUCBhdXRoZW50aWNhdGlv
biwgSSBkb250IHRoaW5rIHdlIG5lZWQNCj4gdG8gd29ycnkgYWJvdXQgaXQuDQo+IA0KDQpUZWxs
IHRoYXQgdG8gb3VyIChvciB5b3VyKSBjdXN0b21lcnMuDQoNCkluIHRoaXMgY2FzZSBhbiBlbmR1
c2VyIG1pZ2h0IHBsdWcgaW4gYSBiYWQgbW9uaXRvciBvciBUViBhbmQgYmUgdW5hYmxlDQp0byBw
bGF5IHByb3RlY3RlZCBjb250ZW50Lg0KDQpXaGF0IGlmIHdlIGFkZCBhIG5ldyBlbnVtIHZhbHVl
IHRvIHRoZSBjb250ZW50X3R5cGUgcHJvcGVydHkgdGhhdCBzYXlzDQoiRFJNX01PREVfSERDUF9D
T05URU5UX1RZUEVfRk9SQ0VfMTQiPw0KDQpIYXJyeQ0KDQo+IEluIGNhc2UgaWYgeW91IHdhbnQg
dG8gdHJhY2sgYW5kIGltcGxlbWVudCBhIHF1aXJrIGZvciBpdCwgbGlrZSBub3QgdG8NCj4gcHJv
amVjdCB0aGUgSERDUDIuMiBjYXBhYmlsaXR5LCB5b3UgY2FuIHVzZSB0aGUgcmVjZWl2ZXIgaWQg
b2YgdGhhdCBwYW5lbA0KPiB0byB0cmFjayBpdC4NCj4gDQo+IFRoYW5rcywNCj4gLVJhbQ0KPj4N
Cj4+DQo+PiBUaGFua3MsDQo+Pg0KPj4gQmhhd2FuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
