Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C176DCB80
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 21:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C5010E0D7;
	Mon, 10 Apr 2023 19:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C210510E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 19:25:22 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id x31so2154733ljq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 12:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681154720;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=oMLZlLsk1ZmBuhpTjnkgtNlwoW9RY3W1zOG3l2TynA0=;
 b=NQsdCq7Vc3vBXOHSG2Gd4Ecu1AFWfemrladBsEVaJFxDiRyS3vD4YPE2ayQkKhGyVi
 4LytdPMMCdaA5hUJf1o+Axu0RaD1HLuWqSgIWCdAMMCGbSv8uLe2421ZjgDk+S58uBAH
 rwPGIdjovXJz0qjgfN0zr7Psrt5S8NwG+M6Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681154720;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMLZlLsk1ZmBuhpTjnkgtNlwoW9RY3W1zOG3l2TynA0=;
 b=H0xgiYLC0WPiGqYyzNyOnbMTeSGFPvirailQKcuHDD65l6koS6sUa+tAruRO+k2Oon
 mMj/q1OOUswTJJCLrrDHhpIsWw5UKDlMGTH3nreoSoiE0kWBbYmuKlNTpJ3BYlfQOaes
 O/qk6iN+wPBxAWRx9tB8lzn6cJHASiMTOISFx1i3oNIYyhjJRWIoQ0kDXKfLweWvTJgg
 +Cmw86BdU9hsgLsOJpX8gi/bYksX/1x8gqvZ/JhETjGXe6wxoGunhr1igAmSTW9PoD/Y
 gp9kJFk+Xrzs1fDell1VDQaulT/mCwQY68IrQIedpMhcbRfMgGnTNiV9elOtesi1xwIa
 f1HA==
X-Gm-Message-State: AAQBX9dSf5MrGVuw3254BrpMd+vyKdwA6BLEWd6uVgrHGoDTZGtICkM9
 nZRjXpzks5kOyMNb63t5dTwA1IBwx7Ebar7aHsSq2A==
X-Google-Smtp-Source: AKy350aM7EnTjHmbJKpnZSSwSWV8UNF3S78abKV89jAc10QXM95eqRFSxU6PMpjTGWeMKs4+jQ5mVRRL9wTvlBjw5Tg=
X-Received: by 2002:a2e:a9a6:0:b0:2a7:6f6a:baf with SMTP id
 x38-20020a2ea9a6000000b002a76f6a0bafmr2522173ljq.0.1681154720194; Mon, 10 Apr
 2023 12:25:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Apr 2023 12:25:19 -0700
MIME-Version: 1.0
In-Reply-To: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
References: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 10 Apr 2023 12:25:19 -0700
Message-ID: <CAE-0n52St9X1EA=PUKYFM22Er3+o_2aYC8eAskHr4KtMoQVQsA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix sparse warnings in a6xx code
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-04-06 18:07:41)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 0bc3eb443fec..84d345af126f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -51,8 +51,8 @@ struct a6xx_gmu {
>
>         struct msm_gem_address_space *aspace;
>
> -       void * __iomem mmio;
> -       void * __iomem rscc;
> +       void __iomem * mmio;
> +       void __iomem * rscc;

Should stick that * to the member name.

	void __iomem *rscc;

with that

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
