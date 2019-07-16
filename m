Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC4C6AB33
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 17:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909989CD3;
	Tue, 16 Jul 2019 15:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780075.outbound.protection.outlook.com [40.107.78.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F6689CD3;
 Tue, 16 Jul 2019 14:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkV/GIoXfCev4LAAjYft7IJsQYBkEIufetzsKNNYLh2lVF1TNYKNujRix8fycvD8xSq+jYdjCwEEG8dFdKfNm7p4QEwBkYQTcthb4Kmbs/nMsNhEBgscb/WKh6ArWktgXcBvF4mJAsx/VchYT/jaS1DAT9NhzvRUS5SyIfOmJZfPu1dKEmAr2itO2V9M5XquyynHThZ/AE3YFiB2YVXtM/Nxc7YRPstfEAk1BTQb8Htc9sb/khw0vGuC+r9BeNE46XdL30Ld3efQGLSPF6I0UT/cgu4FL5HnMnJKanGq5I3bNwQToS7333zgW+P9YtQ1p9SkG0gR2wCV6/cCuCZU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNJcGGWDL1Gu7X9yLZZwAEpPhn0+Oa614ytkTGhPDjw=;
 b=hw0xmsoM4+mOlL2TaDu2Z7GyWJyR636PKR6FqA+7b5aHKMny1BelT5EUYS4XHL1aYWp7qplMeD6I+Dxs7xTzZqG/kl3pYFvIm9lTtdFR7bmX7x7dm2GbdO6Y9eKPS3UoVq477NeQL0+CfCcaY+PKXdxDF9XeafG6Lri2kt5X9ba/ysTg4G/p4j+25q8UBoFcXISUt4XcYmuVycn02LWOZTIGiHi5pBLyL71MwwmdBc6oNA/sKTb/df0EE26BAgT31MnCmzN6v0PBI0/f63W7tNQGi7g1IMbcwcDrJG27Fs+6r64uA3zzpIAs8qulktUON7Uz39m/p4fLqhR1BeoE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB3461.namprd12.prod.outlook.com (20.178.196.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Tue, 16 Jul 2019 14:59:58 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::e062:e81a:f029:ac69%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 14:59:58 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Thread-Topic: [Intel-gfx] [RFC][PATCH 0/2] drm: PATH prop for all connectors?
Thread-Index: AQHVIhft1cOEwK1eDEK/yedcz2d0QqbEnbaAgACS0oCACFmIAA==
Date: Tue, 16 Jul 2019 14:59:58 +0000
Message-ID: <97e2643d-c534-cfb5-bd27-4cf95c656104@amd.com>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
 <11bb4ca1d27d3ab2d169deb57951855c4ddcd563.camel@redhat.com>
 <20190711102923.3d219640@eldfell.localdomain>
In-Reply-To: <20190711102923.3d219640@eldfell.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2025aa4a-0fb7-40bd-3cf1-08d709fe44eb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3461; 
x-ms-traffictypediagnostic: BYAPR12MB3461:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB3461DFD97228086B526B93DA82CE0@BYAPR12MB3461.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(66446008)(110136005)(7736002)(316002)(53936002)(81166006)(66476007)(66946007)(6306002)(36756003)(5660300002)(81156014)(256004)(71190400001)(6246003)(99286004)(66556008)(486006)(4326008)(64756008)(8676002)(31696002)(68736007)(52116002)(305945005)(71200400001)(229853002)(966005)(14454004)(6436002)(25786009)(6116002)(478600001)(6486002)(3846002)(8936002)(86362001)(66066001)(54906003)(476003)(446003)(2906002)(6512007)(11346002)(186003)(76176011)(6506007)(26005)(102836004)(386003)(31686004)(53546011)(2616005)(558084003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3461;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +NfOgJknen0zLya3fAFMTwZmSuFkDJUHIU7X0K2hb5m9sV7pJTJo35NIy2js8tsd4ugtmhA1RUx5Qaq7CQvJmt4qWjBWiM94vu2F5oJJbKmaVlp1JAKtZw9TNJlhXPBXSkNofET9j0bRyB09OBFffBkxvKYMCz08c9elKomxlrzDwzFqsT0dPk3I2xxo/GqFP+a8Ncnf6gy5xTzdEZaFQNN9JFnB1ecrCq3SGvEDoZ6UE3Eai4dH5KBxAyAN3C6x6tY+kuoc294t3xh3f3ueiHk0X8zLYWZre2zwOhUxlLNiqS8ba7RQJhXUW8MHALTyL0nTv8w8Min9Fmi/6ISvd8THJhNc8EMdBkXhu6FhtLDplvYx7KNRwFc4hjGI+oJjq0JmBo1RBIBKUeHEcRKm1IQBfHf4lMP8l/fBt6wwt78=
Content-ID: <67350E6DFFB9214080C76A308461F42D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2025aa4a-0fb7-40bd-3cf1-08d709fe44eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 14:59:58.1293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3461
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNJcGGWDL1Gu7X9yLZZwAEpPhn0+Oa614ytkTGhPDjw=;
 b=1SOlXT82uNvuE8OMGNW6V9D3wT3E4I2Yx312oop6VY+TO8pfP93JN1xnow6Fy3NlwjbYhhPu4IY1hT5gvEG5HzpmamSp9V6QZ1neN8/PACpkENDrllW8iTmRw+ZoOhq5o80TIWWh6DQ0QpORUwXgw3lSyeUsSmSfw6F+M6koc20=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDctMTEgMzoyOSBhLm0uLCBQZWtrYSBQYWFsYW5lbiB3cm90ZToNCj4gV2Fp
dCwgb25lIGNhbiB3cml0ZSB1ZGV2IHJ1bGVzIGZvciBjb25uZWN0b3JzIGFuZCBzdHVmZj8NCj4g
SG93PyBXaGF0IGNhbiB0aGV5IGRvPw0KDQpJIHdhcyB1c2luZyBpdCB0byBnZW5lcmF0ZSB1c2Vy
LWZyaWVuZGx5IGRldmljZSBuYW1lcyBmb3IgdGhlIG1zdCBhdXgNCmltcGxlbWVudGF0aW9uOg0K
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzMxNTkwMC8/c2VyaWVzPTYz
MjM3JnJldj0yDQoNCkxlbw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
