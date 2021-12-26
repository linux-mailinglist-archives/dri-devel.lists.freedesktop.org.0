Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916F47F680
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7C610E773;
	Sun, 26 Dec 2021 11:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A177110E773
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 11:12:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a9so26414611wrr.8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Dec 2021 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w27CKQZ8fZfwfzK3N8SKjXWwePWrkxb0ejgWzbzGC9g=;
 b=BHAxm//76OpzciHvg1EntaNOSuB691GvrQvOpTXIJyiidFNRGn3IueByZHXuMhzp8P
 MYYUwMbnmTUCzQItyblE+XluKbYpqJYMjWU46EP1tQv9sLhpaSlPvD+XYt5wageuROs4
 C2kYQqLYZIo/qC/twpnXrhXyrLs7V+l8q/xPHW5PM3YnmUV/69UqbBOB9ePfr8k8CejK
 EdrFdap+NPdgnAHjkWardIVHw3UxadFHCmTpoB7pwRXiiyGBpRI+3XJWSkHEoAoz4nZ2
 /ts8sj8R3ElC9wwEVpjCbQn+hedtlHZ8UeJlzROI/Oo9rbI0kKq3QEmtDsiLcj31NdzX
 LuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w27CKQZ8fZfwfzK3N8SKjXWwePWrkxb0ejgWzbzGC9g=;
 b=ZTsm/TIylRBOqdXsw8nrjmOrg0nieyVW/shon7sI+JYXWXOzpmbgEMuURtXMxw1yeM
 LInvvqFxT7HozqAtsO7zY4/ZSbpTa5VyP7eTbgW7E3Az35RSZjUumovKkcZpDIxg82PT
 DOSrUb+4URemRdidIAMp605rKqTZJLhKMR3gY/jvuoaQ4KEJ1HM0o/pctMmVmnVq0axE
 NNTfo6rD0CR8k/9xpyN8Fg9hmhx7G9Wjr2rN59Y6WmuUeQnKj+uRAuMVcUQYUdGoTiot
 +oLEPB0sY48QMoG2EWi2VVWciUb881Zq457kyyXDE+U6J+4RbAVPXl5rvZRobVmH2fpz
 ApTQ==
X-Gm-Message-State: AOAM5302UEisXaL8NJCl3sqx9ZR3XaFxmtP7LmfQRjm/MqfIoB7VIWEQ
 w/Tw5apD5xAzZX6gwU6cIdI=
X-Google-Smtp-Source: ABdhPJy0pdQxFcCPxQLjqqSDI2TTp5sPgVsZOv1dWNImuKZqSvfxW7Ske/KAju6W43T0+poWiKMLIQ==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr9460610wrb.455.1640517170166; 
 Sun, 26 Dec 2021 03:12:50 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id q14sm12156970wro.58.2021.12.26.03.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:12:49 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH v2 0/1] drm/vkms: zpos
Date: Sun, 26 Dec 2021 12:12:18 +0100
Message-Id: <20211226111219.27616-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This patch adds support for the zpos plane prop in the VKMS driver.

It should be applied after the "drm/vkms: add support for multiple
overlay planes" series [1] because this new patch takes advantage of
the new constant "NUM_OVERLAY_PLANES" to set the maximum overlay
plane zpos.

Notice that, as explained in the commit message, there is one test
failling (plane-immutable-zpos) because of the timeout capturing CRC.

This is a known bug [2] that needs to be fixed in a different series.
It happens when the primary plane is disabled. The vkms_composer.c
vkms_composer_worker() function is not able to find the
"primary_composer" variable and the test fails.

As a quick fix, commenting the line:

  if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)

Fixes the issue. However, more work is required to properly clear the
background and blend the first active plane. I'll look into it,
feedback from someone that already investigated the issue is welcome :)

Thanks in advance,
José Expósito

[1] https://lore.kernel.org/dri-devel/20211226104059.11265-1-jose.exposito89@gmail.com/T/
[2] https://www.kernel.org/doc/html/latest/gpu/vkms.html#igt-better-support

José Expósito (1):
  drm/vkms: add zpos plane property

 drivers/gpu/drm/vkms/vkms_crtc.c  |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c   |  1 +
 drivers/gpu/drm/vkms/vkms_plane.c | 23 +++++++++++++++++++++++
 3 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.25.1

