Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F17EBE31
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 08:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A00110E4FF;
	Wed, 15 Nov 2023 07:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C969210E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:38:35 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5a84204e7aeso75301117b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 23:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700033915; x=1700638715; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q1N5b4p/p13lbsRtP6IYe/M9cBHIoG53IIFCSkJ3nug=;
 b=qetzxhGUWDpb/aWx2DeQPC8V53ozJ1LvgbutTGfLecjXiSYBu763bzBcWMOePjv9du
 sfKE8zXloxrD1XBB5th6UEXL5mN5M36pdYQMMaqPZD5o20v/LHSPsRTqTrFQsEJY6g6Z
 jN3VhdswS24OCpzrCdGPjGxhAoropcXlrd6n2xw/x1RmgApN1VJIimvt73To7JP7MlCT
 PqlW4nOhHroSjHvdhrYFOLKvQWxgEI/QekrTu2V5JETv3WfNZUypg8TeefUrGbp4YVg7
 vBcQV6DFoqhRIiGX3NTCzaouFmPycKN5+7xEliUk1JZHk2YRnS9BDsXU8Nb1ZIiU69NP
 OCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700033915; x=1700638715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1N5b4p/p13lbsRtP6IYe/M9cBHIoG53IIFCSkJ3nug=;
 b=NGrLMWdomGWRVw4rIkINs0fFQ85o5mfdaYuwc3AjF8hynL9TuDjq5xWK/++tBW2x1E
 V/0yXrUGxkjbW2MNwh8DY/EOAxXNDKnjcGOoaFhgD3lnmj5Z1A9fKweSAGTzvxOyQpsf
 uoOtiJFoPqxo2ahtGfZl1j8+Oafw1J1vocNuMn+vU55+Vpyf4xyBnn/6WR1y/CJHgCZZ
 7AOlSgRuaKUx4mWWcRdxnIeq+36lybT3PNBQLJpMIaw+toU0q/T8ekS/sbi/cIiDBIet
 Nlu4ybfxd3newHkQlkNFg5yQ7iowTWw251aivRxj2ey0xqD+rA1mXU8kNHqpYSIVwdIf
 4W3Q==
X-Gm-Message-State: AOJu0Yxi7VUzmFoS0GnY2xxumuRukVbEZLriI9H0O/hBOIBxHHZOu55S
 HlXVSlZVvvEaOwyiYh9ndYzuAbKVQm516RnDjPrkAQ==
X-Google-Smtp-Source: AGHT+IHjbgTefhGkY80NO9CwFz5yFYBdsK6NjwMZVNPorX5RtHxDYe0wL9z9xFjGN0NQqPY9WuDeHuInEdv8SASvykk=
X-Received: by 2002:a0d:cfc4:0:b0:5a7:c8fa:c620 with SMTP id
 r187-20020a0dcfc4000000b005a7c8fac620mr11860582ywd.0.1700033914825; Tue, 14
 Nov 2023 23:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-5-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-5-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:38:23 +0200
Message-ID: <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Make it clear why the pkt_per_line value is being "divided by 2".
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 66f198e21a7e..842765063b1b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         /* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
>          * registers have similar offsets, so for below common code use
>          * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
> +        *
> +        * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
>          */
>         reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);

Should we switch to ffs() or fls() instead?

>         reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
> --
> 2.26.1
>


-- 
With best wishes
Dmitry
