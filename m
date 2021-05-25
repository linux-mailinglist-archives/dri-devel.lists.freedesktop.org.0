Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF039075E
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6206EA85;
	Tue, 25 May 2021 17:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A8B6EA85
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 17:19:30 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id t17so5886153qta.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0I/7mJjy8fAtyuQW3u9pKYduA4z2KSC8v2zpf0k2q4Q=;
 b=LoEAi62rRu7tHFsRIAnERe0Uo6+lB7bp00VbsoFCad2BNA4J/p4XQRSUgdI2W2YwpI
 BCwReshEWdDvXBR49YxtAe1g92O1OceM2w/LWlaEzlpySS/rDNROaMb5tLKesjeJPP0X
 CNKYpCq57mgvBz5whA92hLzX7uNngLYIcuAIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0I/7mJjy8fAtyuQW3u9pKYduA4z2KSC8v2zpf0k2q4Q=;
 b=SQnXDwJs3dPMrs+N/DZV6vt0xdsNAd06jtdxfXMayws441qvS+zM/f7M2ewbKaN3Ik
 LLLLP3NlUhhZWgxcSNgeKK0ULw5qN1bwC6wSpEFkz84clLw2k5jNj0jYQyULLJSEpfzJ
 6VKjg+kwnsCNxj3n9y9hyYwLYqqna8Upc5Yt2RVoBpp+AyQZ+CuVomPdcO+hNTP9uw9k
 ZjmhKW+DER3rTx4zAnk1rEXlhbVLRNAK/ai7b6xN9P3fEO6+MOZsYOYejpNBI4ay0FFr
 HgP38mTmzx+9H0QQ/LSTYZYVH1Qj7nhtiLOrS+DZfUGBl3EE5QyH85JkXdzCtL2MRNVy
 z/Dw==
X-Gm-Message-State: AOAM533s/PCUHWNtpztJ4aGoFQeyLh/XbbR0/lZGtPUuNoaTPLUuDWdh
 ZJJAJ+SGLzZDnool5knF1zE0o11h6H5pVA==
X-Google-Smtp-Source: ABdhPJwgKsQBqF837bwIt0vvMD7/JCOGY/qJ1crimahrQ4XH/I6o/KlxMFXw+hPpDoGuXzLp5FzzSg==
X-Received: by 2002:ac8:7c4b:: with SMTP id o11mr33437415qtv.336.1621963169316; 
 Tue, 25 May 2021 10:19:29 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177])
 by smtp.gmail.com with ESMTPSA id s16sm11413709qtq.67.2021.05.25.10.19.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 10:19:29 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id o18so6428105ybc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 10:19:29 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr44274582ybp.476.1621963168291; 
 Tue, 25 May 2021 10:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-5-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1621927831-29471-5-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 May 2021 10:19:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=VtC9EGyxUGptRN1=PcKwyWLEyRfA9J1frTVPCKY68w@mail.gmail.com>
Message-ID: <CAD=FV=X=VtC9EGyxUGptRN1=PcKwyWLEyRfA9J1frTVPCKY68w@mail.gmail.com>
Subject: Re: [v4 4/4] drm/panel-simple: Add Samsung ATNA33XC20
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 mkrishn@codeaurora.org, Sam Ravnborg <sam@ravnborg.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> Add Samsung 13.3" FHD eDP AMOLED panel.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>
> Changes in v4:
> - New
>
>  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index caed71b..21af794 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3644,6 +3644,37 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
>         .connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>
> +static const struct drm_display_mode samsung_atna33xc20_mode = {
> +       .clock = 138770,
> +       .hdisplay = 1920,
> +       .hsync_start = 1920 + 48,
> +       .hsync_end = 1920 + 48 + 32,
> +       .htotal = 1920 + 48 + 32 + 80,
> +       .vdisplay = 1080,
> +       .vsync_start = 1080 + 8,
> +       .vsync_end = 1080 + 8 + 8,
> +       .vtotal = 1080 + 8 + 8 + 16,
> +       .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static const struct panel_desc samsung_atna33xc20 = {
> +       .modes = &samsung_atna33xc20_mode,
> +       .num_modes = 1,
> +       .bpc = 10,
> +       .size = {
> +               .width = 294,
> +               .height = 165,
> +       },
> +       .delay = {
> +               .disable_to_power_off = 150,
> +               .power_to_enable = 150,
> +               .hpd_absent_delay = 200,
> +               .unprepare = 500,
> +       },
> +       .connector_type = DRM_MODE_CONNECTOR_eDP,
> +       .uses_dpcd_backlight = true,

From my feedback on the previous patch in this series, I believe the
"uses_dpcd_backlight" property should be removed and this should be
auto-detected. Other than that this patch looks fine to me. Feel free
to add my Reviewed-by tag next spin when that property is removed.
