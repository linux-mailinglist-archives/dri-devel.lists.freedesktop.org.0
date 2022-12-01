Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03B63F437
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD7F10E620;
	Thu,  1 Dec 2022 15:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C1910E620;
 Thu,  1 Dec 2022 15:38:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id f18so3302147wrj.5;
 Thu, 01 Dec 2022 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kIaQOgfMcE/GO6nbKr8PgFmDaCwOiD/COdGZXSFPO3M=;
 b=E3geviGqKB2TzYiRvQ/grhwJZrK6KFqLZIp05t0haGJET64z82MLT+1yuZXlRebIv/
 Awss+4bqdFtJ0O6w0GDKVLHe5yhkmhxfAUFYuzq78lhbY9a5/Ox+7rscSqdKFIkii6S7
 GnzTh1/tvJCdzNEVBraZJcaxVZBXaA8J2182usY+yKeigIAgog/id+4u/8KVIxI6+x5K
 +QxP50LSWrpC6r1IJisjte42Ookkx3z8ao7cVYuIoVVL55UdAOIQWC+9JuBR1A0dMMsF
 vswhKpzAdW8bQziBwqkiDeCKpui/siNW98btnRDADIsdb3KNGJQPkfSJI/PKuaTOLS07
 EhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIaQOgfMcE/GO6nbKr8PgFmDaCwOiD/COdGZXSFPO3M=;
 b=c2jdnDo/mhVpvHBHArZDkTfopOes9szeqN5cYX5D7jjoM87Rw6XdwseNXubJKSycD2
 dFVY4l0J2L+DaBBwYjbv9UtuuhsFn3hwVlRnks/4fA+Of8+N2ThUitB0J7Wz2uk5e9QZ
 wEK/dZUgpujgNiAZduXmW63tQK8OJ8ouoYWOA4LHtj3OvJCjeWkZHUjUiU9ZG0hvbORZ
 77iuakjm5wEvMioU5HheHdgzhXtqtz8glxWJKUqzcQ5sZwmY+saxiaJQwSkucGTgFfGe
 DtowdLlOsImgnOZbepb7O0WriYfpTeYrM6+0CN1AkZnry4EUQF9hh0PvK2Tp+Bfc+QJL
 +QmQ==
X-Gm-Message-State: ANoB5pkw9aBv6vdDBJRCSTkaM9cpyqPB5556OeZyhXbr4DIDIBeHo4/r
 YJzk2u9gGVrUCWHUuWX8/tY=
X-Google-Smtp-Source: AA0mqf5ysOVW/Kh9k2qAFFRO9E3GopXIGKrpSXH9FsDqiC/hwM1sNXt1+Gei6ZSSMh8u0cUZy9H63Q==
X-Received: by 2002:a05:6000:1208:b0:236:4838:515d with SMTP id
 e8-20020a056000120800b002364838515dmr40090363wrx.541.1669909127076; 
 Thu, 01 Dec 2022 07:38:47 -0800 (PST)
Received: from wlan-cl-kit-cs-172-17-20-201.scc.kit.edu
 ([2a00:1398:9:fb03:6341:588f:5b6d:9173])
 by smtp.gmail.com with ESMTPSA id
 fn7-20020a05600c688700b003c6b70a4d69sm5523597wmb.42.2022.12.01.07.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 07:38:46 -0800 (PST)
From: Peter Maucher <bellosilicio@gmail.com>
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] amdgpu/drm: Documentation updates
Date: Thu,  1 Dec 2022 16:38:18 +0100
Message-Id: <20221201153820.257570-1-bellosilicio@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Peter Maucher <bellosilicio@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explain difference between gttsize and gartsize
module parameters, and amend related documentation.
Also, amdgpu does support RDNA GPUs.


Peter Maucher (3):
  drm/amdgpu: improve GART and GTT documentation
  drm/amdgpu: add GART and GTT to glossary
  drm/amdgpu: mention RDNA support in docu

 Documentation/gpu/amdgpu/amdgpu-glossary.rst |  6 ++++++
 Documentation/gpu/amdgpu/index.rst           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 11 ++++++-----
 3 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.38.1

