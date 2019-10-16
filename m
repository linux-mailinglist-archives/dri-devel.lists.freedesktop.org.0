Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68335D8AAC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478E46E8F1;
	Wed, 16 Oct 2019 08:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B366E8F1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:17:59 +0000 (UTC)
Received: from DB7PR08CA0011.eurprd08.prod.outlook.com (2603:10a6:5:16::24) by
 AM7PR08MB5349.eurprd08.prod.outlook.com (2603:10a6:20b:106::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Wed, 16 Oct 2019 08:17:54 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by DB7PR08CA0011.outlook.office365.com
 (2603:10a6:5:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.21 via Frontend
 Transport; Wed, 16 Oct 2019 08:17:54 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 08:17:52 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Wed, 16 Oct 2019 08:17:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4048fbe81d140cb
X-CR-MTA-TID: 64aa7808
Received: from 3ddf269df2b1.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71997669-784B-4729-9D74-71C87DA38C55.1; 
 Wed, 16 Oct 2019 08:17:41 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ddf269df2b1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 16 Oct 2019 08:17:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHjERqKVEYA4XC+0l2jFctucNNUHHQ5vPvM587HA4Jw6GYrdgTWsngNX5oH9f7cUSqgLKYfXs+3q5YVDGTw9JuUZn4OviotMn3VXcm8PHdkNzOTSB73MGxR6CpUlFqa25DkGek/A7hvhL7sTzbIgKLZ8CIcJStDhJjSG1yeXgR/D3HIeMzoQ1MwsyBDBjyL+jNAX35icC6unES1soVVpu3lIBHx40TGLrtye01ZdQ/f71u+4o7A6zww6fWEIvs7frrMYsss81tpCXsekI11tQxHiwzvqxUPxvkYwTquq/o+QR0GCBTPt/z3sW0bGhAR4v7eWvtRkSg4iO2rR/i9/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=le/Ej3S8rS/gZETD3lUVB4HpAvqBPqFQ6ou+eF6oOVo=;
 b=an8Gid9o6dmccu/vtQCnhxORjKFCoUpwvCDbXoApE0cnPun+6h/gATuetgL5z1cqfLXZBw8zmOWHOviH7AEy81b5o8BUab1ZtzzjHHOAKaTRDMzktL87JeEHXS5cx3CThBXpZhBupE5HKcWAYTiYoJN4jX8cfZOPFST1Xtn8Y9fjEseuoKeQLwtnMWt/9RUMrjLhm6UgqdmAz0iuu8f7tfgeOvLcYINu96fchV+byj8xfWrP9R08rnF8xmfxtfTlvxDdow82RBN8pOyb/LZv5F5+IoxmlyZgFLQ5kjUtie+Lww6KcT7iWuHKa+4xxDZyV01dd2kStYTAdc99Ufe6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4797.eurprd08.prod.outlook.com (10.255.112.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 08:17:39 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 08:17:39 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: drm/komeda: Dump SC_ENH_* registers from scaler block
Thread-Topic: drm/komeda: Dump SC_ENH_* registers from scaler block
Thread-Index: AQHVg/otF4CnTywlm0G0XgUOe/TvGQ==
Date: Wed, 16 Oct 2019 08:17:39 +0000
Message-ID: <20191016081732.GA16502@jamwan02-TSP300>
References: <20191015105936.50039-1-mihail.atanassov@arm.com>
In-Reply-To: <20191015105936.50039-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:36::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5d285730-24bf-4e2f-0d06-08d75211573d
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4797:|VE1PR08MB4797:|AM7PR08MB5349:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53494D3ACC416C812E823D90B3920@AM7PR08MB5349.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:186;OLM:186;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(39860400002)(366004)(376002)(136003)(346002)(189003)(199004)(305945005)(54906003)(2906002)(7736002)(1076003)(99286004)(25786009)(6486002)(52116002)(6862004)(478600001)(6116002)(3846002)(33716001)(58126008)(6246003)(229853002)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(6636002)(4326008)(76176011)(86362001)(33656002)(316002)(14454004)(66066001)(6512007)(8936002)(486006)(8676002)(256004)(9686003)(6436002)(71190400001)(186003)(476003)(81156014)(6506007)(11346002)(26005)(81166006)(446003)(55236004)(71200400001)(386003)(14444005)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4797;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zSB27xuwHSoFqwPHJFo8jCR8P9Usd+poxCOlqhhSwao9zq9K2IUli1bHc9T0EjbGm9fl79ikE7HimiExcbgH+pUOqlMIONBUvVs5TSEL/sKfXM3XO4/vCBjzXhqe8I9cZxKngFs+lJZ6BFhRDuP9VdU8bzF0Yyo0pJFJuSwQoKY/0oeSRSqOSTNGkQ8FdZr1bBkJDgXiSAPXYAbV9hc+DMfhBi6eQn2acL+m9eROqaS89jKcpJLNVUOfSkqTEzVYa11FcVkaC0liGQRRMYwtGUUtLFl6SIvVk26d10tLDbelncmen/9Xach3YA48IIwMnumyNn6p2zgDBytu9p2l8OKZg5gpLGDNoqfSHxa/eTQAaIuf201bE77B2RwFBGX45QV7VSfRgI/KC47kx0ImgEiUcx+xKd00iQI/C6Xh6Pg=
Content-ID: <1F8A107BCB336F4F965370125CADD953@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4797
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(136003)(396003)(39860400002)(189003)(199004)(70206006)(14454004)(46406003)(76130400001)(25786009)(8676002)(6246003)(6486002)(23726003)(102836004)(186003)(478600001)(26826003)(81156014)(8746002)(97756001)(99286004)(8936002)(81166006)(33656002)(86362001)(14444005)(26005)(6506007)(66066001)(47776003)(76176011)(33716001)(70586007)(386003)(9686003)(11346002)(7736002)(336012)(446003)(6636002)(229853002)(305945005)(1076003)(476003)(63350400001)(3846002)(356004)(2906002)(107886003)(126002)(486006)(5660300002)(36906005)(6862004)(58126008)(316002)(54906003)(4326008)(22756006)(6116002)(6512007)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5349;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3a2af3e6-ab8b-4703-2ea0-08d752114f6d
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y9ycKp7NuWQjET1yhce7mVa5RapYiv1nzYyxTmZ3RiFtYabuQ0i35T3oiUxqQfd1wxn7OAkWxDQF8fJkHQ8b+vLjJMeVN5GwvcC4g5ImwEkTCiTQJwuq5C32U6q5hKVQqrF9fTf0kSuae+2uiuSGUoLJrvQ2DF203AUw9Z1FrqZl1m+jacDDYnz7vNS8ECVmDDjvN4zhQ6yxgMlg58f22wKnbThdavp6Q0JfRi2nPNxpEWZjex+UNOVCqApGVkqOOT+1ocJzziEBkQrglkdipyYQN6ipzszIJIotSZUSI0K1j9izbvXTg+X9tHZaWdzQXjrmcXVyU6xbN6UaTH8wQaSDtmoom8LfQgoq38mqB1GPMzO01AwrGWyRPQMnKeIgWv8z5SBbcf7sn8YXZv/XTTA1j2kbWh+a7YLGGaukEHA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 08:17:52.7204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d285730-24bf-4e2f-0d06-08d75211573d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5349
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=le/Ej3S8rS/gZETD3lUVB4HpAvqBPqFQ6ou+eF6oOVo=;
 b=vQPPZRV16Wr2UFKk0haadTKKAkaANbV9O43Ms7GjxgdmOkE7cT5/6GHcFtYjAPwTrd5t9kRO22eFRBoxX5E2M4cuXAJi68hkzUk5EXmSiaKHjH1U7gWAPvGvEiRkVGIBA6Yd710ESxm5NqKWjO8TmN1jqrTSgjBbZ6/qLTU5NbE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=le/Ej3S8rS/gZETD3lUVB4HpAvqBPqFQ6ou+eF6oOVo=;
 b=vQPPZRV16Wr2UFKk0haadTKKAkaANbV9O43Ms7GjxgdmOkE7cT5/6GHcFtYjAPwTrd5t9kRO22eFRBoxX5E2M4cuXAJi68hkzUk5EXmSiaKHjH1U7gWAPvGvEiRkVGIBA6Yd710ESxm5NqKWjO8TmN1jqrTSgjBbZ6/qLTU5NbE=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTE6MDA6MDFBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFz
c292QGFybS5jb20+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX2NvbXBvbmVudC5jIHwgMTQgKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gaW5kZXggYzNk
MjljMGIwNTFiLi43MjUyZmMzODdmYmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gQEAgLTcwMyw3ICs3
MDMsNyBAQCBzdGF0aWMgdm9pZCBkNzFfc2NhbGVyX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBv
bmVudCAqYywKPiAgCj4gIHN0YXRpYyB2b2lkIGQ3MV9zY2FsZXJfZHVtcChzdHJ1Y3Qga29tZWRh
X2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpzZikKPiAgewo+IC0JdTMyIHZbOV07Cj4g
Kwl1MzIgdlsxMF07Cj4gIAo+ICAJZHVtcF9ibG9ja19oZWFkZXIoc2YsIGMtPnJlZyk7Cj4gIAo+
IEBAIC03MjMsNiArNzIzLDE4IEBAIHN0YXRpYyB2b2lkIGQ3MV9zY2FsZXJfZHVtcChzdHJ1Y3Qg
a29tZWRhX2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpzZikKPiAgCXNlcV9wcmludGYo
c2YsICJTQ19IX0RFTFRBX1BIOlx0XHQweCVYXG4iLCB2WzZdKTsKPiAgCXNlcV9wcmludGYoc2Ys
ICJTQ19WX0lOSVRfUEg6XHRcdDB4JVhcbiIsIHZbN10pOwo+ICAJc2VxX3ByaW50ZihzZiwgIlND
X1ZfREVMVEFfUEg6XHRcdDB4JVhcbiIsIHZbOF0pOwo+ICsKPiArCWdldF92YWx1ZXNfZnJvbV9y
ZWcoYy0+cmVnLCAweDEzMCwgMTAsIHYpOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9MSU1J
VFM6XHRcdDB4JVhcbiIsIHZbMF0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjA6
XHRcdDB4JVhcbiIsIHZbMV0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjE6XHRc
dDB4JVhcbiIsIHZbMl0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjI6XHRcdDB4
JVhcbiIsIHZbM10pOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjM6XHRcdDB4JVhc
biIsIHZbNF0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjQ6XHRcdDB4JVhcbiIs
IHZbNV0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjU6XHRcdDB4JVhcbiIsIHZb
Nl0pOwo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjY6XHRcdDB4JVhcbiIsIHZbN10p
Owo+ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjc6XHRcdDB4JVhcbiIsIHZbOF0pOwo+
ICsJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjg6XHRcdDB4JVhcbiIsIHZbOV0pOwo+ICB9
Cj4KCkxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgoKPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBrb21lZGFfY29tcG9uZW50X2Z1bmNzIGQ3MV9zY2FsZXJfZnVuY3MgPSB7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
