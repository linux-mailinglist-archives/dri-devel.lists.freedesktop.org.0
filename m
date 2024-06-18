Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8190E02A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0110E15C;
	Tue, 18 Jun 2024 23:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Z+okklMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC1E10E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 23:49:43 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6b08d661dbaso2893246d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718754580; x=1719359380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IEd8QmB1691hBRAZvofFeg0dEh0DbqURELeqCZwHCv4=;
 b=Z+okklMiAybYkB8L5EIkl1EyPOLGYJ4ez5Et8Uep8JRGhUMfTHBXiLfJI6Cdpi1bsB
 AGEe39rFQPboYft1uJK4Js6t5VcVhD4Dg51lFuzLL99tZIxnd6xWoBn/TUcf+MrDpUpl
 3uOpvXk7ztZzPN2KknfxqkPdVguVONZox/07Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718754580; x=1719359380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IEd8QmB1691hBRAZvofFeg0dEh0DbqURELeqCZwHCv4=;
 b=hiMabPvUWg+AaPOOeluhPBr/Nss3ZLrvNiDojT+rJUO7EtyY6TX8NSROSW1Uiy0DQf
 nCmovj3+j3plpLMm29HXVkSYxPMN/n6dkssHZzKtqamzQQlsMXSijFITtwDBg1n8iWUz
 uzBz3KzvFPJRylSBXSYPnrjBQvg7PD5FAJ7uIex6iESu00xD4iVe5OCDYJYtOJ/64FCy
 cfxLLcxboIuW/ilkzQWmgIqznGQk6RR7EDgwCAljGL36YLvvjy3TmSD/oAjJHDW4Wir+
 BjyHOvZxlhKZNXSa0NEOWp4S7LoRf2ADUwrJDPJNgIMDcOPpw+ldmfGsPZO3XfpNpKHn
 +nEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP4/p3bZOznF1t5Es43GoQai0iSjCJDtFvTygBq3Ww3XpzhbbYIMFzq5+U/fixr36pfk9eFXwHROIvJGsRLmHhkZuZRWbkT2tjYgSgnLtf
X-Gm-Message-State: AOJu0YxWNBqqCSgwoSwScNQYAq3dYddOd1FUgBjhkKwxeh5/6H52uI6Q
 rz4XF4Lb0jpAKLylq5NCiZkuIkWQcyVQuJ8PWpKAJ9t1efNC8G6EjOaCe7lJOEZ6tz5RGncVcd4
 =
X-Google-Smtp-Source: AGHT+IGhBZW++z90meqkKKmSKraDcT+FRXNiHwfON+b5mVQQYFelmvaObCiwF6ecn/qsbrT1O1RK+A==
X-Received: by 2002:a05:6214:f2c:b0:6ad:84aa:2956 with SMTP id
 6a1803df08f44-6b2e230dd8cmr71619376d6.13.1718754579666; 
 Tue, 18 Jun 2024 16:49:39 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5ec6754sm71721176d6.78.2024.06.18.16.49.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 16:49:38 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4405dffca81so47661cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 16:49:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW63eX2fz/iw4nYcUTWi/MMGj0E6UwY/UGv47LB0nds90M5p4TSwocXMlevxhj2bWuuK9iJqXvKtpOxX7Y2NZsBSqWAjzTy2KYfnwFko3b7
X-Received: by 2002:a05:622a:144c:b0:444:9e8d:d82a with SMTP id
 d75a77b69052e-444aa3b5877mr664281cf.3.1718754577989; Tue, 18 Jun 2024
 16:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
 <CAD=FV=WBVfBZrgGay=XY2Usq3FA3m9i6y0cU4=b=w7qO6gRBFQ@mail.gmail.com>
 <ZnBFgDO37xhMfvzV@phenom.ffwll.local>
In-Reply-To: <ZnBFgDO37xhMfvzV@phenom.ffwll.local>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 16:49:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UindNjK4rWMvsMybgp_bPULbNz2A-u8x60MD4scrnHSQ@mail.gmail.com>
Message-ID: <CAD=FV=UindNjK4rWMvsMybgp_bPULbNz2A-u8x60MD4scrnHSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>,
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

Hi,

On Mon, Jun 17, 2024 at 7:17=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> > That all being said, I'm also totally OK with any of the following:
> >
> > 1. Dropping my patch and just accepting that we will have warnings
> > printed out for all DRM drivers that do things correctly and have no
> > warnings for broken DRM drivers.
>
> Can't we just flip the warnings around? Like make the hacky cleanup
> conditional on the panel not yet being disabled/cleaned up, and complain
> in that case only. With that:
> - drivers which call shutdown shouldn't get a warning anymore, and also
>   not a surplus call to drm_panel_disable/unprepare
> - drivers which are broken still get the cleanup calls
> - downside: we can't enforce this, because it's not yet enforced through
>   device_link ordering

I feel like something is getting lost in the discussion here. I'm just
not sure where to put the hacky cleanup without either having a list
like I have or fixing the device link problem so that the DRM device
shutdown gets called before the panel. Specifically, right now I think
it's possible for the panel's shutdown() callback to happen before the
DRM Device's shutdown(). Thus, we have:

1. Panel shutdown() checks and says "it's not shutdown yet so do my
hacky cleanup."
2. DRM device shutdown() gets called and tries to cleanup again.

...and thus in step #1 we can't detect a broken DRM device. What am I missi=
ng?


> > 2. Someone else posting / landing a patch to remove the hacky "disable
> > / unprepare" for panel-simple and panel-edp and asserting that they
> > don't care if they break any DRM drivers that are still broken. I
> > don't want to be involved in authoring or landing this patch, but I
> > won't scream loudly if others want to do it.
> >
> > 3. Someone else taking over trying to solve this problem.
> >
> > ...mostly this work is janitorial and I'm trying to help move the DRM
> > framework forward and get rid of cruft, so if it's going to cause too
> > much conflict I'm fine just stepping back.
>
> My issue is that you're trading an ugly warning that hurts maintenance
> with an explicit list of working drivers, which also hurts maintenance.
> Does seem like forward progress to me, just pushing the issue around.

IMO it at least moves things forward. If we make the warning obvious
enough then I think we could assert that, within a few kernel
versions, everyone who hit the warning would have addressed it. Once
that happens we can fully get rid of the ugly list and just make the
assumption that things are good. That feels like a clear path to me...

-Doug
