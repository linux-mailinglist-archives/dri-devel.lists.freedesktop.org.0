Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3E26A18FA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 10:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A36510E6E7;
	Fri, 24 Feb 2023 09:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDE610E6E7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 09:43:16 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id f13so16552765vsg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 01:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kbnXOoIvCwre/+4QX5AN/9RjsRsacNnY7HA3dADS82M=;
 b=SSI0N/ZzzZtFN3NC9K9DXhTBJeR3c8kHwLA5fTMTff0SyrOe86wwffe3Djlo0gYd0f
 6g64G/BHBOijusArADG/hxf6rlwCGwFkRKhecjiHfm1e9LFUFnB/sJTf5NUQq15Ht5UV
 Gc1zD7tqJ1k8N8zfsQK6IWmeY1a5VmYBokIxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbnXOoIvCwre/+4QX5AN/9RjsRsacNnY7HA3dADS82M=;
 b=JloRF+eC0HutEcYmd0V0g397lTDHos79rWAijwqSe0dJTF4ofN+OH2iC4uPHB1S1sT
 nW3zL0eJrFvy5zzQfvjIebzFLCgCPrA5rN3Nom91UAccefF8HH1EIIh8saD0Zt0TWjSs
 QUa3fOgmHqSNLVj+lH+Wh1HshJM62ejS39lUPrPvFdxlYdYm2j7L1j+fNAGH3XcV17RT
 N83iPC2BPATHBtN2FbGRtCzAXHL7UT1nUHPOd/bLZT9j+XL8QFJfu3HDHmhRekavjsGy
 zfmOJ8eWiRND/5+he3JU5CVO6rEn1Ul53FQNNIRrTb2UY44v0oefjlD38prNYV3l0erB
 BDVw==
X-Gm-Message-State: AO0yUKWbGskzs88de4oEZSE8ym0ivVU2ErHC59zXfq9EjbNVLnw9lDMe
 VwyqK+7GllxBbAeQ+Zg3RQvq5W70zVZp1581Uk6a/Q==
X-Google-Smtp-Source: AK7set/KpmOufYOT89amku4MuWdzdnK+6D2wu9CS/8jhVNSAh5wdSQfoQxCA2kg+qARRnk13Skua4AsQwc/ET0fx5nE=
X-Received: by 2002:a67:fbd2:0:b0:411:fff6:3cc4 with SMTP id
 o18-20020a67fbd2000000b00411fff63cc4mr2067609vsr.3.1677231795727; Fri, 24 Feb
 2023 01:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:43:04 +0800
Message-ID: <CAGXv+5Gcnx4cw891hDTsSzMQsw+NAR7Le7FkUejEJCL-MMsktg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] Panfrost: Improve and add MediaTek SoCs support
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

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
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
> AngeloGioacchino Del Regno (7):
>   dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
>     variation
>   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>   dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
>   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
>   drm/panfrost: Add support for Mali on the MT8186 SoC
>
> Chen-Yu Tsai (1):
>   dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183 Juniper, MT8192 Hayato, MT8195 Tomato, MT8186 not-yet-upstreamed
device.
