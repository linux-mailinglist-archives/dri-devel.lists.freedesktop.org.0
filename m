Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BEB5FCC0E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 22:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595D510E021;
	Wed, 12 Oct 2022 20:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9B510E021;
 Wed, 12 Oct 2022 20:33:31 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-132af5e5543so57966fac.8; 
 Wed, 12 Oct 2022 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F+6/WTdyAE3EQyH87ANnP7ar7wpnTdFTL8+hStig2XI=;
 b=SrpjuB9jRI/zjgr1BsoSQ8kUr0st4EeBYpbwwFuKPaTGJwR341YVFaVMKj6n5qT9PV
 n9PsFxsxwPQ3mMXi6U2uZzRuaOyorC0ZfU00cst0XvP8hboGAvAZ0gdHnxLJX/JhS7hF
 qzmwhYpsNLNaviYQhk+uq1ce/oQaHWt5Siy4UIjQRZv4dfEmZs0ep7ZXBhb3yxIhv+dc
 Lk4EBXSc0KouNeq+8JyyVSTluKmNDekfCQLwRtetH9lAr59OGhK38VRQtYfRerL4cZJY
 IcuCZ9uBRVSZdBcjs2M9vohN0dtSnhKdxvnMsP1Le7rm63I+K9U7gwNviuMG7hYsLyUN
 xk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+6/WTdyAE3EQyH87ANnP7ar7wpnTdFTL8+hStig2XI=;
 b=IvTl58G1zmFDz1nxBerfxMYTh863w6PugXyzEfex+345/DWowGWnjVKMnS54uXp/Wx
 4rKui47Zr72H+1juHjOEKzpqHF+D9adKlaNBl9FcgxNcDv6TbxCZYHWX/pzJ2u5KfMUd
 3D9f+52Q57zc57YROLML7pB8z1sGFszKmAaSyFlv94Fb0x1AxTODsN99t0TO7MbBHfTk
 13bDKger4BUgPFVdEtGisQSdgPxB8zap4TBLUPIvlM8FALPig9d5/rICCr4GC6haZam1
 t3m8z/vYYAQu61ObimRvTb7s1hpU/M5d0KCJUQnkuzvrh1u7GMtwV2CIxkZS/pxJ8Onn
 j/wA==
X-Gm-Message-State: ACrzQf0yxRtCPVZJ0gNiRQ7Z6SLs4coMo3hmBI1DkTDdRt0r2nIiR596
 4/XKGuoXX5BU31ERQRUEjPCW70Xj6wGzi+Xix3U7tdaH
X-Google-Smtp-Source: AMsMyM4OOd1Wq5jsS+q1ZHnmCbcToRzs0ee8oaR9Y07skD+KESWF3zrnmSFiVeEyQ4nTcS0HE7IEFbcRSdrwXLNppAE=
X-Received: by 2002:a05:6871:810:b0:132:9a94:6ca3 with SMTP id
 q16-20020a056871081000b001329a946ca3mr3475388oap.183.1665606809674; Wed, 12
 Oct 2022 13:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221008174306.248310-1-konrad.dybcio@somainline.org>
In-Reply-To: <20221008174306.248310-1-konrad.dybcio@somainline.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 12 Oct 2022 13:33:18 -0700
Message-ID: <CAF6AEGv9OtvwcJMFiY104wFLK0Ra1NMNr0jnQrUu89x0R6BcXQ@mail.gmail.com>
Subject: Re: [DNM RFC PATCH] drm/msm: Use lowercase hex for !defines
To: Konrad Dybcio <konrad.dybcio@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jamipkettunen@somainline.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 angelogioacchino.delregno@somainline.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 8, 2022 at 10:43 AM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> drm/msm capitalizes hex numbers rather randomly. Try to unify it.

yeah, there were some different preferences of various patch authors
for shouty HEX vs quiet hex... tbh I prefer the latter, but not really
sure it is worth the noise in git history to change it

BR,
-R

