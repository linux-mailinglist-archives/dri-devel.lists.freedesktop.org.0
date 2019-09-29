Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546F3C1335
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 06:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1759F6E127;
	Sun, 29 Sep 2019 04:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20086.outbound.protection.outlook.com [40.107.2.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A216E127
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 04:43:56 +0000 (UTC)
Received: from VI1PR08CA0156.eurprd08.prod.outlook.com (2603:10a6:800:d5::34)
 by DB7PR08MB3516.eurprd08.prod.outlook.com (2603:10a6:10:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Sun, 29 Sep
 2019 04:43:51 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR08CA0156.outlook.office365.com
 (2603:10a6:800:d5::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Sun, 29 Sep 2019 04:43:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sun, 29 Sep 2019 04:43:49 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Sun, 29 Sep 2019 04:43:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e1bbf0cce65ad95
X-CR-MTA-TID: 64aa7808
Received: from acdc22bc298c.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA6931B6-21F8-44EC-971D-876A7561CC6A.1; 
 Sun, 29 Sep 2019 04:43:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id acdc22bc298c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Sun, 29 Sep 2019 04:43:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aa8YNIBJTc6ZZ7UJqDbXZHPpO61/mIM4UwXDxLVKnufJaMN8BKJQ1wjzGDs8K6nRiTNangdUMJ6iz0iwT2fKyPSpaCVZkd5Xb0pSAs+4v57UrNAiyhI3LFKqcfMqWSTMY3XH15uIxuvRBzEcCt2byZSl3mEOvcVGIQOeirqIChprwzKS7Mw+XfPunkEyhP45cFZ9jaW8HaB011RoehRT8XEymqn/bdzGXRHx8wbULWZ55xpF+ZpscdVdDiTeFSBGIIQTMkob5HkpjfDyFMy18ILl4IZp6RXZ8XWX5Yer83j1/dvfgI5AQNTwxefvmjlPwj4y7cDB4FMHxq0e/bevHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XbRbHPLmiw38gpZsvPVr2bGfAh0oLA55yde65rHJws=;
 b=MZD8yJfMRDgjmFdS5scNzLrmXl8hJV821BujUYqsdPvBahWElmeRXvi36OErRYxgJU9qEBKRIKLTCjSSE0L5dHP8LPB9+9T39H03+OSHjo0G8wxGxHWhN+RJSqEqBJK9Aaxvue+c1rudk1khVCFRXrNTz+8NSgQPtR/AunYEqnKsoKE1SVQmVtGKDYAVAAtQRC3fgohhJn0+vKg4fpErKD94WNiNnFYz8qy1LMQyQAFjMUla+Trd6BZSAHSLc74MkhwLxNO6IfnHBMurcb78MBZ90AODdTIG2G7OsNVUvG/L+S7/1ORmbRKQZ4IDZllSBXs3514n88rK83Jb/QO2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4991.eurprd08.prod.outlook.com (10.255.158.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Sun, 29 Sep 2019 04:43:41 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.028; Sun, 29 Sep 2019
 04:43:41 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: drm: add fb max width/height fields to drm_mode_config
Thread-Topic: drm: add fb max width/height fields to drm_mode_config
Thread-Index: AQHVdoB3D2QDVHLEG0iqFyeHKtBpcQ==
Date: Sun, 29 Sep 2019 04:43:40 +0000
Message-ID: <20190929044334.GA27802@jamwan02-TSP300>
References: <1569634284-14147-2-git-send-email-jsanka@codeaurora.org>
In-Reply-To: <1569634284-14147-2-git-send-email-jsanka@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0196.apcprd02.prod.outlook.com
 (2603:1096:201:21::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d6615524-d3aa-499d-e490-08d744979ed0
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4991; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4991:|DB7PR08MB3516:
X-Microsoft-Antispam-PRVS: <DB7PR08MB35168002F1D4F77D104CEEF4B3830@DB7PR08MB3516.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 017589626D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(376002)(136003)(346002)(39850400004)(396003)(189003)(199004)(71200400001)(25786009)(6116002)(26005)(486006)(3846002)(55236004)(11346002)(6246003)(6506007)(386003)(102836004)(478600001)(86362001)(1076003)(71190400001)(5660300002)(14454004)(66066001)(229853002)(6486002)(33716001)(316002)(58126008)(8936002)(66556008)(64756008)(66476007)(66446008)(66946007)(6436002)(54906003)(6512007)(81156014)(81166006)(256004)(9686003)(99286004)(6916009)(186003)(446003)(7736002)(305945005)(4326008)(52116002)(2906002)(76176011)(476003)(33656002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4991;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: n2QY17ko/OZmGQ1AAoWcjTkQekxNKYoPkaIiP3dWmrX6Od27Pja/ld24HRk915oUQqEoVfGs3kv6ZvcccTHnqyDanplN9hVesd1ZwBGhTz5cOQ9FV4G0OdgwBacNXAsH16C80usIsUnWKFDLxuTfc629qkfEyGHrl+Rcz1sKV89JapMiWamf4B5OLtUfRmyMUx9HGoiJYlyUFecjefbaRYGgdTgIRtCC/7AJ7uxd+mh/12wjiwGHlQAG7AVsCwsgvY+iy4ZQ6/fKCvYzZkuOR4Fxouu4EnecYX7ZAAa9PIxKt/fODsa8XbRciYB3cCkR7WW3eYjsrhdYMQ4qYNrF9kVLEn3kQjp8kqKdmtc7/dMMl/PYKFJRnbWkLD+LoQCbmj75cuZYFOvzpBNHaun+OmsfBiVgeSWkaEE0zfcuVd8=
x-ms-exchange-transport-forked: True
Content-ID: <FC3EC09C5348AD45897DD94AAC06416F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4991
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(396003)(39850400004)(346002)(136003)(189003)(199004)(305945005)(76130400001)(33716001)(81166006)(2906002)(446003)(486006)(70586007)(476003)(356004)(8936002)(8746002)(8676002)(81156014)(11346002)(63350400001)(6116002)(47776003)(3846002)(23726003)(478600001)(76176011)(5660300002)(25786009)(66066001)(336012)(99286004)(6512007)(70206006)(9686003)(126002)(46406003)(22756006)(1076003)(6246003)(102836004)(6862004)(4326008)(50466002)(36906005)(186003)(54906003)(58126008)(14454004)(97756001)(6506007)(6486002)(26005)(7736002)(33656002)(229853002)(86362001)(316002)(386003)(26826003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3516;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4f531287-7c9d-4c08-4519-08d7449799c5
NoDisclaimer: True
X-Forefront-PRVS: 017589626D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6iST2qOVk54yHfc10F+e8T7YJob7HLaMWQzLpzF/eKKCoskersH0ue/gt3INbyCqvs9RXmF30ZukO4HsUNOSmxxmgIDvJfUCye3jyXueBq5Xz0qXN9wMp7y9bZsZjA0H6YhyBcvpYLujfG1qEPb+MgT5Igti5SmCWm/dVtOQp0NeAtZIeC0+m9iiXONxM5bdDRxXzvTccXbE3iGwgl7dfcfUBckPCwWfhXRY8tea3a5kfLw/gl3NT3Z96ZaHJ6FAJIyZWOBC1tPyqDU2fLdgnnvoXiWG26aY4d276SgmNXF521r0O6At+LAkn8gCP1D1BU3dbmNzW011c++ADDlsytcO70T4axD6z+lQmFk6DzlaCwyk+LAkxyVzj2rtBAqBto57O8nKs1D+Cc/2OkeCVl3LBI+3vWL5m9rNmBSTV28=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2019 04:43:49.0174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6615524-d3aa-499d-e490-08d744979ed0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XbRbHPLmiw38gpZsvPVr2bGfAh0oLA55yde65rHJws=;
 b=RaZoKntl0WnIJi1nTRPefCPLko0hlykQ21r2BfGMmsXZ9SAH6GoOuuRmRd7WLFu4mMwDWtYZHhx2l283mjFfGcNukB2TNQP/+NHsv5R39EZZ0VXjqt+eysZ4yfzG+nYCNA7yz5uBBQ04btHcjr2uBOdjpLaw9cwUDnLNvA3PkN4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XbRbHPLmiw38gpZsvPVr2bGfAh0oLA55yde65rHJws=;
 b=RaZoKntl0WnIJi1nTRPefCPLko0hlykQ21r2BfGMmsXZ9SAH6GoOuuRmRd7WLFu4mMwDWtYZHhx2l283mjFfGcNukB2TNQP/+NHsv5R39EZZ0VXjqt+eysZ4yfzG+nYCNA7yz5uBBQ04btHcjr2uBOdjpLaw9cwUDnLNvA3PkN4=
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDY6MzE6MjRQTSAtMDcwMCwgSmV5a3VtYXIgU2Fua2Fy
YW4gd3JvdGU6Cj4gVGhlIG1vZGVfY29uZmlnIG1heCB3aWR0aC9oZWlnaHQgdmFsdWVzIGRldGVy
bWluZSB0aGUgbWF4aW11bQo+IHJlc29sdXRpb24gdGhlIHBpeGVsIHJlYWRlciBjYW4gaGFuZGxl
LiBCdXQgdGhlIHNhbWUgdmFsdWVzIGFyZQo+IHVzZWQgdG8gcmVzdHJpY3QgdGhlIHNpemUgb2Yg
dGhlIGZyYW1lYnVmZmVyIGNyZWF0aW9uLiBIYXJkd2FyZSdzCj4gd2l0aCBzY2FsaW5nIGJsb2Nr
cyBjYW4gb3BlcmF0ZSBvbiBmcmFtZWJ1ZmZlcnMgbGFyZ2VyL3NtYWxsZXIgdGhhbgo+IHRoYXQg
b2YgdGhlIHBpeGVsIHJlYWRlciByZXNvbHV0aW9ucyBieSBzY2FsaW5nIHRoZW0gZG93bi91cCBi
ZWZvcmUKPiByZW5kZXJpbmcuCj4gCj4gVGhpcyBjaGFuZ2VzIGFkZHMgYSBzZXBhcmF0ZSBmcmFt
ZWJ1ZmZlciBtYXggd2lkdGgvaGVpZ2h0IGZpZWxkcwo+IGluIGRybV9tb2RlX2NvbmZpZyB0byBh
bGxvdyB2ZW5kb3JzIHRvIHNldCBpZiB0aGV5IGFyZSBkaWZmZXJlbnQKPiB0aGFuIHRoYXQgb2Yg
dGhlIGRlZmF1bHQgbWF4IHJlc29sdXRpb24gdmFsdWVzLgo+IAo+IFZlbmRvcnMgc2V0dGluZyB0
aGVzZSBmaWVsZHMgc2hvdWxkIGZpeCB0aGVpciBtb2RlX3NldCBwYXRocyB0b28KPiBieSBmaWx0
ZXJpbmcgYW5kIHZhbGlkYXRpbmcgdGhlIG1vZGVzIGFnYWluc3QgdGhlIGFwcHJvcHJpYXRlIG1h
eAo+IGZpZWxkcyBpbiB0aGVpciBtb2RlX3ZhbGlkKCkgaW1wbGVtZW50YXRpb25zLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKZXlrdW1hciBTYW5rYXJhbiA8anNhbmthQGNvZGVhdXJvcmEub3JnPgoK
SGkgSmV5a3VtYXI6CgpLb21lZGEgZHJpdmVyIGFsc28gbWVldHMgdGhpcyBwcm9ibGVtLCB0aGFu
ayBmb3IgdGhlIGZpeC4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9s
b2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpUaGFua3MKSmFtZXMKCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYyB8IDE1ICsrKysrKysrKysrLS0t
LQo+ICBpbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCAgICAgfCAgMyArKysKPiAgMiBmaWxl
cyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZyYW1lYnVmZmVyLmMKPiBpbmRleCA1NzU2NDMxLi4yMDgzMTY4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZnJhbWVidWZmZXIuYwo+IEBAIC0zMDAsMTQgKzMwMCwyMSBAQCBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICoKPiAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiAgCX0KPiAgCj4gLQlp
ZiAoKGNvbmZpZy0+bWluX3dpZHRoID4gci0+d2lkdGgpIHx8IChyLT53aWR0aCA+IGNvbmZpZy0+
bWF4X3dpZHRoKSkgewo+ICsJaWYgKChjb25maWctPm1pbl93aWR0aCA+IHItPndpZHRoKSB8fAo+
ICsJICAgICghY29uZmlnLT5tYXhfZmJfd2lkdGggJiYgci0+d2lkdGggPiBjb25maWctPm1heF93
aWR0aCkgfHwKPiArCSAgICAoY29uZmlnLT5tYXhfZmJfd2lkdGggJiYgci0+d2lkdGggPiBjb25m
aWctPm1heF9mYl93aWR0aCkpIHsKPiAgCQlEUk1fREVCVUdfS01TKCJiYWQgZnJhbWVidWZmZXIg
d2lkdGggJWQsIHNob3VsZCBiZSA+PSAlZCAmJiA8PSAlZFxuIiwKPiAtCQkJICByLT53aWR0aCwg
Y29uZmlnLT5taW5fd2lkdGgsIGNvbmZpZy0+bWF4X3dpZHRoKTsKPiArCQkJci0+d2lkdGgsIGNv
bmZpZy0+bWluX3dpZHRoLCBjb25maWctPm1heF9mYl93aWR0aCA/Cj4gKwkJCWNvbmZpZy0+bWF4
X2ZiX3dpZHRoIDogY29uZmlnLT5tYXhfd2lkdGgpOwo+ICAJCXJldHVybiBFUlJfUFRSKC1FSU5W
QUwpOwo+ICAJfQo+IC0JaWYgKChjb25maWctPm1pbl9oZWlnaHQgPiByLT5oZWlnaHQpIHx8IChy
LT5oZWlnaHQgPiBjb25maWctPm1heF9oZWlnaHQpKSB7Cj4gKwo+ICsJaWYgKChjb25maWctPm1p
bl9oZWlnaHQgPiByLT5oZWlnaHQpIHx8Cj4gKwkgICAgKCFjb25maWctPm1heF9mYl9oZWlnaHQg
JiYgci0+aGVpZ2h0ID4gY29uZmlnLT5tYXhfaGVpZ2h0KSB8fAo+ICsJICAgIChjb25maWctPm1h
eF9mYl9oZWlnaHQgJiYgci0+aGVpZ2h0ID4gY29uZmlnLT5tYXhfZmJfaGVpZ2h0KSkgewo+ICAJ
CURSTV9ERUJVR19LTVMoImJhZCBmcmFtZWJ1ZmZlciBoZWlnaHQgJWQsIHNob3VsZCBiZSA+PSAl
ZCAmJiA8PSAlZFxuIiwKPiAtCQkJICByLT5oZWlnaHQsIGNvbmZpZy0+bWluX2hlaWdodCwgY29u
ZmlnLT5tYXhfaGVpZ2h0KTsKPiArCQkJci0+aGVpZ2h0LCBjb25maWctPm1pbl9oZWlnaHQsIGNv
bmZpZy0+bWF4X2ZiX3dpZHRoID8KPiArCQkJY29uZmlnLT5tYXhfZmJfaGVpZ2h0IDogY29uZmln
LT5tYXhfaGVpZ2h0KTsKPiAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKPiAgCX0KPiAgCj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIGIvaW5jbHVkZS9kcm0v
ZHJtX21vZGVfY29uZmlnLmgKPiBpbmRleCAzYmNiZTMwLi5jNjM5NGVkIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21v
ZGVfY29uZmlnLmgKPiBAQCAtMzM5LDYgKzMzOSw4IEBAIHN0cnVjdCBkcm1fbW9kZV9jb25maWdf
ZnVuY3Mgewo+ICAgKiBAbWluX2hlaWdodDogbWluaW11bSBmYiBwaXhlbCBoZWlnaHQgb24gdGhp
cyBkZXZpY2UKPiAgICogQG1heF93aWR0aDogbWF4aW11bSBmYiBwaXhlbCB3aWR0aCBvbiB0aGlz
IGRldmljZQo+ICAgKiBAbWF4X2hlaWdodDogbWF4aW11bSBmYiBwaXhlbCBoZWlnaHQgb24gdGhp
cyBkZXZpY2UKPiArICogQG1heF9mYl93aWR0aDogbWF4aW11bSBmYiBidWZmZXIgd2lkdGggaWYg
ZGlmZmVycyBmcm9tIG1heF93aWR0aAo+ICsgKiBAbWF4X2ZiX2hlaWdodDogbWF4aW11bSBmYiBi
dWZmZXIgaGVpZ2h0IGlmIGRpZmZlcnMgZnJvbSAgbWF4X2hlaWdodAo+ICAgKiBAZnVuY3M6IGNv
cmUgZHJpdmVyIHByb3ZpZGVkIG1vZGUgc2V0dGluZyBmdW5jdGlvbnMKPiAgICogQGZiX2Jhc2U6
IGJhc2UgYWRkcmVzcyBvZiB0aGUgZnJhbWVidWZmZXIKPiAgICogQHBvbGxfZW5hYmxlZDogdHJh
Y2sgcG9sbGluZyBzdXBwb3J0IGZvciB0aGlzIGRldmljZQo+IEBAIC01MjMsNiArNTI1LDcgQEAg
c3RydWN0IGRybV9tb2RlX2NvbmZpZyB7Cj4gIAo+ICAJaW50IG1pbl93aWR0aCwgbWluX2hlaWdo
dDsKPiAgCWludCBtYXhfd2lkdGgsIG1heF9oZWlnaHQ7Cj4gKwlpbnQgbWF4X2ZiX3dpZHRoLCBt
YXhfZmJfaGVpZ2h0Owo+ICAJY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyAqZnVu
Y3M7Cj4gIAlyZXNvdXJjZV9zaXplX3QgZmJfYmFzZTsKPiAgCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
