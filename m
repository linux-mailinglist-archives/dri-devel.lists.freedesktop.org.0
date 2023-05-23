Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D385F70E12A
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13910E467;
	Tue, 23 May 2023 15:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC0210E464;
 Tue, 23 May 2023 15:57:15 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1962e7284baso5455917fac.3; 
 Tue, 23 May 2023 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684857434; x=1687449434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRQKQx8o7pYZMBO/dPIhBa/weTc59LxA8RBQRRvbAww=;
 b=nIEgy4xsmB+3hYy0CDH3MPkPWE5BrLDU5tN7cSIz3IzgJBvUH63E7oD9+J8dFGHW9L
 FBZbFIgKNh8FcUIK+6hwQfqH84IMyWxuYNPVjHn+W1EB9utNHces2xfBTPye8n7jt8Tq
 0M8B3LQCzG2nX5FKJV/Tgx3TrxVg+uNFPJ6ZBLP0xSSdPeXhuv+JU9S7B+REPf7DKtFJ
 KEvlWJocc0Ml50bYDpWW+Qn4erdWJqgeHE9UPd/j4CCJUhgFIZzzEVhqh5p3fCV+rOIV
 uwSe4xyITKa9BhftK4hXho1frTE+zqE820is8Ci3xzkG9ZEEVVaL4jV5XuDAqCDQDU5x
 kxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684857434; x=1687449434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRQKQx8o7pYZMBO/dPIhBa/weTc59LxA8RBQRRvbAww=;
 b=HnmJv+QmTfuUQ7Sut/NC82KoRy3H4CiVivcoG0AQBYGqlIAkqcM5vTU7zC3jstWMyX
 41eXB2bVNVUogOQQqXppZXPArghaRfCRMlG6KWejPTbw0YGTYIh2Ga59WXxecPB+vW+7
 Ak8cPk0RcZ0Lu7eXMNFwbBkrFS13PtIXs7xoQzBEBjJASerMUyM0H5Cz5fBP7japXktS
 CnFEoPXkjsarmjC8CcrK68L9f0a1wZFkjKEOL6ffV+bHchaFTFoDja8F67TMEPPbbXk+
 LcfmpYXfw8oOE7mf9phYLUAOcpNyzGUU7eYtZt065aXM67ysw0s8/W8evzaWmeMeln8j
 zQCg==
X-Gm-Message-State: AC+VfDyielh8rrfX+JUEUhNptw7DNmEl3Agh8OowzkeC1Wc8sLJ9WB2d
 MGxoksmFJYso1zfxJ+5S8dtVduScfwwCKtE9N30=
X-Google-Smtp-Source: ACHHUZ7DHxeQXuGbDyGY66H9cdMMYdFh6mTJpvChsFzqktlYAXoSFaO4ugdpNPumCfSnl1H7T26HF1Xrnt8cWO29BAg=
X-Received: by 2002:a05:6808:6393:b0:398:af5:a18a with SMTP id
 ec19-20020a056808639300b003980af5a18amr3200495oib.59.1684857434503; Tue, 23
 May 2023 08:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230523031709.19673-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230523031709.19673-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 May 2023 11:57:03 -0400
Message-ID: <CADnq5_NKuq8ZO0mBMmogwTesr1gWa=aXO9BJFp0bnfWhYj7X7A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Modify mismatched function name
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: nathan@kernel.org, Xinhui.Pan@amd.com, trix@redhat.com,
 llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, Abaci Robot <abaci@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, May 22, 2023 at 11:17=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:426: warning: expecting prototyp=
e for sdma_v4_4_2_gfx_stop(). Prototype was for sdma_v4_4_2_inst_gfx_stop()=
 instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:457: warning: expecting prototyp=
e for sdma_v4_4_2_rlc_stop(). Prototype was for sdma_v4_4_2_inst_rlc_stop()=
 instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:470: warning: expecting prototyp=
e for sdma_v4_4_2_page_stop(). Prototype was for sdma_v4_4_2_inst_page_stop=
() instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:506: warning: expecting prototyp=
e for sdma_v4_4_2_ctx_switch_enable(). Prototype was for sdma_v4_4_2_inst_c=
tx_switch_enable() instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:561: warning: expecting prototyp=
e for sdma_v4_4_2_enable(). Prototype was for sdma_v4_4_2_inst_enable() ins=
tead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:798: warning: expecting prototyp=
e for sdma_v4_4_2_rlc_resume(). Prototype was for sdma_v4_4_2_inst_rlc_resu=
me() instead.
> drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c:814: warning: expecting prototyp=
e for sdma_v4_4_2_load_microcode(). Prototype was for sdma_v4_4_2_inst_load=
_microcode() instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5283
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/a=
md/amdgpu/sdma_v4_4_2.c
> index bf47eb33c12e..590b08585901 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -415,7 +415,7 @@ static void sdma_v4_4_2_ring_emit_fence(struct amdgpu=
_ring *ring, u64 addr, u64
>
>
>  /**
> - * sdma_v4_4_2_gfx_stop - stop the gfx async dma engines
> + * sdma_v4_4_2_inst_gfx_stop - stop the gfx async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -446,7 +446,7 @@ static void sdma_v4_4_2_inst_gfx_stop(struct amdgpu_d=
evice *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_rlc_stop - stop the compute async dma engines
> + * sdma_v4_4_2_inst_rlc_stop - stop the compute async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -459,7 +459,7 @@ static void sdma_v4_4_2_inst_rlc_stop(struct amdgpu_d=
evice *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_page_stop - stop the page async dma engines
> + * sdma_v4_4_2_inst_page_stop - stop the page async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -494,7 +494,7 @@ static void sdma_v4_4_2_inst_page_stop(struct amdgpu_=
device *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_ctx_switch_enable - stop the async dma engines context sw=
itch
> + * sdma_v4_4_2_inst_ctx_switch_enable - stop the async dma engines conte=
xt switch
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs context switch.
> @@ -548,7 +548,7 @@ static void sdma_v4_4_2_inst_ctx_switch_enable(struct=
 amdgpu_device *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_enable - stop the async dma engines
> + * sdma_v4_4_2_inst_enable - stop the async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs.
> @@ -786,7 +786,7 @@ static void sdma_v4_4_2_init_pg(struct amdgpu_device =
*adev)
>  }
>
>  /**
> - * sdma_v4_4_2_rlc_resume - setup and start the async dma engines
> + * sdma_v4_4_2_inst_rlc_resume - setup and start the async dma engines
>   *
>   * @adev: amdgpu_device pointer
>   *
> @@ -802,7 +802,7 @@ static int sdma_v4_4_2_inst_rlc_resume(struct amdgpu_=
device *adev,
>  }
>
>  /**
> - * sdma_v4_4_2_load_microcode - load the sDMA ME ucode
> + * sdma_v4_4_2_inst_load_microcode - load the sDMA ME ucode
>   *
>   * @adev: amdgpu_device pointer
>   *
> --
> 2.20.1.7.g153144c
>
