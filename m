Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6670D1D7
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 04:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBBF10E3C6;
	Tue, 23 May 2023 02:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B8C10E3C6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 02:56:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-510e419d701so645758a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1684810589; x=1687402589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6o0pldmtPNZczHK6kfIrJdzD+PEWsvSqi4EjRqmT/Y=;
 b=e11dfn1JU9wXqIahkfF02Gf522PcNJQDKa2O7j7arpRNtAJ2Ix/FSqXIyTXApmyvpG
 xqvhZzMdbmyVbhaRlObPxzUge+C9oKx9Itqzwj4DNrXdFAv7kp+WvdGB3xE435lw7jFT
 lvi9pyaA8BQwwKnlMZbu2TcDjX1UkrFPiQO3C69lV78eRrsIeb7XactRS/+o2X6ds4Oq
 CifFeC8clqH8fHML5SIM/QY/85h3UAk2L1JwLDiHe79MTvP7VzfAmkruCWIZ+EVDvHan
 BQI2rTQ4F2c7bs5TAbu7rXfFX5jDWOEcGuxgoNYBfTHM+VE3nfXJKmrjVe9cyfPhhrBy
 /oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684810589; x=1687402589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6o0pldmtPNZczHK6kfIrJdzD+PEWsvSqi4EjRqmT/Y=;
 b=GxTPfummXcQHSxU936nqgPu+xEPOBr6E+9tnxnLMwWGbdWrSTOahr+Rho5n9Sl2Jnw
 731NpGGvdvHmr2cb8FN2FVldIqBkfokh6ifHhV7072x9lqzzFaF2nL25vjEkyXNjnWna
 1kBl9bbdoeAu6GjzPihjJZejwyXC0N0tVTmdast10rTbwFt+/gJ1nJrR3hAf7FC2a/uj
 CwLsh79ztVS420SdpGb/E2EoVtkhbcBpD+9x27jQu+uo8HLsj0V/Cz38IuuySsY/zOll
 +UPj6DodoC+8MFj8oUYraD5nu1uWse8XgOZ8uGoGBtbo08T4eFXajCqmI5/rZx0czDlt
 9Jqg==
X-Gm-Message-State: AC+VfDwJojeDCf8YK7tmWFI4BIcNJ7ez+ZNqBjccmROgkOHsr/ydeE0f
 FPpUCUCGGru0XS8SS3zoZ0ifZi66yNlZ7pbx6//9mg==
X-Google-Smtp-Source: ACHHUZ4Zm9Cx7sVlYhjjvAXSE1TSetEayzYnn2DXi0k6UasemtiYelBRWj9ZoL5JMF+LnmHGv/vUswTO23KNbH0i4+A=
X-Received: by 2002:a17:907:9716:b0:970:19a2:7303 with SMTP id
 jg22-20020a170907971600b0097019a27303mr2892607ejc.19.1684810589345; Mon, 22
 May 2023 19:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
In-Reply-To: <20230523011522.65351-1-quic_bjorande@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 22 May 2023 21:56:18 -0500
Message-ID: <CAKXuJqjgRdr-16h3G_7u1KDfKBnfu2cmB9FsNYdKOpzOKawU=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm/adreno: GPU support on SC8280XP
To: Bjorn Andersson <quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 8:15=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> This series introduces support for A690 in the DRM/MSM driver and
> enables it for the two SC8280XP laptops.
>
> Bjorn Andersson (3):
>   drm/msm/adreno: Add Adreno A690 support
>   arm64: dts: qcom: sc8280xp: Add GPU related nodes
>   arm64: dts: qcom: sc8280xp: Enable GPU related nodes
>
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  26 +++
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  26 +++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 169 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 113 +++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c         |  33 ++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |  14 ++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  11 +-
>  7 files changed, 387 insertions(+), 5 deletions(-)
>
> --
> 2.39.2
>
Tested here on my X13s with GNOME 44.1 and using Wayland.

Tested-by: Steev Klimaszewski <steev@kali.org>
