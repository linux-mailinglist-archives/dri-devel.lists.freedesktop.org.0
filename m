Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9859744B9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 23:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DF810E929;
	Tue, 10 Sep 2024 21:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fGRYai8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50CA10E929
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 21:22:56 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6c353f2f954so43323506d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726003375; x=1726608175;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UzSu/kXOj+AyNMyap+JZaf4+i0lOR352iz38kAetQog=;
 b=fGRYai8WP99c/4P9xw2ymnRIvxhb2B6A9P/4n7foCzlHMQhP+fVi3WDAR0+H/khW1W
 R9pbNpy69zvWX07b88+NUNALq6dwvfx3eXhLFsztoHZNDlV5R88f733RkVGto7RMpdjW
 v/VkLoZCMi7UdzvF9EAQpwOtdQr4Sro/GL/wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726003375; x=1726608175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UzSu/kXOj+AyNMyap+JZaf4+i0lOR352iz38kAetQog=;
 b=TKhkIWrcAjziGQ3s0SDa5CiwimrYC8lK9dBKP73sHpupH44xzv8x7a4BoMstV8loNC
 8IEhHSBb4PfyYeE1fi2TmBln6jqh4nB5kKDSyTjF0dBKEbps7xKCWXU6vBGi6AdVxlFF
 44QG7X6ExIm0jteTztDUT/H90dJHVYCK8K44c4w/QxOiG2O3JeqNVrwsks6asfbBMUVm
 Wi4dHYw6RCnW3dixbre4Zd2pwmiwwc6humz3OyU0yJhJchQaLgbZrnFdAmWpLqFQjKBz
 yDHdSeegDxfh3ANFqwgo80CoREvqVE0UOqsR0s+9dmmjfofKEbLfBvJw4ZdMauYuyPZM
 /dpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA4/55Kn7bdjv/7OdJDr62zrQ/E+ME+gNiEZ+4LUOkTC4lLkF3DsauL00AvgcrGR/ogK7YZeWXUgE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/XLWizEBHNXZY8KxWckW4a5EmdU6zMFsNGgnnLANOZEA65X5j
 foKpChvgy9Y5dyfis1NFIpgU5cNj3m1Tg5z4Nuh+6frKh3yRjyEWoT2fh0pI4kcN0Ix4gb4kc5w
 =
X-Google-Smtp-Source: AGHT+IGckmNLBgsYuCkWSmbcb579gQB5B29bFYA29VitiH9meuNdQQLG7BpW8ZKINRkZXpzCnTr5sw==
X-Received: by 2002:ad4:4046:0:b0:6c5:5086:4431 with SMTP id
 6a1803df08f44-6c5508644d6mr70420736d6.41.1726003375158; 
 Tue, 10 Sep 2024 14:22:55 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c53433aca2sm33864436d6.32.2024.09.10.14.22.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 14:22:54 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6c351809a80so42527126d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWyu0BS98fElYSeEbbrc2Bf5nnyKbTvo0eu8dofHiPNDhVkCAJW7l81ChzLj0A0+ggzEWMoAmVxmJQ=@lists.freedesktop.org
X-Received: by 2002:a05:6214:390e:b0:6c5:1f05:dcec with SMTP id
 6a1803df08f44-6c52851dadamr250755766d6.49.1726003373788; Tue, 10 Sep 2024
 14:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240903173130.41784-1-abhishektamboli9@gmail.com>
In-Reply-To: <20240903173130.41784-1-abhishektamboli9@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 14:22:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>
Message-ID: <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi
 functions
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
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

Hi,

On Tue, Sep 3, 2024 at 10:32=E2=80=AFAM Abhishek Tamboli
<abhishektamboli9@gmail.com> wrote:
>
> Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
> sequences. The previous mipi_dsi_dcs_write_seq() macros were
> non-intuitive and use other wrapped MIPI DSI functions in the
> driver code to simplify the code pattern.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@i=
ntel.com/

You'd only include the above two tags if the original problematic
commit had actually landed. Since it didn't you leave them off and the
Robot gets no credit (even though it is awesome).


> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Update the commit message to explain the reason for the change.
> - Correct the code by changing 'dsi->mode_flags' to 'dsi_ctx.dsi->mode_fl=
ags'
> This change addresses a build error in v1 reported by kernel test robot
> caused by using an undeclared variable 'dsi'.
> [v1] : https://lore.kernel.org/all/20240902170153.34512-1-abhishektamboli=
9@gmail.com/
>
>  drivers/gpu/drm/panel/panel-himax-hx83112a.c | 140 ++++++++-----------
>  1 file changed, 60 insertions(+), 80 deletions(-)

Just adding a note that there's nearly the same patch in
https://lore.kernel.org/r/20240904141521.554451-1-tejasvipin76@gmail.com
and we're discussing what to do about it there.

-Doug
