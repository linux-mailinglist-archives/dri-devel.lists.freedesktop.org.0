Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F669F077
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 09:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5E610E42D;
	Wed, 22 Feb 2023 08:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EACD10E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 08:39:35 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id j14so7788575vse.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 00:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dmszevi2SksTWD2ubcICrn01x9b0o7eFEQpxMDnqSAk=;
 b=em4VVRc2okwRN3SQHzajqxgirZ/Imo8edo1OC+ktYXzjmKrRYasm0n9PVupus++Icp
 6GWdGZIKZNg7GzwyuGcWREv+Elvk8JiNhCCcTFJT6BuqxpoYHSEcaUfRSk6rBbUy3NYb
 ThcqWvbcTjsO7bJAETYYb5RiVmz0OWMt4SqkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmszevi2SksTWD2ubcICrn01x9b0o7eFEQpxMDnqSAk=;
 b=y9CMZVqEgi9tjFn2zjLW3Fag3BBDgPPDlkHPBSnFu9FnbS6tAAcymU1skmiOzD0Vjz
 BCRpsyXDq8HMMpwtpG2p8aUn7ZSdvO3cld1GejDInbqlyqhSNyLM5vCIOR7hOI878+k1
 UrLnHby29L5yzXrNkHjssrIEEVy9piOKczqh1jTH7ZSs7UTM5NGccFpq8AN4O0ZhNK30
 gnS93wcW8apkvOpmSaanaxb9FVQ2jwby31w1NsnyT5bB4l0/jDXr+XyX/OuOI9lkcCwx
 iC5eXWP/NaPTsFAfGE28eqSbW2wwiqAGLXRS3rAoVA9sPOMNDUPe8iRe8V+3yykdhZPu
 CBMQ==
X-Gm-Message-State: AO0yUKVDWNDcpSaYR9AnZwPbk68PEU7Ir4Mzq0/YAXO9Q421FFtCfICm
 2EWSLFMQL/eNkyoSmn35+vr6mER+w77ITKF8lTPclQ==
X-Google-Smtp-Source: AK7set82JgoEJwmJ5PvwiX+SnPjQIuZJcVlZYYzuz1but6a8Se983ORppZPhV01+jbcYZHkfkMc5ZWYwUsQab1btvKQ=
X-Received: by 2002:a05:6102:570b:b0:3fc:58d:f90f with SMTP id
 dg11-20020a056102570b00b003fc058df90fmr1572193vsb.60.1677055174148; Wed, 22
 Feb 2023 00:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
 <Y/XKhg+wultVbEWW@google.com>
In-Reply-To: <Y/XKhg+wultVbEWW@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Feb 2023 16:39:23 +0800
Message-ID: <CAGXv+5GV2BuQW+XDBzpiWwXDBi0zbjA4dF3_rD62y+B_qK_xOg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Panfrost: Improve and add MediaTek SoCs support
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

On Wed, Feb 22, 2023 at 3:55 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Feb 21, 2023 at 04:37:30PM +0100, AngeloGioacchino Del Regno wrote:
> > Changes in v2:
> >  - Add power-domain-names commit from Chen-Yu to the series
> >  - Kept sram-supply in base schema, overridden for non-MediaTek
> >  - Added Reviewed-by tags from Steven Price to the driver commits
> >    (as released in reply to v1's cover letter - thanks!)
> >
> > This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> > and improves MT8183 support: since the mtk-regulator-coupler driver
> > was picked, it is now useless for Panfrost to look for, and manage,
> > two regulators (GPU Vcore and GPU SRAM) on MediaTek;
> >
> > The aforementioned driver will take care of keeping the voltage
> > relation (/constraints) of the two regulators on its own when a
> > voltage change request is sent to the Vcore, solving the old time
> > issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> > supporting only single regulator).
> >
> > In the specific case of MT8183, in order to not break the ABI, it
> > was necessary to add a new compatible for enabling DVFS.
> >
> > Alyssa Rosenzweig (3):
> >   drm/panfrost: Increase MAX_PM_DOMAINS to 5
> >   drm/panfrost: Add the MT8192 GPU ID
> >   drm/panfrost: Add mediatek,mt8192-mali compatible
> >
> > AngeloGioacchino Del Regno (6):
> >   dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
> >     variation
> >   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
> >   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
> >   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
> >   dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
> >   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
> >
> > Chen-Yu Tsai (1):
> >   dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 67 ++++++++++++++++++-
> >  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
> >  drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
> >  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
> >  4 files changed, 101 insertions(+), 4 deletions(-)
>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> on MT8183, MT8186, MT8192, MT8195 with glmark2.

Note: the MT8186 was tested with incorrect bindings with one extra power
domain, but that doesn't affect functionality.
