Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F434EE49D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 01:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D4D10E268;
	Thu, 31 Mar 2022 23:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7359210E07C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 23:22:18 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b24so1003938edu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i0Y8uJxAPTn+lPcbjKZMDigfiYGLfvVvyFJ8YmiOb0U=;
 b=ZTUl4ukv0e2NXaBF5xnMO9o+oFVlY2n2XoA0kUxOx6skIG9dTSaA7oECXPy4k5G/qR
 MtnM41dTUEMY98MWV1Q7y85uveZ3vNyBVCBdKuiNa70cypt1qBwokiaB5piPWsRGwfMf
 lQ3VnxZKPPbfZxfyG6Kj11Hei7OeO9IuoWwMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i0Y8uJxAPTn+lPcbjKZMDigfiYGLfvVvyFJ8YmiOb0U=;
 b=H+ZvDRzFH44FrSssFmjWjsKzJTfPJjRQvBEy9upXv6c306XnHNz+gyKDMam/stNWNc
 s8mmVDwz2gbgs5e+8WI9pixNC0aitY4GFLyLGuBomEgUtCPAvlrxJMWEtXUwGjDy7ylt
 nN+pxC4lQAjs76dzutLRjOI4Uyky0fAsww/rT8FbjKjM9RvGSe90F65xW8d1Y5asVLXJ
 48Wwx4+jvbe/M0CkLvyrG4LrSslhXpg7SjS2EcAJVSjP/oyDzjlQcuUKTWRl2u7tGB6w
 +3moTOxIkxj+Lqdt2MZo/LVPtWFIOsXZ3O4q9B5SG5fqzv0syRoKPLiBLL817TG0Qaqo
 KIAA==
X-Gm-Message-State: AOAM530wy5ipZSIe50jd/+1dW0ZoA4aNDrOFCyZN9lpyhvoB3Apdni1X
 A1d9GfNreALMl4uF52gvkP+V82YoB7N54uUw
X-Google-Smtp-Source: ABdhPJyyCKtpzI2aUyMcyjkHIr5/Nx3Q4JZtRTjoDt2RNO1cYvFVI+T2idPr5RS1jfiuYpTCzC4FMA==
X-Received: by 2002:a05:6402:5201:b0:419:4c82:8f11 with SMTP id
 s1-20020a056402520100b004194c828f11mr18294587edd.133.1648768936730; 
 Thu, 31 Mar 2022 16:22:16 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm319354ejc.99.2022.03.31.16.22.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:22:14 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id c7so1906304wrd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:22:14 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr5615220wrq.342.1648768934136; Thu, 31
 Mar 2022 16:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:22:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
Message-ID: <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>
>         dp_display->encoder = encoder;
>
> +       ret = dp_display_get_next_bridge(dp_display);
> +       if (ret)
> +               return ret;

It feels weird to me that this is in a function called "modeset_init",
though I certainly don't know the structure of the MSM display code
well enough to fully comment. My expectation would have been that
devm_of_dp_aux_populate_ep_devices() would have been called from your
probe routine and then you would have returned -EPROBE_DEFER from your
probe if you were unable to find the panel afterwards.

Huh, but I guess you _are_ getting called (indirectly) from
dpu_kms_hw_init() and I can't imagine AUX transfers working before
that function is called, so maybe I should just accept that it's
complicated and let those who understand this driver better confirm
that it's OK. ;-)


> @@ -140,5 +140,6 @@ struct dp_parser {
>   * can be parsed using this module.
>   */
>  struct dp_parser *dp_parser_get(struct platform_device *pdev);
> +int dp_parser_find_next_bridge(struct dp_parser *parser);

Everything else in this file is described w/ kerneldoc. Shouldn't your
function also have a kerneldoc comment?