> Generated with:
>
> grep -rEl "\s0x\w*[A-Z]+*\w*" drivers/gpu/drm/msm | \
> xargs sed -i '/define/! s/\s0x\w*[A-Z]+*\w*/\L&/g'
> ---
> I could not find any strict hex capitalization rules for Linux, so
> I'm sending this very loosely, without an S-o-b and as a DNM RFC.
> Funnily enough, this patch somehow broke get_maintainer.pl
>
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c         | 138 +++++++--------
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c         | 164 +++++++++---------
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 126 +++++++-------
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |   2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c       | 128 +++++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  26 +--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |   4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   |   2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  12 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 162 ++++++++---------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  26 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  10 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  16 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  98 +++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  18 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      |   2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      |  28 +--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  |   4 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c             |   8 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c               |   2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.c           |  14 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |   4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c           |   2 +-
>  drivers/gpu/drm/msm/dp/dp_link.c              |  10 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |   4 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |   2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi.c               |   4 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c          |  20 +--
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      |  22 +--
>  36 files changed, 543 insertions(+), 543 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index 6c9a747eb4ad..f207588218c6 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -236,7 +236,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
>         for (i = 1; i < len; i++)
>                 gpu_write(gpu, REG_A2XX_CP_PFP_UCODE_DATA, ptr[i]);
>
> -       gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS, 0x000C0804);
> +       gpu_write(gpu, REG_AXXX_CP_QUEUE_THRESHOLDS, 0x000c0804);
>
>         /* clear ME_HALT to start micro engine */
>         gpu_write(gpu, REG_AXXX_CP_ME_CNTL, 0);
> @@ -335,90 +335,90 @@ static irqreturn_t a2xx_irq(struct msm_gpu *gpu)
>  }
>
>  static const unsigned int a200_registers[] = {
> -       0x0000, 0x0002, 0x0004, 0x000B, 0x003B, 0x003D, 0x0040, 0x0044,
> -       0x0046, 0x0047, 0x01C0, 0x01C1, 0x01C3, 0x01C8, 0x01D5, 0x01D9,
> -       0x01DC, 0x01DD, 0x01EA, 0x01EA, 0x01EE, 0x01F3, 0x01F6, 0x01F7,
> -       0x01FC, 0x01FF, 0x0391, 0x0392, 0x039B, 0x039E, 0x03B2, 0x03B5,
> -       0x03B7, 0x03B7, 0x03F8, 0x03FB, 0x0440, 0x0440, 0x0443, 0x0444,
> -       0x044B, 0x044B, 0x044D, 0x044F, 0x0452, 0x0452, 0x0454, 0x045B,
> -       0x047F, 0x047F, 0x0578, 0x0587, 0x05C9, 0x05C9, 0x05D0, 0x05D0,
> -       0x0601, 0x0604, 0x0606, 0x0609, 0x060B, 0x060E, 0x0613, 0x0614,
> -       0x0A29, 0x0A2B, 0x0A2F, 0x0A31, 0x0A40, 0x0A43, 0x0A45, 0x0A45,
> -       0x0A4E, 0x0A4F, 0x0C2C, 0x0C2C, 0x0C30, 0x0C30, 0x0C38, 0x0C3C,
> -       0x0C40, 0x0C40, 0x0C44, 0x0C44, 0x0C80, 0x0C86, 0x0C88, 0x0C94,
> -       0x0C99, 0x0C9A, 0x0CA4, 0x0CA5, 0x0D00, 0x0D03, 0x0D06, 0x0D06,
> -       0x0D08, 0x0D0B, 0x0D34, 0x0D35, 0x0DAE, 0x0DC1, 0x0DC8, 0x0DD4,
> -       0x0DD8, 0x0DD9, 0x0E00, 0x0E00, 0x0E02, 0x0E04, 0x0E17, 0x0E1E,
> -       0x0EC0, 0x0EC9, 0x0ECB, 0x0ECC, 0x0ED0, 0x0ED0, 0x0ED4, 0x0ED7,
> -       0x0EE0, 0x0EE2, 0x0F01, 0x0F02, 0x0F0C, 0x0F0C, 0x0F0E, 0x0F12,
> -       0x0F26, 0x0F2A, 0x0F2C, 0x0F2C, 0x2000, 0x2002, 0x2006, 0x200F,
> -       0x2080, 0x2082, 0x2100, 0x2109, 0x210C, 0x2114, 0x2180, 0x2184,
> -       0x21F5, 0x21F7, 0x2200, 0x2208, 0x2280, 0x2283, 0x2293, 0x2294,
> -       0x2300, 0x2308, 0x2312, 0x2312, 0x2316, 0x231D, 0x2324, 0x2326,
> -       0x2380, 0x2383, 0x2400, 0x2402, 0x2406, 0x240F, 0x2480, 0x2482,
> -       0x2500, 0x2509, 0x250C, 0x2514, 0x2580, 0x2584, 0x25F5, 0x25F7,
> +       0x0000, 0x0002, 0x0004, 0x000b, 0x003b, 0x003d, 0x0040, 0x0044,
> +       0x0046, 0x0047, 0x01c0, 0x01c1, 0x01c3, 0x01c8, 0x01d5, 0x01d9,
> +       0x01dc, 0x01dd, 0x01ea, 0x01ea, 0x01ee, 0x01f3, 0x01f6, 0x01f7,
> +       0x01fc, 0x01ff, 0x0391, 0x0392, 0x039b, 0x039e, 0x03b2, 0x03b5,
> +       0x03b7, 0x03b7, 0x03f8, 0x03fb, 0x0440, 0x0440, 0x0443, 0x0444,
> +       0x044b, 0x044b, 0x044d, 0x044f, 0x0452, 0x0452, 0x0454, 0x045b,
> +       0x047f, 0x047f, 0x0578, 0x0587, 0x05c9, 0x05c9, 0x05d0, 0x05d0,
> +       0x0601, 0x0604, 0x0606, 0x0609, 0x060b, 0x060e, 0x0613, 0x0614,
> +       0x0a29, 0x0a2b, 0x0a2f, 0x0a31, 0x0a40, 0x0a43, 0x0a45, 0x0a45,
> +       0x0a4e, 0x0a4f, 0x0c2c, 0x0c2c, 0x0c30, 0x0c30, 0x0c38, 0x0c3c,
> +       0x0c40, 0x0c40, 0x0c44, 0x0c44, 0x0c80, 0x0c86, 0x0c88, 0x0c94,
> +       0x0c99, 0x0c9a, 0x0ca4, 0x0ca5, 0x0d00, 0x0d03, 0x0d06, 0x0d06,
> +       0x0d08, 0x0d0b, 0x0d34, 0x0d35, 0x0dae, 0x0dc1, 0x0dc8, 0x0dd4,
> +       0x0dd8, 0x0dd9, 0x0e00, 0x0e00, 0x0e02, 0x0e04, 0x0e17, 0x0e1e,
> +       0x0ec0, 0x0ec9, 0x0ecb, 0x0ecc, 0x0ed0, 0x0ed0, 0x0ed4, 0x0ed7,
> +       0x0ee0, 0x0ee2, 0x0f01, 0x0f02, 0x0f0c, 0x0f0c, 0x0f0e, 0x0f12,
> +       0x0f26, 0x0f2a, 0x0f2c, 0x0f2c, 0x2000, 0x2002, 0x2006, 0x200f,
> +       0x2080, 0x2082, 0x2100, 0x2109, 0x210c, 0x2114, 0x2180, 0x2184,
> +       0x21f5, 0x21f7, 0x2200, 0x2208, 0x2280, 0x2283, 0x2293, 0x2294,
> +       0x2300, 0x2308, 0x2312, 0x2312, 0x2316, 0x231d, 0x2324, 0x2326,
> +       0x2380, 0x2383, 0x2400, 0x2402, 0x2406, 0x240f, 0x2480, 0x2482,
> +       0x2500, 0x2509, 0x250c, 0x2514, 0x2580, 0x2584, 0x25f5, 0x25f7,
>         0x2600, 0x2608, 0x2680, 0x2683, 0x2693, 0x2694, 0x2700, 0x2708,
> -       0x2712, 0x2712, 0x2716, 0x271D, 0x2724, 0x2726, 0x2780, 0x2783,
> +       0x2712, 0x2712, 0x2716, 0x271d, 0x2724, 0x2726, 0x2780, 0x2783,
>         0x4000, 0x4003, 0x4800, 0x4805, 0x4900, 0x4900, 0x4908, 0x4908,
>         ~0   /* sentinel */
>  };
>
>  static const unsigned int a220_registers[] = {
> -       0x0000, 0x0002, 0x0004, 0x000B, 0x003B, 0x003D, 0x0040, 0x0044,
> -       0x0046, 0x0047, 0x01C0, 0x01C1, 0x01C3, 0x01C8, 0x01D5, 0x01D9,
> -       0x01DC, 0x01DD, 0x01EA, 0x01EA, 0x01EE, 0x01F3, 0x01F6, 0x01F7,
> -       0x01FC, 0x01FF, 0x0391, 0x0392, 0x039B, 0x039E, 0x03B2, 0x03B5,
> -       0x03B7, 0x03B7, 0x03F8, 0x03FB, 0x0440, 0x0440, 0x0443, 0x0444,
> -       0x044B, 0x044B, 0x044D, 0x044F, 0x0452, 0x0452, 0x0454, 0x045B,
> -       0x047F, 0x047F, 0x0578, 0x0587, 0x05C9, 0x05C9, 0x05D0, 0x05D0,
> -       0x0601, 0x0604, 0x0606, 0x0609, 0x060B, 0x060E, 0x0613, 0x0614,
> -       0x0A29, 0x0A2B, 0x0A2F, 0x0A31, 0x0A40, 0x0A40, 0x0A42, 0x0A43,
> -       0x0A45, 0x0A45, 0x0A4E, 0x0A4F, 0x0C30, 0x0C30, 0x0C38, 0x0C39,
> -       0x0C3C, 0x0C3C, 0x0C80, 0x0C81, 0x0C88, 0x0C93, 0x0D00, 0x0D03,
> -       0x0D05, 0x0D06, 0x0D08, 0x0D0B, 0x0D34, 0x0D35, 0x0DAE, 0x0DC1,
> -       0x0DC8, 0x0DD4, 0x0DD8, 0x0DD9, 0x0E00, 0x0E00, 0x0E02, 0x0E04,
> -       0x0E17, 0x0E1E, 0x0EC0, 0x0EC9, 0x0ECB, 0x0ECC, 0x0ED0, 0x0ED0,
> -       0x0ED4, 0x0ED7, 0x0EE0, 0x0EE2, 0x0F01, 0x0F02, 0x2000, 0x2002,
> -       0x2006, 0x200F, 0x2080, 0x2082, 0x2100, 0x2102, 0x2104, 0x2109,
> -       0x210C, 0x2114, 0x2180, 0x2184, 0x21F5, 0x21F7, 0x2200, 0x2202,
> +       0x0000, 0x0002, 0x0004, 0x000b, 0x003b, 0x003d, 0x0040, 0x0044,
> +       0x0046, 0x0047, 0x01c0, 0x01c1, 0x01c3, 0x01c8, 0x01d5, 0x01d9,
> +       0x01dc, 0x01dd, 0x01ea, 0x01ea, 0x01ee, 0x01f3, 0x01f6, 0x01f7,
> +       0x01fc, 0x01ff, 0x0391, 0x0392, 0x039b, 0x039e, 0x03b2, 0x03b5,
> +       0x03b7, 0x03b7, 0x03f8, 0x03fb, 0x0440, 0x0440, 0x0443, 0x0444,
> +       0x044b, 0x044b, 0x044d, 0x044f, 0x0452, 0x0452, 0x0454, 0x045b,
> +       0x047f, 0x047f, 0x0578, 0x0587, 0x05c9, 0x05c9, 0x05d0, 0x05d0,
> +       0x0601, 0x0604, 0x0606, 0x0609, 0x060b, 0x060e, 0x0613, 0x0614,
> +       0x0a29, 0x0a2b, 0x0a2f, 0x0a31, 0x0a40, 0x0a40, 0x0a42, 0x0a43,
> +       0x0a45, 0x0a45, 0x0a4e, 0x0a4f, 0x0c30, 0x0c30, 0x0c38, 0x0c39,
> +       0x0c3c, 0x0c3c, 0x0c80, 0x0c81, 0x0c88, 0x0c93, 0x0d00, 0x0d03,
> +       0x0d05, 0x0d06, 0x0d08, 0x0d0b, 0x0d34, 0x0d35, 0x0dae, 0x0dc1,
> +       0x0dc8, 0x0dd4, 0x0dd8, 0x0dd9, 0x0e00, 0x0e00, 0x0e02, 0x0e04,
> +       0x0e17, 0x0e1e, 0x0ec0, 0x0ec9, 0x0ecb, 0x0ecc, 0x0ed0, 0x0ed0,
> +       0x0ed4, 0x0ed7, 0x0ee0, 0x0ee2, 0x0f01, 0x0f02, 0x2000, 0x2002,
> +       0x2006, 0x200f, 0x2080, 0x2082, 0x2100, 0x2102, 0x2104, 0x2109,
> +       0x210c, 0x2114, 0x2180, 0x2184, 0x21f5, 0x21f7, 0x2200, 0x2202,
>         0x2204, 0x2204, 0x2208, 0x2208, 0x2280, 0x2282, 0x2294, 0x2294,
> -       0x2300, 0x2308, 0x2309, 0x230A, 0x2312, 0x2312, 0x2316, 0x2316,
> -       0x2318, 0x231D, 0x2324, 0x2326, 0x2380, 0x2383, 0x2400, 0x2402,
> -       0x2406, 0x240F, 0x2480, 0x2482, 0x2500, 0x2502, 0x2504, 0x2509,
> -       0x250C, 0x2514, 0x2580, 0x2584, 0x25F5, 0x25F7, 0x2600, 0x2602,
> +       0x2300, 0x2308, 0x2309, 0x230a, 0x2312, 0x2312, 0x2316, 0x2316,
> +       0x2318, 0x231d, 0x2324, 0x2326, 0x2380, 0x2383, 0x2400, 0x2402,
> +       0x2406, 0x240f, 0x2480, 0x2482, 0x2500, 0x2502, 0x2504, 0x2509,
> +       0x250c, 0x2514, 0x2580, 0x2584, 0x25f5, 0x25f7, 0x2600, 0x2602,
>         0x2604, 0x2606, 0x2608, 0x2608, 0x2680, 0x2682, 0x2694, 0x2694,
> -       0x2700, 0x2708, 0x2712, 0x2712, 0x2716, 0x2716, 0x2718, 0x271D,
> +       0x2700, 0x2708, 0x2712, 0x2712, 0x2716, 0x2716, 0x2718, 0x271d,
>         0x2724, 0x2726, 0x2780, 0x2783, 0x4000, 0x4003, 0x4800, 0x4805,
>         0x4900, 0x4900, 0x4908, 0x4908,
>         ~0   /* sentinel */
>  };
>
>  static const unsigned int a225_registers[] = {
> -       0x0000, 0x0002, 0x0004, 0x000B, 0x003B, 0x003D, 0x0040, 0x0044,
> -       0x0046, 0x0047, 0x013C, 0x013C, 0x0140, 0x014F, 0x01C0, 0x01C1,
> -       0x01C3, 0x01C8, 0x01D5, 0x01D9, 0x01DC, 0x01DD, 0x01EA, 0x01EA,
> -       0x01EE, 0x01F3, 0x01F6, 0x01F7, 0x01FC, 0x01FF, 0x0391, 0x0392,
> -       0x039B, 0x039E, 0x03B2, 0x03B5, 0x03B7, 0x03B7, 0x03F8, 0x03FB,
> -       0x0440, 0x0440, 0x0443, 0x0444, 0x044B, 0x044B, 0x044D, 0x044F,
> -       0x0452, 0x0452, 0x0454, 0x045B, 0x047F, 0x047F, 0x0578, 0x0587,
> -       0x05C9, 0x05C9, 0x05D0, 0x05D0, 0x0601, 0x0604, 0x0606, 0x0609,
> -       0x060B, 0x060E, 0x0613, 0x0614, 0x0A29, 0x0A2B, 0x0A2F, 0x0A31,
> -       0x0A40, 0x0A40, 0x0A42, 0x0A43, 0x0A45, 0x0A45, 0x0A4E, 0x0A4F,
> -       0x0C01, 0x0C1D, 0x0C30, 0x0C30, 0x0C38, 0x0C39, 0x0C3C, 0x0C3C,
> -       0x0C80, 0x0C81, 0x0C88, 0x0C93, 0x0D00, 0x0D03, 0x0D05, 0x0D06,
> -       0x0D08, 0x0D0B, 0x0D34, 0x0D35, 0x0DAE, 0x0DC1, 0x0DC8, 0x0DD4,
> -       0x0DD8, 0x0DD9, 0x0E00, 0x0E00, 0x0E02, 0x0E04, 0x0E17, 0x0E1E,
> -       0x0EC0, 0x0EC9, 0x0ECB, 0x0ECC, 0x0ED0, 0x0ED0, 0x0ED4, 0x0ED7,
> -       0x0EE0, 0x0EE2, 0x0F01, 0x0F02, 0x2000, 0x200F, 0x2080, 0x2082,
> -       0x2100, 0x2109, 0x210C, 0x2114, 0x2180, 0x2184, 0x21F5, 0x21F7,
> +       0x0000, 0x0002, 0x0004, 0x000b, 0x003b, 0x003d, 0x0040, 0x0044,
> +       0x0046, 0x0047, 0x013c, 0x013c, 0x0140, 0x014f, 0x01c0, 0x01c1,
> +       0x01c3, 0x01c8, 0x01d5, 0x01d9, 0x01dc, 0x01dd, 0x01ea, 0x01ea,
> +       0x01ee, 0x01f3, 0x01f6, 0x01f7, 0x01fc, 0x01ff, 0x0391, 0x0392,
> +       0x039b, 0x039e, 0x03b2, 0x03b5, 0x03b7, 0x03b7, 0x03f8, 0x03fb,
> +       0x0440, 0x0440, 0x0443, 0x0444, 0x044b, 0x044b, 0x044d, 0x044f,
> +       0x0452, 0x0452, 0x0454, 0x045b, 0x047f, 0x047f, 0x0578, 0x0587,
> +       0x05c9, 0x05c9, 0x05d0, 0x05d0, 0x0601, 0x0604, 0x0606, 0x0609,
> +       0x060b, 0x060e, 0x0613, 0x0614, 0x0a29, 0x0a2b, 0x0a2f, 0x0a31,
> +       0x0a40, 0x0a40, 0x0a42, 0x0a43, 0x0a45, 0x0a45, 0x0a4e, 0x0a4f,
> +       0x0c01, 0x0c1d, 0x0c30, 0x0c30, 0x0c38, 0x0c39, 0x0c3c, 0x0c3c,
> +       0x0c80, 0x0c81, 0x0c88, 0x0c93, 0x0d00, 0x0d03, 0x0d05, 0x0d06,
> +       0x0d08, 0x0d0b, 0x0d34, 0x0d35, 0x0dae, 0x0dc1, 0x0dc8, 0x0dd4,
> +       0x0dd8, 0x0dd9, 0x0e00, 0x0e00, 0x0e02, 0x0e04, 0x0e17, 0x0e1e,
> +       0x0ec0, 0x0ec9, 0x0ecb, 0x0ecc, 0x0ed0, 0x0ed0, 0x0ed4, 0x0ed7,
> +       0x0ee0, 0x0ee2, 0x0f01, 0x0f02, 0x2000, 0x200f, 0x2080, 0x2082,
> +       0x2100, 0x2109, 0x210c, 0x2114, 0x2180, 0x2184, 0x21f5, 0x21f7,
>         0x2200, 0x2202, 0x2204, 0x2206, 0x2208, 0x2210, 0x2220, 0x2222,
> -       0x2280, 0x2282, 0x2294, 0x2294, 0x2297, 0x2297, 0x2300, 0x230A,
> -       0x2312, 0x2312, 0x2315, 0x2316, 0x2318, 0x231D, 0x2324, 0x2326,
> -       0x2340, 0x2357, 0x2360, 0x2360, 0x2380, 0x2383, 0x2400, 0x240F,
> -       0x2480, 0x2482, 0x2500, 0x2509, 0x250C, 0x2514, 0x2580, 0x2584,
> -       0x25F5, 0x25F7, 0x2600, 0x2602, 0x2604, 0x2606, 0x2608, 0x2610,
> +       0x2280, 0x2282, 0x2294, 0x2294, 0x2297, 0x2297, 0x2300, 0x230a,
> +       0x2312, 0x2312, 0x2315, 0x2316, 0x2318, 0x231d, 0x2324, 0x2326,
> +       0x2340, 0x2357, 0x2360, 0x2360, 0x2380, 0x2383, 0x2400, 0x240f,
> +       0x2480, 0x2482, 0x2500, 0x2509, 0x250c, 0x2514, 0x2580, 0x2584,
> +       0x25f5, 0x25f7, 0x2600, 0x2602, 0x2604, 0x2606, 0x2608, 0x2610,
>         0x2620, 0x2622, 0x2680, 0x2682, 0x2694, 0x2694, 0x2697, 0x2697,
> -       0x2700, 0x270A, 0x2712, 0x2712, 0x2715, 0x2716, 0x2718, 0x271D,
> +       0x2700, 0x270a, 0x2712, 0x2712, 0x2715, 0x2716, 0x2718, 0x271d,
>         0x2724, 0x2726, 0x2740, 0x2757, 0x2760, 0x2760, 0x2780, 0x2783,
>         0x4000, 0x4003, 0x4800, 0x4806, 0x4808, 0x4808, 0x4900, 0x4900,
>         0x4908, 0x4908,
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index 7cb8d9849c07..9a63404efd11 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -82,7 +82,7 @@ static void a4xx_enable_hwcg(struct msm_gpu *gpu)
>         for (i = 0; i < 4; i++)
>                 gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL2_TP(i), 0x00002222);
>         for (i = 0; i < 4; i++)
> -               gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_TP(i), 0x0E739CE7);
> +               gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_TP(i), 0x0e739ce7);
>         for (i = 0; i < 4; i++)
>                 gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_TP(i), 0x00111111);
>         for (i = 0; i < 4; i++)
> @@ -135,7 +135,7 @@ static void a4xx_enable_hwcg(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_GPC, 0x04100104);
>         gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_GPC, 0x00022222);
>         gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL_COM_DCOM, 0x00000022);
> -       gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_COM_DCOM, 0x0000010F);
> +       gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_COM_DCOM, 0x0000010f);
>         gpu_write(gpu, REG_A4XX_RBBM_CLOCK_DELAY_COM_DCOM, 0x00000022);
>         gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL_TSE_RAS_RBBM, 0x00222222);
>         gpu_write(gpu, REG_A4XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00004104);
> @@ -148,7 +148,7 @@ static void a4xx_enable_hwcg(struct msm_gpu *gpu)
>         if (adreno_is_a430(adreno_gpu) && adreno_gpu->rev.patchid < 2)
>                 gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL, 0);
>         else
> -               gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL, 0xAAAAAAAA);
> +               gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
>         gpu_write(gpu, REG_A4XX_RBBM_CLOCK_CTL2, 0);
>  }
>
> @@ -190,8 +190,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>         if (adreno_is_a405(adreno_gpu)) {
>                 gpu_write(gpu, REG_A4XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
>         } else if (adreno_is_a420(adreno_gpu)) {
> -               gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT, 0x0001001F);
> -               gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT_CONF, 0x000000A4);
> +               gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT, 0x0001001f);
> +               gpu_write(gpu, REG_A4XX_VBIF_ABIT_SORT_CONF, 0x000000a4);
>                 gpu_write(gpu, REG_A4XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000001);
>                 gpu_write(gpu, REG_A4XX_VBIF_IN_RD_LIM_CONF0, 0x18181818);
>                 gpu_write(gpu, REG_A4XX_VBIF_IN_RD_LIM_CONF1, 0x00000018);
> @@ -234,7 +234,7 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>          * into the RBBM registers on a hang:
>          */
>         gpu_write(gpu, REG_A4XX_RBBM_INTERFACE_HANG_INT_CTL,
> -                       (1 << 30) | 0xFFFF);
> +                       (1 << 30) | 0xffff);
>
>         gpu_write(gpu, REG_A4XX_RB_GMEM_BASE_ADDR,
>                         (unsigned int)(a4xx_gpu->ocmem.base >> 14));
> @@ -410,7 +410,7 @@ static irqreturn_t a4xx_irq(struct msm_gpu *gpu)
>                 uint32_t reg = gpu_read(gpu, REG_A4XX_CP_PROTECT_STATUS);
>                 printk("CP | Protected mode error| %s | addr=%x\n",
>                         reg & (1 << 24) ? "WRITE" : "READ",
> -                       (reg & 0xFFFFF) >> 2);
> +                       (reg & 0xfffff) >> 2);
>         }
>
>         gpu_write(gpu, REG_A4XX_RBBM_INT_CLEAR_CMD, status);
> @@ -423,128 +423,128 @@ static irqreturn_t a4xx_irq(struct msm_gpu *gpu)
>  static const unsigned int a4xx_registers[] = {
>         /* RBBM */
>         0x0000, 0x0002, 0x0004, 0x0021, 0x0023, 0x0024, 0x0026, 0x0026,
> -       0x0028, 0x002B, 0x002E, 0x0034, 0x0037, 0x0044, 0x0047, 0x0066,
> -       0x0068, 0x0095, 0x009C, 0x0170, 0x0174, 0x01AF,
> +       0x0028, 0x002b, 0x002e, 0x0034, 0x0037, 0x0044, 0x0047, 0x0066,
> +       0x0068, 0x0095, 0x009c, 0x0170, 0x0174, 0x01af,
>         /* CP */
> -       0x0200, 0x0233, 0x0240, 0x0250, 0x04C0, 0x04DD, 0x0500, 0x050B,
> -       0x0578, 0x058F,
> +       0x0200, 0x0233, 0x0240, 0x0250, 0x04c0, 0x04dd, 0x0500, 0x050b,
> +       0x0578, 0x058f,
>         /* VSC */
> -       0x0C00, 0x0C03, 0x0C08, 0x0C41, 0x0C50, 0x0C51,
> +       0x0c00, 0x0c03, 0x0c08, 0x0c41, 0x0c50, 0x0c51,
>         /* GRAS */
> -       0x0C80, 0x0C81, 0x0C88, 0x0C8F,
> +       0x0c80, 0x0c81, 0x0c88, 0x0c8f,
>         /* RB */
> -       0x0CC0, 0x0CC0, 0x0CC4, 0x0CD2,
> +       0x0cc0, 0x0cc0, 0x0cc4, 0x0cd2,
>         /* PC */
> -       0x0D00, 0x0D0C, 0x0D10, 0x0D17, 0x0D20, 0x0D23,
> +       0x0d00, 0x0d0c, 0x0d10, 0x0d17, 0x0d20, 0x0d23,
>         /* VFD */
> -       0x0E40, 0x0E4A,
> +       0x0e40, 0x0e4a,
>         /* VPC */
> -       0x0E60, 0x0E61, 0x0E63, 0x0E68,
> +       0x0e60, 0x0e61, 0x0e63, 0x0e68,
>         /* UCHE */
> -       0x0E80, 0x0E84, 0x0E88, 0x0E95,
> +       0x0e80, 0x0e84, 0x0e88, 0x0e95,
>         /* VMIDMT */
> -       0x1000, 0x1000, 0x1002, 0x1002, 0x1004, 0x1004, 0x1008, 0x100A,
> -       0x100C, 0x100D, 0x100F, 0x1010, 0x1012, 0x1016, 0x1024, 0x1024,
> +       0x1000, 0x1000, 0x1002, 0x1002, 0x1004, 0x1004, 0x1008, 0x100a,
> +       0x100c, 0x100d, 0x100f, 0x1010, 0x1012, 0x1016, 0x1024, 0x1024,
>         0x1027, 0x1027, 0x1100, 0x1100, 0x1102, 0x1102, 0x1104, 0x1104,
>         0x1110, 0x1110, 0x1112, 0x1116, 0x1124, 0x1124, 0x1300, 0x1300,
>         0x1380, 0x1380,
>         /* GRAS CTX 0 */
> -       0x2000, 0x2004, 0x2008, 0x2067, 0x2070, 0x2078, 0x207B, 0x216E,
> +       0x2000, 0x2004, 0x2008, 0x2067, 0x2070, 0x2078, 0x207b, 0x216e,
>         /* PC CTX 0 */
> -       0x21C0, 0x21C6, 0x21D0, 0x21D0, 0x21D9, 0x21D9, 0x21E5, 0x21E7,
> +       0x21c0, 0x21c6, 0x21d0, 0x21d0, 0x21d9, 0x21d9, 0x21e5, 0x21e7,
>         /* VFD CTX 0 */
> -       0x2200, 0x2204, 0x2208, 0x22A9,
> +       0x2200, 0x2204, 0x2208, 0x22a9,
>         /* GRAS CTX 1 */
> -       0x2400, 0x2404, 0x2408, 0x2467, 0x2470, 0x2478, 0x247B, 0x256E,
> +       0x2400, 0x2404, 0x2408, 0x2467, 0x2470, 0x2478, 0x247b, 0x256e,
>         /* PC CTX 1 */
> -       0x25C0, 0x25C6, 0x25D0, 0x25D0, 0x25D9, 0x25D9, 0x25E5, 0x25E7,
> +       0x25c0, 0x25c6, 0x25d0, 0x25d0, 0x25d9, 0x25d9, 0x25e5, 0x25e7,
>         /* VFD CTX 1 */
> -       0x2600, 0x2604, 0x2608, 0x26A9,
> +       0x2600, 0x2604, 0x2608, 0x26a9,
>         /* XPU */
> -       0x2C00, 0x2C01, 0x2C10, 0x2C10, 0x2C12, 0x2C16, 0x2C1D, 0x2C20,
> -       0x2C28, 0x2C28, 0x2C30, 0x2C30, 0x2C32, 0x2C36, 0x2C40, 0x2C40,
> -       0x2C50, 0x2C50, 0x2C52, 0x2C56, 0x2C80, 0x2C80, 0x2C94, 0x2C95,
> +       0x2c00, 0x2c01, 0x2c10, 0x2c10, 0x2c12, 0x2c16, 0x2c1d, 0x2c20,
> +       0x2c28, 0x2c28, 0x2c30, 0x2c30, 0x2c32, 0x2c36, 0x2c40, 0x2c40,
> +       0x2c50, 0x2c50, 0x2c52, 0x2c56, 0x2c80, 0x2c80, 0x2c94, 0x2c95,
>         /* VBIF */
> -       0x3000, 0x3007, 0x300C, 0x3014, 0x3018, 0x301D, 0x3020, 0x3022,
> -       0x3024, 0x3026, 0x3028, 0x302A, 0x302C, 0x302D, 0x3030, 0x3031,
> -       0x3034, 0x3036, 0x3038, 0x3038, 0x303C, 0x303D, 0x3040, 0x3040,
> -       0x3049, 0x3049, 0x3058, 0x3058, 0x305B, 0x3061, 0x3064, 0x3068,
> -       0x306C, 0x306D, 0x3080, 0x3088, 0x308B, 0x308C, 0x3090, 0x3094,
> -       0x3098, 0x3098, 0x309C, 0x309C, 0x30C0, 0x30C0, 0x30C8, 0x30C8,
> -       0x30D0, 0x30D0, 0x30D8, 0x30D8, 0x30E0, 0x30E0, 0x3100, 0x3100,
> +       0x3000, 0x3007, 0x300c, 0x3014, 0x3018, 0x301d, 0x3020, 0x3022,
> +       0x3024, 0x3026, 0x3028, 0x302a, 0x302c, 0x302d, 0x3030, 0x3031,
> +       0x3034, 0x3036, 0x3038, 0x3038, 0x303c, 0x303d, 0x3040, 0x3040,
> +       0x3049, 0x3049, 0x3058, 0x3058, 0x305b, 0x3061, 0x3064, 0x3068,
> +       0x306c, 0x306d, 0x3080, 0x3088, 0x308b, 0x308c, 0x3090, 0x3094,
> +       0x3098, 0x3098, 0x309c, 0x309c, 0x30c0, 0x30c0, 0x30c8, 0x30c8,
> +       0x30d0, 0x30d0, 0x30d8, 0x30d8, 0x30e0, 0x30e0, 0x3100, 0x3100,
>         0x3108, 0x3108, 0x3110, 0x3110, 0x3118, 0x3118, 0x3120, 0x3120,
> -       0x3124, 0x3125, 0x3129, 0x3129, 0x3131, 0x3131, 0x330C, 0x330C,
> +       0x3124, 0x3125, 0x3129, 0x3129, 0x3131, 0x3131, 0x330c, 0x330c,
>         0x3310, 0x3310, 0x3400, 0x3401, 0x3410, 0x3410, 0x3412, 0x3416,
> -       0x341D, 0x3420, 0x3428, 0x3428, 0x3430, 0x3430, 0x3432, 0x3436,
> +       0x341d, 0x3420, 0x3428, 0x3428, 0x3430, 0x3430, 0x3432, 0x3436,
>         0x3440, 0x3440, 0x3450, 0x3450, 0x3452, 0x3456, 0x3480, 0x3480,
>         0x3494, 0x3495, 0x4000, 0x4000, 0x4002, 0x4002, 0x4004, 0x4004,
> -       0x4008, 0x400A, 0x400C, 0x400D, 0x400F, 0x4012, 0x4014, 0x4016,
> -       0x401D, 0x401D, 0x4020, 0x4027, 0x4060, 0x4062, 0x4200, 0x4200,
> +       0x4008, 0x400a, 0x400c, 0x400d, 0x400f, 0x4012, 0x4014, 0x4016,
> +       0x401d, 0x401d, 0x4020, 0x4027, 0x4060, 0x4062, 0x4200, 0x4200,
>         0x4300, 0x4300, 0x4400, 0x4400, 0x4500, 0x4500, 0x4800, 0x4802,
> -       0x480F, 0x480F, 0x4811, 0x4811, 0x4813, 0x4813, 0x4815, 0x4816,
> -       0x482B, 0x482B, 0x4857, 0x4857, 0x4883, 0x4883, 0x48AF, 0x48AF,
> -       0x48C5, 0x48C5, 0x48E5, 0x48E5, 0x4905, 0x4905, 0x4925, 0x4925,
> -       0x4945, 0x4945, 0x4950, 0x4950, 0x495B, 0x495B, 0x4980, 0x498E,
> -       0x4B00, 0x4B00, 0x4C00, 0x4C00, 0x4D00, 0x4D00, 0x4E00, 0x4E00,
> -       0x4E80, 0x4E80, 0x4F00, 0x4F00, 0x4F08, 0x4F08, 0x4F10, 0x4F10,
> -       0x4F18, 0x4F18, 0x4F20, 0x4F20, 0x4F30, 0x4F30, 0x4F60, 0x4F60,
> -       0x4F80, 0x4F81, 0x4F88, 0x4F89, 0x4FEE, 0x4FEE, 0x4FF3, 0x4FF3,
> -       0x6000, 0x6001, 0x6008, 0x600F, 0x6014, 0x6016, 0x6018, 0x601B,
> -       0x61FD, 0x61FD, 0x623C, 0x623C, 0x6380, 0x6380, 0x63A0, 0x63A0,
> -       0x63C0, 0x63C1, 0x63C8, 0x63C9, 0x63D0, 0x63D4, 0x63D6, 0x63D6,
> -       0x63EE, 0x63EE, 0x6400, 0x6401, 0x6408, 0x640F, 0x6414, 0x6416,
> -       0x6418, 0x641B, 0x65FD, 0x65FD, 0x663C, 0x663C, 0x6780, 0x6780,
> -       0x67A0, 0x67A0, 0x67C0, 0x67C1, 0x67C8, 0x67C9, 0x67D0, 0x67D4,
> -       0x67D6, 0x67D6, 0x67EE, 0x67EE, 0x6800, 0x6801, 0x6808, 0x680F,
> -       0x6814, 0x6816, 0x6818, 0x681B, 0x69FD, 0x69FD, 0x6A3C, 0x6A3C,
> -       0x6B80, 0x6B80, 0x6BA0, 0x6BA0, 0x6BC0, 0x6BC1, 0x6BC8, 0x6BC9,
> -       0x6BD0, 0x6BD4, 0x6BD6, 0x6BD6, 0x6BEE, 0x6BEE,
> +       0x480f, 0x480f, 0x4811, 0x4811, 0x4813, 0x4813, 0x4815, 0x4816,
> +       0x482b, 0x482b, 0x4857, 0x4857, 0x4883, 0x4883, 0x48af, 0x48af,
> +       0x48c5, 0x48c5, 0x48e5, 0x48e5, 0x4905, 0x4905, 0x4925, 0x4925,
> +       0x4945, 0x4945, 0x4950, 0x4950, 0x495b, 0x495b, 0x4980, 0x498e,
> +       0x4b00, 0x4b00, 0x4c00, 0x4c00, 0x4d00, 0x4d00, 0x4e00, 0x4e00,
> +       0x4e80, 0x4e80, 0x4f00, 0x4f00, 0x4f08, 0x4f08, 0x4f10, 0x4f10,
> +       0x4f18, 0x4f18, 0x4f20, 0x4f20, 0x4f30, 0x4f30, 0x4f60, 0x4f60,
> +       0x4f80, 0x4f81, 0x4f88, 0x4f89, 0x4fee, 0x4fee, 0x4ff3, 0x4ff3,
> +       0x6000, 0x6001, 0x6008, 0x600f, 0x6014, 0x6016, 0x6018, 0x601b,
> +       0x61fd, 0x61fd, 0x623c, 0x623c, 0x6380, 0x6380, 0x63a0, 0x63a0,
> +       0x63c0, 0x63c1, 0x63c8, 0x63c9, 0x63d0, 0x63d4, 0x63d6, 0x63d6,
> +       0x63ee, 0x63ee, 0x6400, 0x6401, 0x6408, 0x640f, 0x6414, 0x6416,
> +       0x6418, 0x641b, 0x65fd, 0x65fd, 0x663c, 0x663c, 0x6780, 0x6780,
> +       0x67a0, 0x67a0, 0x67c0, 0x67c1, 0x67c8, 0x67c9, 0x67d0, 0x67d4,
> +       0x67d6, 0x67d6, 0x67ee, 0x67ee, 0x6800, 0x6801, 0x6808, 0x680f,
> +       0x6814, 0x6816, 0x6818, 0x681b, 0x69fd, 0x69fd, 0x6a3c, 0x6a3c,
> +       0x6b80, 0x6b80, 0x6ba0, 0x6ba0, 0x6bc0, 0x6bc1, 0x6bc8, 0x6bc9,
> +       0x6bd0, 0x6bd4, 0x6bd6, 0x6bd6, 0x6bee, 0x6bee,
>         ~0 /* sentinel */
>  };
>
>  static const unsigned int a405_registers[] = {
>         /* RBBM */
>         0x0000, 0x0002, 0x0004, 0x0021, 0x0023, 0x0024, 0x0026, 0x0026,
> -       0x0028, 0x002B, 0x002E, 0x0034, 0x0037, 0x0044, 0x0047, 0x0066,
> -       0x0068, 0x0095, 0x009C, 0x0170, 0x0174, 0x01AF,
> +       0x0028, 0x002b, 0x002e, 0x0034, 0x0037, 0x0044, 0x0047, 0x0066,
> +       0x0068, 0x0095, 0x009c, 0x0170, 0x0174, 0x01af,
>         /* CP */
> -       0x0200, 0x0233, 0x0240, 0x0250, 0x04C0, 0x04DD, 0x0500, 0x050B,
> -       0x0578, 0x058F,
> +       0x0200, 0x0233, 0x0240, 0x0250, 0x04c0, 0x04dd, 0x0500, 0x050b,
> +       0x0578, 0x058f,
>         /* VSC */
> -       0x0C00, 0x0C03, 0x0C08, 0x0C41, 0x0C50, 0x0C51,
> +       0x0c00, 0x0c03, 0x0c08, 0x0c41, 0x0c50, 0x0c51,
>         /* GRAS */
> -       0x0C80, 0x0C81, 0x0C88, 0x0C8F,
> +       0x0c80, 0x0c81, 0x0c88, 0x0c8f,
>         /* RB */
> -       0x0CC0, 0x0CC0, 0x0CC4, 0x0CD2,
> +       0x0cc0, 0x0cc0, 0x0cc4, 0x0cd2,
>         /* PC */
> -       0x0D00, 0x0D0C, 0x0D10, 0x0D17, 0x0D20, 0x0D23,
> +       0x0d00, 0x0d0c, 0x0d10, 0x0d17, 0x0d20, 0x0d23,
>         /* VFD */
> -       0x0E40, 0x0E4A,
> +       0x0e40, 0x0e4a,
>         /* VPC */
> -       0x0E60, 0x0E61, 0x0E63, 0x0E68,
> +       0x0e60, 0x0e61, 0x0e63, 0x0e68,
>         /* UCHE */
> -       0x0E80, 0x0E84, 0x0E88, 0x0E95,
> +       0x0e80, 0x0e84, 0x0e88, 0x0e95,
>         /* GRAS CTX 0 */
> -       0x2000, 0x2004, 0x2008, 0x2067, 0x2070, 0x2078, 0x207B, 0x216E,
> +       0x2000, 0x2004, 0x2008, 0x2067, 0x2070, 0x2078, 0x207b, 0x216e,
>         /* PC CTX 0 */
> -       0x21C0, 0x21C6, 0x21D0, 0x21D0, 0x21D9, 0x21D9, 0x21E5, 0x21E7,
> +       0x21c0, 0x21c6, 0x21d0, 0x21d0, 0x21d9, 0x21d9, 0x21e5, 0x21e7,
>         /* VFD CTX 0 */
> -       0x2200, 0x2204, 0x2208, 0x22A9,
> +       0x2200, 0x2204, 0x2208, 0x22a9,
>         /* GRAS CTX 1 */
> -       0x2400, 0x2404, 0x2408, 0x2467, 0x2470, 0x2478, 0x247B, 0x256E,
> +       0x2400, 0x2404, 0x2408, 0x2467, 0x2470, 0x2478, 0x247b, 0x256e,
>         /* PC CTX 1 */
> -       0x25C0, 0x25C6, 0x25D0, 0x25D0, 0x25D9, 0x25D9, 0x25E5, 0x25E7,
> +       0x25c0, 0x25c6, 0x25d0, 0x25d0, 0x25d9, 0x25d9, 0x25e5, 0x25e7,
>         /* VFD CTX 1 */
> -       0x2600, 0x2604, 0x2608, 0x26A9,
> +       0x2600, 0x2604, 0x2608, 0x26a9,
>         /* VBIF version 0x20050000*/
> -       0x3000, 0x3007, 0x302C, 0x302C, 0x3030, 0x3030, 0x3034, 0x3036,
> -       0x3038, 0x3038, 0x303C, 0x303D, 0x3040, 0x3040, 0x3049, 0x3049,
> -       0x3058, 0x3058, 0x305B, 0x3061, 0x3064, 0x3068, 0x306C, 0x306D,
> -       0x3080, 0x3088, 0x308B, 0x308C, 0x3090, 0x3094, 0x3098, 0x3098,
> -       0x309C, 0x309C, 0x30C0, 0x30C0, 0x30C8, 0x30C8, 0x30D0, 0x30D0,
> -       0x30D8, 0x30D8, 0x30E0, 0x30E0, 0x3100, 0x3100, 0x3108, 0x3108,
> +       0x3000, 0x3007, 0x302c, 0x302c, 0x3030, 0x3030, 0x3034, 0x3036,
> +       0x3038, 0x3038, 0x303c, 0x303d, 0x3040, 0x3040, 0x3049, 0x3049,
> +       0x3058, 0x3058, 0x305b, 0x3061, 0x3064, 0x3068, 0x306c, 0x306d,
> +       0x3080, 0x3088, 0x308b, 0x308c, 0x3090, 0x3094, 0x3098, 0x3098,
> +       0x309c, 0x309c, 0x30c0, 0x30c0, 0x30c8, 0x30c8, 0x30d0, 0x30d0,
> +       0x30d8, 0x30d8, 0x30e0, 0x30e0, 0x3100, 0x3100, 0x3108, 0x3108,
>         0x3110, 0x3110, 0x3118, 0x3118, 0x3120, 0x3120, 0x3124, 0x3125,
> -       0x3129, 0x3129, 0x340C, 0x340C, 0x3410, 0x3410,
> +       0x3129, 0x3129, 0x340c, 0x340c, 0x3410, 0x3410,
>         ~0 /* sentinel */
>  };
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 3dcec7acb384..f60879429922 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -251,10 +251,10 @@ static const struct adreno_five_hwcg_regs {
>         {REG_A5XX_RBBM_CLOCK_CNTL2_SP1, 0x02222220},
>         {REG_A5XX_RBBM_CLOCK_CNTL2_SP2, 0x02222220},
>         {REG_A5XX_RBBM_CLOCK_CNTL2_SP3, 0x02222220},
> -       {REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> -       {REG_A5XX_RBBM_CLOCK_HYST_SP1, 0x0000F3CF},
> -       {REG_A5XX_RBBM_CLOCK_HYST_SP2, 0x0000F3CF},
> -       {REG_A5XX_RBBM_CLOCK_HYST_SP3, 0x0000F3CF},
> +       {REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
> +       {REG_A5XX_RBBM_CLOCK_HYST_SP1, 0x0000f3cf},
> +       {REG_A5XX_RBBM_CLOCK_HYST_SP2, 0x0000f3cf},
> +       {REG_A5XX_RBBM_CLOCK_HYST_SP3, 0x0000f3cf},
>         {REG_A5XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
>         {REG_A5XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
>         {REG_A5XX_RBBM_CLOCK_DELAY_SP2, 0x00000080},
> @@ -338,7 +338,7 @@ static const struct adreno_five_hwcg_regs {
>  }, a50x_hwcg[] = {
>         {REG_A5XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
>         {REG_A5XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> -       {REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +       {REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
>         {REG_A5XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
>         {REG_A5XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
>         {REG_A5XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> @@ -353,7 +353,7 @@ static const struct adreno_five_hwcg_regs {
>         {REG_A5XX_RBBM_CLOCK_CNTL3_UCHE, 0x22222222},
>         {REG_A5XX_RBBM_CLOCK_CNTL4_UCHE, 0x00222222},
>         {REG_A5XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
> -       {REG_A5XX_RBBM_CLOCK_HYST_UCHE, 0x00FFFFF4},
> +       {REG_A5XX_RBBM_CLOCK_HYST_UCHE, 0x00fffff4},
>         {REG_A5XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
>         {REG_A5XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
>         {REG_A5XX_RBBM_CLOCK_CNTL2_RB0, 0x00222222},
> @@ -379,8 +379,8 @@ static const struct adreno_five_hwcg_regs {
>         {REG_A5XX_RBBM_CLOCK_CNTL_SP1, 0x02222222},
>         {REG_A5XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>         {REG_A5XX_RBBM_CLOCK_CNTL2_SP1, 0x02222220},
> -       {REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> -       {REG_A5XX_RBBM_CLOCK_HYST_SP1, 0x0000F3CF},
> +       {REG_A5XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
> +       {REG_A5XX_RBBM_CLOCK_HYST_SP1, 0x0000f3cf},
>         {REG_A5XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
>         {REG_A5XX_RBBM_CLOCK_DELAY_SP1, 0x00000080},
>         {REG_A5XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> @@ -459,7 +459,7 @@ void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
>                 gpu_write(gpu, REG_A5XX_RBBM_CLOCK_HYST_GPMU, state ? 0x00000004 : 0);
>         }
>
> -       gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, state ? 0xAAA8AA00 : 0);
> +       gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, state ? 0xaaa8aa00 : 0);
>         gpu_write(gpu, REG_A5XX_RBBM_ISDB_CNT, state ? 0x182 : 0x180);
>  }
>
> @@ -470,7 +470,7 @@ static int a5xx_me_init(struct msm_gpu *gpu)
>
>         OUT_PKT7(ring, CP_ME_INIT, 8);
>
> -       OUT_RING(ring, 0x0000002F);
> +       OUT_RING(ring, 0x0000002f);
>
>         /* Enable multiple hardware contexts */
>         OUT_RING(ring, 0x00000003);
> @@ -488,7 +488,7 @@ static int a5xx_me_init(struct msm_gpu *gpu)
>                  * Force a WFI after every direct-render 3D mode draw and every
>                  * 2D mode 3 draw
>                  */
> -               OUT_RING(ring, 0x0000000B);
> +               OUT_RING(ring, 0x0000000b);
>         } else if (adreno_is_a510(adreno_gpu)) {
>                 /* Workaround for token and syncs */
>                 OUT_RING(ring, 0x00000001);
> @@ -681,7 +681,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A5XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
>
>         /* Make all blocks contribute to the GPU BUSY perf counter */
> -       gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xFFFFFFFF);
> +       gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
>
>         /* Enable RBBM error reporting bits */
>         gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL0, 0x00000001);
> @@ -693,26 +693,26 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>                  */
>
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL11,
> -                       0xF0000000);
> +                       0xf0000000);
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL12,
> -                       0xFFFFFFFF);
> +                       0xffffffff);
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL13,
> -                       0xFFFFFFFF);
> +                       0xffffffff);
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL14,
> -                       0xFFFFFFFF);
> +                       0xffffffff);
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL15,
> -                       0xFFFFFFFF);
> +                       0xffffffff);
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL16,
> -                       0xFFFFFFFF);
> +                       0xffffffff);
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL17,
> -                       0xFFFFFFFF);
> +                       0xffffffff);
>                 gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_MASK_CNTL18,
> -                       0xFFFFFFFF);
> +                       0xffffffff);
>         }
>
>         /* Enable fault detection */
>         gpu_write(gpu, REG_A5XX_RBBM_INTERFACE_HANG_INT_CNTL,
> -               (1 << 30) | 0xFFFF);
> +               (1 << 30) | 0xffff);
>
>         /* Turn on performance counters */
>         gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_CNTL, 0x01);
> @@ -727,10 +727,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>
>         /* Disable L2 bypass in the UCHE */
> -       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
> -       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
> -       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
> -       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
> +       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xffff0000);
> +       gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001ffff);
> +       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xffff0000);
> +       gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
>
>         /* Set the GMEM VA range (0 to gpu->gmem) */
>         gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
> @@ -747,7 +747,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>                 else
>                         gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
>                 gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
> -               gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
> +               gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100d0a);
>         } else {
>                 gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
>                 if (adreno_is_a530(adreno_gpu))
> @@ -755,7 +755,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>                 else
>                         gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
>                 gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
> -               gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
> +               gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201b16);
>         }
>
>         if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu))
> @@ -787,7 +787,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
>
>         /* Enable ME/PFP split notification */
> -       gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL1, 0xA6FFFFFF);
> +       gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL1, 0xa6ffffff);
>
>         /*
>          *  In A5x, CCU can send context_done event of a particular context to
> @@ -805,7 +805,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>         /* Enable HWCG */
>         a5xx_set_hwcg(gpu, true);
>
> -       gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
> +       gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003f);
>
>         /* Set the highest bank bit */
>         if (adreno_is_a540(adreno_gpu))
> @@ -1147,7 +1147,7 @@ static void a5xx_cp_err_irq(struct msm_gpu *gpu)
>                 dev_err_ratelimited(gpu->dev->dev,
>                         "CP | protected mode error | %s | addr=0x%8.8X | status=0x%8.8X\n",
>                         val & (1 << 24) ? "WRITE" : "READ",
> -                       (val & 0xFFFFF) >> 2, val);
> +                       (val & 0xfffff) >> 2, val);
>         }
>
>         if (status & A5XX_CP_INT_CP_AHB_ERROR) {
> @@ -1159,7 +1159,7 @@ static void a5xx_cp_err_irq(struct msm_gpu *gpu)
>
>                 dev_err_ratelimited(gpu->dev->dev,
>                         "CP | AHB error | addr=%X access=%s error=%d | status=0x%8.8X\n",
> -                       status & 0xFFFFF, access[(status >> 24) & 0xF],
> +                       status & 0xfffff, access[(status >> 24) & 0xf],
>                         (status & (1 << 31)), status);
>         }
>  }
> @@ -1172,8 +1172,8 @@ static void a5xx_rbbm_err_irq(struct msm_gpu *gpu, u32 status)
>                 dev_err_ratelimited(gpu->dev->dev,
>                         "RBBM | AHB bus error | %s | addr=0x%X | ports=0x%X:0x%X\n",
>                         val & (1 << 28) ? "WRITE" : "READ",
> -                       (val & 0xFFFFF) >> 2, (val >> 20) & 0x3,
> -                       (val >> 24) & 0xF);
> +                       (val & 0xfffff) >> 2, (val >> 20) & 0x3,
> +                       (val >> 24) & 0xf);
>
>                 /* Clear the error */
>                 gpu_write(gpu, REG_A5XX_RBBM_AHB_CMD, (1 << 4));
> @@ -1303,34 +1303,34 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>  }
>
>  static const u32 a5xx_registers[] = {
> -       0x0000, 0x0002, 0x0004, 0x0020, 0x0022, 0x0026, 0x0029, 0x002B,
> -       0x002E, 0x0035, 0x0038, 0x0042, 0x0044, 0x0044, 0x0047, 0x0095,
> -       0x0097, 0x00BB, 0x03A0, 0x0464, 0x0469, 0x046F, 0x04D2, 0x04D3,
> -       0x04E0, 0x0533, 0x0540, 0x0555, 0x0800, 0x081A, 0x081F, 0x0841,
> -       0x0860, 0x0860, 0x0880, 0x08A0, 0x0B00, 0x0B12, 0x0B15, 0x0B28,
> -       0x0B78, 0x0B7F, 0x0BB0, 0x0BBD, 0x0BC0, 0x0BC6, 0x0BD0, 0x0C53,
> -       0x0C60, 0x0C61, 0x0C80, 0x0C82, 0x0C84, 0x0C85, 0x0C90, 0x0C98,
> -       0x0CA0, 0x0CA0, 0x0CB0, 0x0CB2, 0x2180, 0x2185, 0x2580, 0x2585,
> -       0x0CC1, 0x0CC1, 0x0CC4, 0x0CC7, 0x0CCC, 0x0CCC, 0x0CD0, 0x0CD8,
> -       0x0CE0, 0x0CE5, 0x0CE8, 0x0CE8, 0x0CEC, 0x0CF1, 0x0CFB, 0x0D0E,
> -       0x2100, 0x211E, 0x2140, 0x2145, 0x2500, 0x251E, 0x2540, 0x2545,
> -       0x0D10, 0x0D17, 0x0D20, 0x0D23, 0x0D30, 0x0D30, 0x20C0, 0x20C0,
> -       0x24C0, 0x24C0, 0x0E40, 0x0E43, 0x0E4A, 0x0E4A, 0x0E50, 0x0E57,
> -       0x0E60, 0x0E7C, 0x0E80, 0x0E8E, 0x0E90, 0x0E96, 0x0EA0, 0x0EA8,
> -       0x0EB0, 0x0EB2, 0xE140, 0xE147, 0xE150, 0xE187, 0xE1A0, 0xE1A9,
> -       0xE1B0, 0xE1B6, 0xE1C0, 0xE1C7, 0xE1D0, 0xE1D1, 0xE200, 0xE201,
> -       0xE210, 0xE21C, 0xE240, 0xE268, 0xE000, 0xE006, 0xE010, 0xE09A,
> -       0xE0A0, 0xE0A4, 0xE0AA, 0xE0EB, 0xE100, 0xE105, 0xE380, 0xE38F,
> -       0xE3B0, 0xE3B0, 0xE400, 0xE405, 0xE408, 0xE4E9, 0xE4F0, 0xE4F0,
> -       0xE280, 0xE280, 0xE282, 0xE2A3, 0xE2A5, 0xE2C2, 0xE940, 0xE947,
> -       0xE950, 0xE987, 0xE9A0, 0xE9A9, 0xE9B0, 0xE9B6, 0xE9C0, 0xE9C7,
> -       0xE9D0, 0xE9D1, 0xEA00, 0xEA01, 0xEA10, 0xEA1C, 0xEA40, 0xEA68,
> -       0xE800, 0xE806, 0xE810, 0xE89A, 0xE8A0, 0xE8A4, 0xE8AA, 0xE8EB,
> -       0xE900, 0xE905, 0xEB80, 0xEB8F, 0xEBB0, 0xEBB0, 0xEC00, 0xEC05,
> -       0xEC08, 0xECE9, 0xECF0, 0xECF0, 0xEA80, 0xEA80, 0xEA82, 0xEAA3,
> -       0xEAA5, 0xEAC2, 0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D,
> -       0XA880, 0xA88D, 0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5,
> -       0xAC60, 0xAC60, ~0,
> +       0x0000, 0x0002, 0x0004, 0x0020, 0x0022, 0x0026, 0x0029, 0x002b,
> +       0x002e, 0x0035, 0x0038, 0x0042, 0x0044, 0x0044, 0x0047, 0x0095,
> +       0x0097, 0x00bb, 0x03a0, 0x0464, 0x0469, 0x046f, 0x04d2, 0x04d3,
> +       0x04e0, 0x0533, 0x0540, 0x0555, 0x0800, 0x081a, 0x081f, 0x0841,
> +       0x0860, 0x0860, 0x0880, 0x08a0, 0x0b00, 0x0b12, 0x0b15, 0x0b28,
> +       0x0b78, 0x0b7f, 0x0bb0, 0x0bbd, 0x0bc0, 0x0bc6, 0x0bd0, 0x0c53,
> +       0x0c60, 0x0c61, 0x0c80, 0x0c82, 0x0c84, 0x0c85, 0x0c90, 0x0c98,
> +       0x0ca0, 0x0ca0, 0x0cb0, 0x0cb2, 0x2180, 0x2185, 0x2580, 0x2585,
> +       0x0cc1, 0x0cc1, 0x0cc4, 0x0cc7, 0x0ccc, 0x0ccc, 0x0cd0, 0x0cd8,
> +       0x0ce0, 0x0ce5, 0x0ce8, 0x0ce8, 0x0cec, 0x0cf1, 0x0cfb, 0x0d0e,
> +       0x2100, 0x211e, 0x2140, 0x2145, 0x2500, 0x251e, 0x2540, 0x2545,
> +       0x0d10, 0x0d17, 0x0d20, 0x0d23, 0x0d30, 0x0d30, 0x20c0, 0x20c0,
> +       0x24c0, 0x24c0, 0x0e40, 0x0e43, 0x0e4a, 0x0e4a, 0x0e50, 0x0e57,
> +       0x0e60, 0x0e7c, 0x0e80, 0x0e8e, 0x0e90, 0x0e96, 0x0ea0, 0x0ea8,
> +       0x0eb0, 0x0eb2, 0xe140, 0xe147, 0xe150, 0xe187, 0xe1a0, 0xe1a9,
> +       0xe1b0, 0xe1b6, 0xe1c0, 0xe1c7, 0xe1d0, 0xe1d1, 0xe200, 0xe201,
> +       0xe210, 0xe21c, 0xe240, 0xe268, 0xe000, 0xe006, 0xe010, 0xe09a,
> +       0xe0a0, 0xe0a4, 0xe0aa, 0xe0eb, 0xe100, 0xe105, 0xe380, 0xe38f,
> +       0xe3b0, 0xe3b0, 0xe400, 0xe405, 0xe408, 0xe4e9, 0xe4f0, 0xe4f0,
> +       0xe280, 0xe280, 0xe282, 0xe2a3, 0xe2a5, 0xe2c2, 0xe940, 0xe947,
> +       0xe950, 0xe987, 0xe9a0, 0xe9a9, 0xe9b0, 0xe9b6, 0xe9c0, 0xe9c7,
> +       0xe9d0, 0xe9d1, 0xea00, 0xea01, 0xea10, 0xea1c, 0xea40, 0xea68,
> +       0xe800, 0xe806, 0xe810, 0xe89a, 0xe8a0, 0xe8a4, 0xe8aa, 0xe8eb,
> +       0xe900, 0xe905, 0xeb80, 0xeb8f, 0xebb0, 0xebb0, 0xec00, 0xec05,
> +       0xec08, 0xece9, 0xecf0, 0xecf0, 0xea80, 0xea80, 0xea82, 0xeaa3,
> +       0xeaa5, 0xeac2, 0xa800, 0xa800, 0xa820, 0xa828, 0xa840, 0xa87d,
> +       0XA880, 0xa88d, 0xa890, 0xa8a3, 0xa8d0, 0xa8d8, 0xa8e0, 0xa8f5,
> +       0xac60, 0xac60, ~0,
>  };
>
>  static void a5xx_dump(struct msm_gpu *gpu)
> @@ -1410,7 +1410,7 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
>          * entries on Adreno A510 and A530 (the others will tend to lock up)
>          */
>         if (adreno_is_a510(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
> -               gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
> +               gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003c0000);
>                 gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
>         }
>
> @@ -1766,7 +1766,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>
>         adreno_gpu->registers = a5xx_registers;
>
> -       a5xx_gpu->lm_leakage = 0x4E001A;
> +       a5xx_gpu->lm_leakage = 0x4e001a;
>
>         check_speed_bin(&pdev->dev);
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> index c7187bcc5e90..bbe7e0c061df 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
> @@ -92,7 +92,7 @@ enum preempt_state {
>   * updating a few registers (often only the wptr).
>   *
>   * These are the CPU aware registers in the record:
> - * @magic: Must always be 0x27C4BAFC
> + * @magic: Must always be 0x27c4bafc
>   * @info: Type of the record - written 0 by the CPU, updated by the CP
>   * @data: Data field from SET_RENDER_MODE or a checkpoint. Written and used by
>   * the CP
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> index 0e63a1429189..767cb692c0ff 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> @@ -39,61 +39,61 @@ static struct {
>         uint32_t reg;
>         uint32_t value;
>  } a5xx_sequence_regs[] = {
> -       { 0xB9A1, 0x00010303 },
> -       { 0xB9A2, 0x13000000 },
> -       { 0xB9A3, 0x00460020 },
> -       { 0xB9A4, 0x10000000 },
> -       { 0xB9A5, 0x040A1707 },
> -       { 0xB9A6, 0x00010000 },
> -       { 0xB9A7, 0x0E000904 },
> -       { 0xB9A8, 0x10000000 },
> -       { 0xB9A9, 0x01165000 },
> -       { 0xB9AA, 0x000E0002 },
> -       { 0xB9AB, 0x03884141 },
> -       { 0xB9AC, 0x10000840 },
> -       { 0xB9AD, 0x572A5000 },
> -       { 0xB9AE, 0x00000003 },
> -       { 0xB9AF, 0x00000000 },
> -       { 0xB9B0, 0x10000000 },
> -       { 0xB828, 0x6C204010 },
> -       { 0xB829, 0x6C204011 },
> -       { 0xB82A, 0x6C204012 },
> -       { 0xB82B, 0x6C204013 },
> -       { 0xB82C, 0x6C204014 },
> -       { 0xB90F, 0x00000004 },
> -       { 0xB910, 0x00000002 },
> -       { 0xB911, 0x00000002 },
> -       { 0xB912, 0x00000002 },
> -       { 0xB913, 0x00000002 },
> -       { 0xB92F, 0x00000004 },
> -       { 0xB930, 0x00000005 },
> -       { 0xB931, 0x00000005 },
> -       { 0xB932, 0x00000005 },
> -       { 0xB933, 0x00000005 },
> -       { 0xB96F, 0x00000001 },
> -       { 0xB970, 0x00000003 },
> -       { 0xB94F, 0x00000004 },
> -       { 0xB950, 0x0000000B },
> -       { 0xB951, 0x0000000B },
> -       { 0xB952, 0x0000000B },
> -       { 0xB953, 0x0000000B },
> -       { 0xB907, 0x00000019 },
> -       { 0xB927, 0x00000019 },
> -       { 0xB947, 0x00000019 },
> -       { 0xB967, 0x00000019 },
> -       { 0xB987, 0x00000019 },
> -       { 0xB906, 0x00220001 },
> -       { 0xB926, 0x00220001 },
> -       { 0xB946, 0x00220001 },
> -       { 0xB966, 0x00220001 },
> -       { 0xB986, 0x00300000 },
> -       { 0xAC40, 0x0340FF41 },
> -       { 0xAC41, 0x03BEFED0 },
> -       { 0xAC42, 0x00331FED },
> -       { 0xAC43, 0x021FFDD3 },
> -       { 0xAC44, 0x5555AAAA },
> -       { 0xAC45, 0x5555AAAA },
> -       { 0xB9BA, 0x00000008 },
> +       { 0xb9a1, 0x00010303 },
> +       { 0xb9a2, 0x13000000 },
> +       { 0xb9a3, 0x00460020 },
> +       { 0xb9a4, 0x10000000 },
> +       { 0xb9a5, 0x040a1707 },
> +       { 0xb9a6, 0x00010000 },
> +       { 0xb9a7, 0x0e000904 },
> +       { 0xb9a8, 0x10000000 },
> +       { 0xb9a9, 0x01165000 },
> +       { 0xb9aa, 0x000e0002 },
> +       { 0xb9ab, 0x03884141 },
> +       { 0xb9ac, 0x10000840 },
> +       { 0xb9ad, 0x572a5000 },
> +       { 0xb9ae, 0x00000003 },
> +       { 0xb9af, 0x00000000 },
> +       { 0xb9b0, 0x10000000 },
> +       { 0xb828, 0x6c204010 },
> +       { 0xb829, 0x6c204011 },
> +       { 0xb82a, 0x6c204012 },
> +       { 0xb82b, 0x6c204013 },
> +       { 0xb82c, 0x6c204014 },
> +       { 0xb90f, 0x00000004 },
> +       { 0xb910, 0x00000002 },
> +       { 0xb911, 0x00000002 },
> +       { 0xb912, 0x00000002 },
> +       { 0xb913, 0x00000002 },
> +       { 0xb92f, 0x00000004 },
> +       { 0xb930, 0x00000005 },
> +       { 0xb931, 0x00000005 },
> +       { 0xb932, 0x00000005 },
> +       { 0xb933, 0x00000005 },
> +       { 0xb96f, 0x00000001 },
> +       { 0xb970, 0x00000003 },
> +       { 0xb94f, 0x00000004 },
> +       { 0xb950, 0x0000000b },
> +       { 0xb951, 0x0000000b },
> +       { 0xb952, 0x0000000b },
> +       { 0xb953, 0x0000000b },
> +       { 0xb907, 0x00000019 },
> +       { 0xb927, 0x00000019 },
> +       { 0xb947, 0x00000019 },
> +       { 0xb967, 0x00000019 },
> +       { 0xb987, 0x00000019 },
> +       { 0xb906, 0x00220001 },
> +       { 0xb926, 0x00220001 },
> +       { 0xb946, 0x00220001 },
> +       { 0xb966, 0x00220001 },
> +       { 0xb986, 0x00300000 },
> +       { 0xac40, 0x0340ff41 },
> +       { 0xac41, 0x03befed0 },
> +       { 0xac42, 0x00331fed },
> +       { 0xac43, 0x021ffdd3 },
> +       { 0xac44, 0x5555aaaa },
> +       { 0xac45, 0x5555aaaa },
> +       { 0xb9ba, 0x00000008 },
>  };
>
>  /*
> @@ -143,12 +143,12 @@ static void a530_lm_setup(struct msm_gpu *gpu)
>         /* The threshold is fixed at 6000 for A530 */
>         gpu_write(gpu, REG_A5XX_GPMU_GPMU_PWR_THRESHOLD, 0x80000000 | 6000);
>
> -       gpu_write(gpu, REG_A5XX_GPMU_BEC_ENABLE, 0x10001FFF);
> -       gpu_write(gpu, REG_A5XX_GDPM_CONFIG1, 0x00201FF1);
> +       gpu_write(gpu, REG_A5XX_GPMU_BEC_ENABLE, 0x10001fff);
> +       gpu_write(gpu, REG_A5XX_GDPM_CONFIG1, 0x00201ff1);
>
>         /* Write the voltage table */
> -       gpu_write(gpu, REG_A5XX_GPMU_BEC_ENABLE, 0x10001FFF);
> -       gpu_write(gpu, REG_A5XX_GDPM_CONFIG1, 0x201FF1);
> +       gpu_write(gpu, REG_A5XX_GPMU_BEC_ENABLE, 0x10001fff);
> +       gpu_write(gpu, REG_A5XX_GDPM_CONFIG1, 0x201ff1);
>
>         gpu_write(gpu, AGC_MSG_STATE, 1);
>         gpu_write(gpu, AGC_MSG_COMMAND, AGC_POWER_CONFIG_PRODUCTION_ID);
> @@ -210,9 +210,9 @@ static void a540_lm_setup(struct msm_gpu *gpu)
>  /* Enable SP/TP cpower collapse */
>  static void a5xx_pc_init(struct msm_gpu *gpu)
>  {
> -       gpu_write(gpu, REG_A5XX_GPMU_PWR_COL_INTER_FRAME_CTRL, 0x7F);
> +       gpu_write(gpu, REG_A5XX_GPMU_PWR_COL_INTER_FRAME_CTRL, 0x7f);
>         gpu_write(gpu, REG_A5XX_GPMU_PWR_COL_BINNING_CTRL, 0);
> -       gpu_write(gpu, REG_A5XX_GPMU_PWR_COL_INTER_FRAME_HYST, 0xA0080);
> +       gpu_write(gpu, REG_A5XX_GPMU_PWR_COL_INTER_FRAME_HYST, 0xa0080);
>         gpu_write(gpu, REG_A5XX_GPMU_PWR_COL_STAGGER_DELAY, 0x600040);
>  }
>
> @@ -258,8 +258,8 @@ static int a5xx_gpmu_init(struct msm_gpu *gpu)
>          * Wait for the GPMU to respond. It isn't fatal if it doesn't, we just
>          * won't have advanced power collapse.
>          */
> -       if (spin_usecs(gpu, 25, REG_A5XX_GPMU_GENERAL_0, 0xFFFFFFFF,
> -               0xBABEFACE))
> +       if (spin_usecs(gpu, 25, REG_A5XX_GPMU_GENERAL_0, 0xffffffff,
> +               0xbabeface))
>                 DRM_ERROR("%s: GPMU firmware initialization timed out\n",
>                         gpu->name);
>
> @@ -284,7 +284,7 @@ static void a5xx_lm_enable(struct msm_gpu *gpu)
>                 return;
>
>         gpu_write(gpu, REG_A5XX_GDPM_INT_MASK, 0x0);
> -       gpu_write(gpu, REG_A5XX_GDPM_INT_EN, 0x0A);
> +       gpu_write(gpu, REG_A5XX_GDPM_INT_EN, 0x0a);
>         gpu_write(gpu, REG_A5XX_GPMU_GPMU_VOLTAGE_INTR_EN_MASK, 0x01);
>         gpu_write(gpu, REG_A5XX_GPMU_TEMP_THRESHOLD_INTR_EN_MASK, 0x50000);
>         gpu_write(gpu, REG_A5XX_GPMU_THROTTLE_UNMASK_FORCE_CTRL, 0x30000);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc578016e0b..7332a78288f7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -258,7 +258,7 @@ const struct adreno_reglist a615_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0,  0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>         {REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> -       {REG_A6XX_RBBM_CLOCK_HYST_SP0,  0x0000F3CF},
> +       {REG_A6XX_RBBM_CLOCK_HYST_SP0,  0x0000f3cf},
>         {REG_A6XX_RBBM_CLOCK_CNTL_TP0,  0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL_TP1,  0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> @@ -295,10 +295,10 @@ const struct adreno_reglist a615_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_CCU1, 0x00002220},
>         {REG_A6XX_RBBM_CLOCK_CNTL_CCU2, 0x00002220},
>         {REG_A6XX_RBBM_CLOCK_CNTL_CCU3, 0x00002220},
> -       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> -       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040F00},
> -       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040F00},
> -       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040F00},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU1, 0x00040f00},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU2, 0x00040f00},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU3, 0x00040f00},
>         {REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05022022},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
>         {REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> @@ -434,7 +434,7 @@ const struct adreno_reglist a640_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>         {REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> -       {REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +       {REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
>         {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> @@ -450,7 +450,7 @@ const struct adreno_reglist a640_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
>         {REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> -       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
>         {REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x05222022},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
>         {REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> @@ -487,7 +487,7 @@ const struct adreno_reglist a650_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>         {REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> -       {REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +       {REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
>         {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> @@ -503,7 +503,7 @@ const struct adreno_reglist a650_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
>         {REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> -       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
>         {REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
>         {REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> @@ -540,7 +540,7 @@ const struct adreno_reglist a660_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>         {REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> -       {REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +       {REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf},
>         {REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> @@ -556,7 +556,7 @@ const struct adreno_reglist a660_hwcg[] = {
>         {REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
>         {REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> -       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +       {REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040f00},
>         {REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
>         {REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
>         {REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> @@ -1613,7 +1613,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>                  * lines on a write miss
>                  */
>                 a6xx_llc_rmw(a6xx_gpu,
> -                       REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
> +                       REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xf, 0x03);
>                 return;
>         }
>
> @@ -1836,7 +1836,7 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
>                 return ERR_CAST(mmu);
>
>         return msm_gem_address_space_create(mmu,
> -               "gpu", 0x100000000ULL,
> +               "gpu", 0x100000000ull,
>                 adreno_private_address_space_size(gpu));
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index ab853f61db63..6bd24c9f15e9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -43,7 +43,7 @@ struct a6xx_gpu {
>   */
>  #define A6XX_PROTECT_NORDWR(_reg, _len) \
>         ((1 << 31) | \
> -       (((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +       (((_len) & 0x3fff) << 18) | ((_reg) & 0x3ffff))
>
>  /*
>   * Same as above, but allow reads over the range. For areas of mixed use (such
> @@ -51,7 +51,7 @@ struct a6xx_gpu {
>   * single register
>   */
>  #define A6XX_PROTECT_RDONLY(_reg, _len) \
> -       ((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +       ((((_len) & 0x3fff) << 18) | ((_reg) & 0x3ffff))
>
>  static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
>  {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 55f443328d8e..a0538533bf2c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -344,7 +344,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>         gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
>
>         gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0, 0x76543210);
> -       gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1, 0xFEDCBA98);
> +       gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1, 0xfedcba98);
>
>         gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
>         gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> @@ -375,7 +375,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
>                 cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
>                         0x76543210);
>                 cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
> -                       0xFEDCBA98);
> +                       0xfedcba98);
>
>                 cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
>                 cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> index 2fb58b7098e4..741291ebb99f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> @@ -308,7 +308,7 @@ static const u32 a6xx_vbif_registers[] = {
>  };
>
>  static const u32 a6xx_gbif_registers[] = {
> -       0x3C00, 0X3C0B, 0X3C40, 0X3C47, 0X3CC0, 0X3CD1, 0xE3A, 0xE3A,
> +       0x3c00, 0X3C0B, 0X3C40, 0X3C47, 0X3CC0, 0X3CD1, 0xe3a, 0xe3a,
>  };
>
>  static const struct a6xx_registers a6xx_ahb_reglist[] = {
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e7adc5c632d0..ed3ac60c832e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -354,7 +354,7 @@ static inline void
>  OUT_PKT0(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>  {
>         adreno_wait_ring(ring, cnt+1);
> -       OUT_RING(ring, CP_TYPE0_PKT | ((cnt-1) << 16) | (regindx & 0x7FFF));
> +       OUT_RING(ring, CP_TYPE0_PKT | ((cnt-1) << 16) | (regindx & 0x7fff));
>  }
>
>  /* no-op packet: */
> @@ -369,7 +369,7 @@ static inline void
>  OUT_PKT3(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  {
>         adreno_wait_ring(ring, cnt+1);
> -       OUT_RING(ring, CP_TYPE3_PKT | ((cnt-1) << 16) | ((opcode & 0xFF) << 8));
> +       OUT_RING(ring, CP_TYPE3_PKT | ((cnt-1) << 16) | ((opcode & 0xff) << 8));
>  }
>
>  static inline u32 PM4_PARITY(u32 val)
> @@ -385,7 +385,7 @@ static inline u32 PM4_PARITY(u32 val)
>
>  #define PKT4(_reg, _cnt) \
>         (CP_TYPE4_PKT | ((_cnt) << 0) | (PM4_PARITY((_cnt)) << 7) | \
> -        (((_reg) & 0x3FFFF) << 8) | (PM4_PARITY((_reg)) << 27))
> +        (((_reg) & 0x3ffff) << 8) | (PM4_PARITY((_reg)) << 27))
>
>  static inline void
>  OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
> @@ -399,7 +399,7 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  {
>         adreno_wait_ring(ring, cnt + 1);
>         OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
> -               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> +               ((opcode & 0x7f) << 16) | (PM4_PARITY(opcode) << 23));
>  }
>
>  struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
> @@ -426,7 +426,7 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>   */
>  #define ADRENO_PROTECT_RW(_reg, _len) \
>         ((1 << 30) | (1 << 29) | \
> -       ((ilog2((_len)) & 0x1F) << 24) | (((_reg) << 2) & 0xFFFFF))
> +       ((ilog2((_len)) & 0x1f) << 24) | (((_reg) << 2) & 0xfffff))
>
>  /*
>   * Same as above, but allow reads over the range. For areas of mixed use (such
> @@ -435,7 +435,7 @@ static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
>   */
>  #define ADRENO_PROTECT_RDONLY(_reg, _len) \
>         ((1 << 29) \
> -       ((ilog2((_len)) & 0x1F) << 24) | (((_reg) << 2) & 0xFFFFF))
> +       ((ilog2((_len)) & 0x1f) << 24) | (((_reg) << 2) & 0xfffff))
>
>
>  #define gpu_poll_timeout(gpu, addr, val, cond, interval, timeout) \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029fdc682..bca45c99d0d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -383,50 +383,50 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>         .features = 0,
>         .highest_bank_bit = 0x2,
>         .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -                       .reg_off = 0x2AC, .bit_off = 0},
> +                       .reg_off = 0x2ac, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -                       .reg_off = 0x2B4, .bit_off = 0},
> +                       .reg_off = 0x2b4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -                       .reg_off = 0x2BC, .bit_off = 0},
> +                       .reg_off = 0x2bc, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -                       .reg_off = 0x2C4, .bit_off = 0},
> +                       .reg_off = 0x2c4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -                       .reg_off = 0x2AC, .bit_off = 8},
> +                       .reg_off = 0x2ac, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -                       .reg_off = 0x2B4, .bit_off = 8},
> +                       .reg_off = 0x2b4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_DMA2] = {
> -                       .reg_off = 0x2C4, .bit_off = 8},
> +                       .reg_off = 0x2c4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_DMA3] = {
> -                       .reg_off = 0x2C4, .bit_off = 12},
> +                       .reg_off = 0x2c4, .bit_off = 12},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -                       .reg_off = 0x3A8, .bit_off = 15},
> +                       .reg_off = 0x3a8, .bit_off = 15},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -                       .reg_off = 0x3B0, .bit_off = 15},
> +                       .reg_off = 0x3b0, .bit_off = 15},
>         },
>  };
>
>  static const struct dpu_mdp_cfg sdm845_mdp[] = {
>         {
>         .name = "top_0", .id = MDP_TOP,
> -       .base = 0x0, .len = 0x45C,
> +       .base = 0x0, .len = 0x45c,
>         .features = BIT(DPU_MDP_AUDIO_SELECT),
>         .highest_bank_bit = 0x2,
>         .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -                       .reg_off = 0x2AC, .bit_off = 0},
> +                       .reg_off = 0x2ac, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -                       .reg_off = 0x2B4, .bit_off = 0},
> +                       .reg_off = 0x2b4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -                       .reg_off = 0x2BC, .bit_off = 0},
> +                       .reg_off = 0x2bc, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -                       .reg_off = 0x2C4, .bit_off = 0},
> +                       .reg_off = 0x2c4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -                       .reg_off = 0x2AC, .bit_off = 8},
> +                       .reg_off = 0x2ac, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -                       .reg_off = 0x2B4, .bit_off = 8},
> +                       .reg_off = 0x2b4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -                       .reg_off = 0x2BC, .bit_off = 8},
> +                       .reg_off = 0x2bc, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -                       .reg_off = 0x2C4, .bit_off = 8},
> +                       .reg_off = 0x2c4, .bit_off = 8},
>         },
>  };
>
> @@ -437,38 +437,38 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
>         .features = 0,
>         .highest_bank_bit = 0x3,
>         .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -               .reg_off = 0x2AC, .bit_off = 0},
> +               .reg_off = 0x2ac, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -               .reg_off = 0x2AC, .bit_off = 8},
> +               .reg_off = 0x2ac, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -               .reg_off = 0x2B4, .bit_off = 8},
> +               .reg_off = 0x2b4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -               .reg_off = 0x2C4, .bit_off = 8},
> +               .reg_off = 0x2c4, .bit_off = 8},
>         },
>  };
>
>  static const struct dpu_mdp_cfg sc8180x_mdp[] = {
>         {
>         .name = "top_0", .id = MDP_TOP,
> -       .base = 0x0, .len = 0x45C,
> +       .base = 0x0, .len = 0x45c,
>         .features = 0,
>         .highest_bank_bit = 0x3,
>         .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -                       .reg_off = 0x2AC, .bit_off = 0},
> +                       .reg_off = 0x2ac, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -                       .reg_off = 0x2B4, .bit_off = 0},
> +                       .reg_off = 0x2b4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -                       .reg_off = 0x2BC, .bit_off = 0},
> +                       .reg_off = 0x2bc, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -                       .reg_off = 0x2C4, .bit_off = 0},
> +                       .reg_off = 0x2c4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -                       .reg_off = 0x2AC, .bit_off = 8},
> +                       .reg_off = 0x2ac, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -                       .reg_off = 0x2B4, .bit_off = 8},
> +                       .reg_off = 0x2b4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -                       .reg_off = 0x2BC, .bit_off = 8},
> +                       .reg_off = 0x2bc, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -                       .reg_off = 0x2C4, .bit_off = 8},
> +                       .reg_off = 0x2c4, .bit_off = 8},
>         },
>  };
>
> @@ -479,25 +479,25 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>         .features = 0,
>         .highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
>         .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -                       .reg_off = 0x2AC, .bit_off = 0},
> +                       .reg_off = 0x2ac, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> -                       .reg_off = 0x2B4, .bit_off = 0},
> +                       .reg_off = 0x2b4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> -                       .reg_off = 0x2BC, .bit_off = 0},
> +                       .reg_off = 0x2bc, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> -                       .reg_off = 0x2C4, .bit_off = 0},
> +                       .reg_off = 0x2c4, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -                       .reg_off = 0x2AC, .bit_off = 8},
> +                       .reg_off = 0x2ac, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -                       .reg_off = 0x2B4, .bit_off = 8},
> +                       .reg_off = 0x2b4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -                       .reg_off = 0x2BC, .bit_off = 8},
> +                       .reg_off = 0x2bc, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -                       .reg_off = 0x2C4, .bit_off = 8},
> +                       .reg_off = 0x2c4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_REG_DMA] = {
> -                       .reg_off = 0x2BC, .bit_off = 20},
> +                       .reg_off = 0x2bc, .bit_off = 20},
>         .clk_ctrls[DPU_CLK_CTRL_WB2] = {
> -                       .reg_off = 0x3B8, .bit_off = 24},
> +                       .reg_off = 0x3b8, .bit_off = 24},
>         },
>  };
>
> @@ -507,13 +507,13 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
>         .base = 0x0, .len = 0x2014,
>         .highest_bank_bit = 0x1,
>         .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -               .reg_off = 0x2AC, .bit_off = 0},
> +               .reg_off = 0x2ac, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -               .reg_off = 0x2AC, .bit_off = 8},
> +               .reg_off = 0x2ac, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -               .reg_off = 0x2B4, .bit_off = 8},
> +               .reg_off = 0x2b4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> -               .reg_off = 0x2C4, .bit_off = 8},
> +               .reg_off = 0x2c4, .bit_off = 8},
>         },
>  };
>
> @@ -524,9 +524,9 @@ static const struct dpu_mdp_cfg qcm2290_mdp[] = {
>         .features = 0,
>         .highest_bank_bit = 0x2,
>         .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> -               .reg_off = 0x2AC, .bit_off = 0},
> +               .reg_off = 0x2ac, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> -               .reg_off = 0x2AC, .bit_off = 8},
> +               .reg_off = 0x2ac, .bit_off = 8},
>         },
>  };
>
> @@ -569,31 +569,31 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  static const struct dpu_ctl_cfg sdm845_ctl[] = {
>         {
>         .name = "ctl_0", .id = CTL_0,
> -       .base = 0x1000, .len = 0xE4,
> +       .base = 0x1000, .len = 0xe4,
>         .features = BIT(DPU_CTL_SPLIT_DISPLAY),
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>         },
>         {
>         .name = "ctl_1", .id = CTL_1,
> -       .base = 0x1200, .len = 0xE4,
> +       .base = 0x1200, .len = 0xe4,
>         .features = BIT(DPU_CTL_SPLIT_DISPLAY),
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>         },
>         {
>         .name = "ctl_2", .id = CTL_2,
> -       .base = 0x1400, .len = 0xE4,
> +       .base = 0x1400, .len = 0xe4,
>         .features = 0,
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>         },
>         {
>         .name = "ctl_3", .id = CTL_3,
> -       .base = 0x1600, .len = 0xE4,
> +       .base = 0x1600, .len = 0xe4,
>         .features = 0,
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>         },
>         {
>         .name = "ctl_4", .id = CTL_4,
> -       .base = 0x1800, .len = 0xE4,
> +       .base = 0x1800, .len = 0xe4,
>         .features = 0,
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>         },
> @@ -602,19 +602,19 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  static const struct dpu_ctl_cfg sc7180_ctl[] = {
>         {
>         .name = "ctl_0", .id = CTL_0,
> -       .base = 0x1000, .len = 0xE4,
> +       .base = 0x1000, .len = 0xe4,
>         .features = BIT(DPU_CTL_ACTIVE_CFG),
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>         },
>         {
>         .name = "ctl_1", .id = CTL_1,
> -       .base = 0x1200, .len = 0xE4,
> +       .base = 0x1200, .len = 0xe4,
>         .features = BIT(DPU_CTL_ACTIVE_CFG),
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>         },
>         {
>         .name = "ctl_2", .id = CTL_2,
> -       .base = 0x1400, .len = 0xE4,
> +       .base = 0x1400, .len = 0xe4,
>         .features = BIT(DPU_CTL_ACTIVE_CFG),
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>         },
> @@ -662,25 +662,25 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
>  static const struct dpu_ctl_cfg sc7280_ctl[] = {
>         {
>         .name = "ctl_0", .id = CTL_0,
> -       .base = 0x15000, .len = 0x1E8,
> +       .base = 0x15000, .len = 0x1e8,
>         .features = CTL_SC7280_MASK,
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>         },
>         {
>         .name = "ctl_1", .id = CTL_1,
> -       .base = 0x16000, .len = 0x1E8,
> +       .base = 0x16000, .len = 0x1e8,
>         .features = CTL_SC7280_MASK,
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>         },
>         {
>         .name = "ctl_2", .id = CTL_2,
> -       .base = 0x17000, .len = 0x1E8,
> +       .base = 0x17000, .len = 0x1e8,
>         .features = CTL_SC7280_MASK,
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>         },
>         {
>         .name = "ctl_3", .id = CTL_3,
> -       .base = 0x18000, .len = 0x1E8,
> +       .base = 0x18000, .len = 0x1e8,
>         .features = CTL_SC7280_MASK,
>         .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>         },
> @@ -1238,29 +1238,29 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
>         }
>
>  static const struct dpu_intf_cfg msm8998_intf[] = {
> -       INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -       INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -       INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +       INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +       INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +       INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +       INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_HDMI, 0, 25, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>
>  static const struct dpu_intf_cfg sdm845_intf[] = {
> -       INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -       INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -       INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +       INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +       INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +       INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +       INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 1, 24, INTF_SDM845_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> -       INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +       INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +       INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
>
>  static const struct dpu_intf_cfg sm8150_intf[] = {
> -       INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -       INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> -       INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +       INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +       INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +       INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +       INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
>  };
>
>  static const struct dpu_intf_cfg sc7280_intf[] = {
> @@ -1270,18 +1270,18 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>  };
>
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
> -       INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> -       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> -       INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
> +       INTF_BLK("intf_0", INTF_0, 0x6a000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +       INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +       INTF_BLK("intf_2", INTF_2, 0x6b000, INTF_DSI, 1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 28, 29),
>         /* INTF_3 is for MST, wired to INTF_DP 0 and 1, use dummy index until this is supported */
> -       INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> -       INTF_BLK("intf_4", INTF_4, 0x6C000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> -       INTF_BLK("intf_5", INTF_5, 0x6C800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
> +       INTF_BLK("intf_3", INTF_3, 0x6b800, INTF_DP, 999, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 30, 31),
> +       INTF_BLK("intf_4", INTF_4, 0x6c000, INTF_DP, MSM_DP_CONTROLLER_1, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 20, 21),
> +       INTF_BLK("intf_5", INTF_5, 0x6c800, INTF_DP, MSM_DP_CONTROLLER_2, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 22, 23),
>  };
>
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
>         INTF_BLK("intf_0", INTF_0, 0x00000, INTF_NONE, 0, 0, 0, 0, 0, 0),
> -       INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
> +       INTF_BLK("intf_1", INTF_1, 0x6a800, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
>
>  /*************************************************************
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38ab1568..4e3fd67e32df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -20,8 +20,8 @@
>  #define MAX_BLOCKS    12
>
>  #define DPU_HW_VER(MAJOR, MINOR, STEP) (((MAJOR & 0xF) << 28)    |\
> -               ((MINOR & 0xFFF) << 16)  |\
> -               (STEP & 0xFFFF))
> +               ((MINOR & 0xfff) << 16)  |\
> +               (STEP & 0xffff))
>
>  #define DPU_HW_MAJOR(rev)              ((rev) >> 28)
>  #define DPU_HW_MINOR(rev)              (((rev) >> 16) & 0xFFF)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6676c8..de7d21553aa2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -414,7 +414,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                         switch (stage_cfg->stage[i][j]) {
>                         case SSPP_VIG0:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext3 |= ((i + 1) & 0xF) << 0;
> +                                       mixercfg_ext3 |= ((i + 1) & 0xf) << 0;
>                                 } else {
>                                         mixercfg |= mix << 0;
>                                         mixercfg_ext |= ext << 0;
> @@ -422,7 +422,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                                 break;
>                         case SSPP_VIG1:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext3 |= ((i + 1) & 0xF) << 4;
> +                                       mixercfg_ext3 |= ((i + 1) & 0xf) << 4;
>                                 } else {
>                                         mixercfg |= mix << 3;
>                                         mixercfg_ext |= ext << 2;
> @@ -430,7 +430,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                                 break;
>                         case SSPP_VIG2:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext3 |= ((i + 1) & 0xF) << 8;
> +                                       mixercfg_ext3 |= ((i + 1) & 0xf) << 8;
>                                 } else {
>                                         mixercfg |= mix << 6;
>                                         mixercfg_ext |= ext << 4;
> @@ -438,7 +438,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                                 break;
>                         case SSPP_VIG3:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext3 |= ((i + 1) & 0xF) << 12;
> +                                       mixercfg_ext3 |= ((i + 1) & 0xf) << 12;
>                                 } else {
>                                         mixercfg |= mix << 26;
>                                         mixercfg_ext |= ext << 6;
> @@ -462,7 +462,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                                 break;
>                         case SSPP_DMA0:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext2 |= ((i + 1) & 0xF) << 8;
> +                                       mixercfg_ext2 |= ((i + 1) & 0xf) << 8;
>                                 } else {
>                                         mixercfg |= mix << 18;
>                                         mixercfg_ext |= ext << 16;
> @@ -470,7 +470,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                                 break;
>                         case SSPP_DMA1:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext2 |= ((i + 1) & 0xF) << 12;
> +                                       mixercfg_ext2 |= ((i + 1) & 0xf) << 12;
>                                 } else {
>                                         mixercfg |= mix << 21;
>                                         mixercfg_ext |= ext << 18;
> @@ -478,25 +478,25 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                                 break;
>                         case SSPP_DMA2:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext2 |= ((i + 1) & 0xF) << 16;
> +                                       mixercfg_ext2 |= ((i + 1) & 0xf) << 16;
>                                 } else {
> -                                       mix |= (i + 1) & 0xF;
> +                                       mix |= (i + 1) & 0xf;
>                                         mixercfg_ext2 |= mix << 0;
>                                 }
>                                 break;
>                         case SSPP_DMA3:
>                                 if (rect_index == DPU_SSPP_RECT_1) {
> -                                       mixercfg_ext2 |= ((i + 1) & 0xF) << 20;
> +                                       mixercfg_ext2 |= ((i + 1) & 0xf) << 20;
>                                 } else {
> -                                       mix |= (i + 1) & 0xF;
> +                                       mix |= (i + 1) & 0xf;
>                                         mixercfg_ext2 |= mix << 4;
>                                 }
>                                 break;
>                         case SSPP_CURSOR0:
> -                               mixercfg_ext |= ((i + 1) & 0xF) << 20;
> +                               mixercfg_ext |= ((i + 1) & 0xf) << 20;
>                                 break;
>                         case SSPP_CURSOR1:
> -                               mixercfg_ext |= ((i + 1) & 0xF) << 26;
> +                               mixercfg_ext |= ((i + 1) & 0xf) << 26;
>                                 break;
>                         default:
>                                 break;
> @@ -561,7 +561,7 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
>         struct dpu_hw_blk_reg_map *c = &ctx->hw;
>         u32 intf_cfg = 0;
>
> -       intf_cfg |= (cfg->intf & 0xF) << 4;
> +       intf_cfg |= (cfg->intf & 0xf) << 4;
>
>         if (cfg->mode_3d) {
>                 intf_cfg |= BIT(19);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index f5120ea91ede..6653abe8301a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -91,11 +91,11 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
>
>         if (border_en) {
>                 DPU_REG_WRITE(c, LM_BORDER_COLOR_0,
> -                       (color->color_0 & 0xFFF) |
> -                       ((color->color_1 & 0xFFF) << 0x10));
> +                       (color->color_0 & 0xfff) |
> +                       ((color->color_1 & 0xfff) << 0x10));
>                 DPU_REG_WRITE(c, LM_BORDER_COLOR_1,
> -                       (color->color_2 & 0xFFF) |
> -                       ((color->color_3 & 0xFFF) << 0x10));
> +                       (color->color_2 & 0xfff) |
> +                       ((color->color_3 & 0xfff) << 0x10));
>         }
>  }
>
> @@ -123,7 +123,7 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
>         if (WARN_ON(stage_off < 0))
>                 return;
>
> -       const_alpha = (bg_alpha & 0xFF) | ((fg_alpha & 0xFF) << 16);
> +       const_alpha = (bg_alpha & 0xff) | ((fg_alpha & 0xff) << 16);
>         DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA + stage_off, const_alpha);
>         DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..97c5523b927c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -223,19 +223,19 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>  {
>         struct dpu_hw_blk_reg_map *c = &pp->hw;
>         u32 height, init;
> -       u32 line = 0xFFFF;
> +       u32 line = 0xffff;
>
>         if (!pp)
>                 return 0;
>         c = &pp->hw;
>
> -       init = DPU_REG_READ(c, PP_VSYNC_INIT_VAL) & 0xFFFF;
> -       height = DPU_REG_READ(c, PP_SYNC_CONFIG_HEIGHT) & 0xFFFF;
> +       init = DPU_REG_READ(c, PP_VSYNC_INIT_VAL) & 0xffff;
> +       height = DPU_REG_READ(c, PP_SYNC_CONFIG_HEIGHT) & 0xffff;
>
>         if (height < init)
>                 return line;
>
> -       line = DPU_REG_READ(c, PP_INT_COUNT_VAL) & 0xFFFF;
> +       line = DPU_REG_READ(c, PP_INT_COUNT_VAL) & 0xffff;
>
>         if (line < init)
>                 line += (0xFFFF - init);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 691c471b08c2..f182c1ce704c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -488,17 +488,17 @@ static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
>                 ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
>
>                 if (rect_index == DPU_SSPP_RECT_0) {
> -                       ystride0 = (ystride0 & 0xFFFF0000) |
> -                               (cfg->layout.plane_pitch[0] & 0x0000FFFF);
> -                       ystride1 = (ystride1 & 0xFFFF0000)|
> -                               (cfg->layout.plane_pitch[2] & 0x0000FFFF);
> +                       ystride0 = (ystride0 & 0xffff0000) |
> +                               (cfg->layout.plane_pitch[0] & 0x0000ffff);
> +                       ystride1 = (ystride1 & 0xffff0000)|
> +                               (cfg->layout.plane_pitch[2] & 0x0000ffff);
>                 } else {
> -                       ystride0 = (ystride0 & 0x0000FFFF) |
> +                       ystride0 = (ystride0 & 0x0000ffff) |
>                                 ((cfg->layout.plane_pitch[0] << 16) &
> -                                0xFFFF0000);
> -                       ystride1 = (ystride1 & 0x0000FFFF) |
> +                                0xffff0000);
> +                       ystride1 = (ystride1 & 0x0000ffff) |
>                                 ((cfg->layout.plane_pitch[2] << 16) &
> -                                0xFFFF0000);
> +                                0xffff0000);
>                 }
>         }
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 8062228eada6..699ea66b459e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -105,8 +105,8 @@ static void _dpu_hw_setup_scaler3_lut(struct dpu_hw_blk_reg_map *c,
>         u32 lut_addr, lut_offset, lut_len;
>         u32 *lut[QSEED3_FILTERS] = {NULL, NULL, NULL, NULL, NULL};
>         static const uint32_t off_tbl[QSEED3_FILTERS][QSEED3_LUT_REGIONS][2] = {
> -               {{18, 0x000}, {12, 0x120}, {12, 0x1E0}, {8, 0x2A0} },
> -               {{6, 0x320}, {3, 0x3E0}, {3, 0x440}, {3, 0x4A0} },
> +               {{18, 0x000}, {12, 0x120}, {12, 0x1e0}, {8, 0x2a0} },
> +               {{6, 0x320}, {3, 0x3e0}, {3, 0x440}, {3, 0x4a0} },
>                 {{6, 0x500}, {3, 0x5c0}, {3, 0x620}, {3, 0x680} },
>                 {{6, 0x380}, {3, 0x410}, {3, 0x470}, {3, 0x4d0} },
>                 {{6, 0x560}, {3, 0x5f0}, {3, 0x650}, {3, 0x6b0} },
> @@ -231,30 +231,30 @@ static void _dpu_hw_setup_scaler3_de(struct dpu_hw_blk_reg_map *c,
>         if (!de_cfg->enable)
>                 return;
>
> -       sharp_lvl = (de_cfg->sharpen_level1 & 0x1FF) |
> -               ((de_cfg->sharpen_level2 & 0x1FF) << 16);
> +       sharp_lvl = (de_cfg->sharpen_level1 & 0x1ff) |
> +               ((de_cfg->sharpen_level2 & 0x1ff) << 16);
>
> -       sharp_ctl = ((de_cfg->limit & 0xF) << 9) |
> +       sharp_ctl = ((de_cfg->limit & 0xf) << 9) |
>                 ((de_cfg->prec_shift & 0x7) << 13) |
>                 ((de_cfg->clip & 0x7) << 16);
>
> -       shape_ctl = (de_cfg->thr_quiet & 0xFF) |
> -               ((de_cfg->thr_dieout & 0x3FF) << 16);
> +       shape_ctl = (de_cfg->thr_quiet & 0xff) |
> +               ((de_cfg->thr_dieout & 0x3ff) << 16);
>
> -       de_thr = (de_cfg->thr_low & 0x3FF) |
> -               ((de_cfg->thr_high & 0x3FF) << 16);
> +       de_thr = (de_cfg->thr_low & 0x3ff) |
> +               ((de_cfg->thr_high & 0x3ff) << 16);
>
> -       adjust_a = (de_cfg->adjust_a[0] & 0x3FF) |
> -               ((de_cfg->adjust_a[1] & 0x3FF) << 10) |
> -               ((de_cfg->adjust_a[2] & 0x3FF) << 20);
> +       adjust_a = (de_cfg->adjust_a[0] & 0x3ff) |
> +               ((de_cfg->adjust_a[1] & 0x3ff) << 10) |
> +               ((de_cfg->adjust_a[2] & 0x3ff) << 20);
>
> -       adjust_b = (de_cfg->adjust_b[0] & 0x3FF) |
> -               ((de_cfg->adjust_b[1] & 0x3FF) << 10) |
> -               ((de_cfg->adjust_b[2] & 0x3FF) << 20);
> +       adjust_b = (de_cfg->adjust_b[0] & 0x3ff) |
> +               ((de_cfg->adjust_b[1] & 0x3ff) << 10) |
> +               ((de_cfg->adjust_b[2] & 0x3ff) << 20);
>
> -       adjust_c = (de_cfg->adjust_c[0] & 0x3FF) |
> -               ((de_cfg->adjust_c[1] & 0x3FF) << 10) |
> -               ((de_cfg->adjust_c[2] & 0x3FF) << 20);
> +       adjust_c = (de_cfg->adjust_c[0] & 0x3ff) |
> +               ((de_cfg->adjust_c[1] & 0x3ff) << 10) |
> +               ((de_cfg->adjust_c[2] & 0x3ff) << 20);
>
>         DPU_REG_WRITE(c, QSEED3_DE_SHARPEN + offset, sharp_lvl);
>         DPU_REG_WRITE(c, QSEED3_DE_SHARPEN_CTL + offset, sharp_ctl);
> @@ -289,19 +289,19 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
>         op_mode |= (scaler3_cfg->dir_en) ? BIT(4) : 0;
>
>         preload =
> -               ((scaler3_cfg->preload_x[0] & 0x7F) << 0) |
> -               ((scaler3_cfg->preload_y[0] & 0x7F) << 8) |
> -               ((scaler3_cfg->preload_x[1] & 0x7F) << 16) |
> -               ((scaler3_cfg->preload_y[1] & 0x7F) << 24);
> +               ((scaler3_cfg->preload_x[0] & 0x7f) << 0) |
> +               ((scaler3_cfg->preload_y[0] & 0x7f) << 8) |
> +               ((scaler3_cfg->preload_x[1] & 0x7f) << 16) |
> +               ((scaler3_cfg->preload_y[1] & 0x7f) << 24);
>
> -       src_y_rgb = (scaler3_cfg->src_width[0] & 0x1FFFF) |
> -               ((scaler3_cfg->src_height[0] & 0x1FFFF) << 16);
> +       src_y_rgb = (scaler3_cfg->src_width[0] & 0x1ffff) |
> +               ((scaler3_cfg->src_height[0] & 0x1ffff) << 16);
>
> -       src_uv = (scaler3_cfg->src_width[1] & 0x1FFFF) |
> -               ((scaler3_cfg->src_height[1] & 0x1FFFF) << 16);
> +       src_uv = (scaler3_cfg->src_width[1] & 0x1ffff) |
> +               ((scaler3_cfg->src_height[1] & 0x1ffff) << 16);
>
> -       dst = (scaler3_cfg->dst_width & 0x1FFFF) |
> -               ((scaler3_cfg->dst_height & 0x1FFFF) << 16);
> +       dst = (scaler3_cfg->dst_width & 0x1ffff) |
> +               ((scaler3_cfg->dst_height & 0x1ffff) << 16);
>
>         if (scaler3_cfg->de.enable) {
>                 _dpu_hw_setup_scaler3_de(c, &scaler3_cfg->de, scaler_offset);
> @@ -317,33 +317,33 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
>
>         if (scaler_version == 0x1002) {
>                 phase_init =
> -                       ((scaler3_cfg->init_phase_x[0] & 0x3F) << 0) |
> -                       ((scaler3_cfg->init_phase_y[0] & 0x3F) << 8) |
> -                       ((scaler3_cfg->init_phase_x[1] & 0x3F) << 16) |
> -                       ((scaler3_cfg->init_phase_y[1] & 0x3F) << 24);
> +                       ((scaler3_cfg->init_phase_x[0] & 0x3f) << 0) |
> +                       ((scaler3_cfg->init_phase_y[0] & 0x3f) << 8) |
> +                       ((scaler3_cfg->init_phase_x[1] & 0x3f) << 16) |
> +                       ((scaler3_cfg->init_phase_y[1] & 0x3f) << 24);
>                 DPU_REG_WRITE(c, QSEED3_PHASE_INIT + scaler_offset, phase_init);
>         } else {
>                 DPU_REG_WRITE(c, QSEED3_PHASE_INIT_Y_H + scaler_offset,
> -                       scaler3_cfg->init_phase_x[0] & 0x1FFFFF);
> +                       scaler3_cfg->init_phase_x[0] & 0x1fffff);
>                 DPU_REG_WRITE(c, QSEED3_PHASE_INIT_Y_V + scaler_offset,
> -                       scaler3_cfg->init_phase_y[0] & 0x1FFFFF);
> +                       scaler3_cfg->init_phase_y[0] & 0x1fffff);
>                 DPU_REG_WRITE(c, QSEED3_PHASE_INIT_UV_H + scaler_offset,
> -                       scaler3_cfg->init_phase_x[1] & 0x1FFFFF);
> +                       scaler3_cfg->init_phase_x[1] & 0x1fffff);
>                 DPU_REG_WRITE(c, QSEED3_PHASE_INIT_UV_V + scaler_offset,
> -                       scaler3_cfg->init_phase_y[1] & 0x1FFFFF);
> +                       scaler3_cfg->init_phase_y[1] & 0x1fffff);
>         }
>
>         DPU_REG_WRITE(c, QSEED3_PHASE_STEP_Y_H + scaler_offset,
> -               scaler3_cfg->phase_step_x[0] & 0xFFFFFF);
> +               scaler3_cfg->phase_step_x[0] & 0xffffff);
>
>         DPU_REG_WRITE(c, QSEED3_PHASE_STEP_Y_V + scaler_offset,
> -               scaler3_cfg->phase_step_y[0] & 0xFFFFFF);
> +               scaler3_cfg->phase_step_y[0] & 0xffffff);
>
>         DPU_REG_WRITE(c, QSEED3_PHASE_STEP_UV_H + scaler_offset,
> -               scaler3_cfg->phase_step_x[1] & 0xFFFFFF);
> +               scaler3_cfg->phase_step_x[1] & 0xffffff);
>
>         DPU_REG_WRITE(c, QSEED3_PHASE_STEP_UV_V + scaler_offset,
> -               scaler3_cfg->phase_step_y[1] & 0xFFFFFF);
> +               scaler3_cfg->phase_step_y[1] & 0xffffff);
>
>         DPU_REG_WRITE(c, QSEED3_PRELOAD + scaler_offset, preload);
>
> @@ -383,19 +383,19 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
>         u32 val;
>
>         /* matrix coeff - convert S15.16 to S4.9 */
> -       val = ((data->csc_mv[0] >> matrix_shift) & 0x1FFF) |
> -               (((data->csc_mv[1] >> matrix_shift) & 0x1FFF) << 16);
> +       val = ((data->csc_mv[0] >> matrix_shift) & 0x1fff) |
> +               (((data->csc_mv[1] >> matrix_shift) & 0x1fff) << 16);
>         DPU_REG_WRITE(c, csc_reg_off, val);
> -       val = ((data->csc_mv[2] >> matrix_shift) & 0x1FFF) |
> -               (((data->csc_mv[3] >> matrix_shift) & 0x1FFF) << 16);
> +       val = ((data->csc_mv[2] >> matrix_shift) & 0x1fff) |
> +               (((data->csc_mv[3] >> matrix_shift) & 0x1fff) << 16);
>         DPU_REG_WRITE(c, csc_reg_off + 0x4, val);
> -       val = ((data->csc_mv[4] >> matrix_shift) & 0x1FFF) |
> -               (((data->csc_mv[5] >> matrix_shift) & 0x1FFF) << 16);
> +       val = ((data->csc_mv[4] >> matrix_shift) & 0x1fff) |
> +               (((data->csc_mv[5] >> matrix_shift) & 0x1fff) << 16);
>         DPU_REG_WRITE(c, csc_reg_off + 0x8, val);
> -       val = ((data->csc_mv[6] >> matrix_shift) & 0x1FFF) |
> -               (((data->csc_mv[7] >> matrix_shift) & 0x1FFF) << 16);
> +       val = ((data->csc_mv[6] >> matrix_shift) & 0x1fff) |
> +               (((data->csc_mv[7] >> matrix_shift) & 0x1fff) << 16);
>         DPU_REG_WRITE(c, csc_reg_off + 0xc, val);
> -       val = (data->csc_mv[8] >> matrix_shift) & 0x1FFF;
> +       val = (data->csc_mv[8] >> matrix_shift) & 0x1fff;
>         DPU_REG_WRITE(c, csc_reg_off + 0x10, val);
>
>         /* Pre clamp */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> index 16c56e240706..e9991cf00d8a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
> @@ -120,7 +120,7 @@ static u32 dpu_hw_get_limit_conf(struct dpu_hw_vbif *vbif,
>         reg_off += (xin_id / 4) * 4;
>         bit_off = (xin_id % 4) * 8;
>         reg_val = DPU_REG_READ(c, reg_off);
> -       limit = (reg_val >> bit_off) & 0xFF;
> +       limit = (reg_val >> bit_off) & 0xff;
>
>         return limit;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 2d28afdf860e..0b998717c8fc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -124,7 +124,7 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
>         else
>                 outsize = (data->dest.height << 16) | data->dest.width;
>
> -       DPU_REG_WRITE(c, WB_ALPHA_X_VALUE, 0xFF);
> +       DPU_REG_WRITE(c, WB_ALPHA_X_VALUE, 0xff);
>         DPU_REG_WRITE(c, WB_DST_FORMAT, dst_format);
>         DPU_REG_WRITE(c, WB_DST_OP_MODE, opmode);
>         DPU_REG_WRITE(c, WB_DST_PACK_PATTERN, pattern);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 5e6e2626151e..aeb82817e852 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -207,9 +207,9 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
>         base = dpu_kms->mmio + regset->offset;
>
>         /* insert padding spaces, if needed */
> -       if (regset->offset & 0xF) {
> +       if (regset->offset & 0xf) {
>                 seq_printf(s, "[%x]", regset->offset & ~0xF);
> -               for (i = 0; i < (regset->offset & 0xF); i += 4)
> +               for (i = 0; i < (regset->offset & 0xf); i += 4)
>                         seq_puts(s, "         ");
>         }
>
> @@ -218,7 +218,7 @@ static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
>         /* main register output */
>         for (i = 0; i < regset->blk_len; i += 4) {
>                 addr = regset->offset + i;
> -               if ((addr & 0xF) == 0x0)
> +               if ((addr & 0xf) == 0x0)
>                         seq_printf(s, i ? "\n[%x]" : "[%x]", addr);
>                 seq_printf(s, " %08x", readl_relaxed(base + i));
>         }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 658005f609f4..9b4dc08ddd5b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -578,9 +578,9 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
>  static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>         {
>                 /* S15.16 format */
> -               0x00012A00, 0x00000000, 0x00019880,
> -               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> -               0x00012A00, 0x00020480, 0x00000000,
> +               0x00012a00, 0x00000000, 0x00019880,
> +               0x00012a00, 0xffff9b80, 0xffff3000,
> +               0x00012a00, 0x00020480, 0x00000000,
>         },
>         /* signed bias */
>         { 0xfff0, 0xff80, 0xff80,},
> @@ -593,9 +593,9 @@ static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
>  static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>         {
>                 /* S15.16 format */
> -               0x00012A00, 0x00000000, 0x00019880,
> -               0x00012A00, 0xFFFF9B80, 0xFFFF3000,
> -               0x00012A00, 0x00020480, 0x00000000,
> +               0x00012a00, 0x00000000, 0x00019880,
> +               0x00012a00, 0xffff9b80, 0xffff3000,
> +               0x00012a00, 0x00020480, 0x00000000,
>                 },
>         /* signed bias */
>         { 0xffc0, 0xfe00, 0xfe00,},
> @@ -702,7 +702,7 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>         /* update sspp */
>         if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
>                 pdpu->pipe_hw->ops.setup_solidfill(pdpu->pipe_hw,
> -                               (color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
> +                               (color & 0xffffff) | ((alpha & 0xff) << 24),
>                                 pstate->multirect_index);
>
>                 /* override scaler/decimation if solid fill */
> @@ -1083,10 +1083,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>          */
>         if (pdpu->is_error)
>                 /* force white frame with 100% alpha pipe output on error */
> -               _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> +               _dpu_plane_color_fill(pdpu, 0xffffff, 0xff);
>         else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>                 /* force 100% alpha */
> -               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +               _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xff);
>         else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>                 const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
>                 const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 1305e250b71e..cf24eeadd1b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -192,7 +192,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
>         if (vbif->ops.set_write_gather_en && !params->rd)
>                 vbif->ops.set_write_gather_en(vbif, params->xin_id);
>
> -       ot_lim = _dpu_vbif_get_ot_limit(vbif, params) & 0xFF;
> +       ot_lim = _dpu_vbif_get_ot_limit(vbif, params) & 0xff;
>
>         if (ot_lim == 0)
>                 return;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1f1555aa02d2..fb3c4a620517 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -76,7 +76,7 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
>                              },
>                 .nb_stages = 5,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 3,
> @@ -159,7 +159,7 @@ static const struct mdp5_cfg_hw msm8x74v2_config = {
>                              },
>                 .nb_stages = 5,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 3,
> @@ -258,7 +258,7 @@ static const struct mdp5_cfg_hw apq8084_config = {
>                              },
>                 .nb_stages = 5,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 4,
> @@ -340,7 +340,7 @@ static const struct mdp5_cfg_hw msm8x16_config = {
>                              },
>                 .nb_stages = 8,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 1,
> @@ -412,7 +412,7 @@ static const struct mdp5_cfg_hw msm8x36_config = {
>                                 },
>                 .nb_stages = 8,
>                 .max_width = 2560,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .pp = {
>                 .count = 1,
> @@ -510,7 +510,7 @@ static const struct mdp5_cfg_hw msm8x94_config = {
>                              },
>                 .nb_stages = 8,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 4,
> @@ -616,7 +616,7 @@ static const struct mdp5_cfg_hw msm8x96_config = {
>                              },
>                 .nb_stages = 8,
>                 .max_width = 2560,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 2,
> @@ -708,7 +708,7 @@ const struct mdp5_cfg_hw msm8x76_config = {
>         },
>         .pipe_cursor = {
>                 .count = 1,
> -               .base = { 0x440DC },
> +               .base = { 0x440dc },
>                 .caps = MDP_PIPE_CAP_HFLIP      |
>                         MDP_PIPE_CAP_VFLIP      |
>                         MDP_PIPE_CAP_SW_PIX_EXT |
> @@ -726,7 +726,7 @@ const struct mdp5_cfg_hw msm8x76_config = {
>                              },
>                 .nb_stages = 8,
>                 .max_width = 2560,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 1,
> @@ -814,7 +814,7 @@ static const struct mdp5_cfg_hw msm8x53_config = {
>                              },
>                 .nb_stages = 5,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 1,
> @@ -905,7 +905,7 @@ static const struct mdp5_cfg_hw msm8917_config = {
>                              },
>                 .nb_stages = 8,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 1,
> @@ -1004,7 +1004,7 @@ static const struct mdp5_cfg_hw msm8998_config = {
>                              },
>                 .nb_stages = 8,
>                 .max_width = 2560,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 2,
> @@ -1102,7 +1102,7 @@ static const struct mdp5_cfg_hw sdm630_config = {
>                                 },
>                 .nb_stages = 8,
>                 .max_width = 2048,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 1,
> @@ -1200,7 +1200,7 @@ static const struct mdp5_cfg_hw sdm660_config = {
>                                 },
>                 .nb_stages = 8,
>                 .max_width = 2560,
> -               .max_height = 0xFFFF,
> +               .max_height = 0xffff,
>         },
>         .dspp = {
>                 .count = 2,
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index e86421c69bd1..7ca78adcdeb4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -293,7 +293,7 @@ static void blend_setup(struct drm_crtc *crtc)
>                 blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
>                         MDP5_LM_BLEND_OP_MODE_BG_ALPHA(BG_CONST);
>                 fg_alpha = pstates[i]->base.alpha >> 8;
> -               bg_alpha = 0xFF - fg_alpha;
> +               bg_alpha = 0xff - fg_alpha;
>
>                 if (!format->alpha_enable && bg_alpha_enabled)
>                         mixer_op_mode = 0;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> index 79d67c495780..eeba31ed993e 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
> @@ -70,11 +70,11 @@ static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
>                                 format |= 0x15;
>                                 break;
>                         case 6:
> -                               format |= 0x2A;
> +                               format |= 0x2a;
>                                 break;
>                         case 8:
>                         default:
> -                               format |= 0x3F;
> +                               format |= 0x3f;
>                                 break;
>                         }
>                         break;
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 6666783e1468..ff7f1620c3fb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -86,10 +86,10 @@ static u8 dp_audio_calculate_parity(u32 data)
>         u8 iData = 0;
>         u8 i = 0;
>         u8 parity_byte;
> -       u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
> +       u8 num_byte = (data & 0xff00) > 0 ? 8 : 2;
>
>         for (i = 0; i < num_byte; i++) {
> -               iData = (data >> i*4) & 0xF;
> +               iData = (data >> i*4) & 0xf;
>
>                 ci = iData ^ x1;
>                 x1 = x0 ^ dp_audio_get_g1_value(ci);
> @@ -295,7 +295,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
>         value = dp_audio_get_header(catalog,
>                         DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
>
> -       new_value = 0x0F;
> +       new_value = 0x0f;
>         parity_byte = dp_audio_calculate_parity(new_value);
>         value |= ((new_value << HEADER_BYTE_2_BIT)
>                         | (parity_byte << PARITY_BYTE_2_BIT));
> @@ -344,7 +344,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
>         value = dp_audio_get_header(catalog,
>                         DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
>
> -       new_value = 0x0F;
> +       new_value = 0x0f;
>         parity_byte = dp_audio_calculate_parity(new_value);
>         value |= ((new_value << HEADER_BYTE_2_BIT)
>                         | (parity_byte << PARITY_BYTE_2_BIT));
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index d030a93a08c3..4ed7286ea813 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -154,7 +154,7 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
>                 data = dp_catalog_aux_read_data(aux->catalog);
>                 *dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
>
> -               actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
> +               actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xff;
>                 if (i != actual_i)
>                         break;
>         }
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 676279d0ca8d..49b3070f6b41 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -445,12 +445,12 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>                         (unsigned long)(1 << 16) - 1, &den, &num);
>
>         den = ~(den - num);
> -       den = den & 0xFFFF;
> +       den = den & 0xffff;
>         pixel_m = num;
>         pixel_n = den;
>
> -       mvid = (pixel_m & 0xFFFF) * 5;
> -       nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
> +       mvid = (pixel_m & 0xffff) * 5;
> +       nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xffff);
>
>         if (nvid < nvid_fixed) {
>                 u32 temp;
> @@ -728,13 +728,13 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>                                 DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
>                 /* 00111110000011111000001111100000 */
>                 dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
> -                               0x3E0F83E0);
> +                               0x3e0f83e0);
>                 /* 00001111100000111110000011111000 */
>                 dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
> -                               0x0F83E0F8);
> +                               0x0f83e0f8);
>                 /* 1111100000111110 */
>                 dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
> -                               0x0000F83E);
> +                               0x0000f83e);
>                 break;
>         case DP_PHY_TEST_PATTERN_CP2520:
>                 value = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> @@ -1085,7 +1085,7 @@ void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
>
>         safe_to_exit_level = dp_catalog->audio_data;
>         mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
> -       mainlink_levels &= 0xFE0;
> +       mainlink_levels &= 0xfe0;
>         mainlink_levels |= safe_to_exit_level;
>
>         drm_dbg_dp(catalog->drm_dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 3854c9f1f7e9..14f245d33ee2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -421,7 +421,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>         temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
>         temp2_fp = drm_fixp_div(temp1_fp, tu->average_valid2_fp);
>         tu->n_tus = drm_fixp2int(temp2_fp);
> -       if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
> +       if ((temp2_fp & 0xffffffff) > 0xfffff000)
>                 tu->n_tus += 1;
>
>         temp1_fp = drm_fixp_from_fraction(tu->n_tus, 1);
> @@ -720,7 +720,7 @@ static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
>         temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
>         temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
>         tu->n_tus = drm_fixp2int(temp2_fp);
> -       if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
> +       if ((temp2_fp & 0xffffffff) > 0xfffff000)
>                 tu->n_tus += 1;
>
>         tu->even_distribution_legacy = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aeff3f0d..063f7ac79cfd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1202,7 +1202,7 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>
>         hpd_isr_status = dp_catalog_hpd_get_intr_status(dp->catalog);
>
> -       if (hpd_isr_status & 0x0F) {
> +       if (hpd_isr_status & 0x0f) {
>                 drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
>                         dp->dp_display.connector_type, hpd_isr_status);
>                 /* hpd related interrupts */
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36bb6191d2f0..e584f783a2e3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -97,7 +97,7 @@ static int dp_link_get_period(struct dp_link_private *link, int const addr)
>  {
>         int ret = 0;
>         u8 data;
> -       u32 const max_audio_period = 0xA;
> +       u32 const max_audio_period = 0xa;
>
>         /* TEST_AUDIO_PERIOD_CH_XX */
>         if (drm_dp_dpcd_readb(link->aux, addr, &data) < 0) {
> @@ -107,7 +107,7 @@ static int dp_link_get_period(struct dp_link_private *link, int const addr)
>         }
>
>         /* Period - Bits 3:0 */
> -       data = data & 0xF;
> +       data = data & 0xf;
>         if ((int)data > max_audio_period) {
>                 DRM_ERROR("invalid test_audio_period_ch_1 = 0x%x\n", data);
>                 ret = -EINVAL;
> @@ -228,7 +228,7 @@ static int dp_link_parse_audio_mode(struct dp_link_private *link)
>         }
>
>         /* Sampling Rate - Bits 3:0 */
> -       sampling_rate = data & 0xF;
> +       sampling_rate = data & 0xf;
>         if (sampling_rate > max_audio_sampling_rate) {
>                 DRM_ERROR("sampling rate (0x%x) greater than max (0x%x)\n",
>                                 sampling_rate, max_audio_sampling_rate);
> @@ -237,7 +237,7 @@ static int dp_link_parse_audio_mode(struct dp_link_private *link)
>         }
>
>         /* Channel Count - Bits 7:4 */
> -       channel_count = ((data & 0xF0) >> 4) + 1;
> +       channel_count = ((data & 0xf0) >> 4) + 1;
>         if (channel_count > max_audio_channel_count) {
>                 DRM_ERROR("channel_count (0x%x) greater than max (0x%x)\n",
>                                 channel_count, max_audio_channel_count);
> @@ -343,7 +343,7 @@ static int dp_link_parse_timing_params2(struct dp_link_private *link,
>         }
>
>         *val1 = (bp[0] & BIT(7)) >> 7;
> -       *val2 = bp[1] | ((bp[0] & 0x7F) << 8);
> +       *val2 = bp[1] | ((bp[0] & 0x7f) << 8);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index 27b592c776a3..1a2519ef881f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -885,9 +885,9 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy,
>         data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
>
>         /* TODO: only power up lanes that are used */
> -       data |= 0x1F;
> +       data |= 0x1f;
>         dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
> -       dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0x1F);
> +       dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0x1f);
>
>         /* Select full-rate mode */
>         dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_2, 0x40);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9e7fa7d88ead..92c345bc2800 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -870,7 +870,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>                 glbl_str_swi_cal_sel_ctrl = 0x00;
>                 glbl_hstx_str_ctrl_0 = 0x88;
>         } else {
> -               vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
> +               vreg_ctrl_0 = less_than_1500_mhz ? 0x5b : 0x59;
>                 if (phy->cphy_mode) {
>                         glbl_str_swi_cal_sel_ctrl = 0x03;
>                         glbl_hstx_str_ctrl_0 = 0x66;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 93fe61b86967..d2d36f66a4d2 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -434,12 +434,12 @@ static int msm_hdmi_audio_hw_params(struct device *dev, void *data,
>                 break;
>         case 6:
>                 /* RR, RL, FC, LFE, FR and FL speakers */
> -               channel_allocation  = 0x0B;
> +               channel_allocation  = 0x0b;
>                 chan = MSM_HDMI_AUDIO_CHANNEL_6;
>                 break;
>         case 8:
>                 /* FRC, FLC, RR, RL, FC, LFE, FR and FL speakers */
> -               channel_allocation  = 0x1F;
> +               channel_allocation  = 0x1f;
>                 chan = MSM_HDMI_AUDIO_CHANNEL_8;
>                 break;
>         default:
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
> index e7748461cffc..2e13ca7e7acb 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
> @@ -494,8 +494,8 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>          * HDCP setup prior to enabling HDCP_CTRL.
>          * Setup seed values for random number An.
>          */
> -       hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL0, 0xB1FFB0FF);
> -       hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL1, 0xF00DFACE);
> +       hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL0, 0xb1ffb0ff);
> +       hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL1, 0xf00dface);
>
>         /* Disable the RngCipher state */
>         reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DEBUG_CTRL);
> @@ -660,11 +660,11 @@ static int msm_hdmi_hdcp_send_aksv_an(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>
>         DBG("Link ASKV=%08x%08x", link0_aksv_0, link0_aksv_1);
>         /* Copy An and AKSV to byte arrays for transmission */
> -       aksv[0] =  link0_aksv_0        & 0xFF;
> -       aksv[1] = (link0_aksv_0 >> 8)  & 0xFF;
> -       aksv[2] = (link0_aksv_0 >> 16) & 0xFF;
> -       aksv[3] = (link0_aksv_0 >> 24) & 0xFF;
> -       aksv[4] =  link0_aksv_1        & 0xFF;
> +       aksv[0] =  link0_aksv_0        & 0xff;
> +       aksv[1] = (link0_aksv_0 >> 8)  & 0xff;
> +       aksv[2] = (link0_aksv_0 >> 16) & 0xff;
> +       aksv[3] = (link0_aksv_0 >> 24) & 0xff;
> +       aksv[4] =  link0_aksv_1        & 0xff;
>
>         /* Write An to offset 0x18 */
>         rc = msm_hdmi_ddc_write(hdmi, HDCP_PORT_ADDR, 0x18, (u8 *)link0_an,
> @@ -681,7 +681,7 @@ static int msm_hdmi_hdcp_send_aksv_an(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>                 pr_err("%s:AKSV write failed\n", __func__);
>                 return rc;
>         }
> -       DBG("Link0-AKSV=%02x%08x", link0_aksv_1 & 0xFF, link0_aksv_0);
> +       DBG("Link0-AKSV=%02x%08x", link0_aksv_1 & 0xff, link0_aksv_0);
>
>         return 0;
>  }
> @@ -879,7 +879,7 @@ static int msm_hdmi_hdcp_recv_check_bstatus(struct hdmi_hdcp_ctrl *hdcp_ctrl,
>         *pbstatus = bstatus = (buf[1] << 8) | buf[0];
>
>
> -       down_stream_devices = bstatus & 0x7F;
> +       down_stream_devices = bstatus & 0x7f;
>         repeater_cascade_depth = (bstatus >> 8) & 0x7;
>         max_devs_exceeded = (bstatus & BIT(7)) ? true : false;
>         max_cascade_exceeded = (bstatus & BIT(11)) ? true : false;
> @@ -996,7 +996,7 @@ static int msm_hdmi_hdcp_transfer_v_h(struct hdmi_hdcp_ctrl *hdcp_ctrl)
>                 {REG_HDMI_HDCP_RCVPORT_DATA7,  0x20, "V' H0"},
>                 {REG_HDMI_HDCP_RCVPORT_DATA8,  0x24, "V' H1"},
>                 {REG_HDMI_HDCP_RCVPORT_DATA9,  0x28, "V' H2"},
> -               {REG_HDMI_HDCP_RCVPORT_DATA10, 0x2C, "V' H3"},
> +               {REG_HDMI_HDCP_RCVPORT_DATA10, 0x2c, "V' H3"},
>                 {REG_HDMI_HDCP_RCVPORT_DATA11, 0x30, "V' H4"},
>         };
>         struct hdmi_hdcp_reg_data *rd;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> index 4dd055416620..3845e2e7ea4c 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> @@ -335,7 +335,7 @@ static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
>
>                 cfg->tx_lx_vmode_ctrl2[0] =
>                         cfg->tx_lx_vmode_ctrl2[1] =
> -                       cfg->tx_lx_vmode_ctrl2[2] = 0x0D;
> +                       cfg->tx_lx_vmode_ctrl2[2] = 0x0d;
>
>                 cfg->tx_lx_vmode_ctrl2[3] = 0x00;
>         } else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
> @@ -347,14 +347,14 @@ static int pll_calculate(unsigned long pix_clk, unsigned long ref_clk,
>
>                 cfg->tx_lx_vmode_ctrl2[0] =
>                         cfg->tx_lx_vmode_ctrl2[1] =
> -                       cfg->tx_lx_vmode_ctrl2[2] = 0x0D;
> +                       cfg->tx_lx_vmode_ctrl2[2] = 0x0d;
>                 cfg->tx_lx_vmode_ctrl2[3] = 0x00;
>         } else {
>                 for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
>                         cfg->tx_lx_tx_drv_lvl[i] = 0x20;
>                         cfg->tx_lx_tx_emp_post1_lvl[i] = 0x20;
>                         cfg->tx_lx_vmode_ctrl1[i] = 0x00;
> -                       cfg->tx_lx_vmode_ctrl2[i] = 0x0E;
> +                       cfg->tx_lx_vmode_ctrl2[i] = 0x0e;
>                 }
>         }
>
> @@ -418,8 +418,8 @@ static int hdmi_8996_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
>
>         hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1);
>         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_RESETSM_CNTRL, 0x20);
> -       hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0F);
> -       hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0F);
> +       hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0f);
> +       hdmi_phy_write(phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0f);
>
>         for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
>                 hdmi_tx_chan_write(pll, i,
> @@ -438,18 +438,18 @@ static int hdmi_8996_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
>         hdmi_tx_chan_write(pll, 2, REG_HDMI_PHY_QSERDES_TX_LX_LANE_MODE,
>                            cfg.tx_lx_lane_mode[2]);
>
> -       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1E);
> +       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1e);
>         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x07);
>         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYSCLK_EN_SEL, 0x37);
>         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SYS_CLK_CTRL, 0x02);
> -       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CLK_ENABLE1, 0x0E);
> +       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_CLK_ENABLE1, 0x0e);
>
>         /* Bypass VCO calibration */
>         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SVS_MODE_CLK_SEL,
>                        cfg.com_svs_mode_clk_sel);
>
> -       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BG_TRIM, 0x0F);
> -       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_PLL_IVCO, 0x0F);
> +       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_BG_TRIM, 0x0f);
> +       hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_PLL_IVCO, 0x0f);
>         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_VCO_TUNE_CTRL,
>                        cfg.com_vco_tune_ctrl);
>
> @@ -529,7 +529,7 @@ static int hdmi_8996_pll_set_clk_rate(struct clk_hw *hw, unsigned long rate,
>         }
>
>         hdmi_phy_write(phy, REG_HDMI_8996_PHY_MODE, cfg.phy_mode);
> -       hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1F);
> +       hdmi_phy_write(phy, REG_HDMI_8996_PHY_PD_CTL, 0x1f);
>
>         /*
>          * Ensure that vco configuration gets flushed to hardware before
> @@ -608,7 +608,7 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
>         for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
>                 hdmi_tx_chan_write(pll, i,
>                         REG_HDMI_PHY_QSERDES_TX_LX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN,
> -                       0x6F);
> +                       0x6f);
>
>         /* Disable SSC */
>         hdmi_pll_write(pll, REG_HDMI_PHY_QSERDES_COM_SSC_PER1, 0x0);
> --
> 2.37.3
>
