Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C2FF916
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BE36E33A;
	Sun, 17 Nov 2019 11:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680060.outbound.protection.outlook.com [40.107.68.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301BB6E60D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 14:32:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4f3qXHOIAdXuoTIBkyqfgNXLewqEcCbo9ZulxUBjXU7HUVqdQdE3CrgdpLfnZ0i/m9Ty7WEzLm3j2fK7u3MoU8f850bJqd/Kswj9T4JXP14CqElRUYQ9PUIsU73DIC7aYHXI9rDdzWZYWJj2LiIPAV9Ty+/kdBYjP2xDm9u1UvB8Y7mrRTgZs6qLsX2pGqU0flTOarVla4fdzPJv1Z29byUn2wwQJynq5jDi7tppoRH5bT3mwwTmOq8H6BQyRaur9ibNlN5gnubAa4hIOJQGHQ3e/0vuNqgQU0YZTUaTL2qS94z3mDu1W93uCNzG81gJp0lhWddpCAao6FMLobQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6G2AbMYjpi2trRoPg+zWW0w6MmWY+YNDzD+fS4FY7E=;
 b=DyiOFyIVj930UXc48VgKVGjoPo4TJ2lbPDQXO72DXc7KbNut14hAnG82QU3IuBTJLWycf+CR9qPMkwrn3uLXpL4y0rBUbpaoSkxcZjByg1efsWBangjzEZhfNcLA1d1Xefew+8herpND0BUX3VFeMZHC9rHHz9rOTW/SWWoNIjH8JMdlgfY39cYufvvBzVKS5Y0YpbULY0L84QH0UZ6trzgxBWPFSmNERPDrYuhz2zedgWwokH67btc6I2kT0Q//Z+eD2QcxuswIuS6qX7/vX2XQ6YZaT30b7OURzMf4bkChlnKFTL5ZgBJARyVF7X3HNHziEojir9SCVyewcCCoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
Received: from DM6PR02CA0054.namprd02.prod.outlook.com (2603:10b6:5:177::31)
 by DM6PR02MB6493.namprd02.prod.outlook.com (2603:10b6:5:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Fri, 15 Nov
 2019 14:32:13 +0000
Received: from CY1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::209) by DM6PR02CA0054.outlook.office365.com
 (2603:10b6:5:177::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 14:32:13 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT061.mail.protection.outlook.com (10.152.75.30) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2451.23
 via Frontend Transport; Fri, 15 Nov 2019 14:32:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iVcdw-0005QX-B2; Fri, 15 Nov 2019 06:32:12 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iVcdr-00034m-7I; Fri, 15 Nov 2019 06:32:07 -0800
Received: from [172.19.2.102] (helo=xsjanandash50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <devarsh.thakkar@xilinx.com>)
 id 1iVcdj-00030z-2I; Fri, 15 Nov 2019 06:31:59 -0800
From: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
To: dri-devel@lists.freedesktop.org,
	ville.syrjala@linux.intel.com
Subject: [PATCH libdrm v4] modetest: Add support for setting mode having
 floating vertical refresh rate
Date: Fri, 15 Nov 2019 06:31:00 -0800
Message-Id: <1573828260-322-1-git-send-email-devarsh.thakkar@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(376002)(39860400002)(199004)(189003)(50466002)(106002)(70586007)(316002)(36756003)(356004)(6666004)(2870700001)(2906002)(5660300002)(36386004)(4326008)(70206006)(476003)(2616005)(47776003)(126002)(14444005)(486006)(44832011)(426003)(305945005)(336012)(478600001)(8676002)(26005)(186003)(81156014)(81166006)(7696005)(23676004)(66574012)(9786002)(50226002)(8936002)(107886003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB6493; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a307997-d56b-4e23-fba1-08d769d89af3
X-MS-TrafficTypeDiagnostic: DM6PR02MB6493:
X-Microsoft-Antispam-PRVS: <DM6PR02MB649362A07F4B617C3BDBAC92BC700@DM6PR02MB6493.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Qo0ECkedEVXs+frHFsTJ16ZGQkKQQK5rdIpYQwPN2LFi+JA1iQ9fKLK7h0rZvLLGjNSK+QoOBluQOr1iq2eSfhjoUMLMXqoiCWkp2m3jpauR7Gmt66nUQmxZSH6oPKA/GKvrJA9lEt6yD5/ZSlp4/WM+Q8yIr8536DhfyjTun19l6II5USC4xbo781dQkNgJQphngUC1iKeEsfmquzx+/eEjowQErNQLI23XKHkqax+mYovC1om16JnLxySIUYqBTv2gDN5EgtSPeLODfqAfZVG4w1l23vDVUYoBQe5A/Wx3Jn8Y2zYsQ9JPW0usVhXCBtFaf2nWmlq/DYfRBwHg69c93vfO5uQTAFcBMHqjcdJ0Slo+S1y99HcjU1I839AoiE2+EPQd1c9pCPjGud6g7XZkyIPbHEPva2kNdBtvAEvjhrQKYu1woyyLbSh30an
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 14:32:12.8016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a307997-d56b-4e23-fba1-08d769d89af3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6493
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6G2AbMYjpi2trRoPg+zWW0w6MmWY+YNDzD+fS4FY7E=;
 b=brNL7y4sCdH92TiH180JSGpZ+BClINTdaUNRP0fci7gLNLt59s3ofz7LTHxtr8d0pPKVUcr4+RXMRhHKI467MbzQtsyJYSUlXfhEfh/pLUOdpCpX34O+2A/P8TVNRnPKjEOOhTuMcpTgsxSIrIuUMvsZ7Rpl1Ma1NGAyCCPfLhE=
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
bW9kZSBoYXZpbmcgNTkuOTQgSHogcmVmcmVzaCByYXRlLgoKVjI6IFVwZGF0ZSBjb21taXQgbWVz
c2FnZQpWMzogVXBkYXRlIHdpdGggYmVsb3cgY2hhbmdlcyBhcyBwZXIgcmV2aWV3IGNvbW1lbnRz
IDoKICAxKSBVc2UgZXBzaWxvbiBmb3IgdnJlZnJlc2ggY29tcGFyaXNvbgogIDIpIFVzZSBpbXBs
aWNpdCB0eXBlLWNhc3Rpbmcgd2hlcmV2ZXIgcG9zc2libGUKVjQ6IEtlZXAgcGF0Y2ggdmVyc2lv
biBoaXN0b3J5IG9uIG1haW4gY29tbWl0IG1lc3NhZ2UKClNpZ25lZC1vZmYtYnk6IERldmFyc2gg
VGhha2thciA8ZGV2YXJzaC50aGFra2FyQHhpbGlueC5jb20+ClJldmlld2VkLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL21vZGV0
ZXN0L21vZGV0ZXN0LmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvbW9k
ZXRlc3QvbW9kZXRlc3QuYyBiL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKaW5kZXggZTY2YmU2
Ni4uYjRlZGZjYiAxMDA2NDQKLS0tIGEvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYworKysgYi90
ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jCkBAIC01NCw2ICs1NCw3IEBACiAjaWZkZWYgSEFWRV9T
WVNfU0VMRUNUX0gKICNpbmNsdWRlIDxzeXMvc2VsZWN0Lmg+CiAjZW5kaWYKKyNpbmNsdWRlIDxt
YXRoLmg+CiAKICNpbmNsdWRlICJ4Zjg2ZHJtLmgiCiAjaW5jbHVkZSAieGY4NmRybU1vZGUuaCIK
QEAgLTc5NSw3ICs3OTYsNyBAQCBzdHJ1Y3QgcGlwZV9hcmcgewogCXVpbnQzMl90IGNydGNfaWQ7
CiAJY2hhciBtb2RlX3N0cls2NF07CiAJY2hhciBmb3JtYXRfc3RyWzVdOwotCXVuc2lnbmVkIGlu
dCB2cmVmcmVzaDsKKwlmbG9hdCB2cmVmcmVzaDsKIAl1bnNpZ25lZCBpbnQgZm91cmNjOwogCWRy
bU1vZGVNb2RlSW5mbyAqbW9kZTsKIAlzdHJ1Y3QgY3J0YyAqY3J0YzsKQEAgLTgyMiwxMSArODIz
LDEyIEBAIHN0cnVjdCBwbGFuZV9hcmcgewogCiBzdGF0aWMgZHJtTW9kZU1vZGVJbmZvICoKIGNv
bm5lY3Rvcl9maW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1aW50MzJfdCBjb25faWQsIGNv
bnN0IGNoYXIgKm1vZGVfc3RyLAotICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgdnJlZnJlc2gp
CisJY29uc3QgZmxvYXQgdnJlZnJlc2gpCiB7CiAJZHJtTW9kZUNvbm5lY3RvciAqY29ubmVjdG9y
OwogCWRybU1vZGVNb2RlSW5mbyAqbW9kZTsKIAlpbnQgaTsKKwlmbG9hdCBtb2RlX3ZyZWZyZXNo
OwogCiAJY29ubmVjdG9yID0gZ2V0X2Nvbm5lY3Rvcl9ieV9pZChkZXYsIGNvbl9pZCk7CiAJaWYg
KCFjb25uZWN0b3IgfHwgIWNvbm5lY3Rvci0+Y291bnRfbW9kZXMpCkBAIC04MzksOSArODQxLDEx
IEBAIGNvbm5lY3Rvcl9maW5kX21vZGUoc3RydWN0IGRldmljZSAqZGV2LCB1aW50MzJfdCBjb25f
aWQsIGNvbnN0IGNoYXIgKm1vZGVfc3RyLAogCQkJICogZmlyc3QgbW9kZSB0aGF0IG1hdGNoIHdp
dGggdGhlIG5hbWUuIEVsc2UsIHJldHVybiB0aGUgbW9kZSB0aGF0IG1hdGNoCiAJCQkgKiB0aGUg
bmFtZSBhbmQgdGhlIHNwZWNpZmllZCB2ZXJ0aWNhbCByZWZyZXNoIGZyZXF1ZW5jeS4KIAkJCSAq
LworCQkJbW9kZV92cmVmcmVzaCA9IG1vZGUtPmNsb2NrICogMTAwMC4wMAorCQkJCQkvIChtb2Rl
LT5odG90YWwgKiBtb2RlLT52dG90YWwpOwogCQkJaWYgKHZyZWZyZXNoID09IDApCiAJCQkJcmV0
dXJuIG1vZGU7Ci0JCQllbHNlIGlmIChtb2RlLT52cmVmcmVzaCA9PSB2cmVmcmVzaCkKKwkJCWVs
c2UgaWYgKGZhYnMobW9kZV92cmVmcmVzaCAtIHZyZWZyZXNoKSA8IDAuMDA1KQogCQkJCXJldHVy
biBtb2RlOwogCQl9CiAJfQpAQCAtMTM5Myw4ICsxMzk3LDggQEAgc3RhdGljIHZvaWQgYXRvbWlj
X3NldF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHBpcGVfYXJnICpwaXBlcywgdW5z
aWduZWQKIAkJaWYgKHBpcGUtPm1vZGUgPT0gTlVMTCkKIAkJCWNvbnRpbnVlOwogCi0JCXByaW50
Zigic2V0dGluZyBtb2RlICVzLSVkSHogb24gY29ubmVjdG9ycyAiLAotCQkgICAgICAgcGlwZS0+
bW9kZV9zdHIsIHBpcGUtPm1vZGUtPnZyZWZyZXNoKTsKKwkJcHJpbnRmKCJzZXR0aW5nIG1vZGUg
JXMtJS4yZkh6IG9uIGNvbm5lY3RvcnMgIiwKKwkJICAgICAgIHBpcGUtPm1vZGVfc3RyLCBwaXBl
LT52cmVmcmVzaCk7CiAJCWZvciAoaiA9IDA7IGogPCBwaXBlLT5udW1fY29uczsgKytqKSB7CiAJ
CQlwcmludGYoIiVzLCAiLCBwaXBlLT5jb25zW2pdKTsKIAkJCWFkZF9wcm9wZXJ0eShkZXYsIHBp
cGUtPmNvbl9pZHNbal0sICJDUlRDX0lEIiwgcGlwZS0+Y3J0Yy0+Y3J0Yy0+Y3J0Y19pZCk7CkBA
IC0xNDc2LDggKzE0ODAsOCBAQCBzdGF0aWMgdm9pZCBzZXRfbW9kZShzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBwaXBlX2FyZyAqcGlwZXMsIHVuc2lnbmVkIGludCBjbwogCQlpZiAocGlwZS0+
bW9kZSA9PSBOVUxMKQogCQkJY29udGludWU7CiAKLQkJcHJpbnRmKCJzZXR0aW5nIG1vZGUgJXMt
JWRIekAlcyBvbiBjb25uZWN0b3JzICIsCi0JCSAgICAgICBwaXBlLT5tb2RlX3N0ciwgcGlwZS0+
bW9kZS0+dnJlZnJlc2gsIHBpcGUtPmZvcm1hdF9zdHIpOworCQlwcmludGYoInNldHRpbmcgbW9k
ZSAlcy0lLjJmSHpAJXMgb24gY29ubmVjdG9ycyAiLAorCQkgICAgICAgcGlwZS0+bW9kZV9zdHIs
IHBpcGUtPnZyZWZyZXNoLCBwaXBlLT5mb3JtYXRfc3RyKTsKIAkJZm9yIChqID0gMDsgaiA8IHBp
cGUtPm51bV9jb25zOyArK2opCiAJCQlwcmludGYoIiVzLCAiLCBwaXBlLT5jb25zW2pdKTsKIAkJ
cHJpbnRmKCJjcnRjICVkXG4iLCBwaXBlLT5jcnRjLT5jcnRjLT5jcnRjX2lkKTsKQEAgLTE3MTMs
NyArMTcxNyw3IEBAIHN0YXRpYyBpbnQgcGFyc2VfY29ubmVjdG9yKHN0cnVjdCBwaXBlX2FyZyAq
cGlwZSwgY29uc3QgY2hhciAqYXJnKQogCXBpcGUtPm1vZGVfc3RyW2xlbl0gPSAnXDAnOwogCiAJ
aWYgKCpwID09ICctJykgewotCQlwaXBlLT52cmVmcmVzaCA9IHN0cnRvdWwocCArIDEsICZlbmRw
LCAxMCk7CisJCXBpcGUtPnZyZWZyZXNoID0gc3RydG9mKHAgKyAxLCAmZW5kcCk7CiAJCXAgPSBl
bmRwOwogCX0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
