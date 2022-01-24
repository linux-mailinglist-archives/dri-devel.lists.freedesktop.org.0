Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4C498B0D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 20:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347D10E432;
	Mon, 24 Jan 2022 19:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884E110E432
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 19:11:01 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id u5so14753303ilq.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Hb93v/cG3xs7a91RJePhFR111coG45/XiAqaJtoOXg=;
 b=dekshM3r0iZqRnweN0cD1KEJ/ymwv3d8zD/lK38pye/d6XexTA41QPH7eF7J5ydIuP
 T+vohEUegraekD/fwapCJeRUIjZm0tUtukdNQMo4cg6MypLPrzRTcMH+JFN8qkid4b7c
 Fh307MemSL7Jm9rjOaMJSBJKqt2OAxti9p2cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Hb93v/cG3xs7a91RJePhFR111coG45/XiAqaJtoOXg=;
 b=ZI9ey6aX12/CxH3tmg2ApAax0kdekJrfQ6hX6xTLN73AKhTJfhAe8GyN3mJvXg8BKr
 R3yXVEH5WoF30JiITlMFWOx/SiXouO8t88sP2WamYCQyPPAqKyn8+ZNUdWc8VYjAI0Zd
 SFTmAivnk9wBZp3Mp4C/LAnGAzu3MVGPfLkIcsvLwSOOTS4XO3TSGoJLwIUwwJNFFsqv
 EJVCCtK9zZSUGUi9Or4UWkiEMMPZFeNX2+s8HyUH/mDC257tIBmRf1WKkPudmiCS2g7+
 7wDPJtojHbJlbU/SrmpkmKP9q4t3N3JsaO+mtR78Tk6UhFcvL5FZJq9vpW06aJyAe6Z1
 Ivjw==
X-Gm-Message-State: AOAM533kiOc5JgTohStuzZ0HJaAM2Xzx6EmcgAr5suzGXtSsz+mFZfvb
 sug1OJx2QoOQIaE67C2c/VnSPyBU+V/tAA==
X-Google-Smtp-Source: ABdhPJxS1oRAd6pMyyOBtQic6fJPAFdTt8GfT7UXXf+L9lke2pjPMCphBiVS0WnGwrny4Fp4IpIeKQ==
X-Received: by 2002:a05:6e02:1ca6:: with SMTP id
 x6mr9605590ill.171.1643051460679; 
 Mon, 24 Jan 2022 11:11:00 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id y4sm7715533ili.26.2022.01.24.11.10.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 11:10:59 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id a12so20797666iod.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 11:10:59 -0800 (PST)
X-Received: by 2002:a02:c726:: with SMTP id h6mr2352523jao.207.1643051459292; 
 Mon, 24 Jan 2022 11:10:59 -0800 (PST)
MIME-Version: 1.0
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
 <1643048114-2996-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1643048114-2996-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jan 2022 11:10:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XLzCc-M6CMYOMMZ6cj+RMdwi4Uwsde=2s5V2pMWj_QTA@mail.gmail.com>
Message-ID: <CAD=FV=XLzCc-M6CMYOMMZ6cj+RMdwi4Uwsde=2s5V2pMWj_QTA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel-edp: Add sharp panel support for sc7280
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
 <devicetree@vger.kernel.org>, quic_abhinavk@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_khsieh@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 quic_mkrishn@quicinc.com, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 24, 2022 at 10:16 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add eDP panel support for sc7280 CRD platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 176ef0c..bb2e346 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1605,6 +1605,14 @@ static const struct panel_desc sharp_lq123p1jx31 = {
>         },
>  };
>
> +static const struct panel_desc sharp_lq140m1jw46 = {
> +       .bpc = 8,
> +       .size = {
> +               .width = 309,
> +               .height = 173,
> +       },

Where are your delays? I very much doubt that they are all 0.

I guess you're also not putting timings in here and you're relying on
these coming from the EDID? My own preference would be:

1. If you are relying on a reliable way to read the EDID of the panel
then you shouldn't even need to add anything to this section of the
file. You should use the "edp-panel" compatible string and then add an
entry to the "edp_panels" structure.

2. If you want to support folks that don't have a reliable way to read
the EDID then you can add things here, but you should add a mode.


> +};
> +
>  static const struct drm_display_mode starry_kr122ea0sra_mode = {
>         .clock = 147000,
>         .hdisplay = 1920,
> @@ -1719,6 +1727,9 @@ static const struct of_device_id platform_of_match[] = {
>                 .compatible = "sharp,lq123p1jx31",
>                 .data = &sharp_lq123p1jx31,
>         }, {
> +               .compatible = "sharp_lq140m1jw46",
> +               .data = &sharp_lq140m1jw46,

Two problems:

1. You should use a ",", not a "_" to separate the vendor from the model.

2. You need to post device tree bindings for this.


NOTE: if instead your eDP controller supports DP AUX bus then you
don't need to add to this table at all and you don't need to add
bindings. Instead, you'd add your EDID panel ID to the "edp_panels"
structure.
