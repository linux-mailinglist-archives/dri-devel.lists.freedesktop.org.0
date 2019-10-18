Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD6DBDC0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 08:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7EE6E10E;
	Fri, 18 Oct 2019 06:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140071.outbound.protection.outlook.com [40.107.14.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14646E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 06:39:19 +0000 (UTC)
Received: from VI1PR08CA0116.eurprd08.prod.outlook.com (2603:10a6:800:d4::18)
 by VI1PR08MB3871.eurprd08.prod.outlook.com (2603:10a6:803:c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Fri, 18 Oct
 2019 06:39:14 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by VI1PR08CA0116.outlook.office365.com
 (2603:10a6:800:d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 18 Oct 2019 06:39:14 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 06:39:11 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Fri, 18 Oct 2019 06:39:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c989cafdc21090c
X-CR-MTA-TID: 64aa7808
Received: from 788a2b172e8a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B99A076-E363-42E5-834E-1D73A5D76034.1; 
 Fri, 18 Oct 2019 06:39:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 788a2b172e8a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 06:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4Rh0z9bOo7CPDhPYaxazNMQjMU0QU1zeITCajUOrXWW4t2K21mFwAGzNAxaI7RJFtSw5fZse5jBhGcCbIdmYzmG17k77ye1O4i/8eTA5C63/4OXtud2q1t4vx2Uos6CtUSwuTz0AfTIbMWkwLYJrauTQmo5TGRxqjYCMMWLMawxptaZmxeip1auN7Wzasa/vF4P+xa15JASx90y6W2IbLx+U8kvkfOg/nFkslHHFCSOgXSUulhFk8O3JcmOAxanxtWtYA6bsjyZrLtim+Wygz0QdH4BEPsYOoLc7PlEGbez7W3zZJUEv91XnhkCjn1MkDz1/yQwVGvcBXWX1LA40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deovY0igDeil9fRvR2ecRNrPldYF/S5H5KUBG8sFtx8=;
 b=QT6RcJlaBt6iJY9hsOX+bJMLhVS2LvHd7kicSFCWakZqib8ocDIajZBWMik4xWLK+tbqtqKAR+tSrNVaWQPuGeK8BGZ/Igd7g88V+6nlgUXlGqI/xw9jNj335krNx8URa2GGDxxWzDsBCriC5UG2crBhxzvAy2pl+DZ/Q3GoMgfCZDWqVwPUwLLKy4ZICaF0hWKYZDApTdAkPoVJx/WU16jvLEUOL6/r+p9F/M1zIu96ns4BWFtVZQddU0WdzAzde3QRzoeCVFInP6RUtMK3sDWtW2Khr8ZdKzUETDzmTa/y1WxaiVomYrSVgm/xA5e2qOJ6hOUSwJQ0NmSQhEp7Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4637.eurprd08.prod.outlook.com (10.255.114.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 06:38:59 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.026; Fri, 18 Oct 2019
 06:38:59 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVfmX7+sBzYHhR8EiYyRUjNjETp6dddmWAgAAIg4CAALRsAIAAV3gAgAAhhoCAAAegAIABTKqA
Date: Fri, 18 Oct 2019 06:38:59 +0000
Message-ID: <20191018063851.GA18702@jamwan02-TSP300>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300> <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bda356fb-54e6-4cbf-2d97-08d75395e355
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4637:|VE1PR08MB4637:|VI1PR08MB3871:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3871681C6A62F7DA112AEB8FB36C0@VI1PR08MB3871.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(199004)(189003)(26005)(66066001)(2906002)(7736002)(8676002)(6862004)(4326008)(478600001)(256004)(71190400001)(71200400001)(66946007)(54906003)(9686003)(6512007)(6636002)(14444005)(229853002)(66556008)(66476007)(66446008)(64756008)(386003)(55236004)(5660300002)(86362001)(102836004)(6506007)(25786009)(186003)(11346002)(446003)(14454004)(76176011)(81156014)(486006)(33656002)(6486002)(1076003)(8936002)(3846002)(316002)(33716001)(6246003)(305945005)(58126008)(81166006)(52116002)(476003)(6116002)(99286004)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4637;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mo+P8P+FR6ADw2qI5/d3qNSHHTIQkurKYgLLStVPsJxsjTnXENiIOvaZBEvvRnJ6XItx5m5I11lQjgoSJJhb0+fPmH07t/WO5Gpa/qlN+0zooQjJXd+a558FflkNxgnI2IJ6+S6VKLyHrIelj06yJxuaQAWOMcHRPvh6EiA/RehxtzG3t+RYJxNlJzR7nzKMIIytsiQfclGi45bsTBfw8QJbblwsO0HvJbrtSy2V6cUZRHYFw2L27ZjNpRUU6dZlGbIuOeejOeEffeEAgVbxXv5JxrGAfPBoA4XzoQfQXn0p+VRyHUZgOxHdCAAnmjDZ1C8zdHuqmPyK0shms+kNo1fRs4GbqWapX2wPm6X1UQB8O8KuBGlXmxlGJFVbGnnhgIPeVdBgBaUPmzxJfS/nhe6T8cClEKupL/Pl211hhmE=
Content-ID: <534A4133140A7F41969D6124426D8D8A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4637
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(346002)(39860400002)(396003)(376002)(189003)(199004)(6862004)(33716001)(305945005)(107886003)(11346002)(476003)(126002)(446003)(76176011)(23726003)(486006)(6506007)(386003)(1076003)(14444005)(99286004)(102836004)(97756001)(7736002)(4326008)(336012)(3846002)(6116002)(58126008)(54906003)(26005)(316002)(26826003)(6246003)(6486002)(63350400001)(47776003)(66066001)(9686003)(36906005)(186003)(6512007)(86362001)(5660300002)(76130400001)(22756006)(33656002)(70586007)(70206006)(6636002)(478600001)(2906002)(229853002)(8676002)(356004)(25786009)(14454004)(46406003)(50466002)(8936002)(81156014)(8746002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3871;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 414fd9d1-46eb-4c6f-2918-08d75395db44
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzHl/+lR9sBlQ3Iwk27VcokdfF+slqlrTeu8RMnhUtiFwJ4zBYqSRAZOkvrHE6gIZjufr7el4M4hG5QeuzOrNwxk2VUF2is4FrkX4Vbq9bAfwSYkpys2nfZIF3l058aGFiCWhwU5sDork8j+HmCezvqvRiz4PNyA2d7av8i4q3EzrNlCya+upup8LqHPTuzsemwFIrZZJwD5zRwZfIyfdCegRjfG53YtrSjSapaUP3txJfL5KJD9ur3PFHrk2qR1rAJYhK3dexpPsY8cSx6GUOlgle+FSafqw/e5dmu/vyrGXfRQPuhlPhfyNE+FSxr+bMCFaXbb2ulZPW1ZMZIgPeAsbkSPW/Z8MQYvvuLKHpYlH+Xon7gnykCE2R8wf8CQICNCLCax9xuYpdfYsE1y97dbClyRKma6CZ9P3ZNvijE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 06:39:11.0384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bda356fb-54e6-4cbf-2d97-08d75395e355
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deovY0igDeil9fRvR2ecRNrPldYF/S5H5KUBG8sFtx8=;
 b=xBmbfXXaTXaZFtWgGvSc06WvtqMYf1gz2CKPIVupo+vTyr9zj5LkcFy2Ti7pIuVmmvtY3Il6aeobiiXBYrUojMiArkc9jp08fzmpkD6TSiCph0oJP15R0qqQq85P860R0RiuRWKWfrbjPYhVL0MZcaSrSPhpHEdixxB7oC6YUeY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deovY0igDeil9fRvR2ecRNrPldYF/S5H5KUBG8sFtx8=;
 b=xBmbfXXaTXaZFtWgGvSc06WvtqMYf1gz2CKPIVupo+vTyr9zj5LkcFy2Ti7pIuVmmvtY3Il6aeobiiXBYrUojMiArkc9jp08fzmpkD6TSiCph0oJP15R0qqQq85P860R0RiuRWKWfrbjPYhVL0MZcaSrSPhpHEdixxB7oC6YUeY=
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
 Liviu Dudau <Liviu.Dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6NDg6MTJBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAxMDoyMTowM0FNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIFRodSwgT2N0IDE3
LCAyMDE5IGF0IDA4OjIwOjU2QU0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+IE9u
IFRodSwgT2N0IDE3LCAyMDE5IGF0IDAzOjA3OjU5QU0gKzAwMDAsIGphbWVzIHFpYW4gd2FuZyAo
QXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5
IGF0IDA0OjIyOjA3UE0gKzAwMDAsIEJyaWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+ID4gPiAKPiA+
ID4gPiA+IElmIEphbWVzIGlzIHN0cm9uZ2x5IGFnYWluc3QgbWVyZ2luZyB0aGlzLCBtYXliZSB3
ZSBqdXN0IHN3YXAKPiA+ID4gPiA+IHdob2xlc2FsZSB0byBicmlkZ2U/IEJ1dCBmb3IgbWUsIHRo
ZSBwcmFnbWF0aWMgYXBwcm9hY2ggd291bGQgYmUgdGhpcwo+ID4gPiA+ID4gc3RvcC1nYXAuCj4g
PiA+ID4gPgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgYSBnb29kIGlkZWEsIGFuZCBJIHZvdGUg
K1VMT05HX01BWCA6KQo+ID4gPiA+IAo+ID4gPiA+IGFuZCBJIGFsc28gY2hlY2tlZCB0ZGE5OTh4
IGRyaXZlciwgaXQgc3VwcG9ydHMgYnJpZGdlLiBzbyBzd2FwIHRoZQo+ID4gPiA+IHdob2xlc2Fs
ZSB0byBicmlnZSBpcyBwZXJmZWN0LiA6KQo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gV2VsbCwgYXMg
TWloYWlsIHdyb3RlLCBpdCdzIGRlZmluaXRlbHkgbm90IHBlcmZlY3QuCj4gPiA+IAo+ID4gPiBU
b2RheSwgaWYgeW91IHJtbW9kIHRkYTk5OHggd2l0aCB0aGUgRFBVIGRyaXZlciBzdGlsbCBsb2Fk
ZWQsCj4gPiA+IGV2ZXJ5dGhpbmcgd2lsbCBiZSB1bmJvdW5kIGdyYWNlZnVsbHkuCj4gPiA+IAo+
ID4gPiBJZiB3ZSBzd2FwIHRvIGJyaWRnZSwgdGhlbiBybW1vZCdpbmcgdGRhOTk4eCAob3IgYW55
IG90aGVyIGJyaWRnZQo+ID4gPiBkcml2ZXIgdGhlIERQVSBpcyB1c2luZykgd2l0aCB0aGUgRFBV
IGRyaXZlciBzdGlsbCBsb2FkZWQgd2lsbCByZXN1bHQKPiA+ID4gaW4gYSBjcmFzaC4KPiA+IAo+
ID4gSSBoYXZlbid0IHJlYWQgdGhlIGJyaWRnZSBjb2RlLCBidXQgc2VlbXMgdGhpcyBpcyBhIGJ1
ZyBvZiBkcm1fYnJpZGdlLAo+ID4gc2luY2UgaWYgdGhlIGJyaWRnZSBpcyBzdGlsbCBpbiB1c2lu
ZyBieSBvdGhlcnMsIHRoZSBybW1vZCBzaG91bGQgZmFpbAo+ID4gCj4gCj4gQ29ycmVjdCwgYnV0
IHRoZXJlJ3Mgbm8gZml4IGZvciB0aGF0IHRvZGF5LiBZb3UgY2FuIGFsc28gdGFrZSBhIGxvb2sK
PiBhdCB0aGUgdGhyZWFkIGxpbmtlZCBmcm9tIE1paGFpbCdzIGNvdmVyIGxldHRlci4KPiAKPiA+
IEFuZCBwZXJzb25hbGx5IG9waW5pb24sIGlmIHRoZSBicmlkZ2UgZG9lc24ndCBoYW5kbGUgdGhl
IGRlcGVuZGVuY2UuCj4gPiBmb3IgdXM6Cj4gPiAKPiA+IC0gYWRkIHN1Y2ggc3VwcG9ydCB0byBi
cmlkZ2UKPiAKPiBUaGF0IHdvdWxkIGNlcnRhaW5seSBiZSBoZWxwZnVsLiBJIGRvbid0IGtub3cg
aWYgdGhlcmUncyBjb25zZW5zdXMgb24KPiBob3cgdG8gZG8gdGhhdC4KPiAKPiA+ICAgb3IKPiA+
IC0ganVzdCBkbyB0aGUgaW5zbW9kL3JtbW9kIGluIGNvcnJlY3Qgb3JkZXIuCj4gPiAKPiA+ID4g
U28sIHRoZXJlIHJlYWxseSBhcmUgcHJvcGVyIGJlbmVmaXRzIHRvIHN0aWNraW5nIHdpdGggdGhl
IGNvbXBvbmVudAo+ID4gPiBjb2RlIGZvciB0ZGE5OTh4LCB3aGljaCBpcyB3aHkgSSdkIGxpa2Ug
dG8gdW5kZXJzdGFuZCB3aHkgeW91J3JlIHNvCj4gPiA+IGFnYWluc3QgdGhpcyBwYXRjaD8KPiA+
ID4KPiA+IAo+ID4gVGhpcyBjaGFuZ2UgaGFuZGxlcyB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMg
aW4ga29tZWRhIGludGVybmFsbHksIGNvbXBhcmUKPiA+IHdpdGggb25lIGludGVyZmFjZSwgaXQg
aW5jcmVhc2VzIHRoZSBjb21wbGV4aXR5LCBtb3JlIHJpc2sgb2YgYnVnIGFuZCBtb3JlCj4gPiBj
b3N0IG9mIG1haW50YWluYW5jZS4KPiA+IAo+IAo+IFdlbGwsIGl0J3Mgb25seSBhYm91dCBob3cg
dG8gYmluZCB0aGUgZHJpdmVycyAtIHR3byBkaWZmZXJlbnQgbWV0aG9kcwo+IG9mIGJpbmRpbmcs
IG5vdCB0d28gZGlmZmVyZW50IGNvbm5lY3RvcnMuIEkgd291bGQgYXJndWUgdGhhdCBjYXJyeWlu
Zwo+IG91ciBvdXQtb2YtdHJlZSBwYXRjaGVzIHRvIHN1cHBvcnQgYm90aCBwbGF0Zm9ybXMgaXMg
YSBsYXJnZXIKPiBtYWludGVuYW5jZSBidXJkZW4uCj4gCj4gSG9uZXN0bHkgdGhpcyBsb29rcyBs
aWtlIGEgd2luLXdpbiB0byBtZS4gV2UgZ2V0IHRoZSBzdXBlcmlvciBhcHByb2FjaAo+IHdoZW4g
aXRzIHN1cHBvcnRlZCwgYW5kIHN0aWxsIGdldCB0byBzdXBwb3J0IGJyaWRnZXMgd2hpY2ggYXJl
IG1vcmUKPiBjb21tb24uCj4KCk15IGNvbnNpZGVyYXRpb24gaXM6IGlmIHdlIHN1cHBvcnQgYm90
aCBsaW5rIG1ldGhvZHMsIHdlIG1heSBzdWZmZXJpbmcKCi0gMS4gYnJpZGdlIHJlZmVyZW5jZSBj
bnQgcHJvYmxlbQotIDIuIG1haW50YW5jZSB0d28gbGluayBtZXRob2RzLgoKdGhlIDEpIHNlZW1z
IHVuYXZvaWRhYmxlLCBzbyBzd2FwIGFsbCB0byBicmlkYWdlIGF0IGxlYXN0IGNhbiBhdm9pZAp0
aGUgcGFpbiBvZiAyKS4gdGhhdCdzIHdoeSBJIHRob3VnaHQgeW91ciBpZGVhICJzd2FwIGFsbCB0
byBicmlkYWdlIgppcyBnb29kLgoKVGhhbmtzCkphbWVzLgoKPiBBcy93aGVuIGltcHJvdmVtZW50
cyBhcmUgbWFkZSB0byB0aGUgYnJpZGdlIGNvZGUgd2UgY2FuIHJlbW92ZSB0aGUKPiBjb21wb25l
bnQgYml0cyBhbmQgbm90IGxvc2UgYW55dGhpbmcuCj4gCj4gPiBTbyBteSBzdWdnZXN0aW9uIGlz
IGtlZXBpbmcgb24gb25lIHNpbmdsZSBpbnRlcmZhY2UgaW4ga29tZWRhLCBubwo+ID4gbWF0dGVy
IGl0IGlzIGJyaWRnZSBvciBjb21wb25lbnQsIGJ1dCBJJ2QgbGlrZSBpdCBvbmx5IG9uZSwgYnV0
IG5vdAo+ID4gdGhlbSBib3RoIGluIGtvbWVkYS4KPiAKPiBJZiB3ZSBjYW4gcHV0IHRoZSBlZmZv
cnQgaW50byBmaXhpbmcgYnJpZGdlcyB0aGVuIEkgZ3Vlc3MgdGhhdCdzIHRoZQo+IGJlc3QgYXBw
cm9hY2ggZm9yIGV2ZXJ5b25lIDotKSBNaWdodCBub3QgYmUgZWFzeSB0aG91Z2ghCj4gCj4gLUJy
aWFuCj4gCj4gPiAKPiA+IFRoYW5rcwo+ID4gSmFtZXMKPiA+IAo+ID4gPiBUaGFua3MsCj4gPiA+
IC1CcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
