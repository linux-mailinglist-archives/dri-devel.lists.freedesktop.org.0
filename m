Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDEE67D502
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 20:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C340E10E97C;
	Thu, 26 Jan 2023 19:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB410E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:14 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kt14so7734213ejc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=haOnI3OyAVqXfwcS0HsyNm7Pe8+rJTYpA3/fsai6Diw=;
 b=aI7jAiKvQ2uiMRXBktX5P60QW7MNpnP9w/47NK1tihCPPjwtlG1F/bXRYEivNUABBg
 /2R6si2WqHTq5yzxL7f89W8KST4CNxXx5aCy+vinMVhXfJ723jMENXqWtjI7UIOCn//9
 34wxXW++4t5URbdJMTmG+teefrnZ/C3CmwTecM0quQPAW3+nQoA829WwYyFpYEQvBoEV
 uv6f89WRq6yzkNIhi5uQ4vtVwSUNy4aGyF0Cv8gxNUEk+NBOE5biCvRTY1HqaN4JUHsb
 1r/EG/VgdikfR8TDwKLn8AikTt1be+WeBYKJVRMyE1JEpiER/0qqovaVza6iMqEDkeF8
 K7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=haOnI3OyAVqXfwcS0HsyNm7Pe8+rJTYpA3/fsai6Diw=;
 b=jYkfCbcBA9LCI19yGd8C48YvI4lTrWCnBCgpW1lIqoBtiBa5c3hV8Xz1FZIp0xqkMB
 0v7aMqkFtZA9fHPnXUVIpiLYVzWGno+UKG4EpsljoyXSsmEyqyDEXudq2cRDJ8WwrRVy
 dBMn6n2XQ9aM0GdmL64ESLDIZlMiHSZtn7FO6WvM8hNDeGSmBVUZxixQ/T+KioGyYY8O
 RK1ClhlNGorD8gaCjrTAQwjQ8X7da1WwS17qO6LXctEPFdsSYRktqqrzvRWBRJ6oqow9
 kO7oC7O0wazCdd4mCgTskt711vP5Ut2OBWdNOJGF/5cVpQkaLwP1J/fZhCgy+nP9nrZs
 pwpQ==
X-Gm-Message-State: AFqh2kp9NchCb9BeMOZ4KSxXxuAws3zK592R2sPqDd87kUgAN0N5eaQU
 0Q3E/mFk+QaAUfajgI7XWovOCA==
X-Google-Smtp-Source: AMrXdXu5CVFfASZu8ctXxRH6VwmF+e/MdAT3e6eNsfvzFgivlmcUSImZ1P51B+8TllRh8ESXOCNjkQ==
X-Received: by 2002:a17:907:6746:b0:871:b898:92fd with SMTP id
 qm6-20020a170907674600b00871b89892fdmr44030118ejc.6.1674759673839; 
 Thu, 26 Jan 2023 11:01:13 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: fix sm8450 CTL configuration
Date: Thu, 26 Jan 2023 21:00:57 +0200
Message-Id: <167475959091.3954305.14689973526637366778.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
References: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 23 Jan 2023 10:08:18 +0200, Dmitry Baryshkov wrote:
> Correct the CTL size on sm8450 platform. This fixes the incorrect merge
> of sm8350 support, which unfortunately also touched the SM8450 setup.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: fix sm8450 CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6c021d77e788

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
