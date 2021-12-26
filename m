Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F947F68D
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4570F10E94F;
	Sun, 26 Dec 2021 11:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E28510E94F;
 Sun, 26 Dec 2021 11:25:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so6962410wmb.0; 
 Sun, 26 Dec 2021 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfySaQF3GaGT3rKhp9bzdbdDRm7QyTsYlFaa9SIqgGk=;
 b=qT65bImUN96BSUsorxOakT1Pmg3FQcOtCRO8UOzh45/+T06C3mZuMn0Fw+gQOU2F21
 soEjAjCbxIVI4iZZnAsvS9VvHfGJKBXRCf6NmwN0G130W+OZaFKnH7EZnkrdHkgwHROP
 +0KZ6T+OlQgI72s2f6TBshRmysdplrfFcFkDAyzkTGmYZURMW8d1LMFqaaleqd+3rlMQ
 0RlSdf0Dcd9KhEK2cf8yjWFGIyXH/znLFv6huY92C7k1icypdPx6UWBCUOSuSZwu6vg6
 kWmA2y2c1dWmV7bC/lIKDWe6XAQxmMAhNgTLhJ9hRliz+ENdROWuc90jenrwx80PqFzu
 yx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MfySaQF3GaGT3rKhp9bzdbdDRm7QyTsYlFaa9SIqgGk=;
 b=hu+qYmC5euhcKJ2j1J1bdMJ28D+uER95VpG5Wi/301+ofVUyD4O3JYwj4slpSyh6LQ
 tzEZ8hBntyR443322Jv2w223ox9G5GzeC4n8SRRCnsa7YUAYrIENt3JMlDG8Yp0zF1CQ
 O33MZWJ2Qtabv4B04CISOKA60r+TZaIgZNsUOKb14T19W0QFz3CmVIBqHnuKSVHdX5Hk
 dFMeJE9qNB6J51V9xeUYIgviTB6gVCTGmsAeRZssFM9XvRtDZbHCledcL+ZgFAK5zV++
 mY/l39M50JPvXoTHGs83bFS+DAaKbClxYVx1ysWTb/YsnjhADbOhtNf/xinCtJ8f/9XJ
 W7Bg==
X-Gm-Message-State: AOAM533RsUzTfLVGZRIWglnJLzTzLnmUoSppMw5YX57lXcHCOoCnnrtt
 8IIlmKss+ZAXWYwmRROAk2M=
X-Google-Smtp-Source: ABdhPJw59MvLvZ2RZ+XzSNYkTilLCKgdLom4W7pXuZ8fRzh57pIUaKcZzFzTnlj18iy9FRBp2KTB3w==
X-Received: by 2002:a7b:c08c:: with SMTP id r12mr10128651wmh.161.1640517912047; 
 Sun, 26 Dec 2021 03:25:12 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:11 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 0/6] Add missing format_mod_supported functions
Date: Sun, 26 Dec 2021 12:24:57 +0100
Message-Id: <20211226112503.31771-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 s.hauer@pengutronix.de, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This patchset supersedes [1]. Now the title is a bit misleading, but
I left it this way to (hopefully) facilitate the maintainers' work.

A little context: Originally, I sent a patch adding modifiers to the
VKMS driver and Simon Ser kindly reviewed it and pointed out that
"format_mod_supported" was missing [2].
I asked if the docs were incorrect or if it was a bug in
"create_in_format_blob".

In the first version of this series, Simon Ser and Dmitry Baryshkov
agreed [1] that the code should behave as documented and
"create_in_format_blob" should be changed.

The second version implemented the required changes and drops the
"format_mod_supported" in the drivers that can use the default
implementation. [3]

This third version fixes a compiler warning and adds the reviewed
by tags.

Thanks,
José Expósito

[1] https://lore.kernel.org/dri-devel/CAA8EJpqJ-tWmb5Ba6XSK59toCtLb3nRRmVH8da4Ud_rrRYytmw@mail.gmail.com/T/
[2] https://lore.kernel.org/dri-devel/20211216170532.GA16349@elementary/T/
[3] https://lore.kernel.org/dri-devel/20211222090552.25972-1-jose.exposito89@gmail.com/T/

José Expósito (6):
  drm/plane: Make format_mod_supported truly optional
  drm/plane: Fix typo in format_mod_supported documentation
  drm/simple-kms: Drop format_mod_supported function
  drm/i915/display: Drop format_mod_supported function
  drm: mxsfb: Drop format_mod_supported function
  drm/stm: ltdc: Drop format_mod_supported function

 drivers/gpu/drm/drm_plane.c                 |  9 ++-------
 drivers/gpu/drm/drm_simple_kms_helper.c     |  8 --------
 drivers/gpu/drm/i915/display/intel_cursor.c |  8 --------
 drivers/gpu/drm/mxsfb/mxsfb_kms.c           |  8 --------
 drivers/gpu/drm/stm/ltdc.c                  | 11 -----------
 include/drm/drm_plane.h                     |  2 +-
 6 files changed, 3 insertions(+), 43 deletions(-)

-- 
2.25.1

