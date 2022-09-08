Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0195B227F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 17:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052D810EB40;
	Thu,  8 Sep 2022 15:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F137C10EB40
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 15:36:47 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s11so24960321edd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xrdt2Am83Q2/xE5e8Mu2ETEx+zDbeqSljE6QTT1gvG0=;
 b=G0Te9Xax4qhzFqNgN7Wf9BDii2Ft+4lhIjZ1oSLn0xbKxfuhq7YAyuYF2rHp+dHDHz
 lOvwCVLQkCmnJkDCfSoNLsrotggCNQpN1QfIvTeT0KHp+EAdBmkKmG6eNakRU6U0obDw
 /9L3PKD5T/APWa7bq8F+MmMlHgtzZRWjEV/vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xrdt2Am83Q2/xE5e8Mu2ETEx+zDbeqSljE6QTT1gvG0=;
 b=zmRAdCeq6Pv+YoeLU54haWD6SwQSw7I9z7R9NFneqMCDcPO2j7sVYmoBBP6h0C3Yy6
 r+vFZxD6n0GuA5wCREwHh5z/0FCpNSMpgRSfoe8hDzbUSDGOpMxokkKaS8AYTv1IQdL1
 xmeFP7/jBptyK4BX5SPeIRTqn63+F0jgZ+xPSZWFGAtLzCHH5Yw1fhpFf2qD7WRl2y5U
 wOyQ45UJflefewGc+whzukornoxC39jIFv7ka5wZ5tsjRHKndpUNC4xjsnQKjj5eA4Qw
 o0LauA6jwlN2T6VUXya/r8T+j8Rgw9JwDN6JBl6/vTh/nedkO4n6mIimGOuaP9Q0rRBo
 u+gQ==
X-Gm-Message-State: ACgBeo0Fz/COQMg4dlnioPK0kspZ2H404AW+eOjaWrj4vPOS5OU6ycBE
 jMD6TFAPMkprZhfoY+UjiXYuU244r7qwxBU3nCE=
X-Google-Smtp-Source: AA6agR4XIyBAuLkkY5oTLhQXugdXTnwaHQcqVINdkbEds8YH2om9okw3bi+eGSZHHi+ZGdf//W3uEg==
X-Received: by 2002:a05:6402:51ce:b0:43e:74bc:dce with SMTP id
 r14-20020a05640251ce00b0043e74bc0dcemr7906611edd.225.1662651406188; 
 Thu, 08 Sep 2022 08:36:46 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906309a00b0073d218af237sm1343467ejv.216.2022.09.08.08.36.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 08:36:45 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id d5so11093543wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 08:36:45 -0700 (PDT)
X-Received: by 2002:a05:600c:42c3:b0:3a6:431:91bf with SMTP id
 j3-20020a05600c42c300b003a6043191bfmr2569148wme.188.1662651405144; Thu, 08
 Sep 2022 08:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220908085454.1024167-1-wenst@chromium.org>
 <20220908085454.1024167-2-wenst@chromium.org>
In-Reply-To: <20220908085454.1024167-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Sep 2022 08:36:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wb+mTZ0OuwmqtgaKdeQJ68MN2havUp0ZpNZ=DfXBhThw@mail.gmail.com>
Message-ID: <CAD=FV=Wb+mTZ0OuwmqtgaKdeQJ68MN2havUp0ZpNZ=DfXBhThw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel-edp: Add Innolux N120ACA-EA1 panel entry
To: Chen-Yu Tsai <wenst@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Sep 8, 2022 at 1:55 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> This panel has the same delay timing as N116BCA-EA1 from the same
> company, which is also the same as delay_200_500_e80_d50.
>
> Add an entry for it.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 65e3a5361c80..15e18a64b03d 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1890,6 +1890,7 @@ static const struct edp_panel_entry edp_panels[] = {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
>
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
>
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...and landed in drm-misc-next:

758d7b3483b6 drm/panel-edp: Add Innolux N120ACA-EA1 panel entry

-Doug
