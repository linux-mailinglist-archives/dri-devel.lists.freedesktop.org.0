Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA7DC0ACB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 20:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A076E1B4;
	Fri, 27 Sep 2019 18:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680089.outbound.protection.outlook.com [40.107.68.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989DA6E1B5;
 Fri, 27 Sep 2019 18:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+vd1kz+RgUsE4OoovBMTvu+2cvaUqjItntke3TjvPIw0g9DrO0z0sQwTfbAeyExBXsAzaZqbUQkKUbswIklwEvEdEzgDMC3jaOoqe9sgmcYWaI39p+6vcr70gH+UFaB8nScR1nf4wdAU49pmh87oztArvtLL3ce0h6gpkTBL4BS8crtHnGELA1EAZenWVvtMkrWu4uoF1JuyjNBdniITGyNpIEuUXhjNjuSi8a8rlWpos1UVJpdzjOBxOY/FCICrZ53F39WirN3P6XMv4ZB5dzzwr3xRSVI7lkikUCoWSjLj6fJqbUlEJwSMX9zrH1YE5HxO/ctZZ95j0txrZs7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPat4LXCfV5PW4jSbB8+j2mVp7lUmtbbw+BZylm5fpI=;
 b=IibqEbVlxuHlvnKFRzLBsedFr8xB+6Y35w+snTHT3/UUa2HOqI6sBhmx4jUl+xawRsxiWNTderwmcffeedLplbWJnhSA8W68HYiarV9fSM2vMl2/lapszb8xZcekJdK0gQxnBXy694RRe1+Wz19UCWtPR3u7HbpFY3kDBpq4Jr+i5ye3cmPiBZkd+q7UQUs5AuzqqtDJVlKhIsL/Omns68gyWN2AZvgffGWjdSuhfJzI4x60lp1c9xYcU8qus+fN2Gl3TnHAkxSsVMjnXEueNmXolvDV+WpOo8BkdjwYXKePe0apYDG2WCBMLiPrvhObrZQN9UqnBEoIXs1fWGrM2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 27 Sep 2019 18:08:57 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 18:08:57 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] Is Nouveau really using the io_reserve_lru?
