Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3892C315
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 20:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EF610E628;
	Tue,  9 Jul 2024 18:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BPfhC/aa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011CE10E628
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 18:07:01 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-70362cae7e1so1685030a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720548421; x=1721153221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJAo1DXs8ooE0RW3APFpiuREqVJox962WsbSK7msjLw=;
 b=BPfhC/aaw+PHR4TTX/VmxW4/wb2C29pS39ChOj0sNH6U+hmnepxtyEvqzuqO9vAEen
 hcTRheF2jMKFQ6AHA60NzT/6WEgmwPV+dgpKUGEL9gNWjFgLtdrK2Ep/Wy/2DzGAw+i9
 c+W0G5HJ0ZEMqyX5xvZrzb5sq8ziuYkNNIizrBZJvkD4uWm7E5BCBUVWLLxNxGIE7hd/
 2G4MwOlfOkBF6UWReQYEySTscjs1K0In3X3QOCKFEOP4pJQNOWCOKuMLijXFZAklpNX7
 pFTPCeQGKvf4USx/J9Z/Plo4KcxwOOw4gCeXDzvo6XljsCP2O7zgXTJqw1kasVA18wqD
 uIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720548421; x=1721153221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJAo1DXs8ooE0RW3APFpiuREqVJox962WsbSK7msjLw=;
 b=NLwI8HgHAn1Iv9pZME8J8SB7MIxOGgOgL0RpLUc+y0eBRLccIomdXByjeAbJYYudP/
 gvT9IpuHPLN7LvSfj7ArpxUWkrlCtXBSxwznnWTBIMgSYPVbvECfm2Q4l6PvkHDFh/l5
 m9cimymmvYW9hY/r4PtyQAjt9y6H2HTapqz8422LdB0Dkkpr5u+1g2tW0QFj3GR4z3IZ
 ZXEoVgDeM9V1f69F/rrewxPiv57jG0sCSN0gNXt62jv2+sxbUzxPzi1RlZbnFPCGXgld
 5stBa2ECWnC02JsY5aRLK0Ddq9JcubtEpCcPY8ivd+/BpWILLybCRNgMzHlHwE1pD1R3
 B8IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZR9eOlMIzyUGSPn/QTGgL4E83oLfiYF0ANelllAfl7sz5AI1GQVztGQBVUDJuyobW5GzBR5wNB804kYK6EMn/tiD/oQWE/Do1jkArF3qj
X-Gm-Message-State: AOJu0YySoeGc4UAkM6RcZicy/WrlpLE1dbwwvG2itgKjB+pcBXtGi36Z
 bdAuYY8aMQsuzm7OFG3KvmS60k0iZiuBMmiYn3b2JSVH3XWsBnaCXn9FVG+uG7KtVHlvWkEMbZj
 9aXjudBoJUahcrILgyoxsjQYVLRA=
X-Google-Smtp-Source: AGHT+IEK/h7YRFNQ2S7300KC0byBo5gQdt7zCpjTXA4dfoiohxCrmTmLBf7UZXh0AakpB+NhqkARZiuhDFtcgob1/K0=
X-Received: by 2002:a05:6870:c03:b0:25e:1a0f:522d with SMTP id
 586e51a60fabf-25eae8a49b7mr2821143fac.35.1720548420892; Tue, 09 Jul 2024
 11:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240709113311.37168-1-make24@iscas.ac.cn>
In-Reply-To: <20240709113311.37168-1-make24@iscas.ac.cn>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 9 Jul 2024 20:06:49 +0200
Message-ID: <CAMeQTsZojC24Hs_zy0UX0Zjq42zLH21yn_hZhkcSKbL5X1jiSA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/gma500: fix null pointer dereference in
 cdv_intel_lvds_get_modes
To: Ma Ke <make24@iscas.ac.cn>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, daniel.vetter@ffwll.ch, 
 alan@linux.intel.com, airlied@redhat.com, akpm@linux-foundation.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Tue, Jul 9, 2024 at 1:33=E2=80=AFPM Ma Ke <make24@iscas.ac.cn> wrote:
>
> In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference on
> failure of drm_mode_duplicate(). Add a check to avoid npd.
>
> Cc: stable@vger.kernel.org
> Fixes: 6a227d5fd6c4 ("gma500: Add support for Cedarview")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Thanks for the patch!
Pushed to drm-misc-fixes

-Patrik

> ---
> Changes in v4:
> - revised the recipient email list, apologize for the inadvertent mistake=
.
> Changes in v3:
> - added the recipient's email address, due to the prolonged absence of a
> response from the recipients.
> Changes in v2:
> - modified the patch according to suggestions from other patchs;
> - added Fixes line;
> - added Cc stable;
> - Link: https://lore.kernel.org/lkml/20240622072514.1867582-1-make24@isca=
s.ac.cn/T/
> ---
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gm=
a500/cdv_intel_lvds.c
> index f08a6803dc18..3adc2c9ab72d 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> @@ -311,6 +311,9 @@ static int cdv_intel_lvds_get_modes(struct drm_connec=
tor *connector)
>         if (mode_dev->panel_fixed_mode !=3D NULL) {
>                 struct drm_display_mode *mode =3D
>                     drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
> +               if (!mode)
> +                       return 0;
> +
>                 drm_mode_probed_add(connector, mode);
>                 return 1;
>         }
> --
> 2.25.1
>
