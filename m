Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48282B56EE9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 05:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9310E2A2;
	Mon, 15 Sep 2025 03:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aj2rU4oM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA8D10E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 03:41:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b0aaa7ea90fso172940966b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 20:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757907716; x=1758512516; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RBcrzXcJywxMgHMPsR2Yuv2hoXzKHdj6vn06NKKyqo0=;
 b=aj2rU4oMlIdUj4WHXL3bJELhcDTB6LuzD1iZch5cin4JTPfPt5RMzETUpyAwIHOSS1
 Tv/qhJ85nm+oje99VaEMMuHb2KSTZX8C0NOpKy7ZkHRy3GFRRueE6abndyhtNevKFObM
 k5g7JVfFiXtIaLZRrCKPDJGi8TxRoOS7PkQ94m0zt3/anT1rpr9cUXuLXw1mIS/uVDyA
 1LBzy1jDn2yXp+Qz8HcNwEabZ3kR6HQkWyI+oPRdrPLgWvZFMXqATZmutKoUkpqZ/qpC
 VIdg9jpODBfyqmtJVRlWrvRLJxdUkgIEKpHw83LnzIuwz4XUro1CTwEulHhbdth8mVPx
 3rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757907716; x=1758512516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBcrzXcJywxMgHMPsR2Yuv2hoXzKHdj6vn06NKKyqo0=;
 b=WW0+mzfzNMQSuqAzw4/qMSjuvmISy5DeWGhFfGxlb/sgkGvzlQ4KAwsmxJ32P99RrT
 0UzVPd0zq0sh/3DEj822Se24QzlKEHWu3fju/WZJ0JHsG83/U0BbWe3MqbX2FAoz+C9m
 JMhNjyPNeL/yh/VNp8fVaIXzkRciBBKOr9loisX6qKm4uFADjfYtKZ/bFrBJ3cP0i7+r
 s9ITcOqvUtInT3lHwGZoBhps/Tx8agyRhUawT0CNpcJPberehHCnrhJSzqg/g0jrYGp9
 oN2oDn5eR9mpqI89Hyr6BzWA5upDJX80l6WjzmmqwzxQ/Z3L3dxAmX3Q0PtlQo6SGrbr
 eyVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdWcqP1HzwaJfojd5vLRCB6BZYn2vxSZBwt2mZv/iro9NlTfT2zdowtdlOIHmmM036UxduLgBNuqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycjYcTaYfkNQJKrj6uIffdwiaezHn9jRMYHQVt7qBhaIZOabXI
 6m455bUQitM4yDigs9J83Fw632i/uesU0+PpuaO7GWtkns8QI+QwmyRzVoKRFmpB44dOh+SlXiN
 DPxsfAsK8W3m5t9LdlMITCY42UyR3vHc=
X-Gm-Gg: ASbGnct3K8nfWzB5/kq1Sqs1TZnxIQ8BslktPgXNp030z7vHZpgmH3xDRa5RVBGU1Pq
 o0ruFdz/AJaSzGuVE/6zl5mMa3nsirZLyxasrbbwClRb3ETvzWWGMIYBLMLoeTZ38KQ89/tLI+7
 4+E+fp3LNfdNf6KF6q49WmBueBAP9wWgUwZDRWFabg/Fx7w+YvNbgVqOYERtkkfEuOgZCQapXVG
 Wh4snGN1g/mvx6N
X-Google-Smtp-Source: AGHT+IFKMMiQj/EmVbLhBhpf7bD4rE+j6QNew2p++ITSee+6uicU7xqOB08bfh4j/viBhaH8QlYrqM57nANgt8PcVxY=
X-Received: by 2002:a17:906:4ec1:b0:b07:b311:3b90 with SMTP id
 a640c23a62f3a-b07e3fb4087mr586042566b.45.1757907716243; Sun, 14 Sep 2025
 20:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250914031522.33155-1-inki.dae@samsung.com>
In-Reply-To: <20250914031522.33155-1-inki.dae@samsung.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 15 Sep 2025 13:41:44 +1000
X-Gm-Features: Ac12FXz1FF4b7hOxjjzBTbz6jFWwkCq2xvlOvTCad4mE280oDrZv-SH3k4C7vzs
Message-ID: <CAPM=9txNEQXDU6rKHxTVXej7fxgrbbd_X+emHejwA4a7s9aoaw@mail.gmail.com>
Subject: Re: [GIT PULL] drm-misc-next
To: Inki Dae <inki.dae@samsung.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <dev@lankhorst.se>
Cc: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Inki,

I've already gotten the last drm-misc-next pull for 6.18 in my tree,
there are some patches being pulled in that might be for 6.19? or do
we want to get another drm-misc-next pull into 6.18?

Dave.

On Sun, 14 Sept 2025 at 13:15, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Dave and Daniel,
>
>    Add DSIM bridge drvier support for Exynos7870 SoC.
>
> Please kindly let me know if there is any problem.
>
> Thanks,
> Inki Dae
>
> The following changes since commit c08c931060c7e44452e635e115913dd88214848c:
>
>   drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_free() (2025-09-12 19:04:37 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.18
>
> for you to fetch changes up to 17308ab685acba947fb35e52fada2b97f346b8cd:
>
>   drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge (2025-09-14 11:53:09 +0900)
>
> ----------------------------------------------------------------
> New feature
> Add DSIM bridge driver support for Exynos7870
> . Introduces Exynos7870 DSIM IP block support in the samsung-dsim bridge driver.
> Document Exynos7870 DSIM compatible in dt-bindings
> . Adds exynos7870 compatible string and required clocks in device tree schema.
>
> ----------------------------------------------------------------
> Kaustabh Chakraborty (12):
>       drm/bridge: samsung-dsim: support separate LINK and DPHY status registers
>       drm/bridge: samsung-dsim: add SFRCTRL register
>       drm/bridge: samsung-dsim: add flag to control header FIFO wait
>       drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
>       drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
>       drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
>       drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
>       drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
>       drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
>       drm/bridge: samsung-dsim: add ability to define clock names for every variant
>       dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
>       drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge
>
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
>  drivers/gpu/drm/bridge/samsung-dsim.c              | 353 ++++++++++++++++-----
>  include/drm/bridge/samsung-dsim.h                  |  16 +-
>  3 files changed, 308 insertions(+), 88 deletions(-)
