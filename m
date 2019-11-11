Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EFBF6D74
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 05:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298A66E11B;
	Mon, 11 Nov 2019 04:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790048.outbound.protection.outlook.com [40.107.79.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC206E11B;
 Mon, 11 Nov 2019 04:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtKOLWbFeA6bfWSDCO+FJGL2ejRWXHZTbO5ntsZmm3oYv6bZzZC6VqhElz9VU3DgBjwSb0QskYHLhBOg+5gIRonMEKSwUFAyTpeho/6Z1+IqvsSTVXUaRru7SF7vMxVvDL20xm4bBsaG3KH0EiPHc30B5SoLSfdP1xO1jX7QzNAp61ujAlkzkAZVf7dqTmVSo9hfUDsGruOSC/ixCL+xWsrwz9QHT/as99wVj3uoP2hXpIP0CaDkyU0UrP30UKtA/YXwdKNgjGN0nYH39Nz1Wmyf7VWUepWbMNafD7oUXp6vOeyx28eHnaOoKU5QB7dzSUBnzxrttw0N78tG5b3TUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmsgDbQCwed0PuC98BhS+3R7SgyQNzLn+Sfy2z/RQ+U=;
 b=XaESVVrmybFGpSByUdRqu1fXjGZnSkbsykJo0zphRMqFa9bU11nz449Lj5XdYQ49+j2Id9ExXLTVlMkf/BCmvil1V4x6dVxZdn8XFh0rWCm7Cv8+7H0gdS/Li0c4E/ITyiPjE6BsNzO9pH27U5xVcOdU0dUy8HbfSoW5lr124N/93IqfQefPusMxfwRi5RGfulIYDMhwd5fZAHyznX9+GzMDk7BwRzUTqW7fM4fPTJ973y6NZdQ2Ox9HvsGVivbxAKGjXvx38NC/AOwQVuVdKxOQgVHF7RMrNWHtpXf4LbzVltFr4xmwUNPDLYEMAYongpRKfVrfqRgUgDQmALAtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3422.namprd12.prod.outlook.com (20.178.243.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Mon, 11 Nov 2019 04:04:44 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587%7]) with mapi id 15.20.2430.023; Mon, 11 Nov 2019
 04:04:43 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: zhengbin <zhengbin13@huawei.com>, "rex.zhu@amd.com" <rex.zhu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 0/2] remove some set but not used variables in hwmgr
Thread-Topic: [PATCH 0/2] remove some set but not used variables in hwmgr
Thread-Index: AQHVmEGF1qg2XdNhj0msE/T5s79sbKeFWYIw
Date: Mon, 11 Nov 2019 04:04:43 +0000
Message-ID: <MN2PR12MB3344DA10AF60C2C0E8D9FD0EE4740@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <1573443956-76489-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1573443956-76489-1-git-send-email-zhengbin13@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 30006f89-ea39-488e-2b1f-08d7665c48b7
x-ms-traffictypediagnostic: MN2PR12MB3422:|MN2PR12MB3422:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3422AFE20AB686628E424520E4740@MN2PR12MB3422.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(13464003)(8676002)(9686003)(8936002)(256004)(446003)(81156014)(81166006)(2906002)(11346002)(26005)(2501003)(186003)(55016002)(6246003)(476003)(486006)(6116002)(3846002)(6436002)(74316002)(66066001)(305945005)(76116006)(66946007)(99286004)(76176011)(33656002)(66446008)(64756008)(66556008)(66476007)(478600001)(102836004)(110136005)(4744005)(86362001)(71200400001)(316002)(6506007)(53546011)(7696005)(2201001)(71190400001)(7736002)(229853002)(5660300002)(52536014)(25786009)(14454004)(17423001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3422;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g5AuuSrjOsE3XEemorHtse/mr5gCSjoaCvUPNknbvJZp+Gq2itac/wSNXntyQgCbb1MYh3bpENZGQcYZCGnnd0vHuiw9Np7pJRjVFVxPUPWUkbUhAvEdPVgPRxzWkcgryQdT1aA4P5Gw0ok2R9GpdUPrLQBODY4ekGxqvn23NaJ+sz3A/JJeLQn9MgyqSERRwTJlCdXfaAIOIB6ZFIY9TGbqDUYfwJGgSgfp9oPvL4iiJmEqfgehs46AG0W239DAm+wotX0kKQVMz45B9n/9GgSDBNtp5AiXGvVFiphqE8+jB3L5eRIyewD2SwN4/cRBLRg+2f9Ll+x2AFvHcdQd+34nv3eJ5kSDh3WTJruLBONTEdB9BZEtrEcx8+mO1WwYlDmAq+4FH7joEXc+91vj40SMKRnQ6JMkQnK1wiQn6dIlpP3NXp+Efts4qQ94yHXK
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30006f89-ea39-488e-2b1f-08d7665c48b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 04:04:43.6734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cpzH4x570AtDEqIZxAHP4M0RzTxGKhvabdi5TkJLaoyhuU63YKDUZKQmyvIghwGu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmsgDbQCwed0PuC98BhS+3R7SgyQNzLn+Sfy2z/RQ+U=;
 b=0eg7/hQggjGwjySEd9Skk8BbUPz1l2dRtb6xvBciPj+Fn9lA+9w4sVPrqEeNCzyt/0l629noTwecJzrJ9V8TqT9l831JQsvSfjhBJYZ/PJnCkfdOX1Rm1yzg3nQ7bnR9rUDUqyBtrjgHe6/gV/SvL6ME+jsF/9l7NZnpBKZ0uck=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIHJldmlld2VkLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgoKPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1
YXdlaS5jb20+Cj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxMSwgMjAxOSAxMTo0NiBBTQo+IFRv
OiByZXguemh1QGFtZC5jb207IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgRGV1Y2hl
ciwKPiBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlz
dGlhbgo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykK
PiA8RGF2aWQxLlpob3VAYW1kLmNvbT47IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5j
aDsgYW1kLQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogemhlbmdiaW4xM0BodWF3ZWkuY29tCj4gU3ViamVjdDogW1BBVENI
IDAvMl0gcmVtb3ZlIHNvbWUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZXMgaW4gaHdtZ3IKPiAK
PiB6aGVuZ2JpbiAoMik6Cj4gICBkcm0vYW1kL3Bvd2VycGxheTogcmVtb3ZlIHNldCBidXQgbm90
IHVzZWQgdmFyaWFibGUKPiAgICAgJ3ZiaW9zX3ZlcnNpb24nLCdkYXRhJwo+ICAgZHJtL2FtZC9w
b3dlcnBsYXk6IHJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlICdkYXRhJwo+IAo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgICB8IDQgLS0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8
IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+IAo+IC0tCj4gMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
