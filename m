Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8215D95FB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 17:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3540B6E03B;
	Wed, 16 Oct 2019 15:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70049.outbound.protection.outlook.com [40.107.7.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4853D6E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 15:51:55 +0000 (UTC)
Received: from DB7PR08CA0029.eurprd08.prod.outlook.com (2603:10a6:5:16::42) by
 HE1PR0801MB1786.eurprd08.prod.outlook.com (2603:10a6:3:7f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Wed, 16 Oct 2019 15:51:49 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by DB7PR08CA0029.outlook.office365.com
 (2603:10a6:5:16::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Wed, 16 Oct 2019 15:51:49 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 15:51:46 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Wed, 16 Oct 2019 15:51:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ddf0f4e3a676208
X-CR-MTA-TID: 64aa7808
Received: from d874fc66564d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B763A77-1BB2-4316-B307-659D2645088B.1; 
 Wed, 16 Oct 2019 15:51:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d874fc66564d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 15:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1MTLh+iX3nFtDDLvWqCsynC5gmkyofpk1e0W7h8dtUZpPnuhOt95glQpfYtYZXCbD5xresmIL9QzQ1wJey9v187/XsolwRSr/D/SrPqpYUfdaLoMvBP32/Lysx0AGbjQbKewOIxt56iwbs2Mq8cPaClX57X1z4iBJ5usZ37OUFtUtBlKAE2Mx8GqekuCNAvtTpYNKCsQs/GIIKOdypbLjRyaM+lN3PWcWFaIH5nv0x5bFdN0yDy4HrufVs0K505I1wj4lAZ1enAuvl1LGhyxB0bm666PisQJiA59Xs4kd8yYPAbz+5L+iHmIFWbMu8QP31b2B17ZMg9RzZKiWFtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZbVpZtfiiA2DR1kpvsvhXiK9/FbADvXQvh7uCMgeK4=;
 b=G61fGd0mm3nVRJKZokAjNYja8jFC4aCBXYnDl/q8/K831wQT2lCjlyd623ohegkLmZYTK7skXN6/2xMAWhZnGKhfa9KvAyo7riM7sWONqoVmnrtgUx4HE2h8ZPufNzB26l0eTFjfzgWFnwmo037RD9Jk3oxkmk49D7eFkb1lV0FxLoths7pJ+gW0apFt+TsHLTML8/S7dWVVTfKR9E9PCYfjcAI2XGrkx6vbS3CCFGJ0c+AXEYxLAy7/F2r3OUk0QqZwo+GDWvhWPeZboKbo4F0jywQ6JVLanhfZTl0aBYjdP6vIGgMiS9E4qlN6B+wgO37lO1G621ZAPfVN9PGuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3440.eurprd08.prod.outlook.com (20.177.59.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 15:51:39 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 15:51:39 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVfmYCVHmeR23TD0SRvLooFH2IJKdddlmA
Date: Wed, 16 Oct 2019 15:51:39 +0000
Message-ID: <5390495.Gzyn2rW8Nj@e123338-lin>
References: <20191004143418.53039-4-mihail.atanassov@arm.com>
 <20191009055407.GA3082@jamwan02-TSP300>
In-Reply-To: <20191009055407.GA3082@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: SN6PR0102CA0014.prod.exchangelabs.com (2603:10b6:805:1::27)
 To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 35b54f80-25cc-4d37-813b-08d75250c005
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3440:|VI1PR08MB3440:|HE1PR0801MB1786:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1786EEA7B15C03B6BD087CC58F920@HE1PR0801MB1786.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(189003)(199004)(6636002)(71200400001)(26005)(7736002)(305945005)(186003)(86362001)(99286004)(71190400001)(33716001)(66446008)(64756008)(66476007)(14454004)(66946007)(66556008)(66066001)(5660300002)(54906003)(386003)(316002)(5024004)(6512007)(8936002)(6862004)(478600001)(6506007)(6116002)(76176011)(102836004)(256004)(3846002)(2906002)(476003)(446003)(25786009)(11346002)(486006)(9686003)(52116002)(81166006)(4326008)(6246003)(6486002)(81156014)(6436002)(229853002)(8676002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3440;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: n9iKC3K2iGL+73yPf7Qa68bDVCLNuxXb0b9aMG3xoVJ8cmgUkgZtuEVM78G3zJk97tQZtyjrDCGTrbhRbZXUrm34Vs7pih3NLFp9XZLBJBKATj+8yQhm+KgO2MTv/4paRin2B6mORCfadoxyx2BRK/3Cs17B3guxGhZbtQGuN5lxaih4TyIljJ2K2l7hD+5K6Hmu0w446dtXRvR6XMlwmkqKQb+Iqn3sOV8ohBYtUJ/brrlF+MJAROzKK+c+/V5TVDOVYepKycaIzYP0MoU275H+UeSRx+r/4aHri5O2hJPSNXS+DvFn+7LrSbiVFQLBHRCHf2UDGoeucz7BkS6A85aaXqJc+/Kf0VEcztCGzD8l6426kgjudJT9lRWX5R+il2fFbaTMqJBfb1QhaYJ1Y0aTR1WXUwklELQ7QpSp+JM=
Content-ID: <BD65661515A0694984EC433BFC445A10@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3440
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(99286004)(356004)(14454004)(486006)(186003)(11346002)(25786009)(76176011)(446003)(47776003)(3846002)(6116002)(6486002)(316002)(476003)(81166006)(23726003)(33716001)(8936002)(8746002)(6246003)(305945005)(46406003)(81156014)(4326008)(7736002)(76130400001)(8676002)(6862004)(26826003)(70586007)(70206006)(50466002)(126002)(66066001)(336012)(478600001)(54906003)(63350400001)(26005)(97756001)(2906002)(386003)(6506007)(102836004)(6636002)(86362001)(229853002)(9686003)(22756006)(5660300002)(5024004)(6512007)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1786;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0401189e-caa2-485c-796b-08d75250bb3f
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X1zHe4W0itL7Xk6lclLAs/k2HC8jPy/W6moCzhfSWzDFyLqOQo3Fma4p97zS/uyvyun3hPccVGFiQ90OafpPUQTz9bLcJop6V2LSbZAeuUx7l6jZGWsjxDVLbfmCwrsUagpTjlEhYQfKyLyMvFlDGMvBrpGP5lL5lc1HhUVuXkjKqqvs/IWFORwqy8tIsWRQTE5ax8p8DrummRLZdbITFe1HLrU/y1sLaHD98FwatDejwxJNNvCYPNHLd46R7Sw9GfplfA8+NbYzpymfIH7LCSxirwGYDOSKTt9mw/dkBnKgrSQtd+zU/bASyS0UZRQTgqf8KaICtFdFWrfZPJ/ypECAXwGljN3d6DiKH0cJAywlaaPywVFVjiNpiDdRN9sz0Gz+1/7V3W6COm4qj30uZ36sLaAOU2FZcJmdZtp6W0c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 15:51:46.7881 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b54f80-25cc-4d37-813b-08d75250c005
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1786
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZbVpZtfiiA2DR1kpvsvhXiK9/FbADvXQvh7uCMgeK4=;
 b=dkkaZbR/EtjiJE+k96tcE/tpsww1ThQp9coLcs7CIaFo5x8LeIuJxKTx5VQKxl94q9T8e+GnKEgP3hayiPt1ql58IY7fRu4usyqfILRmrkDlRCmBvqH6g6D0aPS+OP9F76vFqf67QRnwSGl3ONuMfo7VFF305VhjjtoFtzq9TyE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZbVpZtfiiA2DR1kpvsvhXiK9/FbADvXQvh7uCMgeK4=;
 b=dkkaZbR/EtjiJE+k96tcE/tpsww1ThQp9coLcs7CIaFo5x8LeIuJxKTx5VQKxl94q9T8e+GnKEgP3hayiPt1ql58IY7fRu4usyqfILRmrkDlRCmBvqH6g6D0aPS+OP9F76vFqf67QRnwSGl3ONuMfo7VFF305VhjjtoFtzq9TyE=
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiBXZWRuZXNkYXksIDkgT2N0b2JlciAyMDE5IDA2OjU0OjE1IEJTVCBqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBPbiBGcmksIE9jdCAw
NCwgMjAxOSBhdCAwMjozNDo0MlBNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+ID4g
VG8gc3VwcG9ydCB0cmFuc21pdHRlcnMgb3RoZXIgdGhhbiB0aGUgdGRhOTk4eCwgd2UgbmVlZCB0
byBhbGxvdwo+ID4gbm9uLWNvbXBvbmVudCBmcmFtZXdvcmsgYnJpZGdlcyB0byBiZSBhdHRhY2hl
ZCB0byBhIGR1bW15IGRybV9lbmNvZGVyIGluCj4gPiBvdXIgZHJpdmVyLgo+ID4gCj4gPiBGb3Ig
dGhlIGV4aXN0aW5nIHN1cHBvcnRlZCBlbmNvZGVyICh0ZGE5OTh4KSwga2VlcCB0aGUgYmVoYXZp
b3VyIGFzLWlzLAo+ID4gc2luY2UgdGhlcmUncyBubyB3YXkgdG8gdW5iaW5kIGlmIGEgZHJtX2Jy
aWRnZSBtb2R1bGUgZ29lcyBhd2F5IHVuZGVyCj4gPiBvdXIgZmVldC4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgo+ID4g
LS0tCj4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgIHwg
ICA1ICsKPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jICAg
fCAgNTggKysrKysrLS0KPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ttcy5jICAgfCAxMzMgKysrKysrKysrKysrKysrKystCj4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgICA1ICsKPiA+ICA0IGZpbGVzIGNoYW5nZWQs
IDE4NyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gW3NuaXBdCj4gPiAg
Cj4gPiArc3RhdGljIHZvaWQga29tZWRhX2VuY29kZXJfZGVzdHJveShzdHJ1Y3QgZHJtX2VuY29k
ZXIgKmVuY29kZXIpCj4gPiArewo+ID4gKwlkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwo+
ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIGtv
bWVkYV9kdW1teV9lbmNfZnVuY3MgPSB7Cj4gPiArCS5kZXN0cm95ID0ga29tZWRhX2VuY29kZXJf
ZGVzdHJveSwKPiA+ICt9Owo+ID4gKwo+ID4gK2Jvb2wga29tZWRhX3JlbW90ZV9kZXZpY2VfaXNf
Y29tcG9uZW50KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbG9jYWwsCj4gPiArCQkJCSAgICAgICB1MzIg
cG9ydCwgdTMyIGVuZHBvaW50KQo+ID4gK3sKPiA+ICsJc3RydWN0IGRldmljZV9ub2RlICpyZW1v
dGU7Cj4gPiArCWNoYXIgY29uc3QgKiBjb25zdCBjb21wb25lbnRfZGV2aWNlc1tdID0gewo+ID4g
KwkJIm54cCx0ZGE5OTh4IiwKPiAKPiBJIHJlYWxseSBkb24ndCB0aGluayBwdXQgdGhpcyBkdW1t
eV9lbmNvZGVyIGludG8ga29tZWRhIGlzIGEgZ29vZAo+IGlkZWEuCj4gCj4gQW5kIEkgc3VnZ2Vz
dCB0byBzZXBlcmF0ZSB0aGlzIGR1bW15X2VuY29kZXIgdG8gYSBpbmRpdmlkdWFsIG1vZHVsZQo+
IHdoaWNoIHdpbGwgYnVpbGQgdGhlIGRybV9yaWRnZSB0byBhIHN0YW5kYXJkIGRybSBlbmNvZGVy
IGFuZCBjb21wb25lbnQKPiBiYXNlZCBtb2R1bGUsIHdoaWNoIHdpbGwgYmUgZW5hYmxlIGJ5IERU
LCB0b3RhbGx5IHRyYW5zcGFyZW50IGZvciBrb21lZGEuCj4gCj4gQlRXOgo+IEkgcmVhbGx5IGRv
bid0IGxpa2Ugc3VjaCBsb2dpYzogZGlzdGluZ3VzaCB0aGUgU1lTVEVNIGNvbmZpZ3VyYXRpb24K
PiBieSBjaGVjayB0aGUgY29ubmVjdGVkIGRldmljZSBuYW1lLCBpdCdzIGhhcmQgdG8gbWFpbnRh
aW4gYW5kIGNvZGUKPiBzaGFyaW5nLCBhbmQgdGhhdCdzIHdoeSBOT1cgd2UgaGF2ZSB0aGUgZGV2
aWNlLXRyZWUuCgorQ2MgQnJpYW4KCkkgZGlkbid0IHRoaW5rIERUIGlzIHRoZSByaWdodCBwbGFj
ZSBmb3IgcHNldWRvLWRldmljZXMuIFRoZSB0ZGE5OTh4Cmxvb2tzIHRvIGJlIGluIGEgc21hbGwg
Z3JvdXAgb2YgZHJpdmVycyB0aGF0IGNvbnRhaW4gZW5jb2RlciArCmJyaWRnZSArIGNvbm5lY3Rv
cjsgbXkgaW1wcmVzc2lvbiBvZiB0aGUgY3VycmVudCBzdGF0ZSBvZiBhZmZhaXJzIGlzCnRoYXQg
dGhlIGRybV9lbmNvZGVyIHRlbmRzIHRvIGxpdmUgd2hlcmUgdGhlIENSVEMgcHJvdmlkZXIgaXMg
cmF0aGVyCnRoYW4gcmVwcmVzZW50aW5nIGEgSFcgZW50aXR5IChoZW5jZSB3aHkgZHJtX2JyaWRn
ZSBiYXNlZCBkcml2ZXJzCmV4aXN0IGluIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UpLiBTZWUgdGhl
IG92ZXJ2aWV3IERPQyBjb21tZW50IGluCmRybV9lbmNvZGVyLmMgKCJkcml2ZXJzIGFyZSBmcmVl
IHRvIHVzZSBbZHJtX2VuY29kZXJdIGhvd2V2ZXIgdGhleQp3aXNoIikuIEkgbWF5IGJlIGNvbXBs
ZXRlbHkgd3JvbmcsIHNvIHdvdWxkIGFwcHJlY2lhdGUgc29tZQpjb250ZXh0IGFuZCBjb21tZW50
IGZyb20gb3RoZXJzIG9uIHRoZSBDYyBsaXN0LgoKSW4gYW55IGNhc2UsIGNvbnZlcnRpbmcgYSBk
by1ub3RoaW5nIGR1bW15IGVuY29kZXIgaW50byBpdHMgb3duCmNvbXBvbmVudC1tb2R1bGUgd2ls
bCBhZGQgYSBsb3QgbW9yZSBibG9hdCBjb21wYXJlZCB0byB0aGUgY3VycmVudAp+MTAgU0xvQyBp
bXBsZW1lbnRhdGlvbiBvZiB0aGUgZHJtX2VuY29kZXIuIHByb2JlL3JlbW92ZS9iaW5kL3VuYmlu
ZCwKYSBmZXcgZXh0cmEgc3RydWN0cyBoZXJlIGFuZCB0aGVyZSwgeWV0IGFub3RoZXIgb2JqZWN0
IGZpbGUsIERUCmJpbmRpbmdzLCBkb2NzIGZvciB0aGUgc2FtZSwgYW5kIG1haW50YWluaW5nIGFs
bCBvZiB0aGF0PyBJdCdzIGEgaGFyZApzZWxsIGZvciBtZS4gSSdkIHByZWZlciBpZiB3ZSB3ZW50
IGFoZWFkIHdpdGggdGhlIGNvZGUgYXMtaXMgYW5kIGZpeCBpdAp1cCBsYXRlciBpZiBpdCByZWFs
bHkgcHJvdmVzIHVud2llbGR5IGFuZCB0b28gaGFyZCB0byBtYWludGFpbi4gQ291bGQKdGhpcyBw
YXRjaCBiZSBpbXByb3ZlZD8gU3VyZSEgQ2FuIHdlIGltcHJvdmUgaXQgaW4gZm9sbG93LXVwIHdv
cmsKdGhvdWdoLCBhcyBJIHRoaW5rIHRoaXMgaXMgdmFsdWFibGUgZW5vdWdoIG9uIGl0cyBvd24g
d2l0aG91dCBhbnkgbWFqb3IKZHJhd2JhY2tzPwoKQXMgcGVyIG15IGNvdmVyIGxldHRlciwgaW4g
YW4gaWRlYWwgd29ybGQgd2UnZCBoYXZlIHRoZSBlbmNvZGVyIGxvY2FsbHkKYW5kIGRvIGRybV9i
cmlkZ2VfYXR0YWNoKCkgZXZlbiBmb3IgdGRhOTk4eCwgYnV0IHRoZSBsaWZldGltZSBpc3N1ZXMK
YXJvdW5kIGJyaWRnZXMgaW5zaWRlIG1vZHVsZXMgbWVhbiB0aGF0IGRvaW5nIHRoYXQgbm93IGlz
IGEgYml0IG9mIGEKc3RlcCBiYWNrIGZvciB0aGlzIHNwZWNpZmljIGNhc2UuCgo+IAo+IFRoYW5r
cwo+IEphbWVzCj4gCj4gPiBbc25pcF0KPiAKCi0tIApNaWhhaWwKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
