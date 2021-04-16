Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689BE361CD0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA80C6EB57;
	Fri, 16 Apr 2021 09:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E247F6EB57
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:27:44 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s7so25903776wru.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UW+b9Omz02QYLN6IJYLDRcym09SpomRowE67Td03hF0=;
 b=2SXyPTN09paaUUHLMYjUPiOreOsjYnlSmKr4JE96Aqe9W8aFmXg4hr1bj4bxzB2QSt
 75zILaiFt03bYFsKYqUldY0Tm2nfLT/pccj6fgbGcl1UbvoC+gmoOQwx0g+dwPf5xbfC
 QZB9N4nRgbd1LDpB8yHSfk+qjLjKkc6WDst9Iny4KDpA1HO+2Bs7iBYurZH6LqcDGQ5+
 ZDXtn6Y33TdB7Pqszd1cQzxJske76wXleM1nsl26M5yhNsEzYyyRvoYE2QmX6hHKTSGw
 hqLfeB624/Bdl6OMWA8cRGtDlOBjx9VPYF/L6I6QT90YNFOyey68YNxO7hAeOOH4NEQW
 LFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UW+b9Omz02QYLN6IJYLDRcym09SpomRowE67Td03hF0=;
 b=Tk+fY7KMlaV5Qpw3iRuTundkGXKThpIELT+is+d75y/OtaRHr5H8FqRi3iLEVLoj8E
 62vn7mXzcXv8kHeUZCrlZeHr1k81cQJb2JGrXv4q/+pL3p9iZvEkVb5z1cDyHlpoNdIj
 ALVuOivHiJJCVunav30tjikOnrbV2CjKdDm+nPmS2iphs3NgfZ/ow2GhXMJqKl5ZGA2P
 qF+ppyW88uAvsPKYr77EFoLI+KQct6aJegXOV8Opb1oaeIacHpHxR5vLJT1QDnqU7H7f
 +TMrIvB1+BlLb2LX5o4eL0lRNU/hWMF6S/RLIRRCsz3+NqgVH2rL9qZCSspV3sQiYyI4
 23jw==
X-Gm-Message-State: AOAM5325cZU8726bwU7gJOrqRdoycWvIPN6MDjKqBrxrock1/QMsb97u
 YktDjG8C4U6r+rw4tHVVqNbssg==
X-Google-Smtp-Source: ABdhPJy7PfjmtGJBOdddxLxdWJGQghNiu2LsQa7tLkmPIufbPgxZciXvPq9nhqNHPw/dBMV7hWt+SA==
X-Received: by 2002:a5d:4251:: with SMTP id s17mr7986834wrr.174.1618565263540; 
 Fri, 16 Apr 2021 02:27:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id
 h8sm8805156wrt.94.2021.04.16.02.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:27:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/2] drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
Date: Fri, 16 Apr 2021 11:27:37 +0200
Message-Id: <20210416092737.1971876-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416092737.1971876-1-narmstrong@baylibre.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=AIXqGHKTvAxrfKSlg1n3zbWJ5IG5DkS6Kb91/enRWC0=;
 m=2JvXyHbVOdgr08yx3xTtTb2RALrmH6WvCQut165FoNE=;
 p=ALx7NrZjStGjkcT7P2hXJBXnDsBMqDSSAFEUG8wpqV4=;
 g=4e6918702c99f2fd53451a77865692eeb1ce6f11
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB5WDsACgkQd9zb2sjISdEMNg//eHW
 wLuyr89JyKh095fVg/U17vGXWCLJ4CoUOcvalJ7GqQfF094VlAnboFML2V1x97mGiXL9dEWzIXIU7
 njtgfXlKA0lczx6uhZMbkD6YoCRHxvLZ4I3oWcCl1hZnKlhUgysO7Kp5RPAGRVQgNxkopRLK5LBYo
 DqmIEfvh976jxGsRdydHIgt3xKSGYV9JLj57+PP6WbnD0MHOm5EJLRettmjVJl39NzW6kbvlZJxrz
 n/vbP1ydH7Mf11NeHGkzi24eCx79FuAbCKIFdfIoZREybjXGjoE9guX4LKHbrzznFx1H12emkMucS
 cZ6EDw8V0rEtZJBQnib6MllzAp2cSEsA07NTn8/m6SlDxFPh/ZyHKfgJisY2bclJAzgJAWyj+/oxl
 1aliLRovtOP6qej39sYRMp8S9RBADFdmqamr+B2CbqH23odahkg2MbuSfm5X5tKeqOVlwsMnNMi+C
 NV9df8kcJvjTx/A7ypWeZdZNa4Lp84bRYKMXE1kGpBCz2HaWN6qQmEOaODqGyY/w/RADuPRcc6Yxc
 8pqefJFUx7qK7YiV+gHcw7xI2z2FNcR+D+VTpSVHJNsOYMn2Up7wjyySgCZzOBGTgAwqkIBDeyccR
 brk9G1Fu3JQMrQqOlguW82Xz+kpfjxjAVsuszHdttk/bhsHqpvgjO+ka4JHEWzSE=
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the Amlogic SoCs, the DW-HDMI HW support is here but the DW-HDMI CEC signal
is not connected to a physical pin, leading to confusion when the dw-hdmi cec
controller can't communicate on the bus.

Disable it to avoid exposing a non-functinal bus.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index aad75a22dc33..2ed87cfdd735 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1103,6 +1103,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->phy_data = meson_dw_hdmi;
 	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
 	dw_plat_data->ycbcr_420_allowed = true;
+	dw_plat_data->disable_cec = true;
 
 	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
