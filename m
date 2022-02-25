Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C544C4D60
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F004E10E918;
	Fri, 25 Feb 2022 18:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF36110E918
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 18:12:41 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 l25-20020a9d7a99000000b005af173a2875so4174879otn.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=P6W6fSTOMdI6DLwtXjDNtCkqRboRbExm2e87efd8TAE=;
 b=eIqzJQNGDjQoI00BNU+tJKXsaDa99HFdSsv0vWvNAr5r4lBlpfHfcamK2xc1519ppu
 sXVYfJq14r21w2I5V2MinOcLw41/s2PGQeFw73sUF9MS1lZ0BMokG9riYG/xhOm+z3LY
 cf0JHDdyinFanzE+Angaxs/OHpfBM977UqwKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=P6W6fSTOMdI6DLwtXjDNtCkqRboRbExm2e87efd8TAE=;
 b=QY+L5mGV3SgU3Dn49+9jw8/xxrOPePMkoDr3A0IsM+u6UwAalnHplZfBxidwAKckfg
 PR+94SeDkup6hFVOkWbfPURqE7eATMDdxy7Af6GSfJx8OH10jpQUlUpbrwZjs6YPnBPQ
 EmGbiv0XbyP10QMyunxCVGtvCFm3yTWRJ31gegkV5/Q8PzlfoAII4QcWw4Lb6ACx24z2
 SvE3efMDmlY8eyavnS3xxm5g9iGWT7lF7nCc/U5RwlXv30vwWXWM5PHT2wmQ1VMcS022
 MAeW9z0xrsUUneidpqmbzBblGmT4At63/EL69UDOrCDwX4mPiQe6bfxAQEXzhpZf4Bl2
 r9yw==
X-Gm-Message-State: AOAM533g+KeIzjw3XQZfQRHDz2r1cdXdW5t7/eH0gci4khy7bVpWXTC1
 CUXYHoRXSXXuy48ZDBfpyejdqUjFUf34YfWeNf7Vg88R2Ds=
X-Google-Smtp-Source: ABdhPJyZelvN2oaHvgHZQWDJl2h3BY/MvV7fI/x3v4r3uWyib6RzcGk21LpfwuLPgerrS7SuRls6Hqk4L9/OaKQ12j8=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr3289214ota.159.1645812761131; Fri, 25
 Feb 2022 10:12:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 10:12:40 -0800
MIME-Version: 1.0
In-Reply-To: <1645804670-21898-3-git-send-email-quic_vpolimer@quicinc.com>
References: <1645804670-21898-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645804670-21898-3-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 10:12:40 -0800
Message-ID: <CAE-0n50q4WitTP-dBUwGAWkkF+_hisCHQLntRf7MOi=KSyxQpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-02-25 07:57:50)
> use max clock during resume sequence from the opp table.

s/use/Use/

> The clock will be scaled down when framework sends an update.
>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")

Presumably this is the wrong fixes tag, see below.

>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d550f90..3288f52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1319,6 +1319,7 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>         struct drm_device *ddev;
>         struct dss_module_power *mp = &dpu_kms->mp;
>         int i;
> +       unsigned long max_freq = ULONG_MAX;
>
>         ddev = dpu_kms->dev;
>
> @@ -1333,6 +1334,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>                 return rc;
>         }
>
> +       dev_pm_opp_find_freq_floor(dev, &max_freq);

This isn't exactly a cheap thing to do every runtime resume. Please get
the max frequency during probe and stash it somewhere to avoid making
this call over and over again.

> +       dev_pm_opp_set_rate(dev, max_freq);

This is entirely new. The assigned clock rates from DT aren't set during
runtime resume, only during device probe. My question is, if this is
needed now then does it mean we've been running the clk at low speed
after the first runtime suspend and never been pushing it back up again?

>         dpu_vbif_init_memtypes(dpu_kms);
>
>         drm_for_each_encoder(encoder, ddev)
