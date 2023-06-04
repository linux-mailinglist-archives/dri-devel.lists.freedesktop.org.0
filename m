Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D147B721442
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADD810E0F8;
	Sun,  4 Jun 2023 03:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B837C10E0AB
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1b084620dso25794311fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847702; x=1688439702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1X6WEtQyiptIxtD54x3vfD3H70MCzerg/dy1fYVu8V0=;
 b=I/bB6RI39dRZrNc0/syXk32ThguDXoaXxCVsK6v8y6j0rEIShYjXS3HfdFRZazE9a9
 GheCNYRJjUnk5MOrXft1xN9AXnad1F4UBsaXZVtGZ5xgflYGvhDfhbI9X3wTbhl04Ka6
 8fKRvUC6gMeku0QetszYivPveiFvE9+uB5iRNtMbWN6IJh0ID1txHI/aa/N2yfAzdBVp
 Dak2jztwv1VHOQNPisGIeX5VgXPk7l3pcRC+ObflAAInTWIf8D+CqZbrbO59OlBkRzK/
 mKukOMgDPl5TkrJlXAcSNA5CtZySE4HDSYzyaD69KvsN99we2Iqd/9AC2iTHygwS4tSX
 Cf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847702; x=1688439702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1X6WEtQyiptIxtD54x3vfD3H70MCzerg/dy1fYVu8V0=;
 b=cctrpeV937XmKwIuUTJqGl95pvGjEMtBL06umZSackmxwo8fU6sPxWd4wrS6UXR7gr
 Nu0+ig8OMLUWbIvptJUGSVz+1CMT3ETVfyMuG6mEmOfa6cxNnN/GOQDDFgnFIwdAFxBh
 dhBXkfPFERRzUHWFpbP4O4QRWTk9w0uGLEbOt41fRzkRCVkcWd7pWkx2SZZRB2CvHEsw
 1qBW0lz24juHtrOQyhdlH2Fet7t/w94p0DzuOMIlGAaKVfdyhsUO1mVVUa8VadsjNyYR
 NfeBX8rQ51N6tTrZw+7CaPwa1/chGkTXNJ18I8V4Y9Z6rzW91mpPRjH5IHBw70oLIN/U
 dUcQ==
X-Gm-Message-State: AC+VfDyWXf6kHD8tR9tQWuYbqNCAN9X/pikpd37JuvgxdGQAqe0kSB6K
 1Qbq8cc68upKSoAJ21o97u7xZA==
X-Google-Smtp-Source: ACHHUZ7asWJzyIiTNQO6ArOVaTdqSH/P/V4O1sVnyoBURumJ6VpsuYlpXql7+1bSFkxOwUacFcMOhg==
X-Received: by 2002:a2e:9f4f:0:b0:299:a7be:5775 with SMTP id
 v15-20020a2e9f4f000000b00299a7be5775mr2131524ljk.35.1685847701800; 
 Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop
 dpu_encoder_phys_ops::late_register()
Date: Sun,  4 Jun 2023 06:01:29 +0300
Message-Id: <168584750429.890410.14758172280740009870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 21 May 2023 22:22:28 +0300, Dmitry Baryshkov wrote:
> This callback has been unused since the driver being added. Drop it now.
> 
> 

Applied, thanks!

[1/3] drm/msm/dpu: drop dpu_encoder_phys_ops::late_register()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/95666ca7431c
[2/3] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a659098d78d6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
