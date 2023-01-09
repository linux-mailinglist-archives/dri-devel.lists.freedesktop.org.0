Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6296635AB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5BC10E52B;
	Mon,  9 Jan 2023 23:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9842510E51E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:09 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id bx6so10696931ljb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kpASIlrn94h2kw47h1c03X9cqh5FWCX9FeHma7sBwdI=;
 b=v1wrZ2vN/XnH/5e/agAJ16tPNvEY3v5UQpgH5Myp1qx1T/tvSz7m8P7mZNZ7lXLfD0
 EpkGbcICZQkZsQ6g2RTtvYTPrKYaaMjD0x5LUliXvpSwXhtSdyg7YRUoet1/smn7hSa6
 yIkwgYhdC7QLiBvK3GMYHo6ArZe+pS697mGl7ohBaNWtoV8YakjJ93ISDemTmu29Q6rM
 tvMdADfb4ZOj3ollbJaPYObgJJxTeRuBWzqkCzZoAM8w+ZYM63Q4Dqa0nMNclVJ3OErA
 lpNOCuMww4d2efN+xd+3Dx3ZyAcMF41gNNIUkM4m0/dF/L3yjRiNwgQhCtFmvbfSCTqK
 DS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpASIlrn94h2kw47h1c03X9cqh5FWCX9FeHma7sBwdI=;
 b=XRjGPCdnmSWnR13DP4ImbyjqL1xy3pFCNsk3P8Z+I8RMKknBIhosyVBMaBg235FF3J
 fB+Y7y1JJq4lBj6D1nDs6o5B4DbD442P/8T1mXErV8dUq/4X/CvHbhqqhYX5UIPJByYp
 SpQNY5SradXRcMZSpu5GoVe/Gi0/NCwLCSC9uUuT2u1iUpjvzUKGH9eUXXejR4Uuynrx
 Qu7hJLHH6XpFefdHXQ52+BsU494qJ1Aq92oFvtdxRppayxa9NIkBvV5MnN5hhgqfVp68
 gz7ZybRvWd+bMI/D7w94K21TLhEg6blJ3MMB58F7DX9tSf0nPXX7MG0QlzrrAa2mSZDH
 yNRA==
X-Gm-Message-State: AFqh2kpaLrGQAzjz1rZG4PvyRoTinRer6Hy6hIJh4bHsD5t9JsJqm3o3
 TYh5qe4fF7R5iAXY1c+brubScQ==
X-Google-Smtp-Source: AMrXdXuTSirBkKKX9cOHfeyvPTZYP1igXatg4QzFNBd3JOOm6VJi6sJ8f6PwONdphEmyG1wXADgO1g==
X-Received: by 2002:a2e:2c0d:0:b0:281:bb75:1863 with SMTP id
 s13-20020a2e2c0d000000b00281bb751863mr3348094ljs.0.1673307847937; 
 Mon, 09 Jan 2023 15:44:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: phone-devel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] drm/msm/dpu: Print interrupt index in addition to the mask
Date: Tue, 10 Jan 2023 01:43:52 +0200
Message-Id: <167330408782.609993.3753799611578677856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221121222456.437815-1-marijn.suijten@somainline.org>
References: <20221121222456.437815-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 21 Nov 2022 23:24:55 +0100, Marijn Suijten wrote:
> The mask only describes the `irq_idx % 32` part, making it generally
> impossible to deduce what interrupt is being enabled/disabled.  Since
> `debug/core_irq` in debugfs (and other prints) also include the full
> `DPU_IRQ_IDX()` value, print the same full value here for easier
> correlation instead of only adding the `irq_idx / 32` part.
> 
> Furthermore, make the dbgstr messages more consistent.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Print interrupt index in addition to the mask
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d45e5744ab39

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
