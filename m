Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6FA113D60
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 09:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE46F603;
	Thu,  5 Dec 2019 08:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6776F615
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 08:53:15 +0000 (UTC)
Received: from VI1PR08CA0159.eurprd08.prod.outlook.com (2603:10a6:800:d1::13)
 by DB7PR08MB3227.eurprd08.prod.outlook.com (2603:10a6:5:1f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Thu, 5 Dec
 2019 08:53:11 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR08CA0159.outlook.office365.com
 (2603:10a6:800:d1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Thu, 5 Dec 2019 08:53:10 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 08:53:10 +0000
Received: ("Tessian outbound 1e3e4a1147b7:v37");
 Thu, 05 Dec 2019 08:53:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4be44e811d08ee72
X-CR-MTA-TID: 64aa7808
Received: from 4ef3277b09ea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1061346F-8102-4005-9A60-57FDDC9DE735.1; 
 Thu, 05 Dec 2019 08:53:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ef3277b09ea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Dec 2019 08:53:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNV4BadoukXlOFRHuZ0NbPkhZZvwgXPv88zomHygjgLtyKTsaJ7cTz7YLz4IgKdCpy4c86tLmZsxgOJMiyo4OwAVtoOcl4l3XDRV8MNRFiutCmSwbkO4Vmdnw3hcaq4lGQ/7CBjhoFjyBNF1bhIn8T8fWFV3Ia4JLf9jV/yrO8PJk1tWMT1GjXvx6Z0gTDqFD0Pdqt7Rtyq0JIS6Rw3we9i5sg/iGSHqjMNtQc0i0v61trDE5I7KkKBs7gwn0sPp8AyXFYgMp8CdCJHKr7JC14ibGbTI1VXroP5AtYDDEEowmWDZ+KW/NS/UCqa9bmoPREAEP9Hp3DJt/L5s7nz+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXDfAQ8ZqwuYaMoIouNhcfirddFXMrV/He5r86420kY=;
 b=nR4gdnQulaiV8E+vQx7z2d+pI6wP6pT9C+yjvSDTu7QNJvKFyqDFW2Uic70jWJCCdFhh9a2No5QjSV8sV5kG/O6UeqZ1BlQqGw1y885Y27i8u8e7/fwPoCwnOXOaL/odMYX9M8Uks1scJgh8ayAX+syw1tJwsTnLzTXWQQKropkrdo8Ue0nMAhnNJs5Qb89N3zqL0ZBrACzdlYduqCT731boJBe+v3QM+W6j7Pv7cQ/GPpjW0LShIz2gWsdxdzsZRarD9Hy9e4x6o+SEc9QJXBSRMvNYAZfGETWF5QDsC0aAuRBRIZAkDb5uMz0sRRcED8RRyu/PRWmg7wLZdVlQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5151.eurprd08.prod.outlook.com (20.179.31.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 5 Dec 2019 08:53:03 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Thu, 5 Dec 2019
 08:53:03 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVoEQnHODp0nh43k+zk6WDkpPTxKemwPIAgAFJKYCAADYygIADEfAA
Date: Thu, 5 Dec 2019 08:53:02 +0000
Message-ID: <20191205085256.GA11212@jamwan02-TSP300>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
 <15788924.1fOzIsmBsr@e123338-lin> <20191203064559.GA17018@jamwan02-TSP300>
 <2125422.nYgIr5rE5T@e123338-lin>
In-Reply-To: <2125422.nYgIr5rE5T@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94025096-d300-4f04-81d1-08d779608e33
X-MS-TrafficTypeDiagnostic: VE1PR08MB5151:|VE1PR08MB5151:|DB7PR08MB3227:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB32271711E030740D3ED89FEDB35C0@DB7PR08MB3227.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(66556008)(66476007)(66946007)(64756008)(66446008)(8936002)(33656002)(81156014)(6636002)(26005)(81166006)(8676002)(2906002)(86362001)(305945005)(229853002)(6436002)(7736002)(6486002)(5660300002)(6512007)(9686003)(3846002)(6116002)(1076003)(4326008)(6862004)(76176011)(11346002)(25786009)(33716001)(99286004)(52116002)(316002)(58126008)(6246003)(186003)(54906003)(14454004)(6506007)(71190400001)(55236004)(102836004)(14444005)(478600001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5151;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DsGM2b4UKqJv0HCqi/z0SBr5HMDe3qyrxTJ+Gb53Sr0Mj6vYuTDIeuvi7lnZDIEscxmwdxcY/91X7wQqmOfgyCijg0ohgut1Vaz1HmbT8B67vqOIP1jCBkaYjGS7FDH6ql9gpIQUqJHfyBcFrPYxkDmUfPAVva47ftaqJ3+xd2fjKxkYi803xaLmY0nMc2aHQlaRwXK8ix1ihR3SXcgmiyLu8/RY0Aq0BqNwK2EtbcxWCKUbBdWUBBzQn4CW8oEJq2Q3rBA8kM+3FilnA3IiJowSs1tcKa+359TtFEo8JC+s7I9+Woq+wNBQoZZGwWMn/LvMZOwpgDmFmx9QbRciYyvyi7BK/VjNWKDHbrzzKDorUshobAXZVZINJ2tFIh7oI4NAwek+ceg4P3VrU7BEusKHgtk0LjGlwXT4KDKo7P8HBvNO1/XQ3qfjJNoeWN4R
Content-ID: <D3205F69480ACE44B1635AD6C259A461@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5151
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(6486002)(9686003)(6512007)(22756006)(14444005)(50466002)(23726003)(3846002)(6116002)(478600001)(26826003)(33716001)(25786009)(76176011)(356004)(97756001)(316002)(54906003)(99286004)(58126008)(336012)(11346002)(6506007)(46406003)(6246003)(86362001)(229853002)(186003)(14454004)(6862004)(102836004)(4326008)(26005)(33656002)(8936002)(70206006)(70586007)(8746002)(76130400001)(81156014)(8676002)(81166006)(6636002)(305945005)(5660300002)(7736002)(1076003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3227;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6a4ce101-22ae-4b97-f32a-08d779608976
NoDisclaimer: True
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8W+9dqPzOcrfjr45eM9UGIwkS6g0UaiIyeALbweGBh1I1TQxpGDym+WJAF9mufs8TLcYLN7MbjCZrNlOYkIkX8JrsQC4zB92wfpi+wN8atnx8sgAyI6me/DOWcjtHkenKRYcgEWipW1KKtDMV5NiBCFDXuFxvBnVvnTklzbl+OGefEnpt+CotiOFG0gr9KYYwEu5wz5s5pI5N6fZsFzCU9NMMz8dQgquCxzYHf3qW8SE352uz0Vyjg2UXslxrukRvgImcXeUWeMfjFMu8denf1RxW5MJ1x+4iEaoXB3c9HqR9lctJ+VjOjgPOQiQEITDTCDLLD6lEex2cbvEAkEsrd5lzvedlITniYfHZmKVF0D1isYWtXAo/fvPetfmqCVXDDyAuhtf0LBXTSpGnQ8Uyc8Gt+05UAODrUjN+N0ZQ0vm/e34EtefUXbKO1OesHwq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 08:53:10.5095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94025096-d300-4f04-81d1-08d779608e33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3227
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXDfAQ8ZqwuYaMoIouNhcfirddFXMrV/He5r86420kY=;
 b=8qxyH1miwiUqYphPSFAtZSg1NjlfIHbmmscBvvAP71bCUuuBgV/cR9a3vxFAim6b2RWgc4j+s1v+gEXYJ0j0oaC1IT3q6zfIb5YNo55abPI7F0GF3RtBDsmTfAzxjstev+shmNUbUbu1x3yTR5mwtj/76DP08h5nmpSHYqRLC0c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXDfAQ8ZqwuYaMoIouNhcfirddFXMrV/He5r86420kY=;
 b=8qxyH1miwiUqYphPSFAtZSg1NjlfIHbmmscBvvAP71bCUuuBgV/cR9a3vxFAim6b2RWgc4j+s1v+gEXYJ0j0oaC1IT3q6zfIb5YNo55abPI7F0GF3RtBDsmTfAzxjstev+shmNUbUbu1x3yTR5mwtj/76DP08h5nmpSHYqRLC0c=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDk6NTk6NTdBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBUdWVzZGF5LCAzIERlY2VtYmVyIDIwMTkgMDY6NDY6MDYgR01UIGphbWVz
IHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gT24gTW9uLCBEZWMg
MDIsIDIwMTkgYXQgMTE6MDc6NTJBTSArMDAwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToKPiA+
ID4gT24gVGh1cnNkYXksIDIxIE5vdmVtYmVyIDIwMTkgMDg6MTc6NDUgR01UIGphbWVzIHFpYW4g
d2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+IEQzMiBpcyBzaW1wbGUg
dmVyc2lvbiBvZiBENzEsIHRoZSBkaWZmZXJlbmNlIGlzOgo+ID4gPiA+IC0gT25seSBoYXMgb25l
IHBpcGVsaW5lCj4gPiA+ID4gLSBEcm9wIHRoZSBwZXJpcGggYmxvY2sgYW5kIG1lcmdlIGl0IHRv
IEdDVQo+ID4gPiA+IAo+ID4gPiA+IHYyOiBSZWJhc2UuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFp
YW4ud2FuZ0Bhcm0uY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAuLi4vZHJtL2FybS9kaXNwbGF5
L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaCAgfCAgMyArLQo+ID4gPiA+ICAuLi4vYXJtL2Rpc3Bs
YXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAgMiArLQo+ID4gPiA+ICAuLi4vZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgfCA0MyArKysrKysrKysrKyst
LS0tLS0tCj4gPiA+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3Jl
Z3MuaCB8IDEzICsrKysrKwo+ID4gPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rydi5jICAgfCAgMSArCj4gPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmggYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gPiA+ID4g
aW5kZXggOTZlMmU0MDE2MjUwLi5kYmQzZDQ3NjUwNjUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0
LmgKPiA+ID4gPiBAQCAtMTgsNyArMTgsOCBAQAo+ID4gPiA+ICAjZGVmaW5lIE1BTElEUF9DT1JF
X0lEX1NUQVRVUyhfX2NvcmVfaWQpICAgICAoKChfX3UzMikoX19jb3JlX2lkKSkgJiAweEZGKQo+
ID4gPiA+ICAKPiA+ID4gPiAgLyogTWFsaS1kaXNwbGF5IHByb2R1Y3QgSURzICovCj4gPiA+ID4g
LSNkZWZpbmUgTUFMSURQX0Q3MV9QUk9EVUNUX0lEICAgMHgwMDcxCj4gPiA+ID4gKyNkZWZpbmUg
TUFMSURQX0Q3MV9QUk9EVUNUX0lECTB4MDA3MQo+ID4gPiA+ICsjZGVmaW5lIE1BTElEUF9EMzJf
UFJPRFVDVF9JRAkweDAwMzIKPiA+ID4gPiAgCj4gPiA+ID4gIHVuaW9uIGtvbWVkYV9jb25maWdf
aWQgewo+ID4gPiA+ICAJc3RydWN0IHsKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiA+ID4gaW5kZXgg
NmRhZGY0NDEzZWYzLi5jN2Y3ZTljNTQ1YzcgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5j
Cj4gPiA+ID4gQEAgLTEyNzQsNyArMTI3NCw3IEBAIHN0YXRpYyBpbnQgZDcxX3RpbWluZ19jdHJs
cl9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCj4gPiA+ID4gIAo+ID4gPiA+ICAJY3RybHIgPSB0
b19jdHJscihjKTsKPiA+ID4gPiAgCj4gPiA+ID4gLQljdHJsci0+c3VwcG9ydHNfZHVhbF9saW5r
ID0gdHJ1ZTsKPiA+ID4gPiArCWN0cmxyLT5zdXBwb3J0c19kdWFsX2xpbmsgPSBkNzEtPnN1cHBv
cnRzX2R1YWxfbGluazsKPiA+ID4gPiAgCj4gPiA+ID4gIAlyZXR1cm4gMDsKPiA+ID4gPiAgfQo+
ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
ZGV2LmMKPiA+ID4gPiBpbmRleCA5YjNiZjM1M2I2Y2MuLjJkNDI5ZTMxMGU1YiAxMDA2NDQKPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2
LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfZGV2LmMKPiA+ID4gPiBAQCAtMzcxLDIzICszNzEsMzMgQEAgc3RhdGljIGludCBkNzFfZW51
bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gPiA+ID4gIAkJZ290byBlcnJf
Y2xlYW51cDsKPiA+ID4gPiAgCX0KPiA+ID4gPiAgCj4gPiA+ID4gLQkvKiBwcm9iZSBQRVJJUEgg
Ki8KPiA+ID4gPiArCS8qIE9ubHkgdGhlIGxlZ2FjeSBIVyBoYXMgdGhlIHBlcmlwaCBibG9jaywg
dGhlIG5ld2VyIG1lcmdlcyB0aGUgcGVyaXBoCj4gPiA+ID4gKwkgKiBpbnRvIEdDVQo+ID4gPiA+
ICsJICovCj4gPiA+ID4gIAl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5wZXJpcGhfYWRkciwg
QkxLX0JMT0NLX0lORk8pOwo+ID4gPiA+IC0JaWYgKEJMT0NLX0lORk9fQkxLX1RZUEUodmFsdWUp
ICE9IEQ3MV9CTEtfVFlQRV9QRVJJUEgpIHsKPiA+ID4gPiAtCQlEUk1fRVJST1IoImFjY2VzcyBi
bGsgcGVyaXBoIGJ1dCBnb3QgYmxrOiAlZC5cbiIsCj4gPiA+ID4gLQkJCSAgQkxPQ0tfSU5GT19C
TEtfVFlQRSh2YWx1ZSkpOwo+ID4gPiA+IC0JCWVyciA9IC1FSU5WQUw7Cj4gPiA+ID4gLQkJZ290
byBlcnJfY2xlYW51cDsKPiA+ID4gPiArCWlmIChCTE9DS19JTkZPX0JMS19UWVBFKHZhbHVlKSAh
PSBENzFfQkxLX1RZUEVfUEVSSVBIKQo+ID4gPiA+ICsJCWQ3MS0+cGVyaXBoX2FkZHIgPSBOVUxM
Owo+ID4gPiA+ICsKPiA+ID4gPiArCWlmIChkNzEtPnBlcmlwaF9hZGRyKSB7Cj4gPiA+ID4gKwkJ
LyogcHJvYmUgUEVSSVBIRVJBTCBpbiBsZWdhY3kgSFcgKi8KPiA+ID4gPiArCQl2YWx1ZSA9IG1h
bGlkcF9yZWFkMzIoZDcxLT5wZXJpcGhfYWRkciwgUEVSSVBIX0NPTkZJR1VSQVRJT05fSUQpOwo+
ID4gPiA+ICsKPiA+ID4gPiArCQlkNzEtPm1heF9saW5lX3NpemUJPSB2YWx1ZSAmIFBFUklQSF9N
QVhfTElORV9TSVpFID8gNDA5NiA6IDIwNDg7Cj4gPiA+ID4gKwkJZDcxLT5tYXhfdnNpemUJCT0g
NDA5NjsKPiA+ID4gPiArCQlkNzEtPm51bV9yaWNoX2xheWVycwk9IHZhbHVlICYgUEVSSVBIX05V
TV9SSUNIX0xBWUVSUyA/IDIgOiAxOwo+ID4gPiA+ICsJCWQ3MS0+c3VwcG9ydHNfZHVhbF9saW5r
CT0gISEodmFsdWUgJiBQRVJJUEhfU1BMSVRfRU4pOwo+ID4gPiA+ICsJCWQ3MS0+aW50ZWdyYXRl
c190YnUJPSAhISh2YWx1ZSAmIFBFUklQSF9UQlVfRU4pOwo+ID4gPiA+ICsJfSBlbHNlIHsKPiA+
ID4gPiArCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5nY3VfYWRkciwgR0NVX0NPTkZJR1VS
QVRJT05fSUQwKTsKPiA+ID4gPiArCQlkNzEtPm1heF9saW5lX3NpemUJPSBHQ1VfTUFYX0xJTkVf
U0laRSh2YWx1ZSk7Cj4gPiA+ID4gKwkJZDcxLT5tYXhfdnNpemUJCT0gR0NVX01BWF9OVU1fTElO
RVModmFsdWUpOwo+ID4gPiA+ICsKPiA+ID4gPiArCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcx
LT5nY3VfYWRkciwgR0NVX0NPTkZJR1VSQVRJT05fSUQxKTsKPiA+ID4gPiArCQlkNzEtPm51bV9y
aWNoX2xheWVycwk9IEdDVV9OVU1fUklDSF9MQVlFUlModmFsdWUpOwo+ID4gPiA+ICsJCWQ3MS0+
c3VwcG9ydHNfZHVhbF9saW5rCT0gR0NVX0RJU1BMQVlfU1BMSVRfRU4odmFsdWUpOwo+ID4gPiA+
ICsJCWQ3MS0+aW50ZWdyYXRlc190YnUJPSBHQ1VfRElTUExBWV9UQlVfRU4odmFsdWUpOwo+ID4g
PiA+ICAJfQo+ID4gPiA+ICAKPiA+ID4gPiAtCXZhbHVlID0gbWFsaWRwX3JlYWQzMihkNzEtPnBl
cmlwaF9hZGRyLCBQRVJJUEhfQ09ORklHVVJBVElPTl9JRCk7Cj4gPiA+ID4gLQo+ID4gPiA+IC0J
ZDcxLT5tYXhfbGluZV9zaXplCT0gdmFsdWUgJiBQRVJJUEhfTUFYX0xJTkVfU0laRSA/IDQwOTYg
OiAyMDQ4Owo+ID4gPiA+IC0JZDcxLT5tYXhfdnNpemUJCT0gNDA5NjsKPiA+ID4gPiAtCWQ3MS0+
bnVtX3JpY2hfbGF5ZXJzCT0gdmFsdWUgJiBQRVJJUEhfTlVNX1JJQ0hfTEFZRVJTID8gMiA6IDE7
Cj4gPiA+ID4gLQlkNzEtPnN1cHBvcnRzX2R1YWxfbGluawk9IHZhbHVlICYgUEVSSVBIX1NQTElU
X0VOID8gdHJ1ZSA6IGZhbHNlOwo+ID4gPiA+IC0JZDcxLT5pbnRlZ3JhdGVzX3RidQk9IHZhbHVl
ICYgUEVSSVBIX1RCVV9FTiA/IHRydWUgOiBmYWxzZTsKPiA+ID4gPiAtCj4gPiA+ID4gIAlmb3Ig
KGkgPSAwOyBpIDwgZDcxLT5udW1fcGlwZWxpbmVzOyBpKyspIHsKPiA+ID4gPiAgCQlwaXBlID0g
a29tZWRhX3BpcGVsaW5lX2FkZChtZGV2LCBzaXplb2Yoc3RydWN0IGQ3MV9waXBlbGluZSksCj4g
PiA+ID4gIAkJCQkJICAgJmQ3MV9waXBlbGluZV9mdW5jcyk7Cj4gPiA+ID4gQEAgLTQxNSw3ICs0
MjUsNyBAQCBzdGF0aWMgaW50IGQ3MV9lbnVtX3Jlc291cmNlcyhzdHJ1Y3Qga29tZWRhX2RldiAq
bWRldikKPiA+ID4gPiAgCX0KPiA+ID4gPiAgCj4gPiA+ID4gIAkvKiBsb29wIHRoZSByZWdpc3Rl
ciBibGtzIGFuZCBwcm9iZSAqLwo+ID4gPiA+IC0JaSA9IDI7IC8qIGV4Y2x1ZGUgR0NVIGFuZCBQ
RVJJUEggKi8KPiA+ID4gPiArCWkgPSAxOyAvKiBleGNsdWRlIEdDVSAqLwo+ID4gPiA+ICAJb2Zm
c2V0ID0gRDcxX0JMT0NLX1NJWkU7IC8qIHNraXAgR0NVICovCj4gPiA+ID4gIAl3aGlsZSAoaSA8
IGQ3MS0+bnVtX2Jsb2Nrcykgewo+ID4gPiA+ICAJCWJsa19iYXNlID0gbWRldi0+cmVnX2Jhc2Ug
KyAob2Zmc2V0ID4+IDIpOwo+ID4gPiA+IEBAIC00MjUsOSArNDM1LDkgQEAgc3RhdGljIGludCBk
NzFfZW51bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gPiA+ID4gIAkJCWVy
ciA9IGQ3MV9wcm9iZV9ibG9jayhkNzEsICZibGssIGJsa19iYXNlKTsKPiA+ID4gPiAgCQkJaWYg
KGVycikKPiA+ID4gPiAgCQkJCWdvdG8gZXJyX2NsZWFudXA7Cj4gPiA+ID4gLQkJCWkrKzsKPiA+
ID4gPiAgCQl9Cj4gPiA+ID4gIAo+ID4gPiA+ICsJCWkrKzsKPiA+ID4gCj4gPiA+IFRoaXMgY2hh
bmdlIGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIGlmIHlvdSB3YW50IHRvIGNvdW50IGhvdyBtYW55
Cj4gPiA+IGJsb2NrcyBhcmUgYXZhaWxhYmxlLCBzaW5jZSB5b3UncmUgbm93IGNvdW50aW5nIHRo
ZSByZXNlcnZlZCBvbmVzLCB0b28uCj4gPiAKPiA+IFRoYXQncyBiZWNhdXNlIGZvciBEMzIgbnVt
X2Jsb2NrcyBpbmNsdWRlcyB0aGUgcmVzZXJ2ZWQgYmxvY2tzLgo+ID4gCj4gPiA+IE9uIHRoZSBj
b3VudGluZyBub3RlLCB0aGUgcHJpb3IgY29kZSByaWRlcyBvbiB0aGUgYXNzdW1wdGlvbiB0aGUg
cGVyaXBoCj4gPiA+IGJsb2NrIGlzIGxhc3QgaW4gdGhlIG1hcCwgYW5kIEkgZG9uJ3Qgc2VlIGhv
dyB5b3Ugc3RpbGwgaGFuZGxlIG5vdAo+ID4gPiBjb3VudGluZyBpdCBpbiB0aGUgRDcxIGNhc2Uu
Cj4gPiAKPiA+IFNpbmNlIEQ3MSBoYXMgb25lIHJlc2VydmVkIGJsb2NrLCBhbmQgbm93IHdlIGNv
dW50IHJlc2VydmVkIGJsb2NrLgo+ID4gCj4gPiBTbyBub3cgbm8gbWF0dGVyIEQzMiBvciBENzE6
Cj4gPiAgIG51bV9ibG9ja3MgPSBuX3ZhbGlkX2Jsb2NrICsgbl9yZXNlcnZlZF9ibG9jayArIEdD
VS4KPiAKPiBTbyBhdCBsZWFzdCB3ZSBuZWVkIHRoYXQgY29tbWVudCBkcm9wcGVkIGluIHdpdGgg
dGhlIGNvZGUuIEZ1dHVyZSBIVwo+IG1pZ2h0IGJyZWFrIHlvdXIgYXNzdW1wdGlvbiBoZXJlIG9u
Y2UgbW9yZSBhbmQgaXQgd2lsbCB0aGVuIGJlIHVzZWZ1bAo+IHRvIGtub3cgd2h5IHRoaXMgd29y
a3MgZm9yIGJvdGggcHJvZHVjdHMuCgpPSywgd2lsbCBhZGQgYSBjb21tZW50cyBsaWtlLgoKLyog
UGVyIEhXIGRlc2lnbjogbnVtX2Jsb2NrcyA9IG5fdmFsaWRfYmxvY2sgKyBuX3Jlc2VydmVkX2Js
b2NrICsgR0NVICovCgpBbmQgUGVyIEhXLCBhbGwgYXJjaC12MS54IGluY2x1ZGUgKGQ3MS9kMzIv
ZDc3KSBmb2xsb3dzIHRoaXMgcnVsZSwKdGhlIG9sZCBsb2dpYyB3aGljaCBza2lwIHRoZSByZXNl
cnZlZC1ibG9jayBhY3R1YWxseSBub3QgcmlnaHQuCgo+IEknZCBwZXJzb25hbGx5IGFic3RyYWN0
IHRoYXQgYSBiaXQgYmVoaW5kIGEgc21hbGwgaGVscGVyIGZ1bmMgYW5kCj4gaGFuZGxlIGRpZmZl
cmVudCBwcm9kdWN0cyBzZXBhcmF0ZWx5LiBJdCdzIGEgYml0IG9mIGR1cGxpY2F0aW9uIGJ1dAo+
IG11Y2ggZWFzaWVyIHRvIGNvbXByZWhlbmQuIFNhdmVkIGN5Y2xlcyByZWFkaW5nIGNvZGUgPT0g
R29vZCBUaGluZyh0bSkuCgpPdXIga29tZWRhIGRyaXZlciBoYXMgdHdvIGxheWVycywgY29tbW9u
IGxheWVyIGFuZCBjaGlwLiBjdXJyZW50IHdlCm9ubHkgaGF2ZSBvbmUgY2hpcCBmb2xkZXIgZDcx
IGZvciBzdXBwb3J0IGFyY2gtdjEueCBwcm9kY3V0LgpBbmQgb3VyIGZ1dHVyZSBwcm9kdWN0cyAo
YXJjaC12Mi54KSB3aWxsIGhhdmUgaXRzIG93biBjaGlwIGZvbGRlciwgYW5kCml0cyBvd24gY2hp
cCBzcGVjaWZpYyBjb2RlLgoKVGhhbmtzCkphbWVzCj4gCj4gPiAKPiA+IFRoYW5rcwo+ID4gSmFt
ZXMKPiA+ID4gCj4gPiA+ID4gIAkJb2Zmc2V0ICs9IEQ3MV9CTE9DS19TSVpFOwo+ID4gPiA+ICAJ
fQo+ID4gPiA+ICAKPiA+ID4gPiBAQCAtNjAzLDYgKzYxMyw3IEBAIGQ3MV9pZGVudGlmeSh1MzIg
X19pb21lbSAqcmVnX2Jhc2UsIHN0cnVjdCBrb21lZGFfY2hpcF9pbmZvICpjaGlwKQo+ID4gPiA+
ICAKPiA+ID4gPiAgCXN3aXRjaCAocHJvZHVjdF9pZCkgewo+ID4gPiA+ICAJY2FzZSBNQUxJRFBf
RDcxX1BST0RVQ1RfSUQ6Cj4gPiA+ID4gKwljYXNlIE1BTElEUF9EMzJfUFJPRFVDVF9JRDoKPiA+
ID4gPiAgCQlmdW5jcyA9ICZkNzFfY2hpcF9mdW5jczsKPiA+ID4gPiAgCQlicmVhazsKPiA+ID4g
PiAgCWRlZmF1bHQ6Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2Q3MS9kNzFfcmVncy5oCj4gPiA+ID4gaW5kZXggMTcyN2RjOTkzOTA5Li44MWRlNmEy
M2U3ZjMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX3JlZ3MuaAo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmgKPiA+ID4gPiBAQCAtNzIsNiArNzIsMTkgQEAKPiA+
ID4gPiAgI2RlZmluZSBHQ1VfQ09OVFJPTF9NT0RFKHgpCSgoeCkgJiAweDcpCj4gPiA+ID4gICNk
ZWZpbmUgR0NVX0NPTlRST0xfU1JTVAlCSVQoMTYpCj4gPiA+ID4gIAo+ID4gPiA+ICsvKiBHQ1Vf
Q09ORklHVVJBVElPTiByZWdpc3RlcnMgKi8KPiA+ID4gPiArI2RlZmluZSBHQ1VfQ09ORklHVVJB
VElPTl9JRDAJMHgxMDAKPiA+ID4gPiArI2RlZmluZSBHQ1VfQ09ORklHVVJBVElPTl9JRDEJMHgx
MDQKPiA+ID4gPiArCj4gPiA+ID4gKy8qIEdDVSBjb25maWd1cmF0aW9uICovCj4gPiA+ID4gKyNk
ZWZpbmUgR0NVX01BWF9MSU5FX1NJWkUoeCkJKCh4KSAmIDB4RkZGRikKPiA+ID4gPiArI2RlZmlu
ZSBHQ1VfTUFYX05VTV9MSU5FUyh4KQkoKHgpID4+IDE2KQo+ID4gPiA+ICsjZGVmaW5lIEdDVV9O
VU1fUklDSF9MQVlFUlMoeCkJKCh4KSAmIDB4NykKPiA+ID4gPiArI2RlZmluZSBHQ1VfTlVNX1BJ
UEVMSU5FUyh4KQkoKCh4KSA+PiAzKSAmIDB4NykKPiA+ID4gPiArI2RlZmluZSBHQ1VfTlVNX1ND
QUxFUlMoeCkJKCgoeCkgPj4gNikgJiAweDcpCj4gPiA+ID4gKyNkZWZpbmUgR0NVX0RJU1BMQVlf
U1BMSVRfRU4oeCkJKCgoeCkgPj4gMTYpICYgMHgxKQo+ID4gPiA+ICsjZGVmaW5lIEdDVV9ESVNQ
TEFZX1RCVV9FTih4KQkoKCh4KSA+PiAxNykgJiAweDEpCj4gPiA+ID4gKwo+ID4gPiA+ICAvKiBH
Q1Ugb3Btb2RlICovCj4gPiA+ID4gICNkZWZpbmUgSU5BQ1RJVkVfTU9ERQkJMAo+ID4gPiA+ICAj
ZGVmaW5lIFRCVV9DT05ORUNUX01PREUJMQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCj4gPiA+ID4gaW5kZXggYjdhMTA5N2M0NWM0
Li5hZDM4YmJjNzQzMWUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+ID4gPiA+IEBAIC0xMjUsNiArMTI1LDcg
QEAgc3RhdGljIGludCBrb21lZGFfcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gPiA+ID4gIAo+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBrb21lZGFfb2ZfbWF0Y2hbXSA9IHsKPiA+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAiYXJt
LG1hbGktZDcxIiwgLmRhdGEgPSBkNzFfaWRlbnRpZnksIH0sCj4gPiA+ID4gKwl7IC5jb21wYXRp
YmxlID0gImFybSxtYWxpLWQzMiIsIC5kYXRhID0gZDcxX2lkZW50aWZ5LCB9LAo+ID4gPiA+ICAJ
e30sCj4gPiA+ID4gIH07Cj4gPiA+ID4gIAo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gCj4gPiAKPiAK
PiAKPiAtLSAKPiBNaWhhaWwKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
