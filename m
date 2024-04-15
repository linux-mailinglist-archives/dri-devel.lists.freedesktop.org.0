Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1728A467F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 03:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA07510EBA6;
	Mon, 15 Apr 2024 01:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JgrATBTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59610E851;
 Mon, 15 Apr 2024 01:18:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so301100266b.3; 
 Sun, 14 Apr 2024 18:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713143903; x=1713748703; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwPGycLSrCh1dRJbd0yuomILaAkxQqTDIBktFZv8mM4=;
 b=JgrATBTaEoRM0QGPJOoqDrYu4hRRCXXWTWRW+j92dt/olQKp/fCBovv1fQwQw6YlF6
 TZ+93ic7dSmpairctlExTccEXMvpntKwhxGAxg6zChIIIjoUCjOUYDcxQp2L6t4oufDU
 ukzci1Umo/RYSGZ9W+Luw+uuTq0YM50O5qJILPSI0abzOQ5Uv5a3O/osvQFT6iuECc3Y
 i6DizmctDqiEbcj81QOxB4QeFoV9bBvr0aO/osua2Eha5qN8cXWgSogQqNjnZcobTb53
 sFvbG/5/yZpzSDIiNfO1wfqZy0j6Jg/be7a3lhNxZrC520TFfKiXE21BYSSo7Jik3nS9
 Dz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713143903; x=1713748703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwPGycLSrCh1dRJbd0yuomILaAkxQqTDIBktFZv8mM4=;
 b=NZ2pZCxswxECs6nQVLUKyTtey/7xCubVgxTyAR1Ttxcy3Vrd8DIwtOy6n0N6nDYTCO
 1bBYd0f5Ndzce+oNq4ekW4HpgwJtE/xA7K44lHKTqVFx9tFtZIuUueCjEa7YkBTECECH
 fJPBw+XGhFGRn+A7okr+pM5UVzkkplFsBFdyihxnVOsBiGPN73YZWc0Z7Vt4sEFO45hF
 m0UHNtdNdrdayer3CUqVTdy4m/7hlDaraH+KekCKLtaQvjfLiuKK8E4+ShAeq7ZbtiMw
 WcoVgtDFnZ1DoCmFAnro22dLtw0WjnuazSpCfAtYPmGtn77hSiVD79clg6HC2+ZHsOAQ
 Kl0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnYXQfISQLKMo1rYoBaA5qUvmaF7zXf3OIAv344OfiAbDb52LVTJJc1IOF07hFoZjjwMDPSnOhcYpaedyDX8ktk0w/5wll4uXlfDj8wb0NbCGX424McqVVEMU41r4SJPOmmCaSgvxEB1a6mw==
X-Gm-Message-State: AOJu0YykolGWfVDQFIBSFxez4tZ3B4jSAl9g3FrvhWdcE7PoiNTFgNXF
 Ivw5GuqIseT6mfkgTw8nzWzSMvRLHAOuN/6ld1PM2JmNJ4Mx+dayTVenVRVKHKV41pBH9qFPgRs
 1C0/UxaKRc+d2DllpzeKwlXEQ8JY=
X-Google-Smtp-Source: AGHT+IHSYyCetEUJiEW1j/Tp6AIPuwzOizG7KKp4K8LEV3KdbbxqyolRbz/9lI44q6B/TNAOTkx01pvz9uhuVimTrFE=
X-Received: by 2002:a17:906:6954:b0:a52:5774:69cc with SMTP id
 c20-20020a170906695400b00a52577469ccmr1807845ejs.46.1713143902925; Sun, 14
 Apr 2024 18:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240401224329.1228468-1-nunes.erico@gmail.com>
 <CAKGbVbuvX3qN-0LU9Sj4dWxCY3CoLnj+wcSKx2=D1-K0Qn8WpA@mail.gmail.com>
In-Reply-To: <CAKGbVbuvX3qN-0LU9Sj4dWxCY3CoLnj+wcSKx2=D1-K0Qn8WpA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 15 Apr 2024 09:18:11 +0800
Message-ID: <CAKGbVbuO89N0R4+XbTJ6Ns+ZFR24tGqg0vOM3vJu=Bi0=LcGAw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/lima: two driver cleanups
To: Erico Nunes <nunes.erico@gmail.com>
Cc: anarsoul@gmail.com, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
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

applied to drm-misc-next

On Thu, Apr 4, 2024 at 8:51=E2=80=AFPM Qiang Yu <yuq825@gmail.com> wrote:
>
> Serial is Reviewed-by: Qiang Yu <yuq825@gmail.com>
>
> On Tue, Apr 2, 2024 at 6:43=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
> wrote:
> >
> > Patch 1 is a fix for a crash which triggers on removing the module on
> > kernels with CONFIG_DEBUG_SHIRQ enabled, such as the Fedora kernel.
> >
> > Patch 2 is a fix to this warning:
> >   drivers/gpu/drm/lima/lima_drv.c:387:13: error: cast to smaller intege=
r
> >   type 'enum lima_gpu_id' from 'const void *'
> >   [-Werror,-Wvoid-pointer-to-enum-cast]
> > which we have received as a repeated report from the kernel test bot to
> > the lima mailing list.
> > The warning only reproduces with recent clang on aarch64, but the patch
> > does get rid of it and there seem to be no more warnings for W=3D1.
> >
> > Erico Nunes (2):
> >   drm/lima: fix shared irq handling on driver remove
> >   drm/lima: fix void pointer to enum lima_gpu_id cast warning
> >
> >  drivers/gpu/drm/lima/lima_drv.c | 21 ++++++++++++++++++---
> >  drivers/gpu/drm/lima/lima_drv.h |  5 +++++
> >  drivers/gpu/drm/lima/lima_gp.c  |  2 ++
> >  drivers/gpu/drm/lima/lima_mmu.c |  5 +++++
> >  drivers/gpu/drm/lima/lima_pp.c  |  4 ++++
> >  5 files changed, 34 insertions(+), 3 deletions(-)
> >
> > --
> > 2.44.0
> >
