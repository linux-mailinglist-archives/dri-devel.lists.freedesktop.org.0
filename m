Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525E690201
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB8210E935;
	Thu,  9 Feb 2023 08:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083F710E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 08:18:43 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bk16so902535wrb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 00:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SHKiMEbnAoLmeMyHtalMMTTzfbviCFtTBVAiEP9tem0=;
 b=XzfWkcvh0g9iM7FK+mOue2L1LIokhmyNsr28T/IhqoTadSCuitj+3REiWHZht5mFnr
 RA5TPUWHowJUTc2oV8iX6LYLwQhxeOHx+9dIXvZ3kHAAFY5cauCoQAxNDIXVyW2aWKs8
 Do6OYNHJ6HALxdUgAM2tO7RZzMM3XRujJLKgfQHndqHjJgCL9ck2OW0hkBiPKG23bxrX
 5GQZjRPc4Bw/yENdEL7o2HsaC1u7i+zu+TgDXNgc4kFW8K+2JZmguBds+lfahqppD2rW
 9s0wft8A8UW2YDZgL7Nh14qiGZFHj0x3O5DZqTjz12Ux9te3+qtQ4vmg7HVvKhf8QHpj
 wMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SHKiMEbnAoLmeMyHtalMMTTzfbviCFtTBVAiEP9tem0=;
 b=wzz+hwXSAPNIZH+1RSPvAqy8GJIluO1dodVDpxfx7OqVnCRY1ykWhAfinyXEhce5sv
 im1vNXC6eAoJJ2HncGUIyv7rPu2W0oTcfJewe0hKKj4XftR9nxmran/h+fw2k682LAdf
 GCoJZOTdC5WMrMBxQdlkWSXL542H/rJp00dwTYTgCDB4TsA3rYNMi3ocDoeFJnS1pov4
 BZEEEmAjDbDSCYIhi0Apx9YAiXr9xofkK+bh2+dTKgl+88Vs90d7qH09QXZWZ4SFmmeN
 ZqJ4VHNBSb/4mKv4f/X+8zyfRzLCaO5ZlO6ChmuVLtnUYAT6REXvwmgLWzJ5d/a1I76n
 zAGg==
X-Gm-Message-State: AO0yUKWJvs4g0sqc0RtPAJx4LpPrGfqzotkN2WGXmkx1GnlslMKyzHSy
 j1zznwutRJOILlHLg1VIsiQ=
X-Google-Smtp-Source: AK7set8ysk6EyVHbMJdatHwgW3Pn/J80ByGnMo6nZJ23j1gH5fv2QHwC684JuD0hfyqIhdCeiGOhuQ==
X-Received: by 2002:adf:f350:0:b0:2c3:da3f:1def with SMTP id
 e16-20020adff350000000b002c3da3f1defmr11308137wrp.7.1675930721541; 
 Thu, 09 Feb 2023 00:18:41 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 n10-20020adffe0a000000b002c3ec35f360sm602056wrr.56.2023.02.09.00.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:18:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, wambui.karugax@gmail.com, mcanal@igalia.com,
 maxime@cerno.tech, mwen@igalia.com, mairacanal@riseup.net
Subject: Try to address the drm_debugfs issues
Date: Thu,  9 Feb 2023 09:18:35 +0100
Message-Id: <20230209081838.45273-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello everyone,

the drm_debugfs has a couple of well known design problems.

Especially it wasn't possible to add files between initializing and registering
of DRM devices since the underlying debugfs directory wasn't created yet.

The resulting necessity of the driver->debugfs_init() callback function is a
mid-layering which is really frowned on since it creates a horrible
driver->DRM->driver design layering.

The recent patch "drm/debugfs: create device-centered debugfs functions" tried
to address those problem, but doesn't seem to work correctly. This looks like
a misunderstanding of the call flow around drm_debugfs_init(), which is called
multiple times, once for the primary and once for the render node.

So what happens now is the following:

1. drm_dev_init() initially allocates the drm_minor objects.
2. ... back to the driver ...
3. drm_dev_register() is called.

4. drm_debugfs_init() is called for the primary node.
5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
   drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
   for the primary node.
6. The driver->debugfs_init() callback is called to add debugfs files for the
   primary node.
7. The added files are consumed and added to the primary node debugfs directory.

8. drm_debugfs_init() is called for the render node.
9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
   drm_atomic_debugfs_init() call drm_debugfs_add_file(s)() to add the files
   again for the render node.
10. The driver->debugfs_init() callback is called to add debugfs files for the
    render node.
11. The added files are consumed and added to the render node debugfs directory.

12. Some more files are added through drm_debugfs_add_file().
13. drm_debugfs_late_register() add the files once more to the primary node
    debugfs directory.
14. From this point on files added through drm_debugfs_add_file() are simply ignored.
15. ... back to the driver ...

Because of this the dev->debugfs_mutex lock is also completely pointless since
any concurrent use of the interface would just randomly either add the files to
the primary or render node or just not at all.

Even worse is that this implementation nails the coffin for removing the
driver->debugfs_init() mid-layering because otherwise drivers can't control
where their debugfs (primary/render node) are actually added.

This patch set here now tries to clean this up a bit, but most likely isn't
fully complete either since I didn't audit every driver/call path.

Please comment/discuss.

Cheers,
Christian.


