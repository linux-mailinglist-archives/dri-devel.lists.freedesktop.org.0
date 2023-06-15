Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07D7316AE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D616F10E4DC;
	Thu, 15 Jun 2023 11:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8327410E4CE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1acd41ad2so25734591fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828691; x=1689420691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+R28EYMi3DlJmTBU7U1geaSX05Z1OjPxPWagMOu3k88=;
 b=TE1/Xp39sVTPGA1LLhCwGizAzjrW93eQzCiuBneFqQvMKNu5G1jQtEeluJMahEk71O
 gZdlWKafsKY4CX6/a4mZTx2qGDDS1T0ffl/eD3SM0E/sso2nhDRFnrY3R1Pym80o3wyQ
 RD6PYBUHIq5AIXPsFRS9QAwcxz7mrNevjrlLTkGqteFu6xI8hWgBmTG5ul+U7ZctLxmP
 5tQTE0KbhB4OPLmF4duSsLfveaGx7Dm53YpN+DnswzDKaA/lICJEiuz771xwuwrw9olp
 jE3UbraVGbKHZTAc2XYuWu7WRJ0POVtydVPhmMWu/IX9GMbMQlqZifldCOr/0tJbPPxO
 nuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828691; x=1689420691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+R28EYMi3DlJmTBU7U1geaSX05Z1OjPxPWagMOu3k88=;
 b=c8AIp1Z2K3BEyvZETNBwnnFi/cJq8iCfN4i+ZwtTe5eRCehDeXg/VIUBmwviw67QqH
 JBdFrZDfXzs4pXwRAfi8JvtCAbFJLiWO1BWI5lntdlc9vPRXEh42V78yghjOMXLuXxYV
 uSZDwTeavGvfdW9vAnUKyUZ+ENo7YsY8gSsp4SqQ4fBn2x9+92NBFW11xCSUQukZethx
 rUcVLPICLuz0cyIFvJHyThp/apXgW+HuP7CLzTXW5E/urtpS5ULWv+LGCLrf5bVkcrz2
 wy3/FH9+de15BEy+I+pgHF7xTHjn0QJ+3FA4l4/ZElZseY+FdbrXCSogX6fSTofVTu8o
 ItNg==
X-Gm-Message-State: AC+VfDysV0bzZk55HNKIdkH2SyFN2HqkdgWVHgMFAItTCxfrJhTxZB+B
 Mvn/fPsTFeyTdG3z9mJScmjGHw==
X-Google-Smtp-Source: ACHHUZ4SWQ0MBhu3MEQ55/IpB7XEmUn0DFpajcifAL+IgjEtUcqUI1UprpO7jJFGAxBjf69hp5OpxA==
X-Received: by 2002:a2e:a316:0:b0:2b4:48dc:4fad with SMTP id
 l22-20020a2ea316000000b002b448dc4fadmr668100lje.5.1686828691621; 
 Thu, 15 Jun 2023 04:31:31 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
Date: Thu, 15 Jun 2023 14:31:21 +0300
Message-Id: <168682860389.384026.3598956001805387481.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
References: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
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


On Mon, 12 Jun 2023 21:25:27 +0300, Dmitry Baryshkov wrote:
> Change adreno_is_a690() prototype to accept the const struct adreno_gpu
> pointer instead of a non-const one. This fixes the following warning:
> 
> In file included from drivers/gpu/drm/msm/msm_drv.c:33:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function ‘adreno_is_a660_family’:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument 1 of ‘adreno_is_a690’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>   303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
> 
> [...]

Applied, thanks!

[1/1] drm/msm/adreno: make adreno_is_a690()'s argument const
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b263325b4f34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
