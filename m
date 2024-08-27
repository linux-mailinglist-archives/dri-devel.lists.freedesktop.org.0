Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B39619DA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 00:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA4A10E104;
	Tue, 27 Aug 2024 22:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NWaQMEFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3010A10E0F1;
 Tue, 27 Aug 2024 22:04:56 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3717ff2358eso3291602f8f.1; 
 Tue, 27 Aug 2024 15:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724796294; x=1725401094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZgyQZttbFN6Mpv5C6Zqi3PHF1KkrD2jrO7egIws/+I=;
 b=NWaQMEFtrDynFHJlObHiz9JRKlK1O0/cPLyMvfsoMYuIuknabGefLbhuM+fa5908De
 5jT5SbRUWK/uG1fzOEEYS6T5Bo4IYRrZ3cv7nmoycYVAVq/2kYBPkGibIuhgEXwMZhG5
 1zG9G0T8CALYyRs6QbKdvuYhsZef5pLIWvL0/vKNKODGnrwE21EBd0UbN4H9FAxnS7uI
 4bE+Er8qr3ua6bsFxkyzPNSDpXYyUktXFDfLj91s7xXLDzOtaIuJlr8k5dcimU3HNW/X
 XWTIAUl4gJaRKvGh4+/+M8Gw1DoC1Np04Qe3i0+0D0z2YCDJesffHWBRN+s+z+nWPPpi
 rIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724796294; x=1725401094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZgyQZttbFN6Mpv5C6Zqi3PHF1KkrD2jrO7egIws/+I=;
 b=X7T5DlKIhK3k++KdAt40W0wyBVe6gkdbad8LCB5iIlMqiQ7uXQtGRoDPV4AoLF6f0n
 1NpLPytv/KFxhcWSXCKM/lcUZlTdT/tPx7QIOXcAYuFx/LjIfcR5XOds4T7EDlkJ7kQc
 ZDJ2YHME2dpZFT5+0getbsW0ZhLuwGr3dkH8elW3G7a1vCeSPaiiKGvc9+n9O8buQGYX
 3TlNcOB1VUr8mwyFrC3/volZ+WFtnPCTEjv78ftsA83vie6CF0/KPhLM+gRJsEFS96kW
 GBqDBCa5cd7jypMISz1OjEv60dhn9fZ94lKTkzcVsd/75rlSEWbYuSFsPNMKF8S0TcFu
 fjiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhMghXHPlnlYS0NLPNp7bcgeWLhYBp2gT0SpsIwthhAADna9rV7FwUENaN/Gt9aVi/4vlAQCC6@lists.freedesktop.org,
 AJvYcCXjYYILnQVvyORTPFc3ZIe+nhlVTBtFwaEGqPu4tfOJCg0qbbtrMCtHIm54aYalMwa6meX3jjxdc0zO@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu8V0q1+auabut/7ijdto4ABAm5KAjYk3Nki6iJ7PfnngA6Vit
 +D9fMzOLIgd8uhl/2UsaoJ3HXkOWu6avts3HDUNOvxHY3h4/koCgwH8R/Vc/yPI15fuQ6hscf7z
 w0NFufBRxk60h9E7dcucf/8d6BJE=
X-Google-Smtp-Source: AGHT+IHWk+OQ6gg8FUjgV2v4vECfE0Fa9RJ/6lK2GykuDqzWb1DzW5pw5cVNOpUVhtAQtCWvfc0gKwWGbXHqNy0EXDs=
X-Received: by 2002:a05:6000:8d:b0:368:747c:5a04 with SMTP id
 ffacd0b85a97d-3731185ad48mr7748341f8f.25.1724796293984; Tue, 27 Aug 2024
 15:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240820070818.1124403-1-vignesh.raman@collabora.com>
In-Reply-To: <20240820070818.1124403-1-vignesh.raman@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Aug 2024 15:04:42 -0700
Message-ID: <CAF6AEGu-T4=3jPRcnq3BFBtfb_yhmWE2b8EgxgTm5Q0bqSv04Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: increase timeout for all jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 deborah.brouwer@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 20, 2024 at 12:09=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Set the timeout of all drm-ci jobs to 1h30m since
> some jobs takes more than 1 hour to complete.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/ci/test.yml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index b6f428cdaf94..09d8447840e9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -10,6 +10,7 @@
>  .lava-test:
>    extends:
>      - .test-rules
> +  timeout: "1h30m"
>    script:
>      # Note: Build dir (and thus install) may be dirty due to GIT_STRATEG=
Y
>      - rm -rf install
> @@ -71,6 +72,7 @@
>      - .baremetal-test-arm64
>      - .use-debian/baremetal_arm64_test
>      - .test-rules
> +  timeout: "1h30m"
>    variables:
>      FDO_CI_CONCURRENT: 10
>      HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
> @@ -215,7 +217,6 @@ panfrost:rk3399:
>    extends:
>      - .lava-igt:x86_64
>    stage: i915
> -  timeout: "1h30m"
>    variables:
>      DRIVER_NAME: i915
>      DTB: ""
> @@ -414,6 +415,7 @@ panfrost:g12b:
>
>  virtio_gpu:none:
>    stage: software-driver
> +  timeout: "1h30m"
>    variables:
>      CROSVM_GALLIUM_DRIVER: llvmpipe
>      DRIVER_NAME: virtio_gpu
> @@ -436,6 +438,7 @@ virtio_gpu:none:
>
>  vkms:none:
>    stage: software-driver
> +  timeout: "1h30m"
>    variables:
>      DRIVER_NAME: vkms
>      GPU_VERSION: none
> --
> 2.43.0
>
