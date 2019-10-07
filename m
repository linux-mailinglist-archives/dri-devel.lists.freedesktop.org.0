Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6596CE507
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 16:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5F76E105;
	Mon,  7 Oct 2019 14:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810081.outbound.protection.outlook.com [40.107.81.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004B36E0F6;
 Mon,  7 Oct 2019 14:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8LXzHp3me9UrELlq6RoxJSeF6HrR7G/9eJa0L/u7Wr4AbNKmrrCwe1YGy3+lQ8L3xIxxk8q882BlklJgSKw1xc4kbk0CwyILvdASIc+0j9s1w9aWlaYQXNZmxAqdHcj0dFoJT/nlm7HqkqQ1eSDyB+tn7xj7xdK16mmiPk9HaG9lYYC1HgomEUtpz637SCtOss8YLI6deT7cxd/pKQ2GUIZ0FYSKqHsNtR0GaYVognlDZUtxx8Xn43n7BKH0xitdVGD22RuWs/RfpSKgBtuXTLxuZEBmqoyPz8li4Oy3A3NWFK6kChcSJ1m14nszRK1zGkcSi60YEKOa1U0AWADaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ9oeZr/EJWL7U6x8Iwu2aG83ISdqqTFhvSn0ZZ46XQ=;
 b=DZEpwvh5dMabWNSD/JpjTjnyNxfyL4+7/otry264qiWf3DepYNsE27BFqU8MvS30lCKE2cw9VAVJK/z2lAi9M4G+PdBTSIh251sNq4lhgMSLPxXrJnsbFJnbftZ1YahFK0Z/NuM/R1MZE69YkXApBcZNOWBITOlpzZPT6Pi+Qif/nK4dTUI/z0NkQm9L9n4bWUFehnTxC2NWr/UOFBPmmswVs4dsJ73gYpLz4CMJb2gVSCai4c8lBVXsgPIRZtlZGxPY75IAG9O/7dAS8MI8VPzAmn9nE/Gdn1qjo9cl03JUivi69dsoyjPVuzlbos5NOVg/ODS3knoHOA75amTyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0087.namprd12.prod.outlook.com (10.172.77.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 7 Oct 2019 14:19:33 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::5471:f58b:733e:1a61%7]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 14:19:33 +0000
From: Harry Wentland <hwentlan@amd.com>
To: zhengbin <zhengbin13@huawei.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/5] drm/amd/display: some fixes for gcc warning
Thread-Topic: [PATCH 0/5] drm/amd/display: some fixes for gcc warning
Thread-Index: AQHVeyXcDCGWMwPgokSFk3hzgoxnoadPPisA
Date: Mon, 7 Oct 2019 14:19:33 +0000
Message-ID: <85a8ffa0-6458-32fc-41b0-6e14dcdb61d8@amd.com>
References: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
x-clientproxiedby: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72df7e28-a93f-4453-3fb6-08d74b315fc3
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR1201MB0087:|CY4PR1201MB0087:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0087493D6EDF77C3ACA8837E8C9B0@CY4PR1201MB0087.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(189003)(199004)(76176011)(2616005)(478600001)(6116002)(65956001)(256004)(25786009)(6512007)(316002)(110136005)(26005)(476003)(2201001)(2501003)(3846002)(11346002)(186003)(446003)(58126008)(2906002)(31696002)(64756008)(6436002)(66446008)(66066001)(52116002)(66946007)(66476007)(66556008)(229853002)(99286004)(102836004)(6506007)(8676002)(31686004)(71200400001)(6246003)(6486002)(386003)(81156014)(36756003)(81166006)(53546011)(5660300002)(71190400001)(4744005)(14454004)(486006)(7736002)(8936002)(305945005)(65806001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0087;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EeSfP1vMTb66u/02lr8CWrx6Bnf8Ft5P82oO9p1Srk/AwKDLJicisvd4NswDumtopfK1WMl6cFMCTjXjwNrzE6aUTKqgoTYq+Hm7zaafPI6lF7g9RrLaBQterLaRZsyoiyshGybZG1IhgYqWcd9jbmHeFu2FdQ0ZWq9WuohIba5KTE9cgB0OFgnKY6O4Z6EUQsAHulp6lJzUw4puje7At5dKfNvqKJyu6sJ8BntAWAO7LV2FxppWCq8kgCLNTKnbCpEe8eywhgM50uPb56MWFPtHvnymhrg7hDTIvFuY9ctXWDAzgvOHMo2JoQdWxtT6M2+M/DEG51AvzJUpk9uHbt1uxYfF4+AFI/IwzXDSx8k+BzlI6ghp5W7fEEcVkVB9X9JTOBuqCTuZy6jqzFCwJ+2I11erDuRNPa6aRvwXgg4=
Content-ID: <62239618D1819D4EBC2136EE47B77940@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72df7e28-a93f-4453-3fb6-08d74b315fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 14:19:33.2734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wFOqtihG0kW5eVRXYOvP/8ZDvqwuTR4AJ1kQ/KTRj4cFm5jF13FYXGX0lX4RH4hr0rpSWt+Fr87bdEG6dBDW4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0087
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ9oeZr/EJWL7U6x8Iwu2aG83ISdqqTFhvSn0ZZ46XQ=;
 b=toDphosO5EFh3Dvl170x96skrM6CuoAIVjOUsQ/kwTy7UwnVL7z+SmNv1IlZ5PT7qNQfBdoiJuD2gvUJsWTGYhpf5cozgNLm1zW4aoZdokTt6sXJ+MPK8vgztXWqzaQjjQW2EUnwwuf4NnusgG40lyiQCQ/229Msnc4S5+Jm3wk=
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

U2VyaWVzIGlzDQpSZXZpZXdlZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFt
ZC5jb20+DQoNCkhhcnJ5DQoNCk9uIDIwMTktMTAtMDQgMTA6NDQgcC5tLiwgemhlbmdiaW4gd3Jv
dGU6DQo+IHpoZW5nYmluICg1KToNCj4gICBkcm0vYW1kL2Rpc3BsYXk6IE1ha2UgZnVuY3Rpb24g
d2FpdF9mb3JfYWx0X21vZGUgc3RhdGljDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgc2V0
IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAnc291cmNlX2JwcCcNCj4gICBkcm0vYW1kL2Rpc3BsYXk6
IFJlbW92ZSBzZXQgYnV0IG5vdCB1c2VkIHZhcmlhYmxlcw0KPiAgICAgJ2hfcmF0aW9fY2hyb21h
Jywndl9yYXRpb19jaHJvbWEnDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgc2V0IGJ1dCBu
b3QgdXNlZCB2YXJpYWJsZSAncGl4ZWxfd2lkdGgnDQo+ICAgZHJtL2FtZC9kaXNwbGF5OiBSZW1v
dmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZXMgJ3BwX3NtdScsJ29sZF9waXBlJw0KPiANCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyAgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNl
MTEwX2h3X3NlcXVlbmNlci5jIHwgMTIgLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHBwLmMgICAgICAgICAgICB8ICA3IC0tLS0tLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kd2Jfc2NsLmMg
ICAgICAgIHwgIDQgLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9y
Y19jYWxjLmMgICAgICAgICAgICAgICAgfCAgMyAtLS0NCj4gIDUgZmlsZXMgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDI3IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi43LjQNCj4gDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
