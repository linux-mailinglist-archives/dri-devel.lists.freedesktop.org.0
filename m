Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F5D8CD3C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 09:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50B66E287;
	Wed, 14 Aug 2019 07:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150088.outbound.protection.outlook.com [40.107.15.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFD56E287
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:52:36 +0000 (UTC)
Received: from VI1PR08CA0202.eurprd08.prod.outlook.com (2603:10a6:800:d2::32)
 by DB8PR08MB4954.eurprd08.prod.outlook.com (2603:10a6:10:bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Wed, 14 Aug
 2019 07:52:32 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0202.outlook.office365.com
 (2603:10a6:800:d2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.18 via Frontend
 Transport; Wed, 14 Aug 2019 07:52:32 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Wed, 14 Aug 2019 07:52:30 +0000
Received: ("Tessian outbound 1e6e633a5b56:v26");
 Wed, 14 Aug 2019 07:52:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10745c97b1bb1756
X-CR-MTA-TID: 64aa7808
Received: from dcc9ab17699d.1 (cr-mta-lb-1.cr-mta-net [104.47.9.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8E9E1E3-DFE3-46D5-A2A1-0D9CC6CD5309.1; 
 Wed, 14 Aug 2019 07:52:20 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcc9ab17699d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Aug 2019 07:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCE1hrZ/HEbaK+Z58i5CniKyBrp+A0Nh85geeikRKerGILAjKi8wF6RDVcgP+RLxso4eprOzYY4S81UR+WxT8C9UXgQnJqeXVTG8NcAxCI8rGreyXjjksQnqBkJuJfSmPXOsJnpUMtRDheIu7YQKwaJzxeyvu9bUzghvbRu1T/UiTzBOAXi2qukZKVU27a8C9IaM+AWSQonV27tUksE2Gfp/iBxYcHV02YjldW8Le/xSq+O3D+fa/6iw2/lsmkHWtwICSAxb9kkNSQY/1zR0KbIP9MWQf5Z539VjTL45HvWZTpwRFLMK4AegtnZEBuJryt1kaMVmuEIN9S2Vd8mSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+wzEMGoJS+V3upkxrH4uxBTjiCwXDOxOBJLcmpxmCw=;
 b=CZ58GhkBKuC7KGeLYjG4pRX8vVaTJp88GJXWKDsFxNXBLfZ+fzLHIJGAtreZAu1DMXN+dxL3PwhDA3RbUt4PczNIvPCDmmsennxJrS31NtY6d07usrZwH4vsQpltfSVvuJ77eoZTPRI4C6vf0RsqnI7QhqorvgQfuQJO5FJWmakp0KdH6gRoWkz3KhuVlAfGOtwAmzTcvfNZ2No1Nua/ao726Wb/kIZ9jvmUsF2TAOB1MO6lv/PHcKlzm/1dUQoBBuAbONzxcbCvmN1l8M5mG/ToxMyZmhx6JMotdCHuHm2GtnOHlzvdWbW1GsKa5NDEGJsOHAFrlls8widPQDdmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5038.eurprd08.prod.outlook.com (10.255.159.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Wed, 14 Aug 2019 07:52:18 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 07:52:18 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Topic: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Index: AQHVUZNrgGWWre2e4Eyh5LBkmfNYaKb41hsAgAFxGAA=
Date: Wed, 14 Aug 2019 07:52:18 +0000
Message-ID: <20190814075210.GA24984@jamwan02-TSP300>
References: <20190813045536.28239-1-james.qian.wang@arm.com>
 <20190813045536.28239-3-james.qian.wang@arm.com>
 <3902025.BCtzpz6JhW@e123338-lin>
In-Reply-To: <3902025.BCtzpz6JhW@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0014.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7fc61b69-cf84-4a27-c01f-08d7208c5c1e
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5038; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5038:|DB8PR08MB4954:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4954ACB40144E6BDC97BD700B3AD0@DB8PR08MB4954.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01294F875B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(189003)(199004)(6436002)(58126008)(5660300002)(316002)(26005)(186003)(6116002)(3846002)(305945005)(2906002)(66066001)(7736002)(71190400001)(33716001)(33656002)(71200400001)(8676002)(1076003)(54906003)(6862004)(386003)(478600001)(52116002)(6636002)(4326008)(14454004)(6246003)(81156014)(55236004)(66946007)(446003)(256004)(11346002)(14444005)(76176011)(6506007)(81166006)(6486002)(66556008)(66476007)(229853002)(66446008)(102836004)(9686003)(86362001)(99286004)(6512007)(8936002)(486006)(64756008)(476003)(25786009)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5038;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: z4pzWggcGcqrRcaJ3MQFHCdB56R9Wm/bGyH7YR1yhvg2+ea3kEx+VkF4Ni0Jr1kDLvLjfHPnQuzGt3857yIvjhsbznMRPbpW/IOrH3jW4T7jwx9Cx54w22xl+iqvPumqy3sOITiBtIIhehubwGKz1FsNLkW1laKbTBJo6OJoq8ztYvaeXCW+kRpfT2b6Ui7Y5DkyrQPxOAq8BHep41Xi4tOdDGHXYjjXUJv7nVYy85lr8yIKxvMXYzOyaRv9oFx5+AxxIDXTCNWjBUoXPzllmO3eoP5nFLv9ainRChvzo3RjoUy8eecqHOzCzINcuZxoizeQ4qvpGaBnzjFQlWRW8ZSfOjUSyouYq++CPr+JIG9TyfQASYtGAhsYqYKKQqHmHQ2U6Somy7wb2o/nSp5NmQLxkwdjJSVQ5T41vGjs82Q=
Content-ID: <1B6916E830453D4AB567C0609A6442AB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5038
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(199004)(189003)(46406003)(6486002)(446003)(26826003)(63350400001)(11346002)(63370400001)(486006)(229853002)(5660300002)(58126008)(476003)(336012)(316002)(47776003)(356004)(26005)(66066001)(6636002)(22756006)(1076003)(126002)(8676002)(33716001)(81156014)(76176011)(305945005)(70206006)(386003)(102836004)(8746002)(186003)(8936002)(97756001)(70586007)(54906003)(478600001)(14454004)(50466002)(2906002)(4326008)(25786009)(33656002)(3846002)(99286004)(36906005)(86362001)(23726003)(76130400001)(6116002)(6512007)(6246003)(9686003)(14444005)(7736002)(6506007)(6862004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4954;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b4f7a331-2f72-4362-a409-08d7208c5449
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB4954; 
NoDisclaimer: True
X-Forefront-PRVS: 01294F875B
X-Microsoft-Antispam-Message-Info: ONhATsDubV11M15gaBoassa3QI2IJo1CJ5EfWdg1/wOcKnsMbUNg+5SE5f9HtANDxzwVjXSfxST392PD6mG7PMMbr1PJyFZQx5QtKe5PFmH/lH6u8hll4xFnwDwBMvSNqulXi12l/RM4V4IboXmMTIDKwBKdoMPGLKzPQsxULgvoymYZ4/sUL4L6sovg4Zf7lr8NcN3K11JssNNfFjDy3cC61dNnEBLkcpIOuRzWmcZ8XOOIwz0pLYNzo2i77hIZAhs5gUb5I6nHa+EB1b1slFQDfcNyGJcum/psA0vZLpdjksJF+P+HdR29uP2TGYSb99vEK78gljqEjTtn0oekuOeC7oCQ9cDOSuVQ0OosAW+2LP8tUqNNQfw93mUH0TFfDQk+4FKES8xDBkaB+afykdihW+zgSOUIHwg6C4NCzWI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2019 07:52:30.8303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc61b69-cf84-4a27-c01f-08d7208c5c1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4954
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+wzEMGoJS+V3upkxrH4uxBTjiCwXDOxOBJLcmpxmCw=;
 b=FenbPZVtutROnrludoI0kajh3dszztK0WLGZ8+YqrtDRlqUUZo1MsSyu8zarojLJxuhPghS2dReGiBi4kPsB73dqcKeTKby3YwtFHng9DLqoVGrjyki9vf0joNPXURcaKCjkQxtQ0XtMSf3ZjuFA0D32VikbDF243/ME4iS9VDg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+wzEMGoJS+V3upkxrH4uxBTjiCwXDOxOBJLcmpxmCw=;
 b=FenbPZVtutROnrludoI0kajh3dszztK0WLGZ8+YqrtDRlqUUZo1MsSyu8zarojLJxuhPghS2dReGiBi4kPsB73dqcKeTKby3YwtFHng9DLqoVGrjyki9vf0joNPXURcaKCjkQxtQ0XtMSf3ZjuFA0D32VikbDF243/ME4iS9VDg=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDk6NTE6MDhBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBIaSBKYW1lcywKPiAKPiBPbiBUdWVzZGF5LCAxMyBBdWd1c3QgMjAxOSAwNTo1
NjowNyBCU1QgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4g
PiBNYW55IGtvbWVkYSBjb21wb25lbnQgc3VwcG9ydCBjb2xvciBtYW5hZ2VtZW50IGxpa2UgbGF5
ZXIgYW5kIElQUywgc28KPiA+IGtvbWVkYV9jb2xvcl9tYW5hZ2VyL3N0YXRlIGFyZSBpbnRyb2R1
Y2VkIHRvIG1hbmFnZXIgZ2FtbWEsIGNzYyBhbmQgZGVnYW1tYQo+ID4gdG9nZXRoZXIgZm9yIGVh
c2lseSBzaGFyZSBpdCB0byBtdWx0aXBsZSBjb21wb25wZW50Lgo+ID4gCj4gPiBBbmQgZm9yIGtv
bWVkYV9jb2xvcl9tYW5hZ2VyIHdoaWNoOgo+ID4gLSBjb252ZXJ0IGRybSAzZCBnYW1tYSBsdXQg
dG8ga29tZWRhIHNwZWNpZmljIGdhbW1hIGNvZWZmcwo+ID4gLSBnYW1tYSB0YWJsZSBtYW5hZ2Vt
ZW50IGFuZCBoaWRlIHRoZSBIVyBkaWZmZXJlbmNlIGZvciBrb21lZGEtQ09SRQo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFt
ZXMucWlhbi53YW5nQGFybS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCAxMjYgKysrKysrKysrKysrKysrKysrCj4gPiAgLi4u
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oICAgIHwgIDMyICsrKystCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NvbG9yX21nbXQuYwo+ID4gaW5kZXggOWQxNGE5MmRiYjE3Li5iZjIzODhkNjQxYjkgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9j
b2xvcl9tZ210LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NvbG9yX21nbXQuYwo+ID4gQEAgLTQsNyArNCw5IEBACj4gPiAgICogQXV0aG9yOiBK
YW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gICAqCj4gPiAgICov
Cj4gPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiA+ICAKPiA+ICsjaW5jbHVkZSAibWFs
aWRwX3V0aWxzLmgiCj4gPiAgI2luY2x1ZGUgImtvbWVkYV9jb2xvcl9tZ210LmgiCj4gPiAgCj4g
PiAgLyogMTBiaXQgcHJlY2lzaW9uIFlVVjJSR0IgbWF0cml4ICovCj4gPiBAQCAtNjUsMyArNjcs
MTI3IEBAIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3Jf
ZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSkKPiA+ICAKPiA+ICAJcmV0dXJuIGNvZWZmczsKPiA+
ICB9Cj4gPiArCj4gPiArc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciB7Cj4gPiArCXUzMiBib3Vu
ZGFyeV9zdGFydDsKPiA+ICsJdTMyIG51bV9vZl9zZWdtZW50czsKPiA+ICsJdTMyIHNlZ21lbnRf
d2lkdGg7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VnbWVudCB7Cj4g
PiArCXUzMiBzdGFydDsKPiA+ICsJdTMyIGVuZDsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBz
dHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIHNlY3Rvcl90YmxbXSA9IHsKPiA+ICsJeyAwLCAgICA0
LCAgNCAgIH0sCj4gPiArCXsgMTYsICAgNCwgIDQgICB9LAo+ID4gKwl7IDMyLCAgIDQsICA4ICAg
fSwKPiA+ICsJeyA2NCwgICA0LCAgMTYgIH0sCj4gPiArCXsgMTI4LCAgNCwgIDMyICB9LAo+ID4g
Kwl7IDI1NiwgIDQsICA2NCAgfSwKPiA+ICsJeyA1MTIsICAxNiwgMzIgIH0sCj4gPiArCXsgMTAy
NCwgMjQsIDEyOCB9LAo+ID4gK307Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBnYW1tYV9jdXJ2
ZV9zZWN0b3IgaWdhbW1hX3NlY3Rvcl90YmxbXSA9IHsKPiA+ICsJezAsIDY0LCA2NH0sCj4gPiAr
fTsKPiA+ICsKPiA+ICtzdGF0aWMgdm9pZAo+ID4gK2RybV9sdXRfdG9fY29lZmZzKHN0cnVjdCBk
cm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzLAo+ID4gKwkJICBzdHJ1Y3Qg
Z2FtbWFfY3VydmVfc2VjdG9yICpzZWN0b3JfdGJsLCB1MzIgbnVtX3NlY3RvcnMpCj4gPiArewo+
ID4gKwlzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqbHV0Owo+ID4gKwl1MzIgaSwgaiwgaW4sIG51bSA9
IDA7Cj4gPiArCj4gPiArCWlmICghbHV0X2Jsb2IpCj4gPiArCQlyZXR1cm47Cj4gPiArCj4gPiAr
CWx1dCA9IGx1dF9ibG9iLT5kYXRhOwo+ID4gKwo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbnVtX3Nl
Y3RvcnM7IGkrKykgewo+ID4gKwkJZm9yIChqID0gMDsgaiA8IHNlY3Rvcl90YmxbaV0ubnVtX29m
X3NlZ21lbnRzOyBqKyspIHsKPiA+ICsJCQlpbiA9IHNlY3Rvcl90YmxbaV0uYm91bmRhcnlfc3Rh
cnQgKwo+ID4gKwkJCSAgICAgaiAqIHNlY3Rvcl90YmxbaV0uc2VnbWVudF93aWR0aDsKPiA+ICsK
PiA+ICsJCQljb2VmZnNbbnVtKytdID0gZHJtX2NvbG9yX2x1dF9leHRyYWN0KGx1dFtpbl0ucmVk
LAo+ID4gKwkJCQkJCUtPTUVEQV9DT0xPUl9QUkVDSVNJT04pOwo+ID4gKwkJfQo+ID4gKwl9Cj4g
PiArCj4gPiArCWNvZWZmc1tudW1dID0gQklUKEtPTUVEQV9DT0xPUl9QUkVDSVNJT04pOwo+ID4g
K30KPiA+ICsKPiA+ICt2b2lkIGRybV9sdXRfdG9faWdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3By
b3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcykKPiA+ICt7Cj4gPiArCWRybV9sdXRf
dG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMsCj4gPiArCQkJICBpZ2FtbWFfc2VjdG9yX3RibCwg
QVJSQVlfU0laRShpZ2FtbWFfc2VjdG9yX3RibCkpOwo+ID4gK30KPiA+ICsKPiA+ICt2b2lkIGRy
bV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9i
LCB1MzIgKmNvZWZmcykKPiA+ICt7Cj4gPiArCWRybV9sdXRfdG9fY29lZmZzKGx1dF9ibG9iLCBj
b2VmZnMsCj4gPiArCQkJICBzZWN0b3JfdGJsLCBBUlJBWV9TSVpFKHNlY3Rvcl90YmwpKTsKPiA+
ICt9Cj4gPiArCj4gPiArdm9pZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5
X2Jsb2IgKmN0bV9ibG9iLCB1MzIgKmNvZWZmcykKPiA+ICt7Cj4gPiArCXN0cnVjdCBkcm1fY29s
b3JfY3RtICpjdG07Cj4gPiArCXUzMiBpOwo+ID4gKwo+ID4gKwlpZiAoIWN0bV9ibG9iKQo+ID4g
KwkJcmV0dXJuOwo+ID4gKwo+ID4gKwljdG0gPSBjdG1fYmxvYi0+ZGF0YTsKPiA+ICsKPiA+ICsJ
Zm9yIChpID0gMDsgaSA8IEtPTUVEQV9OX0NUTV9DT0VGRlM7ICsraSkgewo+ID4gKwkJLyogQ29u
dmVydCBmcm9tIFMzMS4zMiB0byBRMy4xMi4gKi8KPiA+ICsJCXM2NCB2ID0gY3RtLT5tYXRyaXhb
aV07Cj4gPiArCj4gPiArCQljb2VmZnNbaV0gPSBjbGFtcF92YWwodiwgMSAtICgxTEwgPDwgMzQp
LCAoMUxMIDw8IDM0KSAtIDEpID4+IDIwOwo+IENUTSBtYXRyaXggdmFsdWVzIGFyZSBTMzEuMzIs
IGkuZS4gc2lnbi1tYWduaXR1ZGUsIHNvIGNsYW1wX3ZhbCB3b24ndAo+IGdpdmUgeW91IHRoZSBy
aWdodCByZXN1bHQgZm9yIG5lZ2F0aXZlIGNvZWZmcy4gU2VlCj4gbWFsaWRwX2NydGNfYXRvbWlj
X2NoZWNrX2N0bSBmb3IgdGhlIHNpZ24tbWFnIC0+IDIncyBjb21wbGVtZW50Cj4gY29udmVyc2lv
bi4KClRoYW5rIHlvdSBNaWhhaWwgZm9yIHBvaW50aW5nIHRoaXMgb3V0LgoKTm8gbWF0dGVyIG91
ciB1c2VyIG9yIGtlcm5lbCBhbGwgYXNzdW1lIHRoaXMgczMxLjMyIGFzIDIncyBjb21wbGVtZW50
LiAKd2UgbmVlZCB0byBjb3JyZWN0IHRoZW0gYm90aC4KCj4gPiArCX0KPiA+ICt9Cj4gPiArCj4g
PiArdm9pZCBrb21lZGFfY29sb3JfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBrb21lZGFfY29sb3Jf
c3RhdGUgKm5ldywKPiA+ICsJCQkJICBzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpvbGQpCj4g
W2Jpa2VzaGVkXSBub3QgcmVhbGx5IGEgX2R1cGxpY2F0ZV9zdGF0ZSBpZiBhbGwgaXQgZG9lcyBp
cyByZWZjb3VudHMuCj4ga21lbWR1cCBoZXJlIGFuZCByZXR1cm4gYSBwb2ludGVyICh3aXRoIEVS
Ul9QVFIgb24gZmFpbCksIG9yIG1lbWNweSBpZgo+IHlvdSB3YW50IHRvIGtlZXAgdGhlIHNpZ25h
dHVyZT8KClllcywgdGhlIGR1cCBtb3N0bHkgc2hvdWxkIHJldHVybiBhIG5ldyBwdHIgZnJvbSBh
IG9sZCwgdGhlIGR1cCBuYW1lIGhlcmUKaXMgbm90IGFjY3VyYXRlLgp0aGUgcmVhc29uIGlzIHRo
ZSBjb2xvcl9zdGF0ZSBpcyBub3QgYSBzZXBhcmF0ZWQgc3RydWN0dXJlIGJ1dCBhbHdheXMKZW1i
ZWRkZWQgaW50byBsYXllcl9zdGF0ZSwgYnV0IEkgd2FudCB0byBtYWtlIGFsbCBjb2xvcl9zdGF0
ZSBvcGVyYXRpb24KaW50byBhIGZ1bmMuCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uID8KCj4g
PiArewo+ID4gKwluZXctPmlnYW1tYSA9IGtvbWVkYV9jb2VmZnNfZ2V0KG9sZC0+aWdhbW1hKTsK
PiA+ICsJbmV3LT5mZ2FtbWEgPSBrb21lZGFfY29lZmZzX2dldChvbGQtPmZnYW1tYSk7Cj4gPiAr
fQo+ID4gKwo+ID4gK3ZvaWQga29tZWRhX2NvbG9yX2NsZWFudXBfc3RhdGUoc3RydWN0IGtvbWVk
YV9jb2xvcl9zdGF0ZSAqY29sb3Jfc3QpCj4gPiArewo+ID4gKwlrb21lZGFfY29lZmZzX3B1dChj
b2xvcl9zdC0+aWdhbW1hKTsKPiA+ICsJa29tZWRhX2NvZWZmc19wdXQoY29sb3Jfc3QtPmZnYW1t
YSk7Cj4gPiArfQo+ID4gKwo+ID4gK2ludCBrb21lZGFfY29sb3JfdmFsaWRhdGUoc3RydWN0IGtv
bWVkYV9jb2xvcl9tYW5hZ2VyICptZ3IsCj4gPiArCQkJICBzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0
YXRlICpzdCwKPiA+ICsJCQkgIHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqaWdhbW1hX2Jsb2Is
Cj4gPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmZnYW1tYV9ibG9iKQo+ID4gK3sK
PiA+ICsJdTMyIGNvZWZmc1tLT01FREFfTl9HQU1NQV9DT0VGRlNdOwo+ID4gKwo+ID4gKwlrb21l
ZGFfY29sb3JfY2xlYW51cF9zdGF0ZShzdCk7Cj4gPiArCj4gPiArCWlmIChpZ2FtbWFfYmxvYikg
ewo+ID4gKwkJZHJtX2x1dF90b19pZ2FtbWFfY29lZmZzKGlnYW1tYV9ibG9iLCBjb2VmZnMpOwo+
ID4gKwkJc3QtPmlnYW1tYSA9IGtvbWVkYV9jb2VmZnNfcmVxdWVzdChtZ3ItPmlnYW1tYV9tZ3Is
IGNvZWZmcyk7Cj4gPiArCQlpZiAoIXN0LT5pZ2FtbWEpIHsKPiA+ICsJCQlEUk1fREVCVUdfQVRP
TUlDKCJyZXF1ZXN0IGlnYW1tYSB0YWJsZSBmYWlsZWQuXG4iKTsKPiA+ICsJCQlyZXR1cm4gLUVC
VVNZOwo+ID4gKwkJfQo+ID4gKwl9Cj4gPiArCj4gPiArCWlmIChmZ2FtbWFfYmxvYikgewo+ID4g
KwkJZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKGZnYW1tYV9ibG9iLCBjb2VmZnMpOwo+ID4gKwkJ
c3QtPmZnYW1tYSA9IGtvbWVkYV9jb2VmZnNfcmVxdWVzdChtZ3ItPmZnYW1tYV9tZ3IsIGNvZWZm
cyk7Cj4gPiArCQlpZiAoIXN0LT5mZ2FtbWEpIHsKPiA+ICsJCQlEUk1fREVCVUdfQVRPTUlDKCJy
ZXF1ZXN0IGZnYW1tYSB0YWJsZSBmYWlsZWQuXG4iKTsKPiA+ICsJCQlyZXR1cm4gLUVCVVNZOwo+
ID4gKwkJfQo+ID4gKwl9Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210
LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210
LmgKPiA+IGluZGV4IGEyZGYyMThmNThlNy4uNDFhOTZiM2I1NDBmIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9t
Z210LmgKPiA+IEBAIC00LDE0ICs0LDQyIEBACj4gPiAgICogQXV0aG9yOiBKYW1lcy5RaWFuLldh
bmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gICAqCj4gPiAgICovCj4gPiAtCj4gPiAg
I2lmbmRlZiBfS09NRURBX0NPTE9SX01HTVRfSF8KPiA+ICAjZGVmaW5lIF9LT01FREFfQ09MT1Jf
TUdNVF9IXwo+ID4gIAo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9yX21nbXQuaD4KPiA+ICsj
aW5jbHVkZSAia29tZWRhX2NvZWZmcy5oIgo+ID4gIAo+ID4gICNkZWZpbmUgS09NRURBX05fWVVW
MlJHQl9DT0VGRlMJCTEyCj4gPiArI2RlZmluZSBLT01FREFfTl9SR0IyWVVWX0NPRUZGUwkJMTIK
PiA+ICsjZGVmaW5lIEtPTUVEQV9DT0xPUl9QUkVDSVNJT04JCTEyCj4gPiArI2RlZmluZSBLT01F
REFfTl9HQU1NQV9DT0VGRlMJCTY1Cj4gPiArI2RlZmluZSBLT01FREFfQ09MT1JfTFVUX1NJWkUJ
CUJJVChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKQoKPiBJIGRvbid0IHNlZSBob3cgdGhlIG51bWJl
ciBvZiBMVVQgZW50cmllcyBoYXMgYW55dGhpbmcgdG8gZG8gd2l0aCB0aGUKPiBiaXQtcHJlY2lz
aW9uIG9mIGVhY2ggZW50cnkuCgpCZWNhdXNlIG91ciBrb21lZGEgY29sb3IgaXMgMTItYml0IHBy
ZWNpc29uLCBhbmQgZm9yIDEgdnMgMSBsb29wdXAKdGFibGUsIHdlIG5lZWQgQklUKDEyKSBlbnRy
aWVzLgoKVGhhbmsgeW91CkphbWVzCgo+ID4gKyNkZWZpbmUgS09NRURBX05fQ1RNX0NPRUZGUwkJ
OQo+ID4gKwo+ID4gK3N0cnVjdCBrb21lZGFfY29sb3JfbWFuYWdlciB7Cj4gPiArCXN0cnVjdCBr
b21lZGFfY29lZmZzX21hbmFnZXIgKmlnYW1tYV9tZ3I7Cj4gPiArCXN0cnVjdCBrb21lZGFfY29l
ZmZzX21hbmFnZXIgKmZnYW1tYV9tZ3I7Cj4gPiArCWJvb2wgaGFzX2N0bTsKPiA+ICt9Owo+ID4g
Kwo+ID4gK3N0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgewo+ID4gKwlzdHJ1Y3Qga29tZWRhX2Nv
ZWZmc190YWJsZSAqaWdhbW1hOwo+ID4gKwlzdHJ1Y3Qga29tZWRhX2NvZWZmc190YWJsZSAqZmdh
bW1hOwo+ID4gK307Cj4gPiArCj4gPiArdm9pZCBrb21lZGFfY29sb3JfZHVwbGljYXRlX3N0YXRl
KHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKm5ldywKPiA+ICsJCQkJICBzdHJ1Y3Qga29tZWRh
X2NvbG9yX3N0YXRlICpvbGQpOwo+ID4gK3ZvaWQga29tZWRhX2NvbG9yX2NsZWFudXBfc3RhdGUo
c3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqY29sb3Jfc3QpOwo+ID4gK2ludCBrb21lZGFfY29s
b3JfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9tYW5hZ2VyICptZ3IsCj4gPiArCQkJICBz
dHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpzdCwKPiA+ICsJCQkgIHN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqaWdhbW1hX2Jsb2IsCj4gPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2Ig
KmZnYW1tYV9ibG9iKTsKPiA+ICsKPiA+ICt2b2lkIGRybV9sdXRfdG9faWdhbW1hX2NvZWZmcyhz
dHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7Cj4gPiArdm9p
ZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRf
YmxvYiwgdTMyICpjb2VmZnMpOwo+ID4gK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3RydWN0IGRy
bV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpOwo+ID4gIAo+ID4gIGNvbnN0
IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUz
MiBjb2xvcl9yYW5nZSk7Cj4gPiAgCj4gPiAtI2VuZGlmCj4gPiArI2VuZGlmIC8qX0tPTUVEQV9D
T0xPUl9NR01UX0hfKi8KPiA+IAo+IAo+IEJSLAo+IE1paGFpbAo+IAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
