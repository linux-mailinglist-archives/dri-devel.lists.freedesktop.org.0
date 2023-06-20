Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE4736AF3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2909810E17F;
	Tue, 20 Jun 2023 11:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502CA10E17F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:30:04 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso4042231e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687260602; x=1689852602;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S29GAOwwZU/UObQHm7K1yfmLnNLJ0R5m3hwbW5Fh5rM=;
 b=bTHzG1h+kD6J4+vhZGTHsDyQ7K9hsvawjTM8WE0Y53ykw8hcvb33uM/nwcsw9F1zeq
 9Qm4mrsxdOXq4zyXtZ13fmn+xqzbMBpL7QcIdWZMFb8mFPO2f8/xfle2z8/Vneebn5js
 aypBK6IFASC/87S/DLQjnkLRr2dkPMxE6P6ppFcR5sXRoZwijyQjqSikNtcoHWtAB7Fr
 lr1fhfjnnkJPyKCylS+BVb+BxD3trYNhV+B9hplhpSMFhwnZvZJP631l4UPfLlogvATX
 eLfeZUgszbL4qoQM1uwF5Yc511j7pNni5TVMP5sWq3C3167ZSvJVa8avuVDIz889LByE
 bdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687260602; x=1689852602;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S29GAOwwZU/UObQHm7K1yfmLnNLJ0R5m3hwbW5Fh5rM=;
 b=MIyGjrqj2SDclejvgQU5DNGD0BGJflf69ttXwU53SPYVAjJWvux+WbVnpdLKosFosk
 46BSjYodkv2erZRn2Bq/eh3pmzc4yQn38Ksg/7le0pudEte0LV+JUodBXuzDYYAzphZ6
 0qaW4tbsWocKgqcGetUJ4MaXFnoFM59zzOqZsDuDNGAaNRGv9uCcLUzqz71WIXz9ckfb
 6tvgWnDYNAbi+O8f1lfFq66Md6lKgTyFzDy5uhHpHmDJJ+ODZUJgbS8RAaj9Sdtd2BtV
 vv0zb//RdYJ+ANqr8VpJsnE9ZrBAUZQ02PXB91Qq0PzkNduRLr96Zn3cFtKQNkqxFo0H
 fojQ==
X-Gm-Message-State: AC+VfDwUF1lj8bKuXVMXE2Vk4WKsxOmVadZfeT6melRT/1MjibSu0eVL
 8cCLPDL1MyTwOEyr2LH/Tq8Emw==
X-Google-Smtp-Source: ACHHUZ6QUJ2NUSmwlMllnTnlwhUMH00U8cch0Y7x4JBrv6lDEvgv8KA6emtEHyH6UtWTECxcKatUAQ==
X-Received: by 2002:a19:5055:0:b0:4f6:14d1:596d with SMTP id
 z21-20020a195055000000b004f614d1596dmr6541924lfj.61.1687260602313; 
 Tue, 20 Jun 2023 04:30:02 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004eed8de597csm335709lft.32.2023.06.20.04.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:30:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] DSIPHY RPM
Date: Tue, 20 Jun 2023 13:29:57 +0200
Message-Id: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWNkWQC/x2N0QrCMAwAf2Xk2UBXRcVfEZG0jTYwu5KoKGP/b
 vDxDo5bwFiFDU7DAspvMZmbw7gZIFdqd0YpzhBD3IZ9DPicu2QsJr1+r9ofyLQ7jodEhSiBZ4m
 MMSm1XD1sr2ly2ZVv8vl/zpd1/QHd37O+dwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687260601; l=636;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wCUG/R9HXWMnAwuGxYhXrhmjszSC6nEVuCGugxXUvag=;
 b=oLojyqv8R2Yxb/4Bx0OPl53gbOYVtZGEvfDiYfytg8gFL3uXbs/agnHkUqk3yiONeq1e1qWA5
 xXDfhniDSFOBXQOoH7SqEunzIznVpy6eWLBLQDUMiYekoP0h3tuhm+y
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

Some recent SoCs use power rails that we model as GENPDs to power the
DSIPHY. This series attempts to make such configurations suspendable.

Tested on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      drm/msm/dsi: Enable runtime PM

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230620-topic-dsiphy_rpm-ea4817badaab

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

