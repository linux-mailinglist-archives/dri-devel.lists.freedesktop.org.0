Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764525708D4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079738ED1C;
	Mon, 11 Jul 2022 17:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC428F01F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:29:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e15so7147769edj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/a1UbjX73QHDgFxXbe9HW11fDUV6n2EgYdg4XVN7V4=;
 b=WZWXJ+sltlTPlPn/bzKiujziHp3Pw0Ib1/YdW52oCRLfs+CfOw7rN0GttGkL8Xuo2t
 NASR2HFpAsXMEaYS7p8e1Q9LoFni0sLiAniavy8jKkR5/Vr2rN/lt8nuT0PobHZMBpM7
 XvK4J/RA2NVwXKuS8IABLHFzBVV5WrxHEY0t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/a1UbjX73QHDgFxXbe9HW11fDUV6n2EgYdg4XVN7V4=;
 b=J3AZPaXtAJtuOPiGV6QqXmLFbDccpU1mmyyg28ACuxORT/Xmo0HrBuiJ9fgJ0vprNx
 L3wVuMF1PB93HfMBV7K0l6X4eGKtkLrHEZ8Gp3a+F4cB3ofr6mJ9uhsAPhHTpaBKsj3t
 rknNKh1hwkp/FXiNFnmYLg2MInpOTpnB7lU+sf0VKXz7Du7R4eSreW74ZNw/9blKFS5l
 8f04SKIeblxCgkbtRXnGyA6IVgMOg0ot55SgD9JM1Fs98oXvTHsBfCstFkSsNxvwyx0o
 bQgeDuODTGE0nwqC4KENcfvj+tW0O0g9wV+7o5GkYjGoZCXCbO22BXNuoaPO38y5hwaC
 MAJQ==
X-Gm-Message-State: AJIora+AIQ8pnjhPBHn/YF9R85Wh3wHfuhdvZ6buFGN3v7kyM5wx44oB
 PYH2rRC5uXkHmbBjg5vO/6l/2Ihx6eO9Row3nN8=
X-Google-Smtp-Source: AGRyM1sDb68ZI9PsnnlYREI72jpWu3d4i1BfAaluXyIoeFMOh2Doa56hApWMuQJE5WOY6zVCf6QleA==
X-Received: by 2002:a05:6402:149:b0:431:7dde:9b59 with SMTP id
 s9-20020a056402014900b004317dde9b59mr26385423edu.339.1657560581962; 
 Mon, 11 Jul 2022 10:29:41 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 f10-20020a1709064dca00b006fef557bb7asm2884802ejw.80.2022.07.11.10.29.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 10:29:41 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 9-20020a1c0209000000b003a2dfdebe47so2609069wmc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:29:41 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id
 f13-20020a05600c4e8d00b003a12e4d1dd2mr17363425wmq.85.1657560175521; Mon, 11
 Jul 2022 10:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 10:22:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQv1Tzm_BZO6-RRPPepgAyB-AYRSxTDaj=AirO9ikG1w@mail.gmail.com>
Message-ID: <CAD=FV=WQv1Tzm_BZO6-RRPPepgAyB-AYRSxTDaj=AirO9ikG1w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch bpc using
 drm_atomic_state
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I tested this on a google,lazor-rev5-sku6 (your code correctly found
bpc as 6) and a google,coachz-rev2-sku0 (your code correctly found bpc
as 8).

As an extra safety net, I also double-checked that the generic
edp-panel would work. I also hacked the first device to use
"edp-panel" as a compatible string, found the panel to be detected,
and found bpc was properly found as 6.

So from a testing perspective this seems good.

Tested-by: Douglas Anderson <dianders@chromium.org>
