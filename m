Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E7FD455D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 18:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74E46EC61;
	Fri, 11 Oct 2019 16:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730062.outbound.protection.outlook.com [40.107.73.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F296EC61;
 Fri, 11 Oct 2019 16:26:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFtbYT6s00ITKbJXPNNExFoaW0Th7BXHz5WcXQF8OJeINSkXVcnhzt3aXGbbKRvBEACor+iu/mYu/xQufqccDULXyclDEFxbkCs3Yb3lapxUOS9p+WieOd8maTEnPl3bzVEroge/P6m6C9nZ4NElJb14GW02cCJBDsX0I9SGmT4okkrH9Yw438V7Mue6EgKRjrGGtGth2bUxXBcsf2dqwv987AnE2p2RSX9RjFEWkLswfVreNoiuf1mLH1XU9i1zHsuAM7Ia7sFS0uCYL3pbOhrvk/zhw3KZ2fhR38iyelp4NuqsC15BXgOcnwhceqjPAbi9w4PRunzu8Fo/b3PDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UY5E0NrBcr7aWBCcNsV6+1V5lmg6sjuHQj9iRK0HQY=;
 b=koTD4a8/ynpsD8Ejxdncq2Hdp+2p0o86s1snRWZWjiTLQ8Uumk9Vxwoyi+iJZEgVCYMxzxHdq0UeiI+bBN1y2ESJPNh70WvIGKtF1Zutb/ad+Z4pU+QeFmf3k7+d8/doOLlm8EfBe0v+42v9c1OxnhIbChlVViMpC1zAibVOzZMg9A/L/vj5vAk5FTZpIIyeqFJlFwKq7q/qBzTEblJzMbSF01y3vNXRbqYufJ+ScxFFs7SnDn6sAxV5iDc0cW3ZUYWhATxkq9nYiB5NiHT2j5g0N3y2GoDE8BLk2AJZxOeG7GHklVePHnWj93y3blkgsNgzGJq/2tOCdlkGD+nHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0152.namprd12.prod.outlook.com (10.172.77.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 16:26:23 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 16:26:23 +0000
From: Harry Wentland <hwentlan@amd.com>
To: zhengbin <zhengbin13@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] drm/amd/display/dc/dce: remove some not used variables
Thread-Topic: [PATCH 0/3] drm/amd/display/dc/dce: remove some not used
 variables
Thread-Index: AQHVfmlUMDA+jOqcgUudjrfx7O/UWKdVpGiA
Date: Fri, 11 Oct 2019 16:26:23 +0000
Message-ID: <6910512b-0af9-5c5e-834c-f55e8130307d@amd.com>
References: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 973fc1fa-1885-4530-ae86-08d74e67c18b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0152:|CY4PR1201MB0152:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB015271CB0FEC3388B52D54CE8C970@CY4PR1201MB0152.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(51914003)(199004)(189003)(6486002)(31696002)(229853002)(66066001)(11346002)(446003)(486006)(99286004)(76176011)(65956001)(2616005)(476003)(65806001)(81156014)(26005)(81166006)(6506007)(53546011)(186003)(8676002)(386003)(52116002)(66946007)(31686004)(2201001)(36756003)(8936002)(6436002)(6246003)(256004)(110136005)(4744005)(478600001)(2501003)(25786009)(71190400001)(71200400001)(14444005)(66446008)(6512007)(3846002)(6116002)(316002)(14454004)(58126008)(7736002)(305945005)(102836004)(64756008)(66556008)(66476007)(450100002)(2906002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0152;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vnc4gjX817GH4DQzK+XB1aTOAiaUeR3RVTi/B/0E466xymiw2f5p+ZgDdIzPsXq3arilyc5PGRg5HJyq3RRpwXi1yiu6aFSMTfZ7UqYFOHU6YRVEoaElY5MzTSgaJbbXZ6WXRIU/+4MUbFv1ebuv4SLFty59s/Dp6E6Bcn0ovlL9FSmWVChUfpM4BFTfmzrcg+5Z7+VB92ePpEKtTh3Eug2znCSVztwKV8f1/0aYtyd+6JWHDMVTezsKc97Surxj7bnMrM+uK3jYr+ldzZEhRd4RF+LGzaER3eDVLn5mMU4G8FItQw75wJe5pgsMt7Dyu7RMidEsBMgUiXtYd1/9ToFLyJkuGlPzawkL6dLglRN+lmE/0vwAD8OTRA5GtLDq69+4E0Kvcad/PNz/Xs38TswukG08rQOneBcR/Pwoq8w=
Content-ID: <3CDB3402C7F5824C89D56655DA06B83B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973fc1fa-1885-4530-ae86-08d74e67c18b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 16:26:23.6247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XLwthuvPDkYZe0DWefJlclBmYAmGUSUzV0NQtgBG5ZN7TkY6ca4Kp5lp8LxivtNHRxGClhSVIPg7ewPVJH02hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0152
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UY5E0NrBcr7aWBCcNsV6+1V5lmg6sjuHQj9iRK0HQY=;
 b=gDaKRzknLnJdM1CL2BPJ7ZTb+ftAe7iIeG4ofEHy9n1y5HEMfbilFuYYGZJvMwZAFYxH6sKbhHE/lyE/o91H3Rw9Jl8Bmrrh/LeznzDuZNziPg40fIehRBIIoBUvUF7isLVxvkOBZHqiyeyIokP6WuXpzpuO37BOVUSfZhrbJvA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgcGF0Y2hlcy4NCg0KSSB0aGluayBmb3IgYWxsIG9mIHRoZW0gd2Ugc2hv
dWxkIGp1c3QgZHJvcCB0aGUgUkVHX1JFQUQgY2FsbHMNCmNvbXBsZXRlbHkuIFRoZXkgbG9vayBs
aWtlIGxlZnRvdmVycyBmcm9tIHdoZW4gd2UgaGFkIGEgZGlmZmVyZW50DQpyZWdpc3RlciB1cGRh
dGUgc2NoZW1lIHRoYXQgd291bGQgcmVhZCB0aGUgcmVnaXN0ZXIsIHRoZW4gdXBkYXRlIG9yIGdl
dA0KdGhlIGZpZWxkIHZhbHVlLiBOb3cgd2UganVzdCB1c2UgdGhlIFJFR18gbWFjcm9zIHRoYXQg
d2lsbCBjb21iaW5lIHRoZQ0KcmVhZCB3aXRoIHRoZSBHRVQgb3IgVVBEQVRFIG9wZXJhdGlvbnMu
DQoNCkhhcnJ5DQoNCk9uIDIwMTktMTAtMDkgMjoyNSBhLm0uLCB6aGVuZ2JpbiB3cm90ZToNCj4g
emhlbmdiaW4gKDMpOg0KPiAgIGRybS9hbWQvZGlzcGxheTogUmVtb3ZlIHNldCBidXQgbm90IHVz
ZWQgdmFyaWFibGVzDQo+ICAgICAnYmxfcHdtX2NudGwnLCdwd21fcGVyaW9kX2NudGwnDQo+ICAg
ZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAndmFsdWUw
Jw0KPiAgIGRybS9hbWQvZGlzcGxheTogUmVtb3ZlIHNldCBidXQgbm90IHVzZWQgdmFyaWFibGVz
ICdyZWd2YWwnLCdzcGVha2VycycNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNlL2RjZV9hYm0uYyAgICAgICAgICAgIHwgOCArKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfbGlua19lbmNvZGVyLmMgICB8IDMgKy0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jIHwg
NSArLS0tLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9u
cygtKQ0KPiANCj4gLS0NCj4gMi43LjQNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
