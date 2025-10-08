Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD72BC392A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2656110E765;
	Wed,  8 Oct 2025 07:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PlX7ItaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E998410E767
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-586883eb9fbso2494842e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908687; x=1760513487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
 b=PlX7ItaK4NG2HuGOwt6MMAm1y3hrL3FDA1//dsIla54KnJmfWol4q+v3+p8pRgQwlx
 BvT8FYgztxdJ1rab/OpMp1KRJnYtPwpF+OGpQ9J/XybofkI19Jkzn/IvBIZPXKZuHT4s
 qvFDvIxkISqcpQLrJS44DxHw94gpN68yOMzHV2JMWMk17q1VQ6l/VcWrHPWMQA38Muax
 7QK5ljen8fQV52i0zwVh9D5/lgnFyfFyC6aLknUns/MSEOaFRmGNkJTOZDqCiZaRpfP+
 mbF1VlJ9IB8TpeIcgvUKuxkMGZUGND7iywKZ1jC+a/0tFq6zyLX9UJCTJHS16uEJE9gZ
 pr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908687; x=1760513487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
 b=h85zn0rfLz+rdDCk0wwqIA7G5pt4dKkETxA8ofJnPyIcgFaEPmuL2Wtk9xCFuvapLk
 XJPN2k7ClhqYBA84GpdENhDO3M4Y6skVa0/LSsFwd83padU/yKJ5qsR5AQpAh4mVli4c
 3yaFufU4FqQCGPu4FRSkYyOoxT0eVJt2Z1cd4shuuIZzaXWj25ehFOz4vr0PDFbq7TEZ
 YYXQBGPzGk9aj2zWo/Q322rV2wX3F6IL6ivrx/ZSWZj2LNhp7/LamfHPqbkgJKXQzMFM
 0fQnayIbPGGvOXO+qgj147/lAilNHuCYybeO1RkWiXFA0r/Dm3XL2SGvzWNvUmhtwqfC
 +6Cg==
X-Gm-Message-State: AOJu0YyznAmCumA290rMQcZ7L0GaLha3lDkgErhAcpmKMDifqJSKIXqZ
 +vLrKm8T1HIDnb/zI466PYyIKZgLagFbLFstHQIFsj5FulNMKKPTwXmb
X-Gm-Gg: ASbGnctlEDMimW7bJa/+3rmVVYotkrhChm9MeiXkXXNvpnpPMdMr45Nz6HAcgTuqUEZ
 29FCu9R9g5t9CmAsB33p345M72SSqhS8bXLSQaao47rYVletPoUcKJ1KmCV34NzDjeb6mmd4atg
 Poy4X4NziIDweCt8n1COwAGPauzxVTmPRrTseAQhdtjRvStMrAjXsU2CUXojRKIBjCMJBuvdihG
 xd8uyK0925ZG7J4Dzic567bt1e9MDjNZ9G1YD8a0SmXggBWa/O43Guvm3TmRbDA7CzOilQse5d+
 XOkRdV+Jm4SVuH1pHjKcLq+bLTC5Q6jtbS2JyleX8B6R62x2BPrN76/a5UFlnBmSJ6gKd2apq2y
 y+rUBQGMlYYw5vVJG7YXVUUo7Tjnyhq+yivGiXew33TrcSi+x
X-Google-Smtp-Source: AGHT+IE+7DyJpwvFP5qOZN8PeNT6/Gm3MISOvz3ifkWRFTEcK846nRXZ88LLrVfYB+NusyJQJau+2g==
X-Received: by 2002:a05:6512:3f28:b0:590:656c:d10c with SMTP id
 2adb3069b0e04-5906d88b1aemr661760e87.16.1759908687027; 
 Wed, 08 Oct 2025 00:31:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v4 08/24] staging: media: tegra-video: vi: add flip controls
 only if no source controls are provided
Date: Wed,  8 Oct 2025 10:30:30 +0300
Message-ID: <20251008073046.23231-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

