Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0F371BC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 12:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1564A89226;
	Thu,  6 Jun 2019 10:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9345E88FA8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 10:31:00 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1753.namprd12.prod.outlook.com (10.175.88.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Thu, 6 Jun 2019 10:30:59 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.023; Thu, 6 Jun 2019
 10:30:59 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Zhou,
 David(ChunMing)" <David1.Zhou@amd.com>
Subject: Re: [PATCH 1/2] update drm.h
Thread-Topic: [PATCH 1/2] update drm.h
Thread-Index: AQHVEH3q+wOLSClf5kC/en2A/5JTSqZ29kuAgALIPgCAFMNmgIAAAZqAgAABTIA=
Date: Thu, 6 Jun 2019 10:30:58 +0000
Message-ID: <cbfa4021-e79d-716d-d044-f8e5b0f39f74@amd.com>
References: <20190522090800.15908-1-david1.zhou@amd.com>
 <17e558ac-bda8-0541-b102-2fd730ce4753@amd.com>
 <f95b85cd-80ee-576a-248a-409f512e8d38@amd.com>
 <96dea97c-dfa8-1e89-1b83-9a425b93e36e@daenzer.net>
 <ce5f40ff-7685-35e5-ef33-e5e7fac63818@amd.com>
In-Reply-To: <ce5f40ff-7685-35e5-ef33-e5e7fac63818@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P192CA0017.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::30) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f439712-9cf6-4415-c4bb-08d6ea6a10b4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1753; 
x-ms-traffictypediagnostic: DM5PR12MB1753:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1753D386AC0EE0451B08796E83170@DM5PR12MB1753.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(46003)(66574012)(6246003)(36756003)(476003)(71200400001)(68736007)(65806001)(110136005)(186003)(25786009)(6512007)(14454004)(66946007)(73956011)(486006)(14444005)(256004)(52116002)(71190400001)(7736002)(305945005)(6116002)(446003)(64126003)(4326008)(81166006)(2616005)(11346002)(966005)(66446008)(66556008)(6436002)(31696002)(58126008)(31686004)(6636002)(8936002)(64756008)(72206003)(65826007)(65956001)(66476007)(86362001)(99286004)(8676002)(6486002)(81156014)(6306002)(4744005)(386003)(102836004)(2906002)(478600001)(53936002)(5660300002)(53546011)(316002)(229853002)(76176011)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1753;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cGQxGXg3+X6ATL44HjOzBDyOb0UBBXjZNVJEwdi5tU4k6z+5ob4MhY0GDpE+BeyNf/piwZ2TU2DDotdBXPWKCcRlGLcrlPn82viNyDrzogERxHHT8TMjRMtTy2ni0Ilz/8a20Dvd+L5ljZuAGR4/ScuJ/cB8tx1fgs+GudjpWE7nhgb/WqFxidcAtx8eEGF8tknEJUpp3dYXm+eNQzf8IJzrzDQDx1QnrRjjuPfNNY4E56/4ktW/pkb48CFuXAUpycVLK7q6P6bVYh3gxCUNBWQ87XXCxU2xrp81u/cWcC3b+DoDtrRIco06lOELp2RAp0sRniuxav47jLmBKNejy4PexW+XIfkeqQGoQBeJZ4v6ZwGk5Vea9M8L5Uczy5ApOxL1120y0NcyY+yDFRIwxoGbOsQjAEBvykZQVwCr/24=
Content-ID: <C662930890D9CA48BE4DEA5284F1A4C9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f439712-9cf6-4415-c4bb-08d6ea6a10b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 10:30:58.9410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1753
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IL+38ZHt/qdcSLZcrehwDxw1Bsm8bxdXstYyRVoN1uo=;
 b=maffnlb0K7QrvKNBYDQbFzWm/hXpZukg9yFfR+hAp5cpuaXhuDCvgThyFLgWtjiP/qu+vzTMyF93vnaQyA8FZjvvr6AKRO+45bGzieC9bO+QKbSDM03rYJZO7YXfkqFKUiGNmQo2UP4JekCP9ZezSuN8dGopgNceLtnSNFoT1J8=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2Vjb25kZWQsIEknbSBhbHdheXMgdG90YWxseSBjb25mdXNlZCBhYm91dCB0aGUgd2ViIGludGVy
ZmFjZSBhcyB3ZWxsLg0KDQpDaHJpc3RpYW4uDQoNCkFtIDA2LjA2LjE5IHVtIDEyOjI2IHNjaHJp
ZWIgemhvdWNtMToNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvZHJtLCBX
aGVyZSB0aGUgbWVyZ2UgcmVxdWVzdCBidXR0b24/DQo+DQo+IC1EYXZpZA0KPg0KPg0KPiBPbiAy
MDE55bm0MDbmnIgwNuaXpSAxODoyMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6DQo+PiBPbiAyMDE5
LTA1LTI0IDc6MTUgYS5tLiwgemhvdWNtMSB3cm90ZToNCj4+PiBhbnlvbmUgY2FuIHBpY2sgdXAg
dG8gZ2l0bGFiIGZvciBsaWJkcm0/DQo+PiBDYW4geW91IGNyZWF0ZSBhIG1lcmdlIHJlcXVlc3Q/
DQo+Pg0KPj4NCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
