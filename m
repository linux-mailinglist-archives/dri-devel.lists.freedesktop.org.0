Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840A1BAE73
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 09:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B90896EB;
	Mon, 23 Sep 2019 07:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130073.outbound.protection.outlook.com [40.107.13.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812BD894DD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 07:24:50 +0000 (UTC)
Received: from DB6PR0801CA0046.eurprd08.prod.outlook.com (2603:10a6:4:2b::14)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Mon, 23 Sep
 2019 07:24:45 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by DB6PR0801CA0046.outlook.office365.com
 (2603:10a6:4:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.19 via Frontend
 Transport; Mon, 23 Sep 2019 07:24:45 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 07:24:43 +0000
Received: ("Tessian outbound 5061e1b5386c:v31");
 Mon, 23 Sep 2019 07:24:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7d1295e3cd5b193
X-CR-MTA-TID: 64aa7808
Received: from d662ad4798ff.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FC8A64BE-91DC-4885-B43F-536B48960A92.1; 
 Mon, 23 Sep 2019 07:24:29 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d662ad4798ff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Sep 2019 07:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR/HvTlVRlctQiJQVzBS4B/pOIluKjMNMIgEaMBp5Ureppei5BZaB2+oinkxl3LRnYP7lDrfpTps3qQdlPvLJdjkoEHmUKsTp8TqP61PUMfCEjqEe11/f6+kTqHrk7FTiT7Z8QiVDeK8S04JoM/+5ICgt5Y39pAGBqpHIoZJoq6H5VmQ8jniWEPeEh5jgGE6wWA5u919mLz7hOL+Q9plI4yl2w3zYEiQKPFgdCyroJ4qhrDbpHsNeVAbWakN8UVvoHL6zJcYdtXU0PVSiF2LZK8AJcTBS5LYpGoV0WaSVpXaYB/iqq4g9aRlkAjo9+FQ887YPHr4D8vi0OJCRxQdww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VNW16wS9nXPqhCY2qLzM3t54qrCV/eC7CYLPD5gl0Q=;
 b=oBZDoIQOlQwTiFP+X/FigLiHsvpAJfIoiw3XyUk4QKx8xAfrabzuuKXAggp1nBC9AHxBqyfzI3ueBOBLSU6DRQeKSFMNgoiVGFuyaBgrqHUJuSmz07Tul3TZQUkXrLUHUuIek3Zv3MaJtrdYVwUYXcqS3pGWDRqaQ8dW53TOh5nZGoTaPM33Hg6ZLNNTcieGQEoOC8lIZBessV2E1+a39B/ztDIvTFtPfIzFFlGtpjcBoqAvRDi3QmCvhTUefc8pz5A1JOy81tXGnWCshw8z0D/WfvGN8H6BvGtU5ljKztZWiyhlxo+G6E5hC6g5vX93mXrldxJYnPBGpPeLJP8pog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4799.eurprd08.prod.outlook.com (10.255.115.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 07:24:26 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 07:24:26 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [v1,1/2] drm: Free the writeback_job when it with an empty fb
Thread-Topic: [v1,1/2] drm: Free the writeback_job when it with an empty fb
Thread-Index: AQHVcd/uPDLSm4oTDkStRUBRXbS/uA==
Date: Mon, 23 Sep 2019 07:24:26 +0000
Message-ID: <20190923072419.GA17006@jamwan02-TSP300>
References: <1564571048-15029-2-git-send-email-lowry.li@arm.com>
In-Reply-To: <1564571048-15029-2-git-send-email-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0206.apcprd02.prod.outlook.com
 (2603:1096:201:20::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7c31b196-21ec-4414-e6c5-08d73ff71ad2
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4799; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4799:|VE1PR08MB4799:|AM5PR0801MB1972:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972267465220776457FFFA4B3850@AM5PR0801MB1972.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:41;OLM:41;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(396003)(366004)(39850400004)(376002)(346002)(199004)(189003)(386003)(66066001)(4326008)(229853002)(478600001)(33656002)(6436002)(26005)(6636002)(6486002)(1076003)(25786009)(8936002)(186003)(316002)(7736002)(305945005)(58126008)(86362001)(81166006)(446003)(5660300002)(7416002)(6512007)(81156014)(476003)(11346002)(8676002)(486006)(9686003)(71190400001)(71200400001)(54906003)(66946007)(6116002)(3846002)(66556008)(66446008)(66476007)(52116002)(76176011)(33716001)(64756008)(14454004)(6246003)(99286004)(6506007)(55236004)(6862004)(256004)(102836004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4799;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: nu/8GwjlYPrJR7uWTxQHHN/V3edaq8k9qVZrsl78x2K3cBXiHxDFUM9bWTnhxyikC5coieVS0gOrJHxsT/azNFD0M3/LYFGS9XwM45wvetvASOmLAarjxlwNJqUGkFEYgtcfzsoE0huj8qyWu5c3hvn9dsZMxzitOrV/MscD7Ul4E6heTBjBLu2KOtuOxqs0lme7eyoVSbgfZBbQdpyENGOmGyW0mXNmxAaYhFYC53bsv8MbvPcu55w1Je02h5jnuinvC1f8Qs7tvJ7vuLgzMX8W1YxoMvFh9klf4qSwPCrRcpql/CIUggR3CjESxIxStKF9QjCPUpkIknUmqBE9U0yM+g3JxSINKmeqOc5hV+JvFJbE2qkbX5rqvafpb1RbHKkbSvpmvQEvLzO12Jj/1NSRJbZNNOqsXykfvt0TGsw=
Content-ID: <2817BAE5E83DDB4F9DB84419C25E7931@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4799
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(11346002)(336012)(9686003)(54906003)(81166006)(81156014)(6512007)(97756001)(63350400001)(476003)(66066001)(305945005)(58126008)(446003)(46406003)(102836004)(6246003)(33656002)(486006)(316002)(356004)(1076003)(107886003)(14454004)(6636002)(76130400001)(50466002)(36906005)(478600001)(26826003)(6862004)(7736002)(126002)(6486002)(33716001)(186003)(76176011)(70586007)(70206006)(8936002)(8746002)(26005)(22756006)(5660300002)(3846002)(2906002)(99286004)(8676002)(25786009)(47776003)(23726003)(6116002)(4326008)(386003)(86362001)(6506007)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1972;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fde72182-c92c-47cd-ca0b-08d73ff71076
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1972; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: NZe6a+gXjby0pH/UBfMttZfuKVskv8iEivR0DyMwAyewV+wb27FzbfbrVNxPfvV3zfPoUQGNogoyHyuc+BfbUg9YLFRqLP/ogxZ33FbI4UzDEng35i8j0x0ozXHFqT/OuG2sJVqtM/AcBHBqAtQnl2HdRikuhKLh6o0r7iM650h+3EQmIaJVsALcW2kb6FxDz8+cMjLI+7TXA3UwDfVZZVMzcoY46xfifLylHFpUHHydlCOlw+9TRbMv//pDTxGkosUBQ0u99tiVa5Zr24QN7jJhyOKX/mAyoIge6kiYDLbDUBDgHnY/xhi/DYlKwdJG+43HSoKHZNHGkLXq6jVUYVLjQtvp5VVBjE4gs6B6i0t14uJdK6jk92W9HSby30AhNbp0CBrgDc92mk4hdMNyPvW1mozf91JvYgsE2aqy65U=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 07:24:43.4704 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c31b196-21ec-4414-e6c5-08d73ff71ad2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VNW16wS9nXPqhCY2qLzM3t54qrCV/eC7CYLPD5gl0Q=;
 b=ggA/OuL4Py+E5XEiw0BcftPSXM8yeQMWz7RMWoZ6D7ff7yIkBpXDxqDpaf5oNdXrWpbzvGKkcA9Hk8Ikk+oCorT4j04OdaDEb7FovsgTWb/rh/TqRlxfX1nTqazQGYffEaQ2CbXn7EUX5dONpkJ2uhQiv//RFw6OORKm3WYEKUE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VNW16wS9nXPqhCY2qLzM3t54qrCV/eC7CYLPD5gl0Q=;
 b=ggA/OuL4Py+E5XEiw0BcftPSXM8yeQMWz7RMWoZ6D7ff7yIkBpXDxqDpaf5oNdXrWpbzvGKkcA9Hk8Ikk+oCorT4j04OdaDEb7FovsgTWb/rh/TqRlxfX1nTqazQGYffEaQ2CbXn7EUX5dONpkJ2uhQiv//RFw6OORKm3WYEKUE=
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
Cc: "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 nd <nd@arm.com>, "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTE6MDQ6MzhBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gQWRkcyB0aGUgY2hlY2sgaWYgdGhlIHdy
aXRlYmFja19qb2Igd2l0aCBhbiBlbXB0eSBmYiwgdGhlbiBpdCBzaG91bGQKPiBiZSBmcmVlZCBp
biBhdG9taWNfY2hlY2sgcGhhc2UuCj4gCj4gV2l0aCB0aGlzIGNoYW5nZSwgdGhlIGRyaXZlciB1
c2VycyB3aWxsIG5vdCBjaGVjayBlbXB0eSBmYiBjYXNlIGFueSBtb3JlLgo+IFNvIHJlZmluZWQg
YWNjb3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogTGl2aXUgRHVkYXUgPGxp
dml1LmR1ZGF1QGFybS5jb20+CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEphbWVz
IFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNv
bT4KCkFuZCB3aWxsIHB1c2ggaXQgdG8gZHJtLW1pc2MtZml4ZXMKCkphbWVzCgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyB8
ICAzICstLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9tdy5jICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMgICAgICAgICAgICAgIHwgIDQgKystLQo+
ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA1ICsrLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiBpbmRleCA2MTdlMWY3Li5kNjEwM2RkIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3di
X2Nvbm5lY3Rvci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfd2JfY29ubmVjdG9yLmMKPiBAQCAtNDMsOSArNDMsOCBAQAo+ICAJc3RydWN0IGtvbWVk
YV9kYXRhX2Zsb3dfY2ZnIGRmbG93Owo+ICAJaW50IGVycjsKPiAgCj4gLQlpZiAoIXdyaXRlYmFj
a19qb2IgfHwgIXdyaXRlYmFja19qb2ItPmZiKSB7Cj4gKwlpZiAoIXdyaXRlYmFja19qb2IpCj4g
IAkJcmV0dXJuIDA7Cj4gLQl9Cj4gIAo+ICAJaWYgKCFjcnRjX3N0LT5hY3RpdmUpIHsKPiAgCQlE
Uk1fREVCVUdfQVRPTUlDKCJDYW5ub3Qgd3JpdGUgdGhlIGNvbXBvc2l0aW9uIHJlc3VsdCBvdXQg
b24gYSBpbmFjdGl2ZSBDUlRDLlxuIik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX213LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9tdy5jCj4gaW5kZXgg
MmU4MTI1Mi4uYTU5MjI3YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlk
cF9tdy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYwo+IEBAIC0xMzAs
NyArMTMwLDcgQEAgc3RhdGljIHZvaWQgbWFsaWRwX213X2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YjsKPiAgCWludCBpLCBuX3BsYW5lczsKPiAgCj4gLQlpZiAoIWNvbm5fc3RhdGUtPndyaXRlYmFj
a19qb2IgfHwgIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2ItPmZiKQo+ICsJaWYgKCFjb25uX3N0
YXRlLT53cml0ZWJhY2tfam9iKQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCWZiID0gY29ubl9zdGF0
ZS0+d3JpdGViYWNrX2pvYi0+ZmI7Cj4gQEAgLTI0Nyw3ICsyNDcsNyBAQCB2b2lkIG1hbGlkcF9t
d19hdG9taWNfY29tbWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sCj4gIAo+ICAJbXdfc3RhdGUg
PSB0b19td19zdGF0ZShjb25uX3N0YXRlKTsKPiAgCj4gLQlpZiAoY29ubl9zdGF0ZS0+d3JpdGVi
YWNrX2pvYiAmJiBjb25uX3N0YXRlLT53cml0ZWJhY2tfam9iLT5mYikgewo+ICsJaWYgKGNvbm5f
c3RhdGUtPndyaXRlYmFja19qb2IpIHsKPiAgCQlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9
IGNvbm5fc3RhdGUtPndyaXRlYmFja19qb2ItPmZiOwo+ICAKPiAgCQlEUk1fREVWX0RFQlVHX0RS
SVZFUihkcm0tPmRldiwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMKPiBpbmRleCA0MTkzODFhLi4xNGFlYWY3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jCj4gQEAgLTQzMCwxMCArNDMwLDE1IEBAIHN0YXRpYyBp
bnQgZHJtX2F0b21pY19jb25uZWN0b3JfY2hlY2soc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KPiAgCj4gLQlpZiAod3JpdGViYWNrX2pv
Yi0+b3V0X2ZlbmNlICYmICF3cml0ZWJhY2tfam9iLT5mYikgewo+IC0JCURSTV9ERUJVR19BVE9N
SUMoIltDT05ORUNUT1I6JWQ6JXNdIHJlcXVlc3Rpbmcgb3V0LWZlbmNlIHdpdGhvdXQgZnJhbWVi
dWZmZXJcbiIsCj4gLQkJCQkgY29ubmVjdG9yLT5iYXNlLmlkLCBjb25uZWN0b3ItPm5hbWUpOwo+
IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJaWYgKCF3cml0ZWJhY2tfam9iLT5mYikgewo+ICsJCWlm
ICh3cml0ZWJhY2tfam9iLT5vdXRfZmVuY2UpIHsKPiArCQkJRFJNX0RFQlVHX0FUT01JQygiW0NP
Tk5FQ1RPUjolZDolc10gcmVxdWVzdGluZyBvdXQtZmVuY2Ugd2l0aG91dCBmcmFtZWJ1ZmZlclxu
IiwKPiArCQkJCQkgY29ubmVjdG9yLT5iYXNlLmlkLCBjb25uZWN0b3ItPm5hbWUpOwo+ICsJCQly
ZXR1cm4gLUVJTlZBTDsKPiArCQl9Cj4gKwo+ICsJCWRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Io
d3JpdGViYWNrX2pvYik7Cj4gKwkJc3RhdGUtPndyaXRlYmFja19qb2IgPSBOVUxMOwo+ICAJfQo+
ICAKPiAgCXJldHVybiAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X3dyaXRlYmFjay5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV93cml0
ZWJhY2suYwo+IGluZGV4IGFlMDcyOTAuLjA0ZWZhNzhkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfd3JpdGViYWNrLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X3dyaXRlYmFjay5jCj4gQEAgLTE0Nyw3ICsxNDcsNyBAQCBzdGF0
aWMgaW50IHJjYXJfZHVfd2JfZW5jX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIsCj4gIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZW5jb2Rlci0+ZGV2Owo+ICAJc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmI7Cj4gIAo+IC0JaWYgKCFjb25uX3N0YXRlLT53cml0ZWJh
Y2tfam9iIHx8ICFjb25uX3N0YXRlLT53cml0ZWJhY2tfam9iLT5mYikKPiArCWlmICghY29ubl9z
dGF0ZS0+d3JpdGViYWNrX2pvYikKPiAgCQlyZXR1cm4gMDsKPiAgCj4gIAlmYiA9IGNvbm5fc3Rh
dGUtPndyaXRlYmFja19qb2ItPmZiOwo+IEBAIC0yMjEsNyArMjIxLDcgQEAgdm9pZCByY2FyX2R1
X3dyaXRlYmFja19zZXR1cChzdHJ1Y3QgcmNhcl9kdV9jcnRjICpyY3J0YywKPiAgCXVuc2lnbmVk
IGludCBpOwo+ICAKPiAgCXN0YXRlID0gcmNydGMtPndyaXRlYmFjay5iYXNlLnN0YXRlOwo+IC0J
aWYgKCFzdGF0ZSB8fCAhc3RhdGUtPndyaXRlYmFja19qb2IgfHwgIXN0YXRlLT53cml0ZWJhY2tf
am9iLT5mYikKPiArCWlmICghc3RhdGUgfHwgIXN0YXRlLT53cml0ZWJhY2tfam9iKQo+ICAJCXJl
dHVybjsKPiAgCj4gIAlmYiA9IHN0YXRlLT53cml0ZWJhY2tfam9iLT5mYjsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdHhwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3Zj
NF90eHAuYwo+IGluZGV4IDk2ZjkxYzEuLmU5MmZhMTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfdHhwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAu
Ywo+IEBAIC0yMjksNyArMjI5LDcgQEAgc3RhdGljIGludCB2YzRfdHhwX2Nvbm5lY3Rvcl9hdG9t
aWNfY2hlY2soc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm4sCj4gIAlpbnQgaTsKPiAgCj4gIAlj
b25uX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29u
bik7Cj4gLQlpZiAoIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2IgfHwgIWNvbm5fc3RhdGUtPndy
aXRlYmFja19qb2ItPmZiKQo+ICsJaWYgKCFjb25uX3N0YXRlLT53cml0ZWJhY2tfam9iKQo+ICAJ
CXJldHVybiAwOwo+ICAKPiAgCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19z
dGF0ZShzdGF0ZSwgY29ubl9zdGF0ZS0+Y3J0Yyk7Cj4gQEAgLTI2OSw4ICsyNjksNyBAQCBzdGF0
aWMgdm9pZCB2YzRfdHhwX2Nvbm5lY3Rvcl9hdG9taWNfY29tbWl0KHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uLAo+ICAJdTMyIGN0cmw7Cj4gIAlpbnQgaTsKPiAgCj4gLQlpZiAoV0FSTl9PTigh
Y29ubl9zdGF0ZS0+d3JpdGViYWNrX2pvYiB8fAo+IC0JCSAgICAhY29ubl9zdGF0ZS0+d3JpdGVi
YWNrX2pvYi0+ZmIpKQo+ICsJaWYgKFdBUk5fT04oIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2Ip
KQo+ICAJCXJldHVybjsKPiAgCj4gIAltb2RlID0gJmNvbm5fc3RhdGUtPmNydGMtPnN0YXRlLT5h
ZGp1c3RlZF9tb2RlOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
