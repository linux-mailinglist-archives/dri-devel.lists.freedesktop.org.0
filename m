Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AE642C96
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 17:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDAD010E0B5;
	Mon,  5 Dec 2022 16:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2B810E0B5;
 Mon,  5 Dec 2022 16:10:21 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id d14so5278571ilq.11;
 Mon, 05 Dec 2022 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DbmxPiWbeCY24/0fxJySXsMJKh2ule5cB9SoQHkfWSI=;
 b=oY7/tOVLT7ZaLoT67yYMq/eFqiehA24XdsIwGpNNYf+B8gCqmI8rWNcYImF64zepQg
 EgP+CUYLXZwEwIaKz874gILPZKH7AvEEzblLoo3wQR0cZKrgEzTZOAtxTO5LkySkZMCY
 /LceIecIJ3BFUCfsRoLyp7J7dBxHj5l4+2yLX84O7D3aOEsLRXjU+l8/pnzXRvkYGUbH
 kROvjQd9BxaztDCnKiZQS+ZZPR9GnR7IC1FLaRzxPePdVcnGaJ8xWqwcFRXvZI4GgvE0
 1ehmr9j2fcfQ9fOI/WL5nhYUdAQyNyp8mtdB1mSgV+3P3wyn5XBrp/CiaI0G+feng159
 rWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DbmxPiWbeCY24/0fxJySXsMJKh2ule5cB9SoQHkfWSI=;
 b=QGn4K426SMqROAQCuzOpb2fko6/CJ2t4bpFSsLdLUut0mGa/oHOaPIBgpiHP0qqH3g
 urAHUTBrkWA0BZQqi0FRR7aTW/+9W3G1R13H6rLALJIo2+MyCWP7IuzUij+J6AIobYHy
 4XCnAF1BuHu9r+yatR3Y+9FJFoyNK9+MJU6qv8AaiY0aZmT3Q54867CU5Qv8GLxqQgQ4
 3INTDaesW3RwYMKIW4sp2B262MiliAn9ettfmfsFgUw2rqIkyMyF9uH/qhnvdiy8jkLo
 IyZE4hTbkWbV2+ksfr29EoExWC64H2FxFt9mYbbuBD3BZDSQuq/8FlbqPmb4jFSsvt4r
 bplg==
X-Gm-Message-State: ANoB5pkQZa6svI8vAmbwVY5JFSiPJDxlAzzEnazQAsRtKSUvlLQi3bBS
 hS0q7dyEPtnEK4td6zY2Odo=
X-Google-Smtp-Source: AA0mqf4EKMXBFjNrHPrB0JsxhSsyuLXuw60uEbtHeYkPjibNFJuD7jtEaYQc3AG9lCKffBLKz9xALw==
X-Received: by 2002:a92:c6d2:0:b0:303:40e4:5f7 with SMTP id
 v18-20020a92c6d2000000b0030340e405f7mr6079770ilm.185.1670256620713; 
 Mon, 05 Dec 2022 08:10:20 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 g19-20020a05660226d300b006bcd45fe42bsm6017753ioo.29.2022.12.05.08.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:10:20 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] DRM - avoid regression in -rc, fix comment
Date: Mon,  5 Dec 2022 09:10:03 -0700
Message-Id: <20221205161005.222274-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi DRM-folks,

DRM_USE_DYNAMIC_DEBUG has regression, mark as BROKEN for now.
Also correct a comment.

Jim Cromie (2):
  drm: mark CONFIG_DRM_USE_DYNAMIC_DEBUG as BROKEN for now
  drm_print: fix stale macro-name in comment

 drivers/gpu/drm/Kconfig | 3 ++-
 include/drm/drm_print.h | 5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.38.1

