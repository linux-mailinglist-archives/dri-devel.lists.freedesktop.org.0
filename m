Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A309888D1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 18:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14CF10E214;
	Fri, 27 Sep 2024 16:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QG6MQcFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFF910E214;
 Fri, 27 Sep 2024 16:13:58 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-8325044e388so88950839f.0; 
 Fri, 27 Sep 2024 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727453638; x=1728058438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEn58HecF0TosxZt+Dqr3/YCoDZ17RngyusZkdzm+yE=;
 b=QG6MQcFufja46P10zbV+GJM5RRtsNBMEaohA5zIbXQ+u4+kaRuYeo9++c6crVCAi1j
 KZtOxxaeoWVoXRP7PPahDdsIpQMWiYhHL41nUqbd0wJhuB2o1h+s69pjypisI+6R9Fl5
 a7M3C6e/ezX0300zlig4HZzCol8donPwecoYaCzRaKLxLh3Vks8XiUmrWHdHJQ8UmYXe
 2/uOKqvgsKDzGSg3Zt189KCgdCFJShDULc5ivLM8b+cCViC5BgSmUmXQQnR57wrCiNqb
 xxw87h3mYVpMc5v1xRB/imTXXFHlxz0ZShuUvvs2VGWVKmmKlKUG+KjPtNueEbEGnbC7
 +IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727453638; x=1728058438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEn58HecF0TosxZt+Dqr3/YCoDZ17RngyusZkdzm+yE=;
 b=RNYMlaNm46wDHNvlyknjm1H+XL0e8oCJfqPWsWMdJGC9BRI4gbXL5hgIj5ZVHyJ7L6
 /4csr5kQ4fA3RfWJkFkJERSooLe908VKfzNObql2XSczFkCplU5rQHrFJEPdlh6Sm2YT
 G5rzdfqOXA9gHXrH3cs4KriOovvdhKD+QpfH5wyG6bA/ONlWVvqAUWFb2W+TNWrBD/JI
 +M8u53lFlru2qYtFkwHeU98ZnpYwnuKmkFABndtdbib2L4hf67eySzwpwdpsIAr80RAT
 tKVoxdg5ZQpUyYaqN/8Rk08a6AgxxN5qoaFiMOyVcyZfHSVdCAy+9BHSJkG2WYmAdGlw
 9PyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3eYDef54oMC1u05F7XrT9NN1R5DXLuYvrPaRg8SneQLtPob5QF4iBkn5DClYnUMTfkyNuzEu4dNth@lists.freedesktop.org,
 AJvYcCWtqCFPzF0cqgmtxorEI58v6wNkInwVUg2jVPq28DoNTbKrvuT31MIk8gkTfDxrjli909Btsfyo708=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxlx/8fLOIF9ZDx11Vk7pey9wLHkEVHFCvdIh1Eiav5NbJQc4tW
 7t6sF3H8LKWAib2fwDnao76f5A6SGPL+Zyad2lWCGwqexR8Ww06nq95e111Qvtkr9J/CQIn66ex
 gd9fcylONmJjNLSAo1YjZVKWKtbw=
X-Google-Smtp-Source: AGHT+IG8J8ayTBM0SIM96790nCwHY2riAMEY+VMgtSqhHWVj3meExklYvjvN+tePgujrZ2Yd48FUNnuFRhUvZao5JCU=
X-Received: by 2002:a05:6e02:1c8f:b0:3a0:a385:9128 with SMTP id
 e9e14a558f8ab-3a345169251mr36411535ab.6.1727453637742; Fri, 27 Sep 2024
 09:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-5-7b6e1ef3648f@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 27 Sep 2024 09:13:45 -0700
Message-ID: <CAF6AEGtgSCpsOvikwEchyLhT3mnA38oanLGgbBvJVPhaFa+M2g@mail.gmail.com>
Subject: Re: [PATCH v6 05/11] drm/msm/a6xx: Implement preemption for a7xx
 targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 26, 2024 at 2:17=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 283 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 +++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 377 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 825 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index f5e2838c6a76505b353f83c9fe9c997f1c282701..32e915109a59dda96ed76ddd2=
