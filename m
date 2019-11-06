Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600BF2836
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51AB6EE98;
	Thu,  7 Nov 2019 07:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0396EDAB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:36:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVAtuykRY6yAk5MfOiDRyh6k8pjEjAFRdzr/ZtpcVej97q34Q5CtjTPoifOi1uSq4ikNt3AKvWRz82foJ+vEiq9JGMKdNoyZPvNR95ojpp/vHNazO5TmUQ5K5YYU26WMQiDHp8lhiKF9pPY/x5xCoiFeQHKemK1FzPZ5OmwMRxd/sJ2uk/TdrWTcif3Htleo3dD4zSeZQWbT4i8GTEYWA6klsyV5agwCSOfpCO+fv8i3ruVChFH+aD84x3y9xCG+7nRMyEhHrph67TpjDf/rKGE9PlSDGQhIS6N1xxdZf5r2qWMmSyIQWjPMrXdLN/YIwv1lEMBqoGFs4vNGJ3dxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmqfXrVF3GmSnrcl3LWUVPLjGRkjQPJOCoC/ZkXpVKI=;
 b=eyGmozbScAvllW/7ZVBoHiQrvVmCkzWuaEMM5kMETyQDXDjI56DEL9Re/EN6Xrljzp2bWTXLUPFrOs9d+a2DKtsXNqd90wRV7tujgp7rLLnuwsYmvNdD0ZjRd/aDPSD5RqO2fahYnBGpMQ4wkH3i4F5MaMsUGdp3Y2zNxxVI6+KPsrNghXKHzLv4OitmCaHq062DMa23y1wKpRxsNdbRWvO1vOIIrKHnxzl5CWRxgSiAijAgubtsSZMZp1Ie+o/2ZTh9xwbr/w+H8bYV+FUOPYBwMdBLY/7M4brFRlzcYFZhDgtyqq63k7aDMTyPBQmy+xqunDgOIF/LXO9Ooq7pYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
Received: from MWHPR0201CA0091.namprd02.prod.outlook.com
 (2603:10b6:301:75::32) by MN2PR02MB5998.namprd02.prod.outlook.com
 (2603:10b6:208:11c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Wed, 6 Nov
 2019 15:36:03 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by MWHPR0201CA0091.outlook.office365.com
 (2603:10b6:301:75::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Wed, 6 Nov 2019 15:36:03 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Wed, 6 Nov 2019 15:36:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>) id 1iSNLm-0005QE-BW
 for dri-devel@lists.freedesktop.org; Wed, 06 Nov 2019 07:36:02 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>) id 1iSNLh-0006JY-9L
 for dri-devel@lists.freedesktop.org; Wed, 06 Nov 2019 07:35:57 -0800
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xA6FZlPV005459; 
 Wed, 6 Nov 2019 07:35:48 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iSNLX-0006IE-R4; Wed, 06 Nov 2019 07:35:47 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2] modetest: Add support for setting mode having
 floating vertical refresh rate
