Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B6E544BDF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479C311BEA9;
	Thu,  9 Jun 2022 12:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDD111BE64
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:56 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u26so36991038lfd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfEwLmFa+rnyzBz5wSYp6fbvYkhVpWWBGyc2jbt7Ik8=;
 b=sHmblSRIN65HZRXS7KK3EBqEX68dT9yNdXqkjJBLOcYDi3m1fjIJuhQgVU+Tx7Pqsj
 8UcSSZYixHZpw39TB785gaHCVhBvco5Z70ik112YlIG929SRVgc9yL45GexZuC8iYiqS
 jw2lFrJhP4W50beZ9CwaqapprUlePI69JXEJoDIlX668rQCliUJtmX5XG8MPEnxPMF4n
 su2j4mb4ad/DcaXxACJ5WrmaJjrGGDkpoYf5A5qDMGWBFfvxmzbm0aAQ7wLPXd+2+jSQ
 /ZbKH6zfHF9grbX7jnx/I0TpPK8h2q4duPSLIQ9LhO7BlmonQCxa8JYREYN8usgeGpdW
 hu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfEwLmFa+rnyzBz5wSYp6fbvYkhVpWWBGyc2jbt7Ik8=;
 b=0y0XThgi0W4Z9o+X7QKButyDO+RXyqrvLjv/D4bzGhS72F3gu/kPT6AmuduQIZ2te5
 /dybKOvWWD37M669Dp1ywXJepqK1N8TYY98LOeggA8n7ECqEX+62wbc7wH6NrpdoOKpN
 loASePaSOcMqeV0X6Zl505aLqrxTgqRG4Jpkk7a2nKdEPzQmUYgVIPAyzp7OcrIOV0dq
 Q4YONk0dLoRVCAMjLIpM34x6h4PHMzQGMmduEHqNBxod0tyNpwU5ZoXuDyX/NhhlRhrl
 2BUrUCTxghp0W3tHEOHSY/W/vvAm3/LlCPBRZWMx9QlY+Z+VeSSWEUg13L6L+7XON2qD
 9iTA==
X-Gm-Message-State: AOAM533OKcwI762Lyv4HHAcX217hmZ5R8a80ejPYNJ4L+GkzgYQjhlDu
 wgNLGgEhLfnUb9bNyo4SFJCeRA==
X-Google-Smtp-Source: ABdhPJwcuqI/GbvvTWxReKbRyLRjsRwZsuau95EK6p4dFoxSEmp+Q+0VqmZPsfz74TayqYctZ2KHxA==
X-Received: by 2002:a05:6512:220f:b0:479:65e1:c802 with SMTP id
 h15-20020a056512220f00b0047965e1c802mr7685829lfu.250.1654777436272; 
 Thu, 09 Jun 2022 05:23:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 05/14] drm/msm/hdmi: drop the hdmi-mux support
Date: Thu,  9 Jun 2022 15:23:41 +0300
Message-Id: <20220609122350.3157529-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the last (and only) in-kernel user of hdmi-mux regulator, drop it
from the HDMI driver.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 73070ec1a936..7267167d5ef1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -361,7 +361,7 @@ static const char *hpd_reg_names_none[] = {};
 
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
-static const char *hpd_reg_names_8960[] = {"core-vdda", "hdmi-mux"};
+static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static struct hdmi_platform_config hdmi_tx_8960_config = {
-- 
2.35.1

