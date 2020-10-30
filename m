Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1822A0312
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 11:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFF46E120;
	Fri, 30 Oct 2020 10:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFCA6E120;
 Fri, 30 Oct 2020 10:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C23wqxG4E0vqnvkc223Ufl3LSV8aOpOiHBkuVE9/Z1ACcDoDQGEVl6YmxUg37/dR1jyzQ+DUsF0+Std9g5cNN6pCcWLWg1jqJfVY4LWJGmjHiw4ql4kt9t8qGn8G61UzoBGzECPHd2pr+TtO4OxvCa3wjf2A4TGa8UlaW/j7qzbxp0mgJ7g5RYtgJlxVA049XyGl5v4rjraXu/3gGhuu36/KuoR8uHm2ElrJ7uVMsw50NGr8dXIEronf0/av/G9CJsDFGUxuOOmAXU9VpXM4AfCG4bn0ZtJ8PIAWMmYA6OOFlg/TxCNn6rPLagayGy0VTy83JWBWZEyc8pV4IuisMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py+OBGo/7Gda+yx3lRAzGc5c0q9c0n4Bi3qfeTrbkj8=;
 b=Y4gBNJW5C738K8K6E/bzS/1VwxlHQ2yN5Wt+23zZPHF8igoiMrnvgJlH50woWkJ5FKlZ425bisGY38Gy9k4KJAw0Y0lqVOhUOBFoTFcpICEpk0R6gqlNB+9rV2zP8v112YLlc/gL83rOe5ZsQd4+DgrparTKRGuLR4O24WYx3Zuqjumk1DYRMkPwVhAuhmkI5ONvoPJ4jyQqj87O3V7ZzZNGlVd7xxjypt5TGt1BZARHFWTIYPJ8iXPsBbAH705JjD+UXXdgBPC0iL8gAObhaqpNIU56Kh5THgSld/XpHO14dSybhcu6/RNbRQShibUZDNmdVwN4fJIzIb0/Ys8iqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py+OBGo/7Gda+yx3lRAzGc5c0q9c0n4Bi3qfeTrbkj8=;
 b=HbsFADWFYMAABStK+7OBiphpkAdFOJ5JxhsmVyrDo4oLnlkj0iF1dfddCyT8N67bhJ5NE28Eg9aF5s2ncCJjPsWyh0i3l109jtjhkg5Q9QeayspHjuym1AM1PRz857R/GQAVqjIqiytUULPRFw1BKi+t8FVHKXS+tf/7YWl+rq4=
Received: from DM5PR12MB1708.namprd12.prod.outlook.com (2603:10b6:3:10e::22)
 by DM5PR12MB1164.namprd12.prod.outlook.com (2603:10b6:3:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 30 Oct
 2020 10:41:40 +0000
Received: from DM5PR12MB1708.namprd12.prod.outlook.com
 ([fe80::61a5:a549:4cac:37e3]) by DM5PR12MB1708.namprd12.prod.outlook.com
 ([fe80::61a5:a549:4cac:37e3%7]) with mapi id 15.20.3477.028; Fri, 30 Oct 2020
 10:41:39 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 3/5] drm/amdgpu: Paper over the drm_driver mangling for
 virt
Thread-Topic: [PATCH 3/5] drm/amdgpu: Paper over the drm_driver mangling for
 virt
Thread-Index: AQHWrqUBnG21I9Wv/EK8BtTdrQGgi6mv9LTw
Date: Fri, 30 Oct 2020 10:41:39 +0000
Message-ID: <DM5PR12MB1708CC019EE615AA6B3D8A0184150@DM5PR12MB1708.namprd12.prod.outlook.com>
References: <20201030101104.2503-1-daniel.vetter@ffwll.ch>
 <20201030101104.2503-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20201030101104.2503-3-daniel.vetter@ffwll.ch>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=31f27173-df72-4ffa-994c-0000292b9224;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-10-30T10:39:52Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 38d1e0de-5c8a-4557-e7ed-08d87cc06265
