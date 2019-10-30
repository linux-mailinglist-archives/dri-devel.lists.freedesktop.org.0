Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED6EA41E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 20:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DD16ED23;
	Wed, 30 Oct 2019 19:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482BB6ED14;
 Wed, 30 Oct 2019 19:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkplHQk+5tcg16x27yTt+pbRXUm585KemltRUZedgC1cXQDp2OQF1DcORnm2O6m6XBGuu3BIfsCo1Wz0khBzoTUteJIdKCvRFW8WEcuqHlu5uQbnuKrzelMZydby9ZnT+5YVAcXwiZOjY+vJltPyOy5L9NizVo7ERljIDVkT8zmRAYwQjLnUDKDI+SyqUQ9fAHvvuuAe3cWDCrO4pV110+ALcnJAQJORqnap5jgV6OjBMB6ze0F8JAC4BsUUhIRTi5s+mIlLo4rvw6zmMXVIJmIiD/5jNYfHRTo9yWzWRsBuDZ+88SOGhP4wjmMSH8u+HJIn1Q0IwimJ9NI3d5GyVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JgIGw5uDAPqC+2ghLVNL6FJSl4yKmT3Mvd49Z942tQ=;
 b=DytPnVDA6FRCxWo45/L2glwyyNX4uwzRDJY3hZQKx552g8Y7ewjP+caG3UNcocNk2QiamNXvaiZ76ZQFukNw5OXDEZkGAycq8csw4TDUFr4OZjTJPBVoCPlOyz2hqlOuaeuGtNHsCK5//WT/+N5i2BGgbTFNFQphEfyQl5Oxm3yOc+OSTTm5gmC/+lZvZY6xVPG/0ptdvWVm51HqV8uz5bmpzIvGjkVtzwirDESdZ1UbGUmsiB8TJLqN0BRXinZrcIl5BGOkB7mX+mPbB8rEfe4BWUOFArEAeGpbsug60HmcEU+mhs4Uqdlpv/LMBicScbRWlmPqVsKcrpXJTdaSiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0035.namprd12.prod.outlook.com (2603:10b6:5:1c0::48)
 by DM5PR12MB1292.namprd12.prod.outlook.com (2603:10b6:3:73::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.18; Wed, 30 Oct 2019 19:24:41 +0000
Received: from CO1NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM6PR12CA0035.outlook.office365.com
 (2603:10b6:5:1c0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via Frontend
 Transport; Wed, 30 Oct 2019 19:24:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT041.mail.protection.outlook.com (10.152.81.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Wed, 30 Oct 2019 19:24:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:40 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 30 Oct
 2019 14:24:40 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 30 Oct 2019 14:24:39 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/13] drm/dp_mst: Add helpers for MST DSC and virtual DPCD aux
Date: Wed, 30 Oct 2019 15:24:24 -0400
Message-ID: <20191030192431.5798-7-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030192431.5798-1-mikita.lipski@amd.com>
References: <20191030192431.5798-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(428003)(189003)(199004)(1076003)(11346002)(126002)(7696005)(478600001)(486006)(476003)(305945005)(426003)(6916009)(86362001)(446003)(336012)(47776003)(2616005)(186003)(26005)(5660300002)(76176011)(51416003)(50466002)(8936002)(16586007)(53416004)(54906003)(81156014)(8676002)(2906002)(5024004)(14444005)(316002)(36756003)(48376002)(50226002)(2351001)(70206006)(70586007)(4326008)(81166006)(6666004)(356004)(2876002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1292; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5eb53d0-2234-43b9-d8fe-08d75d6ed006
X-MS-TrafficTypeDiagnostic: DM5PR12MB1292:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12923A60698214FFB5AD3A5CE4600@DM5PR12MB1292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mt727D6TeeOk5isPpGS6aX8ZWcA5Q5yOQuiwKHKYklUui5YpHCbVnSUVOBdLvoYhvqteIFx+KlvWjaq/EgkqqfeC55gkpKh71TMuxaoDWy4Hj3fWo7WHKtnWAZSLUCvivXq6wA0lIpUYphD7n6u7/rFKR9nFX5oPyycZa7P9Dq2zAaGhFvcsGsfV44JRqvakdY/tUVnoqnUVpM5W1b7opcczD1fCKM1EjmA6UJOzltdBBPoGZTEqUHJuMJWGrNPiyy1coY7PpYYwkpuFTDFt6eQTsUtcilqNWUbdVt0x83oyVrSOYeldgDsSacp+dBFFg4J/eFcIwkMGtj+W58Y8QLXMlzGikps2rxINkoVpUuYn6eHrrhhGSbYAngIZ31gPQ30CBb3CyMDTPvs2zq0iMJwi+nX22NNcPRi2GfrpDXDlSOqLehYAiGt2xWt1ZRPT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 19:24:41.2484 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5eb53d0-2234-43b9-d8fe-08d75d6ed006
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1292
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JgIGw5uDAPqC+2ghLVNL6FJSl4yKmT3Mvd49Z942tQ=;
 b=nlT87gPmKIchYbINgxPS4olX0VZVlofV4Tg9LB1rk18G5zQDUco36O4H69cp4KXSa2mXtK9qpbhBwh6tNd0/nWu5C4gMrJm0McG1VAIKFI8Tqe6QMqX79xEumLZhluF/YwDH01iy4zG2CovDeYTC9QgLQ/qWT4xIyimZUEraLsw=
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
Cc: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgoKQWRkIGRybV9kcF9t
c3RfZHNjX2F1eF9mb3JfcG9ydC4gVG8gZW5hYmxlIERTQywgdGhlIERTQ19FTkFCTEVECnJlZ2lz
dGVyIG1pZ2h0IGhhdmUgdG8gYmUgd3JpdHRlbiBvbiB0aGUgbGVhZiBwb3J0J3MgRFBDRCwKaXRz
IHBhcmVudCdzIERQQ0QsIG9yIHRoZSBNU1QgbWFuYWdlcidzIERQQ0QuIFRoaXMgZnVuY3Rpb24K
ZmluZHMgdGhlIGNvcnJlY3QgYXV4IGZvciB0aGUgam9iLgoKQXMgcGFydCBvZiB0aGlzLCBhZGQg
ZHJtX2RwX21zdF9pc192aXJ0dWFsX2RwY2QuIFZpcnR1YWwgRFBDRAppcyBhIERQIGZlYXR1cmUg
bmV3IGluIERQIHYxLjQsIHdoaWNoIGV4cG9zZXMgY2VydGFpbiBEUENECnJlZ2lzdGVycyBvbiB2
aXJ0dWFsIHBvcnRzLgoKdjI6IFJlbWVtYmVyIHRvIHVubG9jayBtdXRleCBvbiBhbGwgcGF0aHMK
djM6IFJlZmFjdG9yIHRvIG1hdGNoIGNvZGluZyBzdHlsZSBhbmQgaW5jcmVhc2UgYnJldml0eQoK
UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBX
ZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgRnJh
bmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMgfCAxMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUv
ZHJtL2RybV9kcF9tc3RfaGVscGVyLmggICAgICAgfCAgIDIgKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MjkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4
IDUwMjkyM2MyNDQ1MC4uZDhmOWJhMjdiNTU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKQEAgLTQxNTAsMyArNDE1MCwxMzAgQEAgc3RhdGljIHZvaWQgZHJtX2RwX21zdF91
bnJlZ2lzdGVyX2kyY19idXMoc3RydWN0IGRybV9kcF9hdXggKmF1eCkKIHsKIAlpMmNfZGVsX2Fk
YXB0ZXIoJmF1eC0+ZGRjKTsKIH0KKworLyoqCisgKiBkcm1fZHBfbXN0X2lzX3ZpcnR1YWxfZHBj
ZCgpIC0gSXMgdGhlIGdpdmVuIHBvcnQgYSB2aXJ0dWFsIERQIFBlZXIgRGV2aWNlCisgKiBAcG9y
dDogVGhlIHBvcnQgdG8gY2hlY2sKKyAqCisgKiBBIHNpbmdsZSBwaHlzaWNhbCBNU1QgaHViIG9i
amVjdCBjYW4gYmUgcmVwcmVzZW50ZWQgaW4gdGhlIHRvcG9sb2d5CisgKiBieSBtdWx0aXBsZSBi
cmFuY2hlcywgd2l0aCB2aXJ0dWFsIHBvcnRzIGJldHdlZW4gdGhvc2UgYnJhbmNoZXMuCisgKgor
ICogQXMgb2YgRFAxLjQsIEFuIE1TVCBodWIgd2l0aCBpbnRlcm5hbCAodmlydHVhbCkgcG9ydHMg
bXVzdCBleHBvc2UKKyAqIGNlcnRhaW4gRFBDRCByZWdpc3RlcnMgb3ZlciB0aG9zZSBwb3J0cy4g
U2VlIHNlY3Rpb25zIDIuNi4xLjEuMQorICogYW5kIDIuNi4xLjEuMiBvZiBEaXNwbGF5IFBvcnQg
c3BlY2lmaWNhdGlvbiB2MS40IGZvciBkZXRhaWxzLgorICoKKyAqIE1heSBhY3F1aXJlIG1nci0+
bG9jaworICoKKyAqIFJldHVybnM6CisgKiB0cnVlIGlmIHRoZSBwb3J0IGlzIGEgdmlydHVhbCBE
UCBwZWVyIGRldmljZSwgZmFsc2Ugb3RoZXJ3aXNlCisgKi8KK3N0YXRpYyBib29sIGRybV9kcF9t
c3RfaXNfdmlydHVhbF9kcGNkKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCit7CisJc3Ry
dWN0IGRybV9kcF9tc3RfcG9ydCAqZG93bnN0cmVhbV9wb3J0OworCisJaWYgKCFwb3J0IHx8IHBv
cnQtPmRwY2RfcmV2IDwgRFBfRFBDRF9SRVZfMTQpCisJCXJldHVybiBmYWxzZTsKKworCS8qIFZp
cnR1YWwgRFAgU2luayAoSW50ZXJuYWwgRGlzcGxheSBQYW5lbCkgKi8KKwlpZiAocG9ydC0+cG9y
dF9udW0gPj0gOCkKKwkJcmV0dXJuIHRydWU7CisKKwkvKiBEUC10by1IRE1JIFByb3RvY29sIENv
bnZlcnRlciAqLworCWlmIChwb3J0LT5wZHQgPT0gRFBfUEVFUl9ERVZJQ0VfRFBfTEVHQUNZX0NP
TlYgJiYKKwkgICAgIXBvcnQtPm1jcyAmJgorCSAgICBwb3J0LT5sZHBzKQorCQlyZXR1cm4gdHJ1
ZTsKKworCS8qIERQLXRvLURQICovCisJbXV0ZXhfbG9jaygmcG9ydC0+bWdyLT5sb2NrKTsKKwlp
ZiAocG9ydC0+cGR0ID09IERQX1BFRVJfREVWSUNFX01TVF9CUkFOQ0hJTkcgJiYKKwkgICAgcG9y
dC0+bXN0YiAmJgorCSAgICBwb3J0LT5tc3RiLT5udW1fcG9ydHMgPT0gMikgeworCQlsaXN0X2Zv
cl9lYWNoX2VudHJ5KGRvd25zdHJlYW1fcG9ydCwgJnBvcnQtPm1zdGItPnBvcnRzLCBuZXh0KSB7
CisJCQlpZiAoZG93bnN0cmVhbV9wb3J0LT5wZHQgPT0gRFBfUEVFUl9ERVZJQ0VfU1NUX1NJTksg
JiYKKwkJCSAgICAhZG93bnN0cmVhbV9wb3J0LT5pbnB1dCkgeworCQkJCW11dGV4X3VubG9jaygm
cG9ydC0+bWdyLT5sb2NrKTsKKwkJCQlyZXR1cm4gdHJ1ZTsKKwkJCX0KKwkJfQorCX0KKwltdXRl
eF91bmxvY2soJnBvcnQtPm1nci0+bG9jayk7CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKKy8qKgor
ICogZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KCkgLSBGaW5kIHRoZSBjb3JyZWN0IGF1eCBm
b3IgRFNDCisgKiBAcG9ydDogVGhlIHBvcnQgdG8gY2hlY2suIEEgbGVhZiBvZiB0aGUgTVNUIHRy
ZWUgd2l0aCBhbiBhdHRhY2hlZCBkaXNwbGF5LgorICoKKyAqIERlcGVuZGluZyBvbiB0aGUgc2l0
dWF0aW9uLCBEU0MgbWF5IGJlIGVuYWJsZWQgdmlhIHRoZSBlbmRwb2ludCBhdXgsCisgKiB0aGUg
aW1tZWRpYXRlbHkgdXBzdHJlYW0gYXV4LCBvciB0aGUgY29ubmVjdG9yJ3MgcGh5c2ljYWwgYXV4
LgorICoKKyAqIFRoaXMgaXMgYm90aCB0aGUgY29ycmVjdCBhdXggdG8gcmVhZCBEU0NfQ0FQQUJJ
TElUWSBhbmQgdGhlCisgKiBjb3JyZWN0IGF1eCB0byB3cml0ZSBEU0NfRU5BQkxFRC4KKyAqCisg
KiBUaGlzIG9wZXJhdGlvbiBjYW4gYmUgZXhwZW5zaXZlICh1cCB0byBmb3VyIGF1eCByZWFkcyks
IHNvCisgKiB0aGUgY2FsbGVyIHNob3VsZCBjYWNoZSB0aGUgcmV0dXJuLgorICoKKyAqIFJldHVy
bnM6CisgKiBOVUxMIGlmIERTQyBjYW5ub3QgYmUgZW5hYmxlZCBvbiB0aGlzIHBvcnQsIG90aGVy
d2lzZSB0aGUgYXV4IGRldmljZQorICovCitzdHJ1Y3QgZHJtX2RwX2F1eCAqZHJtX2RwX21zdF9k
c2NfYXV4X2Zvcl9wb3J0KHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpCit7CisJc3RydWN0
IGRybV9kcF9tc3RfcG9ydCAqaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQ7CisJc3RydWN0IGRybV9k
cF9tc3RfcG9ydCAqZmVjX3BvcnQ7CisKKwlpZiAoIXBvcnQpCisJCXJldHVybiBOVUxMOworCisJ
aWYgKHBvcnQtPnBhcmVudCkKKwkJaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQgPSBwb3J0LT5wYXJl
bnQtPnBvcnRfcGFyZW50OworCWVsc2UKKwkJaW1tZWRpYXRlX3Vwc3RyZWFtX3BvcnQgPSBOVUxM
OworCisJZmVjX3BvcnQgPSBpbW1lZGlhdGVfdXBzdHJlYW1fcG9ydDsKKwl3aGlsZSAoZmVjX3Bv
cnQpIHsKKwkJLyoKKwkJICogRWFjaCBwaHlzaWNhbCBsaW5rIChpLmUuIG5vdCBhIHZpcnR1YWwg
cG9ydCkgYmV0d2VlbiB0aGUKKwkJICogb3V0cHV0IGFuZCB0aGUgcHJpbWFyeSBkZXZpY2UgbXVz
dCBzdXBwb3J0IEZFQworCQkgKi8KKwkJaWYgKCFkcm1fZHBfbXN0X2lzX3ZpcnR1YWxfZHBjZChm
ZWNfcG9ydCkgJiYKKwkJICAgICFmZWNfcG9ydC0+ZmVjX2NhcGFibGUpCisJCQlyZXR1cm4gTlVM
TDsKKworCQlmZWNfcG9ydCA9IGZlY19wb3J0LT5wYXJlbnQtPnBvcnRfcGFyZW50OworCX0KKwor
CS8qIERQLXRvLURQIHBlZXIgZGV2aWNlICovCisJaWYgKGRybV9kcF9tc3RfaXNfdmlydHVhbF9k
cGNkKGltbWVkaWF0ZV91cHN0cmVhbV9wb3J0KSkgeworCQl1OCB1cHN0cmVhbV9kc2M7CisJCXU4
IGVuZHBvaW50X2RzYzsKKwkJdTggZW5kcG9pbnRfZmVjOworCisJCWlmIChkcm1fZHBfZHBjZF9y
ZWFkKCZwb3J0LT5hdXgsCisJCQkJICAgICBEUF9EU0NfU1VQUE9SVCwgJmVuZHBvaW50X2RzYywg
MSkgPCAwKQorCQkJcmV0dXJuIE5VTEw7CisJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5h
dXgsCisJCQkJICAgICBEUF9GRUNfQ0FQQUJJTElUWSwgJmVuZHBvaW50X2ZlYywgMSkgPCAwKQor
CQkJcmV0dXJuIE5VTEw7CisJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZpbW1lZGlhdGVfdXBzdHJl
YW1fcG9ydC0+YXV4LAorCQkJCSAgICAgRFBfRFNDX1NVUFBPUlQsICZ1cHN0cmVhbV9kc2MsIDEp
IDwgMCkKKwkJCXJldHVybiBOVUxMOworCisJCS8qIEVucG9pbnQgZGVjb21wcmVzc2lvbiB3aXRo
IERQLXRvLURQIHBlZXIgZGV2aWNlICovCisJCWlmICgoZW5kcG9pbnRfZHNjICYgRFBfRFNDX0RF
Q09NUFJFU1NJT05fSVNfU1VQUE9SVEVEKSAmJgorCQkgICAgKGVuZHBvaW50X2ZlYyAmIERQX0ZF
Q19DQVBBQkxFKSAmJgorCQkgICAgKHVwc3RyZWFtX2RzYyAmIDB4MikgLyogRFNDIHBhc3N0aHJv
dWdoICovKQorCQkJcmV0dXJuICZwb3J0LT5hdXg7CisKKwkJLyogVmlydHVhbCBEUENEIGRlY29t
cHJlc3Npb24gd2l0aCBEUC10by1EUCBwZWVyIGRldmljZSAqLworCQlyZXR1cm4gJmltbWVkaWF0
ZV91cHN0cmVhbV9wb3J0LT5hdXg7CisJfQorCisJLyogVmlydHVhbCBEUENEIGRlY29tcHJlc3Np
b24gd2l0aCBEUC10by1IRE1JIG9yIFZpcnR1YWwgRFAgU2luayAqLworCWlmIChkcm1fZHBfbXN0
X2lzX3ZpcnR1YWxfZHBjZChwb3J0KSkKKwkJcmV0dXJuICZwb3J0LT5hdXg7CisKKwlyZXR1cm4g
TlVMTDsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX21zdF9kc2NfYXV4X2Zvcl9wb3J0KTsKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmggYi9pbmNsdWRlL2RybS9k
cm1fZHBfbXN0X2hlbHBlci5oCmluZGV4IGYxMTNhZTA0ZmE4OC4uNGNmNzM4NTQ1ZGZiIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9kcF9tc3RfaGVscGVyLmgKQEAgLTY3Myw2ICs2NzMsOCBAQCBpbnQgX19tdXN0X2NoZWNr
IGRybV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSk7
CiB2b2lkIGRybV9kcF9tc3RfZ2V0X3BvcnRfbWFsbG9jKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQg
KnBvcnQpOwogdm9pZCBkcm1fZHBfbXN0X3B1dF9wb3J0X21hbGxvYyhzdHJ1Y3QgZHJtX2RwX21z
dF9wb3J0ICpwb3J0KTsKIAorc3RydWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1eF9m
b3JfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0KTsKKwogZXh0ZXJuIGNvbnN0IHN0
cnVjdCBkcm1fcHJpdmF0ZV9zdGF0ZV9mdW5jcyBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlX2Z1
bmNzOwogCiAvKioKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
