Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA68D8AB6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFF089DC2;
	Wed, 16 Oct 2019 08:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6DF89D2E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:20:29 +0000 (UTC)
Received: from DB7PR08CA0021.eurprd08.prod.outlook.com (2603:10a6:5:16::34) by
 DB8PR08MB3929.eurprd08.prod.outlook.com (2603:10a6:10:ae::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 08:20:25 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by DB7PR08CA0021.outlook.office365.com
 (2603:10a6:5:16::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.22 via Frontend
 Transport; Wed, 16 Oct 2019 08:20:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 08:20:23 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Wed, 16 Oct 2019 08:20:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffda825c481c9712
X-CR-MTA-TID: 64aa7808
Received: from bcdf780fb782.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAB1415B-9E5E-4034-A0E7-CE757535BA36.1; 
 Wed, 16 Oct 2019 08:20:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcdf780fb782.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 08:20:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxTYlfx1CkjsuDGxZFLzbTE3vs2am9V6eWVK7aua/w7Ylz+DVsbTUZ970Xg7Zb7lkKsl5sCh8/C3a1XvrY0rdIupwU1cMA1SHGYRQ3s1tmY09Wan90gqmsDEecTBhQnd8IdGGjtK+3HFTsiZsQu98nxnr2fmjKn+AHDAsSuGHeBnzUFYtikAdHkaWI4COpCCakq6SG7L6/1zghcD+epXhgYTElGscsfBGe1rVyCYeCuvNfleewrBq/fSfZm2Lj4fueCyInhIPjCGBdFfm/cPI/nsvpci2qMBXjG0eyF6xjvCSSoqFZf/yzv2IYzFakj4n3cyjZTxYXRP8bnD8x5fAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br5D2E+/gkSE/5iZSR9wblRLN0ErYP8RSiT/0pbfLtU=;
 b=SpDGlrdfl0dKkXBaTiRWyiZv82dhjfLnulTaRerGtstXXZlHeb0fr3Bp71s6Kdkf1zV/djY19tzPVRAEC44qovy5NGcqXRLQ3pbaiq0nisnW8i21VaPdyK+mmZiijCDQffqHE9HWmGGFEL1F00NnrgTxT/9lyfjcXJUU+mM9dXQTFe6RrhZdOB4g3gLGCmJQmELzqrgC3Qg7gr1RkeoIPaKlsfkDSzFzpvvGe1C2bkHKfFGrQPaDixu/RlXoGHaG3tRNuiSsjGWnBXgl2z+f4OYnIie47SpYEtA0TQ0UtBWaU3hECwaEFcBaNtswjmhZ9IHaK2opV15bW/Nja0y2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5264.eurprd08.prod.outlook.com (20.179.29.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 16 Oct 2019 08:20:11 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 08:20:11 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: drm/komeda: Adds output-color format support
Thread-Topic: drm/komeda: Adds output-color format support
Thread-Index: AQHVg/qHbAZVfv9eaEWdG+FF14zPEA==
Date: Wed, 16 Oct 2019 08:20:11 +0000
Message-ID: <20191016082002.GA18432@jamwan02-TSP300>
References: <20191015091019.26021-1-lowry.li@arm.com>
In-Reply-To: <20191015091019.26021-1-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:202:17::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ecef6962-477c-460d-35c8-08d75211b11d
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5264:|VE1PR08MB5264:|DB8PR08MB3929:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB3929B8A9560852C4A1D4ECE0B3920@DB8PR08MB3929.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:287;OLM:287;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(189003)(199004)(81166006)(81156014)(7736002)(8676002)(6636002)(305945005)(2906002)(14454004)(229853002)(8936002)(5660300002)(25786009)(6436002)(478600001)(33716001)(99286004)(6246003)(6486002)(54906003)(486006)(33656002)(58126008)(256004)(26005)(71190400001)(186003)(11346002)(476003)(102836004)(1076003)(71200400001)(386003)(6862004)(446003)(9686003)(6512007)(76176011)(6116002)(4326008)(52116002)(66066001)(66946007)(64756008)(55236004)(316002)(86362001)(66476007)(14444005)(3846002)(66446008)(66556008)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5264;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fvsqCSQ2u5R0VwD6ezlwdjyUQnX8zD4CvtJuSI3xN+5wNgfJ92aC5nRq2yGndNUVgyU6pn84wVrM7WyZh3ekssWwnaPXxCei0cENfd8K5IA+9zEZHQIey1BnudXTAXZW9KkUj7dByhSRCB9ScbW1ujBhWk9+rtXm0rDRN+pogLz9kEp+lTn9pWR/uktbjHiXeuxrJqCkQ/eluMkAvNxOrws/puP4Tij+RCLDKXu6DWn5B4V3KcT/mp/DwPEjZ+QQQT7RBPZveExNu2/PVBZhnV4vDQ5cqvkRuQXynpdQcwgCsyeefGAUweFcUgZMnxTUkmSvCMS3CSfo71hRfLRsDddFT3xdM/ww54l9rBNqApB+kDzA4xFTxSpFspvHKvnLFDPKVP/CBnXUd4PLS8DZFlYoPmw51ei1sF+TlpbMNmc=
Content-ID: <45F1B9E780CB384F9EC2F209C7F0258A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5264
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(396003)(346002)(376002)(136003)(199004)(189003)(86362001)(97756001)(4326008)(3846002)(23726003)(6862004)(8936002)(8746002)(6116002)(33716001)(11346002)(2906002)(6486002)(229853002)(36906005)(33656002)(316002)(63350400001)(58126008)(25786009)(446003)(6246003)(336012)(54906003)(6636002)(99286004)(14454004)(46406003)(76130400001)(50466002)(70586007)(478600001)(305945005)(66066001)(14444005)(7736002)(22756006)(126002)(81156014)(102836004)(476003)(5660300002)(47776003)(9686003)(26826003)(486006)(356004)(8676002)(6512007)(76176011)(26005)(386003)(81166006)(1076003)(6506007)(186003)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB3929;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a004c38d-7d07-4ba8-1a45-08d75211a9bc
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kvZ2qsNUbe3sm2eDOyx8jXuypdIzpPxkEd0YxvlyVQpMKTYkIJSKBSQVeQMVncEAx7pj4DP8nSj46lpjShFkDIVoelAxRvQ/NrTNSDNq5Am7AaM6V5no0t+S+s4THGtr/ONSpTo1JKNqZcLfXkgXZZNCWjPk45RsPNBx6vLimjOZ8efKsO9fa9Hy3NxkJiMH+fOoeBdcoo3PaiioJ4OFvqC5pIDRBahrYA0gZuSOtQUd3pNDcMqqZN5aHbQRH6iwX8rIyHZa9MazHdlZ2pk9kqn9uWFTLyEMaZaUPbimZWvVgo4hGvEtkcK1AppqXpC0nnX1mTsL4QgU12XObKsVj67qkud0zKaHGK41pUkPqkopAiz1cs0BgxJl+NMRKLSiASRVQIN22dBMck4WtP3w4+QconAb6IrhouC4QJtGKH0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 08:20:23.4566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecef6962-477c-460d-35c8-08d75211b11d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br5D2E+/gkSE/5iZSR9wblRLN0ErYP8RSiT/0pbfLtU=;
 b=HcWKKX3Qyqhv+XMSNbXMErAlAdMdqqXy1jgMGqM4LqTguHnRc8xQI9r9ye+S/KGcT4iPcVUDiLvmxUl/Nf/QFkp2LeTiSBfOJ8wZm69MPlDWuMqMhd3ueZX70URLupz+YIJ7LG3jx128MRDf/QwwlRFFVP0spyP9VW1woFkZY/4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br5D2E+/gkSE/5iZSR9wblRLN0ErYP8RSiT/0pbfLtU=;
 b=HcWKKX3Qyqhv+XMSNbXMErAlAdMdqqXy1jgMGqM4LqTguHnRc8xQI9r9ye+S/KGcT4iPcVUDiLvmxUl/Nf/QFkp2LeTiSBfOJ8wZm69MPlDWuMqMhd3ueZX70URLupz+YIJ7LG3jx128MRDf/QwwlRFFVP0spyP9VW1woFkZY/4=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDk6MTA6MzZBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBTZXRzIG91dHB1dCBjb2xvciBmb3JtYXQgYWNjb3Jk
aW5nIHRvIHRoZSBjb25uZWN0b3IgZm9ybWF0cyBhbmQKPiBkaXNwbGF5IHN1cHBvcnRlZCBmb3Jt
YXRzLiBEZWZhdWx0IHZhbHVlIGlzIFJHQjQ0NCBhbmQgb25seSBmb3JjZQo+IFlVViBmb3JtYXQg
d2hpY2ggbXVzdCBiZSBZVVYuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgLi4uL2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgfCAxNCArKysrKysrKysrKysrLQo+ICAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAgICB8ICA5ICsrKysr
KysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCB8
ICAyICstCj4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICAg
IHwgIDIgKy0KPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUu
YyAgfCAxNyArKysrKysrKysrKysrKy0tLQo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV93Yl9jb25uZWN0b3IuYyAgICB8ICAxICsKPiAgNiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiBpbmRleCAyN2NkYjAzNTcz
YzEuLjdiMzc0YTNiOTExZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiBAQCAtOTQ0LDcgKzk0NCw3IEBA
IHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRlKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpj
LAo+ICB7Cj4gIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0b19pbXByb2Nfc3Qo
c3RhdGUpOwo+ICAJdTMyIF9faW9tZW0gKnJlZyA9IGMtPnJlZzsKPiAtCXUzMiBpbmRleDsKPiAr
CXUzMiBpbmRleCwgbWFzayA9IDAsIGN0cmwgPSAwOwo+ICAKPiAgCWZvcl9lYWNoX2NoYW5nZWRf
aW5wdXQoc3RhdGUsIGluZGV4KQo+ICAJCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lE
MCArIGluZGV4ICogNCwKPiBAQCAtOTUyLDYgKzk1MiwxOCBAQCBzdGF0aWMgdm9pZCBkNzFfaW1w
cm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiAgCj4gIAltYWxpZHBfd3Jp
dGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7Cj4gIAlt
YWxpZHBfd3JpdGUzMihyZWcsIElQU19ERVBUSCwgc3QtPmNvbG9yX2RlcHRoKTsKPiArCj4gKwlt
YXNrIHw9IElQU19DVFJMX1lVViB8IElQU19DVFJMX0NIRDQyMiB8IElQU19DVFJMX0NIRDQyMDsK
PiArCj4gKwkvKiBjb25maWcgY29sb3IgZm9ybWF0ICovCj4gKwlpZiAoc3QtPmNvbG9yX2Zvcm1h
dCA9PSBEUk1fQ09MT1JfRk9STUFUX1lDUkNCNDIwKQo+ICsJCWN0cmwgfD0gSVBTX0NUUkxfWVVW
IHwgSVBTX0NUUkxfQ0hENDIyIHwgSVBTX0NUUkxfQ0hENDIwOwo+ICsJZWxzZSBpZiAoc3QtPmNv
bG9yX2Zvcm1hdCA9PSBEUk1fQ09MT1JfRk9STUFUX1lDUkNCNDIyKQo+ICsJCWN0cmwgfD0gSVBT
X0NUUkxfWVVWIHwgSVBTX0NUUkxfQ0hENDIyOwo+ICsJZWxzZSBpZiAoc3QtPmNvbG9yX2Zvcm1h
dCA9PSBEUk1fQ09MT1JfRk9STUFUX1lDUkNCNDQ0KQo+ICsJCWN0cmwgfD0gSVBTX0NUUkxfWVVW
Owo+ICsKPiArCW1hbGlkcF93cml0ZTMyX21hc2socmVnLCBCTEtfQ09OVFJPTCwgbWFzaywgY3Ry
bCk7Cj4gIH0KPiAgCj4gIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfZHVtcChzdHJ1Y3Qga29tZWRh
X2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpzZikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gaW5kZXggZmUyOTVjNGZjYTcx
Li5jOWI4ZDJkNWUxOTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAgLTE4LDEwICsxOCwxMSBAQAo+ICAjaW5jbHVkZSAi
a29tZWRhX2ttcy5oIgo+ICAKPiAgdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKPiAtCQkJCSAgdTMyICpjb2xvcl9kZXB0aHMp
Cj4gKwkJCQkgIHUzMiAqY29sb3JfZGVwdGhzLCB1MzIgKmNvbG9yX2Zvcm1hdHMpCj4gIHsKPiAg
CXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uOwo+ICAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3Rh
dGUgKmNvbm5fc3Q7Cj4gKwl1MzIgY29ubl9jb2xvcl9mb3JtYXRzID0gfjB1Owo+ICAJaW50IGks
IG1pbl9icGMgPSAzMSwgY29ubl9icGMgPSAwOwo+ICAKPiAgCWZvcl9lYWNoX25ld19jb25uZWN0
b3JfaW5fc3RhdGUoY3J0Y19zdC0+c3RhdGUsIGNvbm4sIGNvbm5fc3QsIGkpIHsKPiBAQCAtMjks
MTIgKzMwLDE4IEBAIHZvaWQga29tZWRhX2NydGNfZ2V0X2NvbG9yX2NvbmZpZyhzdHJ1Y3QgZHJt
X2NydGNfc3RhdGUgKmNydGNfc3QsCj4gIAkJCWNvbnRpbnVlOwo+ICAKPiAgCQljb25uX2JwYyA9
IGNvbm4tPmRpc3BsYXlfaW5mby5icGMgPyBjb25uLT5kaXNwbGF5X2luZm8uYnBjIDogODsKPiAr
CQljb25uX2NvbG9yX2Zvcm1hdHMgJj0gY29ubi0+ZGlzcGxheV9pbmZvLmNvbG9yX2Zvcm1hdHM7
Cj4gIAo+ICAJCWlmIChjb25uX2JwYyA8IG1pbl9icGMpCj4gIAkJCW1pbl9icGMgPSBjb25uX2Jw
YzsKPiAgCX0KPiAgCj4gKwkvKiBjb25uZWN0b3IgZG9lc24ndCBjb25maWcgYW55IGNvbG9yX2Zv
cm1hdCwgdXNlIFJHQjQ0NCBhcyBkZWZhdWx0ICovCj4gKwlpZiAoIWNvbm5fY29sb3JfZm9ybWF0
cykKPiArCQljb25uX2NvbG9yX2Zvcm1hdHMgPSBEUk1fQ09MT1JfRk9STUFUX1JHQjQ0NDsKPiAr
Cj4gIAkqY29sb3JfZGVwdGhzID0gR0VOTUFTSyhtaW5fYnBjLCAwKTsKPiArCSpjb2xvcl9mb3Jt
YXRzID0gY29ubl9jb2xvcl9mb3JtYXRzOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBrb21lZGFf
Y3J0Y191cGRhdGVfY2xvY2tfcmF0aW8oc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19z
dCkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
aAo+IGluZGV4IGE0MjUwMzQ1MWI1ZC4uNDU2ZjNjNDM1NzE5IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiBAQCAtMTY3LDcgKzE2
Nyw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoYXNfZmxpcF9oKHUzMiByb3QpCj4gIH0KPiAgCj4g
IHZvaWQga29tZWRhX2NydGNfZ2V0X2NvbG9yX2NvbmZpZyhzdHJ1Y3QgZHJtX2NydGNfc3RhdGUg
KmNydGNfc3QsCj4gLQkJCQkgIHUzMiAqY29sb3JfZGVwdGhzKTsKPiArCQkJCSAgdTMyICpjb2xv
cl9kZXB0aHMsIHUzMiAqY29sb3JfZm9ybWF0cyk7Cj4gIHVuc2lnbmVkIGxvbmcga29tZWRhX2Ny
dGNfZ2V0X2FjbGsoc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCk7Cj4gIAo+ICBp
bnQga29tZWRhX2ttc19zZXR1cF9jcnRjcyhzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywgc3Ry
dWN0IGtvbWVkYV9kZXYgKm1kZXYpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+IGluZGV4IDc2NTNmMTM0YThlYi4uYzBm
NTNiMTliNjJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX3BpcGVsaW5lLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gQEAgLTMyMyw3ICszMjMsNyBAQCBzdHJ1Y3Qga29t
ZWRhX2ltcHJvYyB7Cj4gIAo+ICBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7Cj4gIAlzdHJ1
Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSBiYXNlOwo+IC0JdTggY29sb3JfZGVwdGg7Cj4gKwl1
OCBjb2xvcl9mb3JtYXQsIGNvbG9yX2RlcHRoOwo+ICAJdTE2IGhzaXplLCB2c2l6ZTsKPiAgfTsK
PiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gaW5kZXggZTY0YmZlYWEwNmM3Li45NDhkMTk1MWM4
ZWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiBAQCAtNzU4LDEwICs3NTgsMTEgQEAga29t
ZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2ltcHJvYyAqaW1wcm9jLAo+ICAJc3Qt
PnZzaXplID0gZGZsb3ctPmluX2g7Cj4gIAo+ICAJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19t
b2Rlc2V0KGNydGNfc3QpKSB7Cj4gLQkJdTMyIG91dHB1dF9kZXB0aHM7Cj4gLQkJdTMyIGF2YWls
X2RlcHRoczsKPiArCQl1MzIgb3V0cHV0X2RlcHRocywgb3V0cHV0X2Zvcm1hdHM7Cj4gKwkJdTMy
IGF2YWlsX2RlcHRocywgYXZhaWxfZm9ybWF0czsKPiAgCj4gLQkJa29tZWRhX2NydGNfZ2V0X2Nv
bG9yX2NvbmZpZyhjcnRjX3N0LCAmb3V0cHV0X2RlcHRocyk7Cj4gKwkJa29tZWRhX2NydGNfZ2V0
X2NvbG9yX2NvbmZpZyhjcnRjX3N0LCAmb3V0cHV0X2RlcHRocywKPiArCQkJCQkgICAgICZvdXRw
dXRfZm9ybWF0cyk7Cj4gIAo+ICAJCWF2YWlsX2RlcHRocyA9IG91dHB1dF9kZXB0aHMgJiBpbXBy
b2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHM7Cj4gIAkJaWYgKGF2YWlsX2RlcHRocyA9PSAwKSB7
Cj4gQEAgLTc3MSw3ICs3NzIsMTcgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qga29t
ZWRhX2ltcHJvYyAqaW1wcm9jLAo+ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAgCQl9Cj4gIAo+ICsJ
CWF2YWlsX2Zvcm1hdHMgPSBvdXRwdXRfZm9ybWF0cyAmCj4gKwkJCQlpbXByb2MtPnN1cHBvcnRl
ZF9jb2xvcl9mb3JtYXRzOwo+ICsJCWlmICghYXZhaWxfZm9ybWF0cykgewo+ICsJCQlEUk1fREVC
VUdfQVRPTUlDKCJObyBhdmFpbGFibGUgY29sb3JfZm9ybWF0cywgY29ubiBmb3JtYXRzIDB4JXgg
JiBkaXNwbGF5OiAweCV4XG4iLAo+ICsJCQkJCSBvdXRwdXRfZm9ybWF0cywKPiArCQkJCQkgaW1w
cm9jLT5zdXBwb3J0ZWRfY29sb3JfZm9ybWF0cyk7Cj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJ
CX0KPiArCj4gIAkJc3QtPmNvbG9yX2RlcHRoID0gX19mbHMoYXZhaWxfZGVwdGhzKTsKPiArCQlz
dC0+Y29sb3JfZm9ybWF0ID0gQklUKF9fZmZzKGF2YWlsX2Zvcm1hdHMpKTsKPiAgCX0KPiAgCj4g
IAlrb21lZGFfY29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+aW5wdXQsIDAp
Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV93Yl9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3diX2Nvbm5lY3Rvci5jCj4gaW5kZXggNzQwYTgxMjUwNjMwLi5hYmZhNTg3ZGIxODkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2Jf
Y29ubmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV93Yl9jb25uZWN0b3IuYwo+IEBAIC0xNzQsNiArMTc0LDcgQEAgc3RhdGljIGludCBrb21l
ZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiAgCj4gIAlp
bmZvID0gJmt3Yl9jb25uLT5iYXNlLmJhc2UuZGlzcGxheV9pbmZvOwo+ICAJaW5mby0+YnBjID0g
X19mbHMoa2NydGMtPm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzKTsKPiAr
CWluZm8tPmNvbG9yX2Zvcm1hdHMgPSBrY3J0Yy0+bWFzdGVyLT5pbXByb2MtPnN1cHBvcnRlZF9j
b2xvcl9mb3JtYXRzOwo+ICAKPiAgCWtjcnRjLT53Yl9jb25uID0ga3diX2Nvbm47Cj4KCkxvb2tz
IGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5vbG9n
eSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
