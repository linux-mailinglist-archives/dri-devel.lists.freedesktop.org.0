Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6710F968
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6756E3F9;
	Tue,  3 Dec 2019 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5296E36F;
 Tue,  3 Dec 2019 02:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ct7UHaUPSpFaLIa6lPVbMcWaUiWA05081C1hoDvya0funM/PohZOzWoLdZVfjiJ9Gvq/lQaxG/QGiO2Y3Tu2VUaykrg0COxek9t1UesSBzWc/MfZGWxbJoTSvnTy88z8w9hKlifWmZgaq+hCRqDeW1HVRlEx4m8uHz5IQtc8Gc8smN0d5A48Oq8rVN/kFSVIb+8QoIvauo6MZKCv3wcrK/7h0v1rjY1K89jKn3MW8n6FILo45vNhnxM7Ae+1JM5QgRqe6WBtTaX3i3UB0vuPfvf3KmSGOWn9C5L3L05S/MBwo139BxWVy1NF8Ui1gypOr032sS43/aQXOKN/bMmYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G+Qqtza+y1neOxrnvHVHceJezEdg/XV3qQ42E8X/rA=;
 b=ayYeqldqNDeBnqIn72ZAGym1i3zPHGD0pvlHqbUfgnHu9DOta18VozRGoXqkJgqxeB9kjxPGc1RcdL+Um1xj343JTvJloDug0GtMTOYMsflJVEi6DVfV/pARknL16f7tsQUM60Ue4xnolrVW8funb8ZlEPdX0bv44ZeiSij4y4M6x2CCa2RJxP+Gu8tURxbLyD+CRKyjNoudzvsyVKuspQq/KnENDAlDJGFObMFA9hnTo7DO4mkj72jqw8FjYRwrP0OLY6ggDVuCHCIynSOvwiqKzQzTTtD3HZzHFvyotWeUoUAvXfv0pW4ZfcMiPLXCddLihYj7HD8PaHTqs1n3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6477.eurprd05.prod.outlook.com (20.179.26.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Tue, 3 Dec 2019 02:42:12 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 02:42:12 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVo9Dog/MtwM8aJU6I/7345tJKuKekCWkAgAAFfoCAA6/3AA==
Date: Tue, 3 Dec 2019 02:42:12 +0000
Message-ID: <20191203024206.GC5795@mellanox.com>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
In-Reply-To: <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:208:134::25) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [173.225.245.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9689ac42-e33a-4c6f-c9ab-08d7779a65fb
x-ms-traffictypediagnostic: VI1PR05MB6477:
x-microsoft-antispam-prvs: <VI1PR05MB64774132CBCB09497040C538CF420@VI1PR05MB6477.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:312;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(6486002)(4326008)(229853002)(186003)(6916009)(26005)(11346002)(2616005)(7416002)(76176011)(7736002)(66556008)(305945005)(3846002)(6116002)(256004)(14444005)(66066001)(71190400001)(71200400001)(2906002)(446003)(66476007)(66446008)(64756008)(66946007)(8936002)(81156014)(6436002)(5660300002)(1076003)(386003)(102836004)(52116002)(6506007)(53546011)(8676002)(33656002)(81166006)(6512007)(316002)(478600001)(14454004)(25786009)(86362001)(36756003)(99286004)(54906003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6477;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n+WH8HPf4I6ZRvacYs3zzF9Im+onpEnMe8sZ/II0AJdFNJBal5ox4StAIqEL3BE98sKh8ZFajT/V+Z6y0vweE6P/UAgUk9K7vbnTLHQtbJPdRnY/fbrjDwfBTU+tORo9Ud7P3L2cYGtBHhMzoSgvZjGkLVMVsvMOeT7/rlMIKYdnEea0jDh6yWuzZmwvhkbG37JcDbtD1kBx17erB2uX/wE08sX4hq2WtSl8ET0aNM4iRWdqdiiTtYINAlixx1jQSI6Bf9hOBoRP+vAe9PefqXoQ4oBor9QuqolMLIbKXDq05elsiVxAGze4El3K/fvxLh41iGThxgne9PMKHY4cCAyoC4Xwk2lvPT8sruhThzL2wSKJD7Nk1zdx8qpfdgdmTQqLSD92PHnjjdGOsOkY3qlP+EndvP6DTXRY304pT1E0PtZeUxglzvgHe4kOpW50
x-ms-exchange-transport-forked: True
Content-ID: <3389EC944B5C79428295421F186466CD@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9689ac42-e33a-4c6f-c9ab-08d7779a65fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 02:42:12.2119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H9FSlYEZp3/79VyfFiDDWMjZwGdPZPtlKcycRU/pZMZocaGQZVDXn+hDwerrFsdRUSLI2Zv/ulk/DAoI42tmXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6477
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G+Qqtza+y1neOxrnvHVHceJezEdg/XV3qQ42E8X/rA=;
 b=F4fcuyugYr+BrQlwnSQ4u939mvhC9j6lk6x7NnRRXvGy0IikPetWLo1x3KTMqar+nG5L+LKI2Hq0lO5Mp/xFH8Px/tHiM+Tx8TuQP4xtxL01xulkunsLUoTR7FmyA315VK9G1O1+Rch61Yio26MGx1Bc92NpM6auiO/Ro4sFSq8=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMTA6MjM6MzFBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMTA6MDMgQU0gTGludXMgVG9ydmFsZHMK
PiA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IEknbGwgdHJ5
IHRvIGZpZ3VyZSB0aGUgY29kZSBvdXQsIGJ1dCBteSBpbml0aWFsIHJlYWN0aW9uIHdhcyAieWVh
aCwKPiA+IG5vdCBpbiBteSBWTSIuCj4gCj4gV2h5IGlzIGl0IG9rIHRvIHNvbWV0aW1lcyBkbwo+
IAo+ICAgICBXUklURV9PTkNFKG1uaS0+aW52YWxpZGF0ZV9zZXEsIGN1cl9zZXEpOwo+IAo+ICh0
byBwYWlyIHdpdGggdGhlIHVubG9ja2VkIFJFQURfT05DRSksIGFuZCBzb21ldGltZXMgdGhlbiBk
bwo+IAo+ICAgICBtbmktPmludmFsaWRhdGVfc2VxID0gbW1uX21tLT5pbnZhbGlkYXRlX3NlcTsK
PiAKPiBNeSBpbml0aWFsIGd1ZXNzIHdhcyB0aGF0IGxhdHRlciBpcyBvbmx5IGRvbmUgYXQgaW5p
dGlhbGl6YXRpb24gdGltZSwKPiBidXQgYXQgbGVhc3QgaW4gb25lIGNhc2UgaXQncyBkb25lICph
ZnRlciogdGhlIG1uaSBoYXMgYmVlbiBhZGRlZCB0bwo+IHRoZSBtbW5fbW0gKG9oLCBob3cgSSBk
ZXNwaXNlIHRob3NlIG5hbWVzIC0gSSBjYW4gb25seSByZXBlYXQ6IFdURj8pLgoKWWVzLCB0aGUg
b25seSBvY2N1cnJlbmNlcyBhcmUgaW4gdGhlIG5vdGlmaWVyX2luc2VydCwgdW5kZXIgdGhlCnNw
aW5sb2NrLiBUaGUgb25lIGNhc2Ugd2hlcmUgaXQgaXMgb3V0IG9mIHRoZSBuYXR1cmFsIG9yZGVy
IHdhcyB0bwptYWtlIHRoZSBtYW5pcHVsYXRpb24gb2Ygc2VxIGEgYml0IHNhbmVyLCBidXQgaW4g
YWxsIGNhc2VzIHNpbmNlIHRoZQpzcGlubG9jayBpcyBoZWxkIHRoZXJlIGlzIG5vIHdheSBmb3Ig
YW5vdGhlciB0aHJlYWQgdG8gZ2V0IHRoZSBwb2ludGVyCnRvIHRoZSAnbW11X2ludGVydmFsX25v
dGlmaWVyIConIHRvIGRvIHRoZSB1bmxvY2tlZCByZWFkLgoKUmVnYXJkaW5nIHRoZSB1Z2x5IG5h
bWVzLi4gTmFtaW5nIGhhcyBiZWVuIHJlYWxseSBoYXJkIGhlcmUgYmVjYXVzZQpjdXJyZW50bHkg
ZXZlcnl0aGluZyBpcyBhICdtbXUgbm90aWZpZXInIGFuZCB0aGUgbmF0dXJhbCBhYmJlcnZpYXRp
b25zCmZyb20gdGhlcmUgYXJlIGNydW1teS4gSGVyZSBpcyB0aGUgYmFzaWMgc3VtbWFyeToKCnN0
cnVjdCBtbXVfbm90aWZpZXJfbW0gKGllIHRoZSBtbS0+bW11X25vdGlmaWVyX21tKQogICAtPiBt
bW5fbW0Kc3RydWN0IG1tX3N0cnVjdCAKICAgLT4gbW0Kc3RydWN0IG1tdV9ub3RpZmllciAoaWUg
dGhlIHVzZXIgc3Vic2NyaXB0aW9uIHRvIHRoZSBtbV9zdHJ1Y3QpCiAgIC0+IG1uCnN0cnVjdCBt
bXVfaW50ZXJ2YWxfbm90aWZpZXIgKHRoZSBvdGhlciBraW5kIG9mIHVzZXIgc3Vic2NyaXB0aW9u
KQogICAtPiBtbmkKc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAoaWUgdGhlIGFyZ3MgdG8gaW52
YWxpZGF0ZV9yYW5nZSkKICAgLT4gcmFuZ2UKCkkgY2FuIHNlbmQgYSBwYXRjaCB0byBzd2l0Y2gg
bW1uX21tIHRvIG1tdV9ub3RpZmllcl9tbSwgd2hpY2ggaXMgdGhlCm9ubHkgcHJlLWV4aXN0aW5n
IG5hbWUgZm9yIHRoaXMgdmFsdWUuIEJ1dCBJSVJDLCBpdCBpcyBhIHNvbWV3aGF0IHVnbHkKd2l0
aCBsb25nIGxpbmUgd3JhcHBpbmcuICdtbmknIGlzIGEgcGFpbiwgSSBoYXZlIHRvIHJlZmxlY3Qg
b24gdGhhdC4KKGhvbmVzbHksIEkgZGlzbGlrZSBtbXVfbm90aWZpZmVyX21tIHF1aXRlIGEgbG90
IHRvbykKCkkgdGhpbmsgaXQgd291bGQgYmUgb3ZlcmFsbCBuaWNlciB3aXRoIGJldHRlciBuYW1l
cyBmb3IgdGhlIG9yaWdpbmFsCnN0cnVjdHMuIFBlcmhhcHM6CgogbW1uXyogLSBNTVUgbm90aWZp
ZXIgcHJlZml4CiBtbW5fc3RhdGUgPC0gc3RydWN0IG1tdV9ub3RpZmllcl9tbQogbW1uX3N1YnNj
cmlwdGlvbiAobW1uX3N1YikgPC0gc3RydWN0IG1tdV9ub3RpZmllcgogbW1uX3JhbmdlX3N1YnNj
cmlwdGlvbiAobW1uX3JhbmdlX3N1YikgPC0gc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcgog
bW1uX2ludmFsaWRhdGVfZGVzYyA8LSBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlCgpBdCBsZWFz
dCB0aGlzIGlzIGhvdyBJIGRlc2NyaWJlIHRoZW0gaW4gbXkgbWluZC4uICBUaGlzIGlzIGEgbG90
IG9mCmNodXJuLCBhbmQgc3ByZWFkcyB0aHJvdWdoIG1hbnkgZHJpdmVycy4gVGhpcyBpcyB3aHkg
SSBrZXB0IHRoZSBuYW1lcwphcy1pcyBhbmQgd2UgZW5kZWQgdXAgd2l0aCB0aGUgYWxzbyBxdWl0
ZSBiYWQgJ21tdV9pbnRlcnZhbF9ub3RpZmllcicKCk1heWJlIGp1c3Qgc3dpdGNoIG1tdV9ub3Rp
Zmllcl9tbSBmb3IgbW1uX3N0YXRlIGFuZCBsZWF2ZSB0aGUgZHJpdmVycwphbG9uZT8KCkFueW9u
ZSBvbiB0aGUgQ0MgbGlzdCBoYXZlIGFkdmljZT8KCkphc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
