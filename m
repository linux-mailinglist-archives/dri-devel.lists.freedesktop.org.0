Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51BB41C0B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB1110E1FF;
	Wed,  3 Sep 2025 10:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RwCdN/oh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B73210E1FF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:41:20 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-24456ce0b96so9676375ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756896079; x=1757500879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M0EPRZe8YJObgeqfHix/soVRNAxr+rVxG0fDuUG583s=;
 b=RwCdN/ohAlWUUuWc1YU+V7Tn+dhrqivq9KDPZaW8Gk8uuTJ9R8ucLIpFtyjzsiG29Q
 lJOEdKj3d810CGkeekNeYyCTjYfUIELKLsaCav+Otd4PBX85e4v/4NO4pwxXXRDWfho7
 UDNLolDVgTTZx8FrBPKa7T5/GKlpHG2SUegzp8ASM+PazxrUW9t/fdYgGMqrgcCbkojw
 1KhyKHRZ0g1HPwWqALOV9Sty2nVkHEU6raEcGom6wFzocwTvyyCOOdQam7DUEFkXlkLT
 o03WGjysz2bBgAym01I0oZhCkAd0J3IwF1l4laFOOaWC/waA8NJ+Vsfnp8SQXZWKrzLb
 09Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896079; x=1757500879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M0EPRZe8YJObgeqfHix/soVRNAxr+rVxG0fDuUG583s=;
 b=eqM8UhXlmmgUqf7t5QmNqyZU3lcZS9ygebbq8cpzGBQP/K2aQ07gnkY1xNOO5p5gVs
 y3qA/w/sV43OF33Gj+dQ70p3aZM3WbXOp+J7S4KOXwZZ8oAJxroXQ+f0s80G7rlCNUWL
 yQHWVuH8xsivlDoF7nnyM9rX4it7yBnRRiGWEOClkySJVVNxrmgrdOeJNiQe72FMkqo+
 cbMpNXyh4Ax9b7EQqMG84NzE/oacwg9j1fahJxwJk/iEZlBSQ8Gzg38F1uBM/0/bNwXT
 Qxl0T8nEICuyfW/8W5VRPCfY98pBDOJaT24bqMyMen+YOCkBQDbVqOFyeTIOMBPNNGi2
 9Sow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4WzocoGm5Nm9GZFAOnZdMLoX4KF1n8Q0TUhRgPEPttPMdyml0hxDeAWUIxN1vl1bd22PfZaH6kI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOgs+9hU3gG02nc040jRJfVCZDsKWtPqMxc+ktSC5l9llhwpDt
 gYltGwqOZhEJ2W6OujBykXe5hwXHTfJkI/z2H6H7tgBh6kYhmgijwgDJ5z/qTyDWpJ5XYc00C6O
 bqXifKrCMAeWiUI+uwi+FmUDW1gjbomY=
X-Gm-Gg: ASbGncsYM2zK6Y0VKM4VFlr5TfaOqy9WP5QXa/xN5+u5+00ST9rsMPBF2QRHCML1oDo
 /d40f7xvylFdfPi9aBiAkOqCiS0jkakAKpiggR/amh5pyHk7xXzfjtCYeq4/9Loi6nIqHgSsctc
 /nV6a6G+jP6KIpZc+6rb+8if0V8HrWvcYNxih+E8xfsu4OhMXCjzSuQXBnpITGqNbqVEoxUMuMc
 IkSKOI=
X-Google-Smtp-Source: AGHT+IFBlgHU9/9J/ynH5B/Y0lYKvN7CIRjLzFRFLjCUSdV7/phYhX05by3bq36srAY3SNogU76UhQZ1T1/Qk7whF0E=
X-Received: by 2002:a17:902:e891:b0:246:2da9:73a2 with SMTP id
 d9443c01a7336-2493eff73d7mr197893025ad.27.1756896079484; Wed, 03 Sep 2025
 03:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
In-Reply-To: <20250901185208.394cd162@booty>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 3 Sep 2025 18:41:05 +0800
X-Gm-Features: Ac12FXx8o6RDyP5im-Wa5RK1y5nzjHR2o5AyrKxsM3tEIkvqqNNrZcDYhIoBDY8
Message-ID: <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 devicetree@vger.kernel.org, l.stach@pengutronix.de, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org
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

On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Shengjiu,
>
> On Thu, 21 Aug 2025 15:31:28 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio dev=
ice
> > driver needs IEC958 information to configure this specific setting.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Acked-by: Liu Ying <victor.liu@nxp.com>
>
> [...]
>
> > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec9=
58)
> > +{
> > +     mutex_lock(&hdmi->audio_mutex);
> > +     hdmi->sample_iec958 =3D iec958;
> > +     mutex_unlock(&hdmi->audio_mutex);
> > +}
>
> Apologies for jumping in the discussion as late as in v5, but I noticed
> this patch and I was wondering whether this mutex_lock/unlock() is
> really needed, as you're copying an int.

Thanks for your comments.

Seems it is not necessary to add mutex here. I just follow the code as
other similar functions.  I will send a new version to update it.

Best regards
Shengjiu Wang

Shengjiu Wang
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