b4f57bb225f4572 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -23,6 +23,7 @@ adreno-y :=3D \
>         adreno/a6xx_gpu.o \
>         adreno/a6xx_gmu.o \
>         adreno/a6xx_hfi.o \
> +       adreno/a6xx_preempt.o \
>
>  adreno-$(CONFIG_DEBUG_FS) +=3D adreno/a5xx_debugfs.o \
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 6e065500b64d6d95599d89c33e6703c92f210047..355a3e210335d60a5bed0ee28=
7912271c353402a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,84 @@
>
>  #define GPU_PAS_ID 13
>
> +/* IFPC & Preemption static powerup restore list */
> +static const uint32_t a7xx_pwrup_reglist[] =3D {
> +       REG_A6XX_UCHE_TRAP_BASE,
> +       REG_A6XX_UCHE_TRAP_BASE + 1,
> +       REG_A6XX_UCHE_WRITE_THRU_BASE,
> +       REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> +       REG_A6XX_UCHE_GMEM_RANGE_MIN,
> +       REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> +       REG_A6XX_UCHE_GMEM_RANGE_MAX,
> +       REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> +       REG_A6XX_UCHE_CACHE_WAYS,
> +       REG_A6XX_UCHE_MODE_CNTL,
> +       REG_A6XX_RB_NC_MODE_CNTL,
> +       REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> +       REG_A7XX_GRAS_NC_MODE_CNTL,
> +       REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE,
> +       REG_A6XX_UCHE_GBIF_GX_CONFIG,
> +       REG_A6XX_UCHE_CLIENT_PF,
> +       REG_A6XX_TPL1_DBG_ECO_CNTL1,
> +};
> +
> +static const uint32_t a7xx_ifpc_pwrup_reglist[] =3D {
> +       REG_A6XX_TPL1_NC_MODE_CNTL,
> +       REG_A6XX_SP_NC_MODE_CNTL,
> +       REG_A6XX_CP_DBG_ECO_CNTL,
> +       REG_A6XX_CP_PROTECT_CNTL,
> +       REG_A6XX_CP_PROTECT(0),
> +       REG_A6XX_CP_PROTECT(1),
> +       REG_A6XX_CP_PROTECT(2),
> +       REG_A6XX_CP_PROTECT(3),
> +       REG_A6XX_CP_PROTECT(4),
> +       REG_A6XX_CP_PROTECT(5),
> +       REG_A6XX_CP_PROTECT(6),
> +       REG_A6XX_CP_PROTECT(7),
> +       REG_A6XX_CP_PROTECT(8),
> +       REG_A6XX_CP_PROTECT(9),
> +       REG_A6XX_CP_PROTECT(10),
> +       REG_A6XX_CP_PROTECT(11),
> +       REG_A6XX_CP_PROTECT(12),
> +       REG_A6XX_CP_PROTECT(13),
> +       REG_A6XX_CP_PROTECT(14),
> +       REG_A6XX_CP_PROTECT(15),
> +       REG_A6XX_CP_PROTECT(16),
> +       REG_A6XX_CP_PROTECT(17),
> +       REG_A6XX_CP_PROTECT(18),
> +       REG_A6XX_CP_PROTECT(19),
> +       REG_A6XX_CP_PROTECT(20),
> +       REG_A6XX_CP_PROTECT(21),
> +       REG_A6XX_CP_PROTECT(22),
> +       REG_A6XX_CP_PROTECT(23),
> +       REG_A6XX_CP_PROTECT(24),
> +       REG_A6XX_CP_PROTECT(25),
> +       REG_A6XX_CP_PROTECT(26),
> +       REG_A6XX_CP_PROTECT(27),
> +       REG_A6XX_CP_PROTECT(28),
> +       REG_A6XX_CP_PROTECT(29),
> +       REG_A6XX_CP_PROTECT(30),
> +       REG_A6XX_CP_PROTECT(31),
> +       REG_A6XX_CP_PROTECT(32),
> +       REG_A6XX_CP_PROTECT(33),
> +       REG_A6XX_CP_PROTECT(34),
> +       REG_A6XX_CP_PROTECT(35),
> +       REG_A6XX_CP_PROTECT(36),
> +       REG_A6XX_CP_PROTECT(37),
> +       REG_A6XX_CP_PROTECT(38),
> +       REG_A6XX_CP_PROTECT(39),
> +       REG_A6XX_CP_PROTECT(40),
> +       REG_A6XX_CP_PROTECT(41),
> +       REG_A6XX_CP_PROTECT(42),
> +       REG_A6XX_CP_PROTECT(43),
> +       REG_A6XX_CP_PROTECT(44),
> +       REG_A6XX_CP_PROTECT(45),
> +       REG_A6XX_CP_PROTECT(46),
> +       REG_A6XX_CP_PROTECT(47),
> +       REG_A6XX_CP_AHB_CNTL,
> +};

Should we put these in a6xx_catalog.c, in a6xx_info instead?  I guess
they'd differ on a6xx if we enabled preemption there (at a minimum,
the # of CP_PROTECT regs differs btwn a6xx sub-generations)

BR,
-R
