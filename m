Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4E36C525
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 13:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1E689D4F;
	Tue, 27 Apr 2021 11:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBC389D4F;
 Tue, 27 Apr 2021 11:32:31 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id z4so1636701vsp.10;
 Tue, 27 Apr 2021 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pcbDrIRHoZNTDhiSsH+5tM2giZXAQMRnOQ5q6Gp9XQE=;
 b=WSu9xNqmWmzwB2C3irLRmRyn1pYUoazRkG8T1iQ74R2P64BYoMmJaXb9AnbjEThDl4
 nTYZ/jR7GTa6AhgMPjehv0jzy1P/jeHxTNcMX2FIour4Dlgbb9fD0uTX1SCqcAB8Ed3D
 xql5Fth+FJgSrdTrF1bJIr24m9QHB3gRTv7yNOro3G4mil/050nfL8jQ8M0RydJuJeRa
 4Z8b8OsDGNHr3mQpR4/NFVgJ4WvZ3j/j7yw5QG/J+QHvWH9uPMmuecVIBnONulsNLCGz
 VtSe30OQrYIg7hrhGwYqLc0K7MOzMLvhmf/kP99gyJ1akoMGNiqwT3sIYPklJslTpK7f
 F71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pcbDrIRHoZNTDhiSsH+5tM2giZXAQMRnOQ5q6Gp9XQE=;
 b=eg9YZ1H2jZaRIgb/IIqOKQr3vvyhn/9KmyoC+Tjudo7WghilTNJyQ+tQqlRxWPAO1s
 roJOCZkgaST5SeglN03f3JEayHBQn0c49BOvyXQhLTkWKX2dvRE5vb1xjIrCNOOSfieP
 b+2Cb43y5udSzT4htTttXdga5A8M8iVc2Ip+98OxKQe6giS/M4h9CptTxSjthTG9a7L3
 yFQDD/acMclk6OoWSUfiZSZLD3WPKguYBb6PkNzYv1AthkBiVGtyq+8YvdPCwdNwrDcM
 D0nF+krzYFBb2CqJg41f2ljFp8/1SJNRVwPzo04fXpHPpSPOtPVKkm/gaJn9pJnc//Q3
 nc5g==
X-Gm-Message-State: AOAM531KZFoDF8ER4jlrarsPay7DkUF4S8YxBgxrXVXacWd9yyRvHd7h
 yCIY2t1ZO61KqDzlpHtOwPhomr7ca/YjFGvumc0=
X-Google-Smtp-Source: ABdhPJzhTAwhGn/frmLLc3DPwXZAfD2Ulx0Tg0lTbb7Rbnnt+sDAPiecjJnC8vikHj3WA6c226VeoVWZ7iyI+IzM0VU=
X-Received: by 2002:a05:6102:21d1:: with SMTP id
 r17mr16858521vsg.19.1619523150694; 
 Tue, 27 Apr 2021 04:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
 <20210427092018.832258-8-daniel.vetter@ffwll.ch>
In-Reply-To: <20210427092018.832258-8-daniel.vetter@ffwll.ch>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 27 Apr 2021 12:32:19 +0100
Message-ID: <CACvgo51rQJmHc1K-MSq-WLZkwVt34MY73csgEyxorrYsKPwQiA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/modifiers: Enforce consistency between the cap an
 IN_FORMATS
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, 27 Apr 2021 at 10:20, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> @@ -360,6 +373,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>   * drm_universal_plane_init() to let the DRM managed resource infrastructure
>   * take care of cleanup and deallocation.
>   *
> + * Drivers supporting modifiers must set @format_modifiers on all their planes,
> + * even those that only support DRM_FORMAT_MOD_LINEAR.
> + *
The comment says "must", yet we have an "if (format_modifiers)" in the codebase.
Shouldn't we add a WARN_ON() + return -EINVAL (or similar) so people
can see and fix their drivers?

As a follow-up one could even go a step further, by erroring out when
the driver hasn't provided valid modifier(s) and even removing
config::allow_fb_modifiers all together.

Although for stable - this series + WARN_ON (no return since it might
break buggy drivers) sounds good.

> @@ -909,6 +909,8 @@ struct drm_mode_config {
>          * @allow_fb_modifiers:
>          *
>          * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
> +        * Note that drivers should not set this directly, it is automatically
> +        * set in drm_universal_plane_init().
>          *
>          * IMPORTANT:
>          *
The new note and the existing IMPORTANT are in a weird mix.
Quoting the latter since it doesn't show in the diff.

If this is set the driver must fill out the full implicit modifier
information in their &drm_mode_config_funcs.fb_create hook for legacy
userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
broken for modifier aware userspace.

In particular:
As the new note says "don't set it" and the existing note one says "if
it's set". Yet no drivers do "if (config->allow_fb_modifiers)".

Sadly, nothing comes to mind atm wrt alternative wording.

With the WARN_ON() added or s/must/should/ in the documentation, the series is:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

HTH
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
