Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2C2B96B41
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 18:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965BA10E1F9;
	Tue, 23 Sep 2025 16:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQnQINMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F7510E1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 16:03:14 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-26816246a0aso12714505ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758643394; x=1759248194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2ROfUbxr/KN7oAi0rJA/6LeNf8GF4G0Z/s0Uz4C+7I=;
 b=cQnQINMT35kC4OEFg1l0Wlml95pnORR9JTa0OU8Fmxxq6MwfWRSSaQbZudrhnBjO5V
 X6J0EGpi/waZ5Yf5fHsPJOL7dFm0d5DeKsiJqYxcNHjqoMV5nt/3IZ3HT0Rn21+yKvam
 FdO9Pnf+a04QidVDYg969rIPwk2FvBpuTCCJjRJquScokKW/kHC7rfjJE0hFSkegXn7Y
 IdbkxeMYJb42g4W/pJYSmB+7fnbslbByJlSg3b9MhKuj+mP+docAUaWlSwaxftRevkcv
 c7oBAGjd/grIou3RI6T2ONG8Cq+h2ELxCCAguORrqGGCW9fWwKcazHjD5KHb7uEBY+yG
 b/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758643394; x=1759248194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2ROfUbxr/KN7oAi0rJA/6LeNf8GF4G0Z/s0Uz4C+7I=;
 b=boLc7x1AWzC6TO+fIuLBgzpjLsXbw2Hr48u00A3L6pKpIrvSfBXhzH5j3d5uNTJngf
 +d9EwlDmUC3QPBRLcX5jGLbSI1+EmMwez9Wxn2Q6ymaj1ni6KCfEX+bTdfKun5gGXQlO
 5ZboG3IFDOsUxsd4c/2pCOydU3RoBzL69Z6lRfvTkxydEA24gAcsvdPWMX4WMlX+r6Dv
 cwFrRh+XInESOymBjOBR0BmOJJKpuWFd0ufdXV7SwBMuSKi8JxpWdLeOWUA3/29XUBt/
 Rtfqnrv/LyeXT1W/SkJNzWDn6L8lEzbx7fK1pGMXX+TSw2fJ+M2ogAiPQupbMY66rzqM
 vHng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRAKekWROqtbbk2pi2cWMYDm5bklLXSqAfyAYMWf0pSln9RLLfItEUfRd40JWSoTjOfUW+qK887ck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4fcZUOfTvOdSm/AQWWrD+UgNKmSJfTe+uo6dGngJJHe/KuOkH
 Nv9IRobdDtVcwpZIxR7ZPV2LLbRp9ttVEAiNNsG5//hg2/V3fObCrzvtmG4StmHyJUoiIc3G2JZ
 /W4uXSriQAzUjGHij+ldameM0p6aUhgQ=
X-Gm-Gg: ASbGnctsiUZlfleMz/o40afKHDGpGYuJZ7zYaEIBVHVUwpfQr9fqCmeKmPTXSfFoiQX
 GTeD1jaG7WSahazBVLoyrdd6tOQSzzvevAFhoambHC9v/Hz4i1Q9qyE80JJ0ZunLepRlu3sT8/j
 upJRAupmaIBj/SMMN7N5VAD+B1jkSgbL1tpVIMWt2OV2/4Hcjud9l469sTZ2TGtHpeDBJtt3x4G
 UAdmbc=
X-Google-Smtp-Source: AGHT+IGBbiHkgD0/2labtH1NeFTzXLVqipenHtdKCLOlRtkUCqCDTMEK1XiJMTv9TX8U0v9Y4TZdy6Zkg1xfbYYFpBI=
X-Received: by 2002:a17:902:b695:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-27cc712154dmr18207895ad.6.1758643394109; Tue, 23 Sep 2025
 09:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250923084157.11582-1-hsukrut3@gmail.com>
 <9fe75192-9260-44f7-8f13-e024e2bbd731@suse.de>
In-Reply-To: <9fe75192-9260-44f7-8f13-e024e2bbd731@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Sep 2025 12:03:02 -0400
X-Gm-Features: AS18NWDnCIuE4uDg0qpAn-RzVENplvgl1AQzC-tA5opkGWF7-LN_yd6zTJ3mypY
Message-ID: <CADnq5_NHu5=esJZrgy_S80jF68ZapRRYX4_L70DwDDSN3VXitQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev/radeon: Update stale product link in
 Kconfig/FB_RADEON
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sukrut Heroorkar <hsukrut3@gmail.com>, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>, 
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, 
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
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

On Tue, Sep 23, 2025 at 11:29=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 23.09.25 um 10:41 schrieb Sukrut Heroorkar:
> > The previous Radeon product page link was no longer valid. Repalce
> > it with the current working link.
> >
> > Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> > ---
> >   drivers/video/fbdev/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > index c21484d15f0c..3037455adf48 100644
> > --- a/drivers/video/fbdev/Kconfig
> > +++ b/drivers/video/fbdev/Kconfig
> > @@ -949,7 +949,7 @@ config FB_RADEON
> >         don't need to choose this to run the Radeon in plain VGA mode.
> >
> >         There is a product page at
> > -       https://products.amd.com/en-us/GraphicCardResult.aspx
> > +       https://www.amd.com/en/products/specifications/graphics.html
>
> May I suggest to remove this URL entirely?

Yes, agreed.  I doubt any of the chips listed there actually work with rade=
onfb.

Alex

>
> Best regards
> Thomas
>
> >
> >   config FB_RADEON_I2C
> >       bool "DDC/I2C for ATI Radeon support"
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>
