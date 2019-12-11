Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33CD11BF00
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 22:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57F36EBDE;
	Wed, 11 Dec 2019 21:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249CB6EBED
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 21:21:09 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id b145so1149030yba.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=zkJseZ127djdD2ipg54eZF16OUkDS7sXQRI3tcKMT7Q=;
 b=YVifUQQRJkLFcO+9zIGtLBR92KTfEqR6SSyuHzi8qxnsBupzZdIEVE1e7eUawxGik/
 NqiyNRWtj5/m9KVkZbvAnpblvpuBkhxdSnbgDt1LWsGY8W27Qq2APT3aza04ksJR05Ir
 8HkzBeM207RVY3bysKQ/nv+u7xG8Yj+AyOMlkRo1lxk0snUgvC6dcXQBEhg45QXmQqoX
 8ZZScaqQFMs53/zU3jPyUHofOzN3p9/45FRGRiWMCmjcT8gDfADK2CB25tHIf4ymjY+d
 Obnklj5nw3OHg3cN7IHejQoR3ht3ddWnO8BbpKJBk6hF5CHaZjNzekukTNBYFm5Ame8D
 4NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=zkJseZ127djdD2ipg54eZF16OUkDS7sXQRI3tcKMT7Q=;
 b=S6v532ZB5VIrsr8tN0co/YGqvzY4AcnnWh52AFXeUPRwb7lRsH2H08r3kqXqB9mcDt
 tDsn42wVXkCCo2RnzNnFBCT2L/pSGuyiPCAhs2i90LhG1NjoXsiUAuySSKGcAQmsp0Et
 z1kNuhWFcKaN1qfzQf6DWOJDDcNYc2g7CEAAV3fRi8CUPoPnqLwolsgGCewtINsDBQvJ
 eREfhc5vK+OrgeydZlUubLF65n+Bc8zlgTgOmd3JXOiapAImb9bFEvGMwSZ5anNszB96
 r/di9JAal0YF9AZqJgGcevK8UguZZmLq/9FGzIXNwfdL0zQ6Qpjrp63VE3awrXVh+/SF
 IIow==
X-Gm-Message-State: APjAAAWMPwUF2Ov5o+Btg1uyB68ldxyEuKvu8n5bnHQMwhfrVOYXU4kw
 Q6dCXRaE9lwBWl6FA2j4YMQuaw==
X-Google-Smtp-Source: APXvYqykAkQee2DPqnggB3EW8sblYuE1DY3dbgN9gqvOWuv7keW3cqF9aM6XVfTLNaYKMMT0dxnNOg==
X-Received: by 2002:a25:5008:: with SMTP id e8mr1632641ybb.277.1576099268210; 
 Wed, 11 Dec 2019 13:21:08 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i127sm1491956ywe.65.2019.12.11.13.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 13:21:07 -0800 (PST)
Date: Wed, 11 Dec 2019 16:21:07 -0500
From: Sean Paul <sean@poorly.run>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20191211212107.GA257983@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave and Daniel,
A couple patches from -misc-fixes.


drm-misc-fixes-2019-12-11:
- Expand dma-buf MAINTAINER scope
- Fix mode matching for drivers not using picture_aspect_ratio

Cheers, Sean


The following changes since commit 6645d42d79d33e8a9fe262660a75d5f4556bbea9:

  dma-buf: Fix memory leak in sync_file_merge() (2019-11-25 10:21:33 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2019-12-11

for you to fetch changes up to 78baee8d3b976a6a6a2c208e3a36d3f1e6297e6c:

  MAINTAINERS: Match on dma_buf|fence|resv anywhere (2019-12-10 11:26:19 +0100)

----------------------------------------------------------------
- Expand dma-buf MAINTAINER scope
- Fix mode matching for drivers not using picture_aspect_ratio

----------------------------------------------------------------
Daniel Vetter (1):
      MAINTAINERS: Match on dma_buf|fence|resv anywhere

Martin Blumenstingl (1):
      drm: meson: venc: cvbs: fix CVBS mode matching

 MAINTAINERS                             |  1 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c | 48 ++++++++++++++++++---------------
 2 files changed, 28 insertions(+), 21 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
