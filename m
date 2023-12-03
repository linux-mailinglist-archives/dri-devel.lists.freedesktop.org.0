Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFB8022C8
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 12:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524FF10E150;
	Sun,  3 Dec 2023 11:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA97810E10A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so1506505e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602795; x=1702207595; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ILn7PVh6aYBuIQEV/pLqqVkkuCaezFiyrMqK2tj/fnE=;
 b=mqoDIjW3SKp5C3VkZtmMkavf3dItzzoebvlyxrY9xcI2bksPaTA0Xo3yiExpRfrqlL
 tl5gUU+SRU8TTYz/pAW9mb4bQOVX5mQsWjQSqEOa+ERXxUaJITXAl7w8X3d2AWI2g2pL
 e45ZdGqPk0SpqI6ua/7/P5p6i7VrWRbMqvupaPztOWOtWxBVee9I+S6Dh8M54qVDIRn+
 HtJ2SN2ubicfEl5tg31Jh2urCcF9WoYRsijUgREZPebelPyXDn9ruD1W3xVwp2TFITrX
 osFXqiVDoiAZvSKi7uL/8G3GUqraKJeAOIp3bCchfXDIaCKboL5GMogiBZUiTle+m0sD
 N0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602795; x=1702207595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILn7PVh6aYBuIQEV/pLqqVkkuCaezFiyrMqK2tj/fnE=;
 b=smRbPlKIK0XvyhzUv8poQBO4VwA9T0BVAf34DFm1xqG9WuqL5XPfrRYPDXJB/ChTcp
 sc60KfdoK8DiXwFY6BgjieF5SV43g+w3xLfcNC2bZ1seTgtk/zDCh2EfY1IqZQlwQTZM
 iNawDP6aIH66JgnJfCTl7NexjipydfvtEhLTII5EmuKkN4dTWOurqtKekF8XHc0RKwTt
 dgBneLBZzRM5bk4GjOawtS3T8hTNJXdLaHUfS0InuYR8/4GTE8AD++AHo9tOHwyX0QT+
 h8YjqdVNOTewfQ9LoZMlADNcmSUniafSL4Pr3Knz1yZV66CbsLlDH4mi9KOM0w4LPUib
 PFVg==
X-Gm-Message-State: AOJu0YzCCl2tDG6WD4obBPM8BdToTrtfuCziQ1ykbawW2TJ3DdxEeZv2
 rSzEhKzqBuRN7xbWoeJLxufbJg==
X-Google-Smtp-Source: AGHT+IE9COw1Y68kTBfxxsXnuXRJ3h2E+eC8l9YxhsjXV/OdXFAs/7OMg0yg+x2mIKvHKolp2c/eUw==
X-Received: by 2002:a05:6512:2812:b0:50b:f0a9:1e3e with SMTP id
 cf18-20020a056512281200b0050bf0a91e3emr557443lfb.3.1701602795005; 
 Sun, 03 Dec 2023 03:26:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dp: cleanup debugfs handling
Date: Sun,  3 Dec 2023 14:26:19 +0300
Message-Id: <170160265546.1305159.14134248616774170208.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
References: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 19 Oct 2023 13:44:19 +0300, Dmitry Baryshkov wrote:
> Currently there are two subdirs for DP debugfs files, e.g. DP-1, created
> by the drm core for the connector, and the msm_dp-DP-1, created by the
> DP driver itself. Merge those two, so that there are no extraneous
> connector-related subdirs.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: cleanup debugfs handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab8420418c2e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
