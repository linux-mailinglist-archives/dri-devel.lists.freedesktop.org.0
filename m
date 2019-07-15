Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFB16A04A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126546E04B;
	Tue, 16 Jul 2019 01:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73F889B03
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 19:17:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRy3F/f19XQ5Ws6D97cuJfNslFM8g+OQNHVeSzctjRUWRXEi60v1CDsKedGCrLKOv30jDBd5YczuXzI3mrZ6EAD/lCcRtHhmKgB6IUrn2LWF3PlQ2WZwiu/VL/qOPDkgvjpwZDTdlTlKvnGRY7pnQamvNWPhk5QBZCMJ0qbqosu6C/AdFSu3SmkU96UC3WEUQcKdkDSldYA51O0nA39SD5ZfD4QLOTKr9bJIZoQwwugrvve7IRN/xCn2pND4Ye9rUXOSMIEKvq8ns9Sh3KG6MnP2V44Z01sUSRwtnZR/lfX+6ghvtWa4P6FlsR319c2N8U5gcBPA0ijgJoFdfQTvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ISiw4cLmgEvNJ8Na5+APkgOApNsKAf4uvFCLaPd/9c=;
 b=RsetV/IqhMZa5qa8nrejqcGgIq/1tb3G5Jrr8NPB1Rmeu3EOfNbhO2FhOpq6wYkZKa6WOKLWsBoIYGrdxOB4h0nx2bog8KdFIquI1N7LafDBJbVXdaxfqAgu6yV3fggW7uA/TZxDniNCYa6jdVge2Knr0dlT6Pvx3t1ceN37q4Fo8JsHQhudAQG9IQWX/gKI2IekwkpLnKAfDsxOVMQP+ZI8TBjn9HJNJOCnHAtX/j8jbHx7tpbPPQ4zFI0ynvYqgIsogu89xRfnAtFpItFMTBHivvYlYE74MlC76mRsXHZy/JjTmFRl3o8XxUo9FjMFVFJ1MJteWe37n3gEc2Wkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3181.eurprd05.prod.outlook.com (10.170.237.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 19:17:08 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 19:17:08 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: DRM pull for v5.3-rc1
Thread-Topic: DRM pull for v5.3-rc1
Thread-Index: AQHVOwjxvOBTsCZDkEWbf47t9QeYFabL/LCAgAARAQA=
Date: Mon, 15 Jul 2019 19:17:08 +0000
Message-ID: <20190715191702.GD5043@mellanox.com>
References: <CAPM=9tzJQ+26n_Df1eBPG1A=tXf4xNuVEjbG3aZj-aqYQ9nnAg@mail.gmail.com>
 <CAPM=9tx+CEkzmLZ-93GZmde9xzJ_rw3PJZxFu_pjZJc7KM5f-w@mail.gmail.com>
 <20190715122924.GA15202@mellanox.com>
 <CAHk-=wgEimwxXiDUdp9eSGZn4j6n8g-4KhdEG0kPVgKFQeAXgw@mail.gmail.com>
In-Reply-To: <CAHk-=wgEimwxXiDUdp9eSGZn4j6n8g-4KhdEG0kPVgKFQeAXgw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::29) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fd5f218-0210-433d-af5a-08d70959079b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3181; 
x-ms-traffictypediagnostic: VI1PR05MB3181:
x-microsoft-antispam-prvs: <VI1PR05MB318153FF71C6D6DB6A19201ACFCF0@VI1PR05MB3181.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(189003)(199004)(14444005)(256004)(66066001)(86362001)(316002)(14454004)(71200400001)(8936002)(71190400001)(66556008)(66476007)(64756008)(66446008)(6916009)(1076003)(5660300002)(54906003)(66946007)(446003)(4326008)(99286004)(102836004)(486006)(11346002)(2906002)(386003)(305945005)(7736002)(53936002)(6436002)(229853002)(52116002)(476003)(2616005)(68736007)(478600001)(6486002)(6512007)(25786009)(6506007)(53546011)(76176011)(33656002)(8676002)(6116002)(3846002)(186003)(81156014)(81166006)(36756003)(26005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3181;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Pm0du8sq6JH5OLOReQ0+d3KFOROuzLaxbyUOeN4bP41cAiJCLHro5ca0yJVUIzRNdozmHDVt9QMl0VfuxlsF22FvW9rAQ9BkFRMmYoqzXdS8WDDRtS/VSrbupU6jkwRnegSsmd3dTAYLeutD9R69syK4hRaznLpw3hwhRaRZfmWBsUWCV+VgY07G17nlEnxbxyIUgofvMyKU/ylJFwp8mM0ivR2NwJj2lWmTLbDsKoliHjjl6+riFuwkDlUzu+LxsMnh6dpV3jWN1HuiPDNCYIg40kN2fgVCPhwhrgEYpmsmLiqI9guxyMPS2xiPDqk1f9+qFA8g6rbYOKVCXOs04xIn7iqpzNj+RxRyBrxFddd4F+7PNgyx4XMYw0G/CiZu5SY1D3pWEd2V861zfTRtgww+IlkU6JMwsRZa79OIC8=
Content-ID: <31A30FDC27B98847BD0C7E4675A970D1@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd5f218-0210-433d-af5a-08d70959079b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 19:17:08.2156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3181
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ISiw4cLmgEvNJ8Na5+APkgOApNsKAf4uvFCLaPd/9c=;
 b=lZUW2IUhMWBSJL2Dr8As2NAqa9Mp5U2hBxSTFDsOQK+C6wO3MfXs8xpCoydN02/5M0loMQusYe1/t2OiN/2m9tAyLxpW7A9cxVNsMDHN/p917vNOHVC3r7Kc+sMeuogULWbbkLafcdXOywj1QsuXf2Be9PAn3844dkhtTWRFflk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MTY6MTFBTSAtMDcwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gWyBVZ2gsIEkgaGF2ZSB0aHJlZSBkaWZmZXJlbnQgdGhyZWFkcyBhYm91dCB0aGUg
ZHJtIHB1bGwgYmVjYXVzZSBvZgo+IHRoZSBzdWJqZWN0IC8gaHRtbCBjb25mdXNpb24uIFNvIG5v
dyBJJ20gcmVwbHlpbmcgaW4gc2VwYXJhdGUgdGhyZWFkcwo+IGFuZCBJJ20gaG9waW5nIHRoZSBw
ZW9wbGUgaW52b2x2ZWQgaGF2ZSBiZXR0ZXIgdGhyZWFkaW5nIHRoYW4gZ21haWwKPiBkb2VzIDsv
IF0KPiAKPiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCA1OjI5IEFNIEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlICdobW0nIHRyZWUgaXMgc29tZXRo
aW5nIEkgcmFuIHRvIHRyeSBhbmQgaGVscCB3b3JrZmxvdyBpc3N1ZXMgbGlrZQo+ID4gdGhpcywg
YXMgaXQgY291bGQgYmUgbWVyZ2VkIHRvIERSTSBhcyBhIHRvcGljIGJyYW5jaCAtIG1heWJlIGNv
bnNpZGVyCj4gPiB0aGlzIGZsb3cgaW4gZnV0dXJlPwo+ID4KPiA+IExpbnVzLCBkbyB5b3UgaGF2
ZSBhbnkgYWR2aWNlIG9uIGhvdyBiZXN0IHRvIGhhbmRsZSBzaGFyaW5nIG1tCj4gPiBwYXRjaGVz
Pwo+IAo+IEkgZG9uJ3QgaGF2ZSBhIGxvdCBvZiBhZHZpY2UgZXhjZXB0IGZvciAidmVyeSB2ZXJ5
IGNhcmVmdWxseSIuCj4gCj4gSSB0aGluayB0aGUgaG1tIHRyZWUgd29ya2VkIHJlYWxseSB3ZWxs
IHRoaXMgbWVyZ2Ugd2luZG93LCBhdCBsZWFzdAo+IGZyb20gbXkgc3RhbmRwb2ludC4KPiAKPiBC
dXQgaXQgaXMgb2YgY291cnNlIHBvc3NpYmxlIHRoYXQgbXkgaGFwcGluZXNzIGFib3V0IHRoZSBo
bW0gdHJlZSBpcyBhCj4gY29tcGxldGUgZmx1a2UgYW5kIGNhbWUgYWJvdXQgYmVjYXVzZSBwcmV0
dHkgbXVjaCBhbGwgdGhlIHBhdGNoZXMgd2VyZQo+IHJlbW92aW5nIG9kZGl0aWVzIGFuZCBjbGVh
bmluZyB0aGluZ3MgdXAsIGFuZCB0aGV5IHdlcmVuJ3QgYWRkaW5nIG5ldwo+IG9kZCB0aGluZ3Mg
KG9yIGlmIHRoZXkgd2VyZSwgeW91IGhpZCBpdCBiZXR0ZXIgO14pLgoKbG9sCgpBY3R1YWxseSBJ
IHRoaW5rIGl0IHdhcyBhIGxvdCBvZiBlZmZvcnQgZnJvbSBtYW55IHBlb3BsZSB0byBtb25pdG9y
CmFuZCBzdGF5IG9uIHRvcCBvZiBjb25mbGljdHMsIGFuZCB0aGVyZSB3YXMgY2VydGFpbmx5IGEg
ZGVsaWJlcmF0ZQplZmZvcnQgdG8gYnJpbmcgbWFueSBwZW9wbGUgdG9nZXRoZXIuCgpBYm91dCB0
aGUgb25seSB0aGluZyBJIGNvdWxkIGNvbmNyZXRlbHkgc3VnZ2VzdCBmb3Igd29ya2luZyB3aXRo
IC1tbQppcyBpZiB0aGVyZSB3YXMgc29tZSB3YXkgdGhlIC1tbSBxdWlsdCBwYXRjaGVzIGNvdWxk
IHBhcnRpY2lwYXRlIGluCidnaXQgbWVyZ2UnIHJlc29sdXRpb24gYXQgeW91ciBsZXZlbC4KCkkg
b25seSBzYXkgdGhpcyBiZWNhdXNlIHRoZSBsb3dlc3QgcG9pbnQgd2FzIHdoZW4gbWVyZ2luZyBD
SCdzIHNlcmllcwp0byBobW0uZ2l0IGNhdXNlZCBBbmRyZXcgdG8gaGF2ZSB0byBkbyBhIGxvdCBv
ZiB3b3JrIHJlYmFzaW5nIERhblcncwpzZXJpZXMgZHVyaW5nIHJjNy4gQXJndWFibHkgdGhhdCBz
aG91bGQgaGF2ZSBiZWVuIG15IHdvcmsgcHJlcGFyaW5nIGEKY29uZmxpY3QgcmVzb2x1dGlvbiBp
bnN0cnVjdGlvbiwgbm90IGhpcyBkb2luZyByZWJhc2VzLgoKLi4gYW5kIGlmIHdlIG5lZWRlZCB0
byByZXZpc2UgaG1tLmdpdCBEYW4ncyBzZXJpZXMgd291bGQgaGF2ZSBiZWVuIGF0Cm1vcmUgcmlz
ay4gSXQga2luZCBvZiBzdGlsbCBpcyBhcyBJIGhhdmVuJ3Qgc2VlbiBoaW0gQWNrIEFuZHJldydz
CnJlYmFzZSB5ZXQ/CgpUaGFua3MsCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
