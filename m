Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7098669EF19
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 08:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088E510E1BE;
	Wed, 22 Feb 2023 07:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6252C10E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 07:07:05 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id bx14so2269983uab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 23:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qlPwPykFYo8rhIVwD6mBB4FPi0U1mYPcwHgebQEUnaw=;
 b=VXIAa7FunJm6q3CeB62nQ167gZdQVEQe2WuW1+KVUVZUKVfVSRrsFHRIuvLcvB+WAI
 BkW2mPJ4C7KTo2uk2BNR5ieJykYAv4X+UkH3enEhjvEHcvm8VjYHwUjN7CBfiAFvp+r3
 S/1r2W9l9+ur2AMr7PnVyAh/q4cfsy1OA2+z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qlPwPykFYo8rhIVwD6mBB4FPi0U1mYPcwHgebQEUnaw=;
 b=2toawd8yerdCHS/SIU3jr5ImW4IS0pZ7riHlulehrDhORxzmzsBJobEL8BL5dUYEFW
 G7nHwAhwOqD7FONKYVCLpDUyQxy3calrhCGrkln3pRtTj62QjmGUbk2Ry8OmIKmqkoFb
 oX85tL8Sw4L1vQ5UiDDxWHyIx5XsZw5wN42oXizuQEh3qqHkDI1lkxsXNLZHMf76caPk
 YTB0nsLZoDRs/v22eIOkcuq4CNCcNBDKcTBZ8XGJJBRPBXWTxBd+/xrqN6BtPumkqUFn
 wReXNb7/E2hGscaQenhBpBLTk/xEoNmY/Yy/KhOgZqSvERDb0T9zDJUElPSKxPbM+yV8
 CgeA==
X-Gm-Message-State: AO0yUKWCPs/QVGp0S3btoV0F6zPmFy1T1xOdRUweDPjhc1zpQCFIV7Ry
 HlftFVWgo+AWwjVhvk8s2+XkzUiGTNzxvcGlPX6fag==
X-Google-Smtp-Source: AK7set8LX05PaXjP97oF1G9cF2P3OWsBmaHQhbW//L1C7tUi+Z8JteajDRu6P6E5vLHDtTDlMdm48IpSEsLEbY4UVV4=
X-Received: by 2002:a1f:208d:0:b0:3e8:66ce:a639 with SMTP id
 g135-20020a1f208d000000b003e866cea639mr1283824vkg.2.1677049624519; Tue, 21
 Feb 2023 23:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <20230221153740.1620529-11-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230221153740.1620529-11-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 15:06:53 +0800
Message-ID: <CAGXv+5FqZPXaE8tyEFtejsYpKMLzUt5R_QnkbQrDSBM_u7rRYg@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] drm/panfrost: Add new compatible for Mali on the
 MT8183 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 11:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The "mediatek,mt8183-mali" compatible uses platform data that calls for
> getting (and managing) two regulators ("mali" and "sram") but devfreq
> does not support this usecase, resulting in DVFS not working.
>
> Since a lot of MediaTek SoCs need to set the voltages for the GPU SRAM
> regulator in a specific relation to the GPU VCORE regulator, a MediaTek
> SoC specific driver was introduced to automatically satisfy, through
> coupling, these constraints: this means that there is at all no need to
> manage both regulators in panfrost but to otherwise just manage the main
> "mali" (-> gpu vcore) regulator instead.
>
> Keeping in mind that we cannot break the ABI, the most sensible route
> (avoiding hacks and uselessly overcomplicated code) to get a MT8183
> node with one power supply was to add a new "mediatek,mt8183b-mali"
> compatible, which effectively deprecates the former.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
