Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCE90592E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA5010E0D9;
	Wed, 12 Jun 2024 16:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iWwM8hPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653F810E0D9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:53:01 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-44056295c8cso13361571cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718211179; x=1718815979;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lDWDL+MI8dXm/cLOrE2UQ6kio+8e5ilRQYq2zx3sQc=;
 b=iWwM8hPtkgemuj4aYZMO/Lv34K5/BTqdUSghgGNQDHJqkmm0x6Jc/IcN4UbXrQpdVC
 ylLgJyZRGYrovTaXOz1Ae6A7HUrlKvGiwHS8pEvfg0TbhKOBkTTPRuh9lXrRXBAMlM0F
 RZwfNsEC9d08MikOKbUdCCJ6BsiY6lv3WGlGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718211179; x=1718815979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4lDWDL+MI8dXm/cLOrE2UQ6kio+8e5ilRQYq2zx3sQc=;
 b=MUxDbBUh1FRJcKCvE6nGUmPBf2MoloO86IY4h/e2CoyATMOiT4/Y2YtKwgr9o0iJix
 UhWpZpk/yzSTsFg4SAVKlQpWJ4Rbb2HH0Wahav9Uzy0ouLzmO7dZ20RxR/7BP/NfpSQk
 WQXAtpXKFNAvyzqgomzPDI1W8w5dX0kDisT3L6mX4ycikoojxb471kZcyYRc3dZ3l5I8
 gxoRGKG7FosCNq8TAabkEPdzTYz54cgeL9XiDmD/Qj73KqkXTE1bF7YtHCpIUdrekVtY
 b0WebdBGZsq65BmhLJkyr1Tit0EtvJmKqvB19rGUV3uqY0a8cHPWTdt5M9ad6PriXDoY
 rVAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWIT0FS5DGxW3wKvIwA3cffxwMPPeEdbjV3kN92/k1aIA1ZgxCZ226pBqD4Ua6y2ZbbVziUdKrxfp4IIOwfC37ImIZJRzBQrfAFYkekdet
X-Gm-Message-State: AOJu0Yz4ONHhhytikQ5esDKV3D2H5oVBYC4g44MVwna1StKTUZFap8gn
 pta1AoxQ1125VwoboGELTm1d4Bkx/TZ/cxBR2Om1G7U8OiFYXnAnLR+g2xBUsaSf4Z1tMhQhOOM
 =
X-Google-Smtp-Source: AGHT+IG0fMhHU72xax+k+7MM4vmKXhK/X4dZPskpcj2DF/0CWfrNHAJBH9f6mXj+Tqf9w2ajIKyJ5A==
X-Received: by 2002:a05:622a:492:b0:43e:3c64:d3ed with SMTP id
 d75a77b69052e-4415abf6278mr19139661cf.32.1718211179147; 
 Wed, 12 Jun 2024 09:52:59 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44116b8f334sm23529461cf.6.2024.06.12.09.52.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 09:52:58 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-44056f72257so7171cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:52:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXG6N7Dr/6LYASBgF2VcQVrAg+7YpPVGRe8UKThfnWKIpzeEm/mw59mR6zGtjgB6VmxWuUh8qI0AMQlPA3LWb04wbb6WCNEIaBBfukreRU6
X-Received: by 2002:a05:622a:580d:b0:43f:a8fe:d5c0 with SMTP id
 d75a77b69052e-4415a221a1bmr4461961cf.25.1718211177899; Wed, 12 Jun 2024
 09:52:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <20240612-garnet-condor-from-saturn-1c51bb@houat>
 <CAD=FV=Xpu0-_kEvRWy9w8ypjo7pF7tsFWxHfhMZ=YjHugTqG1w@mail.gmail.com>
 <Zmm6_27GikpmT3HQ@phenom.ffwll.local>
In-Reply-To: <Zmm6_27GikpmT3HQ@phenom.ffwll.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 09:52:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XpJtCU+8aSaT0e5Ob5Owcn8b0gcdZzUrQoSdE5f9CerA@mail.gmail.com>
Message-ID: <CAD=FV=XpJtCU+8aSaT0e5Ob5Owcn8b0gcdZzUrQoSdE5f9CerA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>
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

Sima,

On Wed, Jun 12, 2024 at 8:13=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> > > I ran the coccinelle script we started with, and here are the results=
:
> > >
> > > ./drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1640:25-39: ERROR: KMS driver v=
mw_pci_driver is missing shutdown implementation
> > > ./drivers/gpu/drm/kmb/kmb_drv.c:621:30-49: ERROR: KMS driver kmb_plat=
form_driver is missing shutdown implementation
> > > ./drivers/gpu/drm/tiny/arcpgu.c:422:30-52: ERROR: KMS driver arcpgu_p=
latform_driver is missing shutdown implementation
> >
> > Sure, although I think we agreed even back when we talked about this
> > last that your coccinelle script wasn't guaranteed to catch every
> > driver. ...so I guess the question is: are we willing to accept that
> > we'll stop disabling panels at shutdown for any drivers that might
> > were missed. For instance, looking at it by hand (which also could
> > miss things), I previously thought that we also might need:
> >
> > * nouveau
> > * tegra
> > * amdgpu
> > * sprd
> > * gma500
> > * radeon
> >
> > I sent patches for those drivers but they don't go through drm-misc
> > and some of the drivers had a lot of abstraction layers and were hard
> > to reason about. I'm also not 100% confident that all of those drivers
> > really are affected--they'd have to be used with panel-simple or
> > panel-edp...
>
> Aside from amdgpu and radeon they're all in -misc now, and Alex is
> generally fairly responsive.

Sorry for not keeping up with things, but can you point to where this
was documented or what patch changed things so that these drivers went
through drm-misc? From the MAINTAINERS file I see commit 5a44d50f0072
("MAINTAINERS: Update drm-misc entry to match all drivers") and that
shows several of these drivers as "X:". As far as I can tell that
means that they _aren't_ handled by drm-misc, right? Maybe the
decision was made elsewhere and MAINTAINERS was just not updated, or
I'm not looking at the right place? I checked drm-misc-next and
drm/next and, for instance, "tegra" and "kmb" still show as excluded.

-Doug
