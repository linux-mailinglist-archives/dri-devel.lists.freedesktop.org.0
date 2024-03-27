Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A346288EDF3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 19:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA19010FF1D;
	Wed, 27 Mar 2024 18:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f8lVt7Q8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0A010FF1F;
 Wed, 27 Mar 2024 18:14:40 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-29df0ca87d1so130051a91.2; 
 Wed, 27 Mar 2024 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711563279; x=1712168079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+HAs8na8S1a+bn6lSS66HuiZEpVDV+PpxLmevXlW20=;
 b=f8lVt7Q8UybCdcyNZ3za6ZgGvjWrCPcqpuK0XhcLnj3zcnQa2P5y9czWNOqo6f/y7u
 wIHoLWmOkIoexKrWUMP2+vsH0mZd28zlP4L/dmuq6PqrnFMFjNypIltsSIcdOpQ4Bn3y
 8cJIQIGGXon0sggQzKiCtaNKYuIf0T7Vcu5eaR2rr8AbAVJhyjDTVjl+kCJP3frNyV53
 CrcQfx5EOxi1zwQwQFSFnZp5totupv/yuUdb/ugbtuIqlgihqkeEw4QWPL8cij6Mg7oD
 u2IEb/3jNlXiOWnxqFakpyGi5PKptR8/x9+q4guvZVw9MqpCe8UQ0IzCDUlO8Ez4AMJ+
 Nulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711563279; x=1712168079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+HAs8na8S1a+bn6lSS66HuiZEpVDV+PpxLmevXlW20=;
 b=CnvbtNkd5Z8XGt8rCnJzU1NG2m+Ywj5C+amRSvOip5kV+DkoFkcVn1Ly1qjT4yevQd
 UOTUqSTlFOlieOSlrYLfmg6Gd/w/A4Sfk/S5tUgd1zM8pjdAN0N9VvfHssMZcTyZoNO+
 OIBItiB5qS17J5/3LAuI6YLgSK7ECSet4B14uXsM4IBN0wdzWrWWVKDgENg/pluZ8Kue
 UBKW36M6s2PH/Ld9qugr/9ObgmB3/7VEkaapqAZUvsI26KV0vwT2wrwqhGrnSDngFXit
 57HvM3ekSi4loVMuhwgjsHyBqp9Qz43Kr1Pxl3LBHPCXMtj54AYxQYE/qOuiEfveQqPQ
 IaZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF1vzE5LB3enLDNFIWH4VfaJFELyrgo5atSl9vSUWXCXw2xNZA6OiF68rc88+rEgQ9Y0NSyA8DbHqSB1cOjIQwpSmKMCvCpcabDubMAzF6a/gs1v4Fz1QQGXGJsaMk6O4QtomngjkQ2+z8gpFsWpLcuXI=
X-Gm-Message-State: AOJu0YxtAOdzaHWofjf3Y/7A/p+MT96aMaUhjTxElOPZmZRw8iwyHTjR
 CJqo8QYkCmAt26lrxAl/a/ZVgaDgHwkA/t3e/PoOuzGMZW7wBSAxbAzCYXCjP0AgOfwm/d0orSz
 p5AknsOA0phY11KMeM4+JoCUq+io=
X-Google-Smtp-Source: AGHT+IHnSIlLulq0AsyDt/9ly+HaxaRItPV6nqivKIU7J2Nb3KNQ0NWtBnqlPPqPhd9pV7pygYtLClxUydXGZyW5r/Y=
X-Received: by 2002:a17:90a:65cc:b0:29b:9a08:6007 with SMTP id
 i12-20020a17090a65cc00b0029b9a086007mr394616pjs.46.1711563279395; Wed, 27 Mar
 2024 11:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240327175556.233126-1-ojeda@kernel.org>
In-Reply-To: <20240327175556.233126-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Mar 2024 19:14:12 +0100
Message-ID: <CANiq72=kGWSQR7TgKDnAaef+FS3VGQeo3ri5vv1wxpW_88vdqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/qxl: remove unused `count` variable from
 `qxl_surface_id_alloc()`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Alon Levy <alevy@redhat.com>, Frediano Ziglio <fziglio@redhat.com>,
 virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Tom Rix <trix@redhat.com>, Colin Ian King <colin.i.king@gmail.com>
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

On Wed, Mar 27, 2024 at 6:56=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Closes: https://lore.kernel.org/lkml/CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPz=
neSJHEnc3qApu2Q@mail.gmail.com/

Should have a [1] at the end.

> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Given there is a loop going on here, it would be good to double-check whe=
ther
> this variable was supposed to be used for something useful or if it was j=
ust a
> remnant of a version previous to v1.4.

Also, I see Nathan sent meanwhile a message about these two that were
also mentioned/reported a while ago [1].

On my side, I noticed these due to my loongarch64 defconfig
compile-test with Rust enabled yesterday [2], but I don't want to step
on Tom/Colin/Nathan/ClangBuiltLinux's work, so please feel free to do
with these patches as you will!

Thanks!

Cheers,
Miguel

[1] https://lore.kernel.org/all/20240327163331.GB1153323@dev-arch.thelio-39=
90X/
[2] https://lore.kernel.org/lkml/CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHE=
nc3qApu2Q@mail.gmail.com/
