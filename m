Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A39C259E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 19:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DFC6E4A2;
	Mon, 30 Sep 2019 17:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40087.outbound.protection.outlook.com [40.107.4.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0C66E4A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 17:02:58 +0000 (UTC)
Received: from HE1PR0802CA0002.eurprd08.prod.outlook.com (2603:10a6:3:bd::12)
 by AM6PR08MB4502.eurprd08.prod.outlook.com (2603:10a6:20b:b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Mon, 30 Sep
 2019 17:02:55 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by HE1PR0802CA0002.outlook.office365.com
 (2603:10a6:3:bd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Mon, 30 Sep 2019 17:02:55 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 17:02:53 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Mon, 30 Sep 2019 17:02:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 47d190c31b1c9e2e
X-CR-MTA-TID: 64aa7808
Received: from d457f0916bad.3 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8FB5D35-737C-4D27-968E-30AB784AEBC5.1; 
 Mon, 30 Sep 2019 17:02:40 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d457f0916bad.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 17:02:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLyxwi61c2i8SjsYk+OvtYMmZllvsjxQA+Cg9baNeF0FvbZFt+nLQ9wKLoILKdWDF0kN3BUftuGaIurk8oK2m+v2R7PsWzPZ4FxbjSq2RN5cUErqLA3e6GzF1rX6VmmFCny+ZNrIr+bdB5xCIfD0yb5rC3uAf5f+3aov2gr8OY3DDB0yqWiZQVxk51h5gU9t9H6XngJthDvfU33kzvU2LZ4Eo2JZkNtm2YBIoVwOPALASDTRZHSddrq5qWZWlnVvEYEiGFyDkxcUWcXftXNmNiW9SaJek8Bt1JrXxr1QI5ByZGp9wbavWezOM5kI6E1BMUGf4CgkAEWoCtFLkTra0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuC+jheJXuPf98xSZNlLTvWJAZi0JUylXdiHG+CA73g=;
 b=DOowrs20geOIiEd5PjGGIbAW2oOzemJP6k1NpA0KTSSSgzuCGerCli9HW9sf7HFkL/PAdITKcfsmO1yy7BUARhF0uO+SGm8QrXELzfW/8qR9n5g0pGtGDxkMv7BKhx/DWvrSbS5ySMpyTKUOSMlfYP4u8yZT3pAm7TL4+pafTCBAfR/ADwOsLt9cJsUomwOHUOf2MzqspPx59t9wx/v1wLbRvgoP9jVpSSycNYGp69sprpK5me/r3L8nMrzp+as8E3OO5/gOBLz0ZrSB8Ql8ch5xr+x6kEzcmS5dtLeTXrY23L1FCAlF94ktJPY8Aq7z0b+Z6ZgMiWZSrvjGkO26ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3912.eurprd08.prod.outlook.com (20.178.89.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 17:02:37 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.028; Mon, 30 Sep 2019
 17:02:37 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [PATCH v2] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH v2] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVd65ZjChaP0zoZUGEUL74H9varqdEcloA
Date: Mon, 30 Sep 2019 17:02:37 +0000
Message-ID: <20190930170236.fvlim4c4ziqbxkw7@DESKTOP-E1NTVVP.localdomain>
References: <20190930164425.20282-1-ayan.halder@arm.com>
In-Reply-To: <20190930164425.20282-1-ayan.halder@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.49]
x-clientproxiedby: LNXP265CA0050.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::14) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e9784c22-6e3d-4289-07c8-08d745c808bd
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3912:|AM6PR08MB3912:|AM6PR08MB4502:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4502A2E480683AA150DB288BF0820@AM6PR08MB4502.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(51914003)(229853002)(71190400001)(99286004)(9686003)(6512007)(6486002)(6636002)(86362001)(14444005)(8936002)(256004)(71200400001)(81166006)(81156014)(8676002)(386003)(26005)(186003)(446003)(11346002)(6246003)(66946007)(76176011)(1076003)(305945005)(7736002)(6116002)(4326008)(102836004)(6506007)(66476007)(3846002)(52116002)(5660300002)(66066001)(2906002)(66446008)(316002)(478600001)(54906003)(64756008)(58126008)(66556008)(6862004)(25786009)(14454004)(486006)(476003)(44832011)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3912;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HoZiDNYM+Cf6mqUnWvEpWWVj6Yh5aAxAApfdV4X0U/haecE2nYgZhytL1PPVmI9Cp5oeaQf5cJsGkEGYPA/coMscakogsyMW6O7J+4DwyzWt23E9e7c7TusTqjQnEmDdNw4MLeONLdo8owDBO2SBIVTEyrv1K4Ks2ZIMS6/KhKcT+x5fFN5R8WiJe0Mh3jAAa6IhZuZivojspSNO5aYvXoD0aw7UI/JW4ZVvQfQhJsOBTpSOhAFZHt13YIaych2XAJ32j6CKRfbwfqqpNU9Pq+aMpfXR68NNJp7uYEOH2yydRVoKJo0aKJmzf2AYV9hb1D0L/MSWKd7pB/VodJaXfB58uWH9DZos99yE9Ow0Ucsw6ORYHSjenAx5YKV9DADBl5+W038glubTnPeXaBjKVevA43gyUe3wLv49wU6jSPY=
Content-ID: <51909B6198E47B46873F78EBF6073327@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3912
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(199004)(189003)(51914003)(50466002)(46406003)(229853002)(6512007)(9686003)(6246003)(6862004)(4326008)(47776003)(97756001)(5660300002)(356004)(14454004)(6636002)(1076003)(25786009)(54906003)(478600001)(22756006)(316002)(6486002)(26826003)(58126008)(76176011)(23726003)(26005)(446003)(11346002)(126002)(305945005)(486006)(99286004)(76130400001)(386003)(6506007)(63350400001)(14444005)(336012)(186003)(102836004)(476003)(7736002)(2906002)(6116002)(8676002)(86362001)(81166006)(81156014)(8936002)(8746002)(70206006)(70586007)(3846002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4502;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: da93f0e3-8a5a-4d8f-55f9-08d745c7ff16
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZenZZ4EaswfwDEPsxif+FXr0RrLx59ATVTnxqd89rTGTt+l3LW1O/lpmBmC6bTtpZiMweN5qHk9m0GSGNLlUI9CHwiynxbV58ZA8AZEkBXoEyOtecPtLCOiFHC/rlYHZAxa6KWU2eEkUSa2VNs9ChdVXO4Qhyd8zdwU0mF2/jDDQUqfH4NN+BhqDbQMq9N21XLQduTR5Xu0xmj120TnZLmWcOaw/c0OtVbbT6n8qy4uMRVmVED6zoCVoo67yxT2kgR7UxpiYy+oiYHVqkhdGPNGkQVPomftUl0LPxcuh/ZYarq2viGz3ZA06dZs+qrJo9Ac1lRWPuBfDnNZHKP+d89W9J2mkB0NX6hNIfMw/d0XUIaAFgnUF5TxTLBbVgrS/Sc+6BykRs5yb02H1TLWRut0ck/y2JFxnLUgfyKrC6k=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 17:02:53.8105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9784c22-6e3d-4289-07c8-08d745c808bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuC+jheJXuPf98xSZNlLTvWJAZi0JUylXdiHG+CA73g=;
 b=yLXM6RHZDsk6TybagcVuKarwtQeYXhoaKNnjGSot6kdyHDXa0aWosdqi1idbtrUAvS0u9UgApPS8ZrUk/xrtHmJv++gdDHuP8A+Cy5+er9dz0MZyj4I1evH+QuN4q5elZfIvRJ45TY+Unp/MOCIzxU7DWu4YUbW3p5PYWzjvMBo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuC+jheJXuPf98xSZNlLTvWJAZi0JUylXdiHG+CA73g=;
 b=yLXM6RHZDsk6TybagcVuKarwtQeYXhoaKNnjGSot6kdyHDXa0aWosdqi1idbtrUAvS0u9UgApPS8ZrUk/xrtHmJv++gdDHuP8A+Cy5+er9dz0MZyj4I1evH+QuN4q5elZfIvRJ45TY+Unp/MOCIzxU7DWu4YUbW3p5PYWzjvMBo=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "malidp@foss.arm.com" <malidp@foss.arm.com>,
 "yuq825@gmail.com" <yuq825@gmail.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXlhbiwKCkNvdWxkIHdlIHByZXNlcnZlIFJheSdzIGF1dGhvcnNoaXAgb24gdGhpcyBwYXRj
aD8KCk9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDA0OjQ0OjM4UE0gKzAwMDAsIEF5YW4gSGFsZGVy
IHdyb3RlOgo+IEFkZCB0aGUgRFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJM
RUFWRUQgbW9kaWZpZXIgdG8KPiBkZW5vdGUgdGhlIDE2eDE2IGJsb2NrIHUtaW50ZXJsZWF2ZWQg
Zm9ybWF0IHVzZWQgaW4gQXJtIFV0Z2FyZCBhbmQKPiBNaWRnYXJkIEdQVXMuCj4gCj4gQ2hhbmdl
cyBmcm9tIHYxOi0KPiAxLiBSZXNlcnZlZCB0aGUgdXBwZXIgZm91ciBiaXRzIChvdXQgb2YgdGhl
IDU2IGJpdHMgYXNzaWduZWQgdG8gZWFjaCB2ZW5kb3IpCj4gdG8gZGVub3RlIHRoZSBjYXRlZ29y
eSBvZiBBcm0gc3BlY2lmaWMgbW9kaWZpZXJzLiBDdXJyZW50bHksIHdlIGhhdmUgdHdvCj4gY2F0
ZWdvcmllcyBpZSBBRkJDIGFuZCBNSVNDLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJheW1vbmQgU21p
dGggPHJheW1vbmQuc21pdGhAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBeWFuIGt1bWFyIGhh
bGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1f
Zm91cmNjLmggfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2Mu
aAo+IGluZGV4IDNmZWVhYTNmOTg3YS4uYjFkM2RlOTYxMTA5IDEwMDY0NAo+IC0tLSBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91
cmNjLmgKPiBAQCAtNjQ4LDcgKzY0OCwyMSBAQCBleHRlcm4gIkMiIHsKPiAgICogRnVydGhlciBp
bmZvcm1hdGlvbiBvbiB0aGUgdXNlIG9mIEFGQkMgbW9kaWZpZXJzIGNhbiBiZSBmb3VuZCBpbgo+
ICAgKiBEb2N1bWVudGF0aW9uL2dwdS9hZmJjLnJzdAo+ICAgKi8KPiAtI2RlZmluZSBEUk1fRk9S
TUFUX01PRF9BUk1fQUZCQyhfX2FmYmNfbW9kZSkJZm91cmNjX21vZF9jb2RlKEFSTSwgX19hZmJj
X21vZGUpCj4gKwo+ICsvKgo+ICsgKiBUaGUgdG9wIDQgYml0cyAob3V0IG9mIHRoZSA1NiBiaXRz
IGFsbG90ZWQgZm9yIHNwZWNpZnlpbmcgdmVuZG9yIHNwZWNpZmljCj4gKyAqIG1vZGlmaWVycykg
ZGVub3RlIHRoZSBjYXRlZ29yeSBmb3IgbW9kaWZpZXJzLiBDdXJyZW50bHkgd2UgaGF2ZSBvbmx5
IHR3bwo+ICsgKiBjYXRlZ29yaWVzIG9mIG1vZGlmaWVycyBpZSBBRkJDIGFuZCBNSVNDLiBXZSBj
YW4gaGF2ZSBhIG1heGltdW0gb2Ygc2l4dGVlbgo+ICsgKiBkaWZmZXJlbnQgY2F0ZWdvcmllcy4K
PiArICovCgpZZWFoLCB0aGlzIG1ha2VzIG1vcmUgc2Vuc2UgdGhhbiBnZXR0aW5nIGNyYXp5IHdp
dGggc2F2aW5nIGJpdHMuIFNvcnJ5ClFpYW5nL0RhbmllbCBmb3Igbm90IGp1c3QgZ29pbmcgd2l0
aCB0aGlzIGluIHRoZSBmaXJzdCBpbnN0YW5jZSB3aGVuCnlvdSBib3RoIHN1Z2dlc3RlZCBpdC4K
Cj4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUodHlwZSwgdmFsKSBcCj4gKwlmb3Vy
Y2NfbW9kX2NvZGUoQVJNLCAoKF9fdTY0KXR5cGUgPDwgNTIpIHwgKCh2YWwpICYgMHgwMDBmZmZm
ZmZmZmZmZmZmVUxMKSkKCk5vdCBhIGJpZyBkZWFsLCBidXQgSSBtaWdodCBwcmVmaXggdHlwZSBh
bmQgdmFsIHdpdGggIl9fIiB0byByZWR1Y2UKdGhlIGNoYW5jZSBvZiBuYW1lIGNvbGxpc2lvbnMg
d2l0aCBjb2RlIHVzaW5nIHRoZSBtYWNybzoKRFJNX0ZPUk1BVF9NT0RfQVJNX0NPREUoX190eXBl
LCBfX3ZhbCkuCgo+ICsKPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fVFlQRV9BRkJDIDB4
MDAKPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fVFlQRV9NSVNDIDB4MDEKPiArCj4gKyNk
ZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMoX19hZmJjX21vZGUpIFwKPiArCURSTV9GT1JN
QVRfTU9EX0FSTV9DT0RFKERSTV9GT1JNQVRfTU9EX0FSTV9UWVBFX0FGQkMsIF9fYWZiY19tb2Rl
KQo+ICAKPiAgLyoKPiAgICogQUZCQyBzdXBlcmJsb2NrIHNpemUKPiBAQCAtNzQyLDYgKzc1Niwx
NyBAQCBleHRlcm4gIkMiIHsKPiAgICovCj4gICNkZWZpbmUgQUZCQ19GT1JNQVRfTU9EX0JDSCAg
ICAgKDFVTEwgPDwgMTEpCj4gIAo+ICsvKgo+ICsgKiBBcm0gMTZ4MTYgQmxvY2sgVS1JbnRlcmxl
YXZlZCBtb2RpZmllcgo+ICsgKgo+ICsgKiBUaGlzIGlzIHVzZWQgYnkgQXJtIE1hbGkgVXRnYXJk
IGFuZCBNaWRnYXJkIEdQVXMuIEl0IGRpdmlkZXMgdGhlIGltYWdlCj4gKyAqIGludG8gMTZ4MTYg
cGl4ZWwgYmxvY2tzLiBCbG9ja3MgYXJlIHN0b3JlZCBsaW5lYXJseSBpbiBvcmRlciwgYnV0IHBp
eGVscwo+ICsgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KPiArICovCj4gKyNkZWZpbmUg
RFJNX0ZPUk1BVF9NT0RfQVJNXzE2WDE2X0JMT0NLX1VfSU5URVJMRUFWRUQgXAo+ICsJRFJNX0ZP
Uk1BVF9NT0RfQVJNX0NPREUoRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfTUlTQywgMVVMTCkKPiAr
Cj4gKwoKSSB0aGluayB5b3UgY2FuIGRyb3AgdGhpcyBuZXdsaW5lLCB0aGVyZSdzIG5vIGV4dHJh
IHNwYWNlIGJldHdlZW4gYW55Cm9mIHRoZSBvdGhlciBkZWZpbml0aW9ucy4KCldpdGggdGhpcyBs
aW5lIGRyb3BwZWQsIGFuZCBpZiB5b3UgZml4IHVwIHRoZSBhdXRob3I6CgpSZXZpZXdlZC1ieTog
QnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgoKVGhhbmtzIGZvciB0aGUgcmVz
cGluLAotQnJpYW4KCj4gIC8qCj4gICAqIEFsbHdpbm5lciB0aWxlZCBtb2RpZmllcgo+ICAgKgo+
IC0tIAo+IDIuMjMuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
