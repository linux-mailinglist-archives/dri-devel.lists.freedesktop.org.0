Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AABDDBDEB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 08:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324986E111;
	Fri, 18 Oct 2019 06:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20077.outbound.protection.outlook.com [40.107.2.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F346E111
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 06:57:23 +0000 (UTC)
Received: from VI1PR08CA0264.eurprd08.prod.outlook.com (2603:10a6:803:dc::37)
 by AM0PR08MB4291.eurprd08.prod.outlook.com (2603:10a6:208:13b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Fri, 18 Oct
 2019 06:57:18 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by VI1PR08CA0264.outlook.office365.com
 (2603:10a6:803:dc::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 18 Oct 2019 06:57:17 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 06:57:17 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 18 Oct 2019 06:57:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc54e5edf7b0fa3a
X-CR-MTA-TID: 64aa7808
Received: from 4278e5fca78a.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.8.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02BA9805-DBCC-43BE-8BA1-A9B0A017F460.1; 
 Fri, 18 Oct 2019 06:57:09 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4278e5fca78a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 06:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLgQJY89eTmbjF+ib/LF9JQUEL6ihC8FelaNSLjyDniLoe7HYPRzIcWk0dSOd/4QXpIpHAipiWf4ecCy8KXvfvvZNvcqKchqkQmrGpFr/zAUQSk9ZC/K2KLYdcnCCeKzCOauN9hij5LLkmFfHk7ZSPL+NawKhaUKp+mnGo3OhwA+H+tsxloazMj4X9NxsMaKBeptD7WZt+RDmm7FI2dVxYzhbwiqgCxlx0OTV36OebBObBf3eZeozfbnU/y71QD4kh1FhfLg2GOTcUg+3LTAUD8TlD4UWZJRWaR9AkU/zB0EQOQvVHA+YcGezC5RYRxsNuJKpl7VZpFVe0zJwM1jWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPyEoTUlrU8QvEYqz8Tk32AJTLkpJosaPzdc17aMazU=;
 b=mBb/8b4hVGDQtII9A6eJHFd5xJkm/ZktPDFfGjxNUISwAkIjhoMFxDU4tb6vamBOfv8u+YTARMvb08VlUG7h9kkkQxYW5vuv+LLP/FPfNkPriommIsOGMc2WfP7X0aDK7h1G178tPHDM36SK3EdA9Ud15WOjapnmyoS+UgYg640L8vTLjkzrB4oUxm+w/RgM1tsmCKf8pfr6Bi1JtNTZYvIlS0G6Os5dM94sttSdQDBmAp1HrWRS4B2TzYxYneL1nB6MtVZtCikDKINrKUR1oqWuoDxp8F9ceEwdF5UoJzqVLAIBfwigkZkN8EX5+4GEa5FzCpN2uAteR10vBjT/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4640.eurprd08.prod.outlook.com (10.255.27.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 06:57:05 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.026; Fri, 18 Oct 2019
 06:57:05 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVfmX7+sBzYHhR8EiYyRUjNjETp6dddmWAgAAIg4CAALRsAIAAV3gAgAAhhoCAAAegAIAADuyAgAFCzIA=
Date: Fri, 18 Oct 2019 06:57:05 +0000
Message-ID: <20191018065657.GA19117@jamwan02-TSP300>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191017114137.GC25745@shell.armlinux.org.uk>
In-Reply-To: <20191017114137.GC25745@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:203:2e::13) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2c4572fe-696a-4862-f839-08d7539869e8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4640:|VE1PR08MB4640:|AM0PR08MB4291:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4291FA8A2F9863824F1F281EB36C0@AM0PR08MB4291.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(189003)(199004)(51444003)(6916009)(476003)(305945005)(6436002)(54906003)(6116002)(446003)(6306002)(11346002)(66066001)(66476007)(64756008)(66446008)(7736002)(66556008)(229853002)(2906002)(316002)(33656002)(186003)(81166006)(6486002)(9686003)(486006)(6512007)(81156014)(6506007)(386003)(58126008)(76176011)(14444005)(99286004)(256004)(66946007)(8936002)(966005)(6246003)(3846002)(52116002)(26005)(4326008)(14454004)(71200400001)(71190400001)(102836004)(5660300002)(8676002)(33716001)(25786009)(55236004)(1076003)(86362001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4640;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cilwhNXXYUgmymZUG40aeaPFJ9SksP8pZ/w61/L0l4hF+JhGrbuQ91XRMlMqdg2gJXngCOGqSKraKd6PfrD9/zAFFBPdKJtsRSSIqaAhLRT9MBFpaUIaLMXzrWBr2bopcpXsj1Bxzx7f9JBk9FL8KUQV90PMZVeE0Yx/u0JRzYmFuUBYgsE5owEr+Q1Vjsbd0Dff0Yen0xPkBTWUZUTwLkpOh1TR0waY7TX/6lGbEYTzA3lgrVHyHIIulrEX14U5gYv6fJA9fhVM/sATmC4gBdC5MYgBcvukT+T/opE15S+7zAKv9SLZ3JL3liFEvIhr1pliI6FKoqCZ5tlXWe95bZnTo+1UnjjUWLnmSad83jV3gkuw5MuWO0s7yQQZVrcX5jd1RhA45Wl5s1HjaqjeYs86ivYbIxJglrDIZQ4rHsYUMyuJolWNQh+s5wR/wtlfDFceJGzLLDD9bzQaNIwhLA==
Content-ID: <E3946259F4482D41BC696EE8D19DFF66@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4640
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(51444003)(446003)(8936002)(81156014)(102836004)(186003)(476003)(8676002)(99286004)(63350400001)(11346002)(86362001)(3846002)(23726003)(6116002)(70206006)(76176011)(386003)(6506007)(76130400001)(70586007)(25786009)(4326008)(6862004)(2906002)(8746002)(50466002)(46406003)(126002)(486006)(81166006)(33656002)(229853002)(54906003)(107886003)(6246003)(6306002)(966005)(9686003)(305945005)(6512007)(66066001)(7736002)(26005)(14444005)(356004)(97756001)(22756006)(478600001)(26826003)(336012)(5660300002)(6486002)(316002)(14454004)(47776003)(1076003)(58126008)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4291;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bdea8aa2-c049-4aac-8dfe-08d7539862ad
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwUSLhucer4YQIfVhTd7soV9sztcgTwji4QQY6hLtSk2bpokVS5cxbgmgOZKX1Kh6rksqGm3+ey45/SeZlpEzPuyKNKY1SkziYTmhMMLHGjDd4cEJAqzaU3POVfNAhrYIrpF6u17lTNFZzoNkgjb8/+8M3SEdaRG8Gy4GHiquOKsOA97LUcwYLLvW3EHxKAT4KLmUT7+6Z4K6Vy/T+zt6LS69gxUepMV9kjzmuTAbQdM7xw9vAsAI6/M5pu9RLxVCtVde40Gz0nv9AEkywxvIjQQT1nV29sFNrVE5aqgAlmxjVoZoMUOrPXV8Vz8bF9Czj9CAKFmogcZSYDF0eHOs8zoJJ9deV3qPZF+D+ZFTMj5WvtAE1RgMAcTfrUVKysN3zjhVMRZwbYu7TA8Gv7xuC1B0Z0uECg7lOFs62zDqpYb5i9tnX4OsluX3dmQw8zUeOeCGnb3qHoBkqLu4BPLhA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 06:57:17.2734 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4572fe-696a-4862-f839-08d7539869e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4291
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPyEoTUlrU8QvEYqz8Tk32AJTLkpJosaPzdc17aMazU=;
 b=ZXFEBkFJo+3tpZ2aVAeXjX/jS4jz+jsRGNKTL2jTtBTAo3ZxsheWBqVa5Y/ja3B3Wyjy9cXe+gZlSgm/Dc9WbD5jKMkMMvfz8+sL5oKEF5XyESUqebSahgzfLBnnoOyjbwcOKX8cXCELDKDHNeOjFS+ENDTVauvNhXNjQNH1R2k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPyEoTUlrU8QvEYqz8Tk32AJTLkpJosaPzdc17aMazU=;
 b=ZXFEBkFJo+3tpZ2aVAeXjX/jS4jz+jsRGNKTL2jTtBTAo3ZxsheWBqVa5Y/ja3B3Wyjy9cXe+gZlSgm/Dc9WbD5jKMkMMvfz8+sL5oKEF5XyESUqebSahgzfLBnnoOyjbwcOKX8cXCELDKDHNeOjFS+ENDTVauvNhXNjQNH1R2k=
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
Cc: nd <nd@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6NDE6MzdQTSArMDEwMCwgUnVzc2VsbCBLaW5nIC0g
QVJNIExpbnV4IGFkbWluIHdyb3RlOgo+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDEwOjQ4OjEy
QU0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBh
dCAxMDoyMTowM0FNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSB3cm90ZToKPiA+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDg6MjA6NTZBTSArMDAwMCwg
QnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAwMzow
Nzo1OUFNICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90
ZToKPiA+ID4gPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDA0OjIyOjA3UE0gKzAwMDAsIEJy
aWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJZiBKYW1lcyBpcyBz
dHJvbmdseSBhZ2FpbnN0IG1lcmdpbmcgdGhpcywgbWF5YmUgd2UganVzdCBzd2FwCj4gPiA+ID4g
PiA+IHdob2xlc2FsZSB0byBicmlkZ2U/IEJ1dCBmb3IgbWUsIHRoZSBwcmFnbWF0aWMgYXBwcm9h
Y2ggd291bGQgYmUgdGhpcwo+ID4gPiA+ID4gPiBzdG9wLWdhcC4KPiA+ID4gPiA+ID4KPiA+ID4g
PiA+IAo+ID4gPiA+ID4gVGhpcyBpcyBhIGdvb2QgaWRlYSwgYW5kIEkgdm90ZSArVUxPTkdfTUFY
IDopCj4gPiA+ID4gPiAKPiA+ID4gPiA+IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4IGRyaXZl
ciwgaXQgc3VwcG9ydHMgYnJpZGdlLiBzbyBzd2FwIHRoZQo+ID4gPiA+ID4gd2hvbGVzYWxlIHRv
IGJyaWdlIGlzIHBlcmZlY3QuIDopCj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBXZWxsLCBh
cyBNaWhhaWwgd3JvdGUsIGl0J3MgZGVmaW5pdGVseSBub3QgcGVyZmVjdC4KPiA+ID4gPiAKPiA+
ID4gPiBUb2RheSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBVIGRyaXZlciBzdGls
bCBsb2FkZWQsCj4gPiA+ID4gZXZlcnl0aGluZyB3aWxsIGJlIHVuYm91bmQgZ3JhY2VmdWxseS4K
PiA+ID4gPiAKPiA+ID4gPiBJZiB3ZSBzd2FwIHRvIGJyaWRnZSwgdGhlbiBybW1vZCdpbmcgdGRh
OTk4eCAob3IgYW55IG90aGVyIGJyaWRnZQo+ID4gPiA+IGRyaXZlciB0aGUgRFBVIGlzIHVzaW5n
KSB3aXRoIHRoZSBEUFUgZHJpdmVyIHN0aWxsIGxvYWRlZCB3aWxsIHJlc3VsdAo+ID4gPiA+IGlu
IGEgY3Jhc2guCj4gPiA+IAo+ID4gPiBJIGhhdmVuJ3QgcmVhZCB0aGUgYnJpZGdlIGNvZGUsIGJ1
dCBzZWVtcyB0aGlzIGlzIGEgYnVnIG9mIGRybV9icmlkZ2UsCj4gPiA+IHNpbmNlIGlmIHRoZSBi
cmlkZ2UgaXMgc3RpbGwgaW4gdXNpbmcgYnkgb3RoZXJzLCB0aGUgcm1tb2Qgc2hvdWxkIGZhaWwK
PiA+ID4gCj4gPiAKPiA+IENvcnJlY3QsIGJ1dCB0aGVyZSdzIG5vIGZpeCBmb3IgdGhhdCB0b2Rh
eS4gWW91IGNhbiBhbHNvIHRha2UgYSBsb29rCj4gPiBhdCB0aGUgdGhyZWFkIGxpbmtlZCBmcm9t
IE1paGFpbCdzIGNvdmVyIGxldHRlci4KPiA+IAo+ID4gPiBBbmQgcGVyc29uYWxseSBvcGluaW9u
LCBpZiB0aGUgYnJpZGdlIGRvZXNuJ3QgaGFuZGxlIHRoZSBkZXBlbmRlbmNlLgo+ID4gPiBmb3Ig
dXM6Cj4gPiA+IAo+ID4gPiAtIGFkZCBzdWNoIHN1cHBvcnQgdG8gYnJpZGdlCj4gPiAKPiA+IFRo
YXQgd291bGQgY2VydGFpbmx5IGJlIGhlbHBmdWwuIEkgZG9uJ3Qga25vdyBpZiB0aGVyZSdzIGNv
bnNlbnN1cyBvbgo+ID4gaG93IHRvIGRvIHRoYXQuCj4gPiAKPiA+ID4gICBvcgo+ID4gPiAtIGp1
c3QgZG8gdGhlIGluc21vZC9ybW1vZCBpbiBjb3JyZWN0IG9yZGVyLgo+ID4gPiAKPiA+ID4gPiBT
bywgdGhlcmUgcmVhbGx5IGFyZSBwcm9wZXIgYmVuZWZpdHMgdG8gc3RpY2tpbmcgd2l0aCB0aGUg
Y29tcG9uZW50Cj4gPiA+ID4gY29kZSBmb3IgdGRhOTk4eCwgd2hpY2ggaXMgd2h5IEknZCBsaWtl
IHRvIHVuZGVyc3RhbmQgd2h5IHlvdSdyZSBzbwo+ID4gPiA+IGFnYWluc3QgdGhpcyBwYXRjaD8K
PiA+ID4gPgo+ID4gPiAKPiA+ID4gVGhpcyBjaGFuZ2UgaGFuZGxlcyB0d28gZGlmZmVyZW50IGNv
bm5lY3RvcnMgaW4ga29tZWRhIGludGVybmFsbHksIGNvbXBhcmUKPiA+ID4gd2l0aCBvbmUgaW50
ZXJmYWNlLCBpdCBpbmNyZWFzZXMgdGhlIGNvbXBsZXhpdHksIG1vcmUgcmlzayBvZiBidWcgYW5k
IG1vcmUKPiA+ID4gY29zdCBvZiBtYWludGFpbmFuY2UuCj4gPiA+IAo+ID4gCj4gPiBXZWxsLCBp
dCdzIG9ubHkgYWJvdXQgaG93IHRvIGJpbmQgdGhlIGRyaXZlcnMgLSB0d28gZGlmZmVyZW50IG1l
dGhvZHMKPiA+IG9mIGJpbmRpbmcsIG5vdCB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMuIEkgd291
bGQgYXJndWUgdGhhdCBjYXJyeWluZwo+ID4gb3VyIG91dC1vZi10cmVlIHBhdGNoZXMgdG8gc3Vw
cG9ydCBib3RoIHBsYXRmb3JtcyBpcyBhIGxhcmdlcgo+ID4gbWFpbnRlbmFuY2UgYnVyZGVuLgo+
ID4gCj4gPiBIb25lc3RseSB0aGlzIGxvb2tzIGxpa2UgYSB3aW4td2luIHRvIG1lLiBXZSBnZXQg
dGhlIHN1cGVyaW9yIGFwcHJvYWNoCj4gPiB3aGVuIGl0cyBzdXBwb3J0ZWQsIGFuZCBzdGlsbCBn
ZXQgdG8gc3VwcG9ydCBicmlkZ2VzIHdoaWNoIGFyZSBtb3JlCj4gPiBjb21tb24uCj4gPiAKPiA+
IEFzL3doZW4gaW1wcm92ZW1lbnRzIGFyZSBtYWRlIHRvIHRoZSBicmlkZ2UgY29kZSB3ZSBjYW4g
cmVtb3ZlIHRoZQo+ID4gY29tcG9uZW50IGJpdHMgYW5kIG5vdCBsb3NlIGFueXRoaW5nLgo+IAo+
IFRoZXJlIHdhcyBhbiBpZGVhIGEgd2hpbGUgYmFjayBhYm91dCB1c2luZyB0aGUgZGV2aWNlIGxp
bmtzIGNvZGUgdG8KPiBzb2x2ZSB0aGUgYnJpZGdlIGlzc3VlIC0gYnV0IGF0IHRoZSB0aW1lIHRo
ZSBkZXZpY2UgbGlua3MgY29kZSB3YXNuJ3QKPiB1cCB0byB0aGUgam9iLiAgSSB0aGluayB0aGF0
J3MgYmVlbiByZXNvbHZlZCBub3csIGJ1dCBJIGhhdmVuJ3QgYmVlbgo+IGFibGUgdG8gY29uZmly
bSBpdC4gIEkgZGlkIHByb3Bvc2Ugc29tZSBwYXRjaGVzIGZvciBicmlkZ2UgYXQgdGhlCj4gdGlt
ZSBidXQgdGhleSBwcm9iYWJseSBuZWVkIHVwZGF0aW5nLgoKSGkgUnVzc2VsbDoKClRoYW5rIHlv
dSwgdGhhdCdzIGEgZ29vZCBuZXdzLgoKSGkgQnJpYW46CgpDYW4gdGhpcyBjb252aW5jZSB5b3Ug
dG8gZnVsbHkgc3dhcCB0byBicmlkZ2UgPwoKQWN0dWFsbHkgZXZlbiB0aGVyZSBpcyBubyBmaXgs
IHdlIHdvbid0IHJlYWwgZW5jb3VudGVyIHN1Y2ggcm1tb2QgcHJvYmxlbSwKc2luY2Ugd2UgYWx3
YXlzIGJ1aWxkIHRoZSBicmlkZ2UvdGRhOTk4IChieSBZKSBpbnRvIHRoZSBpbWFnZS4KClRoYW5r
cwpKYW1lcwo+IC0tIAo+IFJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgu
b3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwo+IEZUVEMgYnJvYWRiYW5kIGZvciAwLjhtaWxlIGxp
bmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBzIHVwCj4gQWNjb3Jk
aW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlNYnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
