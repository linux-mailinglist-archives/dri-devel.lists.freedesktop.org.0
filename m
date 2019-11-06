Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE5F2843
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEF66EEAF;
	Thu,  7 Nov 2019 07:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700068.outbound.protection.outlook.com [40.107.70.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD696EDA8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:26:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nP/0MCcRNUhksqTQ3wxVgQX9mT6dG4QAHrvbI8/+7+GzRBFjtdRS+WxPL/cmewhftn3SwzDH9pcYpF43FwJJhC+woGCBiKjMiLynAWDfhe3BmUULH+4s5FFdk5NeJ8Hx8r2nQWm2RogQa+4IGebxb8UaO7cfssGkux42QJpA+gIkc0JxPNV2XmuAjCbijluuwKU5IyVAGOuMe0juJI5S4T2xIh47+8zsxmU337pWLerOt1M4Pw+IgXZRK1zBSJcCcmUpEh/JzhMOJD9GsZXcBqCHDHh/cjSGmq4MqmrVkU+mqUvbQR439d4NofqI3TyxDF5CNQGnUyxt9FfMz8FuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8Y1x6184jGPf2KjIN1G9mfbYEr3TLS1s1c0LR5fAwI=;
 b=f0OrWrq5AWRCRhJMt58oHp31JFhZ5z1vbTRxN/4cu6mm31piPigts6VKf8K47b68WCsnTwXyXm08ZueP5iCSBbCkuTPD5idIn4YlwM6rTVTeux2sJKToIJvud/8U6gv60xqeeB0gxKNC8HnN7DJtgk6cFwFyUIVUZa4F2nfsd8q7OA1sk7BobT8+o1ZQxnaURrAjcdJ3b7dONjU+jWcgiQVyWSTxOW4lODSnmHE1wu4sExNax0MVTxNa7k+FavciMnJcz7jJWCvGeSsJCDc9uiULXhSmTD3aOvAAdXmE2AlFb3kroNrjCWdWN3q1f9qwovdCVxp8uL/29sQtn6LK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
Received: from MN2PR02CA0010.namprd02.prod.outlook.com (2603:10b6:208:fc::23)
 by DM5PR02MB2396.namprd02.prod.outlook.com (2603:10b6:3:4f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Wed, 6 Nov
 2019 15:26:22 +0000
Received: from BL2NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by MN2PR02CA0010.outlook.office365.com
 (2603:10b6:208:fc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Wed, 6 Nov 2019 15:26:22 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT005.mail.protection.outlook.com (10.152.76.252) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Wed, 6 Nov 2019 15:26:21 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>) id 1iSNCO-0005MW-Q0
 for dri-devel@lists.freedesktop.org; Wed, 06 Nov 2019 07:26:20 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>) id 1iSNCJ-00048J-OA
 for dri-devel@lists.freedesktop.org; Wed, 06 Nov 2019 07:26:15 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xA6FQ91l012272; 
 Wed, 6 Nov 2019 07:26:09 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iSNCD-00047v-Mp; Wed, 06 Nov 2019 07:26:09 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] modetest: Add support for setting mode having floating
 vertical refresh rate
