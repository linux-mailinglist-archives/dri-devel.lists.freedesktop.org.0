Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3685363C44
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C26C6E1B7;
	Mon, 19 Apr 2021 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75226E1BC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:12:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so10508175wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QydvBdj3muJ7M80Koz1ByeqHqi9jujC5h+SgKkIJ42I=;
 b=NKkoLTHi8gMZXDrj4nVzkxBQYTkPY+6SpcEzaKfNVxjjsRmGIO6iNWmfHV5drDbSZe
 JY92f/fHY39XoJtlWnPipne+P3vUww6kluSPKh2rE2/haowmRVcpg/q+iFf5WkINlcE9
 nfeQeJNdIpgPX+kvZ1tRQNSbjzJuKY3G39r8X1jpjlwi+V4d/omP8eQWEAVy0xZg1FTC
 aWlXRCEmcR1y5mwfUHtJpau1uU7IelUq5XhcQsaMg3EbXo8L5CwGpV1stRVsnQmT2bHH
 ubToyeBUjgA1MiX6SRgB7NZd4GHuCxI9cbhTvZkjnS1JllNiOXEr5yzNwEzWMv3RABiR
 cw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QydvBdj3muJ7M80Koz1ByeqHqi9jujC5h+SgKkIJ42I=;
 b=NUQs0CVzf8Y2DU3gB+VOAfYDWgOxw/7IarC22K2EQCkftBn/3LESUWG2GTmGRutdc9
 FBgAusxWmNfQHCPH4DaN39KWb0kOrrDl/xjB7z4VD1VUokVOSQCj+JR1VuvSE9JLER3u
 CwS5+08wmWW+KmH2mqQmCAKwtK5tS7+mDpy0uHxI4m+V9bQ5y/QnBeyH1aKI8csTFKYb
 S0rYEL4Hr53e5tKEE0JrOu4TDI9UsPa3IhxPUTUWb2X8dGA2oxnA+Z+moGdgZeL1Y0Ya
 uV3EypiXgck4WTCql/FpMNs8b0WlOtmVSTmshGM/IZvbFrKV2Y3cVUFcpVXfkIrb275c
 qfDA==
X-Gm-Message-State: AOAM532sMWrHGl6mhJdmhlW0hdBAXuFmypjZ3WBJmgfI0KlfWebR/6A0
 sLBZtu222rPUzpaqOZqssMOBHg==
X-Google-Smtp-Source: ABdhPJxpUGKgFHOKP6MB10bHMuyLkePy+qIdyIUhJsdgc0n8v8fbCwU12SE328nSs/qmwNGwoQNVOw==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr20099008wmc.59.1618816348299; 
 Mon, 19 Apr 2021 00:12:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 i9sm10447922wmg.2.2021.04.19.00.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:12:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 paul@crapouillou.net, robert.foss@linaro.org
Subject: [PATCH v4 3/3] MAINTAINERS: add it66121 HDMI bridge driver entry
Date: Mon, 19 Apr 2021 09:12:23 +0200
Message-Id: <20210419071223.2673533-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419071223.2673533-1-narmstrong@baylibre.com>
References: <20210419071223.2673533-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=QfcZVt5wD67EB4SM1GoV8Ndq0aCcis+V2maojsn145o=;
 m=ioOOhVRROWtRdt7xNWMVgTYZ0m1td4cnyP6NtpjK4cA=;
 p=KhvC5rdoZ2wuPZOLbPoUIxgXkmX2Vodq2y7L3kYlfJw=;
 g=2af629d4821fa4abe2da2167a4f43d17172c27dd
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9LUMACgkQd9zb2sjISdGovA//dZt
 JxU3VeKHQUTv0si9Yv+VDelmk0S7g7Y15GRY+Yn6vKYFMioa1U5lszQji5PCzUK4kNjfzAoiiHjwL
 V/fdf7mMFxMYMDiJk0C+di42nobLu0Kj7rkIeMsnnRSVeadWdDWiMMV8K4ts0k8t50dR41w17uyfJ
 T2L9cjV11slevBPy4ZC6LwpYVWJ0c2aKvTnO8YRHwnSU4iVUINcgBZKVnb7MqZg2KaZRBAJRwsd1H
 zlIkPfdH7wt42clalfpmOJE2+cpUSxByPwttZt1vPwIFhxOj/QaAv/gE3WZ7jkI9vrOnAV7XQRs9s
 jly8ZOiZj9lHfPYy1MY0vjYCl6SJ68BRtpIfGuOa6b/QlcUvjv/cpqPit9MyspMvNKzixPiaoOuik
 nLnHs0XecLo5PqlH6nxoyrdXmQn6ya3vtugKbEUIoUrXBmvT1OS+nOm+GMvLVf46lQVQI5iH47x78
 PtgKHK1WUGWGpfM50LQp8hQAdobX107JXcENTpu8RxhjgaEFQCh9iyW0/E3FIUJEI3vkHKb8rVJSi
 72ogJIaw656uaano6u9iA19MpxTDB2sjyC9FFL8YYZVbSViI6b5ZCoTGObcMhS0g/cUvmSracqmh/
 0/RmeG6k9VQqOOevcHJniDtRdR2YDWi7GFxPSkRDnEb/H+MyLi3KWMJuosA+Q18c=
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
Cc: jernej.skrabec@siol.net, Neil Armstrong <narmstrong@baylibre.com>,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phong LE <ple@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phong LE <ple@baylibre.com>

Add Neil Armstrong and myself as maintainers

Signed-off-by: Phong LE <ple@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ae8444c96b4..313b3374a51e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9515,6 +9515,14 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/anttip/media_tree.git
 F:	drivers/media/tuners/it913x*
 
+ITE IT66121 HDMI BRIDGE DRIVER
+M:	Phong LE <ple@baylibre.com>
+M:	Neil Armstrong <narmstrong@baylibre.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+F:	drivers/gpu/drm/bridge/ite-it66121.c
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
