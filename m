Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C787984E9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E466E992;
	Wed, 21 Aug 2019 20:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750044.outbound.protection.outlook.com [40.107.75.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095656E985;
 Wed, 21 Aug 2019 20:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beuLFT1ZWfbabQXGKohVsqSWFjxV1Ruicynr8LcbMCSzLGbScptDPsil+mNvrOoNFV8VXqhWAqqpFoyTtTiceCefg0Ffkqa2UumC5x+G2JcCUuxrgHTwxFf6GbXI+uNSMNs8Cov43zGQljA8UZlQyX+4FwMs+nfz0u8DBZwwH9zIlaK8vK3CaktikbWzAzMdohS7VrpNBAu5fOd1dCIUqjewElAVDlXs7j90TECI1dp0OpWu/KsbCbbxCxeyd6jbSs6AVgM6pvqUVHe1FPnR5Am3ljpyS44TnGNxhEeSQjmIpCd/0ikb+OewsqNxA1T18KOCskjeBpjtm/SGhCm2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcumYwHSxR5cVhRbpN3wgIzuxKhPJ9GdIZAOCKyyPmo=;
 b=jz4zBknX0xdyz98dgUmZDGlCJYOgAoFcnLJ0wFrqbeiICEA7WAyza/aiwHw5Zbl3KrRrbjPmuNLzJ5zf3WDuEcQNNATjJOYg6TPQvoV91OupO+EJC5kO+BNVEYMrRENyxGItgSwMNmVwzgbcQjecgbXxgQrN0qlPqTzWloVrWF7E2tih3emI/0Aex5yfs9xKIWMqOZXWtCC4WWCPYaRQgJfr86N244WPG6Oe9ydf+T3tKGduB6EHr0w5yd77mSthBwiyLmLIyVZvNO0sNFfs4NwuYBRUAWcBOidboMnKLgKm8waGmamMLEM8ycFDwFsxZX+YrVcmvBWM8WUCoSiocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0008.namprd12.prod.outlook.com (2603:10b6:403:2::18)
 by MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Wed, 21 Aug
 2019 20:01:38 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN4PR12CA0008.outlook.office365.com
 (2603:10b6:403:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 20:01:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:01:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:33 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 01/16] Revert "drm/amd/display: skip dsc config for navi10
 bring up"
Date: Wed, 21 Aug 2019 16:01:14 -0400
Message-ID: <20190821200129.11575-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(136003)(376002)(396003)(346002)(2980300002)(428003)(189003)(199004)(126002)(476003)(486006)(5660300002)(50466002)(53936002)(50226002)(4326008)(47776003)(48376002)(305945005)(76176011)(16586007)(110136005)(316002)(36756003)(51416003)(186003)(336012)(1076003)(11346002)(446003)(2616005)(426003)(86362001)(2906002)(6666004)(356004)(14444005)(81156014)(8936002)(478600001)(8676002)(70586007)(26005)(81166006)(450100002)(49486002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1278; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af497c43-b60d-40d1-9337-08d726726062
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR12MB1278; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:
X-Microsoft-Antispam-PRVS: <MWHPR12MB127876F08E94B81A7296D294EFAA0@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: SYNGF2gPWzl2ucTqRfZU2c11Co72RtohDRInVSgqvlqo9Pv7HXWlN+HzBokKkUVzDrzMBI3ooXAEGTWG1dMjBe9IbeGGb3IaNcG8YE7OfyYzX4p3RnOxJuj5O62gkR6xNb19uS5Gs2qojcSpERsOha35ZJQktTWHOsRnQ6633XyaLHXOYLiMEQdqST7prMGKzn9LJPwdmiRR80M022ERbEaqUJlHujk4r6MTig9RXyJ3WK8/2+vA9PUWpiSlZ2n4eTYtVkKbbkwGwzAUabHSd0kJLZIoXMzMhOhS3kCjE/ElBMJb/CsnsxGy2Z9CqwjBknJ6kSWdrBBg4hobp+7k0DI5qEujpBtjdoVNXVh/9svDTaI5gKyPoD15qCpiMJHwPWDLQWtOwrG5rbvc66/1CB4cCXny9EFnrBAD8dtmD+Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:01:37.9292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af497c43-b60d-40d1-9337-08d726726062
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcumYwHSxR5cVhRbpN3wgIzuxKhPJ9GdIZAOCKyyPmo=;
 b=WTlxylZv6ckCCttyK3d8+HsHSdV1GGnRKuHAItSITkd8F44MfmscRmSaV4oxYU5Zf2B4AO1Aj4QvQKTkOqo1mkWUXyqW918KtSx9D+l17gPi56zKGgzN4ycf4J5oVMS2+pSWT0GKOQaqcP8d0L21SJ3A8mAz0sZfoEYJxCB699w=
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
Cc: David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA1NWFkODFmMzUxMGVjMWExYzE5ZTZhNGQ4YTYzMTk4MTJkMDdk
MjU2LgoKb3B0YyBkc2MgY29uZmlnIHdhcyBjYXVzaW5nIHdhcm5pbmdzIGR1ZSB0byBtaXNzaW5n
IHJlZ2lzdGVyCmRlZmluaXRpb25zLiBXaXRoIHRoZSByZWdpc3RlcnMgcmVzdG9yZWQsIHRoZSBm
dW5jdGlvbiBjYW4KYmUgcmUtZW5hYmxlZAoKVGhlIHJldmVydGVkIGNvbW1pdCBhbHNvIGRpc2Fi
bGVkIHNhbml0eSBjaGVja3MgYW5kIGRzYwpwb3dlciBnYXRpbmcuIFRoZSBzYW5pdHkgY2hlY2sg
d2FybmluZ3MgYXJlIG5vdCBhc3NvY2lhdGVkCndpdGggZHNjLCBhbmQgcG93ZXIgZ2F0aW5nIG9u
IGRzYyBzdGlsbCBoYXMgYW4gaXNzdWUgb24Kbm9uLWRzYyBtb25pdG9ycyB3aGVyZSB0aGUgZHNj
IGhhcmR3YXJlIGJsb2NrIGlzIG5ldmVyIGluaXQKYW5kIHNvIGNhbm5vdCByZXNwb25kIHRvIHBv
d2VyIGdhdGluZyByZXF1ZXN0cy4gVGhlcmVmb3JlLAp0aG9zZSBhcmUgbGVmdCBhcyBpcwoKU2ln
bmVkLW9mZi1ieTogRGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgpSZXZpZXdl
ZC1ieTogUm9tYW4gTGkgPFJvbWFuLkxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxh
dXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jIHwgOSAtLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jCmluZGV4IGFlZGY5ZGUxYzk0Ny4uOTkwNzBlOTMwMjBi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBf
b3B0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9v
cHRjLmMKQEAgLTE5MSwxNSArMTkxLDYgQEAgdm9pZCBvcHRjMl9zZXRfZHNjX2NvbmZpZyhzdHJ1
Y3QgdGltaW5nX2dlbmVyYXRvciAqb3B0YywKIAkJCQkJdWludDMyX3QgZHNjX3NsaWNlX3dpZHRo
KQogewogCXN0cnVjdCBvcHRjICpvcHRjMSA9IERDTjEwVEdfRlJPTV9URyhvcHRjKTsKLQl1aW50
MzJfdCBkYXRhX2Zvcm1hdCA9IDA7Ci0JLyogc2tpcCBpZiBkc2MgbW9kZSBpcyBub3QgY2hhbmdl
ZCAqLwotCWRhdGFfZm9ybWF0ID0gZG1fcmVhZF9yZWcoQ1RYLCBSRUcoT1BUQ19EQVRBX0ZPUk1B
VF9DT05UUk9MKSk7Ci0KLQlkYXRhX2Zvcm1hdCA9IGRhdGFfZm9ybWF0ICYgMHgzMDsgLyogYml0
NTo0ICovCi0JZGF0YV9mb3JtYXQgPSBkYXRhX2Zvcm1hdCA+PiA0OwotCi0JaWYgKGRhdGFfZm9y
bWF0ID09IGRzY19tb2RlKQotCQlyZXR1cm47CiAKIAlSRUdfVVBEQVRFKE9QVENfREFUQV9GT1JN
QVRfQ09OVFJPTCwKIAkJT1BUQ19EU0NfTU9ERSwgZHNjX21vZGUpOwotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
