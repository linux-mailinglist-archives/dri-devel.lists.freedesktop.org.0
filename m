Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B02945425D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 09:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63D96E28B;
	Wed, 17 Nov 2021 08:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF966E520
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 07:09:25 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id m6so4442646oim.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 23:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PKkjBtfXmGvYx71adhKDp5z6SMymKY7B09hbg7CkGOg=;
 b=VaZCMEmfHN2MiV7FWt+ivJAcDEjOELXS2NhC3SEkrlxEG6rpRM+IdTbkgPnQPFA2fc
 5r+RmNwh87L/qCmjA3jf+b71h/b57Ze4TX2nc5kh6B3HqSW8JsixiLZkNYMvmGNjMWso
 DL65nuCuy2GQ+iYCLBcwxZvGDZk8zuiJ6/6cCXx2BcPLbjexNEDm0Q3qpuIhzifygHlM
 Fs2NWtvQZxNHfLdgYUMexZG4+anESjYUXdxMjkMeelwRBSvYo1e23/fEiW3TaytqF78G
 c5WrZZE8qh42/E/XSWW1JL1H0zD+XzpnmWwTzTmEi9/30D6F6gUg+gHbsMc6G1+K5hNn
 9r3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PKkjBtfXmGvYx71adhKDp5z6SMymKY7B09hbg7CkGOg=;
 b=gDduPFaYY9XXHg4W2PBcArVsjWbV1KzeH75rzg86vQapQytg6HhUNeH2+1OtF8cfaY
 0INlOpDLY0dDVi3eTFTSBRjFgPDRA567DH9ILrBPEVqj6iqgnNy8qjdjCyeoBELm++w+
 IQdNYC6GzaCecKud/qOgKAiiHCKNvUxZ9YXPdq0TRkaYAHXvraoGBa0u+mQ4I+6+1H0O
 ejRjjOdFyZOqSS1kMlKAE4zh6baChbbrPCfnp+MhSmy3TDpmiYJTGucy53rH0OjIhtnP
 +RluFgwoEiTkI5T2drIF4amjSjPrquBl4G5uHKzub86KnlVikRklwpQwYcwZl8mT7JDP
 pVoA==
X-Gm-Message-State: AOAM532PMWyF/B2F8jo3OrBiB/ZrjdE0bIvtOUnp7MfE1TMsJWMAURt6
 vS+MxlIp+O9CY1i86cBsaqfppl8jrBJcIX7rManwBA==
X-Google-Smtp-Source: ABdhPJwcpGQA3F4om9GzlzDTNvLCRka2ul3O7LMOoQhNKE5VZAOiI0mToxMBi5si4bkIzPgWxC9MNn0fPZGp0gG+pj8=
X-Received: by 2002:aca:3bd4:: with SMTP id i203mr57385261oia.69.1637132964720; 
 Tue, 16 Nov 2021 23:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20211115113105.103275-1-maxime@cerno.tech>
In-Reply-To: <20211115113105.103275-1-maxime@cerno.tech>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Wed, 17 Nov 2021 15:08:31 +0800
Message-ID: <CAPpJ_eezZHUwbbq1r18jSgBrKa4L9dPcohQsCFBV10fD-TpcbA@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/vc4: kms: Misc fixes for HVS commits
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 17 Nov 2021 08:08:06 +0000
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8815=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: Conver=
t to
> atomic helpers") introduced a number of issues in corner cases, most of t=
hem
> showing themselves in the form of either a vblank timeout or use-after-fr=
ee
> error.
>
> These patches should fix most of them, some of them still being debugged.
>
> Maxime
>
> Maxime Ripard (6):
>   drm/vc4: kms: Wait for the commit before increasing our clock rate
>   drm/vc4: kms: Fix return code check
>   drm/vc4: kms: Add missing drm_crtc_commit_put
>   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
>   drm/vc4: kms: Don't duplicate pending commit
>   drm/vc4: kms: Fix previous HVS commit wait
>
>  drivers/gpu/drm/vc4/vc4_kms.c | 36 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
>
> --
> 2.33.1
>

Thanks to Maxime's information!

I tried to applied this patch series based on the latest mainline
kernel at commit commit 8ab774587903 ("Merge tag 'trace-v5.16-5' of
git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace"),
which almost equals "tags/v5.16-rc1" and tested it on RPi 4B.
However, the system hangs and becomes dead at the kernel message:

[drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0

The full dmesg can be found at
https://bugzilla.kernel.org/attachment.cgi?id=3D299603

If I revert the patch series to the original mainline kernel, system
can boot up.

BR,
Jian-Hong Pan
