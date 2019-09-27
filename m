Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E60C0229
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 11:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3246EECB;
	Fri, 27 Sep 2019 09:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40058.outbound.protection.outlook.com [40.107.4.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0856EECB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 09:20:43 +0000 (UTC)
Received: from AM4PR08CA0061.eurprd08.prod.outlook.com (2603:10a6:205:2::32)
 by DBBPR08MB4316.eurprd08.prod.outlook.com (2603:10a6:10:c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23; Fri, 27 Sep
 2019 09:20:36 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by AM4PR08CA0061.outlook.office365.com
 (2603:10a6:205:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Fri, 27 Sep 2019 09:20:36 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 27 Sep 2019 09:20:35 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 27 Sep 2019 09:20:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39f0fd96134313bf
X-CR-MTA-TID: 64aa7808
Received: from 33096bf300a0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.13.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9914513C-3C8D-4776-92E3-90933EFED853.1; 
 Fri, 27 Sep 2019 09:20:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 33096bf300a0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 27 Sep 2019 09:20:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpJ5If7u7S7Qsl2Kmwrk1aLiKvH8AVXrDpaSGtAEC2Ulm8XwT62XcQ8h6SUuw9XWlmMrbPsjXWiK4pZlU/sjRYVHjTwH1zdiNyRm8oGJhsq2BDnI8iNW1X5eEo+uR/MrXZRsqVJ5DGLQPZluY12hsmmv/UkZbLboq7c8Aw+atWgOEJSaGGfWANPLfWppjSLPjNsj1rvapULkCS0cD/NhUNuRr8WwhsGwuCdoHG8rpqxCrF5bzvDBjGkO/tP5TV3IRuQ2HxR3POJ7nkV06ipOm/330kupriNnciZ4axBrFcoZ3Qb9h5iZrlW1O6uZ4XDQZYkCY0wI9ojkiNqVJwMWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktHVvdeE0AmLIusxxFngPXHQWytmcjQHpOTsyDE1emc=;
 b=h2uS6+OmvWzES3TiFVM9uOz3aBSjnha2GAdIQrLU1RFzNJ3ItE6K4oBL7TzsnYQsFgwMM21MHNd/0D78OyPxd511nRGwxOFNxGQe7+anDVHLUiOvgXi/syqfjD1k1CIEhA5kiqTB4RAGbwqneDM8vW+0oaH4Cp/d2Y/mG21JJwiFavEt73bYDe+GpwC5LNSp1lChRBOk1tjtLiuT7RIGAsxyWDdCOmmJg3j6LrMysYubWxe/+guUUuIkAAz24JifXx2cL7tjsYmX+4Th8pmtPXZgEEn18HaUUUd19FZJ/O1LKUk0UqSAXgDHr/eWzlicgDIkN37VtLUkSPD6VLFPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB5110.eurprd08.prod.outlook.com (10.255.34.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Fri, 27 Sep 2019 09:20:21 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.028; Fri, 27 Sep 2019
 09:20:21 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 5/5] kselftests: Add dma-heap test
Thread-Topic: [RESEND][PATCH v8 5/5] kselftests: Add dma-heap test
Thread-Index: AQHVZOOJZ3fRkDl+s0aCkKKSUkpz7qc57gQAgAStI4CAAMSfgA==
Date: Fri, 27 Sep 2019 09:20:20 +0000
Message-ID: <20190927092017.zh2srpk3m4wxha4c@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190906184712.91980-6-john.stultz@linaro.org>
 <20190923221150.lolc72yvuyazqhr6@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLWyNiaf_Fxa76t9nA9Ea++O1Tcisq_XpH9e1yZJP1YujA@mail.gmail.com>
In-Reply-To: <CALAqxLWyNiaf_Fxa76t9nA9Ea++O1Tcisq_XpH9e1yZJP1YujA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.50]
x-clientproxiedby: LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::24) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e87dc8c4-83c8-4395-59ca-08d7432bf413
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6PR08MB5110; 
X-MS-TrafficTypeDiagnostic: AM6PR08MB5110:|AM6PR08MB5110:|DBBPR08MB4316:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4316C4B16C6B1657DD9322CFF0810@DBBPR08MB4316.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0173C6D4D5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(189003)(199004)(26005)(478600001)(8936002)(44832011)(6436002)(6116002)(2906002)(5660300002)(25786009)(3846002)(7736002)(476003)(64756008)(66446008)(66476007)(66556008)(4326008)(99286004)(71200400001)(71190400001)(102836004)(446003)(186003)(6486002)(6916009)(386003)(256004)(8676002)(66946007)(6506007)(76176011)(6246003)(11346002)(81156014)(7416002)(52116002)(53546011)(305945005)(81166006)(54906003)(58126008)(9686003)(6512007)(14454004)(316002)(66066001)(229853002)(1076003)(86362001)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5110;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 90g0PTf721aVcc7knb+aZLl2troirLp9BFCDTDfulzW9/izWVPL4ow3bvKLYN9g+Gm0KbPNqVyvdviNVecIOtm2P8Xu8pLURhdfd4WURA9OVPLR9vPWf4TygHyaRWwor1DvB49PDhbfGRqve+gOLqvpGX5ss8hlLxtKR/cljNRvWzx4zEkPi9jQtV5v/01MPIsBrQ07PPstm/UuR0Ku5Gpa+9BpilfTJbIAVuRe3lU42g7IdWQOu3ZL4ly6/7igIrv4fBXCS3ayZLy+M9TFREOfPvX45AKQpogilQbJcSOZJ0PqvaHmoWFc2pZyFd6jDxfQD3JJTeDQN5XB/r8WbvfeSkOB3q+RLbrotX69+dfJGHpmFiXMEXznda77tJuBAp5rYe0eXfTfvMY2FVMeehGUgzxoWLjthJxBNIHPL5vM=
Content-ID: <A83649C0F316E04389BFB2A6370BCFA7@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5110
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(14454004)(102836004)(356004)(58126008)(126002)(336012)(1076003)(3846002)(50466002)(486006)(305945005)(11346002)(7736002)(76176011)(6116002)(22756006)(476003)(25786009)(46406003)(26005)(478600001)(4326008)(6512007)(8676002)(8746002)(97756001)(70206006)(99286004)(86362001)(70586007)(76130400001)(26826003)(8936002)(446003)(229853002)(81156014)(6246003)(6486002)(6862004)(36906005)(66066001)(54906003)(63350400001)(9686003)(6506007)(23726003)(81166006)(316002)(386003)(47776003)(5660300002)(186003)(53546011)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4316;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 41fb46c3-1a85-46fb-e910-08d7432beab5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DBBPR08MB4316; 
NoDisclaimer: True
X-Forefront-PRVS: 0173C6D4D5
X-Microsoft-Antispam-Message-Info: vxiJNt19vn7AfBhgWW+1AY2ZJduuu87wlvZSkHeYrfOXgXaJqdez9OfbG2UxfUMuHVx+RYfLotk3MQg2IHYdXt2EutlO+sFKj4/U83H87+Jhdzfe3fR6+gX2XtPwcctVU6la49eCQlhuUQXIPHmSFTF7RUMIsftJcch0Hgaj5zwFWU++Z9vhEFxeCTEeBOe2qaXoIF6JF61miyHeST3jyr0DQePj1uqtv0vunnygq/dYcw0LwPqRg9rGqmxnDXsbE5f4EnsgaMoolCQyt6CyPTw7eG/Rh0WkagaHdksfIyH/coskpZVwmm8XoG8xAkzPVP+dFLZyqScUc0v/tUQ3ug/PwlglCpvxMnXQZXirN1gnegby1wHeQI9stCY2L1svXT78lXcFPJl10/fg57v9c4r4/rMOqHMkzWmabcgwl8w=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2019 09:20:35.2757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87dc8c4-83c8-4395-59ca-08d7432bf413
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4316
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktHVvdeE0AmLIusxxFngPXHQWytmcjQHpOTsyDE1emc=;
 b=EOyGAmqM+yuJwCEbNQ4PcFZIitOKg6uYMW0ZXmIb4+jYWuSQ2maGCY47B7G2SsMHXckhiful28i19fPpcDM4Mkx/pUrihHq1MbMRzTbBS9a1CWadRMvfIljHTsOh1Zwm7sOKuqEI9Vcd2QzDzNBIWen33wCQPh2PMCI71YClTzU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktHVvdeE0AmLIusxxFngPXHQWytmcjQHpOTsyDE1emc=;
 b=EOyGAmqM+yuJwCEbNQ4PcFZIitOKg6uYMW0ZXmIb4+jYWuSQ2maGCY47B7G2SsMHXckhiful28i19fPpcDM4Mkx/pUrihHq1MbMRzTbBS9a1CWadRMvfIljHTsOh1Zwm7sOKuqEI9Vcd2QzDzNBIWen33wCQPh2PMCI71YClTzU=
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
Cc: nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIFRodSwgU2VwIDI2LCAyMDE5IGF0IDAyOjM2OjMzUE0gLTA3MDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDM6MTIgUE0gQnJpYW4gU3Rh
cmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBJIGRpZG4ndCBzZWUg
YW55IHJlc3BvbnNlIGFib3V0IHVzaW5nIHRoZSB0ZXN0IGhhcm5lc3MuIERpZCB5b3UgZGVjaWRl
Cj4gPiBhZ2FpbnN0IGl0Pwo+IAo+IEhleSEgU3BlbnQgYSBsaXR0bGUgdGltZSBsb29raW5nIGF0
IHRoaXMgYml0IGFuZCBqdXN0IHdhbnRlZCB0byByZXBseQo+IHRvIHRoaXMgcG9pbnQuICBTbyBm
aXJzdCwgYXBvbG9naWVzLCBJIHRoaW5rIEkgbWlzc2VkIHRoZSBzdWdnZXN0aW9uCj4gZWFybGll
ci4gVGhhdCBzYWlkLCBub3cgdGhhdCBJJ3ZlIGxvb2tlZCBhIGxpdHRsZSBiaXQgYXQgdGhlIHRl
c3QKPiBoYXJuZXNzLCBhbmQgYXQgbGVhc3QgYXQgdGhpcyBwb2ludCBpdCBmZWVscyBsaWtlIGl0
IG1ha2VzIGl0IGhhcmRlcgo+IHRvIHJlYXNvbiB3aXRoIHRoYW4gc3RhbmRhcmQgYyBjb2RlLiAg
TWF5YmUgSSBuZWVkIHRvIHNwZW5kIGEgYml0IG1vcmUKPiB0aW1lIG9uIGl0LCBidXQgSSdtIGEg
bGl0dGxlIGhlc2l0YW50IHRvIHN3YXAgb3ZlciBqdXN0IHlldC4KPiAKPiBJJ20gbm90IHBhcnRp
Y3VsYXJseSBwYXNzaW9uYXRlIG9uIHRoaXMgcG9pbnQsIGJ1dCBhcmUgeW91PyAgT3Igd2FzCj4g
dGhpcyBqdXN0IGEgcmVjb21tZW5kYXRpb24gdG8gY2hlY2sgaXQgb3V0IGFuZCBjb25zaWRlciBp
dD8KCk5vIHBhcnRpY3VsYXIgc3Ryb25nIGZlZWxpbmdzLiBJIHdhcyBqdXN0IHBva2luZyBhcm91
bmQgdGhlIGtlcm5lbApkb2NzIGZvciB0ZXN0aW5nIGFuZCB0aGUgb25seSBpbmZvIHRoZXJlIGlz
IGFib3V0IHRoZSB0ZXN0IGhhcm5lc3MsIHNvCndhbnRlZCB0byBjaGVjayBpZiB5b3UnZCBzZWVu
L2NvbnNpZGVyZWQgaXQuCgpBIHF1aWNrIGdyZXAgb2YgdG9vbHMvdGVzdGluZyBzaG93cyB0aGF0
IGl0J3Mgb2J2aW91c2x5IG5vdCB0aGF0CnBvcHVsYXIuLi4gc28gaWYgeW91IGRvbid0IGZhbmN5
IGl0IEkgd29uJ3QgY29tcGxhaW4uCgpUaGFua3MsCi1CcmlhbgoKPiAKPiB0aGFua3MKPiAtam9o
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
