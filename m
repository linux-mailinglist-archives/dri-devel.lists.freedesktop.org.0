Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05323A08955
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 08:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FD810EFF1;
	Fri, 10 Jan 2025 07:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bcaH2FFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9DC10EFF1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 07:45:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso13281535e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 23:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736495107; x=1737099907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ATDsjAK0uKMKhFaAu8bbQjJc2CPGx/RtQGrifkWV5pE=;
 b=bcaH2FFzx0Yne9htVisDR0rwMT1RkXLreOA5rAFznLyM33kBPFjHmdXPil7UqAFUyV
 5VayPwFU9mF2Pta5lyxJYatPKKuoL73Hqb5BvxavdwUNs6gAS5jYHDIfhhEhHHmsUYbz
 66+5YucN11tdeoVKDlaYI/GdXkeaAlYBjsmh1h162cSx0EMOLBxFlKVLP4g9bJYamEJP
 BPosqQ5aJH38phllJdzdfp5/mr0Es7r3iu0pYhSNdVFc4eAFMF/NalFALcaBwFtJUKfX
 uSlUU7DIuGQPi6Zeb+1d0kEpoqaosrDd5p4VTfarMu4voTmAR2hQNjZdrlkZSGJyUu6B
 PR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736495107; x=1737099907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATDsjAK0uKMKhFaAu8bbQjJc2CPGx/RtQGrifkWV5pE=;
 b=Nz0N7Mbf+9e/LdjUyp0k4jLuNE3f0aZUVCUylqbURDXH1OhVqZ/YwXK1Kn/FQl119r
 FBQCJ0i5MjGXVXJGiEeNoXmCTOn05x1m6F2ZlRHDbroAwWlXgyLyl45cqfxgQ36USC7l
 lCM1bToH0hi8SVmXBWVFeBp7OMcWz8i9a4tfMP15HgcLc1DZADYZzUOAb8M/cbBuLWFD
 5clS2LL8iTzIESJ/HOu7+tGH8faO7dNjKKVBYcz4fdrSq1jAmwLW72n5ADeVW/Xz7LSV
 ADwa8+qyWR++sqOOfkCd3EWUih7bpF52spVHP7wEsjr7thg6h6x9SOwi5xmSBfAGpeET
 lvHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPcVR7EJKdXq0dR2w4foumeLCdshiwL2+httGJyT/bK0veR/ZaEBh6ccB6lDX4j8d1JYz1WI1fGJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWJHbIdIeSoIXl4BEQZLCpgdav6/lwxp6yw7eHSu2nKxAbZ0cP
 wr3m5a9jf/mE8oe+LxYrNDm7xnHd4RSBf7b8Pcjrpokxk6sIwcrw
X-Gm-Gg: ASbGncuXQrno+9gfsgO3BLXTBZuDcqVnGs2Kh9HLeQ8uy4mMQZqBsLeuDSs0uU9w8As
 bWp/TjCGMO6+HU7CTYSYT6mYlc2QWxl8+yya2Ql8MixUS6kBLTOx9nFH4sNv5cma2CUtRggcRW6
 DnY41wk/znZRhVtcrglu9SCO/IWvYYVI66xCzrnjhbRDpjYVAqdHC9MYcAznlrQjoNxZO96ckSm
 ThPzwQSgTyk5uNm+kVhC9KLNKjGaVx+wqtZBYTsixb4LE02wXCORTV6VP6ALA==
X-Google-Smtp-Source: AGHT+IGb+vzb8Pe/v6kmaLVgm8KOUcAV6AU7z/JagMZlqc8SrieF7wsh7dlW2Vj7FxtpiiwFRDJhZQ==
X-Received: by 2002:a05:600c:3c85:b0:434:a802:e99a with SMTP id
 5b1f17b1804b1-436e267821emr85597015e9.4.1736495106968; 
 Thu, 09 Jan 2025 23:45:06 -0800 (PST)
Received: from toolbox.. ([87.200.95.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e8a326sm78547995e9.35.2025.01.09.23.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 23:45:06 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/2] Revert "drm/meson: vclk: fix calculation of 59.94
 fractional rates"
Date: Fri, 10 Jan 2025 07:44:57 +0000
Message-Id: <20250110074458.3624094-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110074458.3624094-1-christianshewitt@gmail.com>
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
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

This reverts commit bfbc68e4d8695497f858a45a142665e22a512ea3.

The patch does permit the offending YUV420 @ 59.94 phy_freq and
vclk_freq mode to match in calculations. It also results in all
fractional rates being unavailable for use. This was unintended
and requires the patch to be reverted.

Cc: <stable@vger.kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a942dc6a6dc..2a82119eb58e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
 				 FREQ_1000_1001(params[i].pixel_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
 				 i, params[i].phy_freq,
-				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
+				 FREQ_1000_1001(params[i].phy_freq/10)*10);
 		/* Match strict frequency */
 		if (phy_freq == params[i].phy_freq &&
 		    vclk_freq == params[i].vclk_freq)
 			return MODE_OK;
 		/* Match 1000/1001 variant */
-		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
+		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
 		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
 			return MODE_OK;
 	}
@@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 
 	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
 		if ((phy_freq == params[freq].phy_freq ||
-		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
+		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
 		    (vclk_freq == params[freq].vclk_freq ||
 		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
 			if (vclk_freq != params[freq].vclk_freq)
-- 
2.34.1

