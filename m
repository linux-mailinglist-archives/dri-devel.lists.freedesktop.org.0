Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC2502F60
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 21:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E2110E2D4;
	Fri, 15 Apr 2022 19:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7DD10E2D1;
 Fri, 15 Apr 2022 19:52:07 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-dacc470e03so8873318fac.5; 
 Fri, 15 Apr 2022 12:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ABdsEHFBVFytMQQqom9Dq43qRmto9saZ7i+2oM3Eku0=;
 b=ZGmZOBcY/dum/HWURvtRCvnWPOUxnrUeSYhZgHFLtNGWIWV6xBsJ+eQCUBAFtqxc+6
 RX2qMrOOXbtgKRof8PuQjOaDgyue+4xnPKsWyqloiY877RDQVTgIXuEDKkaNinoJGYvT
 quuSym8jsN84P1pm4Gtdj72/yzvL4YY0RRPohYT1kX5y63sr6/zGuk9BTmtIl97awcNE
 OtZQ64T+7/WL6zY9yKrOB5O7Hkc2WWUgnBBkps9pFBQ+J6Um+79KcjCBV/SEKHa6ZRBB
 IqqktfpNCN4lD3lgbXDCHgVhA6bkUwtjRC68YIdN5hpNkvFZ6+o8BGbqOkBKJn2M5fGo
 Wdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ABdsEHFBVFytMQQqom9Dq43qRmto9saZ7i+2oM3Eku0=;
 b=WuP3eWIyWjXsUHerwUGNx+keZOUVWTQDgSVfGdOEfSKGPlLhzr+Quk8AA64I2Gfl+E
 OPFAkDmVPv/Tt4tETz0/MCtVb3iPJ0y9Ej7xeo9DhwAt9n8iPnxXmrknK8F9JP0wvRB8
 TCgRx8Jgp3IIUgfpXpMQxtgfXICXGUVnfyGeCqQFVA0VHQCTYXaoIwY8+1koC8Ua2vQq
 CQO47vaQndFhKYBx8kkFamcGthfd0G3K5+d1qaAP+i57bP8YkjY0Z2GQowjapHLRx8BL
 ge950GdDiNzfDyx/7Q7dByJhiQYu30lfH4mtSpy4zuJH/ou+jH7ZNNDuL5e5VUJSFq0j
 pEYg==
X-Gm-Message-State: AOAM5327E3JlwbfByEwNGC6Ood8wHK0Qz/lxaRQLQxvRCBQwsDcdR/kQ
 9aTyHErjikxWnVgHTL/Qrzg=
X-Google-Smtp-Source: ABdhPJx3nwNYb48HFRzO6VjBy6Z8M7a9mKfeurhvlRtcYBZf5WQPQGnHCmScGHPj/L9SUh4ng5I0Rg==
X-Received: by 2002:a05:6870:4708:b0:e2:c9d6:2be7 with SMTP id
 b8-20020a056870470800b000e2c9d62be7mr1997842oaq.195.1650052327143; 
 Fri, 15 Apr 2022 12:52:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b:dcc3:45ee:2581:b4cb])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a4a2854000000b00329d3f076aasm1436532oof.24.2022.04.15.12.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 12:52:06 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrealmeid@riseup.net
Subject: [PATCH 0/2] Update AMDGPU glossary and MAINTAINERS
Date: Fri, 15 Apr 2022 16:50:25 -0300
Message-Id: <20220415195027.305019-1-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was handling the request from [0] and then I noticed that some AMD
developers were missing from get_maintainers output due to the lack of a
reference to their documentation in the MAINTAINERS file.

[0] https://gitlab.freedesktop.org/drm/amd/-/issues/1939#note_1309737

Tales Lelo da Aparecida (2):
  Documentation/gpu: Add entries to amdgpu glossary
  MAINTAINERS: add docs entry to AMDGPU

 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 13 +++++++++++++
 MAINTAINERS                                  |  1 +
 2 files changed, 14 insertions(+)

-- 
2.35.1

