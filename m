Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC346160B81
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 08:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B703D6E4F3;
	Mon, 17 Feb 2020 07:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64B6E4F3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 07:21:46 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id j11so8241514ybt.8
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 23:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PN6lUnMIkr1p8ocBOhKxr7+NJz0B5Wsnufma/WeP3as=;
 b=NIDCIS+zpiyzP4MNEpTR6/kf7GXFonVvbd96Hk3UgYtOef4/j1pWIxjsbTvYiSR0WX
 tRX1I+IiZolTKDQT1zRFub7/Vi8lh+srvy30mDjIP2T8ofLfNEsUosa1L7Q6HhkMDLOo
 wyJRYD85pNUhV5Agf8Z9yYzXqZ9jTyzsLBn5VFO3m6ubCAbRTd+ZH8U/inPWqsTHAukA
 75XCnrlw0G3bDmaAB4t69AVEUy62yq+FQpIx91VFuJFistvBAB8840c16MzfLR0r+xoN
 GUZtuvYfl38idifNY1S6iWgR0r/hqvS9ZWHSdT7PwWOUWby+uUYnacvM37+3PDLuD05c
 Qd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PN6lUnMIkr1p8ocBOhKxr7+NJz0B5Wsnufma/WeP3as=;
 b=fyPYE2hFZYrQuB2JYGezNvjs8tqswYjkPKGKau7NkPbe+IfY0S0k8vs5Hb6zBMhHDu
 vTUVKfmdojhKtDTrNXGfgBMuza7pmmz+MtvZuQE6lsD7assHgJ5OEWYrbm7M6fvqRUeF
 UD+fdqeRtaFNmK1A8U0bSWcOxmkf6J9J8PX3t5jnrxenhWKXs8BvjHky8vPMtjEO1wqj
 njR+bM2LdeD8Z6QQ05V/P7b9ao0CKIxaT3Hn3KD2jBkdv7gi7B1T2SkFiEDasuaoBzoy
 S8rQsj77yhhLuvUxx5DczvcP8ZW/+Rqcki9jKotRry71hnLrgkYB96Ab7YzaqIhGWkY5
 dF1A==
X-Gm-Message-State: APjAAAX1zWv0I7+xggKKOhtvpjsQGDsXkT0nQhC5SEFxZbD0tgnifb6z
 bylpRwBUesMjYvZ7VNNkSazEGXWPYyYM65qrRx2V+FqYURc=
X-Google-Smtp-Source: APXvYqys9zebh0EHSN1AiD/Y0sByWYx/KZvsZ4YZYYPn+6BePRausT9sS+yDFhQEsegppPJxf/Qrt23ljm8XSFyUUng=
X-Received: by 2002:a25:7395:: with SMTP id
 o143mr12448740ybc.435.1581924105824; 
 Sun, 16 Feb 2020 23:21:45 -0800 (PST)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 17 Feb 2020 17:21:35 +1000
Message-ID: <CACAvsv64yBq4KHJ8D-5HQ5eeotApJSMiD+V2ut4f3BonUggf0Q@mail.gmail.com>
Subject: nouveau-fixes 5.6
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Nothing major here, another TU1xx modesetting fix, and hooking up
ACR/GR support on TU11x now that NVIDIA have made the firmware
available.

Thanks,
Ben.

The following changes since commit 137c4ba7163ad9d5696b9fde78b1c0898a9c115b:

  drm/nouveau/kms/gv100-: avoid sending a core update until the first
modeset (2020-02-03 21:36:54 +1000)

are available in the Git repository at:

  git://github.com/skeggsb/linux linux-5.6

for you to fetch changes up to f287d3d19769b1d22cba4e51fa0487f2697713c9:

  drm/nouveau/kms/gv100-: Re-set LUT after clearing for modesets
(2020-02-17 17:19:00 +1000)

----------------------------------------------------------------
Ben Skeggs (2):
      drm/nouveau/acr/tu11x: initial support
      drm/nouveau/gr/tu11x: initial support

Lyude Paul (1):
      drm/nouveau/kms/gv100-: Re-set LUT after clearing for modesets

 drivers/gpu/drm/nouveau/dispnv50/wndw.c           |  2 ++
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c    | 26 +++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c   | 14 ++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c    |  2 ++
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
