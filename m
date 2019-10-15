Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A896D7C8F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 18:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776989971;
	Tue, 15 Oct 2019 16:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800081.outbound.protection.outlook.com [40.107.80.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9389971;
 Tue, 15 Oct 2019 16:58:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx+TtrWf7RqfOPxrFGlvhNa51v5Y6uxDESG/0L16a0eskodTdJ5pwk/gxejOcY9emKR4IqGyhHIsNOw7IvOAqRtNz7yqSEC+qbzqw0GDs9npeSoCeAG7yhSMTMwDrFSpkRof13A4jtO1F+rfC6aXJ2A3S0nLtTdkWU0iJkp24F0cpZIZDLHAWSAl95Zlx5qgtZ6vPri4BiVifCcyi3UN8z3d3chyapmd499Zbnne7bPkfabfT17JhmO3OEaq+oZB2nKo5OTaUaZqXBBSmSQZ5//HH7EG9SWF7iYSJR7ahaxDgHjb8LMUE5ZGq6UydGLNVxQWv1AKajimHF24ZKvhuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGoYBC/PqrD89lSl1nXc8EMDyeoJJmN2AKvNlwdI+ik=;
 b=XG2HJPSVE6lojFlVAR/l+WB8nRKV/FD7uHpXlYX76LRHQLEDoDnE0zkLba2S2ld6Du3rbTvWthAtzp/ZurS9XEKcvXb7vs02mJpC3baol0aBJEcE/+BfBJc6CMMuIvIXeiNXRlSwebNeH0cNAPMlPUnxqf2s9mn4aEOYna6XrRKxobua8U6Qk5J5zJwEQ2rLxAklNuhjexzLkadr88+YBKSXCQYsGq8Gjhj+osYPVZmXS19vDw2k9Ae6IFIig+pZV7gTM5xgx2JIPQjZrndSrI+vqrADxtOmYSnE7banWd4HNLENpg1cmJQ2zKBbJsRZ7P0QmkoY+eaWjMYyHH6D0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4236.namprd12.prod.outlook.com (10.141.184.142) by
 DM6PR12MB3546.namprd12.prod.outlook.com (20.179.106.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 16:58:01 +0000
Received: from DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95]) by DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95%2]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 16:58:01 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: fix build error casused by
 CONFIG_DRM_AMD_DC_DCN2_1
Thread-Topic: [PATCH] drm/amdgpu/display: fix build error casused by
 CONFIG_DRM_AMD_DC_DCN2_1
