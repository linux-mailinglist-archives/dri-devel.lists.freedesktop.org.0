Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B693DFC43
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 09:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191106EA01;
	Wed,  4 Aug 2021 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2E06EA01;
 Wed,  4 Aug 2021 07:43:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MOiPx-1mVlNs0l2d-00QBvh; Wed, 04 Aug 2021 09:43:47 +0200
Received: by mail-wr1-f43.google.com with SMTP id z4so1112391wrv.11;
 Wed, 04 Aug 2021 00:43:46 -0700 (PDT)
X-Gm-Message-State: AOAM533S3R8FnLUMj1DBsn02BA1ugaJCz233CdVOdBzUIBb5wAZ4OOvf
 51hHMqu0/gZLaTpGLiSItfCPrpkJrRFXCwoB8AA=
X-Google-Smtp-Source: ABdhPJyunqosCIflc5vvvynoT6hdGMCnplHeTZXsuPA8UnSjopVy4WA6W8LG+8a5SLNVnF2AQBvVhxHXr2nSTm0xejk=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr28680284wrr.105.1628063026717; 
 Wed, 04 Aug 2021 00:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210802145321.1153989-1-arnd@kernel.org>
In-Reply-To: <20210802145321.1153989-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 09:43:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2R4EVY9=K3UB2+z7mssNCrSf3BrGW95BwR+qw1SLOm-w@mail.gmail.com>
Message-ID: <CAK8P3a2R4EVY9=K3UB2+z7mssNCrSf3BrGW95BwR+qw1SLOm-w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: fix link failure with QCOM_SCM=m
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tanmay Shah <tanmay@codeaurora.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Georgi Djakov <georgi.djakov@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 Kees Cook <keescook@chromium.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2gAIDcwHxKJCHqQbicUaE9jlSMBJskWblQ66qCz4RbKBtQ8cT+m
 VzXAPUpmoPwkdyBLbOsUmbjcKMIIcD3r4hU4xG6dLfh2sckG8Z++8z4EVv/M2ak2dhrGB1L
 qFPKTCBB04skKQ3VANvIHzgem/G3EpH8LIq3d6YWKhwW4S80ckblajtd3n07UOXjOMD2pMh
 Y8iMmNk7Q30s+seH+YY3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sXwzPqShJxg=:1kDsExZtfCTyfH0vpiNiNZ
 oGgnFmdj4i9tC13o8sssRZXCYk9Vvu0yTzbRGBRlqpfyZjomeLleMS0gVXBJaz4htFiMrAqpy
 tjicef7Ek0wEqUZ0tgFKnJwrUqNwU69aZrCywtyYIEzlnKk7CqpnnqBMR1d6u8nglNWJDyQ1t
 PSq+R8Y/B7daupCQBSk7YCiBDl/sqgOnXIfaf517476idkf5Fr34qK0D8iNzaNxJ8ODxhMQ9z
 Agam90xwmVriBgj88Dwn2FueRpZyiYJHurNU3fjVJDq6sIHJ8TjGoPQCgI1cdEsAzvpnG9bkU
 JVnJ8+ghrdYS56SIa6qou/Za/05DwwHKSp6dY12XKM5RWDquKiBhWCwT6/T+zoHUaV5/qwZuq
 Q/hH3zjsXYQXgVzJUIGR0FvoTqkMb8qGSjuQoFaiKsSqDbQ1A/vmfEv9+WDNLlGCvmKoaEjxu
 fNK4Q+MhNRLzmIiQaOxMiwrLVY7Acz9plpGiN/FjzzINXWT+18EIXDzZSL/vDPNL27+ABepqW
 XMDnfgpEvBh+bNOrKRk4qYgbuKU4VbuOJ+lAq9dDTWQmizosKVmtLkcxV9ltGNYbqBccvMoBu
 /YJXgDEfJ3oTdEOfzTbMy5DjZ9nSCPRbpStsOIg9SoZkOfZg8d6EsXF3baUY9OPajIdnnqd11
 6AXmaPr96VD1RIP95UyKIngdXTQHFWXQRBBdtecWMWbQbS4QUe+ggP6kFrtSvIELUcalgEeJ8
 ocjQ8lQtsOqTW8Z61hFSLfsaCDuehrfDIJWTC+JCNejDsKy4m0nS6f70CuqouzacukDVVKRvk
 Cyx5HWVfUlKDmYgs5cb29LjNSK22O6hHVndhFtwKUoUKnlE/vVPmtv3pIHo2pl5b5vwFGeG
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

On Mon, Aug 2, 2021 at 4:53 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Another missed dependency when SCM is a loadable module
> and adreno is built-in:
>
> drivers/gpu/drm/msm/adreno/adreno_gpu.o: In function `adreno_zap_shader_load':
> adreno_gpu.c:(.text+0x1e8): undefined reference to `qcom_scm_is_available'
> drivers/gpu/drm/msm/adreno/a5xx_gpu.o: In function `a5xx_hw_init':
> a5xx_gpu.c:(.text+0x28a6): undefined reference to `qcom_scm_set_remote_state'
>
> Change it so the dependency on QCOM_SCM and QCOM_MDT_LOADER can be
> ignored if we are not building for ARCH_QCOM, but prevent the
> link error during compile testing when SCM is a loadable module
> and ARCH_QCOM is disabled.
>
> Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
> Fixes: 5ea4dba68305 ("drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh, this is still wrong, for two reasons:

> ---
>  drivers/gpu/drm/msm/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 52536e7adb95..69fbfe4568b2 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -9,14 +9,14 @@ config DRM_MSM
>         depends on QCOM_OCMEM || QCOM_OCMEM=n
>         depends on QCOM_LLCC || QCOM_LLCC=n
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
> +       depends on QCOM_SCM || (QCOM_SCM=n && ARCH_QCOM=n)
> +       depends on QCOM_MDT_LOADER || ARCH_QCOM=n

* Only QCOM_SCM has become user-selectable, but QCOM_MDT_LOADER
   is still meant to only be selected by its users, so we cannot depend on it
   here

* There are two other drivers that have the broken 'select QCOM_SCM if
   ARCH_QCOM', we have to fix them all at once.

         Arnd
