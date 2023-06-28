Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A0741896
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 21:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D10F10E388;
	Wed, 28 Jun 2023 19:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719510E388
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 19:05:13 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b5c231c23aso2922481fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 12:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687979111; x=1690571111;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J5YZzdJQyh4eu5fAj6xameoZPW5lmqQSZHtsSrZxy+c=;
 b=bApBKeIV6L+P7bQQSgdCs8KOomZuQ+P1vVzFbdcBYF5YrlqR1gQpUbDKW+svoxZM5u
 ZMI1O2A432MkFzaG9yEcIzwtnDdz7yUanUYRGGth1TcETQ9nw9TCowrr7KBXzjA4LaTT
 5a9wa4Mx67QZRyBtXHn535wSfV3hKRjiKJ8O6R7VMaIhU8OrO+kbE1JHkq26aLgK220A
 SlOWKQVRIMGY/BBPpmz2qqLFTj6aG1IUWc/dmxZA5aT9ZSYr01DHDkK0pZbIM0b67bCb
 G1p8PRTStaNe7WCI/CTPdXo6fR7CNQGEg7Na2JMDre/uMZseZJCfO5KoSO4gZyFtudW2
 uK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687979111; x=1690571111;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J5YZzdJQyh4eu5fAj6xameoZPW5lmqQSZHtsSrZxy+c=;
 b=BPuKpK9plP+0Y/F1alyZqVyspCQlDxE5ediudM/QpniubRXDcDC+meq1zoQ46fcWMV
 iSrs8AXpG7oEH6fg9xqSobUC48ynJN/MDqtuIMIVSull2NQraveJtJvDZH8BSPNvFMg4
 0PrR5YPzqNCJASdnMtfVYmT0i9dkM/PGTt9sEDCWtPJilo++tYuQvZyosZFxnM9A1jjv
 8zrjyjavGQbQZMQX0VkO+sL60VXQuNpYE+33sMJKS/GogzkzqmliJns1s91AO4GWncIn
 Tljr0LI9HtraTYw1OM0YTf013h3AmhBZCH/n42VUUPhiwlnbqee/+CdjUKFBOTJl83oi
 Iy7w==
X-Gm-Message-State: AC+VfDzcRtJd7MGrp7c8JYr8ENOEAbzCtLwX7L4fvLSWLuRV23LRM2GW
 7tk27xHFRbKkF8vp0QS2tTC0ZA==
X-Google-Smtp-Source: ACHHUZ4bn9WdqZwlwgpaohN+JH/FskgQr6To+oDImxYoZ8FAbp2paEayyppRUM7Xb7j7v5znECW0yA==
X-Received: by 2002:a2e:900a:0:b0:2b4:6195:bb26 with SMTP id
 h10-20020a2e900a000000b002b46195bb26mr22432303ljg.25.1687979110797; 
 Wed, 28 Jun 2023 12:05:10 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a2e9c46000000b002b6a85a7292sm1102616ljj.19.2023.06.28.12.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 12:05:09 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 21:05:08 +0200
Subject: [PATCH] drm/msm/adreno: Assign revn to A635
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a635-v1-1-5056e09c08fb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGOEnGQC/x2NQQqDMBAAvyJ77oJJrNp+RTwk221dkCiJihD8u
 0uPMzBMgcxJOMO7KpD4kCxLVDCPCmjy8ccoH2WwtXV1a3vcllUIfeueaIIjS6++a0wHGgSfGUP
 ykSZN4j7PKtfEXzn/h2G8rhsjRnTzcQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687979108; l=1049;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yOF2V2vC/eERQ5I69KrybMFDlBclITTn/+Bht2rKkYY=;
 b=T9f2BftsBHUMn+H55F1KeMb0BOE9TuUoOA3jtNlB1lxYTYSv97uLuQMLHUS9T4OyQkR1hib9J
 t+Eg5u6zA8ICDEQPx9CoIlDczwxnK718qaXUbFdux/m3XE4IGEwzpIS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently, a WARN_ON() was introduced to ensure that revn is filled before
adreno_is_aXYZ is called. This however doesn't work very well when revn is
0 by design (such as for A635). Fill it in as a stopgap solution for
-fixes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb94cfd137a8..8ea7eae9fc52 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
 		.address_space_size = SZ_16G,
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
+		.revn = 635,
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",

---
base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
change-id: 20230628-topic-a635-1b3c2c987417

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

