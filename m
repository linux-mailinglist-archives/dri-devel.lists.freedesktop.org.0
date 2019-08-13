Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4F8B498
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 11:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605C16E0D8;
	Tue, 13 Aug 2019 09:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40052.outbound.protection.outlook.com [40.107.4.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4456E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 09:51:29 +0000 (UTC)
Received: from VI1PR0802CA0017.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::27) by HE1PR0801MB1849.eurprd08.prod.outlook.com
 (2603:10a6:3:89::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Tue, 13 Aug
 2019 09:51:25 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by VI1PR0802CA0017.outlook.office365.com
 (2603:10a6:800:aa::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.16 via Frontend
 Transport; Tue, 13 Aug 2019 09:51:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 09:51:23 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Tue, 13 Aug 2019 09:51:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43255d24ed839f31
X-CR-MTA-TID: 64aa7808
Received: from 214acc971bca.2 (cr-mta-lb-1.cr-mta-net [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D150B111-69E6-45A2-8589-883976518BC8.1; 
 Tue, 13 Aug 2019 09:51:12 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 214acc971bca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Aug 2019 09:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fr4xhA3UXAYn18LzADjt7J2YIGnl4VCIIY0Ha/fr0+O67LBL4c6VUGmGjeMmwZURyMkQlm7SOcUgC/wEHpzRxufEYTWxFO/lFnvUxiMZSQknukTGo/wRFgNLk8Rvdo++F8KZYvxHdE09V9+A1DmvUX1dEUlnBK3GlDyVKOhPJ3xE26paLdCAlSAW/Mquk/dg8nUBzhDBsyyzfyL3dqKOhk77vQ0grrLXLg13igLoQJjPIUv/s5wNP8IJmZPoY5mEzfPs7YFMZHEi7AnayX01jER5TcEUFKdgbFgrwkU/RfbPmxeMB6YLvXFtFCctw+683D6WjHAt/YJZpQ6NUYPERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fwe4U2U0qDuCKnneCwAVGrcoj98mD6qvg73JjQHMHU=;
 b=E/v39t4o6BTC3JDvVEkn+E3z3TQHVOE4wauYV5GW9CMgINA2FvtuF0fnB2kv9Oml0QYHMeRRDrLVq06yQTUeE/0+Utvfd+tjdXUEWq+5K4EPkxpKgGh57Wox4TcNxq+u/U1WAfEUTEz4dGgswCQfSrYOZF6KjwQoJWaM14pSsQhf66AxLfFwE7UjLNiDxXhPAQV0081Ju43LaGbi5bq5MxoCCmwdVQgKjM7+87NYKkcZKy71jvVa5eqS5d1qYBOLN43CZAMir+gZ/hRqB43AHg03K5vPM+1pJ3Gc2D9W5ErTfP8uucO1kWqaqmLbmYd+NJ0On1UVwB6JySENsdgUmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3615.eurprd08.prod.outlook.com (20.177.61.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 09:51:09 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::2001:a268:ba50:fa51%3]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 09:51:09 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Topic: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Index: AQHVUZN2ECag5jvL6k2i3zNMwO/wrKb41hqA
Date: Tue, 13 Aug 2019 09:51:08 +0000
Message-ID: <3902025.BCtzpz6JhW@e123338-lin>
References: <20190813045536.28239-1-james.qian.wang@arm.com>
 <20190813045536.28239-3-james.qian.wang@arm.com>
In-Reply-To: <20190813045536.28239-3-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.50]
x-clientproxiedby: LO2P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::23) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 05dbe742-ded6-4a41-bfcf-08d71fd3cd46
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3615; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3615:|HE1PR0801MB1849:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB18490992BC740FFCC89985FD8FD20@HE1PR0801MB1849.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
x-forefront-prvs: 01283822F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(189003)(199004)(81156014)(66476007)(86362001)(66556008)(478600001)(7736002)(64756008)(66946007)(305945005)(81166006)(6246003)(66446008)(8676002)(14454004)(33716001)(14444005)(2906002)(3846002)(256004)(71190400001)(71200400001)(6116002)(4326008)(66066001)(6636002)(476003)(76176011)(53936002)(6862004)(9686003)(316002)(229853002)(486006)(6486002)(26005)(11346002)(5660300002)(6436002)(446003)(6506007)(386003)(186003)(102836004)(8936002)(25786009)(54906003)(52116002)(99286004)(6512007)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3615;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: U0q++ctwd1l+zyjKJjrODlEBFGFEpz7cLmMxuC8USjrRjoCWCe9m1+G3X+cDp5/UqxllKf8JjJ8IEQJkQicPFkawV5XfTKzcX64Z0/P7dvNFiTppILKrx1hsLFm7yVwVAgNRwhcU3uFM2vfo/GG9TY/453mdjh4vE+OBhcKcSwFIx/oUDBsDDHOtJ3FylFhr/f1+ICV1rIkJ134up8CkqMX53kUV9qQTtlsZR46HTLQipjipJybTgJ47xE0UsuRk2PQKs4q7m1k2I88bhNWlcJ9reR2G0lgpZ3nv78b64s8ldJ0fiSrfRiKZVzshShjCspVwnrbL9nkgajWlM621FMbjS3HXU7Qr+iyuSbIYFHuNJ86ur6EzuE24sm/Rd30BQs7/Fkze2p0dm8ioeF6i7/cizRvTb03TgyTJTMSuwFE=
Content-ID: <2B23C4D5CD665642A771986D6D1C4BFA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3615
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(189003)(199004)(8936002)(11346002)(102836004)(14454004)(14444005)(47776003)(26826003)(229853002)(7736002)(5660300002)(316002)(3846002)(25786009)(86362001)(476003)(9686003)(54906003)(446003)(46406003)(8746002)(97756001)(26005)(50466002)(6862004)(6512007)(66066001)(6246003)(2906002)(22756006)(81156014)(6636002)(386003)(81166006)(186003)(76130400001)(63350400001)(70586007)(70206006)(63370400001)(99286004)(6506007)(8676002)(478600001)(76176011)(4326008)(356004)(6486002)(6116002)(126002)(23726003)(336012)(486006)(305945005)(33716001)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1849;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc90dce7-0f22-4808-fba7-08d71fd3c43a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0801MB1849; 
NoDisclaimer: True
X-Forefront-PRVS: 01283822F8
X-Microsoft-Antispam-Message-Info: lMBbvmVZJAUzgelWm+2aCDeC/03CSZA3EjeOkOPcnQRXBxb6foPe9FcuDHlIekgjGNS/rsZc2oFhWK5JpOXClReSlQ2EPh6Z0rn5VgVClXSO5+JPbAv6Zw3o4JigBH6FmVqEdB6J9Jhs5/USJDSeUKSMkxD8dsHy1dFZx0HbsKbv3Yn/y+0eYqYGxV8deMzA02hf+6pSa0CXd6nl6NaQmsknrs/kJb00T/9UTfODpw7SNdQXzD1gemlCrwNlrA75DbiwyCm5YvzVVVstlejRbb/rsXStad4RQd96kVrtBCgTT5rDf+JdfKQPfZbQx8DoA19F0f2eEeM25i43xSvBSMWZYsAii57RsKQYW0QqPmnjCWTKk5BX7VdlyRMxfGJmQsQMrsijKrtTqLgTJSQsdRR9A1C7Wcc8FsQyIKSeAf4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 09:51:23.7690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dbe742-ded6-4a41-bfcf-08d71fd3cd46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1849
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fwe4U2U0qDuCKnneCwAVGrcoj98mD6qvg73JjQHMHU=;
 b=V4ZVhF+YMiObYpyjMMMbjACJbBvJ9b0eZlAaklrIvg/k9NluWWTt3hMW+AGPe1zMBHhFgQo+AAsPo+FjbXMGIBPnfIIdO/j5qBHpWPdY56XGz1dYP8adxwdhuIkyasjlm2ioj3Me5Yxv8QYL/U412HNjsdWathxoMt9jhzbF0pc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fwe4U2U0qDuCKnneCwAVGrcoj98mD6qvg73JjQHMHU=;
 b=V4ZVhF+YMiObYpyjMMMbjACJbBvJ9b0eZlAaklrIvg/k9NluWWTt3hMW+AGPe1zMBHhFgQo+AAsPo+FjbXMGIBPnfIIdO/j5qBHpWPdY56XGz1dYP8adxwdhuIkyasjlm2ioj3Me5Yxv8QYL/U412HNjsdWathxoMt9jhzbF0pc=
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

SGkgSmFtZXMsCgpPbiBUdWVzZGF5LCAxMyBBdWd1c3QgMjAxOSAwNTo1NjowNyBCU1QgamFtZXMg
cWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gTWFueSBrb21lZGEgY29t
cG9uZW50IHN1cHBvcnQgY29sb3IgbWFuYWdlbWVudCBsaWtlIGxheWVyIGFuZCBJUFMsIHNvCj4g
a29tZWRhX2NvbG9yX21hbmFnZXIvc3RhdGUgYXJlIGludHJvZHVjZWQgdG8gbWFuYWdlciBnYW1t
YSwgY3NjIGFuZCBkZWdhbW1hCj4gdG9nZXRoZXIgZm9yIGVhc2lseSBzaGFyZSBpdCB0byBtdWx0
aXBsZSBjb21wb25wZW50Lgo+IAo+IEFuZCBmb3Iga29tZWRhX2NvbG9yX21hbmFnZXIgd2hpY2g6
Cj4gLSBjb252ZXJ0IGRybSAzZCBnYW1tYSBsdXQgdG8ga29tZWRhIHNwZWNpZmljIGdhbW1hIGNv
ZWZmcwo+IC0gZ2FtbWEgdGFibGUgbWFuYWdlbWVudCBhbmQgaGlkZSB0aGUgSFcgZGlmZmVyZW5j
ZSBmb3Iga29tZWRhLUNPUkUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gLS0tCj4gIC4u
Li9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDEyNiArKysrKysr
KysrKysrKysrKysKPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5o
ICAgIHwgIDMyICsrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYwo+IGluZGV4IDlkMTRhOTJkYmIxNy4uYmYyMzg4
ZDY0MWI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NvbG9yX21nbXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2NvbG9yX21nbXQuYwo+IEBAIC00LDcgKzQsOSBAQAo+ICAgKiBBdXRob3I6
IEphbWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gICAqCj4gICAqLwo+
ICsjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgo+ICAKPiArI2luY2x1ZGUgIm1hbGlkcF91dGls
cy5oIgo+ICAjaW5jbHVkZSAia29tZWRhX2NvbG9yX21nbXQuaCIKPiAgCj4gIC8qIDEwYml0IHBy
ZWNpc2lvbiBZVVYyUkdCIG1hdHJpeCAqLwo+IEBAIC02NSwzICs2NywxMjcgQEAgY29uc3QgczMy
ICprb21lZGFfc2VsZWN0X3l1djJyZ2JfY29lZmZzKHUzMiBjb2xvcl9lbmNvZGluZywgdTMyIGNv
bG9yX3JhbmdlKQo+ICAKPiAgCXJldHVybiBjb2VmZnM7Cj4gIH0KPiArCj4gK3N0cnVjdCBnYW1t
YV9jdXJ2ZV9zZWN0b3Igewo+ICsJdTMyIGJvdW5kYXJ5X3N0YXJ0Owo+ICsJdTMyIG51bV9vZl9z
ZWdtZW50czsKPiArCXUzMiBzZWdtZW50X3dpZHRoOwo+ICt9Owo+ICsKPiArc3RydWN0IGdhbW1h
X2N1cnZlX3NlZ21lbnQgewo+ICsJdTMyIHN0YXJ0Owo+ICsJdTMyIGVuZDsKPiArfTsKPiArCj4g
K3N0YXRpYyBzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIHNlY3Rvcl90YmxbXSA9IHsKPiArCXsg
MCwgICAgNCwgIDQgICB9LAo+ICsJeyAxNiwgICA0LCAgNCAgIH0sCj4gKwl7IDMyLCAgIDQsICA4
ICAgfSwKPiArCXsgNjQsICAgNCwgIDE2ICB9LAo+ICsJeyAxMjgsICA0LCAgMzIgIH0sCj4gKwl7
IDI1NiwgIDQsICA2NCAgfSwKPiArCXsgNTEyLCAgMTYsIDMyICB9LAo+ICsJeyAxMDI0LCAyNCwg
MTI4IH0sCj4gK307Cj4gKwo+ICtzdGF0aWMgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciBpZ2Ft
bWFfc2VjdG9yX3RibFtdID0gewo+ICsJezAsIDY0LCA2NH0sCj4gK307Cj4gKwo+ICtzdGF0aWMg
dm9pZAo+ICtkcm1fbHV0X3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9i
bG9iLCB1MzIgKmNvZWZmcywKPiArCQkgIHN0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3IgKnNlY3Rv
cl90YmwsIHUzMiBudW1fc2VjdG9ycykKPiArewo+ICsJc3RydWN0IGRybV9jb2xvcl9sdXQgKmx1
dDsKPiArCXUzMiBpLCBqLCBpbiwgbnVtID0gMDsKPiArCj4gKwlpZiAoIWx1dF9ibG9iKQo+ICsJ
CXJldHVybjsKPiArCj4gKwlsdXQgPSBsdXRfYmxvYi0+ZGF0YTsKPiArCj4gKwlmb3IgKGkgPSAw
OyBpIDwgbnVtX3NlY3RvcnM7IGkrKykgewo+ICsJCWZvciAoaiA9IDA7IGogPCBzZWN0b3JfdGJs
W2ldLm51bV9vZl9zZWdtZW50czsgaisrKSB7Cj4gKwkJCWluID0gc2VjdG9yX3RibFtpXS5ib3Vu
ZGFyeV9zdGFydCArCj4gKwkJCSAgICAgaiAqIHNlY3Rvcl90YmxbaV0uc2VnbWVudF93aWR0aDsK
PiArCj4gKwkJCWNvZWZmc1tudW0rK10gPSBkcm1fY29sb3JfbHV0X2V4dHJhY3QobHV0W2luXS5y
ZWQsCj4gKwkJCQkJCUtPTUVEQV9DT0xPUl9QUkVDSVNJT04pOwo+ICsJCX0KPiArCX0KPiArCj4g
Kwljb2VmZnNbbnVtXSA9IEJJVChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKTsKPiArfQo+ICsKPiAr
dm9pZCBkcm1fbHV0X3RvX2lnYW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICps
dXRfYmxvYiwgdTMyICpjb2VmZnMpCj4gK3sKPiArCWRybV9sdXRfdG9fY29lZmZzKGx1dF9ibG9i
LCBjb2VmZnMsCj4gKwkJCSAgaWdhbW1hX3NlY3Rvcl90YmwsIEFSUkFZX1NJWkUoaWdhbW1hX3Nl
Y3Rvcl90YmwpKTsKPiArfQo+ICsKPiArdm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpCj4gK3sKPiArCWRy
bV9sdXRfdG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMsCj4gKwkJCSAgc2VjdG9yX3RibCwgQVJS
QVlfU0laRShzZWN0b3JfdGJsKSk7Cj4gK30KPiArCj4gK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMo
c3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpCj4gK3sKPiAr
CXN0cnVjdCBkcm1fY29sb3JfY3RtICpjdG07Cj4gKwl1MzIgaTsKPiArCj4gKwlpZiAoIWN0bV9i
bG9iKQo+ICsJCXJldHVybjsKPiArCj4gKwljdG0gPSBjdG1fYmxvYi0+ZGF0YTsKPiArCj4gKwlm
b3IgKGkgPSAwOyBpIDwgS09NRURBX05fQ1RNX0NPRUZGUzsgKytpKSB7Cj4gKwkJLyogQ29udmVy
dCBmcm9tIFMzMS4zMiB0byBRMy4xMi4gKi8KPiArCQlzNjQgdiA9IGN0bS0+bWF0cml4W2ldOwo+
ICsKPiArCQljb2VmZnNbaV0gPSBjbGFtcF92YWwodiwgMSAtICgxTEwgPDwgMzQpLCAoMUxMIDw8
IDM0KSAtIDEpID4+IDIwOwpDVE0gbWF0cml4IHZhbHVlcyBhcmUgUzMxLjMyLCBpLmUuIHNpZ24t
bWFnbml0dWRlLCBzbyBjbGFtcF92YWwgd29uJ3QKZ2l2ZSB5b3UgdGhlIHJpZ2h0IHJlc3VsdCBm
b3IgbmVnYXRpdmUgY29lZmZzLiBTZWUKbWFsaWRwX2NydGNfYXRvbWljX2NoZWNrX2N0bSBmb3Ig
dGhlIHNpZ24tbWFnIC0+IDIncyBjb21wbGVtZW50CmNvbnZlcnNpb24uCj4gKwl9Cj4gK30KPiAr
Cj4gK3ZvaWQga29tZWRhX2NvbG9yX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3Qga29tZWRhX2NvbG9y
X3N0YXRlICpuZXcsCj4gKwkJCQkgIHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKm9sZCkKW2Jp
a2VzaGVkXSBub3QgcmVhbGx5IGEgX2R1cGxpY2F0ZV9zdGF0ZSBpZiBhbGwgaXQgZG9lcyBpcyBy
ZWZjb3VudHMuCmttZW1kdXAgaGVyZSBhbmQgcmV0dXJuIGEgcG9pbnRlciAod2l0aCBFUlJfUFRS
IG9uIGZhaWwpLCBvciBtZW1jcHkgaWYKeW91IHdhbnQgdG8ga2VlcCB0aGUgc2lnbmF0dXJlPwo+
ICt7Cj4gKwluZXctPmlnYW1tYSA9IGtvbWVkYV9jb2VmZnNfZ2V0KG9sZC0+aWdhbW1hKTsKPiAr
CW5ldy0+ZmdhbW1hID0ga29tZWRhX2NvZWZmc19nZXQob2xkLT5mZ2FtbWEpOwo+ICt9Cj4gKwo+
ICt2b2lkIGtvbWVkYV9jb2xvcl9jbGVhbnVwX3N0YXRlKHN0cnVjdCBrb21lZGFfY29sb3Jfc3Rh
dGUgKmNvbG9yX3N0KQo+ICt7Cj4gKwlrb21lZGFfY29lZmZzX3B1dChjb2xvcl9zdC0+aWdhbW1h
KTsKPiArCWtvbWVkYV9jb2VmZnNfcHV0KGNvbG9yX3N0LT5mZ2FtbWEpOwo+ICt9Cj4gKwo+ICtp
bnQga29tZWRhX2NvbG9yX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfY29sb3JfbWFuYWdlciAqbWdy
LAo+ICsJCQkgIHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKnN0LAo+ICsJCQkgIHN0cnVjdCBk
cm1fcHJvcGVydHlfYmxvYiAqaWdhbW1hX2Jsb2IsCj4gKwkJCSAgc3RydWN0IGRybV9wcm9wZXJ0
eV9ibG9iICpmZ2FtbWFfYmxvYikKPiArewo+ICsJdTMyIGNvZWZmc1tLT01FREFfTl9HQU1NQV9D
T0VGRlNdOwo+ICsKPiArCWtvbWVkYV9jb2xvcl9jbGVhbnVwX3N0YXRlKHN0KTsKPiArCj4gKwlp
ZiAoaWdhbW1hX2Jsb2IpIHsKPiArCQlkcm1fbHV0X3RvX2lnYW1tYV9jb2VmZnMoaWdhbW1hX2Js
b2IsIGNvZWZmcyk7Cj4gKwkJc3QtPmlnYW1tYSA9IGtvbWVkYV9jb2VmZnNfcmVxdWVzdChtZ3It
PmlnYW1tYV9tZ3IsIGNvZWZmcyk7Cj4gKwkJaWYgKCFzdC0+aWdhbW1hKSB7Cj4gKwkJCURSTV9E
RUJVR19BVE9NSUMoInJlcXVlc3QgaWdhbW1hIHRhYmxlIGZhaWxlZC5cbiIpOwo+ICsJCQlyZXR1
cm4gLUVCVVNZOwo+ICsJCX0KPiArCX0KPiArCj4gKwlpZiAoZmdhbW1hX2Jsb2IpIHsKPiArCQlk
cm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoZmdhbW1hX2Jsb2IsIGNvZWZmcyk7Cj4gKwkJc3QtPmZn
YW1tYSA9IGtvbWVkYV9jb2VmZnNfcmVxdWVzdChtZ3ItPmZnYW1tYV9tZ3IsIGNvZWZmcyk7Cj4g
KwkJaWYgKCFzdC0+ZmdhbW1hKSB7Cj4gKwkJCURSTV9ERUJVR19BVE9NSUMoInJlcXVlc3QgZmdh
bW1hIHRhYmxlIGZhaWxlZC5cbiIpOwo+ICsJCQlyZXR1cm4gLUVCVVNZOwo+ICsJCX0KPiArCX0K
PiArCj4gKwlyZXR1cm4gMDsKPiArfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBpbmRleCBhMmRmMjE4ZjU4ZTcu
LjQxYTk2YjNiNTQwZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBAQCAtNCwxNCArNCw0MiBAQAo+ICAg
KiBBdXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gICAq
Cj4gICAqLwo+IC0KPiAgI2lmbmRlZiBfS09NRURBX0NPTE9SX01HTVRfSF8KPiAgI2RlZmluZSBf
S09NRURBX0NPTE9SX01HTVRfSF8KPiAgCj4gICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9yX21nbXQu
aD4KPiArI2luY2x1ZGUgImtvbWVkYV9jb2VmZnMuaCIKPiAgCj4gICNkZWZpbmUgS09NRURBX05f
WVVWMlJHQl9DT0VGRlMJCTEyCj4gKyNkZWZpbmUgS09NRURBX05fUkdCMllVVl9DT0VGRlMJCTEy
Cj4gKyNkZWZpbmUgS09NRURBX0NPTE9SX1BSRUNJU0lPTgkJMTIKPiArI2RlZmluZSBLT01FREFf
Tl9HQU1NQV9DT0VGRlMJCTY1Cj4gKyNkZWZpbmUgS09NRURBX0NPTE9SX0xVVF9TSVpFCQlCSVQo
S09NRURBX0NPTE9SX1BSRUNJU0lPTikKSSBkb24ndCBzZWUgaG93IHRoZSBudW1iZXIgb2YgTFVU
IGVudHJpZXMgaGFzIGFueXRoaW5nIHRvIGRvIHdpdGggdGhlCmJpdC1wcmVjaXNpb24gb2YgZWFj
aCBlbnRyeS4KPiArI2RlZmluZSBLT01FREFfTl9DVE1fQ09FRkZTCQk5Cj4gKwo+ICtzdHJ1Y3Qg
a29tZWRhX2NvbG9yX21hbmFnZXIgewo+ICsJc3RydWN0IGtvbWVkYV9jb2VmZnNfbWFuYWdlciAq
aWdhbW1hX21ncjsKPiArCXN0cnVjdCBrb21lZGFfY29lZmZzX21hbmFnZXIgKmZnYW1tYV9tZ3I7
Cj4gKwlib29sIGhhc19jdG07Cj4gK307Cj4gKwo+ICtzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRl
IHsKPiArCXN0cnVjdCBrb21lZGFfY29lZmZzX3RhYmxlICppZ2FtbWE7Cj4gKwlzdHJ1Y3Qga29t
ZWRhX2NvZWZmc190YWJsZSAqZmdhbW1hOwo+ICt9Owo+ICsKPiArdm9pZCBrb21lZGFfY29sb3Jf
ZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKm5ldywKPiArCQkJCSAg
c3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqb2xkKTsKPiArdm9pZCBrb21lZGFfY29sb3JfY2xl
YW51cF9zdGF0ZShzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpjb2xvcl9zdCk7Cj4gK2ludCBr
b21lZGFfY29sb3JfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9tYW5hZ2VyICptZ3IsCj4g
KwkJCSAgc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqc3QsCj4gKwkJCSAgc3RydWN0IGRybV9w
cm9wZXJ0eV9ibG9iICppZ2FtbWFfYmxvYiwKPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Js
b2IgKmZnYW1tYV9ibG9iKTsKPiArCj4gK3ZvaWQgZHJtX2x1dF90b19pZ2FtbWFfY29lZmZzKHN0
cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKTsKPiArdm9pZCBk
cm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxv
YiwgdTMyICpjb2VmZnMpOwo+ICt2b2lkIGRybV9jdG1fdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJv
cGVydHlfYmxvYiAqY3RtX2Jsb2IsIHUzMiAqY29lZmZzKTsKPiAgCj4gIGNvbnN0IHMzMiAqa29t
ZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9y
YW5nZSk7Cj4gIAo+IC0jZW5kaWYKPiArI2VuZGlmIC8qX0tPTUVEQV9DT0xPUl9NR01UX0hfKi8K
PiAKCkJSLApNaWhhaWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
