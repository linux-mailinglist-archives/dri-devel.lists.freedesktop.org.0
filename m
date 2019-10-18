Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A46DC1EE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 11:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FD38968D;
	Fri, 18 Oct 2019 09:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526258968D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 09:55:41 +0000 (UTC)
Received: from VI1PR0802CA0015.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::25) by DB6PR08MB2888.eurprd08.prod.outlook.com
 (2603:10a6:6:25::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 18 Oct
 2019 09:55:35 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by VI1PR0802CA0015.outlook.office365.com
 (2603:10a6:800:aa::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 18 Oct 2019 09:55:35 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 09:55:33 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 18 Oct 2019 09:55:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b9cf3b306bd601a
X-CR-MTA-TID: 64aa7808
Received: from ed6e6c079816.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7E36C9B-4F94-468F-B6B9-DF353B6C64AA.1; 
 Fri, 18 Oct 2019 09:55:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed6e6c079816.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 09:55:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWqrY+Mma5yhKhmEa/BfBkdjlKeVrgNKNEb/jeOBFOrKEf1O+6SrhEFBBic7PV1+R/JN0zOW448r247jJli4wh9jCZZlBPGE1xccaEoRWshztjhhw0gMDKlVoSn/AQnTaJDl5PuuH3cXVpnZKTbr9NRYeHSytdN/UfaK7OPvR77+O/l+fPwzmqK7KIo6JTnRBck2Elb4lAXdRr2yTxW+5owl3si8xSuKaKm5lz/f52fvvfRVN9CQSBOK/nDqknraJqNwQ4eL2uPVoppEhO61iz5bdEpA3gjKv/6tIj1rOiiVkQ2rlYTesHmpBFil7rwpyZWdq6yAzfh8YDJaI3aiig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyaJO6jKZ3GV8Hn1DNpPCgvFwEUVizXoXW/B3c4db78=;
 b=LykRYQVLsHENSsNwn7SYJ7+PtfnBmdImUK+nW7bXCQvgROewhKL8APgkBgSWo5HTB0R2VHLafTVim1UaIAsGGtCRm7cShm9rMokVDKBdadB2yV7yIUDv3e5cw/KL7FZaYShXjy8K9od+rGPr0Ec6BAex23DyC+k6PIk1ftR7Rf+Q8DnHWoL37bmfu5l/o14ApyfjrYZR7qDHZmLhWR3vpT49d6+rAYvjQlI41k/wVWLo/YmwgJnTxzj6vLpQAaKvKQLk1UibVO7ZbK3WGYV6bN0WuXrE142qo77pQKpD21yaJd/je7Rv9B1uDSh8U5zhpY+tQFt4cONrShc4o5I++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB5271.eurprd08.prod.outlook.com (10.255.123.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 09:55:17 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 09:55:17 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOE06vVhxy1kU6dQZ4T2LR+p6ddx+OAgAGsdgCAAAQmgIAAGMaAgADZPAA=
Date: Fri, 18 Oct 2019 09:55:17 +0000
Message-ID: <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <CAO_48GFHx4uK6cWwJ4oGdJ8HNZNZYDzdD=yR3VK0EXQ86ya9-g@mail.gmail.com>
 <20190924162217.GA12974@arm.com> <20191009173742.GA2682@arm.com>
 <f4fb09a5-999b-e676-0403-cc0de41be440@ti.com>
 <20191014090729.lwusl5zxa32a7uua@DESKTOP-E1NTVVP.localdomain>
 <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
In-Reply-To: <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 418fc50b-bd15-45d0-0f8c-08d753b15146
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB5271:|AM6PR08MB5271:|DB6PR08MB2888:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB2888CE1768B70D81BD2C4B50F06C0@DB6PR08MB2888.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(9686003)(66446008)(7416002)(316002)(66066001)(256004)(71190400001)(4326008)(6916009)(6116002)(305945005)(7736002)(2906002)(6512007)(71200400001)(54906003)(446003)(102836004)(14454004)(476003)(486006)(186003)(478600001)(76176011)(26005)(3846002)(53546011)(6506007)(386003)(25786009)(44832011)(58126008)(11346002)(6246003)(66476007)(81156014)(5660300002)(1076003)(561944003)(229853002)(64756008)(81166006)(99286004)(66946007)(8936002)(6436002)(6486002)(86362001)(66556008)(52116002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5271;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MfEiwEg/pTkl6s8pKhrfTDBMhC7DRncF9QPBl1TyFK9HW1yuIcxTRKjF+jddqYbfhDuRxadfBrznWcUmC/dOgx85BZCwaOOxkDI7lEAeHIY16705Md2cerredkxszDMs5aV9GFk32QeTF2nrIWnRUU1v330PHZMOYfDyLbL2PN/L/V+Cga8p3tlhw6PmiDj2bfS39oDjtZvPGAQHfqq8sjEpC9ENg3LrSSryvHq4TIVOayfqPYtaYWk85FyKCcsJUv6yD9ilRvl0lmLFdCO/Y2hn7qMtWCC4Pc87jnBgrFhQMgPqkMcCiMjDIkYMssRvaF7nMYtChIV7tsCeEgYoJpNcBhTxtLaMo3owWugPgi8xIkUBKrx+mD3xspIjtUktraMulLuBxKLN7Y63djDM5GSoSnG1K9GPYHId9xVzMqM=
Content-ID: <A2518C9FE01EAE4A9C3BE5F62A612E3D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5271
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(199004)(189003)(6506007)(6486002)(70206006)(6512007)(70586007)(66066001)(76176011)(14454004)(9686003)(7736002)(107886003)(356004)(6246003)(97756001)(305945005)(50466002)(47776003)(186003)(229853002)(25786009)(26826003)(54906003)(46406003)(316002)(11346002)(478600001)(8936002)(8746002)(26005)(486006)(86362001)(126002)(386003)(63350400001)(58126008)(336012)(476003)(22756006)(446003)(36906005)(6116002)(53546011)(4326008)(76130400001)(8676002)(23726003)(3846002)(81166006)(81156014)(561944003)(6862004)(99286004)(5660300002)(102836004)(2906002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2888;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4a911976-8c78-4ead-c6a9-08d753b147c8
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yB9WxTRlCTzPWZX9qvLlR9MPKdcOlnGCpgisjpaYryxT5FzOtVAMXHQsJc7qaY/dTnCG1JjHYT1t/q+r9g+1tnq7GKMGoBaf9pdV1JXS5jdXO7CBUY4N/yz18TpFb2ZzhX5Z+odR73/daOWX0CQ3S8uoe3jcaakrdFXOn4eD0WNqxUBqyLQNlRZkmloBNr4+YYzXl6GulwQswYnRKBw3z0hm/SgeEh7e/EhgUZ3DsW/Y8arKIYuNCBZ9Ag5hnieg2p6qZuIEMMDrnp884zqmWm2mSzlzdFd2bGdktpyq99WTY6BlX/pvw4JNKYVbimXpV5nIDVzFbZMHgQAC84Dm65AItoxsiqh+urm5EIsswcrkNYgrD/3R7r8Cy8gsXmRYenmBUFYKEsd0joT+e49zskSkdV6Lbx8/EjqUxBSonKU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 09:55:33.3426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 418fc50b-bd15-45d0-0f8c-08d753b15146
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2888
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyaJO6jKZ3GV8Hn1DNpPCgvFwEUVizXoXW/B3c4db78=;
 b=AtkqG29fxmAN8m8/RckLFG/f3pmPicXxzHlrt4fVEoNVRoqHUPoRatOYjHTDsh9RGspU7J1yxSTdBFermmxVEZjGOfyBbZt1CQFIe7JNYJK3jiJGk/xMVjHrecRH//KkpDmQoJ3gsnyasju24YoBcHkrIQm2P2ezgmaC2sUuMbU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyaJO6jKZ3GV8Hn1DNpPCgvFwEUVizXoXW/B3c4db78=;
 b=AtkqG29fxmAN8m8/RckLFG/f3pmPicXxzHlrt4fVEoNVRoqHUPoRatOYjHTDsh9RGspU7J1yxSTdBFermmxVEZjGOfyBbZt1CQFIe7JNYJK3jiJGk/xMVjHrecRH//KkpDmQoJ3gsnyasju24YoBcHkrIQm2P2ezgmaC2sUuMbU=
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 lkml <linux-kernel@vger.kernel.org>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDE6NTc6NDVQTSAtMDcwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6MjkgUE0gQW5kcmV3IEYuIERhdmlzIDxh
ZmRAdGkuY29tPiB3cm90ZToKPiA+IE9uIDEwLzE3LzE5IDM6MTQgUE0sIEpvaG4gU3R1bHR6IHdy
b3RlOgo+ID4gPiBCdXQgaWYgdGhlIG9iamVjdGlvbiBzdGFuZHMsIGRvIHlvdSBoYXZlIGEgcHJv
cG9zYWwgZm9yIGFuIGFsdGVybmF0aXZlCj4gPiA+IHdheSB0byBlbnVtZXJhdGUgYSBzdWJzZXQg
b2YgQ01BIGhlYXBzPwo+ID4gPgo+ID4gV2hlbiBpbiBzdGFnaW5nIElPTiBoYWQgdG8gcmVhY2gg
aW50byB0aGUgQ01BIGZyYW1ld29yayBhcyB0aGUgb3RoZXIKPiA+IGRpcmVjdGlvbiB3b3VsZCBu
b3QgYmUgYWxsb3dlZCwgc28gY21hX2Zvcl9lYWNoX2FyZWEoKSB3YXMgYWRkZWQuIElmCj4gPiBE
TUEtQlVGIGhlYXBzIGlzIG5vdCBpbiBzdGFnaW5nIHRoZW4gd2UgY2FuIGRvIHRoZSBvcHBvc2l0
ZSwgYW5kIGhhdmUKPiA+IHRoZSBDTUEgZnJhbWV3b3JrIHJlZ2lzdGVyIGhlYXBzIGl0c2VsZiB1
c2luZyBvdXIgZnJhbWV3b3JrLiBUaGF0IHdheQo+ID4gdGhlIENNQSBzeXN0ZW0gY291bGQgZGVj
aWRlIHdoYXQgYXJlYXMgdG8gZXhwb3J0IG9yIG5vdCAobWF5YmUgYmFzZWQgb24KPiA+IGEgRFQg
cHJvcGVydHkgb3Igc2ltaWxhcikuCj4gCj4gT2suIFRob3VnaCB0aGUgQ01BIGNvcmUgZG9lc24n
dCBoYXZlIG11Y2ggc2Vuc2Ugb2YgRFQgZGV0YWlscyBlaXRoZXIsCj4gc28gaXQgd291bGQgcHJv
YmFibHkgaGF2ZSB0byBiZSBkb25lIGluIHRoZSByZXNlcnZlZF9tZW0gbG9naWMsIHdoaWNoCj4g
ZG9lc24ndCBmZWVsIHJpZ2h0IHRvIG1lLgo+IAo+IEknZCBwcm9iYWJseSBndWVzcyB3ZSBzaG91
bGQgaGF2ZSBzb21lIHNvcnQgb2YgZHQgYmluZGluZyB0byBkZXNjcmliZQo+IGEgZG1hYnVmIGNt
YSBoZWFwIGFuZCBmcm9tIHRoYXQgbm9kZSBsaW5rIHRvIGEgQ01BIG5vZGUgdmlhIGEKPiBtZW1v
cnktcmVnaW9uIHBoYW5kbGUuIEFsb25nIHdpdGggbWF5YmUgdGhlIGRlZmF1bHQgaGVhcCBhcyB3
ZWxsPyBOb3QKPiBlYWdlciB0byBnZXQgaW50byBhbm90aGVyIGJpbmRpbmcgcmV2aWV3IGN5Y2xl
LCBhbmQgSSdtIG5vdCBzdXJlIHdoYXQKPiBub24tRFQgc3lzdGVtcyB3aWxsIGRvIHlldCwgYnV0
IEknbGwgdGFrZSBhIHNob3QgYXQgaXQgYW5kIGl0ZXJhdGUuCj4gCj4gPiBUaGUgZW5kIHJlc3Vs
dCBpcyB0aGUgc2FtZSBzbyB3ZSBjYW4gbWFrZSB0aGlzIGNoYW5nZSBsYXRlciAoaXQgaGFzIHRv
Cj4gPiBjb21lIGFmdGVyIERNQS1CVUYgaGVhcHMgaXMgaW4gYW55d2F5KS4KPiAKPiBXZWxsLCBJ
J20gaGVzaXRhbnQgdG8gbWVyZ2UgY29kZSB0aGF0IGV4cG9zZXMgYWxsIHRoZSBDTUEgaGVhcHMg
YW5kCj4gdGhlbiBhZGQgcGF0Y2hlcyB0aGF0IGJlY29tZXMgbW9yZSBzZWxlY3RpdmUsIHNob3Vs
ZCBhbnlvbmUgZGVwZW5kIG9uCj4gdGhlIGluaXRpYWwgYmVoYXZpb3IuIDovCgpIb3cgYWJvdXQg
b25seSBhdXRvLWFkZGluZyB0aGUgc3lzdGVtIGRlZmF1bHQgQ01BIHJlZ2lvbiAoY21hLT5uYW1l
ID09CiJyZXNlcnZlZCIpPwoKQW5kL29yIHRoZSBDTUEgYXV0by1hZGQgY291bGQgYmUgYmVoaW5k
IGEgY29uZmlnIG9wdGlvbj8gSXQgc2VlbXMgYQpzaGFtZSB0byBmdXJ0aGVyIGRlbGF5IHRoaXMs
IGFuZCB0aGUgQ01BIGhlYXAgaXRzZWxmIHJlYWxseSBpcyB1c2VmdWwuCgpDaGVlcnMsCi1Ccmlh
bgoKPiAKPiBTbywgPHNpZ2g+LCBJJ2xsIHN0YXJ0IG9uIHRoZSByZXdvcmsgZm9yIHRoZSBDTUEg
Yml0cy4KPiAKPiBUaGF0IHNhaWQsIEknbSBkZWZpbml0ZWx5IHdhbnRpbmcgdG8gbWFrZSBzb21l
IHByb2dyZXNzIG9uIHRoaXMgcGF0Y2gKPiBzZXJpZXMsIHNvIG1heWJlIHdlIGNhbiBzdGlsbCBt
ZXJnZSB0aGUgY29yZS9oZWxwZXJzL3N5c3RlbSBoZWFwIGFuZAo+IGp1c3QgaG9sZCB0aGUgY21h
IGhlYXAgZm9yIGEgcmV3b3JrIG9uIHRoZSBlbnVtZXJhdGlvbiBiaXRzLiBUaGF0IHdheQo+IHdl
IGNhbiBhdCBsZWFzdCBnZXQgb3RoZXIgZm9sa3Mgd29ya2luZyBvbiBzd2l0Y2hpbmcgdGhlaXIg
dmVuZG9yCj4gaGVhcHMgZnJvbSBJT04uCj4gCj4gU3VtaXQ6IERvZXMgdGhhdCBzb3VuZCBvaz8g
QXNzdW1pbmcgbm8gb3RoZXIgb2JqZWN0aW9ucywgY2FuIHlvdSB0YWtlCj4gdGhlIHYxMSBzZXQg
bWludXMgdGhlIENNQSBoZWFwIHBhdGNoPwo+IAo+IHRoYW5rcwo+IC1qb2huCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
