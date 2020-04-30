Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725AD1BF584
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 12:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88896E20D;
	Thu, 30 Apr 2020 10:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50266E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q8s0Y9Gsm1jaQUmkY6qvm4EWST15h9bzVVUwuk9bMM=;
 b=w0MXYhqeupCts7UReHFI0Z97RaGNk79Uffvx0TUosQW/F6FlKwcJzMTlR7oG2GvR30WS9sLeEwoxW3o8Q5pdDp93XUzXN1HQS/LH317NkcH3Ps02ITlhyhl+jQa9uo2Q6JTNOj0lruoVZ+bYgHNvvV14Tn0+EKAPe1qoVx1MkEM=
Received: from AM6PR0502CA0060.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::37) by AM0PR08MB3907.eurprd08.prod.outlook.com
 (2603:10a6:208:109::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 10:30:19 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::1) by AM6PR0502CA0060.outlook.office365.com
 (2603:10a6:20b:56::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 10:30:19 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 10:30:17 +0000
Received: ("Tessian outbound 4cdf5642225a:v54");
 Thu, 30 Apr 2020 10:30:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7f1e4cca0957245
X-CR-MTA-TID: 64aa7808
Received: from eba11c543ab8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DBA335E6-54E1-4F7B-8D84-FD6C65824BAF.1; 
 Thu, 30 Apr 2020 10:30:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eba11c543ab8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Apr 2020 10:30:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcjGiERmI5KKLHfXIgSUL9SUfikn48EAQJicvNG6jYdmhtpVjJo5v4MIwAg/F3cbfvWXG1FfT+PjcKHhx0GbZFdAwn9n5TEAWbUxCeVhboRr0DeqlWwXYw8LtkzNhkb7A28qFTytXudiFCR9+t/uwtBwULrtWRFJ6gui9axpSgOSCmPJ2Vf9g4Ze77i661fNvKzBC80a+Sz+z71kuZnsS1UB/Gpve3gjW7kj8jE+VnNavV2N8mITHo8ODpCpomE1bYNjuM+UAmNiC0ZzW2yfi5VyH3PiRWXbfISwf0eBuL2Yu1EPiwEihfDe001xTPCI7JHKOTMnl2R31dWACWnbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q8s0Y9Gsm1jaQUmkY6qvm4EWST15h9bzVVUwuk9bMM=;
 b=bCTyNbgVHGlR4y/gyCFTI+B6QIVyasepYzhkeJw3Fn5zYskOjoGhNFjD7r3CIJlx50Ix0aBoziDtmM4EwU7f+IkPVG4NLgQ/FKltvtd/JGmpob2xlbPf2hrDVpP60p3X/ONEeT61Nne4q2KZG60KLFwYLRbWyrEI3hfBHxgvExzNN/9oLgkUjA2AIceK+2ZtO3v3kjqBesmlhAm8CBO5eDxqIewP53/M4RTeCO+9EtQhNiwID9OWDmmVWaPO6eu+04TbsP73wY21V8syHKtUO89aaISfTKZ0gRlCpSvR9NVDppDIciPFYsTth0YEvxEovvjmkjQnUjqzLMbNNw2v/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q8s0Y9Gsm1jaQUmkY6qvm4EWST15h9bzVVUwuk9bMM=;
 b=w0MXYhqeupCts7UReHFI0Z97RaGNk79Uffvx0TUosQW/F6FlKwcJzMTlR7oG2GvR30WS9sLeEwoxW3o8Q5pdDp93XUzXN1HQS/LH317NkcH3Ps02ITlhyhl+jQa9uo2Q6JTNOj0lruoVZ+bYgHNvvV14Tn0+EKAPe1qoVx1MkEM=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 by AM6PR08MB4024.eurprd08.prod.outlook.com (2603:10a6:20b:a5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 10:30:10 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d%3]) with mapi id 15.20.2937.028; Thu, 30 Apr 2020
 10:30:10 +0000
Date: Thu, 30 Apr 2020 11:30:09 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] drm: enable render nodes wherever buffer sharing is
 supported
