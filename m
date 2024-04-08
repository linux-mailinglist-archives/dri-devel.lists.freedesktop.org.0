Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB48789CAB2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65471128DA;
	Mon,  8 Apr 2024 17:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="CCSlHd3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2CE1128F2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:23:31 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1e3c9300c65so23675155ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1712597011; x=1713201811;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LcVvRxxiaBcNW1+BR+h2UM8V37g0SRXH6IHzE1cH1Nw=;
 b=CCSlHd3PwmeVkTD7o4lXVrZd8HXDrNNYCFAUVmjYc+nFUSECjimK+C846GexnIcooT
 /rmdZuqpiPXQZzzveyLrPzZMM8zdcSx1W9WxNGahgtvaui2M1dD3uod6e3x3bdZEjfRE
 PKFmT29GeYM3sJxwEPBdFD/SVuzkxD3iYiq6nj5xjsB2SnE57lMq68/fYRKdH1f8NSbX
 gbAkmSZI7XdxV7Kyil1VCzBjtunjGcxzHAgAd1HIJ3kdMivxGpIYd1uayfxVgVaRtYHX
 0IzMgn28Wr1517QuIeTM+uCQ0A0jiZ5BBlPIUp0PHSJTFMifhyEEOvVXwLLG5pH/yN1f
 aMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712597011; x=1713201811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LcVvRxxiaBcNW1+BR+h2UM8V37g0SRXH6IHzE1cH1Nw=;
 b=Z9qhP06nAU/oV7RmAqtcB2UVoNgeXWkim5cNfNMzBKsj78awf4E4llqzzpJ0ixPOb6
 ut1/C+K5noJfmclqVqVDYePpONEgMuTgfFsndRj9XMHKrtLQ5GuuqZnPRMwzPDu6Vmey
 JQ9YnK7I6wm+yA5wK4XMFLPdSTsHv4Yk3j/ScrOTsUr5VKKY8QqnLXU8Rsfa9bl1SXiF
 8J6oOHYXupaxoSxvx2xwXYQXYmhWdMylNGIn+2Xi38DVeCX6pisEFVHPLs0cXccFicy4
 ATJpyLaeBCSskkvT90UsrpbzHPjJxMcxFzmYQlz2oHju6StFm4fHdMSWq7bQZBiWMCRn
 F5OQ==
X-Gm-Message-State: AOJu0YzVN+ehGCwfwnPV7m7QmNq/ut1gtp9pQX2zrGJXZwPQ8ITZ+kWr
 NQyfd9TtaJpemXfkV/Ku8bU1jWmwed5dhW9+dK3p/4KcAsIn4CflBW6BUO6zkr1LsxE/d8OltqG
 regXETe91BiZZFdg0/mzOn4DBHbk=
X-Google-Smtp-Source: AGHT+IEuD5VAsrctZyUhSrQr4NgorCa6Lo18i8ORNmwHs0DLeNdSDuNNfzokMKvD131mITGtLGHOS0fNgbI5jK2I3UA=
X-Received: by 2002:a17:902:f68c:b0:1e2:23b9:ead3 with SMTP id
 l12-20020a170902f68c00b001e223b9ead3mr9321827plg.24.1712597010885; Mon, 08
 Apr 2024 10:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
 <20240408170426.9285-20-ville.syrjala@linux.intel.com>
In-Reply-To: <20240408170426.9285-20-ville.syrjala@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 8 Apr 2024 19:23:18 +0200
Message-ID: <CAFBinCAE_6RWikgpgBxhkq2pMyMiSSn2kYRKoG0+xfGtdRQiGQ@mail.gmail.com>
Subject: Re: [PATCH 19/21] drm/meson: Allow build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-amlogic@lists.infradead.org
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

On Mon, Apr 8, 2024 at 7:05=E2=80=AFPM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Allow meson to be built with COMPILE_TEST=3Dy for greater
> coverage. Builds fine on x86/x86_64 at least.
>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: linux-amlogic@lists.infradead.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Thank you for spotting this Ville!

> ---
>  drivers/gpu/drm/meson/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfi=
g
> index 5520b9e3f010..d8f67bd9c755 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_MESON
>         tristate "DRM Support for Amlogic Meson Display Controller"
> -       depends on DRM && OF && (ARM || ARM64)
> +       depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
Neil, I wonder if we should just have "depends on DRM && OF" here as
the next line already has:
>         depends on ARCH_MESON || COMPILE_TEST
ARCH_MESON is only defined for ARM and ARM64
