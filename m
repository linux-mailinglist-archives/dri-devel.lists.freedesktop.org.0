Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EBD3D4F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 12:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA906EC09;
	Fri, 11 Oct 2019 10:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10075.outbound.protection.outlook.com [40.107.1.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6496EC09
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 10:27:31 +0000 (UTC)
Received: from VI1PR0801CA0081.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::25) by AM4PR08MB2804.eurprd08.prod.outlook.com
 (2603:10a6:205:d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Fri, 11 Oct
 2019 10:27:26 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR0801CA0081.outlook.office365.com
 (2603:10a6:800:7d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 10:27:26 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 10:27:24 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Fri, 11 Oct 2019 10:27:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 952d77da221d4a59
X-CR-MTA-TID: 64aa7808
Received: from 2de4edb3fe02.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3F7BC72-3023-4573-8C60-0964E706F96D.1; 
 Fri, 11 Oct 2019 10:27:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2de4edb3fe02.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Oct 2019 10:27:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBuyrxfDx1xOP+TYTHbGib7zeXKYHyUa5ZTAedeaReTQ858we9MCI5MvCz0aMpVY6hBKC/CWxRueomZt0rBBr/2lwLo2OF8vmC2JkPlQUyxvjsmCwMNvh8AAtNYjf2jhkR7jEY72D9KeyNBK2pix+u3/Cf4ThmvVkk8KjG5dIgiZ68BP4q/0thsC8EIb52dDSswP9oJ9zwai2Rc1KCjLC6+vsrdgeGOLA4BSjv9llHiNygeNl5Bdt0BhXTjYWGS2zTFR4jgsrap4XsRLu8JJIWrl77Mwj3jBvcs590KMF20/lQBdP8/KScejkWO6a/tYdlxYZqnMfFl6lwiVCIMBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRH/Vo7PHh+Mj/xV0P+N1GoX5oDFaK1F4F1qNakJvjc=;
 b=fVxRZoCQd2XjxvrKGru5usLKBTWu+4LpI1Xs75crsro0H7pcz2TRXRVbBAojLSbAC92nErNO/Cw9gmwW03udaVkq03xU4e68KNCZvOVIo9IhgnRJAz6OjEKwgTx0pFzeoUUDgMYralm5jkfCiGA3MinFLJkcD2GB/If40PANBUeEvyYmB7//UAGdtjzgisviF6cD0HfmNjUK3i5N/u2HjBJXayvrLPWoP9ebGQFktOSKdRnutXWnQ/ilWw8LZrKKXwa40xgkvzP4qO6uVsC2O7U9gq61eFXs5zYQv53WraO7npyb27dGLfjUDk+Lwqn+4npcjDgeF8kmYHreHdV9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4381.eurprd08.prod.outlook.com (20.179.28.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 10:27:06 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 10:27:06 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform support
 for DOU-IPS
Thread-Topic: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform
 support for DOU-IPS
Thread-Index: AQHVf/cp1ECrFKcx7E6lw4dO6fyhYKdVM6+AgAAFQ4CAAAPyAA==
Date: Fri, 11 Oct 2019 10:27:06 +0000
Message-ID: <2088952.DRTgVpPakT@e123338-lin>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <8416585.jh9292Gg6g@e123338-lin>
 <20191011101244.GA13428@lowli01-ThinkStation-P300>
In-Reply-To: <20191011101244.GA13428@lowli01-ThinkStation-P300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::20) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c8eff2bc-298e-42d8-f22c-08d74e359bb3
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4381:|VI1PR08MB4381:|AM4PR08MB2804:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR08MB28040026FB610B8647969EA88F970@AM4PR08MB2804.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(396003)(136003)(346002)(39860400002)(366004)(189003)(199004)(25786009)(76176011)(229853002)(6486002)(9686003)(8936002)(6512007)(99286004)(8676002)(54906003)(81166006)(6636002)(6116002)(3846002)(81156014)(446003)(11346002)(476003)(52116002)(486006)(6436002)(33716001)(102836004)(71200400001)(186003)(7736002)(26005)(6506007)(386003)(2906002)(4326008)(6246003)(66066001)(71190400001)(256004)(316002)(14454004)(5660300002)(14444005)(6862004)(66476007)(66446008)(86362001)(66946007)(478600001)(66556008)(305945005)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4381;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7xeH9raUzYrykU2cgAKXuolDB1g9H+wwbbmGpyyJKzJTC5h3bTOhD+Y+fWPyp4vy9DzCErsvUhsOx7Ct7n7e8g7RUllQArTGV8XBvVcvxNgDg+dX6n9JJq1dR22IBs/a0FHShwHZ/dnDrjnf0bWIGM24/Wr51TNnYjwQcH8+tjfBMm2XdrrAF8doNRBqQudTOOxPCBEItC4ZsnI/uN5GFFg7zQJ/mflBDoA8LSSpbpjeDG7jYSoN2j40Zv6E/fPPSIyHArKJ3rLYnDgGRBbhV0cSXxNztdinD0WvI12s1nwfVprtEoBZ1MGO/47FW+HhHEvISC6VbtmG5/ELYyt8zljBB06KAXiVT4xYdq2ny4ipK7cDRUN8nOcm9p8cvkO54m+C2HfQuI4GzCNb2Apg2kRlbJRf9aUs6pjOOUkin4o=
Content-ID: <689BC901C64D9345B9BF7D5EBDE95279@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4381
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(136003)(39860400002)(346002)(189003)(199004)(26826003)(356004)(70586007)(8676002)(305945005)(186003)(7736002)(76130400001)(76176011)(14444005)(26005)(316002)(478600001)(6862004)(386003)(46406003)(97756001)(66066001)(47776003)(54906003)(86362001)(4326008)(5660300002)(6506007)(6116002)(6512007)(9686003)(446003)(99286004)(23726003)(14454004)(486006)(81156014)(6486002)(63350400001)(3846002)(126002)(25786009)(6246003)(70206006)(102836004)(33716001)(36906005)(22756006)(2906002)(50466002)(229853002)(336012)(8936002)(8746002)(11346002)(476003)(6636002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB2804;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e3ef8dc9-a32f-4d5e-e7c9-08d74e359087
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FE3xGDkRTSz6bBgOTO52FCE4K3CxoGAPMDkldhHGIRumlhG3HsvDTCIvo6DXHO2VYM7gOnC03NfiuAim/P3Mt9Yi+KMKO77SVJDVcTYOydXRehQNM87Sit5TZsEIW1i8MbO0G8PIqrxCVZgQb+92lwf3OdduQPycyFV7STC/YPwHSuxkg9ZEolEdgbKiFTIrsPWCKEb5z/FohGeTurFUURKlDtHr08iWpyWbGg0X2YLImsI+WTo/hOZ0Q41Gapysl/9WPbc2Mg6Csk7pBlkOPhIoEG9zgKbKZRJO9ROx3NRbtetrqv74xwyH/Ec25Tb1J+L5gpilsCfXvI9YZ/tqr8PgGK67F+a0ksEUrSMyx+xJkjCwXrJRXTtmG5Rqp4kE5BEtVcgYofcrK4Xcdw28v+4dbL+y0OPZPA9DIGl6+Zo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 10:27:24.8158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8eff2bc-298e-42d8-f22c-08d74e359bb3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2804
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRH/Vo7PHh+Mj/xV0P+N1GoX5oDFaK1F4F1qNakJvjc=;
 b=Y9BTc5gn4jYu5D3B3GVHHNjUDWpCL8jrT9a2+V+KkXbpn4ctMuQ8P2Q82udEzqzRjSbQLWWPKACAEbQENdC/PO8lqcRcS88szomDSmER4K3UeH4KOe+ZGaV+4fcznhQyIDO2EhrfZwmGz4tZJ3ATYnSrSZv3JrXyYN+WwE39KUo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRH/Vo7PHh+Mj/xV0P+N1GoX5oDFaK1F4F1qNakJvjc=;
 b=Y9BTc5gn4jYu5D3B3GVHHNjUDWpCL8jrT9a2+V+KkXbpn4ctMuQ8P2Q82udEzqzRjSbQLWWPKACAEbQENdC/PO8lqcRcS88szomDSmER4K3UeH4KOe+ZGaV+4fcznhQyIDO2EhrfZwmGz4tZJ3ATYnSrSZv3JrXyYN+WwE39KUo=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "Jonathan Chai \(Arm Technology
 China\)" <Jonathan.Chai@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCAxMSBPY3RvYmVyIDIwMTkgMTE6MTI6NTEgQlNUIExvd3J5IExpIChBcm0gVGVj
aG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gSGkgTWloYWlsLAo+IE9uIEZyaSwgT2N0IDExLCAyMDE5
IGF0IDA4OjU0OjAzQU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiBIaSBKYW1l
cywgTG93cnksCj4gPiAKPiA+IE9uIEZyaWRheSwgMTEgT2N0b2JlciAyMDE5IDA2OjQ1OjUwIEJT
VCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+ID4gRnJv
bTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29tPgo+
ID4gPiAKPiA+ID4gQWRkcyBnYW1tYSBhbmQgY29sb3ItdHJhbnNmb3JtIHN1cHBvcnQgZm9yIERP
VS1JUFMuCj4gPiA+IEFkZHMgdHdvIGNhcHMgbWVtYmVycyBmZ2FtbWFfY29lZmZzIGFuZCBjdG1f
Y29lZmZzIHRvIGtvbWVkYV9pbXByb2Nfc3RhdGUuCj4gPiA+IElmIGNvbG9yIG1hbmFnZW1lbnQg
Y2hhbmdlZCwgc2V0IGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHkuCj4gPiA+
IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxs
b3dyeS5saUBhcm0uY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9hcm0vZGlzcGxheS9rb21lZGEv
ZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8ICAyICsrCj4gPiA+
ICAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMyArKysK
PiA+ID4gIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyAgICB8ICA2
ICsrKysrCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPiA+ID4gCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfY29tcG9uZW50LmMKPiA+ID4gaW5kZXggYzNkMjljMGIwNTFiLi5lN2U1YThlNDQzMGUgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiA+ID4gQEAgLTk0MiwxNSArOTQyLDM5IEBAIHN0YXRp
YyBpbnQgZDcxX21lcmdlcl9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCj4gPiA+ICBzdGF0aWMg
dm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiA+ID4g
IAkJCSAgICAgIHN0cnVjdCBrb21lZGFfY29tcG9uZW50X3N0YXRlICpzdGF0ZSkKPiA+ID4gIHsK
PiA+ID4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSBzdGF0ZS0+Y3J0Yy0+c3Rh
dGU7Cj4gPiBJJ20gbm90IHN1cmUgaXQncyBhIGdvb2QgaWRlYSB0byBpbnRyb2R1Y2UgYSBkZXBl
bmRlbmN5IG9uIGRybSBzdGF0ZQo+ID4gc28gZmFyIGRvd24gaW4gdGhlIEhXIGZ1bmNzLCBpcyB0
aGVyZSBhIGdvb2QgcmVhc29uIGZvciB0aGUgZGlyZWN0IHByb2Q/Cj4gV2UgZGljdXNzZWQgYWJv
dXQgdGhpcyBiZWZvcmUuIFRvIGRlY2lkZSB1c2luZyB0aGlzIHdheSBpcyB0byBhdm9pZCBvZgo+
IGR1cGxpY2F0ZWQgc3RhdGUgYmV0d2VlbiBEUk0gYW5kIEtvbWVkYS4KRmFpciwgci1iIG1lLgoK
PiAKPiBSZWdhcmRzLAo+IExvd3J5Cj4gPiA+ICAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUg
KnN0ID0gdG9faW1wcm9jX3N0KHN0YXRlKTsKPiA+ID4gKwlzdHJ1Y3QgZDcxX3BpcGVsaW5lICpw
aXBlID0gdG9fZDcxX3BpcGVsaW5lKGMtPnBpcGVsaW5lKTsKPiA+ID4gIAl1MzIgX19pb21lbSAq
cmVnID0gYy0+cmVnOwo+ID4gPiAgCXUzMiBpbmRleDsKPiA+ID4gKwl1MzIgbWFzayA9IDAsIGN0
cmwgPSAwOwo+ID4gPiAgCj4gPiA+ICAJZm9yX2VhY2hfY2hhbmdlZF9pbnB1dChzdGF0ZSwgaW5k
ZXgpCj4gPiA+ICAJCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lEMCArIGluZGV4ICog
NCwKPiA+ID4gIAkJCSAgICAgICB0b19kNzFfaW5wdXRfaWQoc3RhdGUsIGluZGV4KSk7Cj4gPiA+
ICAKPiA+ID4gIAltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6
ZSwgc3QtPnZzaXplKSk7Cj4gPiA+ICsKPiA+ID4gKwlpZiAoY3J0Y19zdC0+Y29sb3JfbWdtdF9j
aGFuZ2VkKSB7Cj4gPiA+ICsJCW1hc2sgfD0gSVBTX0NUUkxfRlQgfCBJUFNfQ1RSTF9SR0I7Cj4g
PiA+ICsKPiA+ID4gKwkJaWYgKGNydGNfc3QtPmdhbW1hX2x1dCkgewo+ID4gPiArCQkJbWFsaWRw
X3dyaXRlX2dyb3VwKHBpcGUtPmRvdV9mdF9jb2VmZl9hZGRyLCBGVF9DT0VGRjAsCj4gPiA+ICsJ
CQkJCSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZGUywKPiA+ID4gKwkJCQkJICAgc3QtPmZnYW1tYV9j
b2VmZnMpOwo+ID4gPiArCQkJY3RybCB8PSBJUFNfQ1RSTF9GVDsgLyogZW5hYmxlIGdhbW1hICov
Cj4gPiA+ICsJCX0KPiA+ID4gKwo+ID4gPiArCQlpZiAoY3J0Y19zdC0+Y3RtKSB7Cj4gPiA+ICsJ
CQltYWxpZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9DT0VGRjAsCj4gPiA+ICsJCQkJ
CSAgIEtPTUVEQV9OX0NUTV9DT0VGRlMsCj4gPiA+ICsJCQkJCSAgIHN0LT5jdG1fY29lZmZzKTsK
PiA+ID4gKwkJCWN0cmwgfD0gSVBTX0NUUkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KPiA+ID4g
KwkJfQo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCWlmIChtYXNrKQo+ID4gPiArCQltYWxpZHBf
d3JpdGUzMl9tYXNrKHJlZywgQkxLX0NPTlRST0wsIG1hc2ssIGN0cmwpOwo+ID4gPiAgfQo+ID4g
PiAgCj4gPiA+ICBzdGF0aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9jb21w
b25lbnQgKmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+ID4gaW5kZXggOWJlZWRhMDQ4
MThiLi40MDZiOWQwY2EwNTggMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+ID4gQEAgLTU5MCw2ICs1OTAsOCBA
QCBzdGF0aWMgaW50IGtvbWVkYV9jcnRjX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywK
PiA+ID4gIAo+ID4gPiAgCWNydGMtPnBvcnQgPSBrY3J0Yy0+bWFzdGVyLT5vZl9vdXRwdXRfcG9y
dDsKPiA+ID4gIAo+ID4gPiArCWRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KGNydGMsIDAsIHRy
dWUsIEtPTUVEQV9DT0xPUl9MVVRfU0laRSk7Cj4gPiA+ICsKPiA+ID4gIAlyZXR1cm4gZXJyOwo+
ID4gPiAgfQo+ID4gPiAgCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+ID4gPiBpbmRleCBiMzIyZjUyYmE4ZjIuLmM1
YWI4MDk2Yzg1ZCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gPiA+IEBAIC0xMSw2ICsxMSw3IEBA
Cj4gPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMuaD4KPiA+ID4gICNpbmNsdWRlIDxkcm0v
ZHJtX2F0b21pY19oZWxwZXIuaD4KPiA+ID4gICNpbmNsdWRlICJtYWxpZHBfdXRpbHMuaCIKPiA+
ID4gKyNpbmNsdWRlICJrb21lZGFfY29sb3JfbWdtdC5oIgo+ID4gPiAgCj4gPiA+ICAjZGVmaW5l
IEtPTUVEQV9NQVhfUElQRUxJTkVTCQkyCj4gPiA+ICAjZGVmaW5lIEtPTUVEQV9QSVBFTElORV9N
QVhfTEFZRVJTCTQKPiA+ID4gQEAgLTMyNCw2ICszMjUsOCBAQCBzdHJ1Y3Qga29tZWRhX2ltcHJv
YyB7Cj4gPiA+ICBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7Cj4gPiA+ICAJc3RydWN0IGtv
bWVkYV9jb21wb25lbnRfc3RhdGUgYmFzZTsKPiA+ID4gIAl1MTYgaHNpemUsIHZzaXplOwo+ID4g
PiArCXUzMiBmZ2FtbWFfY29lZmZzW0tPTUVEQV9OX0dBTU1BX0NPRUZGU107Cj4gPiA+ICsJdTMy
IGN0bV9jb2VmZnNbS09NRURBX05fQ1RNX0NPRUZGU107Cj4gPiA+ICB9Owo+ID4gPiAgCj4gPiA+
ICAvKiBkaXNwbGF5IHRpbWluZyBjb250cm9sbGVyICovCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUu
Ywo+ID4gPiBpbmRleCAwYmE5YzZhYTM3MDguLjRhNDBiMzdlYjFhNiAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3Rh
dGUuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9waXBlbGluZV9zdGF0ZS5jCj4gPiA+IEBAIC03NTYsNiArNzU2LDEyIEBAIGtvbWVkYV9pbXBy
b2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9pbXByb2MgKmltcHJvYywKPiA+ID4gIAlzdC0+aHNp
emUgPSBkZmxvdy0+aW5fdzsKPiA+ID4gIAlzdC0+dnNpemUgPSBkZmxvdy0+aW5faDsKPiA+ID4g
IAo+ID4gPiArCWlmIChrY3J0Y19zdC0+YmFzZS5jb2xvcl9tZ210X2NoYW5nZWQpIHsKPiA+ID4g
KwkJZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKGtjcnRjX3N0LT5iYXNlLmdhbW1hX2x1dCwKPiA+
ID4gKwkJCQkJIHN0LT5mZ2FtbWFfY29lZmZzKTsKPiA+ID4gKwkJZHJtX2N0bV90b19jb2VmZnMo
a2NydGNfc3QtPmJhc2UuY3RtLCBzdC0+Y3RtX2NvZWZmcyk7Cj4gPiA+ICsJfQo+ID4gPiArCj4g
PiA+ICAJa29tZWRhX2NvbXBvbmVudF9hZGRfaW5wdXQoJnN0LT5iYXNlLCAmZGZsb3ctPmlucHV0
LCAwKTsKPiA+ID4gIAlrb21lZGFfY29tcG9uZW50X3NldF9vdXRwdXQoJmRmbG93LT5pbnB1dCwg
JmltcHJvYy0+YmFzZSwgMCk7Cj4gPiA+ICAKPiA+ID4gCj4gPiAKPiA+IAo+IAoKCi0tIApNaWhh
aWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
