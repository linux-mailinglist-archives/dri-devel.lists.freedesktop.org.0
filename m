Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B146ADAFA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF6D10E112;
	Tue,  7 Mar 2023 09:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B3E10E112
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:52:43 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id g19so8434930ual.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678182762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUGE4NLp1dzlaCpuRsuoXh7GQOmh7Ex8Ez1qpO97Cww=;
 b=BVAJ05WjjYYe15giRYYRnN18GQChdYZf706gda4lAbHnGoRJe8RXTaG0wJnnwOcLEG
 hNR6rzX5zoi5OXDO+2A00TzCqWW2vx2T8li26kEjNl7rEAaVmTYnoUvQjtIKPAbVu3vh
 ZhEqsZL3FF++lT86RJGglOGZl/4WljehR4z6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678182762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUGE4NLp1dzlaCpuRsuoXh7GQOmh7Ex8Ez1qpO97Cww=;
 b=BqBYlU3UYGzZ9CcWYIV+/oj6Spkb62sMpqGvyuSfuQvlefLQPyHxqI2IzJ6R2nq5y6
 LsmBlmTeAMrEJfd5gK3EyjmzdWSwNuKgWuNcIfAI/V0pWA0RVRJlmpioL7w8gCnuVFpv
 /Yq4AeLh1vJJY4R9ymB4BaWmAvq1Zhc3WVHEI+7/hcLeEcJc/lWY0gUTf9G5klJ1LQH5
 9EhD88Cqci4ONegY3/AJuqqzV7hnxI9MV9eQj7kC7OxkS1T8et76CwAwoFusGjONQAI7
 1NUCatNn4tAou0psLRliHMOjaSsXMF3tpUKDy+nqKUfnmb7E5MmVuQU3dRGZg4iqLs+/
 i1qw==
X-Gm-Message-State: AO0yUKVQ+tkQoHpldmG8iVi54odLnaWwsjEvjL6kAD12OtwJGtvrCYTc
 CyPgw7ycilUrblAy0pWb4jpMyIwj05AHWLNW416P8g==
X-Google-Smtp-Source: AK7set99pajDzF78Cn1Ybb/FJD0puSgRBTD5C6iX7PfjJMAHS1OJ7pSRgHhIKA1sI9K6oLm73zy7R2g+hfTT8VQSDKQ=
X-Received: by 2002:a9f:310a:0:b0:68e:33d7:7e6b with SMTP id
 m10-20020a9f310a000000b0068e33d77e6bmr9296190uab.1.1678182762200; Tue, 07 Mar
 2023 01:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:52:31 +0800
Message-ID: <CAGXv+5F9afH2x=yioheatsaWvf9y8XDSdXCs=R3eM_1GRDieEw@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] drm/panfrost: Add support for Mali on the MT8186
 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8186 has a Mali-G52 MC2 2EE (Bifrost): add a new compatible
> and platform data using the same supplies list as "mt8183_b" (only one
> regulator), and a new pm_domains list with only two power domains.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
