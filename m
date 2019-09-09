Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C22ADC83
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 17:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D7189258;
	Mon,  9 Sep 2019 15:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710065.outbound.protection.outlook.com [40.107.71.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85FB89258
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 15:54:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvsfVS7AS+nfmRK1tUT4e9Q9fLMfQaley3rJkj0Rps6WmCE+Gy2v1zjBJEk967OqXEEKdyr7saASh55jLjSzgZyXUpbMOiBEQ67katPES1l6CTZUYkgis6aYfWxsFjzR3cpKoTHwe9ds2zLRkxHmpzkWYU22YF9FJEskZv4UGNfz3dfA6JgEqXTDqj8DDgUg1avdfwm1KplSGJh2b5SJrQ3hcoUTarga5xxq8Ws/xL7OBcsxT1M9D68MuRq1is1fQCb/LDYw3o1D02wrdWC5uliDYJ9Hy/NhSpiLhkkKhEla5xNUl2yVWkCJ+Pitjf1vBq9mNhzM4DVU1DpYQzd5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmUIWxOzCEgvt9YA2NMKdLmFHDCepUh6sJL1NtnwgSg=;
 b=lTLyGPFgGz8Cipbv/87lH2vbrQc5WK1d1GNd7NJLVU8nDW+q4pwZRi79JpERKeN5DaTcsxLvRQ00ahh9hRCJpy8WrZsmj5olp2LUlAtO4hSVYzHSQe4V+5p8vKTvewfCC5CF11d4Ig/5M08VvmpZ64cVJ4xCzGVb2W2PaVZ08IPzV/ydTpf7xVFT7fDBnp8069ZGJiG3xSaASvCp4xXImAFZ2WZ7LvwPsElJQK7Q9cZkUUlEa+CORpm42CnufNXSdz8YXefrUh7XW8V0ECE3QxC1I8NZRi1EpBueURldjml2RT4033jzYUYzL39PlDTC21WP+UYhY4rjQO7XPnPK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1148.namprd12.prod.outlook.com (10.168.237.17) by
 DM5PR12MB2454.namprd12.prod.outlook.com (52.132.141.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 15:54:50 +0000
Received: from DM5PR12MB1148.namprd12.prod.outlook.com
 ([fe80::a1b2:dc0c:729c:cfed]) by DM5PR12MB1148.namprd12.prod.outlook.com
 ([fe80::a1b2:dc0c:729c:cfed%6]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 15:54:50 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: Ramalingam C <ramalingam.c@intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: HDCP Content Type Interface
Thread-Topic: HDCP Content Type Interface
Thread-Index: AQHVZybpH5lguPO4sE2kRRNZBAZu6g==
Date: Mon, 9 Sep 2019 15:54:50 +0000
Message-ID: <10cb9f86-9d46-6654-ad9d-dcb77d6ef624@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To DM5PR12MB1148.namprd12.prod.outlook.com
 (2603:10b6:3:74::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1357c17a-4058-4204-23f2-08d7353e0c16
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2454; 
x-ms-traffictypediagnostic: DM5PR12MB2454:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB24543A88797C4B14F9D89455F9B70@DM5PR12MB2454.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(53754006)(189003)(199004)(52054003)(14444005)(256004)(186003)(8936002)(6506007)(81156014)(25786009)(3846002)(6116002)(81166006)(4744005)(8676002)(7736002)(31696002)(478600001)(36756003)(102836004)(4326008)(64756008)(66066001)(86362001)(26005)(66446008)(66556008)(66476007)(66946007)(2616005)(476003)(6486002)(54906003)(236005)(110136005)(99286004)(386003)(53936002)(6512007)(486006)(6306002)(54896002)(316002)(71200400001)(71190400001)(31686004)(606006)(2501003)(3480700005)(14454004)(5660300002)(2906002)(52116002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2454;
 H:DM5PR12MB1148.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p8DzgL2QoADXYtlcP1csbaYEKmtUWvEmaaW240hWONutDUABtgMmfmnySs8Mh267BsYVhaQiEz75hQD4EM4O6LhSxCD9/AHMYeCiIcPFePOetgxdkVKZZZyK0VCUcs4CHImxbF5dwfQbRhsintLY+0y3b7zgjJObkDWmAhMBpAITwlnjAw1BnvIbRuyk3q0dCOJ/X18lr97GePfN2sueVF6fXEuZA/KXi1RQP40mgU+DIA+ZYQ2m1fslQU6kCApkAVUKyAHmBvSMTpiIBy/ve71uqKeNY7uA3GcIY8r2N7wNqQjn9/6bbKsgTxoQsdX/bWhWt+bes1b6XVHKa9Q9MRTqj9T9M4YjDIpG0Rp1I+yBzqreB6iT5S9HEICtnyLDlfrJujvc5A/rBXmJ9uGnBG2IipqDPJdeebhPgqJu79k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1357c17a-4058-4204-23f2-08d7353e0c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 15:54:50.4576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +AjTVkjhoFKvGLbxSufTfZ4oJk2GzD/S/htp5ZNdngLrqzAuCEB/oZ3YyiYjheTx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2454
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmUIWxOzCEgvt9YA2NMKdLmFHDCepUh6sJL1NtnwgSg=;
 b=ho8w74nn0Fn/KzNKnemgXpuhUgIWlke4fpgq9x3KSGb1mVOCMHUFe+q2Jea1YPbsAQxxJLroaiwu6AQIRR+lRQNU+k+3NQg/HpBxrplx8oufoJAwrq/8NqgDYIckLGHPOlnXmOjzK17a44Bko+tG4r2fTr6brjKgO0IlcBj9qh4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0389060497=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0389060497==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_10cb9f869d466654ad9ddcb77d6ef624amdcom_"

--_000_10cb9f869d466654ad9ddcb77d6ef624amdcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpUaGlzIGlzIHJlZ2FyZGluZyB0aGUgcmVjZW50IGhkY3AgY29udGVudCB0eXBl
IHBhdGNoIHRoYXQgd2FzIG1lcmdlZCBpbnRvIGRybS1taXNjLiAoaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMyMDk1OC8/c2VyaWVzPTU3MjMzJnJldj0xMSkNCg0KVGhl
cmUgYXJlIGRpc3BsYXlzIG9uIHRoZSBtYXJrZXQgdGhhdCBhZHZlcnRpc2UgSERDUCAyLjIgc3Vw
cG9ydCBhbmQgd2lsbCBwYXNzIGF1dGhlbnRpY2F0aW9uIGFuZCBlbmNyeXB0aW9uIGJ1dCB3aWxs
IHRoZW4gc2hvdyBhIGNvcnJ1cHRlZC9ibHVlL2JsYWNrIHNjcmVlbiAodGhlIGRyaXZlciBjYW5u
b3QgZGV0ZWN0IHRoaXMpLiBUaGVzZSBkaXNwbGF5cyB3b3JrIHdpdGggSERDUCAxLjQgd2l0aG91
dCBhbnkgaXNzdWVzLiBEdWUgdG8gdGhlIGxhcmdlIG51bWJlciBvZiBIRENQLXN1cHBvcnRpbmcg
ZGV2aWNlcyBvbiB0aGUgbWFya2V0IHdlIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGNhdGNoIHRoZW0g
d2l0aCBhIGJsYWNrbGlzdC4NCg0KRnJvbSB0aGUgdXNlciBtb2RlcyBwZXJzcGVjdGl2ZSwgSERD
UDEuNCBhbmQgSERDUDIuMiBUeXBlMCBhcmUgdGhlIHNhbWUgdGhpbmcuIE1lYW5pbmcgdGhhdCB0
aGlzIGludGVyZmFjZSBkb2Vzbid0IGFsbG93IHVzIHRvIGZvcmNlIHRoZSBoZGNwIHZlcnNpb24u
IER1ZSB0byB0aGUgcHJvYmxlbXMgbWVudGlvbmVkIGFib3ZlIHdlIG1pZ2h0IHdhbnQgdG8gZXhw
b3NlIHRoZSBhYmlsaXR5IGZvciBhIHVzZXIgdG8gZm9yY2UgYW4gSERDUCBkb3duZ3JhZGUgdG8g
YSBjZXJ0YWluIGxldmVsIChlLmcuIDEuNCkgaW4gY2FzZSB0aGV5IGV4cGVyaWVuY2UgcHJvYmxl
bXMuDQoNCldoYXQgYXJlIHlvdXIgdGhvdWdodHM/IGFuZCB3aGF0IHdvdWxkIGJlIGEgZ29vZCB3
YXkgdG8gZGVhbCB3aXRoIGl0Pw0KDQoNClRoYW5rcywNCg0KQmhhd2FuDQo=

--_000_10cb9f869d466654ad9ddcb77d6ef624amdcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <3A34168343529045966381126D4CB617@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHRleHQ9IiMwMDAwMDAi
IGJnY29sb3I9IiNGRkZGRkYiPg0KPHAgY2xhc3M9ImNvbnRlbnQiPjxmb250IHNpemU9IiYjNDM7
MSI+PHNwYW4gY2xhc3M9InBfYWRkIj5IaSBhbGwsPC9zcGFuPjxiPjxzcGFuIGNsYXNzPSJwX2Fk
ZCI+DQo8L3NwYW4+PC9iPjxzcGFuIGNsYXNzPSJwX2FkZCI+PGJyPg0KPC9zcGFuPjwvZm9udD48
L3A+DQo8cCBjbGFzcz0iY29udGVudCI+PGZvbnQgc2l6ZT0iJiM0MzsxIj48c3BhbiBjbGFzcz0i
cF9hZGQiPlRoaXMgaXMgcmVnYXJkaW5nIHRoZSByZWNlbnQgaGRjcCBjb250ZW50IHR5cGUgcGF0
Y2ggdGhhdCB3YXMgbWVyZ2VkIGludG8gZHJtLW1pc2MuICg8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
MzIwOTU4Lz9zZXJpZXM9NTcyMzMmYW1wO3Jldj0xMSI+aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRl
c2t0b3Aub3JnL3BhdGNoLzMyMDk1OC8/c2VyaWVzPTU3MjMzJmFtcDtyZXY9MTE8L2E+KTxicj4N
Cjxicj4NCjwvc3Bhbj48c3BhbiBjbGFzcz0icF9hZGQiPlRoZXJlIGFyZSBkaXNwbGF5cyBvbiB0
aGUgbWFya2V0IHRoYXQgYWR2ZXJ0aXNlIEhEQ1AgMi4yIHN1cHBvcnQgYW5kIHdpbGwgcGFzcyBh
dXRoZW50aWNhdGlvbiBhbmQgZW5jcnlwdGlvbiBidXQgd2lsbCB0aGVuIHNob3cgYSBjb3JydXB0
ZWQvYmx1ZS9ibGFjayBzY3JlZW4gKHRoZSBkcml2ZXIgY2Fubm90IGRldGVjdCB0aGlzKS4gVGhl
c2UgZGlzcGxheXMgd29yayB3aXRoIEhEQ1AgMS40IHdpdGhvdXQNCiBhbnkgaXNzdWVzLiBEdWUg
dG8gdGhlIGxhcmdlIG51bWJlciBvZiBIRENQLXN1cHBvcnRpbmcgZGV2aWNlcyBvbiB0aGUgbWFy
a2V0IHdlIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGNhdGNoIHRoZW0gd2l0aCBhIGJsYWNrbGlzdC4N
Cjxicj4NCjwvc3Bhbj48L2ZvbnQ+PGJyPg0KPGZvbnQgc2l6ZT0iJiM0MzsxIj48c3BhbiBjbGFz
cz0icF9hZGQiPjxmb250IHNpemU9IiYjNDM7MSI+PHNwYW4gY2xhc3M9InBfYWRkIj5Gcm9tIHRo
ZSB1c2VyIG1vZGVzDQo8L3NwYW4+PHNwYW4gY2xhc3M9InBfYWRkIj5wZXJzcGVjdGl2ZSwgSERD
UDEuNCBhbmQgSERDUDIuMiBUeXBlMCBhcmUgdGhlIHNhbWUgdGhpbmcuIE1lYW5pbmcgdGhhdCB0
aGlzIGludGVyZmFjZSBkb2Vzbid0IGFsbG93IHVzIHRvIGZvcmNlIHRoZSBoZGNwIHZlcnNpb248
L3NwYW4+PHNwYW4gY2xhc3M9InBfYWRkIj48L3NwYW4+PC9mb250Pi4gRHVlIHRvIHRoZSBwcm9i
bGVtcyBtZW50aW9uZWQgYWJvdmUgd2UgbWlnaHQgd2FudCB0byBleHBvc2UNCiB0aGUgYWJpbGl0
eSBmb3IgYSB1c2VyIHRvIGZvcmNlIGFuIEhEQ1AgZG93bmdyYWRlIHRvIGEgY2VydGFpbiBsZXZl
bCAoZS5nLiAxLjQpIGluIGNhc2UgdGhleSBleHBlcmllbmNlIHByb2JsZW1zLg0KPGJyPg0KPC9z
cGFuPjwvZm9udD48L3A+DQo8cCBjbGFzcz0iY29udGVudCI+PGZvbnQgc2l6ZT0iJiM0MzsxIj48
c3BhbiBjbGFzcz0icF9hZGQiPldoYXQgYXJlIHlvdXIgdGhvdWdodHM/IGFuZCB3aGF0IHdvdWxk
IGJlIGEgZ29vZCB3YXkgdG8gZGVhbCB3aXRoIGl0Pzxicj4NCjwvc3Bhbj48L2ZvbnQ+PC9wPg0K
PGJyPg0KPHA+VGhhbmtzLDwvcD4NCjxwPkJoYXdhbjxicj4NCjwvcD4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_10cb9f869d466654ad9ddcb77d6ef624amdcom_--

--===============0389060497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0389060497==--
