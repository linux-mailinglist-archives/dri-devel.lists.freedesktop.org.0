Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C8174915
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 10:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875E6E696;
	Thu, 25 Jul 2019 08:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E586E696
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 08:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnwRCSNISTTJGsMjW7ZKJFSCP8ebuiRIBjW6TV0uDGY910p25NK2QARCeK4/neddswfDuZy87impvBVKcsZrod+A3mm4D6jClViChSaw1GAmQmQYsAxhiMnDOBQjW2LZO0nDlHAlrOQ7RQvvth3je8vvmb9WvVMVX5okonk55C6U0gnhUqYpDovLN3cvpus7pdruCQl+8Wk002RfiSRerkVyuaEIEcatCMmfHzUnrxOzUEy3DpWlooCBnvhi4UR2JtGV4HaKiJABINDi2r4M/D+MARnlfb9E0MqHTjFJjiRCVyMzfrAKoHoSw0I2dX2uPcS0qpA2/EEKhuuoTqg6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZg+k19ify2Bjw6181LGTPtkzfwgB11ltBoL2pL+5PE=;
 b=DpEk5k5PfTeaZET3tBhblh1E7vNPh2fB5s1OpaPgY80BWyjNmDe4Abbd67wMQT1ulyg2sEqi3DlNSAs19CATL8cFsHCAG+ubyZ8gb9obLE9QvQnQNLcTNyIy7VpHFqc3tGm+1jGz9xgubWeRerPvwhozSyFAfPVLOQa32YlF+k9PTnbt4acgJQH/eFn8RAoD2vROyfVu17wkVbdgAHGYl4DF1wJQQP54Lcor1o4w0UxrpiShGxkorgjSqOZEVUfqz1cGFkead1GY4yZlrLyn2DROEwgNFZK+RAgEZ/zjmkVLBAQD3XtHLtnllwBR7hRFY+IhclOdRtqgNNBdBhe2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0069.namprd12.prod.outlook.com (2603:10b6:0:57::13) by
 DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 08:26:50 +0000
