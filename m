Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC589B2B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 12:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553F689F9F;
	Mon, 12 Aug 2019 10:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10062.outbound.protection.outlook.com [40.107.1.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CF689F9F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 10:18:29 +0000 (UTC)
Received: from VI1PR0802CA0024.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::34) by AM6PR08MB4949.eurprd08.prod.outlook.com
 (2603:10a6:20b:e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Mon, 12 Aug
 2019 10:18:25 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR0802CA0024.outlook.office365.com
 (2603:10a6:800:aa::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.15 via Frontend
 Transport; Mon, 12 Aug 2019 10:18:25 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 12 Aug 2019 10:18:23 +0000
Received: ("Tessian outbound 6d016ca6b65d:v26");
 Mon, 12 Aug 2019 10:18:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 813c41e795a2f42d
X-CR-MTA-TID: 64aa7808
Received: from 0dec9f8233c3.1 (cr-mta-lb-1.cr-mta-net [104.47.12.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DC0A41F-4642-43B1-A07D-40CDFAC87404.1; 
 Mon, 12 Aug 2019 10:18:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0dec9f8233c3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Aug 2019 10:18:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwkH2ALQS6vdC6PxxAHvVCtyRW4L8b3kOV1Ua9TAeYCUcaSFFRbCdAV3rQz19VrMNAsdxs35uxwe7XGCLBL/UsTq+ZcpC42+A4D24Zso8LY0GSKXzQyC87eG+yWw1/yiztWXh1zBfRyGpK8B5xqzaEelzAbTcKnbIjmZZdCBNPI0kIRq4wIkIZqxAuD0WNp4nAE8B+WnVEuFwxnx2C22h7e9o6PRGbmk91n6AGHTbj8oUDkie9yxJo228IlrH4OifE/JEk4d2BzV6voWrkPLioe0tdM4YiaD54+7Gl1SRnZtnKf3b8R4qa09F9IypPDXPH8P7jjqNhXw9PZ51VEAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgRokyRXgBvag74LNZBWLnXA/hzof2HlLf2l9yU8Bxc=;
 b=H9m/gRMvSzP0wK/B3EjQECTNl53xQzNVkUV4cynu9F1h3hgryzehU/G0WsJP+atwI9P6SKMDDk902xtcg+qA80CjUZddfcEKPXjUVIN/8yW3hQfwB3L6/VGbhL01l3FPY1aFVn9Aqg+Kj0DsSAImp8KoGTX2oSaufAF96Q8kK0X4i92asCM/8x/61Ul/IQGURwSgIQeNc/yhYUAiE2SN4k2x47eHRFSudHEJx9/ebpaFFtMHSUGhu9AmerntzwRBm0dY6e2LSydN84ofrkn/nN5+LAXponRYN/mCmOWh4YjIeQ916m8rGk4FB++MrDjf9jMlPUsEcCssDaKLQH6Y2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5262.eurprd08.prod.outlook.com (20.179.31.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Mon, 12 Aug 2019 10:18:11 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 10:18:11 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: drm/komeda: Fix potential integer overflow in
 komeda_crtc_update_clock_ratio
Thread-Topic: drm/komeda: Fix potential integer overflow in
 komeda_crtc_update_clock_ratio
Thread-Index: AQHVUPc+rOyABKz0zU+Ka9N6ADVAww==
Date: Mon, 12 Aug 2019 10:18:11 +0000
Message-ID: <20190812101805.GA3984@jamwan02-TSP300>
References: <20190812000801.GA29204@embeddedor>
In-Reply-To: <20190812000801.GA29204@embeddedor>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0190.apcprd02.prod.outlook.com
 (2603:1096:201:21::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b097051a-02f8-4abf-ba88-08d71f0e687a
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5262; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB5262:|AM6PR08MB4949:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4949542513F09F7E9E4F856BB3D30@AM6PR08MB4949.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 012792EC17
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(199004)(189003)(256004)(478600001)(55236004)(9686003)(5660300002)(14444005)(66066001)(446003)(386003)(6506007)(6512007)(6436002)(4326008)(33716001)(6916009)(6486002)(14454004)(66556008)(64756008)(66446008)(66476007)(486006)(25786009)(33656002)(58126008)(11346002)(476003)(66946007)(316002)(53936002)(71200400001)(71190400001)(305945005)(7736002)(52116002)(76176011)(186003)(54906003)(81156014)(81166006)(99286004)(8676002)(102836004)(8936002)(1076003)(229853002)(26005)(6246003)(6116002)(2906002)(3846002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5262;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: ew0GeRtp7ol15ddFfV4fSVSxMKCN+A+JSGCdXOVQV/P6o9mGOCc+M93y+qFNuYWRrUillRoI2jhGjgVxEUN7hJYk4UKlrjSHnH4zEvcEzZRK7b/NkA7QE4Z25gzE0hksoo6lXe1ZTWuTyca9D463bryAUxNuK9RxU84Clly12KEY/oO+O43g9HpV0pSAdYn71IgEP7QtZ6UlVPfM+LWcOKi0OQSoNeMzc0Vei/7045Gf0upv2sq5LPlkvKgZ5RrxUYfH4Kk/BeLq0WRCJbf2gGoBDp7y2mngmGFLNDcAjtXWi9zczx010PntTx011BzKSVw1NKszaSteeVB16JwZQnEA30cBXwmtMONYqaHz8+qZgNL7tKyU/+44VjNQTSxEfEfAE9WMWhewMumML3Ag1ll2fHl99QsOdjXWzZFyufI=
Content-ID: <FE7B14B9F6B9C2438521F2DBE9603114@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5262
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(199004)(189003)(14444005)(126002)(476003)(47776003)(46406003)(81156014)(81166006)(22756006)(54906003)(36906005)(446003)(8676002)(63370400001)(486006)(6246003)(11346002)(102836004)(6486002)(6512007)(9686003)(186003)(26005)(97756001)(6506007)(386003)(7736002)(5660300002)(76176011)(229853002)(1076003)(2906002)(305945005)(70586007)(336012)(6116002)(6862004)(14454004)(3846002)(76130400001)(8746002)(8936002)(316002)(86362001)(70206006)(33656002)(26826003)(478600001)(58126008)(99286004)(66066001)(33716001)(50466002)(25786009)(23726003)(356004)(63350400001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4949;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1f6d94a0-2257-4df0-5618-08d71f0e610c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR08MB4949; 
NoDisclaimer: True
X-Forefront-PRVS: 012792EC17
X-Microsoft-Antispam-Message-Info: KN6DPWu917HqrS7/Gj39EURLYmV6WAebrqIadjcKzmUNOOf2/s4C/Ra7fI+iFZXrQABQUBoOZ7U6A48HZk+c2Qe5SXCUeTEQVE/krujJfmeiwuEPImQAbYlFiIZNptOxZNVWV2xxGTDINublGtqkg5HgWmr9ijSU6ss7GD2Q92jrR0qxiIeaHH78hkitrXtfygCPrE1qkAAqpRr9nWfB3P1ipXiN6aUqP+TGV9HsnQOyQSMAm1NDnAimYvIZBbjl67WX7WnliGDoO2Lr+7Q4ranct4zqfd/YfV0tK9xSGsviwAim0EBb6j8OT6zk5Uvu8kuu1qrOgIi8KEiSZs4xaKKDC+dGz8oBi5ypeLTdJg4jIhT030Z0N/3867clhQ9BhU5UaVC4mDtuHTo865Ls35gec//FS9a/IV+WU9uxx28=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2019 10:18:23.8370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b097051a-02f8-4abf-ba88-08d71f0e687a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgRokyRXgBvag74LNZBWLnXA/hzof2HlLf2l9yU8Bxc=;
 b=vL2sd83TNw0IVgDAdCvUswOLBrZM6H/2HSAeBS7KjHgjJdXnkOluUX4Uq7tthlgbMztA85hSZywFO53i2QZQxY86D3rtSQQTyFfeLemTHtRJ6PEZ7CEkDNCeZYJtivhIAgFLrw7u61jiz1LWaDgNIkwj66+PBHG2A8Q0fHM/udw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgRokyRXgBvag74LNZBWLnXA/hzof2HlLf2l9yU8Bxc=;
 b=vL2sd83TNw0IVgDAdCvUswOLBrZM6H/2HSAeBS7KjHgjJdXnkOluUX4Uq7tthlgbMztA85hSZywFO53i2QZQxY86D3rtSQQTyFfeLemTHtRJ6PEZ7CEkDNCeZYJtivhIAgFLrw7u61jiz1LWaDgNIkwj66+PBHG2A8Q0fHM/udw=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMTEsIDIwMTkgYXQgMDc6MDg6MDFQTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBBZGQgc3VmZml4IFVMTCB0byBjb25zdGFudCAxMDAwIGluIG9yZGVyIHRv
IGF2b2lkIGEgcG90ZW50aWFsIGludGVnZXIKPiBvdmVyZmxvdyBhbmQgZ2l2ZSB0aGUgY29tcGls
ZXIgY29tcGxldGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHByb3Blcgo+IGFyaXRobWV0aWMgdG8g
dXNlLiBOb3RpY2UgdGhhdCB0aGlzIGNvbnN0YW50IGlzIGJlaW5nIHVzZWQgaW4gYSBjb250ZXh0
Cj4gdGhhdCBleHBlY3RzIGFuIGV4cHJlc3Npb24gb2YgdHlwZSB1NjQsIGJ1dCBpdCdzIGN1cnJl
bnRseSBldmFsdWF0ZWQKPiB1c2luZyAzMi1iaXQgYXJpdGhtZXRpYy4KPiAKPiBBZGRyZXNzZXMt
Q292ZXJpdHktSUQ6IDE0ODU3OTYgKCJVbmludGVudGlvbmFsIGludGVnZXIgb3ZlcmZsb3ciKQo+
IEZpeGVzOiBlZDIyYzZkOTMwNGQgKCJkcm0va29tZWRhOiBVc2UgZHJtX2Rpc3BsYXlfbW9kZSAi
Y3J0Y18iIHByZWZpeGVkIGhhcmR3YXJlIHRpbWluZ3MiKQo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rh
dm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IGluZGV4IGZhOWE0
NTkzYmIzNy4uNjI0ZDI1N2RhMjBmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBAIC0yNyw3ICsyNyw3IEBAIHN0YXRpYyB2
b2lkIGtvbWVkYV9jcnRjX3VwZGF0ZV9jbG9ja19yYXRpbyhzdHJ1Y3Qga29tZWRhX2NydGNfc3Rh
dGUgKmtjcnRjX3N0KQo+ICAJCXJldHVybjsKPiAgCX0KPiAgCj4gLQlweGxjbGsgPSBrY3J0Y19z
dC0+YmFzZS5hZGp1c3RlZF9tb2RlLmNydGNfY2xvY2sgKiAxMDAwOwo+ICsJcHhsY2xrID0ga2Ny
dGNfc3QtPmJhc2UuYWRqdXN0ZWRfbW9kZS5jcnRjX2Nsb2NrICogMTAwMFVMTDsKPiAgCWFjbGsg
PSBrb21lZGFfY3J0Y19nZXRfYWNsayhrY3J0Y19zdCk7Cj4gIAo+ICAJa2NydGNfc3QtPmNsb2Nr
X3JhdGlvID0gZGl2NjRfdTY0KGFjbGsgPDwgMzIsIHB4bGNsayk7CgpUaGFuayB5b3UgZm9yIHRo
ZSBwYXRjaC4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
