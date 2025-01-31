Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6958A2403D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 17:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2E010E380;
	Fri, 31 Jan 2025 16:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sgj/Safg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30D10E380
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 16:24:29 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30613802a04so20314031fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738340668; x=1738945468; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
 b=Sgj/SafgWbRcqdRp6AS7GXIIwGUjIjcwQoy9F6zxp/3/hywjD6vCYW1R7fQrTy8DoW
 hA33DWB9RzJOpp8wtVpbUc/Dt2jS136BqI59p7OOYX2om0nHrjcKeWFLIhJPsBeHnDZX
 10x1nlI/jdRUZol6a+98G+2WMxQC+Xs9Bg+EwfuOn4kAV1ipfRicgwwZe9yq+pxkxsUC
 CjN5dTDNMczI9T7TQnlrnabFMAWkjJvk1m4sYSks3kRRmM0DX9Nxw/4d0QdLUMvNiUL5
 C82D+skdRJB4DHmMHITsV0c4TJ1bbyRk75Pox+RlmJ1YLGlAWDWLY+/cC7ol6wsXEBTt
 pAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738340668; x=1738945468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1OPRB6njxlUcUlHqiK6tXyv78044AchgI/F8gIyGgQ=;
 b=pGv//8IEF8tvXWOWnTHc1pVveV3eONJFAEmK/oCSF70rNzeXel2xU8PqTVpDX0UsE1
 d8KGRksoPoWi23J9Fc9uMHN7VWuL3/YkPFngJEQ1DuJZEL+dFzpTb6/D1FZAZyxALCkC
 akivhrrXcRxEgFEeKoVtgq9NP6wOe52dPAAU7Juh6McYhdXJGOZq40IxgTYTXO57C981
 lC9+RQUq1PIo1ZMaOHH9pMNSbc2gI4/GQwgfx0lxBud2uvWh7HKtP4DDptZY1eTIEaIa
 d3YqY/nCBmQB4N4FbiNCycl0XKNE5P36q5uwmMOokuaC1XgUIndx0rBG2AmUtVS7OTTk
 5Ntw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWExmhpKqpg6TVNx1oGhC7dZeVtvHVynGilxaEpVzbT5KOtGzq2HPZ0OVwEuGvjbrT/eAoXgDMLR6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXDBmY3FOJbxBmRwZ8LeQvXs3tsMiNfwAi2wcRJ8urQ6gyDhMa
 o126RZF/jthluoSO7JApPHKPZZFGBsCh3JC+3PL0QZFdBtTk9Dg9nITet7QX5Wo=
X-Gm-Gg: ASbGncu3oeND8GyMwv3RzvXw40bWwM+teNSSPAZEKpPyCDZHstE1ip3oz0YJRIpuvYk
 1xfvTAA/I/8eml41+Q8Jgccd8Lj3fyOVpvcdWRXd6PBuVrbMPlqGU0lAUvnRoySGi8woNm36UG1
 qLvPPHjQRerjPCw7B21+lNJ0jsO2y/si3QioaDwAnkbkTTC7LTVa8ejXCOgJosyxqWcJ3lSFhXn
 E7m3yDxqUnOU4jGonnnA86hmzsZFf3aZXInCDjMaZnYWzty53+yZSUs3FIz5pvmHHPg+0yneHS5
 xgq6JpAZa2snIcM+IX9rP+thg/KHTUnauZou8X0WHaeTuU2RTOmucNIkbhBtXAVeqAjqZPk=
X-Google-Smtp-Source: AGHT+IET6Ip7seInrKN40IUQ5plgR5Wbm/yFknTx/GqkNshb2c2sHr/YKBS3/IVjV6dDw1EBZWuIdA==
X-Received: by 2002:a05:651c:2214:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-307968fa2acmr43084751fa.32.1738340667875; 
 Fri, 31 Jan 2025 08:24:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a34282a5sm6090751fa.102.2025.01.31.08.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:24:26 -0800 (PST)
Date: Fri, 31 Jan 2025 18:24:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Message-ID: <gyslnttjsuav5dsbmglroujpwrqazokfnj65uhbegja3w27yxc@iamitbbg2e7e>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2025 at 04:02:49PM +0100, Krzysztof Kozlowski wrote:
> Calling these improvements, not fixes, because I don't think we ever hit
> actual concurrency issue.  Although if we ever hit it, it would be very
> tricky to debug and find the cause.

All of the patches miss Fixes: tags.  Could you please provide those.

> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
>       drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
>       drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 50 ++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 17 deletions(-)
> ---
> base-commit: 375ef7b3d85d8b0fa72092642582ca5b95a64e67
> change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry
