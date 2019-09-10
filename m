Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B355FAEAF2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 14:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADF86E08C;
	Tue, 10 Sep 2019 12:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790078.outbound.protection.outlook.com [40.107.79.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853266E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 12:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d812xeIfG8WzSWePmgP3ahT5U1BWa9idFqsZ/Af1wUoDfAIY3aIY7XPAGSpsGTKJBk3KXM1raa9XT/bQVqXozU0i/bmGPt51IwYF2lZ/pYMcLiG1d9J+kDSVY9SiY6HvuC4wkGfK8L0AccR9RbPhYdMrpKndKzmbsd5RKyWXoHDBs/UC21NDYhqKynUg1evflqEIk3yoKe9N++FgAp9y2K2wwezgVPCu4CIXt6ohpqUzX47SXUIi85RbriQwQn24Ejk+enDF1zSdOFgpp1ciqX4sr2GY66CQPVcC+AF3EuUpEjr8ztAI39wP2mTPQPosXhxFHNnPcfNn0qHdH6v+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jABUHBUN1U8VcAao+7tW+N1JuchKgux5u9gtjRpgZE=;
 b=XmSfPM5IHc5ucM5AFOsXqb2ASOsdFH3eWTes5R5U4eEyv+h1HfHHihLf21k3xHYc9jxNgFIfsQNxamstAyq5Xp4ghX+MS6C1h3hhv4UW5xPajlrk6W7H7Abfr/39gPrwA1PNgSNPtppfMQTbTf5iZC1rQ8vwKm/KAwKAUSY1XtMZL/LbKIIltnq4dd4WZ9HToFKAzOdLr/Kgw3msRhbVKXEXB8/0g8UKHGDWH4HB9o6NJLHZMOlprftdQRSLIYwHxJpLiFD0ddSy7w7DiLDfzxZ6cnh0/okR8vSkn574G3CXfLpG/IJgHbwh+3zEhTvLjNCphwzhskBYnrgMKanNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0198.namprd12.prod.outlook.com (10.172.75.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Tue, 10 Sep 2019 12:58:25 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::708e:c826:5b05:e3f0%11]) with mapi id 15.20.2241.018; Tue, 10 Sep
 2019 12:58:25 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: include: fix W=1 warnings in struct drm_dsc_config
