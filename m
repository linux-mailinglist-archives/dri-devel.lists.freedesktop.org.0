Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8299F7C5444
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6010710E7B5;
	Wed, 11 Oct 2023 12:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204AD10E7B3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 12:46:40 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d9191f0d94cso7115362276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697028399; x=1697633199; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dW3F0jw6hSYsieT6t+VsgmR8dZ8/32cVIfl7zOoZNLc=;
 b=run7b/wQ38a397tut/WfmaVf0wdmZ4gvRBeNngfIPmVDYcnEOxXMlv57bndr7KFPZb
 l7V02Lykpmle7a/LGyP6grALwKhQOWUcPluGLhGO/ZdnvnMkUMTErDEW1i9NDtJoSXQV
 chlFJSqT9ui+1RpTAuQJOFWMBTcgBTLzKBBNcPtpB8gssxSj4YZn+DctpdshqECZzVis
 /k+gH2XGKl8p3zP3IuKTYF40MXeCftFQaeanT3uR/Yjs3RDTpJLlhhq49a/Qf9UU0Zi2
 CGNJJrhKw3ins/tU5HpJjRfQtCbB8kVt+elyO2tp3cY38TEHBrxS2hvLC2pKRrxZCoNZ
 VvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697028399; x=1697633199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dW3F0jw6hSYsieT6t+VsgmR8dZ8/32cVIfl7zOoZNLc=;
 b=IpO4NwHfzToo2CMKAOEmZYyScTEZxVYfzMdyw4yJRZq5ZnFEenpB4Sc12Y3N+x7ZTG
 BUvhJS+Iu8PxwnLz1mlQo3w2Y8AGsif+ODq3lg3l11CT4Jvmx0QpTVoUSxHqmhYShNlQ
 b+b90oePzjss9BpE0TUPZ/L4MWJ2Jr65NbAvqt0D+Wsl1dzO1Qz1jGP9HeKXylRfweKQ
 A55U8I9rqcdqKnTZGKj6Qo4l5+hp4OQPEjySB10YJDRfq2la1nBpMZNySxMswFVdg/2q
 sOTAKw7QTYpFhupgRIyL0WT8Vc+thUh2UxM9TCX4J29S9zbdIx/o2RJ4IQG+qD5Ub4iy
 JadA==
X-Gm-Message-State: AOJu0YzxgeZLKWbpuqROs3Sa7zO/18u9rh1p/85T4DgOyXO/MkF5BtTI
 rjYY31sIH/vrGjIC/0lJhuga/6wB4x4y/fMIBYAFQw0S+1QN62zCOrk=
X-Google-Smtp-Source: AGHT+IEXxUHgahb5Rv9YlVarko7XshACSDpKCpE2aXKyLar9E29Gzcw5Kx2vRU/DIhKX6Un2J5Ca5vqy10fCukWUVV4=
X-Received: by 2002:a25:3d81:0:b0:d9a:52ee:6080 with SMTP id
 k123-20020a253d81000000b00d9a52ee6080mr5293824yba.37.1697028399177; Wed, 11
 Oct 2023 05:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-5-b219c945df53@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Oct 2023 15:46:28 +0300
Message-ID: <CAA8EJpoGXEFisVAde3whLAC8Tt1EL1DqOsi-kfbzMU+MtbK4Vg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/msm/dpu: enable writeback on SM8550
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023 at 14:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Enable WB2 hardware block, enabling writeback support on this platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 4590a01c1252..d83a68a2cc0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -321,6 +321,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
>         },
>  };
>
> +static const struct dpu_wb_cfg sm8550_wb[] = {
> +       {
> +               .name = "wb_2", .id = WB_2,
> +               .base = 0x65000, .len = 0x2c8,
> +               .features = WB_SM8250_MASK,
> +               .format_list = wb2_formats,
> +               .num_formats = ARRAY_SIZE(wb2_formats),
> +               .xin_id = 6,
> +               .vbif_idx = VBIF_RT,
> +               .maxlinewidth = 4096,
> +               .intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
> +       },
> +};
> +
>  static const struct dpu_intf_cfg sm8550_intf[] = {
>         {
>                 .name = "intf_0", .id = INTF_0,
> @@ -418,6 +432,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>         .dsc = sm8550_dsc,
>         .merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>         .merge_3d = sm8550_merge_3d,
> +       .wb_count = ARRAY_SIZE(sm8550_wb),
> +       .wb = sm8550_wb,
>         .intf_count = ARRAY_SIZE(sm8550_intf),
>         .intf = sm8550_intf,
>         .vbif_count = ARRAY_SIZE(sm8550_vbif),
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
