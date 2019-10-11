Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588D4D3B0D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 10:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06206E0D1;
	Fri, 11 Oct 2019 08:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30065.outbound.protection.outlook.com [40.107.3.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B480A6E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 08:27:10 +0000 (UTC)
Received: from AM4PR08CA0066.eurprd08.prod.outlook.com (2603:10a6:205:2::37)
 by VI1PR08MB4431.eurprd08.prod.outlook.com (2603:10a6:803:ff::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 11 Oct
 2019 08:27:05 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by AM4PR08CA0066.outlook.office365.com
 (2603:10a6:205:2::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 08:27:05 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 08:27:04 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Fri, 11 Oct 2019 08:27:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61ba61c69a2aba9f
X-CR-MTA-TID: 64aa7808
Received: from 8511ca7d45cd.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F552D04-6CAC-47FB-B185-6A1BEA2AAF6E.1; 
 Fri, 11 Oct 2019 08:26:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8511ca7d45cd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Oct 2019 08:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyjDX9gRT7rHtvUwHRjKZxafpsj9+e6HvEbk7OAzwPwEn11HqDT89394rKiDvN8mcpZwQibcXC1cbe3f5sAaExmx1eiDhvyxEp9r7oHLT8GQWjhOEEwud6Jf134/YnMh9OBrYR10Eb7JA2H8POZ4x+j8vNBF7UNhXtjTUGxksJk5l8/or6Z7dDeiq9n7cU4fZG1alTpFBiwfZLOdGf09+jO3Xve52L6oA4qNBJcuP+hNuSayJRjz+AZtoQC8l2ZjM0KY0YXHMZxy/13+0dDtzIPUkKVFLGfCel850py0WJZL2o3emB3WWq8gBZ24x/2bWlwecgCFVKe97G/TK5LNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1psI3ctevFR286UcPZdwCGHJds5ApXM4olewMNnC2U=;
 b=CSYPZST73swEdd/1KTs77rNHGfKrn4S4ih9zts73fb8EZyYF86WoNQXAHAarOWe0B8atNSbevVX1G10USuzlKFyijEy9XMYXiLJX2e5kTOMPBIqyrEy8rqpBq6bw9LL0xCjCJDFPBuEgjzD0O7JFEYVXrE6B49ReBCFE6+0COpv65CRUYGX8rRe+NGVRgk1gGIE75QS/r8Uxqb/L9ZIGdeuU9vQ5RDEUGL0yiVGK5Gb6M+MWA9R7jIqBfE+3Z2yfSeLY/OshxUjWbP/V42qtCg0PaQFA9E5oQeVz36G4DSsNhe6OxBkQLM2AMGl86VKbucDWr6hb+VCtT08e3FO4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4093.eurprd08.prod.outlook.com (20.178.127.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 08:26:53 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 08:26:53 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/cdAHid3tH8+UyzZeXX5YE1LKdVG1SA
Date: Fri, 11 Oct 2019 08:26:53 +0000
Message-ID: <1622787.6FTe1jSl1W@e123338-lin>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
 <20191011054459.17984-2-james.qian.wang@arm.com>
In-Reply-To: <20191011054459.17984-2-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fca50e54-b2ea-4276-3048-08d74e24cbe8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4093:|VI1PR08MB4093:|VI1PR08MB4431:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4431D6B1DBF1EF73E17B04108F970@VI1PR08MB4431.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(64756008)(6636002)(256004)(186003)(66446008)(476003)(71200400001)(14444005)(316002)(8676002)(86362001)(486006)(5660300002)(71190400001)(3846002)(7736002)(2906002)(66556008)(66476007)(446003)(11346002)(54906003)(81166006)(81156014)(6116002)(66946007)(25786009)(6862004)(26005)(66066001)(102836004)(8936002)(6246003)(305945005)(6436002)(52116002)(478600001)(9686003)(6512007)(6506007)(386003)(229853002)(4326008)(76176011)(14454004)(6486002)(33716001)(99286004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4093;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: nBG0TXM9rTUg9IsPImGxzNUlEbC+DmYCU7DtbwvVcQZcHRtl6uNgTyYLUUSpMbDBZBzIAMU5BlXQEv9FotuxVOEp9TNILAmABBcxowPCtWqy7GX9WrBT9LyXKi2aqyJo+MF3lElh7v1I0SFX/2FjH7hDnOTG3WcCDiRjqzJYK8rDDVitDlTdkhWnavgCVJH17ZRBU9WAofU0LWeARuUIDopLGnAYyVvL4KCfAII//hcO0i2LyqrweV5Pmpg35806m0gbL87JS2Nq3cqSp8d4GrIKZGvA3eNYhy1xo+b9Tqtjyge51bF/UTVnTe4Hal8J1ax1tTYuMU9tpDs5qo5Tx/H2bfJvVB8upFaqB2WNiqawq6B1gPrm1obsCxKMZVjKDvR2Vk89my7LQcCwmlKjE5Qs8/us6OEt0aR6o3rqYYw=
Content-ID: <8E9A0D14D6ECF7498045A0969AF1E44E@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4093
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(99286004)(356004)(36906005)(4326008)(6862004)(336012)(26826003)(33716001)(6506007)(14444005)(386003)(76176011)(22756006)(316002)(6636002)(305945005)(2906002)(478600001)(186003)(102836004)(25786009)(7736002)(26005)(14454004)(66066001)(63350400001)(9686003)(446003)(11346002)(86362001)(486006)(6512007)(50466002)(8936002)(47776003)(8746002)(8676002)(5660300002)(81166006)(81156014)(54906003)(6116002)(3846002)(6486002)(229853002)(46406003)(126002)(476003)(23726003)(70586007)(76130400001)(97756001)(6246003)(70206006)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4431;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4dbc0383-0883-4a07-3976-08d74e24c54f
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boDwYRGTANdkhMjEj05KcrIHW8qd3YvhY77vcGf/jzJYVequBZjxs1+4PjJoILL6oSfAkvBoCx7xc+gCFdtwd2XuET558OSJSDG5GZhbX8KrkQChassEKLmzD3U8OFkIWWr7ERsniY9hu9i2PBsZr6fj9ipR3uj+OaJQyy4MADwSoT4FzBEu1Jpfnr5f7RgTPKQxtE1Csc6CBEdH1E9v6mpKS9zW8e/bsIN4PWuFa+3Kd4UoOiVnA+m6UG4KfuGAYDDBskQtTgKoujgqmCo8MtsIh/svjQ2uVipXfk6HXbsaGHFDP+n436SchauOn0IZii1WnnV+ypDwJwmzDW9vTpXmJ0jwfOM+qGzNmWnAOK0TRfya0VadtscYB2y0vtJ3Nb+nsZD6m3zhOFnkXfDm1TPZpq03KBvgAF/NhejmdlM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 08:27:04.2444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fca50e54-b2ea-4276-3048-08d74e24cbe8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4431
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1psI3ctevFR286UcPZdwCGHJds5ApXM4olewMNnC2U=;
 b=96LtwpPi+Gqcungk5fNvuUX/FikE+3SrOcHQBGRM/x+fInTI0aKF4nQUOmfcX/XFbA9nVFhiwRBFODRKaGrA1Psy0xpAG3w6JNHFTxz4eY4ZcKE4t2KcCjMrk3I0135oF83jpN6cBTr4gO5W2sm0dcIxHt1VveaXRq3apCojx/s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1psI3ctevFR286UcPZdwCGHJds5ApXM4olewMNnC2U=;
 b=96LtwpPi+Gqcungk5fNvuUX/FikE+3SrOcHQBGRM/x+fInTI0aKF4nQUOmfcX/XFbA9nVFhiwRBFODRKaGrA1Psy0xpAG3w6JNHFTxz4eY4ZcKE4t2KcCjMrk3I0135oF83jpN6cBTr4gO5W2sm0dcIxHt1VveaXRq3apCojx/s=
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
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiBGcmlkYXksIDExIE9jdG9iZXIgMjAxOSAwNjo0NToyNyBCU1QgamFtZXMg
cWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gQWRkIGEgbmV3IGhlbHBl
ciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkgZm9yIGRyaXZlciB0bwo+
IGNvbnZlcnQgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1lbnQgdGhh
dCBzdXBwb3J0ZWQgYnkKPiBoYXJkd2FyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFu
IHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjMgKysrKysrKysrKysr
KysrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCAgICAgfCAgMiArKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9y
X21nbXQuYwo+IGluZGV4IDRjZTVjNmQ4ZGU5OS4uM2Q1MzNkMGI0NWFmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9jb2xvcl9tZ210LmMKPiBAQCAtMTMyLDYgKzEzMiwyOSBAQCB1aW50MzJfdCBkcm1fY29s
b3JfbHV0X2V4dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lv
bikKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7Cj4gCj4gKy8q
Kgo+ICsgKiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uCj4gKyAqCj4gKyAqIEB1c2VyX2lu
cHV0OiBpbnB1dCB2YWx1ZQo+ICsgKiBAbTogbnVtYmVyIG9mIGludGVnZXIgYml0cwo+ICsgKiBA
bjogbnVtYmVyIG9mIGZyYWN0aW5hbCBiaXRzCj4gKyAqCj4gKyAqIENvbnZlcnQgYW5kIGNsYW1w
IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBjb21wbGVtZW50Lgo+ICsgKi8KPiAr
dWludDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0
LAo+ICsJCQkJICAgICAgdWludDMyX3QgbSwgdWludDMyX3QgbikKPiArewo+ICsJdTY0IG1hZyA9
ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBuKTsKVGhpcyBkb2Vzbid0IGFj
Y291bnQgZm9yIG4gPiAzMiwgd2hpY2ggaXMgcGVyZmVjdGx5IHBvc3NpYmxlIChlLmcuIFExLjYz
KS4KPiArCWJvb2wgbmVnYXRpdmUgPSAhISh1c2VyX2lucHV0ICYgQklUX1VMTCg2MykpOwo+ICsJ
czY0IHZhbDsKPiArCj4gKwkvKiB0aGUgcmFuZ2Ugb2Ygc2lnbmVkIDJzIGNvbXBsZW1lbnQgaXMg
Wy0yXm4rbSwgMl5uK20gLSAxXSAqLwo+ICsJdmFsID0gY2xhbXBfdmFsKG1hZywgMCwgbmVnYXRp
dmUgPyBCSVQobiArIG0pIDogQklUKG4gKyBtKSAtIDEpOwpUaGlzIGFsc28gZG9lc24ndCBhY2Nv
dW50IGZvciBuICsgbSA9PSA2NC4KPiArCj4gKwlyZXR1cm4gbmVnYXRpdmUgPyAwbGwgLSB2YWwg
OiB2YWw7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9u
KTsKPiArCj4gIC8qKgo+ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBj
b2xvciBtYW5hZ2VtZW50IHByb3BlcnRpZXMKPiAgICogQGNydGM6IERSTSBDUlRDCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29s
b3JfbWdtdC5oCj4gaW5kZXggZDFjNjYyZDkyYWI3Li42MGZlYTU1MDE4ODYgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9j
b2xvcl9tZ210LmgKPiBAQCAtMzAsNiArMzAsOCBAQCBzdHJ1Y3QgZHJtX2NydGM7Cj4gIHN0cnVj
dCBkcm1fcGxhbmU7Cj4gCj4gIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJf
dCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKTsKPiArdWludDY0X3QgZHJtX2Nv
bG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0LAo+ICsJCQkJICAgICAg
dWludDMyX3QgbSwgdWludDMyX3Qgbik7Cj4gCj4gIHZvaWQgZHJtX2NydGNfZW5hYmxlX2NvbG9y
X21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAJCQkJdWludCBkZWdhbW1hX2x1dF9zaXpl
LAo+IC0tCj4gMi4yMC4xCj4gCgoKLS0gCk1paGFpbAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
