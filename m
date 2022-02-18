Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1902C4BAEF8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D412810E995;
	Fri, 18 Feb 2022 01:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAF810E995
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:03:37 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qx21so11176249ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 17:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhNqz0TwV7gSLYgP9YWbRspB12calUNnn7qInjIWMb8=;
 b=kjaQXcd+qDo6HeXDPEWhbFh7itNDJeBgJ0jJRODQBOZ7hs979pzm2WflsUaeHt87yP
 QfxDMnIRoaJ7eDkvmb/yckwyk9YSdc1FaxiFI9ozai/ESqHRWGC3j6y8tn1v5Pwbp/xi
 y+HpVyyGh9scpSCcn61WSMOXHDjMnjoadxSfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhNqz0TwV7gSLYgP9YWbRspB12calUNnn7qInjIWMb8=;
 b=nvx0ognlnjvFQBaKHeud6JX32vIezn4RDoXEQFMYR0CK5y+0vMUIB1tWmqYmsoILhN
 5rhzG3sAWDfPFbcWXKj4OEc1+Rg6rckSUJKIWtHMrRmV68DZealwpt36CkpnjzeEsqWi
 oRmZw5d2EkPmQeY/m7es+fFGVL0Yt3yxZcDWCyjka04b9FJyXOKmJ7G5jT4xBoIA26vb
 i7DXCuP+HNqfic2qN3Y8tgpd5ZHCWfVwZ1CaHSHKuUG31fFSuK6sl2shpqzkRl9gYnMb
 ezYywSxlOW7JCxAZeogfYAQ4ccd1I6a1bRiOUuVG8ABjQ19KUbqpy4oUUbViJUgWZkLx
 CQfA==
X-Gm-Message-State: AOAM530Ebmj5l9oCXeMUc+Q3OwJ0YJQk/yYkQrIiO3fTF9mmQHZXxD98
 O2hgsMgzT2/cL3zvpBMPKdU07A8EbNvuOJCdSXk=
X-Google-Smtp-Source: ABdhPJz9wvz6REZ+MTJvQQfKBoL3LX2xppwStnyGnp/SZKXxJkzy4+6PCkfm4lfzCOogQ+in2vDnJA==
X-Received: by 2002:a17:906:9f21:b0:6b6:1f07:fb86 with SMTP id
 fy33-20020a1709069f2100b006b61f07fb86mr4444066ejc.495.1645146216134; 
 Thu, 17 Feb 2022 17:03:36 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id i1sm1709952ejy.138.2022.02.17.17.03.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 17:03:34 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id u1so11810561wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 17:03:34 -0800 (PST)
X-Received: by 2002:a5d:64ef:0:b0:1e3:1e05:d042 with SMTP id
 g15-20020a5d64ef000000b001e31e05d042mr4049131wri.679.1645146213585; Thu, 17
 Feb 2022 17:03:33 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Feb 2022 17:03:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VVvcn1VpLXjd+X9Xe50sS_vY5ukKJE8i=eAZf1Phofuw@mail.gmail.com>
Message-ID: <CAD=FV=VVvcn1VpLXjd+X9Xe50sS_vY5ukKJE8i=eAZf1Phofuw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> +       backlight_3v3_regulator: backlight-3v3-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "backlight_3v3_regulator";
> +
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&edp_bl_power>;
> +       };

So I'm pretty sure that this is wrong and what you had on a previous
patch was more correct. Specifically the PMIC's GPIO 7 truly _is_ an
enable pin for the backlight. In the schematics I see it's named as
"PMIC_EDP_BL_EN" and is essentially the same net as "EDP_BL_EN". This
is distinct from the backlight _regulator_ that is named VREG_EDP_BP.
I believe the VREG_EDP_BP is essentially sourced directly from
PPVAR_SYS. That's how it works on herobrine and I believe that CRD is
the same. You currently don't model ppvar_sys, but it's basically just
a variable-voltage rail that could be provided somewhat directly from
the battery or could be provided from Type C components. I believe
that the panel backlight is designed to handle this fairly wide
voltage range and it's done this way to get the best efficiency.

So personally I'd prefer if you do something like herobrine and model
PPVAR_SYS. Then the backlight can use ppvar_sys as its regulator and
you can go back to providing this as an "enable" pin for the
backlight.

I know, technically it doesn't _really_ matter, but it's nice to model
it more correctly.
