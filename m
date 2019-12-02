Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D183F10E59C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 06:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28289F43;
	Mon,  2 Dec 2019 05:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E75189F43
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 05:55:19 +0000 (UTC)
Received: from AM6PR08CA0042.eurprd08.prod.outlook.com (2603:10a6:20b:c0::30)
 by DB7PR08MB3420.eurprd08.prod.outlook.com (2603:10a6:10:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.19; Mon, 2 Dec
 2019 05:55:15 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by AM6PR08CA0042.outlook.office365.com
 (2603:10a6:20b:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Mon, 2 Dec 2019 05:55:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Mon, 2 Dec 2019 05:55:15 +0000
Received: ("Tessian outbound d825562be5de:v37");
 Mon, 02 Dec 2019 05:55:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 835ec085f205b74a
X-CR-MTA-TID: 64aa7808
Received: from b07322a0e578.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 775CF5F6-37A5-4908-844D-F6183479093B.1; 
 Mon, 02 Dec 2019 05:55:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b07322a0e578.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Dec 2019 05:55:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKVr9nWuIjkcnyGH+3xN4Tr9PPAlo2bvS+ihi8Jt1mW0JycIqg//CKbgK10NH2WjLPpbexoWNcd6FX+lDPJHnoaLmJFAeaWz/xodSdR3CfckOzvBnR9EugIs8u5FnQQTddKSLS201VM4SR5kzws2hdChH1KM4PfkFFtlWhd3Gj0/sKzEHuti1yNDcUvuaAOev7T+i1aKrp2oYidERKQLVjPw7Ssq1WBdnezmOs3+rbj9YG8/U3f5KNKL/3shB1EqQcPPAY+EyQc4N46xqfNkrNHMZjlHUnbkV9RhwFhbYbcpf8QsmlaoLnU7h8xMZ0nDJMR1hZBl6vmhYhuu6tFIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu0ywmh8Op6Pnnx0qa/DnOESAk3onyOlDBKYJfANAJM=;
 b=I03txe1dBGy68jVue7fk67VkPR8apkapiunU+JYHPcebix37gpNW0OZb+8pDKYNo7NEiiP2CqsDxqGbo5so/fQhJiGHqVsXyapRWfKSiEVYHUQ77AFz0SdsBPKEzVom5+9ggDX9v35AU7J8lQtKLyWzjm+IzfjIdFUhXDU0wTKyfxFXxZBcx5y9UZ7cm0i8krIX4o8Ho2GNui9L+eQcebJk3uocMKyNlufG09pd5Rf7WCPItkxn0jIjBRIvJ0NPF/ef2PYXahwD9LYdB4vt3GJv8MY9rLMbxzwj4KBL4LSWRtNK7rvjPJ9mIaDv8usN38uM3OEo5q2baI01iMMqnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5021.eurprd08.prod.outlook.com (20.179.30.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 05:55:07 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 05:55:07 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [01/30] drm: Introduce drm_bridge_init()
Thread-Topic: [01/30] drm: Introduce drm_bridge_init()
Thread-Index: AQHVqNUM0g5O7Fjga0S0liny7wKZ4A==
Date: Mon, 2 Dec 2019 05:55:06 +0000
Message-ID: <20191202055459.GA25729@jamwan02-TSP300>
References: <20191126131541.47393-2-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-2-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0055.apcprd03.prod.outlook.com
 (2603:1096:202:17::25) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dd954c9b-902e-4a38-6632-08d776ec33ed
X-MS-TrafficTypeDiagnostic: VE1PR08MB5021:|VE1PR08MB5021:|DB7PR08MB3420:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB34201B02ABB98977DF43498DB3430@DB7PR08MB3420.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 0239D46DB6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(366004)(39860400002)(136003)(396003)(346002)(189003)(199004)(6862004)(25786009)(6116002)(86362001)(7736002)(81166006)(8676002)(8936002)(81156014)(33656002)(66066001)(3846002)(478600001)(66476007)(66556008)(64756008)(66946007)(99286004)(66446008)(6246003)(256004)(1076003)(316002)(58126008)(71200400001)(71190400001)(229853002)(2906002)(14454004)(305945005)(9686003)(4326008)(6512007)(54906003)(33716001)(186003)(26005)(102836004)(55236004)(446003)(6506007)(386003)(11346002)(52116002)(5024004)(6486002)(5660300002)(6436002)(6636002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5021;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rQMaSN52zmrdiMq8oTdmyf45Tjr+N2/uGoVOx42yaOwhA9jmhymf6KSjTQPlInwwANk1CiDpphtgxWb8pJljyqdcI13okzKgFrPLuHYkY4ZPfjGpqk2Pnl0oE6F2ftL1NBsekJH62btspc7hE/xaCrCEeMcRZLBa7fO3BcOOkpBCaV/LvTuL12wOrFLXenbibxS9HwMFuT/kcaEZ26dT4ogVeXI93XtWxgNUdpl3ePmwyu5SjkYOOxlcVJs32L6zz4kQHbj3yzkqbLhZ4lokhcoa0tXDa4igTMjQ8/0WgcY0ZJo7NL9nItzJxgaaT/Iq+eYLshRlXJUXgiVUIBSMZa/IBx/s6if+RolKvs+wilRRgBtMnS1vYZTcbkbR9sjhgvFyUSzTnIntWQh2MvHeWDQwspml9eae27MEgwKi2hc9+3mixsCHvMKH3EBNguLS
Content-ID: <01F5BB3228854F4EB5681FE677A8A873@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5021
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(86362001)(26826003)(106002)(186003)(336012)(33656002)(316002)(6862004)(22756006)(4326008)(81156014)(81166006)(6246003)(8676002)(5660300002)(8936002)(50466002)(1076003)(54906003)(229853002)(66066001)(8746002)(46406003)(99286004)(25786009)(6512007)(23726003)(478600001)(6486002)(58126008)(14454004)(356004)(47776003)(11346002)(305945005)(3846002)(6116002)(6506007)(97756001)(102836004)(386003)(26005)(76176011)(70586007)(70206006)(5024004)(76130400001)(2906002)(6636002)(9686003)(33716001)(7736002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3420;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a77e7c33-0d44-4183-ef6f-08d776ec2ed9
NoDisclaimer: True
X-Forefront-PRVS: 0239D46DB6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNk3lVSUAzOyboX0X7M/polkNxI5qQq14l3scchJ7bleMQYls6OC+T80klsGkiwlXe+IfQ5mLzMKP2OnD4cEHrbnYDRZWGA6banVHG862crAi7cIwau8/UAjhPElCxVudOZZx0vxlLdK2wRk6SVUF1bvkN6yIoX/FPQ43BB4Z2lyLb6C9Cgz2wupstmClJrbwcFMg8FE0OV0ylAN3TaBWNJouyyic+I1nypSG/Ma/UQjKIpK/dlCQB39lKY5g4ZIaz4jCV3mdkc91pkCkY2x1NNXivYroOnpmrl8a6LH4TAj/BC2UZJHBx3dvYz0e5y7hh+M6+PO06Vp4XymgegTZ54e2kH7zPg3DIflGglb+mgdH3PC+X3eWhWQD6VozlbUQDbjkqvj2CmGaa/yZqkYItFSl6saaIyteyBR7PWuuK4+OFf1anFu1CWX/MDKl93A
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 05:55:15.1229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd954c9b-902e-4a38-6632-08d776ec33ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3420
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu0ywmh8Op6Pnnx0qa/DnOESAk3onyOlDBKYJfANAJM=;
 b=I8YqMMsjvklNLJoOXQh2MN4zL3gf8R4BbW8abPmX0I934w20J+USKqTiPOc+rlnRJaMAsQwcP5TahQc/Ks7qTuT3A1sK03uTOF1jEbv1eTqLB/wk5LPhZwWJUW1vIv3Nw/Ex2vUhTj29VyB7cBBicwjBqkqi3Q6OqGzauu9UU0Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu0ywmh8Op6Pnnx0qa/DnOESAk3onyOlDBKYJfANAJM=;
 b=I8YqMMsjvklNLJoOXQh2MN4zL3gf8R4BbW8abPmX0I934w20J+USKqTiPOc+rlnRJaMAsQwcP5TahQc/Ks7qTuT3A1sK03uTOF1jEbv1eTqLB/wk5LPhZwWJUW1vIv3Nw/Ex2vUhTj29VyB7cBBicwjBqkqi3Q6OqGzauu9UU0Q=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDE6MTU6NTlQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBBIHNpbXBsZSBjb252ZW5pZW5jZSBmdW5jdGlvbiB0byBpbml0aWFsaXplIHRo
ZSBzdHJ1Y3QgZHJtX2JyaWRnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292
IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
YnJpZGdlLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2Ry
bS9kcm1fYnJpZGdlLmggICAgIHwgIDQgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMKPiBpbmRleCBjYmE1MzdjOTllNDMuLmNiZTY4
MGFhNmVhYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwo+IEBAIC04OSw2ICs4OSwzNSBAQCB2b2lk
IGRybV9icmlkZ2VfcmVtb3ZlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTChkcm1fYnJpZGdlX3JlbW92ZSk7Cj4gIAo+ICsvKioKPiArICogZHJtX2JyaWRn
ZV9pbml0IC0gaW5pdGlhbGlzZSBhIGRybV9icmlkZ2Ugc3RydWN0dXJlCj4gKyAqCj4gKyAqIEBi
cmlkZ2U6IGJyaWRnZSBjb250cm9sIHN0cnVjdHVyZQo+ICsgKiBAZnVuY3M6IGNvbnRyb2wgZnVu
Y3Rpb25zCj4gKyAqIEBkZXY6IGRldmljZQo+ICsgKiBAdGltaW5nczogdGltaW5nIHNwZWNpZmlj
YXRpb24gZm9yIHRoZSBicmlkZ2U7IG9wdGlvbmFsIChtYXkgYmUgTlVMTCkKPiArICogQGRyaXZl
cl9wcml2YXRlOiBwb2ludGVyIHRvIHRoZSBicmlkZ2UgZHJpdmVyIGludGVybmFsIGNvbnRleHQg
KG1heSBiZSBOVUxMKQo+ICsgKi8KPiArdm9pZCBkcm1fYnJpZGdlX2luaXQoc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSwgc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCSAgICAgY29uc3Qgc3RydWN0
IGRybV9icmlkZ2VfZnVuY3MgKmZ1bmNzLAo+ICsJCSAgICAgY29uc3Qgc3RydWN0IGRybV9icmlk
Z2VfdGltaW5ncyAqdGltaW5ncywKPiArCQkgICAgIHZvaWQgKmRyaXZlcl9wcml2YXRlKQo+ICt7
Cj4gKwlXQVJOX09OKCFmdW5jcyk7Cj4gKwo+ICsJYnJpZGdlLT5kZXYgPSBOVUxMOwo+ICsJYnJp
ZGdlLT5lbmNvZGVyID0gTlVMTDsKPiArCWJyaWRnZS0+bmV4dCA9IE5VTEw7Cj4gKwo+ICsjaWZk
ZWYgQ09ORklHX09GCj4gKwlicmlkZ2UtPm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gKyNlbmRp
Zgo+ICsJYnJpZGdlLT50aW1pbmdzID0gdGltaW5nczsKPiArCWJyaWRnZS0+ZnVuY3MgPSBmdW5j
czsKPiArCWJyaWRnZS0+ZHJpdmVyX3ByaXZhdGUgPSBkcml2ZXJfcHJpdmF0ZTsKCkNhbiB3ZSBk
aXJlY3RseSBwdXQgZHJtX2JyaWRnZV9hZGQoKSBoZXJlLiB0aGVuCi0gVXNlciBhbHdheXMgbmVl
ZCB0byBjYWxsIGJyaWRnZV9pbml0IGFuZCBhZGQgdG9nZXRoZXIuCi0gQ29uc2lzdGVudCB3aXRo
IG90aGVycyBsaWtlIGRybV9wbGFuZS9jcnRjX2luaXQgd2hpY2ggZGlyZWN0bHkgaGFzCiAgZHJt
X21vZGVfb2JqZWN0X2FkZCgpIGluIGl0LgoKSmFtZXMuCj4gK30KPiArRVhQT1JUX1NZTUJPTChk
cm1fYnJpZGdlX2luaXQpOwo+ICsKPiAgLyoqCj4gICAqIGRybV9icmlkZ2VfYXR0YWNoIC0gYXR0
YWNoIHRoZSBicmlkZ2UgdG8gYW4gZW5jb2RlcidzIGNoYWluCj4gICAqCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+IGlu
ZGV4IGMwYTIyODZhODFlOS4uZDZkOWQ1MzAxNTUxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9icmlkZ2UuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+IEBAIC00MDIs
NiArNDAyLDEwIEBAIHN0cnVjdCBkcm1fYnJpZGdlIHsKPiAgCj4gIHZvaWQgZHJtX2JyaWRnZV9h
ZGQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7Cj4gIHZvaWQgZHJtX2JyaWRnZV9yZW1vdmUo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7Cj4gK3ZvaWQgZHJtX2JyaWRnZV9pbml0KHN0cnVj
dCBkcm1fYnJpZGdlICpicmlkZ2UsIHN0cnVjdCBkZXZpY2UgKmRldiwKPiArCQkgICAgIGNvbnN0
IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzICpmdW5jcywKPiArCQkgICAgIGNvbnN0IHN0cnVjdCBk
cm1fYnJpZGdlX3RpbWluZ3MgKnRpbWluZ3MsCj4gKwkJICAgICB2b2lkICpkcml2ZXJfcHJpdmF0
ZSk7Cj4gIHN0cnVjdCBkcm1fYnJpZGdlICpvZl9kcm1fZmluZF9icmlkZ2Uoc3RydWN0IGRldmlj
ZV9ub2RlICpucCk7Cj4gIGludCBkcm1fYnJpZGdlX2F0dGFjaChzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsIHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIAkJICAgICAgc3RydWN0IGRy
bV9icmlkZ2UgKnByZXZpb3VzKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