Thread-Topic: [Nouveau] Is Nouveau really using the io_reserve_lru?
Thread-Index: AQHVdV6hrJUAYE7wHEeHyc1Qzxp5tw==
Date: Fri, 27 Sep 2019 18:08:57 +0000
Message-ID: <8c6a9a06-73f1-41ef-878e-ebbc39282bc8@email.android.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:908:1252:fb60:6d9f:721b:870c:bf05]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d0b90e7-eaf4-4116-e1ca-08d74375c41a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2376:
x-microsoft-antispam-prvs: <DM5PR12MB2376962B9158364805D1A81583810@DM5PR12MB2376.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(189003)(199004)(305945005)(71200400001)(81156014)(76116006)(486006)(91956017)(6116002)(86362001)(8936002)(31696002)(478600001)(66946007)(54906003)(476003)(7736002)(186003)(31686004)(14454004)(6246003)(66476007)(25786009)(2171002)(66556008)(66446008)(64756008)(99286004)(316002)(2906002)(46003)(256004)(229853002)(6916009)(6436002)(4326008)(5660300002)(6506007)(6486002)(53546011)(102836004)(9686003)(8676002)(66574012)(71190400001)(6512007)(81166006)(54896002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2376;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qNvqGVZybl+naPDoi/MbWD7D0Z6xG8JvlK6RVkHp+wsPSRDemsYT/oTp4qaUeSLNW96CMRhO3u65jdkZpr+9qWXJOAOo7sNqKLUorgqe/3sN20qweDm1tklC+AmDAL0zK928MJ/c9qaAnI5zKXAFNHbHLb4szwaWCK6ZYwmZlNBiCMF2HWfMufTjNY4PaafoFC1jOfm8zgz5iZTNou8PVi82awdUojwpAWK7pt/7VP16VoGIzyRuB5LkmtVYoOXoIzYiviLkEAVmodf9prNAp+yHNIYbpR3CvJ46dYen2gCzPqLgahCrshToZB+E8iOlYAwdUhk9/pAybvM8suqKRVsfsdnRY/wQXNDVPrrZBV+xd8IbtUFFoBzQgYWa626KIGhnwpbeyV9rdqIZdImO7hFbRtpaG6X5TZUN4y15Yh4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0b90e7-eaf4-4116-e1ca-08d74375c41a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 18:08:57.5315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BcDtyXSw/iMwEBkaVXUGHdORyn01IM5ke1u4Zm/wTLEFvBaIUnjiTqUxYkV5fAqG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2376
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPat4LXCfV5PW4jSbB8+j2mVp7lUmtbbw+BZylm5fpI=;
 b=MaX0hvEJQwiuk+c5GCIWC+BZbwubVCqrwXfE96VuPyfIo4O25V0A7f2b3s0lkALugMoOeIEmaHGBtpBxMpUhpy/I6k8yAel30Jc5mmGvsDSTnzZdjYLVEx+fSGd2yIqsq9eWgpHWS13fBXfCYehcoDoO5f+34D5Y8rUeLmJdLAc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Dave Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Ben Skeggs <skeggsb@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1674257091=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1674257091==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_8c6a9a0673f141ef878eebbc39282bc8emailandroidcom_"

--_000_8c6a9a0673f141ef878eebbc39282bc8emailandroidcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjA5LjIwMTkgMjA6MDcgc2NocmllYiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVt
Lm1pdC5lZHU+Og0KT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNTo0NCBQTSBCZW4gU2tlZ2dzIDxz
a2VnZ3NiQGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IE9uIFR1ZSwgMjQgU2VwIDIwMTkgYXQgMjI6
MTksIENocmlzdGlhbiBLw7ZuaWcNCj4gPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29t
PiB3cm90ZToNCj4gPg0KPiA+IEhpIGd1eXMsDQo+ID4NCj4gPiB3aGlsZSB3b3JraW5nIHRocm91
Z2ggbW9yZSBvbGQgVFRNIGZ1bmN0aW9uYWxpdHkgSSBzdHVtYmxlZCBvdmVyIHRoZQ0KPiA+IGlv
X3Jlc2VydmVfbHJ1Lg0KPiA+DQo+ID4gQmFzaWMgaWRlYSBpcyB0aGF0IHdoZW4gdGhpcyBmbGFn
IGlzIHNldCB0aGUgZHJpdmVyLT5pb19tZW1fcmVzZXJ2ZSgpDQo+ID4gY2FsbGJhY2sgY2FuIHJl
dHVybiAtRUFHQUlOIHJlc3VsdGluZyBpbiB1bm1hcHBpbmcgb2Ygb3RoZXIgQk9zLg0KPiA+DQo+
ID4gQnV0IE5vdXZlYXUgZG9lc24ndCBzZWVtIHRvIHJldHVybiAtRUFHQUlOIGluIHRoZSBjYWxs
IHBhdGggb2YNCj4gPiBpb19tZW1fcmVzZXJ2ZSBhbnl3aGVyZS4NCj4gSSBiZWxpZXZlIHRoaXMg
aXMgYSBidWcgaW4gTm91dmVhdS4gIFdlICpzaG91bGQqIGJlIHJldHVybmluZyAtRUFHQUlODQo+
IGlmIHdlIGZhaWwgdG8gZmluZCBzcGFjZSBpbiBCQVIxIHRvIG1hcCB0aGUgQk8gaW50by4NCg0K
Q291bGQgdGhpcyBsZWFkIHRvIFNJR0JVUyBpbiB1c2Vyc3BhY2UsIGVzcCByZWxhdGVkIHRvIHJl
c3VtZSBhbmQNCnNpbWlsYXIgc2l0dWF0aW9ucz8NCg0KWWVzLCBJIHdvdWxkIHNheSB0aGF0J3Mg
ZXhhY3RseSB3aGF0IHdvdWxkIGhhcHBlbi4NCg0KQ2hyaXN0aWFuLg0KDQpBIHVzZXIgaGFzIGJl
ZW4gZXhwZXJpZW5jaW5nIHRoaXMgaW4gYQ0KdHJpY2t5LXRvLXJlcHJvZHVjZSBzY2VuYXJpbyB3
aXRoIGEgdG9uIG9mIHZyYW0gZGVkaWNhdGVkIHRvDQpmcmFtZWJ1ZmZlcnMgYW5kIHNvIG9uICgz
eCA0SyksIGFuZCB0aGUgbm91dmVhdSBkZHggZmFsbHMgYmFjayB0bw0KbWVtY3B5IGluIGNlcnRh
aW4gY2FzZXMuDQoNCiAgLWlsaWENCg0K

--_000_8c6a9a0673f141ef878eebbc39282bc8emailandroidcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D0D4A30C1B42F546A91BC7BCFFD8C316@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBkaXI9ImF1
dG8iPg0KPGRpdj48YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPg0KPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPkFtIDI3LjA5LjIwMTkgMjA6MDcgc2NocmllYiBJbGlhIE1pcmtpbiAm
bHQ7aW1pcmtpbkBhbHVtLm1pdC5lZHUmZ3Q7OjxiciB0eXBlPSJhdHRyaWJ1dGlvbiI+DQo8Ymxv
Y2txdW90ZSBjbGFzcz0icXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+PGZvbnQgc2l6ZT0iMiI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij4NCjxkaXY+T24gVGh1LCBTZXAgMjYsIDIwMTkg
YXQgNTo0NCBQTSBCZW4gU2tlZ2dzICZsdDtza2VnZ3NiQGdtYWlsLmNvbSZndDsgd3JvdGU6PGJy
Pg0KJmd0Ozxicj4NCiZndDsgT24gVHVlLCAyNCBTZXAgMjAxOSBhdCAyMjoxOSwgQ2hyaXN0aWFu
IEvDtm5pZzxicj4NCiZndDsgJmx0O2Nrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tJmd0
OyB3cm90ZTo8YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgSGkgZ3V5cyw8YnI+DQomZ3Q7
ICZndDs8YnI+DQomZ3Q7ICZndDsgd2hpbGUgd29ya2luZyB0aHJvdWdoIG1vcmUgb2xkIFRUTSBm
dW5jdGlvbmFsaXR5IEkgc3R1bWJsZWQgb3ZlciB0aGU8YnI+DQomZ3Q7ICZndDsgaW9fcmVzZXJ2
ZV9scnUuPGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7IEJhc2ljIGlkZWEgaXMgdGhhdCB3
aGVuIHRoaXMgZmxhZyBpcyBzZXQgdGhlIGRyaXZlci0mZ3Q7aW9fbWVtX3Jlc2VydmUoKTxicj4N
CiZndDsgJmd0OyBjYWxsYmFjayBjYW4gcmV0dXJuIC1FQUdBSU4gcmVzdWx0aW5nIGluIHVubWFw
cGluZyBvZiBvdGhlciBCT3MuPGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0OyAmZ3Q7IEJ1dCBOb3V2
ZWF1IGRvZXNuJ3Qgc2VlbSB0byByZXR1cm4gLUVBR0FJTiBpbiB0aGUgY2FsbCBwYXRoIG9mPGJy
Pg0KJmd0OyAmZ3Q7IGlvX21lbV9yZXNlcnZlIGFueXdoZXJlLjxicj4NCiZndDsgSSBiZWxpZXZl
IHRoaXMgaXMgYSBidWcgaW4gTm91dmVhdS4mbmJzcDsgV2UgKnNob3VsZCogYmUgcmV0dXJuaW5n
IC1FQUdBSU48YnI+DQomZ3Q7IGlmIHdlIGZhaWwgdG8gZmluZCBzcGFjZSBpbiBCQVIxIHRvIG1h
cCB0aGUgQk8gaW50by48YnI+DQo8YnI+DQpDb3VsZCB0aGlzIGxlYWQgdG8gU0lHQlVTIGluIHVz
ZXJzcGFjZSwgZXNwIHJlbGF0ZWQgdG8gcmVzdW1lIGFuZDxicj4NCnNpbWlsYXIgc2l0dWF0aW9u
cz8gPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8
L2Rpdj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1
dG8iPlllcywgSSB3b3VsZCBzYXkgdGhhdCdzIGV4YWN0bHkgd2hhdCB3b3VsZCBoYXBwZW4uPC9k
aXY+DQo8ZGl2IGRpcj0iYXV0byI+PGJyPg0KPC9kaXY+DQo8ZGl2IGRpcj0iYXV0byI+Q2hyaXN0
aWFuLjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8iPjxicj4NCjwvZGl2Pg0KPGRpdiBkaXI9ImF1dG8i
Pg0KPGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPg0KPGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPg0K
PGJsb2NrcXVvdGUgY2xhc3M9InF1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2Pjxmb250IHNpemU9
IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdCI+DQo8ZGl2PkEgdXNlciBoYXMgYmVlbiBl
eHBlcmllbmNpbmcgdGhpcyBpbiBhPGJyPg0KdHJpY2t5LXRvLXJlcHJvZHVjZSBzY2VuYXJpbyB3
aXRoIGEgdG9uIG9mIHZyYW0gZGVkaWNhdGVkIHRvPGJyPg0KZnJhbWVidWZmZXJzIGFuZCBzbyBv
biAoM3ggNEspLCBhbmQgdGhlIG5vdXZlYXUgZGR4IGZhbGxzIGJhY2sgdG88YnI+DQptZW1jcHkg
aW4gY2VydGFpbiBjYXNlcy48YnI+DQo8YnI+DQombmJzcDsgLWlsaWE8YnI+DQo8L2Rpdj4NCjwv
c3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxicj4NCjwvZGl2Pg0K
PC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_8c6a9a0673f141ef878eebbc39282bc8emailandroidcom_--

--===============1674257091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1674257091==--
