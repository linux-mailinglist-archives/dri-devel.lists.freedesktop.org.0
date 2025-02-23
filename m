Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E0AA40E75
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 12:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6014C10E29A;
	Sun, 23 Feb 2025 11:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fz+LQnoP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C274210E297
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 11:45:01 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso2990511e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740311100; x=1740915900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtQLiUtxlY7jOBkqMlKxzFRYp9wU0OtHvKBwlhSt9RE=;
 b=Fz+LQnoPD2tB+bcMMA/F0a20w8TGwqXljmUxsYRsKjBdcyqDco66KlEGdH+a1DY7LW
 EEXkN19WKDrhvVAPQr4qFOXFGMuh31vZIDHiWuilgsnTmShMFLD90ijt/iR78Q19jEvv
 xHznbtCqjUVOKJ+lXeh882p2Qg/kdZnjlG3J99PSUQFoXMw9UvNAYbrK5R5M8tU91pZM
 CzVdP2tVWCCwe/57NQcWRMTqv3PmYng9AieZJZ84wm8tA/oIuNeXVcx+1ntuH6PU7Isp
 hzXRh658AOYbAVU016X4kZGT6whRC5qwLzvDnhLrch/5vCDWIwrrC5qCDTfVTcyXsHHJ
 r2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740311100; x=1740915900;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtQLiUtxlY7jOBkqMlKxzFRYp9wU0OtHvKBwlhSt9RE=;
 b=bRHwh3JomOJEA9oeVEfJnR8zPnkn2nDmIWkhpVEb4KqydgfebfDTApMsFPeLoukn24
 lrOzaaNElZLXanCmsccFdD6k7phlYRLKD7URLZ8AcTvlMgmd7TYWmfgCjrB3VX7Nf0jQ
 TlmALURVh8OmdJCsICqum5xFBJUPYWAL50k6ubkyw4mT0c9mAnFQx8ZhS2jWn3e0/dd4
 pJ35h6EFpOT2yKdN5ALWCXuqxzMoUv0t0lgweITiR257sCG8qIl+KCoNMnPMSfgHkaKb
 3ii0WD/5LzoyXJOt4/Nd+Pu5Mbt/a78ZZ4ItKMQaiKqAMkuvfQhldpPnOMjy8Y87M/ru
 nVqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUscvfBRegDs6DA8LSfwSMWY+aPW7+M/O4QRP1oSpngIEp1vhfjzHspVtICRyCjRoffDhcyTzjmRw4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWQ1gDkXNauRhTHeVxdJHpTFehPeQmBxxURLRQGZGFXY/lCHGE
 pefJPWd77i6rkaRs8TV3BZaIgoV0BMYGkZoeyjsOJUS3JC7h/+f+MB2rVAykzA1lablDlDagsWP
 mPnYz6Mic3OWVqOMXzV5s1Wf5WhA=
X-Gm-Gg: ASbGncs9Qn2GzGH6Oo0WH2SChy8CSMFmJIlNgLHwm7m0/tnEs0IXCxXFF6qodtPzgTu
 9mxSh3v9cE3ZcILDl+N1IB+CU8qS8ixF3nZrOcV7mBIxIiG5VaGtUMuLfSBXTd9yZsq3g9On69f
 piaEHIQxAsVVFOeHs/JT0Y+0lFvEvyHeqgINP3KHq+
X-Google-Smtp-Source: AGHT+IFXdyTaLGb71sdwhuFPbKFfl6zs87BcvN+nBv/3PAoR+eNgHv2zos0UpogzeCxvv45FfKaCGezUok3jmbH90U8=
X-Received: by 2002:a05:6512:3f05:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-54838edddd1mr3320418e87.10.1740311099559; Sun, 23 Feb 2025
 03:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20250207165325.3998-1-pranav.tyagi03@gmail.com>
 <Z6bKR9K16-oYMLFl@archie.me>
 <CAH4c4jKe7Q-E1LhA0KxOxEjK-gn=JY7e=2GN13X=yutaO8k3Pw@mail.gmail.com>
 <CAH4c4j+kOYMfzO5QOBg+hGe2zt4kN4f7v+mrri-2GMLzYtCPrw@mail.gmail.com>
 <Z7WOym9fl8GNPJiO@archie.me> <Z7XdkAKqlK2KJuq2@phenom.ffwll.local>
In-Reply-To: <Z7XdkAKqlK2KJuq2@phenom.ffwll.local>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Sun, 23 Feb 2025 17:14:48 +0530
X-Gm-Features: AWEUYZlGbGI477Musg_0U1Z8C_cUlMEZdld-9_O8sc0I-75qlnom3khRJkDC8B8
Message-ID: <CAH4c4jKhXn=EhoLJLYhD1jro_KM0TemNnVjokSFRR55oUVuPjA@mail.gmail.com>
Subject: Re: [PATCH] vgaarbiter: documentation grammar correction
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Pranav Tyagi <pranav.tyagi03@gmail.com>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
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

On Wed, Feb 19, 2025 at 7:03=E2=80=AFPM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> On Wed, Feb 19, 2025 at 02:56:58PM +0700, Bagas Sanjaya wrote:
> > On Thu, Feb 13, 2025 at 11:05:39PM +0530, Pranav Tyagi wrote:
> > > Hi,
> > >
> > > Just a gentle follow-up on this patch. It has been reviewed but hasn'=
t
> > > been applied yet.
> >
> > You may need to resend the patch, but with scripts/get_maintainer.pl
> > output Cc'ed so that DRM maintainers can be notified on the patch.
>
> I don't have the patch since it wasn't cc'ed to dri-devel. Can you please
> resend with r-b tag included?
>
> Thanks, Sima
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

Hi,

I have sent the patch again to you with the r-b tag included and cc'ed
it to dri-devel aswell.

Regards
Pranav Tyagi
