Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6124AC7
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A18B89247;
	Tue, 21 May 2019 08:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740088.outbound.protection.outlook.com [40.107.74.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CE189247
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:51:24 +0000 (UTC)
Received: from MWHPR12CA0071.namprd12.prod.outlook.com (2603:10b6:300:103::33)
 by BN7PR12MB2657.namprd12.prod.outlook.com (2603:10b6:408:29::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.19; Tue, 21 May
 2019 08:51:22 +0000
Received: from DM3NAM03FT019.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by MWHPR12CA0071.outlook.office365.com
 (2603:10b6:300:103::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.15 via Frontend
 Transport; Tue, 21 May 2019 08:51:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT019.mail.protection.outlook.com (10.152.82.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1900.16 via Frontend Transport; Tue, 21 May 2019 08:51:22 +0000
Received: from [10.237.74.158] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Tue, 21 May
 2019 03:51:20 -0500
Subject: Re: drm-sync timeline signaling
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Zhou,
 David(ChunMing)" <David1.Zhou@amd.com>
References: <882a793c-cf49-8522-b1f3-cdb8dc685ea0@intel.com>
 <2e74c0a7-3b4e-c1ff-9b6c-33ebd7008b6b@intel.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <cb50e114-f2e2-e8c7-e852-30bfb2fe9312@amd.com>
Date: Tue, 21 May 2019 16:51:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2e74c0a7-3b4e-c1ff-9b6c-33ebd7008b6b@intel.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(39860400002)(2980300002)(428003)(53754006)(199004)(189003)(446003)(6306002)(65806001)(65956001)(5660300002)(8936002)(2501003)(6116002)(16576012)(70586007)(76176011)(70206006)(426003)(47776003)(229853002)(3846002)(316002)(8676002)(305945005)(356004)(7736002)(23676004)(67846002)(486006)(6636002)(36756003)(6666004)(2486003)(336012)(4744005)(72206003)(2616005)(81166006)(81156014)(966005)(476003)(126002)(26005)(31696002)(86152003)(110136005)(53936002)(64126003)(478600001)(53546011)(65826007)(31686004)(2870700001)(11346002)(77096007)(186003)(3480700005)(68736007)(50466002)(6246003)(16526019)(58126008)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2657; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d6ed89f-a587-4304-ba9e-08d6ddc97feb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN7PR12MB2657; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2657:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BN7PR12MB26574196BE7964117EBDD28DB4070@BN7PR12MB2657.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0044C17179
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TFRZcW5byxA0kLjW4xNYHQ3N99R0ZAuxazgKWjb9MZi3/vZyRnD+44oN6PbvgElKGjFjVAh7hERRWcRfXB62oW+UdiDS/CSGozqcnj3e0AlbXBTJjaD9h5vTdoyXt55Ek2pu7STCR5YKSy3dA99uYwoOPU/F2VeBAYp/PMfV9WcX5earPDoDZ0Oq6W+F4a92P5zudc7ZDUXwVUowlxmPtVfBnT2ZLUoz3Cxp4+53xxkN9SFViBJ2LteBzSHUmQBlKS1OqzdRo2//suhQ0RJwAq3QPdOvJxHm0g9csE+tSesQqOglEwQYQp/LiiLA1QkSfcRA6pHdvgtplhF+c2vLSmQhjg1lu3eL18/cxgFRhnlZnwYMxO+W/cZsuogvu3Be9vuPbn8FwgBwO/Yo/EoOg4DXk0kYkgbikMdSGRudNKE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2019 08:51:22.2402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6ed89f-a587-4304-ba9e-08d6ddc97feb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sJk78VkpfZbipy2Pf5xnaltUnZH/qtCFVynG2Kr+Us=;
 b=TO/rt4ImhQdnR7CtqtjaLpOwUBEnTn6rhCZsipI2JaXz70bkwCfXhYbQ6r2XLuurIcPh+Q9eQYgGRqE4AuuyDvlmvUMGA10BfPZlOlUsZHmyv0SE2r/Z8YgFnmwFdNzowGs8l5i4E1lfBp8rjS49WAiSneJCCV5PhG52FXPfujw=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29ycnkgZm9yIGxhdGUgcmVzcG9uc2UuCgpBbHRob3VnaCB3ZSBkb24ndCBleHBlY3QgdGhhdCwg
ZHJtX3N5bmNvYmpfdGltZWxpbmVfc2lnbmFsX2lvY3RsIGFscmVhZHkgCmhhbmRsZSB0aGlzIGNh
c2UgSSB0aGluay4gV2hpY2ggY2FuIGhhbmRsZSBib3RoIChwb2ludCB2YWx1ZSA+IDApIGFuZCAK
KHBvaW50IHZhbHVlID0gMCkuCgoKLURhdmlkCgoKT24gMjAxOeW5tDA15pyIMjHml6UgMTY6NDQs
IExpb25lbCBMYW5kd2VybGluIHdyb3RlOgo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KPgo+
IFBpbmc/Cj4KPiBPbiAxNi8wNS8yMDE5IDE1OjQ5LCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToK
Pj4gSGkgYWxsLAo+Pgo+PiBXaGlsZSBwaWNraW5nIHVwIHRoZSBJR1QgdGVzdHMgZm9yIHRpbWVs
aW5lIHN5bmNvYmosCj4+IEkgbm90aWNlZCB0aGF0IGFsdGhvdWdoIHdlIGRlYWwgd2l0aCBtdWx0
aSB3YWl0IGFjcm9zcyBib3RoIHRpbWVsaW5lCj4+ICh3aXRoIHBvaW50IHZhbHVlID4gMCkgYW5k
IGJpbmFyeSAocG9pbnQgdmFsdWUgPSAwKSBzeW5jb2JqcywKPj4gd2UgZG9uJ3Qgc2VlbSB0byBo
YXZlIGEgc2ltaWxhciBiZWhhdmlvciB3aXRoIHNpZ25hbGluZy4KPj4KPj4gRG8geW91IGhhdmUg
YW55IHRob3VnaHQgb24gdGhpcz8KPj4gSSdtIGNvbnNpZGVyaW5nIHdyaXRpbmcgc29tZSBkb2Nz
IGJ1dCBJJ20gbm90IHF1aXRlIHN1cmUgd2hldGhlciB0aGlzCj4+IGRpZmZlcmVuY2UgYmV0d2Vl
biBzaWduYWxpbmcvd2FpdGluZyB3YXMgaW50ZW50aW9uYWwgb3IganVzdCBvdmVybG9va2VkLgo+
Pgo+PiBUaGFua3MsCj4+Cj4+IC1MaW9uZWwKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