Date: Wed,  6 Nov 2019 07:35:36 -0800
Message-Id: <1573054536-5781-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(189003)(199004)(486006)(426003)(106002)(2351001)(186003)(47776003)(8676002)(81156014)(2361001)(81166006)(50466002)(356004)(5660300002)(6666004)(2906002)(126002)(476003)(336012)(44832011)(2616005)(36756003)(478600001)(9786002)(48376002)(50226002)(305945005)(4326008)(6916009)(70206006)(36386004)(51416003)(70586007)(107886003)(316002)(7696005)(26005)(8746002)(14444005)(5024004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR02MB5998; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4891d6b1-5e72-4db7-cbfe-08d762cf083e
X-MS-TrafficTypeDiagnostic: MN2PR02MB5998:
X-Microsoft-Antispam-PRVS: <MN2PR02MB5998CDE210D6E75CD320B6BFBC790@MN2PR02MB5998.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0VfXm3J/YaKHOb4wrD/A8Nnb4qMrpBQ77V8kNXd+pcJFs8CkfEhoIcmeyk0dpUozSFtqviznNgKjANfF2RWzAW3M5R+vqrTpEviQJbFEZyBgOfpRaAULzTkySMTI1sqCP9j8s9/riHJPYfLJyZ2FFcsvu5rGWY7Sc3JlcRfdCGOqAS8PZgDD1kR4uBWB6BOvQuEpdgzGcjCzHfaMIX7vu8dRJYXT+zAZFzjTqfxx5bReuIDpSVYUBG917pNZdrJBPK5ZEOXiHWRHLjMh82mYE51hpmTTa4VtIO4Igj2GzA3IrdqhVdYItgpKE7FrC8iHKdXuYkukCDCRIRHsEf314B+WVAzx9qVp+JVRZM8ANUMHy8D3Y7/6FMiMNVPe1VySSJrM07uxip0pZqYxYnfJYG3imTIvhjj7AOt7ZNGyUIeOQXQrHSfL8J7PVKaU8Sk
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 15:36:02.9908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4891d6b1-5e72-4db7-cbfe-08d762cf083e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5998
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmqfXrVF3GmSnrcl3LWUVPLjGRkjQPJOCoC/ZkXpVKI=;
 b=VQtGRyWfB9KHqAHPWMuo0zVvRHENTxGYpzuuSh/2khGoNAXBp6PdNXlkgZzJH3VtTwiV0nl6r2nJWUufsZUviUJAXOar1afxDcB1ux2BqWM+iuAVhU+xSd94Lvj86Sj8eqAZUtGiVNZYTn9hultGzJKuKW5/ATL//SHyeaMp6rU=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is
 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
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
Cc: rsk@xilinx.com, vcu-team@xilinx.com, dshah@xilinx.com,
 devarsh.thakkar@xilinx.com, varunkum@xilinx.com, satishna@xilinx.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHRoZSBzY2VuYXJpbyB3aGVyZSB1c2VyIG1heSByZXF1aXJlIHRvIG1vZGVzZXQgd2l0aCBh
IG1vZGUKc3VwcG9ydGluZyBhIGZyYWN0aW9uYWwgdmFsdWUgZm9yIHZlcnRpY2FsIHJlZnJlc2gt
cmF0ZSwKYXBwcm9wcmlhdGUgbW9kZSBjYW4gYmUgc2VsZWN0ZWQgYnkgc2VhcmNoaW5nIGZvciBt
b2RlCmhhdmluZyBtYXRjaGluZyBmcmFjdGlvbmFsIHZlcnRpY2FsIHJlZnJlc2ggcmF0ZSB1c2lu
ZwpiZWxvdyBlcXVhdGlvbi4KCnZyZWZyZXNoID0gKDEwMDAgKiBwaXhlbCBjbG9jaykgLyAoaHRv
dGFsICogdnRvdGFsKSBIei4KCldlIGRvIHRoaXMgd2F5IHNpbmNlIGRyaXZlciBkb2Vzbid0IHJl
dHVybiBmbG9hdCB2YWx1ZSBvZiB2cmVmcmVzaAphcyBpdCB1c2UgaW50IGZvciB2cmVmcmVzaCBp
biBzdHJ1Y3QgZHJtX21vZGVfaW5mbywgYnV0IHdlIGNhbiBkZXJpdmUKdGhlIGFjdHVhbCB2YWx1
ZSB1c2luZyBwaXhlbCBjbG9jaywgaG9yaXpvbnRhbCB0b3RhbCBzaXplIGFuZAp2ZXJ0aWNhbCB0
b3RhbCBzaXplIHZhbHVlcy4KClNvIGZvciBlLmcuIGlmIHVzZXIgd2FudCB0byBzZWxlY3QgbW9k
ZSBoYXZpbmcgNTkuOTQgSHogYXMgcmVmcmVzaCByYXRlCnRoZW4gd2l0aCB0aGlzIHBhdGNoIGl0
IGJlIGNhbiBkb25lIGFzIHNob3duIGluIGJlbG93IGNvbW1hbmQsCmdpdmVuIHRoZXJlIGlzIGFu
IGFwcHJvcHJpYXRlIG1vZGUgaXMgYXZhaWxhYmxlIDoKCm1vZGV0ZXN0IC1NIHhsbnggLXMgMzk6
MTkyMHgxMDgwLTU5Ljk0QEJHMjQgLXYKCk5PVEU6IEFib3ZlIGNvbW1hbmQgd2FzIHRlc3RlZCBv
biB4aWxpbnggRFJNIGRyaXZlciB3aXRoIERQCm1vbml0b3Igd2hpY2ggd2FzIHN1cHBvcnRpbmcg
bW9kZSBoYXZpbmcgNTkuOTQgSHogcmVmcmVzaCByYXRlLgoKU2lnbmVkLW9mZi1ieTogRGV2YXJz
aCBUaGFra2FyIDxkZXZhcnNoLnRoYWtrYXJAeGlsaW54LmNvbT4KLS0tClYyOiBVcGRhdGUgY29t
bWl0IG1lc3NhZ2UKLS0tCiB0ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIHwgMzIgKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMg
Yi90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCmluZGV4IGU2NmJlNjYuLjliM2U0MTAgMTAwNjQ0
Ci0tLSBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKKysrIGIvdGVzdHMvbW9kZXRlc3QvbW9k
ZXRlc3QuYwpAQCAtNzk1LDcgKzc5NSw3IEBAIHN0cnVjdCBwaXBlX2FyZyB7CiAgICAgICAgdWlu
dDMyX3QgY3J0Y19pZDsKICAgICAgICBjaGFyIG1vZGVfc3RyWzY0XTsKICAgICAgICBjaGFyIGZv
cm1hdF9zdHJbNV07Ci0gICAgICAgdW5zaWduZWQgaW50IHZyZWZyZXNoOworICAgICAgIGZsb2F0
IHZyZWZyZXNoOwogICAgICAgIHVuc2lnbmVkIGludCBmb3VyY2M7CiAgICAgICAgZHJtTW9kZU1v
ZGVJbmZvICptb2RlOwogICAgICAgIHN0cnVjdCBjcnRjICpjcnRjOwpAQCAtODIyLDExICs4MjIs
MTIgQEAgc3RydWN0IHBsYW5lX2FyZyB7Cgogc3RhdGljIGRybU1vZGVNb2RlSW5mbyAqCiBjb25u
ZWN0b3JfZmluZF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgdWludDMyX3QgY29uX2lkLCBjb25z
dCBjaGFyICptb2RlX3N0ciwKLSAgICAgICAgY29uc3QgdW5zaWduZWQgaW50IHZyZWZyZXNoKQor
ICAgICAgIGNvbnN0IGZsb2F0IHZyZWZyZXNoKQogewogICAgICAgIGRybU1vZGVDb25uZWN0b3Ig
KmNvbm5lY3RvcjsKICAgICAgICBkcm1Nb2RlTW9kZUluZm8gKm1vZGU7CiAgICAgICAgaW50IGk7
CisgICAgICAgZmxvYXQgbW9kZV92cmVmcmVzaDsKCiAgICAgICAgY29ubmVjdG9yID0gZ2V0X2Nv
bm5lY3Rvcl9ieV9pZChkZXYsIGNvbl9pZCk7CiAgICAgICAgaWYgKCFjb25uZWN0b3IgfHwgIWNv
bm5lY3Rvci0+Y291bnRfbW9kZXMpCkBAIC04MzksOSArODQwLDE5IEBAIGNvbm5lY3Rvcl9maW5k
X21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1aW50MzJfdCBjb25faWQsIGNvbnN0IGNoYXIgKm1v
ZGVfc3RyLAogICAgICAgICAgICAgICAgICAgICAgICAgKiBmaXJzdCBtb2RlIHRoYXQgbWF0Y2gg
d2l0aCB0aGUgbmFtZS4gRWxzZSwgcmV0dXJuIHRoZSBtb2RlIHRoYXQgbWF0Y2gKICAgICAgICAg
ICAgICAgICAgICAgICAgICogdGhlIG5hbWUgYW5kIHRoZSBzcGVjaWZpZWQgdmVydGljYWwgcmVm
cmVzaCBmcmVxdWVuY3kuCiAgICAgICAgICAgICAgICAgICAgICAgICAqLworICAgICAgICAgICAg
ICAgICAgICAgICBmbG9hdCB0ZW1wOworCisgICAgICAgICAgICAgICAgICAgICAgIG1vZGVfdnJl
ZnJlc2ggPSAoKGZsb2F0KShtb2RlLT5jbG9jaykgKiAxMDAwLjAwKQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC8gKChmbG9hdCkobW9kZS0+aHRvdGFsKQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogKGZsb2F0KW1vZGUtPnZ0b3RhbCk7
CisgICAgICAgICAgICAgICAgICAgICAgIC8qIFJvdW5kIG9mZiB0byAyIGRlY2ltYWwgcGxhY2Vz
IHRvIG1hdGNoIHdpdGggdXNlcgorICAgICAgICAgICAgICAgICAgICAgICAgKiBwcm92aWRlZCB2
YWx1ZQorICAgICAgICAgICAgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgICAgICAgICAgICAg
dGVtcCA9IChpbnQpIChtb2RlX3ZyZWZyZXNoICogMTAwICsgMC41KTsKKyAgICAgICAgICAgICAg
ICAgICAgICAgbW9kZV92cmVmcmVzaCA9IChmbG9hdCkgdGVtcCAvIDEwMDsKICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHZyZWZyZXNoID09IDApCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIG1vZGU7Ci0gICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKG1vZGUt
PnZyZWZyZXNoID09IHZyZWZyZXNoKQorICAgICAgICAgICAgICAgICAgICAgICBlbHNlIGlmICht
b2RlX3ZyZWZyZXNoID09IHZyZWZyZXNoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiBtb2RlOwogICAgICAgICAgICAgICAgfQogICAgICAgIH0KQEAgLTEzOTMsOCArMTQw
NCw4IEBAIHN0YXRpYyB2b2lkIGF0b21pY19zZXRfbW9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBwaXBlX2FyZyAqcGlwZXMsIHVuc2lnbmVkCiAgICAgICAgICAgICAgICBpZiAocGlwZS0+
bW9kZSA9PSBOVUxMKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKCi0gICAgICAg
ICAgICAgICBwcmludGYoInNldHRpbmcgbW9kZSAlcy0lZEh6IG9uIGNvbm5lY3RvcnMgIiwKLSAg
ICAgICAgICAgICAgICAgICAgICBwaXBlLT5tb2RlX3N0ciwgcGlwZS0+bW9kZS0+dnJlZnJlc2gp
OworICAgICAgICAgICAgICAgcHJpbnRmKCJzZXR0aW5nIG1vZGUgJXMtJS4yZkh6IG9uIGNvbm5l
Y3RvcnMgIiwKKyAgICAgICAgICAgICAgICAgICAgICBwaXBlLT5tb2RlX3N0ciwgcGlwZS0+dnJl
ZnJlc2gpOwogICAgICAgICAgICAgICAgZm9yIChqID0gMDsgaiA8IHBpcGUtPm51bV9jb25zOyAr
K2opIHsKICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCIlcywgIiwgcGlwZS0+Y29uc1tq
XSk7CiAgICAgICAgICAgICAgICAgICAgICAgIGFkZF9wcm9wZXJ0eShkZXYsIHBpcGUtPmNvbl9p
ZHNbal0sICJDUlRDX0lEIiwgcGlwZS0+Y3J0Yy0+Y3J0Yy0+Y3J0Y19pZCk7CkBAIC0xNDc2LDgg
KzE0ODcsOCBAQCBzdGF0aWMgdm9pZCBzZXRfbW9kZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBwaXBlX2FyZyAqcGlwZXMsIHVuc2lnbmVkIGludCBjbwogICAgICAgICAgICAgICAgaWYgKHBp
cGUtPm1vZGUgPT0gTlVMTCkKICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7CgotICAg
ICAgICAgICAgICAgcHJpbnRmKCJzZXR0aW5nIG1vZGUgJXMtJWRIekAlcyBvbiBjb25uZWN0b3Jz
ICIsCi0gICAgICAgICAgICAgICAgICAgICAgcGlwZS0+bW9kZV9zdHIsIHBpcGUtPm1vZGUtPnZy
ZWZyZXNoLCBwaXBlLT5mb3JtYXRfc3RyKTsKKyAgICAgICAgICAgICAgIHByaW50Zigic2V0dGlu
ZyBtb2RlICVzLSUuMmZIekAlcyBvbiBjb25uZWN0b3JzICIsCisgICAgICAgICAgICAgICAgICAg
ICAgcGlwZS0+bW9kZV9zdHIsIHBpcGUtPnZyZWZyZXNoLCBwaXBlLT5mb3JtYXRfc3RyKTsKICAg
ICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBwaXBlLT5udW1fY29uczsgKytqKQogICAgICAg
ICAgICAgICAgICAgICAgICBwcmludGYoIiVzLCAiLCBwaXBlLT5jb25zW2pdKTsKICAgICAgICAg
ICAgICAgIHByaW50ZigiY3J0YyAlZFxuIiwgcGlwZS0+Y3J0Yy0+Y3J0Yy0+Y3J0Y19pZCk7CkBA
IC0xNzEzLDggKzE3MjQsMTMgQEAgc3RhdGljIGludCBwYXJzZV9jb25uZWN0b3Ioc3RydWN0IHBp
cGVfYXJnICpwaXBlLCBjb25zdCBjaGFyICphcmcpCiAgICAgICAgcGlwZS0+bW9kZV9zdHJbbGVu
XSA9ICdcMCc7CgogICAgICAgIGlmICgqcCA9PSAnLScpIHsKLSAgICAgICAgICAgICAgIHBpcGUt
PnZyZWZyZXNoID0gc3RydG91bChwICsgMSwgJmVuZHAsIDEwKTsKKyAgICAgICAgICAgICAgIGZs
b2F0IHRlbXA7CisKKyAgICAgICAgICAgICAgIHBpcGUtPnZyZWZyZXNoID0gc3RydG9mKHAgKyAx
LCAmZW5kcCk7CiAgICAgICAgICAgICAgICBwID0gZW5kcDsKKyAgICAgICAgICAgICAgIC8qIFJv
dW5kIG9mZiB0byAyIGRlY2ltYWwgcGxhY2VzICovCisgICAgICAgICAgICAgICB0ZW1wID0gKGlu
dCkgKHBpcGUtPnZyZWZyZXNoICogMTAwICsgMC41KTsKKyAgICAgICAgICAgICAgIHBpcGUtPnZy
ZWZyZXNoID0gKGZsb2F0KSB0ZW1wIC8gMTAwOwogICAgICAgIH0KCiAgICAgICAgaWYgKCpwID09
ICdAJykgewotLQoyLjcuNAoKVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBpbnRl
bmRlZCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBuYW1lZCByZWNpcGllbnQocykgYW5kIGNvbnRh
aW4ocykgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIHByb3ByaWV0YXJ5LCBw
cml2aWxlZ2VkIG9yIGNvcHlyaWdodGVkIHVuZGVyIGFwcGxpY2FibGUgbGF3LiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBkbyBub3QgcmVhZCwgY29weSwgb3IgZm9yd2Fy
ZCB0aGlzIGVtYWlsIG1lc3NhZ2Ugb3IgYW55IGF0dGFjaG1lbnRzLiBEZWxldGUgdGhpcyBlbWFp
bCBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgaW1tZWRpYXRlbHkuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
