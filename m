Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FF76CE89
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81646E3AE;
	Thu, 18 Jul 2019 13:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710067.outbound.protection.outlook.com [40.107.71.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79E6E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcvqFGHLQNOkprAOJL58gXBwIYHMXc8nWe6zx5o7MOuBwwJsBw40/2UKOzcazbT/ClhFiIAtPkTDDWUNee6TbPxXGVyPaQiFJ0QJNEAvM2B4IYq7N0KLwFScYSI/ef99ADBaS186gL88gsb97K5nGehj2STRDflGns5Osj9aAZ8lmgyjF7ziGzPwZEkYdI/hYgg6LSz5Ia8Bg6WeqJSBa7RbVDHVMN4Fk8e0L4AiBd/2eu6Ps2yJQBWBWAZ/YwVDB+8KmziH+05MlQ5em9d73vnbH5Om7a3KkKkaUwtYSKShw7ThkinyoUZTWBDfp9ij/nHUUgHWzAj2+rYYw7xyRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7awmvFVeQs/N0He8oh+KE5MzhuA/7uiNODAO3IXq00U=;
 b=YnzeXwFoZrYhtY25AkTeQoX4kFjL+7PauKjI8iNyPhJILndAE07KIablBIJ7I9BtQsQtFrgafCW8fkWJTPYk3FXNdW9d/s2Ut8zpP31uLoBATUozaElpuNhoU/zT15/HCxTyVUKujk0QeCVFzN7OoaeSngeC4Cno/rAm3elD6FdeuoXzMY6rQXrZySmb7r8oIBCUeYso/ywF7D7X6N7GoMO0XDLKwclPnKfZ3nFIq9TbZOAN/GqlXa2u74TkTF684Ku/aLJEaXFeyHhgsMcFk15JLQfxrXct+spjHiAlx41rXYq9WN1YQQ0iqB419pccdWlo/VhRG5p5eYlJrX7W9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 13:04:10 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:04:10 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Topic: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Index: AQHVPVnoqE0gPkoYWUCt/IPkTJivbabQOm8AgAAdSYA=
Date: Thu, 18 Jul 2019 13:04:09 +0000
Message-ID: <8343b732-2e4b-31f0-9e68-18171977a606@amd.com>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <156344872806.23055.12897857019960560550@skylake-alporthouse-com>
In-Reply-To: <156344872806.23055.12897857019960560550@skylake-alporthouse-com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2P15301CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::14) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24148b58-0139-47c9-5b3f-08d70b806c5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3039; 
x-ms-traffictypediagnostic: MN2PR12MB3039:
x-microsoft-antispam-prvs: <MN2PR12MB30391C47677ACE25F55EA8B2B4C80@MN2PR12MB3039.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(66066001)(446003)(11346002)(3846002)(6116002)(6436002)(36756003)(26005)(53936002)(2616005)(476003)(186003)(102836004)(6486002)(478600001)(14454004)(25786009)(256004)(486006)(305945005)(316002)(71190400001)(110136005)(7736002)(2501003)(99286004)(4744005)(8676002)(6246003)(6506007)(31696002)(31686004)(5660300002)(64756008)(2906002)(52116002)(76176011)(6512007)(386003)(229853002)(71200400001)(66476007)(66946007)(81156014)(8936002)(81166006)(68736007)(66446008)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3039;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ERgmXViSuhUK+s/R0EKqEC6ercRla/WHUM4Qa6p/UftVZp8jJpeZjaS8dgf66sYeYrn9Kiy9ppHztxqS9B+zFA1oqaany13Q+rGwK9E8gOYKM7hK6ChtN9z7EKBXUks3bYRhm8Z6fXWphtNnJZdMUvuyFZ79r52LgXy+qq0YJE6127bifyL4p0KdtZcRtA1yY1ks+U+F9JQWSUeXni7UmW1viPJFMrgtBkFDOCp4rhe/QisLp5AbJ+ENza8MMrTWtMF02oAIPl7oaJIV0kPhWXeCAiaS1Ak5UlVNUHjOe0TTJqK1l6PLnXkekpKVJOl1XeGzpHXbUee76shUbpFPZi3IoxE3KmwI4h8LoIVxVuS5izDMnDCKzea3Sz9/sXzbQlyfw7Nj25nSBvtz7uWzX3wRWfWISJdyjFLOm6kedY0=
Content-ID: <35B1C8655B47D64DBAA8E52101A9F6A2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24148b58-0139-47c9-5b3f-08d70b806c5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:04:09.9743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3039
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7awmvFVeQs/N0He8oh+KE5MzhuA/7uiNODAO3IXq00U=;
 b=w4USJ7+vkrRvxueJ7pE75errdSHa6CUdch1QUBROSZaCsq1zq/0Xs++WizMSOu5uDfjqNNrzmwL6EB/b51J+CDsXSxfrkNekj3NoTYoOU9aCapNQc4pEAmwyRitQ9UpbJ2NYzR0PJvngAMaH1McLB9LvpicExWlWbuXYG1CQchI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

DQrlnKggMjAxOS83LzE4IDE5OjE4LCBDaHJpcyBXaWxzb24g5YaZ6YGTOg0KPiBRdW90aW5nIENo
dW5taW5nIFpob3UgKDIwMTktMDctMTggMTI6MTM6MzkpDQo+PiBpZiBXQUlUX0ZPUl9TVUJNSVQg
aXNuJ3Qgc2V0IGFuZCBpbiB0aGUgbWVhbndoaWxlIG5vIHVuZGVybHlpbmcgZmVuY2Ugb24gc3lu
Y29iaiwNCj4+IHRoZW4gcmV0dXJuIG5vbi1ibG9jayBlcnJvciBjb2RlIHRvIHVzZXIgc2FwY2Uu
DQo+IEJsb2NrIGRldmljZSByZXF1aXJlZD8NCg0KWWVzLCBpZiBXQUlUX0ZPUl9TVUJNSVQgaXMg
c2V0LCB0aGVuIHRoYXQgd2lsbCBibG9jayBkZXZpY2UuDQoNCg0KLURhdmlkDQoNCj4NCj4gSSBw
cmVzdW1lIHlvdSB0cmllZCB0aGUgRVdPVUxEQkxPQ0sgd2hpY2ggd291bGQgYmUgaW1wbGllZCBi
eSB5b3VyDQo+IHNlbnRlbmNlIGFuZCBmb3VuZCB0aGF0IHdvdWxkIGJlIGFuIGludGVyZXN0aW5n
IGV4cGVyaWVuY2UuDQo+IC1DaHJpcw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
