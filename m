Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CBDE7320
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 15:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA566E88D;
	Mon, 28 Oct 2019 14:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780075.outbound.protection.outlook.com [40.107.78.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C7A6E886;
 Mon, 28 Oct 2019 14:00:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5Z/XoiFbsSK9sSlEWZ4XCuv4mFqCbmpd+FmaScNL/m4v+5mE7dym3ZMaGhBxbJElFNIeXC53vv7O10yzphDJOuaU9Q9t3Je/OmCIV0y3voQTmmm0Gm5CS2FXQ+Vnax8GGA/krH7Lid73f5BUe3Tv3/aL7bTUtqPKXtW0WFcCakM5WU3NLHEeYwQO/zzZP37Uk9485K6aWlhy+TKVWV9DIWejRrQqQ8vzcblZhLl/3wnd9h4B81oj5QsnWqbW+uA1UMjqqP16fwKCiA2sIgG8PtIdzdKI41l+edf98QH1KmCJjjwZYSxHteHFp6a3J89UYihve0VyYE1K6kjOURo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5P+o/+KL5F6YZxAJ0csvveq2JosIkU9NLAMFjAFHRM=;
 b=AwSMlFluOnfrjkCtVWMyi0zIkcBlOivQPjy3VeJ1L97e4pbKc1wQokRqFeiChbWGowNize4c2bIBJhiFa+NMtHT6Ox/jbKYVL9qLvNmFCSMRFqCvDnkpiDL5/R1dY/MXe6dASQOe/P0lBaxsd8leq83iGbrvh3BMFZ9z4QFmFAJCQrO1JVxa/7+bypx9swmUCCxBloruMKOuAUroIDgYGfZxGyF3d6vyQ41nKQDupipOTmq+R7DtoCHJ5QTXPvOu/Ey+Z/Vcxkmq3uSteL6gQQ23M4UrlUuh7e4nIlPCshmnMKY9f99cF4NF1dd8cFYN5X8D01OpMXoMGp1o67QbFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2834.namprd12.prod.outlook.com (20.176.178.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Mon, 28 Oct 2019 14:00:40 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::c9fd:22d8:cfdb:f430]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::c9fd:22d8:cfdb:f430%5]) with mapi id 15.20.2387.025; Mon, 28 Oct 2019
 14:00:40 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "zhengbin (A)" <zhengbin13@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] drm/amd/display/dc/dce: remove some not used variables
Thread-Topic: [PATCH 0/3] drm/amd/display/dc/dce: remove some not used
 variables
Thread-Index: AQHVfmlUyxo3BJ62eE+bIDLxLqIijadv6GAAgABK84A=
Date: Mon, 28 Oct 2019 14:00:40 +0000
Message-ID: <eb72326f-aadc-c6c0-582f-570bb3d6e999@amd.com>
References: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
 <96590591-d35f-6553-1b93-6d69a043590a@huawei.com>
In-Reply-To: <96590591-d35f-6553-1b93-6d69a043590a@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::31) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d124224f-4650-496a-0309-08d75baf370e
x-ms-traffictypediagnostic: BN7PR12MB2834:|BN7PR12MB2834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB28344FDDEAA9CF81A99D16E982660@BN7PR12MB2834.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(450100002)(66946007)(6116002)(3846002)(25786009)(86362001)(256004)(6512007)(486006)(8676002)(8936002)(66446008)(26005)(64756008)(446003)(476003)(2906002)(66066001)(66556008)(52116002)(110136005)(2501003)(478600001)(2201001)(99286004)(31686004)(71200400001)(14454004)(71190400001)(53546011)(2616005)(386003)(6486002)(4001150100001)(5660300002)(102836004)(11346002)(76176011)(6506007)(6246003)(36756003)(31696002)(186003)(81166006)(81156014)(4744005)(7736002)(229853002)(305945005)(66476007)(316002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2834;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/k41niOp/TO3j5bKsHDq2Q1m9+McDwT/XoKljxoJwsjP1ugYYeGdVABreXPqioTEtos4RWQui9mY8fXX2/LrHTfwUTNdjHE8Oopm1+FmodSWyMStdotWNFvu6N9h3H/UV+DrJLQN6ZqV7AoUsFdO0CpNjTu/b+em4nF4GT3BpxjiFlEYiFGchs8292TPqcbju7SBzJd69wke5DTNXD7GqnQnYEz9B/njWLyCMa3NVclxJ9Dg3opTSR0oeHJSYcVx3k5/wHkKEy69e+j6JALrT+Us8/zvKKPVw//Kuz3UxqzZYc3bFw/b0VY61rPPFo01qmI59oma9gDOemIDbl62KW1aT5S2OobDr28OgaGzZpl4zss3NEykFBLsQ3CyDqolXK7USytHqCntPXSP/bHl61KXcppf6nKH8FCp9bthkSPsfbRDYFYOrFX605OVKXn
Content-ID: <206534724AC05845992917709BE0F746@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d124224f-4650-496a-0309-08d75baf370e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 14:00:40.0532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4pkqkQrYFZtl5KRKXANPkw7MJhpW+CXclQ8DBrZpiblMo4YRlTdmxwOG4Ua0kCH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2834
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5P+o/+KL5F6YZxAJ0csvveq2JosIkU9NLAMFjAFHRM=;
 b=u3YmFTzQjgdWw7tdk4QeEIROL2lQrGI+aLAwUwUpzTdVvfZFv2r5V5BA0BULGs5PqJbfeosNhmAhBdEfRMs6QLeT3RuC/NDUxIEgEXiU/P8yDXnbEHQ7FthltUmP7NCc0wdRs3gIAj0oOFAtbuCRNZtOHvQ/gjsNyFdNLTCKjBU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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

SGkgWmhlbmcsDQoNCkhhcnJ5J3MgcHJldmlvdXMgY29tbWVudCBhYm91dCB0aGUgc3VwZXJmbHVv
dXMgUkVHX1JFQUQoKXMgaXMgc3RpbGwgdW5hZGRyZXNzZWQuDQpPbmNlIHRoYXQncyBmaXhlZCwg
SSBjYW4gZ2l2ZSBteSByLWIuDQoNClRoYW5rcywNCkxlbw0KDQoNCk9uIDIwMTktMTAtMjggNToz
MiBhLm0uLCB6aGVuZ2JpbiAoQSkgd3JvdGU6DQo+IHBpbmcNCj4gDQo+IE9uIDIwMTkvMTAvOSAx
NDoyNSwgemhlbmdiaW4gd3JvdGU6DQo+PiB6aGVuZ2JpbiAoMyk6DQo+PiAgIGRybS9hbWQvZGlz
cGxheTogUmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGVzDQo+PiAgICAgJ2JsX3B3bV9j
bnRsJywncHdtX3BlcmlvZF9jbnRsJw0KPj4gICBkcm0vYW1kL2Rpc3BsYXk6IFJlbW92ZSBzZXQg
YnV0IG5vdCB1c2VkIHZhcmlhYmxlICd2YWx1ZTAnDQo+PiAgIGRybS9hbWQvZGlzcGxheTogUmVt
b3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGVzICdyZWd2YWwnLCdzcGVha2VycycNCj4+DQo+
PiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMgICAgICAgICAg
ICB8IDggKysrKy0tLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9saW5rX2VuY29kZXIuYyAgIHwgMyArLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jIHwgNSArLS0tLQ0KPj4gIDMgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4+DQo+PiAtLQ0KPj4gMi43
LjQNCj4+DQo+Pg0KPj4gLg0KPj4NCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
