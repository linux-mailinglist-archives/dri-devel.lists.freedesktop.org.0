Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51B1094D8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 21:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D9D89C2C;
	Mon, 25 Nov 2019 20:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760074.outbound.protection.outlook.com [40.107.76.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E88F89C2C;
 Mon, 25 Nov 2019 20:51:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlxBkXNCNj8ZPEoGgYxWGmIeXGu+Jm2IatLafQGSTLbTov/l+aOpZGJMmazyTcaSH6fnw4Rf+BN+7diUwrPWs3I9ppX/hrLiJ0IFGzAAJ/lxPQ+QyfYdbQWE6JB/ybLUXSCzdjXjD3vO1j5DcuKv18nZzg8k0CEzTWrcTf7HlXkGG64NQhzaouNjKiNeBrw0CuVV4iWV5pwKccPCtnR0H4GK0Y4cpua8vaWUYz0Gg8/7Nd9YErr2vldpmrUIuCBPBj+bxzNMrhLaDbzcioes+tH/Gwy+6Y7Qx+mm+8b66/5+MH6/9CjOrltsPjYudexEvMdb4tUN7Fx55/YCG30xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu+JJt5L4aDFZyDUnfoj/2453/8J/y18mkGy07h1jF0=;
 b=lkjK3de4V+MtlhWUeAsRfu2frkPVTkJOoCTwj7ukZGuOhfHcTsaQKjL9ilBULGwVWZnYgkUb8P24jl9EfTq/bCLdrnYSGjAsz86NHw/WVTzoj4rGkLC0ChfIso5fKwBgOwWev8OCFYWZDKVtVgAw2LaZFYr+Ofvov8keUgVbyqni+GFtinWKNkuCV32c7RjbecwgB5CQQo+D3yjhTP61GGnpBajVJmESCYQBW6c3WkZgpEBmyF3vPOQsQvqRnh7KpkuCVPpj2StEtwodRgcsHZ/xnBByQq2gBbQutm+LfZChGiSCbFdzXB2unwLutKtOJvD05EIkiH57cUsDw4jxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0033.namprd12.prod.outlook.com (2603:10b6:301:2::19)
 by MWHPR1201MB0061.namprd12.prod.outlook.com (2603:10b6:301:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Mon, 25 Nov
 2019 20:51:36 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::200) by MWHPR12CA0033.outlook.office365.com
 (2603:10b6:301:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.18 via Frontend
 Transport; Mon, 25 Nov 2019 20:51:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 25 Nov 2019 20:51:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 Nov
 2019 14:51:35 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 Nov
 2019 14:51:34 -0600
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 25 Nov 2019 14:51:34 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: 
Subject: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Date: Mon, 25 Nov 2019 15:51:29 -0500
Message-ID: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(428003)(189003)(199004)(54906003)(8676002)(109986005)(26005)(478600001)(23676004)(7696005)(186003)(44832011)(336012)(1671002)(305945005)(5820100001)(4326008)(6666004)(356004)(53416004)(50466002)(2870700001)(2906002)(5660300002)(50226002)(2616005)(86362001)(8936002)(70206006)(81166006)(81156014)(70586007)(36756003)(426003)(14444005)(66574012)(316002)(47776003)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0061; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6d86045-a807-4bf7-fdfe-08d771e94356
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0061:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0061650AF788C44F2614E4DEEA4A0@MWHPR1201MB0061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0232B30BBC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPgbqAdyM/XsXMum7YUM7z95l4ZXpYz9hOEJm7SM3QBYS49y2CCbTDpwGl8EO7Bf0GxHKcQ38Xm4xls5GCjahBvJMtICC5MXRnNGoxtyXvc4gnciq4mOw+FjClqEmpseBzidb4cRFgqfSPXG6P/3jj/Zzyk+Rww77CS9IY3ShBnRsyeCtMtTvnYHGg9JAh2uFvK0uYfSmtfVVWF6AEa414pSl6Jr909v41v2/7uaJfTsg8QHrE2ffJZUUdtf8NxeuuyayHkEZpkC1R2JSLGckbIfUSIbgoKaY3Uon8/5mQ6bznfglQzZ9pC5EZErJRb2rWsbWYcyF7K0XqCdWFkMhZSx/1pWSjo2keyERMc7AVGo/MJQ1MMHzZtZy0dyTFQuH00sIb3caIyepTAMbJhlZZHAvSrOcdXQbygCnET0Ha5eUD2g2t5bdEN2GKEdj6UX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 20:51:36.5716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d86045-a807-4bf7-fdfe-08d771e94356
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0061
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu+JJt5L4aDFZyDUnfoj/2453/8J/y18mkGy07h1jF0=;
 b=PK7g+1G8iFUyub3ubvOCKdVfxIgO96m2M6fvf59uFsny5rc2eYEDUotEcQ8vWtOODz1+HVrpy8AkJpK2biAu3RnW8b+TNy0ylBLhEgz14K1QAA4NRceIEWE/gfoxkwBAg/zbImFRVVFlA9qxz5220O6nZ6uv/es0E54whgt41Q4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: amd-gfx@lists.freedesktop.org, steven.price@arm.com, Emily.Deng@amd.com,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmxlbToKRHVlIHRvIGEgcmFjZSBiZXR3ZWVuIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMgaW4g
c2NoZWQgdGhyZWFkIGFuZApkcm1fc2NoZWRfam9iX3RpbWVkb3V0IGluIHRpbWVvdXQgd29yayB0
aGVyZSBpcyBhIHBvc3NpYmxpdHkgdGhhdApiYWQgam9iIHdhcyBhbHJlYWR5IGZyZWVkIHdoaWxl
IHN0aWxsIGJlaW5nIGFjY2Vzc2VkIGZyb20gdGhlCnRpbWVvdXQgdGhyZWFkLgoKRml4OgpJbnN0
ZWFkIG9mIGp1c3QgcGVla2luZyBhdCB0aGUgYmFkIGpvYiBpbiB0aGUgbWlycm9yIGxpc3QKcmVt
b3ZlIGl0IGZyb20gdGhlIGxpc3QgdW5kZXIgbG9jayBhbmQgdGhlbiBwdXQgaXQgYmFjayBsYXRl
ciB3aGVuCndlIGFyZSBnYXJhbnRlZWQgbm8gcmFjZSB3aXRoIG1haW4gc2NoZWQgdGhyZWFkIGlz
IHBvc3NpYmxlIHdoaWNoCmlzIGFmdGVyIHRoZSB0aHJlYWQgaXMgcGFya2VkLgoKdjI6IExvY2sg
YXJvdW5kIHByb2Nlc3NpbmcgcmluZ19taXJyb3JfbGlzdCBpbiBkcm1fc2NoZWRfY2xlYW51cF9q
b2JzLgoKdjM6IFJlYmFzZSBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dC4gdjIgaXMgbm90IG5lZWRl
ZCBhbnltb3JlIGFzCmRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgYWxyZWFkeSBoYXMgYSBsb2Nr
IHRoZXJlLgoKdjQ6IEZpeCBjb21tZW50cyB0byByZWxmZWN0IGxhdGVzdCBjb2RlIGluIGRybS1t
aXNjLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+ClRlc3RlZC1ieTogRW1pbHkgRGVuZyA8RW1pbHkuRGVuZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKaW5kZXggNjc3NDk1NS4uMWJmOWM0MCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKQEAgLTI4NCwxMCArMjg0LDIxIEBA
IHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRvdXQoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAlzY2hlZCA9IGNvbnRhaW5lcl9vZih3b3Jr
LCBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIsIHdvcmtfdGRyLndvcmspOworCisJLyogUHJvdGVj
dHMgYWdhaW5zdCBjb25jdXJyZW50IGRlbGV0aW9uIGluIGRybV9zY2hlZF9nZXRfY2xlYW51cF9q
b2IgKi8KKwlzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsK
IAlqb2IgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0
LAogCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3NjaGVkX2pvYiwgbm9kZSk7CiAKIAlpZiAoam9iKSB7
CisJCS8qCisJCSAqIFJlbW92ZSB0aGUgYmFkIGpvYiBzbyBpdCBjYW5ub3QgYmUgZnJlZWQgYnkg
Y29uY3VycmVudAorCQkgKiBkcm1fc2NoZWRfY2xlYW51cF9qb2JzLiBJdCB3aWxsIGJlIHJlaW5z
ZXJ0ZWQgYmFjayBhZnRlciBzY2hlZC0+dGhyZWFkCisJCSAqIGlzIHBhcmtlZCBhdCB3aGljaCBw
b2ludCBpdCdzIHNhZmUuCisJCSAqLworCQlsaXN0X2RlbF9pbml0KCZqb2ItPm5vZGUpOworCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOworCiAJ
CWpvYi0+c2NoZWQtPm9wcy0+dGltZWRvdXRfam9iKGpvYik7CiAKIAkJLyoKQEAgLTI5OCw2ICsz
MDksOCBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfam9iX3RpbWVkb3V0KHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykKIAkJCWpvYi0+c2NoZWQtPm9wcy0+ZnJlZV9qb2Ioam9iKTsKIAkJCXNjaGVk
LT5mcmVlX2d1aWx0eSA9IGZhbHNlOwogCQl9CisJfSBlbHNlIHsKKwkJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKIAl9CiAKIAlzcGluX2xvY2tf
aXJxc2F2ZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsKQEAgLTM3MCw2ICszODMsMjAg
QEAgdm9pZCBkcm1fc2NoZWRfc3RvcChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLCBz
dHJ1Y3QgZHJtX3NjaGVkX2pvYiAqYmFkKQogCWt0aHJlYWRfcGFyayhzY2hlZC0+dGhyZWFkKTsK
IAogCS8qCisJICogUmVpbnNlcnQgYmFjayB0aGUgYmFkIGpvYiBoZXJlIC0gbm93IGl0J3Mgc2Fm
ZSBhcworCSAqIGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2IgY2Fubm90IHJhY2UgYWdhaW5zdCB1
cyBhbmQgcmVsZWFzZSB0aGUKKwkgKiBiYWQgam9iIGF0IHRoaXMgcG9pbnQgLSB3ZSBwYXJrZWQg
KHdhaXRlZCBmb3IpIGFueSBpbiBwcm9ncmVzcworCSAqIChlYXJsaWVyKSBjbGVhbnVwcyBhbmQg
ZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiB3aWxsIG5vdCBiZSBjYWxsZWQKKwkgKiBub3cgdW50
aWwgdGhlIHNjaGVkdWxlciB0aHJlYWQgaXMgdW5wYXJrZWQuCisJICovCisJaWYgKGJhZCAmJiBi
YWQtPnNjaGVkID09IHNjaGVkKQorCQkvKgorCQkgKiBBZGQgYXQgdGhlIGhlYWQgb2YgdGhlIHF1
ZXVlIHRvIHJlZmxlY3QgaXQgd2FzIHRoZSBlYXJsaWVzdAorCQkgKiBqb2IgZXh0cmFjdGVkLgor
CQkgKi8KKwkJbGlzdF9hZGQoJmJhZC0+bm9kZSwgJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0KTsK
KworCS8qCiAJICogSXRlcmF0ZSB0aGUgam9iIGxpc3QgZnJvbSBsYXRlciB0byAgZWFybGllciBv
bmUgYW5kIGVpdGhlciBkZWFjdGl2ZQogCSAqIHRoZWlyIEhXIGNhbGxiYWNrcyBvciByZW1vdmUg
dGhlbSBmcm9tIG1pcnJvciBsaXN0IGlmIHRoZXkgYWxyZWFkeQogCSAqIHNpZ25hbGVkLgotLSAK
Mi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
