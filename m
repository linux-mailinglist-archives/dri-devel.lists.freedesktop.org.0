Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CA114076
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 13:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A176F88F;
	Thu,  5 Dec 2019 12:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555146F88F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 12:02:56 +0000 (UTC)
Received: from DB6PR0801CA0055.eurprd08.prod.outlook.com (2603:10a6:4:2b::23)
 by DB7PR08MB3433.eurprd08.prod.outlook.com (2603:10a6:10:48::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Thu, 5 Dec
 2019 12:02:53 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by DB6PR0801CA0055.outlook.office365.com
 (2603:10a6:4:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Thu, 5 Dec 2019 12:02:53 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 5 Dec 2019 12:02:53 +0000
Received: ("Tessian outbound 58ad627f3883:v37");
 Thu, 05 Dec 2019 12:02:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc24f7eb0faa1358
X-CR-MTA-TID: 64aa7808
Received: from e83a11f60396.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD9F8365-1445-495C-B0BF-C4A59CA4AB38.1; 
 Thu, 05 Dec 2019 12:02:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e83a11f60396.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 05 Dec 2019 12:02:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvCDGPdlYDVCrKIetfBiwSEF5TT16gir1yI4jjUAw6MlwuMJERSWOsj1qh4y6G6w3aPOEmqJSS4U0gNv3r5ml2lVlv6hzU9L7yQqeVrvCpnfzTGVQBzS5c0vMdnf2oQn7ZAsCkZlxUUtjowmYpumY+C7eEg63zaGzDLnuPD2YToQvMmWJb798d/2RuvW7VoSCAIrqIVfP7UArAd5RRp1uxlVjE1+fftU7Kfci2fCAxFlUC0s906AIprwvz2MxgxEF9faYzaknaeLJ6+B9CwdO7K4ZZpQwPsL7u+qKFiF4xpLFhjs5vI+pnZl/lkLWxH7TOqnBFj5wvqli7755FhPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upJZ/1UXfJFJEq/JCwD85T4aQyewjdSi7ui43YR+mOA=;
 b=mIGQhbYyY8hBY0XilGegQ0Wthpm6LN+2MNfg4/IAYiyt5/pQsgLxa+CJRj3JboCn0T3tc24Bguc8oCVZbbTomqIKp/C+bV2bGe6XorF/m8dekMIt3vICTGLxr+3lMOgF+5Qas94f4TONoEp8ovaY0RmHwjwq25p4keCDFFIP/bXZVBRQ9foFdunwn85bIqSF+FSspzDbom5GRfZZtq8vbBq89VD9OA5QFJ31VFd+h50cetxU6matWiq421TP2nwe4PzdmSyzDekppGVmZbtljQuZoVzAoVSffaIOsOzWUl6t45bTD2UOF26GWGDAZsZTGQsPCs25owMqKUkkv5//lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3725.eurprd08.prod.outlook.com (20.178.13.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 5 Dec 2019 12:02:45 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 12:02:45 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVoEQsEzx6hPV6tkqMxpVwDMM7k6emwEqAgAFJ2gCAADItgIADFfMAgAAwrYA=
Date: Thu, 5 Dec 2019 12:02:45 +0000
Message-ID: <7467899.rIHYG2lMSP@e123338-lin>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
 <2125422.nYgIr5rE5T@e123338-lin> <20191205085256.GA11212@jamwan02-TSP300>
In-Reply-To: <20191205085256.GA11212@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: CWLP123CA0162.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:88::30) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d9bfbd1-6275-4ea3-d55a-08d7797b0eb4
X-MS-TrafficTypeDiagnostic: VI1PR08MB3725:|VI1PR08MB3725:|DB7PR08MB3433:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3433BFFC80ABE115197D47908F5C0@DB7PR08MB3433.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 02426D11FE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(199004)(189003)(6512007)(4326008)(25786009)(14444005)(186003)(9686003)(6486002)(64756008)(66476007)(14454004)(66446008)(66946007)(66556008)(76176011)(316002)(6862004)(2906002)(8936002)(5660300002)(6636002)(52116002)(81156014)(81166006)(229853002)(102836004)(8676002)(305945005)(33716001)(71190400001)(26005)(11346002)(54906003)(86362001)(478600001)(99286004)(71200400001)(6506007)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3725;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: szuwdR4hvKVxwU0YtBnLtbrYtLkaUL+rv93bHNTBsemz6Yd2igfJk95xkGPqpU2wGxlEBDhAw35wbiYvcuJDMm7DT2ySccIMvFam15loX4/nHF/jPuoQOLcctDBlaeN3tR/e31rYz44k9DNvO57cX6gYgSPpUSvHF5u72q0IlmvmoNfIglE4g8WrsqEmeKFx61yw/YXY0vaJlUcfhmJNS9Ko2iXYFy9jJP35FrQH+7xJCOS5J8GiH/U9Cer0x217W6SC8e9vRO27DrHD64N70M5SOg3ZJsiJbgf+F4MwzBg26v76ypkm7XMjZlI8JGdJlygS6M/ABOQsQDWVxUHOlepKgIMtTxDdUiu5aa2t1nEzdLiK0+RtJGUao6FBTQVEiklz5xdsgcHJ2IIfl32lgZ1QGdPbSA3iEhwwmlhXK8n9n0i5uuW710P8rhByB81eFG5cwpJkFTol6HKTGXabobmdUxwNfk5pgeHl24mD+Yg6U8fsvSBFF2MX000MElVW
Content-ID: <ECD6F9AEB5D988468CF68DB631492A46@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3725
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(76130400001)(356004)(2906002)(6486002)(229853002)(23726003)(6512007)(33716001)(46406003)(54906003)(70586007)(14444005)(316002)(76176011)(99286004)(186003)(86362001)(70206006)(81156014)(14454004)(305945005)(6862004)(8936002)(8676002)(6636002)(25786009)(102836004)(50466002)(4326008)(9686003)(6506007)(81166006)(11346002)(478600001)(26826003)(97756001)(336012)(26005)(22756006)(5660300002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3433;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 14154fb2-83f8-4ce5-f74a-08d7797b0a05
NoDisclaimer: True
X-Forefront-PRVS: 02426D11FE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h6he+3S5hoKuFkQG6xl7pczlNaZkBs2wU+GlSziUTSv5I/t23w8lD/xIHZR80HGvz1JGZsaVBTsXgVe9eQuc9inrxyc3eriXjoMhCcmNeKdFY6ckRaXJ7gPR/U5xHfJ75k78La0M/ElpSNVTpoeTi5Rqpd7XYgip0EEA9TYiUa36KyflZVkecCb+q+htGD9HvFx19JBMD9ihNonOoVL1vHAYUfmFrbOAxonWdxdKEVA0ZU+3Ml/PV3LIM1VJFnNyW2gpreUWf+KVgsyoGnNccF1gEOHc9T2C5wMPdNR3I2RMzqvKAG1+TuISC0yqSsVCcLyvLooXU6kwtHL35T2RAjMUw8dJgNKJn1tuqDX5/FgHf2YDtVQYTRhqqB1Bzd9Ni8JdaWLSzB5RlcurEK6nvXiuLUxKTELQ8Kx+ADcUhXYNaNM2mlllKMh5ebCjCu1K3/2wCkFe6xuUEjO+RBawf63kDIG4gxsNpt/Vm3qKEpBh8wAr19C438t+ulcPUI/o
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 12:02:53.0184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9bfbd1-6275-4ea3-d55a-08d7797b0eb4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3433
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upJZ/1UXfJFJEq/JCwD85T4aQyewjdSi7ui43YR+mOA=;
 b=a/fhLRrer8lrVfnLeZvmzH8tHzAfDX/skF9cWbl4eNU8GdsPXaHJkFvXlagyo7IbhKQpBCV9LnUYBxcG8KAsuiynfqCRaKPTEj6wZRsRrm9pJbmpF2iU/pMKvrL6Jq15cAmUG0GdBbXSNFg+z6n7HaxML75W4BmTHlv6MAe0+WM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upJZ/1UXfJFJEq/JCwD85T4aQyewjdSi7ui43YR+mOA=;
 b=a/fhLRrer8lrVfnLeZvmzH8tHzAfDX/skF9cWbl4eNU8GdsPXaHJkFvXlagyo7IbhKQpBCV9LnUYBxcG8KAsuiynfqCRaKPTEj6wZRsRrm9pJbmpF2iU/pMKvrL6Jq15cAmUG0GdBbXSNFg+z6n7HaxML75W4BmTHlv6MAe0+WM=
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

T24gVGh1cnNkYXksIDUgRGVjZW1iZXIgMjAxOSAwODo1MzowMiBHTVQgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gVHVlLCBEZWMgMDMsIDIwMTkgYXQg
MDk6NTk6NTdBTSArMDAwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToKPiA+IE9uIFR1ZXNkYXks
IDMgRGVjZW1iZXIgMjAxOSAwNjo0NjowNiBHTVQgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgRGVjIDAyLCAyMDE5IGF0IDExOjA3OjUy
QU0gKzAwMDAsIE1paGFpbCBBdGFuYXNzb3Ygd3JvdGU6Cj4gPiA+ID4gT24gVGh1cnNkYXksIDIx
IE5vdmVtYmVyIDIwMTkgMDg6MTc6NDUgR01UIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gRDMyIGlzIHNpbXBsZSB2ZXJzaW9uIG9mIEQ3MSwg
dGhlIGRpZmZlcmVuY2UgaXM6Cj4gPiA+ID4gPiAtIE9ubHkgaGFzIG9uZSBwaXBlbGluZQo+ID4g
PiA+ID4gLSBEcm9wIHRoZSBwZXJpcGggYmxvY2sgYW5kIG1lcmdlIGl0IHRvIEdDVQo+ID4gPiA+
ID4gCj4gPiA+ID4gPiB2MjogUmViYXNlLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53
YW5nQGFybS5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAuLi4vZHJtL2FybS9kaXNwbGF5
L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaCAgfCAgMyArLQo+ID4gPiA+ID4gIC4uLi9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8ICAyICstCj4gPiA+ID4gPiAgLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfZGV2LmMgIHwgNDMgKysrKysrKysr
KysrLS0tLS0tLQo+ID4gPiA+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX3JlZ3MuaCB8IDEzICsrKysrKwo+ID4gPiA+ID4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZHJ2LmMgICB8ICAxICsKPiA+ID4gPiA+ICA1IGZpbGVzIGNoYW5nZWQs
IDQ0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3By
b2R1Y3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9k
dWN0LmgKPiA+ID4gPiA+IGluZGV4IDk2ZTJlNDAxNjI1MC4uZGJkM2Q0NzY1MDY1IDEwMDY0NAo+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRw
X3Byb2R1Y3QuaAo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2lu
Y2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+ID4gPiA+ID4gQEAgLTE4LDcgKzE4LDggQEAKPiA+ID4g
PiA+ICAjZGVmaW5lIE1BTElEUF9DT1JFX0lEX1NUQVRVUyhfX2NvcmVfaWQpICAgICAoKChfX3Uz
MikoX19jb3JlX2lkKSkgJiAweEZGKQo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gIC8qIE1hbGktZGlz
cGxheSBwcm9kdWN0IElEcyAqLwo+ID4gPiA+ID4gLSNkZWZpbmUgTUFMSURQX0Q3MV9QUk9EVUNU
X0lEICAgMHgwMDcxCj4gPiA+ID4gPiArI2RlZmluZSBNQUxJRFBfRDcxX1BST0RVQ1RfSUQJMHgw
MDcxCj4gPiA+ID4gPiArI2RlZmluZSBNQUxJRFBfRDMyX1BST0RVQ1RfSUQJMHgwMDMyCj4gPiA+
ID4gPiAgCj4gPiA+ID4gPiAgdW5pb24ga29tZWRhX2NvbmZpZ19pZCB7Cj4gPiA+ID4gPiAgCXN0
cnVjdCB7Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiA+ID4gPiBpbmRleCA2ZGFkZjQ0MTNlZjMu
LmM3ZjdlOWM1NDVjNyAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ID4gPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCj4gPiA+ID4g
PiBAQCAtMTI3NCw3ICsxMjc0LDcgQEAgc3RhdGljIGludCBkNzFfdGltaW5nX2N0cmxyX2luaXQo
c3RydWN0IGQ3MV9kZXYgKmQ3MSwKPiA+ID4gPiA+ICAKPiA+ID4gPiA+ICAJY3RybHIgPSB0b19j
dHJscihjKTsKPiA+ID4gPiA+ICAKPiA+ID4gPiA+IC0JY3RybHItPnN1cHBvcnRzX2R1YWxfbGlu
ayA9IHRydWU7Cj4gPiA+ID4gPiArCWN0cmxyLT5zdXBwb3J0c19kdWFsX2xpbmsgPSBkNzEtPnN1
cHBvcnRzX2R1YWxfbGluazsKPiA+ID4gPiA+ICAKPiA+ID4gPiA+ICAJcmV0dXJuIDA7Cj4gPiA+
ID4gPiAgfQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9kZXYuYwo+ID4gPiA+ID4gaW5kZXggOWIzYmYzNTNiNmNjLi4yZDQyOWUzMTBl
NWIgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2Q3MS9kNzFfZGV2LmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwo+ID4gPiA+ID4gQEAgLTM3MSwyMyArMzcxLDMzIEBA
IHN0YXRpYyBpbnQgZDcxX2VudW1fcmVzb3VyY2VzKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+
ID4gPiA+ID4gIAkJZ290byBlcnJfY2xlYW51cDsKPiA+ID4gPiA+ICAJfQo+ID4gPiA+ID4gIAo+
ID4gPiA+ID4gLQkvKiBwcm9iZSBQRVJJUEggKi8KPiA+ID4gPiA+ICsJLyogT25seSB0aGUgbGVn
YWN5IEhXIGhhcyB0aGUgcGVyaXBoIGJsb2NrLCB0aGUgbmV3ZXIgbWVyZ2VzIHRoZSBwZXJpcGgK
PiA+ID4gPiA+ICsJICogaW50byBHQ1UKPiA+ID4gPiA+ICsJICovCj4gPiA+ID4gPiAgCXZhbHVl
ID0gbWFsaWRwX3JlYWQzMihkNzEtPnBlcmlwaF9hZGRyLCBCTEtfQkxPQ0tfSU5GTyk7Cj4gPiA+
ID4gPiAtCWlmIChCTE9DS19JTkZPX0JMS19UWVBFKHZhbHVlKSAhPSBENzFfQkxLX1RZUEVfUEVS
SVBIKSB7Cj4gPiA+ID4gPiAtCQlEUk1fRVJST1IoImFjY2VzcyBibGsgcGVyaXBoIGJ1dCBnb3Qg
YmxrOiAlZC5cbiIsCj4gPiA+ID4gPiAtCQkJICBCTE9DS19JTkZPX0JMS19UWVBFKHZhbHVlKSk7
Cj4gPiA+ID4gPiAtCQllcnIgPSAtRUlOVkFMOwo+ID4gPiA+ID4gLQkJZ290byBlcnJfY2xlYW51
cDsKPiA+ID4gPiA+ICsJaWYgKEJMT0NLX0lORk9fQkxLX1RZUEUodmFsdWUpICE9IEQ3MV9CTEtf
VFlQRV9QRVJJUEgpCj4gPiA+ID4gPiArCQlkNzEtPnBlcmlwaF9hZGRyID0gTlVMTDsKPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICsJaWYgKGQ3MS0+cGVyaXBoX2FkZHIpIHsKPiA+ID4gPiA+ICsJCS8q
IHByb2JlIFBFUklQSEVSQUwgaW4gbGVnYWN5IEhXICovCj4gPiA+ID4gPiArCQl2YWx1ZSA9IG1h
bGlkcF9yZWFkMzIoZDcxLT5wZXJpcGhfYWRkciwgUEVSSVBIX0NPTkZJR1VSQVRJT05fSUQpOwo+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwkJZDcxLT5tYXhfbGluZV9zaXplCT0gdmFsdWUgJiBQRVJJ
UEhfTUFYX0xJTkVfU0laRSA/IDQwOTYgOiAyMDQ4Owo+ID4gPiA+ID4gKwkJZDcxLT5tYXhfdnNp
emUJCT0gNDA5NjsKPiA+ID4gPiA+ICsJCWQ3MS0+bnVtX3JpY2hfbGF5ZXJzCT0gdmFsdWUgJiBQ
RVJJUEhfTlVNX1JJQ0hfTEFZRVJTID8gMiA6IDE7Cj4gPiA+ID4gPiArCQlkNzEtPnN1cHBvcnRz
X2R1YWxfbGluawk9ICEhKHZhbHVlICYgUEVSSVBIX1NQTElUX0VOKTsKPiA+ID4gPiA+ICsJCWQ3
MS0+aW50ZWdyYXRlc190YnUJPSAhISh2YWx1ZSAmIFBFUklQSF9UQlVfRU4pOwo+ID4gPiA+ID4g
Kwl9IGVsc2Ugewo+ID4gPiA+ID4gKwkJdmFsdWUgPSBtYWxpZHBfcmVhZDMyKGQ3MS0+Z2N1X2Fk
ZHIsIEdDVV9DT05GSUdVUkFUSU9OX0lEMCk7Cj4gPiA+ID4gPiArCQlkNzEtPm1heF9saW5lX3Np
emUJPSBHQ1VfTUFYX0xJTkVfU0laRSh2YWx1ZSk7Cj4gPiA+ID4gPiArCQlkNzEtPm1heF92c2l6
ZQkJPSBHQ1VfTUFYX05VTV9MSU5FUyh2YWx1ZSk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCQl2
YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5nY3VfYWRkciwgR0NVX0NPTkZJR1VSQVRJT05fSUQx
KTsKPiA+ID4gPiA+ICsJCWQ3MS0+bnVtX3JpY2hfbGF5ZXJzCT0gR0NVX05VTV9SSUNIX0xBWUVS
Uyh2YWx1ZSk7Cj4gPiA+ID4gPiArCQlkNzEtPnN1cHBvcnRzX2R1YWxfbGluawk9IEdDVV9ESVNQ
TEFZX1NQTElUX0VOKHZhbHVlKTsKPiA+ID4gPiA+ICsJCWQ3MS0+aW50ZWdyYXRlc190YnUJPSBH
Q1VfRElTUExBWV9UQlVfRU4odmFsdWUpOwo+ID4gPiA+ID4gIAl9Cj4gPiA+ID4gPiAgCj4gPiA+
ID4gPiAtCXZhbHVlID0gbWFsaWRwX3JlYWQzMihkNzEtPnBlcmlwaF9hZGRyLCBQRVJJUEhfQ09O
RklHVVJBVElPTl9JRCk7Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAtCWQ3MS0+bWF4X2xpbmVfc2l6
ZQk9IHZhbHVlICYgUEVSSVBIX01BWF9MSU5FX1NJWkUgPyA0MDk2IDogMjA0ODsKPiA+ID4gPiA+
IC0JZDcxLT5tYXhfdnNpemUJCT0gNDA5NjsKPiA+ID4gPiA+IC0JZDcxLT5udW1fcmljaF9sYXll
cnMJPSB2YWx1ZSAmIFBFUklQSF9OVU1fUklDSF9MQVlFUlMgPyAyIDogMTsKPiA+ID4gPiA+IC0J
ZDcxLT5zdXBwb3J0c19kdWFsX2xpbmsJPSB2YWx1ZSAmIFBFUklQSF9TUExJVF9FTiA/IHRydWUg
OiBmYWxzZTsKPiA+ID4gPiA+IC0JZDcxLT5pbnRlZ3JhdGVzX3RidQk9IHZhbHVlICYgUEVSSVBI
X1RCVV9FTiA/IHRydWUgOiBmYWxzZTsKPiA+ID4gPiA+IC0KPiA+ID4gPiA+ICAJZm9yIChpID0g
MDsgaSA8IGQ3MS0+bnVtX3BpcGVsaW5lczsgaSsrKSB7Cj4gPiA+ID4gPiAgCQlwaXBlID0ga29t
ZWRhX3BpcGVsaW5lX2FkZChtZGV2LCBzaXplb2Yoc3RydWN0IGQ3MV9waXBlbGluZSksCj4gPiA+
ID4gPiAgCQkJCQkgICAmZDcxX3BpcGVsaW5lX2Z1bmNzKTsKPiA+ID4gPiA+IEBAIC00MTUsNyAr
NDI1LDcgQEAgc3RhdGljIGludCBkNzFfZW51bV9yZXNvdXJjZXMoc3RydWN0IGtvbWVkYV9kZXYg
Km1kZXYpCj4gPiA+ID4gPiAgCX0KPiA+ID4gPiA+ICAKPiA+ID4gPiA+ICAJLyogbG9vcCB0aGUg
cmVnaXN0ZXIgYmxrcyBhbmQgcHJvYmUgKi8KPiA+ID4gPiA+IC0JaSA9IDI7IC8qIGV4Y2x1ZGUg
R0NVIGFuZCBQRVJJUEggKi8KPiA+ID4gPiA+ICsJaSA9IDE7IC8qIGV4Y2x1ZGUgR0NVICovCj4g
PiA+ID4gPiAgCW9mZnNldCA9IEQ3MV9CTE9DS19TSVpFOyAvKiBza2lwIEdDVSAqLwo+ID4gPiA+
ID4gIAl3aGlsZSAoaSA8IGQ3MS0+bnVtX2Jsb2Nrcykgewo+ID4gPiA+ID4gIAkJYmxrX2Jhc2Ug
PSBtZGV2LT5yZWdfYmFzZSArIChvZmZzZXQgPj4gMik7Cj4gPiA+ID4gPiBAQCAtNDI1LDkgKzQz
NSw5IEBAIHN0YXRpYyBpbnQgZDcxX2VudW1fcmVzb3VyY2VzKHN0cnVjdCBrb21lZGFfZGV2ICpt
ZGV2KQo+ID4gPiA+ID4gIAkJCWVyciA9IGQ3MV9wcm9iZV9ibG9jayhkNzEsICZibGssIGJsa19i
YXNlKTsKPiA+ID4gPiA+ICAJCQlpZiAoZXJyKQo+ID4gPiA+ID4gIAkJCQlnb3RvIGVycl9jbGVh
bnVwOwo+ID4gPiA+ID4gLQkJCWkrKzsKPiA+ID4gPiA+ICAJCX0KPiA+ID4gPiA+ICAKPiA+ID4g
PiA+ICsJCWkrKzsKPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGNoYW5nZSBkb2Vzbid0IG1ha2UgbXVj
aCBzZW5zZSBpZiB5b3Ugd2FudCB0byBjb3VudCBob3cgbWFueQo+ID4gPiA+IGJsb2NrcyBhcmUg
YXZhaWxhYmxlLCBzaW5jZSB5b3UncmUgbm93IGNvdW50aW5nIHRoZSByZXNlcnZlZCBvbmVzLCB0
b28uCj4gPiA+IAo+ID4gPiBUaGF0J3MgYmVjYXVzZSBmb3IgRDMyIG51bV9ibG9ja3MgaW5jbHVk
ZXMgdGhlIHJlc2VydmVkIGJsb2Nrcy4KPiA+ID4gCj4gPiA+ID4gT24gdGhlIGNvdW50aW5nIG5v
dGUsIHRoZSBwcmlvciBjb2RlIHJpZGVzIG9uIHRoZSBhc3N1bXB0aW9uIHRoZSBwZXJpcGgKPiA+
ID4gPiBibG9jayBpcyBsYXN0IGluIHRoZSBtYXAsIGFuZCBJIGRvbid0IHNlZSBob3cgeW91IHN0
aWxsIGhhbmRsZSBub3QKPiA+ID4gPiBjb3VudGluZyBpdCBpbiB0aGUgRDcxIGNhc2UuCj4gPiA+
IAo+ID4gPiBTaW5jZSBENzEgaGFzIG9uZSByZXNlcnZlZCBibG9jaywgYW5kIG5vdyB3ZSBjb3Vu
dCByZXNlcnZlZCBibG9jay4KPiA+ID4gCj4gPiA+IFNvIG5vdyBubyBtYXR0ZXIgRDMyIG9yIEQ3
MToKPiA+ID4gICBudW1fYmxvY2tzID0gbl92YWxpZF9ibG9jayArIG5fcmVzZXJ2ZWRfYmxvY2sg
KyBHQ1UuCj4gPiAKPiA+IFNvIGF0IGxlYXN0IHdlIG5lZWQgdGhhdCBjb21tZW50IGRyb3BwZWQg
aW4gd2l0aCB0aGUgY29kZS4gRnV0dXJlIEhXCj4gPiBtaWdodCBicmVhayB5b3VyIGFzc3VtcHRp
b24gaGVyZSBvbmNlIG1vcmUgYW5kIGl0IHdpbGwgdGhlbiBiZSB1c2VmdWwKPiA+IHRvIGtub3cg
d2h5IHRoaXMgd29ya3MgZm9yIGJvdGggcHJvZHVjdHMuCj4gCj4gT0ssIHdpbGwgYWRkIGEgY29t
bWVudHMgbGlrZS4KPiAKPiAvKiBQZXIgSFcgZGVzaWduOiBudW1fYmxvY2tzID0gbl92YWxpZF9i
bG9jayArIG5fcmVzZXJ2ZWRfYmxvY2sgKyBHQ1UgKi8KPiAKPiBBbmQgUGVyIEhXLCBhbGwgYXJj
aC12MS54IGluY2x1ZGUgKGQ3MS9kMzIvZDc3KSBmb2xsb3dzIHRoaXMgcnVsZSwKPiB0aGUgb2xk
IGxvZ2ljIHdoaWNoIHNraXAgdGhlIHJlc2VydmVkLWJsb2NrIGFjdHVhbGx5IG5vdCByaWdodC4K
CldlbGwsIGdpdmVuIHRoaXMgXi4uLgoKPiAKPiA+IEknZCBwZXJzb25hbGx5IGFic3RyYWN0IHRo
YXQgYSBiaXQgYmVoaW5kIGEgc21hbGwgaGVscGVyIGZ1bmMgYW5kCj4gPiBoYW5kbGUgZGlmZmVy
ZW50IHByb2R1Y3RzIHNlcGFyYXRlbHkuIEl0J3MgYSBiaXQgb2YgZHVwbGljYXRpb24gYnV0Cj4g
PiBtdWNoIGVhc2llciB0byBjb21wcmVoZW5kLiBTYXZlZCBjeWNsZXMgcmVhZGluZyBjb2RlID09
IEdvb2QgVGhpbmcodG0pLgoKLi4udGhlbiBteSBjb21tZW50IGhlcmUgXiBubyBsb25nZXIgYXBw
bGllcy4gOikKCkknZCBiZSBhIGJpdCBoYXBwaWVyIGlmIHRoYXQgZml4IGlzIHNwbGl0IG91dCBp
bnRvIGl0cyBvd24gcGF0Y2guIE1pbmQKZG9pbmcgdGhhdD8KCj4gCj4gT3VyIGtvbWVkYSBkcml2
ZXIgaGFzIHR3byBsYXllcnMsIGNvbW1vbiBsYXllciBhbmQgY2hpcC4gY3VycmVudCB3ZQo+IG9u
bHkgaGF2ZSBvbmUgY2hpcCBmb2xkZXIgZDcxIGZvciBzdXBwb3J0IGFyY2gtdjEueCBwcm9kY3V0
Lgo+IEFuZCBvdXIgZnV0dXJlIHByb2R1Y3RzIChhcmNoLXYyLngpIHdpbGwgaGF2ZSBpdHMgb3du
IGNoaXAgZm9sZGVyLCBhbmQKPiBpdHMgb3duIGNoaXAgc3BlY2lmaWMgY29kZS4KClRoZSBwb2lu
dCBpcyBtb290IG5vdywgYnV0IEkgbWVhbnQgYWRkaW5nIGEgZmV3IHNtYWxsIHN0YXRpYyBmdW5j
dGlvbnMgaW4KdGhlIHNhbWUgZmlsZS4gTm90aGluZyB0byBkbyB3aXRoIGxheWVyaW5nIDopLgoK
PiAKPiBUaGFua3MKPiBKYW1lcwo+ID4gCj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gSmFtZXMK
PiA+ID4gPiAKPiA+ID4gPiA+ICAJCW9mZnNldCArPSBENzFfQkxPQ0tfU0laRTsKPiA+ID4gPiA+
ICAJfQo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gQEAgLTYwMyw2ICs2MTMsNyBAQCBkNzFfaWRlbnRp
ZnkodTMyIF9faW9tZW0gKnJlZ19iYXNlLCBzdHJ1Y3Qga29tZWRhX2NoaXBfaW5mbyAqY2hpcCkK
PiA+ID4gPiA+ICAKPiA+ID4gPiA+ICAJc3dpdGNoIChwcm9kdWN0X2lkKSB7Cj4gPiA+ID4gPiAg
CWNhc2UgTUFMSURQX0Q3MV9QUk9EVUNUX0lEOgo+ID4gPiA+ID4gKwljYXNlIE1BTElEUF9EMzJf
UFJPRFVDVF9JRDoKPiA+ID4gPiA+ICAJCWZ1bmNzID0gJmQ3MV9jaGlwX2Z1bmNzOwo+ID4gPiA+
ID4gIAkJYnJlYWs7Cj4gPiA+ID4gPiAgCWRlZmF1bHQ6Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmgKPiA+ID4gPiA+IGlu
ZGV4IDE3MjdkYzk5MzkwOS4uODFkZTZhMjNlN2YzIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaAo+ID4gPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaAo+
ID4gPiA+ID4gQEAgLTcyLDYgKzcyLDE5IEBACj4gPiA+ID4gPiAgI2RlZmluZSBHQ1VfQ09OVFJP
TF9NT0RFKHgpCSgoeCkgJiAweDcpCj4gPiA+ID4gPiAgI2RlZmluZSBHQ1VfQ09OVFJPTF9TUlNU
CUJJVCgxNikKPiA+ID4gPiA+ICAKPiA+ID4gPiA+ICsvKiBHQ1VfQ09ORklHVVJBVElPTiByZWdp
c3RlcnMgKi8KPiA+ID4gPiA+ICsjZGVmaW5lIEdDVV9DT05GSUdVUkFUSU9OX0lEMAkweDEwMAo+
ID4gPiA+ID4gKyNkZWZpbmUgR0NVX0NPTkZJR1VSQVRJT05fSUQxCTB4MTA0Cj4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiArLyogR0NVIGNvbmZpZ3VyYXRpb24gKi8KPiA+ID4gPiA+ICsjZGVmaW5lIEdD
VV9NQVhfTElORV9TSVpFKHgpCSgoeCkgJiAweEZGRkYpCj4gPiA+ID4gPiArI2RlZmluZSBHQ1Vf
TUFYX05VTV9MSU5FUyh4KQkoKHgpID4+IDE2KQo+ID4gPiA+ID4gKyNkZWZpbmUgR0NVX05VTV9S
SUNIX0xBWUVSUyh4KQkoKHgpICYgMHg3KQo+ID4gPiA+ID4gKyNkZWZpbmUgR0NVX05VTV9QSVBF
TElORVMoeCkJKCgoeCkgPj4gMykgJiAweDcpCj4gPiA+ID4gPiArI2RlZmluZSBHQ1VfTlVNX1ND
QUxFUlMoeCkJKCgoeCkgPj4gNikgJiAweDcpCj4gPiA+ID4gPiArI2RlZmluZSBHQ1VfRElTUExB
WV9TUExJVF9FTih4KQkoKCh4KSA+PiAxNikgJiAweDEpCj4gPiA+ID4gPiArI2RlZmluZSBHQ1Vf
RElTUExBWV9UQlVfRU4oeCkJKCgoeCkgPj4gMTcpICYgMHgxKQo+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gIC8qIEdDVSBvcG1vZGUgKi8KPiA+ID4gPiA+ICAjZGVmaW5lIElOQUNUSVZFX01PREUJCTAK
PiA+ID4gPiA+ICAjZGVmaW5lIFRCVV9DT05ORUNUX01PREUJMQo+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiA+ID4gPiA+IGlu
ZGV4IGI3YTEwOTdjNDVjNC4uYWQzOGJiYzc0MzFlIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCj4gPiA+
ID4gPiBAQCAtMTI1LDYgKzEyNSw3IEBAIHN0YXRpYyBpbnQga29tZWRhX3BsYXRmb3JtX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGtvbWVkYV9vZl9tYXRjaFtdID0gewo+ID4g
PiA+ID4gIAl7IC5jb21wYXRpYmxlID0gImFybSxtYWxpLWQ3MSIsIC5kYXRhID0gZDcxX2lkZW50
aWZ5LCB9LAo+ID4gPiA+ID4gKwl7IC5jb21wYXRpYmxlID0gImFybSxtYWxpLWQzMiIsIC5kYXRh
ID0gZDcxX2lkZW50aWZ5LCB9LAo+ID4gPiA+ID4gIAl7fSwKPiA+ID4gPiA+ICB9Owo+ID4gPiA+
ID4gIAo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+IAo+ID4gCj4gPiAKPiAKCgot
LSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
