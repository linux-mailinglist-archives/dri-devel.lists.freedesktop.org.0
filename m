Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005F5A037B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 23:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F075010E6DB;
	Wed, 24 Aug 2022 21:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CC110E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 21:53:56 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ca13so24789407ejb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=e0BBD5TlKOKblZMGz0uca2eTu4Q7+zmoU/TJNY6Fw4M=;
 b=kbg01HmT3sDmroGWqlHtDMn6Q1s0LnzIIPuPdtBFLvMNwsL0ULIs7afs/n/byMDq/J
 Fgd3oMzq7tnWcK71oLPxAFSc/DBJYZfeyQzjaztKzH9qCEqwfF7BPtnc17KjdxK1Arie
 rSaziN52MxfLVXBKGlzcX3z3PP1cuaYr7+3bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=e0BBD5TlKOKblZMGz0uca2eTu4Q7+zmoU/TJNY6Fw4M=;
 b=1OU0FkOoHIUtw1n0l1szzgPfr9QM8DXxfzBsd7YKQakVCOcx8AiTABSKWD+eldpDtz
 qhaFLBcrsTd3IA4TppTtpWlMKyE0mqO4eesaJMk77qNPsfeEG5sMP9nCJ4MECr/nacb2
 rGPlZIukhWEzr8qZ0AFRmPzzIThaa5x74pOJ1CVGWRijIe1R+XyOY/yZD7m1eeIA7SLc
 ZbqREehGkBMZkG1MKex9Cb4tlgGBc0T2rvPjJoV52cGM+yBqi737B8gRauzdoQFCcgkY
 PNzORtjx7UvWFbKTjbIYBuyg58+6E4J55W9TDv+J6DMjWW3lbVNJbKSg8+/t559B3TEp
 37QQ==
X-Gm-Message-State: ACgBeo2g+vpDY0nxx/ZhM4AHjOeeYVLi6mn2QXuvzN8cD+H6oOb5ub8l
 KLbKUNTEbLkMqdYdDr6wPtUMzzAoUNMoANNu
X-Google-Smtp-Source: AA6agR6gHihlH82fjvry1H4bPmrwccCzvYJz2GZFLWteymu2/1AL62UPXsGZ9qVWyxDE6NgDQqTFCg==
X-Received: by 2002:a17:907:7389:b0:73d:81b9:ed2 with SMTP id
 er9-20020a170907738900b0073d81b90ed2mr596869ejc.448.1661378035213; 
 Wed, 24 Aug 2022 14:53:55 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 fj15-20020a0564022b8f00b0044657ecfbb5sm3672239edb.13.2022.08.24.14.53.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 14:53:53 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id az27so2331933wrb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 14:53:53 -0700 (PDT)
X-Received: by 2002:a05:6000:507:b0:225:5019:803b with SMTP id
 a7-20020a056000050700b002255019803bmr564865wrf.617.1661378032767; Wed, 24 Aug
 2022 14:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Aug 2022 14:53:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWP1hgvpGN=62d585GOsT7+399N9DSbne_7XNwza00Uw@mail.gmail.com>
Message-ID: <CAD=FV=WWP1hgvpGN=62d585GOsT7+399N9DSbne_7XNwza00Uw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 24, 2022 at 1:16 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Changes in v2:
> -- fix Fixes tag's text
>
> Changes in v3:
> -- fix misspelling of "Reviewed-by"
>
> Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
