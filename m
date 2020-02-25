Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7272C16F901
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946B66E16B;
	Wed, 26 Feb 2020 08:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0B06E1E2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:38:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9DrHBmLuEd39/oAx9lA9fLW/0M8CFBlGRIILjkRlBDo3IW7d2PfLKYWTatON46eUk/rzFjO1un7sP40XrAICjtttdKxrfZBr24yKMUe6xBr6kewqLLUJ7TK9w/4tp7xODmFmBKIWR6zLYvb4aDSy+z+W9AcZttGoyIQE8/hR2cXGiWpnK388BNy3TGatEgt0FdI+RYJpkAaexoSLuvYo+RySPDseyI2dfghJSInCSWeyp3Ttls/J9OsrY9fdFnvTs3UXOAywKZk6gPSTRqw78+122TQ79x0UYfw5jcy+BRCm9l5+ASzRRtvGqzPnTpNIYPjHbgRtA2XDcig2hN3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDpb+AE1lUMb8oNIMqfOKmJV4Xles6XkCLls7/S+lZw=;
 b=k3BgVfvvSjV5KoK+l2wRdCaimPksiFQLOlXkxS1SPTrUsUiLYs/Do0XSzEFwuABMPiNY+Uu40lO4l4Uh3HEhOx1ghLQ5LJrVWdJBHKLPcxV7QXTRCYvQ2uTJEG0a80LlI3OsrXvhF9SuB20d0Fq/RkC6v/FHJ2ropnLrqfAX46sXBidWslAC8/ZuB4gBd6XGIH4hWwMXNQyyndGmCSdIVQQvuLhqMfX//684ujxe5/S1ohzlnptVHMqFKE0f0DvhyPI8sebWzJo/QEPUjFTDk4KB+woRDkQGQb3rEMDNMF/h17gRT9IJfFlMAojcMuOpti7pR+bgTyOgYDUVM+8Zgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDpb+AE1lUMb8oNIMqfOKmJV4Xles6XkCLls7/S+lZw=;
 b=KFA6rs9nH9SzW8Yn7kdlHdFSma4K01Vqg8htH7/wkNtU7DPlUTEnJvmpnF3fnXgICMWyuvJDO3ClaYAJDMtd/BhuBM8UUzo7kAOUUyhhpWKuEO5m96RO9sudaIEpEfhyhrSlB4PkS1qCq+ciVT+PL/kDRvsrOqx3C7iBz4KeFj0=
Received: from MN2PR17CA0029.namprd17.prod.outlook.com (2603:10b6:208:15e::42)
 by CY4PR02MB2599.namprd02.prod.outlook.com (2603:10b6:903:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 09:38:33 +0000
Received: from BL2NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:15e:cafe::16) by MN2PR17CA0029.outlook.office365.com
 (2603:10b6:208:15e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Tue, 25 Feb 2020 09:38:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT019.mail.protection.outlook.com (10.152.77.166) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2750.18
 via Frontend Transport; Tue, 25 Feb 2020 09:38:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <rohit.visavalia@xilinx.com>) id 1j6Wfg-0002P9-0K
 for dri-devel@lists.freedesktop.org; Tue, 25 Feb 2020 01:38:32 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <rohit.visavalia@xilinx.com>) id 1j6Wfa-0000Sd-Ta
 for dri-devel@lists.freedesktop.org; Tue, 25 Feb 2020 01:38:26 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 01P9cJuO023369; 
 Tue, 25 Feb 2020 01:38:19 -0800
Received: from [172.19.2.208] (helo=xsjvarunkum50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <rohit.visavalia@xilinx.com>)
 id 1j6WfT-0000QP-N3; Tue, 25 Feb 2020 01:38:19 -0800
From: Rohit Visavalia <rohit.visavalia@xilinx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
Date: Tue, 25 Feb 2020 01:38:16 -0800
Message-Id: <1582623496-6094-1-git-send-email-rohit.visavalia@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(4326008)(478600001)(107886003)(70206006)(9786002)(70586007)(81156014)(81166006)(44832011)(5660300002)(336012)(8936002)(2906002)(6916009)(36756003)(186003)(7696005)(316002)(26005)(8676002)(2616005)(356004)(6666004)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2599; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58512428-6694-4c75-d83a-08d7b9d67aa4
X-MS-TrafficTypeDiagnostic: CY4PR02MB2599:
X-Microsoft-Antispam-PRVS: <CY4PR02MB259967EE6D726A6BC3F30717B3ED0@CY4PR02MB2599.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 0324C2C0E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w4yZuvXSNwHYz8O7cK4BgJOVgTh3+AhdrjusiLxve0vni83/+ZZXcZXogu2EwBebTLtBL+U06Q4Pf+WXWCISKvuwC1pbalYvPUtxiLWcUW2EK9hORub4R1BqO6HIDjf8KIXFi2M9RwrhR3N81s9UY0JRDjkNKox2mFr37RxH7sb19wjkBnvpKm2jfuRdih46rMUPaPIY2ZoP7sHg93QtVOmkJaGn7nerC1sH8Xnce/+d9V8+j68dY3Ak+fkFSi/0/fl/UZQk5lczrutrUbapfoPQx9T4PipoqLAB28Hbdb2yp3mlzWeyaN4TSdQyUqcQP5E7xvw0kNkVD40nGE2Kpgd5uCU14kcKNKTjt/p9BCgB4Z4GqWTmRjlNl8NMeWsGBwhJx+vl4Frrn+CO/NhmRaO4XkYhbjBXZgdlbyryeadzvxFsqtINM+QRrM2P9ZG3
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 09:38:32.6254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58512428-6694-4c75-d83a-08d7b9d67aa4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2599
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: rsk@xilinx.com, dshah@xilinx.com, devarsh.thakkar@xilinx.com,
 varunkum@xilinx.com, Rohit Visavalia <rohit.visavalia@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gamma is a optional property then also it prints error message, so
set gamma only if add_property_optional() returns true.

Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
---
 tests/modetest/modetest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index b907ab3..379b9ea 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1138,7 +1138,7 @@ static void set_gamma(struct device *dev, unsigned crtc_id, unsigned fourcc)

        add_property_optional(dev, crtc_id, "DEGAMMA_LUT", 0);
        add_property_optional(dev, crtc_id, "CTM", 0);
-       if (!add_property_optional(dev, crtc_id, "GAMMA_LUT", blob_id)) {
+       if (add_property_optional(dev, crtc_id, "GAMMA_LUT", blob_id)) {
                uint16_t r[256], g[256], b[256];

                for (i = 0; i < 256; i++) {
--
2.7.4

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
