Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DBCA6DFE7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6910E49A;
	Mon, 24 Mar 2025 16:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="D7E8FcKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04EC910E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:37:49 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30613802a59so48491411fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742834265; x=1743439065;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTgTcfPXsXBiP3n1jG7kGPoR3MDdecFN4YWGcxJKKgs=;
 b=D7E8FcKujs3zQ9WVXTM22D9u02MfZ5dw6fcWAik8VbBEJVhSBKMNK4e5XkmuAEHZ3K
 fDw6zOWVK24XD3A8HwLzAzoJyynhpNev6Lf6ImIZxLiVBmi/n7ld5rH+0EWo/pxvp+z1
 sCQon0Vf3SfhWrcFildabtoshNu4K0T0CdT8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742834265; x=1743439065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MTgTcfPXsXBiP3n1jG7kGPoR3MDdecFN4YWGcxJKKgs=;
 b=bpGphRabroApeT26RZCnose4PdEH5HcPpvjA90CB+/y4tmW50LqT1DtozoVZmEP+as
 HSRwMjT8dYUxUhJDyah6sh0jbrMvW0Vd1jQ2akI6Nqcd3jnaQ5pOnWsjakj0YQs8cwwO
 ITEtGUHEWSvGNC38y5qBh9U7ho0C9/VgqjJXjMOY+oxFt+XpfYdKXeJzUW154Wb02KBh
 5ikWMqf3q9lB52w45dbLEGEAr2gYA0TIkantHZtbQfZuoCRaHPqujWoUVPzXW0+BxVhi
 tiowT4dom3Z/0hrG2mzbTmjUAJn/jF3I/riowemYl34e7tPH3o2vPdkYFYoWcnf7gjar
 LhtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU92KFzKYXUp52ZGA2ypRd3ywP1wKUSyU6EsdumpMjJxsztpnzn9B4dv1HKn/brwi0F06srRu32fqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP1qc9QiLXocKGEjJmGseo3zCR0a2otghrEsQEw1HYWxWDodSH
 i+OsUZ1ysWqj7Ga2uRCZvF4j+1T3XER/L+tSUvUlTVwJCHVHL4nKeyQOoJy7IDTaFPv1tjC6PHq
 X7Q==
X-Gm-Gg: ASbGncvKxcnqqeLPPV3ENUZzECYln70uw4EHbmI/aG6OdCoiIuPt8zFT/2gytBLlPdp
 wm1YqXie/UIVUkCn2Mq562sadJpYXR4/DKqbNoqxXVqxH5a6xnp0/LeBgBchM0zAZGmdFk3p5aF
 F61i6mHaHShJTvV40QQ6uL76r1Te2t22Il9iPnPVZVBq3Ba/P3QgsGUHY3aPlm+0Cf1/zyrNgGu
 HLNczG2BWpt1hFS/l+uCO9K6EbK5aiT3lNMkNG0cq0r1lVLbTactEtJK97SjFzqtCalR+GrlDxB
 dUEVp9uqPDdwSau29OF7ZpwEptSwoWEJVHF8QiZufWsEmxGTtQayEAJdbwRsPn12SHJ3JE88sy/
 Pwyaa7oc5YwJ6xqAo59A=
X-Google-Smtp-Source: AGHT+IErgsBR8L9CtQJTsIQK+9JrJttES5hKmdvtz3jCA7qNf6tMnGoN30F2IAN7wFqPbKxnxd5EgQ==
X-Received: by 2002:a05:651c:1506:b0:30b:c6fe:4530 with SMTP id
 38308e7fff4ca-30d7e20217bmr53117131fa.3.1742834264697; 
 Mon, 24 Mar 2025 09:37:44 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d925bbfsm14155601fa.114.2025.03.24.09.37.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 09:37:44 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-549644ae382so5828063e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:37:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVy+LWDncfJrvnQW9RIpKJLOhCqhNeqdjX4KrY6XVIv/xNzSJYUEu5XqMhegZirGE1h6zzbg2NOtmk=@lists.freedesktop.org
X-Received: by 2002:ac2:4e0a:0:b0:545:243e:e2dc with SMTP id
 2adb3069b0e04-54ad64eeed8mr4943619e87.39.1742834261069; Mon, 24 Mar 2025
 09:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
In-Reply-To: <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 09:37:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-nSSo0xFkF+1gsL-JJ5b5S11EgscdY=YJ9wzLBJqcGw@mail.gmail.com>
X-Gm-Features: AQ5f1JrMZgU0HzknIWO7tDf14MHGQKkHS5__am7MPLh4QXDIGK5B8aacmkLqJpI
Message-ID: <CAD=FV=U-nSSo0xFkF+1gsL-JJ5b5S11EgscdY=YJ9wzLBJqcGw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Mon, Mar 17, 2025 at 7:33=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Mar 15, 2025 at 1:17=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Do not create a custom directory in debugfs-root, but use the
> > debugfs_init callback to create a custom directory at the given place
> > for the bridge. The new directory layout looks like this on a Renesas
> > GrayHawk-Single with a R-Car V4M SoC:
> >
> >         /sys/kernel/debug/dri/feb00000.display/DP-1/1-002c
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v1:
> > * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> > * remove RFT because tested on hardware
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++--------------------
> >  1 file changed, 10 insertions(+), 30 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll plan to apply this next week assuming freedesktop is back up.

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
      commit: 1d1f7b15cb9c11974cebfd39da51dc69b8cb31ff
