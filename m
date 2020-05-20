Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C971DE054
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CAD6E982;
	Fri, 22 May 2020 06:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9ED8989C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 13:39:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04KDbH5s030392; Wed, 20 May 2020 15:39:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=brO3sqZGXqcbkphnICTmMIGQeXj+VgY9J4aJQV0Xnww=;
 b=L5IXSC6XTbj6vAGZut48J6hklJzk1CLGGBe+0eQnyopZgpBq3CojUc7bGcyqvCHUZCNk
 K97H8FkfguiuziG2IAJB/IHadQCG0qtgf9wVy3Xoo6Psnlbe5KRAEfNu+PZK5mfWdC3T
 3tgRFETmEHz0OUcnQuS3cJTiFJAkB+zcC1zeSv6uYR8crBul4LpLGJupQ+y+6Wy2bK+3
 bkZKeunIJzcbkPRYjezyhIpHse2Dg4Og0JNuE13BlRY0Bue9MURYgrbVgeDEjiwpiLV3
 n2fLxwQrRoG8Sf2zWpUYcYB/VIf6Pk4fEtkauS1mD57Ybk8inuC2GG9Zew1uxwbETdQ2 bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3125n3rnbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 15:39:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B95510002A;
 Wed, 20 May 2020 15:39:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D4CD2C38AA;
 Wed, 20 May 2020 15:39:41 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May 2020 15:39:41
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 1/2] dt-bindings: serial: add generic DT binding for
 announcing RTS/CTS lines
Date: Wed, 20 May 2020 15:39:31 +0200
Message-ID: <20200520133932.30441-2-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520133932.30441-1-erwan.leray@st.com>
References: <20200520133932.30441-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_09:2020-05-20,
 2020-05-20 signatures=0
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Erwan Le Ray <erwan.leray@st.com>,
 linux-serial@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support of generic DT binding for annoucing RTS/CTS lines. The initial
binding 'st,hw-flow-control' is not needed anymore since generic binding
is available, but is kept for backward compatibility.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 75b8521eb7cb..06d5f251ec88 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -35,9 +35,11 @@ properties:
     description: label associated with this uart
 
   st,hw-flow-ctrl:
-    description: enable hardware flow control
+    description: enable hardware flow control (deprecated)
     $ref: /schemas/types.yaml#/definitions/flag
 
+  uart-has-rtscts: true
+
   dmas:
     minItems: 1
     maxItems: 2
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
