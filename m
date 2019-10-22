Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79679E057E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 15:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC186E4AE;
	Tue, 22 Oct 2019 13:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30060.outbound.protection.outlook.com [40.107.3.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E456E48F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 13:51:26 +0000 (UTC)
Received: from VI1PR08CA0209.eurprd08.prod.outlook.com (2603:10a6:802:15::18)
 by DB6PR0801MB1989.eurprd08.prod.outlook.com (2603:10a6:4:75::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Tue, 22 Oct
 2019 13:51:23 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0209.outlook.office365.com
 (2603:10a6:802:15::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24 via Frontend
 Transport; Tue, 22 Oct 2019 13:51:22 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Tue, 22 Oct 2019 13:51:21 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Tue, 22 Oct 2019 13:51:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 716af3ad6767d287
X-CR-MTA-TID: 64aa7808
Received: from 43e3bae5bf38.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 460E82E8-FAEA-48EF-B79D-177777FEF318.1; 
 Tue, 22 Oct 2019 13:51:08 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43e3bae5bf38.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2019 13:51:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ngr1D9427FlvxyCeni4Wa2uZfcuEhI0kipdSlYanjcs4RdWyMYcgKP2ngJ9FeGfn+OOh0AYwaCEzG9werl3Ytl5/ZuhW/Zg2FA0mghxdiBMwKmjCVPh3jkceMXSciCIs6FIK2za6ZKbW0xxH3fsuL6OjuT3/8LnaKwMIDDWdQRQjYIuc1oAd6/8WkJ6LXkuwTEBfUmnqxmpeCZgH2s5a+cE+jkzDmidq1GyR9QumUnQzcHLibAN8cdyRZz/CWhbDQqMZHeJHYimFTOqDWDwz1iQg4cUi+Tb/ABM7vTbZEfjVJWBagE47zEErK/2sXcGRBEbjOJpcn4hRmMfvaOZ2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl6X8MBpd147JJY8zyoeciaOv4ES9FSJZk+oR1c3SN4=;
 b=fD+osRX6DRwXvFj2PFxxaVBzMKtCnTsFW7MPvprJScqqWx8+9Fr68fXvfp9dMw2XLtkOCCzSXZANu2ONACuHxu+NzfosowEyriLL1qBmABfhq+VmAbed4wZc4kIpzINr+P0ohF7LAUYGY87KxVXS5S/+SlWZ6GQQ18I4nD5OI+3C5wtxFL4CDuTuOiMoqqzdYiR7aVF4EZd1+RSOanYRcor6BbCpyFwFmV6NmZvURrzqZ61Zt7Hmex7vHwhsYFS/li5Zzb2QPrDkBhUv73A7O7UWMhCTLxWMtHsKgebdqlGcjAOAfMWhy1ZJoJjrEBI0SCYGjjFVau5T7mDqrXMhdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5349.eurprd08.prod.outlook.com (10.141.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 13:51:06 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::84b1:861:46e8:7a4e]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::84b1:861:46e8:7a4e%4]) with mapi id 15.20.2367.022; Tue, 22 Oct 2019
 13:51:06 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Topic: [RESEND][PATCH v8 0/5] DMA-BUF Heaps (destaging ION)
Thread-Index: AQHVZOOF+0BJBq1hEUK86gknnLECMKczS0sAgAfTZICAF6gMgIAADdeAgAc/QoCAA7QPgIABrHYAgAAEJoCAABjGgIAA2T6AgACS/YCAAAI7AIAAAj6AgAE6D4CAAtsXgIAB3pmA
Date: Tue, 22 Oct 2019 13:51:05 +0000
Message-ID: <20191022135105.GA7518@arm.com>
References: <a213760f-1f41-c4a3-7e38-8619898adecd@ti.com>
 <CALAqxLV6EBHKPEaEkyfhEYyw0TXayTeY_4AWXfuASLLyxZh5+Q@mail.gmail.com>
 <a3c66479-7433-ec29-fbec-81aef60cb063@ti.com>
 <CALAqxLWrsXG0XysL7RmhApbuZukDdG5VhdHOTS5odkG9f1ezwA@mail.gmail.com>
 <20191018095516.inwes5avdeixl5nr@DESKTOP-E1NTVVP.localdomain>
 <20191018184123.GA10634@arm.com>
 <CALAqxLXzOjyD1MpGeuZKLz+RNz1Utd8QpbvtSOodeqT-gCu6kA@mail.gmail.com>
 <20191018185723.GA27993@arm.com>
 <2c60496c-d536-05e7-bbf6-ca718b8142bd@ti.com>
 <20191021091806.v2buuugck5maxah5@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191021091806.v2buuugck5maxah5@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::32) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7138de94-2b38-493b-5946-08d756f6ebb8
