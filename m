Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8972D0C58
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16266E7F1;
	Mon,  7 Dec 2020 08:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB3B6E431
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 15:23:48 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id g20so13118768ejb.1
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Dec 2020 07:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o6oFhKK6E9ulOA/HQLGC/Cvl0EWnQ7WoWB+KajzZU9M=;
 b=L3nCZcKcPKem4zPyoXK/6Aw/NP2RW0RuNWRGwAPVrPYRmI4GyRwL07kkbt2hNJRJCS
 cyJrrAIjEBqUGqq2pDd81l9uWvA1zqWkYJjV+xxNtNSqwxbFyGuU61XDPHDHV5C/s/lz
 DL7S064GR8r3KZAYLjgzJ65tHbUNcT+Y6izXenEkniSbJ4aQBpsb+bOhA2Xp1UnKLVLJ
 KzdJYBgP3hPilhgpatxFQ5hDU8rCqkPO0WWqtf406oo3sDvO7xoUkIj6NE6CZb41r93Y
 IJNg+7dTI90Dm5XhQX8lBM+6emnNmkMvJzHX1ikWOPD/zpc1B3mnnEsQEcGtARfONiAL
 7ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6oFhKK6E9ulOA/HQLGC/Cvl0EWnQ7WoWB+KajzZU9M=;
 b=mCaczGZAhk+3H6tPReoShqgNc0GXZ1iKa/4nbgebR21QlUxQozjUaVZSaQB5cgA68J
 vvvv0RaX72j+qgx8JjIkG+nqIa1ufMsIFTGWnbiZoK2nwdrj8v2IQvu0jytzBF0Dj6RZ
 ilx8k80NmoAuI8XxeAye+xsOsMDo8/1EuigRsH4LmP1u4BO18ttZReD5x9aFZSkW2n5K
 FSmutSbTdjFy+QqG9Yi6BQiRy8EwjkbKtNVJzUpCturoO8xvVeqywucJgcPciNGUwwgM
 oG3wa8qxYJ4lPrpfN9vvX+4X+Iawj5XmOHW8MJqdynD8pkXPg6Hp2kx98OaNAgepiCRW
 wWkg==
X-Gm-Message-State: AOAM533szyyK5vlA5XRFG0fadNASCr6bHfHp4fwWrML01Ens13idcFzS
 OxvcGfhJgpIUegKJ5lKwyiQ/AQYWLCnMoV2SNOD6Cw==
X-Google-Smtp-Source: ABdhPJyzknKZdsiDAAQV4EoRT04aryQWvBfxjjm7spiAdyN2wKXOvto8Yw/lV2QTqPfmNXDuCsx4Gz7Omewa3Br0/LM=
X-Received: by 2002:a17:906:4482:: with SMTP id
 y2mr11916052ejo.342.1607181827131; 
 Sat, 05 Dec 2020 07:23:47 -0800 (PST)
MIME-Version: 1.0
References: <20201103052102.1465314-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201103052102.1465314-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 5 Dec 2020 18:23:36 +0300
Message-ID: <CAA8EJpor_oizNfYaQydQdNVgROGTGpKJnoHhqXx9O9XcyYWe3g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: enable DSPP support on SM8[12]50
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Nov 2020 at 08:21, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add support for color correction sub block on SM8150 and SM8250.

Gracious ping for this patch

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  3 +--
>  2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index bb1add2e49dd..240a21c5e5fe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -466,9 +466,9 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
>
>  static const struct dpu_lm_cfg sm8150_lm[] = {
>         LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +               &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>         LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +               &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>         LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>                 &sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
>         LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> @@ -487,16 +487,28 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
>                 .len = 0x90, .version = 0x10000},
>  };
>
> -#define DSPP_BLK(_name, _id, _base) \
> +static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
> +       .pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
> +               .len = 0x90, .version = 0x40000},
> +};
> +
> +#define DSPP_BLK(_name, _id, _base, _sblk) \
>                 {\
>                 .name = _name, .id = _id, \
>                 .base = _base, .len = 0x1800, \
>                 .features = DSPP_SC7180_MASK, \
> -               .sblk = &sc7180_dspp_sblk \
> +               .sblk = _sblk \
>                 }
>
>  static const struct dpu_dspp_cfg sc7180_dspp[] = {
> -       DSPP_BLK("dspp_0", DSPP_0, 0x54000),
> +       DSPP_BLK("dspp_0", DSPP_0, 0x54000, &sc7180_dspp_sblk),
> +};
> +
> +static const struct dpu_dspp_cfg sm8150_dspp[] = {
> +       DSPP_BLK("dspp_0", DSPP_0, 0x54000, &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_1", DSPP_1, 0x56000, &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_2", DSPP_2, 0x58000, &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_3", DSPP_3, 0x5a000, &sm8150_dspp_sblk),
>  };
>
>  /*************************************************************
> @@ -888,6 +900,8 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .sspp = sdm845_sspp,
>                 .mixer_count = ARRAY_SIZE(sm8150_lm),
>                 .mixer = sm8150_lm,
> +               .dspp_count = ARRAY_SIZE(sm8150_dspp),
> +               .dspp = sm8150_dspp,
>                 .pingpong_count = ARRAY_SIZE(sm8150_pp),
>                 .pingpong = sm8150_pp,
>                 .merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> @@ -919,6 +933,8 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .sspp = sm8250_sspp,
>                 .mixer_count = ARRAY_SIZE(sm8150_lm),
>                 .mixer = sm8150_lm,
> +               .dspp_count = ARRAY_SIZE(sm8150_dspp),
> +               .dspp = sm8150_dspp,
>                 .pingpong_count = ARRAY_SIZE(sm8150_pp),
>                 .pingpong = sm8150_pp,
>                 .merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index a7a24539921f..e42f901a7de5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -57,8 +57,7 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
>  static void _setup_dspp_ops(struct dpu_hw_dspp *c,
>                 unsigned long features)
>  {
> -       if (test_bit(DPU_DSPP_PCC, &features) &&
> -               IS_SC7180_TARGET(c->hw.hwversion))
> +       if (test_bit(DPU_DSPP_PCC, &features))
>                 c->ops.setup_pcc = dpu_setup_dspp_pcc;
>  }
>
> --
> 2.28.0
>


-- 
With best wishes
Dmitry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
