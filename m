Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361872034B2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 12:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253D46E25C;
	Mon, 22 Jun 2020 10:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECF06E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQzJVejGDKikbmG3DrXoWXAkE6frQ2Z4I/ah1aj8Nxg=;
 b=ypzU8LmbkabHHkNgz0NTkgBDt1HgW1QRmPI9AO0boPw4IfJHpkPRPnHqVpeY19a7HHln8N2H0q7169lNqM9UFmzh22NzZHDHlWN31sqKpbvCYtPeCVMuumXzRAyYqBhx2qhKK4c4lfFKwpu10SOUWl6yGD4a/AbZ1zzNmHmlgzk=
Received: from AM6P191CA0104.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::45)
 by AM0PR08MB5076.eurprd08.prod.outlook.com (2603:10a6:208:15e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 10:21:01 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::21) by AM6P191CA0104.outlook.office365.com
 (2603:10a6:209:8a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 10:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 10:21:01 +0000
Received: ("Tessian outbound 839770a6d413:v59");
 Mon, 22 Jun 2020 10:21:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3ba10b7f98e1c73
X-CR-MTA-TID: 64aa7808
Received: from b0048e65030b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA60C4DC-C134-41C6-8275-32FEE49663E6.1; 
 Mon, 22 Jun 2020 10:20:55 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0048e65030b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Jun 2020 10:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BE7jK2qno3zO/gZPMMoQaq1UBcXHtKUAe8SDGVP5eiRDc1G+X3ZHrDmTIJMipmYSlbwZaEzUvfWRe3XrKFU7DnZEfhVzoY0G+nfLe5PS/iZucfa4dPGNE4rEN82PjRb1mRz3FQaIAMfQE/yNnwE4px4F0B0VOdEHDcEupoaWJ+3zPGKIhr7HHBOpzd8WzGuF0VADORKA7Dj8cbP84SyDsJBa+9/+XSZgduvLNO9IXXm67VyoOnEvMzRVtM/qZMgtiD2X6ulvm6pyT5VInNHBGKiuFkcl+rrk2jIR08Yq4wITm0O4zQN3JrM1xKHVe9gwYzRBDDtOn/D94s8rbzYjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQzJVejGDKikbmG3DrXoWXAkE6frQ2Z4I/ah1aj8Nxg=;
 b=Fw7+tCDMNsjZE49Ijy7f6FbHfMvrX9d1X0w83/xQIR2fUlig4hmW6x2sgAiDhVM4JQAhELc/xRwPDcQWeKCkl/E4FQwyMOQKGHtXbCwIlechaNHivcnfOiJMyDUw+Yd+qFXqWmb9OGOjfeUd3UJt0YvhUYHIVV17xaC9tuwl7EFK/iot4m9o4DgGcN1UAhejPoghkkf95qWvmd/01Jf67Gb53cDGy2dXr+lY4hhLCZPOaw3yTGdL1OrDjUoe5CxwXem2GPe71yx5VDwhKgA6sII852rkLhRuzSpRRbK6pk2OePl2GruGaHSJAc/+V4N2a2kW3wvMGWSSGXQeTp+X4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQzJVejGDKikbmG3DrXoWXAkE6frQ2Z4I/ah1aj8Nxg=;
 b=ypzU8LmbkabHHkNgz0NTkgBDt1HgW1QRmPI9AO0boPw4IfJHpkPRPnHqVpeY19a7HHln8N2H0q7169lNqM9UFmzh22NzZHDHlWN31sqKpbvCYtPeCVMuumXzRAyYqBhx2qhKK4c4lfFKwpu10SOUWl6yGD4a/AbZ1zzNmHmlgzk=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2889.eurprd08.prod.outlook.com (2603:10a6:7:39::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.25; Mon, 22 Jun 2020 10:20:53 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 10:20:53 +0000
Date: Mon, 22 Jun 2020 11:20:51 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200622102051.ltixr7wchk7npscf@DESKTOP-E1NTVVP.localdomain>
References: <vlSGwy1E6HtqHtZVsFs1gEiN4t9ofmU-YtyumzN0U0DjbusaQj7C3pTFcd0uI9oN_zMCkh0Wb7FxqK6RGtFgGXwHXflBG6bEE-DvjB1vuAI=@emersion.fr>
 <20200619123934.m6mul3sul5rvumfh@DESKTOP-E1NTVVP.localdomain>
 <20200619163617.GU20149@phenom.ffwll.local>
Content-Disposition: inline
In-Reply-To: <20200619163617.GU20149@phenom.ffwll.local>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::27) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LO2P265CA0303.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.25 via Frontend Transport; Mon, 22 Jun 2020 10:20:51 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c80eec8-3adf-43ec-9dae-08d81695f69a
X-MS-TrafficTypeDiagnostic: HE1PR08MB2889:|AM0PR08MB5076:
X-Microsoft-Antispam-PRVS: <AM0PR08MB5076358389896895352E5D19F0970@AM0PR08MB5076.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sQouAW6BQit7+amXD6aEbaRel5abH6KhohBz68ojS3PjS/J+U/WlnwMwAziJ+dZbTsaKKOGZYuOjb9hW1iqRP52Qtn87+7weydiVBAmNLp4qNvrVIWLJ47tFK9pfUT+4lbKfncowtgGlVHKIQupuogX1vIQ1bdh4ll7dHjSvUB9sjYJpMzOm2afQBpsWdY46NhYUb6AA1Rl6Y+fd4VJz6Bau0xqlVy0y+gD/46txTgXON3wZEDhmhfp32f742QDrCOaQc7f4RGAmhjCNQDsbRD8vqaRU3wE07EoWNWQjw6JzVffmWrMqnZh0ZTyk92C/PY04y5H8VNXkOa4MRCb8lnSXUYhyoALaZf2ObcDyh7NL0rax/yxFU5QcUQzM7nge911Y+fWxHn9FcIp66jaWoQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(86362001)(66946007)(966005)(6916009)(956004)(9686003)(55016002)(44832011)(83380400001)(66574015)(16526019)(316002)(26005)(83080400001)(186003)(5660300002)(8936002)(7696005)(52116002)(4326008)(6506007)(478600001)(2906002)(54906003)(1076003)(66556008)(66476007)(7416002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ROASM/xYu/qD6CteYa1YFY2MsFZsvThp0NpDzgm1FY6fn6e0sb2d5GWG6hhlxpYgbP82pPTDK10pafnWD3AZHDJFwddSYFUGVZMPfl/5qjizNIiwWX56WbFNBNoKl3CXSD+4RP8UnFGi45ZjvCJ/+xmvTCsE9QjYasooHRwVjJB9f9bAyHyIaOHDqwxWUPPPyvHIG5Ni/mhmA0rvyr+CD/vyyTkb6dv82XlLlG8bMZ2y71GO3ZBOWcRW4O54zeHdZ8EYhRC7m1l1c4eqwGEK/21eTujJxCDAhXT7VpjrV7S9QNXdrZamTCti5JPA2tbwBdavQAettQkqgeLS+JfvTS9mk4WFk35st8SjMYjpyaEW32rXK2Dxm8CUQtq8p1/NR8i7vYvohQAtpdEgJjQ8bveYjBw+5bHpSa3ufw3SR8P3ZQp2FMMaqUtMs/SFB7/VN6MFtBmsjhvwPg3YsysX6HQNX5Si1Qi55E/gGoAKNKg=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2889
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(82740400003)(1076003)(2906002)(86362001)(8676002)(8936002)(5660300002)(70206006)(4326008)(6862004)(83380400001)(70586007)(478600001)(336012)(7696005)(55016002)(44832011)(9686003)(36906005)(47076004)(66574015)(54906003)(966005)(316002)(356005)(82310400002)(81166007)(26005)(83080400001)(16526019)(186003)(956004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aa64e758-743a-4e07-c852-08d81695f13f
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MkYG2+Nd3a38nCFvNk46ZcZGq4WxXFi7vAx0+gClD/9153/+sEJc9U/utSi5QiGb/WfpuPf1UCel3LoW7Zv8aRkaCiKOW8mgI2InBpTUieUe0LrWkh/cwfBBa7LpWGnWK/VT29uHVtKt4PBTMD8lXXfYi4m+/lvFaFB/E2bO7DQpoU+Py0uYluXAbb5ARd90Lq7yRFEJa/XSTXOaKWTawjiZ7rxXN/op3bKWbq1+LdFjRIwoUwfCVlB9XiRqnitiYXE/qVL0jOSKkMCYysh0Y1xzoAUGE1XHtR7/pL4GYeuJ6FLGoGaZZjos7fLMgMKmNOxGBKeBE08Qhn2+WaSHU0YQUt9wQnLObHWhsHxiU0oh/V8utnpLLQr21q37DoySG5SyGBSm0VGB0OkxZrM0GOQASgsS3ERbrql12mG6PF4Qpm6LaO09Q1WbKO2zl5wTmG8jr9CH14yjdIzp+7YBXWACt6xudHtNfdiAN4B7Mk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 10:21:01.5061 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c80eec8-3adf-43ec-9dae-08d81695f69a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5076
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDY6MzY6MTdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1biAxOSwgMjAyMCBhdCAwMTozOTozNFBNICswMTAwLCBCcmlhbiBT
dGFya2V5IHdyb3RlOgo+ID4gSGkgU2ltb24sCj4gPiAKPiA+IE9uIEZyaSwgSnVuIDE5LCAyMDIw
IGF0IDExOjEyOjI1QU0gKzAwMDAsIFNpbW9uIFNlciB3cm90ZToKPiA+ID4gVGhlcmUgaGF2ZSBz
dWdnZXN0aW9ucyB0byBiYWtlIHBpdGNoIGFsaWdubWVudCwgYWRkcmVzcyBhbGlnbmVtZW50LAo+
ID4gPiBjb250aWd1b3VzIG1lbW9yeSBvciBvdGhlciBwbGFjZW1lbnQgKGhpZGRlbiBWUkFNLCBH
VFQvQkFSLCBldGMpCj4gPiA+IGNvbnN0cmFpbnRzIGludG8gbW9kaWZpZXJzLiBMYXN0IHRpbWUg
dGhpcyB3YXMgYnJvdWdodCB1cCBpdCBzZWVtZWQKPiA+ID4gbGlrZSB0aGUgY29uc2Vuc3VzIHdh
cyB0byBub3QgYWxsb3cgdGhpcy4gRG9jdW1lbnQgdGhpcyBpbiBkcm1fZm91cmNjLmguCj4gPiA+
IAo+ID4gPiBUaGVyZSBhcmUgc2V2ZXJhbCByZWFzb25zIGZvciB0aGlzLgo+ID4gPiAKPiA+ID4g
LSBFbmNvZGluZyBhbGwgb2YgdGhlc2UgY29uc3RyYWludHMgaW4gdGhlIG1vZGlmaWVycyB3b3Vs
ZCBleHBsb2RlIHRoZQo+ID4gPiAgIHNlYXJjaCBzcGFjZSBwcmV0dHkgcXVpY2tseSAod2Ugb25s
eSBoYXZlIDY0IGJpdHMgdG8gd29yayB3aXRoKS4KPiA+ID4gLSBNb2RpZmllcnMgbmVlZCB0byBi
ZSB1bmFtYmlndW91czogYSBidWZmZXIgY2FuIG9ubHkgaGF2ZSBhIHNpbmdsZQo+ID4gPiAgIG1v
ZGlmaWVyLgo+ID4gPiAtIE1vZGlmaWVyIHVzZXJzIGFyZW4ndCBleHBlY3RlZCB0byBwYXJzZSBt
b2RpZmllcnMgKGV4Y2VwdCBkcml2ZXJzKS4KPiA+ID4gCj4gPiA+IHYyOiBhZGQgcGFyYWdyYXBo
IGFib3V0IGFsaWFzZXMgKERhbmllbCkKPiA+ID4gCj4gPiA+IHYzOiBmaXggdW5yZWxhdGVkIGNo
YW5nZXMgc2VudCB3aXRoIHRoZSBwYXRjaAo+ID4gPiAKPiA+ID4gdjQ6IGRpc2FtYmlndWF0ZSB1
c2VycyBiZXR3ZWVuIGRyaXZlciBhbmQgaGlnaGVyLWxldmVsIHByb2dyYW1zIChCcmlhbiwKPiA+
ID4gRGFuaWVsKQo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0
QGVtZXJzaW9uLmZyPgo+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiA+ID4gQ2M6IERhbmllbCBTdG9uZSA8ZGFuaWVsQGZvb2lzaGJhci5v
cmc+Cj4gPiA+IENjOiBCYXMgTmlldXdlbmh1aXplbiA8YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw+
Cj4gPiA+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Cj4gPiA+IENjOiBNYXJl
ayBPbMWhw6FrIDxtYXJhZW9AZ21haWwuY29tPgo+ID4gPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4
ZGV1Y2hlckBnbWFpbC5jb20+Cj4gPiA+IENjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0Bi
YXlsaWJyZS5jb20+Cj4gPiA+IENjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
Pgo+ID4gPiBDYzogQnJpYW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+ID4gPiAt
LS0KPiA+ID4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMjIgKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPiA+ID4g
Cj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPiA+IGluZGV4IDQ5MDE0MzUwMGE1MC4uNGQzZjgx
OWRjYTBiIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+
ID4gPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4gPiBAQCAtNTgsNiAr
NTgsMjggQEAgZXh0ZXJuICJDIiB7Cj4gPiA+ICAgKiBtYXkgcHJlc2VydmUgbWVhbmluZyAtIHN1
Y2ggYXMgbnVtYmVyIG9mIHBsYW5lcyAtIGZyb20gdGhlIGZvdXJjYyBjb2RlLAo+ID4gPiAgICog
d2hlcmVhcyBvdGhlcnMgbWF5IG5vdC4KPiA+ID4gICAqCj4gPiA+ICsgKiBNb2RpZmllcnMgbXVz
dCB1bmlxdWVseSBlbmNvZGUgYnVmZmVyIGxheW91dC4gSW4gb3RoZXIgd29yZHMsIGEgYnVmZmVy
IG11c3QKPiA+ID4gKyAqIG1hdGNoIG9ubHkgYSBzaW5nbGUgbW9kaWZpZXIuIEEgbW9kaWZpZXIg
bXVzdCBub3QgYmUgYSBzdWJzZXQgb2YgbGF5b3V0cyBvZgo+ID4gPiArICogYW5vdGhlciBtb2Rp
Zmllci4gRm9yIGluc3RhbmNlLCBpdCdzIGluY29ycmVjdCB0byBlbmNvZGUgcGl0Y2ggYWxpZ25t
ZW50IGluCj4gPiA+ICsgKiBhIG1vZGlmaWVyOiBhIGJ1ZmZlciBtYXkgbWF0Y2ggYSA2NC1waXhl
bCBhbGlnbmVkIG1vZGlmaWVyIGFuZCBhIDMyLXBpeGVsCj4gPiA+ICsgKiBhbGlnbmVkIG1vZGlm
aWVyLiBUaGF0IHNhaWQsIG1vZGlmaWVycyBjYW4gaGF2ZSBpbXBsaWNpdCBtaW5pbWFsCj4gPiA+
ICsgKiByZXF1aXJlbWVudHMuCj4gPiA+ICsgKgo+ID4gPiArICogRm9yIG1vZGlmaWVycyB3aGVy
ZSB0aGUgY29tYmluYXRpb24gb2YgZm91cmNjIGNvZGUgYW5kIG1vZGlmaWVyIGNhbiBhbGlhcywK
PiA+ID4gKyAqIGEgY2Fub25pY2FsIHBhaXIgbmVlZHMgdG8gYmUgZGVmaW5lZCBhbmQgdXNlZCBi
eSBhbGwgZHJpdmVycy4gQW4gZXhhbXBsZQo+ID4gPiArICogaXMgQUZCQywgd2hlcmUgYm90aCBB
UkdCIGFuZCBBQkdSIGhhdmUgdGhlIGV4YWN0IHNhbWUgY29tcHJlc3NlZCBsYXlvdXQuCj4gPiAK
PiA+IEkgc3RpbGwgZG9uJ3QgYWdyZWUgd2l0aCB0aGlzIHNlbnRlbmNlLiBBUkdCIGFuZCBBQkdS
IGhhdmUgZGlmZmVyZW50Cj4gPiBjb21wcmVzc2VkIGxheW91dHMgaW4gQUZCQy4KPiAKPiBIbSB0
aGVuIG1heWJlIEkgZ290IGNvbmZ1c2VkIGZvciB0aGUgZXhhY3QgcmVhc29uIHdoeSBhZmJjIGhh
cyBkZWZpbmVkCj4gY2Fub25pY2FsIGZvdXJjYyBjb2RlcyBpbiBEb2N1bWVudGF0aW9uL2dwdS9h
ZmJjLnJzdD8gVGhleSBhbGwgdXNlIHRoZQo+IEJHUiB2ZXJzaW9ucywgbm8gUkdCIGFueXdoZXJl
IHRvIGJlIGZvdW5kLgo+IAo+IFdoYXQncyB0aGUgcmVhc29uIHRoZW4gYmVoaW5kIHRoZSAiRm9y
bWF0cyB3aGljaCBhcmUgbm90IGxpc3RlZCBzaG91bGQgYmUKPiBhdm9pZGVkLiIgaW4gdGhhdCBk
b2M/IFRoYXQncyB0aGUgY2FzZSBJIHdhbnRlZCB0byByZWZlciB0byBoZXJlLgoKQmFzaWNhbGx5
IHRoZXJlJ3MgaGFyZHdhcmUgd2hpY2ggc3VwcG9ydHMgb25seSBCR1IsIGhhcmR3YXJlIHdoaWNo
CiJpZ25vcmVzIiBzd2l6emxlICh0cmVhdHMgYWxsIGFzIEJHUiksIGFuZCBoYXJkd2FyZSB3aGlj
aCBzdXBwb3J0cwpib3RoIEJHUiBhbmQgUkdCLiBFdmVuIGFtb25nc3QgZmlyc3QtcGFydHkgaW1w
bGVtZW50YXRpb25zIGl0J3MKaW5jb25zaXN0ZW50LgoKVGhpcyBsZWFkcyB0byBhIHBvdGVudGlh
bGx5IGNvbmZ1c2luZyBzaXR1YXRpb24gd2hlcmUgc29tZW9uZSB3aXRoCmhhcmR3YXJlIHdoaWNo
ICJpZ25vcmVzIiBzd2l6emxlIGFzc3VtZXMgdGhhdCdzIGFsd2F5cyB0aGUgY2FzZS4KClRvIGF2
b2lkIHRoYXQsIHdlIHdhbnRlZCB0byBiZSBleHBsaWNpdCB0aGF0IG9yZGVyaW5nIGlzIGltcG9y
dGFudDoKCiB8IFRoZSBhc3NpZ25tZW50IG9mIGlucHV0L291dHB1dCBjb2xvciBjaGFubmVscyBt
dXN0IGJlIGNvbnNpc3RlbnQKIHwgYmV0d2VlbiB0aGUgZW5jb2RlciBhbmQgdGhlIGRlY29kZXIg
Zm9yIGNvcnJlY3Qgb3BlcmF0aW9uLCBvdGhlcndpc2UKIHwgdGhlIGNvbnN1bWVyIHdpbGwgaW50
ZXJwcmV0IHRoZSBkZWNvZGVkIGRhdGEgaW5jb3JyZWN0bHkuCiB8IC4uLgogfCBUaGUgY29tcG9u
ZW50IG9yZGVyaW5nIGlzIGNvbW11bmljYXRlZCB2aWEgdGhlIGZvdXJjYyBjb2RlIGluIHRoZQog
fCBmb3VyY2M6bW9kaWZpZXIgcGFpci4gSW4gZ2VuZXJhbCwgY29tcG9uZW50ICcwJyBpcyBjb25z
aWRlcmVkIHRvCiB8IHJlc2lkZSBpbiB0aGUgbGVhc3Qtc2lnbmlmaWNhbnQgYml0cyBvZiB0aGUg
Y29ycmVzcG9uZGluZyBsaW5lYXIKIHwgZm9ybWF0LiBGb3IgZXhhbXBsZSwgQ09NUChiaXRzKToK
CkFuZCwgdG8gdHJ5IGFuZCBlbnN1cmUgYmVzdCBjcm9zcyBjb21wYXRpYmlsaXR5LCB3ZSB3YW50
IEJHUiB0byBiZQp1c2VkIG1vc3Qgb2Z0ZW4uIFdlIGV4cGVjdCB0aGF0IHRvIGJlIHN1cHBvcnRl
ZCBieSB0aGUgbW9zdCBoYXJkd2FyZToKCiB8IEZvciBtYXhpbXVtIGNvbXBhdGliaWxpdHkgYWNy
b3NzIGRldmljZXMsIHRoZSB0YWJsZSBiZWxvdyBkZWZpbmVzCiB8IGNhbm9uaWNhbCBmb3JtYXRz
IGZvciB1c2UgYmV0d2VlbiBBRkJDLWVuYWJsZWQgZGV2aWNlcy4gRm9ybWF0cyB3aGljaAogfCBh
cmUgbGlzdGVkIGhlcmUgbXVzdCBiZSB1c2VkIGV4YWN0bHkgYXMgc3BlY2lmaWVkIHdoZW4gdXNp
bmcgdGhlIEFGQkMKIHwgbW9kaWZpZXJzLiBGb3JtYXRzIHdoaWNoIGFyZSBub3QgbGlzdGVkIHNo
b3VsZCBiZSBhdm9pZGVkLgoKQ2hlZXJzLAotQnJpYW4KCj4gLURhbmllbAo+IAo+ID4gCj4gPiBU
aGFua3MsCj4gPiAtQnJpYW4KPiA+IAo+ID4gPiArICoKPiA+ID4gKyAqIFRoZXJlIGFyZSB0d28g
a2luZHMgb2YgbW9kaWZpZXIgdXNlcnM6Cj4gPiA+ICsgKgo+ID4gPiArICogLSBLZXJuZWwgYW5k
IHVzZXItc3BhY2UgZHJpdmVyczogZm9yIGRyaXZlcnMgaXQncyBpbXBvcnRhbnQgdGhhdCBtb2Rp
ZmllcnMKPiA+ID4gKyAqICAgZG9uJ3QgYWxpYXMsIG90aGVyd2lzZSB0d28gZHJpdmVycyBtaWdo
dCBzdXBwb3J0IHRoZSBzYW1lIGZvcm1hdCBidXQgdXNlCj4gPiA+ICsgKiAgIGRpZmZlcmVudCBh
bGlhc2VzLCBwcmV2ZW50aW5nIHRoZW0gZnJvbSBzaGFyaW5nIGJ1ZmZlcnMgaW4gYW4gZWZmaWNp
ZW50Cj4gPiA+ICsgKiAgIGZvcm1hdC4KPiA+ID4gKyAqIC0gSGlnaGVyLWxldmVsIHByb2dyYW1z
IGludGVyZmFjaW5nIHdpdGggS01TL0dCTS9FR0wvVnVsa2FuL2V0YzogdGhlc2UgdXNlcnMKPiA+
ID4gKyAqICAgc2VlIG1vZGlmaWVycyBhcyBvcGFxdWUgdG9rZW5zIHRoZXkgY2FuIGNoZWNrIGZv
ciBlcXVhbGl0eSBhbmQgaW50ZXJzZWN0Lgo+ID4gPiArICogICBUaGVzZSB1c2VycyBtdXNuJ3Qg
bmVlZCB0byBrbm93IHRvIHJlYXNvbiBhYm91dCB0aGUgbW9kaWZpZXIgdmFsdWUKPiA+ID4gKyAq
ICAgKGkuZS4gdGhleSBhcmUgbm90IGV4cGVjdGVkIHRvIGV4dHJhY3QgaW5mb3JtYXRpb24gb3V0
IG9mIHRoZSBtb2RpZmllcikuCj4gPiA+ICsgKgo+ID4gPiAgICogVmVuZG9ycyBzaG91bGQgZG9j
dW1lbnQgdGhlaXIgbW9kaWZpZXIgdXNhZ2UgaW4gYXMgbXVjaCBkZXRhaWwgYXMKPiA+ID4gICAq
IHBvc3NpYmxlLCB0byBlbnN1cmUgbWF4aW11bSBjb21wYXRpYmlsaXR5IGFjcm9zcyBkZXZpY2Vz
LCBkcml2ZXJzIGFuZAo+ID4gPiAgICogYXBwbGljYXRpb25zLgo+ID4gPiAtLSAKPiA+ID4gMi4y
Ny4wCj4gPiA+IAo+ID4gPiAKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
