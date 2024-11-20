Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CBE9D423B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 19:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6713D10E7A4;
	Wed, 20 Nov 2024 18:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cx/BJh8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63B210E7A4;
 Wed, 20 Nov 2024 18:51:10 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-83abc039b25so4016139f.0; 
 Wed, 20 Nov 2024 10:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732128670; x=1732733470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+Cd26FOvgLlRGwlmWQpeEkQVjz0XsHua3Mq3Xu6fWM=;
 b=cx/BJh8X2ADKruWtUCsTkVoaxTMY9KUvyXoVFI29i9yCQEOQqcLdrDGEOT+Hvv05wG
 9jqv3CEGejYvdbDOL78L+tCzkaw3xDfnl6i7Gc8NLkTuwZ6Mg5Ibe5xZq+xAwtCs8tpa
 N04vHBGc1HhXJDJBQOQYj9W/NFwE0DXqUNLw/qFwHoyz1G8XV0B09H2tlK9CMcLxOp8j
 TUoXqhw/KDxOLeXBXDzTAQz7UTl6VyVRe8xbL7q4yoMsoVVNrbbAeJWHcgo//Eq38mlq
 pOJpm0HzhzENM3xT/+MmEp871J32D9/3i9GJOpE0uIdaRCeZacRJ1UvsIwJREZc2XhFg
 DTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732128670; x=1732733470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F+Cd26FOvgLlRGwlmWQpeEkQVjz0XsHua3Mq3Xu6fWM=;
 b=anggudnQOe9rF8dElfcIZgtoRZdtwsHIsmqHY8MMWwE18Bb75enfB8tHVPzDJfnrjH
 LYl7L5fqVnQiqbTBrbBoCh/A0qcT3Ea/EzkU+k0PJLJcsEDk9XccT2s61xwCpIklQ2UP
 gk96rgKdi/SnDTSm1rGBPnhw6OjWRB16VPghC2GJfmADnu3GnfjOa7o2VRR3UtSuD5IX
 mNTFGS9/TxUpHuvXLS3zC2XJMpvVVyAmzkFR8AdIKPHFnnet6Q4GdUlxsVA2FimvnpAA
 su+SvwsnMeWXon9FWakssWbzMLFjfui0gjYIIZwhvPX14kiJwc0sw/0D0Fyt0VnnUTn9
 BoUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2sc8fU5WdcTLQjhmsrXcyTQemJA47y88mfpb8qbOEToBlWPq3chzTBR1GvD+5Xo5RpYoFpBhmsopI@lists.freedesktop.org,
 AJvYcCWaouNpjHIuVA8uWnEF6zc9RN1hvm9OPewAVhW0KJ46ZxRPhEj4JK0WHV6M6aKFeJBd4rxWxSvRYjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWWkdB9YbCI3SZHHvG9AxFVMY/sMW/y7aUA2DwpDwBdSRqNgt/
 SjdhEv6mhWmgsxHLNY77mVPYkKoFIwMINBq7XEWcSEuC++8hXU268WPXvpniX3V0VFa2ke9RRaa
 B5vzVT2PxFvNFP89vPBxtWHJ+4lU=
X-Google-Smtp-Source: AGHT+IEsgAE+Ui00r62dF3CVBG/0pDLJRkIWjlY0vwqwXvv02noBqS1qDHqCRVOUcSbt7XdBIOi9icRNOyIEzSO7KVI=
X-Received: by 2002:a05:6602:340e:b0:83a:a96b:8825 with SMTP id
 ca18e2360f4ac-83eb5e387a2mr456030939f.0.1732128669794; Wed, 20 Nov 2024
 10:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20241120154919.814593-1-pvorel@suse.cz>
In-Reply-To: <20241120154919.814593-1-pvorel@suse.cz>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Nov 2024 10:50:58 -0800
Message-ID: <CAF6AEGshZMEHYT6X3fG0vYPpfa4i_o8gxOareHNggYWtkn=2Yg@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/1] drm/msm: require python3 and xml.parsers.expat
 module
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-arm-msm@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kbuild@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>
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

On Wed, Nov 20, 2024 at 7:49=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> 0fddd045f88e introduced python3 dependency, require it to quick early.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi all,
>
> RFC because I'm not sure if previous failed build wasn't better:
>
>         GENHDR  drivers/gpu/drm/msm/generated/a2xx.xml.h
>         /bin/sh: python3: not found
>
> This way it's documented, but CONFIG_DRM_MSM just silently disappears
> from .config. Also because depends on $(success ..) is not evaluated
> (understand, some expressions can be really long) one see only:
> Depends on: n [=3Dn].
>
> I was thinking about testing via $(PYTHON3) -m "xml.parsers.expat",
> but because expat parser (and other modules) should be part the official
> python3 and are installed even on minimal python3 installations (e.g.
> python3-minimal on Debian). Therefore depending on "$(PYTHON3) -V"
> should be enough.
>

Would it be more clear to do something like:

config HAS_PYTHON3
      dev_bool $(success ...)

(in init/Kconfig or somewhere central) and then use 'depends on
HAS_PYTHON3'?  That might make the dependency easier to see in
menuconfig/etc

BR,
-R

> Kind regards,
> Petr
>
>  drivers/gpu/drm/msm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 90c68106b63b..2cf4573a2ff1 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -11,6 +11,7 @@ config DRM_MSM
>         depends on QCOM_LLCC || QCOM_LLCC=3Dn
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
>         depends on PM
> +       depends on $(success,$(PYTHON3) -V)
>         select IOMMU_IO_PGTABLE
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select REGULATOR
> @@ -36,7 +37,7 @@ config DRM_MSM
>         select PM_GENERIC_DOMAINS
>         select TRACE_GPU_MEM
>         help
> -         DRM/KMS driver for MSM/snapdragon.
> +         DRM/KMS driver for MSM/snapdragon.  Requires python3.
>
>  config DRM_MSM_GPU_STATE
>         bool
> --
> 2.47.0
>
>
