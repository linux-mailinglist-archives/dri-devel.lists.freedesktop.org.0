Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0542CCF6E0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 12:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B49D6E78E;
	Tue,  8 Oct 2019 10:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30061.outbound.protection.outlook.com [40.107.3.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8A6E78E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 10:18:25 +0000 (UTC)
Received: from DB7PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:5:16::48) by
 AM5PR0802MB2385.eurprd08.prod.outlook.com (2603:10a6:203:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Tue, 8 Oct
 2019 10:18:19 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by DB7PR08CA0035.outlook.office365.com
 (2603:10a6:5:16::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Tue, 8 Oct 2019 10:18:19 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 10:18:18 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Tue, 08 Oct 2019 10:18:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 347e7d9f291ccd66
X-CR-MTA-TID: 64aa7808
Received: from 0818bbc51657.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74511A95-94BF-4203-8338-DF13D8904014.1; 
 Tue, 08 Oct 2019 10:18:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0818bbc51657.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2019 10:18:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIX2P0cIPH/Yw5A2Ry8Syap1gmJF8lRmlg0rwBOne1+wqskdkITkcjgGZv8X+SQffKKlgeXXJhK6TNO0M/zPsoycp5exsa481YA4MK9ZWiF/+43KHeRP+WZcepUT16oKxT2aUzSUnQ2AYDZMuBPfTKKF5U15NUi1oU2EJsHOOdW1w3LYDR900O+d3rwDfvCL8Mh4bOTy+zLzXYLn6YjsPueOSyFk4Uuzdr1oybt+BsvykQvOINqrCfWY3fKpFJJUHzghQ/m2RqQfgJHGd091O95MNKr2XbLa3lCAE/eywugvT+ZJQEgGy44hcTJeGxnf8zGVlllyHlPkpT3DVBfByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKyK2cIjC/c1xSS4RGBXVVfiCslGQ3VVEudPca/f9O8=;
 b=e9XIFV60MQ41bTRDWWr64BY3DK1S4a5E0SP3d/qx3VwLtZn2k6Zs84b40qeFhMPmmdSCdBPpNjxijZQAAZcxHcWsJPL9ZGm+U40O5YD9zlR02af59BWrOfBWbJswbyiC15HTuiDuQsn7iUrIqbYj3j0NsShNpLEgbXvti4G1C4KYhuFHbWqHPkWWFELah1AgH3Kf7D+gZg1szLig17k+FAHCdDxiHMzoIKU7BxGCvbrtKLy9SLGJJPMMWcNfCyPhDbRSVxB4T4sREZeM3BdflWae9oQIDSgOyJPE5JxVCwpDCktifJWcpa7xWJ6wzW3R08MZQMA6TTR9h3DL8sp3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3742.eurprd08.prod.outlook.com (20.178.15.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 10:18:06 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 10:18:06 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVfblD7I+ubO1huUCp0qQz7Z0Q4adQe+uAgAAL8gA=
Date: Tue, 8 Oct 2019 10:18:06 +0000
Message-ID: <20191008101758.GA16398@lowli01-ThinkStation-P300>
References: <20191008091734.19509-1-lowry.li@arm.com>
 <3337512.00vBK9FLud@e123338-lin.cambridge.arm.com>
In-Reply-To: <3337512.00vBK9FLud@e123338-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e3e9afcc-d22d-417d-b74b-08d74bd8d68c
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3742:|VI1PR08MB3742:|AM5PR0802MB2385:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB23859BBD74716C291FBC2B969F9A0@AM5PR0802MB2385.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:397;OLM:397;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(199004)(189003)(446003)(66066001)(256004)(486006)(33716001)(476003)(11346002)(305945005)(5660300002)(1076003)(7736002)(6116002)(3846002)(14444005)(33656002)(2906002)(54906003)(58126008)(316002)(86362001)(71190400001)(25786009)(71200400001)(52116002)(186003)(6636002)(102836004)(99286004)(26005)(55236004)(6862004)(229853002)(6486002)(478600001)(14454004)(6506007)(386003)(6436002)(76176011)(6512007)(9686003)(4326008)(81156014)(81166006)(8936002)(66446008)(64756008)(66556008)(66476007)(66946007)(8676002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3742;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /wVmh40GSRwTx58HHYEpIXmV5dm7AJGADiTDuBUIcMbz2lxNMF09ACVq8DgjpRC/lrsRTbgtuygjE6oY6QFd05Q/6rHSFNOzopkpCRXqzrxYoeG6HCVE9RELK1eupxMQg1wEI/k6Hqmno1lQog2kxkiWyaUiJw1qZ4R2ZPnFvmjMvBxMFZGnnDojl9vzl85LR+HMtRcoy8GCAvcyQgZzORLU1XY1Fo8wvCBqrGiAwg3mXQp5ZozIw1h2d7Tg5LriSK4LiScDU+IBeOxi9O7C/BgaVJ1xfaZtm4yn83Kh5vvvSkBpj81thnV7Oa1PW0ya4cB3ofqPgwks8+Nee4OE9klHKKe4nwG93qjwXFlINsR25aRaukhJ6XBgdBMu61gAq4waiyZnRFyr+jUDP34UjvrZ89MCiWFMiNstGXMEZao=
Content-ID: <974A287278A50447A47EE08185EBE286@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3742
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(136003)(376002)(39860400002)(396003)(199004)(189003)(36906005)(66066001)(4326008)(76130400001)(5660300002)(70586007)(99286004)(54906003)(316002)(58126008)(70206006)(6246003)(14444005)(9686003)(6512007)(33656002)(6116002)(3846002)(305945005)(23726003)(7736002)(126002)(6486002)(86362001)(2906002)(6862004)(229853002)(6636002)(22756006)(50466002)(336012)(47776003)(26826003)(63350400001)(476003)(486006)(14454004)(356004)(446003)(11346002)(1076003)(478600001)(97756001)(25786009)(33716001)(8936002)(8746002)(81166006)(81156014)(6506007)(386003)(26005)(76176011)(8676002)(186003)(102836004)(46406003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2385;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d0947822-b81a-4330-edac-08d74bd8cf9e
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/KtsyBkQ7AI9HeCZ8oqDIRxpMoT5c6zKvASf751kVHeKnX+SrGDHgNqDwsa3O2XmjC0wY8GJG1HyNivAW00FSt0ykF7ELCU9DerwY3ab1SnEcx7im/5z51yjwlu9L0u+fGZzMKp8ZGyErCh4dE0djvT5Pj1Izhm7a6hz4B2J5gNH63ND1VSl4eVnXrG+grnC68yRqtKsbYyLpqh/6Doky1ayPm0SSJSUZnO9mUgInMVbe8U8KEqWo1CTyi9sWHA/NeKJgGF/ympkN1G/3sVZuNTBPT9/KHs5kLCdLRHyTP02xmiyvJVdBJn2kRwtOPadUZhAH+HHztgp4eecc0tlXzVESVQnHHhweedO8N/eZMld9bajGkG4S5bPUGDijgnmtwTv0PdcAJfjdfkAvyVUSKtK024/Ugdb+DWo4O8HFE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 10:18:18.0189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e9afcc-d22d-417d-b74b-08d74bd8d68c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2385
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKyK2cIjC/c1xSS4RGBXVVfiCslGQ3VVEudPca/f9O8=;
 b=AEYMnCm9TyOjbleVl+NGZtef0pmhL9TDYUUrjcjrhg3NI91xLW5kFMebWUntviQANeBEjS8jjrYyxQBnl0wLgG/q/2PBSxRKgqe0u6VDAduOIB1dp0A2gotUfiJZ1lBrTyzynwc/P9Jb8NZpos5uv6orUzqc/d84vAgnWQ++bgs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKyK2cIjC/c1xSS4RGBXVVfiCslGQ3VVEudPca/f9O8=;
 b=AEYMnCm9TyOjbleVl+NGZtef0pmhL9TDYUUrjcjrhg3NI91xLW5kFMebWUntviQANeBEjS8jjrYyxQBnl0wLgG/q/2PBSxRKgqe0u6VDAduOIB1dp0A2gotUfiJZ1lBrTyzynwc/P9Jb8NZpos5uv6orUzqc/d84vAgnWQ++bgs=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWloYWlsLApPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwOTozNToxNUFNICswMDAwLCBNaWhh
aWwgQXRhbmFzc292IHdyb3RlOgo+IEhpIExvd3J5LAo+IAo+IE9uIFR1ZXNkYXksIDggT2N0b2Jl
ciAyMDE5IDEwOjE3OjUyIEJTVCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3Rl
Ogo+ID4gU2V0IGNvbG9yX2RlcHRoIGFjY29yZGluZyB0byBjb25uZWN0b3ItPmJwYy4KPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnku
bGlAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9j
b21wb25lbnQuYyAgICB8ICAxICsKPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NydGMuYyAgfCAyMCArKysrKysrKysrKysrKysrKysrCj4gPiAgLi4uL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDIgKysKPiA+ICAuLi4vZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMSArCj4gPiAgLi4uL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMTkgKysrKysrKysrKysrKysr
KysrCj4gPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwg
IDQgKysrKwo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jCj4gPiBpbmRleCBjM2QyOWMwYjA1MWIuLjI3Y2RiMDM1NzNjMSAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25l
bnQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcx
X2NvbXBvbmVudC5jCj4gPiBAQCAtOTUxLDYgKzk1MSw3IEBAIHN0YXRpYyB2b2lkIGQ3MV9pbXBy
b2NfdXBkYXRlKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLAo+ID4gIAkJCSAgICAgICB0b19k
NzFfaW5wdXRfaWQoc3RhdGUsIGluZGV4KSk7Cj4gPiAgCj4gPiAgCW1hbGlkcF93cml0ZTMyKHJl
ZywgQkxLX1NJWkUsIEhWX1NJWkUoc3QtPmhzaXplLCBzdC0+dnNpemUpKTsKPiA+ICsJbWFsaWRw
X3dyaXRlMzIocmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7Cj4gPiAgfQo+ID4gIAo+
ID4gIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfZHVtcChzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAq
Yywgc3RydWN0IHNlcV9maWxlICpzZikKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiA+IGluZGV4IDc1MjYzZDhjZDBiZC4uYmFhOTg2
YjcwODc2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY3J0Yy5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMKPiA+IEBAIC0xNyw2ICsxNywyNiBAQAo+ID4gICNpbmNsdWRlICJr
b21lZGFfZGV2LmgiCj4gPiAgI2luY2x1ZGUgImtvbWVkYV9rbXMuaCIKPiA+ICAKPiA+ICt2b2lk
IGtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRj
X3N0LAo+ID4gKwkJCQkgIHUzMiAqY29sb3JfZGVwdGhzKQo+ID4gK3sKPiA+ICsJc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm47Cj4gPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25u
X3N0Owo+ID4gKwlpbnQgaSwgbWluX2JwYyA9IDMxLCBjb25uX2JwYyA9IDA7Cj4gPiArCj4gPiAr
CWZvcl9lYWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUoY3J0Y19zdC0+c3RhdGUsIGNvbm4sIGNv
bm5fc3QsIGkpIHsKPiA+ICsJCWlmIChjb25uX3N0LT5jcnRjICE9IGNydGNfc3QtPmNydGMpCj4g
PiArCQkJY29udGludWU7Cj4gPiArCj4gPiArCQljb25uX2JwYyA9IGNvbm4tPmRpc3BsYXlfaW5m
by5icGMgPyBjb25uLT5kaXNwbGF5X2luZm8uYnBjIDogODsKPiA+ICsKPiA+ICsJCWlmIChjb25u
X2JwYyA8IG1pbl9icGMpCj4gPiArCQkJbWluX2JwYyA9IGNvbm5fYnBjOwo+IFNvbWV0aGluZyBk
b2Vzbid0IGFkZCB1cCBoZXJlLiBtaW5fYnBjIGlzIGVmZmVjdGl2ZWx5IHNldCBidXQgbm90IHVz
ZWQuClRoYW5rcyBhIGxvdCBmb3IgdGhlIGNvcnJlY3Rpb24uIFdlJ2QgdXNlIG1pbl9icGMgdG8g
Z2V0IGNvbG9yX2RlcHRocwpiaXRtYXNrLiBXaWxsIGNvcnJlY3QgdGhpcy4KPiA+ICsJfQo+ID4g
Kwo+ID4gKwkqY29sb3JfZGVwdGhzID0gR0VOTUFTSyhjb25uX2JwYywgMCk7Cj4gPiArfQo+ID4g
Kwo+ID4gIHN0YXRpYyB2b2lkIGtvbWVkYV9jcnRjX3VwZGF0ZV9jbG9ja19yYXRpbyhzdHJ1Y3Qg
a29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KQo+ID4gIHsKPiA+ICAJdTY0IHB4bGNsaywgYWNs
azsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5oCj4gPiBpbmRleCA0NWM0OThlMTVlN2EuLmE0MjUwMzQ1MWI1ZCAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAo+ID4gQEAg
LTE2Niw2ICsxNjYsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2ZsaXBfaCh1MzIgcm90KQo+
ID4gIAkJcmV0dXJuICEhKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9YKTsKPiA+ICB9Cj4g
PiAgCj4gPiArdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0cnVjdCBkcm1fY3J0
Y19zdGF0ZSAqY3J0Y19zdCwKPiA+ICsJCQkJICB1MzIgKmNvbG9yX2RlcHRocyk7Cj4gPiAgdW5z
aWduZWQgbG9uZyBrb21lZGFfY3J0Y19nZXRfYWNsayhzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUg
KmtjcnRjX3N0KTsKPiA+ICAKPiA+ICBpbnQga29tZWRhX2ttc19zZXR1cF9jcnRjcyhzdHJ1Y3Qg
a29tZWRhX2ttc19kZXYgKmttcywgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpOwo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5l
LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5o
Cj4gPiBpbmRleCBiMzIyZjUyYmE4ZjIuLjc2NTNmMTM0YThlYiAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgK
PiA+IEBAIC0zMjMsNiArMzIzLDcgQEAgc3RydWN0IGtvbWVkYV9pbXByb2Mgewo+ID4gIAo+ID4g
IHN0cnVjdCBrb21lZGFfaW1wcm9jX3N0YXRlIHsKPiA+ICAJc3RydWN0IGtvbWVkYV9jb21wb25l
bnRfc3RhdGUgYmFzZTsKPiA+ICsJdTggY29sb3JfZGVwdGg7Cj4gPiAgCXUxNiBoc2l6ZSwgdnNp
emU7Cj4gPiAgfTsKPiA+ICAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+ID4gaW5kZXggMGJhOWM2
YWEzNzA4Li5lNjhlOGY4NWFiMjcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gPiBA
QCAtNzQzLDYgKzc0Myw3IEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9p
bXByb2MgKmltcHJvYywKPiA+ICAJCSAgICAgICBzdHJ1Y3Qga29tZWRhX2RhdGFfZmxvd19jZmcg
KmRmbG93KQo+ID4gIHsKPiA+ICAJc3RydWN0IGRybV9jcnRjICpjcnRjID0ga2NydGNfc3QtPmJh
c2UuY3J0YzsKPiA+ICsJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0ID0gJmtjcnRjX3N0
LT5iYXNlOwo+ID4gIAlzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSAqY19zdDsKPiA+ICAJ
c3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0Owo+ID4gIAo+ID4gQEAgLTc1Niw2ICs3NTcs
MjQgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2ltcHJvYyAqaW1wcm9j
LAo+ID4gIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsKPiA+ICAJc3QtPnZzaXplID0gZGZsb3ct
PmluX2g7Cj4gPiAgCj4gPiArCWlmIChkcm1fYXRvbWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRj
X3N0KSkgewo+ID4gKwkJdTMyIG91dHB1dF9kZXB0aHM7Cj4gPiArCQl1MzIgYXZhaWxfZGVwdGhz
Owo+ID4gKwo+ID4gKwkJa29tZWRhX2NydGNfZ2V0X2NvbG9yX2NvbmZpZyhjcnRjX3N0LAo+ID4g
KwkJCQkJICAgICAmb3V0cHV0X2RlcHRocyk7Cj4gPiArCj4gPiArCQlhdmFpbF9kZXB0aHMgPSBv
dXRwdXRfZGVwdGhzICYgaW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzOwo+ID4gKwkJaWYg
KGF2YWlsX2RlcHRocyA9PSAwKSB7Cj4gPiArCQkJRFJNX0RFQlVHX0FUT01JQygiTm8gYXZhaWxh
YmxlIGNvbG9yIGRlcHRocywgY29ubiBkZXB0aHM6IDB4JXggJiBkaXNwbGF5OiAweCV4XG4iLAo+
ID4gKwkJCQkJIG91dHB1dF9kZXB0aHMsCj4gPiArCQkJCQkgaW1wcm9jLT5zdXBwb3J0ZWRfY29s
b3JfZGVwdGhzKTsKPiA+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsJCX0KPiA+ICsKPiA+ICsJ
CXN0LT5jb2xvcl9kZXB0aCA9IF9fZmxzKGF2YWlsX2RlcHRocyk7Cj4gPiArCX0KPiA+ICsKPiA+
ICAJa29tZWRhX2NvbXBvbmVudF9hZGRfaW5wdXQoJnN0LT5iYXNlLCAmZGZsb3ctPmlucHV0LCAw
KTsKPiA+ICAJa29tZWRhX2NvbXBvbmVudF9zZXRfb3V0cHV0KCZkZmxvdy0+aW5wdXQsICZpbXBy
b2MtPmJhc2UsIDApOwo+ID4gIAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiA+IGluZGV4IDI4NTFjYWM5
NGQ4Ni4uNzQwYTgxMjUwNjMwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gPiBAQCAtMTQy
LDYgKzE0Miw3IEBAIHN0YXRpYyBpbnQga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGtv
bWVkYV9rbXNfZGV2ICprbXMsCj4gPiAgCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0ga21zLT5i
YXNlLmRldl9wcml2YXRlOwo+ID4gIAlzdHJ1Y3Qga29tZWRhX3diX2Nvbm5lY3RvciAqa3diX2Nv
bm47Cj4gPiAgCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3RvciAqd2JfY29ubjsKPiA+ICsJ
c3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmluZm87Cj4gPiAgCXUzMiAqZm9ybWF0cywgbl9mb3Jt
YXRzID0gMDsKPiA+ICAJaW50IGVycjsKPiA+ICAKPiA+IEBAIC0xNzEsNiArMTcyLDkgQEAgc3Rh
dGljIGludCBrb21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtt
cywKPiA+ICAKPiA+ICAJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yl9jb25uLT5iYXNlLCAm
a29tZWRhX3diX2Nvbm5faGVscGVyX2Z1bmNzKTsKPiA+ICAKPiA+ICsJaW5mbyA9ICZrd2JfY29u
bi0+YmFzZS5iYXNlLmRpc3BsYXlfaW5mbzsKPiA+ICsJaW5mby0+YnBjID0gX19mbHMoa2NydGMt
Pm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzKTsKPiA+ICsKPiA+ICAJa2Ny
dGMtPndiX2Nvbm4gPSBrd2JfY29ubjsKPiA+ICAKPiA+ICAJcmV0dXJuIDA7Cj4gPiAKPiAKPiAK
PiAtLSAKPiBNaWhhaWwKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
