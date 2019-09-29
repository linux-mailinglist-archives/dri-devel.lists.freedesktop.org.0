Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E5C138E
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 08:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9746E2CA;
	Sun, 29 Sep 2019 06:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150080.outbound.protection.outlook.com [40.107.15.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B338C6E2C8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 06:16:13 +0000 (UTC)
Received: from DB6PR0802CA0043.eurprd08.prod.outlook.com (2603:10a6:4:a3::29)
 by DBBPR08MB4774.eurprd08.prod.outlook.com (2603:10a6:10:d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Sun, 29 Sep
 2019 06:16:08 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by DB6PR0802CA0043.outlook.office365.com
 (2603:10a6:4:a3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Sun, 29 Sep 2019 06:16:08 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sun, 29 Sep 2019 06:16:06 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Sun, 29 Sep 2019 06:16:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c17fe130ba3b6ef8
X-CR-MTA-TID: 64aa7808
Received: from b1278a66a9fe.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC97885B-4E27-4D5C-8C72-EACC8A62FD1A.1; 
 Sun, 29 Sep 2019 06:15:58 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b1278a66a9fe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Sun, 29 Sep 2019 06:15:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6kleeG6F/bVuSNrv96GlYPGUeWZog1kGAeeG3bA88iG6pRQQ3Rd8QEiwt8AC4vUizIcd0ePJ+ay04gcaL+GHSSSNvJQ2NCtLimuyQwJOHgIniWlzTltz89RzjhiNfPzPhxlQkgrkHiUfmeiWxIf0L5EnsSsQYt5CWSyRWqgy3uZP4Zy67r0Z5lU5Xx/eCPRHoQBAoNWMXA0d6KfAJs8DRG5orujVnhilCrtkcfjdtsSSJVba4oYUUSm4Vn63kfOSuPBioY0EWPrLrSIvz+ighXgOO0QP582/xNFhxGDV6NbiyJQYvcAoyrCP9M9NY+vF+PKCEnwesC0zgumcAMZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhWL9d5EO1yBgyHhj9xDuHB8780evWiZIfX7WYrKL3Y=;
 b=Icf1GZMEXCzfYfx42htRFereCtxtRhdv5vmdnLvwxdXQJd5i0uzMqYlQlZ90AO6Z8dKu1R6Nq7c8TE9vNGvsDGaa23HOjtZgZEcfGdTNYl7i7Bqo1W5ONwgHVGuC0mUehQWvrd/4ggEu01v6SgZLrc9etxrlzagkpi6ub3tQiL4hAlBjab+MIBqV9T+Wl/l1cCo/Rq0lFPXLnKfyYo2GqB1QOyvoUj827zEX2WWmVMd1rXzJD8l7RXVy5FYBinzC9yDBvZUsTY29jWJlrMRdd2mPFsnaaXYk8HKfX1SQ4Q21yfIgAZ+0lKXnC0OKrRT3M9MgVovS3U2yNOLLO2rO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5245.eurprd08.prod.outlook.com (20.179.31.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Sun, 29 Sep 2019 06:15:57 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.028; Sun, 29 Sep 2019
 06:15:57 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [v4] drm: two planes with the same zpos have undefined ordering
Thread-Topic: [v4] drm: two planes with the same zpos have undefined ordering
Thread-Index: AQHVdo1bde8EvaJXUEGo6Bi+OscpHA==
Date: Sun, 29 Sep 2019 06:15:57 +0000
Message-ID: <20190929061549.GA28809@jamwan02-TSP300>
References: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
In-Reply-To: <3FTYuSJGBfAG_MnVn604lEDUu1q2h6tI--IJOCx5Yp1SRwQig7s2AfLuleVvOS9WN1lLqAlXCWJu_Z60u3BnZfqCgFHDd_nPOUCAipaNpLk=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:203:2e::33) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d75bd49a-2028-4ce9-ee68-08d744a48343
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5245:|VE1PR08MB5245:|DBBPR08MB4774:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB47741FA76911508A4902D0F1B3830@DBBPR08MB4774.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 017589626D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(366004)(136003)(376002)(346002)(39850400004)(199004)(189003)(86362001)(99286004)(52116002)(1076003)(76176011)(256004)(14444005)(26005)(25786009)(186003)(6246003)(55236004)(4326008)(71200400001)(386003)(6506007)(71190400001)(33656002)(102836004)(5660300002)(66066001)(446003)(66946007)(6512007)(229853002)(64756008)(3846002)(6116002)(8676002)(8936002)(66476007)(6436002)(81166006)(14454004)(305945005)(66446008)(54906003)(7736002)(81156014)(66556008)(58126008)(6486002)(6916009)(478600001)(2906002)(316002)(9686003)(33716001)(486006)(476003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5245;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5xl8cshjdNdEjGzMkSEAh3JxHHKUzdYHVz637LkPiOcSYOFDiPb1QF0h88MeL+W0SApijNCSNM+nt4K5T6t/mnQSPpJ29Z0fcFb61X2lDr+4m2bIiY5QLnIVFdu4E1oIVnvfXdjXjLvOSGuuRjGTQbNZR8Q2x6Sc/YZHpCpDCvRAmMpxrSrF5O2UbrC7DVZJzfsgCe2nP9Qi6rNjgFkosE4aBEH0i11NMlktwkkuNZJATsiSOS0Q6DmcwtRv9+PmT4O1e2/w3PjQyEB4GBUobYZhdFY/OvKUbYysPtram9VITOV2+MhjTMpUWt7SJUDI05zZpOMqtiSd9gWR+B8l2GgeKztOFM0wX0He7vXDsmHDqJhQYEgL37AUKTPAo+UkdABo1TjfEXtDaCIgJQI1Ka1jzK1B8iG8fqP7jJKPZls=
Content-ID: <FE205680DCEAC646A981DC57C84F35BA@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5245
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(396003)(376002)(136003)(346002)(39850400004)(189003)(199004)(336012)(33656002)(102836004)(386003)(99286004)(316002)(6506007)(186003)(8746002)(26826003)(2906002)(47776003)(26005)(66066001)(486006)(58126008)(25786009)(476003)(446003)(11346002)(126002)(63350400001)(23726003)(6116002)(3846002)(54906003)(478600001)(76176011)(8936002)(6486002)(229853002)(6512007)(14444005)(9686003)(76130400001)(356004)(6246003)(70586007)(6862004)(70206006)(4326008)(14454004)(7736002)(22756006)(305945005)(5660300002)(8676002)(33716001)(1076003)(97756001)(81156014)(81166006)(46406003)(86362001)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4774;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f657dc8-e254-4cb2-1fa1-08d744a47d9c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DBBPR08MB4774; 
NoDisclaimer: True
X-Forefront-PRVS: 017589626D
X-Microsoft-Antispam-Message-Info: kc+PPOKHWydLdMJMl0g/3SkvAjDWGSIGcZ1giXZT83PuCHmlNFMgROOrYGwXbKvx9E7TBF58sH4SStuocjr/OGKzZGLH5cGPsJEpZ7bcemVDEG0q8iyZtjnkXX2mCGZy+c15enLUkqLFNDcJuBRs5QYlRk5YwBUEkbCA756mrzdhHlizEawcp6QPyj6Z/aGGW5ikJsM2Uen8P9O4QWkvEyYjGhIA9RJ/+zkC8ICFGuWz8GgwP8pm5GZ5c2xAMPPj59N2l2IWHPM77uYeV4gmLXoaRmjo5LntXzF5kqqc4RmvmDqsM7HRcqMYWE3mhdOGfczEOuSQ9F6+nRUL/erCFiFWN/OJM0rt87igNzwtuSnWOLvjIVuipn6p21HZq5rBtJa8KeHd2e0q0IgCj0tsotZy1gHqoOKmv/lEQZFhcPw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2019 06:16:06.3226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d75bd49a-2028-4ce9-ee68-08d744a48343
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4774
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhWL9d5EO1yBgyHhj9xDuHB8780evWiZIfX7WYrKL3Y=;
 b=sGgPzABagD85i4QaUmq6lFKryCNXfC7hew2FXIlyojNIsYXRHeoAKR8QxW+9KLZzzzF6AtmDTAMMKV4ALWVC13SB3axD1H9eyOQtC0oXYjoDjF+Hblina/TgOhNnzQFt26oox0+vG1U0OhkgNv4fN53IlIowfOI5INSH+znibbc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhWL9d5EO1yBgyHhj9xDuHB8780evWiZIfX7WYrKL3Y=;
 b=sGgPzABagD85i4QaUmq6lFKryCNXfC7hew2FXIlyojNIsYXRHeoAKR8QxW+9KLZzzzF6AtmDTAMMKV4ALWVC13SB3axD1H9eyOQtC0oXYjoDjF+Hblina/TgOhNnzQFt26oox0+vG1U0OhkgNv4fN53IlIowfOI5INSH+znibbc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTI6Mzk6MjBQTSArMDAwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IEN1cnJlbnRseSB0aGUgcHJvcGVydHkgZG9jcyBkb24ndCBzcGVjaWZ5IHdoZXRoZXIgaXQn
cyBva2F5IGZvciB0d28gcGxhbmVzIHRvCj4gaGF2ZSB0aGUgc2FtZSB6cG9zIHZhbHVlIGFuZCB3
aGF0IHVzZXItc3BhY2Ugc2hvdWxkIGV4cGVjdCBpbiB0aGlzIGNhc2UuCj4gCj4gVGhlIHJ1bGUg
bWVudGlvbm5lZCBpbiB0aGUgcGFzdCB3YXMgdG8gZGlzYW1iaWd1YXRlIHdpdGggb2JqZWN0IElE
cy4gSG93ZXZlcgo+IHNvbWUgZHJpdmVycyBicmVhayB0aGlzIHJ1bGUgKHRoYXQncyB3aHkgdGhl
IG9yZGVyaW5nIGlzIGRvY3VtZW50ZWQgYXMKPiB1bnNwZWNpZmllZCBpbiBjYXNlIHRoZSB6cG9z
IHByb3BlcnR5IGlzIG1pc3NpbmcpLiBBZGRpdGlvbmFsbHkgaXQgZG9lc24ndAo+IHJlYWxseSBt
YWtlIHNlbnNlIGZvciBhIGRyaXZlciB0byB1c2VyIGlkZW50aWNhbCB6cG9zIHZhbHVlcyBpZiBp
dCBrbm93cyB0aGVpcgo+IHJlbGF0aXZlIHBvc2l0aW9uOiB0aGUgZHJpdmVyIGNhbiBqdXN0IHBp
Y2sgZGlmZmVyZW50IHZhbHVlcyBpbnN0ZWFkLgo+IAo+IFNvIHR3byBzb2x1dGlvbnMgd291bGQg
bWFrZSBzZW5zZTogZWl0aGVyIGRpc2FsbG93IGNvbXBsZXRlbHkgaWRlbnRpY2FsIHpwb3MKPiB2
YWx1ZXMgZm9yIHR3byBkaWZmZXJlbnQgcGxhbmVzLCBlaXRoZXIgbWFrZSB0aGUgb3JkZXJpbmcg
dW5zcGVjaWZpZWQuIFRvIGFsbG93Cj4gZHJpdmVycyB0aGF0IGRvbid0IGtub3cgdGhlIHJlbGF0
aXZlIG9yZGVyaW5nIGJldHdlZW4gdHdvIHBsYW5lcyB0byBzdGlsbAo+IGV4cG9zZSB0aGUgenBv
cyBwcm9wZXJ0eSwgY2hvb3NlIHRoZSBsYXR0ZXIgc29sdXRpb24uCgpTb21lIEFybSdzIHVzYWdl
IGNhc2VzIGFib3V0IHR3byBwbGFuZXMgd2l0aCBzYW1lIHpwb3MuCgotICJTbWFydCBsYXllciIK
d2hpY2ggY2FuIGFjY2VwdHMgNCBkaWZmZXJlbnQgZmJzIHdpdGggZGlmZmVyZW50IHNyYy9kaXNw
bGF5IHJlY3QsCmJ1dCB0aGlzIHNtYXJ0IGxheWVyIGhhcyBvbmUgcmVzdHJpY3Rpb246Cgo0IGRp
c3BsYXkgcmVjdHMgbXVzdCBoYXZlIG5vIG92ZXJsYXBzIGluIFYgZGlyZWN0aW9uCihBIG9wdGlt
aXphdGlvbiBmb3IgYW5kcm9pZCB3aW5kb3cgbGlrZSBUb29sYmFyL05hdmlnYXRpb24gYmFyKQoK
U28gd2hlbiBtYXAgdGhpcyBTbWFydC1sYXllciB0byBkcm0gd29ybGQsIGl0IG1pZ2h0IGJlIDQg
ZGlmZmVyZW50CmRybS1wbGFuZXMsIGJ1dCB3aXRoIHNhbWUgem9yZGVyIHRvIGluZGljYXRlIHRo
YXQgdGhlc2UgNCBwbGFuZXMgYXJlCnNtYXJ0LWxheWUgcGxhbmVzLgoKLSAiVlItTGF5ZXIiCk9u
ZSBWUi1sYXllciBjb21wcmlzZXMgdHdvIGRpZmZlcmVudCB2aWV3cG9ydHMgd2hpY2ggY2FuIGJl
IGNvbmZpZ3VyZWQKd2l0aCB0b3RvYWxseSBkaWZmZXJlbnQgZmJzLCBzcmMvZGlzcGxheSByZWN0
Lgp3ZSB1c2UgdHdvIGRpZmZlcmVybnQgZHJtLXBsYW5lcyB0byBkcml2ZSBvbiBIVyAiVlItTGF5
ZXIiLCBhbmQgdGhlc2UKdHdvIGRybS1wbGFuZXMgbXVzdCBiZSBjb25maWd1cmVkIHdpdGggc2Ft
ZSB6cG9zLgoKVGhhbmtzCkphbWVzCgo+IFdoaWxlIGF0IGl0LCByZW1vdmUgdGhlIGFzc3VtcHRp
b24gdGhhdCB6cG9zIGlzIG9ubHkgZm9yIG92ZXJsYXkgcGxhbmVzLgo+IAo+IEFkZGl0aW9uYWxs
eSwgdXBkYXRlIHRoZSBkcm1fcGxhbmVfc3RhdGUuenBvcyBkb2NzIHRvIGNsYXJpZnkgdGhhdCB6
cG9zCj4gZGlzYW1iaWd1YXRpb24gdmlhIHBsYW5lIG9iamVjdCBJRHMgaXMgYSByZWNvbW1lbmRh
dGlvbiBmb3IgZHJpdmVycywgbm90Cj4gc29tZXRoaW5nIHVzZXItc3BhY2UgY2FuIHJlbHkgb24u
Cj4gCj4gdjI6IGNsYXJpZnkgZHJtX3BsYW5lX3N0YXRlLnpwb3MgZG9jcyAoRGFuaWVsKQo+IAo+
IHYzOiB6cG9zIGlzIGZvciBhbGwgcGxhbmVzIChNYXJpdXMsIERhbmllbCkKPiAKPiB2NDogY29t
cGxldGVseSByZXdvcmQgdGhlIGRybV9wbGFuZV9zdGF0ZS56cG9zIGRvY3MgdG8gbWFrZSBpdCBj
bGVhciB0aGUKPiByZWNvbW1lbmRhdGlvbiB0byB1c2UgcGxhbmUgSURzIGlzIGZvciBkcml2ZXJz
IGluIGNhc2UgdXNlci1zcGFjZSB1c2VzCj4gZHVwbGljYXRlIHpwb3MgdmFsdWVzIChQZWtrYSkK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+Cj4gQ2M6
IFBla2thIFBhYWxhbmVuIDxwcGFhbGFuZW5AZ21haWwuY29tPgo+IENjOiBNYXJpdXMgVmxhZCA8
bWFyaXVzLnZsYWRAY29sbGFib3JhLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9ibGVuZC5jIHwgOCAr
KysrLS0tLQo+ICBpbmNsdWRlL2RybS9kcm1fcGxhbmUuaCAgICAgfCA5ICsrKysrLS0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiAtLQo+
IDIuMjMuMAo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMKPiBpbmRleCBkMDI3MDlkZDJkNGEuLjEyMTQ4MWY2
YWE3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMKPiBAQCAtMTMyLDEwICsxMzIsMTAgQEAKPiAgICoJ
cGxhbmVzLiBXaXRob3V0IHRoaXMgcHJvcGVydHkgdGhlIHByaW1hcnkgcGxhbmUgaXMgYWx3YXlz
IGJlbG93IHRoZSBjdXJzb3IKPiAgICoJcGxhbmUsIGFuZCBvcmRlcmluZyBiZXR3ZWVuIGFsbCBv
dGhlciBwbGFuZXMgaXMgdW5kZWZpbmVkLiBUaGUgcG9zaXRpdmUKPiAgICoJWiBheGlzIHBvaW50
cyB0b3dhcmRzIHRoZSB1c2VyLCBpLmUuIHBsYW5lcyB3aXRoIGxvd2VyIFogcG9zaXRpb24gdmFs
dWVzCj4gLSAqCWFyZSB1bmRlcm5lYXRoIHBsYW5lcyB3aXRoIGhpZ2hlciBaIHBvc2l0aW9uIHZh
bHVlcy4gTm90ZSB0aGF0IHRoZSBaCj4gLSAqCXBvc2l0aW9uIHZhbHVlIGNhbiBhbHNvIGJlIGlt
bXV0YWJsZSwgdG8gaW5mb3JtIHVzZXJzcGFjZSBhYm91dCB0aGUKPiAtICoJaGFyZC1jb2RlZCBz
dGFja2luZyBvZiBvdmVybGF5IHBsYW5lcywgc2VlCj4gLSAqCWRybV9wbGFuZV9jcmVhdGVfenBv
c19pbW11dGFibGVfcHJvcGVydHkoKS4KPiArICoJYXJlIHVuZGVybmVhdGggcGxhbmVzIHdpdGgg
aGlnaGVyIFogcG9zaXRpb24gdmFsdWVzLiBUd28gcGxhbmVzIHdpdGggdGhlCj4gKyAqCXNhbWUg
WiBwb3NpdGlvbiB2YWx1ZSBoYXZlIHVuZGVmaW5lZCBvcmRlcmluZy4gTm90ZSB0aGF0IHRoZSBa
IHBvc2l0aW9uCj4gKyAqCXZhbHVlIGNhbiBhbHNvIGJlIGltbXV0YWJsZSwgdG8gaW5mb3JtIHVz
ZXJzcGFjZSBhYm91dCB0aGUgaGFyZC1jb2RlZAo+ICsgKglzdGFja2luZyBvZiBwbGFuZXMsIHNl
ZSBkcm1fcGxhbmVfY3JlYXRlX3pwb3NfaW1tdXRhYmxlX3Byb3BlcnR5KCkuCj4gICAqCj4gICAq
IHBpeGVsIGJsZW5kIG1vZGU6Cj4gICAqCVBpeGVsIGJsZW5kIG1vZGUgaXMgc2V0IHVwIHdpdGgg
ZHJtX3BsYW5lX2NyZWF0ZV9ibGVuZF9tb2RlX3Byb3BlcnR5KCkuCj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9wbGFuZS5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgKPiBpbmRleCBj
ZDU5MDNhZDMzZjcuLjMyODc3MzY5MDg1MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1f
cGxhbmUuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oCj4gQEAgLTE0MCwxMCArMTQw
LDExIEBAIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgewo+ICAJICogQHpwb3M6Cj4gIAkgKiBQcmlv
cml0eSBvZiB0aGUgZ2l2ZW4gcGxhbmUgb24gY3J0YyAob3B0aW9uYWwpLgo+ICAJICoKPiAtCSAq
IE5vdGUgdGhhdCBtdWx0aXBsZSBhY3RpdmUgcGxhbmVzIG9uIHRoZSBzYW1lIGNydGMgY2FuIGhh
dmUgYW4KPiAtCSAqIGlkZW50aWNhbCB6cG9zIHZhbHVlLiBUaGUgcnVsZSB0byBzb2x2aW5nIHRo
ZSBjb25mbGljdCBpcyB0byBjb21wYXJlCj4gLQkgKiB0aGUgcGxhbmUgb2JqZWN0IElEczsgdGhl
IHBsYW5lIHdpdGggYSBoaWdoZXIgSUQgbXVzdCBiZSBzdGFja2VkIG9uCj4gLQkgKiB0b3Agb2Yg
YSBwbGFuZSB3aXRoIGEgbG93ZXIgSUQuCj4gKwkgKiBVc2VyLXNwYWNlIG1heSBzZXQgbXV0YWJs
ZSB6cG9zIHByb3BlcnRpZXMgc28gdGhhdCBtdWx0aXBsZSBhY3RpdmUKPiArCSAqIHBsYW5lcyBv
biB0aGUgc2FtZSBDUlRDIGhhdmUgaWRlbnRpY2FsIHpwb3MgdmFsdWVzLiBUaGlzIGlzIGEKPiAr
CSAqIHVzZXItc3BhY2UgYnVnLCBidXQgZHJpdmVycyBjYW4gc29sdmUgdGhlIGNvbmZsaWN0IGJ5
IGNvbXBhcmluZyB0aGUKPiArCSAqIHBsYW5lIG9iamVjdCBJRHM7IHRoZSBwbGFuZSB3aXRoIGEg
aGlnaGVyIElEIGlzIHN0YWNrZWQgb24gdG9wIG9mIGEKPiArCSAqIHBsYW5lIHdpdGggYSBsb3dl
ciBJRC4KPiAgCSAqCj4gIAkgKiBTZWUgZHJtX3BsYW5lX2NyZWF0ZV96cG9zX3Byb3BlcnR5KCkg
YW5kCj4gIAkgKiBkcm1fcGxhbmVfY3JlYXRlX3pwb3NfaW1tdXRhYmxlX3Byb3BlcnR5KCkgZm9y
IG1vcmUgZGV0YWlscy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
