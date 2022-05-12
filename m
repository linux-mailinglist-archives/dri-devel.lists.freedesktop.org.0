Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0BA52414C
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 02:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100C510E74F;
	Thu, 12 May 2022 00:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66A910E791
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 00:02:37 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 z15-20020a9d65cf000000b00605f064482cso1571253oth.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 17:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=j1qyiWWc/ZcMZ2FZH7DVJCATZ7B7pTYmubNqnjOuM24=;
 b=kE6d/j8BCN5rbO1FcyurymCrlhWhcqgGf+VT5p9sG53nurd5HLHT4BV4+N8p0dHLke
 YzBkNh/pVk8OQNKM8FEMkLqvXRSqrVDmeiXgN+F8TA0yvYsEHd6TQ04nCn0B3xCg05WC
 HlBoHOwmVOA5rU/Crk5bnEUPUuzTknAg9nBiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=j1qyiWWc/ZcMZ2FZH7DVJCATZ7B7pTYmubNqnjOuM24=;
 b=PHLVVbaKkDtBZAkAhdvEQDqFKDbjWZWvap5kGpQujmhu532y2Y7GpwllIdJpHW1Tat
 723toGWMPMd5gIc8XtsjRZpyhVWmhDrElx/nmwASCQKHyFkPuREOq/XQKVf/eqvQJNez
 mEuXkwE0Y1aubh1CwJ0dfpDQEgbOt7F1i09AWFGN6cJacQSOZ2QajZ5G1W5dZm2/7ZNF
 ymuRXMi+hQ8pW4SFGvLzkrN1Zv44n0MioBHEco7r6h4pubuVNUbheBJ8hnxDAtqz6zXS
 ozx0KZqdnIjqF0WF7IswoNs2JleAOVtYATFf4Jv5o9s5GK4QH4uyRLb4UX7yC2sxOWiR
 UeMw==
X-Gm-Message-State: AOAM533SC4zuFk9Xh1Qeo6EpuMAcsyuTWACWrZ+TgutP8yOBLSYtCgUh
 119h6mVAWyNxHstR1d56j5wxztTZQWMgs4YOHYcTRw==
X-Google-Smtp-Source: ABdhPJzhIap2jPse6o+R+wgLrc8xRp1X48y3KB07+7qJgfflkLe85OdZ/njzLrDPNjlZ/HaPZU9Pus9j1oV3TMksJCo=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr5629866otl.77.1652313756970; Wed, 11
 May 2022 17:02:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 17:02:36 -0700
MIME-Version: 1.0
In-Reply-To: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
References: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 17:02:36 -0700
Message-ID: <CAE-0n53SDYFiSGkcUW=DbmGOZe3oz9AjSATtcmbKqKh3=Pn9jw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported
 rotations
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
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
Cc: quic_kalyant@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-05-11 15:27:10)
> DRM_MODE_ROTATE_180 was previously marked as supported even
> for devices not supporting inline rotation.
>
> This is true because the SSPPs can always flip the image.
>
> After inline rotation support changes, this bit was removed
> and kms_rotation_crc IGT test starts skipping now whereas
> it was previously passing.
>
> Restore DRM_MODE_ROTATE_180 bit to the supported rotations
> list.
>
> Fixes: dabfdd89eaa92 ("add inline rotation support for sc7280")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
