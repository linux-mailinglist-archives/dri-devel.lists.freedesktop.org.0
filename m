Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8EB31074A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 10:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2445E6E0B8;
	Fri,  5 Feb 2021 09:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B8A6E174;
 Fri,  5 Feb 2021 08:48:26 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id a12so6133325qkh.10;
 Fri, 05 Feb 2021 00:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BzE1rC9+4Ob7a//CgjHcInBulG7U+bfG7YEXt1wxsHs=;
 b=l9dVTCmGoAURLhIdtpY2Il8vjJK+VKdCqHJ1EiB/wVxGZPRe7SNrjXgBqM5mG5M3/E
 H+kS2t2WupnIjZSXM3GcR0RScM0ajwjrzV7/3Qo05Ct+ISrDtDrLNZ7xWsRFnN27tanQ
 4sG9dY24InlBdr0SMSoSY+HvLid8mHrsT/JbpFWdGaTQDJ/HdTg02kJrnFfHOyYIYwQV
 iBuerbx9c+FlAhT0i5h/1t/k74d89WBnIg6+CNdpIsOYZQp63+ArUXIArv/3ls4KokSA
 vm2IKsjVGNE2nvu+T+W7EPJ5FgH/Ud5MBb+f7qIeni0jCsYLYBHxTH8vj8LYy0IY0WSC
 ygcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BzE1rC9+4Ob7a//CgjHcInBulG7U+bfG7YEXt1wxsHs=;
 b=i9nuhFSe5/tuN7I3ho7ytCL2Iba0P9QMXWOTSIcoIJOjMLwuFiCztOvWlVvJecr8iB
 0IAlV9KDf+CUxQgvnHWJDx3bgtYp7snfr57fKw8e3YkNuxKPG7a4ItfEzinMsdC+r63I
 ia9FikjSNj+xq0Tx4PX5t5FbxBH4pB7mdhp6YmhbIIzg4LZhzt6F6EPCWAxj9K1aS6Em
 qd4YHLchiCtD88K66SqsudxkQ1dsPuURsJ15MdKwbS8bC6XRUcsyasCVLr1KRO4IGb3g
 Y41k8zVWh14VC68W3P2/x/On5bVFIUio/JHOrT4u+rS4pirOkl73QSA9Hf/56TaIrun2
 sOQA==
X-Gm-Message-State: AOAM531KlwldqWNjo2ludHahkRaLTedKzuBAgw5fHCRAAcbRl53JEeEl
 GB6LyBn99tpzcI5uXgx8elU=
X-Google-Smtp-Source: ABdhPJwEsp2HDY6aiAZnc37qMPpbhH6YkFjIEJrGnJSSGixJ0jWz4+FKSkGEAK6X9G6aC8EfvAL/EA==
X-Received: by 2002:a37:9bca:: with SMTP id d193mr3262357qke.369.1612514905594; 
 Fri, 05 Feb 2021 00:48:25 -0800 (PST)
Received: from localhost.localdomain ([156.146.36.157])
 by smtp.gmail.com with ESMTPSA id b17sm7906715qkh.57.2021.02.05.00.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 00:48:24 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gpu: drm: msn: disp: dpu1: Fixed couple of spellings
 in the file dpu_hw_top.h
Date: Fri,  5 Feb 2021 14:17:58 +0530
Message-Id: <20210205084758.354509-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Feb 2021 09:07:36 +0000
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



s/confguration/configuration/
s/Regsiters/Registers/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 8018fff5667a..3aa10c89ca1b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -30,7 +30,7 @@ struct traffic_shaper_cfg {

 /**
  * struct split_pipe_cfg - pipe configuration for dual display panels
- * @en        : Enable/disable dual pipe confguration
+ * @en        : Enable/disable dual pipe configuration
  * @mode      : Panel interface mode
  * @intf      : Interface id for main control path
  * @split_flush_en: Allows both the paths to be flushed when master path is
@@ -76,7 +76,7 @@ struct dpu_vsync_source_cfg {
  * @setup_traffic_shaper : programs traffic shaper control
  */
 struct dpu_hw_mdp_ops {
-	/** setup_split_pipe() : Regsiters are not double buffered, thisk
+	/** setup_split_pipe() : Registers are not double buffered, thisk
 	 * function should be called before timing control enable
 	 * @mdp  : mdp top context driver
 	 * @cfg  : upper and lower part of pipe configuration
--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
