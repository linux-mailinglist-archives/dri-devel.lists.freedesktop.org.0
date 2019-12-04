Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B2112AC0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33C66E893;
	Wed,  4 Dec 2019 11:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50071.outbound.protection.outlook.com [40.107.5.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6A46E893;
 Wed,  4 Dec 2019 11:53:04 +0000 (UTC)
Received: from AM4PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:205:2::16)
 by DB6PR08MB2887.eurprd08.prod.outlook.com (2603:10a6:6:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Wed, 4 Dec
 2019 11:53:01 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by AM4PR08CA0045.outlook.office365.com
 (2603:10a6:205:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:53:00 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:53:00 +0000
Received: ("Tessian outbound 691822eda51f:v37");
 Wed, 04 Dec 2019 11:52:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 437f6d2067540f2c
X-CR-MTA-TID: 64aa7808
Received: from d8d84aa0dd90.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C71EB7A-47B8-43D1-A029-58C9769C29F3.1; 
 Wed, 04 Dec 2019 11:48:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8d84aa0dd90.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEaF+W7ExQvEdH6neKqhvdNbZlry30mKX1U42J0LxQfrIIlU1BieVnZ7EX4OOn29rChkdPXUPd7aCMZ30w7UtlaxKOi3MNYSVqiLwveUNuCFnKoFUhR03P4oUe1OnP3eFEzHT6epggm8L3u4hBOSpwUoiG7BMcnHbH1JgGIOHJmQqIcUhOZR9innHK/MxZ7d/kYCxY7FNHv7zbOY3kgQTKETxXmGSGazabWKvyHVnySWuH5oBcbaUkXoycsDVVnqRqEh5bUeJEMuBYwZhidG5kyHsV/KiGa3coe8ObXfgx9HhapaWFAOSFCR7CEPy264Q9q2esUSBeY+WWGLTz6JNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjVNpfXVBOGU1x7uKuqKkBOktWSSMN1jfSBokyJduDg=;
 b=VLdKubxE9qe0uBM+73tL53n7VKVckBUMIkJMyhfeXisZNgQ6TYgohcgoo99ug2ef0E2LeNbwbQ+WO21l3xBPU99VYJ2NxXWA+Gqk1VbfxeEMzQ8+t95hgjEge79RGFYsHEceOLCbEvnQQn9gVSq9wIOwx4NPwnTTZizZ6JeWd68MabmUt6O/DIepW/FvOVOsOWyIZFOhWhDsEsheTYjvHljc+2Siah/xl0mhpniZaWLDsEBduy4OVxy18FUZI79xRwfvwIMR1asMZr49O6I3adDzSy/SNMS6c+X/3ym2/1r5MRbHeVVDWDL66hHZjYcmpmD3I5tbz2rlUnlV9AMheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2909.eurprd08.prod.outlook.com (10.170.239.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:02 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:02 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 00/28] drm/bridge: Consolidate initialization
Thread-Topic: [PATCH v2 00/28] drm/bridge: Consolidate initialization
Thread-Index: AQHVqpiuNcYsgGgOskGx3fwlqVtM9Q==
Date: Wed, 4 Dec 2019 11:48:01 +0000
Message-ID: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af0f7330-034f-4996-7f25-08d778b08333
X-MS-TrafficTypeDiagnostic: VI1PR08MB2909:|VI1PR08MB2909:|DB6PR08MB2887:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR08MB2887BFB22BB27EAF96AFCF388F5D0@DB6PR08MB2887.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:227;OLM:227;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(189003)(199004)(53754006)(71200400001)(71190400001)(2906002)(305945005)(6306002)(8936002)(8676002)(5640700003)(81156014)(3846002)(7736002)(6436002)(6506007)(44832011)(52116002)(6486002)(2351001)(7416002)(7406005)(6512007)(6116002)(2501003)(4326008)(81166006)(50226002)(316002)(102836004)(86362001)(66946007)(54906003)(66446008)(66556008)(66476007)(6916009)(64756008)(14444005)(1076003)(478600001)(36756003)(2616005)(5660300002)(25786009)(14454004)(26005)(99286004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2909;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zzb1BWvgKuhzkH6/NMG+E2TOkfVtj9LkyS32beGyklJ41W4Pkd3SkxpqMPZtRQUQakecODkBLrpQ4mp/O2YiQdoTdC4soVuZlJY+Bes2WwXHoO5VbDBU+kl6a457h5qDtccPxQmvF5gueJkMnV8QUfFLfi/qNZwnHcQlaZqqN5Nnd9zXPj83f1JV8Z+raa+vyzVRn99LlDY1kyR+rwISI7Dwumcgcbc0JJnQbN9ZAUtgf0+1++zrFAjGfZbPA3fjReDoJFB4KWiDJGfQExdYn8wLtRO3rUUY/AsQB0Nu+ZuK5phuqbHw0NvsrLJEiupXGZutc6JlKUca97+0YeEZGHBNvmesTxOq7zDAPimTpN1BCm3Kd2uGeM0W7c9CmcQbUDfFcIpX6H/4vkt2H0V0/cLHmjvUhw8Pp4kiVFYroinDcb1loYv8Mw3urgJBH2Rla547JJseQAHELNNUGgZF+49sbHWzi2flu33M3F8mvBuNT5O/82deIxc6SlOpoEF91pYesTskQzYd/kRjXNAEWQ==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2909
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(53754006)(199004)(189003)(6506007)(26005)(50226002)(102836004)(86362001)(8746002)(81166006)(6512007)(81156014)(336012)(6306002)(2351001)(25786009)(450100002)(26826003)(186003)(107886003)(4326008)(14454004)(5640700003)(8676002)(2501003)(50466002)(6486002)(478600001)(8936002)(23756003)(36756003)(2616005)(22756006)(5660300002)(54906003)(1076003)(99286004)(6916009)(6116002)(356004)(316002)(2906002)(7736002)(70586007)(76130400001)(3846002)(14444005)(36906005)(70206006)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR08MB2887;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12cee252-cdee-411e-92fa-08d778afd0ca
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hk4ADEyLD1gvjVStSHOZl/XLdvbwEFDFqimOh/r6hYw0av76A11kT81Br5ORy3KWg9+XLXyq4hOOT+v7B5qqZjQ0EPSsyGFqWY9az1BZkJT3Kq3oDOX86VuTqOPY1xjHSVa6sAQGUfJkD/S3M5XRkfPTkRbo7sVvoGAaOqdiS5AH8u7MwRINJbh4RrnsVVHHRYqnSFYRu0qHb6s5NDjMt+cttFQL2wkj94l5ABgmrPBkCOWOSlrT1PYFUz07RUijzv2853P2n0KY4Jaw5QF9RoTt7bpDxEkywURxiKb5cF6i3o22Ze+QyUggLhOCffFqfZMjqYGdOBLpvDuLMp/Bpiq7QbZehQCZPyGh8FFYvM6eFZNYHX6dcqD4tF7uRmi9y02okfIYJ8HlHj2KfM5qq6SGtilh8kT0zUYrAW6UMKdenKEoKJKALcfasW3qVi4M/ZzEVPaZw/FPLK5bKVRrWYYbFfA1PKM2nl3FhVqSOHeqZHdexa8Bekh1ZA1yeYkK5g/d+dFlHkB9fhZINMNNkw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:53:00.5530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0f7330-034f-4996-7f25-08d778b08333
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjVNpfXVBOGU1x7uKuqKkBOktWSSMN1jfSBokyJduDg=;
 b=6denV8It2I8pM7c0IC7aTn9b/e92AwuJ/UflIW9wTkMgCFH3O2MxHtvBtPNum6saalbr0nEoCqK3kmkAxImTbHxtifk+0cOSebyJ8M9TRaAJAAYqncouS/9U1UjWkAttMgMbn50ZfH7+7tmhGn/+BVDfkasKnFzkrFjpkw/asTM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjVNpfXVBOGU1x7uKuqKkBOktWSSMN1jfSBokyJduDg=;
 b=6denV8It2I8pM7c0IC7aTn9b/e92AwuJ/UflIW9wTkMgCFH3O2MxHtvBtPNum6saalbr0nEoCqK3kmkAxImTbHxtifk+0cOSebyJ8M9TRaAJAAYqncouS/9U1UjWkAttMgMbn50ZfH7+7tmhGn/+BVDfkasKnFzkrFjpkw/asTM=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Brian Masney <masneyb@onstation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Torsten Duwe <duwe@lst.de>, Dariusz Marcinkiewicz <darekm@google.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKSSd2ZSBkcm9wcGVkIHRoZSBmdW4gcGFydHMgb2YgdGhpcyBzZXJpZXMgc2luY2Ug
dGhleSBuZWVkIG1vcmUgd29yaywgYnV0CmZpZ3VyZWQgZHJtX2JyaWRnZV9pbml0KCkgYXMgYSBj
b25jZXB0IGlzIHN0aWxsIHZhbHVhYmxlIG9uIGl0cyBvd24gKGFuZApJIHRoaW5rIEknbGwgbmVl
ZCBpdCB0byByb2xsIG91dCBkZXZpY2UgbGlua3MgZm9yIHJlZ2lzdGVyZWQgYnJpZGdlcyksCnNv
IGhlcmUgZ29lcy4KCnYyOgogLSBleHBhbmRlZCBjb21taXQgbWVzc2FnZXMgYW5kIGFkZGVkIHNv
bWUgZXh0cmEgYnJpZGdlLXJlbGF0ZWQKICAgZG9jdW1lbnRhdGlvbiAoRGFuaWVsKQogLSBkcm9w
cGVkIHYxIHBhdGNoZXMgMjkgYW5kIDMwOiAyOSBuZWVkcyBtb3JlIHdvcmssIGFuZCAzMCBkZXBl
bmRzIG9uCiAgIGl0CiAtIGFkZGVkIGFsbCByZW1haW5pbmcgZHJtX2JyaWRnZSBpbXBsZW1lbnRl
cnMsIGZvdW5kIGJ5IHNlYXJjaGluZyBmb3IKICAgZHJtX2JyaWRnZV9mdW5jcyB3aGljaCBpcyBt
YW5kYXRvcnkgZm9yIGFueSBicmlkZ2U7IG5ldyB1c2VzIGluCiAgIHBhdGNoZXMgMywgMjcsIGFu
ZCAyOCAoU2FtKQogLSBkdWUgdG8gdGhlIGFib3ZlLCBJJ3ZlIGRlY2lkZWQgdG8gc3F1YXNoIGFs
bCBhbmFsb2dpeCBjaGFuZ2VzIGludG8KICAgb25lIHBhdGNoCgotLS0KdjEgW2h0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNzAwMzkvXSBjb3ZlciB0ZXh0IGJlbG93OgoK
VGhpcyBzZXJpZXMgYWRkcyBkZXZpY2UgbGlua3Mgc3VwcG9ydCB0byBkcm1fYnJpZGdlLiBUaGUg
bW90aXZhdGlvbgpiZWhpbmQgaXQgaXMgdGhhdCBhIGRybV9icmlkZ2UgaW4gYSBtb2R1bGUgY291
bGQgZ2V0IHJlbW92ZWQgdW5kZXIgdGhlCmZlZXQgb2YgdGhlIGJyaWRnZSB1c2VyIHdpdGhvdXQg
d2FybmluZywgc28gd2UgbmVlZCBhIHdheSB0byByZW1vdmUgYW5kCnJlcHJvYmUgdGhlIGNsaWVu
dCBhcyBuZWVkZWQgdG8gYXZvaWQgcGVlcmluZyBpbnRvIHRoZSB2b2lkLgoKMTogQWRkIGEgZHJt
X2JyaWRnZV9pbml0KCkgZnVuY3Rpb24gd2hpY2ggd3JhcHMgYWxsIGluaXRpYWxpc2F0aW9uIG9m
CnRoZSBzdHJ1Y3R1cmUgcHJpb3IgdG8gY2FsbGluZyBkcm1fYnJpZGdlX2FkZCgpLgoKMi0yNiwy
ODogQXBwbHkgdGhlIGRybV9icmlkZ2VfaW5pdCgpIHJlZmFjdG9yIHRvIGV2ZXJ5IGJyaWRnZSB0
aGF0IHVzZXMKZHJtX2JyaWRnZV9hZGQoKS4KCjI3OiBNaW5vciBjbGVhbnVwIGluIHJjYXItZHUu
CgoyOTogQWRkIG9mX2RybV9maW5kX2JyaWRnZV9kZXZsaW5rKCkgd2hpY2ggZnVuY3Rpb25zIHRo
ZSBzYW1lIGFzCm9mX2RybV9maW5kX2JyaWRnZSgpIHBsdXMgYWRkcyBhIGRldmljZSBkZXZpY2Ug
bGluayBmcm9tIHRoZSBvd25pbmcKZHJtX2RldmljZSB0byB0aGUgYnJpZGdlIGRldmljZS4KCjMw
OiBBcyBhIG1vdGl2YXRpbmcgZXhhbXBsZSwgY29udmVydCBrb21lZGEgdG8gZXhjbHVzaXZlbHkg
dXNlCmRybV9icmlkZ2UgZm9yIGl0cyBwaXBlIG91dHB1dHM7IHRoaXMgaXNuJ3QgYSByZWdyZXNz
aW9uIGluIHVzYWJpbGl0eQphbnkgbW9yZSBzaW5jZSBkZXZpY2UgbGlua3MgYnJpbmcgdGhlIHNh
bWUgYXV0b21hdGljIHJlbW92ZS9yZXByb2JlCmZlYXR1cmUgYXMgY29tcG9uZW50cy4KCk1paGFp
bCBBdGFuYXNzb3YgKDI4KToKICBkcm06IEludHJvZHVjZSBkcm1fYnJpZGdlX2luaXQoKQogIGRy
bS9icmlkZ2U6IGFkdjc1MTE6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2UvYW5h
bG9naXg6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2U6IGNkbnM6IFVzZSBkcm1f
YnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2U6IGR1bWItdmdhLWRhYzogVXNlIGRybV9icmlkZ2Vf
aW5pdCgpCiAgZHJtL2JyaWRnZTogbHZkcy1lbmNvZGVyOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkK
ICBkcm0vYnJpZGdlOiBtZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3OiBVc2UgZHJtX2Jy
aWRnZV9pbml0KCkKICBkcm0vYnJpZGdlOiBueHAtcHRuMzQ2MDogVXNlIGRybV9icmlkZ2VfaW5p
dCgpCiAgZHJtL2JyaWRnZTogcGFuZWw6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlk
Z2U6IHBzODYyMjogVXNlIGRybV9icmlkZ2VfaW5pdCgpCiAgZHJtL2JyaWRnZTogc2lpOTAyeDog
VXNlIGRybV9icmlkZ2VfaW5pdCgpCiAgZ3B1OiBkcm06IGJyaWRnZTogc2lpOTIzNDogVXNlIGRy
bV9icmlkZ2VfaW5pdCgpCiAgZHJtL2JyaWRnZTogc2lsX3NpaTg2MjA6IFVzZSBkcm1fYnJpZGdl
X2luaXQoKQogIGRybS9icmlkZ2U6IGR3LWhkbWk6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRy
bS9icmlkZ2Uvc3lub3BzeXM6IGRzaTogVXNlIGRybV9icmlkZ2VfaW5pdCgpCiAgZHJtL2JyaWRn
ZTogdGMzNTg3NjQ6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9icmlkZ2U6IHRjMzU4NzY3
OiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKICBkcm0vYnJpZGdlOiB0aGM2MzogVXNlIGRybV9icmlk
Z2VfaW5pdCgpCiAgZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiBVc2UgZHJtX2JyaWRnZV9pbml0
KCkKICBkcm0vYnJpZGdlOiB0aS10ZnA0MTA6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybS9l
eHlub3M6IG1pYzogVXNlIGRybV9icmlkZ2VfaW5pdCgpCiAgZHJtL2kyYzogdGRhOTk4eDogVXNl
IGRybV9icmlkZ2VfaW5pdCgpCiAgZHJtL21jZGU6IGRzaTogVXNlIGRybV9icmlkZ2VfaW5pdCgp
CiAgZHJtL21lZGlhdGVrOiBoZG1pOiBVc2UgZHJtX2JyaWRnZV9pbml0KCkKICBkcm06IHJjYXIt
ZHU6IGx2ZHM6IFVzZSBkcm1fYnJpZGdlX2luaXQoKQogIGRybTogcmNhci1kdTogbHZkczogRG9u
J3Qgc2V0IGRybV9icmlkZ2UgcHJpdmF0ZSBwb2ludGVyCiAgZHJtL3N0aTogVXNlIGRybV9icmlk
Z2VfaW5pdCgpCiAgZHJtL21zbTogVXNlIGRybV9icmlkZ2VfaW5pdCgpCgogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMgIHwgIDUgKystCiAuLi4vZHJtL2JyaWRn
ZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgICAgfCAgNSArKy0KIC4uLi9kcm0vYnJpZGdl
L2FuYWxvZ2l4L2FuYWxvZ2l4LWFueDc4eHguYyAgICB8ICA4ICsrLS0tCiAuLi4vZHJtL2JyaWRn
ZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMgICAgfCAgNSArKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvY2Rucy1kc2kuYyAgICAgICAgICAgICB8ICA0ICstLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9kdW1iLXZnYS1kYWMuYyAgICAgICAgIHwgIDYgKystLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9sdmRzLWVuY29kZXIuYyAgICAgICAgIHwgIDcgKystLQogLi4uL2JyaWRnZS9tZWdh
Y2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL254cC1wdG4zNDYwLmMgICAgICAgICAgfCAgNCArLS0KIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvcGFuZWwuYyAgICAgICAgICAgICAgICB8ICA3ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvcGFyYWRlLXBzODYyMi5jICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3NpaTkwMnguYyAgICAgICAgICAgICAgfCAgNSArKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTIzNC5jICAgICAgICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpbC1zaWk4NjIwLmMgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1oZG1pLmMgICAgIHwgIDcgKystLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
eW5vcHN5cy9kdy1taXBpLWRzaS5jIHwgIDcgKystLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2NC5jICAgICAgICAgICAgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMgICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2
M2x2ZDEwMjQuYyAgICAgICAgIHwgIDcgKystLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS1z
bjY1ZHNpODYuYyAgICAgICAgIHwgIDUgKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRm
cDQxMC5jICAgICAgICAgICAgfCAgNSArKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMg
ICAgICAgICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9taWMuYyAgICAgICB8ICA4ICstLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTJjL3RkYTk5OHhfZHJ2LmMgICAgICAgICAgICAgfCAgNiArLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWNkZS9tY2RlX2RzaS5jICAgICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL2RzaS9kc2lfbWFuYWdlci5jICAgICAgICAgfCAgNCArLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZWRwL2VkcF9icmlkZ2UuYyAgICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2hkbWkvaGRtaV9icmlkZ2UuYyAgICAgICAgfCAgNCArLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfbHZkcy5jICAgICAgICAgICB8ICA1ICsrLQogZHJpdmVycy9ncHUvZHJtL3N0aS9z
dGlfZHZvLmMgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9oZGEuYyAgICAgICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlf
aGRtaS5jICAgICAgICAgICAgICAgIHwgIDMgKy0KIGluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCAg
ICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKystCiAzNCBmaWxlcyBjaGFuZ2VkLCAxMDAg
aW5zZXJ0aW9ucygrKSwgMTAzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
