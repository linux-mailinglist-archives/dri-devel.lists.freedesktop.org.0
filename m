Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8717872144E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9991D10E208;
	Sun,  4 Jun 2023 03:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C30610E12F
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f3a9ad31dbso4626419e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847707; x=1688439707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vqZu2+86qpa6J8c7UM7f5JxWOqtwBHGUvC7S2Jahgg=;
 b=wE1Eof7zF8xvSTaAmXBiCImMSapv9vqPAUp/CxkJoJ5W8/eIDT2+EDFP6oB9Ej6TZz
 NBWHFEKTZdh2Vy9XiQyED5G6qwqPWIlXIauRN1MRjdLfAzu6Fsa+thLDspwcx+UNHQhm
 +nypntpxt3rC9qU8CtOVgLs2+WhjrBPwfikdpRCFWJ/azuQkPgeSeyu78ywZogpdiDCQ
 p3Y7O+qtuwwX0Z1OiVzdBaJd9kmvg3maXiqpLX/FYRvR6dOYJ7NBzyAhgatxzgWQEj2Y
 e4CE70kNkGDR3FqieS2IpetyjxLR9bf40IaNs2oCCYNLHk57yXnvv73bA9+ao2oO70ce
 xEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847707; x=1688439707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vqZu2+86qpa6J8c7UM7f5JxWOqtwBHGUvC7S2Jahgg=;
 b=W4qUlRMHsxWVUTVF8Q0ygTkt0Pp/4Iqya5e/jEy+UxCeYGAqyA6jhi7P5w1jQV5hde
 Z+6hEh0MU9uYdTw1/hDIz8wekTvFL4sONRdjJ1QRIYk3dA+Jiz6t59q5Zpgi4NQga/y7
 lfHPRDNXkd2s35jlSM52eCfY0SdrwExjY5aMZJLEUlyApOaaKz9vKRLB9Kn9sA2WmZOV
 ltuxfA5LYgwVcNOJ3WJ9v92BCuZ4IhyuubAN+m3sdPyzSyLPco4vDALPGxFLUMUKFzqa
 ADjs2b3xGjxF9HLAWOaGd91vZ2p8oKRfe/1j05BQpAHj8M/52oiMxMso4cHqX8WefzIV
 n3eA==
X-Gm-Message-State: AC+VfDwiRf3mguW5taHftl6da9xjd6QbmbJmAAk8blwzFH+ossqPxmM5
 uPt2IRaKlMG5uHH2RPZ81Z8b+A==
X-Google-Smtp-Source: ACHHUZ5QqEPp8PdFbvNEcYJYgWNC3qc6Y4rgEoQ9eHDJtqkpog+9yv6rCX+GH0t1E7CVkNOHqnJI5Q==
X-Received: by 2002:ac2:491e:0:b0:4eb:1527:e2a7 with SMTP id
 n30-20020ac2491e000000b004eb1527e2a7mr3228957lfi.45.1685847706977; 
 Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: Drop now unused dp_hpd module
Date: Sun,  4 Jun 2023 06:01:35 +0300
Message-Id: <168584750426.890410.4013288321469753930.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515030256.300104-1-quic_bjorande@quicinc.com>
References: <20230515030256.300104-1-quic_bjorande@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 14 May 2023 20:02:54 -0700, Bjorn Andersson wrote:
> The dp_hpd module is a remnant from the downstream design and is now
> completely unused. Drop it and all references to it.
> 
> 

Applied, thanks!

[2/3] drm/msm/dp: Clean up logs dp_power module
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9f93258549db
[3/3] drm/msm/dp: Clean up pdev/dev duplication in dp_power
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9edac2eec47c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
