Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685DF50FC7D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8C910F3A7;
	Tue, 26 Apr 2022 12:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E8C10F3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:06:02 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2352001pjm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 05:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnzdSi3Y2fRjDYepkMI15WioUna9jOJebVVCPfoxoDk=;
 b=i7gY7giHyXPmee5KAD7wbIyoXRSrmuP4WOM4T3+JXT1CV/rTBRi8oSce/BdEEWW58u
 NsSv58kUv0NANV6uHSoKWfhSpTctDX3iVmiSRjxwj/cgOvbozSxb7vt5W1kKKmNQmhko
 9ttDn8xWOPCGknbwcKnxloyDoxr4meczx7bDrLyLF5ugB9Sxp2CWUS7oSlP/mPqcL/O3
 /ESx3oXN3yYEHobegS2CcvicYNepoTWV9S+V4azROgeEQrsJAvwfG7ZnCxhC0rtMIYMH
 0eKm1ko1cdFvUjxbusUbziv3S+CDv/yB/KwuMiXZ1cDa/Vhkz6m4R6Yj4bdfcJuknLtH
 +e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnzdSi3Y2fRjDYepkMI15WioUna9jOJebVVCPfoxoDk=;
 b=LhH1vux3T/ioUKtwnzjfXE0pFdp62H09ANG4OncGn28AQGfWAIzU4ybd+SLfte+SIl
 6AvmrH2KA9VtppKEzt4ZYx6Q72J/aiuRFya+mmlzBGjp6aAxdHGZ1elup2dvGOpRXsBP
 QTGS7p+XbeOy3ISzGixV6KsJhovBPEwQgrpnhZ7lGAYOC7s3j3hOZUuIyeTFWxHMNM72
 SolKYR1Y+4Y3ZsLB7SjyARg0sJUe+XVcbPP30Hlx8s/nj1cQYilUEgeHwIrDMl0X0lFs
 5JioC7SGqxjOy+IQaB2ldVPxuoMhHnnxt8PAK2GQ74MAUrNZzuqX+hrkp4nWWyF7Tx5J
 WVfg==
X-Gm-Message-State: AOAM533udDSFBm1tub8yqNaUshcYU2p+07ci93Ubh89pdoGCRbZ/bAlP
 M+TrTDhD89C00bQiwanq+EKS1MNYEu50mFEvvMpPJA==
X-Google-Smtp-Source: ABdhPJxu9IBJC6octy0fX9i2qg8aewV72uAgxq0IVjwRTkCg/lZHlajKcq0m0zHjxoPJ5/yusWdFmBu9Ib5uViQWBUs=
X-Received: by 2002:a17:902:8547:b0:15c:f02f:cd0b with SMTP id
 d7-20020a170902854700b0015cf02fcd0bmr15152656plo.117.1650974762489; Tue, 26
 Apr 2022 05:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220426011359.2861224-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220426011359.2861224-1-dmitry.baryshkov@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 26 Apr 2022 14:05:51 +0200
Message-ID: <CAG3jFyu3ZAHWzL2+zfzqxb0ohoDkEQRUiijcPVBVPecScBPr0A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358762: drop connector field
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Apr 2022 at 03:14, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The tc358762.connector field is unused. Remove it to save space.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 7104828024fd..5416e8bbf827 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -61,7 +61,6 @@
>  struct tc358762 {
>         struct device *dev;
>         struct drm_bridge bridge;
> -       struct drm_connector connector;
>         struct regulator *regulator;
>         struct drm_bridge *panel_bridge;
>         bool pre_enabled;
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
