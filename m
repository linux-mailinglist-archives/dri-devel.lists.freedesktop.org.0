Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53963996D8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 02:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2254B6E3DB;
	Thu,  3 Jun 2021 00:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190AB6E3DB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 00:13:35 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id m137so628383oig.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjcG7yb0p2PCjeChIEZx/qwcbpSV6pjnKIr2LM5z6DM=;
 b=NrcYLu/c53UvNnWkwbC+Vo+HdEds3SEb3xPgCuHxo4K2YM1dbNKZNmSzwYZHDBimzc
 /HlEvWxgkdSDYuT61IXOSAgsufEDnEsWcHBZGATvUQlpot1ws1yWvFR0PLqUAmoWOF2Z
 O4ys4RorI7/0D48LzE7XFm+v2Hdo8l1d1u9rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjcG7yb0p2PCjeChIEZx/qwcbpSV6pjnKIr2LM5z6DM=;
 b=qKv/smYHfn7uOVM2LlqUdQdmNSk1ffpGk0yzC1XaoHfr+C56yN07FAuWh37X2ZcrOo
 jkauai7jHg+5/9NQYoC5KcnFRagLsqSFbOcoqBG0UMgrcxjbfOJg2QXGhsBR+kEekSTI
 RvJipYxVYacUe2mZ7GNsVsy4e1VLjVWuSFlAXfLNNIHpktb9YBx4pKO9I9VlsyGcicz5
 WeBRcSeW0Sk6i+7jkDascwiyknEDW5BmufmWZ5iIrh10LoXrMD8vkm2zzT++P7RoA8Ve
 QGU8yGMnzCngOrRDc29Ai8DzYY7kMBr+GSelwLoiNuUcDAlIcmeI+ijcUZDeJRsmxWIp
 pAHA==
X-Gm-Message-State: AOAM531zIMbWW9NjsvEmxKBCrikCHqw1LFUidmT2swY40r+79YntHftA
 zRHqzl4vlCCd/9d4IjaHaDfqhcf8yD46Wg==
X-Google-Smtp-Source: ABdhPJz8DEaMg5Rjk33Jw3ab79CAyfsKvqVWzUoYlVtFTfgHbhTc9CMK+DiQERFhcgMiqbpVPw8URQ==
X-Received: by 2002:aca:e1c6:: with SMTP id y189mr5359514oig.114.1622679214234; 
 Wed, 02 Jun 2021 17:13:34 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
 [209.85.210.50])
 by smtp.gmail.com with ESMTPSA id t26sm357611oth.14.2021.06.02.17.13.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 17:13:34 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso4112143otu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 17:13:34 -0700 (PDT)
X-Received: by 2002:a25:8191:: with SMTP id p17mr50542159ybk.405.1622678728912; 
 Wed, 02 Jun 2021 17:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
 <1622390172-31368-3-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1622390172-31368-3-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Jun 2021 17:05:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuWKHo1YLRTtN_dcMDuoc9erpwaGTb6WNgwHeDLuz8qw@mail.gmail.com>
Message-ID: <CAD=FV=WuWKHo1YLRTtN_dcMDuoc9erpwaGTb6WNgwHeDLuz8qw@mail.gmail.com>
Subject: Re: [v5 2/5] drm/panel-simple: Support DP AUX backlight
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, May 30, 2021 at 8:57 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> If there is no backlight specified in the device tree and the panel
> has access to the DP AUX channel then create a DP AUX backlight if
> supported by the panel.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> This patch depends on [1] (drm/panel: panel-simple: Stash DP AUX bus;
> allow using it for DDC) and the previous patch (2/5) of this series.
>
> Changes in v4:
> - New
>
> Changes in v5:
> - Address review comments and move backlight functions to drm_panel.c (Douglas)
> - Create and register DP AUX backlight if there is no backlight specified in the
>   device tree and panel has the DP AUX channel. (Douglas)
> - The new drm_panel_dp_aux_backlight() will do the drm_edp_backlight_supported() check.
>
> [1] https://lore.kernel.org/dri-devel/20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid/
>
>  drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b09be6e..047fad5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -800,6 +800,12 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>         if (err)
>                 goto disable_pm_runtime;
>
> +       if (!panel->base.backlight && panel->aux) {
> +               err = drm_panel_dp_aux_backlight(&panel->base, panel->aux);
> +               if (err)
> +                       goto disable_pm_runtime;
> +       }

It's so nice now!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
