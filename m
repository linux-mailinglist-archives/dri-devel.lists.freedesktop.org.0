Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E2D62F57D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB0C10E71B;
	Fri, 18 Nov 2022 13:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01D10E1F3;
 Fri, 18 Nov 2022 13:03:42 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id y16so9122800wrt.12;
 Fri, 18 Nov 2022 05:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w+mJ3Edh6kbESl5APrMtH6TLnWHibJoDuQN4pmY1e5w=;
 b=Wx0jlzYay9LjVVSsN2mBigPaEKv37M+N8DcqfI0O38RcH3Co0sRBe1xZWo8497xfiP
 kSMQO7AdA2uhiE2scezpG5UtE5duf5ZOElYbDjAJCGoH4/hr1sl0SLY1+WW9JgnfqpG3
 g8CRZQWUkSbdd4GaQFRmewD8J1dRUyJGObMCeH7ML5vA9Nd7ibKQ3k+Rq+TEviS4kt+w
 AV9tojYVnWs7bWXUwzkM6lgUKXvo4S5vzSmZXNe0U4L9cI6is02a1nL1q5mTQjwxkt/X
 DcvCi4dXw470wasgEEKvAa92ov4U6ehpYVGZ2lCMf+p9Vu9J0gMEnaAuNhvJjftzbBf0
 qgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w+mJ3Edh6kbESl5APrMtH6TLnWHibJoDuQN4pmY1e5w=;
 b=KCC6UX2Es6QM5lPwfyP8ragDCSv8zjZpLJbYQ5r0LG5JrKYbQN9gQ+XjlYKbb4cdgX
 Tg913UXJ0fqQzSI8bnzoXd18IbrMXeFODvNkrMaTSupwliKSCudOYhS6n4hw5BtUJeUJ
 72eMABBVPr1HkQmVQ9Bh0VRyGym36lffVr773ai7E3c1Y8fkj8+fxaAAyBlVK36yHWuP
 WbVB0XmQzSBxorPfOGiNepooQ8H1pqbAs4ttOzUzk7ziRuzYRmuPqUczndjvcOn5Y7NT
 RoMIZ27cE5XNvblu5TfMQ4pcP3Of8JEXYljrTM7C7eHyccoJsesDHxHObfO4WmqNWom1
 GK3A==
X-Gm-Message-State: ANoB5pnQirR3Isj+VXt/rQKQvng+AjfG5oGj8jCc+0Ql9DOblBMNQH06
 dRqfGJLktT/y6O6txe7rgdY=
X-Google-Smtp-Source: AA0mqf44OUQxhKuuRxrZCjitDqseknQPFZscOEbgs+3XxXYr+Wn8F78z00bs+cb03HVN8YAqvWcm/w==
X-Received: by 2002:adf:c64e:0:b0:236:78cd:f3d2 with SMTP id
 u14-20020adfc64e000000b0023678cdf3d2mr4365829wrg.719.1668776621156; 
 Fri, 18 Nov 2022 05:03:41 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c155300b003c6f3e5ba42sm9996185wmg.46.2022.11.18.05.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 05:03:40 -0800 (PST)
Date: Fri, 18 Nov 2022 16:03:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2] drm/msm/hdmi: remove unnecessary NULL check
Message-ID: <Y3eCqQ2pm1uQnktV@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This code was recently refactored in commit and now the "hdmi" pointer
can't be NULL.  Checking for NULL leads to a Smatch warning:

    drivers/gpu/drm/msm/hdmi/hdmi.c:141 msm_hdmi_init()
    warn: variable dereferenced before check 'hdmi' (see line 119)

Fixes: 69a88d8633ec ("drm/msm/hdmi: move resource allocation to probe function")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Add a Fixes tag.  Re-work the commit message.

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
