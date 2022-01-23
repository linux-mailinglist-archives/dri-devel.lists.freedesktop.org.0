Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B44970E6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 11:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839410E787;
	Sun, 23 Jan 2022 10:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808FE10E787
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 10:17:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id k25so12989275ejp.5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 02:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lB8XSxRjvuzKmS4p6TuIuctAAnCHKLSOUZjrVWazoRo=;
 b=G75il8kR2qruiPOkfxs+oOCDarCEaK1qkhIz3bmU5GEvb6OspXoqkozrxOY0QKucAZ
 1G63bh9/NNLZjaZTAJDk9s1bz64uzkcM3KpW4ucNRF/nlM9SCSv6+wT+GfYAbHEj4ovY
 saqDu7Nl6v8B4EfAYl5Gxuqfjc/Y/pFnyAFxHLOH3ffW95KmUk40LnvmJh6+gJYNXg1O
 mFzgSm2fZFlHS79m2mhX3plfBh+BfFeD+iFkMvAl3nUMqfhaxBToj+sAJc+22qlLsEel
 19Q/rv6PqmVrkG4LcsyIUw/teU5ADjsxKySopE+uFObo7hCt12CjEHHLDz4IgSUYwvnO
 XlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lB8XSxRjvuzKmS4p6TuIuctAAnCHKLSOUZjrVWazoRo=;
 b=XoMmmjmYKrQZAYLaAQFZFf4DvpjbqJxOcUn2RZ5UslwVvP4AMcbTR7u9ApGpazkBG2
 3lyleVOeXUhQeIqof0itGz1+XR7/8LIhvCF16gUWG0iHTJ7d78AGNxrzZXasV7g0ub33
 TAWqzzbOeYkxbwcP0OfcTUk8yfX3zctHfOGc09cCQN3ZfJsDNlXpKhO/Rh1Pu4IsqtyJ
 f9rHVVZJYUtC1XoSvdVnju1X/Az4JrVdydxYrHKeXgSvWqEZuqq6QSRyeLsntSyzp/1y
 nidqFoLba9TlHErw5lNKXz4Cx86SQbv2SyPpymbae/YhfTXvNSGHuBr36Xsv7JatxVKZ
 bhFg==
X-Gm-Message-State: AOAM533lHMo1dWj6O3oIIEjd2gt0eF5k1Fsnq/14W4iLZJHNaDjCjpg+
 B3IBt2Uke+G1Fvend8bovUaqKDWIs7ZN4A==
X-Google-Smtp-Source: ABdhPJw4NpprwmytCHTXuDWe+Ko4gav72zUV27ZSQCZnWG2itgKhc7ozAWuo7gjNys0/dpTY0olb2g==
X-Received: by 2002:a17:906:2590:: with SMTP id
 m16mr8885452ejb.653.1642933056035; 
 Sun, 23 Jan 2022 02:17:36 -0800 (PST)
Received: from ped.lan (dynamic-046-114-141-233.46.114.pool.telefonica.de.
 [46.114.141.233])
 by smtp.googlemail.com with ESMTPSA id by22sm3670552ejb.5.2022.01.23.02.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:17:35 -0800 (PST)
From: Philipp Zabel <philipp.zabel@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/edid: remove non_desktop quirk for HPN-3515 and
 LEN-B800.
Date: Sun, 23 Jan 2022 11:16:53 +0100
Message-Id: <20220123101653.147333-2-philipp.zabel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123101653.147333-1-philipp.zabel@gmail.com>
References: <20220123101653.147333-1-philipp.zabel@gmail.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Jakob Bornecrantz <jakob@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that there is support for the Microsoft VSDB for HMDs, remove the
non-desktop quirk for two devices that are verified to contain it in
their EDID: HPN-3515 and LEN-B800.
Presumably most of the other Windows Mixed Reality headsets contain it
as well, but there are ACR-7FCE and SEC-5194 devices without it.

Tested with LEN-B800.

Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
Changes since v1 [1]:
 - Quirk removal split out of patch 1.

[1] https://lore.kernel.org/all/20211213184706.5776-1-philipp.zabel@gmail.com/
---
 drivers/gpu/drm/drm_edid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 271b5616cfaf..c23ad8f0b3e9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -214,9 +214,7 @@ static const struct edid_quirk {
 
 	/* Windows Mixed Reality Headsets */
 	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('H', 'P', 'N', 0x3515, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
-	EDID_QUIRK('L', 'E', 'N', 0xb800, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
-- 
2.34.1

