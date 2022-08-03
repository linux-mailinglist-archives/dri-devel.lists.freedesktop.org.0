Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A075588E01
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 15:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48AE18BFF2;
	Wed,  3 Aug 2022 13:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A64C18BE23
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 13:55:15 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gk3so19445287ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 06:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=BX0MHXFB9OMLas/3vw1gWSW/wKlLfG1bTlBU7/A5LJY=;
 b=NgWFEGgqhpFOMAezMzzFaK7vGV+stSnIqJjbdEM3QqRLao4HHCRJ6LwcqWOcDrMmwd
 a0gNzN/9aGOGsFxsbpAEiMb/bknSNrVfjlM3GIgVJFuSpLQlFbJO+zEKTxBYLvzDzmfr
 yJdg+x5hmAYuyctBRyTquSAt7q/6fDMtx20is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=BX0MHXFB9OMLas/3vw1gWSW/wKlLfG1bTlBU7/A5LJY=;
 b=bTL7+f4/963E/elws0ubTU5AYjNnvM9jIJCwRqfyw3qYKD58rQF1VaVl+TCMKwnG+d
 CW7IgKQB2PGD8+0OPoDJeLK3UIhaOH/V0A4S6iRdNGGEXyrWQTooCgoViontMMsyHCgi
 ZWWt5ftaS259ciCrruAieyCidOUIoAEna9EbHlRYUpJEswV+XvNwLEic+zOpRHXTO2gY
 OdTL3PX0O/LFNc0GY+K0GVR6I0/thuEQtek9VT9W3wSlzRJ/ex2y7LsHoj4212xVOKUd
 cdvc1SM6+ufPGDfN7+K04399mzvcG3YadwaG3DD0Qq23cxkWWvricL1/8STCSajQYVgm
 kJPA==
X-Gm-Message-State: AJIora9L+jrl47aq/14HfSLqsfXcCIdMryVBfKxoClqF5qT1FOxl/pu6
 1ODEJdHVHrmCFbkVG1uRflxHkd8EWjk56q0M
X-Google-Smtp-Source: AGRyM1sILowMQlLFjKCFfthFmvywy+VEQvz/HtPxWg217Ifh0M9BoAUUHhVtZg9rntBPW7INRfQmuw==
X-Received: by 2002:a17:906:974d:b0:72f:2835:f664 with SMTP id
 o13-20020a170906974d00b0072f2835f664mr20728738ejy.543.1659534914082; 
 Wed, 03 Aug 2022 06:55:14 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 g26-20020a170906539a00b0073080c22898sm3582914ejo.15.2022.08.03.06.55.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 06:55:12 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id z12so11561103wrs.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 06:55:11 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr15858645wrf.659.1659534911179; Wed, 03
 Aug 2022 06:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.6.I969118a35934a0e5007fe4f80e3e28e9c0b7602a@changeid>
 <3f79c5b1-9ce8-6aeb-300a-565ba018ae11@linaro.org>
In-Reply-To: <3f79c5b1-9ce8-6aeb-300a-565ba018ae11@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Aug 2022 06:54:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UVSBvpAs4bBHTh6tGXazU1+OLg4+Opfg8guXQ1ShhnNA@mail.gmail.com>
Message-ID: <CAD=FV=UVSBvpAs4bBHTh6tGXazU1+OLg4+Opfg8guXQ1ShhnNA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dsi: Improve dsi_phy_driver_probe() probe
 error handling
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 3, 2022 at 12:32 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > @@ -634,88 +631,71 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
> >               phy->cphy_mode = (phy_type == PHY_TYPE_CPHY);
> >
> >       phy->base = msm_ioremap_size(pdev, "dsi_phy", &phy->base_size);
> > -     if (IS_ERR(phy->base)) {
> > -             DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
> > -             ret = -ENOMEM;
>
> Here (and in a few cases later) this changes the error code from crafted
> -ENOMEM to the proper one returned by msm_ioremap_size(). This should be
> mentioned in the commit message.

Good point. Unless something comes up I'll plan to spin a v4 with this
change to the commit message tomorrow.

-Doug