x-ms-traffictypediagnostic: DM5PR12MB1164:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1164562E2AFD1368B07EBBFC84150@DM5PR12MB1164.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y86SssQiO2WFeuJOA/0wc+t3IBpBH5SkcBbn8MKWH3Sn8mYAdCANU1DxBiQybuUHP/zrVNQ+w6O8amTmksJJ/7SeQNrvc1VgbrjYdqa1H1YIXfrCJYFNBnl509tUUiBwCoPCfWQ9+fBeCVYQ712m8Mn4omRcD3bCkHrvPtAwY5xrJRDmy8mBDd9czUFBh6dYeLy375EsWDDzxTxJ5KeH8XG5ktBVqEsWSKY9jEyAnu9yZ7OCR+GbumjM93LypJOikgUucQVhIOQ6tsBIuck3cmvjD08Z4n1s3KS33TAaAtp64FHgE+i2RHKhVuWVGTjWuqBBFt3r77TnJM+AqQroNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1708.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(186003)(5660300002)(4326008)(33656002)(316002)(26005)(54906003)(110136005)(86362001)(478600001)(55016002)(9686003)(8676002)(83380400001)(66476007)(66446008)(2906002)(71200400001)(52536014)(6506007)(7696005)(53546011)(66556008)(66574015)(8936002)(76116006)(64756008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: h2b//W//tIW2PbihgKs5+imqEldlBwseHGBShUmbJQSoiPeBE5nzqyJ+mfEjSKfD6zUvsipzKWX8xuZzgrv/dDNEWpMe5m2RX2LKfRQWWTtlvnOczzcHghrDJH67GWjOiqAM+2JKx43Xga+PpOucj8dZ0QWiXrhVWxKQMCmQtd/MQmPERAINcUr/u1/17gtu//IGT4lOczxOo9/v9wwzu91P3LcKnxZDPmQnMSJ5e20Hoj/YGHtXUjyufN9iyyqXd2U6YhC6cbo4P7URGpxAEh4Dzu6zFuNxLTFJFVhgtQT7GTUiN9vdl4rYvhJpq/IZdPh1ClgziMagysFbWVVqaWeTji53Pp8iVs46kz/HIE4cREsRSpBg0GHxAgZJITFnFvxTxZfe8YKnTwctGiyw9csUvRPyfupgZaLVMTMziQDutQFiXWaHMjsNPCLx2Ruz9pQor1imN7JevBcVAvT5l8SOaBLp7KwR0I2JnzxB1dmBdLHXlMPC0C+lA6ddnGqtfCmv4dvtGbcNgqYaBnLpO58507T6bu0HtCdBoezwEIhFOyHwK54D3igOP5z1gFZrIBrqUtlrhe3ojqpmBSAjB4qvmMRebAbDIAnHedI/ZTB7vLn8V3wF3k/2BmGm2coCxPxSFzh0J45kKzJ8Klf0gw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1708.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d1e0de-5c8a-4557-e7ed-08d87cc06265
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 10:41:39.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FU2lR9XsXn20vnrZabF3mzqjCQJJ8y86xqL1T33Jgwem+IIrEePfv9cvzuLBuyB6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1164
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "Gong, Curry" <Curry.Gong@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>,
 "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>, "Sheng, Wenhui" <Wenhui.Sheng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Shaoyun" <Shaoyun.Liu@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Yang,
 Stanley" <Stanley.Yang@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Yintian Tao <yttao@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpX
aGF0J3MgdGhlIHB1cnBvc2Ugb2YgdGhlIHBhdGNoIHNldHMNCg0KZS5nLjogd2hhdCBidWcgY2Fu
IHRob3NlIDUgcGF0Y2hlcyBmaXggb3Igd2hhdCBmZWF0dXJlIHByb3ZpZGVkDQoNCmZvciB0aGlz
IHBhcnRpY3VsYXIgb25lICgzLzUpIEkgZGlkbid0IHNlZSBob3cgaXQgaGVscGZ1bCwgY291bGQg
eW91IGdpdmUgYSBiYWNrZ3JvdW5kICA/DQoNCnRoYW5rcw0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KTW9uayBMaXV8R1BVIFZpcnR1YWxpemF0aW9uIFRlYW0gfEFNRA0K
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPg0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDMwLCAyMDIwIDY6MTEg
UE0NClRvOiBEUkkgRGV2ZWxvcG1lbnQgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+
DQpDYzogSW50ZWwgR3JhcGhpY3MgRGV2ZWxvcG1lbnQgPGludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPjsgRGV1Y2hl
ciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3Rp
YW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQu
Y29tPjsgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IEdyb2R6b3Zza3ksIEFuZHJleSA8QW5kcmV5
Lkdyb2R6b3Zza3lAYW1kLmNvbT47IFR1aWtvdiwgTHViZW4gPEx1YmVuLlR1aWtvdkBhbWQuY29t
PjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBMaXUsIE1vbmsgPE1v
bmsuTGl1QGFtZC5jb20+OyBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT47IExpLCBEZW5uaXMg
PERlbm5pcy5MaUBhbWQuY29tPjsgTGl1LCBTaGFveXVuIDxTaGFveXVuLkxpdUBhbWQuY29tPjsg
WmhhbmcsIEJva3VuIDxCb2t1bi5aaGFuZ0BhbWQuY29tPjsgWWFuZywgU3RhbmxleSA8U3Rhbmxl
eS5ZYW5nQGFtZC5jb20+OyBTaGVuZywgV2VuaHVpIDxXZW5odWkuU2hlbmdAYW1kLmNvbT47IEdv
bmcsIEN1cnJ5IDxDdXJyeS5Hb25nQGFtZC5jb20+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAzLzVdIGRybS9hbWRncHU6IFBhcGVyIG92
ZXIgdGhlIGRybV9kcml2ZXIgbWFuZ2xpbmcgZm9yIHZpcnQNCg0KUHJlcCB3b3JrIHRvIG1ha2Ug
ZHJtX2RldmljZS0+ZHJpdmVyIGNvbnN0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4NCkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4NCkNjOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KQ2M6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KQ2M6IEhhd2tpbmcgWmhhbmcgPEhhd2tp
bmcuWmhhbmdAYW1kLmNvbT4NCkNjOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4NCkNjOiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPg0KQ2M6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KQ2M6IE1vbmsgTGl1IDxN
b25rLkxpdUBhbWQuY29tPg0KQ2M6IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPg0KQ2M6IERl
bm5pcyBMaSA8RGVubmlzLkxpQGFtZC5jb20+DQpDYzogc2hhb3l1bmwgPHNoYW95dW4ubGl1QGFt
ZC5jb20+DQpDYzogQm9rdW4gWmhhbmcgPEJva3VuLlpoYW5nQGFtZC5jb20+DQpDYzogIlN0YW5s
ZXkuWWFuZyIgPFN0YW5sZXkuWWFuZ0BhbWQuY29tPg0KQ2M6IFdlbmh1aSBTaGVuZyA8V2VuaHVp
LlNoZW5nQGFtZC5jb20+DQpDYzogY2hlbiBnb25nIDxjdXJyeS5nb25nQGFtZC5jb20+DQpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgfCAgOCArKysrLS0tLSAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYyB8IDEyICsrKysrKysrKysr
LQ0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KaW5kZXggMDI0YzNiNzBiMWFh
Li4zZDMzN2YxM2FlNGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
Yw0KQEAgLTEwOTMsNyArMTA5Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCBwY2lpZGxpc3RbXSA9IHsNCg0KIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCBwY2lpZGxpc3Qp
Ow0KDQotc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGttc19kcml2ZXI7DQorc3RydWN0IGRybV9k
cml2ZXIgYW1kZ3B1X2ttc19kcml2ZXI7DQoNCiBzdGF0aWMgaW50IGFtZGdwdV9wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsDQogICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICpl
bnQpIEBAIC0xMTY0LDcgKzExNjQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9wY2lfcHJvYmUoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsDQogaWYgKHJldCkNCiByZXR1cm4gcmV0Ow0KDQotYWRldiA9IGRl
dm1fZHJtX2Rldl9hbGxvYygmcGRldi0+ZGV2LCAma21zX2RyaXZlciwgdHlwZW9mKCphZGV2KSwg
ZGRldik7DQorYWRldiA9IGRldm1fZHJtX2Rldl9hbGxvYygmcGRldi0+ZGV2LCAmYW1kZ3B1X2tt
c19kcml2ZXIsDQordHlwZW9mKCphZGV2KSwgZGRldik7DQogaWYgKElTX0VSUihhZGV2KSkNCiBy
ZXR1cm4gUFRSX0VSUihhZGV2KTsNCg0KQEAgLTE1MDgsNyArMTUwOCw3IEBAIGludCBhbWRncHVf
ZmlsZV90b19mcHJpdihzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IGFtZGdwdV9mcHJpdiAqKmZw
cml2KQ0KIHJldHVybiAwOw0KIH0NCg0KLXN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrbXNfZHJp
dmVyID0gew0KK3N0cnVjdCBkcm1fZHJpdmVyIGFtZGdwdV9rbXNfZHJpdmVyID0gew0KIC5kcml2
ZXJfZmVhdHVyZXMgPQ0KICAgICBEUklWRVJfQVRPTUlDIHwNCiAgICAgRFJJVkVSX0dFTSB8DQpA
QCAtMTU3MSw3ICsxNTcxLDcgQEAgc3RhdGljIGludCBfX2luaXQgYW1kZ3B1X2luaXQodm9pZCkN
CiBnb3RvIGVycm9yX2ZlbmNlOw0KDQogRFJNX0lORk8oImFtZGdwdSBrZXJuZWwgbW9kZXNldHRp
bmcgZW5hYmxlZC5cbiIpOw0KLWttc19kcml2ZXIubnVtX2lvY3RscyA9IGFtZGdwdV9tYXhfa21z
X2lvY3RsOw0KK2FtZGdwdV9rbXNfZHJpdmVyLm51bV9pb2N0bHMgPSBhbWRncHVfbWF4X2ttc19p
b2N0bDsNCiBhbWRncHVfcmVnaXN0ZXJfYXRweF9oYW5kbGVyKCk7DQoNCiAvKiBJZ25vcmUgS0ZE
IGluaXQgZmFpbHVyZXMuIE5vcm1hbCB3aGVuIENPTkZJR19IU0FfQU1EIGlzIG5vdCBzZXQuICov
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYw0KaW5kZXggZDBhZWE1ZTM5
NTMxLi5kZGU0YzQ0OWMyODQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdmlydC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmlydC5jDQpAQCAtNDUsMTMgKzQ1LDIzIEBAIGJvb2wgYW1kZ3B1X3ZpcnRfbW1pb19ibG9ja2Vk
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIHJldHVybiBSUkVHMzJfTk9fS0lRKDB4YzA0
MCkgPT0gMHhmZmZmZmZmZjsgIH0NCg0KK2V4dGVybiBzdHJ1Y3QgZHJtX2RyaXZlciBhbWRncHVf
a21zX2RyaXZlcjsNCisNCiB2b2lkIGFtZGdwdV92aXJ0X2luaXRfc2V0dGluZyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikgIHsNCiAvKiBlbmFibGUgdmlydHVhbCBkaXNwbGF5ICovDQogaWYg
KGFkZXYtPm1vZGVfaW5mby5udW1fY3J0YyA9PSAwKQ0KIGFkZXYtPm1vZGVfaW5mby5udW1fY3J0
YyA9IDE7DQogYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSA9IHRydWU7DQotYWRldl90b19k
cm0oYWRldiktPmRyaXZlci0+ZHJpdmVyX2ZlYXR1cmVzICY9IH5EUklWRVJfQVRPTUlDOw0KKw0K
Ky8qDQorICogRklYTUU6IEVpdGhlciBtYWtlIHZpcnQgc3VwcG9ydCBhdG9taWMgb3IgbWFrZSBz
dXJlIHlvdSBoYXZlIHR3bw0KKyAqIGRybV9kcml2ZXIgc3RydWN0cywgdGhlc2Uga2luZCBvZiB0
cmlja3MgYXJlIG9ubHkgb2sgd2hlbiB0aGVyZSdzDQorICogZ3VhcmFudGVlZCBvbmx5IGEgc2lu
Z2xlIGRldmljZSBwZXIgc3lzdGVtLiBUaGlzIHNob3VsZCBhbHNvIGJlIGRvbmUNCisgKiBiZWZv
cmUgc3RydWN0IGRybV9kZXZpY2UgaXMgaW5pdGlhbGl6ZWQuDQorICovDQorYW1kZ3B1X2ttc19k
cml2ZXIuZHJpdmVyX2ZlYXR1cmVzICY9IH5EUklWRVJfQVRPTUlDOw0KKw0KIGFkZXYtPmNnX2Zs
YWdzID0gMDsNCiBhZGV2LT5wZ19mbGFncyA9IDA7DQogfQ0KLS0NCjIuMjguMA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
