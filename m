Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF7A2C3CA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF2310EB03;
	Fri,  7 Feb 2025 13:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="drYcydjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1247A10EB03
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 13:37:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38dd006a4e1so147002f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 05:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738935440; x=1739540240;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rPRSrDHPMQkspBW9wFDUJ/iKaqBFin7bc0Krcp9BIfo=;
 b=drYcydjskDjj3/gJG6x5LufYd0JZJyluF0oGVDht9QeT6cMgo67ZrW0ytExOwPNrgX
 giXta4sT/wf5Q+HK4XPxEsWgrUc6Wr6Dwje0WKzbZ9ibD5NMWd8NWsUrM54W6eLcKnCF
 DNhCBdAPlVhr0vWTSTLJPcXupcfyW8DpB1BwTQPATn262bzxKt8anSpZ+rYF6euIED3G
 dJrJR80LP66KvYJZAm4/a8hbwU4Uw5HRzA5SCu8njijHMHpNJPx6GWV5Grd1IBXsO8uQ
 WmMZG/IkANTDjKHAJJE/Guqa1pbqYVaWzipE8+cJI6YgEBIIiQXMx1dmmIGoY/WVJvdo
 Lbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738935440; x=1739540240;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rPRSrDHPMQkspBW9wFDUJ/iKaqBFin7bc0Krcp9BIfo=;
 b=XfozQG46lhmXrT5kL3Dav9bSLJntZ/VQ4/Jk4XNTc/C1rZUUYFbGgBIhVhTjNkXYBh
 acEUutUPpwWCsmRFWPGlUWvRYUV+2MRuVcz7BMAMYDPVrmQ0IlCmrrLroYUukxR/6/x1
 OhaJujpd2rOA8sGxF99PaTTCwr7vd0io6jqCh7ohqwIuIJA02EUJDtVS+kaDxafHurXn
 69ZBBmfwE+tW0vdJZfrb1doUxc+E1rGRSOi8gC/KyIvvOWMJaM2ZLRvsBV5jxAF/XBFc
 gAttDMWWoZKUtCKKZcNSULfchlF1QoZQdwakXKFh4SKWuchEZW/lzFsxGlT3DRPwAnOu
 iUnA==
X-Gm-Message-State: AOJu0YwKt7ByDMoeVCObshKgFjCK4he64+a5J1BD4BwvN/7h47eUttvi
 VM5MloYtyj/EdOJSNtMR1QnR8JEvR52tcmEv/zeInlOukMAiTp7+EJd/YXRaqMg=
X-Gm-Gg: ASbGncsXzfWCTtqYMv8Ke60yIO8o5AVP6459Mu1j6T9W0Ii0ejeNzj+N8deK9mmlmOv
 gOaglJHVfFYW1qsDL9ZORZD2BbQMcfWu89lMbU0grTWxSOV1g0lRvNvj877Bz3TH+t9qlLfbmGg
 acAu/CNnQlLwYvpyLcfTSuOTE8UKajRY+Nae9kDMz74YGmuA8Q53++qk/BlBxIRniKD45N2lCRf
 rfxCXGqTbuFqNNUKoMhUyWEJYVAvvlwPE+so1sfjGWoMQ/fvLa0OdruFNrV1mUMYYw1skAMzWD4
 BCHvfyq5dhmOVCKim4CWy59W242GKLmmWsF2Od+iuNlOtoSPGJDTWnXGJUsFtHE=
X-Google-Smtp-Source: AGHT+IH3fH05sr0RzEENOHx7i7cRr0rsu4948lpsFnWwYRkB7HQdSGQ6B8ZBEJuZdUoLFPuxdIY6Mg==
X-Received: by 2002:a5d:64ad:0:b0:38d:c5c7:4f07 with SMTP id
 ffacd0b85a97d-38dc8dd07bemr2770452f8f.16.1738935440380; 
 Fri, 07 Feb 2025 05:37:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8?
 ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc933ff9fsm2213064f8f.96.2025.02.07.05.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 05:37:19 -0800 (PST)
Message-ID: <5dc5c251-4f66-4468-b253-6c8f58f5fd81@baylibre.com>
Date: Fri, 7 Feb 2025 14:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] Add display support for the MT8365-EVK board
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle ping for patch 1,2,3 and 4.

