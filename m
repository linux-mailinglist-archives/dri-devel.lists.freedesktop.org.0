Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CBF4D2FD8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9629B10EADE;
	Wed,  9 Mar 2022 13:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D8010EADE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:22:43 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 fs4-20020a17090af28400b001bf5624c0aaso2332152pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFpUu9dr27noPEr7QirbOcRxKdELB7gGpnSLhYA/8gk=;
 b=u91UGLmWfLry7Qd6UFWNi+UaDteJUJDXdAl658I7tK+Z9YPKkYp1+M814Yrj8LoQkD
 fYknxzvizgkRxib8MSrjAxFehpP/x5dgDGjjbFsC39p+PHvkvtA1DolgdBAzPJU6SmyG
 RaNiTUBSrIFpYc1ynXq1YpI377jkv9iEDe9vE3LFtAUV29xTLMZcnaDY/25dFhcIUC+Y
 d2+TXjv2ruxUWa7In6j5dHHpL91wtEOPc64pDbVhFVS6XyZha9Kjk6E2rUiN5L0PFPmm
 cxfuvyhePMtYCF6HnQnwHwZQ6ApfixdNaTxIUggcWjdqRRzZy48cG8Nrv70E0rEbe76+
 yNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFpUu9dr27noPEr7QirbOcRxKdELB7gGpnSLhYA/8gk=;
 b=uEukTnuhZqY2+v7VAhQ4G+8FkijSQnM8hELLbUHfXZ0joYw2HXCJZeIRpaqO6O0lYr
 +Ag+6m77aV8QoukXgxO4WexigIlvTCyLo20CLFtbnaJ/hNdxoUP7y2fwmHXWOyhIRSz8
 Cbitc+5EyvIgE+5LjmHBYZiOPoMijwUEA7kbPlWTEl/vSsnaZ32yHu951Nj7BVGsQCfV
 jvQEfbkrnMDPr1jjhnpx+dWpn8ym7jQ27RA4AcsF5XLWjw7i4msq8pqhhoPVdMNvjcIH
 TjnlQFDQC8Q6CPhYFouNo4S9bzhjPpSTCvnR9H2M5ZjbgTcrCI6oSWmVUalbq247ecca
 aoJg==
X-Gm-Message-State: AOAM5318qaRbjPSdEfA6/SmW9Y0/jziQfavdeHuRjHd86LyVUH0D3jnL
 GNkG4P/rAk8J8SJOPUKM3AQDZ0wQGAgzt6UF8Zmd7gUZqqQ=
X-Google-Smtp-Source: ABdhPJxairSjptuZC/cMBulWljGFXF9/fDim8+cVb5GOFlehI0cit3Yq/MqRNr4EydbX1nuYFckLml5X2cTV8HjYvPc=
X-Received: by 2002:a17:902:7044:b0:14e:e1b1:bb0e with SMTP id
 h4-20020a170902704400b0014ee1b1bb0emr22498860plt.65.1646832162896; Wed, 09
 Mar 2022 05:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
In-Reply-To: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 9 Mar 2022 14:22:31 +0100
Message-ID: <CAG3jFysXP3vs0uWAykQHckE1KBZr6PfE990mOny-6n=AHP2zHA@mail.gmail.com>
Subject: Re: [RESEND V11 0/3] force hsa hbp hfp packets multiple of lanenum to
 avoid screen shift
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, narmstrong@baylibre.com,
 airlied@linux.ie, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, andrzej.hajda@intel.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, xji@analogixsemi.com,
 linux-arm-kernel@lists.infradead.org, xinlei.lee@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Mar 2022 at 08:36, Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> Resend v11:
>  - Resend this series for reviewing.
>  - Rebase to 5.17-rc7.
>
> Changes since v10:
>  - Rebase to 5.17-rc3.
>  - Add more maintainers.
>
> Changes since v9:
>  - Change description of "MIPI_DSI_HS_PKT_END_ALIGNED".
>  - Use mode_flags directly instead of another variable on patch [2/3].
>  - Add explanation of implementation in mtk_dsi.c on commit message of [2/3].
>
> Changes since v8:
>  - Use mode_flags to control this limitation instead of "hs_packet_end_aligned".
>  - Add new bit definition "MIPI_DSI_HS_PKT_END_ALIGNED" for mode_flags.
>
> Changes since v7:
>  - Rebase to kernel 5.16
>  - Add tags of reviewed-by and acked-by.
>  - Add detailed commit message for flag "hs_packet_end_aligned" in DSI common driver.
>
> Changes since v6:
>  - Add "bool hs_packet_end_aligned" in "struct mipi_dsi_device" to control the dsi aligned.
>  - Config the "hs_packet_end_aligned" in ANX7725 .attach().
>
> Changes since v5:
>  - Search the anx7625 compatible as flag to control dsi output aligned.
>
> Changes since v4:
>  - Move "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null" before
>    "drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid".
>  - Retitle "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null".
>
> Rex-BC Chen (3):
>   drm/dsi: transfer DSI HS packets ending at the same time
>   drm/mediatek: implement the DSI HS packets aligned
>   drm/bridge: anx7625: config hs packets end aligned to avoid screen
>     shift
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dsi.c        | 12 ++++++++++++
>  include/drm/drm_mipi_dsi.h                |  2 ++
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> --
> 2.18.0
>

Applied to drm-misc-next
