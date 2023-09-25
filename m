Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B828F7AD479
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 11:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD1A10E21D;
	Mon, 25 Sep 2023 09:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB1410E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:25:42 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-41513d2cca7so744521cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695633942; x=1696238742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xr8Pm0FHns5z+sDzwSgcIqm9qFlErBM1xlOG5O4Qks=;
 b=A/kZMz/1dw26vDFyUR/73e00QxwA6cfMbO8uNRgcPIsWLNs2kzf59eRLUlpJLmlg0Q
 nCMUqj8Pd/3fPfo0mHRz/51VgVzcMObDu31fLQPE6ZeAE+AIs/bnDeQQNYNnbk6uzjCh
 a+E/Qx/AuPjUIXqpQGmh1oOofc31+qr0EN2yLVEhWchJ1k+exidyZIkMvkHW4WxlRHVC
 Szx3KifPcvSz8HDszrDdzR/bggqH83/PJhavx5A7bIC5HAZFcHvIMJmpJT38VHmCjQKT
 gTjwCxQ5p54vr1vEyLHxoDwC/VAC1bJdRjAL3Fp/aGZe/oXzOp74pnl2yNcx5T/IYRv8
 t6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695633942; x=1696238742;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xr8Pm0FHns5z+sDzwSgcIqm9qFlErBM1xlOG5O4Qks=;
 b=dBIxqfbRqzC/tZlmfmFjyj9dUd/KcFrdtvM+TmDAsKiiabS8yJq3jrvkb7okKXpB1T
 DBBQ0hgZznh+xV4R2x18kybqT86LYAMh6IQi595gSa/RjOkrFfjdezfwRuovKXDDPnxK
 BIj7XkZOPLZa9cMp6/XLH/xFv5AzjiP2YsQpp7gxUTaOhKH/lKuDBt1ZGRPFFHW04HiI
 ULlUIwWLH/SYZOXw1PSyiySw3eJquVQnryaFSgEThgL8NnJjuw1BXxaxs/oFSsag9tgO
 OGmcqZWaJUOYMPeah1MsfYuvWVMDxLALG+M+RIwuzgJtGN2jqFS/2l5GBEIzNe0kNiU3
 +Trw==
X-Gm-Message-State: AOJu0YyztlZoL4qlJY9U1bYoZ0tM77Ffl+FW16mHFhamDyyHUMJs+2qN
 /xbLLOKMEqhvaLLHWC7qP36Fh4P3px1RcBm4aLF6DA==
X-Google-Smtp-Source: AGHT+IFfw6R3PruYRpn1KMKh6lR/ZIydA1Xovah/Z3U+3DE6GvyT7bl5mA/0LZHXEUU3B4R8i/UHE5x70+g4n5TmicA=
X-Received: by 2002:a05:622a:11c2:b0:410:653f:90e8 with SMTP id
 n2-20020a05622a11c200b00410653f90e8mr405985qtk.11.1695633941887; Mon, 25 Sep
 2023 02:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230925092249.2228743-1-hmazur@chromium.org>
In-Reply-To: <20230925092249.2228743-1-hmazur@chromium.org>
From: =?UTF-8?Q?Micha=C5=82_Krawczyk?= <mikrawczyk@google.com>
Date: Mon, 25 Sep 2023 11:25:30 +0200
Message-ID: <CAHDt3PPObYmUTedxQ5OJ4FcXNbb9LREQ9DfiBJ4KhA6=rCvBMA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Check GEM buffer size
To: Hubert Mazur <hmazur@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, upstream@semihalf.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 11:23=E2=80=AFAM Hubert Mazur <hmazur@chromium.org>=
 wrote:
>
> The buffer size is derived from parameters supplied by the userspace.
> Having the size equal 0 causes allocation failure leading to kernel
> panic.
>
> Fix this by checking if size equals 0.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
>
> Signed-off-by: Hubert Mazur <hmazur@chromium.org>
Reviewed-by: Michal Krawczyk <mikrawczyk@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9f364df52478..3b985b99d5c6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -62,6 +62,11 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_=
device *dev,
>         struct drm_gem_object *obj;
>         int ret;
>
> +       if (size =3D=3D 0) {
> +               DRM_ERROR("Invalid allocation size: %zu", size);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
>         mtk_gem =3D mtk_drm_gem_init(dev, size);
>         if (IS_ERR(mtk_gem))
>                 return ERR_CAST(mtk_gem);
> --
> 2.42.0.515.g380fc7ccd1-goog
>
