Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CBA7A433
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 11:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C936E466;
	Tue, 30 Jul 2019 09:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730078.outbound.protection.outlook.com [40.107.73.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2C76E466
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1sCKfdb6dngaOXAKjzlKzRnmpyVs9rkBlHFjDvrSyQ2fN8+ZF81P+0CFiNkF8xdCRlpPNh9H6zIWNZ36ZRrKxxl2Z0JliFAA01IB2yimKuPdWnG0Xp8Ze8ZhO/mfRdKDVr+0rV5x8M6k9XKS6E9NfSJ15qI2ifRD9aiblLofaG5KjueRDytZL322EDI8rHq0WW/W4UZfi8pHZbL8Y4FYjO9Pgvt8W6ICdnITM04oJwVCA9sgx77EBzwe281WP8J4ZrWEsNrH7YkFLa93gv+RkOndUZM2jb+5fSPKFPZG9VJfygexYZ5/6icRo+KzXTl/5swhimEcsLmHaGopvPeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBxNjdRVhTU7culZY6Z1M/tycxfa7ltxVnMY9liNVo8=;
 b=SOzVCHL7a/ngV8zdGv5TV8HE6cC3VfBM3MXVmJ/qXRue01Yqcl+VqCuzM5GVcZQBwJf/TVFzKmy0VsjSjxb0rcGqHSRRAe9hW59LwE1gX+ydkJI9f5XtCEi/kBqu+MQDuy8/ifjdTV46EwKPLw7wnsQYJFIKGgsBVfbnlmFDRAreU+tG+VjU21WOS6SCTUmb8itCj34ASWFCySNwm6C6/SdkSa8VjbVAwQxVxP0eAHcNDOUp8xcGz1neTAdAk05kW5k4JwalSwSINdSv1/Y6q5h0dZU81/D+mLQZaXRRBVtyB0ExrdSJTceeNuVBLSa57DQ+O0VRhwjcvjm0XA4Y9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from SN1PR12CA0081.namprd12.prod.outlook.com (2603:10b6:802:21::16)
 by BYAPR12MB3510.namprd12.prod.outlook.com (2603:10b6:a03:13a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Tue, 30 Jul
 2019 09:31:36 +0000
Received: from DM3NAM03FT029.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by SN1PR12CA0081.outlook.office365.com
 (2603:10b6:802:21::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Tue, 30 Jul 2019 09:31:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT029.mail.protection.outlook.com (10.152.82.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 09:31:36 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Tue, 30 Jul
 2019 04:31:34 -0500
Subject: Re: [PATCH] drm/syncobj: remove boring message
To: Daniel Vetter <daniel@ffwll.ch>, Chunming Zhou <david1.zhou@amd.com>
References: <20190729082039.23837-1-david1.zhou@amd.com>
 <20190730092728.GM15868@phenom.ffwll.local>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <43e4a527-8895-c958-5717-b1f7530571d7@amd.com>
Date: Tue, 30 Jul 2019 17:31:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190730092728.GM15868@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(7736002)(16576012)(316002)(14444005)(186003)(6636002)(336012)(70586007)(70206006)(53936002)(26005)(76176011)(4326008)(426003)(2616005)(36756003)(8676002)(65826007)(126002)(2486003)(446003)(23676004)(47776003)(2906002)(305945005)(110136005)(58126008)(65806001)(50466002)(2870700001)(65956001)(5660300002)(64126003)(8936002)(81156014)(81166006)(229853002)(67846002)(476003)(11346002)(3846002)(6116002)(6246003)(31686004)(16526019)(31696002)(478600001)(6666004)(356004)(966005)(6306002)(68736007)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3510; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cde6c35f-282f-4920-2d95-08d714d0b796
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR12MB3510; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3510:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BYAPR12MB351032CE85BAF77DE00AE2BDB4DC0@BYAPR12MB3510.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: caJguY9s47/jy2k62Ca1hOSYshe9fGu6BQWqSaFfOqNop8vf6iUwhHFjVi1qCvosZ7WuRVuPkPsnmC8c30bpACpqtfR8Hkp9mt1Yjk/erpna359nYP2h8NoPDeQgkNLdbXorvZ2+qbrgPI54AMninehs/M3W/LBg7EjNogTdQgr9OcY5ayrGKHXbNDYJcwK1WTtXP96qd2CYbbX13ywzLEoytBPdd+3jCtlFQYAhl3/Vee/zi/sN/R4/E82u1LDwcWo9GO2hivoepFOPvQhuSqmz8wyo5hK6Tu9ViB/IoaJJ2JZQyuznUthfYrkUrVOZCH9P6pA/oVoey24Pq4TEx9QWLNpKKwsQIGA19NPnamA+ZS2fiSc0eyM7VvoXEM+LwhFixrdbCRN96Ug3SjBm6YMKsyNfQa098erJH/gIqTQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 09:31:36.0699 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde6c35f-282f-4920-2d95-08d714d0b796
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3510
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBxNjdRVhTU7culZY6Z1M/tycxfa7ltxVnMY9liNVo8=;
 b=tYwDti8kZdnfG1YXUMHGVSh7L9D2zJk6hmAfjBNzatSOf5HORbd+BCqx6ugB/VYx8Flm3CCcZT5uQFeE6G8HaaYRuaqo8wEZEFF45R+eCDnhNhO4rPt30hMLaYpbQCNR/tAoHebROE/u71ygW+z7VcfHIPbVEBEAYPQpArqIXL8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=permerror action=none header.from=amd.com;
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDE55bm0MDfmnIgzMOaXpSAxNzoyNywgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBN
b24sIEp1bCAyOSwgMjAxOSBhdCAwNDoyMDozOVBNICswODAwLCBDaHVubWluZyBaaG91IHdyb3Rl
Ogo+PiBJdCBpcyBub3JtYWwgdGhhdCBiaW5hcnkgc3luY29iaiByZXBsYWNlcyB0aGUgdW5kZXJs
eWluZyBmZW5jZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpo
b3VAYW1kLmNvbT4KPiBEbyB3ZSBoaXQgdGhpcyB3aXRoIG9uZSBvZiB0aGUgc3luY29iaiBpZ3Rz
PwpVbmZvcnR1cm5hdGVseSwgTm8sIEl0J3Mgb25seSBoaXQgaW4gQU1ER1BVIHBhdGgsIHdoaWNo
IGNvbWJpbmVzIAp0aW1lbGluZSBhbmQgYmluYXJ5IHRvIHNhbWUgcGF0aCB3aGVuIHRpbWVsaW5l
IGlzIGVuYWJsZWQuCgotRGF2aWQKPiAtRGFuaWVsCj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9zeW5jb2JqLmMgfCAzIC0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+PiBpbmRleCA5MjlmN2M2NGY5YTIuLmJjN2Vj
MTY3OWU0ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4gQEAgLTE1MSw5ICsxNTEsNiBA
QCB2b2lkIGRybV9zeW5jb2JqX2FkZF9wb2ludChzdHJ1Y3QgZHJtX3N5bmNvYmogKnN5bmNvYmos
Cj4+ICAgCXNwaW5fbG9jaygmc3luY29iai0+bG9jayk7Cj4+ICAgCj4+ICAgCXByZXYgPSBkcm1f
c3luY29ial9mZW5jZV9nZXQoc3luY29iaik7Cj4+IC0JLyogWW91IGFyZSBhZGRpbmcgYW4gdW5v
cmRlciBwb2ludCB0byB0aW1lbGluZSwgd2hpY2ggY291bGQgY2F1c2UgcGF5bG9hZCByZXR1cm5l
ZCBmcm9tIHF1ZXJ5X2lvY3RsIGlzIDAhICovCj4+IC0JaWYgKHByZXYgJiYgcHJldi0+c2Vxbm8g
Pj0gcG9pbnQpCj4+IC0JCURSTV9FUlJPUigiWW91IGFyZSBhZGRpbmcgYW4gdW5vcmRlciBwb2lu
dCB0byB0aW1lbGluZSFcbiIpOwo+PiAgIAlkbWFfZmVuY2VfY2hhaW5faW5pdChjaGFpbiwgcHJl
diwgZmVuY2UsIHBvaW50KTsKPj4gICAJcmN1X2Fzc2lnbl9wb2ludGVyKHN5bmNvYmotPmZlbmNl
LCAmY2hhaW4tPmJhc2UpOwo+PiAgIAo+PiAtLSAKPj4gMi4xNy4xCj4+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
