Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903D37F546
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 12:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03766EDB6;
	Fri,  2 Aug 2019 10:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30069.outbound.protection.outlook.com [40.107.3.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134096EDB6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 10:43:22 +0000 (UTC)
Received: from AM6PR08CA0040.eurprd08.prod.outlook.com (2603:10a6:20b:c0::28)
 by VI1PR0802MB2608.eurprd08.prod.outlook.com (2603:10a6:800:ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Fri, 2 Aug
 2019 10:43:19 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by AM6PR08CA0040.outlook.office365.com
 (2603:10a6:20b:c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14 via Frontend
 Transport; Fri, 2 Aug 2019 10:43:18 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 2 Aug 2019 10:43:17 +0000
Received: ("Tessian outbound cc8a947d4660:v26");
 Fri, 02 Aug 2019 10:43:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8c2a9e9b6e00623
X-CR-MTA-TID: 64aa7808
Received: from ffac1cd95e13.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB70A217-5F17-4984-AE95-4A686845B8F5.1; 
 Fri, 02 Aug 2019 10:43:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffac1cd95e13.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2019 10:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwTA+K7qjKAvQl64ZGVWVoiaoPqAqU9qcSYOoCgKpj86szG5efim6GJbGEgAOts+K2sRm2MGbkzIOqcua9M/Y/Lgef65uh7RoROWd4WV/cZW/xvC0lqymIxOowFvuadIL4sk5jUwvtwqj67VXIx2ppFTeMmLH3oH5JWbCRbiUbEg4zA9Fq6FAStjARfrYwLHCn4zvSll7qLn0rfFys3IJbv/mSJ5zhzkCUpyoGLCDAQPTXtdNMrPDaD2BMejo3UcNx327+lMdZDgYZ6liofPGY8JZH39fyDyzLQYlkVLvUbf440GvwEPWuW12nbzssf8Q4TykW8+47I5Z02Hb7xt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANgFG8PZXsUB8pWmTSAbt5YsgDPbPzmCo2SWsQdt5aA=;
 b=ZhBq7JS8VaZ0ZSt8TCjery+edRh4LDzJ/4jNEHGzz/MffWxZSaGRicPx1q89YUsaE68OOMCiy6LSXI7U32yj+5aRgwVps/UpICaT64BzRTLeGd85SRI3yuHFEb6SbAr4EDsZcCPLdkpKA2nAdDS/NXSBVJF5+yHSFgglIOoadBTjkxJmuplujpdu2A2fBfvVjr3a0DlOpbX88Al7pD05qZ5/NXoxpySkH00fDJm5vGNDKtkDzD4d0+lHv+UbyerpUPceGKaVIaKSQ2f8TriYxT7DsdnJ1OsOUwK2Z/Sr6ZpRqUFknk/it8ywy27wqxUj8J2E+WKJ+ibl4lW6sSq7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4990.eurprd08.prod.outlook.com (10.255.158.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Fri, 2 Aug 2019 10:43:04 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 10:43:04 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds error event print functionality
Thread-Topic: [PATCH] drm/komeda: Adds error event print functionality
Thread-Index: AQHVSRayAboXOjuz1kKxLGlCvtrW0abnoVcAgAAKlAA=
Date: Fri, 2 Aug 2019 10:43:04 +0000
Message-ID: <20190802104258.GA26890@jamwan02-TSP300>
References: <1564738954-6101-1-git-send-email-lowry.li@arm.com>
 <1646739.69SqAVYMUr@e123338-lin>
In-Reply-To: <1646739.69SqAVYMUr@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0221.apcprd02.prod.outlook.com
 (2603:1096:201:20::33) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 94f6685e-2065-4ce3-4709-08d717363a9c
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4990; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4990:|VI1PR0802MB2608:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2608D1A05B55701A04337043B3D90@VI1PR0802MB2608.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 011787B9DD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(52116002)(68736007)(76176011)(446003)(11346002)(3846002)(6116002)(8936002)(1076003)(229853002)(8676002)(6486002)(66066001)(5660300002)(81166006)(186003)(476003)(486006)(81156014)(316002)(26005)(2906002)(256004)(14444005)(58126008)(6862004)(33656002)(6636002)(6506007)(33716001)(66446008)(386003)(6436002)(7736002)(66556008)(66476007)(305945005)(55236004)(14454004)(478600001)(71190400001)(71200400001)(66946007)(25786009)(4326008)(53936002)(64756008)(6512007)(86362001)(9686003)(99286004)(102836004)(54906003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4990;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: jjs5jKTJm56Air+QL7FkcGR6jsI+nLWNsFPaQSPxqopAbKlI2ZrKICjZa3zKnfLn6DiF44b/REs0QmXfTvF/NXzw0/4/o4yd7UEx89Z8mlJsQYg+qygFPxAyWKGz1Qx2o6PyF/LH5Ibyccn7VeCt1YGIFbx0/mmrU0ZePbPMWTt036FtPgIW+cYb1OTSkL/SSaKS49WiLbkl9mQu9hSQ+RuKz8nsEKBbuPrGSVlDq+zRtZx9ttSK/GO5ej1utQNMjKyins7kpHJzWUWWdSCeje24MoMJkrt6ZG/mQCP6WbJWCAvtW32Ds9iWy1ZGLveSvFqarolAFPpLxcNJegOYSrwSlklSAJgb578Z5iwpwLhdyxCUAJXJwWn1nRBBmD9BocZUZBL/zw9tRU33SxXa9oOJVmS2kFRDij1VgLJq12Q=
Content-ID: <F5EA93DE92B50744B9EE44FCE38E02E1@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4990
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(189003)(199004)(1076003)(336012)(76176011)(2906002)(14454004)(6116002)(3846002)(86362001)(4326008)(6246003)(23726003)(46406003)(6862004)(5660300002)(14444005)(486006)(6512007)(9686003)(386003)(26826003)(6506007)(70206006)(70586007)(81156014)(81166006)(99286004)(33656002)(76130400001)(63370400001)(6636002)(7736002)(305945005)(47776003)(8936002)(186003)(478600001)(97756001)(33716001)(126002)(6486002)(8746002)(11346002)(26005)(356004)(63350400001)(229853002)(22756006)(8676002)(25786009)(102836004)(58126008)(446003)(316002)(50466002)(476003)(54906003)(66066001)(36906005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2608;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc20b74c-f2d0-4d30-e86f-08d7173632b6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2608; 
NoDisclaimer: True
X-Forefront-PRVS: 011787B9DD
X-Microsoft-Antispam-Message-Info: KvXnUfxhtEPFGrmlbsjNKL3gx1YZ+jMzKw+sKJ0qvnFRqgjUM5YFtDiH/9y1A8Wd88I5N7qpBGTOxDZD/iSy0nnzMFR3V8GrJqpjCYWVnke4OtGlK6oXp52EEexpfGNeabi3NNs0EImw5LQOm5PrMm/kwh8U4lclMs2OmSnq9qLbQgcsrnq1DE9D90vswHssXpsD4k0jYXH+6+Ms0w60LEp0EUo+PDUS8TQe+aC2D5UAVamR4WnReLcYrpMMA89DsSVNwwnJD4f2IjTwFiI7Aoe8JtomqQzt7dILc9IwVFo74uu1UUGe2fCc/jx+8L1iUVhs1EfqMJjg8vhl2Xi3hyztEl3Jtp3vOyeQryJs8cjb0OUHQ6V/aAAoHO5dG4VgqMy/YtUnaHKBDARkAXYhE3LBUO98Jw7dVgd0FxWdLCI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 10:43:17.4276 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f6685e-2065-4ce3-4709-08d717363a9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2608
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANgFG8PZXsUB8pWmTSAbt5YsgDPbPzmCo2SWsQdt5aA=;
 b=n1wxS/PUdLnMz9JmYvELMl7V21OmQuFsn7UYQ0eCgkeaUc2C5DmGbOS48to8TphhxECV1zQEZdURTguUSKzfrwRwGWtMDH/NKNbPGX8ke6ZtifM8daSd6q+JycE50cdpIpopKQ2u7h97syYmx6cgBuv+SKFCS/f9yBANamC0JDE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANgFG8PZXsUB8pWmTSAbt5YsgDPbPzmCo2SWsQdt5aA=;
 b=n1wxS/PUdLnMz9JmYvELMl7V21OmQuFsn7UYQ0eCgkeaUc2C5DmGbOS48to8TphhxECV1zQEZdURTguUSKzfrwRwGWtMDH/NKNbPGX8ke6ZtifM8daSd6q+JycE50cdpIpopKQ2u7h97syYmx6cgBuv+SKFCS/f9yBANamC0JDE=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDY6MDU6MDhQTSArMDgwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBGcmlkYXksIDIgQXVndXN0IDIwMTkgMTA6NDM6MTAgQlNUIExvd3J5IExp
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiBGcm9tOiAiTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gPiAKPiA+IEFkZHMgdG8gcHJp
bnQgdGhlIGV2ZW50IG1lc3NhZ2Ugd2hlbiBlcnJvciBoYXBwZW5zIGFuZCB0aGUgc2FtZSBldmVu
dAo+ID4gd2lsbCBub3QgYmUgcHJpbnRlZCB1bnRpbCBuZXh0IHZzeW5jLgo+ID4gCj4gPiBDaGFu
Z2VzIHNpbmNlIHYyOgo+ID4gMS4gUmVmaW5lIGtvbWVkYV9zcHJpbnRmKCk7Cj4gPiAyLiBOb3Qg
dXNpbmcgU1RSX1NaIG1hY3JvIGZvciB0aGUgc3RyaW5nIHNpemUgaW4ga29tZWRhX3ByaW50X2V2
ZW50cygpLgo+ID4gCj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gMS4gSGFuZGxpbmcgdGhlIGV2
ZW50IHByaW50IGJ5IENPTkZJR19LT01FREFfRVJST1JfUFJJTlQ7Cj4gPiAyLiBDaGFuZ2luZyB0
aGUgbWF4IHN0cmluZyBzaXplIHRvIDI1Ni4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTG93cnkg
TGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAKPiBSZXZpZXdl
ZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgo+IAo+IEJS
LAo+IE1paGFpbAoKbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cgo+IAo+
ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcgICAgICAgICAg
ICAgICB8ICAgNiArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtl
ZmlsZSAgICAgICB8ICAgMiArCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmggICB8ICAxNSArKysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9ldmVudC5jIHwgMTQwCj4gPiArKysrKysrKysrKysrKysrKysrKysr
IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAgfCAKPiA+
ICA0ICsKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2
ZW50LmMKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9L
Y29uZmlnCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9LY29uZmlnIGluZGV4IGNl
YzA2MzkuLmU4N2ZmODYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcK
PiA+IEBAIC0xMiwzICsxMiw5IEBAIGNvbmZpZyBEUk1fS09NRURBCj4gPiAgCSAgUHJvY2Vzc29y
IGRyaXZlci4gSXQgc3VwcG9ydHMgdGhlIEQ3MSB2YXJpYW50cyBvZiB0aGUgaGFyZHdhcmUuCj4g
PiAKPiA+ICAJICBJZiBjb21waWxlZCBhcyBhIG1vZHVsZSBpdCB3aWxsIGJlIGNhbGxlZCBrb21l
ZGEuCj4gPiArCj4gPiArY29uZmlnIERSTV9LT01FREFfRVJST1JfUFJJTlQKPiA+ICsJYm9vbCAi
RW5hYmxlIGtvbWVkYSBlcnJvciBwcmludCIKPiA+ICsJZGVwZW5kcyBvbiBEUk1fS09NRURBCj4g
PiArCWhlbHAKPiA+ICsJICBDaG9vc2UgdGhpcyBvcHRpb24gdG8gZW5hYmxlIGVycm9yIHByaW50
aW5nLgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
TWFrZWZpbGUKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmls
ZSBpbmRleCA1YzM5MDBjLi5mMDk1YTFjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQo+ID4gQEAgLTIyLDQgKzIyLDYgQEAga29tZWRhLXkg
Kz0gXAo+ID4gIAlkNzEvZDcxX2Rldi5vIFwKPiA+ICAJZDcxL2Q3MV9jb21wb25lbnQubwo+ID4g
Cj4gPiAra29tZWRhLSQoQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQpICs9IGtvbWVkYV9l
dmVudC5vCj4gPiArCj4gPiAgb2JqLSQoQ09ORklHX0RSTV9LT01FREEpICs9IGtvbWVkYS5vCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmgKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmggaW5kZXggZDFjODZiNi4uZTI4ZTdlNgo+ID4gMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiA+IEBAIC00MCw2ICs0MCwx
NyBAQAo+ID4gICNkZWZpbmUgS09NRURBX0VSUl9UVE5HCQkJQklUX1VMTCgzMCkKPiA+ICAjZGVm
aW5lIEtPTUVEQV9FUlJfVFRGCQkJQklUX1VMTCgzMSkKPiA+IAo+ID4gKyNkZWZpbmUgS09NRURB
X0VSUl9FVkVOVFMJXAo+ID4gKwkoS09NRURBX0VWRU5UX1VSVU4JfCBLT01FREFfRVZFTlRfSUJT
WQl8IEtPTUVEQV9FVkVOVF9PVlIgfAo+IFwKPiA+ICsJS09NRURBX0VSUl9URVRPCQl8IEtPTUVE
QV9FUlJfVEVNUgl8IAo+IEtPTUVEQV9FUlJfVElUUiB8XAo+ID4gKwlLT01FREFfRVJSX0NQRQkJ
fCBLT01FREFfRVJSX0NGR0UJfCAKPiBLT01FREFfRVJSX0FYSUUgfFwKPiA+ICsJS09NRURBX0VS
Ul9BQ0UwCQl8IEtPTUVEQV9FUlJfQUNFMQl8IAo+IEtPTUVEQV9FUlJfQUNFMiB8XAo+ID4gKwlL
T01FREFfRVJSX0FDRTMJCXwgS09NRURBX0VSUl9EUklGVFRPCXwgCj4gS09NRURBX0VSUl9GUkFN
RVRPIHxcCj4gPiArCUtPTUVEQV9FUlJfWk1FCQl8IEtPTUVEQV9FUlJfTUVSUgl8IAo+IEtPTUVE
QV9FUlJfVENGIHxcCj4gPiArCUtPTUVEQV9FUlJfVFRORwkJfCBLT01FREFfRVJSX1RURikKPiA+
ICsKPiA+ICsjZGVmaW5lIEtPTUVEQV9XQVJOX0VWRU5UUwlLT01FREFfRVJSX0NTQ0UKPiA+ICsK
PiA+ICAvKiBtYWxpZHAgZGV2aWNlIGlkICovCj4gPiAgZW51bSB7Cj4gPiAgCU1BTElfRDcxID0g
MCwKPiA+IEBAIC0yMDcsNCArMjE4LDggQEAgc3RydWN0IGtvbWVkYV9kZXYgewo+ID4gCj4gPiAg
c3RydWN0IGtvbWVkYV9kZXYgKmRldl90b19tZGV2KHN0cnVjdCBkZXZpY2UgKmRldik7Cj4gPiAK
PiA+ICsjaWZkZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQKPiA+ICt2b2lkIGtvbWVk
YV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpOwo+ID4gKyNlbmRpZgo+
ID4gKwo+ID4gICNlbmRpZiAvKl9LT01FREFfREVWX0hfKi8KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMgbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAuLmEzNmZiODYKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMK
PiA+IEBAIC0wLDAgKzEsMTQwIEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAKPiA+ICsvKgo+ID4gKyAqIChDKSBDT1BZUklHSFQgMjAxOSBBUk0gTGltaXRlZC4gQWxs
IHJpZ2h0cyByZXNlcnZlZC4KPiA+ICsgKiBBdXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMu
cWlhbi53YW5nQGFybS5jb20+Cj4gPiArICoKPiA+ICsgKi8KPiA+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9wcmludC5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlICJrb21lZGFfZGV2LmgiCj4gPiArCj4gPiAr
c3RydWN0IGtvbWVkYV9zdHIgewo+ID4gKwljaGFyICpzdHI7Cj4gPiArCXUzMiBzejsKPiA+ICsJ
dTMyIGxlbjsKPiA+ICt9Owo+ID4gKwo+ID4gKy8qIHJldHVybiAwIG9uIHN1Y2Nlc3MsICA8IDAg
b24gbm8gc3BhY2UuCj4gPiArICovCj4gPiArc3RhdGljIGludCBrb21lZGFfc3ByaW50ZihzdHJ1
Y3Qga29tZWRhX3N0ciAqc3RyLCBjb25zdCBjaGFyICpmbXQsIC4uLikKPiA+ICt7Cj4gPiArCXZh
X2xpc3QgYXJnczsKPiA+ICsJaW50IG51bSwgZnJlZV9zejsKPiA+ICsJaW50IGVycjsKPiA+ICsK
PiA+ICsJZnJlZV9zeiA9IHN0ci0+c3ogLSBzdHItPmxlbiAtIDE7Cj4gPiArCWlmIChmcmVlX3N6
IDw9IDApCj4gPiArCQlyZXR1cm4gLUVOT1NQQzsKPiA+ICsKPiA+ICsJdmFfc3RhcnQoYXJncywg
Zm10KTsKPiA+ICsKPiA+ICsJbnVtID0gdnNucHJpbnRmKHN0ci0+c3RyICsgc3RyLT5sZW4sIGZy
ZWVfc3osIGZtdCwgYXJncyk7Cj4gPiArCj4gPiArCXZhX2VuZChhcmdzKTsKPiA+ICsKPiA+ICsJ
aWYgKG51bSA8IGZyZWVfc3opIHsKPiA+ICsJCXN0ci0+bGVuICs9IG51bTsKPiA+ICsJCWVyciA9
IDA7Cj4gPiArCX0gZWxzZSB7Cj4gPiArCQlzdHItPmxlbiA9IHN0ci0+c3ogLSAxOwo+ID4gKwkJ
ZXJyID0gLUVOT1NQQzsKPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gZXJyOwo+ID4gK30KPiA+
ICsKPiA+ICtzdGF0aWMgdm9pZCBldnRfc3ByaW50ZihzdHJ1Y3Qga29tZWRhX3N0ciAqc3RyLCB1
NjQgZXZ0LCBjb25zdCBjaGFyICptc2cpCj4gPiArewo+ID4gKwlpZiAoZXZ0KQo+ID4gKwkJa29t
ZWRhX3NwcmludGYoc3RyLCBtc2cpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgdm9pZCBldnRf
c3RyKHN0cnVjdCBrb21lZGFfc3RyICpzdHIsIHU2NCBldmVudHMpCj4gPiArewo+ID4gKwlpZiAo
ZXZlbnRzID09IDBVTEwpIHsKPiA+ICsJCWtvbWVkYV9zcHJpbnRmKHN0ciwgIk5vbmUiKTsKPiA+
ICsJCXJldHVybjsKPiA+ICsJfQo+ID4gKwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAm
IEtPTUVEQV9FVkVOVF9WU1lOQywgIlZTWU5DfCIpOwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2
ZW50cyAmIEtPTUVEQV9FVkVOVF9GTElQLCAiRkxJUHwiKTsKPiA+ICsJZXZ0X3NwcmludGYoc3Ry
LCBldmVudHMgJiBLT01FREFfRVZFTlRfRU9XLCAiRU9XfCIpOwo+ID4gKwlldnRfc3ByaW50Zihz
dHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9NT0RFLCAiT1AtTU9ERXwiKTsKPiA+ICsKPiA+ICsJ
ZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZFTlRfVVJVTiwgIlVOREVSUlVOfCIp
Owo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9PVlIsICJPVkVS
UlVOfCIpOwo+ID4gKwo+ID4gKwkvKiBHTEIgZXJyb3IgKi8KPiA+ICsJZXZ0X3NwcmludGYoc3Ry
LCBldmVudHMgJiBLT01FREFfRVJSX01FUlIsICJNRVJSfCIpOwo+ID4gKwlldnRfc3ByaW50Zihz
dHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfRlJBTUVUTywgIkZSQU1FVE98Iik7Cj4gPiArCj4gPiAr
CS8qIERPVSBlcnJvciAqLwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9F
UlJfRFJJRlRUTywgIkRSSUZUVE98Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYg
S09NRURBX0VSUl9GUkFNRVRPLCAiRlJBTUVUT3wiKTsKPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBl
dmVudHMgJiBLT01FREFfRVJSX1RFVE8sICJURVRPfCIpOwo+ID4gKwlldnRfc3ByaW50ZihzdHIs
IGV2ZW50cyAmIEtPTUVEQV9FUlJfQ1NDRSwgIkNTQ0V8Iik7Cj4gPiArCj4gPiArCS8qIExQVSBl
cnJvcnMgb3IgZXZlbnRzICovCj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURB
X0VWRU5UX0lCU1ksICJJQlNZfCIpOwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtP
TUVEQV9FUlJfQVhJRSwgIkFYSUV8Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYg
S09NRURBX0VSUl9BQ0UwLCAiQUNFMHwiKTsKPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMg
JiBLT01FREFfRVJSX0FDRTEsICJBQ0UxfCIpOwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50
cyAmIEtPTUVEQV9FUlJfQUNFMiwgIkFDRTJ8Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZl
bnRzICYgS09NRURBX0VSUl9BQ0UzLCAiQUNFM3wiKTsKPiA+ICsKPiA+ICsJLyogTFBVIFRCVSBl
cnJvcnMqLwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVENGLCAi
VENGfCIpOwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVFRORywg
IlRUTkd8Iik7Cj4gPiArCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9USVRS
LCAiVElUUnwiKTsKPiA+ICsJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RF
TVIsICJURU1SfCIpOwo+ID4gKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJf
VFRGLCAiVFRGfCIpOwo+ID4gKwo+ID4gKwkvKiBDVSBlcnJvcnMqLwo+ID4gKwlldnRfc3ByaW50
ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ1BFLCAiQ09QUk9DfCIpOwo+ID4gKwlldnRfc3By
aW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfWk1FLCAiWk1FfCIpOwo+ID4gKwlldnRfc3By
aW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ0ZHRSwgIkNGR0V8Iik7Cj4gPiArCWV2dF9z
cHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9URU1SLCAiVEVNUnwiKTsKPiA+ICsKPiA+
ICsJaWYgKHN0ci0+bGVuID4gMCAmJiAoc3RyLT5zdHJbc3RyLT5sZW4gLSAxXSA9PSAnfCcpKSB7
Cj4gPiArCQlzdHItPnN0cltzdHItPmxlbiAtIDFdID0gMDsKPiA+ICsJCXN0ci0+bGVuLS07Cj4g
PiArCX0KPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGJvb2wgaXNfbmV3X2ZyYW1lKHN0cnVjdCBr
b21lZGFfZXZlbnRzICphKQo+ID4gK3sKPiA+ICsJcmV0dXJuIChhLT5waXBlc1swXSB8IGEtPnBp
cGVzWzFdKSAmCj4gPiArCSAgICAgICAoS09NRURBX0VWRU5UX0ZMSVAgfCBLT01FREFfRVZFTlRf
RU9XKTsKPiA+ICt9Cj4gPiArCj4gPiArdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBr
b21lZGFfZXZlbnRzICpldnRzKQo+ID4gK3sKPiA+ICsJdTY0IHByaW50X2V2dHMgPSBLT01FREFf
RVJSX0VWRU5UUzsKPiA+ICsJc3RhdGljIGJvb2wgZW5fcHJpbnQgPSB0cnVlOwo+ID4gKwo+ID4g
KwkvKiByZWR1Y2UgdGhlIHNhbWUgbXNnIHByaW50LCBvbmx5IHByaW50IHRoZSBmaXJzdCBldnQg
Zm9yIG9uZSAKPiBmcmFtZSAqLwo+ID4gKwlpZiAoZXZ0cy0+Z2xvYmFsIHx8IGlzX25ld19mcmFt
ZShldnRzKSkKPiA+ICsJCWVuX3ByaW50ID0gdHJ1ZTsKPiA+ICsJaWYgKCFlbl9wcmludCkKPiA+
ICsJCXJldHVybjsKPiA+ICsKPiA+ICsJaWYgKChldnRzLT5nbG9iYWwgfCBldnRzLT5waXBlc1sw
XSB8IGV2dHMtPnBpcGVzWzFdKSAmIHByaW50X2V2dHMpIAo+IHsKPiA+ICsJCWNoYXIgbXNnWzI1
Nl07Cj4gPiArCQlzdHJ1Y3Qga29tZWRhX3N0ciBzdHI7Cj4gPiArCj4gPiArCQlzdHIuc3RyID0g
bXNnOwo+ID4gKwkJc3RyLnN6ICA9IHNpemVvZihtc2cpOwo+ID4gKwkJc3RyLmxlbiA9IDA7Cj4g
PiArCj4gPiArCQlrb21lZGFfc3ByaW50Zigmc3RyLCAiZ2N1OiAiKTsKPiA+ICsJCWV2dF9zdHIo
JnN0ciwgZXZ0cy0+Z2xvYmFsKTsKPiA+ICsJCWtvbWVkYV9zcHJpbnRmKCZzdHIsICIsIHBpcGVz
WzBdOiAiKTsKPiA+ICsJCWV2dF9zdHIoJnN0ciwgZXZ0cy0+cGlwZXNbMF0pOwo+ID4gKwkJa29t
ZWRhX3NwcmludGYoJnN0ciwgIiwgcGlwZXNbMV06ICIpOwo+ID4gKwkJZXZ0X3N0cigmc3RyLCBl
dnRzLT5waXBlc1sxXSk7Cj4gPiArCj4gPiArCQlEUk1fRVJST1IoImVyciBkZXRlY3Q6ICVzXG4i
LCBtc2cpOwo+ID4gKwo+ID4gKwkJZW5fcHJpbnQgPSBmYWxzZTsKPiA+ICsJfQo+ID4gK30KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9r
bXMuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
YyBpbmRleCA0MTlhOGIwLi4wZmFmYzM2Cj4gPiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ID4gQEAgLTQ3LDYgKzQ3LDEw
IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBrb21lZGFfa21zX2lycV9oYW5kbGVyKGludCBpcnEsIHZv
aWQKPiA+ICpkYXRhKSBtZW1zZXQoJmV2dHMsIDAsIHNpemVvZihldnRzKSk7Cj4gPiAgCXN0YXR1
cyA9IG1kZXYtPmZ1bmNzLT5pcnFfaGFuZGxlcihtZGV2LCAmZXZ0cyk7Cj4gPiAKPiA+ICsjaWZk
ZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQKPiA+ICsJa29tZWRhX3ByaW50X2V2ZW50
cygmZXZ0cyk7Cj4gPiArI2VuZGlmCj4gPiArCj4gPiAgCS8qIE5vdGlmeSB0aGUgY3J0YyB0byBo
YW5kbGUgdGhlIGV2ZW50cyAqLwo+ID4gIAlmb3IgKGkgPSAwOyBpIDwga21zLT5uX2NydGNzOyBp
KyspCj4gPiAgCQlrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoJmttcy0+Y3J0Y3NbaV0sICZldnRz
KTsKPiAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
