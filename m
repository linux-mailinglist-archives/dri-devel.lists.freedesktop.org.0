Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E4637062
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 03:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175C910E679;
	Thu, 24 Nov 2022 02:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D792A10E679
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 02:25:38 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id p18so259961qkg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 18:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9JRDJG3kkMfcl/gD5TRWtpYPwOoW5DCLW4ntAO7cRrE=;
 b=Szx0/BlKCR0tMcAbbHx2qqQsg+8v3Gi8WdQ7rsnN5ZDwP1MLfYeSqZaOXYy+Mvz9L6
 VYoRMqSw+P+dChRFn6TcMzE52jg4xuDB/TahoWufVQtp1YmQTvxSSUss4ur1VZ9QO9R9
 8WFIarMXo5KmGQ7f73ol+7gVe9d1nN3YIEMp0fu8ZUMpV4+YrzzrEznprWtA9+Gkeqak
 Uw9qswseR1h9MHf8HlaH2Bkf9D0FxUkonaziN1E+l/4uqXoAngBW+UwXywFOlHsGTxy+
 nZ9KWDqJdEF924EhNXHtPOa/QD6z3dRJ2hBIYLLlffHsyyLpYEOvVAoFg2aey3GAQR5u
 H2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9JRDJG3kkMfcl/gD5TRWtpYPwOoW5DCLW4ntAO7cRrE=;
 b=6NR+rbHLlexvUJierNNRSKJwQoREC4qkkrSbndeE5SiMJFZ2HShznmm58WiEzNMIQ9
 nHrK7vufcj3ObMKTFc/MHSTIIpgsj8ANZ+vR05r12CdBlJkmOoCZJ60B3+BW8mzBQ0F3
 XfPQjJMxWogkIlAREZGobrjDXWLGTlXuPZqZBwWXajgRgkKXw8zD7bU3RM6MJ0KPSmR6
 qSdhqi6WhaaS/jlQsmPyKBFoenkgglhtMjIEHww3arNs14PvrE5KgCNHC9116jqewgTH
 z9T7ILESRghxH1ud6QqdqiDpUpJWFDPLTbEN8kGkQ62IndyFsdilY1lcY0xIFKT32pUr
 c3xw==
X-Gm-Message-State: ANoB5pmbp/JL6R7gM8TZmJgEPXhyNl2eA8O9Idla7IN7Ukuwu7lOe+zO
 E97X/lRWtDEuL9D07w2wFnCs4Cu3JqGMYzIjwCg=
X-Google-Smtp-Source: AA0mqf6lOiZ95JJBSFNkRQSwsHQEUARBguX3xVeCCrxNiUA/CZ5lO1Qh7wcmEzCROvoRuO+xEh2yqzH9A/R7C2VuA6U=
X-Received: by 2002:a05:620a:219c:b0:6fa:cbd7:6103 with SMTP id
 g28-20020a05620a219c00b006facbd76103mr19129902qka.235.1669256737795; Wed, 23
 Nov 2022 18:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20221118173325.742647-1-thierry.reding@gmail.com>
In-Reply-To: <20221118173325.742647-1-thierry.reding@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 24 Nov 2022 12:25:26 +1000
Message-ID: <CAPM=9twJj_7BmZznj9NKTFS_Ka+eHDJqhHHLiOAy38x68Xj47Q@mail.gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Changes for v6.2-rc1
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry,

looks like a rebase bug

dim: aad2a7d9d375 ("gpu: host1x: Update host1x_memory_context_alloc()
!IOMMU_API stub"): SHA1 in fixes line not found:
dim:     1508aa73ea38 ("gpu: host1x: Select context device based on
attached IOMMU")
dim: ERROR: issues in commits detected, aborting

Please fix the commit msg and resend.

Dave.

On Sat, 19 Nov 2022 at 03:33, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Hi Dave, Daniel,
>
> The following changes since commit c2418f911a31a266af4fbaca998dc73d3676475a:
>
>   gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-18 09:33:20 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.2-rc1
>
> for you to fetch changes up to 1eb336ed12cda68cb207dbdb6918dc60b151ef6a:
>
>   gpu: host1x: Staticize host1x_syncpt_fence_ops (2022-11-18 09:33:31 +0100)
>
> Thanks,
> Thierry
>
> ----------------------------------------------------------------
> drm/tegra: Changes for v6.2-rc1
>
> This contains a bunch of cleanups across the board as well as support
> for the NVDEC hardware found on the Tegra234 SoC.
>
> ----------------------------------------------------------------
> Dmitry Torokhov (1):
>       drm/tegra: Switch to using devm_fwnode_gpiod_get()
>
> Jani Nikula (1):
>       drm/tegra: Convert to using is_hdmi from display info
>
> Liu Shixin (1):
>       gpu: host1x: Use DEFINE_SHOW_ATTRIBUTE to simplify debugfs code
>
> Mikko Perttunen (6):
>       gpu: host1x: Select context device based on attached IOMMU
>       memory: tegra: Add API for retrieving carveout bounds
>       gpu: host1x: Add stream ID register data for NVDEC on Tegra234
>       drm/tegra: nvdec: Support multiple clocks
>       drm/tegra: Add code for booting RISC-V based engines
>       drm/tegra: Add Tegra234 support to NVDEC driver
>
> Qing Wang (1):
>       drm/tegra: Switch over to vmemdup_user()
>
> Thierry Reding (2):
>       gpu: host1x: Update host1x_memory_context_alloc() !IOMMU_API stub
>       gpu: host1x: Staticize host1x_syncpt_fence_ops
>
> Zhang Zekun (1):
>       drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()
>
> ruanjinjie (1):
>       drm/tegra: Make gather_bo_ops static
>
>  drivers/gpu/drm/tegra/Makefile  |   3 +-
>  drivers/gpu/drm/tegra/dc.c      |   4 +-
>  drivers/gpu/drm/tegra/drm.c     |   1 +
>  drivers/gpu/drm/tegra/hdmi.c    |   9 +--
>  drivers/gpu/drm/tegra/nvdec.c   | 171 ++++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/tegra/output.c  |  10 +--
>  drivers/gpu/drm/tegra/riscv.c   | 106 +++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/riscv.h   |  30 +++++++
>  drivers/gpu/drm/tegra/submit.c  |  13 +--
>  drivers/gpu/drm/tegra/uapi.c    |   2 +-
>  drivers/gpu/host1x/context.c    |   4 +
>  drivers/gpu/host1x/debug.c      |  28 +------
>  drivers/gpu/host1x/dev.c        |  12 +++
>  drivers/gpu/host1x/fence.c      |   2 +-
>  drivers/memory/tegra/mc.c       |  25 ++++++
>  drivers/memory/tegra/tegra234.c |   5 ++
>  include/linux/host1x.h          |   2 +
>  include/soc/tegra/mc.h          |  11 +++
>  18 files changed, 362 insertions(+), 76 deletions(-)
>  create mode 100644 drivers/gpu/drm/tegra/riscv.c
>  create mode 100644 drivers/gpu/drm/tegra/riscv.h
