Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9A1D5ED6
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 07:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F140C6E105;
	Sat, 16 May 2020 05:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237336E105
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 05:05:18 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u15so4408308ljd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 22:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=m1ntg/WdcMv3hynbF2RbuDdE5Y3GzsNBRBim4e23ILY=;
 b=qBQg5VJfrhfYNnJ9EmFh4nXk0HCkhn5lo1uWdMBMu44YzvGlNTKPGIxi76XTXrE8i0
 k2dzrm5zkwnSw1To1Ol0Jyo7F3cXkTQrwOhKQcBM9nK5pV9kVxWiblk46d2FqbhVFSA/
 869Tv5iIH5rZvb1yrs82FZ/8DaDL+jKBQ04FyCIXEFvbqRMVQH7xZzms/7Rdo1prBw7Q
 ZpK3XgueOHdA9LdMXnlA90ghZjFAhBjiT8Z31GQHxFanyv0dGiDwU9xc2T8uZRAywmG9
 yQyzbaGBZ039TjQkd+5vrKNKUdNsyo69EaoQ+jHrRtz6lkYS9m91jO7U/faSWjgpxStN
 YVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=m1ntg/WdcMv3hynbF2RbuDdE5Y3GzsNBRBim4e23ILY=;
 b=FCZxMOTgd+TXD8K8JJSaTzXCtkLu+o3NQcikkKns91NjCGvwsYmVEgMVB07j/JqDCj
 Og1FTwPlUSst88ErGnVyoq5fGYn43lgUNwZ6JZFEOE+K01pniy1U/qJU4uPzQZMSjlPw
 ejMExoulLUNJzSJCsBfEZhX/J5gdIkMk1hwNIKh6itKhM9IrCAbcXurjv4UbRozpgI0m
 T+njob8Df8dU2iykQmztDa9UWciX+TOYHLk+KZUnqSMBfzFlFkFd5zp9C5G9Pi7hup44
 WGZuZh9VDv7KqEH40sAlnYeuI+EJhSNrbZEClcfllsAT07OQdLkjwFj0hBR9fsGc1NlF
 oQFA==
X-Gm-Message-State: AOAM532UAPPV2BESJPPzESPYKuHLkAV0NqRJFtdntgP8MmyFYGSjyyPJ
 +tgNg6l+VhT1NwcKDfyXBqNXDCNo
X-Google-Smtp-Source: ABdhPJwLk88zwZq/x8+Vm2/Koc8Sh5V4/ofI0loERbSnbwo+ob9+cq0mWIFxNEP7NTNH8tuXHr/YwA==
X-Received: by 2002:a2e:9099:: with SMTP id l25mr227192ljg.82.1589605516168;
 Fri, 15 May 2020 22:05:16 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id j29sm2816737lfp.90.2020.05.15.22.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 22:05:15 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [git pull] vmwgfx-fixes-5.7
Date: Sat, 16 May 2020 07:04:33 +0200
Message-Id: <20200516050433.7298-1-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-graphics-maintainer@vmware.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Daniel

Some minor fixes and a maintainer change.

The following changes since commit 24085f70a6e1b0cb647ec92623284641d8270637:

  Merge tag 'trace-v5.7-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (2020-05-12 11:06:26 -0700)

are available in the Git repository at:

  git+ssh://sroland@people.freedesktop.org/~sroland/linux vmwgfx-fixes-5.7

for you to fetch changes up to 80542002ccd41f3703a9ae9e8e95cfbaad370db6:

  drm/vmwgfx: Return true in function vmw_fence_obj_signaled() (2020-05-16 06:50:37 +0200)

----------------------------------------------------------------
Colin Ian King (1):
      drm/vmwgfx: remove redundant assignment to variable ret

Guixiong Wei (1):
      drm/vmwgfx: Fix parameter name in vmw_bo_init

Jason Yan (1):
      drm/vmwgfx: Return true in function vmw_fence_obj_signaled()

Roland Scheidegger (1):
      drm/vmwgfx: update MAINTAINERS entry

 MAINTAINERS                             | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
