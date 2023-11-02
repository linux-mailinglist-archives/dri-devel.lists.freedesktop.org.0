Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409FD7DF51D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A5B10E09D;
	Thu,  2 Nov 2023 14:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE4310E09D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:34:09 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso164474466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 07:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698935647; x=1699540447;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgks7+Mrd9UjN3I3/bxrqGWTtSqcTUrWZCfSRhD5piA=;
 b=GNqjZR8z6FUYBkEHOsi93SZGmVd4b0aACxdj9iDYQvgp24j17YhEAhoZf7qmbi7pNO
 BH5TZ+lCbb1iAUdd9PWag0R741O2dtdF9Nz0nFYzvbIVsGSfirEEpxtEfJqD2UwN/1Kd
 EULlrWT3l6TcPSqzdEHFS7lt+W4IqZJrc0yiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698935647; x=1699540447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgks7+Mrd9UjN3I3/bxrqGWTtSqcTUrWZCfSRhD5piA=;
 b=akJXxrUwcgZszSUNe7k9FS+HiBe7d2AHakPalpewjMIoLGnPQl359ItJuDi6vlik0Z
 qGrMlu0Hmuh1JIcZ3rM/wNIlf//0HioY7LL6vf4ou6Wl7fMyT4lqZRen/N3JqAKcz/PG
 gEztP2XttAVv+LXumC+bLuhNQPkPr7lULoYYMYggf7ELc1TNCGTlDCefBDV2o+1oXmzh
 xB2lc2MNDmV2KXX192WfxZDHXgp/rRxY/p7dkPxfL1dwkvXcqKYFtdLb88PqDfZ37TEM
 GCrgDzxqJRiBEQk2Q3seN5P/6cEDhZOcUXEObGrWLUJgrx3ptydhcpjaf3XMrhWwCeyu
 nj/A==
X-Gm-Message-State: AOJu0Yy3aL9C4cQB6iWVXvkRZyKNRUiY5P0FQzEnmOcRNe+kBMufW8In
 iEapuH45Gsmy0WaLTDQItIbhU2va3D3h1dOLVImm2w==
X-Google-Smtp-Source: AGHT+IGeYNieihTV9mA5vevp7RaQWPxNypAmXZCqmH4wvFMsN/k0j5Zj/KSFbmu24iFcFw6i6O0A5w==
X-Received: by 2002:a17:907:9714:b0:9be:6395:6b12 with SMTP id
 jg20-20020a170907971400b009be63956b12mr5644122ejc.27.1698935646669; 
 Thu, 02 Nov 2023 07:34:06 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 qq26-20020a17090720da00b009a1b857e3a5sm1211811ejb.54.2023.11.02.07.34.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 07:34:05 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4078fe6a063so52555e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 07:34:05 -0700 (PDT)
X-Received: by 2002:a7b:c385:0:b0:400:c6de:6a20 with SMTP id
 s5-20020a7bc385000000b00400c6de6a20mr52452wmj.3.1698935645509; Thu, 02 Nov
 2023 07:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-4-hsinyi@chromium.org>
 <CAA8EJpoPMkQRhCD-9SPSheiio1dH8V6BUv89MZKfZdrBzsBW-w@mail.gmail.com>
In-Reply-To: <CAA8EJpoPMkQRhCD-9SPSheiio1dH8V6BUv89MZKfZdrBzsBW-w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Nov 2023 07:33:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WHzCdiYumsxUm_am+ALqq9SOOrjf=JYHqJuiKFB+Dnsw@mail.gmail.com>
Message-ID: <CAD=FV=WHzCdiYumsxUm_am+ALqq9SOOrjf=JYHqJuiKFB+Dnsw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 1, 2023 at 11:31=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 1 Nov 2023 at 23:26, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > If a non generic edp-panel is under aux-bus, the mode read from edid wo=
uld
> > still be selected as preferred and results in multiple preferred modes,
> > which is ambiguous.
> >
> > If a hard-coded mode is present, unset the preferred bit of the modes r=
ead
> > from edid.
>
> Can we skip the EDID completely if the hardcoded override is present?

Yeah, I wondered about that too. The blending of the hardcoded with
the EDID predates my involvement with the driver. You can see even as
of commit 280921de7241 ("drm/panel: Add simple panel support") that
the driver would start with the EDID modes (if it had them) and then
go onto add the hardcoded modes. At least for eDP panels, though,
nobody (or almost nobody?) actually provided panel-simple a DDC bus at
the same time it was given a hardcoded panel.

I guess I could go either way, but I have a slight bias to adding the
extra modes and just making it clear to userspace that none of them
are "preferred". That seems like it would give userspace the most
flexibility and also is closer to what we've historically done
(though, historically, we just allowed there to be more than one
"preferred" mode).

One thing we definitely want to do, though, is to still expose the
EDID to userspace even if we're using a hardcoded mode. I believe
that, at least on ChromeOS, there are some tools that look at the EDID
directly for some reason or another.


> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_modes.c       | 16 ++++++++++++++++
> >  drivers/gpu/drm/panel/panel-edp.c |  7 +++++--
> >  include/drm/drm_modes.h           |  1 +
> >  3 files changed, 22 insertions(+), 2 deletions(-)
>
> Anyway, this should be split into two patches. One for drm_modes.c,
> another one for the panel driver.

Yeah, that's probably a good idea.

-Doug
