Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198110FB40
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1446E44E;
	Tue,  3 Dec 2019 10:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701386E02A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:00:13 +0000 (UTC)
Received: from VI1PR08CA0243.eurprd08.prod.outlook.com (2603:10a6:803:dc::16)
 by AM0PR08MB2980.eurprd08.prod.outlook.com (2603:10a6:208:5b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 3 Dec
 2019 10:00:08 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by VI1PR08CA0243.outlook.office365.com
 (2603:10a6:803:dc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Tue, 3 Dec 2019 10:00:08 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 10:00:08 +0000
Received: ("Tessian outbound d825562be5de:v37");
 Tue, 03 Dec 2019 10:00:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1467981df7640ece
X-CR-MTA-TID: 64aa7808
Received: from 115c1872aa5b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0817D7B9-7EC6-4019-81C1-2A8305A83F76.1; 
 Tue, 03 Dec 2019 09:59:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 115c1872aa5b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Dec 2019 09:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFqGR6wMsEnI066xRdHWxSRFWyDUuYrri2fQUlEvycvV7908BY3L0yRtwQDHWiQZu/2rH/IGWCxDZMDGrl2ThYdFMNhEwD8eTiW9DuRkmuqZLJPAcwB3fuRggCKSjLf6AgHzUwnZFz3hgpVWyCNSPKejMFfKPSqoyWPCSX425fa0PijgflnlAYmlo9QA9UukpfYcLuUpUPtjjYY17YYMf08X6Hf8n6Kl8X7KJtjQ/DN18FhRWIAZzijC6MdrsGe7uqYiM9zK5QfbHdZMn22wsIUxeDNUrATD5IPiTFWaiJwbtBsXSJ4amMOJwnYew4tcGj5KwLWK+ORw0GS3W3hl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiJyt8aCKTgavRWBmGI3w6BncY4jl9hnIRr6WijT/Bo=;
 b=WqSUE70vjC6CEymbLxMGVm2ERwUDvbWxFsOTND9e+KoDPn7DiIx/CDAjlmyANn060ixTzSkG/DPaViFJ2RM2L9x+iQj5eOfYxY1+Cx8fiar8XEbiwEHElrJUhAlg9FLvr6wNkY4Wa+1TOkv9ZrVs9inlRl9SPNEYZhXi6SopFLOV4AlLeSUXFWorYGcUfGjM0kaK1td6Oa13QPssXFbYqoS2+M9OKMhlKt5N3APgaUJCQVSnjgKLfehSaAa2Iu0dBcHxx1HhdwssSd2+bhP7b1A/DyZMCMtRBuljYZ0aKryXvvzvs8UBVfMwz6K0a8Kg/jVEtW0gx9LAvqWOQhggiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3455.eurprd08.prod.outlook.com (20.177.59.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Tue, 3 Dec 2019 09:59:58 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 09:59:58 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>, Liviu
 Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVoEQsEzx6hPV6tkqMxpVwDMM7k6emwEqAgAFJ2gCAADItgA==
Date: Tue, 3 Dec 2019 09:59:57 +0000
Message-ID: <2125422.nYgIr5rE5T@e123338-lin>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
 <15788924.1fOzIsmBsr@e123338-lin> <20191203064559.GA17018@jamwan02-TSP300>
In-Reply-To: <20191203064559.GA17018@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0121.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::13) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbfeedf8-893c-4c1b-62eb-08d777d7944f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3455:|VI1PR08MB3455:|AM0PR08MB2980:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB29803AF2546701D1E2B309648F420@AM0PR08MB2980.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 02408926C4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(6116002)(6636002)(81156014)(25786009)(3846002)(8936002)(110136005)(8676002)(2906002)(446003)(11346002)(14444005)(4326008)(6246003)(6436002)(316002)(229853002)(54906003)(71200400001)(71190400001)(81166006)(66556008)(66946007)(64756008)(66446008)(33716001)(66476007)(6486002)(86362001)(6512007)(9686003)(305945005)(5660300002)(7736002)(26005)(186003)(99286004)(76176011)(386003)(14454004)(102836004)(6506007)(478600001)(256004)(52116002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3455;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: M6va7nlN1wFPRw3K6mX6Uggvses1d5db9WvIM9DCzAnwvuTyicPUxilolzfiWFD0QrK0Lg/hDNDD5l0nQCFqC+P1wXNeHgTSqg9RGcnduwP8FaFqEmTtweKmUWl63BYtGo954ecCYjvZDmVr6aCBqLRk7m6/4oksNorBnLzk8gghZzIN9UpPeaDZg1wz4TByojD9DbIY8AXg6TX4ZHbxIEPZiTrHXN70QPuQR2phDETMuSQa9VC9lmSlLKnNxblvIK29R8TOD3hoWc37r4i6pVdkVtjkioR66wqECouw+ll0VRZ1pQ0zQG9K8G4emdpjlpD5rqFM1baas4ocg6eoV95cKJaVvfA/Q/G4O/Fgi7ITWL+t/hyhvmm5SEyo/4aEdimOJ4esIIdiWyPq5iJrDpV5GrafphyKye+8e4n87k8A4qQiFp9McnSPmqP/+7+V
Content-ID: <5D96D1DCD5A1DA4DBBDFE33B928A5BE8@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3455
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(26005)(110136005)(102836004)(86362001)(106002)(99286004)(186003)(478600001)(316002)(6506007)(54906003)(386003)(14444005)(356004)(46406003)(25786009)(76130400001)(70586007)(76176011)(50466002)(70206006)(2906002)(11346002)(5660300002)(26826003)(336012)(6116002)(23726003)(97756001)(446003)(3846002)(14454004)(81156014)(8936002)(8746002)(8676002)(81166006)(22756006)(6636002)(4326008)(305945005)(33716001)(6246003)(6486002)(6512007)(9686003)(7736002)(229853002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB2980;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e7209ab1-14e9-4218-1fb5-08d777d78db6
NoDisclaimer: True
X-Forefront-PRVS: 02408926C4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/Nk/2/aL2rE0gIQsvfDQrzraV8G2Ml78uchn+e9FjIC7POC1haxG4qOBEKTh+v8faQ+3PoZd0tWreIJljUtls2wgAACmjXJKp++un18Vro63t3zl9NfNzntCNoNSyiyUpi5Sga7qNV7oOT9isHrvk+nj/cqJppz1/CZotLPHOmepdgeJJKhJ/L2Y8d++H1H3kJN2UgC5dLxhWXv8dQm1MSnFxEbnIdUTO8Rsg7VbN4xmPLI51KlrdKz0NPRI/4fGWefEFiEQlmCWaGwYfgBH71IVEvQY+htehI6A1tMi40Bdq1uHnHXw4wzO8RGf9LEf+GGOpUECcpumFBO2UzepXb7DQEWsDXZ+lFuCtbFvpyOz0ptgIs3m4beaPAPd17IxhKnyH730P60SlcBgOeIDXSkmDBF82t0oF+ZJTIt/LbA9/AnJ2CSM4wQcgmwmQ7EQsmdsc+RX9Ttt0gMHwSWlf4oX96364tskqaPZG60mi6YFnSkrrO3TUIqvMne2YM9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 10:00:08.5418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfeedf8-893c-4c1b-62eb-08d777d7944f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2980
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiJyt8aCKTgavRWBmGI3w6BncY4jl9hnIRr6WijT/Bo=;
 b=uMQrEsn9tlIUnBx2hpdUQem7nLe09M3A+HCqvrJPbkdcNJ2OE8ByN0nY0vn8rx7XG0sccDH8VvODbnLAFCQW1Tu3A4euP8yGf3+tNSmrhi2sxXKCPQTh4FK9DpYcBQGVnPPYCZxEJf1P1phFuqc0CBVoKFHBMGik0Gn1wg3sulk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiJyt8aCKTgavRWBmGI3w6BncY4jl9hnIRr6WijT/Bo=;
 b=uMQrEsn9tlIUnBx2hpdUQem7nLe09M3A+HCqvrJPbkdcNJ2OE8ByN0nY0vn8rx7XG0sccDH8VvODbnLAFCQW1Tu3A4euP8yGf3+tNSmrhi2sxXKCPQTh4FK9DpYcBQGVnPPYCZxEJf1P1phFuqc0CBVoKFHBMGik0Gn1wg3sulk=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMyBEZWNlbWJlciAyMDE5IDA2OjQ2OjA2IEdNVCBqYW1lcyBxaWFuIHdhbmcg
KEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBPbiBNb24sIERlYyAwMiwgMjAxOSBhdCAx
MTowNzo1MkFNICswMDAwLCBNaWhhaWwgQXRhbmFzc292IHdyb3RlOgo+ID4gT24gVGh1cnNkYXks
IDIxIE5vdmVtYmVyIDIwMTkgMDg6MTc6NDUgR01UIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hu
b2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBEMzIgaXMgc2ltcGxlIHZlcnNpb24gb2YgRDcxLCB0
aGUgZGlmZmVyZW5jZSBpczoKPiA+ID4gLSBPbmx5IGhhcyBvbmUgcGlwZWxpbmUKPiA+ID4gLSBE
cm9wIHRoZSBwZXJpcGggYmxvY2sgYW5kIG1lcmdlIGl0IHRvIEdDVQo+ID4gPiAKPiA+ID4gdjI6
IFJlYmFzZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiA+ID4gLS0tCj4g
PiA+ICAuLi4vZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaCAgfCAgMyAr
LQo+ID4gPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAgIHwg
IDIgKy0KPiA+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5j
ICB8IDQzICsrKysrKysrKysrKy0tLS0tLS0KPiA+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCB8IDEzICsrKysrKwo+ID4gPiAgLi4uL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyAgIHwgIDEgKwo+ID4gPiAgNSBmaWxlcyBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVj
dC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3Qu
aAo+ID4gPiBpbmRleCA5NmUyZTQwMTYyNTAuLmRiZDNkNDc2NTA2NSAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJv
ZHVjdC5oCj4gPiA+IEBAIC0xOCw3ICsxOCw4IEBACj4gPiA+ICAjZGVmaW5lIE1BTElEUF9DT1JF
X0lEX1NUQVRVUyhfX2NvcmVfaWQpICAgICAoKChfX3UzMikoX19jb3JlX2lkKSkgJiAweEZGKQo+
ID4gPiAgCj4gPiA+ICAvKiBNYWxpLWRpc3BsYXkgcHJvZHVjdCBJRHMgKi8KPiA+ID4gLSNkZWZp
bmUgTUFMSURQX0Q3MV9QUk9EVUNUX0lEICAgMHgwMDcxCj4gPiA+ICsjZGVmaW5lIE1BTElEUF9E
NzFfUFJPRFVDVF9JRAkweDAwNzEKPiA+ID4gKyNkZWZpbmUgTUFMSURQX0QzMl9QUk9EVUNUX0lE
CTB4MDAzMgo+ID4gPiAgCj4gPiA+ICB1bmlvbiBrb21lZGFfY29uZmlnX2lkIHsKPiA+ID4gIAlz
dHJ1Y3Qgewo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiA+IGluZGV4IDZkYWRmNDQxM2VmMy4uYzdmN2U5
YzU0NWM3IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiA+IEBAIC0xMjc0LDcgKzEyNzQs
NyBAQCBzdGF0aWMgaW50IGQ3MV90aW1pbmdfY3RybHJfaW5pdChzdHJ1Y3QgZDcxX2RldiAqZDcx
LAo+ID4gPiAgCj4gPiA+ICAJY3RybHIgPSB0b19jdHJscihjKTsKPiA+ID4gIAo+ID4gPiAtCWN0
cmxyLT5zdXBwb3J0c19kdWFsX2xpbmsgPSB0cnVlOwo+ID4gPiArCWN0cmxyLT5zdXBwb3J0c19k
dWFsX2xpbmsgPSBkNzEtPnN1cHBvcnRzX2R1YWxfbGluazsKPiA+ID4gIAo+ID4gPiAgCXJldHVy
biAwOwo+ID4gPiAgfQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2Rldi5jCj4gPiA+IGluZGV4IDliM2JmMzUzYjZjYy4uMmQ0MjllMzEwZTVi
IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfZGV2LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9kNzEvZDcxX2Rldi5jCj4gPiA+IEBAIC0zNzEsMjMgKzM3MSwzMyBAQCBzdGF0aWMgaW50IGQ3
MV9lbnVtX3Jlc291cmNlcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiA+ID4gIAkJZ290byBl
cnJfY2xlYW51cDsKPiA+ID4gIAl9Cj4gPiA+ICAKPiA+ID4gLQkvKiBwcm9iZSBQRVJJUEggKi8K
PiA+ID4gKwkvKiBPbmx5IHRoZSBsZWdhY3kgSFcgaGFzIHRoZSBwZXJpcGggYmxvY2ssIHRoZSBu
ZXdlciBtZXJnZXMgdGhlIHBlcmlwaAo+ID4gPiArCSAqIGludG8gR0NVCj4gPiA+ICsJICovCj4g
PiA+ICAJdmFsdWUgPSBtYWxpZHBfcmVhZDMyKGQ3MS0+cGVyaXBoX2FkZHIsIEJMS19CTE9DS19J
TkZPKTsKPiA+ID4gLQlpZiAoQkxPQ0tfSU5GT19CTEtfVFlQRSh2YWx1ZSkgIT0gRDcxX0JMS19U
WVBFX1BFUklQSCkgewo+ID4gPiAtCQlEUk1fRVJST1IoImFjY2VzcyBibGsgcGVyaXBoIGJ1dCBn
b3QgYmxrOiAlZC5cbiIsCj4gPiA+IC0JCQkgIEJMT0NLX0lORk9fQkxLX1RZUEUodmFsdWUpKTsK
PiA+ID4gLQkJZXJyID0gLUVJTlZBTDsKPiA+ID4gLQkJZ290byBlcnJfY2xlYW51cDsKPiA+ID4g
KwlpZiAoQkxPQ0tfSU5GT19CTEtfVFlQRSh2YWx1ZSkgIT0gRDcxX0JMS19UWVBFX1BFUklQSCkK
PiA+ID4gKwkJZDcxLT5wZXJpcGhfYWRkciA9IE5VTEw7Cj4gPiA+ICsKPiA+ID4gKwlpZiAoZDcx
LT5wZXJpcGhfYWRkcikgewo+ID4gPiArCQkvKiBwcm9iZSBQRVJJUEhFUkFMIGluIGxlZ2FjeSBI
VyAqLwo+ID4gPiArCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5wZXJpcGhfYWRkciwgUEVS
SVBIX0NPTkZJR1VSQVRJT05fSUQpOwo+ID4gPiArCj4gPiA+ICsJCWQ3MS0+bWF4X2xpbmVfc2l6
ZQk9IHZhbHVlICYgUEVSSVBIX01BWF9MSU5FX1NJWkUgPyA0MDk2IDogMjA0ODsKPiA+ID4gKwkJ
ZDcxLT5tYXhfdnNpemUJCT0gNDA5NjsKPiA+ID4gKwkJZDcxLT5udW1fcmljaF9sYXllcnMJPSB2
YWx1ZSAmIFBFUklQSF9OVU1fUklDSF9MQVlFUlMgPyAyIDogMTsKPiA+ID4gKwkJZDcxLT5zdXBw
b3J0c19kdWFsX2xpbmsJPSAhISh2YWx1ZSAmIFBFUklQSF9TUExJVF9FTik7Cj4gPiA+ICsJCWQ3
MS0+aW50ZWdyYXRlc190YnUJPSAhISh2YWx1ZSAmIFBFUklQSF9UQlVfRU4pOwo+ID4gPiArCX0g
ZWxzZSB7Cj4gPiA+ICsJCXZhbHVlID0gbWFsaWRwX3JlYWQzMihkNzEtPmdjdV9hZGRyLCBHQ1Vf
Q09ORklHVVJBVElPTl9JRDApOwo+ID4gPiArCQlkNzEtPm1heF9saW5lX3NpemUJPSBHQ1VfTUFY
X0xJTkVfU0laRSh2YWx1ZSk7Cj4gPiA+ICsJCWQ3MS0+bWF4X3ZzaXplCQk9IEdDVV9NQVhfTlVN
X0xJTkVTKHZhbHVlKTsKPiA+ID4gKwo+ID4gPiArCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcx
LT5nY3VfYWRkciwgR0NVX0NPTkZJR1VSQVRJT05fSUQxKTsKPiA+ID4gKwkJZDcxLT5udW1fcmlj
aF9sYXllcnMJPSBHQ1VfTlVNX1JJQ0hfTEFZRVJTKHZhbHVlKTsKPiA+ID4gKwkJZDcxLT5zdXBw
b3J0c19kdWFsX2xpbmsJPSBHQ1VfRElTUExBWV9TUExJVF9FTih2YWx1ZSk7Cj4gPiA+ICsJCWQ3
MS0+aW50ZWdyYXRlc190YnUJPSBHQ1VfRElTUExBWV9UQlVfRU4odmFsdWUpOwo+ID4gPiAgCX0K
PiA+ID4gIAo+ID4gPiAtCXZhbHVlID0gbWFsaWRwX3JlYWQzMihkNzEtPnBlcmlwaF9hZGRyLCBQ
RVJJUEhfQ09ORklHVVJBVElPTl9JRCk7Cj4gPiA+IC0KPiA+ID4gLQlkNzEtPm1heF9saW5lX3Np
emUJPSB2YWx1ZSAmIFBFUklQSF9NQVhfTElORV9TSVpFID8gNDA5NiA6IDIwNDg7Cj4gPiA+IC0J
ZDcxLT5tYXhfdnNpemUJCT0gNDA5NjsKPiA+ID4gLQlkNzEtPm51bV9yaWNoX2xheWVycwk9IHZh
bHVlICYgUEVSSVBIX05VTV9SSUNIX0xBWUVSUyA/IDIgOiAxOwo+ID4gPiAtCWQ3MS0+c3VwcG9y
dHNfZHVhbF9saW5rCT0gdmFsdWUgJiBQRVJJUEhfU1BMSVRfRU4gPyB0cnVlIDogZmFsc2U7Cj4g
PiA+IC0JZDcxLT5pbnRlZ3JhdGVzX3RidQk9IHZhbHVlICYgUEVSSVBIX1RCVV9FTiA/IHRydWUg
OiBmYWxzZTsKPiA+ID4gLQo+ID4gPiAgCWZvciAoaSA9IDA7IGkgPCBkNzEtPm51bV9waXBlbGlu
ZXM7IGkrKykgewo+ID4gPiAgCQlwaXBlID0ga29tZWRhX3BpcGVsaW5lX2FkZChtZGV2LCBzaXpl
b2Yoc3RydWN0IGQ3MV9waXBlbGluZSksCj4gPiA+ICAJCQkJCSAgICZkNzFfcGlwZWxpbmVfZnVu
Y3MpOwo+ID4gPiBAQCAtNDE1LDcgKzQyNSw3IEBAIHN0YXRpYyBpbnQgZDcxX2VudW1fcmVzb3Vy
Y2VzKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ID4gPiAgCX0KPiA+ID4gIAo+ID4gPiAgCS8q
IGxvb3AgdGhlIHJlZ2lzdGVyIGJsa3MgYW5kIHByb2JlICovCj4gPiA+IC0JaSA9IDI7IC8qIGV4
Y2x1ZGUgR0NVIGFuZCBQRVJJUEggKi8KPiA+ID4gKwlpID0gMTsgLyogZXhjbHVkZSBHQ1UgKi8K
PiA+ID4gIAlvZmZzZXQgPSBENzFfQkxPQ0tfU0laRTsgLyogc2tpcCBHQ1UgKi8KPiA+ID4gIAl3
aGlsZSAoaSA8IGQ3MS0+bnVtX2Jsb2Nrcykgewo+ID4gPiAgCQlibGtfYmFzZSA9IG1kZXYtPnJl
Z19iYXNlICsgKG9mZnNldCA+PiAyKTsKPiA+ID4gQEAgLTQyNSw5ICs0MzUsOSBAQCBzdGF0aWMg
aW50IGQ3MV9lbnVtX3Jlc291cmNlcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiA+ID4gIAkJ
CWVyciA9IGQ3MV9wcm9iZV9ibG9jayhkNzEsICZibGssIGJsa19iYXNlKTsKPiA+ID4gIAkJCWlm
IChlcnIpCj4gPiA+ICAJCQkJZ290byBlcnJfY2xlYW51cDsKPiA+ID4gLQkJCWkrKzsKPiA+ID4g
IAkJfQo+ID4gPiAgCj4gPiA+ICsJCWkrKzsKPiA+IAo+ID4gVGhpcyBjaGFuZ2UgZG9lc24ndCBt
YWtlIG11Y2ggc2Vuc2UgaWYgeW91IHdhbnQgdG8gY291bnQgaG93IG1hbnkKPiA+IGJsb2NrcyBh
cmUgYXZhaWxhYmxlLCBzaW5jZSB5b3UncmUgbm93IGNvdW50aW5nIHRoZSByZXNlcnZlZCBvbmVz
LCB0b28uCj4gCj4gVGhhdCdzIGJlY2F1c2UgZm9yIEQzMiBudW1fYmxvY2tzIGluY2x1ZGVzIHRo
ZSByZXNlcnZlZCBibG9ja3MuCj4gCj4gPiBPbiB0aGUgY291bnRpbmcgbm90ZSwgdGhlIHByaW9y
IGNvZGUgcmlkZXMgb24gdGhlIGFzc3VtcHRpb24gdGhlIHBlcmlwaAo+ID4gYmxvY2sgaXMgbGFz
dCBpbiB0aGUgbWFwLCBhbmQgSSBkb24ndCBzZWUgaG93IHlvdSBzdGlsbCBoYW5kbGUgbm90Cj4g
PiBjb3VudGluZyBpdCBpbiB0aGUgRDcxIGNhc2UuCj4gCj4gU2luY2UgRDcxIGhhcyBvbmUgcmVz
ZXJ2ZWQgYmxvY2ssIGFuZCBub3cgd2UgY291bnQgcmVzZXJ2ZWQgYmxvY2suCj4gCj4gU28gbm93
IG5vIG1hdHRlciBEMzIgb3IgRDcxOgo+ICAgbnVtX2Jsb2NrcyA9IG5fdmFsaWRfYmxvY2sgKyBu
X3Jlc2VydmVkX2Jsb2NrICsgR0NVLgoKU28gYXQgbGVhc3Qgd2UgbmVlZCB0aGF0IGNvbW1lbnQg
ZHJvcHBlZCBpbiB3aXRoIHRoZSBjb2RlLiBGdXR1cmUgSFcKbWlnaHQgYnJlYWsgeW91ciBhc3N1
bXB0aW9uIGhlcmUgb25jZSBtb3JlIGFuZCBpdCB3aWxsIHRoZW4gYmUgdXNlZnVsCnRvIGtub3cg
d2h5IHRoaXMgd29ya3MgZm9yIGJvdGggcHJvZHVjdHMuCgpJJ2QgcGVyc29uYWxseSBhYnN0cmFj
dCB0aGF0IGEgYml0IGJlaGluZCBhIHNtYWxsIGhlbHBlciBmdW5jIGFuZApoYW5kbGUgZGlmZmVy
ZW50IHByb2R1Y3RzIHNlcGFyYXRlbHkuIEl0J3MgYSBiaXQgb2YgZHVwbGljYXRpb24gYnV0Cm11
Y2ggZWFzaWVyIHRvIGNvbXByZWhlbmQuIFNhdmVkIGN5Y2xlcyByZWFkaW5nIGNvZGUgPT0gR29v
ZCBUaGluZyh0bSkuCgo+IAo+IFRoYW5rcwo+IEphbWVzCj4gPiAKPiA+ID4gIAkJb2Zmc2V0ICs9
IEQ3MV9CTE9DS19TSVpFOwo+ID4gPiAgCX0KPiA+ID4gIAo+ID4gPiBAQCAtNjAzLDYgKzYxMyw3
IEBAIGQ3MV9pZGVudGlmeSh1MzIgX19pb21lbSAqcmVnX2Jhc2UsIHN0cnVjdCBrb21lZGFfY2hp
cF9pbmZvICpjaGlwKQo+ID4gPiAgCj4gPiA+ICAJc3dpdGNoIChwcm9kdWN0X2lkKSB7Cj4gPiA+
ICAJY2FzZSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQ6Cj4gPiA+ICsJY2FzZSBNQUxJRFBfRDMyX1BS
T0RVQ1RfSUQ6Cj4gPiA+ICAJCWZ1bmNzID0gJmQ3MV9jaGlwX2Z1bmNzOwo+ID4gPiAgCQlicmVh
azsKPiA+ID4gIAlkZWZhdWx0Ogo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmgKPiA+ID4gaW5kZXggMTcyN2RjOTkzOTA5Li44MWRl
NmEyM2U3ZjMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEvZDcxL2Q3MV9yZWdzLmgKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaAo+ID4gPiBAQCAtNzIsNiArNzIsMTkgQEAKPiA+ID4g
ICNkZWZpbmUgR0NVX0NPTlRST0xfTU9ERSh4KQkoKHgpICYgMHg3KQo+ID4gPiAgI2RlZmluZSBH
Q1VfQ09OVFJPTF9TUlNUCUJJVCgxNikKPiA+ID4gIAo+ID4gPiArLyogR0NVX0NPTkZJR1VSQVRJ
T04gcmVnaXN0ZXJzICovCj4gPiA+ICsjZGVmaW5lIEdDVV9DT05GSUdVUkFUSU9OX0lEMAkweDEw
MAo+ID4gPiArI2RlZmluZSBHQ1VfQ09ORklHVVJBVElPTl9JRDEJMHgxMDQKPiA+ID4gKwo+ID4g
PiArLyogR0NVIGNvbmZpZ3VyYXRpb24gKi8KPiA+ID4gKyNkZWZpbmUgR0NVX01BWF9MSU5FX1NJ
WkUoeCkJKCh4KSAmIDB4RkZGRikKPiA+ID4gKyNkZWZpbmUgR0NVX01BWF9OVU1fTElORVMoeCkJ
KCh4KSA+PiAxNikKPiA+ID4gKyNkZWZpbmUgR0NVX05VTV9SSUNIX0xBWUVSUyh4KQkoKHgpICYg
MHg3KQo+ID4gPiArI2RlZmluZSBHQ1VfTlVNX1BJUEVMSU5FUyh4KQkoKCh4KSA+PiAzKSAmIDB4
NykKPiA+ID4gKyNkZWZpbmUgR0NVX05VTV9TQ0FMRVJTKHgpCSgoKHgpID4+IDYpICYgMHg3KQo+
ID4gPiArI2RlZmluZSBHQ1VfRElTUExBWV9TUExJVF9FTih4KQkoKCh4KSA+PiAxNikgJiAweDEp
Cj4gPiA+ICsjZGVmaW5lIEdDVV9ESVNQTEFZX1RCVV9FTih4KQkoKCh4KSA+PiAxNykgJiAweDEp
Cj4gPiA+ICsKPiA+ID4gIC8qIEdDVSBvcG1vZGUgKi8KPiA+ID4gICNkZWZpbmUgSU5BQ1RJVkVf
TU9ERQkJMAo+ID4gPiAgI2RlZmluZSBUQlVfQ09OTkVDVF9NT0RFCTEKPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiA+ID4gaW5kZXgg
YjdhMTA5N2M0NWM0Li5hZDM4YmJjNzQzMWUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCj4gPiA+IEBAIC0xMjUsNiAr
MTI1LDcgQEAgc3RhdGljIGludCBrb21lZGFfcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gPiA+ICAKPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGtvbWVkYV9vZl9tYXRjaFtdID0gewo+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAiYXJt
LG1hbGktZDcxIiwgLmRhdGEgPSBkNzFfaWRlbnRpZnksIH0sCj4gPiA+ICsJeyAuY29tcGF0aWJs
ZSA9ICJhcm0sbWFsaS1kMzIiLCAuZGF0YSA9IGQ3MV9pZGVudGlmeSwgfSwKPiA+ID4gIAl7fSwK
PiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gCj4gPiAKPiA+IAo+IAoKCi0tIApNaWhhaWwKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
