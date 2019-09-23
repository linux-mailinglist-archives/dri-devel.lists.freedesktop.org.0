Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B8BBE53
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 00:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBB26E9A8;
	Mon, 23 Sep 2019 22:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2406A6E9A8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 22:10:36 +0000 (UTC)
Received: from DB6PR0802CA0032.eurprd08.prod.outlook.com (2603:10a6:4:a3::18)
 by AM0PR08MB3762.eurprd08.prod.outlook.com (2603:10a6:208:100::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Mon, 23 Sep
 2019 22:10:34 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by DB6PR0802CA0032.outlook.office365.com
 (2603:10a6:4:a3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Mon, 23 Sep 2019 22:10:33 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Mon, 23 Sep 2019 22:10:33 +0000
Received: ("Tessian outbound 4a9865a8921c:v31");
 Mon, 23 Sep 2019 22:10:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38c6030cebe789a5
X-CR-MTA-TID: 64aa7808
Received: from 658229868cd6.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84FEBFFC-DE1D-48A2-A2EA-8FECB3E1418A.1; 
 Mon, 23 Sep 2019 22:10:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 658229868cd6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 23 Sep 2019 22:10:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZAQ84+bVMbLhanH7sQdAyaDUvxTlESiR/TCUxG/43/3RMIyyn8nMXneUHyYv3k2vzldP+sq5l5sNbXgeBsWjk3N4vPZ5+pd8syL3P+Et9xtThL6eu8dnK0TXhXNK5RxqphtW3h25oEWr/ShQPL9gZq73IWtUZPOhUU2p2x7tHxSOeXkV8vWdZgfbFc7Sz+KU0jQlCBSj/ognoCDPPFdn3fnxLKwmwbf2i0gpKZWooydo9GKHyw7ZUBHsFEDCvJdFD4lko4+f6rDrjyxTg1soFMRoia269CSMDoHTtONBCdeuqbVzHZU5ZewxObC4ArIKg6IHl7UknZAktJ8g+FUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGvhMgnXJXwpLJTptEp3F31xtqfPRaEgNOZQBm+Qdos=;
 b=AQwf5C3s1yz7WGwNlmDXRPkwsfWQPGUNxbo7BEzLR45joaHAXay6sg2aCJotc2+J8nDCaBHmcOIKWaKE6ptoLVoIaKev+47lbhfw7KDQtYt0jo5hdjqXwat5n6xbbwhRbdduP45oZLGG7Ta2iyB8sswUr4YhSh8iiq0cuOKRQDyIETHI/JbKloakwbHOlQpALZBzwhE9vghKLNr+jAYbKxGQa/Eo7XYiiqVlo3b3ncqP2eoq6tSSRGvYRMSD62S+57K0m4rlTPtHmerRNipUtpZvqNAbL4//vEXXiLVanELvt4lOPbdCdFhlEhaR/1GBYO3jl4TN3fyhGCxztNprZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 22:10:19 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 22:10:19 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 4/5] dma-buf: heaps: Add CMA heap to dmabuf
 heaps
Thread-Topic: [RESEND][PATCH v8 4/5] dma-buf: heaps: Add CMA heap to dmabuf
 heaps
Thread-Index: AQHVZOOH7YpCGzy7L0qigIXTV5Du46c57ZCA
Date: Mon, 23 Sep 2019 22:10:19 +0000
Message-ID: <20190923221013.ovwqdr34777cluj2@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-5-john.stultz@linaro.org>
In-Reply-To: <20190906184712.91980-5-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [195.233.151.106]
x-clientproxiedby: DB6PR07CA0107.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::21) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 474c6115-190a-4aad-694e-08d74072da77
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB3829; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB3829:|AM6PR08MB3829:|AM0PR08MB3762:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB376220432C3B932D8209C542F0850@AM0PR08MB3762.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0169092318
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(189003)(199004)(6506007)(26005)(7736002)(81166006)(186003)(52116002)(316002)(99286004)(64756008)(66476007)(66446008)(229853002)(66946007)(4326008)(25786009)(66556008)(446003)(9686003)(386003)(76176011)(6512007)(6246003)(102836004)(7416002)(58126008)(305945005)(476003)(6436002)(11346002)(5660300002)(2906002)(14454004)(71200400001)(71190400001)(54906003)(14444005)(6486002)(486006)(81156014)(256004)(44832011)(1076003)(6916009)(8676002)(6116002)(478600001)(8936002)(66066001)(86362001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3829;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 0blQdPxk0ik0KEUsOjtxHziQ8W/GKiu7lwEK0cJpgtrVbwoeArZFd5dM4uLaSz64xd0vGm1BrwqcOiWJRF4Z/NhI60uwYkjxLIQjUkxYNQqrfKK2sDjOnF+pME45e65WLnZFvvU4Nrh72FzZSxhRtMFsjalMk9ezdYImXNYnh2mJ4buTCKkDfMoQ7+8EGM/Eady4uoXAaLWOjexEC7geTdRKm5vCI3msWgqvhg9ETKlcJA02wA5y0K9w+t6sargs1YSLjIH4iREX2Mr+y1AgMDSnFw5kKCMpDWVdM4Bj29pEA2Fylit3E3fnstDoARTkyBEuHKhpLU6stie6rmgPmHLNuMzuRRAGhW4xuEUnZDTDlb8Z6zybOzQvYHaNtubNP7Htn1bLkqa9bfarQJ9+hCaoJxjETRT0PhSbgOLq5uQ=
Content-ID: <9484091C05350E49B0D3FF94BD7EBD2F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3829
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(376002)(136003)(346002)(189003)(199004)(58126008)(5660300002)(22756006)(23726003)(478600001)(2906002)(86362001)(14454004)(25786009)(126002)(305945005)(476003)(386003)(63350400001)(99286004)(6506007)(76130400001)(70586007)(102836004)(50466002)(7736002)(186003)(26005)(70206006)(3846002)(6116002)(76176011)(6246003)(46406003)(6486002)(47776003)(9686003)(66066001)(6512007)(446003)(336012)(26826003)(486006)(11346002)(229853002)(6862004)(356004)(1076003)(4326008)(54906003)(14444005)(316002)(81166006)(8676002)(8746002)(97756001)(81156014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3762;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 53780cd3-2012-4cb5-8eac-08d74072d21d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR08MB3762; 
NoDisclaimer: True
X-Forefront-PRVS: 0169092318
X-Microsoft-Antispam-Message-Info: WldBV3qN2VIognIv0yLHnPYUUzb5wK9ZVerLbReHOiVuqnprM7vpnS5xtWvVVNViW9SQrBexP2BpS83WieECRnwpRSx6nJiK/xifQFc7n1UWc/uFwtp8UyW+i6jqAgFDdwypoFyOqCXalXvp/AAmqeixEC2+3mzfrk2kwtUH81J/MbKeXOBmHZFyR6CDiBFJgcqHiV7kWd4TO6RBfpuhLJQBTgm8fcY1mKaAdx9+vA9VWVy/HJvSCNC91GgACWVVxekux/6Kn0DETfnonUh3ab7G1CiAuG2f0pTgHNdn81C+uXPwqx/O9roFdDfE2UbJLyiLGtZkcxp79EXPJhFdhdCreeGgfSRJQjnYouV0g13A+SUJTXN8IfhJXkOC0aH+g/KI6FHX1JNTAnWWne+lYajYDrHNiinpmvda43UWHDg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2019 22:10:33.1412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 474c6115-190a-4aad-694e-08d74072da77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGvhMgnXJXwpLJTptEp3F31xtqfPRaEgNOZQBm+Qdos=;
 b=PQqzsGL818Atp/dIqTX/fOCgkdaEOdWj1xb/dJXnXdrhf/WILnVRSPI7ajYfjPMS3QNnBBdwTZLRK/xbdleeVkqOtLqeaXh4ib7FYP0e3hufX84Qu/fZ91aMpoVud90jnAAt57OOA3yte7vl2MATjf/zMli3A17nAtxt5IJTi1U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGvhMgnXJXwpLJTptEp3F31xtqfPRaEgNOZQBm+Qdos=;
 b=PQqzsGL818Atp/dIqTX/fOCgkdaEOdWj1xb/dJXnXdrhf/WILnVRSPI7ajYfjPMS3QNnBBdwTZLRK/xbdleeVkqOtLqeaXh4ib7FYP0e3hufX84Qu/fZ91aMpoVud90jnAAt57OOA3yte7vl2MATjf/zMli3A17nAtxt5IJTi1U=
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
Cc: nd <nd@arm.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCkkgc3BvdHRlZCBvbmUgdGhpbmcgYmVsb3cgd2hpY2ggbWlnaHQgYmUgaGFybWxl
c3MsIGJ1dCBiZXN0IHRvIGNoZWNrLgoKT24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDY6NDc6MTFQ
TSArMDAwMCwgSm9obiBTdHVsdHogd3JvdGU6Cj4gVGhpcyBhZGRzIGEgQ01BIGhlYXAsIHdoaWNo
IGFsbG93cyB1c2Vyc3BhY2UgdG8gYWxsb2NhdGUKPiBhIGRtYS1idWYgb2YgY29udGlndW91cyBt
ZW1vcnkgb3V0IG9mIGEgQ01BIHJlZ2lvbi4KPiAKPiBUaGlzIGNvZGUgaXMgYW4gZXZvbHV0aW9u
IG9mIHRoZSBBbmRyb2lkIElPTiBpbXBsZW1lbnRhdGlvbiwgc28KPiB0aGFua3MgdG8gaXRzIG9y
aWdpbmFsIGF1dGhvciBhbmQgbWFpbnRhaW50ZXJzOgo+ICAgQmVuamFtaW4gR2FpZ25hcmQsIExh
dXJhIEFiYm90dCwgYW5kIG90aGVycyEKPiAKPiBDYzogTGF1cmEgQWJib3R0IDxsYWJib3R0QHJl
ZGhhdC5jb20+Cj4gQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5h
cm8ub3JnPgo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgo+IENj
OiBMaWFtIE1hcmsgPGxtYXJrQGNvZGVhdXJvcmEub3JnPgo+IENjOiBQcmF0aWsgUGF0ZWwgPHBy
YXRpa3BAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkgPEJyaWFuLlN0YXJrZXlA
YXJtLmNvbT4KPiBDYzogVmluY2VudCBEb25uZWZvcnQgPFZpbmNlbnQuRG9ubmVmb3J0QGFybS5j
b20+Cj4gQ2M6IFN1ZGlwdG8gUGF1bCA8U3VkaXB0by5QYXVsQGFybS5jb20+Cj4gQ2M6IEFuZHJl
dyBGLiBEYXZpcyA8YWZkQHRpLmNvbT4KPiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZy
YWRlYWQub3JnPgo+IENjOiBDaGVuYm8gRmVuZyA8ZmVuZ2NAZ29vZ2xlLmNvbT4KPiBDYzogQWxp
c3RhaXIgU3RyYWNoYW4gPGFzdHJhY2hhbkBnb29nbGUuY29tPgo+IENjOiBIcmlkeWEgVmFsc2Fy
YWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IFJldmlld2VkLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRA
bGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGlu
YXJvLm9yZz4KPiAtLS0KPiB2MjoKPiAqIFN3aXRjaCBhbGxvY2F0ZSB0byByZXR1cm4gZG1hYnVm
IGZkCj4gKiBTaW1wbGlmeSBpbml0IGNvZGUKPiAqIENoZWNrcGF0Y2ggZml4dXBzCj4gdjM6Cj4g
KiBTd2l0Y2ggdG8gaW5saW5lIGZ1bmN0aW9uIGZvciB0b19jbWFfaGVhcCgpCj4gKiBNaW5vciBj
bGVhbnVwcyBzdWdnZXN0ZWQgYnkgQnJpYW4KPiAqIEZvbGQgaW4gbmV3IHJlZ2lzdHJhdGlvbiBz
dHlsZSBmcm9tIEFuZHJldwo+ICogRm9sZGVkIGluIGNoYW5nZXMgZnJvbSBBbmRyZXcgdG8gdXNl
IHNpbXBsaWZpZWQgcGFnZSBsaXN0Cj4gICBmcm9tIHRoZSBoZWFwIGhlbHBlcnMKPiB2NDoKPiAq
IFVzZSB0aGUgZmRfZmxhZ3Mgd2hlbiBjcmVhdGluZyBkbWFidWYgZmQgKFN1Z2dlc3RlZCBieQo+
ICAgQmVuamFtaW4pCj4gKiBVc2UgcHJlY2FsY3VsYXRlZCBwYWdlY291bnQgKFN1Z2dlc3RlZCBi
eSBBbmRyZXcpCj4gdjY6Cj4gKiBDaGFuZ2VkIHZhcmlhYmxlIG5hbWVzIHRvIGltcHJvdmUgY2xh
cml0eSwgYXMgc3VnZ2VzdGVkCj4gICBieSBCcmlhbgo+IHY3Ogo+ICogVXNlIG5ld2x5IGxvd2Vy
LWNhc2VkIGluaXRfaGVhcF9oZWxwZXJfYnVmZmVyIGhlbHBlcgo+ICogVXNlIG5ldyBkbWFidWYg
ZXhwb3J0IGhlbHBlcgo+IHY4Ogo+ICogTWFrZSBzdHJ1Y3QgZG1hX2hlYXBfb3BzIGNvbnN0IChT
dWdnZXN0ZWQgYnkgQ2hyaXN0b3BoKQo+ICogQ29uZGVuc2UgZG1hX2hlYXBfYnVmZmVyIGFuZCBo
ZWFwX2hlbHBlcl9idWZmZXIgKHN1Z2dlc3RlZCBieQo+ICAgQ2hyaXN0b3BoKQo+ICogQ2hlY2tw
YXRjaCB3aGl0ZXNwYWNlIGZpeHVwcwo+IC0tLQoKLi4uCgo+ICsKPiArLyogZG1hYnVmIGhlYXAg
Q01BIG9wZXJhdGlvbnMgZnVuY3Rpb25zICovCj4gK3N0YXRpYyBpbnQgY21hX2hlYXBfYWxsb2Nh
dGUoc3RydWN0IGRtYV9oZWFwICpoZWFwLAo+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgbGVuLAo+
ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgZmRfZmxhZ3MsCj4gKwkJCSAgICAgdW5zaWduZWQgbG9u
ZyBoZWFwX2ZsYWdzKQo+ICt7Cj4gKwlzdHJ1Y3QgY21hX2hlYXAgKmNtYV9oZWFwID0gZG1hX2hl
YXBfZ2V0X2RhdGEoaGVhcCk7Cj4gKwlzdHJ1Y3QgaGVhcF9oZWxwZXJfYnVmZmVyICpoZWxwZXJf
YnVmZmVyOwo+ICsJc3RydWN0IHBhZ2UgKmNtYV9wYWdlczsKPiArCXNpemVfdCBzaXplID0gUEFH
RV9BTElHTihsZW4pOwo+ICsJdW5zaWduZWQgbG9uZyBucl9wYWdlcyA9IHNpemUgPj4gUEFHRV9T
SElGVDsKPiArCXVuc2lnbmVkIGxvbmcgYWxpZ24gPSBnZXRfb3JkZXIoc2l6ZSk7Cj4gKwlzdHJ1
Y3QgZG1hX2J1ZiAqZG1hYnVmOwo+ICsJaW50IHJldCA9IC1FTk9NRU07Cj4gKwlwZ29mZl90IHBn
Owo+ICsKPiArCWlmIChhbGlnbiA+IENPTkZJR19DTUFfQUxJR05NRU5UKQo+ICsJCWFsaWduID0g
Q09ORklHX0NNQV9BTElHTk1FTlQ7Cj4gKwo+ICsJaGVscGVyX2J1ZmZlciA9IGt6YWxsb2Moc2l6
ZW9mKCpoZWxwZXJfYnVmZmVyKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIWhlbHBlcl9idWZmZXIp
Cj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJaW5pdF9oZWFwX2hlbHBlcl9idWZmZXIoaGVs
cGVyX2J1ZmZlciwgY21hX2hlYXBfZnJlZSk7Cj4gKwloZWxwZXJfYnVmZmVyLT5mbGFncyA9IGhl
YXBfZmxhZ3M7Cj4gKwloZWxwZXJfYnVmZmVyLT5oZWFwID0gaGVhcDsKPiArCWhlbHBlcl9idWZm
ZXItPnNpemUgPSBsZW47Cj4gKwo+ICsJY21hX3BhZ2VzID0gY21hX2FsbG9jKGNtYV9oZWFwLT5j
bWEsIG5yX3BhZ2VzLCBhbGlnbiwgZmFsc2UpOwo+ICsJaWYgKCFjbWFfcGFnZXMpCj4gKwkJZ290
byBmcmVlX2J1ZjsKPiArCj4gKwlpZiAoUGFnZUhpZ2hNZW0oY21hX3BhZ2VzKSkgewo+ICsJCXVu
c2lnbmVkIGxvbmcgbnJfY2xlYXJfcGFnZXMgPSBucl9wYWdlczsKPiArCQlzdHJ1Y3QgcGFnZSAq
cGFnZSA9IGNtYV9wYWdlczsKPiArCj4gKwkJd2hpbGUgKG5yX2NsZWFyX3BhZ2VzID4gMCkgewo+
ICsJCQl2b2lkICp2YWRkciA9IGttYXBfYXRvbWljKHBhZ2UpOwo+ICsKPiArCQkJbWVtc2V0KHZh
ZGRyLCAwLCBQQUdFX1NJWkUpOwo+ICsJCQlrdW5tYXBfYXRvbWljKHZhZGRyKTsKPiArCQkJcGFn
ZSsrOwo+ICsJCQlucl9jbGVhcl9wYWdlcy0tOwo+ICsJCX0KPiArCX0gZWxzZSB7Cj4gKwkJbWVt
c2V0KHBhZ2VfYWRkcmVzcyhjbWFfcGFnZXMpLCAwLCBzaXplKTsKPiArCX0KPiArCj4gKwloZWxw
ZXJfYnVmZmVyLT5wYWdlY291bnQgPSBucl9wYWdlczsKPiArCWhlbHBlcl9idWZmZXItPnBhZ2Vz
ID0ga21hbGxvY19hcnJheShoZWxwZXJfYnVmZmVyLT5wYWdlY291bnQsCj4gKwkJCQkJICAgICBz
aXplb2YoKmhlbHBlcl9idWZmZXItPnBhZ2VzKSwKPiArCQkJCQkgICAgIEdGUF9LRVJORUwpOwo+
ICsJaWYgKCFoZWxwZXJfYnVmZmVyLT5wYWdlcykgewo+ICsJCXJldCA9IC1FTk9NRU07Cj4gKwkJ
Z290byBmcmVlX2NtYTsKPiArCX0KPiArCj4gKwlmb3IgKHBnID0gMDsgcGcgPCBoZWxwZXJfYnVm
ZmVyLT5wYWdlY291bnQ7IHBnKyspIHsKPiArCQloZWxwZXJfYnVmZmVyLT5wYWdlc1twZ10gPSAm
Y21hX3BhZ2VzW3BnXTsKPiArCQlpZiAoIWhlbHBlcl9idWZmZXItPnBhZ2VzW3BnXSkKCklzIHRo
aXMgZXZlciByZWFsbHkgcG9zc2libGU/IElmIGNtYV9wYWdlcyBpcyBub24tTlVMTCAod2hpY2gg
eW91CmNoZWNrIGVhcmxpZXIpLCB0aGVuIG9ubHkgaWYgdGhlIHBvaW50ZXIgYXJpdGhtZXRpYyBv
dmVyZmxvd3MgcmlnaHQ/CgpJZiBpdCdzIGp1c3QgcmVkdW5kYW50LCB0aGVuIHlvdSBjb3VsZCBy
ZW1vdmUgaXQgKGFuZCBpbiB0aGF0IGNhc2UgYWRkCm15IHItYikuIEJ1dCBtYXliZSB5b3UgbWVh
bnQgdG8gY2hlY2sgc29tZXRoaW5nIGVsc2U/CgpDaGVlcnMsCi1CcmlhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
