Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5B273C50
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F486E0E6;
	Tue, 22 Sep 2020 07:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0014C89A5C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 18:18:28 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s13so420658wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1MQxxkBThDiurj1v2jhCnceLVLB/fGM4hxv7q+SCYY=;
 b=Jo7iHJOCck6o7eEnd+5pX9prtparE7DUushGGX5zieZVkWYeruvuLW89Pl6KE41MOM
 kISKm7ZBw/mss7rigBz3FgEnn7Kqy1QUnOJGwY89uQzQiAFS1z+9kfeQheqf7xghjR9B
 NT69XADwIeDGX0rv23yLg7NnMx+BL3fB8TrYBJqXm5yVFgCZKEWkxjhW7wyXH3LIy1/p
 qhGDLG7Ql2QtJL6ga6+9DRhVkofGkLtarUMiHIfYGc+MTzHw6VEqK3Icq7U/Tp7gR3UP
 oxChnT8yniIqa8g+FpaKCDwV1qZzytN0NdluY/gSYqhgTpWDw3j8eCgU6j4WkZX2JBZs
 Mo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A1MQxxkBThDiurj1v2jhCnceLVLB/fGM4hxv7q+SCYY=;
 b=IZJwDrNVHEDAFbh/GCDgaf1/R7l8j2SdgCvLfxZ1hpfvvu+nzPg2HYHmBJSaXVcWhy
 ee60rumlb+hOqZTgnRtq3Jzz6k9acArL0z+lHgAUSGQhee6wqvamJ2t7Ocb0FbzNQZst
 tJvthNuujFe0LxVezx8HJBEl4Z/rpHSDuUEdbzBQq47u0A9vBcP1LuGtW+eEWLY7AgoP
 bWIZsc89CvY3hlneSsGDn9Rq7wAogvb57UpCUURir/0oapZnHLN2k92YqiQdK5ysLLPy
 SONtCkjj6YtgrZfw5accZ51SS+WFuZ7Sj67vViLAOwlQ0nXZbppQefli4NKmRoRXR389
 Y+zg==
X-Gm-Message-State: AOAM5308jFJvBOM6rl/kG3ckbDS+2AVCLPN0xV2gNI0W8MAszZczBuVb
 dNrHxM2seFFXW17s5Bf6ljw=
X-Google-Smtp-Source: ABdhPJzovgLUVrfshcXNKGJlgkuOJ9nLWi6qMfYi/YQ+Z/7uKl5Iv6EsKAxZiQe7OgRFA96Yf6ctWg==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr601309wme.27.1600712307674; 
 Mon, 21 Sep 2020 11:18:27 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id h16sm23523249wre.87.2020.09.21.11.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:18:26 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 0/3] drm: rockchip: hdmi: enable higher resolutions than FHD
Date: Mon, 21 Sep 2020 20:18:00 +0200
Message-Id: <20200921181803.1160-1-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:37 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series enable a QHD HDMI monitor to work at native resolution.
Tested on a Sapphire board with RK3399 connected to a Q27q-10 monitor at 2560x1440@60

Vicente Bergas (3):
  drm: rockchip: remove vop_crtc_mode_fixup to fix clock handling
  drm: rockchip: HDMI: allow any clock that is within the range
  drm: rockchip: HDMI: add higher pixel clock frequencies

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  8 +++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 45 ---------------------
 2 files changed, 7 insertions(+), 46 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
