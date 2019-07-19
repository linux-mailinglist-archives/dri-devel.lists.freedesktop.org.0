Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727176E37B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 11:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512786E7E3;
	Fri, 19 Jul 2019 09:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893E66E7E3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 09:31:46 +0000 (UTC)
Received: from VI1PR08CA0174.eurprd08.prod.outlook.com (2603:10a6:800:d1::28)
 by DB6PR0802MB2597.eurprd08.prod.outlook.com (2603:10a6:4:99::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Fri, 19 Jul
 2019 09:31:42 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0174.outlook.office365.com
 (2603:10a6:800:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.14 via Frontend
 Transport; Fri, 19 Jul 2019 09:31:41 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 19 Jul 2019 09:31:40 +0000
Received: ("Tessian outbound 96ba4cc141ab:v24");
 Fri, 19 Jul 2019 09:31:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de1be44423d7f300
X-CR-MTA-TID: 64aa7808
Received: from 08b9ed48e2e3.2 (cr-mta-lb-1.cr-mta-net [104.47.5.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 040B9857-DD73-42E7-8E39-1CD02C3981BB.1; 
 Fri, 19 Jul 2019 09:31:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08b9ed48e2e3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 19 Jul 2019 09:31:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCsIqGhqczXeqibGaLd01waEVzXhRsHYt7OrzTCPIABxUYSxncPjzNSOcaajNjTH79mhQXoV+wihwAAZvswRa7O1ZN5s5ylCNMumB+OKdPHc2nW2quKmMYCozZrOxpaVAriXA9SKRngUQNNFHcyL5gT3CZiNC/IRlgoPaqmiFlYdE9JnLimDoj0jO2L7dWenXBhpwS9s6yri5OIc7yYKke7fcQFeVv/2MPbiN2ABfi4ZjDFI3zmxDidwrrrG+lORKHp6ZPlTIxjgNHCGZDOtfwBdJLsKb6mcsnXqTdumITYvmTAY7iwTw7HXJ9wVjPjNueHhFkspauM5dT0xcxMIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ+I7XGmswhIPw5rpifx2ypsrA+q4H/7pFMXsKFojaY=;
 b=LIFMMqjbY7q5ShvSCfG8UPYhnou0qyPaeFKh9p9ffTh5sQPSpcs9gI/wlTBUWoVppZYM4+Y1MRzFxCj7g74wEiclh7UjbXmUK5KVhMFkJ87kJapDe0PuNzXEGmkHFbuL3MKYE6Q3xRQvoJO8wMZwE3vsPAAAV/DscZA3geETvdu5zjHdpPNzdlCcJXx8c1G+goH1O+oNYR+e31XFBoUrTJw5SbjwmBHgIahpBlaiiKuSjpkLhuVTCCbyXNcdfcthJHutr3VaFzzZyeC62umqj1mvTGmXjtM3JRuOz0T8wdB2t/gRgUwkXkkPniwbel3gGaCS4fgdB2E80gGtqNw4eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4304.eurprd08.prod.outlook.com (20.179.25.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 09:31:32 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::390b:b8a9:542b:9ef9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::390b:b8a9:542b:9ef9%3]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:31:32 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/komeda: Adds error event print functionality
Thread-Topic: [PATCH] drm/komeda: Adds error event print functionality
Thread-Index: AQHVLJXktogmbqKelUWXSXQXvsiyYKbQfSqAgAAjQwCAAS+QgA==
Date: Fri, 19 Jul 2019 09:31:31 +0000
Message-ID: <20190719093019.GA4446@lowry.li@arm.com>
References: <1561604994-26925-1-git-send-email-lowry.li@arm.com>
 <20190718131737.GD5942@e110455-lin.cambridge.arm.com>
 <20190718152350.GC31819@art_vandelay>
In-Reply-To: <20190718152350.GC31819@art_vandelay>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.5.21 (2010-09-15)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0031.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::19) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 64c0ada2-cb85-446c-c4bf-08d70c2be769
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB4304; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB4304:|DB6PR0802MB2597:
X-Microsoft-Antispam-PRVS: <DB6PR0802MB259758DB5860FB5B28564A459FCB0@DB6PR0802MB2597.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 01039C93E4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(446003)(7736002)(68736007)(52116002)(11346002)(256004)(6116002)(25786009)(81166006)(81156014)(5660300002)(102836004)(55236004)(386003)(6506007)(76176011)(229853002)(8936002)(486006)(99286004)(26005)(476003)(186003)(86362001)(54906003)(36756003)(4326008)(14454004)(6246003)(58126008)(6512007)(53936002)(305945005)(6436002)(316002)(2906002)(6486002)(6916009)(61793004)(478600001)(71200400001)(71190400001)(66946007)(66446008)(64756008)(66556008)(66066001)(3846002)(66476007)(1076003)(9686003)(8676002)(33656002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4304;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: yxgfM2/1NHUMq16xsMyEa7DaZ8pqi8I4ZnED2Z3Rrns9yKWRlzXvANZBxf4regE8ldmOdBeT2FfUAnVlh9zpcBrjakBCnstR+JdEQaPOjXulsJWWyRqpxMuaJJcAssCshv9U7JnWj7jqO7ab8FZgRTb0ojgMacZJGLfqxndDb6rBeU/9HVOhOpp8tFkZ5LI0p2e7/79CC+AsfixdTDaiG7GyP+gxeYHaBo+Aktpwu7IT9GAdPIWhbnMv1G1hza33aBeTteTM/cYTCxNMUYLmI3/lA83WyIh159BEEJamUg09pKfEHcqhdfYwGo+iPrSeJiAOzG0VN4UptxkRStYBwW096GLUdaDMreSIzWzcIY+1Egrte6KnkEj2CcCmNSbCx6+wKFdOHw6rYFP/G4FQq5uaKmWR2BMD6UHwGWNV/aY=
Content-ID: <D7E29A42E6417540A8B9EBF47376E53F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4304
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(199004)(189003)(6486002)(66066001)(47776003)(54906003)(316002)(70586007)(436003)(305945005)(6862004)(76130400001)(76176011)(33656002)(386003)(6506007)(102836004)(7736002)(6512007)(2906002)(61793004)(9686003)(36756003)(25786009)(99286004)(58126008)(70206006)(478600001)(3846002)(8936002)(486006)(356004)(23676004)(5660300002)(86362001)(63350400001)(81156014)(36906005)(2486003)(186003)(14454004)(8676002)(81166006)(229853002)(4326008)(1076003)(446003)(6246003)(336012)(11346002)(126002)(22756006)(6116002)(26005)(26826003)(476003)(50466002)(63370400001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2597;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9d93fd50-a848-4ff3-0dc0-08d70c2be253
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0802MB2597; 
NoDisclaimer: True
X-Forefront-PRVS: 01039C93E4
X-Microsoft-Antispam-Message-Info: QIIqFD9P2hmYzn6tuQQfz1GioeHBHl8A5ODs2baQtgXWimuq7D8vGFGnObAS3cXYiswgMuWHgIq6j3iUISyp7hr50gYFnOWtcRbjJStYwKTMcD9pFj6r6qJO5HqvWiDzI5/cQhZgm2xdTnYNvAvDJbGWh6f1G/UsUS442CBXPgOZYB4hzDEU8aEvxJcSIPHq0VFjDI3T39TWTCMAvOOa4Knv1BwoEytpO+hql3o5VN0eRkhMVOf8B6IGANiIhcJVuegNr9mnYAzi8Rr0Ui4O5Gc6st0CK2EXSy8RQaN1JDF7qCSyHdblrslPaz2CZLJ+S4Sg4so5VyYsc2ldElpiD7oVNgkinETPShzU+1FMC4PpEsxRL/5eaZXo3Hp9tFMC9aSCMWpMw/qgc5RRTXAXAqLcI6SDmI1nl/9lREX38xc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2019 09:31:40.1029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c0ada2-cb85-446c-c4bf-08d70c2be769
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2597
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ+I7XGmswhIPw5rpifx2ypsrA+q4H/7pFMXsKFojaY=;
 b=38OEPq5nuG1LrcTDTOWVOIxeoXSmWPuHvVQEdefedCWUu76KpBohgy3hC7qu3bO3YZ04Yq4PyQrIFb0mW3e+Fzexh5se1ZLdyFejQ15X/gsVXcvWIO/i6yNyckSb1mCVrTW4BlVoSwS7XYs7qCbUFolitZ154ML4cWBsdIeNGK8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ+I7XGmswhIPw5rpifx2ypsrA+q4H/7pFMXsKFojaY=;
 b=38OEPq5nuG1LrcTDTOWVOIxeoXSmWPuHvVQEdefedCWUu76KpBohgy3hC7qu3bO3YZ04Yq4PyQrIFb0mW3e+Fzexh5se1ZLdyFejQ15X/gsVXcvWIO/i6yNyckSb1mCVrTW4BlVoSwS7XYs7qCbUFolitZ154ML4cWBsdIeNGK8=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2VhbiwNCg0KT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTE6MjM6NTBBTSAtMDQwMCwgU2Vh
biBQYXVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAwMjoxNzozN1BNICswMTAw
LCBMaXZpdSBEdWRhdSB3cm90ZToNCj4gPiBPbiBUaHUsIEp1biAyNywgMjAxOSBhdCAwNDoxMDoz
NkFNICswMTAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOg0KPiANCj4g
L3NuaXANCj4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYw0KPiA+ID4gaW5kZXggNjQ3YmNlNS4uMTQ2MmJhYyAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jDQo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
Yw0KPiA+ID4gQEAgLTQ3LDYgKzQ3LDggQEAgc3RhdGljIGlycXJldHVybl90IGtvbWVkYV9rbXNf
aXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkNCj4gPiA+ICAJbWVtc2V0KCZldnRzLCAw
LCBzaXplb2YoZXZ0cykpOw0KPiA+ID4gIAlzdGF0dXMgPSBtZGV2LT5mdW5jcy0+aXJxX2hhbmRs
ZXIobWRldiwgJmV2dHMpOw0KPiA+ID4gIA0KPiA+ID4gKwlrb21lZGFfcHJpbnRfZXZlbnRzKCZl
dnRzKTsNCj4gPiANCj4gPiBDYWxsaW5nIHRoaXMgZnVuY3Rpb24gZnJvbSB0aGUgSVJRIGhhbmRs
ZXIgaXMgYSBiYWQgaWRlYS4gV2Ugc2hvdWxkIHVzZSBkZWJ1Z2ZzDQo+ID4gaWYgeW91IHJlYWxs
eSB3YW50IHRvIGhhdmUgYSB0cmFjZSBvZiB0aGUgZXZlbnRzLCBidXQgSSBwZXJzb25hbGx5IGRv
bid0IHNlZQ0KPiA+IHZhbHVlIGluIGhhdmluZyB0aGlzIGZ1bmN0aW9uYWxpdHkgaW4gdGhlIGtl
cm5lbCBhdCBhbGwuIFlvdSBjYW4gZXhwb3NlIHRoZQ0KPiA+IHZhbHVlIG9mIHRoZSBldnRzLT5n
bG9iYWwgYW5kIGV2dHMtPnBpcGVzW10gYXMgaW50ZWdlcnMgYW5kIGRlY29kZSB0aGF0IGluDQo+
ID4gdXNlcnNwYWNlIG9yIGFzIGEgZGVidWdmcyBlbnRyeS4NCj4gDQo+IEFsdGVybmF0aXZlbHks
IGNvbnNpZGVyIHVzaW5nIGtlcm5lbCB0cmFjZSBldmVudHMuIFRoZXkgYWxsb3cgeW91IHRvIHNl
bGVjdGl2ZWx5DQo+IHR1cm4gb24vb2ZmIGNlcnRhaW4gZXZlbnRzIGFuZCBhbHNvIGFsbG93IHlv
dSB0byBjdXN0b21pemUgd2hpY2ggZGF0YSBpcw0KPiByZWNvcmRlZCBhbmQgaG93IGl0J3MgZm9y
bWF0dGVkLiBTZWVtcyBsaWtlIGEgZ29vZCBmaXQgZnJvbSB0aGUgcXVpY2sgc2NhbiBJJ3ZlDQo+
IGRvbmUuDQo+IA0KPiBTZWFuDQo+DQpZZXMsIGZpbmlhbGx5IHdlIHdhbnQgdG8gZ2V0IGJvdGgg
d2F5LCB1c2luZyBrZXJuZWwgdHJhY2UgZXZlbnRzIGFuZA0KbWVhbndoaWxlIHByaW50aW5nIG91
dCB0aGUgaGFyZHdhcmUgZGV0ZWN0ZWQgZXJyb3JzLCBmcm9tIHdoaWNoIHdlIGNhbg0Ka25vdyBk
aXJlY3RseSBvbmNlIHRoZSBlcnJvcnMgaGFwcGVuZWQgb24gdGhlIGhhcmR3YXJlLkxpa2UgaW50
ZWwgZGlkLA0KaW4gaW50ZWxfY3B1X2ZpZm9fdW5kZXJydW5faXJxX2hhbmRsZXIoKS4NClRoYW5r
cyBhIGxvdC4NCg0KQmVzdCBSZWdhcmRzLA0KTG93cnkNCj4gPiANCj4gPiBCZXN0IHJlZ2FyZHMs
DQo+ID4gTGl2aXUNCj4gPiANCj4gPiA+ICsNCj4gPiA+ICAJLyogTm90aWZ5IHRoZSBjcnRjIHRv
IGhhbmRsZSB0aGUgZXZlbnRzICovDQo+ID4gPiAgCWZvciAoaSA9IDA7IGkgPCBrbXMtPm5fY3J0
Y3M7IGkrKykNCj4gPiA+ICAJCWtvbWVkYV9jcnRjX2hhbmRsZV9ldmVudCgma21zLT5jcnRjc1tp
XSwgJmV2dHMpOw0KPiA+ID4gLS0gDQo+ID4gPiAxLjkuMQ0KPiA+ID4gDQo+ID4gDQo+ID4gLS0g
DQo+ID4gPT09PT09PT09PT09PT09PT09PT0NCj4gPiB8IEkgd291bGQgbGlrZSB0byB8DQo+ID4g
fCBmaXggdGhlIHdvcmxkLCAgfA0KPiA+IHwgYnV0IHRoZXkncmUgbm90IHwNCj4gPiB8IGdpdmlu
ZyBtZSB0aGUgICB8DQo+ID4gIFwgc291cmNlIGNvZGUhICAvDQo+ID4gICAtLS0tLS0tLS0tLS0t
LS0NCj4gPiAgICAgwq9cXyjjg4QpXy/Crw0KPiANCj4gLS0gDQo+IFNlYW4gUGF1bCwgU29mdHdh
cmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TDQoNCi0tIA0KUmVnYXJkcywNCkxvd3J5
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
