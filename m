Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215191C69B
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 12:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71232892B6;
	Tue, 14 May 2019 10:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F53892A9;
 Tue, 14 May 2019 10:05:10 +0000 (UTC)
Received: from CY4PR12CA0025.namprd12.prod.outlook.com (2603:10b6:903:129::11)
 by CY4PR12MB1272.namprd12.prod.outlook.com (2603:10b6:903:3e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.22; Tue, 14 May
 2019 10:05:08 +0000
Received: from BY2NAM03FT015.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by CY4PR12CA0025.outlook.office365.com
 (2603:10b6:903:129::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Tue, 14 May 2019 10:05:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT015.mail.protection.outlook.com (10.152.84.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Tue, 14 May 2019 10:05:08 +0000
Received: from [10.237.74.158] (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Tue, 14 May
 2019 05:05:06 -0500
Subject: Re: [PATCH libdrm 1/7] addr cs chunk for syncobj timeline
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Chunming Zhou
 <david1.zhou@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
References: <20190513095305.14110-1-david1.zhou@amd.com>
 <9acb411f-a339-7ad0-8115-d1f04732eb44@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <e01a78a9-6dab-a2c3-6b4f-0a6e47087118@amd.com>
Date: Tue, 14 May 2019 18:05:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9acb411f-a339-7ad0-8115-d1f04732eb44@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(186003)(16526019)(3846002)(77096007)(26005)(426003)(31696002)(36756003)(6116002)(2906002)(476003)(2616005)(11346002)(486006)(126002)(4326008)(50466002)(31686004)(68736007)(446003)(53936002)(4744005)(5660300002)(336012)(305945005)(70206006)(70586007)(7736002)(16576012)(8936002)(23676004)(65826007)(72206003)(2870700001)(2201001)(65806001)(81166006)(47776003)(76176011)(8676002)(6246003)(478600001)(81156014)(316002)(64126003)(2486003)(67846002)(86152003)(6666004)(356004)(65956001)(58126008)(110136005)(229853002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1272; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 181ee5a7-769b-4108-991e-08d6d853a518
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR12MB1272; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1272:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127277053E4EB854D9C7AE66B4080@CY4PR12MB1272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0037FD6480
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: IhV9NJeXh0eSP6ImeMhJp3C90yExwnAckj3HNpzfAxiIGQ7lp4reBJC6nkOeQyFMBvnxm1Bccxi6uyN6luewf/lPTDsNPvRnN7/B5EC8jlsSw7N2gNOs19xjgsDdCkXYZVipKCSW6LlAgYvk+LHZGfy2/Zi0Cp4ct4TPQUpIQoVVNWpZmyUrglwfLxsZv/8XD1L/7msziJ3N9Dnr/lC3wvsdEyOr3ZOZPiHR3HxWmkmef9IxUxpAOq2WpYNV14dx4Zh6KWHpHVBNttoWa8enTMwPHaO4In9hLfRJZRPX6VIxkBgprEQV0uNt49Yhk+fKg84rxjG4ljPeNNmAogptYRYtE7DIPtTPHKgCGd6LV2YyfyGACGPd4n2vYxsibBQVZfL9O2kddlu91NJRoiH+oPHlD72ffqv8NBbnFELNfwo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2019 10:05:08.1610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 181ee5a7-769b-4108-991e-08d6d853a518
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8V902DeUakrqeC43bcXVbylSmBtd8ypPaqHF2Tb4ds=;
 b=PoxVdJ2zY1Ah4nLQ7Bx3HQ1spEFerEkpEIgyQdEJ/ZeOfg5VcreuSYI0BUqQopPfewQIzH5rw/mM1IlWiFF8ohhkvPWSE6ESUfLep9GohcApR3ccNpTmAnZ1SQVVykMTkz8vQ9j9alzwDaOZIjzq75G4x4ZhxU9417B+NgnOh2g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmsgeW91LCBMaW9uZWwuCgotRGF2aWQKCgpPbiAyMDE55bm0MDXmnIgxNOaXpSAxNzo0OSwg
TGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQo+Cj4g
V2l0aCB0aGUgc21hbGwgbml0cywgcGF0Y2hlcyAyICYgNCBhcmUgOiBSZXZpZXdlZC1ieTogTGlv
bmVsIExhbmR3ZXJsaW4KPiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+Cj4gVGhlIG90
aGVyIHBhdGNoZXMgYXJlIGEgYml0IGFtZGdwdSBzcGVjaWZpYyBzbyBtYXliZSB5b3UgbWlnaHQg
d2FudAo+IHNvbWVvbmUgbW9yZSBmYW1pbGlhciB3aXRoIGFtZGdwdSB0byByZXZpZXcgdGhlbS4K
PiBTdGlsbCBJIGRpZG4ndCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aCB0aGVtIHNvIHJlbWFpbmlu
ZyBwYXRjaGVzIGFyZSA6Cj4gQWNrZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5s
YW5kd2VybGluQGludGVsLmNvbT4KPgo+IEknbGwgc2VuZCB0aGUgSUdUIHN0dWZmIHNob3J0bHku
Cj4KPiBUaGFua3MsCj4KPiAtTGlvbmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
