Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292086ADA56
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7F10E10C;
	Tue,  7 Mar 2023 09:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D1410E10C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:28:33 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id d20so11724911vsf.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678181312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b8hCXi92t8UQWDIrI0h9Kq66J5huPcm593ZnPvTm7EU=;
 b=Kq6v5vyHNzwDdpJBI/Fg6NsbbSsHB4jx62ngcaxoDzhdAXMwcPHx5IVVZ7G8ttpjnW
 Jpi4j3nm/BJE1WdcQW5MqTY2odSDn42ea1e8UvkTyjXj38KHkFtYby6TmTES2GME/5YB
 JHQnmryVytPCqSib2AR4rhCLn/9K5TGl7uFkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678181312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b8hCXi92t8UQWDIrI0h9Kq66J5huPcm593ZnPvTm7EU=;
 b=6VL09Jtil/eWsM104cmhrWeCvgCdbMHOE+oy3cxfu+/SY1vb4UHe9s3NIKhIvcqiPT
 S0xMqv+9zf+mO2ZghLE18cFTEfJ6Bbdfkh2SSZEm1T02fZw6NW/ywijc6SaFnfq2YhzQ
 YJmESBxp50sNO99ozcyZZVNC/SvkZvNmMSIwFrV9M5Wvmr4/CWGsla2duQW49nfgqfMT
 um2oN4mSxwtCD8IwMM+Y+DU1sPZOHXmB3suIcirb4LxY3JXtWIAFvm3p2NObORSN29Tf
 k7NkPuQ3i7ZNxNTaQnJWBu4038R2x24ao5GRESXcuvfgbWlEJYlWK3TwCL9rw1RThW+D
 OxeQ==
X-Gm-Message-State: AO0yUKWBYVh6CgqD596SntfF9qfIFVb1Qqi/Yj5AQS/4neOrCaz26vKu
 hU1RBvMardz5bTxrIFLA2sWhGJAVNMVa3BMoQP78QA==
X-Google-Smtp-Source: AK7set9eIg6NIfG9gEV676xYVLWLVEZOK8JzoWyEtpVJ/E62wiFOnpUhU/HAx7w/NOfUgWkwWQmAxz8qnu+k2EoMdEA=
X-Received: by 2002:a67:e2c7:0:b0:412:2f46:4073 with SMTP id
 i7-20020a67e2c7000000b004122f464073mr8774638vsm.3.1678181312119; Tue, 07 Mar
 2023 01:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20230228102610.707605-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102610.707605-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:28:21 +0800
Message-ID: <CAGXv+5FVZWFcYNrsgMs_0s+J5E-ijxKjf9MRsLXhC7nWNj5pPA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Panfrost: Improve and add MediaTek SoCs support
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

On Tue, Feb 28, 2023 at 6:26=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v4:
>  - Refactored power-domains and power-domain-names exclusions as
>    suggested by Krzysztof
>  - Small changes in MT8192 bindings addition
>
> Changes in v3:
>  - Changed MT8186 bindings to declare only two power domains
>  - Added a commit introducing MT8186 specific platform data to
>    panfrost_drv
>
> Changes in v2:
>  - Add power-domain-names commit from Chen-Yu to the series
>  - Kept sram-supply in base schema, overridden for non-MediaTek
>  - Added Reviewed-by tags from Steven Price to the driver commits
>    (as released in reply to v1's cover letter - thanks!)
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
>
> Alyssa Rosenzweig (3):
>   drm/panfrost: Increase MAX_PM_DOMAINS to 5
>   drm/panfrost: Add the MT8192 GPU ID
>   drm/panfrost: Add mediatek,mt8192-mali compatible
>
> AngeloGioacchino Del Regno (9):
>   dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
>     variation
>   dt-bindings: gpu: mali-bifrost: Set power-domains maxItems to 5
>   dt-bindings: gpu: mali-bifrost: Fix power-domain-names validation
>   dt-bindings: gpu: mali-bifrost: Add sub-schema for MT8192's power
>     domains
>   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>   dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
>   drm/panfrost: Add support for Mali on the MT8186 SoC

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183, MT8186, MT8192 and MT8195 Chromebooks.

But the cover letter wasn't properly threaded with the series.

BTW, Angelo, I see that Panfrost keeps the GPU regulator enabled, but
the power domains, and thus the SRAM regulator, get powered off when
the GPU is not in use. There doesn't seem to be any damaging effects,
but I worry about idle power consumption.

ChenYu

>  .../bindings/gpu/arm,mali-bifrost.yaml        | 80 ++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 37 +++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 ++
>  4 files changed, 123 insertions(+), 4 deletions(-)
>
> --
> 2.39.2
>