Received: from CO1NAM03FT056.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM3PR12CA0069.outlook.office365.com
 (2603:10b6:0:57::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.12 via Frontend
 Transport; Thu, 25 Jul 2019 08:26:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT056.mail.protection.outlook.com (10.152.81.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Thu, 25 Jul 2019 08:26:50 +0000
Received: from [10.65.99.155] (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server (TLS) id 14.3.389.1; Thu, 25 Jul
 2019 03:26:48 -0500
Subject: Re: [PATCH libdrm] libdrm: wrap new flexible syncobj query interface
 v2
To: Chunming Zhou <david1.zhou@amd.com>, <dri-devel@lists.freedesktop.org>
References: <20190725081111.21568-1-david1.zhou@amd.com>
From: zhoucm1 <zhoucm1@amd.com>
Message-ID: <e743becd-3fc6-2852-87e5-639302859a16@amd.com>
Date: Thu, 25 Jul 2019 16:26:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190725081111.21568-1-david1.zhou@amd.com>
Content-Language: en-US
X-Originating-IP: [10.34.1.3]
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(428003)(199004)(189003)(26005)(316002)(81156014)(16576012)(66574012)(426003)(76176011)(7736002)(486006)(305945005)(64126003)(8676002)(3846002)(446003)(478600001)(50466002)(58126008)(68736007)(14444005)(110136005)(54906003)(11346002)(16526019)(186003)(2486003)(2616005)(65826007)(23676004)(8936002)(6116002)(5660300002)(4326008)(476003)(336012)(65956001)(6666004)(356004)(53936002)(2906002)(6246003)(31686004)(70586007)(36756003)(67846002)(81166006)(2870700001)(229853002)(31696002)(47776003)(65806001)(126002)(70206006)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB2491; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c25998f-6034-4284-c1d1-08d710d9d74c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR1201MB2491; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2491:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB249128317EAFC08B72ECD106B4C10@DM5PR1201MB2491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-Forefront-PRVS: 0109D382B0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6v7ADsNado6MLCFeEHb0eOTWgsznXt2AWL6OVTCuIFNRtwMYMm/aFH3JuJdC67NsYjisBJmT2cbnm3jP7d39Y4JrWYUMHApF8rCdOkui2oNvKqWIHSHPnzZQ0+OOQe2LIty6BoG+UIN6tFiVuHFxRkwPQ15Q0vOSQkGUPHzogPICU2jQLI6mNqz+wN5rVNgDbHBGEbx/IphKmfvflfzFeUh3ZzkrUtt9UdU9yt8+vs0zWwr8KhpQm2E6DCA/GWmtqgvs8Hyswy8iKSW0ruIMmVOPwq5XT/HkgfrnvcghiQPsBiSs+TAQ9wlyA683OCrEJZ1SLudPxacpf0d4JZB4XveH1tt9pSjjqutuje/dkkk+XyywcxBHIAAEozNPxFG0dpgR0lLqPE8StB63XITYJ83gO3LPVEo+cwZXy8c/Sn4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2019 08:26:50.0332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c25998f-6034-4284-c1d1-08d710d9d74c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZg+k19ify2Bjw6181LGTPtkzfwgB11ltBoL2pL+5PE=;
 b=w9tFMBPg+ul/ZpbvqcNuVqkv9ry5rbgkEQSVs+wwnRzavCAbmELc68HgFZ19arnwLqfL7uRUucGbkOkkKo3rPAcNGjewSmQ15QWdBC6dIXj1H+d9mR6whzdVN+SQr3IrXq3kJ9U3rIDehKTqc0x8ZiJmYe0DQQR0ZemhfbUptgk=
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmsgZ3V5cy4gU2luY2UgSSBoYXZlIHdyaXRlIHBlcm1pc3Npb24gdG8gbGliZHJtIG1hc3Qs
IEkgbmVlZCB5b3VyIApoZWxwIHRvIHB1c2ggcGF0Y2guCgotRGF2aWQKCgpPbiAyMDE55bm0MDfm
nIgyNeaXpSAxNjoxMSwgQ2h1bm1pbmcgWmhvdSB3cm90ZToKPiB2Mjogbml0LXBpY2tzIGZpeAo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KPiBD
YzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgo+IENj
OiBDaHJpc3RpYW4gS8O2bmlnIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBGb3IgdGhl
IHhmODZkcm0uW2NoXSBwYXJ0IDogUmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9u
ZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KPiAtLS0KPiAgIGFtZGdwdS9hbWRncHUtc3ltYm9s
LWNoZWNrIHwgIDEgKwo+ICAgYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICAgfCAxOCArKysrKysr
KysrKysrKysrKysKPiAgIGFtZGdwdS9hbWRncHVfY3MuYyAgICAgICAgIHwgMTAgKysrKysrKysr
Kwo+ICAgaW5jbHVkZS9kcm0vZHJtLmggICAgICAgICAgfCAgMyArKy0KPiAgIHhmODZkcm0uYyAg
ICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4gICB4Zjg2ZHJtLmggICAgICAg
ICAgICAgICAgICB8ICAyICsrCj4gICA2IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1LXN5bWJvbC1jaGVj
ayBiL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrCj4gaW5kZXggMjc0YjRjNmQuLjU5N2E5OWIy
IDEwMDc1NQo+IC0tLSBhL2FtZGdwdS9hbWRncHUtc3ltYm9sLWNoZWNrCj4gKysrIGIvYW1kZ3B1
L2FtZGdwdS1zeW1ib2wtY2hlY2sKPiBAQCAtNTYsNiArNTYsNyBAQCBhbWRncHVfY3Nfc3luY29i
al9leHBvcnRfc3luY19maWxlMgo+ICAgYW1kZ3B1X2NzX3N5bmNvYmpfaW1wb3J0X3N5bmNfZmls
ZQo+ICAgYW1kZ3B1X2NzX3N5bmNvYmpfaW1wb3J0X3N5bmNfZmlsZTIKPiAgIGFtZGdwdV9jc19z
eW5jb2JqX3F1ZXJ5Cj4gK2FtZGdwdV9jc19zeW5jb2JqX3F1ZXJ5Mgo+ICAgYW1kZ3B1X2NzX3N5
bmNvYmpfcmVzZXQKPiAgIGFtZGdwdV9jc19zeW5jb2JqX3NpZ25hbAo+ICAgYW1kZ3B1X2NzX3N5
bmNvYmpfdGltZWxpbmVfc2lnbmFsCj4gZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUuaCBiL2Ft
ZGdwdS9hbWRncHUuaAo+IGluZGV4IDlkOWIwODMyLi4xOWY3NGJkNiAxMDA2NDQKPiAtLS0gYS9h
bWRncHUvYW1kZ3B1LmgKPiArKysgYi9hbWRncHUvYW1kZ3B1LmgKPiBAQCAtMTU5MSw2ICsxNTkx
LDI0IEBAIGludCBhbWRncHVfY3Nfc3luY29ial90aW1lbGluZV93YWl0KGFtZGdwdV9kZXZpY2Vf
aGFuZGxlIGRldiwKPiAgIGludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVfZGV2aWNl
X2hhbmRsZSBkZXYsCj4gICAJCQkgICAgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2lu
dHMsCj4gICAJCQkgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMpOwo+ICsvKioKPiArICogIFF1ZXJ5
IHN5bmMgb2JqZWN0cyBsYXN0IHNpZ25hbGVkIG9yIHN1Ym1pdHRlZCBwb2ludC4KPiArICoKPiAr
ICogXHBhcmFtICAgZGV2CSAgICAtIFxjIFtpbl0gc2VsZi1leHBsYW5hdG9yeQo+ICsgKiBccGFy
YW0gICBoYW5kbGVzIC0gXGMgW2luXSBhcnJheSBvZiBzeW5jIG9iamVjdCBoYW5kbGVzCj4gKyAq
IFxwYXJhbSAgIHBvaW50cyAtIFxjIFtvdXRdIGFycmF5IG9mIHN5bmMgcG9pbnRzIHJldHVybmVk
LCB3aGljaCBwcmVzZW50cwo+ICsgKiBzeW5jb2JqIHBheWxvYWQuCj4gKyAqIFxwYXJhbSAgIG51
bV9oYW5kbGVzIC0gXGMgW2luXSBzZWxmLWV4cGxhbmF0b3J5Cj4gKyAqIFxwYXJhbSAgIGZsYWdz
ICAgLSBcYyBbaW5dIGEgYml0bWFzayBvZiBEUk1fU1lOQ09CSl9RVUVSWV9GTEFHU18qCj4gKyAq
Cj4gKyAqIFxyZXR1cm4gICAwIG9uIHN1Y2Nlc3Ncbgo+ICsgKiAgICAgICAgICAtRVRJTUUgLSBU
aW1lb3V0Cj4gKyAqICAgICAgICAgIDwwIC0gTmVnYXRpdmUgUE9TSVggRXJyb3IgY29kZQo+ICsg
Kgo+ICsgKi8KPiAraW50IGFtZGdwdV9jc19zeW5jb2JqX3F1ZXJ5MihhbWRncHVfZGV2aWNlX2hh
bmRsZSBkZXYsCj4gKwkJCSAgICAgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMs
Cj4gKwkJCSAgICAgdW5zaWduZWQgbnVtX2hhbmRsZXMsIHVpbnQzMl90IGZsYWdzKTsKPiAgIAo+
ICAgLyoqCj4gICAgKiAgRXhwb3J0IGtlcm5lbCBzeW5jIG9iamVjdCB0byBzaGFyZWFibGUgZmQu
Cj4gZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHVfY3MuYyBiL2FtZGdwdS9hbWRncHVfY3MuYwo+
IGluZGV4IDk3N2ZhM2NmLi4wMWUyYjJjOCAxMDA2NDQKPiAtLS0gYS9hbWRncHUvYW1kZ3B1X2Nz
LmMKPiArKysgYi9hbWRncHUvYW1kZ3B1X2NzLmMKPiBAQCAtNzIxLDYgKzcyMSwxNiBAQCBkcm1f
cHVibGljIGludCBhbWRncHVfY3Nfc3luY29ial9xdWVyeShhbWRncHVfZGV2aWNlX2hhbmRsZSBk
ZXYsCj4gICAJcmV0dXJuIGRybVN5bmNvYmpRdWVyeShkZXYtPmZkLCBoYW5kbGVzLCBwb2ludHMs
IG51bV9oYW5kbGVzKTsKPiAgIH0KPiAgIAo+ICtkcm1fcHVibGljIGludCBhbWRncHVfY3Nfc3lu
Y29ial9xdWVyeTIoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAo+ICsJCQkJCXVpbnQzMl90ICpo
YW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAo+ICsJCQkJCXVuc2lnbmVkIG51bV9oYW5kbGVzLCB1
aW50MzJfdCBmbGFncykKPiArewo+ICsJaWYgKCFkZXYpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4g
Kwo+ICsJcmV0dXJuIGRybVN5bmNvYmpRdWVyeTIoZGV2LT5mZCwgaGFuZGxlcywgcG9pbnRzLCBu
dW1faGFuZGxlcywgZmxhZ3MpOwo+ICt9Cj4gKwo+ICAgZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2Nz
X2V4cG9ydF9zeW5jb2JqKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldiwKPiAgIAkJCQkJdWludDMy
X3QgaGFuZGxlLAo+ICAgCQkJCQlpbnQgKnNoYXJlZF9mZCkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtLmggYi9pbmNsdWRlL2RybS9kcm0uaAo+IGluZGV4IDUzMjc4N2JmLi5hZjM3YTgw
YiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bS5oCj4gQEAgLTc3MSwxMSArNzcxLDEyIEBAIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7Cj4g
ICAJX191MzIgcGFkOwo+ICAgfTsKPiAgIAo+ICsjZGVmaW5lIERSTV9TWU5DT0JKX1FVRVJZX0ZM
QUdTX0xBU1RfU1VCTUlUVEVEICgxIDw8IDApIC8qIGxhc3QgYXZhaWxhYmxlIHBvaW50IG9uIHRp
bWVsaW5lIHN5bmNvYmogKi8KPiAgIHN0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7
Cj4gICAJX191NjQgaGFuZGxlczsKPiAgIAlfX3U2NCBwb2ludHM7Cj4gICAJX191MzIgY291bnRf
aGFuZGxlczsKPiAtCV9fdTMyIHBhZDsKPiArCV9fdTMyIGZsYWdzOwo+ICAgfTsKPiAgIAo+ICAg
Cj4gZGlmZiAtLWdpdCBhL3hmODZkcm0uYyBiL3hmODZkcm0uYwo+IGluZGV4IDk1M2ZjNzYyLi4y
OGE2MTI2NCAxMDA2NDQKPiAtLS0gYS94Zjg2ZHJtLmMKPiArKysgYi94Zjg2ZHJtLmMKPiBAQCAt
NDMxNCw2ICs0MzE0LDIxIEBAIGRybV9wdWJsaWMgaW50IGRybVN5bmNvYmpRdWVyeShpbnQgZmQs
IHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAo+ICAgICAgIHJldHVybiAwOwo+
ICAgfQo+ICAgCj4gK2RybV9wdWJsaWMgaW50IGRybVN5bmNvYmpRdWVyeTIoaW50IGZkLCB1aW50
MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywKPiArCQkJCXVpbnQzMl90IGhhbmRsZV9j
b3VudCwgdWludDMyX3QgZmxhZ3MpCj4gK3sKPiArICAgIHN0cnVjdCBkcm1fc3luY29ial90aW1l
bGluZV9hcnJheSBhcmdzOwo+ICsKPiArICAgIG1lbWNsZWFyKGFyZ3MpOwo+ICsgICAgYXJncy5o
YW5kbGVzID0gKHVpbnRwdHJfdCloYW5kbGVzOwo+ICsgICAgYXJncy5wb2ludHMgPSAodWludHB0
cl90KXBvaW50czsKPiArICAgIGFyZ3MuY291bnRfaGFuZGxlcyA9IGhhbmRsZV9jb3VudDsKPiAr
ICAgIGFyZ3MuZmxhZ3MgPSBmbGFnczsKPiArCj4gKyAgICByZXR1cm4gZHJtSW9jdGwoZmQsIERS
TV9JT0NUTF9TWU5DT0JKX1FVRVJZLCAmYXJncyk7Cj4gK30KPiArCj4gKwo+ICAgZHJtX3B1Ymxp
YyBpbnQgZHJtU3luY29ialRyYW5zZmVyKGludCBmZCwKPiAgIAkJCQkgIHVpbnQzMl90IGRzdF9o
YW5kbGUsIHVpbnQ2NF90IGRzdF9wb2ludCwKPiAgIAkJCQkgIHVpbnQzMl90IHNyY19oYW5kbGUs
IHVpbnQ2NF90IHNyY19wb2ludCwKPiBkaWZmIC0tZ2l0IGEveGY4NmRybS5oIGIveGY4NmRybS5o
Cj4gaW5kZXggM2ZiMWQxY2EuLjU1Y2VhZWQ5IDEwMDY0NAo+IC0tLSBhL3hmODZkcm0uaAo+ICsr
KyBiL3hmODZkcm0uaAo+IEBAIC04ODQsNiArODg0LDggQEAgZXh0ZXJuIGludCBkcm1TeW5jb2Jq
VGltZWxpbmVXYWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90ICpwb2ludHMs
Cj4gICAJCQkJICB1aW50MzJfdCAqZmlyc3Rfc2lnbmFsZWQpOwo+ICAgZXh0ZXJuIGludCBkcm1T
eW5jb2JqUXVlcnkoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDY0X3QgKnBvaW50cywK
PiAgIAkJCSAgIHVpbnQzMl90IGhhbmRsZV9jb3VudCk7Cj4gK2V4dGVybiBpbnQgZHJtU3luY29i
alF1ZXJ5MihpbnQgZmQsIHVpbnQzMl90ICpoYW5kbGVzLCB1aW50NjRfdCAqcG9pbnRzLAo+ICsJ
CQkgICAgdWludDMyX3QgaGFuZGxlX2NvdW50LCB1aW50MzJfdCBmbGFncyk7Cj4gICBleHRlcm4g
aW50IGRybVN5bmNvYmpUcmFuc2ZlcihpbnQgZmQsCj4gICAJCQkgICAgICB1aW50MzJfdCBkc3Rf
aGFuZGxlLCB1aW50NjRfdCBkc3RfcG9pbnQsCj4gICAJCQkgICAgICB1aW50MzJfdCBzcmNfaGFu
ZGxlLCB1aW50NjRfdCBzcmNfcG9pbnQsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
