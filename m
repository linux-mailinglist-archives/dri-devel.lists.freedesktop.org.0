Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993EEC37E5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 16:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809906E817;
	Tue,  1 Oct 2019 14:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10074.outbound.protection.outlook.com [40.107.1.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FAA6E817
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 14:43:12 +0000 (UTC)
Received: from DB6PR0801CA0065.eurprd08.prod.outlook.com (2603:10a6:4:2b::33)
 by HE1PR08MB2668.eurprd08.prod.outlook.com (2603:10a6:7:2b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Tue, 1 Oct
 2019 14:43:05 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by DB6PR0801CA0065.outlook.office365.com
 (2603:10a6:4:2b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via Frontend
 Transport; Tue, 1 Oct 2019 14:43:05 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 14:43:04 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 01 Oct 2019 14:43:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12af0cd3a3f3367f
X-CR-MTA-TID: 64aa7808
Received: from c0def8049de3.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF413FD5-2CEB-4F7D-B433-C7AFE724F04F.1; 
 Tue, 01 Oct 2019 14:42:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c0def8049de3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 01 Oct 2019 14:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwr7VXLTYR77/yInjW6TGBKULo/zLvH32zjPGmMrUFWqgv9wIIhiuI8fF1sbbrCO5WKBMf2wAlv4eepbYBqvHiYLgWgRpLb4mAhCxhlunUYx7Iw1yvghJvRWGhDglgQTde3MjVz5kHylsCdSVJIkGQiOVmUShv+rKr0DRHkoaLT4UDFnPdZ+m/YuN7zFTgfv4y64lsxm7PRvYyobVK1T+e9xBmBlt0miDJWKfYuiJGGA2yF3ixWSxkVDMQj038C4J3X7OW3cURS+dDXI1dNZmW7ZufxlZDeibZCGe6LqWYD1p4wAmFNK47plUgM4ANwLzZ3UfvmVsraIkmHUjGlWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cR4Vi6LsRyE9uZtNJbvHn1DcYiHfE3r1Jo7fvSP7c0=;
 b=k9p9PGjP+bckGPzQYMbh1m06HNJxCR6GFpdzdsHNaWpYgVcdSTyoXr/59PhPRRfJ+wYeShT1rq6dFaivWgLGBMXERbE6iQfhOGcI7WI/4P7pexxivgk//6zidKiAfMJ9KVzCv4GHB/VM5mtQh/6znEivZP0p1W0FcYE8v3k2I0xwAV4d8q8ZNnF7KB/kNCdzL1tMrBJ+mdznN1mpjQ7CKWnKfGLXfQAqkePt1yQl8neeANlh6PM219cuFXLsuMwOsaX5uLTKCcXiT/9OuoPOQW4NwjRxuP3E0ZqxqtCxMtckxLQbY/TlIyZpHvBuUz2PGRz5oHH2Y7qYKUSMXI5AHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5477.eurprd08.prod.outlook.com (10.141.174.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 14:42:57 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 14:42:57 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 RESEND] drm/komeda: Workaround for broken FLIP_COMPLETE
 timestamps
Thread-Topic: [PATCH v2 RESEND] drm/komeda: Workaround for broken
 FLIP_COMPLETE timestamps
Thread-Index: AQHVeGOXiPfFKQODqkGeQ/wFbMnv8adF3D8A
Date: Tue, 1 Oct 2019 14:42:56 +0000
Message-ID: <20191001144256.GA15279@arm.com>
References: <20190923101017.35114-1-mihail.atanassov@arm.com>
 <20191001142121.13939-1-mihail.atanassov@arm.com>
In-Reply-To: <20191001142121.13939-1-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0368.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::20) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3ce2cb45-9b2b-45ca-c0ef-08d7467daa7b
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM7PR08MB5477:|AM7PR08MB5477:|HE1PR08MB2668:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR08MB2668B88C776570A9A4334EFBE49D0@HE1PR08MB2668.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0177904E6B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(189003)(199004)(446003)(6636002)(386003)(6506007)(1076003)(71190400001)(71200400001)(81166006)(476003)(8676002)(6116002)(2616005)(3846002)(81156014)(66066001)(52116002)(486006)(33656002)(6862004)(11346002)(6246003)(102836004)(76176011)(26005)(25786009)(186003)(5660300002)(36756003)(66946007)(66476007)(64756008)(66446008)(316002)(66556008)(229853002)(6306002)(99286004)(6512007)(6486002)(2906002)(7736002)(4326008)(478600001)(966005)(8936002)(44832011)(14444005)(256004)(37006003)(54906003)(6436002)(86362001)(14454004)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5477;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: S7kXTijQUDozMwc1zOfAKNkMbd/qoGEGZedJD6VNIaQzAIuHEWsYIkGLTL3ecNqYESpEMm/PywKmblE6UfNmJvUYMi7gr5lQjlhGaG74BePDMlgSIcbKBknzhf5M1kH94dv3fbsMhQDu3IWBelvY8aGtFOLIf+7Rl3o077t2O/KSI1jWxOpuJE1qwD4TGB8qfFqEnkIiksSIY3MICO06Z+koueHki45rhHaMqribafTXfxRk7uJdDfVRy0CUxk5iqdey6uMam6aWlfz7jr/mHVFSFfRi6IRqBrDLeLFpGk8FeRMzv41K7M2ohqBAYUAGNcp4svMtVUwwMi5XcQkLNCjyQJXAhqNpkYAWCxKZygnmjwHvOZ29BAf+VHP5YPb7eBOST3LRlZhRubY/+IbXfNtCF2ZXuAofNyQzYfMEmR9e3JLJzO2vDjYqfahm+HBU4+FVvQtbHt1JdiITzrCkQw==
Content-ID: <18C607FB9F328543B2C02E76E696AEA5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5477
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(199004)(189003)(126002)(99286004)(66066001)(386003)(6306002)(305945005)(63350400001)(22756006)(5660300002)(6246003)(186003)(446003)(7736002)(76176011)(46406003)(6506007)(316002)(2906002)(486006)(97756001)(86362001)(1076003)(2616005)(26826003)(14454004)(966005)(476003)(478600001)(6512007)(11346002)(25786009)(8746002)(70206006)(8936002)(33656002)(81156014)(8676002)(37006003)(229853002)(70586007)(102836004)(6862004)(23726003)(336012)(14444005)(4326008)(356004)(50466002)(6486002)(6636002)(54906003)(26005)(76130400001)(3846002)(6116002)(47776003)(81166006)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR08MB2668;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: b870f7f4-ab5f-497c-65f8-08d7467da608
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:HE1PR08MB2668; 
NoDisclaimer: True
X-Forefront-PRVS: 0177904E6B
X-Microsoft-Antispam-Message-Info: HOZwTaMfxLN64BYBCtW8bhIvSNAuJLpKnWv7QLH88xY1L/kanaoarVzUeK9ftYKgaNB6mO5YM9+553l7R2usYkk4fMRZftpHe3Lzx7+dzub6MW+xZiIqQpn4VJ+3ulXHwd9kSRG8mXYCkW0wIAJl6n9VfMgttTGC8ChAAJCLJzjGWIa2NghmM1W9XGs5eo4lAjumtOznw148HxEL4tZUwVVZWvMDJqm6XY7TIdCRcnaJDxcgDPwH6tCnAWEZjd/jUAflPdl52N1itLoQgexiDUVNnC6ra/kYZpw8YLtdXjQW+qwyENxOupmCRGUaIqSdPR9HB2FNo4FJrhAVTBI7dGMmdmqO9Zm0pjqGT5hR0UDjzsc3LjBHFO9UUoYJ6gVYc5NH1uEzbkfbVd24LPw/KWMltWQ2ehDOn1i4n1KS08Z4v9xgKcU9SovmWcpiIhI0g5Bg+g/6ye+7Hq4f89HSMA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 14:43:04.0737 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce2cb45-9b2b-45ca-c0ef-08d7467daa7b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2668
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cR4Vi6LsRyE9uZtNJbvHn1DcYiHfE3r1Jo7fvSP7c0=;
 b=cAh2R1URYWzlcNm+thMFnJXnsSrE5L+tXFgoVXDGfmjSphHo/+tl5B6/CPpdEFDMmaTcDBuisxBVThwpcqunLs6gOhHKO7qau5Izzv7Nab+7vQrmf/BOv+jsvquV+FKmOTl9c+rhFsr86pOfRh5pewkJk4gNGICpTdPo/8DB2L0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cR4Vi6LsRyE9uZtNJbvHn1DcYiHfE3r1Jo7fvSP7c0=;
 b=cAh2R1URYWzlcNm+thMFnJXnsSrE5L+tXFgoVXDGfmjSphHo/+tl5B6/CPpdEFDMmaTcDBuisxBVThwpcqunLs6gOhHKO7qau5Izzv7Nab+7vQrmf/BOv+jsvquV+FKmOTl9c+rhFsr86pOfRh5pewkJk4gNGICpTdPo/8DB2L0=
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDI6MjE6NDBQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBXaGVuIGluaXRpYWxseSB0dXJuaW5nIGEgY3J0YyBvbiwgZHJtX3Jlc2V0X3Zi
bGFua190aW1lc3RhbXAgd2lsbAo+IHNldCB0aGUgdmJsYW5rIHRpbWVzdGFtcCB0byAwIGZvciBh
bnkgZHJpdmVyIHRoYXQgZG9lc24ndCBwcm92aWRlCj4gYSAtPmdldF92YmxhbmtfdGltZXN0YW1w
KCkgaG9vay4KPiAKPiBVbmZvcnR1bmF0ZWx5LCB0aGUgRkxJUF9DT01QTEVURSBldmVudCBkZXBl
bmRzIG9uIHRoYXQgdGltZXN0YW1wLAo+IGFuZCB0aGUgb25seSB3YXkgdG8gcmVnZW5lcmF0ZSBh
IHZhbGlkIG9uZSBpcyB0byBoYXZlIHZibGFuawo+IGludGVycnVwdHMgZW5hYmxlZCBhbmQgaGF2
ZSBhIHZhbGlkIGluLUlTUiBjYWxsIHRvCj4gZHJtX2NydGNfaGFuZGxlX3ZibGFuay4KPiAKPiBB
ZGRpdGlvbmFsbHksIGlmIHRoZSB1c2VyIGRvZXNuJ3QgcmVxdWVzdCB2YmxhbmtzIGJ1dCBfZG9l
c18gcmVxdWVzdAo+IEZMSVBfQ09NUExFVEUgZXZlbnRzLCB3ZSBzdGlsbCBkb24ndCBoYXZlIGEg
Z29vZCB0aW1lc3RhbXA6IGl0J2xsIGJlIHRoZQo+IHNhbWUgc3RhbXAgYXMgdGhlIGxhc3QgdmJs
YW5rIG9uZS4KPiAKPiBXb3JrIGFyb3VuZCB0aGUgaXNzdWUgYnkgYWx3YXlzIGVuYWJsaW5nIHZi
bGFua3Mgd2hlbiB0aGUgQ1JUQyBpcyBvbi4KPiBSZWR1Y2luZyB0aGUgYW1vdW50IG9mIHRpbWUg
dGhhdCBQTDAgaGFzIHRvIGJlIHVubWFza2VkIHdvdWxkIGJlIG5pY2UgdG8KPiBmaXggYXQgYSBs
YXRlciB0aW1lLgo+IAo+IENoYW5nZXMgc2luY2UgdjEgW2h0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC8zMzE3MjcvXToKPiAgLSBtb3ZlZCBkcm1fY3J0Y192YmxhbmtfcHV0
IGNhbGwgdG8gdGhlIC0+YXRvbWljX2Rpc2FibGUoKSBob29rCj4gCj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTGl2aXUgRHVkYXUgPExpdml1LkR1ZGF1QGFybS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBh
cm0uY29tPgo+IFJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENo
aW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CgpQdXNoZWQgdG8gZHJtLW1pc2MtbmV4dCBm
NTk3NjljNTJjZDdkMTU4ZGY1MzQ4N2VjMjkzNmY1NTkyMDczMzQwCgpUaGFua3MsCkF5YW4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIHwg
MiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IGluZGV4IDljYTVk
YmZkMDcyMy4uNzUyNjNkOGNkMGJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+IEBAIC0yNDksNiArMjQ5LDcgQEAga29tZWRh
X2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIHsKPiAgCWtvbWVk
YV9jcnRjX3ByZXBhcmUodG9fa2NydGMoY3J0YykpOwo+ICAJZHJtX2NydGNfdmJsYW5rX29uKGNy
dGMpOwo+ICsJV0FSTl9PTihkcm1fY3J0Y192YmxhbmtfZ2V0KGNydGMpKTsKPiAgCWtvbWVkYV9j
cnRjX2RvX2ZsdXNoKGNydGMsIG9sZCk7Cj4gIH0KPiAgCj4gQEAgLTM0MSw2ICszNDIsNyBAQCBr
b21lZGFfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gIAkJa29t
ZWRhX2NydGNfZmx1c2hfYW5kX3dhaXRfZm9yX2ZsaXBfZG9uZShrY3J0YywgZGlzYWJsZV9kb25l
KTsKPiAgCX0KPiAgCj4gKwlkcm1fY3J0Y192YmxhbmtfcHV0KGNydGMpOwo+ICAJZHJtX2NydGNf
dmJsYW5rX29mZihjcnRjKTsKPiAgCWtvbWVkYV9jcnRjX3VucHJlcGFyZShrY3J0Yyk7Cj4gIH0K
PiAtLSAKPiAyLjIzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