X-MS-TrafficTypeDiagnostic: AM7PR08MB5349:|AM7PR08MB5349:|DB6PR0801MB1989:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB198903F061ACAEDBB67BA2E5E4680@DB6PR0801MB1989.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01986AE76B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(189003)(199004)(14454004)(6512007)(81156014)(99286004)(478600001)(256004)(8676002)(81166006)(6636002)(76176011)(14444005)(52116002)(71200400001)(71190400001)(6486002)(25786009)(6436002)(476003)(2906002)(11346002)(26005)(8936002)(54906003)(486006)(7736002)(446003)(2616005)(1076003)(86362001)(4326008)(44832011)(6862004)(6246003)(305945005)(102836004)(186003)(7416002)(6506007)(386003)(5660300002)(53546011)(229853002)(316002)(561944003)(66446008)(64756008)(66556008)(66476007)(6116002)(33656002)(37006003)(66946007)(3846002)(36756003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5349;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0Cee1stLAKypen2mRMXEp/B4ebj5lQIXdRjNnBVQKlqr8tulXmYmhkSPibfABLTQSoLO1IQPx84LzCQlHh55xFrtRS6ZxQpHVadNTZqrCA/oSkz7hKgKUj4/NoKTNHKNtmBVcZ39RNOUudSBUbxSYsH43JbbiYeh6iguQYqhH3QQtbcwkl3UUBrbO/ihtuNslFjUxa+ztPEqjz73wXEV1dBDkC3Jwk5wohSUftmkJjcFBzohwg4hbq9XnsBJZd1ub7tVQvZIwAwXcCrxlQJXbT6fQBwpoHc0Vi160hldIKHHg17pVP0+zqpOb3ax/ZIeqR3HhOJNpXzawi+tLdQLmda18snCJs5B50o+92AXC2JVm+iQxvkbkcaoU8a+AYB4fK0rH+VfEpDPcdEsERxNYb3DMXnc0AbphVB+GQ8DyvEj1TC83ptMzxoQSnBWpmK+
Content-ID: <2880F88B2E4DD347A7C1285C32C5B3A3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5349
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(76176011)(186003)(386003)(53546011)(102836004)(356004)(6506007)(46406003)(316002)(47776003)(126002)(97756001)(86362001)(26005)(446003)(14454004)(8936002)(63350400001)(8746002)(11346002)(2616005)(486006)(476003)(81156014)(336012)(8676002)(81166006)(6862004)(14444005)(25786009)(37006003)(54906003)(229853002)(6486002)(66066001)(305945005)(561944003)(6636002)(70206006)(76130400001)(22756006)(6512007)(7736002)(4326008)(2906002)(99286004)(23726003)(1076003)(3846002)(6116002)(36756003)(5660300002)(70586007)(26826003)(107886003)(6246003)(478600001)(33656002)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1989;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d8e75423-87fb-4903-6c72-08d756f6e27e
NoDisclaimer: True
X-Forefront-PRVS: 01986AE76B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRFLfmWtzyieVQa7/xAr2BNcaKi7ST23CfVXuFwHt5OIwPv19In+T1xSzerJamU5OSYrzAsgJPAFcjOh49mJzWFro8VskPTbqCMxFyR6yTCLzG1FoH5j/R7ASGPKhYhDzxJ8oWGVLdPlp6KlHfHetO464kHDWxQy0nm0Ph5RTXFNX98/DOt0ESSnOlczUlZ4Hs2Mnh/4nuzXZRMeIlI+LQS20ESNDsqv5ieS6XmPrDMNHYRH5882FlR01sYJxeaH3YLx15TNo9FUKb/O85gRrMnkxSD+z+kSAvVJXXtYJqkYlPbXoXR7axevdhKa60haj+XE4aqPawmT6gfAHq9syr+zIUBe++mf2mxt0qxRC/HG2F0Z4XOQrgYTgypMxCw7jsqfqoT11ufOEinGXXMKqtWv3il4pgBExRTPvPx99eZVJJBJlMsMQ52G0P/eXFyJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2019 13:51:21.2354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7138de94-2b38-493b-5946-08d756f6ebb8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1989
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl6X8MBpd147JJY8zyoeciaOv4ES9FSJZk+oR1c3SN4=;
 b=eyPGqJ8z5y5Oy2rWd7x94qGgaSdXuG9NahqX4Dq6RcI7zNgTqs7k+0X9Vn/6dNJJkQPYaAK8VtAqw6a8zQAXnC0cPZVtqra/79gufThfR8mfEJKmQ3/+UwjJIrvpqbDuO/kXP7g8/K5/7GWRkzhMxi9sgwxutWs6DaWjplQP1xI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wl6X8MBpd147JJY8zyoeciaOv4ES9FSJZk+oR1c3SN4=;
 b=eyPGqJ8z5y5Oy2rWd7x94qGgaSdXuG9NahqX4Dq6RcI7zNgTqs7k+0X9Vn/6dNJJkQPYaAK8VtAqw6a8zQAXnC0cPZVtqra/79gufThfR8mfEJKmQ3/+UwjJIrvpqbDuO/kXP7g8/K5/7GWRkzhMxi9sgwxutWs6DaWjplQP1xI=
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
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, nd <nd@arm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDk6MTg6MDdBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBPbiBTYXQsIE9jdCAxOSwgMjAxOSBhdCAwOTo0MToyN0FNIC0wNDAwLCBBbmRyZXcg
Ri4gRGF2aXMgd3JvdGU6Cj4gPiBPbiAxMC8xOC8xOSAyOjU3IFBNLCBBeWFuIEhhbGRlciB3cm90
ZToKPiA+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgMTE6NDk6MjJBTSAtMDcwMCwgSm9obiBT
dHVsdHogd3JvdGU6Cj4gPiA+PiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAxMTo0MSBBTSBBeWFu
IEhhbGRlciA8QXlhbi5IYWxkZXJAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+Pj4gT24gRnJpLCBPY3Qg
MTgsIDIwMTkgYXQgMDk6NTU6MTdBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4+
Pj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDE6NTc6NDVQTSAtMDcwMCwgSm9obiBTdHVsdHog
d3JvdGU6Cj4gPiA+Pj4+PiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAxMjoyOSBQTSBBbmRyZXcg
Ri4gRGF2aXMgPGFmZEB0aS5jb20+IHdyb3RlOgo+ID4gPj4+Pj4+IE9uIDEwLzE3LzE5IDM6MTQg
UE0sIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gPj4+Pj4+PiBCdXQgaWYgdGhlIG9iamVjdGlvbiBz
dGFuZHMsIGRvIHlvdSBoYXZlIGEgcHJvcG9zYWwgZm9yIGFuIGFsdGVybmF0aXZlCj4gPiA+Pj4+
Pj4+IHdheSB0byBlbnVtZXJhdGUgYSBzdWJzZXQgb2YgQ01BIGhlYXBzPwo+ID4gPj4+Pj4+Pgo+
ID4gPj4+Pj4+IFdoZW4gaW4gc3RhZ2luZyBJT04gaGFkIHRvIHJlYWNoIGludG8gdGhlIENNQSBm
cmFtZXdvcmsgYXMgdGhlIG90aGVyCj4gPiA+Pj4+Pj4gZGlyZWN0aW9uIHdvdWxkIG5vdCBiZSBh
bGxvd2VkLCBzbyBjbWFfZm9yX2VhY2hfYXJlYSgpIHdhcyBhZGRlZC4gSWYKPiA+ID4+Pj4+PiBE
TUEtQlVGIGhlYXBzIGlzIG5vdCBpbiBzdGFnaW5nIHRoZW4gd2UgY2FuIGRvIHRoZSBvcHBvc2l0
ZSwgYW5kIGhhdmUKPiA+ID4+Pj4+PiB0aGUgQ01BIGZyYW1ld29yayByZWdpc3RlciBoZWFwcyBp
dHNlbGYgdXNpbmcgb3VyIGZyYW1ld29yay4gVGhhdCB3YXkKPiA+ID4+Pj4+PiB0aGUgQ01BIHN5
c3RlbSBjb3VsZCBkZWNpZGUgd2hhdCBhcmVhcyB0byBleHBvcnQgb3Igbm90IChtYXliZSBiYXNl
ZCBvbgo+ID4gPj4+Pj4+IGEgRFQgcHJvcGVydHkgb3Igc2ltaWxhcikuCj4gPiA+Pj4+Pgo+ID4g
Pj4+Pj4gT2suIFRob3VnaCB0aGUgQ01BIGNvcmUgZG9lc24ndCBoYXZlIG11Y2ggc2Vuc2Ugb2Yg
RFQgZGV0YWlscyBlaXRoZXIsCj4gPiA+Pj4+PiBzbyBpdCB3b3VsZCBwcm9iYWJseSBoYXZlIHRv
IGJlIGRvbmUgaW4gdGhlIHJlc2VydmVkX21lbSBsb2dpYywgd2hpY2gKPiA+ID4+Pj4+IGRvZXNu
J3QgZmVlbCByaWdodCB0byBtZS4KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBJJ2QgcHJvYmFibHkgZ3Vl
c3Mgd2Ugc2hvdWxkIGhhdmUgc29tZSBzb3J0IG9mIGR0IGJpbmRpbmcgdG8gZGVzY3JpYmUKPiA+
ID4+Pj4+IGEgZG1hYnVmIGNtYSBoZWFwIGFuZCBmcm9tIHRoYXQgbm9kZSBsaW5rIHRvIGEgQ01B
IG5vZGUgdmlhIGEKPiA+ID4+Pj4+IG1lbW9yeS1yZWdpb24gcGhhbmRsZS4gQWxvbmcgd2l0aCBt
YXliZSB0aGUgZGVmYXVsdCBoZWFwIGFzIHdlbGw/IE5vdAo+ID4gPj4+Pj4gZWFnZXIgdG8gZ2V0
IGludG8gYW5vdGhlciBiaW5kaW5nIHJldmlldyBjeWNsZSwgYW5kIEknbSBub3Qgc3VyZSB3aGF0
Cj4gPiA+Pj4+PiBub24tRFQgc3lzdGVtcyB3aWxsIGRvIHlldCwgYnV0IEknbGwgdGFrZSBhIHNo
b3QgYXQgaXQgYW5kIGl0ZXJhdGUuCj4gPiA+Pj4+Pgo+ID4gPj4+Pj4+IFRoZSBlbmQgcmVzdWx0
IGlzIHRoZSBzYW1lIHNvIHdlIGNhbiBtYWtlIHRoaXMgY2hhbmdlIGxhdGVyIChpdCBoYXMgdG8K
PiA+ID4+Pj4+PiBjb21lIGFmdGVyIERNQS1CVUYgaGVhcHMgaXMgaW4gYW55d2F5KS4KPiA+ID4+
Pj4+Cj4gPiA+Pj4+PiBXZWxsLCBJJ20gaGVzaXRhbnQgdG8gbWVyZ2UgY29kZSB0aGF0IGV4cG9z
ZXMgYWxsIHRoZSBDTUEgaGVhcHMgYW5kCj4gPiA+Pj4+PiB0aGVuIGFkZCBwYXRjaGVzIHRoYXQg
YmVjb21lcyBtb3JlIHNlbGVjdGl2ZSwgc2hvdWxkIGFueW9uZSBkZXBlbmQgb24KPiA+ID4+Pj4+
IHRoZSBpbml0aWFsIGJlaGF2aW9yLiA6Lwo+ID4gPj4+Pgo+ID4gPj4+PiBIb3cgYWJvdXQgb25s
eSBhdXRvLWFkZGluZyB0aGUgc3lzdGVtIGRlZmF1bHQgQ01BIHJlZ2lvbiAoY21hLT5uYW1lID09
Cj4gPiA+Pj4+ICJyZXNlcnZlZCIpPwo+ID4gPj4+Pgo+ID4gPj4+PiBBbmQvb3IgdGhlIENNQSBh
dXRvLWFkZCBjb3VsZCBiZSBiZWhpbmQgYSBjb25maWcgb3B0aW9uPyBJdCBzZWVtcyBhCj4gPiA+
Pj4+IHNoYW1lIHRvIGZ1cnRoZXIgZGVsYXkgdGhpcywgYW5kIHRoZSBDTUEgaGVhcCBpdHNlbGYg
cmVhbGx5IGlzIHVzZWZ1bC4KPiA+ID4+Pj4KPiA+ID4+PiBBIGJpdCBvZiBhIGRldG91ciwgY29t
bWluZyBiYWNrIHRvIHRoZSBpc3N1ZSB3aHkgdGhlIGZvbGxvd2luZyBub2RlCj4gPiA+Pj4gd2Fz
IG5vdCBnZXR0aW5nIGRldGVjdGVkIGJ5IHRoZSBkbWEtYnVmIGhlYXBzIGZyYW1ld29yay4KPiA+
ID4+Pgo+ID4gPj4+ICAgICAgICAgcmVzZXJ2ZWQtbWVtb3J5IHsKPiA+ID4+PiAgICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gPiA+Pj4gICAgICAgICAgICAgICAgICNzaXpl
LWNlbGxzID0gPDI+Owo+ID4gPj4+ICAgICAgICAgICAgICAgICByYW5nZXM7Cj4gPiA+Pj4KPiA+
ID4+PiAgICAgICAgICAgICAgICAgZGlzcGxheV9yZXNlcnZlZDogZnJhbWVidWZmZXJANjAwMDAw
MDAgewo+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2hhcmVk
LWRtYS1wb29sIjsKPiA+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICBsaW51eCxjbWEtZGVm
YXVsdDsKPiA+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXVzYWJsZTsgPDw8PDw8PDw8
PDw8LS0tLS0tLS0tLS1UaGlzIHdhcyBtaXNzaW5nIGluIG91cgo+ID4gPj4+IGVhcmxpZXIgbm9k
ZQo+ID4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4NjAwMDAwMDAgMCAw
eDA4MDAwMDAwPjsKPiA+ID4+PiAgICAgICAgICAgICAgICAgfTsKPiA+ID4+Cj4gPiA+PiBSaWdo
dC4gSXQgaGFzIHRvIGJlIGEgQ01BIHJlZ2lvbiBmb3IgdXMgdG8gZXhwb3NlIGl0IGZyb20gdGhl
IGNtYSBoZWFwLgo+ID4gPj4KPiA+ID4+Cj4gPiA+Pj4gV2l0aCAncmV1c2FibGUnLCBybWVtX2Nt
YV9zZXR1cCgpIHN1Y2NlZWRzICwgYnV0IHRoZSBrZXJuZWwgY3Jhc2hlcyBhcyBmb2xsb3dzIDot
Cj4gPiA+Pj4KPiA+ID4+PiBbICAgIDAuNDUwNTYyXSBXQVJOSU5HOiBDUFU6IDIgUElEOiAxIGF0
IG1tL2NtYS5jOjExMCBjbWFfaW5pdF9yZXNlcnZlZF9hcmVhcysweGVjLzB4MjJjCj4gPiA+Pgo+
ID4gPj4gSXMgdGhlIHZhbHVlIDB4NjAwMDAwMDAgeW91J3JlIHVzaW5nIHNvbWV0aGluZyB5b3Ug
anVzdCBndWVzc2VkIGF0PyBJdAo+ID4gPj4gc2VlbXMgbGlrZSB0aGUgd2FybmluZyBoZXJlIGlz
IHNheWluZyB0aGUgcGZuIGNhbGN1bGF0ZWQgZnJvbSB0aGUgYmFzZQo+ID4gPj4gYWRkcmVzcyBp
c24ndCB2YWxpZC4KPiA+ID4gSXQgaXMgYSB2YWxpZCBtZW1vcnkgcmVnaW9uIHdlIHVzZSB0byBh
bGxvY2F0ZSBmcmFtZWJ1ZmZlcnMuCj4gPiAKPiA+IAo+ID4gQnV0IGRvZXMgaXQgaGF2ZSBhIHZh
bGlkIGtlcm5lbCB2aXJ0dWFsIG1hcHBpbmc/IE1vc3QgQVJNIHN5c3RlbXMgKGp1c3QKPiA+IGFz
c3VtaW5nIHlvdSBhcmUgd29ya2luZyBvbiBBUk0gOikpIHRoYXQgSSdtIGZhbWlsaWFyIHdpdGgg
aGF2ZSB0aGUgRFJBTQo+ID4gc3BhY2Ugc3RhcnRpbmcgYXQgMHg4MDAwMDAwMCBhbmQgc28gZG9u
J3Qgc3RhcnQgaGF2aW5nIHZhbGlkIHBmbnMgdW50aWwKPiA+IHRoYXQgcG9pbnQuIElzIHRoaXMg
YWRkcmVzcyB5b3UgYXJlIHJlc2VydmluZyBhbiBTUkFNPwo+ID4gCj4gCj4gWWVhaCwgSSB0aGlu
ayB5b3UndmUgZ290IGl0Lgo+IAo+IFRoaXMgcmVnaW9uIGlzIERSQU0gb24gYW4gRlBHQSBleHBh
bnNpb24gdGlsZSwgYnV0IGFzIHlvdSBoYXZlIG5vdGljZWQKPiBpdHMgImJlbG93IiB0aGUgc3Rh
cnQgb2YgbWFpbiBSQU0sIGFuZCBJIGV4cGVjdCBpdCdzIG5vdCBpbiBhbnkgb2YgdGhlCj4gZGVj
bGFyZWQgL21lbW9yeS8gbm9kZXMuCj4gCj4gV2hlbiAicmV1c2FibGUiIGlzbid0IHRoZXJlLCBJ
IHRoaW5rIHdlJ2xsIGVuZCB1cCBnb2luZyB0aGUgY29oZXJlbnQuYwo+IHJvdXRlLCB3aXRoIGRt
YV9pbml0X2NvaGVyZW50X21lbW9yeSgpIHNldHRpbmcgdXAgc29tZSBwYWdlcy4KPiAKPiBJZiAi
cmV1c2FibGUiIGlzIHRoZXJlLCB0aGVuIEkgdGhpbmsgd2UnbGwgZW5kIHVwIGluIGNvbnRpZ3Vv
dXMuYyBhbmQKPiB0aGF0IGV4cGVjdHMgdXMgdG8gYWxyZWFkeSBoYXZlIHBhZ2VzLgo+IAo+IFNv
LCBAQXlhbiwgeW91IGNvdWxkIHBlcmhhcHMgdHJ5IGFkZGluZyB0aGlzIHJlZ2lvbiBhcyBhIC9t
ZW1vcnkvIG5vZGUKPiBhcy13ZWxsLCB3aGljaCBzaG91bGQgbWVhbiB0aGUga2VybmVsIHNldHMg
dXAgc29tZSBwYWdlcyBmb3IgaXQgYXMKPiBub3JtYWwgbWVtb3J5LiBCdXQsIEkgaGF2ZSBzb21l
IGFuY2llbnQgcmVjb2xsZWN0aW9uIHRoYXQgdGhlIGFybTY0Cj4ga2VybmVsIGNvdWxkbid0IGhh
bmRsZSBzeXN0ZW0gUkFNIGF0IGFkZHJlc3NlcyBiZWxvdyAweDgwMDAwMDAwIG9yCj4gc29tZXRo
aW5nLiBUaGF0IG1pZ2h0IGJlIGRpZmZlcmVudCBub3csIEknbSB0YWxraW5nIGFib3V0IHNldmVy
YWwKPiB5ZWFycyBhZ28uCj4KVGhhbmtzIGEgbG90IGZvciB5b3VyIHN1Z2dlc3Rpb25zLgoKSSBh
ZGRlZCB0aGUgZm9sbG93aW5nIG5vZGUgaW4gdGhlIGR0cy4KCiAgICAgICBtZW1vcnlANjAwMDAw
MDAgewogICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwogICAgICAgICAgICAg
ICByZWcgPSA8MCAweDYwMDAwMDAwIDAgMHgwODAwMDAwMD47CiAgICAgICB9OwoKQW5kIGtlcHQg
dGhlICdyZXVzYWJsZScgcHJvcGVydHkgaW4KICAgICAgICBkaXNwbGF5X3Jlc2VydmVkOmZyYW1l
YnVmZmVyQDYwMDAwMDAwIHsuLi59OwoKTm93IHRoZSBrZXJuZWwgYm9vdHMgZmluZS4gSSBhbSBh
YmxlIHRvIGdldAovZGV2L2RtYV9oZWFwL2ZyYW1lYnVmZmVyXEA2MDAwMDAwMCAuIDopCgo+IFRo
YW5rcywKPiAtQnJpYW4KPiAKPiA+IEFuZHJldwo+ID4gCj4gPiAKPiA+ID4+Cj4gPiA+PiB0aGFu
a3MKPiA+ID4+IC1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
