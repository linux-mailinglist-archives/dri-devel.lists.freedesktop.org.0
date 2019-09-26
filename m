Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22754BEADC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 05:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA796EC34;
	Thu, 26 Sep 2019 03:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B281B6EC34
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 03:25:54 +0000 (UTC)
Received: from VE1PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:803:104::39)
 by DB8PR08MB3996.eurprd08.prod.outlook.com (2603:10a6:10:a5::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.23; Thu, 26 Sep
 2019 03:25:49 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VE1PR08CA0026.outlook.office365.com
 (2603:10a6:803:104::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.21 via Frontend
 Transport; Thu, 26 Sep 2019 03:25:49 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 03:25:47 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Thu, 26 Sep 2019 03:25:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2ebba0cd6bf2ba4
X-CR-MTA-TID: 64aa7808
Received: from d5194bfeddec.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E465989-A415-4CA7-9477-ED411E4F59EA.1; 
 Thu, 26 Sep 2019 03:25:37 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5194bfeddec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 26 Sep 2019 03:25:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZG0McL/8ri2zDtuGYtqRCQq+aumBXjYlzVjMOy11owndEOlO+RxKqLHe4yKyDMe5RXQ0qMHy66QI6qXCWgNSMkP5RmAv7SaQMF5N/OXGN2jJ9DVoqgDIAp/N/QKB/GLZCtW7GXEMjmehO7rXBIteKWTpFEVbXaC4Ff4G5/RKs3E+zlL3B1W8OSgXCb6owStzuWdzelvVmgV/1CNexfID3AsUNpvqYPOdiC0k6Kw2qgjGcpFA7g07VaBfBLUif/YYi2r2AquyMcMVlzZoSabEXov1yTSFruDq6VAzNp0xGP0FIgXAu9VzVSX7ToctrjysmSz2/iYwLdBY3xzi0EEZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBIyBl2iC81d78tumwoJcMGRL/PdA5m1O7V2YMcHl8Y=;
 b=EF1roMgwEUoy/LkwqoTdpV4ldOk5Nr6jWMPUAtgBT4V4izG3edbr1Lc9/lOvysauleuXY3Qkl3gPBJstj5wQ6KWzQEWUS0+bo4HZijP5E4zVvI3+MsgHd1RNmq0sNPFU1wktIu3RBwKccEGzdbrPxcvPsJEKvcKpADNagajzfunrIedaxz6oi4k2CHa4aJjpzoquwW0X7DBUdgu/BGvoBXH1UN6QZSifXBczpwz4nmjxQ/qLHMntOPphtuN8kdyQZ9edznAbJaAJaVD/PXeanlyYP+hokHSGODzaB7Sn/j9ZnHcOkO/Ww4rL/quWtdLD20RgLa6pwFnu8vnpSWaTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4751.eurprd08.prod.outlook.com (10.255.113.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 26 Sep 2019 03:25:33 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 03:25:33 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: drm/komeda: Adds power management support
Thread-Topic: drm/komeda: Adds power management support
Thread-Index: AQHVdBoOCBLmYaWBFUSgxZGVp2Iz+A==
Date: Thu, 26 Sep 2019 03:25:33 +0000
Message-ID: <20190926032526.GA5374@jamwan02-TSP300>
References: <20190923015908.26627-1-lowry.li@arm.com>
In-Reply-To: <20190923015908.26627-1-lowry.li@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:2e::19) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 01a741af-f639-4267-0e96-08d74231394a
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4751; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4751:|VE1PR08MB4751:|DB8PR08MB3996:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB39966DFA24F1AAC28A068AF0B3860@DB8PR08MB3996.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:3968;
x-forefront-prvs: 0172F0EF77
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(6246003)(1076003)(102836004)(86362001)(256004)(99286004)(14444005)(5660300002)(33656002)(52116002)(6116002)(3846002)(76176011)(486006)(966005)(446003)(478600001)(11346002)(33716001)(476003)(2906002)(6506007)(386003)(14454004)(9686003)(6512007)(6306002)(186003)(66446008)(25786009)(66476007)(6636002)(64756008)(6862004)(54906003)(8676002)(58126008)(55236004)(66556008)(305945005)(7736002)(6486002)(66946007)(66066001)(71190400001)(229853002)(6436002)(71200400001)(4326008)(26005)(81166006)(81156014)(316002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4751;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Cn1StOZiEwr69Ml/S6hKeQXh1xnqNi2hiO9s9ItHg82FpPd8FgKCq7/gQGA6I4p8OtKLIHzO1Qwk+Mi1qhnA+DDAa3g4u6uQKJ9y83kJYQ49AptyDjEAE+bKzZPmbBuNobJq23Nvsj1azK/uVvdjPL40hmg+fMZZGQ3RPFfb9xCc+10Pl6Z7suQLmaS7Sl/u9qTbdt9dPJPiiP01W1H/RiV+v3KcBGIfkdf/cbeiSvY6+Kbt1Qe681goAHcWdSwWLT2NIG3ur69vNoYcaFuq6bk0kVmH7e2l6sgRa5uhbL0vCv9mXKq8rnIaYB+cbLo+0D3TVh6OqHY47NtIVTiTFOqVbnDtWtldzt8vagztBO8u7kMBzaSB3buWYKxEy1sVlPaX6OhKf7bKeFe/5+wk4EFqtHfU8zVK/GTX9wvuWXRW0RrxFvKFQ7ZM3N/mB1iq6N47AJ5y6RjK6YbHUnJkvQ==
Content-ID: <749D52C9C4E423429C4D8095F1855F04@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4751
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(446003)(26826003)(478600001)(63350400001)(99286004)(70206006)(6246003)(2906002)(46406003)(305945005)(6862004)(70586007)(9686003)(4326008)(3846002)(66066001)(76176011)(47776003)(23726003)(6116002)(86362001)(36906005)(6486002)(8936002)(81166006)(8746002)(81156014)(8676002)(76130400001)(14444005)(316002)(386003)(58126008)(50466002)(336012)(25786009)(33656002)(6306002)(22756006)(6512007)(229853002)(356004)(14454004)(102836004)(486006)(126002)(5660300002)(476003)(11346002)(97756001)(6506007)(54906003)(966005)(33716001)(26005)(6636002)(1076003)(186003)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB3996;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9a01d841-3a41-436a-bc86-08d7423130a6
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR08MB3996; 
NoDisclaimer: True
X-Forefront-PRVS: 0172F0EF77
X-Microsoft-Antispam-Message-Info: aOxIdBWuTaVlJhTZIwB+Qds2zWgfvuIH2LRmNY3jW9MdbZYe8vtFSpxvWbx+EQcy8c0A1fMslS2b1gSHj590IlSETamPodpP6MZ/dxBmgPat68EjX7ySyjcgJGJQ7iHbbdV9IdyTDet7uPg8/8mjw32GxpSzcqf/Ko8Tm+T4F4NiRbrNXQeZ6D5qnvw55Oc+n8ZV75bFnNDTbIOeNir7Y0aD9mCcc2Yr3We0OVpb/0wAnc6iamu/tNInWa4s9gGwtL7v/4k0jh989aIvXJmB6OPC4MLhB8E06cDe7zm7U95ehhh5VPZXYEwt6eh0K6U6v+tgD4OA2kFGZES2+NYC9wybp+VGoemyF+GuoNSpymQ4RoUpN10lOZD5adguMqPYJ5YwAnC7jZ+Zrlyw93lvcKkTPcjAr7AohWb0UuL/RuColw4LKno5Ywe3YIZ8y4NgVVgMsOewlkrd13Qm3GwLow==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 03:25:47.7439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a741af-f639-4267-0e96-08d74231394a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3996
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBIyBl2iC81d78tumwoJcMGRL/PdA5m1O7V2YMcHl8Y=;
 b=7Id+vXf66QBQVk9d1HEc7aetsm5ocfF+XFoRbdWlEMWSfyiU1YLxCeQyKYmzjE2leOXvBam6ODifWbYl+U19cNj0agyocx813LaRIpEwMAYvmKxs/c85vaEoY5YXCaKVJHxqKr3w/EBv1NBSANZXgY5tTb5B2I7Srpc+hBCd+dU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBIyBl2iC81d78tumwoJcMGRL/PdA5m1O7V2YMcHl8Y=;
 b=7Id+vXf66QBQVk9d1HEc7aetsm5ocfF+XFoRbdWlEMWSfyiU1YLxCeQyKYmzjE2leOXvBam6ODifWbYl+U19cNj0agyocx813LaRIpEwMAYvmKxs/c85vaEoY5YXCaKVJHxqKr3w/EBv1NBSANZXgY5tTb5B2I7Srpc+hBCd+dU=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDE6NTk6MjVBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gQWRkcyBzeXN0ZW0gcG93ZXIgbWFuYWdl
bWVudCBzdXBwb3J0IGluIEtNUyBrZXJuZWwgZHJpdmVyLgo+IAo+IERlcGVuZHMgb246Cj4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MjM3Ny8KPiAKPiBDaGFuZ2Vz
IHNpbmNlIHYxOgo+IFNpbmNlIHdlIGhhdmUgdW5pZmllZCBtY2xrL3BjbGsvcGlwZWxpbmUtPmFj
bGsgdG8gb25lIG1jbGssIHdoaWNoIHdpbGwKPiBiZSB0dXJuZWQgb24vb2ZmIHdoZW4gY3J0YyBh
dG9taWMgZW5hYmxlL2Rpc2FibGUsIHJlbW92ZWQgcnVudGltZSBwb3dlcgo+IG1hbmFnZW1lbnQu
Cj4gUmVtb3ZlcyBydW4gdGltZSBnZXQvcHV0IHJlbGF0ZWQgZmxvdy4KPiBBZGRzIHRvIGRpc2Fi
bGUgdGhlIGFjbGsgd2hlbiByZWdpc3RlciBhY2Nlc3MgZmluaXNoZWQuCj4gCj4gQ2hhbmdlcyBz
aW5jZSB2MjoKPiBSZWJhc2VzIHRvIHRoZSBkcm0tbWlzYy1uZXh0IGJyYW5jaC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0u
Y29tPgoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cgp3aWxsIHB1c2gg
aXQgdG8gZHJtLW1pc2MtbmV4dC4KCj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfY3J0Yy5jICB8ICAxIC0KPiAgLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9kZXYuYyAgIHwgNjUgKysrKysrKysrKysrKysrKystLQo+ICAuLi4vZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAgMyArCj4gIC4uLi9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgICB8IDMwICsrKysrKysrLQo+ICA0IGZp
bGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IGluZGV4
IDM4ZDVjYjIwZTkwOC4uYjQ3YzBkYWJkMGQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBAIC01LDcgKzUsNiBAQAo+ICAg
Kgo+ICAgKi8KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+IC0jaW5jbHVkZSA8bGludXgvcG1f
cnVudGltZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KPiAgCj4gICNpbmNsdWRl
IDxkcm0vZHJtX2F0b21pYy5oPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2Rldi5jCj4gaW5kZXggYmVlNDYzM2NkZDlmLi44YTAzMzI0ZjAyYTUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYu
Ywo+IEBAIC0yNTgsNyArMjU4LDcgQEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVkYV9kZXZfY3Jl
YXRlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCQkJICBwcm9kdWN0LT5wcm9kdWN0X2lkLAo+ICAJ
CQkgIE1BTElEUF9DT1JFX0lEX1BST0RVQ1RfSUQobWRldi0+Y2hpcC5jb3JlX2lkKSk7Cj4gIAkJ
ZXJyID0gLUVOT0RFVjsKPiAtCQlnb3RvIGVycl9jbGVhbnVwOwo+ICsJCWdvdG8gZGlzYWJsZV9j
bGs7Cj4gIAl9Cj4gIAo+ICAJRFJNX0lORk8oIkZvdW5kIEFSTSBNYWxpLUQleCB2ZXJzaW9uIHIl
ZHAlZFxuIiwKPiBAQCAtMjcxLDE5ICsyNzEsMTkgQEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVk
YV9kZXZfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCWVyciA9IG1kZXYtPmZ1bmNzLT5l
bnVtX3Jlc291cmNlcyhtZGV2KTsKPiAgCWlmIChlcnIpIHsKPiAgCQlEUk1fRVJST1IoImVudW1l
cmF0ZSBkaXNwbGF5IHJlc291cmNlIGZhaWxlZC5cbiIpOwo+IC0JCWdvdG8gZXJyX2NsZWFudXA7
Cj4gKwkJZ290byBkaXNhYmxlX2NsazsKPiAgCX0KPiAgCj4gIAllcnIgPSBrb21lZGFfcGFyc2Vf
ZHQoZGV2LCBtZGV2KTsKPiAgCWlmIChlcnIpIHsKPiAgCQlEUk1fRVJST1IoInBhcnNlIGRldmlj
ZSB0cmVlIGZhaWxlZC5cbiIpOwo+IC0JCWdvdG8gZXJyX2NsZWFudXA7Cj4gKwkJZ290byBkaXNh
YmxlX2NsazsKPiAgCX0KPiAgCj4gIAllcnIgPSBrb21lZGFfYXNzZW1ibGVfcGlwZWxpbmVzKG1k
ZXYpOwo+ICAJaWYgKGVycikgewo+ICAJCURSTV9FUlJPUigiYXNzZW1ibGUgZGlzcGxheSBwaXBl
bGluZXMgZmFpbGVkLlxuIik7Cj4gLQkJZ290byBlcnJfY2xlYW51cDsKPiArCQlnb3RvIGRpc2Fi
bGVfY2xrOwo+ICAJfQo+ICAKPiAgCWRldi0+ZG1hX3Bhcm1zID0gJm1kZXYtPmRtYV9wYXJtczsK
PiBAQCAtMjk2LDExICsyOTYsMTQgQEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVkYV9kZXZfY3Jl
YXRlKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCWlmIChtZGV2LT5pb21tdSAmJiBtZGV2LT5mdW5j
cy0+Y29ubmVjdF9pb21tdSkgewo+ICAJCWVyciA9IG1kZXYtPmZ1bmNzLT5jb25uZWN0X2lvbW11
KG1kZXYpOwo+ICAJCWlmIChlcnIpIHsKPiArCQkJRFJNX0VSUk9SKCJjb25uZWN0IGlvbW11IGZh
aWxlZC5cbiIpOwo+ICAJCQltZGV2LT5pb21tdSA9IE5VTEw7Cj4gLQkJCWdvdG8gZXJyX2NsZWFu
dXA7Cj4gKwkJCWdvdG8gZGlzYWJsZV9jbGs7Cj4gIAkJfQo+ICAJfQo+ICAKPiArCWNsa19kaXNh
YmxlX3VucHJlcGFyZShtZGV2LT5hY2xrKTsKPiArCj4gIAllcnIgPSBzeXNmc19jcmVhdGVfZ3Jv
dXAoJmRldi0+a29iaiwgJmtvbWVkYV9zeXNmc19hdHRyX2dyb3VwKTsKPiAgCWlmIChlcnIpIHsK
PiAgCQlEUk1fRVJST1IoImNyZWF0ZSBzeXNmcyBncm91cCBmYWlsZWQuXG4iKTsKPiBAQCAtMzEz
LDYgKzMxNiw4IEBAIHN0cnVjdCBrb21lZGFfZGV2ICprb21lZGFfZGV2X2NyZWF0ZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gIAo+ICAJcmV0dXJuIG1kZXY7Cj4gIAo+ICtkaXNhYmxlX2NsazoKPiAr
CWNsa19kaXNhYmxlX3VucHJlcGFyZShtZGV2LT5hY2xrKTsKPiAgZXJyX2NsZWFudXA6Cj4gIAlr
b21lZGFfZGV2X2Rlc3Ryb3kobWRldik7Cj4gIAlyZXR1cm4gRVJSX1BUUihlcnIpOwo+IEBAIC0z
MzAsOCArMzM1LDEyIEBAIHZvaWQga29tZWRhX2Rldl9kZXN0cm95KHN0cnVjdCBrb21lZGFfZGV2
ICptZGV2KQo+ICAJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKG1kZXYtPmRlYnVnZnNfcm9vdCk7
Cj4gICNlbmRpZgo+ICAKPiArCWlmIChtZGV2LT5hY2xrKQo+ICsJCWNsa19wcmVwYXJlX2VuYWJs
ZShtZGV2LT5hY2xrKTsKPiArCj4gIAlpZiAobWRldi0+aW9tbXUgJiYgbWRldi0+ZnVuY3MtPmRp
c2Nvbm5lY3RfaW9tbXUpCj4gLQkJbWRldi0+ZnVuY3MtPmRpc2Nvbm5lY3RfaW9tbXUobWRldik7
Cj4gKwkJaWYgKG1kZXYtPmZ1bmNzLT5kaXNjb25uZWN0X2lvbW11KG1kZXYpKQo+ICsJCQlEUk1f
RVJST1IoImRpc2Nvbm5lY3QgaW9tbXUgZmFpbGVkLlxuIik7Cj4gIAltZGV2LT5pb21tdSA9IE5V
TEw7Cj4gIAo+ICAJZm9yIChpID0gMDsgaSA8IG1kZXYtPm5fcGlwZWxpbmVzOyBpKyspIHsKPiBA
QCAtMzU5LDMgKzM2OCw0NyBAQCB2b2lkIGtvbWVkYV9kZXZfZGVzdHJveShzdHJ1Y3Qga29tZWRh
X2RldiAqbWRldikKPiAgCj4gIAlkZXZtX2tmcmVlKGRldiwgbWRldik7Cj4gIH0KPiArCj4gK2lu
dCBrb21lZGFfZGV2X3Jlc3VtZShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiArewo+ICsJaW50
IHJldCA9IDA7Cj4gKwo+ICsJY2xrX3ByZXBhcmVfZW5hYmxlKG1kZXYtPmFjbGspOwo+ICsKPiAr
CWlmIChtZGV2LT5pb21tdSAmJiBtZGV2LT5mdW5jcy0+Y29ubmVjdF9pb21tdSkgewo+ICsJCXJl
dCA9IG1kZXYtPmZ1bmNzLT5jb25uZWN0X2lvbW11KG1kZXYpOwo+ICsJCWlmIChyZXQgPCAwKSB7
Cj4gKwkJCURSTV9FUlJPUigiY29ubmVjdCBpb21tdSBmYWlsZWQuXG4iKTsKPiArCQkJZ290byBk
aXNhYmxlX2NsazsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJcmV0ID0gbWRldi0+ZnVuY3MtPmVuYWJs
ZV9pcnEobWRldik7Cj4gKwo+ICtkaXNhYmxlX2NsazoKPiArCWNsa19kaXNhYmxlX3VucHJlcGFy
ZShtZGV2LT5hY2xrKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtpbnQga29tZWRh
X2Rldl9zdXNwZW5kKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICt7Cj4gKwlpbnQgcmV0ID0g
MDsKPiArCj4gKwljbGtfcHJlcGFyZV9lbmFibGUobWRldi0+YWNsayk7Cj4gKwo+ICsJaWYgKG1k
ZXYtPmlvbW11ICYmIG1kZXYtPmZ1bmNzLT5kaXNjb25uZWN0X2lvbW11KSB7Cj4gKwkJcmV0ID0g
bWRldi0+ZnVuY3MtPmRpc2Nvbm5lY3RfaW9tbXUobWRldik7Cj4gKwkJaWYgKHJldCA8IDApIHsK
PiArCQkJRFJNX0VSUk9SKCJkaXNjb25uZWN0IGlvbW11IGZhaWxlZC5cbiIpOwo+ICsJCQlnb3Rv
IGRpc2FibGVfY2xrOwo+ICsJCX0KPiArCX0KPiArCj4gKwlyZXQgPSBtZGV2LT5mdW5jcy0+ZGlz
YWJsZV9pcnEobWRldik7Cj4gKwo+ICtkaXNhYmxlX2NsazoKPiArCWNsa19kaXNhYmxlX3VucHJl
cGFyZShtZGV2LT5hY2xrKTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBpbmRleCA4YWNmOGMw
NjAxY2MuLjQxNDIwMDIzM2I2NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5oCj4gQEAgLTIyNCw0ICsyMjQsNyBAQCB2b2lkIGtvbWVk
YV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpOwo+ICBzdGF0aWMgaW5s
aW5lIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cykg
e30KPiAgI2VuZGlmCj4gIAo+ICtpbnQga29tZWRhX2Rldl9yZXN1bWUoc3RydWN0IGtvbWVkYV9k
ZXYgKm1kZXYpOwo+ICtpbnQga29tZWRhX2Rldl9zdXNwZW5kKHN0cnVjdCBrb21lZGFfZGV2ICpt
ZGV2KTsKPiArCj4gICNlbmRpZiAvKl9LT01FREFfREVWX0hfKi8KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwo+IGluZGV4IDY5YWNlNmY5MDU1
ZC4uZDZjMjIyMmM1ZDMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiBAQCAtOCw2ICs4LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9jb21wb25lbnQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4K
PiAgI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4KPiAgI2luY2x1ZGUgImtvbWVkYV9kZXYuaCIKPiAg
I2luY2x1ZGUgImtvbWVkYV9rbXMuaCIKPiBAQCAtMTM2LDEzICsxMzcsNDAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQga29tZWRhX29mX21hdGNoW10gPSB7Cj4gIAo+ICBNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBrb21lZGFfb2ZfbWF0Y2gpOwo+ICAKPiArc3RhdGljIGludCBf
X21heWJlX3VudXNlZCBrb21lZGFfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3sK
PiArCXN0cnVjdCBrb21lZGFfZHJ2ICptZHJ2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwlz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gJm1kcnYtPmttcy0+YmFzZTsKPiArCWludCByZXM7Cj4g
Kwo+ICsJcmVzID0gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9zdXNwZW5kKGRybSk7Cj4gKwo+ICsJ
a29tZWRhX2Rldl9zdXNwZW5kKG1kcnYtPm1kZXYpOwo+ICsKPiArCXJldHVybiByZXM7Cj4gK30K
PiArCj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQga29tZWRhX3BtX3Jlc3VtZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gK3sKPiArCXN0cnVjdCBrb21lZGFfZHJ2ICptZHJ2ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7Cj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gJm1kcnYtPmttcy0+YmFz
ZTsKPiArCj4gKwlrb21lZGFfZGV2X3Jlc3VtZShtZHJ2LT5tZGV2KTsKPiArCj4gKwlyZXR1cm4g
ZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1bWUoZHJtKTsKPiArfQo+ICsKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBkZXZfcG1fb3BzIGtvbWVkYV9wbV9vcHMgPSB7Cj4gKwlTRVRfU1lTVEVNX1NM
RUVQX1BNX09QUyhrb21lZGFfcG1fc3VzcGVuZCwga29tZWRhX3BtX3Jlc3VtZSkKPiArfTsKPiAr
Cj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGtvbWVkYV9wbGF0Zm9ybV9kcml2ZXIg
PSB7Cj4gIAkucHJvYmUJPSBrb21lZGFfcGxhdGZvcm1fcHJvYmUsCj4gIAkucmVtb3ZlCT0ga29t
ZWRhX3BsYXRmb3JtX3JlbW92ZSwKPiAgCS5kcml2ZXIJPSB7Cj4gIAkJLm5hbWUgPSAia29tZWRh
IiwKPiAgCQkub2ZfbWF0Y2hfdGFibGUJPSBrb21lZGFfb2ZfbWF0Y2gsCj4gLQkJLnBtID0gTlVM
TCwKPiArCQkucG0gPSAma29tZWRhX3BtX29wcywKPiAgCX0sCj4gIH07Cj4gIApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
