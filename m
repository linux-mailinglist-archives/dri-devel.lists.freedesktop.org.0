Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717AF104AC6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 07:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4A86E7B0;
	Thu, 21 Nov 2019 06:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB3D6E7B0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 06:34:07 +0000 (UTC)
Received: from VI1PR08CA0244.eurprd08.prod.outlook.com (2603:10a6:803:dc::17)
 by DBBPR08MB4870.eurprd08.prod.outlook.com (2603:10a6:10:f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 21 Nov
 2019 06:34:03 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VI1PR08CA0244.outlook.office365.com
 (2603:10a6:803:dc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Thu, 21 Nov 2019 06:34:03 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 06:34:03 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Thu, 21 Nov 2019 06:34:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 846db7b12def9770
X-CR-MTA-TID: 64aa7808
Received: from c732f6f9984d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7E39B9F-3919-4BA3-AA7D-623A07958483.1; 
 Thu, 21 Nov 2019 06:33:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c732f6f9984d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 06:33:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyNrRs0BI0J6FgfFXIVRdTAEjL7ubjMg0V7OTMZy8w4Avt/77xU/b4r2xRGY+v6nJrkvOgQDtHtamH+xez3SctE5EFS42Jfq5wQcgV7Txjhc0L2spdRSuQ4YiO5DSYCyasG1vLKqXOaH8B3qqlqXpUM6ab2xMOnPt6dgW8fgvihYBZ4j2n051KRVAh8GvwOSZdILdL7Xv9ri7jwXBn2VzjPSqO8zG5EjdjwGMr9NTRmPYgqo8m8bkGjwGsHQCAbAvncqFWdEcsmkH85sLb6HOnzanh3mTQDf2/m+oRbJLww4Z7sDS9/atmCnPbajgFSLk88G7crmO/pfxogBNtnNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qrys8ZmVbaxAdz+iUV34mPGZXaz0vn5Z4q3Myc7XMV0=;
 b=CBAVi49PR3VWfnXbHjHRxAcvgjx4Mfs0Pnv+1925bH04nUcWc48AXNWGXTafCbWCoY920KlfIwMXqHW1TBeZW7XZuwQHAWK+UgUOVdciRULPez01KbzxlPp52A2sn5dc9ZxOm1eShFfXgGPqyTcO20p0f+JPrD+PN/t0EYaATc6ii22pBfR+1pNmqyli+LY15o8F9hJzCN/8m+xXUN4/psu795VTTS+dOBvpMMbcG2qkhQ9n9EeIbWKRfRSE3hbqPYzQZDoajIBsFPnopEXP7UEueSYRzzle1vImEXme4JSc3hiTsIAPjeYZDyWGgq2mgUdLQ0j9G0MstqzvnSN0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5037.eurprd08.prod.outlook.com (10.255.158.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Thu, 21 Nov 2019 06:33:54 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 06:33:54 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: drm/komeda: Remove unnecessary komeda_wb_connector_detect
Thread-Topic: drm/komeda: Remove unnecessary komeda_wb_connector_detect
Thread-Index: AQHVoDWlPqB60NeFLUufwrTo5mSxsw==
Date: Thu, 21 Nov 2019 06:33:54 +0000
Message-ID: <20191121063347.GA25271@jamwan02-TSP300>
References: <20191120120348.37340-1-mihail.atanassov@arm.com>
In-Reply-To: <20191120120348.37340-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR04CA0077.apcprd04.prod.outlook.com
 (2603:1096:202:15::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e360485-3353-4dff-55c0-08d76e4ccd1c
X-MS-TrafficTypeDiagnostic: VE1PR08MB5037:|VE1PR08MB5037:|DBBPR08MB4870:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4870287F74C5F07890C3E7A4B34E0@DBBPR08MB4870.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1468;OLM:1468;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(189003)(199004)(5660300002)(316002)(33716001)(25786009)(66066001)(8676002)(102836004)(6636002)(64756008)(66446008)(66476007)(33656002)(3846002)(2906002)(6512007)(66946007)(99286004)(86362001)(52116002)(229853002)(386003)(6506007)(76176011)(6436002)(6486002)(54906003)(6862004)(6246003)(4326008)(9686003)(6116002)(66556008)(7736002)(305945005)(446003)(14454004)(11346002)(478600001)(71190400001)(8936002)(1076003)(71200400001)(186003)(58126008)(26005)(14444005)(256004)(81156014)(55236004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5037;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zZkBPE9o8CM1aaJb08NxuuULVBTJY5GDFJWZYgPyyP2+xjhuXdb6g8E3O1qFcFhLFP/jNeNEcKARXZXpAEW5HsIb2ocwwR20CW91PRXM3S6EvY2lf+N9pfF1f3djPlRAth5Xco70DN/uhgn/3rtRvPMG848/Q35qRMwapw3TzVZtcpyk8+EYd5o9UG/0dkq8/hSL1TK8RMRuoW40WdhDj2Okw+D1jTfVSIIxqzfxxJGT/8kXv0tCsPWLJ0CrESlFq6/akeYYCzWrNfdKY/JBCmBMpACupCESVupFl5btu/D0jp7STCuzp63lrFuGN211hTprEr+vjkD7WB4TIflnWY+Z1b9vJRb3BIksIN4j+EzuYewZHX+rJmdOGPaYulmKgIsRdpffPsp5Hp55azXReFNjTsrQGQDFApEoT4G4S4fT/tLx7nWSBAvwV6q461a2
Content-ID: <38FC27F944BE454FB1A4131BB69BFEFB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5037
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(376002)(346002)(396003)(136003)(1110001)(339900001)(199004)(189003)(33656002)(2906002)(66066001)(25786009)(47776003)(14454004)(6636002)(6486002)(6862004)(54906003)(58126008)(446003)(46406003)(1076003)(229853002)(76130400001)(336012)(356004)(5660300002)(3846002)(107886003)(76176011)(6116002)(186003)(316002)(6246003)(23726003)(70586007)(50466002)(70206006)(9686003)(4326008)(8936002)(8746002)(33716001)(7736002)(22756006)(97756001)(102836004)(81166006)(105606002)(386003)(8676002)(81156014)(6506007)(478600001)(14444005)(99286004)(26005)(305945005)(11346002)(6512007)(26826003)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4870;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 03bf7d68-17fc-480c-f4ef-08d76e4cc7b8
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AY8akbXNbbe9qUMqVCPBOs+C/eYGGQEdXDWZ0m0uew9QIFeSb6EypYnGeEAQLbeetPzxa30GkIgHzHo73sM4TI3Xv8FlXBFsdxxmNMgKVYcVRUKiGtZhXtWPUPGSXlwWL4tbLTfFV5+aQcHh0nyse1LZ3HtEcyccG4pgJPWkgvy4EcZ/Jux85WJRKhh5WfG+9VXCzfaLxVMhm+KR9vo/7OQcacdaUzISK4f5TxW6gMezXkUkbPvE70zBy+yrDeuLtL5nKRVdpRwoqmtO4wKmqtEirB+RPopRh6X1Mc/8RvEv6glODHHzzVROLEOAuVUrxW1pBRrvnt+slMAUP7ADHsS+HM3ES8LlUTHppxZEq8JNQybaRN4E8lqUNJHhonihtIHU/H4peXqPsXpmTyIm5tr9TLf3Lz0CiBYVkj/71O/sljJbXnPzasE+rBDE2OWY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 06:34:03.3430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e360485-3353-4dff-55c0-08d76e4ccd1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4870
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qrys8ZmVbaxAdz+iUV34mPGZXaz0vn5Z4q3Myc7XMV0=;
 b=xP+ERfLWjCFp0eu8td0BU1JrMwYHVwSN6XNbY+wQbE9HN74USiWoVvl+bRnzm70N4Pr7q0Bb3bWjy+KofaFpjG03muGqgrKHh1dMcLSAdehLjL/RsqhnBY7QOCMOwdKeGlcGXlLqB527k8bt7QzsmiTjW+JADj7NzangUzMCON0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qrys8ZmVbaxAdz+iUV34mPGZXaz0vn5Z4q3Myc7XMV0=;
 b=xP+ERfLWjCFp0eu8td0BU1JrMwYHVwSN6XNbY+wQbE9HN74USiWoVvl+bRnzm70N4Pr7q0Bb3bWjy+KofaFpjG03muGqgrKHh1dMcLSAdehLjL/RsqhnBY7QOCMOwdKeGlcGXlLqB527k8bt7QzsmiTjW+JADj7NzangUzMCON0=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6MDM6NTVQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBUaGUgZnVuYyBpcyBvcHRpb25hbCBhbmQgdGhlIGNvbm5lY3RvciB3aWxsIHJl
cG9ydCBhcyBhbHdheXMgY29ubmVjdGVkLAo+IGkuZS4gbm8gY2hhbmdlIGluIGJlaGF2aW91ci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFy
bS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3diX2Nvbm5lY3Rvci5jIHwgNyAtLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gaW5kZXggZTQ2NWNjNDg3OWM5Li5jODllY2RiYThj
MjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfd2JfY29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+IEBAIC0xMDcsMTIgKzEwNyw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mga29tZWRhX3diX2Nvbm5faGVs
cGVyX2Z1bmNzID0gewo+ICAJLm1vZGVfdmFsaWQJPSBrb21lZGFfd2JfY29ubmVjdG9yX21vZGVf
dmFsaWQsCj4gIH07Cj4gIAo+IC1zdGF0aWMgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cwo+IC1r
b21lZGFfd2JfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LCBib29sIGZvcmNlKQo+IC17Cj4gLQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7
Cj4gLX0KPiAtCj4gIHN0YXRpYyBpbnQKPiAga29tZWRhX3diX2Nvbm5lY3Rvcl9maWxsX21vZGVz
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gIAkJCSAgICAgICB1aW50MzJfdCBt
YXhYLCB1aW50MzJfdCBtYXhZKQo+IEBAIC0xMjgsNyArMTIyLDYgQEAgc3RhdGljIHZvaWQga29t
ZWRhX3diX2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ip
Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3Mga29tZWRhX3di
X2Nvbm5lY3Rvcl9mdW5jcyA9IHsKPiAgCS5yZXNldAkJCT0gZHJtX2F0b21pY19oZWxwZXJfY29u
bmVjdG9yX3Jlc2V0LAo+IC0JLmRldGVjdAkJCT0ga29tZWRhX3diX2Nvbm5lY3Rvcl9kZXRlY3Qs
Cj4gIAkuZmlsbF9tb2RlcwkJPSBrb21lZGFfd2JfY29ubmVjdG9yX2ZpbGxfbW9kZXMsCj4gIAku
ZGVzdHJveQkJPSBrb21lZGFfd2JfY29ubmVjdG9yX2Rlc3Ryb3ksCj4gIAkuYXRvbWljX2R1cGxp
Y2F0ZV9zdGF0ZQk9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUs
CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
