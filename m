Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CDA69EFAB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 08:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2088010E423;
	Wed, 22 Feb 2023 07:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A985310E422
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 07:55:55 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id x34so4469385pjj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oBgzLfkXpKOGfd/1eNx8Vyt8q2pJnQcGFP33kaJSZLo=;
 b=bKcnv4mE5FYO28aQVhL4l7jvPYfuxRvwJx4aDOMpVX7i7lTxPjZ2zeB/msNGjCoAUS
 9BWfwGlpf4nOVynX5qpqDIcuFnNCx1ZYDUxfE0cP0TsmymLnw467Im4PI/aPWvfGTOTq
 fYnOFo4Nyhdr7Pzf7P3ljnJxv/HDvkXFr7eog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBgzLfkXpKOGfd/1eNx8Vyt8q2pJnQcGFP33kaJSZLo=;
 b=vmZKJkISrSNeailnOrf7qKqVghCB6O3CNRlk+Vd7MF069rQL/+1ZlQ66b5+TkTRuQ+
 aglwjsinaTmT6t5rWGdXgl5y5ZUtxC29qCS1EqfQH5e9oig8HtXMIra9T3uZjOjsSdCF
 uMqcxbJMbCS1QDGIO53CiMvGDWL8HHe8EVTWnpOyTOc4EPQu1h0wBb6UxXK0PVKDpejq
 TXyZC9iGCz1d1mkqpkgw/Qn03ACygBI2K2ZLuu95jg6DurMcWfssQFiqTM2r2Dc/TgK6
 THlUCnTVIdSvCVeC8x5swDZfLbYAR9CEwzYQIJA10Y3VU3BFkuhiHhrLV1W5F6OlFRsY
 JKwA==
X-Gm-Message-State: AO0yUKWysMOBFkXZKRPdO3uce6SEcyAyQvyHRIG4sXAPYwdAROiMcgW6
 0oX9K3fAX/0Sdp+Re0Z68REa4g==
X-Google-Smtp-Source: AK7set+DvRSC/UTE3/Bo65NIi9ejlfvJh5OTnIy8q82XRhMInMhg/LrhSdfTTPAcfKctZav/mMZuWQ==
X-Received: by 2002:a17:903:110e:b0:19c:ac96:223b with SMTP id
 n14-20020a170903110e00b0019cac96223bmr509904plh.40.1677052555089; 
 Tue, 21 Feb 2023 23:55:55 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ddae:8a07:7ed9:423d])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a170902821800b001947222676csm5009278pln.249.2023.02.21.23.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 23:55:54 -0800 (PST)
Date: Wed, 22 Feb 2023 15:55:50 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 00/10] Panfrost: Improve and add MediaTek SoCs support
Message-ID: <Y/XKhg+wultVbEWW@google.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
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

On Tue, Feb 21, 2023 at 04:37:30PM +0100, AngeloGioacchino Del Regno wrote:
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
> AngeloGioacchino Del Regno (6):
>   dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
>     variation
>   dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
>   dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
>   dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
>   drm/panfrost: Add new compatible for Mali on the MT8183 SoC
> 
> Chen-Yu Tsai (1):
>   dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 67 ++++++++++++++++++-
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
>  4 files changed, 101 insertions(+), 4 deletions(-)

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183, MT8186, MT8192, MT8195 with glmark2.
