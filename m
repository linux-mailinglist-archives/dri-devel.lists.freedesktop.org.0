Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53785207470
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BD86EB41;
	Wed, 24 Jun 2020 13:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10056.outbound.protection.outlook.com [40.107.1.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001636EB41
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lSv1e4smJRMcXlMxx+0lSuvsYDFs0kmxfalW+WkqQI=;
 b=82OJykcCjVDWYTmIsTN2VxIzC/enmVKXl0Ti9ibWQhCfggKkoQsM+DrhhIsZozUMjsaADrXeAm8pOtHUMMYnIxj3VZmVYX9ot1jMGVNEz3rdXbMcxCt6x1RNL1O87g5Pa68boAk6M6nhsmZhYlesjxzDtLmSovkJIri05iWclR4=
Received: from AM6PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:92::15)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 13:27:04 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::d5) by AM6PR04CA0002.outlook.office365.com
 (2603:10a6:20b:92::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Wed, 24 Jun 2020 13:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 13:27:03 +0000
Received: ("Tessian outbound 022d32fb9a40:v59");
 Wed, 24 Jun 2020 13:27:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a5130c5a9f1281e7
X-CR-MTA-TID: 64aa7808
Received: from ef6353c76fc5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78C6A35F-7E1D-4E9A-8ED9-54BD937B656E.1; 
 Wed, 24 Jun 2020 13:26:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef6353c76fc5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Jun 2020 13:26:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsprRFMDf7DDXF7l0NYFMTi1B64k07Gtv7nlF3FYypjDMUN1DL67/uaPY4LWwH3da/epsSvT9O5O7m6RzcE+DPNixUZ5nhj+lnqqwsCTfYM+nmFh99s/f7Wj1vGa9hI76FHYyORpNrpRs7Ng07QyS1ePeRRIv3QEXRqjYko6jyOMv7xLct9jkn9cnDBCeQCfia72uqi7ynTEH/uo4B/F0vnE4pveC8gegV2s4WfqIrmr4nciLCk+qU9a68jdMalpHePgaU1ADtfEyRH2qk1sf06PnJ1+wQtIY979pGZXBFwjnqwQuj4gZFEI255jKGbg5etms5s3TiSqW3HstrNY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lSv1e4smJRMcXlMxx+0lSuvsYDFs0kmxfalW+WkqQI=;
 b=l1EDc0l9X3k7ozDb4i6xXUAY2fq1j2P21v6mUgzeEjs3zafpjTSSEYB3Wwh1ime+UT8cZl/3TGV+GqaHKqY8fVW/FqifKzWvzhTKJ45XHjtthMlkIXEYaY8Psaurh2fqlHPdCs5YaIho1R47Eto/iJxPz3XVGuAG1J4CJIekwDKXpEFZCfK/5WDV6+yLEKA9kGN9Y14ZprSBzqCb306hV2oFXL3LJVCpWOYBKbHKFXbOfxDeB+x6IlJvG6OINuo0sxWE78NIm1geD3QHTNTAK7kD8pYJlS7WK2op3B3NqHsW/AmClDybsa3Ip7hPPN3CR0K6sW3MBsWO57jH45GK4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lSv1e4smJRMcXlMxx+0lSuvsYDFs0kmxfalW+WkqQI=;
 b=82OJykcCjVDWYTmIsTN2VxIzC/enmVKXl0Ti9ibWQhCfggKkoQsM+DrhhIsZozUMjsaADrXeAm8pOtHUMMYnIxj3VZmVYX9ot1jMGVNEz3rdXbMcxCt6x1RNL1O87g5Pa68boAk6M6nhsmZhYlesjxzDtLmSovkJIri05iWclR4=
Authentication-Results-Original: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com (2603:10a6:7:36::11) by
 HE1PR08MB2825.eurprd08.prod.outlook.com (2603:10a6:7:35::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20; Wed, 24 Jun 2020 13:26:55 +0000
Received: from HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2]) by HE1PR08MB2890.eurprd08.prod.outlook.com
 ([fe80::18de:2773:77b4:4ce2%7]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 13:26:55 +0000
Date: Wed, 24 Jun 2020 14:26:55 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6] drm/fourcc: document modifier uniqueness requirements
Message-ID: <20200624132655.z53t3y74he3l4kos@DESKTOP-E1NTVVP.localdomain>
References: <MGwgeXojKNdNXjCxuMhRlwcJM4vdYph_WJcMeGPPGMcRKtHV41XAXlh2tCc-pPJZCAhS3gwbWMWTd8f03NBA2ZYKfr0QxLhcPivpopr5c6M=@emersion.fr>
Content-Disposition: inline
In-Reply-To: <MGwgeXojKNdNXjCxuMhRlwcJM4vdYph_WJcMeGPPGMcRKtHV41XAXlh2tCc-pPJZCAhS3gwbWMWTd8f03NBA2ZYKfr0QxLhcPivpopr5c6M=@emersion.fr>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::14) To HE1PR08MB2890.eurprd08.prod.outlook.com
 (2603:10a6:7:36::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Wed, 24 Jun 2020 13:26:54 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 58afcea7-14bf-48e9-8280-08d8184248a5
X-MS-TrafficTypeDiagnostic: HE1PR08MB2825:|DBBPR08MB4538:
X-Microsoft-Antispam-PRVS: <DBBPR08MB4538C6B569FB9D5D528DA4F5F0950@DBBPR08MB4538.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zUd+RpXhxHIKkUQhXpPDvCo0j0JgJ0FOGS7I/trkk5TGBJUtT2Kxbe0sp5/HPV/f2FWh2QqB3HjE6WuMih4E8V/w22sL9/xh+L65rrnwQP447uJaIaYfNpu8b4bLbry5rFzSPR6ix0j3I3AYBKqDhCJosX7iLNC/emhNOLS3Cmu2ps0hzgSFd/NszZJ5obT+hap/tlA+NpPsL2jd6AZL0v5zt5QjF9b20q8IBcLA6mMQ/sqa4PwK0x+/RrZTGNT6ToO7XnSorLz6YSjPbfDO8VWjjRs28JzhoGNQDnzcGBw2OVsAnCgzK7CVa3OjAJ/0z5JOa7G9z20Cem5lY7fDnQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HE1PR08MB2890.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(66476007)(66556008)(66946007)(1076003)(8676002)(4326008)(478600001)(8936002)(44832011)(2906002)(16526019)(186003)(66574015)(26005)(55016002)(52116002)(6916009)(7696005)(5660300002)(54906003)(316002)(9686003)(956004)(6506007)(7416002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7c+1mp+D8yXNDB7G5Ge7scGBB5CM5RkOqjai6h5WZqqHGCSyeiQyxCYQAERNIHI6aV+StIRKxOPrFq5s+u3fBd+7FU7wP8QvbwRLEd4eFwT1k8zGxcsKQRu6lYtjc2aMH/RsK1+uIOcXtSeuGPe9Wy56/lt9m9S2Nd5skmEaBgdzmwSZUw09GNUsTL/Z59+KNYMlyOIirrdhEHHRZhfd5qmz4vbBbQqUyxSg2/lPbjMXo5n0iSr7hfAAP3rjB63UvbkYS3nnvU5SwkaUgdbui9RLbRwoOXud09q+2Ud1cK4WxDkhVYL1/tO2anqoKPFal4AarPT0eGH1itTIJKlb5YHsillZPL7mrfirXCpELHo2eTw8DX0RzWJu50/gcTxuFju/P2mS20rL3srykjSoqpglrXIgYSRoHaGzUlwpWsHQRkmziS32oY19FQsCSJwD3U/UeqoXtWRuLcftJb7UmZpHgTDCJD2xzsDsh0vfaTKnTF5I0eejqW9boVp3F31f
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2825
Original-Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(6506007)(44832011)(5660300002)(186003)(356005)(8676002)(316002)(54906003)(478600001)(86362001)(82740400003)(36906005)(4326008)(6862004)(26005)(82310400002)(55016002)(47076004)(2906002)(81166007)(7696005)(70586007)(9686003)(8936002)(70206006)(956004)(1076003)(336012)(16526019)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c4b88d1d-5aac-4479-4b61-08d81842439e
X-Forefront-PRVS: 0444EB1997
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K+shl6XR7I9S++KkL7vv55Y7rVY1Y+CGf+8UewpGMiVkyNRE99+NiuWx9UoyMbswfFzuTUmZ+TAxHg0mICn1LuZDZtI5WWeDoBFQdYdyL2BD6jK7ZNBjrj5sg+oDHtpc62b0Jbo5EvVVSm4c6trh/t5BcujT6Yt6GZ5xB6gU/c3+Lbg0rLSf1vP85YnWSRptQYMnXJjCIEoPhQ9VUxC5kRGfdj/vKeZg4Ljqf36N04ZCyB8/nl7xs7aeMjalSHjd4ZGCIVCgHkrEsraNJGV9KApJotnc6FZ832/L+M4kymcKaxWvjuIv4vIttSV0TItM3xAnA8/iwATf2NkHLko5BWUFv1MlEK6ByTPclaNw63rQtSqjVxqpmLKp8RagiOBqktF6uU2uDmJp27WIChijqA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 13:27:03.7985 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58afcea7-14bf-48e9-8280-08d8184248a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4538
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCBub3csIHRoYW5rcyEKCk9uIFdlZCwgSnVuIDI0LCAyMDIwIGF0IDAxOjAxOjMx
UE0gKzAwMDAsIFNpbW9uIFNlciB3cm90ZToKPiBUaGVyZSBoYXZlIHN1Z2dlc3Rpb25zIHRvIGJh
a2UgcGl0Y2ggYWxpZ25tZW50LCBhZGRyZXNzIGFsaWduZW1lbnQsCj4gY29udGlndW91cyBtZW1v
cnkgb3Igb3RoZXIgcGxhY2VtZW50IChoaWRkZW4gVlJBTSwgR1RUL0JBUiwgZXRjKQo+IGNvbnN0
cmFpbnRzIGludG8gbW9kaWZpZXJzLiBMYXN0IHRpbWUgdGhpcyB3YXMgYnJvdWdodCB1cCBpdCBz
ZWVtZWQKPiBsaWtlIHRoZSBjb25zZW5zdXMgd2FzIHRvIG5vdCBhbGxvdyB0aGlzLiBEb2N1bWVu
dCB0aGlzIGluIGRybV9mb3VyY2MuaC4KPiAKPiBUaGVyZSBhcmUgc2V2ZXJhbCByZWFzb25zIGZv
ciB0aGlzLgo+IAo+IC0gRW5jb2RpbmcgYWxsIG9mIHRoZXNlIGNvbnN0cmFpbnRzIGluIHRoZSBt
b2RpZmllcnMgd291bGQgZXhwbG9kZSB0aGUKPiAgIHNlYXJjaCBzcGFjZSBwcmV0dHkgcXVpY2ts
eSAod2Ugb25seSBoYXZlIDY0IGJpdHMgdG8gd29yayB3aXRoKS4KPiAtIE1vZGlmaWVycyBuZWVk
IHRvIGJlIHVuYW1iaWd1b3VzOiBhIGJ1ZmZlciBjYW4gb25seSBoYXZlIGEgc2luZ2xlCj4gICBt
b2RpZmllci4KPiAtIE1vZGlmaWVyIHVzZXJzIGFyZW4ndCBleHBlY3RlZCB0byBwYXJzZSBtb2Rp
ZmllcnMgKGV4Y2VwdCBkcml2ZXJzKS4KPiAKPiB2MjogYWRkIHBhcmFncmFwaCBhYm91dCBhbGlh
c2VzIChEYW5pZWwpCj4gCj4gdjM6IGZpeCB1bnJlbGF0ZWQgY2hhbmdlcyBzZW50IHdpdGggdGhl
IHBhdGNoCj4gCj4gdjQ6IGRpc2FtYmlndWF0ZSB1c2VycyBiZXR3ZWVuIGRyaXZlciBhbmQgaGln
aGVyLWxldmVsIHByb2dyYW1zIChCcmlhbiwKPiBEYW5pZWwpCj4gCj4gdjU6IGZpeCBBRkJDIGV4
YW1wbGUgKEJyaWFuLCBEYW5pZWwpCj4gCj4gdjY6IHJlbW92ZSBkdXBsaWNhdGVkIHBhcmFncmFw
aCAoRGFuaWVsKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lv
bi5mcj4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KPiBDYzogRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4KPiBDYzogQmFzIE5p
ZXV3ZW5odWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgo+IENjOiBEYXZlIEFpcmxpZSA8
YWlybGllZEBnbWFpbC5jb20+Cj4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmFlb0BnbWFpbC5jb20+
Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPgo+IENjOiBOZWlsIEFy
bXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IE1pY2hlbCBEw6RuemVyIDxt
aWNoZWxAZGFlbnplci5uZXQ+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJt
LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAyNCArKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3Vh
cGkvZHJtL2RybV9mb3VyY2MuaAo+IGluZGV4IDQ5MDE0MzUwMGE1MC4uOGVhYTE1OGZlZjgxIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gKysrIGIvaW5jbHVk
ZS91YXBpL2RybS9kcm1fZm91cmNjLmgKPiBAQCAtNTgsNiArNTgsMzAgQEAgZXh0ZXJuICJDIiB7
Cj4gICAqIG1heSBwcmVzZXJ2ZSBtZWFuaW5nIC0gc3VjaCBhcyBudW1iZXIgb2YgcGxhbmVzIC0g
ZnJvbSB0aGUgZm91cmNjIGNvZGUsCj4gICAqIHdoZXJlYXMgb3RoZXJzIG1heSBub3QuCj4gICAq
Cj4gKyAqIE1vZGlmaWVycyBtdXN0IHVuaXF1ZWx5IGVuY29kZSBidWZmZXIgbGF5b3V0LiBJbiBv
dGhlciB3b3JkcywgYSBidWZmZXIgbXVzdAo+ICsgKiBtYXRjaCBvbmx5IGEgc2luZ2xlIG1vZGlm
aWVyLiBBIG1vZGlmaWVyIG11c3Qgbm90IGJlIGEgc3Vic2V0IG9mIGxheW91dHMgb2YKPiArICog
YW5vdGhlciBtb2RpZmllci4gRm9yIGluc3RhbmNlLCBpdCdzIGluY29ycmVjdCB0byBlbmNvZGUg
cGl0Y2ggYWxpZ25tZW50IGluCj4gKyAqIGEgbW9kaWZpZXI6IGEgYnVmZmVyIG1heSBtYXRjaCBh
IDY0LXBpeGVsIGFsaWduZWQgbW9kaWZpZXIgYW5kIGEgMzItcGl4ZWwKPiArICogYWxpZ25lZCBt
b2RpZmllci4gVGhhdCBzYWlkLCBtb2RpZmllcnMgY2FuIGhhdmUgaW1wbGljaXQgbWluaW1hbAo+
ICsgKiByZXF1aXJlbWVudHMuCj4gKyAqCj4gKyAqIEZvciBtb2RpZmllcnMgd2hlcmUgdGhlIGNv
bWJpbmF0aW9uIG9mIGZvdXJjYyBjb2RlIGFuZCBtb2RpZmllciBjYW4gYWxpYXMsCj4gKyAqIGEg
Y2Fub25pY2FsIHBhaXIgbmVlZHMgdG8gYmUgZGVmaW5lZCBhbmQgdXNlZCBieSBhbGwgZHJpdmVy
cy4gUHJlZmVycmVkCj4gKyAqIGNvbWJpbmF0aW9ucyBhcmUgYWxzbyBlbmNvdXJhZ2VkIHdoZXJl
IGFsbCBjb21iaW5hdGlvbnMgbWlnaHQgbGVhZCB0bwo+ICsgKiBjb25mdXNpb24gYW5kIHVubmVj
ZXNzYXJpbHkgcmVkdWNlZCBpbnRlcm9wZXJhYmlsaXR5LiBBbiBleGFtcGxlIGZvciB0aGUKPiAr
ICogbGF0dGVyIGlzIEFGQkMsIHdoZXJlIHRoZSBBQkdSIGxheW91dHMgYXJlIHByZWZlcnJlZCBv
dmVyIEFSR0IgbGF5b3V0cy4KPiArICoKPiArICogVGhlcmUgYXJlIHR3byBraW5kcyBvZiBtb2Rp
ZmllciB1c2VyczoKPiArICoKPiArICogLSBLZXJuZWwgYW5kIHVzZXItc3BhY2UgZHJpdmVyczog
Zm9yIGRyaXZlcnMgaXQncyBpbXBvcnRhbnQgdGhhdCBtb2RpZmllcnMKPiArICogICBkb24ndCBh
bGlhcywgb3RoZXJ3aXNlIHR3byBkcml2ZXJzIG1pZ2h0IHN1cHBvcnQgdGhlIHNhbWUgZm9ybWF0
IGJ1dCB1c2UKPiArICogICBkaWZmZXJlbnQgYWxpYXNlcywgcHJldmVudGluZyB0aGVtIGZyb20g
c2hhcmluZyBidWZmZXJzIGluIGFuIGVmZmljaWVudAo+ICsgKiAgIGZvcm1hdC4KPiArICogLSBI
aWdoZXItbGV2ZWwgcHJvZ3JhbXMgaW50ZXJmYWNpbmcgd2l0aCBLTVMvR0JNL0VHTC9WdWxrYW4v
ZXRjOiB0aGVzZSB1c2Vycwo+ICsgKiAgIHNlZSBtb2RpZmllcnMgYXMgb3BhcXVlIHRva2VucyB0
aGV5IGNhbiBjaGVjayBmb3IgZXF1YWxpdHkgYW5kIGludGVyc2VjdC4KPiArICogICBUaGVzZSB1
c2VycyBtdXNuJ3QgbmVlZCB0byBrbm93IHRvIHJlYXNvbiBhYm91dCB0aGUgbW9kaWZpZXIgdmFs
dWUKPiArICogICAoaS5lLiB0aGV5IGFyZSBub3QgZXhwZWN0ZWQgdG8gZXh0cmFjdCBpbmZvcm1h
dGlvbiBvdXQgb2YgdGhlIG1vZGlmaWVyKS4KPiArICoKPiAgICogVmVuZG9ycyBzaG91bGQgZG9j
dW1lbnQgdGhlaXIgbW9kaWZpZXIgdXNhZ2UgaW4gYXMgbXVjaCBkZXRhaWwgYXMKPiAgICogcG9z
c2libGUsIHRvIGVuc3VyZSBtYXhpbXVtIGNvbXBhdGliaWxpdHkgYWNyb3NzIGRldmljZXMsIGRy
aXZlcnMgYW5kCj4gICAqIGFwcGxpY2F0aW9ucy4KPiAtLSAKPiAyLjI3LjAKPiAKPiAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
