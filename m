Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84404DD1C1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E185110E8E0;
	Fri, 18 Mar 2022 00:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B6A10E8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:13:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id m12so8448261edc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J6L19eqyYX4dJCc3XEpRDxDO0mhCk2mFkPhjOK7UiSQ=;
 b=GeSJ4KYz58tHKZxX3/boqgrHRuZmFHBI9sOAa070OEI0Wapz8rONQwHrT4jv/9jeXJ
 QQPJq/kVqzlEtaKjMqsYMeNN9AxQ4VoP8L0j5g5eKR3oZfiEpAfpH72syE/k+v1kiPeG
 Q8ldjmLxpem6iXFiOdEji6Mp7d/vGptTgtNpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J6L19eqyYX4dJCc3XEpRDxDO0mhCk2mFkPhjOK7UiSQ=;
 b=ASnMDiPShelx8fs5+nSFH5S9cKjODV9Ib7MOcRTD3lxEuvurgn+rxCf5YrE0ni3AZU
 LGhAaRSTz567vXjG5bGc3ChjN+HocBvDV6v2M82/nGizAi6h2s6CM5LnEuX6WadnRjQ6
 /UqtdcST7352B6ETxvor8JYSGjiF+PzVLq8K7+0TDnY4N7EeG9VUmHCuh0PbWVjBqnqX
 ZkDaW15W8M56q6/1eeNqw3iZc3oX6EieE4BP5C93nSI45oenF/KxrnZz5z6OPwaR7K9W
 hkxxnapGq578KyuK2PMRipoNOPxoFaBCEt0vh+t3/T3XRXeBRPQT9pmFoAiaxsmEIqqc
 Z/zg==
X-Gm-Message-State: AOAM530xTZECvKqjFtxchV3empObN6r7iKf3EEFIoW/PlF9y7ityPY0n
 YVvBqQ4edKONG6VfYdNt7McUP0aQK2ZcpyaAX3A=
X-Google-Smtp-Source: ABdhPJxKKjXtuqdLLvePWFMpQyxYkYr9L4SZYtdoHXCjVr7HACcSIquxNLbm0qCGBQ5zHWy3/uzF/A==
X-Received: by 2002:aa7:ca01:0:b0:415:ece6:b0d9 with SMTP id
 y1-20020aa7ca01000000b00415ece6b0d9mr7048120eds.303.1647562398159; 
 Thu, 17 Mar 2022 17:13:18 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 i25-20020a50fd19000000b0041614eca4d1sm3400744eds.12.2022.03.17.17.13.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:13:18 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id j17so9725985wrc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:17 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr6072332wrc.513.1647562397219; Thu, 17
 Mar 2022 17:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:13:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAxdo9yjGS5d=W5s5OFo6BG6DyQr6WQxBv9r-vfU7D3Q@mail.gmail.com>
Message-ID: <CAD=FV=VAxdo9yjGS5d=W5s5OFo6BG6DyQr6WQxBv9r-vfU7D3Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] arm64: dts: qcom: sc7280: rename edp_out label to
 mdss_edp_out
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant <quic_kalyant@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 16, 2022 at 10:36 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Rename the edp_out label in the sc7280 platform to mdss_edp_out
> so that the nodes related to mdss are all grouped together in
> the board specific files.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v5:
>   - Change the order of patches
>   - Modify commit text
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
