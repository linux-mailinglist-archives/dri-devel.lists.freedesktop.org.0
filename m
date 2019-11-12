Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4334DF8EFA
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71EA6E3FC;
	Tue, 12 Nov 2019 11:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00059.outbound.protection.outlook.com [40.107.0.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8766E3FC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:52:28 +0000 (UTC)
Received: from VI1PR08CA0140.eurprd08.prod.outlook.com (2603:10a6:800:d5::18)
 by DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Tue, 12 Nov
 2019 11:52:25 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0140.outlook.office365.com
 (2603:10a6:800:d5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Tue, 12 Nov 2019 11:52:25 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 11:52:25 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Tue, 12 Nov 2019 11:52:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 990fa87b6722da71
X-CR-MTA-TID: 64aa7808
Received: from e64fda5d0630.2 (cr-mta-lb-1.cr-mta-net [104.47.12.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 651B3BC4-FDEF-4813-9AE5-357136D0C3CD.1; 
 Tue, 12 Nov 2019 11:52:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e64fda5d0630.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Nov 2019 11:52:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzoNu+Oy2oTMbnpauQgss0KfpQAZ2dPITJgZvyhdw7skGCEeRku/uSqtVBpeyVCzL9NdXG1Fn1BQnbOTrtRAWzKPh9pu/QEyDJKN3Kgoq3P1MKJjh8gv8JEDCHTMVmV+xgXn6UiUMOGJIne0s9wjJy9kUA06ZfnKigN6/7GOVKfTbgTaRRoIKlsdrCuHzs5jTGAvTXiaVbgqVx51FZAB4RqT+GnNVAV6evOh6u7OCxCLS01MuymGeXdB0P8CcSvmDCCwvvEjuhkT7tm4FpFnpmMoh8+ZGFeyAmmBIQn3BLZCxGH8c2+g3sfZuyBC+xhskZQNbSSbFDkfYP/eGzqK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8bcD1Rn3g/wvU88dm2YkWjdsS0Av12Mb0Z7Kg8i+b8=;
 b=VpR3NwRT5Xhmm1PbjEDEowJnC2ifZj3CQbVgs0X0cdUKkhbjomui3mnHWC1zM9PWDlF+XHsqaSP4jwZohZUycSI1IonyG2f7J7DzlA6tIX0m7WdjDAg0sqVGlWdsz78VaxHVCJ9OLUEpaOO1uG3X9+6JH5IVqq9nSpWuTwZeUl08h2rH9zLlynhBL4JBaJozFNJqvn0uZuMY0DcPJZtpLvN6f1O8dlZkrGH1CBOfKTGjCbdulACFbH3/phXFqmB7ndqTcB1kqLllDBctLVGDHhEJrmpnosrAnCsuu5KWQniXwAYMiIUyAnSEgJvW3A1a70bZpEnyu56uZsNWrisN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3039.eurprd08.prod.outlook.com (52.134.30.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 11:52:15 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 11:52:15 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v10 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Topic: [PATCH v10 0/4] drm/komeda: Enable CRTC color-mgmt
Thread-Index: AQHVmUmzadJRLQDUbEqKWZFNceLR8aeHbKuA
Date: Tue, 12 Nov 2019 11:52:15 +0000
Message-ID: <6272646.IaTXCZQg1I@e123338-lin>
References: <20191112110927.20931-1-james.qian.wang@arm.com>
In-Reply-To: <20191112110927.20931-1-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0310.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::34) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8432678c-b789-4509-3462-08d76766c94b
X-MS-TrafficTypeDiagnostic: VI1PR08MB3039:|VI1PR08MB3039:|DB8PR08MB4969:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4969381521FA6D060628B0128F770@DB8PR08MB4969.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(199004)(189003)(54906003)(66476007)(102836004)(66556008)(64756008)(66446008)(478600001)(6506007)(386003)(3846002)(6116002)(6436002)(76176011)(66946007)(305945005)(66066001)(14454004)(99286004)(25786009)(229853002)(7736002)(5660300002)(966005)(6486002)(86362001)(52116002)(316002)(71200400001)(71190400001)(8936002)(8676002)(6512007)(186003)(446003)(11346002)(2906002)(81166006)(81156014)(256004)(6636002)(6246003)(14444005)(9686003)(6306002)(33716001)(6862004)(476003)(486006)(4326008)(26005)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3039;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Sye+loC/mKW6gOJZO2KOEfk6fdkDcSD/x53pTJRM4EEvIw5eA0ITaQLvnuGolYd+z3xXxfM16LnKzYSntq015uYoSKI+X9Wa4iCEgsWnnbN819DK/gMJ0jj+idrHs23AJ2HxAq0wDglU2c6XISEp+4K8LhS+KqggsaQJ+FYqDpGuFAxV0KNKhGpwpSX+ErsGfi3ITRAl2ZeSvHjcDe+834p0PUqbZBg8+UoA6LoJYat8wCp4IEH9djML638HbHPnRK+RawlONolviIB6UFfwrNqfdRzQ15d+hMo+BTuiKdxuOwcnEQfilLoW8OjxzCQx7a1rlXaWChJnNfRaqZJfSf6OammBLcqQMPzaEq7mUSw1u6lpaj1ulWBsM0TSZBWTlK05nlOlUvhxI6vxP0Bat/S6BwcFO4D1C2+Nw9YVja1knMsMe7lbT5DG05ecsCX4sommHiif7kabM2NVs2BDgCfrx/xEsAU6UUj54Llci+o=
Content-ID: <B99FC4C389AC0645ACAD19F6294BC3A0@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3039
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(136003)(39860400002)(396003)(1110001)(339900001)(189003)(199004)(3846002)(7736002)(486006)(6506007)(6862004)(76176011)(386003)(105606002)(99286004)(102836004)(11346002)(50466002)(47776003)(446003)(26005)(476003)(25786009)(66066001)(305945005)(336012)(126002)(86362001)(4326008)(6116002)(2906002)(23726003)(478600001)(229853002)(14454004)(186003)(9686003)(8936002)(8676002)(316002)(26826003)(966005)(81156014)(81166006)(54906003)(36906005)(8746002)(6306002)(14444005)(76130400001)(5660300002)(33716001)(356004)(6486002)(46406003)(6512007)(97756001)(70586007)(70206006)(22756006)(6636002)(6246003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4969;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8f2eb443-86b8-4851-70c7-08d76766c2e0
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QZH+4utR6U32/0hjbFTjUgpFFSZrckTyVMV8D78uDMs3Bum8HXdTDxBF8Ap3cM8W02b6LcDaf4FtDdcu8sce7SErbBHAkTSOPNLBDzKJfjEOalhc0S+g0C06PDygDy7MXf2c30McLGyMDgY+0jI8j5WHjKjJfcZB/t5P6zMq+AUyvJTLG9pK3D5MadS9PAP5W/h+O2GrAy5QE5bnyFphM3lotmDW3+sJYGuNknYppAAJ8LW9Ym4msMxwze9HO5XFVah7ZOKLOqxFmnzprm/f0Rg5157hYzgST3H4Jd/BcmITrELfssi3kOXcjvceHm5OVmgzLpbU5irdOdhcRKkjsoqb+8/c0jTR7d4uC5r0sQCsQqclIo6b2B7FLVJQWqXFsGMt0qYpc2V22PRNSZ+N0okgv9fM72C5KBSjVVUCj+fsRczWqhYu4/zp1jue4TZ1aW7vGlpw8wHrnzTlyhieOJrjD2HlNrPDP5f9hF8HoFI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 11:52:25.6557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8432678c-b789-4509-3462-08d76766c94b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4969
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8bcD1Rn3g/wvU88dm2YkWjdsS0Av12Mb0Z7Kg8i+b8=;
 b=sS0MdmCa8f2R+FnNhN2KoKBKqH7dHWJWg4cLOQxrA7aWlf9tfJ7558HTlvMSomUWPhHXV07JhdJOIVcHzvLnnVEoiTzoZl7fZjN1Q1chs4vYNXMuBnmbxsMfd7Sn5CJcQJnaxjlsyoqRqFXAOYSoRLUr1fCaTeWaSDQZPlSmDHo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8bcD1Rn3g/wvU88dm2YkWjdsS0Av12Mb0Z7Kg8i+b8=;
 b=sS0MdmCa8f2R+FnNhN2KoKBKqH7dHWJWg4cLOQxrA7aWlf9tfJ7558HTlvMSomUWPhHXV07JhdJOIVcHzvLnnVEoiTzoZl7fZjN1Q1chs4vYNXMuBnmbxsMfd7Sn5CJcQJnaxjlsyoqRqFXAOYSoRLUr1fCaTeWaSDQZPlSmDHo=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiBUdWVzZGF5LCAxMiBOb3ZlbWJlciAyMDE5IDExOjA5OjUwIEdNVCBqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBUaGlzIHNlcmllcyBh
Y3R1YWxseSBhcmUgcmVncm91cGVkIGZyb206Cj4gLSBkcm0va29tZWRhOiBFbmFibGUgbGF5ZXIv
cGxhbmUgY29sb3ItbWdtdDoKPiAgIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvNjA4OTMvCj4gCj4gLSBkcm0va29tZWRhOiBFbmFibGUgQ1JUQyBjb2xvci1tZ210Cj4g
ICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzYxMzcwLwo+IAo+IEZv
ciByZW1vdmluZyB0aGUgZGVwZW5kZW5jZSBvbjoKPiAtIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMzA4NzYvCj4gCj4gTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENo
aW5hKSAoMSk6Cj4gICBkcm0va29tZWRhOiBBZGRzIGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0g
c3VwcG9ydCBmb3IgRE9VLUlQUwo+IAo+IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpICgzKToKPiAgIGRybS9rb21lZGE6IEFkZCBhIG5ldyBoZWxwZXIgZHJtX2NvbG9yX2N0
bV9zMzFfMzJfdG9fcW1fbigpCj4gICBkcm0va29tZWRhOiBBZGQgZHJtX2x1dF90b19mZ2FtbWFf
Y29lZmZzKCkKPiAgIGRybS9rb21lZGE6IEFkZCBkcm1fY3RtX3RvX2NvZWZmcygpCj4gCj4gdjI6
Cj4gICBNb3ZlIHRoZSBmaXhwb2ludCBjb252ZXJzaW9uIGZ1bmN0aW9uIHMzMV8zMl90b19xMl8x
MigpIHRvIGRybSBjb3JlCj4gICBhcyBhIHNoYXJlZCBoZWxwZXIuCj4gCj4gdjQ6Cj4gICBBZGRy
ZXNzIHJldmlldyBjb21tZW50cyBmcm9tIE1paGFpLCBEYW5pZWwgYW5kIElsaWEuCj4gCj4gVjU6
Cj4gLSBJbmNsdWRlcyB0aGUgc2lnbiBiaXQgaW4gdGhlIHZhbHVlIG9mIG0gKFFtLm4pLgo+IC0g
UmViYXNlIHdpdGggZHJtLW1pc2MtbmV4dAo+IAo+IHY2Ogo+ICAgQWxsb3dzIG0gPT0gMCBhY2Nv
cmRpbmcgdG8gTWloYWlsJ3MgY29tbWVudHMuCj4gCj4gdjk6Cj4gICBSZWJhc2UKCldoYXQncyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHY5IGFuZCB0aGlzPwoKPiAKPiBMb3dyeSBMaSAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpICgxKToKPiAgIGRybS9rb21lZGE6IEFkZHMgZ2FtbWEgYW5kIGNvbG9y
LXRyYW5zZm9ybSBzdXBwb3J0IGZvciBET1UtSVBTCj4gCj4gamFtZXMgcWlhbiB3YW5nIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgKDMpOgo+ICAgZHJtOiBBZGQgYSBuZXcgaGVscGVyIGRybV9jb2xv
cl9jdG1fczMxXzMyX3RvX3FtX24oKQo+ICAgZHJtL2tvbWVkYTogQWRkIGRybV9sdXRfdG9fZmdh
bW1hX2NvZWZmcygpCj4gICBkcm0va29tZWRhOiBBZGQgZHJtX2N0bV90b19jb2VmZnMoKQo+IAo+
ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAyMCArKysr
KysKPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgNjYg
KysrKysrKysrKysrKysrKysrKwo+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xv
cl9tZ210LmggICAgfCAxMCArKy0KPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jcnRjLmMgIHwgIDIgKwo+ICAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaCAgfCAgMyArCj4gIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVf
c3RhdGUuYyAgICB8ICA2ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jICAg
ICAgICAgICAgICB8IDM0ICsrKysrKysrKysKPiAgaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQu
aCAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICA4IGZpbGVzIGNoYW5nZWQsIDE0MSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gLS0KPiAyLjIwLjEKPiAKCgotLSAKTWloYWlsCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
