Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F890591B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 18:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABECF10E5AB;
	Wed, 12 Jun 2024 16:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o0A/j+hv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6916A10E5AB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 16:47:23 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52bc121fb1eso137194e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 09:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718210841; x=1718815641; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyKQtIaovCsyWP0csv+18LsQLrk2+qXO3sWeddnPol0=;
 b=o0A/j+hvB7O+rnna0a4lnuC/Q02oeuT3b+fgRAK6lAmqE8oO2eZFgkilX2SoVFp3R0
 eLSX4DLHd4pFVCpU/j1Rbea5sNenB1rdamNdAraKWnt5z0JLfEDJAm0en09bzMQPmx0d
 SWc6Fo3kIgHBRcaNX6rfYn61xZs/12hscMsGBiRiSmuQpWlbkghaTn1achoc3SiJX0ZC
 m7dPvY/ZEGPyoEsNU1TVkoZjP4eZAcGHFIBq5WJa1IKuROXSDT9JYRS/PLvQaKBkqQ/K
 jPJTDdp4emU4i4xXyPqyn4gN68Rx12l0SLI0H0Xs0y1G4FSZHf8uVcG+T56SwelZYg9l
 FyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718210841; x=1718815641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hyKQtIaovCsyWP0csv+18LsQLrk2+qXO3sWeddnPol0=;
 b=ZCrFlfLRCFRGDclUK0ni8kOuAvoxSt2NbFWZNydz2HuVKUrT3DJikoBnbNOGtiPY+1
 S2upi+6JLOX4X1lIuJF9vfkpKxmExobrAu0Kw9ii2Koq4eSBnGdQBKOeQEBA4+oNNyuu
 UsDCglgtLsJHx1XhtR/BOHlUOi7HzXugBt/aG4iiOLn36T2UV0ToFo7joXim1MaogIjb
 fVKnXcgUw+Ny5Zu2jeW+uZW4f3d6X3wB4DitOz++b/aBuTqYxZq3dr86K8qRGwBa4/W3
 F+/ucTe6hcMu4TRu9L1R2IHr7lHJJs9U0KbA6elq+O9EMpyD0K+2iBeVQh6W/BWFEI6r
 KG8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdOFPiBrv6X242braoG0HUwWbCc5SR3SuIVwJ0PI/MhKAtMaMGeBlBXhdm5Bb/5EbFepxIp7KK8NLcOQrEuOuUpWmNdggZfmxPgIDWi6Aj
X-Gm-Message-State: AOJu0YwH3gUPwjFF9B5U5R0nAVp3d26yaVoleo3KIm8pIoPoLpJbUwfK
 AOqvAWTX7RDC39N5JIiTMZVBLuOFwa8KsiGSa2He9eCH799LV/FEa/YpKHy70dyhfYhDmJcuNZn
 FHX+4jPH+U4YXerzeLl3rpLQtIGHoTzUFRvvsuw==
X-Google-Smtp-Source: AGHT+IHMP8dO9EgYj2+c10cSwpzq5LekVKeJ/dr2+gpREr1d4TFmdi9vMnJ3hrKJcJk2Qa5Pqef401wHss6CfxSsILk=
X-Received: by 2002:a19:431c:0:b0:52c:845e:3194 with SMTP id
 2adb3069b0e04-52c9a3d8b80mr1283565e87.29.1718210841311; Wed, 12 Jun 2024
 09:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
In-Reply-To: <Zmm6i6iQOdP613w3@phenom.ffwll.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Jun 2024 18:47:10 +0200
Message-ID: <CACRpkdbb5OdizDLSRW3bFEJJhrQ7Fs8Pb=Q2yxBog62Z1m-bOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>
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

On Wed, Jun 12, 2024 at 5:11=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> On Wed, Jun 12, 2024 at 07:49:31AM -0700, Doug Anderson wrote:
(...)
> > The problem is that the ordering is wrong, I think. Even if the OS was
> > calling driver shutdown functions in the perfect order (which I'm not
> > convinced about since panels aren't always child "struct device"s of
> > the DRM device), the OS should be calling panel shutdown _before_
> > shutting down the DRM device. That means that with your suggestion:
> >
> > 1. Shutdown starts and panel is on.
> >
> > 2. OS calls panel shutdown call, which prints warnings because panel
> > is still on.
> >
> > 3. OS calls DRM driver shutdown call, which prints warnings because
> > someone else turned the panel off.
>
> Uh, that's a _much_ more fundamental issue.
>
> The fix for that is telling the driver core about this dependency with
> device_link_add. Unfortuantely, despite years of me trying to push for
> this, drm_bridge and drm_panel still don't automatically add these,
> because the situation is a really complex mess.
>
> Probably need to read dri-devel archives for all the past attempts around
> device_link_add.

I think involving Saravana Kannan in the discussions around this
is the right thing to do, because he knows how to get devicelinks
to do the right thing.

If we can describe what devicelink needs to do to get this ordering
right, I'm pretty sure Saravana can tell us how to do it.

Yours,
Linus Walleij