Thread-Index: AQHVg3jHG+HXnJc3ckKoOaq8lGiugKdb7HOA
Date: Tue, 15 Oct 2019 16:58:00 +0000
Message-ID: <545dfe83-b122-4733-f751-3655d7d56ba8@amd.com>
References: <20191015165117.31195-1-hersenxs.wu@amd.com>
In-Reply-To: <20191015165117.31195-1-hersenxs.wu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To DM6PR12MB4236.namprd12.prod.outlook.com
 (2603:10b6:5:212::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69d7669d-a818-459e-0018-08d75190d62e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3546:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB354696E012819C6B60A0DE65F9930@DM6PR12MB3546.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(199004)(189003)(446003)(86362001)(2616005)(66446008)(7736002)(66476007)(64756008)(66556008)(305945005)(31686004)(66066001)(66946007)(11346002)(71190400001)(450100002)(71200400001)(81166006)(8676002)(8936002)(81156014)(476003)(186003)(2201001)(102836004)(486006)(26005)(4001150100001)(2906002)(54906003)(110136005)(99286004)(36756003)(53546011)(6486002)(386003)(316002)(76176011)(5660300002)(52116002)(6246003)(3846002)(6116002)(6506007)(2501003)(25786009)(229853002)(6512007)(4326008)(6436002)(14454004)(31696002)(256004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3546;
 H:DM6PR12MB4236.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WZuXlZI4lXzfmiLi6+kUwwcWQEbA43TLcmytQsRTIH3CV2lYmgLL6bi0jIWEgdlbiUMcrEfc/5KJLEvfn1lRipUFdKgAdklewkrjwjiuI7bAsyKEzEKCXBIWZRULktWnaF0uU4VS4jsLvsnZhIMEIDj8pJwJzax6dphhUiF8SRpjXseD86doTOZJyCRCu4RZOUAkfOdUPScSDbybVlr0jFwXFDp3ucL3/5LlwM5b9A/6TatX4Cr5LLbvamjmlro1C/h6iiEehCDbSBlWYhAdjN7MdyVhaQAz6gH8PghFq6/V4k48oPCXexDpXjWjAtyLiNBC9u4TxXSBxu8B84HRrUWuP8gGAroydJe2dQtbX4ZEI6w5rWNddnb+I8hicI+OSepKcKhMSSstai5P8biuSBpSDyw/e38ranDp9eecNlQ=
Content-ID: <5B40C21C1B80114F9B9720762E62F30C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d7669d-a818-459e-0018-08d75190d62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 16:58:00.9025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vz9j13Is0d2R1pfrMJHaPbenNthevvIQZeELE0omn8y7R9mnIVrEY2NJG7zr052s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGoYBC/PqrD89lSl1nXc8EMDyeoJJmN2AKvNlwdI+ik=;
 b=glbMf63PE6vs7ukwEmrOF6vHc3P3/x2BqtBbmvTKCFlBJWLJ6XG7sz6V5ZPYj5e0JIXW4eRi2kHEmEF94bqXgaKgvxQQVsxaNjwzmb1C08oBPGWVrTl04kKJXgovef2DvFmBKS95S2hR1kV9HAvE6DCzL0sLhpjpXH2RiP6fScs=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29t
Pg0KDQpPbiAyMDE5LTEwLTE1IDEyOjUxIHAubS4sIEhlcnNlbiBXdSB3cm90ZToNCj4gd2hlbiBD
T05GSUdfRFJNX0FNRF9EQ19EQ04yXzEgaXMgbm90IGVuYWJsZSBpbiAuY29uZmlnLA0KPiB0aGVy
ZSBpcyBidWlsZCBlcnJvci4gc3RydWN0IGRwbV9jbG9ja3Mgc2hvdWQgbm90IGJlDQo+IGd1YXJk
ZWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEhlcnNlbiBXdSA8aGVyc2VueHMud3VAYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oIHwg
MyAtLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaA0KPiBpbmRleCAyNGQ2NWRiYmQ3NDku
LmVmN2RmOWVmNmQ3ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RtX3BwX3NtdS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
bV9wcF9zbXUuaA0KPiBAQCAtMjQ5LDggKzI0OSw2IEBAIHN0cnVjdCBwcF9zbXVfZnVuY3NfbnYg
ew0KPiAgIH07DQo+ICAgI2VuZGlmDQo+ICAgDQo+IC0jaWYgZGVmaW5lZChDT05GSUdfRFJNX0FN
RF9EQ19EQ04yXzEpDQo+IC0NCj4gICAjZGVmaW5lIFBQX1NNVV9OVU1fU09DQ0xLX0RQTV9MRVZF
TFMgIDgNCj4gICAjZGVmaW5lIFBQX1NNVV9OVU1fRENGQ0xLX0RQTV9MRVZFTFMgIDgNCj4gICAj
ZGVmaW5lIFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTICAgIDQNCj4gQEAgLTI4OCw3ICsyODYs
NiBAQCBzdHJ1Y3QgcHBfc211X2Z1bmNzX3JuIHsNCj4gICAJZW51bSBwcF9zbXVfc3RhdHVzICgq
Z2V0X2RwbV9jbG9ja190YWJsZSkgKHN0cnVjdCBwcF9zbXUgKnBwLA0KPiAgIAkJCXN0cnVjdCBk
cG1fY2xvY2tzICpjbG9ja190YWJsZSk7DQo+ICAgfTsNCj4gLSNlbmRpZg0KPiAgIA0KPiAgIHN0
cnVjdCBwcF9zbXVfZnVuY3Mgew0KPiAgIAlzdHJ1Y3QgcHBfc211IGN0eDsNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
