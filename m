Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF14B7CF6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD9C10E5ED;
	Wed, 16 Feb 2022 01:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EA410E5ED
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:57:22 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so836523oob.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=yf7K0uG0GDfWyq/No5Sw4cB3nhUdbA5wJESpoT/OmDo=;
 b=XG3bMqg+15oGPBOvIW+H08FKDWnUCCndmCg/ckMoT3QhbZK4foOtLBnqnRGbtAak0h
 uLwV2vVu9waUtgPXuo2Xp0ur4QFbhaMu5uGo9nlT55ySvaX0iix70v5J7E4Ot6/aO6qI
 D8MwGf2+55KDBOy0k8fc3GZGSy9Y6NGS6BFao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=yf7K0uG0GDfWyq/No5Sw4cB3nhUdbA5wJESpoT/OmDo=;
 b=xi/wmkM7GLiyMSg9N4d701xCutZmsVIICyzs0CPKJS+fUgMlS41JDO0UdrJa4WlmXV
 /0YwagIPDk4VFQ83D3eDs9vjKMXgExOuqMeRA0LnJkxqb9SVJI3P6xWh8whIv373BP5g
 W/LSau7kSw0diheoVwI53dy6/VGbXH65unn3PHGIpw9+4ln2A/P2kQh3JX/FseRV317e
 gLF1svpx8W2YPwFZM2/CTnuaW0WKxjfz9AdxAZ/m1m9dWe5gYoD70ySSgUTqBhStHAsr
 qkxW7iPkefZXtO2AGa2tnIsUht3whFqORjUEmyOyS9dJnVGGmu8416YTBiyxkakSMgoy
 wNOg==
X-Gm-Message-State: AOAM530b73qgHjSt2nhFG/vkYTyFesMQskUQwdxq/pqO9gNJdMSNjtSG
 PrNOVY+M0kX7h9aBMeRQReG50ZPUJS6uqXYdfzp83A==
X-Google-Smtp-Source: ABdhPJzxTL1aErorPNW6lKasnfASBJkXb0+zszIc2QCakyQmG7qkoIxuFZLAI+15rKnfF+/PiyZKCXL+k67kvlOM4o8=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr277746oap.54.1644976641436; Tue, 15 Feb
 2022 17:57:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:57:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:57:21 -0800
Message-ID: <CAE-0n53kJqudjzbHumrOMzXgK_2m8AdFohE645keYgD=HEyHOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/msm/dpu: remove msm_dp cached in
 dpu_encoder_virt
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:38)
> Stop caching msm_dp instance in dpu_encoder_virt since it's not used
> now.
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
