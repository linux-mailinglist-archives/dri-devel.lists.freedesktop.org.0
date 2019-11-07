Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A6F2DA0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 12:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1BF6F65F;
	Thu,  7 Nov 2019 11:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C036F661
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:42:43 +0000 (UTC)
Received: from VI1PR08CA0195.eurprd08.prod.outlook.com (2603:10a6:800:d2::25)
 by VE1PR08MB5184.eurprd08.prod.outlook.com (2603:10a6:803:105::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Thu, 7 Nov
 2019 11:42:40 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR08CA0195.outlook.office365.com
 (2603:10a6:800:d2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Thu, 7 Nov 2019 11:42:40 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Thu, 7 Nov 2019 11:42:39 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Thu, 07 Nov 2019 11:42:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4826ba7dcdbc61c1
X-CR-MTA-TID: 64aa7808
Received: from d74b0305b8f4.2 (cr-mta-lb-1.cr-mta-net [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BDC9ABAD-C30F-491D-856C-536121798DAD.1; 
 Thu, 07 Nov 2019 11:42:34 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d74b0305b8f4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Nov 2019 11:42:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMnaPiy0w03Jr9WS7EMWxfqGW73SdCFfHrDUm8OLTZUwW4Hlq19R+r5MvbZqwCZBKAHM1z1pcTDaQMMNEbIzoC7Jm/T4WaObBQakc0shhAIcnY2NF3CVy+fUhgmONqdPSrvJgvKJEkl8P4gtHowhrX6xK0cnLlfH7/Nd4wAzNjnTjCB+ZweAUEphZYnqEBqAuMXFSsn8iaFiqh23N/XCDfi4YeMl/M/Xe0o+8X2cQIumOycTzKRUmdSNCkAv3gD+Oz/lR6IEmzuBqLbJxrKAZeG7c5UsMaPsxFFSKFC7QnWOYgwrH44qfVAyqdtmCb6bOZptP+G12TovfqcuMMj4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+b3iYlLZWzR/gv7TQUT6UmWjYNPax9/PEPOebKvxCHE=;
 b=btguVs0hRqaSOsyFxyWwZh44IDJN3O06f1Q/GwUWsyh95on2KRNP6L+jdztith65ZpcYcomJT7Pzwc7858UX9IqHO7gkbg50I789EEJhngHwJI8Gs6R6rPjQ7J/lFdHS8TYUQI8+WD/tIAH+vEdLuiNi+SLyyuYznDKX0fsnHODJon3ezRvbq1gRlG6TDjWrVn0MPSYBupfQy5PeaVMVaTtnUxgy9XnLfwAsUI2oQgUJ1rBn6iDD7iASIG5XdAb3LPVBrFgrjHvALuy0aFqBzOGXuZ/0QE2jaO/Vpt7CPNAtEzV1f6XrW+VlDHAc3hcev3JED3Ly+fuzSJFdp2UGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4351.eurprd08.prod.outlook.com (20.179.27.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 11:42:33 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 11:42:33 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/5] drm/komeda: Remove CONFIG_KOMEDA_ERROR_PRINT
Thread-Topic: [PATCH v2 2/5] drm/komeda: Remove CONFIG_KOMEDA_ERROR_PRINT
Thread-Index: AQHVlWBx2XXtfB7TZUW+rZWpSHV87g==
Date: Thu, 7 Nov 2019 11:42:32 +0000
Message-ID: <20191107114155.54307-3-mihail.atanassov@arm.com>
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
In-Reply-To: <20191107114155.54307-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72c334e0-31ca-4398-8e81-08d7637797fc
X-MS-TrafficTypeDiagnostic: VI1PR08MB4351:|VI1PR08MB4351:|VE1PR08MB5184:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB518407AAFCCA17614A6648858F780@VE1PR08MB5184.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1051;OLM:1051;
x-forefront-prvs: 0214EB3F68
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(11346002)(316002)(54906003)(446003)(476003)(50226002)(71200400001)(6512007)(305945005)(6916009)(2906002)(8936002)(2616005)(44832011)(4326008)(6436002)(66066001)(256004)(486006)(86362001)(26005)(71190400001)(36756003)(52116002)(2351001)(14444005)(6506007)(99286004)(6486002)(102836004)(2501003)(76176011)(386003)(186003)(6116002)(14454004)(66946007)(66476007)(66556008)(64756008)(66446008)(25786009)(478600001)(1076003)(3846002)(8676002)(81166006)(81156014)(7736002)(5640700003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4351;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ZZZB3el+pAAntxthtfbiPspqYYl/hnAHWMIbzr0q83FvDdB7TnteaNCxSwfAw/RHFReQfAtUyrbVHkRdoO24YWNr2SJIxFcmKjrVNDJ3I0ko2IdQqu1hcZTvUxLsD3SMgxF/HuZvHrcfigy7jkH9Gk3KzSl2YY34NI3SDMdAdCxFOK18Zm3X/BpqWeCdOr4atQpn4KrHe3z6IuQrHg5zDguIOC3u0t1Erko0uu69Q0EfDgwcf57HjfRmRBEIRPGwqR/G+r5/1VNCka92XYpYIbfrFC6SHUpEKz6oROCNyG47LYDC+FUpoTUsPvWNqt/NmkkGCdwT/+j83rzjOsGmbsrvLmnlcUQrQSlqhutAcfF4r2xmy+4JMoHYSjBh/Cc4Fr+21ZoK/YWuJDhgG+R65chltd9ku+zOngN60YUHBovMjBy2OOf2b9TlKkzLZlJR
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4351
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(1110001)(339900001)(199004)(189003)(23756003)(26005)(8746002)(14444005)(446003)(2351001)(3846002)(70586007)(6916009)(81156014)(476003)(1076003)(81166006)(8936002)(11346002)(22756006)(186003)(386003)(356004)(6506007)(336012)(6116002)(14454004)(2616005)(2501003)(8676002)(2906002)(102836004)(50226002)(25786009)(6512007)(76176011)(126002)(26826003)(316002)(5640700003)(105606002)(7736002)(99286004)(76130400001)(305945005)(478600001)(6486002)(5660300002)(36756003)(86362001)(54906003)(47776003)(486006)(70206006)(4326008)(66066001)(107886003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5184;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e53b8a69-a7f0-44bf-589a-08d7637793a7
NoDisclaimer: True
X-Forefront-PRVS: 0214EB3F68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P1rObSokGVQi+ZklcMvikf3pttwkyUbObtXbUaZ+dOQQQL14ODuxxHANL+RJ3Cc6+fPo/HrISelxYtdsnnySPRbThWdf5aA9PmSSDHNW/SJyIzCX8CrvQq+uGz7gJqv8VslRUB1qdta4iIg58+5+JhBIQt1xUeDTsJlbeRRgfqMaZd4HUGI+z0JZKKxQsu0AQoTfIAhKQKLLxj7mj6DN3jLJHVcLjzg2P1hFZt649m9LtmAHcLj+x/9t1vJ5Ow9a0NVYUSPXHedq94FJCCU8xprtvYrSMuJMlpiJY2FxBSi62h+yrtzhw2AxkF975ShkqfOSTXO4AAUg7Vx7mhGY9BbAdU1gDGYqkgcnzDbtmeL8sVejuggEprRu0ApZM80SAtTE3EZ16GqUISs5FS7EKXvZS2oH99HA1lD4aE+iidFgbWAT2tJ1fGEHmOdZQ37f
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 11:42:39.7763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c334e0-31ca-4398-8e81-08d7637797fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5184
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+b3iYlLZWzR/gv7TQUT6UmWjYNPax9/PEPOebKvxCHE=;
 b=OpbLGSyvQz6d0KOmYEkm2f3VyTunopVEoT9Oc1W88pmJdminO/AqbC1hOkoxdNe3cUIn7MTV5W/fnKfm8rmUxZiVt9seYrVs4J28kBcatocqtwV+gN3Uo4S/r/O507H0+7A/o0IfKJRwfUucpts487lI6852wFqmOrR84KEK3Vs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+b3iYlLZWzR/gv7TQUT6UmWjYNPax9/PEPOebKvxCHE=;
 b=OpbLGSyvQz6d0KOmYEkm2f3VyTunopVEoT9Oc1W88pmJdminO/AqbC1hOkoxdNe3cUIn7MTV5W/fnKfm8rmUxZiVt9seYrVs4J28kBcatocqtwV+gN3Uo4S/r/O507H0+7A/o0IfKJRwfUucpts487lI6852wFqmOrR84KEK3Vs=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlcmUncyBhIGRlYnVnZnMgbm9kZSB0byBjb250cm9sIHRoZSBzYW1lLCByZW1v
dmUgdGhlCmNvbmZpZyBvcHRpb24uCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5
OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcgICAgICAgICAgICAgfCA2IC0tLS0tLQogZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZSAgICAgfCA1ICsrLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCB8IDYgLS0tLS0t
CiAzIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkvS2NvbmZpZwppbmRleCBlODdmZjg2MjMwNzYuLmNlYzA2MzllM2Fh
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcKQEAgLTEyLDkgKzEyLDMgQEAgY29u
ZmlnIERSTV9LT01FREEKIAkgIFByb2Nlc3NvciBkcml2ZXIuIEl0IHN1cHBvcnRzIHRoZSBENzEg
dmFyaWFudHMgb2YgdGhlIGhhcmR3YXJlLgogCiAJICBJZiBjb21waWxlZCBhcyBhIG1vZHVsZSBp
dCB3aWxsIGJlIGNhbGxlZCBrb21lZGEuCi0KLWNvbmZpZyBEUk1fS09NRURBX0VSUk9SX1BSSU5U
Ci0JYm9vbCAiRW5hYmxlIGtvbWVkYSBlcnJvciBwcmludCIKLQlkZXBlbmRzIG9uIERSTV9LT01F
REEKLQloZWxwCi0JICBDaG9vc2UgdGhpcyBvcHRpb24gdG8gZW5hYmxlIGVycm9yIHByaW50aW5n
LgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmls
ZSBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUKaW5kZXggZjA5
NWExYzY4YWM3Li4xOTMxYTdmYTFhMTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9NYWtlZmlsZQpAQCAtMTYsMTIgKzE2LDExIEBAIGtvbWVkYS15IDo9IFwKIAlrb21l
ZGFfY3J0Yy5vIFwKIAlrb21lZGFfcGxhbmUubyBcCiAJa29tZWRhX3diX2Nvbm5lY3Rvci5vIFwK
LQlrb21lZGFfcHJpdmF0ZV9vYmoubworCWtvbWVkYV9wcml2YXRlX29iai5vIFwKKwlrb21lZGFf
ZXZlbnQubwogCiBrb21lZGEteSArPSBcCiAJZDcxL2Q3MV9kZXYubyBcCiAJZDcxL2Q3MV9jb21w
b25lbnQubwogCi1rb21lZGEtJChDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9QUklOVCkgKz0ga29t
ZWRhX2V2ZW50Lm8KLQogb2JqLSQoQ09ORklHX0RSTV9LT01FREEpICs9IGtvbWVkYS5vCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IGI1
YmQzZDU4OThlZS4uODMxYzM3NTE4MGY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaApAQCAtMjI2LDEzICsyMjYsNyBAQCB2b2lkIGtvbWVk
YV9kZXZfZGVzdHJveShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CiAKIHN0cnVjdCBrb21lZGFf
ZGV2ICpkZXZfdG9fbWRldihzdHJ1Y3QgZGV2aWNlICpkZXYpOwogCi0jaWZkZWYgQ09ORklHX0RS
TV9LT01FREFfRVJST1JfUFJJTlQKIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29t
ZWRhX2V2ZW50cyAqZXZ0cywgc3RydWN0IGRybV9kZXZpY2UgKmRldik7Ci0jZWxzZQotc3RhdGlj
IGlubGluZSB2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2
dHMsCi0JCQkJICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCi17fQotI2VuZGlmCiAKIGlu
dCBrb21lZGFfZGV2X3Jlc3VtZShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CiBpbnQga29tZWRh
X2Rldl9zdXNwZW5kKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KTsKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