Message-ID: <20200430103009.37fetenhslc3xjnj@DESKTOP-E1NTVVP.localdomain>
References: <CAMn1gO4NsAoBUN4VFntB+pZK=cVCmwxBGUyipLPYYWFvpH1Z+A@mail.gmail.com>
 <20200427200513.36328-1-pcc@google.com>
 <20200429161650.65m37srq3sucbsit@DESKTOP-E1NTVVP.localdomain>
 <CAMn1gO4ozMZQk3jN7iNGH5Cq-3jQd=d4vgVj-Zr35u3YRsMG0Q@mail.gmail.com>
 <20200429173101.GI1985@e110455-lin.cambridge.arm.com>
Content-Disposition: inline
In-Reply-To: <20200429173101.GI1985@e110455-lin.cambridge.arm.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LO2P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::15)
 To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (217.140.99.251) by
 LO2P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 10:30:09 +0000
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 452ae686-04ee-4f5c-d836-08d7ecf179d8
X-MS-TrafficTypeDiagnostic: AM6PR08MB4024:|AM6PR08MB4024:|AM0PR08MB3907:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3907319EEFA73961A46850E3F0AA0@AM0PR08MB3907.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: A1hKvsMreQRoxfzoJqvKBK3XAiADvfqNyAHJWS7Q9jDRsy1tS9wGdXWfR56QfUkyVbT650hVN77nu/fiO1bRWvZJ6bJB1BW8NJZng6E35BgpQ0HAqOH2WPpHj03TCE+7g0BOqVXmbLaRHf0E+onxYmeJw6YQOjXid5SbqT8ul8GWoRJla0NBOiGKnGYK4sZc/LRx/SwE0m0YWIHN7LhPIIwll/kjHSw9hncNpCbGW8y8XYCbtGbQc5iuHOnapfM5FyeEHK2hwN8BvOF+2RC6xccZUv8JgpKmSf7CadF6iqdVFgB+rysayLDD/rUBswCjXHJgdOh/qrUh5IIncv+lWjOHocgCTmV4IUMgHsWrboqiUYF/29t+bYIYmeX7JheVemPWbksyO7bA4ylbpqGRKxa9s5lhqhmeAQdvOiJQNgaqN6s5CfmmAkkiou9NFtH0pUz0DxsYpIUEaOd+tDu/FFPeHqbwxdwc4FqzNPUushBj+q7GPRV6F9kghqvH1R4zVbPCsQ7UmDXSkDz1NyeYRg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3829.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(316002)(66476007)(66556008)(66946007)(54906003)(1076003)(5660300002)(2906002)(55016002)(9686003)(8676002)(86362001)(8936002)(6862004)(53546011)(478600001)(966005)(26005)(44832011)(52116002)(7696005)(956004)(6506007)(16526019)(6636002)(4326008)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lZ9QfWLDgZQSbu6G+1C6ZUSB+QsOd7/Ed+Pzr0T61fsY1Ct0F3+Cg8h7NoDkIlvBo8wj5uXRBWLTU74BjafW9Va95EvSxt0JEfZBdWk03R0ZGfbhYEsk1quyh+QEpREOO47UbxQzvwBsLIpu2uI5Cz4H2NmAsKD8GieufFSPiQwhpBuHpGBZCeVsXSOhbiVkdxWTXQs6oOli6KN9zjjtgaSxxDrUbrqXlNYMgIqCWKGaS9c2ynvbtIwW5Uu9tLtxppi7KofoDNa6/50FzMD0LgYAuA8w/yHSBJGFbjSZ/y905j7wZJ6eE4+zk/m0qUcEZtwtOVWivEDWZb6GtYa72ugOyv6WVWSA7uLv31Owd6B3YP9SLG88CM364B4yi/2atQNfrl1zgwBT+BpK1uSLq499r5raOn61KaiJH8zAO4si5YKwOEjtpb5UI2TbzB01pXmKtOklF//zpUjIJjQYc7oZLKcOynW5CThB4tmEAaWIDKVLKYpc8uwD1gcGUauYTeCkxFyY86n1rJYW/H5ZqdmouWv9GyXZHmEuahftxxhLvJS8vF7cGvIhtAoHOcakaXjtaMwtR/KnqiD7x8md0fdoD2au/2IxCrTAxkx9Z2QdOrmd9jy/d2744Do3QNS4QiMNqaMYPrnB1ZWdJP0ZID6+5n2QTYoC0H+onFMAS6In/bq7t7ClSPj6qyJPFQIvp5GP5+tCHP+wsSlLxGWgvoPN7Qr36bovWzQ/05//okqdW3E6aiBiefQef1uwL2EbTmUE0lnuXrbuugjZyax2azRU2wDg6rp6lNw2hEOis/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4024
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966005)(1076003)(53546011)(8936002)(44832011)(6506007)(54906003)(81166007)(5660300002)(7696005)(8676002)(82740400003)(86362001)(36906005)(478600001)(316002)(356005)(6636002)(16526019)(70586007)(70206006)(4326008)(336012)(82310400002)(26005)(186003)(55016002)(9686003)(47076004)(6862004)(956004)(2906002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d73ef91e-0e40-4a1e-29b5-08d7ecf17575
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 21bRM5zBbMUXkOO9tudARn3f2B4jh3cj3Wmi5putXQfxmUUwqURFpJgz1Svfrozzg/UFB8/dSSVPQ2pbxMMHhalWXwMnQdqr46hQxvMo5pE+zLQCaEGNJiKBm3T1Z9TzEotzP0x7dJZEkdqrMHCOMgQj09Watmq3Q+hHNs0KT77EvjXu32HySvhSK2W3ERPZ2umw8NLlaNoxM6iKAhsQbCGXn2/P8Fe61icIui5QrEnzmZW8L2aGloOS/tHBKgQsrVoaOIZWHb6HrxR/z4E92vr5iiDaeNBOgMB7eKb9KE+xoNuou3y+0gdJctRYFTkMVYzyUtWwq3BfDziLEJi/bQK8Rmhg9vV1e8cyAt8om0RiosnMT+u+/yLPySmUiYhHNiQNH94tcIUswN7/zO7G/oKDq58idWK+7gWor5gK8aebBtMdLzPvwAjrImiJnnes+SMijovGjb7zX6BXELxKihcXEGpueLCp4EKue0/vMDqwy1izAmm7avi9L3QrisXjUpM7pTRdPeSdso8vNWsEK6WxC9fyzu11x+ZxVQeg53mOobKhbQyMP38noncsulrHLBd2JT/CS2N+5UTiMpLLRU28Z/Ac7kDTT1JJS8gOwXE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 10:30:17.0592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 452ae686-04ee-4f5c-d836-08d7ecf179d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3907
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, nd@arm.com,
 Peter Collingbourne <pcc@google.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDY6MzE6MDFQTSArMDEwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6Cj4gT24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDk6NTE6MTlBTSAtMDcwMCwgUGV0ZXIgQ29s
bGluZ2JvdXJuZSB3cm90ZToKPiA+IE9uIFdlZCwgQXByIDI5LCAyMDIwIGF0IDk6MTcgQU0gQnJp
YW4gU3RhcmtleSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkg
UGV0ZXIsCj4gPiA+Cj4gPiA+IE9uIE1vbiwgQXByIDI3LCAyMDIwIGF0IDAxOjA1OjEzUE0gLTA3
MDAsIFBldGVyIENvbGxpbmdib3VybmUgd3JvdGU6Cj4gPiA+ID4gUmVuZGVyIG5vZGVzIGFyZSBu
b3QganVzdCB1c2VmdWwgZm9yIGRldmljZXMgc3VwcG9ydGluZyBHUFUgaGFyZHdhcmUKPiA+ID4g
PiBhY2NlbGVyYXRpb24uIEV2ZW4gb24gZGV2aWNlcyB0aGF0IG9ubHkgc3VwcG9ydCBkdW1iIGZy
YW1lIGJ1ZmZlcnMsCj4gPiA+ID4gdGhleSBhcmUgdXNlZnVsIGluIHNpdHVhdGlvbnMgd2hlcmUg
Y29tcG9zaXRpb24gKHVzaW5nIHNvZnR3YXJlCj4gPiA+ID4gcmFzdGVyaXphdGlvbikgYW5kIEtN
UyBhcmUgZG9uZSBpbiBkaWZmZXJlbnQgcHJvY2Vzc2VzIHdpdGggYnVmZmVyCj4gPiA+ID4gc2hh
cmluZyBiZWluZyB1c2VkIHRvIHNlbmQgZnJhbWUgYnVmZmVycyBiZXR3ZWVuIHRoZW0uIFRoaXMg
aXMgdGhlCj4gPiA+ID4gc2l0dWF0aW9uIG9uIEFuZHJvaWQsIHdoZXJlIHN1cmZhY2VmbGluZ2Vy
IGlzIHRoZSBjb21wb3NpdG9yIGFuZCB0aGUKPiA+ID4gPiBjb21wb3NlciBIQUwgdXNlcyBLTVMg
dG8gZGlzcGxheSB0aGUgYnVmZmVycy4gVGh1cyBpdCBpcyBiZW5lZmljaWFsCj4gPiA+ID4gdG8g
ZXhwb3NlIHJlbmRlciBub2RlcyBvbiBhbGwgZGV2aWNlcyB0aGF0IHN1cHBvcnQgYnVmZmVyIHNo
YXJpbmcuCj4gPiA+Cj4gPiA+IElmIEkgdW5kZXJzdGFuZCB5b3VyIHByb2JsZW0gcmlnaHQsIHRo
ZSBpc3N1ZSBpcyB0aGF0IHlvdSdyZSBnZXR0aW5nCj4gPiA+IHlvdXIgYnVmZmVycyBpbiBtaW5p
Z2JtIHZpYSBwbDExMSwgd2hpY2ggbWVhbnMgeW91IHdhbnQgYSByZW5kZXIgbm9kZQo+ID4gPiBq
dXN0IGZvciBidWZmZXIgYWxsb2NhdGlvbj8gVGhlbiBIV0NvbXBvc2VyIHdpbGwgaW1wb3J0IHRo
b3NlIG9uIHRoZQo+ID4gPiBwcmltYXJ5IG5vZGUgZm9yIGRpc3BsYXlpbmcuCj4gPiAKPiA+IENv
cnJlY3QuCj4gPiAKPiA+ID4gSSdtIG5vdCBhdCBhbGwgZmFtaWxpYXIgd2l0aCBob3cgbWluaWdi
bSBzaXRzIGluIEFuZHJvaWQsIGJ1dCBvbiBvdXIKPiA+ID4gcGxhdGZvcm1zIHdoZXJlIHRoZSBE
aXNwbGF5IGFuZCBHUFUgZGV2aWNlcyBhcmUgZGlmZmVyZW50LCB3ZSBhbGxvY2F0ZQo+ID4gPiB2
aWEgaW9uIGluIEdyYWxsb2MsIGFuZCBpbXBvcnQgdGhvc2UgaW50byBib3RoIHRoZSBHUFUgYW5k
IERpc3BsYXkuCj4gPiA+IEkgdGhpbmsgdGhhdCBzaG91bGQgd29yayBvbiBwbDExMSB0b28gLSBp
ZiB5b3UgY2FuIGFsbG9jYXRlIGNvbnRpZ3VvdXMKPiA+ID4gbWVtb3J5IGZyb20gaW9uIChvciBk
bWEtYnVmIGhlYXBzKSBpbiBtaW5pZ2JtLCB0aGVuIHlvdSBkb24ndCBuZWVkIHRoZQo+ID4gPiBy
ZW5kZXIgbm9kZS4KPiA+IAo+ID4gVGhvc2UgY29udGlndW91cyBtZW1vcnkgcmVnaW9ucyB3b3Vs
ZCBub3QgbmVjZXNzYXJpbHkgYmUgY29tcGF0aWJsZQo+ID4gd2l0aCB0aGUgcGwxMTEgZGV2aWNl
IGFzIGZhciBhcyBJIGtub3cgLS0gYWNjb3JkaW5nIHRvIFsxXSwgb24gc29tZQo+ID4gZGV2aWNl
cywgYSBkZXNpZ25hdGVkIG1lbW9yeSByZWdpb24gbXVzdCBiZSB1c2VkIGZvciB0aGUgZnJhbWVi
dWZmZXIKPiA+IGFuZCB0aGVyZWZvcmUgdGhlIG1lbW9yeSByZWdpb24gYWxsb2NhdGVkIGluIENN
QSB3b3VsZCBub3QgYmUKPiA+IGNvbXBhdGlibGUuIFRoYXQgYmVpbmcgc2FpZCwgRlZQIGRvZXNu
J3QgYXBwZWFyIHRvIGJlIG9uZSBvZiB0aG9zZQo+ID4gZGV2aWNlcywgc28gaW4gcHJpbmNpcGxl
IHRoYXQgbWlnaHQgd29yayBmb3IgRlZQIChwcm92aWRlZCB0aGF0IHRoZQo+ID4gdXNlciBwcm92
aWRlcyBhIHN1ZmZpY2llbnRseSBsYXJnZSBjbWE9WCBrZXJuZWwgY29tbWFuZCBsaW5lCj4gPiBh
cmd1bWVudCksIGJ1dCBub3QgZm9yIHRob3NlIG90aGVyIGRldmljZXMuCgpZZWFoIEknZCBiZSBz
dXJwcmlzZWQgaWYgRlZQIGNhcmVzIGFib3V0IGFueXRoaW5nIG90aGVyIHRoYW4gaXQgYmVpbmcK
Y29udGlndW91cy4KCk15IHVuZGVyc3RhbmRpbmcgb2YgaG93ICJtb3N0IiBBbmRyb2lkIGRldmlj
ZXMgaW1wbGVtZW50IHRoaXMgaXMgdG8KaGF2ZSBpb24gaGVhcHMgcmVwcmVzZW50aW5nIHdoYXRl
dmVyIGRlZGljYXRlZCBtZW1vcnkgcmVnaW9ucyB0aGVyZQphcmUuIEdyYWxsb2MgY2FuIHRoZW4g
cGljayB0aGUgYXBwcm9wcmlhdGUgb25lIGJhc2VkIG9uIHRoZSBncmFsbG9jCnVzYWdlIGZsYWdz
LiBTbyBhbGxvY2F0aW9ucyB3b3VsZG4ndCBnbyB2aWEgdGhlIERSTSBkcml2ZXIuCgpJdCBsb29r
cyBsaWtlIHRoZSBjaGVja3MgaW4gcGwxMTEgY2FuJ3Qgc3VwcG9ydCB0aGF0IHVzYWdlIG1vZGVs
IGlmCnVzZV9kZXZpY2VfbWVtb3J5IGlzIHNldCAodGhvdWdoIHRoYXQgd291bGRuJ3QgbWF0dGVy
IG9uIEZWUCkuCgo+IAo+IFdlIGhhdmUgYmVlbiBkb2luZyB0aGF0IHdpdGggbWFsaS1kcCBkcml2
ZXJzIGZvciB5ZWFycy4gQmVjYXVzZSBtb3N0IG9mCj4gb3VyIGRldiBlbnZpcm9ubWVudHMgYXJl
IG9uIEZQR0FzLCB3ZSBuZWVkZWQgdG8gdXNlIHRoZSBsb2NhbCBSQU0gb24KPiB0aG9zZSBib2Fy
ZHMgc28gd2UndmUgaGFkIHRvIGFzc2lnbiBhIG1lbW9yeSByZWdpb24gdG8gdGhlIGRyaXZlciB0
aGF0Cj4gaW4gdHVybiB3YXMgdXNpbmcgQ01BLiBXZSd2ZSBtYWRlIGhlYXZ5IHVzZSBvZiAncmVz
ZXJ2ZWQtbWVtb3J5JyBhbmQKPiAnbWVtb3J5LXJlZ2lvbicgbm9kZXMgaW4gdGhlIERUIHRvIGxp
bmsgdGhlIHR3byB0b2dldGhlciwgYnV0IHRoaW5ncwo+IHdvcmtlZCBvdXQgcXVpdGUgd2VsbC4g
QmVjYXVzZSB0aGUgJ3Jlc2VydmVkLW1lbW9yeScgc3ViLW5vZGUgd2FzIG1hcmtlZAo+IGFzICdj
b21wYXRpYmxlPSJzaGFyZWQtZG1hLXBvb2wiJywgZ3JhbGxvYyBhbmQgSU9OIGNvdWxkIGJlIHVz
ZWQgdG8KPiBhbGxvY2F0ZSBtZW1vcnkgZnJvbSBpdC4KClRoaXMgaXMgYSBsaXR0bGUgaW1wZXJm
ZWN0IGJlY2F1c2UgaW9uIGRvZXNuJ3QgaGF2ZSBhIHdheSB0byBhY2Nlc3MKdGhlIGBkZXZgIHBv
aW50ZXIgbmVlZGVkIHRvIGFsbG9jYXRlIGZyb20gZGV2aWNlLWF0dGFjaGVkIENNQSByZWdpb25z
LApzbyBzb21lIGhhY2tlcnkgaXMgcmVxdWlyZWQuCgpJIHRoaW5rIGRtYS1oZWFwcyB3b3VsZCBs
ZXQgeW91IGV4cG9zZSBkZXZpY2Utc3BlY2lmaWMgQ01BIHJlZ2lvbnMuCgpFdmVuIGlmIHlvdSBk
aWQgdGhhdCBhbmQgYWxsb2NhdGVkIGZyb20gdGhlIHJpZ2h0IHBsYWNlLCB0aGUgY2hlY2sKaW4g
cGwxMTEgd291bGQgcmVqZWN0IGFueSBhdHRlbXB0IHRvIGltcG9ydCBpdCBpZiBpdCdzIHNldCB0
bwp1c2VfZGV2aWNlX21lbW9yeS4KCkkgZG9uJ3Qga25vdyBpZiB0aGVyZSdzIGEgYmV0dGVyIHdh
eSB0byB0ZWxsIGlmIHRoZSBtZW1vcnkgaXMKY29tcGF0aWJsZSwgYnV0IHRoYXQgY2hlY2sgc2Vl
bXMgbGlrZSBhIGJpdCBvZiBhIHNsZWRnZWhhbW1lci4gSXQKbG9va3MgbGlrZSBpdCBub3Qgb25s
eSBmb3JjZXMgdGhlIG1lbW9yeSB0byBiZSBmcm9tIHRoZSByaWdodCBwbGFjZSwKaXQgYWxzbyBm
b3JjZXMgaXQgdG8gaGF2ZSBiZWVuIGFsbG9jYXRlZCB2aWEgcGwxMTEuCgpPbiBGVlAgdGhvdWdo
LCBJIHJlY2tvbiBhbnkgb2xkIENNQSBtZW1vcnkgc2hvdWxkIGJlIGZpbmUuCgpDaGVlcnMsCi1C
cmlhbgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTGl2aXUKPiAKPiA+IAo+ID4gUGV0ZXIKPiA+IAo+
ID4gWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L2FybSUyQ3BsMTF4LnR4dAo+IAo+IC0tIAo+ID09PT09PT09PT09
PT09PT09PT09Cj4gfCBJIHdvdWxkIGxpa2UgdG8gfAo+IHwgZml4IHRoZSB3b3JsZCwgIHwKPiB8
IGJ1dCB0aGV5J3JlIG5vdCB8Cj4gfCBnaXZpbmcgbWUgdGhlICAgfAo+ICBcIHNvdXJjZSBjb2Rl
ISAgLwo+ICAgLS0tLS0tLS0tLS0tLS0tCj4gICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
