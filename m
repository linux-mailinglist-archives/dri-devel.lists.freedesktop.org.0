Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657FF196644
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 14:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B82D6EADE;
	Sat, 28 Mar 2020 13:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720A76EADE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 13:20:36 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id p10so12823798ljn.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 06:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yEGyfGXPBbp/Y85dX/Q/uSCvEQvOVT0E5UGhARneKoI=;
 b=euqrR+FLr+kzrPKNJc5Cv6z/fvrwPDYkLyctEoyyCwLLBvULCY7taRRAYre7XhFpfc
 pQRkMhwWhn8lxXjhhfP6JFJv9VUpi9Q2SEdxIN+uszwlYJmGxAf6XEEhpQcHV8wn8n4J
 Lk+UVymqCvu9RobKUSKcZoY+T11TRYYr/jenvN4Rr5yRRgoDkyJHtWN2Lx6NQgL1IOUa
 NC0s0zZgZ36jcTSmJaqSEofnKeLc2e4QEl32wYfMzxQh1okZYZWkJsg89PwrNmDtfC5N
 QVyLkHhKyCDvObjT3KJcYCLA5c/78wxmHgkiYaq73ycRfnHJApWTEq/Oj+nDWUhPi11B
 ni5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yEGyfGXPBbp/Y85dX/Q/uSCvEQvOVT0E5UGhARneKoI=;
 b=s4/CkaN5t/qP16FGntZZ55neVr2O09zGbpztkK5SJtGpF3YwN+esCIMaR3TCybVpi7
 mO/KYFNfeNRJtV4wyZMtrt0kdHYmJzhbcqWS5xhgWjytt6Sh7U6xzUrJf+yZEPNqeYO0
 NHqdU7t+vz3+IGInnkbez6Js+6LcNrcG6cX6vlpgyzK6BtRg4CJxq14O7jX42Tzm5Z0m
 u7OrCOdSOhohdNuUl+GOjc7U9of2pKmgiBZdJhst2/mRsyMilhFgIHqjN8hT9vNVxnAn
 oaI9XJ4qDTqpZLXrX8l1CEM4i0y/u/GkgEaYVoq5JaIX40ByNrqTSX/kesztUfmfGas9
 QoDg==
X-Gm-Message-State: AGi0PuYkwJpEH6i+4Yo01fPXWpKe1P/ErSAbKpLRc0T8UDtqACKNkhUB
 0I2f+rP9LIEdwTW516HOzRthI4vDjy8=
X-Google-Smtp-Source: APiQypKR/TcElDEP50AfYWufmzoGsPUL/AlETSAddnRghgwLpnwchKER+ggRIkgrkLilYWEfwj67VQ==
X-Received: by 2002:a2e:814f:: with SMTP id t15mr2220360ljg.96.1585401634397; 
 Sat, 28 Mar 2020 06:20:34 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 j19sm4542916lfg.49.2020.03.28.06.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 06:20:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v1 0/6] drm: kernel-doc stuff
Date: Sat, 28 Mar 2020 14:20:19 +0100
Message-Id: <20200328132025.19910-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lyude Paul wrote a nice intro to vblank in the following mail:
https://lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27

Reading this I managed to spot a glimmer of hope that I one
day would understand some of the fuzz around vblank.
To let others benefit from the description I went ahead
and added the description to drm_vblank.c.

Lyude - I added a "Co-developed-by: ..."
Can I get your s-o-b on the patch, to document that
you are OK with this to go in.

When checking the output with "make htmldocs" I noticed
several drm related warnings.
I went ahead a fixed most of them resulting in a few extre patches.

There are some warnings in amdgpu land - I have left
them for the AMD people to figure out:
    amdgpu_vm.c:92: warning: Function parameter or member 'vm' not described in 'amdgpu_vm_eviction_lock'
    amdgpu_xgmi.c:1: warning: no structured comments found
    amdgpu_ras.c:1: warning: no structured comments found
    amdgpu_dm.h:305: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'

	Sam


Sam Ravnborg (6):
      drm/vblank: Add intro to documentation
      drm/fb: fix kernel-doc in drm_framebuffer.h
      drm/sched: fix kernel-doc in gpu_scheduler.h
      drm: writeback: document callbacks
      drm/dp_mst: add kernel-doc for drm_dp_mst_port.fec_capable
      drm/bridge: fix kernel-doc warning in panel.c

 drivers/gpu/drm/bridge/panel.c           |  1 +
 drivers/gpu/drm/drm_vblank.c             | 15 +++++++++++++++
 include/drm/drm_dp_mst_helper.h          |  4 ++++
 include/drm/drm_framebuffer.h            |  4 ++--
 include/drm/drm_modeset_helper_vtables.h | 31 +++++++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h              |  1 +
 6 files changed, 54 insertions(+), 2 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