Thread-Topic: [PATCH] drm: include: fix W=1 warnings in struct drm_dsc_config
Thread-Index: AQHVZ6UWBRRywSwpYUOubjyuuYsSz6ck348A
Date: Tue, 10 Sep 2019 12:58:24 +0000
Message-ID: <f17b306d-2810-985c-42ec-59c6a6dd7093@amd.com>
References: <20190909135205.10277-1-benjamin.gaignard@st.com>
In-Reply-To: <20190909135205.10277-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:925f:916c::2]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
x-clientproxiedby: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b97725d0-a85c-439c-c842-08d735ee90ff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0198; 
x-ms-traffictypediagnostic: CY4PR1201MB0198:
x-microsoft-antispam-prvs: <CY4PR1201MB01983A35079C3A3A86E69D338CB60@CY4PR1201MB0198.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(189003)(199004)(46003)(66446008)(256004)(66946007)(66476007)(64756008)(66556008)(2906002)(446003)(476003)(2616005)(11346002)(65806001)(65956001)(102836004)(478600001)(8936002)(31686004)(186003)(486006)(53936002)(6246003)(14454004)(6512007)(386003)(6506007)(25786009)(53546011)(4326008)(6116002)(2201001)(71200400001)(36756003)(7736002)(6486002)(110136005)(2501003)(58126008)(316002)(52116002)(81156014)(81166006)(229853002)(31696002)(8676002)(305945005)(6436002)(99286004)(71190400001)(54906003)(5660300002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0198;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m9x1VN4fQ75kmcoS5zgSrrVyhwYno7NIwUHrc5W57zeW359ofigqKIAS1x7nS7kb12YJTsRYUggWWTBPLnHZJlV2Z9A7Zl3ZgW8XE3EsuKcUJ3JsoIwSH3XezrMoZxxFgs1Ft+MNCnSUKuyFhQ7Dayga4mEyouy9ssc17C+lrnjqkDuwYInfRqCSVQ7O6ORSMuIF2YNU0yv5Z6otZkPKAHTfjBcYMvSqDDP/auxGb1tQ/9wur3bBaOU4NmOaofVGUHc4pW8zHHfhBzdxQ4xRCMHiTkQWEq6HwD6gbCRlQ06X2r+ssguqWBIxA2We9KrNwTqfQ7UjKdkvm2GNZ/4eewuv5uXToshM4C/fSbgbSrOM8XI589YWcincyZn2P/nQ1tN7p56TZFH3r7xITpvg7U0s3x1oklgWaAn5w9NWp1I=
x-ms-exchange-transport-forked: True
Content-ID: <69BD3F4FEE66F34C9F3837D7F89D1218@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97725d0-a85c-439c-c842-08d735ee90ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 12:58:24.8924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pXsfnUtpMrzb1H3j1HAwip7WP+y3r5Z+eG9VjViGzlsCW5X5M2gR0MlQiAmbjpLLXF4MjcUCqcFXI7Xl6h/O+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0198
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jABUHBUN1U8VcAao+7tW+N1JuchKgux5u9gtjRpgZE=;
 b=NZNLFGjHTlfpUy/k9PoaEdHCFwA/eW+ip+a5xEG3vt7CgLr4MK8Bxixh+eaFK2RdEAIn9hCGfUdeGPpOHBVmFLSD0XEgGA4Z5Xccplz077jbJre6G7A378IMw4NEsGQ8GqFw7xR4UicC2MUwjSpySSgi/HuhdjtTPBdZzBjcg8g=
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
Cc: "Navare, Manasi D" <manasi.d.navare@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gaurav K Singh <gaurav.k.singh@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K01hbmFzaSwgR2F1cmF2DQoNCk9uIDIwMTktMDktMDkgOTo1MiBhLm0uLCBCZW5qYW1pbiBHYWln
bmFyZCB3cm90ZToNCj4gQ2hhbmdlIHNjYWxlX2luY3JlbWVudF9pbnRlcnZhbCBhbmQgbmZsX2Jw
Z19vZmZzZXQgZmllbGRzIHRvDQo+IHUzMiB0byBhdm9pZCBXPTEgd2FybmluZ3MgYmVjYXVzZSB3
ZSBhcmUgdGVzdGluZyB0aGVtIGFnYWluc3QNCj4gNjU1MzUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPg0KPiAtLS0NCj4g
ICBpbmNsdWRlL2RybS9kcm1fZHNjLmggfCA2ICsrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX2RzYy5oIGIvaW5jbHVkZS9kcm0vZHJtX2RzYy5oDQo+IGluZGV4IDg4Nzk1NGNi
ZmM2MC4uZTQ5NTAyNGU5MDFjIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHNjLmgN
Cj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RzYy5oDQo+IEBAIC0yMDcsMTEgKzIwNywxMyBAQCBz
dHJ1Y3QgZHJtX2RzY19jb25maWcgew0KPiAgIAkgKiBOdW1iZXIgb2YgZ3JvdXAgdGltZXMgYmV0
d2VlbiBpbmNyZW1lbnRpbmcgdGhlIHNjYWxlIGZhY3RvciB2YWx1ZQ0KPiAgIAkgKiB1c2VkIGF0
IHRoZSBiZWdpbm5pbmcgb2YgYSBzbGljZS4NCj4gICAJICovDQo+IC0JdTE2IHNjYWxlX2luY3Jl
bWVudF9pbnRlcnZhbDsNCj4gKwl1MzIgc2NhbGVfaW5jcmVtZW50X2ludGVydmFsOw0KDQpUaGUg
RFNDIHNwZWMgZGVmaW5lcyBib3RoIGFzIHUxNi4gSSB0aGluayB0aGUgY2hlY2sgaW4gZHJtX2Rz
Yy5jIGlzIA0KdXNlbGVzcyBhbmQgc2hvdWxkIGJlIGRyb3BwZWQuDQoNCkhhcnJ5DQoNCj4gKw0K
PiAgIAkvKioNCj4gICAJICogQG5mbF9icGdfb2Zmc2V0OiBOb24gZmlyc3QgbGluZSBCUEcgb2Zm
c2V0IHRvIGJlIHVzZWQNCj4gICAJICovDQo+IC0JdTE2IG5mbF9icGdfb2Zmc2V0Ow0KPiArDQo+
ICsJdTMyIG5mbF9icGdfb2Zmc2V0Ow0KPiAgIAkvKioNCj4gICAJICogQHNsaWNlX2JwZ19vZmZz
ZXQ6IEJQRyBvZmZzZXQgdXNlZCB0byBlbmZvcmNlIHNsaWNlIGJpdA0KPiAgIAkgKi8NCj4gDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
