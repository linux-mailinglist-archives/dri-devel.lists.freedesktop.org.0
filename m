Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFEB4390AD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 09:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9852989DFE;
	Mon, 25 Oct 2021 07:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F6789DFE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 07:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635148690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0SKe2bjhvSLrSG4XH/ApB+juNru0m23A7Hu0J3xtAKU=;
 b=QJaKgKJ0SBx0EJVSEyutHwZCs+683n1mFR27rOOMyVqjxMxfnWU+1ppWCEWRuweGIT+XEL
 orYOdwv3U+zOeQja99kK5nA69OYN8nFqyipHC+QdBoIf0EU6YMVNE5hpOxef+BoJJuxPy6
 RkZOZ7/RCzPKZCEWBZQS54L3tk/SQYw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-MDeSxa5PM7OjAPNq_dPLHQ-1; Mon, 25 Oct 2021 03:58:04 -0400
X-MC-Unique: MDeSxa5PM7OjAPNq_dPLHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a18-20020a1cf012000000b0032ca3eb2ac3so2944961wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 00:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0SKe2bjhvSLrSG4XH/ApB+juNru0m23A7Hu0J3xtAKU=;
 b=GFghzoircVHwM72Fm2sFSv+PnvNqNr+bvkbg70Y+DOThlwDhaOwhxkCpcBuCsuM8hz
 JILppPBe+LrokqoNjwQe+/K1svwWBgElGh+ueCQiLpqsY9pAjPIVEUTcYJ3otoJ+rS4v
 cqrlyrm0GNOWvTEtC3LdtZ9uruCpHj53DoSYaEmvQF7YX/NBdQWIYaxsjpUVlGvB2dty
 YqkZ40/FKq1VKXdmFfvbkxyhsq3lZyboE0AMw0nXmS5q3w5XqOBb4OYJWZ/zrXPr+9lG
 IUwut8aZIXVLraFbVAHgSZvlNBHpqS+1mVooAcshLrf7mwdip5Llsl0vvLuOPH4ov0oH
 sB5w==
X-Gm-Message-State: AOAM533FeJschRZt8zszHrKY7H79dmHs2RI1DjYoHjo0QzcCV+dm9ZRi
 eWehihw0H2qKwcDtfYkauPwGRTTreWFsKBfjZuWIh9qAxPkjKUIoHJpwBdRzVJJaDbJEtJaxkrT
 Lm77f8UZFaAZ0HoYM7bgrbzfoLDD/
X-Received: by 2002:a05:600c:2505:: with SMTP id
 d5mr5484416wma.194.1635148683581; 
 Mon, 25 Oct 2021 00:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcEaxipbcpXSkrk6igJI58QxDtczsadM2Z+/CN6to52SDebzHifcGYGzU2vkui3i9Ud7FGNQ==
X-Received: by 2002:a05:600c:2505:: with SMTP id
 d5mr5484388wma.194.1635148683349; 
 Mon, 25 Oct 2021 00:58:03 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id d1sm15939502wrr.72.2021.10.25.00.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:58:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Neal Gompa <ngompa13@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Add a drm.disable_native_drivers command line option
Date: Mon, 25 Oct 2021 09:57:54 +0200
Message-Id: <20211025075756.3479157-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch-series add a drm.disable_native_drivers option that can be used
to prevent native DRM drivers to be probed. That way, the simpledrm driver
won't be removed which can be useful to troubleshoot DRM drivers problems.

Patch #1 is just a small preparatory patch that moves the logic to remove
the conflicting fbdev frame buffer to a helper function.

Patch #2 adds the new kernel command line option and if set, prevents the
drm_aperture_remove_conflicting_framebuffers() function to succeed.

This is a v2 that addresses the issues pointed out by Thomas and Neal.

Best regards,
Javier

Changes in v2:
- Rename command line parameter to drm.disable_native_drivers.
- Return -EBUSY instead of -EINVAL when the function fails.
- Invert the parameter logic and make it false by default.

Javier Martinez Canillas (2):
  drm/aperture: Move conflicting fbdev frame buffer removal to a helper
  drm/aperture: Prevent conflicting framebuffers removal if option is
    set

 drivers/gpu/drm/drm_aperture.c | 54 ++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 12 deletions(-)

-- 
2.31.1

