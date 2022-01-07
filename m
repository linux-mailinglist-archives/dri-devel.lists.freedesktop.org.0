Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF11487208
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4A81130E7;
	Fri,  7 Jan 2022 05:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6A1130E5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 05:13:39 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id p12so4511525qvj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 21:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMydJcrYBWYfz++yrfm9numu8P51rovdFWjDysMdzMU=;
 b=a5jrSCUy1qzOk0ZWI58bGTSzjl7h9MI33mTRLrzjp7eqX8vy2OgCMm2NqzCxatLtgR
 pTyMLjRvp+Yy8AnNOsoPYCIwX9PbUxcjR+7GXviasb2iEPKt42v23yzYdFuP4F20S2QP
 8AXrB2iCLHTvGO2pwE7gjPdo2W/qBDPULbtokC0xvegiSt+EGi5yr2N2t86uh72aUZuQ
 l/RbSq9sPih1MRDegj4CtJbcpmy5aHfi35ffmVMBNb5D2lNoTRHlUV19yUEvcDHv9ppz
 OK94V3/VZj/t1WYEFVmH0UmVq00C4l2JTO04PRoGjMNn79VG74R78n3cfnkDRVEoJ143
 7HxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMydJcrYBWYfz++yrfm9numu8P51rovdFWjDysMdzMU=;
 b=XaGFhz7kh9Asfm5XH9nBivzgHvmdlooeWh25EI36uKMFksaixK66Ybu8GttWQFHTSL
 frzZJZIKTVAyrDWeTnar6e7Vw0d9nWh5DMVTDjf+8s2nWWSpA/rvJWE0kyO98UEg1Rnr
 hgh//tt1HFSz1TcbKYutbp6YERIm8dDjHROV8bj6rGkXcAImCfJ94y7nxLa46uYlTavF
 KLGIkLZEQG4vuHjzHNAzXbZgtZsb/JmMztt4m/bjqgvyA3YorwJWWYXU+7VaONbxmFTN
 n0+YHu33u0COw9U17VIgOaoQOyEWeBtZjPk64JF/2+Gy5M3Zo77sQDNJ+JATVXbiAQpd
 opvg==
X-Gm-Message-State: AOAM533KyrfWLRUm3sBGXTQnFWZz41fnQIZcc2KFKI7WbEqK/uNLiUDH
 oa4ykFzpSB6IOLMSOMs3rPw=
X-Google-Smtp-Source: ABdhPJzQlCJkK20myaaVTzColneVsGaenQ+DXHtAqF3mYdlYfCIYFWj4CwHF5nOdIFNiuMhMRqGISA==
X-Received: by 2002:ad4:5beb:: with SMTP id k11mr53243086qvc.120.1641532418778; 
 Thu, 06 Jan 2022 21:13:38 -0800 (PST)
Received: from master-x64.sparksnet (c-98-233-193-225.hsd1.dc.comcast.net.
 [98.233.193.225])
 by smtp.gmail.com with ESMTPSA id d15sm1651461qka.3.2022.01.06.21.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:13:38 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/4] dt-bindings: display: panel: feiyang,
 fy07024di26a30d: make reset gpio optional
Date: Fri,  7 Jan 2022 00:13:32 -0500
Message-Id: <20220107051335.3812535-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107051335.3812535-1-pgwipeout@gmail.com>
References: <20220107051335.3812535-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Geis <pgwipeout@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some implementations do not use the reset signal, instead tying it to dvdd.
Make the reset gpio optional to permit this.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 .../bindings/display/panel/feiyang,fy07024di26a30d.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
index 95acf9e96f1c..1cf84c8dd85e 100644
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -35,7 +35,6 @@ required:
   - reg
   - avdd-supply
   - dvdd-supply
-  - reset-gpios
 
 additionalProperties: false
 
-- 
2.32.0

