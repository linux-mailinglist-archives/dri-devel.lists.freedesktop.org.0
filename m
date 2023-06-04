Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7A721445
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B09610E0E8;
	Sun,  4 Jun 2023 03:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA5E10E0D7
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:45 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4bdcde899so4439053e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847702; x=1688439702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOhs/tS1z2KZqjSiRBgaVj6mrShh0pQk1Td6JEJ93d8=;
 b=DYUVb/FPnmCn5BudxjU2PrMMrcUxNwdQO0JgFLwbXz/d8+BbFM3tDX4igYIZ1lAXOi
 o02H6Om9llDzfCLuEe+b6QaXBLLpVr7oEauSlZkrSqsceQIEDLda57b7NdpEoGyS4m6T
 elwDItQZFXUb5YDL8+vwI6FZD5Qc6o033tJenpgUrxFRJjF1MKZyRXD3niIlhhAnsITR
 fPrwPQnolNPSz6qQAdX/ROkM6fl7J6/S+d+UoM07B3aQAuXUZdJJaiJ/hcH3Ot0vXpJ5
 xM1hHLyG5qK8tmfDCNKfkK6Y2J83ZdZApJnzYuBsQx5QQfs0UdNt9hsMaG7cKfpFBsYF
 lGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847702; x=1688439702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOhs/tS1z2KZqjSiRBgaVj6mrShh0pQk1Td6JEJ93d8=;
 b=b2sgA92zd6Z9rwuqCz2m7AkmTe6wvBhpbQZKmLasu20Q09GOcy+hS1j509evYnzs6Z
 lDsR+EKOfTEk3gEn5FgEPqKtEVN/kbT1WCrh243+pEANVaoSHwBf0M+RdowgPb6capGu
 Jku4C8shJL26L31YvtjxLM27RFPe6Se4Cnse3BDD3o5Gs20WzXTx7gvZ+XDN1xB6EoZ8
 b5wunc5eUaoXMcNMPr7aKOofz6sbSsagWewxVo7V8q4SCM1cx7Z87kNf2YaFa2fribO4
 TX6aM8hrtBLwHUyGufndw6DN19/oJKZDZtyveIh8GQ0Q+HfanHgKGmJqVvGwsQU27coy
 chQw==
X-Gm-Message-State: AC+VfDwc1nCXJXwiXTW8Br3dDMavXsnFulBig6oWJYw7rZFqQsCWjiXV
 njVCHMY8KVYx3nU9uodAsiSjww==
X-Google-Smtp-Source: ACHHUZ6IrLL+2bXjdukj4F3KjJLmrz/q4vPDuE2sfcdPIw79Y1yE/TxkzF+its+HLg9OV4mCFwz1Ug==
X-Received: by 2002:a05:6512:98b:b0:4f5:a17f:4897 with SMTP id
 w11-20020a056512098b00b004f5a17f4897mr3669531lft.43.1685847702602; 
 Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dp: remove most of usbpd-related remains
Date: Sun,  4 Jun 2023 06:01:30 +0300
Message-Id: <168584750426.890410.9360297124272055235.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520182050.4014143-1-dmitry.baryshkov@linaro.org>
References: <20230520182050.4014143-1-dmitry.baryshkov@linaro.org>
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


On Sat, 20 May 2023 21:20:50 +0300, Dmitry Baryshkov wrote:
> Remove most of remains of downstream usbpd code. Mainline kernel uses
> different approach for managing Type-C / USB-PD, so this remains unused.
> 
> 

Applied, thanks!

[1/1] drm/msm/dp: remove most of usbpd-related remains
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1c5f6051ffdf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
