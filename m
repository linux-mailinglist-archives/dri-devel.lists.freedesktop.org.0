Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD9237196
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 12:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCCC8933C;
	Thu,  6 Jun 2019 10:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6D78933C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 10:26:21 +0000 (UTC)
Received: from MWHPR12CA0065.namprd12.prod.outlook.com (2603:10b6:300:103::27)
 by BN7PR12MB2658.namprd12.prod.outlook.com (2603:10b6:408:29::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Thu, 6 Jun
 2019 10:26:19 +0000
Received: from BY2NAM03FT011.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by MWHPR12CA0065.outlook.office365.com
 (2603:10b6:300:103::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 10:26:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT011.mail.protection.outlook.com (10.152.84.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 10:26:17 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 6 Jun
 2019 05:26:16 -0500
Subject: Re: [PATCH 1/2] update drm.h
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
References: <20190522090800.15908-1-david1.zhou@amd.com>
 <17e558ac-bda8-0541-b102-2fd730ce4753@amd.com>
 <f95b85cd-80ee-576a-248a-409f512e8d38@amd.com>
 <96dea97c-dfa8-1e89-1b83-9a425b93e36e@daenzer.net>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <ce5f40ff-7685-35e5-ef33-e5e7fac63818@amd.com>
Date: Thu, 6 Jun 2019 18:26:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <96dea97c-dfa8-1e89-1b83-9a425b93e36e@daenzer.net>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(2906002)(77096007)(16576012)(31686004)(426003)(23676004)(11346002)(2870700001)(66574012)(486006)(6666004)(70206006)(6246003)(110136005)(26005)(356004)(16526019)(67846002)(186003)(58126008)(2486003)(4326008)(6306002)(36756003)(3846002)(68736007)(70586007)(53936002)(6116002)(65806001)(5660300002)(126002)(31696002)(6636002)(336012)(64126003)(316002)(65826007)(476003)(14444005)(2616005)(229853002)(50466002)(8676002)(81166006)(81156014)(8936002)(478600001)(558084003)(966005)(76176011)(7736002)(72206003)(53546011)(446003)(47776003)(305945005)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2658; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da393d61-3c11-4534-6311-08d6ea696949
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN7PR12MB2658; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2658:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BN7PR12MB265854A53EC8B92DC388C8B8B4170@BN7PR12MB2658.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LLTQ3oYgUenxxdL9NkOdu0h+ieuCKS5i60oTHmnWsQaV86j7/+X0dEIfQe03XLlLN6s78xuebW6z2FLhCaTjHP1epgDha1pnF4DIWpJtvmGk1ssbAcZTTdqyTHCk5lXQM3dmsxl88v4fxbE8roenkCQ3vlhBcEC4u/wEWncf+dc1dJm5PyX4bg4ggzadAxpTeUCk8O3kfVSa//iRljvco+Bh+uUjQv21qWm3WgAU21Uvuip58LkNjltOM0BvFHsmKcLxlambmLzTrs1oEwTFwFzVQn2IJXoiTzT2qSphVnI3113E3S3kCGSKVnAE+4LuAb1rfDNmHql1TdHsV2I7vV5X4HLFSZS1g9GnTwmaXbq4Jyk1JuUSDN/yrMsz/hp43boUnY6jKKTTGMqWfd/5NgVhMX7oVQyPPJACGtSJBj0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 10:26:17.6795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da393d61-3c11-4534-6311-08d6ea696949
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2658
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHZajzvXNSUb6IixNhYvRU57VqM4zZ0tj0gyZcFWjKw=;
 b=TykOSd5Kg7yRTZiFktVS0wCVnwm7sCXLX1fpXZBhI7timCd5pbvOaR43ZDPudth8GzR2mMmpnGe1xLv6N7Lw6gOZcz57pIsM34G4EOl3buIATHaSNkkaTmdmrOma0id0x/48TkGlJk8EO5MtbaTh4yS52PMGEpOq3S5BOOVBcOY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=permerror action=none header.from=amd.com;
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvZHJtLCBXaGVyZSB0aGUgbWVyZ2Ug
cmVxdWVzdCBidXR0b24/CgotRGF2aWQKCgpPbiAyMDE55bm0MDbmnIgwNuaXpSAxODoyMCwgTWlj
aGVsIETDpG56ZXIgd3JvdGU6Cj4gT24gMjAxOS0wNS0yNCA3OjE1IGEubS4sIHpob3VjbTEgd3Jv
dGU6Cj4+IGFueW9uZSBjYW4gcGljayB1cCB0byBnaXRsYWIgZm9yIGxpYmRybT8KPiBDYW4geW91
IGNyZWF0ZSBhIG1lcmdlIHJlcXVlc3Q/Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