On 10/01/2025 14:31, amergnat@baylibre.com wrote:
> The purpose of this series is to add the display support for the mt8365-evk.
> 
> This is the list of HWs / IPs support added:
> - Connectors (HW):
>    - HDMI
>    - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
> - HDMI bridge (it66121)
> - DSI pannel (startek,kd070fhfid015)
> - SoC display blocks (IP):
>    - OVL0 (Overlay)
>    - RDMA0 (Data Path Read DMA)
>    - Color0
>    - CCorr0 (Color Correction)
>    - AAL0 (Adaptive Ambient Light)
>    - GAMMA0
>    - Dither0
>    - DSI0 (Display Serial Interface)
>    - RDMA1 (Data Path Read DMA)
>    - DPI0 (Display Parallel Interface)
> 
> The Mediatek DSI, DPI and DRM drivers are also improved.
> 
> The series is rebased on top of Angelo's series [1] to
> use the OF graphs support.
> 
> Regards,
> Alex
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Changes in v7:
> - Improve defconfig commit description
> - Add comment in the DTS about pins clash with ethernet and HDMI (DPI0)
> - Link to v6: https://lore.kernel.org/r/20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com
> 
> Changes in v6:
> - Fix DPI binding: remove the duplicated property (power-domains).
> - Squash defconfig commit.
> - Fix the property order in the DTS.
> - Link to v5: https://lore.kernel.org/r/20231023-display-support-v5-0-3905f1e4b835@baylibre.com
> 
> Changes in v5:
> - Patch merged, then removed from the series:
>    - dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: dpi: add compatible for MT8365
>    - dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
> - Enable STARTEK KD070FHFID015 panel in the defconfig.
> - Rebase on top of 6.13-rc6.
> - Link to v4: https://lore.kernel.org/all/20231023-display-support-v4-0-ed82eb168fb1@baylibre.com
> 
> Changes in v4:
> - Patch merged, then removed from the series:
>    - dt-bindings: display: mediatek: dpi: add power-domains property
>    - dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
>    - clk: mediatek: mt8365-mm: fix DPI0 parent
> - Remove mediatek,mt8365-dpi compatible from mtk_drm_drv.c because it
>    use the mt8192's data. It's a miss.
> - Add MT8365 OF graphs support, remove the hardcoded display path and
>    rebase on top of Angelo's series [1].
> - Link to v3: https://lore.kernel.org/r/20231023-display-support-v3-0-53388f3ed34b@baylibre.com
> 
> Changes in v3:
> - Drop "drm/mediatek: add mt8365 dpi support" because it's the same
>    config as mt8192 SoC
> - Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
>    because an equivalent patch has been merge already.
> - Add DPI clock fix in a separate commit.
> - Improve DTS(I) readability.
> - Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com
> 
> Changes in v2:
> - s/binding/compatible/ in commit messages/titles.
> - Improve commit messages as Conor suggest.
> - pwm-disp: Set power domain property for MT8365. This one is optionnal
>    and can be used for other SoC.
> - Fix mediatek,dsi.yaml issue.
> - Remove the extra clock in the DPI node/driver and fix the dpi clock
>    parenting to be consistent with the DPI clock assignement.
> - Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com
> 
> [1] https://lore.kernel.org/lkml/20240516081104.83458-1-angelogioacchino.delregno@collabora.com/
> 
> ---
> Alexandre Mergnat (4):
>        drm/mediatek: dsi: Improves the DSI lane setup robustness
>        arm64: defconfig: enable display support for mt8365-evk
>        arm64: dts: mediatek: add display blocks support for the MT8365 SoC
>        arm64: dts: mediatek: add display support for mt8365-evk
> 
> Fabien Parent (2):
>        dt-bindings: display: mediatek: dpi: add power-domains example
>        drm/mediatek: add MT8365 SoC support
> 
>   .../bindings/display/mediatek/mediatek,dpi.yaml    |   2 +
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 245 ++++++++++++++-
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
>   arch/arm64/configs/defconfig                       |   2 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
>   drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
>   6 files changed, 594 insertions(+), 1 deletion(-)
> ---
> base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
> change-id: 20231023-display-support-c6418b30e419
> 
> Best regards,

-- 
Regards,
Alexandre
