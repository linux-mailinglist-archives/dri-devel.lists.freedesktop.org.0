Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D6D8A8B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7F36E8E9;
	Wed, 16 Oct 2019 08:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375966E8E9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:10:09 +0000 (UTC)
Received: from AM6PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:20b:b2::17)
 by VI1PR08MB3422.eurprd08.prod.outlook.com (2603:10a6:803:7c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 16 Oct
 2019 08:10:05 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by AM6PR08CA0005.outlook.office365.com
 (2603:10a6:20b:b2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 08:10:05 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 08:10:03 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Wed, 16 Oct 2019 08:09:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 133d53414703e0b1
X-CR-MTA-TID: 64aa7808
Received: from 2a8688507bc6.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23BFBCD8-4B83-49EF-B528-CE6E488EE332.1; 
 Wed, 16 Oct 2019 08:09:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a8688507bc6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 08:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuHsY5fp+BOsJXoFSSmT/ZW5efTg8Ph5R5m1N1LC+Zu0xV8LzgqLQ67NolVzdApxcOiJMyt+g58107obQRnzMJC4cXqEDUrq/3jEZHgVY7LoPLa91t+PFH7geDes6CWbddqiWPCrkDNVnwfsCAsU6sDH5pWGP65jR3/EoOVi5tjfQMtTgO03vtfE9mnSPXQaOIreLhURvz2xTiknrVSVLXxzh/oKA52egL1/H8K26jK9rnejDBb+U5akKURSoRedi4tX9Grg0/ma4wvm/P3T5vWIemXY4TdZmtGP8xpHezcIJL+WOoAky5jQXcIpBvHZlFG/opnhsd+owrehnTIuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z80pWqedfnhFFNI7iJtzIpb35fhHBNOf5hrlUIMxdSY=;
 b=EJ3wFEafd6o7O/T6JfGs4LXr8MHvd3+ruxU8iMiq5idZ8wRNAd50vKZyToEaDqwzEl4pc6WoNuKV51IiL9+nVuSMk6GNg7lPH3D5kFfIMAOx90lLQpZqg+2F+jCcH/REdhc17qnwkerDBNIMhhZc1Svo0W+S63eEImOWp5zBPsxIKrqaB0SbZLKss290duhe60uAOY2XtSZntTQuNvnl0GQfy3WS+WeTCD/RJm+hTN5x0OPHbg+F/4jG5vFjtm4Aseawd9g5iZA+6fhmoOhULt88uZxOJETQT73FMMaa6sKM5QIv49hSvOUcPxxfvhE2ZeYzmB3VbBqJ+pTkosZrbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5231.eurprd08.prod.outlook.com (10.255.112.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 08:09:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 08:09:46 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: drm/komeda: Set output color depth for output
Thread-Topic: drm/komeda: Set output color depth for output
Thread-Index: AQHVg/kSgDabgbeV5EilMum8jdKQuA==
Date: Wed, 16 Oct 2019 08:09:46 +0000
Message-ID: <20191016080938.GA4009@jamwan02-TSP300>
References: <20191012065030.12691-1-lowry.li@arm.com>
In-Reply-To: <20191012065030.12691-1-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:203:2e::27) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: be63aed3-fe3e-4787-605e-08d752103fb2
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5231:|VE1PR08MB5231:|VI1PR08MB3422:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB342256C7E602534A9127CC32B3920@VI1PR08MB3422.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:255;OLM:255;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(9686003)(11346002)(102836004)(486006)(2906002)(5660300002)(55236004)(3846002)(1076003)(6436002)(66066001)(4326008)(476003)(446003)(25786009)(33656002)(33716001)(6512007)(229853002)(6862004)(6486002)(478600001)(26005)(6116002)(6246003)(71200400001)(305945005)(6636002)(71190400001)(256004)(316002)(14454004)(66446008)(66476007)(66946007)(64756008)(66556008)(8676002)(7736002)(52116002)(186003)(8936002)(81156014)(58126008)(81166006)(86362001)(386003)(76176011)(99286004)(6506007)(54906003)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5231;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WjENv1gKZ8PAh9t2BOlzf3kMVfiWZLQxGlRbdPjryz/0TP0DU4zl7F2yy0nOahfW6Eg6Rc70xOGqefrNZASzCluncUFwt58DMi5yc4mfCg3WjcZow6UJMnxT/m4zXtwKWy//j4g14FD4ox9FAMTBDqaSs7DMWOMA5csbJqucsGi/OTS0w/QYkvrCwCBonMMsUH7r9cjApsy3BnNE24DcLnF6ITeZk/7uZBwhHdmolMOH3gXnhXYBarjQLDNLGuA4zIbRji28LiMYFvMeqG3XLMgJPvRga0yyPO4brzK3N/g6P5CmoqSKTfTuxs3dlPBfti2IquEHg5aHlaPPs06eS1pUDTss5o2RRjwAT6t+cddK3jcrhsTY8HBhkVbY04DN1YTBQf9IVPAQptIgvu/V2fiXSnIHuqHLXkL8nxLrbDk=
Content-ID: <D771C47678B1FE4180A577426A754556@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5231
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(39860400002)(376002)(396003)(136003)(189003)(199004)(186003)(11346002)(476003)(446003)(36906005)(47776003)(126002)(58126008)(305945005)(6116002)(229853002)(23726003)(66066001)(336012)(63350400001)(7736002)(2906002)(33656002)(316002)(54906003)(9686003)(8746002)(6636002)(6486002)(6512007)(81166006)(81156014)(6506007)(386003)(14444005)(76176011)(356004)(99286004)(8936002)(70206006)(3846002)(6246003)(486006)(26005)(14454004)(102836004)(70586007)(4326008)(50466002)(5660300002)(8676002)(33716001)(97756001)(22756006)(1076003)(26826003)(46406003)(478600001)(76130400001)(25786009)(86362001)(6862004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3422;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1f5e7d49-4125-4fad-ec26-08d752103513
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Povi6ShTTlCZdT379y3uaixnZUQ+IZqZbRNdYsMAO3TjlNMBNLRvBYRtvsWu0+/0ANZ3QQOESCtSliM+7PCuMNh9Ei+EvtW1VGr1d0T22MTqqN/wN7SKbsEPJcG9cxWS7a0CLQY4dxW0qOXGvKF58OPUYBj0wgJKVHS7HuXrBFq+ncdKNlliRfgJbllgD2AXnjdNZElPafTmAptipHiQJxjsjAhadM10xqlPMuFy1pqMgSd6mV8YkaYJmzvZ4vFimB5DEDwT3lKCDPx6yacJh7vJDrYjP+c/6hneYYyLSGWjKSCPgOJ1rTdKSNgUN5eNz7BgXXhtWBZ2O/s/5e2Wot9i8VWejEbgk0fI672bEAlFi1CMvV2FIfyQZZhCdaNoA3b4qd1fWhxWoe6Cz1TNQe5Mo8WxRd9ct0vCh6o60g=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 08:10:03.6742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be63aed3-fe3e-4787-605e-08d752103fb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3422
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z80pWqedfnhFFNI7iJtzIpb35fhHBNOf5hrlUIMxdSY=;
 b=I8ch/+BP52tIssYSVk3D9EEjO4NDzFHK2JB0r4tNVXjBtRh/jjPD5sUruvrimJzqBLuMq+DIt1Zu34saHmAnSmdCdYYFkpl2Ir6GcbkAWKEAM3vGPbn5tIaeaxorG6P6FuJr0ZfCqtnIAwwmBcAL1AnbtiFMVd3UG0r3NhIXb5c=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z80pWqedfnhFFNI7iJtzIpb35fhHBNOf5hrlUIMxdSY=;
 b=I8ch/+BP52tIssYSVk3D9EEjO4NDzFHK2JB0r4tNVXjBtRh/jjPD5sUruvrimJzqBLuMq+DIt1Zu34saHmAnSmdCdYYFkpl2Ir6GcbkAWKEAM3vGPbn5tIaeaxorG6P6FuJr0ZfCqtnIAwwmBcAL1AnbtiFMVd3UG0r3NhIXb5c=
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

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgMDY6NTA6NDZBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBTZXQgY29sb3JfZGVwdGggYWNjb3JkaW5nIHRvIGNv
bm5lY3Rvci0+YnBjLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gRml4ZWQgbWluX2JwYyBp
cyBlZmZlY3RpdmVseSBzZXQgYnV0IG5vdCB1c2VkIGluCj4ga29tZWRhX2NydGNfZ2V0X2NvbG9y
X2NvbmZpZygpLgo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gIC0gQWxpZ24gdGhlIGNvZGUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnku
bGlAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5h
c3NvdkBhcm0uY29tPgo+IC0tLQo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29t
cG9uZW50LmMgICAgfCAgMSArCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jICB8IDIwICsrKysrKysrKysrKysrKysrKysKPiAgLi4uL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDIgKysKPiAgLi4uL2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDEgKwo+ICAuLi4vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAxOCArKysrKysrKysrKysrKysrKwo+ICAuLi4v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAgNCArKysrCj4gIDYg
ZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiBpbmRleCBj
M2QyOWMwYjA1MWIuLjI3Y2RiMDM1NzNjMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiBAQCAtOTUxLDYg
Kzk1MSw3IEBAIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRlKHN0cnVjdCBrb21lZGFfY29t
cG9uZW50ICpjLAo+ICAJCQkgICAgICAgdG9fZDcxX2lucHV0X2lkKHN0YXRlLCBpbmRleCkpOwo+
ICAKPiAgCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX1NJWkUsIEhWX1NJWkUoc3QtPmhzaXplLCBz
dC0+dnNpemUpKTsKPiArCW1hbGlkcF93cml0ZTMyKHJlZywgSVBTX0RFUFRILCBzdC0+Y29sb3Jf
ZGVwdGgpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtv
bWVkYV9jb21wb25lbnQgKmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IGluZGV4IDc1MjYzZDhj
ZDBiZC4uZmUyOTVjNGZjYTcxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBAIC0xNyw2ICsxNywyNiBAQAo+ICAjaW5jbHVk
ZSAia29tZWRhX2Rldi5oIgo+ICAjaW5jbHVkZSAia29tZWRhX2ttcy5oIgo+ICAKPiArdm9pZCBr
b21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19z
dCwKPiArCQkJCSAgdTMyICpjb2xvcl9kZXB0aHMpCj4gK3sKPiArCXN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uOwo+ICsJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3Q7Cj4gKwlp
bnQgaSwgbWluX2JwYyA9IDMxLCBjb25uX2JwYyA9IDA7Cj4gKwo+ICsJZm9yX2VhY2hfbmV3X2Nv
bm5lY3Rvcl9pbl9zdGF0ZShjcnRjX3N0LT5zdGF0ZSwgY29ubiwgY29ubl9zdCwgaSkgewo+ICsJ
CWlmIChjb25uX3N0LT5jcnRjICE9IGNydGNfc3QtPmNydGMpCj4gKwkJCWNvbnRpbnVlOwo+ICsK
PiArCQljb25uX2JwYyA9IGNvbm4tPmRpc3BsYXlfaW5mby5icGMgPyBjb25uLT5kaXNwbGF5X2lu
Zm8uYnBjIDogODsKPiArCj4gKwkJaWYgKGNvbm5fYnBjIDwgbWluX2JwYykKPiArCQkJbWluX2Jw
YyA9IGNvbm5fYnBjOwo+ICsJfQo+ICsKPiArCSpjb2xvcl9kZXB0aHMgPSBHRU5NQVNLKG1pbl9i
cGMsIDApOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBrb21lZGFfY3J0Y191cGRhdGVfY2xvY2tf
cmF0aW8oc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCkKPiAgewo+ICAJdTY0IHB4
bGNsaywgYWNsazsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuaAo+IGluZGV4IDQ1YzQ5OGUxNWU3YS4uYTQyNTAzNDUxYjVkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiBAQCAt
MTY2LDYgKzE2Niw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBoYXNfZmxpcF9oKHUzMiByb3QpCj4g
IAkJcmV0dXJuICEhKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9YKTsKPiAgfQo+ICAKPiAr
dm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAq
Y3J0Y19zdCwKPiArCQkJCSAgdTMyICpjb2xvcl9kZXB0aHMpOwo+ICB1bnNpZ25lZCBsb25nIGtv
bWVkYV9jcnRjX2dldF9hY2xrKHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpOwo+
ICAKPiAgaW50IGtvbWVkYV9rbXNfc2V0dXBfY3J0Y3Moc3RydWN0IGtvbWVkYV9rbXNfZGV2ICpr
bXMsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiBpbmRleCBiMzIyZjUyYmE4
ZjIuLjc2NTNmMTM0YThlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+IEBAIC0zMjMsNiArMzIzLDcgQEAgc3Ry
dWN0IGtvbWVkYV9pbXByb2Mgewo+ICAKPiAgc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgewo+
ICAJc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgYmFzZTsKPiArCXU4IGNvbG9yX2RlcHRo
Owo+ICAJdTE2IGhzaXplLCB2c2l6ZTsKPiAgfTsKPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4g
aW5kZXggMGJhOWM2YWEzNzA4Li5lNjRiZmVhYTA2YzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRl
LmMKPiBAQCAtNzQzLDYgKzc0Myw3IEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtv
bWVkYV9pbXByb2MgKmltcHJvYywKPiAgCQkgICAgICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3df
Y2ZnICpkZmxvdykKPiAgewo+ICAJc3RydWN0IGRybV9jcnRjICpjcnRjID0ga2NydGNfc3QtPmJh
c2UuY3J0YzsKPiArCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCA9ICZrY3J0Y19zdC0+
YmFzZTsKPiAgCXN0cnVjdCBrb21lZGFfY29tcG9uZW50X3N0YXRlICpjX3N0Owo+ICAJc3RydWN0
IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0Owo+ICAKPiBAQCAtNzU2LDYgKzc1NywyMyBAQCBrb21l
ZGFfaW1wcm9jX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfaW1wcm9jICppbXByb2MsCj4gIAlzdC0+
aHNpemUgPSBkZmxvdy0+aW5fdzsKPiAgCXN0LT52c2l6ZSA9IGRmbG93LT5pbl9oOwo+ICAKPiAr
CWlmIChkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0KSkgewo+ICsJCXUzMiBv
dXRwdXRfZGVwdGhzOwo+ICsJCXUzMiBhdmFpbF9kZXB0aHM7Cj4gKwo+ICsJCWtvbWVkYV9jcnRj
X2dldF9jb2xvcl9jb25maWcoY3J0Y19zdCwgJm91dHB1dF9kZXB0aHMpOwo+ICsKPiArCQlhdmFp
bF9kZXB0aHMgPSBvdXRwdXRfZGVwdGhzICYgaW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhz
Owo+ICsJCWlmIChhdmFpbF9kZXB0aHMgPT0gMCkgewo+ICsJCQlEUk1fREVCVUdfQVRPTUlDKCJO
byBhdmFpbGFibGUgY29sb3IgZGVwdGhzLCBjb25uIGRlcHRoczogMHgleCAmIGRpc3BsYXk6IDB4
JXhcbiIsCj4gKwkJCQkJIG91dHB1dF9kZXB0aHMsCj4gKwkJCQkJIGltcHJvYy0+c3VwcG9ydGVk
X2NvbG9yX2RlcHRocyk7Cj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJCX0KPiArCj4gKwkJc3Qt
PmNvbG9yX2RlcHRoID0gX19mbHMoYXZhaWxfZGVwdGhzKTsKPiArCX0KPiArCj4gIAlrb21lZGFf
Y29tcG9uZW50X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+aW5wdXQsIDApOwo+ICAJa29t
ZWRhX2NvbXBvbmVudF9zZXRfb3V0cHV0KCZkZmxvdy0+aW5wdXQsICZpbXByb2MtPmJhc2UsIDAp
Owo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV93Yl9jb25uZWN0b3IuYwo+IGluZGV4IDI4NTFjYWM5NGQ4Ni4uNzQwYTgxMjUwNjMw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X3diX2Nvbm5lY3Rvci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiBAQCAtMTQyLDYgKzE0Miw3IEBAIHN0YXRpYyBpbnQg
a29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGtvbWVkYV9rbXNfZGV2ICprbXMsCj4gIAlz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9IGttcy0+YmFzZS5kZXZfcHJpdmF0ZTsKPiAgCXN0cnVj
dCBrb21lZGFfd2JfY29ubmVjdG9yICprd2JfY29ubjsKPiAgCXN0cnVjdCBkcm1fd3JpdGViYWNr
X2Nvbm5lY3RvciAqd2JfY29ubjsKPiArCXN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZvOwo+
ICAJdTMyICpmb3JtYXRzLCBuX2Zvcm1hdHMgPSAwOwo+ICAJaW50IGVycjsKPiAgCj4gQEAgLTE3
MSw2ICsxNzIsOSBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25uZWN0b3JfYWRkKHN0cnVjdCBr
b21lZGFfa21zX2RldiAqa21zLAo+ICAKPiAgCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmd2Jf
Y29ubi0+YmFzZSwgJmtvbWVkYV93Yl9jb25uX2hlbHBlcl9mdW5jcyk7Cj4gIAo+ICsJaW5mbyA9
ICZrd2JfY29ubi0+YmFzZS5iYXNlLmRpc3BsYXlfaW5mbzsKPiArCWluZm8tPmJwYyA9IF9fZmxz
KGtjcnRjLT5tYXN0ZXItPmltcHJvYy0+c3VwcG9ydGVkX2NvbG9yX2RlcHRocyk7Cj4gKwo+ICAJ
a2NydGMtPndiX2Nvbm4gPSBrd2JfY29ubjsKPiAgCj4gIAlyZXR1cm4gMDsKCkxvb2tzIGdvb2Qg
dG8gbWUuCgpJJ2xsIHB1c2ggaXQgdG8gZHJtLW1pc2MtbmV4dC4KClJldmlld2VkLWJ5OiBKYW1l
cyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5j
b20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
