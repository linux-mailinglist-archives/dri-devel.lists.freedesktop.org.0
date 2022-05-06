Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5FB51D589
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345310F8F6;
	Fri,  6 May 2022 10:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E1910E22C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 00:18:26 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id u205so5743467vsu.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 17:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZFO0/X/vWEUc+zmpnjuir8mipg1ZbS6pdwOjQD5+bs=;
 b=ZYKXY8NbJT12A50plTM07lGQdoB/lVxQuLXn33FjCp1vGaIgcbhPz4YJDRjhuraelo
 ii9/bHeKT69TKbkjXJK+mDRy75JtZRXRRtTZn+TVmQnyomVG+cuGqIAbEjLTrJ6YU8QP
 VlEXNVFVcB+bNk2xdih95GY+y0OSLmF5BBDpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZFO0/X/vWEUc+zmpnjuir8mipg1ZbS6pdwOjQD5+bs=;
 b=SYcM3rK8Ft0PKaDw7SBMXFKwGkaBuZ5BUUikNTQbmPTe3FXYrLJ/vBhpFDVB1NiBff
 SkE6WtjrV6Aa9qwGhHguwp3mqw7mUwNWvdMXGpSgiNGVcvs9xQA4J/u3KPo2qkgAhzl3
 YiFDH/mRfyX+pIh7Yz0sW5x6XvjokRk1MBTsFrc6OxMrbaJ3CQ74HZuMKfTHQN0WE3R2
 QrQEmuRDfcxfUZR6w9qigmiyk7ziJlRVWLH2YtU4fcKoelJdmph40yzRaeDuUimJnH5u
 m81pn0yXHYYEHJ/wZcpj+J4gCA8ppKVD+Pe8FXccqvhFw2zeCOT+3eY8vvq6ZauabCVD
 Q38A==
X-Gm-Message-State: AOAM530PDQADGSRLY1Fxz+fui5kpPHj3y5YC5i76CFqFqvOjYhdj/363
 yS5aYn5+Fd/MWG443BBHS5Ktjw==
X-Google-Smtp-Source: ABdhPJyJC9yTTH9F2NEeAPGLhQDOfBLVsSK18AQ6Xwm+/tJSrmBwBnqqKaLV2QTrTQ2QeT+mW4f6Iw==
X-Received: by 2002:a05:6102:2752:b0:32c:db47:e6da with SMTP id
 p18-20020a056102275200b0032cdb47e6damr226789vsu.1.1651796305274; 
 Thu, 05 May 2022 17:18:25 -0700 (PDT)
Received: from big-jim.c.googlers.com
 (241.36.196.104.bc.googleusercontent.com. [104.196.36.241])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a0561020f0d00b0032d275e691esm348301vss.30.2022.05.05.17.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 17:18:24 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [RFC PATCH 0/1] drm/vkms: ConfigFS support
Date: Fri,  6 May 2022 00:18:20 +0000
Message-Id: <20220506001822.890772-1-jshargo@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 May 2022 10:19:04 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jim Shargo <jshargo@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

I wanted to send this patch out early to get some feedback on the layout
of the code and new ConfigFS directory. I intend to follow this up with
a more complete patch set that uses this to, for instance, add more
connectors and toggle feature support.

A few questions I had as someone new to kernel dev:

1. Would you prefer laying out all the objects right now or add them
as-needed? IMO it’s nice to lay things out now to make future work that
much easier.

2. Is the layout of /config/vkms/<type>s/<id>/<attributes> OK? If VKMS
would eventually want to support installing multiple devices, we could
do something like /config/vkms/card<N>/<type>s/<id>/<attributes>.

3. Should I split out the documention into a separate change?

4. Any other style / design thoughts?

Thanks! I am excited to be reaching out and contributing.


Jim Shargo (1):
  drm/vkms: Add basic support for ConfigFS to VKMS

 Documentation/gpu/vkms.rst           |  23 +++++
 drivers/gpu/drm/Kconfig              |   1 +
 drivers/gpu/drm/vkms/Makefile        |   1 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 129 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c      |  10 +++
 drivers/gpu/drm/vkms/vkms_drv.h      |  25 ++++++
 drivers/gpu/drm/vkms/vkms_output.c   |   2 +
 drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
 8 files changed, 193 insertions(+)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.36.0.512.ge40c2bad7a-goog

