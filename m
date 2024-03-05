Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A9487226F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 16:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FB310E3B9;
	Tue,  5 Mar 2024 15:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CJ3f4NNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E1310E3A6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 15:11:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d29111272eso11877771fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 07:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709651499; x=1710256299;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84LkDv06K33n3G3o4gtYpn3S0vp2EuTqtzFXgoP48sQ=;
 b=CJ3f4NNaOS7ZmI5f4NJ0wboHzqPiVaRtw3VsMincq+dwarfmJ0CIPD3RBTP4bcge/6
 hW5eBd382Ps9UO0Y9GC7PQDUKFzrkMgXS1XTl+ac8+xllmaJ7waXbq8OjsRrs7tBijgW
 B8DH1fjJ2s88FkFVWhh24M4bSQ3Cq0OJw2N1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709651499; x=1710256299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=84LkDv06K33n3G3o4gtYpn3S0vp2EuTqtzFXgoP48sQ=;
 b=o1D6q7D1xzdUr/SO3awGzr5+SSG12n4j43a85bKCR6Qu29L5TkXm/MAedRnllCcBK+
 CmqpBnzBsSaEiUXW4khXT85fnn3fdMNMoe5U9zxezGeoxDKGoyt5QmjGunRJUbsbwimA
 YZLQthAXWEePv2NA050tDY3vI/ffZT293Uuek+59Hu0Phr+jj3JoX+tj0uoHop5YRzjd
 x6KsClXSL+2pkCT3gM1BNKjWkpC0eYzR1AAiRlSZs48t91YbWu/TQ+ycpmHjCBlaTXxh
 FHqQrle8R+IXlZnLx6/rW3xtl9Txh9PR/ar5a93lCJiNze2WEmGx26Mc4koed/+R3R/Q
 6VdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3lIneUp5Oe3KeB1m4KjWj64KNcYJUcZA6uNYH/bHvmla6Aclyvyf9vI9rVShyhNYYsZfmprP9qCXqC9C/0RQfCRG+jvAARokd1y0a4Y/p
X-Gm-Message-State: AOJu0Yy5ggYTxXLh2QN7hi4kHgUURriOWRdH2WauOl9Q2dJKs9fGUTgz
 vNRrslNs0kjZBm2kmjgQo05TcADxKef6wlOHGXbBOkhZtKNhB6iKGiBTEvHYFl0jyJtArCZdQco
 KoTOWS94Sd6enO0k2LouBezNlhaNQZshXnyZesA==
X-Google-Smtp-Source: AGHT+IFEDUqr9Kcah0GjYHa45/5/3L5wMvi1VCtvlGgPmZ28925Vx7jVCHuTaux8y/goPGB8kFFaODczz73wpOOkDzs=
X-Received: by 2002:a2e:90d7:0:b0:2d2:3fac:5fdc with SMTP id
 o23-20020a2e90d7000000b002d23fac5fdcmr1696178ljg.10.1709651499225; Tue, 05
 Mar 2024 07:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20230328170752.1102347-1-jagan@amarulasolutions.com>
 <170965031121.1013265.9438556735428022839.b4-ty@kernel.org>
In-Reply-To: <170965031121.1013265.9438556735428022839.b4-ty@kernel.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 5 Mar 2024 16:11:28 +0100
Message-ID: <CAOf5uwmyn=1QmCsPf_7EYjMVeo3aAOjhA3W0mnRLeknTsoFmrw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: Fix improper bridge init order with
 pre_enable_prev_first
To: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 linux-amarula <linux-amarula@amarulasolutions.com>
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

Hi Robert

On Tue, Mar 5, 2024 at 3:54=E2=80=AFPM Robert Foss <rfoss@kernel.org> wrote=
:
>
> On Tue, 28 Mar 2023 22:37:51 +0530, Jagan Teki wrote:
> > For a given bridge pipeline if any bridge sets pre_enable_prev_first
> > flag then the pre_enable for the previous bridge will be called before
> > pre_enable of this bridge and opposite is done for post_disable.
> >
> > These are the potential bridge flags to alter bridge init order in orde=
r
> > to satisfy the MIPI DSI host and downstream panel or bridge to function=
.
> > However the existing pre_enable_prev_first logic with associated bridge
> > ordering has broken for both pre_enable and post_disable calls.
> >
> > [...]
>
> Please excuse the delay, patches touching the core bridge code are a litt=
le
> bit tougher to merge due to increased risks of breaking unrelated things.
>
> Applied, thanks!
>

I have a question about this prev_first flag. Can we map the order in
the connector
in dts?

Michael

> [1/2] drm/bridge: Fix improper bridge init order with pre_enable_prev_fir=
st
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3De18aeeda0b69
> [2/2] drm/bridge: Document bridge init order with pre_enable_prev_first
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D113cc3ad8566
>
>
>
> Rob
>
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