Date: Wed,  6 Nov 2019 07:25:44 -0800
Message-Id: <1573053944-4933-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(39860400002)(346002)(189003)(199004)(8746002)(2351001)(50226002)(5024004)(14444005)(8936002)(36386004)(2906002)(356004)(9786002)(81156014)(81166006)(6666004)(8676002)(2361001)(4326008)(305945005)(50466002)(26005)(5660300002)(6916009)(107886003)(48376002)(316002)(126002)(2616005)(36756003)(7696005)(44832011)(486006)(426003)(476003)(106002)(70206006)(336012)(478600001)(70586007)(51416003)(186003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2396; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9b958de-ae61-48da-4d27-08d762cdad90
X-MS-TrafficTypeDiagnostic: DM5PR02MB2396:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2396426A57A27785CA232011BC790@DM5PR02MB2396.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLaPi78rvcFUg+jm07ZkW+xIoEx04qCv3f1ZBlXZ2jv2AwCzsYSQ72FmB8KKGcwiAiZARCpp0Ixh54OBE7LkUf7QbX7YnfaRSRUyLwca3nzL1uqKChI/Ur+LxP+0s7FfTGrU07SfB7v7EqfQ+CN7xI4jwbj2+LUNbdcRXdS1+j2nG06jhd1rDUbriWWhXDgDAkfUqlCGqSZa5N9WBUTnnnq6hGtFC7EsR7YnVtFg0KcrChx0kpVBOXS+G8+VM0dUb405BYUlF72uXQCN55YtOtPY+1OAYLF/Ca4hjGEOlzVzxRkUWBuF8wTq1OUOitknSke/zbMX9LvKuH1U/5Ft/LRFj1/Yt6ARVU4JAYBl3GP6iaufDSnmS611gpMnwBl9WcQIdQyvy+3COdS+/HdGRSiIMRz96pVYrCwv3VpjlUFE+PpP7fAlcAtvoV+v2M+v
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 15:26:21.3535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b958de-ae61-48da-4d27-08d762cdad90
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2396
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8Y1x6184jGPf2KjIN1G9mfbYEr3TLS1s1c0LR5fAwI=;
 b=YScGF6XPxv51+Vc/E7fQmlWmx4lidqTdBPWLw+2koCjcozGUnnDD3k+mO7VDpH56yZTJOCTW5rpKOBhunXeWnAK4n5OA58tqXw2eDXnKH/vk6/+OVVNceLfVs98J/njd4LMlQ7Sx9RSoHr0Hdyms17cnMLLAjmahk3fBc/yvNUk=
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
ZwpiZWxvdyBlcXVhdGlvbi4KCnZyZWZyZXNoID0gMTAwMCAqIChwaXhlbCBjbG9jaykgLyAoaHRv
dGFsICogdnRvdGFsKSBLaHouCgpXZSBkbyB0aGlzIHdheSBzaW5jZSBkcml2ZXIgZG9lc24ndCBy
ZXR1cm4gZmxvYXQgdmFsdWUgb2YgdnJlZnJlc2gKYXMgaXQgdXNlIGludCBmb3IgdnJlZnJlc2gg
aW4gc3RydWN0IGRybV9tb2RlX2luZm8sIGJ1dCB3ZSBkZXJpdmUKdGhlIGFjdHVhbCB2YWx1ZSB1
c2luZyBwaXhlbCBjbG9jaywgaHRvdGFsIGFuZCB2dG90YWwgdmFsdWVzLgoKU28gZm9yIGUuZy4g
aWYgdXNlciB3YW50IHRvIHNlbGVjdCBtb2RlIGhhdmluZyA1OS45NCBIeiBhcyByZWZyZXNoIHJh
dGUKdGhlbiB3aXRoIHRoaXMgcGF0Y2ggaXQgYmUgY2FuIGRvbmUgYXMgc2hvd24gaW4gYmVsb3cg
Y29tbWFuZCwKZ2l2ZW4gdGhlcmUgaXMgYW4gYXBwcm9wcmlhdGUgbW9kZSBpcyBhdmFpbGFibGUg
OgoKbW9kZXRlc3QgLU0geGxueCAtcyAzOToxOTIweDEwODAtNTkuOTRAQkcyNCAtdgoKTk9URTog
QWJvdmUgY29tbWFuZCB3YXMgdGVzdGVkIG9uIHhpbGlueCBEUk0gZHJpdmVyIHdpdGggRFAKbW9u
aXRvciB3aGljaCB3YXMgc3VwcG9ydGluZyBtb2RlIGhhdmluZyA1OS45NCBIeiByZWZyZXNoIHJh
dGUuCgpTaWduZWQtb2ZmLWJ5OiBEZXZhcnNoIFRoYWtrYXIgPGRldmFyc2gudGhha2thckB4aWxp
bnguY29tPgotLS0KIHRlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMgfCAzMiArKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYyBiL3Rl
c3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKaW5kZXggZTY2YmU2Ni4uOWIzZTQxMCAxMDA2NDQKLS0t
IGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYworKysgYi90ZXN0cy9tb2RldGVzdC9tb2RldGVz
dC5jCkBAIC03OTUsNyArNzk1LDcgQEAgc3RydWN0IHBpcGVfYXJnIHsKICAgICAgICB1aW50MzJf
dCBjcnRjX2lkOwogICAgICAgIGNoYXIgbW9kZV9zdHJbNjRdOwogICAgICAgIGNoYXIgZm9ybWF0
X3N0cls1XTsKLSAgICAgICB1bnNpZ25lZCBpbnQgdnJlZnJlc2g7CisgICAgICAgZmxvYXQgdnJl
ZnJlc2g7CiAgICAgICAgdW5zaWduZWQgaW50IGZvdXJjYzsKICAgICAgICBkcm1Nb2RlTW9kZUlu
Zm8gKm1vZGU7CiAgICAgICAgc3RydWN0IGNydGMgKmNydGM7CkBAIC04MjIsMTEgKzgyMiwxMiBA
QCBzdHJ1Y3QgcGxhbmVfYXJnIHsKCiBzdGF0aWMgZHJtTW9kZU1vZGVJbmZvICoKIGNvbm5lY3Rv
cl9maW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1aW50MzJfdCBjb25faWQsIGNvbnN0IGNo
YXIgKm1vZGVfc3RyLAotICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgdnJlZnJlc2gpCisgICAg
ICAgY29uc3QgZmxvYXQgdnJlZnJlc2gpCiB7CiAgICAgICAgZHJtTW9kZUNvbm5lY3RvciAqY29u
bmVjdG9yOwogICAgICAgIGRybU1vZGVNb2RlSW5mbyAqbW9kZTsKICAgICAgICBpbnQgaTsKKyAg
ICAgICBmbG9hdCBtb2RlX3ZyZWZyZXNoOwoKICAgICAgICBjb25uZWN0b3IgPSBnZXRfY29ubmVj
dG9yX2J5X2lkKGRldiwgY29uX2lkKTsKICAgICAgICBpZiAoIWNvbm5lY3RvciB8fCAhY29ubmVj
dG9yLT5jb3VudF9tb2RlcykKQEAgLTgzOSw5ICs4NDAsMTkgQEAgY29ubmVjdG9yX2ZpbmRfbW9k
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHVpbnQzMl90IGNvbl9pZCwgY29uc3QgY2hhciAqbW9kZV9z
dHIsCiAgICAgICAgICAgICAgICAgICAgICAgICAqIGZpcnN0IG1vZGUgdGhhdCBtYXRjaCB3aXRo
IHRoZSBuYW1lLiBFbHNlLCByZXR1cm4gdGhlIG1vZGUgdGhhdCBtYXRjaAogICAgICAgICAgICAg
ICAgICAgICAgICAgKiB0aGUgbmFtZSBhbmQgdGhlIHNwZWNpZmllZCB2ZXJ0aWNhbCByZWZyZXNo
IGZyZXF1ZW5jeS4KICAgICAgICAgICAgICAgICAgICAgICAgICovCisgICAgICAgICAgICAgICAg
ICAgICAgIGZsb2F0IHRlbXA7CisKKyAgICAgICAgICAgICAgICAgICAgICAgbW9kZV92cmVmcmVz
aCA9ICgoZmxvYXQpKG1vZGUtPmNsb2NrKSAqIDEwMDAuMDApCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLyAoKGZsb2F0KShtb2RlLT5odG90YWwpCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiAoZmxvYXQpbW9kZS0+dnRvdGFsKTsKKyAg
ICAgICAgICAgICAgICAgICAgICAgLyogUm91bmQgb2ZmIHRvIDIgZGVjaW1hbCBwbGFjZXMgdG8g
bWF0Y2ggd2l0aCB1c2VyCisgICAgICAgICAgICAgICAgICAgICAgICAqIHByb3ZpZGVkIHZhbHVl
CisgICAgICAgICAgICAgICAgICAgICAgICAqLworICAgICAgICAgICAgICAgICAgICAgICB0ZW1w
ID0gKGludCkgKG1vZGVfdnJlZnJlc2ggKiAxMDAgKyAwLjUpOworICAgICAgICAgICAgICAgICAg
ICAgICBtb2RlX3ZyZWZyZXNoID0gKGZsb2F0KSB0ZW1wIC8gMTAwOwogICAgICAgICAgICAgICAg
ICAgICAgICBpZiAodnJlZnJlc2ggPT0gMCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gbW9kZTsKLSAgICAgICAgICAgICAgICAgICAgICAgZWxzZSBpZiAobW9kZS0+dnJl
ZnJlc2ggPT0gdnJlZnJlc2gpCisgICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKG1vZGVf
dnJlZnJlc2ggPT0gdnJlZnJlc2gpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIG1vZGU7CiAgICAgICAgICAgICAgICB9CiAgICAgICAgfQpAQCAtMTM5Myw4ICsxNDA0LDgg
QEAgc3RhdGljIHZvaWQgYXRvbWljX3NldF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IHBpcGVfYXJnICpwaXBlcywgdW5zaWduZWQKICAgICAgICAgICAgICAgIGlmIChwaXBlLT5tb2Rl
ID09IE5VTEwpCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwoKLSAgICAgICAgICAg
ICAgIHByaW50Zigic2V0dGluZyBtb2RlICVzLSVkSHogb24gY29ubmVjdG9ycyAiLAotICAgICAg
ICAgICAgICAgICAgICAgIHBpcGUtPm1vZGVfc3RyLCBwaXBlLT5tb2RlLT52cmVmcmVzaCk7Cisg
ICAgICAgICAgICAgICBwcmludGYoInNldHRpbmcgbW9kZSAlcy0lLjJmSHogb24gY29ubmVjdG9y
cyAiLAorICAgICAgICAgICAgICAgICAgICAgIHBpcGUtPm1vZGVfc3RyLCBwaXBlLT52cmVmcmVz
aCk7CiAgICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgcGlwZS0+bnVtX2NvbnM7ICsraikg
ewogICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIiVzLCAiLCBwaXBlLT5jb25zW2pdKTsK
ICAgICAgICAgICAgICAgICAgICAgICAgYWRkX3Byb3BlcnR5KGRldiwgcGlwZS0+Y29uX2lkc1tq
XSwgIkNSVENfSUQiLCBwaXBlLT5jcnRjLT5jcnRjLT5jcnRjX2lkKTsKQEAgLTE0NzYsOCArMTQ4
Nyw4IEBAIHN0YXRpYyB2b2lkIHNldF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBp
cGVfYXJnICpwaXBlcywgdW5zaWduZWQgaW50IGNvCiAgICAgICAgICAgICAgICBpZiAocGlwZS0+
bW9kZSA9PSBOVUxMKQogICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKCi0gICAgICAg
ICAgICAgICBwcmludGYoInNldHRpbmcgbW9kZSAlcy0lZEh6QCVzIG9uIGNvbm5lY3RvcnMgIiwK
LSAgICAgICAgICAgICAgICAgICAgICBwaXBlLT5tb2RlX3N0ciwgcGlwZS0+bW9kZS0+dnJlZnJl
c2gsIHBpcGUtPmZvcm1hdF9zdHIpOworICAgICAgICAgICAgICAgcHJpbnRmKCJzZXR0aW5nIG1v
ZGUgJXMtJS4yZkh6QCVzIG9uIGNvbm5lY3RvcnMgIiwKKyAgICAgICAgICAgICAgICAgICAgICBw
aXBlLT5tb2RlX3N0ciwgcGlwZS0+dnJlZnJlc2gsIHBpcGUtPmZvcm1hdF9zdHIpOwogICAgICAg
ICAgICAgICAgZm9yIChqID0gMDsgaiA8IHBpcGUtPm51bV9jb25zOyArK2opCiAgICAgICAgICAg
ICAgICAgICAgICAgIHByaW50ZigiJXMsICIsIHBpcGUtPmNvbnNbal0pOwogICAgICAgICAgICAg
ICAgcHJpbnRmKCJjcnRjICVkXG4iLCBwaXBlLT5jcnRjLT5jcnRjLT5jcnRjX2lkKTsKQEAgLTE3
MTMsOCArMTcyNCwxMyBAQCBzdGF0aWMgaW50IHBhcnNlX2Nvbm5lY3RvcihzdHJ1Y3QgcGlwZV9h
cmcgKnBpcGUsIGNvbnN0IGNoYXIgKmFyZykKICAgICAgICBwaXBlLT5tb2RlX3N0cltsZW5dID0g
J1wwJzsKCiAgICAgICAgaWYgKCpwID09ICctJykgewotICAgICAgICAgICAgICAgcGlwZS0+dnJl
ZnJlc2ggPSBzdHJ0b3VsKHAgKyAxLCAmZW5kcCwgMTApOworICAgICAgICAgICAgICAgZmxvYXQg
dGVtcDsKKworICAgICAgICAgICAgICAgcGlwZS0+dnJlZnJlc2ggPSBzdHJ0b2YocCArIDEsICZl
bmRwKTsKICAgICAgICAgICAgICAgIHAgPSBlbmRwOworICAgICAgICAgICAgICAgLyogUm91bmQg
b2ZmIHRvIDIgZGVjaW1hbCBwbGFjZXMgKi8KKyAgICAgICAgICAgICAgIHRlbXAgPSAoaW50KSAo
cGlwZS0+dnJlZnJlc2ggKiAxMDAgKyAwLjUpOworICAgICAgICAgICAgICAgcGlwZS0+dnJlZnJl
c2ggPSAoZmxvYXQpIHRlbXAgLyAxMDA7CiAgICAgICAgfQoKICAgICAgICBpZiAoKnAgPT0gJ0An
KSB7Ci0tCjIuNy40CgpUaGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGludGVuZGVk
IGZvciB0aGUgc29sZSB1c2Ugb2YgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBhbmQgY29udGFpbihz
KSBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvcHJpZXRhcnksIHByaXZp
bGVnZWQgb3IgY29weXJpZ2h0ZWQgdW5kZXIgYXBwbGljYWJsZSBsYXcuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIGRvIG5vdCByZWFkLCBjb3B5LCBvciBmb3J3YXJkIHRo
aXMgZW1haWwgbWVzc2FnZSBvciBhbnkgYXR0YWNobWVudHMuIERlbGV0ZSB0aGlzIGVtYWlsIG1l
c3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBpbW1lZGlhdGVseS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
