Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C16ADBDA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BC110E3E9;
	Tue,  7 Mar 2023 10:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE3D10E3E9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:27:37 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id d20so11848260vsf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 02:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678184856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQWWeSgJzRDMlqiwuu81ooiy+d+wn5swGzaHRiZJYgg=;
 b=gmu+hdgeQO4DLaMQAIBgOxQcm5fF1Lm3Ar4OTwBQRMayPM9zIf3PwUk72MU09LozmV
 gQ9Tdyj4MicaNl2dDTpGnA7tgGCWFcGhD/rnYjdeuJ90XwqcbNSlVDAbUabd3KaNFxOo
 +QwdamtK++gXs4b7HUfhVRbNXS+wxYKl+SDLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184856;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oQWWeSgJzRDMlqiwuu81ooiy+d+wn5swGzaHRiZJYgg=;
 b=pCFVtsmwcOQz0CeRDFziHRcNo1XF8RoVV87rHElNBzT7ku8qse4+dSdAdQB5BDNT5B
 F0cxkOWhzRhyyo7KRM++quIjmTi/ZmQXpgPmbHsd45H9NH3lnoqL1VFYTX56H/XAB2uP
 lx/AOJ8wIz7C4ZI1fBGTRJ3EQTNXIbgkWvo4WoqzTSM1X+ajsbRGENaEWND3o22/ZD7X
 7jNvjqiKXvNaao0OHv/4Sn8fLFeL+dd4IIYJUsdpM3YTcP3gOeVTU6BclIbNTAcZAZVH
 6gRee0Zn/HJadUkKu4EXOcyZNPoMtYc5JVI23Q1NYPB0K1gTseoDFqargrVLkaz4J+20
 jJ9w==
X-Gm-Message-State: AO0yUKUQITQS8ogk+fpMnHDfKfkCDfYJICAo3NQRpGHTZct2INdZm8bh
 ghjC7U7VXkQLYpZ/ifIaBaJOdtpZQdvHfJuAI5cOcA==
X-Google-Smtp-Source: AK7set/nfUjGPRAD0f9xbAT5uy4DYnrTL6hnkblxAJK9+rSFg8OKB7S+yFpCVZviDWEpneSk0qGS+aaVnvZD9DRlCnQ=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr9301865vsk.3.1678184856050; Tue, 07 Mar
 2023 02:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
 <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:27:24 +0800
Message-ID: <CAGXv+5E8n+OnWY0ChWekgoF26kXaPEEGUmVxmpJYC70+e3K-RA@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] dt-bindings: gpu: mali-bifrost: Fix
 power-domain-names validation
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
> Commit ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
> incorrectly introduced power domain names for MT8183, causing
> validation issues.
>
> Add power-domain-names to the base schema, allowing a maximum of
> five elements; since platforms having a single power domain don't
> need any actual domain name, disallow that for each sub-schema.
>
> Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183=
")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`
