Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AC99A261
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 23:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767516EB42;
	Thu, 22 Aug 2019 21:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740073.outbound.protection.outlook.com [40.107.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E356E558;
 Thu, 22 Aug 2019 21:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJkKPRx3r1NGmdcZmaSZSzHgA8AcWm0vTUysWnvqdqJQ1HD/z8Ax8m4K6YRGlpEcBUx+Jst5w/wioivLMGyzPJe88kdudsntcUuOq6GOh2kiB71q1Z5sAOWJydPVUljZJsk9rEY0ImG9tkOeIywlDmEdrWX+7wnjrcuy7mTYvUpzwu+dooDZZRX0ksAUqJW3mZlOasupEzZCXrXK7do3SaLEyn1aGP/9V8crZFH5P+Vh7OUbXVpDNdY5gx3D1LpxSHqMn8U6xwmU8maunTtPkycgmJ1VgppfS1wU32t1PrdP70IbKIGxsGLkkLthhpP/iAiOy0MUn5tzacZNyhWxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKtgB88DNB2ikVphPWl9SO4RX/IDp+x2XBK3ZRyXS3s=;
 b=NJhWFryQ8AK5e8/ERhcDV6J/QfGRDtblOneuQ7kKjAS6tIeHGDyaZiGx1NCj1FA9fuRSgfju4+f0Z8Agea56F537ycGhgY4Di9ezYw5uVV4//y0i5oyjYaNbRhbz0RhdvNbcRMWFHWoK2LUeRx6p+MvWVKOBN89Y2pMiWPYqNrY7CVMRUfPyyXCQYDvG/5fYW0rYUZP3ecdcsf5d1t3C9IoU+HJVuTtGEZmqi4/LCzg5pLgaEUTnsngSogcmlRGEczboysEZOeB2/OtIOSyfmhYd72UiJ/6azDC2nuovk3/OVLM95anynfy3vCzT2+kC6fwmjG6sSTsV4myzaOeEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0059.namprd12.prod.outlook.com (2603:10b6:300:103::21)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:70::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Thu, 22 Aug
 2019 21:53:09 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by MWHPR12CA0059.outlook.office365.com
 (2603:10b6:300:103::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Thu, 22 Aug 2019 21:53:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Thu, 22 Aug 2019 21:53:08 +0000
Received: from wayne-Bilby-RV1.amd.com (10.180.168.240) by
 SATLEXCHOV02.amd.com (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 22 Aug 2019 16:53:07 -0500
From: Wayne Lin <waynelin@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/drm_connector: add additional aspect ratio values
Date: Thu, 22 Aug 2019 17:50:02 -0400
Message-ID: <20190822215002.17836-1-waynelin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(2980300002)(428003)(199004)(189003)(50466002)(8936002)(81156014)(8676002)(7696005)(53936002)(47776003)(110136005)(51416003)(4326008)(478600001)(486006)(5660300002)(48376002)(2906002)(426003)(476003)(126002)(16586007)(70206006)(70586007)(53416004)(81166006)(50226002)(36756003)(450100002)(186003)(1076003)(54906003)(316002)(336012)(6666004)(305945005)(356004)(26005)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2718; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b6cc51c-87de-485a-762e-08d7274b1eb8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2718; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2718BF6332F9B63409B7FDCFFCA50@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01371B902F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6wOA3YoLPcod5dpUWuQOg8CNO7NxBhYPIUHGDbxsBd6Kj+/vehSXnkh9aClk6t5mlu/lDluxiOCLqjVdTyEUVeIb7I3JcsZ33eqlsaWwGENmKZho5s9GAMFt3MUvxiIbVSbUdCEn8R/ZmyET23++JI3iQwHH3Zj93/ZHKLST3SS035UdWEfyiBDLySEDHKrIpnAH2c6gIzVQ1a6ftRhZQ5/o9uwGZgVeKcZG843NnE1z3bNQNiJDtMj1iEf1GQASCcvZoSx0W4nJ9EIArg55hd8caRUOgyCgeQEk419MsrPJVAT87IAOHZkTOZ8Ni4g/HUiTlIIUEZsu67flu44aH75kLv943ULOsGdCa4fyuYWi2pmk2xjN0do6wLcEVL2phRu9mqofMgvHZcs4zUjLHBGnZ9oJA1GUW8T8Y6A41Uw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2019 21:53:08.6399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6cc51c-87de-485a-762e-08d7274b1eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKtgB88DNB2ikVphPWl9SO4RX/IDp+x2XBK3ZRyXS3s=;
 b=viGyJwvmoRkqD/rKWurSmTky0D/PIbrrOt5QaknuZqC4s1tRXhoj7gC8p/3ZY9CkugU23HAtVVfFNMd2BLV3tgHR+Tx7ga576C6mB/8ZJByy3Kx2AyBCfycjzfRMTNty0CooRAz8wqVRvvbJlIjazxUAnjhF7pda4VrVGWOWftU=
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
Cc: Sunpeng.Li@amd.com, Wayne Lin <waynelin@amd.com>,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIEhETUkyLjAgQ1RTIGl0ZW0gLSBIRjEtMzUsIGl0IHZlcmlmaWVzIGlmIHRoZSBzb3VyY2Ug
Z2VuZXJhdGVzCnZpZGVvIHRpbWluZyAiNjQ6MjciIHZpZGVvIGZvcm1hdCBjb3JyZWN0bHkuCgpl
ZzogKHZpYy03NikgMTkyMHgxMDgwcEA2MEh6LDI0YnBwCgpUaGlzIHBhdGNoIGFkZCBvbiAiNjQ6
MjciIGFuZCAiMjU2OjEzNSIgdG8gZHJtX2FzcGVjdF9yYXRpb19lbnVtX2xpc3QuClRoZXJlYWZ0
ZXIsIG9uZSBjYW4gc3BlY2lmeSB0aGUgYXNwZWN0IHJhdGlvIHRvICI2NDoyNyIgb3IgIjI1Njox
MzUiCmFmdGVyIGNyZWF0aW5nIGFzcGVjdCByYXRpbyBwcm9wZXJ0eS4KCkNoYW5nZS1JZDogSWZj
OWRmNTRlOGU4Zjc4ZTcwOTYwZmNkNzM3YTNhNTdlNDljODExNTIKU2lnbmVkLW9mZi1ieTogV2F5
bmUgTGluIDx3YXluZWxpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVj
dG9yLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y29ubmVjdG9yLmMKaW5kZXggM2EwY2FjYjcxMjM1Li5jMDYyOWEwMWQwOGUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYwpAQCAtNzcyLDYgKzc3Miw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X3Byb3BfZW51bV9saXN0IGRybV9hc3BlY3RfcmF0aW9fZW51bV9saXN0W10gPSB7CiAJeyBEUk1f
TU9ERV9QSUNUVVJFX0FTUEVDVF9OT05FLCAiQXV0b21hdGljIiB9LAogCXsgRFJNX01PREVfUElD
VFVSRV9BU1BFQ1RfNF8zLCAiNDozIiB9LAogCXsgRFJNX01PREVfUElDVFVSRV9BU1BFQ1RfMTZf
OSwgIjE2OjkiIH0sCisJeyBEUk1fTU9ERV9QSUNUVVJFX0FTUEVDVF82NF8yNywgIjY0OjI3IiB9
LAorCXsgRFJNX01PREVfUElDVFVSRV9BU1BFQ1RfMjU2XzEzNSwgIjI1NjoxMzUiIH0sCiB9Owog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wcm9wX2VudW1fbGlzdCBkcm1fY29udGVudF90eXBl
X2VudW1fbGlzdFtdID0gewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
