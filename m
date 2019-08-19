Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EFE91F5D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 10:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEB86E0E2;
	Mon, 19 Aug 2019 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30056.outbound.protection.outlook.com [40.107.3.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336EA6E0E2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 08:51:15 +0000 (UTC)
Received: from HE1PR0802CA0021.eurprd08.prod.outlook.com (2603:10a6:3:bd::31)
 by VI1PR0801MB1856.eurprd08.prod.outlook.com (2603:10a6:800:57::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 08:51:11 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by HE1PR0802CA0021.outlook.office365.com
 (2603:10a6:3:bd::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 08:51:10 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 08:51:09 +0000
Received: ("Tessian outbound 40a263b748b4:v26");
 Mon, 19 Aug 2019 08:51:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 340e751795cea520
X-CR-MTA-TID: 64aa7808
Received: from 13b618247d71.1 (cr-mta-lb-1.cr-mta-net [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED9C0397-F1DD-445D-A5B1-2EA5D788F171.1; 
 Mon, 19 Aug 2019 08:50:59 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 13b618247d71.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 19 Aug 2019 08:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLbuzkgOfSc6ifLA0XS6lSaAx4hNnCh9ZDgHXg4ZPKze+R8DT1Xjx4sRjU4tZjCJv4QpwCW9EGWNL3S3ZHgIuCb6d8lJsjZMeSEyUvOzzEmFbCbxuwqIZypmUkPvUJT3/IvXGD2d/j7qVDkaPfEy3rTXsxUf97WHf9wisuFtzqjds3ixT+ezPRbt6f5vBhKqGHZzP11OaDK7I6BTu/ZxG5K0Sa3Y7C4Mw3oSKmyKQ5kty5JTiRcbbMhS60HU5y5QAUub9RV8YQkfwF9VnaTH1NhF1exbcNYLlnoM81spmcBWydNsVBQrwAnhwCGVaXVxP5Tz4V4CvtDvtO11jtvDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p6bdrSQNkOhI/oyv7WbIu3eziWig73xVu4EoWPRukM=;
 b=kwZJaiIXPz8ivhEOVc4XV5Q/D2z1uTaPQCnliNTkWFXDkrlEuePudsHDN+GKDyXZ06dUBJCA/Nij6qG2Kyb7ag+2Uh3JXRYesLhG33yk13WxmYYpjG4MUUtT78rNEyT+zSq8oF1GbWKqyFLF5tBjfccI0fx2aI9HdY0FEWxPIkBb1JGD2GViWXJaHGAGHrZUILBHcY/lTNXqBs3JZFDIS3Jpb2z/HIEpbBW9co2RiwbU59NKnmJPN5Rg0uBml2tuCzNWxMRxhTGkOvjyqt4qTbn/sm9jfgX7t+5O1LCsTQd1ovVV6/5s9PMkSIQ6DSDNvE3phwszfWB4HWSHGdDJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4765.eurprd08.prod.outlook.com (10.255.113.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 08:50:56 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Mon, 19 Aug 2019
 08:50:56 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Topic: [PATCH v2 2/4] drm/komeda: Introduce komeda_color_manager/state
Thread-Index: AQHVUZNrgGWWre2e4Eyh5LBkmfNYaKb41hsAgAFxGACAADEJAIAHuwEA
Date: Mon, 19 Aug 2019 08:50:55 +0000
Message-ID: <20190819085048.GA10266@jamwan02-TSP300>
References: <20190813045536.28239-1-james.qian.wang@arm.com>
 <3902025.BCtzpz6JhW@e123338-lin> <20190814075210.GA24984@jamwan02-TSP300>
 <1949712.9lhcy9HeBp@e123338-lin>
In-Reply-To: <1949712.9lhcy9HeBp@e123338-lin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9e2110cb-e2dd-48d3-dc99-08d724826187
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4765; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4765:|VI1PR0801MB1856:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB185642F4A9F7C1DA357398E0B3A80@VI1PR0801MB1856.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0134AD334F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(58126008)(1076003)(6512007)(33656002)(9686003)(8936002)(54906003)(316002)(64756008)(55236004)(66476007)(2906002)(11346002)(71190400001)(66446008)(66556008)(26005)(66066001)(256004)(30864003)(14444005)(229853002)(478600001)(14454004)(8676002)(102836004)(71200400001)(53936002)(66946007)(33716001)(81166006)(81156014)(6116002)(186003)(446003)(6486002)(476003)(486006)(25786009)(52116002)(7736002)(305945005)(76176011)(5660300002)(6246003)(6636002)(4326008)(6506007)(6436002)(99286004)(386003)(6862004)(86362001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4765;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 0pMwOgqFq2yv8ocQ+F0Ii5DDvfL8Uc/yPNH9d+LsXTL0EjJ/KFgGrgbGdShCx5R1Rw25rXqsi2MvfgZwZiWN0LlTUhfRYbO1eX5T4Xg3rvPH+vD46Gt1GCCp7b0W2M09Ybd20IW/PmLTN9q3yEG6Lkiy7pIQeUnhFk/+R1CI+sNX7tlS73uy+yv0I5HyMoD+75clQQR0Es1VaZlds2kCeOk+Gy4/eEG0vIVXp78+5odhqj+KCJYTBnnp4DPMJIc/ivvSorr/Qy4GGJlMbjXIN8ZqcvRH+qC3Suw+RvRPFGtukJFDnkuVTPhKdcRa9HNAqJCeoKOBso/9auWGya22KiceYd7CYfd5bem+Awgm6aOBsvE4GtGfnuaTy1qeRLLG4h8150/Z8HJME3VNF8dvL+5LpPIIrU+Pz6Pa0xGhCVs=
Content-ID: <4CC43E1F6DFBE545AF7333012819D99F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4765
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(396003)(39860400002)(136003)(2980300002)(189003)(199004)(2486003)(23676004)(26826003)(478600001)(76176011)(3846002)(22756006)(305945005)(76130400001)(8936002)(9686003)(6512007)(30864003)(6246003)(6116002)(7736002)(14454004)(54906003)(58126008)(33656002)(1076003)(47776003)(70586007)(70206006)(14444005)(99286004)(8676002)(63370400001)(25786009)(336012)(356004)(81156014)(386003)(6506007)(11346002)(436003)(6486002)(476003)(126002)(486006)(6862004)(66066001)(63350400001)(229853002)(26005)(2906002)(186003)(4326008)(36906005)(316002)(33716001)(6636002)(86362001)(102836004)(50466002)(5660300002)(446003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1856;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6b11915e-1127-479d-b81e-08d7248258f2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(710020)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0801MB1856; 
NoDisclaimer: True
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Antispam-Message-Info: 8/6V2rfB8t2ar0pce7MN2MfxqQNedNyxKCcqXH6T5tnfnEBgczwaS8JpUgo/o56PM4n0IegyOMjx/6Jf8i/tah5tx4K0g5BJDaDSneIWg3kglfNoRHrqyAUTpf8pC1t0UXIsJVqSuRU9dJL/UUNHByeAaZVIt3VgI5r8Zo2Y4sJeYLQ721rSHeMosqAKhF8s3tm7yakvk9pCkYlxBman/6qJojj1phTPKpO2Eze7wAf7ulHtGEsLI9q4Si0YFzldyJ/TcKKVRDZzZ3z2jaKC26JY9injQySUMHsKOKswmehB03cmF1kBeM+eLmz2/JcZS6eop6gTJA1yIsfSCuKjc6pSKTJx8YmKGGBasHU2hQtYr2SM3B3Bb3qwEmIzeIAwoioXziac0hHZl1puAJYTMOvjHa2perAzAMeO8mtrKAk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 08:51:09.5195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2110cb-e2dd-48d3-dc99-08d724826187
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1856
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p6bdrSQNkOhI/oyv7WbIu3eziWig73xVu4EoWPRukM=;
 b=wNqBHw7miG0pafdOPzxvHQa5DWYCeNn8VPCEJsUSU/asNbp6J1N5XkwhLBidL9djqgWuSPDWR7kr3s2dktrh/ifeuvgzXZgCWGLmguplD0fQ/z/3we+06aGL9HstcdetL3wsasep+yvHnlTeNg7Ri8Cv4e+HRoeO5KHgGXdXYo0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p6bdrSQNkOhI/oyv7WbIu3eziWig73xVu4EoWPRukM=;
 b=wNqBHw7miG0pafdOPzxvHQa5DWYCeNn8VPCEJsUSU/asNbp6J1N5XkwhLBidL9djqgWuSPDWR7kr3s2dktrh/ifeuvgzXZgCWGLmguplD0fQ/z/3we+06aGL9HstcdetL3wsasep+yvHnlTeNg7Ri8Cv4e+HRoeO5KHgGXdXYo0=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6NDc6NDBBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToNCj4gT24gV2VkbmVzZGF5LCAxNCBBdWd1c3QgMjAxOSAwODo1MjoxOCBCU1QgamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6DQo+ID4gT24gVHVlLCBB
dWcgMTMsIDIwMTkgYXQgMDk6NTE6MDhBTSArMDAwMCwgTWloYWlsIEF0YW5hc3NvdiB3cm90ZToN
Cj4gPiA+IEhpIEphbWVzLA0KPiA+ID4gDQo+ID4gPiBPbiBUdWVzZGF5LCAxMyBBdWd1c3QgMjAx
OSAwNTo1NjowNyBCU1QgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3Jv
dGU6DQo+ID4gPiA+IE1hbnkga29tZWRhIGNvbXBvbmVudCBzdXBwb3J0IGNvbG9yIG1hbmFnZW1l
bnQgbGlrZSBsYXllciBhbmQgSVBTLCBzbw0KPiA+ID4gPiBrb21lZGFfY29sb3JfbWFuYWdlci9z
dGF0ZSBhcmUgaW50cm9kdWNlZCB0byBtYW5hZ2VyIGdhbW1hLCBjc2MgYW5kIGRlZ2FtbWENCj4g
PiA+ID4gdG9nZXRoZXIgZm9yIGVhc2lseSBzaGFyZSBpdCB0byBtdWx0aXBsZSBjb21wb25wZW50
Lg0KPiA+ID4gPiANCj4gPiA+ID4gQW5kIGZvciBrb21lZGFfY29sb3JfbWFuYWdlciB3aGljaDoN
Cj4gPiA+ID4gLSBjb252ZXJ0IGRybSAzZCBnYW1tYSBsdXQgdG8ga29tZWRhIHNwZWNpZmljIGdh
bW1hIGNvZWZmcw0KPiA+ID4gPiAtIGdhbW1hIHRhYmxlIG1hbmFnZW1lbnQgYW5kIGhpZGUgdGhl
IEhXIGRpZmZlcmVuY2UgZm9yIGtvbWVkYS1DT1JFDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfY29sb3JfbWdtdC5jICAgIHwgMTI2ICsrKysrKysrKysrKysrKysrKw0KPiA+
ID4gPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oICAgIHwgIDMy
ICsrKystDQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE1NiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYw0KPiA+ID4gPiBpbmRleCA5
ZDE0YTkyZGJiMTcuLmJmMjM4OGQ2NDFiOSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5jDQo+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQu
Yw0KPiA+ID4gPiBAQCAtNCw3ICs0LDkgQEANCj4gPiA+ID4gICAqIEF1dGhvcjogSmFtZXMuUWlh
bi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4NCj4gPiA+ID4gICAqDQo+ID4gPiA+ICAg
Ki8NCj4gPiA+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+DQo+ID4gPiA+ICANCj4gPiA+
ID4gKyNpbmNsdWRlICJtYWxpZHBfdXRpbHMuaCINCj4gPiA+ID4gICNpbmNsdWRlICJrb21lZGFf
Y29sb3JfbWdtdC5oIg0KPiA+ID4gPiAgDQo+ID4gPiA+ICAvKiAxMGJpdCBwcmVjaXNpb24gWVVW
MlJHQiBtYXRyaXggKi8NCj4gPiA+ID4gQEAgLTY1LDMgKzY3LDEyNyBAQCBjb25zdCBzMzIgKmtv
bWVkYV9zZWxlY3RfeXV2MnJnYl9jb2VmZnModTMyIGNvbG9yX2VuY29kaW5nLCB1MzIgY29sb3Jf
cmFuZ2UpDQo+ID4gPiA+ICANCj4gPiA+ID4gIAlyZXR1cm4gY29lZmZzOw0KPiA+ID4gPiAgfQ0K
PiA+ID4gPiArDQo+ID4gPiA+ICtzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIHsNCj4gPiA+ID4g
Kwl1MzIgYm91bmRhcnlfc3RhcnQ7DQo+ID4gPiA+ICsJdTMyIG51bV9vZl9zZWdtZW50czsNCj4g
PiA+ID4gKwl1MzIgc2VnbWVudF93aWR0aDsNCj4gPiA+ID4gK307DQo+ID4gPiA+ICsNCj4gPiA+
ID4gK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWdtZW50IHsNCj4gPiA+ID4gKwl1MzIgc3RhcnQ7DQo+
ID4gPiA+ICsJdTMyIGVuZDsNCj4gPiA+ID4gK307DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRp
YyBzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIHNlY3Rvcl90YmxbXSA9IHsNCj4gPiA+ID4gKwl7
IDAsICAgIDQsICA0ICAgfSwNCj4gTWF4IExVVCBwcmVjaXNpb24gKHNlZSBmdWxsIHJlc3BvbnNl
IGJlbG93KSBpcyBkZXRlcm1pbmVkIGJ5IHlvdXINCj4gc21hbGxlc3Qgc2VnbWVudCwgd2hpY2gg
aXMgNC4NCj4gPiA+ID4gKwl7IDE2LCAgIDQsICA0ICAgfSwNCj4gPiA+ID4gKwl7IDMyLCAgIDQs
ICA4ICAgfSwNCj4gPiA+ID4gKwl7IDY0LCAgIDQsICAxNiAgfSwNCj4gPiA+ID4gKwl7IDEyOCwg
IDQsICAzMiAgfSwNCj4gPiA+ID4gKwl7IDI1NiwgIDQsICA2NCAgfSwNCj4gPiA+ID4gKwl7IDUx
MiwgIDE2LCAzMiAgfSwNCj4gPiA+ID4gKwl7IDEwMjQsIDI0LCAxMjggfSwNCj4gPiA+ID4gK307
DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgZ2FtbWFfY3VydmVfc2VjdG9yIGln
YW1tYV9zZWN0b3JfdGJsW10gPSB7DQo+ID4gPiA+ICsJezAsIDY0LCA2NH0sDQo+ID4gPiA+ICt9
Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgdm9pZA0KPiA+ID4gPiArZHJtX2x1dF90b19j
b2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMsDQo+
ID4gPiA+ICsJCSAgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciAqc2VjdG9yX3RibCwgdTMyIG51
bV9zZWN0b3JzKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCXN0cnVjdCBkcm1fY29sb3JfbHV0ICps
dXQ7DQo+ID4gPiA+ICsJdTMyIGksIGosIGluLCBudW0gPSAwOw0KPiA+ID4gPiArDQo+ID4gPiA+
ICsJaWYgKCFsdXRfYmxvYikNCj4gPiA+ID4gKwkJcmV0dXJuOw0KPiA+ID4gPiArDQo+ID4gPiA+
ICsJbHV0ID0gbHV0X2Jsb2ItPmRhdGE7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlmb3IgKGkgPSAw
OyBpIDwgbnVtX3NlY3RvcnM7IGkrKykgew0KPiA+ID4gPiArCQlmb3IgKGogPSAwOyBqIDwgc2Vj
dG9yX3RibFtpXS5udW1fb2Zfc2VnbWVudHM7IGorKykgew0KPiA+ID4gPiArCQkJaW4gPSBzZWN0
b3JfdGJsW2ldLmJvdW5kYXJ5X3N0YXJ0ICsNCj4gPiA+ID4gKwkJCSAgICAgaiAqIHNlY3Rvcl90
YmxbaV0uc2VnbWVudF93aWR0aDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQkJY29lZmZzW251bSsr
XSA9IGRybV9jb2xvcl9sdXRfZXh0cmFjdChsdXRbaW5dLnJlZCwNCj4gPiA+ID4gKwkJCQkJCUtP
TUVEQV9DT0xPUl9QUkVDSVNJT04pOw0KPiA+ID4gPiArCQl9DQo+ID4gPiA+ICsJfQ0KPiA+ID4g
PiArDQo+ID4gPiA+ICsJY29lZmZzW251bV0gPSBCSVQoS09NRURBX0NPTE9SX1BSRUNJU0lPTik7
DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3ZvaWQgZHJtX2x1dF90b19pZ2FtbWFf
Y29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQ0K
PiA+ID4gPiArew0KPiA+ID4gPiArCWRybV9sdXRfdG9fY29lZmZzKGx1dF9ibG9iLCBjb2VmZnMs
DQo+ID4gPiA+ICsJCQkgIGlnYW1tYV9zZWN0b3JfdGJsLCBBUlJBWV9TSVpFKGlnYW1tYV9zZWN0
b3JfdGJsKSk7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3ZvaWQgZHJtX2x1dF90
b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAq
Y29lZmZzKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCWRybV9sdXRfdG9fY29lZmZzKGx1dF9ibG9i
LCBjb2VmZnMsDQo+ID4gPiA+ICsJCQkgIHNlY3Rvcl90YmwsIEFSUkFZX1NJWkUoc2VjdG9yX3Ri
bCkpOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICt2b2lkIGRybV9jdG1fdG9fY29l
ZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqY3RtX2Jsb2IsIHUzMiAqY29lZmZzKQ0KPiA+
ID4gPiArew0KPiA+ID4gPiArCXN0cnVjdCBkcm1fY29sb3JfY3RtICpjdG07DQo+ID4gPiA+ICsJ
dTMyIGk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlpZiAoIWN0bV9ibG9iKQ0KPiA+ID4gPiArCQly
ZXR1cm47DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwljdG0gPSBjdG1fYmxvYi0+ZGF0YTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArCWZvciAoaSA9IDA7IGkgPCBLT01FREFfTl9DVE1fQ09FRkZTOyArK2kp
IHsNCj4gPiA+ID4gKwkJLyogQ29udmVydCBmcm9tIFMzMS4zMiB0byBRMy4xMi4gKi8NCj4gPiA+
ID4gKwkJczY0IHYgPSBjdG0tPm1hdHJpeFtpXTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQljb2Vm
ZnNbaV0gPSBjbGFtcF92YWwodiwgMSAtICgxTEwgPDwgMzQpLCAoMUxMIDw8IDM0KSAtIDEpID4+
IDIwOw0KPiA+ID4gQ1RNIG1hdHJpeCB2YWx1ZXMgYXJlIFMzMS4zMiwgaS5lLiBzaWduLW1hZ25p
dHVkZSwgc28gY2xhbXBfdmFsIHdvbid0DQo+ID4gPiBnaXZlIHlvdSB0aGUgcmlnaHQgcmVzdWx0
IGZvciBuZWdhdGl2ZSBjb2VmZnMuIFNlZQ0KPiA+ID4gbWFsaWRwX2NydGNfYXRvbWljX2NoZWNr
X2N0bSBmb3IgdGhlIHNpZ24tbWFnIC0+IDIncyBjb21wbGVtZW50DQo+ID4gPiBjb252ZXJzaW9u
Lg0KPiA+IA0KPiA+IFRoYW5rIHlvdSBNaWhhaWwgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KPiA+
IA0KPiA+IE5vIG1hdHRlciBvdXIgdXNlciBvciBrZXJuZWwgYWxsIGFzc3VtZSB0aGlzIHMzMS4z
MiBhcyAyJ3MgY29tcGxlbWVudC4gDQo+ID4gd2UgbmVlZCB0byBjb3JyZWN0IHRoZW0gYm90aC4N
Cj4gPiANCj4gPiA+ID4gKwl9DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3ZvaWQg
a29tZWRhX2NvbG9yX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpu
ZXcsDQo+ID4gPiA+ICsJCQkJICBzdHJ1Y3Qga29tZWRhX2NvbG9yX3N0YXRlICpvbGQpDQo+ID4g
PiBbYmlrZXNoZWRdIG5vdCByZWFsbHkgYSBfZHVwbGljYXRlX3N0YXRlIGlmIGFsbCBpdCBkb2Vz
IGlzIHJlZmNvdW50cy4NCj4gPiA+IGttZW1kdXAgaGVyZSBhbmQgcmV0dXJuIGEgcG9pbnRlciAo
d2l0aCBFUlJfUFRSIG9uIGZhaWwpLCBvciBtZW1jcHkgaWYNCj4gPiA+IHlvdSB3YW50IHRvIGtl
ZXAgdGhlIHNpZ25hdHVyZT8NCj4gPiANCj4gPiBZZXMsIHRoZSBkdXAgbW9zdGx5IHNob3VsZCBy
ZXR1cm4gYSBuZXcgcHRyIGZyb20gYSBvbGQsIHRoZSBkdXAgbmFtZSBoZXJlDQo+ID4gaXMgbm90
IGFjY3VyYXRlLg0KPiA+IHRoZSByZWFzb24gaXMgdGhlIGNvbG9yX3N0YXRlIGlzIG5vdCBhIHNl
cGFyYXRlZCBzdHJ1Y3R1cmUgYnV0IGFsd2F5cw0KPiA+IGVtYmVkZGVkIGludG8gbGF5ZXJfc3Rh
dGUsIGJ1dCBJIHdhbnQgdG8gbWFrZSBhbGwgY29sb3Jfc3RhdGUgb3BlcmF0aW9uDQo+ID4gaW50
byBhIGZ1bmMuDQo+ID4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gPw0KPiA+IA0KPiBBZnRl
ciBsb29raW5nIGF0IHRoZSBmb2xsb3ctdXAgcGF0Y2gsIG5vdCByZWFsbHkgKGF0IGxlYXN0IG5v
dCBhbnkNCj4gZ29vZCBvbmVzKS4gSSBkaWQgdGFnIGl0IHdpdGggW2Jpa2VzaGVkXSBhZnRlciBh
bGwsIGl0J3Mgbm90IHRoYXQNCj4gYmlnIGEgZGVhbC4NCj4gDQo+ID4gPiA+ICt7DQo+ID4gPiA+
ICsJbmV3LT5pZ2FtbWEgPSBrb21lZGFfY29lZmZzX2dldChvbGQtPmlnYW1tYSk7DQo+ID4gPiA+
ICsJbmV3LT5mZ2FtbWEgPSBrb21lZGFfY29lZmZzX2dldChvbGQtPmZnYW1tYSk7DQo+ID4gPiA+
ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3ZvaWQga29tZWRhX2NvbG9yX2NsZWFudXBfc3RhdGUo
c3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSAqY29sb3Jfc3QpDQo+ID4gPiA+ICt7DQo+ID4gPiA+
ICsJa29tZWRhX2NvZWZmc19wdXQoY29sb3Jfc3QtPmlnYW1tYSk7DQo+ID4gPiA+ICsJa29tZWRh
X2NvZWZmc19wdXQoY29sb3Jfc3QtPmZnYW1tYSk7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4g
PiA+ID4gK2ludCBrb21lZGFfY29sb3JfdmFsaWRhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9tYW5h
Z2VyICptZ3IsDQo+ID4gPiA+ICsJCQkgIHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKnN0LA0K
PiA+ID4gPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmlnYW1tYV9ibG9iLA0KPiA+
ID4gPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmZnYW1tYV9ibG9iKQ0KPiA+ID4g
PiArew0KPiA+ID4gPiArCXUzMiBjb2VmZnNbS09NRURBX05fR0FNTUFfQ09FRkZTXTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArCWtvbWVkYV9jb2xvcl9jbGVhbnVwX3N0YXRlKHN0KTsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArCWlmIChpZ2FtbWFfYmxvYikgew0KPiA+ID4gPiArCQlkcm1fbHV0X3RvX2ln
YW1tYV9jb2VmZnMoaWdhbW1hX2Jsb2IsIGNvZWZmcyk7DQo+ID4gPiA+ICsJCXN0LT5pZ2FtbWEg
PSBrb21lZGFfY29lZmZzX3JlcXVlc3QobWdyLT5pZ2FtbWFfbWdyLCBjb2VmZnMpOw0KPiA+ID4g
PiArCQlpZiAoIXN0LT5pZ2FtbWEpIHsNCj4gPiA+ID4gKwkJCURSTV9ERUJVR19BVE9NSUMoInJl
cXVlc3QgaWdhbW1hIHRhYmxlIGZhaWxlZC5cbiIpOw0KPiA+ID4gPiArCQkJcmV0dXJuIC1FQlVT
WTsNCj4gPiA+ID4gKwkJfQ0KPiA+ID4gPiArCX0NCj4gPiA+ID4gKw0KPiA+ID4gPiArCWlmIChm
Z2FtbWFfYmxvYikgew0KPiA+ID4gPiArCQlkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoZmdhbW1h
X2Jsb2IsIGNvZWZmcyk7DQo+ID4gPiA+ICsJCXN0LT5mZ2FtbWEgPSBrb21lZGFfY29lZmZzX3Jl
cXVlc3QobWdyLT5mZ2FtbWFfbWdyLCBjb2VmZnMpOw0KPiA+ID4gPiArCQlpZiAoIXN0LT5mZ2Ft
bWEpIHsNCj4gPiA+ID4gKwkJCURSTV9ERUJVR19BVE9NSUMoInJlcXVlc3QgZmdhbW1hIHRhYmxl
IGZhaWxlZC5cbiIpOw0KPiA+ID4gPiArCQkJcmV0dXJuIC1FQlVTWTsNCj4gPiA+ID4gKwkJfQ0K
PiA+ID4gPiArCX0NCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldHVybiAwOw0KPiA+ID4gPiArfQ0K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29sb3JfbWdtdC5oDQo+ID4gPiA+IGluZGV4IGEyZGYyMThmNThlNy4uNDFhOTZiM2I1
NDBmIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oDQo+ID4gPiA+IEBAIC00LDE0ICs0
LDQyIEBADQo+ID4gPiA+ICAgKiBBdXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53
YW5nQGFybS5jb20+DQo+ID4gPiA+ICAgKg0KPiA+ID4gPiAgICovDQo+ID4gPiA+IC0NCj4gPiA+
ID4gICNpZm5kZWYgX0tPTUVEQV9DT0xPUl9NR01UX0hfDQo+ID4gPiA+ICAjZGVmaW5lIF9LT01F
REFfQ09MT1JfTUdNVF9IXw0KPiA+ID4gPiAgDQo+ID4gPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9j
b2xvcl9tZ210Lmg+DQo+ID4gPiA+ICsjaW5jbHVkZSAia29tZWRhX2NvZWZmcy5oIg0KPiA+ID4g
PiAgDQo+ID4gPiA+ICAjZGVmaW5lIEtPTUVEQV9OX1lVVjJSR0JfQ09FRkZTCQkxMg0KPiA+ID4g
PiArI2RlZmluZSBLT01FREFfTl9SR0IyWVVWX0NPRUZGUwkJMTINCj4gPiA+ID4gKyNkZWZpbmUg
S09NRURBX0NPTE9SX1BSRUNJU0lPTgkJMTINCj4gPiA+ID4gKyNkZWZpbmUgS09NRURBX05fR0FN
TUFfQ09FRkZTCQk2NQ0KPiA+ID4gPiArI2RlZmluZSBLT01FREFfQ09MT1JfTFVUX1NJWkUJCUJJ
VChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKQ0KPiA+IA0KPiA+ID4gSSBkb24ndCBzZWUgaG93IHRo
ZSBudW1iZXIgb2YgTFVUIGVudHJpZXMgaGFzIGFueXRoaW5nIHRvIGRvIHdpdGggdGhlDQo+ID4g
PiBiaXQtcHJlY2lzaW9uIG9mIGVhY2ggZW50cnkuDQo+ID4gDQo+ID4gQmVjYXVzZSBvdXIga29t
ZWRhIGNvbG9yIGlzIDEyLWJpdCBwcmVjaXNvbiwgYW5kIGZvciAxIHZzIDEgbG9vcHVwDQo+ID4g
dGFibGUsIHdlIG5lZWQgQklUKDEyKSBlbnRyaWVzLg0KPiA+IA0KPiA+IFRoYW5rIHlvdQ0KPiA+
IEphbWVzDQo+ID4gDQo+IEJ1dCB5b3VyIG1heGltdW0gcG9zc2libGUgcHJlY2lzaW9uIGluIEhX
IGlzIDQgdGltZXMgbGVzcy4gWW91IG9ubHkNCj4gcmVhbGx5IG5lZWQgb25lIExVVCBlbnRyeSBw
ZXIgc2VnbWVudCAoaXRzIHN0YXJ0KSBpbiBvcmRlciB0bw0KPiBkZWZpbmUgaXQgKGFuZCB0aGUg
c2xvcGUsIGJ1dCB5b3UgZ2V0IHRoZSBpZGVhKS4gSS5lLiBhdCB5b3VyIGN1cnJlbnQNCj4gNEst
c2l6ZWQgTFVUIHRhYmxlLCB0aGUgY29udmVyc2lvbiB0byB0aGUgaW50ZXJuYWwgcmVwcmVzZW50
YXRpb24gb25seQ0KPiBfcmVhbGx5XyBuZWVkcyB0byBhY2Nlc3Mgb2Zmc2V0cyAwLCA0LCBldGMu
IGFuZCBldmVuIGxlc3Mgb2Z0ZW4gYXMNCj4gaXQgZ29lcy4gSWYgeW91IG1ha2UgeW91ciB0YWJs
ZSAxSyBlbnRyaWVzIGluc3RlYWQsIHlvdSBzYXZlIHlvdXJzZWxmDQo+IDI0S2lCIGV2ZXJ5IHRp
bWUgdGhlIChpKWdhbW1hIGNoYW5nZXMuDQo+IA0KPiBUTDtEUjogeW91IGRvbid0IG5lZWQgMTox
IGxvb2t1cCwgeW91IG5lZWQgYSBsb3NzbGVzcyBjb252ZXJzaW9uIGZyb20NCj4gdGhlIExVVCB0
byB0aGUgSFcgZm9ybWF0Lg0KDQpIaSBNaWhhaWw6DQoNClRoYW5rIHlvdSBmb3IgcmFpc2luZyB0
aGlzIHRvcGljLg0KDQpJIGhhZCBjb25zaWRlciB0aGlzIGJlZm9yZSwgYnV0IEkgZHJvcHBlZCBp
dCBmaW5hbGx5LiBiZWNhdXNlIHRoZQ0KImNvbXBhdGliaWxpdHkiLg0KDQpPbmNlIHdlIGRyb3Ag
dGhlIDF2czEgbG9va3VwLCBidXQgdXNlIGEgMWsgdGFibGUgYWNjb3JkaW5nIHRoZSBvdXIgRDcx
DQp3aGljaCBtYWRlIHRoaXMgbHV0IGQ3MSBzcGVjaWZpYyBhbmQgbGVhZHM6DQotIGhhcmQgdG8g
Y29tcGF0YWJsZSB3aXRoIHRoaXJkIHBhcnQgdXNlci4NCi0gaGFyZCB0byBjb21wYXRhYmxlIHdp
dGggdGhlIGZ1dHVyZSBIVy4NCg0KQW5kIGFsbCB0aGVzZSBjb2xvcl9tZ210IHByb3BlcnRpZXMg
YXJlIERSTSBzdGFuZGFyZCwgd2UgYWxzbyBuZWVkIHRvDQpmb2xsb3cgRFJNJ3Mgd2F5IGJ1dCBu
b3QgbWFrZSBpdCBvdXIgSFcgb25seS4NCg0KSSBkb24ndCBzZWUgRFJNIGRpcmVjdGx5IHNheSB0
aGlzIHRhYmxlIHNob3VsZCBiZSBhIDEgdnMgMSBsb29rdXAsIGJ1dA0Kd2UgY2FuIGdvdCBzb21l
IGhpbnQgZnJvbSB0aGUgZG9jIG9mIGRybV9jcnRjIHByb3BlcnR5ICJERUdBTU1BX0xVVOKAnTog
DQoNCiJIYXJkd2FyZSBtaWdodCBjaG9vc2Ugbm90IHRvIHVzZSB0aGUgZnVsbCBwcmVjaXNpb24g
b2YgdGhlIExVVCBlbGVtZW50cw0Kbm9yIHVzZSBhbGwgdGhlIGVsZW1lbnRzIG9mIHRoZSBMVVQg
KGZvciBleGFtcGxlIHRoZSBoYXJkd2FyZSBtaWdodA0KY2hvb3NlIHRvIGludGVycG9sYXRlIGJl
dHdlZW4gTFVUWzBdIGFuZCBMVVRbNF0pIg0KDQp0aGFua3MNCmphbWVzLg0KDQo+ID4gPiA+ICsj
ZGVmaW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkNCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RydWN0
IGtvbWVkYV9jb2xvcl9tYW5hZ2VyIHsNCj4gPiA+ID4gKwlzdHJ1Y3Qga29tZWRhX2NvZWZmc19t
YW5hZ2VyICppZ2FtbWFfbWdyOw0KPiA+ID4gPiArCXN0cnVjdCBrb21lZGFfY29lZmZzX21hbmFn
ZXIgKmZnYW1tYV9tZ3I7DQo+ID4gPiA+ICsJYm9vbCBoYXNfY3RtOw0KPiA+ID4gPiArfTsNCj4g
PiA+ID4gKw0KPiA+ID4gPiArc3RydWN0IGtvbWVkYV9jb2xvcl9zdGF0ZSB7DQo+ID4gPiA+ICsJ
c3RydWN0IGtvbWVkYV9jb2VmZnNfdGFibGUgKmlnYW1tYTsNCj4gPiA+ID4gKwlzdHJ1Y3Qga29t
ZWRhX2NvZWZmc190YWJsZSAqZmdhbW1hOw0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArdm9pZCBrb21lZGFfY29sb3JfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBrb21lZGFfY29sb3Jf
c3RhdGUgKm5ldywNCj4gPiA+ID4gKwkJCQkgIHN0cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKm9s
ZCk7DQo+ID4gPiA+ICt2b2lkIGtvbWVkYV9jb2xvcl9jbGVhbnVwX3N0YXRlKHN0cnVjdCBrb21l
ZGFfY29sb3Jfc3RhdGUgKmNvbG9yX3N0KTsNCj4gPiA+ID4gK2ludCBrb21lZGFfY29sb3JfdmFs
aWRhdGUoc3RydWN0IGtvbWVkYV9jb2xvcl9tYW5hZ2VyICptZ3IsDQo+ID4gPiA+ICsJCQkgIHN0
cnVjdCBrb21lZGFfY29sb3Jfc3RhdGUgKnN0LA0KPiA+ID4gPiArCQkJICBzdHJ1Y3QgZHJtX3By
b3BlcnR5X2Jsb2IgKmlnYW1tYV9ibG9iLA0KPiA+ID4gPiArCQkJICBzdHJ1Y3QgZHJtX3Byb3Bl
cnR5X2Jsb2IgKmZnYW1tYV9ibG9iKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArdm9pZCBkcm1fbHV0
X3RvX2lnYW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMy
ICpjb2VmZnMpOw0KPiA+ID4gPiArdm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2VmZnMoc3RydWN0
IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpOw0KPiA+ID4gPiArdm9p
ZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmN0bV9ibG9iLCB1
MzIgKmNvZWZmcyk7DQo+ID4gPiA+ICANCj4gPiA+ID4gIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVj
dF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7DQo+
ID4gPiA+ICANCj4gPiA+ID4gLSNlbmRpZg0KPiA+ID4gPiArI2VuZGlmIC8qX0tPTUVEQV9DT0xP
Ul9NR01UX0hfKi8NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEJSLA0KPiA+ID4gTWloYWlsDQo+
ID4gPiANCj4gPiA+IA0KPiA+IA0KPiANCj4gQlIsDQo+IE1paGFpbA0KPiANCj4gDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
