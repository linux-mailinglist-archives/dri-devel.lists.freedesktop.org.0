Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E522810AB6B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632786E1F1;
	Wed, 27 Nov 2019 08:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680058.outbound.protection.outlook.com [40.107.68.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6506E135
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 15:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsxI0NCH7xdd9+LSebjMIeKjpUo1T1V1CrwV7ryAXcQlbGr8ADhF4qcHBypBEm3qkKrMQKZAsrPbJCeJ4cpSvWhbNQrTTZDcGpVFSeQIjnqlyuHZRVIMHCF2yYYqrGVZNtiYrh4Mkxb39/HpNB1aRlgYe/vPy8wguKAaut9NRBRxAC4l8HbKCZQEx4Dj+9Q6UajvSSM1gTEOqeiwRnwKZyEs7JkxVhBHxDi5XwQJN1OXAOqOnuaqK7HPo7hM0vvN2GsH1O4ztMdTxzh8+Y6QHMfAg2G+kMezegbJDbJlx3hRxFnU1rCJ6E0zAN2dfvuciRJY0evsOEWkEFcHWE97GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HanF9cq64VAJAaH00/5uDr/5Hc1ac1+x2YotiaAvLfk=;
 b=Ie+kEXg8782E+6RLBnTyrg/emqHTIq0qFz4AN5+G7iukx3HxpF4Mew9wyJ8a89Bc3E2kTeseZAyaxEO+yzgbX4xsTwL5ypOmmTgljKqojBmYl/oi/TWTLtLI+K5Wj9unN8NlVzKPpLr315jJp3C6P9i6YFbfUPnOTnCHhNrxJUIsqh7tU3X0ZUFp1KJAbChNMXLk9i0W2oi/8bCp1yhhn8HqvFafXDgKGO7klDV8onSR9n/uCuccf7XlXB1btbGIJlaMkkligqsWLFMTvHwuFMETkEnUo8hyz04a9fipLdHufOTvefUKJThxELD4veIHn72LBl8GdMJ3Gdrq28uiVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
Received: from CH2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:4e::26)
 by BY5PR02MB7028.namprd02.prod.outlook.com (2603:10b6:a03:233::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 15:04:20 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by CH2PR02CA0016.outlook.office365.com
 (2603:10b6:610:4e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21 via Frontend
 Transport; Tue, 26 Nov 2019 15:04:20 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Tue, 26 Nov 2019 15:04:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iZcO3-0007ll-2u; Tue, 26 Nov 2019 07:04:19 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iZcNx-0007eg-Ve; Tue, 26 Nov 2019 07:04:14 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iZcNr-0007bk-26; Tue, 26 Nov 2019 07:04:07 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org,
	ville.syrjala@linux.intel.com
Subject: [PATCH libdrm] modetest: Use floating vrefresh while dumping mode
Date: Tue, 26 Nov 2019 07:03:58 -0800
Message-Id: <1574780638-10980-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(316002)(2616005)(478600001)(50226002)(7696005)(305945005)(2906002)(356004)(6666004)(36756003)(336012)(81166006)(70206006)(70586007)(16586007)(50466002)(47776003)(5660300002)(51416003)(8676002)(81156014)(14444005)(48376002)(106002)(4326008)(8936002)(107886003)(9786002)(44832011)(186003)(26005)(36386004)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR02MB7028; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 636c2649-d16f-4dae-aa05-08d77281e9fc
X-MS-TrafficTypeDiagnostic: BY5PR02MB7028:
X-Microsoft-Antispam-PRVS: <BY5PR02MB7028642A1A8F77F140C8E362BC450@BY5PR02MB7028.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0233768B38
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BfZRvvJ3XN1ELTGoiE+06HHym6tJiS7g0O5bxBVOaT8SBstyX2jJwBxP+oAqOfMd26hglJq/Zyjkv1WLrenG2RfUD1XqSnkoKwN7rlw1g6Kpx85N27fvY1ytXiQHJm/E+WwAVLUm00DLZkMAFr8xT40alu9gBI77xpTVarc0wXVkWuofneVMdDl/Hp1Nj0FpJVsshyiOGPJv3aPYFs2V48qwfGw3vSA8bYEISyPru/q3IBTVTbMwVuFME+ZC0pmmdzYcwHJuto+TC+ZhQGBSMyIULg1HsMdRpwSQBjXpY7H7X8tXQ6oLLuz2LyF1GeNU/pF5pSqzNRajse88MNdCBRuYcy1zwnzNy06uBFe6nI/q/7vw21hvn1gQzMHmzNEu0ZhRlbomrCBXN7uPHRaYPJ6TeKrT9l21E8N4//U8GNIPqxSPMNOQSBMH6eXRD71
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 15:04:19.6470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 636c2649-d16f-4dae-aa05-08d77281e9fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7028
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HanF9cq64VAJAaH00/5uDr/5Hc1ac1+x2YotiaAvLfk=;
 b=RjoO2+6JnYQc+6BO+mXBlP00NLDdEd7xr7tycPAgSr5Hzq0J6peKUVapOmfDmXwTZker3sniTejnywpOtLeU3pgWPfR6L1IWFFhjRSiftwCre4AukE/E9QFb8rOlR7lNh4deGCAFvKf3CadrYhcu5izSEG06OzIk/y7Eo4Bj+xA=
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
 devarsh.thakkar@xilinx.com, varunkum@xilinx.com, satishna@xilinx.com,
 rvisaval@xilinx.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGlubGluZSBmdW5jdGlvbiB0byBkZXJpdmUgZmxvYXRpbmcgdmFsdWUgb2YgdmVydGljYWwK
cmVmcmVzaCByYXRlIGZyb20gcGl4ZWwgY2xvY2ssIGhvcml6b250YWwgdG90YWwgc2l6ZSBhbmQK
dmVydGljYWwgdG90YWwgc2l6ZS4KClVzZSB0aGlzIGZ1bmN0aW9uIHRvIGZpbmQgc3VpdGFibGUg
bW9kZSBoYXZpbmcgdnJlZnJlc2gKdmFsdWUgd2hpY2ggaXMgbWF0Y2hpbmcgd2l0aCB1c2VyIHBy
b3ZpZGVkIHZyZWZyZXNoIHZhbHVlLgoKSWYgdXNlciBkb2Vzbid0IHByb3ZpZGUgYW55IHZyZWZy
ZXNoIHZhbHVlIGluIGFyZ3MgdGhlbgp1cGRhdGUgdmVydGljYWwgcmVmcmVzaCByYXRlIHZhbHVl
IGluIHBpcGUgYXJncyB1c2luZyB0aGlzCmZ1bmN0aW9uIHNvIHRoYXQgaXQgd2lsbCBiZSB1c2Vk
IGZvciBwcmludGluZyBmbG9hdGluZyB2cmVmcmVzaAp3aGlsZSBkdW1waW5nIG1vZGUuCgpUaGlz
IHdpbGwgZ2l2ZSBtb3JlIGFjY3VyYXRlIHBpY3R1cmUgdG8gdXNlciBmb3IgYXZhaWxhYmxlIG1v
ZGVzCmRpZmZlcmVudGlhdGVkIGJ5IGZsb2F0aW5nIHZlcnRpY2FsIHJlZnJlc2ggcmF0ZSBhbmQg
aGVscCB1c2VyCnNlbGVjdCBtb3JlIGFwcHJvcHJpYXRlIG1vZGUgdXNpbmcgc3VpdGFibGUgcmVm
cmVzaCByYXRlIHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogRGV2YXJzaCBUaGFra2FyIDxkZXZhcnNo
LnRoYWtrYXJAeGlsaW54LmNvbT4KLS0tCiB0ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIHwgMzYg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvbW9kZXRl
c3QvbW9kZXRlc3QuYyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKaW5kZXggYjRlZGZjYi4u
ODBjZjA3NiAxMDA2NDQKLS0tIGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYworKysgYi90ZXN0
cy9tb2RldGVzdC9tb2RldGVzdC5jCkBAIC0xMzMsNiArMTMzLDEyIEBAIHN0YXRpYyBpbmxpbmUg
aW50NjRfdCBVNjQySTY0KHVpbnQ2NF90IHZhbCkKIAlyZXR1cm4gKGludDY0X3QpKigoaW50NjRf
dCAqKSZ2YWwpOwogfQogCitzdGF0aWMgaW5saW5lIGZsb2F0IGdldF9mbG9hdGluZ192cmVmcmVz
aChkcm1Nb2RlTW9kZUluZm8gKm1vZGUpCit7CisJcmV0dXJuICBtb2RlLT5jbG9jayAqIDEwMDAu
MDAKKwkJCS8gKG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3RhbCk7Cit9CisKICNkZWZpbmUgYml0
X25hbWVfZm4ocmVzKQkJCQkJXAogY29uc3QgY2hhciAqIHJlcyMjX3N0cihpbnQgdHlwZSkgewkJ
CQlcCiAJdW5zaWduZWQgaW50IGk7CQkJCQkJXApAQCAtMjEwLDkgKzIxNiw5IEBAIHN0YXRpYyB2
b2lkIGR1bXBfZW5jb2RlcnMoc3RydWN0IGRldmljZSAqZGV2KQogCiBzdGF0aWMgdm9pZCBkdW1w
X21vZGUoZHJtTW9kZU1vZGVJbmZvICptb2RlKQogewotCXByaW50ZigiICAlcyAlZCAlZCAlZCAl
ZCAlZCAlZCAlZCAlZCAlZCAlZCIsCisJcHJpbnRmKCIgICVzICUuMmYgJWQgJWQgJWQgJWQgJWQg
JWQgJWQgJWQgJWQiLAogCSAgICAgICBtb2RlLT5uYW1lLAotCSAgICAgICBtb2RlLT52cmVmcmVz
aCwKKwkgICAgICAgZ2V0X2Zsb2F0aW5nX3ZyZWZyZXNoKG1vZGUpLAogCSAgICAgICBtb2RlLT5o
ZGlzcGxheSwKIAkgICAgICAgbW9kZS0+aHN5bmNfc3RhcnQsCiAJICAgICAgIG1vZGUtPmhzeW5j
X2VuZCwKQEAgLTgyMywxMiArODI5LDExIEBAIHN0cnVjdCBwbGFuZV9hcmcgewogCiBzdGF0aWMg
ZHJtTW9kZU1vZGVJbmZvICoKIGNvbm5lY3Rvcl9maW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2
LCB1aW50MzJfdCBjb25faWQsIGNvbnN0IGNoYXIgKm1vZGVfc3RyLAotCWNvbnN0IGZsb2F0IHZy
ZWZyZXNoKQorCWZsb2F0ICp2cmVmcmVzaCkKIHsKIAlkcm1Nb2RlQ29ubmVjdG9yICpjb25uZWN0
b3I7CiAJZHJtTW9kZU1vZGVJbmZvICptb2RlOwogCWludCBpOwotCWZsb2F0IG1vZGVfdnJlZnJl
c2g7CiAKIAljb25uZWN0b3IgPSBnZXRfY29ubmVjdG9yX2J5X2lkKGRldiwgY29uX2lkKTsKIAlp
ZiAoIWNvbm5lY3RvciB8fCAhY29ubmVjdG9yLT5jb3VudF9tb2RlcykKQEAgLTgzNywxNiArODQy
LDE5IEBAIGNvbm5lY3Rvcl9maW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1aW50MzJfdCBj
b25faWQsIGNvbnN0IGNoYXIgKm1vZGVfc3RyLAogCWZvciAoaSA9IDA7IGkgPCBjb25uZWN0b3It
PmNvdW50X21vZGVzOyBpKyspIHsKIAkJbW9kZSA9ICZjb25uZWN0b3ItPm1vZGVzW2ldOwogCQlp
ZiAoIXN0cmNtcChtb2RlLT5uYW1lLCBtb2RlX3N0cikpIHsKLQkJCS8qIElmIHRoZSB2ZXJ0aWNh
bCByZWZyZXNoIGZyZXF1ZW5jeSBpcyBub3Qgc3BlY2lmaWVkIHRoZW4gcmV0dXJuIHRoZQotCQkJ
ICogZmlyc3QgbW9kZSB0aGF0IG1hdGNoIHdpdGggdGhlIG5hbWUuIEVsc2UsIHJldHVybiB0aGUg
bW9kZSB0aGF0IG1hdGNoCi0JCQkgKiB0aGUgbmFtZSBhbmQgdGhlIHNwZWNpZmllZCB2ZXJ0aWNh
bCByZWZyZXNoIGZyZXF1ZW5jeS4KKwkJCS8qIElmIHRoZSB2ZXJ0aWNhbCByZWZyZXNoIGZyZXF1
ZW5jeSBpcyBub3Qgc3BlY2lmaWVkCisJCQkgKiB0aGVuIHJldHVybiB0aGUgZmlyc3QgbW9kZSB0
aGF0IG1hdGNoIHdpdGggdGhlIG5hbWUKKwkJCSAqIGFuZCB1cGRhdGUgY29ycmVzcG9uZGluZyB2
cmVmcmVzaCBpbiBwaXBlX2FyZy4KKwkJCSAqIEVsc2UsIHJldHVybiB0aGUgbW9kZSB0aGF0IG1h
dGNoIHRoZSBuYW1lIGFuZAorCQkJICogdGhlIHNwZWNpZmllZCB2ZXJ0aWNhbCByZWZyZXNoIGZy
ZXF1ZW5jeS4KIAkJCSAqLwotCQkJbW9kZV92cmVmcmVzaCA9IG1vZGUtPmNsb2NrICogMTAwMC4w
MAotCQkJCQkvIChtb2RlLT5odG90YWwgKiBtb2RlLT52dG90YWwpOwotCQkJaWYgKHZyZWZyZXNo
ID09IDApCisJCQlpZiAoKnZyZWZyZXNoID09IDApIHsKKwkJCQkqdnJlZnJlc2ggPSBnZXRfZmxv
YXRpbmdfdnJlZnJlc2gobW9kZSk7CiAJCQkJcmV0dXJuIG1vZGU7Ci0JCQllbHNlIGlmIChmYWJz
KG1vZGVfdnJlZnJlc2ggLSB2cmVmcmVzaCkgPCAwLjAwNSkKKwkJCX0gZWxzZSBpZiAoZmFicyhn
ZXRfZmxvYXRpbmdfdnJlZnJlc2gobW9kZSkKKwkJCQkgICAtICp2cmVmcmVzaCkgPCAwLjAwNSkg
ewogCQkJCXJldHVybiBtb2RlOworCQkJfQogCQl9CiAJfQogCkBAIC05MDksMTEgKzkxNywxMSBA
QCBzdGF0aWMgaW50IHBpcGVfZmluZF9jcnRjX2FuZF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHBpcGVfYXJnICpwaXBlKQogCiAJZm9yIChpID0gMDsgaSA8IChpbnQpcGlwZS0+bnVt
X2NvbnM7IGkrKykgewogCQltb2RlID0gY29ubmVjdG9yX2ZpbmRfbW9kZShkZXYsIHBpcGUtPmNv
bl9pZHNbaV0sCi0JCQkJCSAgIHBpcGUtPm1vZGVfc3RyLCBwaXBlLT52cmVmcmVzaCk7CisJCQkJ
CSAgIHBpcGUtPm1vZGVfc3RyLCAmcGlwZS0+dnJlZnJlc2gpOwogCQlpZiAobW9kZSA9PSBOVUxM
KSB7CiAJCQlmcHJpbnRmKHN0ZGVyciwKLQkJCQkiZmFpbGVkIHRvIGZpbmQgbW9kZSBcIiVzXCIg
Zm9yIGNvbm5lY3RvciAlc1xuIiwKLQkJCQlwaXBlLT5tb2RlX3N0ciwgcGlwZS0+Y29uc1tpXSk7
CisJCQkiZmFpbGVkIHRvIGZpbmQgbW9kZSBcIiVzLSUuMmZIelwiIGZvciBjb25uZWN0b3IgJXNc
biIsCisJCQkgcGlwZS0+bW9kZV9zdHIsIHBpcGUtPnZyZWZyZXNoLCBwaXBlLT5jb25zW2ldKTsK
IAkJCXJldHVybiAtRUlOVkFMOwogCQl9CiAJfQotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
