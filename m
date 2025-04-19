Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9AEA94577
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 23:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D442710E00B;
	Sat, 19 Apr 2025 21:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="ehZTyR9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3710E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 21:32:38 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-227c7e57da2so26040475ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1745098358; x=1745703158;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
 b=ehZTyR9nLLFxOmLhSpHLhKbOSjT8dS9FhkJioXVk6kwND6b7kJxWak+pry6vINDr6d
 80yLfRsbC+CLc4KMrgOkvd3k7mjTxEnxggc0mx0IcbHzt0LrkPnWJb6JrpZrWxM7mkUe
 7rcNUH4pSzdjdEBkt2bvJfb3IO2tKLd3eK0BE5c1A9WHuNRYCTEcupgP8hUFuVgRwyDs
 t7ALo6GxVGzH2JhVy7ZSeyVI9+KkFK2TFtnkDM/W9ag3Z03vqaG2dQ/8GluHjNaBCN2U
 WDmMr8kDeYCm17MnciPnsnp8zbFMHfWEwvs7nmrYyN4w1KSNUzgwTtu1001sZP5dZXeg
 6sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745098358; x=1745703158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
 b=hZJyxdNsoteARpKLC5XX5VygpcJJXs6/6eO0nYATb056dj9Tq4Db0iIIlvbp9irP6L
 V73E3H6ZlrbROSaMWASckIe636iWW+U8HY03L7CMIgvr+vs0L5N6v/AmGZu3VtGqtzfm
 ryyJw/b2HBqa8aPN5mYbUwXxgnnwn+rOwLR1MukUFlzlHh8JbsOWuHaNF28C/LxE5Omb
 dGZTJ8ANSAZ5ajc7dLSknEgV8Cc3ZuQnzphCSg/34KskTA1tQsunPe6W+tAyFevlzrxS
 ZTbAN56pbIiW/laLGSgOxIh6pXHO6jxmQt+FgYmQvCug1Cigjg2anGarqOPghK71ojlW
 y39A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/kqfkQC0rmXs/mKFjNsQiZ9wGbxqKDwCsle/4Y/Y6SW7O3pcfl0RAWbFsSLXMCX9nF4ebEjIdspE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxcuAwbAnIk9PX7+Sak2R1kLag7GUqYoUAO4k/Vhk6An0SFF+b
 yq1ePAyJyN/xJxcFisHMwkWBiMx527oDlIzx1YCodWz8dO8AC6toXCvGzztLtpn5B/ra7/Ttebe
 JyO+QyGgDhfafo8q66HBfGNUC4qL12SUw
X-Gm-Gg: ASbGncv2v0j0CfM1/EHFF1f1P23ps2OcZTVxlWQfNEEQZdoFEgL0rZpZEHQctTHnRoo
 GEbe+HYrOA/ZjwQRZ1SoHvfS7ZQ1nyQOyFm6s5yebcO2CKFoZExn9WQ2Aj/vpjNKfHjuybwdxWc
 sOF2dxxSUi8+tWKer9o/AD/YBX3kk17b/iGRw/
X-Google-Smtp-Source: AGHT+IGLlR8UcPQM775uZfby4awG21f1XTwAj2dFL/MhOfyAEZBG0daUZpkUnTjuqdZFSKrcnfs7NqueiXGk5h+tOx0=
X-Received: by 2002:a17:903:98f:b0:224:f12:3746 with SMTP id
 d9443c01a7336-22c535aca10mr96258145ad.30.1745098358068; Sat, 19 Apr 2025
 14:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
In-Reply-To: <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Apr 2025 23:32:27 +0200
X-Gm-Features: ATxdqUEyKysz5d6KQERLrTW5mLuoTSOc_4gWR0BkMuxJYXGSMde_moYAT3tKcVQ
Message-ID: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: linux@martijnvandeventer.nl, neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
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

Hi Martijn, Hi Neil,

On Thu, Apr 10, 2025 at 8:46=E2=80=AFPM <linux@martijnvandeventer.nl> wrote=
:
>
> Hi Martin,
>
> Thank you for the patch.
>
> I encountered this issue some time ago as well and had a possible fix in =
my tree (see
> below).
> My apologies for not upstreaming it earlier.
No worries, we're all busy with both, offline and online life ;-)

> While my fix is not as symmetric as yours=E2=80=94I like symmetry=E2=80=
=94it is somewhat simpler. It
> did make the assumption that only  calling component_unbind_all() was at =
fault and the the rest of the
> code was correct. Therefore, calling one of the following functions:
> meson_encoder_dsi_remove()
> meson_encoder_hdmi_remove()
> meson_encoder_cvbs_remove()
> in case their counterpart was not called, should not result in any issues=
.
>
> I just verified, and, as far as I understand, all of these functions do a=
 check to confirm
> whether the encoder was initialized before proceeding with cleanup.
Yep, that seems to be the case right now.
Neil, would you like Martijn's more simple approach with a Fixes tag
and backport that?
Then I'd send my patch as a small cleanup which doesn't have to be
backported. Otherwise I'd spin a v2 with a fix for the issue that
Martijn found (and including Anand's Reviewed/Tested-by)?

[...]
> > diff --git a/drivers/gpu/drm/meson/meson_drv.c
> > b/drivers/gpu/drm/meson/meson_drv.c
> > index 81d2ee37e773..031686fd4104 100644
> > --- a/drivers/gpu/drm/meson/meson_drv.c
> > +++ b/drivers/gpu/drm/meson/meson_drv.c
> > @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
> > *dev, bool has_components)
> >                       dev_err(drm->dev, "Couldn't bind all
> > components\n");
> >                       /* Do not try to unbind */
> >                       has_components =3D false;
>
> Above two lines are no longer used, so can be removed.
Well spotted, thank you!


Best regards,
Martin
