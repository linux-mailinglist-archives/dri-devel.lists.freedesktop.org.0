Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8A10F808
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 07:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36296E3A6;
	Tue,  3 Dec 2019 06:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150052.outbound.protection.outlook.com [40.107.15.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D286B6E3A6
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 06:46:23 +0000 (UTC)
Received: from DB6PR0801CA0064.eurprd08.prod.outlook.com (2603:10a6:4:2b::32)
 by VI1PR08MB3631.eurprd08.prod.outlook.com (2603:10a6:803:85::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Tue, 3 Dec
 2019 06:46:20 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by DB6PR0801CA0064.outlook.office365.com
 (2603:10a6:4:2b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Tue, 3 Dec 2019 06:46:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 3 Dec 2019 06:46:18 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Tue, 03 Dec 2019 06:46:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25fcf5caa8be31fe
X-CR-MTA-TID: 64aa7808
Received: from ef8e2e4c748e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4C5B765-469F-4F56-9627-BA54AD3DD2D1.1; 
 Tue, 03 Dec 2019 06:46:09 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef8e2e4c748e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Dec 2019 06:46:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhffT7YSgAKIb3gT+LJmYxUmaP6SOB1e9l9pMdbxdBb7CnRppu8Llb88F+1VnFaqWpr72FUxZWGlSDnGYL0DKTJ2AGBDdCKXyJm6YVt3ypgsaxlbWWIIxlC9fw7NXSXsl7Dmf/Bq1z2lsqHIsGk4kG/p+VRiFV/FgE8ACy8nxJxbcm2KsFbc2zMZkYAj9n0XRwsz96MA1bkK5BMIgQ1zHpJdzn9F3CuPKaLyDyw73RHZF7hSE5Q1Px7AafcggOXY69Zo3sTpS/pFvtBKGIipXKDLMSahKVfMMe2m1v6c24/n3KdzbbW38wn+WigxW1qMMr2T1OWqEU9ZZTJh1e7rFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InwpahARXwcQQKbK6oyIQABye0nSOUPA+dfNUEH/Yoo=;
 b=AgWkzh5OqXCiNlQMipR5WGcvf+SBY+2LAgLfvqbwf0+TR7fFOIfxyaw82e57WXKZiQ9zlP73Z8d8JYpzR2r48Tt1A3pGoWQDD2W2uEvtxOhygTsC5oaG8iOrzkqEzeHbtqibKmiPrmwY+Hx2NoH/FRzv0Mxb4lNIL0ZH55POWq/PGhemcKk1/wlECqK31kPN1/ltxBVhvm3ddFOYFrg4Roxsa/FAgJfcV8dEBKoxLtR4k3reylI/vDtkGKqTlfwED49qpT0sXnnsI+G6W7s0MLuq9MHYj3iywntrFl0fzlUztl6RPAt9nh0Rd5s5u1iHEhPYQ+SF8zbAPu257Y7FdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4640.eurprd08.prod.outlook.com (10.255.27.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 06:46:06 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::f984:b0c7:bce9:144e%2]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 06:46:06 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVoEQnHODp0nh43k+zk6WDkpPTxKemwPIAgAFJKYA=
Date: Tue, 3 Dec 2019 06:46:06 +0000
Message-ID: <20191203064559.GA17018@jamwan02-TSP300>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
 <20191121081717.29518-3-james.qian.wang@arm.com>
 <15788924.1fOzIsmBsr@e123338-lin>
In-Reply-To: <15788924.1fOzIsmBsr@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0105.apcprd03.prod.outlook.com
 (2603:1096:203:b0::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e97c78c-3997-4a6f-80e4-08d777bc8022
X-MS-TrafficTypeDiagnostic: VE1PR08MB4640:|VE1PR08MB4640:|VI1PR08MB3631:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB36312CA5505ACD9E1DA4E59FB3420@VI1PR08MB3631.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 02408926C4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(189003)(199004)(26005)(6512007)(9686003)(186003)(102836004)(55236004)(11346002)(446003)(478600001)(6862004)(99286004)(14454004)(66066001)(6246003)(54906003)(256004)(66556008)(64756008)(25786009)(58126008)(6436002)(66946007)(6486002)(66476007)(76176011)(6506007)(386003)(52116002)(4326008)(229853002)(66446008)(316002)(6116002)(14444005)(3846002)(33716001)(2906002)(5660300002)(71190400001)(33656002)(71200400001)(1076003)(81156014)(305945005)(81166006)(86362001)(8676002)(7736002)(8936002)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4640;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rdPQ4rzElsMrOSEqGzKx9PBPvyJT5KwPP4nM04Q6jHp4GXBI/6fmxL5u/o4Epo8iePV6qx75PDnJQAZNe/1HeCPPMU60y7cfy5a9TBsuJLX/vu4eCLXy30k7p7gQX8xjGssNzI2N556/6ccsIdf0CgJT4vcGQsyMCi0FPCkBNUg/pPWqkyUSHu/4dy+H9mSCy9NIji8KMc3+4sPhGjY98MwxWKbJqZJrSxCATWrSg0JKTJbgtA81CArlSzBcMrLXTqqD2hXzoJt/svb1Xj8yvbCG03c2rYC/krDVO0unF2G/ATKMJ0TBBtELAuR3+k1xQt/ntHSYoA6a/iEs76uG0pYt3SpXixfdxjvzAVpZmS2XY0MhgXBuVilS0RRiCZLTDnppheEf6GGGAk4wJNo12sQQcLT8Q4BPyhK+tXMk2KtocbbyXJN99jiQljTSnGlB
Content-ID: <E431424A51237E4985D486BD46F29453@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4640
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(39860400002)(376002)(346002)(396003)(199004)(189003)(3846002)(23726003)(6116002)(7736002)(186003)(305945005)(58126008)(70586007)(70206006)(2906002)(26005)(33716001)(86362001)(11346002)(446003)(97756001)(6636002)(1076003)(5660300002)(336012)(81166006)(14454004)(46406003)(22756006)(356004)(8936002)(50466002)(102836004)(6506007)(76130400001)(386003)(54906003)(316002)(8746002)(106002)(76176011)(478600001)(26826003)(47776003)(66066001)(8676002)(99286004)(6862004)(14444005)(4326008)(25786009)(229853002)(6512007)(9686003)(6486002)(33656002)(81156014)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3631;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5864fb55-99ae-497d-5cf1-08d777bc78db
NoDisclaimer: True
X-Forefront-PRVS: 02408926C4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qKPDXpX8DSjKJsB51u3fFbjg5KEagN+/avwcgVNnPxKLYy36IpztU949lvcuSyN8p6q0n3vrzsJXFe1Qonx8nebITVE1iPwKWrQf6z+rjgbvfOFw2zqYdj0p8JA0eYij5vFY+Ih9EFT2gXJ37w9X2BFuzFkN+nyVtHtUz3Ld7JZ92SABlBc8sHRLJk/uygpp+3Mx2q0aSeQy4PvASVbbcNl+EHl2taRyd1nGPt9nP9uUI9401Eco7KwlqzMsoIX9n0yGHGA1VXy8AhawoXQyYEgI5vAy7Off3YcYUhR463DtsxfiTopjWtBW6phT939rKI5MqltOchWTYvSM+UZrq3KJ5PbjDWICcZ9Nk93r2li/SMrYQZ6e8kbY5QmSNBop6AgKwX9PA4AAjGIdCnkif70SpeLU9QFQ8V4+fTp0KdmrPieKDBtExJLtJgbd1ng
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 06:46:18.2065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e97c78c-3997-4a6f-80e4-08d777bc8022
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3631
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InwpahARXwcQQKbK6oyIQABye0nSOUPA+dfNUEH/Yoo=;
 b=rfiCGBZs0hy0FtgBEzmOepyXxewQdj/8xfR0JOzrV/ZbwQmN3M3v1HIHS2LNLTxscwvDTd8Jz/OyBx8+4Tz/YSWdo7+CuEDpbYluTxD5JSB8qzoanZ0AtiKo84X8azb74HY7z/8ZgSKO/NTVVuF/iMFjgNsKaRLBlfGCJqO0Eq0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InwpahARXwcQQKbK6oyIQABye0nSOUPA+dfNUEH/Yoo=;
 b=rfiCGBZs0hy0FtgBEzmOepyXxewQdj/8xfR0JOzrV/ZbwQmN3M3v1HIHS2LNLTxscwvDTd8Jz/OyBx8+4Tz/YSWdo7+CuEDpbYluTxD5JSB8qzoanZ0AtiKo84X8azb74HY7z/8ZgSKO/NTVVuF/iMFjgNsKaRLBlfGCJqO0Eq0=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMTE6MDc6NTJBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBPbiBUaHVyc2RheSwgMjEgTm92ZW1iZXIgMjAxOSAwODoxNzo0NSBHTVQgamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiBEMzIgaXMgc2lt
cGxlIHZlcnNpb24gb2YgRDcxLCB0aGUgZGlmZmVyZW5jZSBpczoKPiA+IC0gT25seSBoYXMgb25l
IHBpcGVsaW5lCj4gPiAtIERyb3AgdGhlIHBlcmlwaCBibG9jayBhbmQgbWVyZ2UgaXQgdG8gR0NV
Cj4gPiAKPiA+IHYyOiBSZWJhc2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4g
V2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiA+
IC0tLQo+ID4gIC4uLi9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oICB8
ICAzICstCj4gPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jICAg
IHwgIDIgKy0KPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYu
YyAgfCA0MyArKysrKysrKysrKystLS0tLS0tCj4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2Q3MS9kNzFfcmVncy5oIHwgMTMgKysrKysrCj4gPiAgLi4uL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyAgIHwgIDEgKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+ID4gaW5k
ZXggOTZlMmU0MDE2MjUwLi5kYmQzZDQ3NjUwNjUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gPiBAQCAt
MTgsNyArMTgsOCBAQAo+ID4gICNkZWZpbmUgTUFMSURQX0NPUkVfSURfU1RBVFVTKF9fY29yZV9p
ZCkgICAgICgoKF9fdTMyKShfX2NvcmVfaWQpKSAmIDB4RkYpCj4gPiAgCj4gPiAgLyogTWFsaS1k
aXNwbGF5IHByb2R1Y3QgSURzICovCj4gPiAtI2RlZmluZSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQg
ICAweDAwNzEKPiA+ICsjZGVmaW5lIE1BTElEUF9ENzFfUFJPRFVDVF9JRAkweDAwNzEKPiA+ICsj
ZGVmaW5lIE1BTElEUF9EMzJfUFJPRFVDVF9JRAkweDAwMzIKPiA+ICAKPiA+ICB1bmlvbiBrb21l
ZGFfY29uZmlnX2lkIHsKPiA+ICAJc3RydWN0IHsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiA+IGluZGV4IDZk
YWRmNDQxM2VmMy4uYzdmN2U5YzU0NWM3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKPiA+IEBAIC0x
Mjc0LDcgKzEyNzQsNyBAQCBzdGF0aWMgaW50IGQ3MV90aW1pbmdfY3RybHJfaW5pdChzdHJ1Y3Qg
ZDcxX2RldiAqZDcxLAo+ID4gIAo+ID4gIAljdHJsciA9IHRvX2N0cmxyKGMpOwo+ID4gIAo+ID4g
LQljdHJsci0+c3VwcG9ydHNfZHVhbF9saW5rID0gdHJ1ZTsKPiA+ICsJY3RybHItPnN1cHBvcnRz
X2R1YWxfbGluayA9IGQ3MS0+c3VwcG9ydHNfZHVhbF9saW5rOwo+ID4gIAo+ID4gIAlyZXR1cm4g
MDsKPiA+ICB9Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9k
NzEvZDcxX2Rldi5jCj4gPiBpbmRleCA5YjNiZjM1M2I2Y2MuLjJkNDI5ZTMxMGU1YiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYu
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rl
di5jCj4gPiBAQCAtMzcxLDIzICszNzEsMzMgQEAgc3RhdGljIGludCBkNzFfZW51bV9yZXNvdXJj
ZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gPiAgCQlnb3RvIGVycl9jbGVhbnVwOwo+ID4g
IAl9Cj4gPiAgCj4gPiAtCS8qIHByb2JlIFBFUklQSCAqLwo+ID4gKwkvKiBPbmx5IHRoZSBsZWdh
Y3kgSFcgaGFzIHRoZSBwZXJpcGggYmxvY2ssIHRoZSBuZXdlciBtZXJnZXMgdGhlIHBlcmlwaAo+
ID4gKwkgKiBpbnRvIEdDVQo+ID4gKwkgKi8KPiA+ICAJdmFsdWUgPSBtYWxpZHBfcmVhZDMyKGQ3
MS0+cGVyaXBoX2FkZHIsIEJMS19CTE9DS19JTkZPKTsKPiA+IC0JaWYgKEJMT0NLX0lORk9fQkxL
X1RZUEUodmFsdWUpICE9IEQ3MV9CTEtfVFlQRV9QRVJJUEgpIHsKPiA+IC0JCURSTV9FUlJPUigi
YWNjZXNzIGJsayBwZXJpcGggYnV0IGdvdCBibGs6ICVkLlxuIiwKPiA+IC0JCQkgIEJMT0NLX0lO
Rk9fQkxLX1RZUEUodmFsdWUpKTsKPiA+IC0JCWVyciA9IC1FSU5WQUw7Cj4gPiAtCQlnb3RvIGVy
cl9jbGVhbnVwOwo+ID4gKwlpZiAoQkxPQ0tfSU5GT19CTEtfVFlQRSh2YWx1ZSkgIT0gRDcxX0JM
S19UWVBFX1BFUklQSCkKPiA+ICsJCWQ3MS0+cGVyaXBoX2FkZHIgPSBOVUxMOwo+ID4gKwo+ID4g
KwlpZiAoZDcxLT5wZXJpcGhfYWRkcikgewo+ID4gKwkJLyogcHJvYmUgUEVSSVBIRVJBTCBpbiBs
ZWdhY3kgSFcgKi8KPiA+ICsJCXZhbHVlID0gbWFsaWRwX3JlYWQzMihkNzEtPnBlcmlwaF9hZGRy
LCBQRVJJUEhfQ09ORklHVVJBVElPTl9JRCk7Cj4gPiArCj4gPiArCQlkNzEtPm1heF9saW5lX3Np
emUJPSB2YWx1ZSAmIFBFUklQSF9NQVhfTElORV9TSVpFID8gNDA5NiA6IDIwNDg7Cj4gPiArCQlk
NzEtPm1heF92c2l6ZQkJPSA0MDk2Owo+ID4gKwkJZDcxLT5udW1fcmljaF9sYXllcnMJPSB2YWx1
ZSAmIFBFUklQSF9OVU1fUklDSF9MQVlFUlMgPyAyIDogMTsKPiA+ICsJCWQ3MS0+c3VwcG9ydHNf
ZHVhbF9saW5rCT0gISEodmFsdWUgJiBQRVJJUEhfU1BMSVRfRU4pOwo+ID4gKwkJZDcxLT5pbnRl
Z3JhdGVzX3RidQk9ICEhKHZhbHVlICYgUEVSSVBIX1RCVV9FTik7Cj4gPiArCX0gZWxzZSB7Cj4g
PiArCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5nY3VfYWRkciwgR0NVX0NPTkZJR1VSQVRJ
T05fSUQwKTsKPiA+ICsJCWQ3MS0+bWF4X2xpbmVfc2l6ZQk9IEdDVV9NQVhfTElORV9TSVpFKHZh
bHVlKTsKPiA+ICsJCWQ3MS0+bWF4X3ZzaXplCQk9IEdDVV9NQVhfTlVNX0xJTkVTKHZhbHVlKTsK
PiA+ICsKPiA+ICsJCXZhbHVlID0gbWFsaWRwX3JlYWQzMihkNzEtPmdjdV9hZGRyLCBHQ1VfQ09O
RklHVVJBVElPTl9JRDEpOwo+ID4gKwkJZDcxLT5udW1fcmljaF9sYXllcnMJPSBHQ1VfTlVNX1JJ
Q0hfTEFZRVJTKHZhbHVlKTsKPiA+ICsJCWQ3MS0+c3VwcG9ydHNfZHVhbF9saW5rCT0gR0NVX0RJ
U1BMQVlfU1BMSVRfRU4odmFsdWUpOwo+ID4gKwkJZDcxLT5pbnRlZ3JhdGVzX3RidQk9IEdDVV9E
SVNQTEFZX1RCVV9FTih2YWx1ZSk7Cj4gPiAgCX0KPiA+ICAKPiA+IC0JdmFsdWUgPSBtYWxpZHBf
cmVhZDMyKGQ3MS0+cGVyaXBoX2FkZHIsIFBFUklQSF9DT05GSUdVUkFUSU9OX0lEKTsKPiA+IC0K
PiA+IC0JZDcxLT5tYXhfbGluZV9zaXplCT0gdmFsdWUgJiBQRVJJUEhfTUFYX0xJTkVfU0laRSA/
IDQwOTYgOiAyMDQ4Owo+ID4gLQlkNzEtPm1heF92c2l6ZQkJPSA0MDk2Owo+ID4gLQlkNzEtPm51
bV9yaWNoX2xheWVycwk9IHZhbHVlICYgUEVSSVBIX05VTV9SSUNIX0xBWUVSUyA/IDIgOiAxOwo+
ID4gLQlkNzEtPnN1cHBvcnRzX2R1YWxfbGluawk9IHZhbHVlICYgUEVSSVBIX1NQTElUX0VOID8g
dHJ1ZSA6IGZhbHNlOwo+ID4gLQlkNzEtPmludGVncmF0ZXNfdGJ1CT0gdmFsdWUgJiBQRVJJUEhf
VEJVX0VOID8gdHJ1ZSA6IGZhbHNlOwo+ID4gLQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgZDcxLT5u
dW1fcGlwZWxpbmVzOyBpKyspIHsKPiA+ICAJCXBpcGUgPSBrb21lZGFfcGlwZWxpbmVfYWRkKG1k
ZXYsIHNpemVvZihzdHJ1Y3QgZDcxX3BpcGVsaW5lKSwKPiA+ICAJCQkJCSAgICZkNzFfcGlwZWxp
bmVfZnVuY3MpOwo+ID4gQEAgLTQxNSw3ICs0MjUsNyBAQCBzdGF0aWMgaW50IGQ3MV9lbnVtX3Jl
c291cmNlcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiA+ICAJfQo+ID4gIAo+ID4gIAkvKiBs
b29wIHRoZSByZWdpc3RlciBibGtzIGFuZCBwcm9iZSAqLwo+ID4gLQlpID0gMjsgLyogZXhjbHVk
ZSBHQ1UgYW5kIFBFUklQSCAqLwo+ID4gKwlpID0gMTsgLyogZXhjbHVkZSBHQ1UgKi8KPiA+ICAJ
b2Zmc2V0ID0gRDcxX0JMT0NLX1NJWkU7IC8qIHNraXAgR0NVICovCj4gPiAgCXdoaWxlIChpIDwg
ZDcxLT5udW1fYmxvY2tzKSB7Cj4gPiAgCQlibGtfYmFzZSA9IG1kZXYtPnJlZ19iYXNlICsgKG9m
ZnNldCA+PiAyKTsKPiA+IEBAIC00MjUsOSArNDM1LDkgQEAgc3RhdGljIGludCBkNzFfZW51bV9y
ZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gPiAgCQkJZXJyID0gZDcxX3Byb2Jl
X2Jsb2NrKGQ3MSwgJmJsaywgYmxrX2Jhc2UpOwo+ID4gIAkJCWlmIChlcnIpCj4gPiAgCQkJCWdv
dG8gZXJyX2NsZWFudXA7Cj4gPiAtCQkJaSsrOwo+ID4gIAkJfQo+ID4gIAo+ID4gKwkJaSsrOwo+
IAo+IFRoaXMgY2hhbmdlIGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIGlmIHlvdSB3YW50IHRvIGNv
dW50IGhvdyBtYW55Cj4gYmxvY2tzIGFyZSBhdmFpbGFibGUsIHNpbmNlIHlvdSdyZSBub3cgY291
bnRpbmcgdGhlIHJlc2VydmVkIG9uZXMsIHRvby4KClRoYXQncyBiZWNhdXNlIGZvciBEMzIgbnVt
X2Jsb2NrcyBpbmNsdWRlcyB0aGUgcmVzZXJ2ZWQgYmxvY2tzLgoKPiBPbiB0aGUgY291bnRpbmcg
bm90ZSwgdGhlIHByaW9yIGNvZGUgcmlkZXMgb24gdGhlIGFzc3VtcHRpb24gdGhlIHBlcmlwaAo+
IGJsb2NrIGlzIGxhc3QgaW4gdGhlIG1hcCwgYW5kIEkgZG9uJ3Qgc2VlIGhvdyB5b3Ugc3RpbGwg
aGFuZGxlIG5vdAo+IGNvdW50aW5nIGl0IGluIHRoZSBENzEgY2FzZS4KClNpbmNlIEQ3MSBoYXMg
b25lIHJlc2VydmVkIGJsb2NrLCBhbmQgbm93IHdlIGNvdW50IHJlc2VydmVkIGJsb2NrLgoKU28g
bm93IG5vIG1hdHRlciBEMzIgb3IgRDcxOgogIG51bV9ibG9ja3MgPSBuX3ZhbGlkX2Jsb2NrICsg
bl9yZXNlcnZlZF9ibG9jayArIEdDVS4KClRoYW5rcwpKYW1lcwo+IAo+ID4gIAkJb2Zmc2V0ICs9
IEQ3MV9CTE9DS19TSVpFOwo+ID4gIAl9Cj4gPiAgCj4gPiBAQCAtNjAzLDYgKzYxMyw3IEBAIGQ3
MV9pZGVudGlmeSh1MzIgX19pb21lbSAqcmVnX2Jhc2UsIHN0cnVjdCBrb21lZGFfY2hpcF9pbmZv
ICpjaGlwKQo+ID4gIAo+ID4gIAlzd2l0Y2ggKHByb2R1Y3RfaWQpIHsKPiA+ICAJY2FzZSBNQUxJ
RFBfRDcxX1BST0RVQ1RfSUQ6Cj4gPiArCWNhc2UgTUFMSURQX0QzMl9QUk9EVUNUX0lEOgo+ID4g
IAkJZnVuY3MgPSAmZDcxX2NoaXBfZnVuY3M7Cj4gPiAgCQlicmVhazsKPiA+ICAJZGVmYXVsdDoK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3Jl
Z3MuaAo+ID4gaW5kZXggMTcyN2RjOTkzOTA5Li44MWRlNmEyM2U3ZjMgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oCj4g
PiBAQCAtNzIsNiArNzIsMTkgQEAKPiA+ICAjZGVmaW5lIEdDVV9DT05UUk9MX01PREUoeCkJKCh4
KSAmIDB4NykKPiA+ICAjZGVmaW5lIEdDVV9DT05UUk9MX1NSU1QJQklUKDE2KQo+ID4gIAo+ID4g
Ky8qIEdDVV9DT05GSUdVUkFUSU9OIHJlZ2lzdGVycyAqLwo+ID4gKyNkZWZpbmUgR0NVX0NPTkZJ
R1VSQVRJT05fSUQwCTB4MTAwCj4gPiArI2RlZmluZSBHQ1VfQ09ORklHVVJBVElPTl9JRDEJMHgx
MDQKPiA+ICsKPiA+ICsvKiBHQ1UgY29uZmlndXJhdGlvbiAqLwo+ID4gKyNkZWZpbmUgR0NVX01B
WF9MSU5FX1NJWkUoeCkJKCh4KSAmIDB4RkZGRikKPiA+ICsjZGVmaW5lIEdDVV9NQVhfTlVNX0xJ
TkVTKHgpCSgoeCkgPj4gMTYpCj4gPiArI2RlZmluZSBHQ1VfTlVNX1JJQ0hfTEFZRVJTKHgpCSgo
eCkgJiAweDcpCj4gPiArI2RlZmluZSBHQ1VfTlVNX1BJUEVMSU5FUyh4KQkoKCh4KSA+PiAzKSAm
IDB4NykKPiA+ICsjZGVmaW5lIEdDVV9OVU1fU0NBTEVSUyh4KQkoKCh4KSA+PiA2KSAmIDB4NykK
PiA+ICsjZGVmaW5lIEdDVV9ESVNQTEFZX1NQTElUX0VOKHgpCSgoKHgpID4+IDE2KSAmIDB4MSkK
PiA+ICsjZGVmaW5lIEdDVV9ESVNQTEFZX1RCVV9FTih4KQkoKCh4KSA+PiAxNykgJiAweDEpCj4g
PiArCj4gPiAgLyogR0NVIG9wbW9kZSAqLwo+ID4gICNkZWZpbmUgSU5BQ1RJVkVfTU9ERQkJMAo+
ID4gICNkZWZpbmUgVEJVX0NPTk5FQ1RfTU9ERQkxCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+ID4gaW5kZXggYjdhMTA5N2M0NWM0Li5h
ZDM4YmJjNzQzMWUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiA+IEBAIC0xMjUsNiArMTI1LDcgQEAgc3RhdGljIGludCBr
b21lZGFfcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAg
Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQga29tZWRhX29mX21hdGNoW10g
PSB7Cj4gPiAgCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktZDcxIiwgLmRhdGEgPSBkNzFfaWRl
bnRpZnksIH0sCj4gPiArCXsgLmNvbXBhdGlibGUgPSAiYXJtLG1hbGktZDMyIiwgLmRhdGEgPSBk
NzFfaWRlbnRpZnksIH0sCj4gPiAgCXt9LAo+ID4gIH07Cj4gPiAgCj4gPiAKPiAKPiAKPiAtLSAK
PiBNaWhhaWwKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
