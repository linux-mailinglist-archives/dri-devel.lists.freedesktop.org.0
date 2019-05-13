Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3371B3BD
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 12:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E147489C03;
	Mon, 13 May 2019 10:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700080.outbound.protection.outlook.com [40.107.70.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FC789B78;
 Mon, 13 May 2019 10:15:14 +0000 (UTC)
Received: from BN4PR12CA0021.namprd12.prod.outlook.com (2603:10b6:403:2::31)
 by CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.26; Mon, 13 May
 2019 10:15:12 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by BN4PR12CA0021.outlook.office365.com
 (2603:10b6:403:2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Mon, 13 May 2019 10:15:11 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Mon, 13 May 2019 10:15:10 +0000
Received: from [10.237.74.158] (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server (TLS) id 14.3.389.1; Mon, 13 May
 2019 05:15:08 -0500
Subject: Re: [PATCH libdrm 1/7] addr cs chunk for syncobj timeline
To: Chunming Zhou <david1.zhou@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
References: <20190513095305.14110-1-david1.zhou@amd.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <9179e6bc-77f3-f284-d1ad-13d8956e1919@amd.com>
Date: Mon, 13 May 2019 18:15:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190513095305.14110-1-david1.zhou@amd.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(136003)(2980300002)(428003)(199004)(189003)(336012)(5660300002)(68736007)(36756003)(2616005)(126002)(426003)(11346002)(446003)(486006)(65826007)(2906002)(31696002)(356004)(229853002)(64126003)(6666004)(2201001)(476003)(16526019)(186003)(50466002)(26005)(77096007)(478600001)(70586007)(4326008)(316002)(53936002)(305945005)(7736002)(3846002)(6116002)(86152003)(6246003)(6306002)(72206003)(966005)(76176011)(8676002)(2486003)(23676004)(16576012)(67846002)(110136005)(58126008)(54906003)(2870700001)(81156014)(70206006)(8936002)(81166006)(65956001)(31686004)(65806001)(47776003)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2ec769b-2ca5-4352-d8b6-08d6d78be189
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <CY4PR12MB12702495C7187CFB0C968D78B40F0@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-Forefront-PRVS: 0036736630
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AmjyJz6CD2N5v6VBpEe6C4F9A97WIhsNPqhjokgumEqsoiz2LIkgcK+VsOepOERMZ+/U5R5nvyjeAFkd55FfRMfLe92LvSFpPWV0NyilROLiKhCIaAzvd4pLtrbHA/v3xkKIdOgQx1XrtfMqcop0ONSbSWS52wu0Yje8JkKuEi/NM9trPnk7p5Shh9BF1gQBPe8scxbtogM+eLTCVKxLRQusFjYWXvRrDAA69QqiSjVAiB73MGNE/bLNt2quJYGCudt+OxRsQqilJ+qdEmXejp1FhQkHTPsdzBWkdFaPCSUm4xbZoZVHFHz+fT10Phyhp8g3WWMCstKXczlx9SHqBekqnu4xzTq/H5/pgh4nDiKTuPDI+NZwKiAT9M5dMHOdQUoZqGOCBAX33OqEdyW1OPVyq6CZvcJ6WbER+Nh+Iic=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2019 10:15:10.2035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ec769b-2ca5-4352-d8b6-08d6d78be189
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIL5KwaeoGvVWW2ExddPqvpJxGZMoJbxswvqXPpN5HM=;
 b=odyGKg1z/6g6GDdDOKrlOaHER/XANEikUHpPbN0Iv1CQ9EGN2Ui8FR9gAKXkoCpTZU8npme5bEMG56QVOwl+15rzoO/91whQry1Anw0BxO3aC2VJWgYeBBJ+J+z52WBs/w0YXWppOS3Juaj94lWZNMJ0LhpCDJB1iOUH9EG0uHg=
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
Cc: Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cGluZy4uLiBmb3IgcGF0Y2ggc2V0LgoKCk9uIDIwMTnlubQwNeaciDEz5pelIDE3OjUyLCBDaHVu
bWluZyBaaG91IHdyb3RlOgo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KPgo+IFNpZ25lZC1v
ZmYtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+Cj4gLS0tCj4gICBpbmNs
dWRlL2RybS9hbWRncHVfZHJtLmggfCA5ICsrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaCBi
L2luY2x1ZGUvZHJtL2FtZGdwdV9kcm0uaAo+IGluZGV4IGQwNzAxZmZjLi4zZDAzMThlNiAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9hbWRncHVfZHJtLmgKPiArKysgYi9pbmNsdWRlL2RybS9h
bWRncHVfZHJtLmgKPiBAQCAtNTI4LDYgKzUyOCw4IEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2dlbV92
YSB7Cj4gICAjZGVmaW5lIEFNREdQVV9DSFVOS19JRF9TWU5DT0JKX09VVCAgICAgMHgwNQo+ICAg
I2RlZmluZSBBTURHUFVfQ0hVTktfSURfQk9fSEFORExFUyAgICAgIDB4MDYKPiAgICNkZWZpbmUg
QU1ER1BVX0NIVU5LX0lEX1NDSEVEVUxFRF9ERVBFTkRFTkNJRVMgMHgwNwo+ICsjZGVmaW5lIEFN
REdQVV9DSFVOS19JRF9TWU5DT0JKX1RJTUVMSU5FX1dBSVQgICAgMHgwOAo+ICsjZGVmaW5lIEFN
REdQVV9DSFVOS19JRF9TWU5DT0JKX1RJTUVMSU5FX1NJR05BTCAgMHgwOQo+Cj4gICBzdHJ1Y3Qg
ZHJtX2FtZGdwdV9jc19jaHVuayB7Cj4gICAgICAgICAgX191MzIgICAgICAgICAgIGNodW5rX2lk
Owo+IEBAIC02MDgsNiArNjEwLDEzIEBAIHN0cnVjdCBkcm1fYW1kZ3B1X2NzX2NodW5rX3NlbSB7
Cj4gICAgICAgICAgX191MzIgaGFuZGxlOwo+ICAgfTsKPgo+ICtzdHJ1Y3QgZHJtX2FtZGdwdV9j
c19jaHVua19zeW5jb2JqIHsKPiArICAgICAgIF9fdTMyIGhhbmRsZTsKPiArICAgICAgIF9fdTMy
IGZsYWdzOwo+ICsgICAgICAgX191NjQgcG9pbnQ7Cj4gK307Cj4gKwo+ICsKPiAgICNkZWZpbmUg
QU1ER1BVX0ZFTkNFX1RPX0hBTkRMRV9HRVRfU1lOQ09CSiAgICAgMAo+ICAgI2RlZmluZSBBTURH
UFVfRkVOQ0VfVE9fSEFORExFX0dFVF9TWU5DT0JKX0ZEICAxCj4gICAjZGVmaW5lIEFNREdQVV9G
RU5DRV9UT19IQU5ETEVfR0VUX1NZTkNfRklMRV9GRCAgICAgICAgMgo+IC0tCj4gMi4xNy4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
