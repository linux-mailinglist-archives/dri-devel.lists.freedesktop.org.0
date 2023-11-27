Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFDC7F9B81
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 09:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36D410E1CD;
	Mon, 27 Nov 2023 08:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C6110E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:19:03 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9947f488fso22560611fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 00:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701073141; x=1701677941; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2uKGv73n9zPoCLwWnUxIRJtwy7BLdOeRGasRuwlLaI=;
 b=pXgake1i3Sglwk6XXYyi06FPyHWZ4LEv/5QKTcr8w6Exbvt9lqkFY8LutDfPL57dE2
 cp1LEiXioaaMSi5TwIIKqnNZ84c2li7zwgwQ68rzNw1Tcnv6yXAHR6+H08CLiqtNHXTB
 d2rXhmbuIDEMsY914ve4kPIH3D2+F+QmqSsI4/+/BWdhB4cW60/vEHZwmMtRw5TXpwPu
 /IppwPY9cqMjoHTxWazz5QccazhvOH/byW46MTJfcJ+udXQWUMiGDGmoC8cHdgicCIUZ
 oCJyhLSBmzLOWq6XlK3i3LbYCVOkrEsJ1NbmMSWAxdoaS/sVsHyBEZy4LHUUuIepX2CH
 1AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701073141; x=1701677941;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2uKGv73n9zPoCLwWnUxIRJtwy7BLdOeRGasRuwlLaI=;
 b=H3WMzXQaqRHfs3CyBQ+7KBN3ksk37w9pBRAkKl9lsTClempalsMvLaetrdkQWvAq6m
 7vG1mDUCd7MKKFPzyVQrSGg+DQ1pNd9nQ2sad9aGlzAh6T7fBlSRhYfahFZEtr67Gp1q
 4IpUOpb2CI6475G3FAh+6tnJ6K3okm3mlX8wF36Q/lGNV3X2F3sCjo1JbTUKUZmLos/O
 sjfQCipl+BBrz9hnNDDMlWU1vtDPZj+ecM4/2fmU1dHmKJX/gap/hdhbpXb3wAr3B3Gz
 rCEhBCkFXdJ7SeyielOoFnD6Dk0oKnmnBUFDvOtcw7BCdbEvgat3aQP27v/JmYIQ+Tta
 NlAw==
X-Gm-Message-State: AOJu0YwImC4MZw+r9TEJ5hkyo3TlrrJEZS39pGAqpGVwCyZoHMEworLw
 eA8eqcD62P7VXd/TOuI3UtJzSw==
X-Google-Smtp-Source: AGHT+IF1gTyhMEF3F7i1LRqkM6Hdwo5CzhiNmHsO3on2+Ni4UBjAsOeQokHh2iH61R/I1gEzM9biJw==
X-Received: by 2002:a2e:b5d3:0:b0:2c9:a05c:547d with SMTP id
 g19-20020a2eb5d3000000b002c9a05c547dmr1718714ljn.34.1701073141585; 
 Mon, 27 Nov 2023 00:19:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b00405442edc69sm13516568wmb.14.2023.11.27.00.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 00:19:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
Subject: Re: (subset) [PATCH v9 00/12] drm/meson: add support for MIPI DSI
 Display
Message-Id: <170107314034.1083800.1585049254380328915.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:19:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 24 Nov 2023 09:41:11 +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: add example covering meson-axg-hhi-sysctrl
        https://git.kernel.org/amlogic/c/beb9c30ba4188e481991d91124c554f61a7ec121

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

