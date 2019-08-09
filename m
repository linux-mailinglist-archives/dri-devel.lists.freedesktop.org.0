Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECAD87243
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 08:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31406ED01;
	Fri,  9 Aug 2019 06:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F1C6ECFF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 06:31:08 +0000 (UTC)
Received: from VI1PR08CA0191.eurprd08.prod.outlook.com (2603:10a6:800:d2::21)
 by HE1PR0802MB2601.eurprd08.prod.outlook.com (2603:10a6:3:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Fri, 9 Aug
 2019 06:31:02 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR08CA0191.outlook.office365.com
 (2603:10a6:800:d2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 06:31:02 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 9 Aug 2019 06:31:00 +0000
Received: ("Tessian outbound 71602e13cd49:v26");
 Fri, 09 Aug 2019 06:30:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e49e633699c8c43
X-CR-MTA-TID: 64aa7808
Received: from d7d30ac0c16c.1 (cr-mta-lb-1.cr-mta-net [104.47.8.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0190F177-C97E-467A-A271-BCF1B32D4269.1; 
 Fri, 09 Aug 2019 06:30:50 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7d30ac0c16c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 09 Aug 2019 06:30:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMJspDqMxB2mAlesh1L3z1tAhfyXjghNaS2mj/aclHz5HrS9ftE9oh+U96dLhjBa+MQznn4lZ0JR9PuMg0qksxxYHl5YkuLSAFt1c8XlCzGycOVKmeomH/Az1NXyLdn6rUjpYAgdojR7sYurLzciALgyIdfNR3QlTtKiiml5kSYm2EyVZXf1mSx8pZrWV/q7R28D19ixRXA5JMDtbQD7rZ8jA6tUVafVRb43J7S6yF43vYIfdhRJZMiryFg7G724iC0caVILEf4UAfgzfV2FJ8ODEKHsBHsFb+mInmrIAD31rv5k1eAxqI1GjRawhgzDeMe+gA8umHMGdOvKYjRG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQJVvsrYriM6vX5vpnDCPV+c6fnuOb1vgTSkgAP7bjI=;
 b=cMLDpj6fyXSAoWYZW9WYAVZHLP+Yp8VFNfto782Z7gcOxa7ivQiYljasnDBJkP/77/SPkYQ14ecSRoVD5z+QSXqVROscizMxc3P0r0Kqv9fTSDA2tfiXpLWjfES+e6JQU47ZnLd2/l2oLcjqy0GaMe+ulkzKbAcILaHmfa4ClrgGg1NSkCAbjPg6XdUqf32fAJaXxBXPeV/D6eW+Q88U7VdC0U30rMuUfD6vP5f7sVG8whPCTEr29wIeT6H08ssARliAcOGbdfeNP7ZdD2tc2MDpyKxtsfCjl9g2b1LCG+pudIXtRtlGPNIP+Lg4sEcsRfVZcm9Z8ci0keF+7FpQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5200.eurprd08.prod.outlook.com (20.179.31.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 9 Aug 2019 06:30:48 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.020; Fri, 9 Aug 2019
 06:30:48 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: drm/komeda: Initialize and enable output polling on Komeda
Thread-Topic: drm/komeda: Initialize and enable output polling on Komeda
Thread-Index: AQHVTnv7tNBLsk0CHUyRBWgRU7wKgg==
Date: Fri, 9 Aug 2019 06:30:48 +0000
Message-ID: <20190809063041.GA31698@jamwan02-TSP300>
References: <1564733249-24329-1-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564733249-24329-1-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:203:2e::33) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5c856bd1-e5cb-4190-e379-08d71c932571
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5200; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5200:|HE1PR0802MB2601:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2601D42E8009CFFF7E87CC12B3D60@HE1PR0802MB2601.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:747;OLM:747;
x-forefront-prvs: 01244308DF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(396003)(136003)(376002)(346002)(199004)(189003)(9686003)(102836004)(229853002)(6512007)(11346002)(5660300002)(476003)(86362001)(6246003)(25786009)(55236004)(52116002)(6116002)(6506007)(3846002)(66066001)(58126008)(99286004)(26005)(4326008)(5024004)(316002)(478600001)(186003)(6436002)(66446008)(64756008)(6486002)(66556008)(14454004)(446003)(66476007)(386003)(6862004)(76176011)(81156014)(66946007)(53936002)(8676002)(71190400001)(256004)(54906003)(81166006)(33656002)(33716001)(6636002)(2906002)(305945005)(7736002)(8936002)(486006)(71200400001)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5200;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: AJRC527uFqFvUGwcpdAiXM3ZMPhfP6BKZUbf5TcLlWsUxx+Zh5by1BtDJ2p6watJnHExAKZ8yb1x1uhWShlEhGAckv2E54FMSlwdWUbnrFUjufEw6CvgCiTslUWjfq/I348yBqACIMMiAViLTihPzAukJCHWQgzW1bQleMvShuFvIQpK4/BNKgj11D4O3TBt7GKVmwWW8q0aGIifNRpaVUAIPP283d2PzSKhzzGx7Zn1DPujAqC2+Q14FldXdLHZ6GpHvT13jgGUHXj/ReNXgFtXfS2j/oOLQL0pOX4DjX4bQrSqtKuFLowwQUKp3QxfQUmzVV23eEyZZIxDjeb5EG7BbL/+ViqnqHnDUzHcLQoRcmL6BP5KbiCjcLcka2vLe9tB190iXPvum6no+K0BuNR+Yjuziv7cKsvlzxnJet0=
Content-ID: <907FD6867C61C443B84FC7734BBC5303@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5200
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(199004)(189003)(76176011)(11346002)(58126008)(99286004)(446003)(54906003)(81156014)(81166006)(8676002)(47776003)(1076003)(66066001)(6636002)(336012)(8746002)(476003)(6862004)(8936002)(25786009)(356004)(126002)(46406003)(7736002)(14454004)(22756006)(6246003)(229853002)(97756001)(3846002)(5024004)(63350400001)(33716001)(76130400001)(2906002)(6512007)(9686003)(70206006)(316002)(70586007)(33656002)(305945005)(6116002)(86362001)(36906005)(6506007)(26826003)(186003)(386003)(4326008)(63370400001)(478600001)(5660300002)(102836004)(23726003)(486006)(26005)(50466002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2601;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c07abc46-569a-4e12-133b-08d71c931d99
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0802MB2601; 
NoDisclaimer: True
X-Forefront-PRVS: 01244308DF
X-Microsoft-Antispam-Message-Info: H4XLtMeLLT/p2US3+5qTE/Mt+M6YWr8JfU1dzjUZ0vAmCHBMTkMq3fAMjAqSn0/tSXW3gQCaaLxMgjJdJoqcLfyjahg3y8M++0d6R9DwFk8TWsckT/xukrjnatNoHUSQ/YCeR45vKlHIE+wa1a6CWdvZLueZnTSvfhvYfxhyvGKGyn7CYtPc3RUhNxmu+SahuuFSeLEAoQB4EjXAB29UWPwINSnxr3XoF+3Up2XPDc0s9QNfDf44j/VM3haoOIusZJB+2pom2PhYMDHv/PojC/BpUXPKqpUTV6uw4z0qqe7zfEMa/Jdn4R+5jBRwE2hOSSb6bhRGONc0Tm5VI2pGS25+Jc4engeI4wROeiYcaX+/kMRX9L2sp0Dk1xsXknzWerVK7T6m1mXC1gn+nJ42SuRVpHPMxpM640qbeQ1fD+8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 06:31:00.8934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c856bd1-e5cb-4190-e379-08d71c932571
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2601
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQJVvsrYriM6vX5vpnDCPV+c6fnuOb1vgTSkgAP7bjI=;
 b=dbpdOFsv2BeQhRrT7NoH6jl8EV0Q7NeCGAx+IOV+pZrgf0F0xpoVRjCgVtgJ2LJQXYLrEw0Ll3O/96qHkUO/xeJZVYf/7Afz/TuWcB6nPZswR49D9XzzayaH93SRTZkYHKOHdqToGDzJPCz5dlpz7bzX/LeZTW2EB9QiA9Dzcgc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQJVvsrYriM6vX5vpnDCPV+c6fnuOb1vgTSkgAP7bjI=;
 b=dbpdOFsv2BeQhRrT7NoH6jl8EV0Q7NeCGAx+IOV+pZrgf0F0xpoVRjCgVtgJ2LJQXYLrEw0Ll3O/96qHkUO/xeJZVYf/7Afz/TuWcB6nPZswR49D9XzzayaH93SRTZkYHKOHdqToGDzJPCz5dlpz7bzX/LeZTW2EB9QiA9Dzcgc=
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
 Liviu Dudau <Liviu.Dudau@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDg6MDc6NTJBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gSW5pdGlhbGl6ZSBhbmQgZW5hYmxlIG91
dHB1dCBwb2xsaW5nIG9uIEtvbWVkYS4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IDEuIEVuYWJs
ZSB0aGUgcG9sbGluZyBiZWZvcmUgcmVnaXN0ZXJpbmcgdGhlIGRyaXZlcjsKPiAyLiBEaXNhYmxl
IHRoZSBwb2xsaW5nIGFmdGVyIHVucmVnaXN0ZXJpbmcgdGhlIGRyaXZlci4KPiAKPiBDaGFuZ2Vz
IHNpbmNlIHYyOgo+IDEuIElmIGRyaXZlciByZWdpc3RlciBmYWlsZWQsIGRpc2FibGUgdGhlIHBv
bGxpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8bG93cnkubGlAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuYwo+IGluZGV4IDQxOWE4YjAuLmQ1MGU3NWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IEBAIC0xNSw2ICsxNSw3
IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIuaD4KPiAgI2lu
Y2x1ZGUgPGRybS9kcm1faXJxLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgo+ICsj
aW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4KPiAgCj4gICNpbmNsdWRlICJrb21lZGFf
ZGV2LmgiCj4gICNpbmNsdWRlICJrb21lZGFfZnJhbWVidWZmZXIuaCIKPiBAQCAtMzE1LDYgKzMx
Niw4IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2goc3RydWN0IGtv
bWVkYV9kZXYgKm1kZXYpCj4gIAo+ICAJZHJtLT5pcnFfZW5hYmxlZCA9IHRydWU7Cj4gIAo+ICsJ
ZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KGRybSk7Cj4gKwo+ICAJZXJyID0gZHJtX2Rldl9yZWdp
c3Rlcihkcm0sIDApOwo+ICAJaWYgKGVycikKPiAgCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7
Cj4gQEAgLTMyMiw2ICszMjUsNyBAQCBzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtvbWVkYV9rbXNf
YXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAJcmV0dXJuIGttczsKPiAgCj4gIGNs
ZWFudXBfbW9kZV9jb25maWc6Cj4gKwlkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKPiAg
CWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiAgCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRy
bSk7Cj4gIAlrb21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7Cj4gQEAgLTMzOCw2
ICszNDIsNyBAQCB2b2lkIGtvbWVkYV9rbXNfZGV0YWNoKHN0cnVjdCBrb21lZGFfa21zX2RldiAq
a21zKQo+ICAJZHJtLT5pcnFfZW5hYmxlZCA9IGZhbHNlOwo+ICAJbWRldi0+ZnVuY3MtPmRpc2Fi
bGVfaXJxKG1kZXYpOwo+ICAJZHJtX2Rldl91bnJlZ2lzdGVyKGRybSk7Cj4gKwlkcm1fa21zX2hl
bHBlcl9wb2xsX2ZpbmkoZHJtKTsKPiAgCWNvbXBvbmVudF91bmJpbmRfYWxsKG1kZXYtPmRldiwg
ZHJtKTsKPiAgCWtvbWVkYV9rbXNfY2xlYW51cF9wcml2YXRlX29ianMoa21zKTsKPiAgCWRybV9t
b2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6
IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdA
YXJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
