Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968585E3AC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06FF10E002;
	Wed, 21 Feb 2024 16:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PtTv5bhd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC0D10E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:46:43 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a3e7ce7dac9so459427766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708534002; x=1709138802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FiquvFGrHOxoq2O6Kk+k8nKguDO2IkwcepkCWrE5URQ=;
 b=PtTv5bhdz1uDec5PUUFKB66y/VZC4UY+oTbXjSwAMiEfRZErAvjD3a6m1fBvoJ8tfQ
 Jm6kPbKhrgcC0ibXxoPC3L1yXuG5k3C4xea/aVRgWhdUBHrsq18+mhf6hUMtL/UofIq4
 vnktMhSIHXHiaTxh5V7vSJ7mTf1OD0az6PXCWy28Zv0V9tj2R+z2bm5rrP8RJxm37Fo3
 DOFg8tLtEh6EV967mPFx9ug0tiPJl/1Mv3OIS1Xj+NCJ4gNp191K56I3DVUfadzzVNZa
 qLWuQvahRRb0qa3cRYXIUc3g6P5DYoqaQcNw2/oItzPjsQF9j234H8KGRDzOlj9wRhAQ
 QwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708534002; x=1709138802;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiquvFGrHOxoq2O6Kk+k8nKguDO2IkwcepkCWrE5URQ=;
 b=oqhEm8nqs8Dz/Kj1kVyyY2YsoUVRo8XFc3WYMScU2AhrplbEd1I+eUiZmPruqScfKz
 keejjJMIzFwgVdMPtkFuFZY8RyPcfLlyeCRN9vKj1yFmBU/ukrLzNSgP2cuC8eeXWfFT
 tYCYxRtud6WhZrcLPIpaqZATGawXfxpW+T78/z8KkOA2YhGaWjug9MIILrJaLmmA08Xc
 gPzGZR9UrbKvll3+a0X4VlQZ4yNdoNF6pzxvd3wy94tvzfJ3V4Xj7S+OZ8Roegkdm3hz
 dYOlSviVCfRH0YdChRRv66KuAMZOcOwYG/9+p6v2ZeniTT77E+64RX7R3vhXwHtso3ci
 lm5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+LgnWw4kubnPVes6Ve73pA7PcHeMsFaQ3uUgu6LaBIdg1QwjTEcnTyQhH/MqhVsnLhWLlNRBMOmVwGZW0+2Om7XMiJlq7ClPb+XeLb9A6
X-Gm-Message-State: AOJu0YxzwaqHmbd0zkc1xIEJMJ4Sn6it0B1NREP1D8ktXo4AGireUI1u
 89jHWoNbQVZC6lfbS4Mp4VZpCgz3vlGherZ/pynBfNc3OJHHPpXmt9zs/QnIaXk227TOFLkMbkY
 sQBE186Oc8SUknwNe1avgHpdHwuo=
X-Google-Smtp-Source: AGHT+IELCO8/rOlGRFhmp6Sf0DgpQM+GJ/uSgRBEDg2OCFsOud+nGutzcrwV4xVoy/cWwvdUC3Yw0+jnFMRS1jylMo4=
X-Received: by 2002:a17:906:b858:b0:a3f:4fd6:b016 with SMTP id
 ga24-20020a170906b85800b00a3f4fd6b016mr1486739ejb.28.1708534001522; Wed, 21
 Feb 2024 08:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20240221094324.27436-1-tzimmermann@suse.de>
 <20240221094324.27436-2-tzimmermann@suse.de>
 <ZdYJ4FhJ9vhzUeiW@smile.fi.intel.com>
 <2667387f-f768-4057-a1d0-abbc2cb40d89@suse.de>
In-Reply-To: <2667387f-f768-4057-a1d0-abbc2cb40d89@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Feb 2024 18:46:05 +0200
Message-ID: <CAHp75VcoAuSiTa+QExmtCt9mXDbu6nktg190MRcmpcdzN5yoJQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Shevchenko <andy@kernel.org>, lee@kernel.org,
 daniel.thompson@linaro.org, 
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
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

On Wed, Feb 21, 2024 at 5:45=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 21.02.24 um 15:34 schrieb Andy Shevchenko:
> > On Wed, Feb 21, 2024 at 10:41:28AM +0100, Thomas Zimmermann wrote:
> >> Framebuffer drivers for devices with dedicated backlight are supposed
> >> to set struct fb_info.bl_dev to the backlight's respective device. Use
> >> the value to match backlight and framebuffer in the backlight core cod=
e.

...

> >>      if (!bd->ops)
> >>              goto out;
> >> -    if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
> >> +    else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
> > What's the point of adding redundant 'else'?
> >
> >>              goto out;
> >> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> >> +    else if (info->bl_dev && info->bl_dev !=3D bd)
> > Ditto.
>
> They group these tests into one single block of code; signaling that
> these tests serve the same purpose.

Commit message has nothing about this.
Also if needed, it should be a separate change.

> >> +            goto out;
> >> +#endif

--=20
With Best Regards,
Andy Shevchenko
