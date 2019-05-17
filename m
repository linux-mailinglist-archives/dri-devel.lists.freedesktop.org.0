Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC53220CB
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 01:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456AE897D7;
	Fri, 17 May 2019 23:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730076.outbound.protection.outlook.com [40.107.73.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3390897D7;
 Fri, 17 May 2019 23:50:36 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1167.namprd12.prod.outlook.com (10.169.204.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 23:50:32 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47%2]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 23:50:32 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: lima_bo memory leak after drm_sched job destruction rework
Thread-Topic: lima_bo memory leak after drm_sched job destruction rework
Thread-Index: AQHVDOetX+QTnVZgAECwos4LEdEqcqZvhWqAgABTtwCAACMYiA==
Date: Fri, 17 May 2019 23:50:32 +0000
Message-ID: <MWHPR12MB145383922FD0BDF21AFFCCB5EA0B0@MWHPR12MB1453.namprd12.prod.outlook.com>
References: <CAK4VdL2wa=UrpRqfML-ymkEX7LkE6FP3ykgNUQonLdjmaydq_Q@mail.gmail.com>
 <3f1a556e-dd4c-3dc7-b966-a63baf1e7c52@amd.com>,
 <CAK4VdL26tEkW+6fU4DaXa8pGAfpQ5TfgiwNhyHXq=EJh72ak=Q@mail.gmail.com>
In-Reply-To: <CAK4VdL26tEkW+6fU4DaXa8pGAfpQ5TfgiwNhyHXq=EJh72ak=Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.119.233.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28dcba1c-37f3-414c-6a58-08d6db227310
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1167; 
x-ms-traffictypediagnostic: MWHPR12MB1167:
x-microsoft-antispam-prvs: <MWHPR12MB11672510CFD4A6D9695FFEAEEA0B0@MWHPR12MB1167.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(39860400002)(136003)(396003)(199004)(189003)(52314003)(476003)(6246003)(6116002)(55016002)(71200400001)(486006)(33656002)(2906002)(5660300002)(81156014)(25786009)(99286004)(66066001)(71190400001)(3846002)(8936002)(4326008)(8676002)(68736007)(52536014)(53936002)(54906003)(81166006)(6506007)(7416002)(53546011)(9686003)(256004)(14444005)(72206003)(26005)(316002)(14454004)(102836004)(6916009)(186003)(305945005)(66946007)(66446008)(446003)(11346002)(7736002)(74316002)(6436002)(73956011)(66556008)(76116006)(64756008)(478600001)(66476007)(7696005)(76176011)(86362001)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1167;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bYO97L9m2tQXGk4dEQ6K6iHKjp3/tPl8s3tki+fE5ZFwcAlevyAzPhcRvElNATMbWT97qbuaatUaqpOWZngMOPl40WfZbeG5p5Lz44FPiZhV5ZqDww3kp7RYqZZj8W/KcOkx8P0JPXVCcdfSu+p30mjtQoqQXhzuZWl/NB6cb0/ZhUEwXkglrBadrOWbczd1Qa79B/EWQDZreJjGDsg3nPIzOFu7i85B426qb0FG/m1uJniZ3WFoKOq+CYMQH54n6OXC3TRrpG+JyhUgdWidkB6mAHgq241+tUo9AF6XCVHan3+EpdSsG9h7JiVqcQd/9Dg8fnNA88SDBy1v27O8s1HABis3cgei8URtyJhPAJI1LPFgC8b7dSIpR3ss7/cOfdjILGq2A3El/Ul83ny/EKa9KJWeZE79PIn3QqMFSE0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dcba1c-37f3-414c-6a58-08d6db227310
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 23:50:32.3078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJ0kvGZ4kVCi/sT5LVMzoO9vtuv2xA8cjK9YZ2JxYbc=;
 b=QAPhaP0msoOhv4uPfZPlMWJE4zp7jaebIuK2N+eDY7D/6s3Z0LqFsbcQZPtwjhVqP/yjUAoHoTS10lEfavob8d70t+NIk6wRpIupgDbDo5iE+AK7s4OH/DNN/K9niKx9mTIZHUpjyjIh9lEx97kwNKrDKxGq9WCzVfx6evJ+k3g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uJ3QgaGF2ZSB0aGUgY29kZSBpbiBmcm9udCBvZiBtZSBub3cgYnV0IGFzIGZhciBhcyBJIHJl
bWVtYmVyIGl0IHdpbGwgb25seSBwcmVtYXR1cmVseSB0ZXJtaW5hdGUgaW4gZHJtX3NjaGVkX2Ns
ZWFudXBfam9icyBpZiB0aGVyZSBpcyB0aW1lb3V0IHdvcmsgaW4gcHJvZ3Jlc3Mgd2hpY2ggd291
bGQgbm90IGJlIHRoZSBjYXNlIGlmIG5vdGhpbmcgaGFuZ3MuCgpBbmRyZXkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTogRXJpY28gTnVuZXMgPG51bmVzLmVy
aWNvQGdtYWlsLmNvbT4KU2VudDogMTcgTWF5IDIwMTkgMTc6NDI6NDgKVG86IEdyb2R6b3Zza3ks
IEFuZHJleQpDYzogRGV1Y2hlciwgQWxleGFuZGVyOyBLb2VuaWcsIENocmlzdGlhbjsgWmhvdSwg
RGF2aWQoQ2h1bk1pbmcpOyBEYXZpZCBBaXJsaWU7IERhbmllbCBWZXR0ZXI7IEx1Y2FzIFN0YWNo
OyBSdXNzZWxsIEtpbmc7IENocmlzdGlhbiBHbWVpbmVyOyBRaWFuZyBZdTsgUm9iIEhlcnJpbmc7
IFRvbWV1IFZpem9zbzsgRXJpYyBBbmhvbHQ7IFJleCBaaHU7IEh1YW5nLCBSYXk7IERlbmcsIEVt
aWx5OyBOYXlhbiBEZXNobXVraDsgU2hhcmF0IE1hc2V0dHk7IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW1hQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTdWJqZWN0OiBSZTogbGltYV9ibyBtZW1vcnkgbGVhayBhZnRlciBkcm1f
c2NoZWQgam9iIGRlc3RydWN0aW9uIHJld29yawoKW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQoK
T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTA6NDMgUE0gR3JvZHpvdnNreSwgQW5kcmV5CjxBbmRy
ZXkuR3JvZHpvdnNreUBhbWQuY29tPiB3cm90ZToKPiBPbiA1LzE3LzE5IDM6MzUgUE0sIEVyaWNv
IE51bmVzIHdyb3RlOgo+ID4gTGltYSBjdXJyZW50bHkgZGVmYXVsdHMgdG8gYW4gImluZmluaXRl
IiB0aW1lb3V0LiBTZXR0aW5nIGEgNTAwbXMKPiA+IGRlZmF1bHQgdGltZW91dCBsaWtlIG1vc3Qg
b3RoZXIgZHJtX3NjaGVkIHVzZXJzIGRvIGZpeGVkIHRoZSBsZWFrIGZvcgo+ID4gbWUuCj4KPiBJ
IGFtIG5vdCB2ZXJ5IGNsZWFyIGFib3V0IHRoZSBwcm9ibGVtIC0gc28geW91IGJhc2ljYWxseSBu
ZXZlciBhbGxvdyBhCj4gdGltZSBvdXQgaGFuZGxlciB0byBydW4gPyBBbmQgdGhlbiB3aGVuIHRo
ZSBqb2IgaGFuZ3MgZm9yIGV2ZXIgeW91IGdldAo+IHRoaXMgbWVtb3J5IGxlYWsgPyBIb3cgaXQg
d29ya2VkIGZvciB5b3UgYmVmb3JlIHRoaXMgcmVmYWN0b3JpbmcgPyBBcwo+IGZhciBhcyBJIHJl
bWVtYmVyICBzY2hlZC0+b3BzLT5mcmVlX2pvYiBiZWZvcmUgdGhpcyBjaGFuZ2Ugd2FzIGNhbGxl
ZAo+IGZyb20gZHJtX3NjaGVkX2pvYl9maW5pc2ggd2hpY2ggaXMgdGhlIHdvcmsgc2NoZWR1bGVk
IGZyb20gSFcgZmVuY2UKPiBzaWduYWxlZCBjYWxsYmFjayAtIGRybV9zY2hlZF9wcm9jZXNzX2pv
YiBzbyBpZiB5b3VyIGpvYiBoYW5ncyBmb3IgZXZlcgo+IGFueXdheSBhbmQgdGhpcyB3b3JrIGlz
IG5ldmVyIHNjaGVkdWxlZCAgd2hlbiB5b3VyIGZyZWVfam9iIGNhbGxiYWNrIHdhcwo+IGNhbGxl
ZCA/CgpJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGpvYnMgcnVuIHN1Y2Nlc3NmdWxseSwg
bm90aGluZyBoYW5ncy4KTGltYSBjdXJyZW50bHkgc3BlY2lmaWVzIGFuICJpbmZpbml0ZSIgdGlt
ZW91dCB0byB0aGUgZHJtIHNjaGVkdWxlciwKc28gaWYgYSBqb2IgZGlkIGRpZCBoYW5nLCBpdCB3
b3VsZCBoYW5nIGZvcmV2ZXIsIEkgc3VwcG9zZS4gQnV0IHRoaXMKaXMgbm90IHRoZSBpc3N1ZS4K
CklmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgaXQgd29ya2VkIHdlbGwgYmVmb3JlIHRoZSByZXdv
cmsgYmVjYXVzZSB0aGUKY2xlYW51cCB3YXMgdHJpZ2dlcmVkIGF0IHRoZSBlbmQgb2YgZHJtX3Nj
aGVkX3Byb2Nlc3Nfam9iCmluZGVwZW5kZW50bHkgb24gdGhlIHRpbWVvdXQuCgpXaGF0IEknbSBv
YnNlcnZpbmcgbm93IGlzIHRoYXQgZXZlbiB3aGVuIGpvYnMgcnVuIHN1Y2Nlc3NmdWxseSwgdGhl
eQphcmUgbm90IGNsZWFuZWQgYnkgdGhlIGRybSBzY2hlZHVsZXIgYmVjYXVzZSBkcm1fc2NoZWRf
Y2xlYW51cF9qb2JzCnNlZW1zIHRvIGdpdmUgdXAgYmFzZWQgb24gdGhlIHN0YXR1cyBvZiBhIHRp
bWVvdXQgd29ya2VyLgpJIHdvdWxkIGV4cGVjdCB0aGUgdGltZW91dCB2YWx1ZSB0byBvbmx5IGJl
IHJlbGV2YW50IGluIGVycm9yL2h1bmcgam9iIGNhc2VzLgoKSSB3aWxsIHByb2JhYmx5IHNldCB0
aGUgdGltZW91dCB0byBhIHJlYXNvbmFibGUgdmFsdWUgYW55d2F5LCBJIGp1c3QKcG9zdGVkIGhl
cmUgdG8gcmVwb3J0IHRoYXQgdGhpcyBjYW4gcG9zc2libHkgYmUgYSBidWcgaW4gdGhlIGRybQpz
Y2hlZHVsZXIgYWZ0ZXIgdGhhdCByZXdvcmsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
