Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7CF6902EA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9727E10E972;
	Thu,  9 Feb 2023 09:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24B910E972
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:10:27 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id e3so111809ual.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 01:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gUiV/qw4JVOOcTovWw+xyQ31ogBLTJYuBUEOiv2Lb9U=;
 b=QIIdel1hmP8z81Hism+qg1TEwzk5Q4RapO0/kQvbT2plytwESYSceZGMKXLlsMHLnJ
 aQwTjjAYJQpFz0W0Q9oBoHZAVdYNXekXiEQ69PeqGwM/y6MTkxHOr539NoK1u1ne5tJs
 YzOWq9vDJkLexZVnCS4T9l4rHtNeFWP6KBsT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gUiV/qw4JVOOcTovWw+xyQ31ogBLTJYuBUEOiv2Lb9U=;
 b=tLi+hsPs8cNBeHT1/niqEasac6HOBHREiUUnbofc8RNOKrq0tolyCchTsZZPLzar52
 H0eHKaPEdkFpX9EUjpqHFCTkoTvxsyZ9y5FaL+OqNuOXvFDjwE+0XPuPcdTfppkx+UUy
 0LSdSNy4oKhWxCmG1cLnk2AJMySAGe8ijYDCqSE/FT7e41TpX1TFVmuIWBwqW79tgW3n
 0swkWJ8NabzzQK0A1NlJWObuV8gcmuwajmP8VFKe9QjiTMFdPXFNlkjGM2WO7RCFcgsM
 4uryCfZRGCtwZGTlJdX8SXnqi1nVFnj5Kw3Gvu6T611qrRQkDEeIBfNqENuDKW2B3R/q
 0I3A==
X-Gm-Message-State: AO0yUKU+deZqEM8dGezBe2m2fnT3A38LRxRwTSEv54BAOONrU3hJAxE1
 CDSvRUpV0QT7Cl/RzdvvBUbk+9SHa6ZZG4S47gr5rg==
X-Google-Smtp-Source: AK7set9iFbENJrUNl+hKyQ+MIZq2ziVgQa1lldvrUJbRi6mBlcQ3E1DlqRIz/5dmXyM5bWmpsndHSjVSmc3EWCSsyvc=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr2456477uar.55.1675933826994; Thu, 09
 Feb 2023 01:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 17:10:15 +0800
Message-ID: <CAGXv+5HkdWUWmq0Jk5F2ZuFVHN5T07CYwBdzSWR7Z0=pmkJ5Mw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Panfrost: Improve and add MediaTek SoCs support
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> and improves MT8183 support: since the mtk-regulator-coupler driver
> was picked, it is now useless for Panfrost to look for, and manage,
> two regulators (GPU Vcore and GPU SRAM) on MediaTek;
>
> The aforementioned driver will take care of keeping the voltage
> relation (/constraints) of the two regulators on its own when a
> voltage change request is sent to the Vcore, solving the old time
> issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> supporting only single regulator).
>
> In the specific case of MT8183, in order to not break the ABI, it
> was necessary to add a new compatible for enabling DVFS.

Tested on MT8183 Juniper (Kukui-based device), MT8192 Hayato (Asurada-based),
and MT8195 Tomato (Cherry-based).

GPU probed. When running glmark-es2-drm, observed state transitions in
/sys/class/devfreq/13040000.gpu/trans_stat , as well as actual changes to
values for regulators and clocks.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Also observed that sometimes when glmark terminated, the GPU would not be
brought down to the lowest OPP.
