Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF6DBECC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 09:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09316EAD9;
	Fri, 18 Oct 2019 07:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10043.outbound.protection.outlook.com [40.107.1.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBEF6EAD9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 07:51:37 +0000 (UTC)
Received: from HE1PR08CA0075.eurprd08.prod.outlook.com (2603:10a6:7:2a::46) by
 AM0PR08MB5044.eurprd08.prod.outlook.com (2603:10a6:208:156::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Fri, 18 Oct
 2019 07:51:32 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by HE1PR08CA0075.outlook.office365.com
 (2603:10a6:7:2a::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.20 via Frontend
 Transport; Fri, 18 Oct 2019 07:51:32 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 07:51:31 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 18 Oct 2019 07:51:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 86cd0c72bf13b10b
X-CR-MTA-TID: 64aa7808
Received: from ef9e1f40a546.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E83F7E99-5364-4F93-AEF1-D94FE6CBC0F0.1; 
 Fri, 18 Oct 2019 07:51:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef9e1f40a546.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 07:51:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eds6RqaGGOSjs+y9t8E9vckoxWww1T+miXzThSwVZcnk9S29yO1XuOk5GtW22NEnwNsZwU09GwKbFf1I33tBmkkSC3t0oVBFKqEo7hREJackMGIjyWkrd9AQZ3PdsTEOyfqTOnMTHfzNAkUw7Z8WMSMuEe4RZ6cwWiOWfzU0/N7lvUlECNOlqgXucW1mzjhR77R/fpbwAU/yXXUScSv8oZmxllH3lHLC69eM0/0QvL+5PYCZe4jqV9Ql0VMV1tEw13Y5MAQZxgzJydacnnaQfqdUMcc4rJfzNuxNaugDUlonE9/7viR0rq+xVSCDgi16/5cphntc72dnmGgNhQb+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaqdWlJszFRjvsBi+yaVGBtEHSJp1eD8AknJn4hJMio=;
 b=fc8oDVd9GjKfXjJnIyFunWeR9Bk8EDWEfUOh1sVJum21fhpcgzPSuM/brdLeR47yADmdwF0K422I7AJSFKWnpHTD9FaukyaeHZwPpyMm4ksNYSzQ/ERKR69dGVkvZk9cH9obQR9+WPyANkvQ6WPSr59TT/wjO6Bx4QOhkNZ9n144985YkHLSSSnq6QWLuWHINt4nEQSh/ZHmsoJB/yLZVf0R+y/djFI5TNGGjYU2UfhbV3VrAn6QJqlvc3pqHoJd/Av/XNKbtjUrp9ytyuVoWFqf1ETdvHxJkN2vhrIuQLezoWPeDuHa1eH98LvAirCmkmeXJbEK7vF30Zt9woMWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4910.eurprd08.prod.outlook.com (10.255.114.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 07:51:09 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.026; Fri, 18 Oct 2019
 07:51:09 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVhA09wVtvHgqrOkmWUho1ovfOOaddGi2AgALvSoA=
Date: Fri, 18 Oct 2019 07:51:09 +0000
Message-ID: <20191018075101.GA19928@jamwan02-TSP300>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
 <20191016103339.25858-2-james.qian.wang@arm.com>
 <2404938.QDdPyV61sH@e123338-lin>
In-Reply-To: <2404938.QDdPyV61sH@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:2f::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d221b18e-ffaf-4f70-86bc-08d7539ffd66
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4910:|VE1PR08MB4910:|AM0PR08MB5044:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB50441ACED24F3CFBAFD3E93FB36C0@AM0PR08MB5044.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(366004)(346002)(39860400002)(396003)(376002)(189003)(199004)(229853002)(6436002)(71200400001)(8676002)(6512007)(8936002)(86362001)(55236004)(102836004)(6116002)(478600001)(81166006)(81156014)(66946007)(9686003)(6486002)(186003)(14454004)(6246003)(3846002)(66066001)(66476007)(66446008)(64756008)(66556008)(6862004)(33716001)(71190400001)(256004)(316002)(486006)(52116002)(76176011)(7736002)(305945005)(26005)(99286004)(386003)(4326008)(33656002)(476003)(6636002)(11346002)(2906002)(446003)(54906003)(6506007)(58126008)(25786009)(1076003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4910;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: gYo44Z7Vw2gYK1hIOIy38fEC18Rx7hx10eN/w/2vPY7xVfO1EgPk+WLFx7Rg2zlrgPy8yRE2aPumyzvK1jn8gyggRFaQZLhc60ArZLvf/PFXlEToQcxuIn/qOC9RQR2K+q3W560if6BjRGCmlSS8ZyveaHcnP+A6OA/bje6KnpYhM6DakTemEbEXv3wiraQiom5H4DqDziaIpOjTQ4SwtklApdFAZ0ixiwh03KVfR/bSThHoNhOlfvswF8+qN7P1lKb1uHLYUN57Eoe3OgnQJ8eWbKuEIdPFlQzw9eVjUW00mZ9AQosetpVj65x1wOKy2afFUQ21X5uWBWtfsiKAlkjW26c6jCeacE65ImJcyNZStbQRvl4PpT4OY3wddm++aJOhkMzo+as9DKaKEKGyVEfu3Z/rWlKzaAujZbHwxo0=
Content-ID: <7431CF41A5800948AF2E0C43D6CAA3F3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(396003)(346002)(39860400002)(376002)(189003)(199004)(446003)(6636002)(11346002)(33716001)(63350400001)(486006)(126002)(70586007)(8936002)(336012)(476003)(58126008)(76130400001)(8746002)(70206006)(36906005)(54906003)(8676002)(7736002)(305945005)(81166006)(81156014)(1076003)(5660300002)(47776003)(6512007)(9686003)(107886003)(23726003)(97756001)(6116002)(26005)(6506007)(386003)(33656002)(6862004)(2906002)(46406003)(316002)(356004)(3846002)(186003)(22756006)(86362001)(14454004)(102836004)(50466002)(99286004)(26826003)(6486002)(478600001)(66066001)(25786009)(6246003)(76176011)(4326008)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5044;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 98778f9a-3e92-470b-0e14-08d7539ff006
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r03kU8SaehS9QlR37HjtFMfkmYzwXqwShpIR/+qEbSqMhFNhgtAklyem5QBLeH0UKdmxkZwRkj0tLNUlkPP2xH5zcb7ZkUiYQDrfdiiVwCk+5/h5+JDzAMXSZgJlfyo76/EOVw6cDwDf6Pn9gLu/1tnWWeYPdz/0E+0ej9PkIEZy4nOxPh8Y9Xr2UN0uxB3P5K61HCAyM0mgTr6F7STubtuNKQR/gwkLitHpi+N2DSW82xz4nyJShEfd3Q+lhhv9u+7S/NIQB+Rb6wll9vBg2t6KIrAlkAKAgomgKGR2ZM6KqSyCPs4Wwxrq3WeC30W57DQvUPUTK7qhSKijM6SEyDceP/bq0Dy+mrAMkv4l4415Ed0lpcoTko/YcB1mSHUknrBTAF2xt9VKUbI0T2U0itD9josp7nyjeMNeHSZFBCk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 07:51:31.0863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d221b18e-ffaf-4f70-86bc-08d7539ffd66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5044
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaqdWlJszFRjvsBi+yaVGBtEHSJp1eD8AknJn4hJMio=;
 b=ZhYfWgwtljOj20zQK2fiVkH3Fj5kvlQNlydxCb1puxrnVm5dnchaJDay2kOscx1B5qip/znvlx5V0p4gWBrHaGzxjABGHiPsJE2XCDKfLQE3KDK03TNx+L/x+NX+/N7nHTbfdLPLdLPitXhYDFfTIqizh4DqTEyHpZskmGhaI3o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaqdWlJszFRjvsBi+yaVGBtEHSJp1eD8AknJn4hJMio=;
 b=ZhYfWgwtljOj20zQK2fiVkH3Fj5kvlQNlydxCb1puxrnVm5dnchaJDay2kOscx1B5qip/znvlx5V0p4gWBrHaGzxjABGHiPsJE2XCDKfLQE3KDK03TNx+L/x+NX+/N7nHTbfdLPLdLPitXhYDFfTIqizh4DqTEyHpZskmGhaI3o=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTE6MDI6MDNBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBXZWRuZXNkYXksIDE2IE9jdG9iZXIgMjAxOSAxMTozNDowOCBCU1QgamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiBBZGQgYSBuZXcg
aGVscGVyIGZ1bmN0aW9uIGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24oKSBmb3IgZHJpdmVy
IHRvCj4gPiBjb252ZXJ0IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBjb21wbGVt
ZW50IHRoYXQgc3VwcG9ydGVkIGJ5Cj4gPiBoYXJkd2FyZS4KPiA+IAo+ID4gVjQ6IEFkZHJlc3Mg
TWloYWksIERhbmllbCBhbmQgSWxpYSdzIHJldmlldyBjb21tZW50cy4KPiA+IFY1OiBJbmNsdWRl
cyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVlIG9mIG0gKFFtLm4pLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWls
LmF0YW5hc3NvdkBhcm0uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9y
X21nbXQuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGluY2x1ZGUvZHJt
L2RybV9jb2xvcl9tZ210LmggICAgIHwgIDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29s
b3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+IGluZGV4IDRj
ZTVjNmQ4ZGU5OS4uZDMxM2YxOTRmMWVjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9jb2xvcl9tZ210LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdt
dC5jCj4gPiBAQCAtMTMyLDYgKzEzMiwzMyBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJh
Y3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikKPiA+ICB9Cj4g
PiAgRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3QpOwo+ID4gIAo+ID4gKy8qKgo+
ID4gKyAqIGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24KPiA+ICsgKgo+ID4gKyAqIEB1c2Vy
X2lucHV0OiBpbnB1dCB2YWx1ZQo+ID4gKyAqIEBtOiBudW1iZXIgb2YgaW50ZWdlciBiaXRzLCBp
bmNsdWRlIHRoZSBzaWduLWJpdCwgc3VwcG9ydCByYW5nZSBpcyBbMSwgMzJdCj4gCj4gQW55IHJl
YXNvbiB3aHkgbnVtYmVycyBsaWtlIFEwLjMyIGFyZSBkaXNhbGxvd2VkPyBJbiB0aG9zZSBjYXNl
cywgdGhlCj4gJ3NpZ24nIGJpdCBhbmQgdGhlIGZpcnN0IGZyYWN0aW9uYWwgYml0IGp1c3QgaGFw
cGVuIHRvIGJlIHRoZSBzYW1lIGJpdC4KPiBUaGUgbG9uZ2VyIEkgbG9vayBhdCBpdCwgdGhlIG1v
cmUgSSB0aGluayBtZW50aW9uaW5nIGEgJ3NpZ24tYml0JyBoZXJlCj4gbWlnaHQgY29uZnVzZSBw
ZW9wbGUgbW9yZSwgc2luY2UgMidzIGNvbXBsZW1lbnQgZG9lc24ndCBoYXZlIGEKPiBkZWRpY2F0
ZWQgYml0IGp1c3QgZm9yIHRoZSBzaWduLiBIb3cgYWJvdXQgcmVkdWNpbmcgaXQgc2ltcGx5IHRv
OgoKTm8sIHNpbmNlIHRoZSB2YWx1ZSBpcyBzaWduZWQgdGhlcmUgbXVzdCBiZSBkZWRpY2F0ZWQg
c2lnbi1iaXQuCgpjb25zaWRlciB2ZXJ5IHNpbXBsZSAyIGJpdCBzaWduZWQsIFExLjEKCiAwLjUg
IGlzIDAxCiAwICAgIGlzIDAwCi0wLjUgIGlzIDExCi0xLjAgIGlzIDEwLCBzaWduLWJpdCBhbmQg
dmFsdWUgc2hhcmUgc2FtZSBiaXQsIGJ1dCBpdCBpcyBpbnRlZ2VyIHBhcnQuCgpTZWUgdGhlIHdp
a2k6CgpPbmUgY29udmVudGlvbiBpbmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVlIG9m
IG0sWzFdWzJdIGFuZCB0aGUgb3RoZXIgY29udmVudGlvbgpkb2VzIG5vdC4gVGhlIGNob2ljZSBv
ZiBjb252ZW50aW9uIGNhbiBiZSBkZXRlcm1pbmVkIGJ5IHN1bW1pbmcgbStuLiBJZiB0aGUgdmFs
dWUgaXMgZXF1YWwKdG8gdGhlIHJlZ2lzdGVyIHNpemUsIHRoZW4gdGhlIHNpZ24gYml0IGlzIGlu
Y2x1ZGVkIGluIHRoZSB2YWx1ZSBvZiBtLiBJZiBpdCBpcyBvbmUKbGVzcyB0aGFuIHRoZSByZWdp
c3RlciBzaXplLCB0aGUgc2lnbiBiaXQgaXMgbm90IGluY2x1ZGVkIGluIHRoZSB2YWx1ZSBvZiBt
LgoKU28gZm9yIHRoZSAzMmJpdCB2YWx1ZSwgYWxsIGZyYWN0aW9uYWw6CgphKSBNIGluY2x1ZGUg
c2lnbi1iaXQ6IFExLjMxCmIpIE0gZG9lc24ndCBpbmNsdWRlIHNpZ24tYml0OiBRMC4zMQoKPiAK
PiAgKiBAbTogbnVtYmVyIG9mIGludGVnZXIgYml0cywgbSA8PSAzMi4KPiAKPiA+ICsgKiBAbjog
bnVtYmVyIG9mIGZyYWN0aW9uYWwgYml0cywgb25seSBzdXBwb3J0IG4gPD0gMzIKPiA+ICsgKgo+
ID4gKyAqIENvbnZlcnQgYW5kIGNsYW1wIFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIChz
aWduZWQgMidzIGNvbXBsZW1lbnQpLiBUaGUKPiA+ICsgKiBoaWdoZXIgYml0cyB0aGF0IGFib3Zl
IG0gKyBuIGFyZSBjbGVhcmVkIG9yIGVxdWFsIHRvIHNpZ24tYml0IEJJVChtK24pLgo+IAo+IFtu
aXRdIEJJVChtICsgbiAtIDEpIGlmIHdlIGNvdW50IGZyb20gMC4KCmRvIHdlIHJlYWwgbmVlZCB0
byBjb25zaWRlciB0aGlzLCBjb252ZXJ0IHRvIChRMS4wKSA6KQpJIHRoaW5rIGl0IGNhbiBiZSBl
YXNpbHkgY2F1Z2h0IGJ5IHJldmlldy4KPiAKPiA+ICsgKi8KPiA+ICt1aW50NjRfdCBkcm1fY29s
b3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4gPiArCQkJCSAgICAg
IHVpbnQzMl90IG0sIHVpbnQzMl90IG4pCj4gPiArewo+ID4gKwl1NjQgbWFnID0gKHVzZXJfaW5w
dXQgJiB+QklUX1VMTCg2MykpID4+ICgzMiAtIG4pOwo+ID4gKwlib29sIG5lZ2F0aXZlID0gISEo
dXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMpKTsKPiA+ICsJczY0IHZhbDsKPiA+ICsKPiA+ICsJV0FS
Tl9PTihtIDwgMSB8fCBtID4gMzIgfHwgbiA+IDMyKTsKPiA+ICsKPiA+ICsJLyogdGhlIHJhbmdl
IG9mIHNpZ25lZCAyJ3MgY29tcGxlbWVudCBpcyBbLTJeKG0tMSksIDJeKG0tMSkgLSAyXi1uXSAq
Lwo+ID4gKwl2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/Cj4gPiArCQkJCUJJVF9V
TEwobiArIG0gLSAxKSA6IEJJVF9VTEwobiArIG0gLSAxKSAtIDEpOwo+ID4gKwo+ID4gKwlyZXR1
cm4gbmVnYXRpdmUgPyAtdmFsIDogdmFsOwo+ID4gK30KPiA+ICtFWFBPUlRfU1lNQk9MKGRybV9j
b2xvcl9jdG1fczMxXzMyX3RvX3FtX24pOwo+ID4gKwo+ID4gIC8qKgo+ID4gICAqIGRybV9jcnRj
X2VuYWJsZV9jb2xvcl9tZ210IC0gZW5hYmxlIGNvbG9yIG1hbmFnZW1lbnQgcHJvcGVydGllcwo+
ID4gICAqIEBjcnRjOiBEUk0gQ1JUQwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9j
b2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCj4gPiBpbmRleCBkMWM2
NjJkOTJhYjcuLjYwZmVhNTUwMTg4NiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9j
b2xvcl9tZ210LmgKPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+IEBA
IC0zMCw2ICszMCw4IEBAIHN0cnVjdCBkcm1fY3J0YzsKPiA+ICBzdHJ1Y3QgZHJtX3BsYW5lOwo+
ID4gIAo+ID4gIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lu
cHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKTsKPiA+ICt1aW50NjRfdCBkcm1fY29sb3JfY3Rt
X3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4gPiArCQkJCSAgICAgIHVpbnQz
Ml90IG0sIHVpbnQzMl90IG4pOwo+ID4gIAo+ID4gIHZvaWQgZHJtX2NydGNfZW5hYmxlX2NvbG9y
X21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gIAkJCQl1aW50IGRlZ2FtbWFfbHV0X3Np
emUsCj4gPiAKPiAKPiAKPiAtLSAKPiBNaWhhaWwKPiAKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
