Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E98557A507
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73757910C9;
	Tue, 19 Jul 2022 17:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72995910CE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 17:20:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bp15so28495112ejb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 10:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IH9J1HkJUDinkHiBrN0EE6fhsRqqhDII0J61LnPPg94=;
 b=ZQAX4R3A2RP5ePI8X1wnZBz/yY9Fp4N+5ElluUKxbZOSaqGLZi45cpgYwxewdTyBjy
 AtH3jrlwrayMjKxZMhtnAc4zgKV0KMlAX86PQ6qAz0sCIUIfKuP0ghevIzpbzJB2z2+g
 MeKjSieefdGX983+e3xeaMqLcqpDFdtvWZJvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IH9J1HkJUDinkHiBrN0EE6fhsRqqhDII0J61LnPPg94=;
 b=6BI9kbUM6IQjkdWD2NeQh1hPm9YDu4jK7k8NpZ5khkwLd+j/ao1HN4N4nr2VUed4dg
 Re1gzh+AqMlnZONKtAUG4afnIGk/+xOThZbdWT0LBsshE2xX10nK1FpQqmRpQn/F0SWV
 5sS/hp+0z9vDrTnh3/I1cs8Vn77g8avCfbBLCIzEdKRs2lNS5pW8QXc0hhAlrD9gvREs
 iJKowBuHM16LyMMqV1L8rq74QNvdek8DKmnKoZYFiaFKYBG53WWb61mDFWSnxdzdYpfs
 mfuRcYwzvVeRVfkS9qa+e4Ttf/2JeiEiZMiV6OtV3b+dWbtxd5G0AUwpsxD6ymJqRWTT
 eWBg==
X-Gm-Message-State: AJIora8qycKmQxnON/N1IfK9f3jWchFsSXdfyNWUclDHA+sJ5w8zz0S5
 vfeyyg2wHFmfal5/dzoYmZOvMmJtCQcjMHB6FXY=
X-Google-Smtp-Source: AGRyM1vA0pJ5bn01wucJWn/GDkrC3zqtnSD85xHl7ZxegRyh/VcraH1mQ+6JTKJsMkx7mmKRfj4qAQ==
X-Received: by 2002:a17:906:8478:b0:72b:4f81:29d8 with SMTP id
 hx24-20020a170906847800b0072b4f8129d8mr31682666ejc.179.1658251214864; 
 Tue, 19 Jul 2022 10:20:14 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090609c100b0072a881b21d8sm6851737eje.119.2022.07.19.10.20.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 10:20:14 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so10453816wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 10:20:14 -0700 (PDT)
X-Received: by 2002:a05:600c:3ace:b0:3a0:4ea4:5f77 with SMTP id
 d14-20020a05600c3ace00b003a04ea45f77mr277678wms.57.1658250734635; Tue, 19 Jul
 2022 10:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 10:12:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmGDS8sBq-3snuukFOUY+HKq_veoL2tgWf1-TbdUHzLg@mail.gmail.com>
Message-ID: <CAD=FV=WmGDS8sBq-3snuukFOUY+HKq_veoL2tgWf1-TbdUHzLg@mail.gmail.com>
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

Landed on drm-misc-next:

2dbeef82d14f drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
