Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10C721451
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709BC10E260;
	Sun,  4 Jun 2023 03:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D69810E18E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:50 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3ba703b67so4430516e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847708; x=1688439708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QtZdx8VPfoD43LcN321S8R1aRuJCVhuM31iNj9CzZBg=;
 b=gs9KsUkjmXF9Nkkokk4HdPi6t8M26KY8Y+CWPUb5euQdK6RllukgoprfdEUYbvdCMy
 U5Yzm8RHiMNVbaUwpKxQXx4YRBUvhYEZliT4xVfE4cSiQMZaGZU7Q5Xu/km6qROWYVkQ
 +JRB8PSxQ+YXXkTQ6/7G7c/KyLxblkqb7D0ePuJTf7MwbnHdzGwFixReqHpiTsfPtwTm
 +RL7ajisHfdEXg2GkkQm6Ty+ArDaV2+e0sB/q2/HYHY7lfI8NFjT/T1cS2sxC+S8Q+Es
 JVSp/nRGNEfl2k4R+sQjOpCrkzfdvIO+ves7JxCIfjTwq6pgByPV0xESjU7sQJCcggUb
 UILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847708; x=1688439708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QtZdx8VPfoD43LcN321S8R1aRuJCVhuM31iNj9CzZBg=;
 b=MsSbe9BHMAnLEaV3bArzLijavSH7R38xIM7GUL6vanVXYSQEI+lVUET7lwDVCR0zU4
 7g94aqdzinAHnXBAtMBj9FR2e2o9pAgi7alEpyOGqknQwBLwVXlqIhPJ9Bu8SXpAyb2R
 7QLepYWffSuLhN3enp2WqqpqPkjZBWfCsxC13ZzRUy5QHxG885OSnDtFm4PImxZQkc+V
 /F4Unj9fygj7J9uJG5BRo48JqfwgnzE5w97dY3LOBfDR5BkzCjBoPLh/nvHsHExMAPEJ
 L2xVM9M4R/CY07TTiDi+yfcTHtye/WPsFwzAgl9LyGMQ2Zd/uv0tc2AEuM0+ZUi0BBsL
 e9iw==
X-Gm-Message-State: AC+VfDxvF3NPkBVib35aNQcGOb2xJjU8waXrYqkagmdyhShNarEQjmmP
 xgmKW/zasaaCiEDkuEYkylgPCSLJk5XvC6f+66g=
X-Google-Smtp-Source: ACHHUZ7DiqTKdDpgxC6h5ke18d9gZSPA85LosaMquHyK46GcZQQFpzWj+2anUhv629EUWNFZalOePg==
X-Received: by 2002:ac2:531c:0:b0:4dd:ce0b:7692 with SMTP id
 c28-20020ac2531c000000b004ddce0b7692mr3398444lfh.46.1685847708607; 
 Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] drm/msm: Remove unnecessary (void*) conversions
Date: Sun,  4 Jun 2023 06:01:37 +0300
Message-Id: <168584750428.890410.17475920431206937962.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522013213.25876-1-suhui@nfschina.com>
References: <20230522013213.25876-1-suhui@nfschina.com>
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 22 May 2023 09:32:13 +0800, Su Hui wrote:
> Pointer variables of (void*) type do not require type cast.
> 
> 

Applied, thanks!

[1/1] drm/msm: Remove unnecessary (void*) conversions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eea9cf72b718

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
