Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70E3436A6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 03:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBE389F45;
	Mon, 22 Mar 2021 02:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D0889E33;
 Mon, 22 Mar 2021 02:30:08 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id l13so11291883qtu.9;
 Sun, 21 Mar 2021 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvjZTnV0KXTOt6FoMEGeyuaARj6MWBBMh4fFyNUYLHc=;
 b=vKqNSZUg+4uP25F352kby1rk0lcESPnXbY/EH6+UcPNaGuBORCpLwQtO124775KkQM
 E+Lvn23aU0kTmfajV6c9rxTEdbg9QkHmhI1Rb2ED0clQ8SXGmjLoxePQHPPgGwHU/uYG
 J5whb5Ei4bDtymvIkxtyAkkzatbfAGEdmrEQL5Eikug+ZAL07EWXdtLfR4EHhGn6Uy3Q
 LMT4BRFM+7k0Z9S7r7WqNC32NBaScceHAUhmz2zbDRKXzoAN8XAFDv5cHKM7X1uvNrwu
 N9RQbP466NE75ds4abTnccq7yYKH/z60f+0Y5vmzTIoj9t1UxGguuzjUYTtmhYDbHsnv
 j/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvjZTnV0KXTOt6FoMEGeyuaARj6MWBBMh4fFyNUYLHc=;
 b=Hiu9hwWCaQyHL/jP17uWPPzkWhIJHfWIticLlbwD5LB1PArXG69MeseiAGkvzSv/vv
 hQCDstjRNuAPkYnV/fwy8H7+TEAhhW7dA+HArCw/Z/daeEnzfCWt/dA7sWgjQFvJ3M4A
 PUnIKPW4nPJbOLsj8Sy/ZyCMAbLRdtd140iqeiUd2G/H2Ewqev3fygzZikz0fvwvKwv5
 WsBK6WvBo65ixaW/XDKYAT7WigIuly0kbtfTRtSRBo9F31mvvoQEp3aZm56TzbqqEQAK
 OUBdH84he9zZEDOpsL/zlCO3pndzbCwq9xcPiV3r/Bn8rX5XeztEIsu1bAb+ViCJJ8iP
 5r5Q==
X-Gm-Message-State: AOAM533C1D2Jq+dyYo5VVz/1akORrfjA599QlCj5kyTU9i1C00V+HBHg
 MUFLf1N/prZvvPGEWVy+gb8=
X-Google-Smtp-Source: ABdhPJzOxpAVcvDY/QGh4hA1ktphV1/piQaxf6ge4I+IkDQwgK+SVmv3s1Yc8Nc3EZeFC4vcDYJnKA==
X-Received: by 2002:ac8:3984:: with SMTP id v4mr8253221qte.90.1616380207926;
 Sun, 21 Mar 2021 19:30:07 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.190])
 by smtp.gmail.com with ESMTPSA id j24sm9809004qka.67.2021.03.21.19.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Mar 2021 19:30:07 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 dt@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display:  Fix a typo
Date: Mon, 22 Mar 2021 07:59:53 +0530
Message-Id: <20210322022953.40901-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/Subsytem/Subsystem/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..4b335baa3fd2 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -2,7 +2,7 @@ Qualcomm adreno/snapdragon MDP5 display controller

 Description:

-This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
+This is the bindings documentation for the Mobile Display Subsystem(MDSS) that
 encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
 controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.

--
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
