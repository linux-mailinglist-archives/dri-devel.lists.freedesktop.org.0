Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C355B80C43A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C2C10E36F;
	Mon, 11 Dec 2023 09:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F0210E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:16:19 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3333a3a599fso2711233f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702286177; x=1702890977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i92w0H7T5cIJREEPTTsPXzjdkkN3FCVq9uA4lCfv1LA=;
 b=Wc8SSBUZLPvjKwtgZ7MC39saqjMPDG5+9iS5Tsy/SPVpDYTOmt4RfuiAk+8EMPVYkP
 6G2sdZM19LrTt4CVp5A3FX0fSp3683sL8Smb8RZ7pmrA0XVcF6sxm6OFmFD/fa2054ft
 svjJnLe2LX/OeWviLmyAcM2SXdKAz0aJRVMW0CfngmtSliUN4RsEAumHx7enIuk7adzF
 RtSmxjeMkACYf6hR18I3I2tpQJzAc1jU4xyNTIYJ1ys84ThtvyvhRQ4sPq8c7AJEDgCn
 IZHojQaIcUiSUk1f1TZBCEDAAqwVofw7UJ/xm0a3gm9gauiyNWmAoU3d/KzJ59ws/xTV
 unHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702286177; x=1702890977;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i92w0H7T5cIJREEPTTsPXzjdkkN3FCVq9uA4lCfv1LA=;
 b=k2DJWOSW0RAk+bB8ULhiSgQN+aTVk7sijVeGZRAgdVPEUfhoWJfuW957gVHHtf78lP
 pPoHlqna9GjHf+sGChAXnfpVXbkP/iRYZD8SC2orq5l7mo+xU76RffGH89eaQpF5vnXy
 6qvjxPkchdbIegHXQYm51VXVagTO/2dEUZ/Xpw9sqZa1moUbxAz9h5R0y8C9M0iilLmg
 h8acTqSoYsnMoFPBrrNIuMK+jLhOXQh8d/ws2Q2CAL8n6A4wjOrIs9TT6JDk1czgBLnF
 WJLeii3iKl9Urg4dOl709ARlFpHrEVK2U/1IkUlLYZUTkzkmBP3s5gMjQAzwJZ7Iw7Sg
 U2Gg==
X-Gm-Message-State: AOJu0Yz+zN6BUV7tTmvmmdNUi+uDIl7oYHlGYtiB9I1quv+jFLL75XrD
 250T1xGdKDj5F549YxatxbDH8Q==
X-Google-Smtp-Source: AGHT+IE1Y3s47FyeYwxBMhMeqlNT8+HKhqIsiKFRswD7iG2IJiOPDvdZF+8n1xssCubPjCtjT+n+5A==
X-Received: by 2002:a05:600c:11c8:b0:40b:5e56:7b51 with SMTP id
 b8-20020a05600c11c800b0040b5e567b51mr2033425wmi.154.1702286177549; 
 Mon, 11 Dec 2023 01:16:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 bd19-20020a05600c1f1300b0040839fcb217sm12398470wmb.8.2023.12.11.01.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 01:16:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v5 00/10] Add displays support for
 bsh-smm-s2/pro boards
Message-Id: <170228617622.2409693.12899768447819855539.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 10:16:16 +0100
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, michael@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 07 Dec 2023 15:16:29 +0100, Dario Binacchi wrote:
> The series adds drivers for the displays used by bsh-smm-s2/pro boards.
> This required applying some patches to the samsung-dsim driver and the
> drm_bridge.c module.
> 
> Changes in v5:
> - Replace a 'return ret' with a 'goto fail' in the r63353_panel_activate()
> - Add 'Reviewed-by' tag of Krzysztof Kozlowski
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[06/10] drm/panel: Add Synaptics R63353 panel driver
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2e87bad7cd339882cf26b7101a1c87dab71962c9
[07/10] dt-bindings: display: panel: Add Ilitek ili9805 panel controller
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=549240c98e50207244bc1ac182622b8daba89a89
[08/10] drm/panel: Add Ilitek ILI9805 panel driver
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=edbf1d506ebe8c0857c406bd5d5b81d46ffd8437
[09/10] drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b1fcb7ee3707290466b2cc4956325fb91f09f13b

-- 
Neil

