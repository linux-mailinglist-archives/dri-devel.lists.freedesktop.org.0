Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B059B127
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 15:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3156ECA3;
	Fri, 23 Aug 2019 13:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523886ECA3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 13:44:03 +0000 (UTC)
Received: from DB6PR0801CA0054.eurprd08.prod.outlook.com (2603:10a6:4:2b::22)
 by AM5PR0801MB1843.eurprd08.prod.outlook.com (2603:10a6:203:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.19; Fri, 23 Aug
 2019 13:44:00 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by DB6PR0801CA0054.outlook.office365.com
 (2603:10a6:4:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via Frontend
 Transport; Fri, 23 Aug 2019 13:44:00 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.13 via Frontend Transport; Fri, 23 Aug 2019 13:43:58 +0000
Received: ("Tessian outbound 8b8b6ad907d7:v27");
 Fri, 23 Aug 2019 13:43:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41f84fbdbd92ee24
X-CR-MTA-TID: 64aa7808
Received: from 18a976e32348.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 19EE2CAC-A7CB-40BF-96E2-69C40DFAB334.1; 
 Fri, 23 Aug 2019 13:43:50 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18a976e32348.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Aug 2019 13:43:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvgkVkTwnafWbGMsLwICFMJVaFslwijPknossceLOQxOhPPuav1tzYmhzjpqqdgot6pXo0m8VaXv40bmR3ylAKvjflljU/7nIzzfpmoBOs+5fUnWNg1vbGeNBdiimRedgX/UtGcFGPlMLumQLqRyqpsjvhkYVoSXA/dDsYkDiBSipqyCxT6mxsubPWa7xJm7/zH9qJ2mSZ0zL8fY926fxpOLwv8WRSua9Jf0X8IZCnivWJ8XXFecYRJUKLS2O76OstIVYFe9kn+hJk6GLjB6l/kE36aD7kwQPOCFlcuM3s9PxNCKdUg8isE9OinHq/ztrnPq71Wip5WhyAq8z+EHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNtI5wqrTyggMyjM01vDUYvNWAaEVU9KwHvb0PD2H7M=;
 b=ahNUb1I3+0R0mcTuMVLqVVxkge0pm0FjvWDCk+eX+W4Or+9wsl3gjGCxpqET1shCBiA6yXcsdjkAWDSFi2zZI/uvgH7LD9adge18/o1OTSj/X/SrP1+iR0g6y6HozsfAQw5Bu9e6gQrlu1yLpSkcWrTzyj2L7GAw9dpni9FeYGiImz1zwVnGAZkuFx7FLmX8qAFUH4zDptsGnX5PverhyDCVxUj+Sffg29u0885TIR5r2IZcQOKJnfNFOggj6SafFMPutdOCzV98rvFlPXXg+wUeB7oQgNa8C1IOtI1g244gqcOGFgX+IJz+RicMxD+ClMstac1EJcnwLMzgDsTtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5462.eurprd08.prod.outlook.com (10.141.174.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 13:43:50 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::842f:3fe:54f9:b18a]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::842f:3fe:54f9:b18a%2]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 13:43:50 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Add missing of_node_get() call
Thread-Topic: [PATCH] drm/komeda: Add missing of_node_get() call
Thread-Index: AQHVV2pPVPebZtWZiUahUiy3IZo+PqcIwsGA
Date: Fri, 23 Aug 2019 13:43:49 +0000
Message-ID: <20190823134348.GA27922@arm.com>
References: <20190820151357.22324-1-mihail.atanassov@arm.com>
In-Reply-To: <20190820151357.22324-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.54]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9d649860-1034-4926-c227-08d727cff349
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM7PR08MB5462; 
X-MS-TrafficTypeDiagnostic: AM7PR08MB5462:|AM5PR0801MB1843:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1843BDD9E433E1F30FC59A90E4A40@AM5PR0801MB1843.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:42;OLM:42;
x-forefront-prvs: 0138CD935C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(199004)(189003)(11346002)(966005)(6306002)(71200400001)(71190400001)(6512007)(6486002)(478600001)(99286004)(81156014)(81166006)(14454004)(66066001)(305945005)(8936002)(7736002)(52116002)(76176011)(229853002)(6246003)(26005)(4326008)(3846002)(5660300002)(2906002)(33656002)(66946007)(36756003)(66446008)(64756008)(66556008)(66476007)(53936002)(386003)(25786009)(6506007)(54906003)(1076003)(6862004)(316002)(102836004)(186003)(6436002)(2616005)(44832011)(476003)(8676002)(486006)(86362001)(6636002)(14444005)(256004)(6116002)(446003)(37006003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5462;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: k5x1IQl9a1wBNKRLJ1QpamjGK46y3UG7ACCArDnVUen05Gl8caeL1hABPl8jIW7AoyhQiyCf5UX57pHxYJHcNmtWVq7YZsmeK2gdiRqFYXdWJYSUlapugOrhzL6I/PG3zBR9h1y1xmRAtIYbjslNU/pUJz4bf4D8732AiJi7iOqOu5eVNBrSfLz6d6/PL3l7qz8uqWR6FJmJj4CpDUeLK0ikgQ5N93/vr5jSoOlexJU/yD8LVUaUr+9hY1m/ZCMZoGgCBq5oZW0Zi/x6u6lR5X2y+LIuqfQTcaPB6+sFlahDZyv4QzPeujNiSOaSIz2aoY4RGWtN0GvKfq9FPLfwELmN6yY7O7ssF1wr1if7SLagbHJyUf7qnlR7CWQiKLQEeKsUXm4dJzKGwVK4zOQQQ8dYzx7bHS9sF6e3xA7rmIg=
Content-ID: <8CCBA03F563D0E4E85AC075BD916E953@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5462
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(189003)(199004)(14454004)(186003)(6116002)(2616005)(476003)(126002)(26005)(102836004)(8676002)(46406003)(81156014)(50466002)(54906003)(81166006)(76176011)(6506007)(386003)(2906002)(26826003)(6512007)(3846002)(25786009)(63370400001)(446003)(63350400001)(336012)(23726003)(478600001)(11346002)(966005)(6862004)(97756001)(99286004)(486006)(5660300002)(36906005)(6246003)(70206006)(70586007)(305945005)(66066001)(47776003)(7736002)(36756003)(6486002)(37006003)(1076003)(8936002)(8746002)(4326008)(76130400001)(86362001)(14444005)(6306002)(33656002)(316002)(229853002)(22756006)(6636002)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1843;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4ca3d629-bcfc-489e-92c7-08d727cfedcb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1843; 
NoDisclaimer: True
X-Forefront-PRVS: 0138CD935C
X-Microsoft-Antispam-Message-Info: XazkZK4l94lhGIBDavu2BSx5P1P/HWY5cnv0T15CCRfCY8HC4F+6XSjppG/qCTdaddMC/iuEZAHpyq209gbP09O78oNKgp/VG++5bkXrKh4ccJ0ZoYHujVhhdo5/Udkbrw7FHiGEK6Vi0Py4/nh53XgPBsH58ncJjmvcHj6pQgpThsMYyFdG3lwV9tzBxSlawX4vACxKicjZt9oKuQl26anOInD/6TajM5U2idufPYa3Jd83MG2SB+Qn1zlDmJ8kwTl2XyEQ/1ELV5Q+/aZDB5Bu0VPmO8O7aqNew4kBfO1eoN1KCUBo1haf48F0IddA0siE+R763lMpkfu+ktKnnWp6aJggct/kkqzvAZBEiTomxVmqfbmQJxX1tOcAZQq1FiAyChyysu04Bcb7kRat01BLT6lwZTw38Sz8C9etgMU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2019 13:43:58.8664 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d649860-1034-4926-c227-08d727cff349
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1843
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNtI5wqrTyggMyjM01vDUYvNWAaEVU9KwHvb0PD2H7M=;
 b=UNPT2yFQXh7Xsi88d/w/zokyg422VPkIpl/G0+bZTrpOKNE/4Ft9TtMvx/0M0KRQD6UtL8ktvAYzA1eZ5UjrzinZqdllozXulOlotVR2/L0KoP7xEU+S7HOln7ZHP6+F6HztJcMqCIc3sjhuesOiS+8vmrxbHzxlu6UT6IWJn9A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNtI5wqrTyggMyjM01vDUYvNWAaEVU9KwHvb0PD2H7M=;
 b=UNPT2yFQXh7Xsi88d/w/zokyg422VPkIpl/G0+bZTrpOKNE/4Ft9TtMvx/0M0KRQD6UtL8ktvAYzA1eZ5UjrzinZqdllozXulOlotVR2/L0KoP7xEU+S7HOln7ZHP6+F6HztJcMqCIc3sjhuesOiS+8vmrxbHzxlu6UT6IWJn9A=
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "james
 qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDM6MTY6NThQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBrb21lZGFfcGlwZWxpbmVfZGVzdHJveSBoYXMgdGhlIG1hdGNoaW5nIG9mX25v
ZGVfcHV0KCkuCj4gCj4gRml4ZXM6IDI5ZTU2YWVjOTExZGQgKCJkcm0va29tZWRhOiBBZGQgRFQg
cGFyc2luZyIpCj4gU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5h
c3NvdkBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmMKPiBpbmRleCAwMTQyZWU5OTE5NTcuLmNhNjRhMTI5YzU5NCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4g
QEAgLTEzMCw3ICsxMzAsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9waXBlX2R0KHN0cnVj
dCBrb21lZGFfZGV2ICptZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ICAJCW9mX2dyYXBo
X2dldF9wb3J0X2J5X2lkKG5wLCBLT01FREFfT0ZfUE9SVF9PVVRQVVQpOwo+ICAKPiAgCXBpcGUt
PmR1YWxfbGluayA9IHBpcGUtPm9mX291dHB1dF9saW5rc1swXSAmJiBwaXBlLT5vZl9vdXRwdXRf
bGlua3NbMV07Cj4gLQlwaXBlLT5vZl9ub2RlID0gbnA7Cj4gKwlwaXBlLT5vZl9ub2RlID0gb2Zf
bm9kZV9nZXQobnApOwo+ICAKCkdvb2QgY2F0Y2guClJldmlld2VkLWJ5OiBBeWFuIEt1bWFyIEhh
bGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiAgCXJldHVybiAwOwo+ICB9Cj4gLS0gCj4gMi4y
Mi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
