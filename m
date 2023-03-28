Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D956CCD64
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 00:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5498A10E9DF;
	Tue, 28 Mar 2023 22:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B6A10E496
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:06 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id c29so17792212lfv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zCOYrUpTdIxhDlpcMXELt7+2xWD7OjZuaR8tKINgR8=;
 b=RDhFHGCslj8gOoK8MCER9prpFCD3ZQSxZMp/oLUIQplkptA4f19xKGXghbYQ68Zl3a
 bHhlualsHGYJdf55TbPE6JaNVB6iDsPSh7U8DCLhHOs0j9IyauaEA3NaUR0V+M+73U7+
 IrE4wYH3yY/g+vfwfBVZ8eadGVOGMo6h04st5+lbHnoZTfj5gBfr9uB1XJ7/CJ3RKc93
 8s1c+Y07FpPYVAwnGsTgEhYQVnGjyV5EGYUeQS809RW5MEoFxRP3foYoaIPycLDOY4TX
 4Vy7omzd9LLDHLRquFa7dgbMiqmLoKS/t9BX3yLzG85sO6x83IupFRwfahwE8qhdX5sy
 +5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zCOYrUpTdIxhDlpcMXELt7+2xWD7OjZuaR8tKINgR8=;
 b=fuF8t1Kbfoku9mWOlwz6mWB3o1FFA1ieLUjNR87xChV5tO+9CXm3syiMfaOBMQMdaO
 KsN3Mehm5ZuXr05dYRsMamJ7QeK5v7G5fBDTCLn2zt2963ebpXAma20O8Z0j+pPV4OZw
 NqbzwZNGG15rA6AF2GmT+YD/e2vxP7ChGhmZFuCKziUFGqJEDhE8bop+QbC7RaPoiYMI
 huXBort+XO5kFrcr3VrnAIyqaaX/IT4XeZ3+jOv4efj+tAUS62tTFRwLfLpFPUpDlYMx
 RPSPjQtYGCX8o8FowSVgvtgqvGio7m8zf7mOP40tZPBrOaAO9y2quaqv0IkbvcHL+2Zm
 wnfw==
X-Gm-Message-State: AAQBX9eLm9rOslfD2nQx+o93XhKBCoR3gcsg7R0tfzOBgcam0VszjMq1
 5nHaFvYdQAA+4t8lU5hO/v4ljA==
X-Google-Smtp-Source: AKy350Yni7yE8EMNjcQgNBhUoFPCJ9CFPDV7t7eP3GuMk/5HRg8DbkzB8vdZFxmKhLP1H7PbaxGlNw==
X-Received: by 2002:a05:6512:950:b0:4db:28ce:e600 with SMTP id
 u16-20020a056512095000b004db28cee600mr3829031lft.1.1680043084695; 
 Tue, 28 Mar 2023 15:38:04 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/3] drm/msm/mdss: rework UBWC setup
Date: Wed, 29 Mar 2023 01:37:48 +0300
Message-Id: <168004305307.1061932.15557156588157558501.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
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


On Wed, 18 Jan 2023 03:04:25 +0200, Dmitry Baryshkov wrote:
> The commit 92bab9142456 ("drm/msm: less magic numbers in
> msm_mdss_enable") reworked the static UBWC setup to replace magic
> numbers with calulating written values from the SoC/device parameters.
> This simplified adding new platforms.
> However I did not estimate that the values would still be cryptic and
> would be C&P-sted instead of being determined from the vendor DT. Some
> of the platform (sc8180x) completely missed this setup step.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/mdss: convert UBWC setup to use match data
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4abcfab7667
[2/3] drm/msm/mdss: add data for sc8180xp
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2c3415835aaf
[3/3] drm/msm/mdss: add the sdm845 data for completeness
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4b411abf95f9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
