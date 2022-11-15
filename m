Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C2629988
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE60C10E3C7;
	Tue, 15 Nov 2022 13:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADC610E3C7;
 Tue, 15 Nov 2022 13:03:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m7-20020a05600c090700b003cf8a105d9eso10165807wmp.5; 
 Tue, 15 Nov 2022 05:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2YXSEudsc9acCjyZ9gI8tQXstRzlGGklsZOdLPbwiNo=;
 b=PMayZRM3eFKCloLvTyzjYH6LundInUpmC31aN3lOF2x/ELF21FR0on5O7mVTSts3wO
 g6qm9lIbCtI8Tu8FHtJix+MBnLjKr1/rkxg/+WE9K9PKjLveqXUvHcQ85bWBsSDINlSr
 NrpD7YfIdnWlboCxGpzoS3BzxReT2llXaselZxlKWSyqXa4VfI+0D8cdeBnK2GSvVVSi
 6njp/YfDclStsXVecpjj6FjKKKFzw4TMCIafqnL7riRl+pFgXkts9fkurtXGeyEqTs7C
 bmGnN9KdjMwud2LsVHKBIE3ht7urWyxIWIv5WLaXjQr2dE5th7oKBXOc0xOaz/UcvLoZ
 ZSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2YXSEudsc9acCjyZ9gI8tQXstRzlGGklsZOdLPbwiNo=;
 b=RmyQfF727YfALsR3GI/VOxCOKLp379a0bHvolRZcF6LKdLiVLd99W5agluUGT0ILbf
 GXElEMp+mws22OqwE638LRIcczHCixZL1hJP8CqYiXDHiMT+rJutLinnfhGUcpTERlj/
 4NbWSYAlcXc5f+qTP8vrr6gZJgOimAHQB/7l9VWaTdJm+3pc4nVjVLtnM/ThGG5zYRJt
 zVk6auUzLGg4IkFhC4zcaPNf+Da7w1RkcnvBjNmKGekhVX1e69pbrxkNNDxwBXc1mxfZ
 MJHpooFj001mroZqxJ6GNtcXAg0cG2HFeFNMxSiXqV1M+R6ZXMwhLydb50F1zroQLcRC
 HsaQ==
X-Gm-Message-State: ANoB5pmZ3xSmOTbGjWZEyVrx/TSvIIndOpZNBJhuZJ9yBmM54lZe6g5D
 ldzOKqMjFWVvPRItFUfD9dk=
X-Google-Smtp-Source: AA0mqf71K83H64nJ0Vkrsq1NmTXORfV6reFULGsEXiSiBsSthy861Vt8C3VPP8OLOOHxWLuqHMIZ4Q==
X-Received: by 2002:a1c:740c:0:b0:3cf:b49e:1638 with SMTP id
 p12-20020a1c740c000000b003cfb49e1638mr1449541wmc.50.1668517406464; 
 Tue, 15 Nov 2022 05:03:26 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003cfd4cf0761sm13933778wmq.1.2022.11.15.05.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:03:26 -0800 (PST)
Date: Tue, 15 Nov 2022 16:03:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/hdmi: remove unnecessary NULL check
Message-ID: <Y2o0TKZ5WRYnQXna@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code was refactored in commit 69a88d8633ec ("drm/msm/hdmi: move
resource allocation to probe function") and now the "hdmi" pointer can't
be NULL.  Checking causes a Smatch warning:

    drivers/gpu/drm/msm/hdmi/hdmi.c:141 msm_hdmi_init()
    warn: variable dereferenced before check 'hdmi' (see line 119)

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 7001fabd0977..4d3fdc806bef 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -138,8 +138,7 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 	return 0;
 
 fail:
-	if (hdmi)
-		msm_hdmi_destroy(hdmi);
+	msm_hdmi_destroy(hdmi);
 
 	return ret;
 }
-- 
2.35.1

