Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7991E80
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 10:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073986E0D5;
	Mon, 19 Aug 2019 08:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40075.outbound.protection.outlook.com [40.107.4.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D7A89D8D;
 Mon, 19 Aug 2019 08:00:01 +0000 (UTC)
Received: from HE1PR0802CA0012.eurprd08.prod.outlook.com (2603:10a6:3:bd::22)
 by HE1PR0801MB1850.eurprd08.prod.outlook.com (2603:10a6:3:86::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 07:59:58 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by HE1PR0802CA0012.outlook.office365.com
 (2603:10a6:3:bd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 07:59:57 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 07:59:56 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Mon, 19 Aug 2019 07:59:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb23f0c33704468e
X-CR-MTA-TID: 64aa7808
Received: from 7264649a9b41.1 (cr-mta-lb-1.cr-mta-net [104.47.13.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 67DAA74E-4CB2-4263-9213-FB2776D90535.1; 
 Mon, 19 Aug 2019 07:59:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7264649a9b41.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 19 Aug 2019 07:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USfBY/6OjxquTnZTTkUtZ4F9CpZpRgMinq2kHsXYY9E5RRJzl19e4JDJXkmT+6GWE77klvcPBoSlb7GXu8+JHomF3ITJA7cup9XxkYtqlFX4C1WVUUEAam7EuMozbVXbWwY2BYfl1+5HiqSm1VYRvXx+fdT9yR1FY7AWlFjTaBHnayc7CYFWQOyvC/G0Ff9e3Airt0axMnKv0gIBcdUATspmhAfMiz0KqjmxzIOeDkHRSVB/A+BPrJ48E1LF2a7Ut/XTXXBNidoRtScTnxrSokMGmgSMJCKqPFXKwTrgpAjRPSh6QYMN4l+GPgU9aRMVg5wfJjeYfIcu5SAHCnH3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48X961cqwbYqp09t31l+h43nlEsBldp/4aD78QOS01c=;
 b=fVWnMah4hnSb/Cy1DQYStoL3Ib/AyvkLXUcAonGTbuwBOJ6skUvSB1ypOyHpe99KZByMFb1j+ITIVkDAzw4byx8Lw4u+jNLtoShWQMry8BcmMFuZmaJ0Rvo1vxEJNBwu6qTY5QCRD+wP911f2smvQ0uZGlg9+wsjvoLHI5+Q9g1RHqPN8+yoPZge/u1deKpq0+WO6qKh4bqy8bDT0mNZnmMSMc/nJnHdZheZCYkS4w6nnHknxMqe056KnZINRh/WxXn11g41Q7ZCgqFI9vLuckGlFowUGzM2sY7T5qzRwkCF+RaUBxFpRhuD3HUYcIRJYpQ1dsL5gt30bKpQ04Dxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5232.eurprd08.prod.outlook.com (10.255.27.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 07:59:48 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Mon, 19 Aug 2019
 07:59:48 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [v7,01/16] drm: Add Enhanced Gamma LUT precision structure
Thread-Topic: [v7,01/16] drm: Add Enhanced Gamma LUT precision structure
Thread-Index: AQHVUbtPRTG3vyo2gEmytrY5agQf4qb6tgeAgAdunoA=
Date: Mon, 19 Aug 2019 07:59:48 +0000
Message-ID: <20190819075941.GA10070@jamwan02-TSP300>
References: <1553804174-2651-2-git-send-email-uma.shankar@intel.com>
 <20190813094134.GA26945@jamwan02-TSP300>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821C2AEA@BGSMSX104.gar.corp.intel.com>
In-Reply-To: <E7C9878FBA1C6D42A1CA3F62AEB6945F821C2AEA@BGSMSX104.gar.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:2e::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b6bb8e59-f24b-4b53-a69f-08d7247b39dd
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5232; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5232:|HE1PR0801MB1850:
X-Microsoft-Antispam-PRVS: <HE1PR0801MB18503E2E0A33114628DD9AFFB3A80@HE1PR0801MB1850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0134AD334F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(189003)(199004)(13464003)(14454004)(6506007)(386003)(8936002)(52116002)(76176011)(2906002)(9686003)(6116002)(6512007)(3846002)(186003)(478600001)(71190400001)(71200400001)(26005)(102836004)(55236004)(6436002)(6486002)(86362001)(6246003)(4326008)(33656002)(53936002)(256004)(25786009)(81166006)(5660300002)(8676002)(81156014)(7736002)(229853002)(66476007)(66556008)(64756008)(11346002)(486006)(476003)(446003)(6916009)(66066001)(33716001)(1076003)(66946007)(305945005)(99286004)(66446008)(316002)(54906003)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5232;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: I1JMfK+j1X+jA9grqWwbDv3O7tXBaxIrruObGGZUo8tkAz2IPvXY/Rr2eSYsAVPyFd8IJmM5pKzU/jMb44LWO9F4XbidK/2BLVxQrzToU2mAvtTt9z1BrlgUtDDty7FK7HENpEIHyCmQGd1nSlrdhZ9OR0P2dPy8VQsWXZ22nqMwVlwzrl+r1ukK8glCwWGMMVqvnvOt07/bHTmeSq/E4gKXypNWjZFSgV4Jts3KSM2AfUY2I2RCpoK+EZgmtfdKCgFTPpdF9s+xIs6Ks0SSA+0u+Da4p+XVT+xvKph7k3wCf5a0xuGvK1iLJgyPtnk5nayh1kmOxlRhnLnHUnJ73q0UQmmL/rSBAH5ULs/pb+heoQMGIXGxq//hT/tXx0y+YlzdnitrrNwrtu0/X73CmZD8mPbOXwrGKSzyYrmTeOU=
x-ms-exchange-transport-forked: True
Content-ID: <449411F5F89B524A9723790A5C0058FF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5232
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(136003)(39860400002)(346002)(2980300002)(13464003)(189003)(199004)(2906002)(86362001)(476003)(46406003)(5660300002)(1076003)(81166006)(33656002)(81156014)(26005)(446003)(7736002)(8676002)(186003)(9686003)(6512007)(8936002)(8746002)(6116002)(70586007)(3846002)(66066001)(76176011)(47776003)(70206006)(450100002)(22756006)(6862004)(33716001)(23726003)(99286004)(26826003)(229853002)(76130400001)(6246003)(478600001)(14454004)(63350400001)(126002)(486006)(305945005)(63370400001)(102836004)(6506007)(316002)(386003)(58126008)(356004)(6486002)(97756001)(336012)(25786009)(11346002)(50466002)(4326008)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1850;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6ae91497-e421-4156-37fe-08d7247b350e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0801MB1850; 
NoDisclaimer: True
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Antispam-Message-Info: KTLR8dOIXtbgg2e0MPLZyXlyf9WaNAGxWxgcq/Agjo0ESXSSDGoDPJ0GaEpK6FUTreEecfT6622B6jeT05KRdK8bQv4QY+A+/DjfU8SExqf3REb5WV89c/489F4/WDbSrrkl5ocIeBCL8GboW4qfs/sB9V3xV3zXsbMbUlRPutuC2Lxex4I6icY1EylUB7ZrSEANpC3sH8rPtoD8LO0l3SVPlM24Mgv1ByZq1dN9PV3uRUA4wwlcY/1iTL8ClQVMI0GmFNt+p9dMxI55HYCeuFGHM5M0LAornHQ09uFkO48EyDnsvkYcqQzeiQrx6ynRaO5DiEnvYfQA5Kckuej/pGr/F3yXqB0UQg0J0plWUgyyz8ryPGNvG9pIaQBHJHBKZvxBcj24FfVl0u9WRETK14OBtL6aHU3Y9N6VsOV4KSo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 07:59:56.5908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bb8e59-f24b-4b53-a69f-08d7247b39dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48X961cqwbYqp09t31l+h43nlEsBldp/4aD78QOS01c=;
 b=EQr+OmLqW+I0eeGk+Xo6+038Hr65lZx549ErdkKlgg5vGZfb8WUynnPQobYghS2eulnKPfsesaQwVZTScLFh6oyLJsxdM2fjV3A2WbFLQ7L967L7/K7v1JcvcC1SxzJLJ9At/cSX5nsXS/Px161R2bojYPJf897e1WO6EA+bqck=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48X961cqwbYqp09t31l+h43nlEsBldp/4aD78QOS01c=;
 b=EQr+OmLqW+I0eeGk+Xo6+038Hr65lZx549ErdkKlgg5vGZfb8WUynnPQobYghS2eulnKPfsesaQwVZTScLFh6oyLJsxdM2fjV3A2WbFLQ7L967L7/K7v1JcvcC1SxzJLJ9At/cSX5nsXS/Px161R2bojYPJf897e1WO6EA+bqck=
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
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDI6Mjk6NTdQTSArMDAwMCwgU2hhbmthciwgVW1hIHdy
b3RlOgo+IAo+IAo+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID5Gcm9tOiBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSBbbWFpbHRvOmphbWVzLnFpYW4ud2FuZ0Bh
cm0uY29tXQo+ID5TZW50OiBUdWVzZGF5LCBBdWd1c3QgMTMsIDIwMTkgMzoxMiBQTQo+ID5Ubzog
U2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+Cj4gPkNjOiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTeXJq
YWxhLCBWaWxsZQo+ID48dmlsbGUuc3lyamFsYUBpbnRlbC5jb20+OyBlbWlsLmwudmVsaWtvdkBn
bWFpbC5jb207IExhbmtob3JzdCwgTWFhcnRlbgo+ID48bWFhcnRlbi5sYW5raG9yc3RAaW50ZWwu
Y29tPjsgbmQgPG5kQGFybS5jb20+Cj4gPlN1YmplY3Q6IFJlOiBbdjcsMDEvMTZdIGRybTogQWRk
IEVuaGFuY2VkIEdhbW1hIExVVCBwcmVjaXNpb24gc3RydWN0dXJlCj4gPgo+ID5PbiBGcmksIE1h
ciAyOSwgMjAxOSBhdCAwMTo0NTo1OUFNICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToKPiA+PiBF
eGlzdGluZyBMVVQgcHJlY2lzaW9uIHN0cnVjdHVyZSBpcyBoYXZpbmcgb25seSAxNiBiaXQgcHJl
Y2lzaW9uLiBUaGlzCj4gPj4gaXMgbm90IGVub3VnaCBmb3IgdXBjb21pbmcgZW5oYW5jZWQgaGFy
ZHdhcmVzIGFuZCBhZHZhbmNlIHVzZWNhc2VzCj4gPj4gbGlrZSBIRFIgcHJvY2Vzc2luZy4gSGVu
Y2UgYWRkZWQgYSBuZXcgc3RydWN0dXJlIHdpdGggMzIgYml0IHByZWNpc2lvbgo+ID4+IHZhbHVl
cy4gQWxzbyBhZGRlZCB0aGUgY29kZSwgZm9yIGV4dHJhY3RpbmcgdGhlIHNhbWUgZnJvbSB2YWx1
ZXMKPiA+PiBwYXNzZWQgZnJvbSB1c2Vyc3BhY2UuCj4gPj4KPiA+PiB2NDogUmViYXNlCj4gPj4K
PiA+PiB2NTogUmVsb2NhdGVkIHRoZSBoZWxwZXIgZnVuY3Rpb24gdG8gZHJtX2NvbG9yX21nbXQu
Yy4gRGVjbGFyZWQgdGhlCj4gPj4gc2FtZSBpbiBhIGhlYWRlciBmaWxlIChBbGV4YW5kcnUgR2hl
b3JnaGUpCj4gPj4KPiA+PiB2NjogRW5oYW5jZWQgZ2FtbWEgbHV0IHN0cnVjdHVyZSB0byB0YWtl
IFUzMi4zMiBmb3JtYXQgYXMgaW5wdXQuCj4gPj4gVGhpcyBpcyBuZWVkZWQgZm9yIEhEUiB1c2Vj
YXNlIHdoaWNoIHJlcXVpcmUgaGlnaGVyIHByZWNpc2lvbi4KPiA+Pgo+ID4+IHY3OiBBZGRyZXNz
ZWQgTWFhcnRlbidzIHJldmlldyBjb21tZW50cyBhbmQgZml4ZWQgdGhlIGNhbGN1bGF0aW9uLgo+
ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNv
bT4KPiA+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJ1IEdoZW9yZ2hlIDxhbGV4YW5kcnUtY29zbWlu
LmdoZW9yZ2hlQGFybS5jb20+Cj4gPgo+ID5IaSBVbWEKPiA+Cj4gPldoZW4gY2FuIHdlIG1lcmdl
IHRoZXNlIHBsYW5lIGNvbG9yLW1nbXQgc3VwcG9ydCBpbnRvIHVwc3RyZWFtID8KPiA+b3IgY2Fu
IHdlIG1lcmdlIHRoZSBEUk0tQ09SRSBwYXJ0IHBhdGNoZXMgZmlyc3RseT8KPiAKPiBIaSBKYW1l
cywKPiBJIHdpbGwgcmVmcmVzaCB0aGlzIHNlcmllcyBieSBlYXJseSBuZXh0IHdlZWsuIFdlIHdp
bGwgdHJ5IHRvIHByaW9yaXRpemUgdGhpcyBkZXZlbG9wbWVudCBhbmQgc3BlZWQKPiB1cCB3aXRo
IG1lcmdlLgoKPiBSZWdhcmRzLAo+IFVtYSBTaGFua2FyCgpoaSBVbWE6CnRoYW5rIHlvdSB2ZXJ5
IG11Y2gKCkJlc3QgUmVnYXJkcywKSmFtZXMKCj4gPnRoYW5rcwo+ID5qYW1lcwo+ID4KPiA+PiAt
LS0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgfCAyMCArKysrKysrKysr
KysrKysrKysrKwo+ID4+ICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8ICAxICsK
PiA+PiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICAgfCAxNSArKysrKysrKysrKysr
KysKPiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+PiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gPj4gaW5kZXggZDVkMzRkMC4uNzlmZjg3NCAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+ID4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gPj4gQEAgLTEyOCw2ICsxMjgsMjYg
QEAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90Cj4gPj4gdXNlcl9pbnB1
dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikgIH0KPiA+PiBFWFBPUlRfU1lNQk9MKGRybV9jb2xv
cl9sdXRfZXh0cmFjdCk7Cj4gPj4KPiA+PiArLyoKPiA+PiArICogQWRkZWQgdG8gYWNjb21tb2Rh
dGUgZW5oYW5jZWQgTFVUIHByZWNpc2lvbi4KPiA+PiArICogTWF4IExVVCBwcmVjaXNpb24gaXMg
MzIgYml0cy4KPiA+PiArICovCj4gPj4gK3U2NCBkcm1fY29sb3JfbHV0X2V4dHJhY3RfZXh0KHU2
NCB1c2VyX2lucHV0LCB1MzIgYml0X3ByZWNpc2lvbikgewo+ID4+ICsJdTY0IHZhbCA9IHVzZXJf
aW5wdXQgJiAweGZmZmZmZmZmOwo+ID4+ICsJdTMyIG1heCA9IDB4ZmZmZmZmZmYgPj4gKDMyIC0g
Yml0X3ByZWNpc2lvbik7Cj4gPj4gKwo+ID4+ICsJLyogUm91bmQgb25seSBpZiB3ZSdyZSBub3Qg
dXNpbmcgZnVsbCBwcmVjaXNpb24uICovCj4gPj4gKwlpZiAoYml0X3ByZWNpc2lvbiA8IDMyKSB7
Cj4gPj4gKwkJdmFsICs9IDFVTCA8PCAoMzIgLSBiaXRfcHJlY2lzaW9uIC0gMSk7Cj4gPj4gKwkJ
dmFsID4+PSAzMiAtIGJpdF9wcmVjaXNpb247Cj4gPj4gKwl9Cj4gPj4gKwo+ID4+ICsJcmV0dXJu
ICgodXNlcl9pbnB1dCAmIDB4ZmZmZmZmZmYwMDAwMDAwMCkgfAo+ID4+ICsJCWNsYW1wX3ZhbCh2
YWwsIDAsIG1heCkpOwo+ID4+ICt9Cj4gPj4gK0VYUE9SVF9TWU1CT0woZHJtX2NvbG9yX2x1dF9l
eHRyYWN0X2V4dCk7Cj4gPj4gKwo+ID4+ICAvKioKPiA+PiAgICogZHJtX2NydGNfZW5hYmxlX2Nv
bG9yX21nbXQgLSBlbmFibGUgY29sb3IgbWFuYWdlbWVudCBwcm9wZXJ0aWVzCj4gPj4gICAqIEBj
cnRjOiBEUk0gQ1JUQwo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdt
dC5oCj4gPj4gYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oIGluZGV4IGQxYzY2MmQuLmM5
ZDI3NDYgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ID4+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+PiBAQCAtMzAsNiArMzAsNyBA
QAo+ID4+ICBzdHJ1Y3QgZHJtX3BsYW5lOwo+ID4+Cj4gPj4gIHVpbnQzMl90IGRybV9jb2xvcl9s
dXRfZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdAo+ID4+IGJpdF9wcmVjaXNp
b24pOwo+ID4+ICt1NjQgZHJtX2NvbG9yX2x1dF9leHRyYWN0X2V4dCh1NjQgdXNlcl9pbnB1dCwg
dTMyIGJpdF9wcmVjaXNpb24pOwo+ID4+Cj4gPj4gIHZvaWQgZHJtX2NydGNfZW5hYmxlX2NvbG9y
X21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4+ICAJCQkJdWludCBkZWdhbW1hX2x1dF9z
aXplLAo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggYi9pbmNs
dWRlL3VhcGkvZHJtL2RybV9tb2RlLmgKPiA+PiBpbmRleCAwOWQ3Mjk2Li5jYTgxNDEwIDEwMDY0
NAo+ID4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAo+ID4+ICsrKyBiL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAo+ID4+IEBAIC02MjksNiArNjI5LDIxIEBAIHN0cnVjdCBk
cm1fY29sb3JfbHV0IHsKPiA+PiAgCV9fdTE2IHJlc2VydmVkOwo+ID4+ICB9Owo+ID4+Cj4gPj4g
Ky8qCj4gPj4gKyAqIENyZWF0aW5nIDY0IGJpdCBwYWxldHRlIGVudHJpZXMgZm9yIGJldHRlciBk
YXRhCj4gPj4gKyAqIHByZWNpc2lvbi4gVGhpcyB3aWxsIGJlIHJlcXVpcmVkIGZvciBIRFIgYW5k
Cj4gPj4gKyAqIHNpbWlsYXIgY29sb3IgcHJvY2Vzc2luZyB1c2VjYXNlcy4KPiA+PiArICovCj4g
Pj4gK3N0cnVjdCBkcm1fY29sb3JfbHV0X2V4dCB7Cj4gPj4gKwkvKgo+ID4+ICsJICogRGF0YSBp
cyBVMzIuMzIgZml4ZWQgcG9pbnQgZm9ybWF0Lgo+ID4+ICsJICovCj4gPj4gKwlfX3U2NCByZWQ7
Cj4gPj4gKwlfX3U2NCBncmVlbjsKPiA+PiArCV9fdTY0IGJsdWU7Cj4gPj4gKwlfX3U2NCByZXNl
cnZlZDsKPiA+PiArfTsKPiA+PiArCj4gPj4gICNkZWZpbmUgRFJNX01PREVfUEFHRV9GTElQX0VW
RU5UIDB4MDEgICNkZWZpbmUKPiA+PiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgMHgwMiAgI2Rl
ZmluZQo+ID4+IERSTV9NT0RFX1BBR0VfRkxJUF9UQVJHRVRfQUJTT0xVVEUgMHg0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
