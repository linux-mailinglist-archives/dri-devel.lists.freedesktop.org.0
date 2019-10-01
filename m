Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E15C2FED
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 11:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6379389D5E;
	Tue,  1 Oct 2019 09:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5E89D5E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 09:19:43 +0000 (UTC)
Received: from DB6PR0802CA0041.eurprd08.prod.outlook.com (2603:10a6:4:a3::27)
 by AM0PR08MB3683.eurprd08.prod.outlook.com (2603:10a6:208:102::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Tue, 1 Oct
 2019 09:19:38 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by DB6PR0802CA0041.outlook.office365.com
 (2603:10a6:4:a3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via Frontend
 Transport; Tue, 1 Oct 2019 09:19:38 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 1 Oct 2019 09:19:36 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Tue, 01 Oct 2019 09:19:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c47eafb1afe480e9
X-CR-MTA-TID: 64aa7808
Received: from 53dd24ad1df9.3 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9603E347-CC61-4535-B4C2-47A22E459F0E.1; 
 Tue, 01 Oct 2019 09:19:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53dd24ad1df9.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 01 Oct 2019 09:19:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXoatXdCjMEIX7BKdH+gqM+9QCTSs3Z58xS/zzjsUysX/4/fVW57ANYxYuseEHOWd/kPOHM04wp54gfZsDYbKalfvL7wB/LTXo/o0n9FiNDXFqWX8ET0iCtNK1/1ilvEmTpBbZ3YJIcApKKXVraL5UMH76aoC2/rwWWSqt5xjAeuxxH8lq3aCPb70LyhPx7Sjk0c1ptNZFM6ee3c4Bk8kO+YfOdpTlznfo3boPspYGt/fDTeuEdFtR0AVRHExbEs8yLiLV6TP4CakKFmaGyEHsbIJkmZSVqAgR4Upzrzp+szNOd7uG9/taIyKi3JPVgP9APVNxujrT0G9J9Gld1/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E02/Ms4Mh0ImANA7D4x0EPoIO70mt2MslOmcMpOpL94=;
 b=BCTZ1kTjpXJPVtcvTTm47ksjhoRgirayEFOHtUMbtpyeZ8xkEFb4Udk9VVLhA8/Jkb/X4FaA7FeaSUIGp4jw9nNhQa4d1B1wgn6zxALMZ0vNatcZ9zHJdZjsCWvgnVTMyhvonNIR8ZsTB+qAVWUoPRnXr7ODWYTnOVFLGZOLl7tTCdWXoQluxTKXujaxChSiZj0HX71P6sMCgkCH+YIrV5E37hkcgy5pMF0je0VZV1FIRDBbf9nXa0mZLjTL7RZUzWexVFG4ks/92o8CzljleHBrTmJjAdRk/QqazxvfKC86ia0LRkng76LTB/8Y3WuIp4Vp/560++FjlZTSlo+EMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com (10.141.172.139) by
 AM7PR08MB5350.eurprd08.prod.outlook.com (10.141.172.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 09:19:21 +0000
Received: from AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0]) by AM7PR08MB5352.eurprd08.prod.outlook.com
 ([fe80::1c78:bb51:3634:9cf0%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 09:19:21 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH v2] drm/fourcc: Add Arm 16x16 block modifier
Thread-Topic: [PATCH v2] drm/fourcc: Add Arm 16x16 block modifier
Thread-Index: AQHVd65ZjChaP0zoZUGEUL74H9varqdEcloAgAEQ5QA=
Date: Tue, 1 Oct 2019 09:19:21 +0000
Message-ID: <20191001091920.GA28248@arm.com>
References: <20190930164425.20282-1-ayan.halder@arm.com>
 <20190930170236.fvlim4c4ziqbxkw7@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190930170236.fvlim4c4ziqbxkw7@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::26) To AM7PR08MB5352.eurprd08.prod.outlook.com
 (2603:10a6:20b:106::11)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fcf37d03-37b4-48a8-aaef-08d746507ad9
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM7PR08MB5350:|AM7PR08MB5350:|AM0PR08MB3683:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3683FEB5F2CF3DDB867FF937E49D0@AM0PR08MB3683.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0177904E6B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(51914003)(189003)(11346002)(102836004)(305945005)(66066001)(5660300002)(446003)(71190400001)(64756008)(99286004)(476003)(54906003)(8676002)(229853002)(71200400001)(81156014)(81166006)(8936002)(2616005)(478600001)(256004)(26005)(14444005)(14454004)(66446008)(386003)(1076003)(186003)(52116002)(6506007)(66556008)(486006)(25786009)(76176011)(66946007)(66476007)(44832011)(7736002)(6862004)(6246003)(86362001)(4326008)(36756003)(6512007)(37006003)(2906002)(6436002)(33656002)(316002)(6116002)(6636002)(6486002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5350;
 H:AM7PR08MB5352.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zFYhf2kRDHvHW85lh3xA4jTWeokYcwcqL6831hK8eu0egTQlwnUdPSZwAooh2aG4u8/OQA3PpeULjO2BsJG8srSImKBnW4xg3+BCgxDm68OJFaa4ZwwOEHoYkqU3j7KPKKF3RJy+MNN1qEo9U5LLNeQy/068K494tfMtW5CaPw0Bk7ljgRqn6jKBe6OOqYUXO0ZdYy6u6arkl/+zdvBOGtCsF0nBDG8GDeM+vdZedSKx9bNa+BhWx/U9Rquo4lthBX6YJJuyS7FYWLGtuK9ax+HxhCW97brYo4couEs8sUQP8CKsviMeAnm9LZBUHEbY0+AFo0YJLd9gmN1KyOKcF7OIm2qWMZBwjBAqd+0H9c4EHlWIiUM0+MIvunJAQ7BMDLpz+jZv3rRxQut9PdqZpAuVK4Rm8m3t2YOHkHewZzY=
Content-ID: <5F38E1DB67CA8748B3C6674209244F6D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(51914003)(356004)(2906002)(2616005)(126002)(14454004)(4326008)(25786009)(476003)(3846002)(23726003)(6116002)(6486002)(478600001)(97756001)(26005)(102836004)(99286004)(186003)(5660300002)(486006)(6512007)(386003)(36756003)(76176011)(446003)(11346002)(305945005)(63350400001)(7736002)(66066001)(6862004)(1076003)(6246003)(14444005)(8746002)(50466002)(76130400001)(81156014)(46406003)(54906003)(6506007)(6636002)(33656002)(22756006)(26826003)(316002)(8676002)(70206006)(70586007)(86362001)(8936002)(229853002)(37006003)(336012)(47776003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3683;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f465b48e-cd73-4ff4-c4ea-08d74650718d
NoDisclaimer: True
X-Forefront-PRVS: 0177904E6B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4I1JHfu8O8glMAMiR8VN1qdsUJhI14hAIfvL/e/Qt9r+pShMTAEapXmEW69Dt/F+x1R8iyhrGGwKUSDuhxQ3oKX+G0nTXboZ9s3pr2xZzNpyq+WDuU32jpz4ARVqKlwNs0oB0uJSR5Q3HgRO2tkyr/pBmY1MvCgXzs5KKuH2KT7owj21amhujoDIB/miExLe2A+Jphh06dwwEm2dNI+oIOu04Aa6iBVAhvxTim5B2dCoOYmMNYpREmaawTIGTlsMB12lr/nlhGJuMi629OS6UoSc44aqVLlTJDw1BPkYhJP7R3CVElaVOxJiRz0W6O8QXMisvx9jIhy/9D1foyLOL74xKo5J0uVHBACD6CXuMtKrmtQ31fcBT4K3liQ9uIba7/Df8K9oh468Hzw7nn8LdW+WBRyO8wnfGbrFSxoAyA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2019 09:19:36.8037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf37d03-37b4-48a8-aaef-08d746507ad9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3683
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E02/Ms4Mh0ImANA7D4x0EPoIO70mt2MslOmcMpOpL94=;
 b=0Zq2VdAacCTyDbRr2J+o2C5feW/RCYCPHdcFd1CYendsXhNE92DulBhnzpneHX4Rz2a7CwZc3XpBdnXKZ2Nw1zhz6lEifKCocEyhu+qjI12ue+ZBIRw8jZoa4WmVsKghFGhmqfkV52c910sOMO74Qdu5E6xlo5LdRv2X111+S4I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E02/Ms4Mh0ImANA7D4x0EPoIO70mt2MslOmcMpOpL94=;
 b=0Zq2VdAacCTyDbRr2J+o2C5feW/RCYCPHdcFd1CYendsXhNE92DulBhnzpneHX4Rz2a7CwZc3XpBdnXKZ2Nw1zhz6lEifKCocEyhu+qjI12ue+ZBIRw8jZoa4WmVsKghFGhmqfkV52c910sOMO74Qdu5E6xlo5LdRv2X111+S4I=
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

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDU6MDI6MzdQTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSBBeWFuLAo+IAo+IENvdWxkIHdlIHByZXNlcnZlIFJheSdzIGF1dGhvcnNoaXAg
b24gdGhpcyBwYXRjaD8KQXBvbG9naWVzIGZvciB0aGlzLCBJIHdpbGwgZGVmaW5pdGVseSBwcmVz
ZXJ2ZSBSYXkncyBhdXRob3JzaGlwIGluIHRoZQp2MyBwYXRjaC4KCj4gCj4gT24gTW9uLCBTZXAg
MzAsIDIwMTkgYXQgMDQ6NDQ6MzhQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3JvdGU6Cj4gPiBBZGQg
dGhlIERSTV9GT1JNQVRfTU9EX0FSTV8xNlgxNl9CTE9DS19VX0lOVEVSTEVBVkVEIG1vZGlmaWVy
IHRvCj4gPiBkZW5vdGUgdGhlIDE2eDE2IGJsb2NrIHUtaW50ZXJsZWF2ZWQgZm9ybWF0IHVzZWQg
aW4gQXJtIFV0Z2FyZCBhbmQKPiA+IE1pZGdhcmQgR1BVcy4KPiA+IAo+ID4gQ2hhbmdlcyBmcm9t
IHYxOi0KPiA+IDEuIFJlc2VydmVkIHRoZSB1cHBlciBmb3VyIGJpdHMgKG91dCBvZiB0aGUgNTYg
Yml0cyBhc3NpZ25lZCB0byBlYWNoIHZlbmRvcikKPiA+IHRvIGRlbm90ZSB0aGUgY2F0ZWdvcnkg
b2YgQXJtIHNwZWNpZmljIG1vZGlmaWVycy4gQ3VycmVudGx5LCB3ZSBoYXZlIHR3bwo+ID4gY2F0
ZWdvcmllcyBpZSBBRkJDIGFuZCBNSVNDLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSYXltb25k
IFNtaXRoIDxyYXltb25kLnNtaXRoQGFybS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBeWFuIGt1
bWFyIGhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvdWFw
aS9kcm0vZHJtX2ZvdXJjYy5oIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIGIvaW5jbHVkZS91YXBp
L2RybS9kcm1fZm91cmNjLmgKPiA+IGluZGV4IDNmZWVhYTNmOTg3YS4uYjFkM2RlOTYxMTA5IDEw
MDY0NAo+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiA+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPiBAQCAtNjQ4LDcgKzY0OCwyMSBAQCBleHRl
cm4gIkMiIHsKPiA+ICAgKiBGdXJ0aGVyIGluZm9ybWF0aW9uIG9uIHRoZSB1c2Ugb2YgQUZCQyBt
b2RpZmllcnMgY2FuIGJlIGZvdW5kIGluCj4gPiAgICogRG9jdW1lbnRhdGlvbi9ncHUvYWZiYy5y
c3QKPiA+ICAgKi8KPiA+IC0jZGVmaW5lIERSTV9GT1JNQVRfTU9EX0FSTV9BRkJDKF9fYWZiY19t
b2RlKQlmb3VyY2NfbW9kX2NvZGUoQVJNLCBfX2FmYmNfbW9kZSkKPiA+ICsKPiA+ICsvKgo+ID4g
KyAqIFRoZSB0b3AgNCBiaXRzIChvdXQgb2YgdGhlIDU2IGJpdHMgYWxsb3RlZCBmb3Igc3BlY2lm
eWluZyB2ZW5kb3Igc3BlY2lmaWMKPiA+ICsgKiBtb2RpZmllcnMpIGRlbm90ZSB0aGUgY2F0ZWdv
cnkgZm9yIG1vZGlmaWVycy4gQ3VycmVudGx5IHdlIGhhdmUgb25seSB0d28KPiA+ICsgKiBjYXRl
Z29yaWVzIG9mIG1vZGlmaWVycyBpZSBBRkJDIGFuZCBNSVNDLiBXZSBjYW4gaGF2ZSBhIG1heGlt
dW0gb2Ygc2l4dGVlbgo+ID4gKyAqIGRpZmZlcmVudCBjYXRlZ29yaWVzLgo+ID4gKyAqLwo+IAo+
IFllYWgsIHRoaXMgbWFrZXMgbW9yZSBzZW5zZSB0aGFuIGdldHRpbmcgY3Jhenkgd2l0aCBzYXZp
bmcgYml0cy4gU29ycnkKPiBRaWFuZy9EYW5pZWwgZm9yIG5vdCBqdXN0IGdvaW5nIHdpdGggdGhp
cyBpbiB0aGUgZmlyc3QgaW5zdGFuY2Ugd2hlbgo+IHlvdSBib3RoIHN1Z2dlc3RlZCBpdC4KPiAK
PiA+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9EX0FSTV9DT0RFKHR5cGUsIHZhbCkgXAo+ID4gKwlm
b3VyY2NfbW9kX2NvZGUoQVJNLCAoKF9fdTY0KXR5cGUgPDwgNTIpIHwgKCh2YWwpICYgMHgwMDBm
ZmZmZmZmZmZmZmZmVUxMKSkKPiAKPiBOb3QgYSBiaWcgZGVhbCwgYnV0IEkgbWlnaHQgcHJlZml4
IHR5cGUgYW5kIHZhbCB3aXRoICJfXyIgdG8gcmVkdWNlCj4gdGhlIGNoYW5jZSBvZiBuYW1lIGNv
bGxpc2lvbnMgd2l0aCBjb2RlIHVzaW5nIHRoZSBtYWNybzoKPiBEUk1fRk9STUFUX01PRF9BUk1f
Q09ERShfX3R5cGUsIF9fdmFsKS4KPiAKPiA+ICsKPiA+ICsjZGVmaW5lIERSTV9GT1JNQVRfTU9E
X0FSTV9UWVBFX0FGQkMgMHgwMAo+ID4gKyNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVf
TUlTQyAweDAxCj4gPiArCj4gPiArI2RlZmluZSBEUk1fRk9STUFUX01PRF9BUk1fQUZCQyhfX2Fm
YmNfbW9kZSkgXAo+ID4gKwlEUk1fRk9STUFUX01PRF9BUk1fQ09ERShEUk1fRk9STUFUX01PRF9B
Uk1fVFlQRV9BRkJDLCBfX2FmYmNfbW9kZSkKPiA+ICAKPiA+ICAvKgo+ID4gICAqIEFGQkMgc3Vw
ZXJibG9jayBzaXplCj4gPiBAQCAtNzQyLDYgKzc1NiwxNyBAQCBleHRlcm4gIkMiIHsKPiA+ICAg
Ki8KPiA+ICAjZGVmaW5lIEFGQkNfRk9STUFUX01PRF9CQ0ggICAgICgxVUxMIDw8IDExKQo+ID4g
IAo+ID4gKy8qCj4gPiArICogQXJtIDE2eDE2IEJsb2NrIFUtSW50ZXJsZWF2ZWQgbW9kaWZpZXIK
PiA+ICsgKgo+ID4gKyAqIFRoaXMgaXMgdXNlZCBieSBBcm0gTWFsaSBVdGdhcmQgYW5kIE1pZGdh
cmQgR1BVcy4gSXQgZGl2aWRlcyB0aGUgaW1hZ2UKPiA+ICsgKiBpbnRvIDE2eDE2IHBpeGVsIGJs
b2Nrcy4gQmxvY2tzIGFyZSBzdG9yZWQgbGluZWFybHkgaW4gb3JkZXIsIGJ1dCBwaXhlbHMKPiA+
ICsgKiBpbiB0aGUgYmxvY2sgYXJlIHJlb3JkZXJlZC4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIERS
TV9GT1JNQVRfTU9EX0FSTV8xNlgxNl9CTE9DS19VX0lOVEVSTEVBVkVEIFwKPiA+ICsJRFJNX0ZP
Uk1BVF9NT0RfQVJNX0NPREUoRFJNX0ZPUk1BVF9NT0RfQVJNX1RZUEVfTUlTQywgMVVMTCkKPiA+
ICsKPiA+ICsKPiAKPiBJIHRoaW5rIHlvdSBjYW4gZHJvcCB0aGlzIG5ld2xpbmUsIHRoZXJlJ3Mg
bm8gZXh0cmEgc3BhY2UgYmV0d2VlbiBhbnkKPiBvZiB0aGUgb3RoZXIgZGVmaW5pdGlvbnMuCj4g
Cj4gV2l0aCB0aGlzIGxpbmUgZHJvcHBlZCwgYW5kIGlmIHlvdSBmaXggdXAgdGhlIGF1dGhvcjoK
PiAKPiBSZXZpZXdlZC1ieTogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+
IAo+IFRoYW5rcyBmb3IgdGhlIHJlc3BpbiwKCkkgd2lsbCB3YWl0IGZvciBkYW5pZWxAZmZ3bGwu
Y2ggYW5kIHl1cTgyNUBnbWFpbC5jb20gY29tbWVudHMgYmVmb3JlCnJlc3Bpbm5pbmcgdGhlIHBh
dGNoLgoKPiAtQnJpYW4KPiAKPiA+ICAvKgo+ID4gICAqIEFsbHdpbm5lciB0aWxlZCBtb2RpZmll
cgo+ID4gICAqCj4gPiAtLSAKPiA+IDIuMjMuMAo+ID4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
