Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C0B2B91D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 08:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047EF10E0EE;
	Tue, 19 Aug 2025 06:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LmdZg7o/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A001710E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 06:08:53 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-30ccec59b4bso4073595fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 23:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755583732; x=1756188532;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZXR2SIVmzRbhWkmgj79yu4WBPuxOGQNxUcObjKJ7UfA=;
 b=LmdZg7o/6EihjXGMPC+ME3tWp+4S/mJoDJTHCLoffGPOKPMwHwRd8m/fxYNmd/WGkZ
 863sR5fe0whg6i4hCTXTcbpae0cduEV1nwRZLvLiD2WzFQMJMtR71a103hIfbSMvsaBP
 VKU4dXCNCgt6Xgv28LFNjVRITF1vm3SNNkFUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755583732; x=1756188532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXR2SIVmzRbhWkmgj79yu4WBPuxOGQNxUcObjKJ7UfA=;
 b=VwklQ2FTeNpeMEjJ2+42YD4ckVjHlhHsfw3if78wlgXB44zuCEREGiO03uANBYQmL6
 FyzacBxe6DY582vG9DPZlXj20DRCpVu+SJlUfeftrPrCTE7eAW2Qvojrc6U7F7aRfyGc
 TMzQTe2DmOkv4VS6ZJ7JH07s5QZubNigYL0SzG0D5uzLXpxSPAJM63VkTwQqHN0x3lTH
 umoI9dG1GBog1S8J3hrPP/MdGgU/QKLy2iGJHPa7HJ674wyY4Izys/NSFQo2infqrGE+
 PXBXjSLJfnM7CPx8h+cREvQvrydTdI1qzf4wkYIWvlx2eRjZ8+D55SKBLtIF0ntao7KN
 DS7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzjdKAW9nxz4X5eG/v5RcLcab/9yQ9XlkdSvCxTxkX0HFJijk1mpjZTCFQABmkHEQeUqsyRPAoyhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf1yyUEUKdxuR9DhN66NCy19y/1GpptjerQMApitUODaSR/Uyv
 OLtueAkO68adFOCsu7gmOkOFOZ9TF+ipqUZvzoc9BHmMQhE2o+Wk4umRQ3BNsf5pieTeHM3a7NT
 Toqk=
X-Gm-Gg: ASbGnctixlveCVTPpHXCJwxMDR6yiw3CDrGPSc3fYBB84vqFplPltK0WcU9ugytP6q+
 wPTsyBaQPWIHWyzM+58FGu4kXR+NbhgxfWH+/8iE1UO7+MoUUp+tMAD48fIJxjUUUcp8PwQaK3L
 zMvci1X8wOUOTGEtX5WW65mbeaTZiWp39Fc9YVOQMHOhHWqWGOJoUIQeQzGfK3S4nnt0UGf2hKI
 qmTw1CucLHNw7/Z33xy58yTCA6v7VofagaEHuqSdJ9bbj6uosClljh4hekixXcWggPxqYMf3nhr
 j5dgYfM6QzzBEgXNI4lp74IYvqOyrsfl2G9Tm35axzNbP72NgtWtXdutlKc2BI43ZZ+3c0VcQ6q
 /Wa+RTaLqhM5gcTVSGKn+PcvCh9Z/CZgL464sD6+ezssFs8TOckW397JMPA==
X-Google-Smtp-Source: AGHT+IECkGGKLAa6xtHhN5/OpQUmEXklKn9BLMAECgnbVpD93ZUM2K4SRWh7vtzL6m0ndtk2DBuGuQ==
X-Received: by 2002:a05:6870:6390:b0:310:b9ee:86c with SMTP id
 586e51a60fabf-3110c3ddb9fmr901819fac.32.1755583732282; 
 Mon, 18 Aug 2025 23:08:52 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com.
 [209.85.160.53]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-74391bd20a3sm2245271a34.21.2025.08.18.23.08.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 23:08:51 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-30ccec59b4bso4073582fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 23:08:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwBdmjNgd3Yn2roFamFxYBG8R6SjCpDoJc7o5hZo+2t1VUuMoSP0g1Qa9ysM5yCgQSqwb96Cmr/JI=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3f0c:b0:519:534a:6c5e with SMTP id
 ada2fe7eead31-519534a7300mr195467137.33.1755583325362; Mon, 18 Aug 2025
 23:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250818084242.1045095-1-payne.lin@mediatek.com>
In-Reply-To: <20250818084242.1045095-1-payne.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 19 Aug 2025 14:01:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1njekmPyq5653Ybi8+7i2_+Dx978aJOQNUTuRBs0ef0sfw@mail.gmail.com>
X-Gm-Features: Ac12FXydKLVgTfkAYyLB7X6R_EuK2D-Oxvhl2cOx65LzvRizoLO1BDAMlYJ--fU
Message-ID: <CAC=S1njekmPyq5653Ybi8+7i2_+Dx978aJOQNUTuRBs0ef0sfw@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: mediatek: correct clk setting
 AUX_RX_UI_CNT_THR_AUX_FOR_26M
To: "payne.lin" <payne.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com, 
 Bincai Liu <bincai.liu@mediatek.com>
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

On Mon, Aug 18, 2025 at 9:37=E2=80=AFPM payne.lin <payne.lin@mediatek.com> =
wrote:
>

Start the patch title with "drm/mediatek: ".

> From: Bincai Liu <bincai.liu@mediatek.com>
>
> Updated the definition of AUX_RX_UI_CNT_THR_AUX_FOR_26M from 13 to 14.
> No other code or logic changes were made; only the macro value was modifi=
ed.
> This change affects the timing configuration for AUX RX at 26MHz.
> The formula is xtal_clk / 2 + 1.

The datasheet says "It should be set to the ratio of the half cycle
XTAL clock to the 1MHz clock.", which doesn't align with your formula,
so please explain (1) why this is needed and (2) whether it's tested
on any MT8195 or MT8188 based devices, in the commit message.

Also, you'll need a "Fixes:" tag[1] if this fixes a bug.

Regards,
Fei

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html=
#describe-your-changes


>
> Signed-off-by: Bincai Liu <bincai.liu@mediatek.com>
> Signed-off-by: Payne Lin <payne.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/medi=
atek/mtk_dp_reg.h
> index 8ad7a9cc259e..f8c7b3c0935f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -301,7 +301,7 @@
>  #define AUX_TIMEOUT_THR_AUX_TX_P0_VAL                  0x1595
>  #define MTK_DP_AUX_P0_3614                     0x3614
>  #define AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK               GENMASK(6, 0)
> -#define AUX_RX_UI_CNT_THR_AUX_FOR_26M                  13
> +#define AUX_RX_UI_CNT_THR_AUX_FOR_26M                  14
>  #define MTK_DP_AUX_P0_3618                     0x3618
>  #define AUX_RX_FIFO_FULL_AUX_TX_P0_MASK                        BIT(9)
>  #define AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK       GENMASK(3, 0)
> --
> 2.45.2
>
>
