Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D54554DD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 07:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FAE6EDA8;
	Thu, 18 Nov 2021 06:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613D6EDA8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 06:43:52 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so9238274otm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 22:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VvdfAtLwAasmHkSKe8YbSZ0PSJZUOvQxLTcLQj0dQBA=;
 b=jSk9Ae8tNyV457zc27+ZdGb/tlctMB/8zYyiy5f9X1VQNvIlC6x3GZtN10lKEC2e4R
 CbvldDG7P18W2xfYxU9edp6H/27s0odCgixH2UF+ayNw0ZmfXXFDfAyEXywteR7QUdnL
 dhquMVR4O0VOGGnrqhBMJ4ytJtSUe35rJWTbGy4F/tbfqJbK/WSlRc4pzMNDI7+D6ZWZ
 W4bF05dWZ/c1wTcNUvyOSUcEnV0f/dhs0I5jlxDEZWmB4hYwYD1oSXUxTsMTyeaOG8oM
 30wX7cIURL5qh0EP/wPYXMzwYNCdb/sUJLdmQ98FRt1rQfPkhZWYN4MGXPL5JHOhjqhV
 Sv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VvdfAtLwAasmHkSKe8YbSZ0PSJZUOvQxLTcLQj0dQBA=;
 b=U3lf8LNmXw5pTlv8zeoj0tn2er0bj+hdZ3cMqYUo+tvHO9UoVXvJW72VTJFfYM0wO3
 0JSCMT0AtucFegL+LDEiIkpb1g0QAu4nOY2YytajBa+B+IUvzwl9ulM/ltbepsGZzAUi
 vQyV4cZTOWkozg+JZ60yG259GPMYXNLK4l433HFkvRJic49mIbZtSwhisfr+KFCWdyFm
 zTZCAPMBpJEqkgJPUxhZS/TSokBnrQTYcxOaF7Khywx3ssCL656Pr6tN4+o3rjaH4xlA
 tAC7vg28aJEq5vbhrw6YynTb+p7agbbE3HGAbsux4o0XpwW+zaJRFNZktujD0zpdHZ8k
 uoyQ==
X-Gm-Message-State: AOAM532V1MQmuCBZw5Kiu86+fDFX+zSOOLjXwCn8T12OXdHEleecCwdx
 M/SXEDfNClQ00xLMHKmJgSQfiGFPQo6SRNa6mGjz6A==
X-Google-Smtp-Source: ABdhPJwKeELPHiW+wqvsu63mv+xFlFe3h44/sDx2MELbkXRvcjbDkTjV5/e+IzMHzHn3LAhZNKOPfPNrN1uLcBy0GzI=
X-Received: by 2002:a9d:71dc:: with SMTP id z28mr19652558otj.244.1637217831387; 
 Wed, 17 Nov 2021 22:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20211117094527.146275-1-maxime@cerno.tech>
In-Reply-To: <20211117094527.146275-1-maxime@cerno.tech>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Thu, 18 Nov 2021 14:42:58 +0800
Message-ID: <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] drm/vc4: kms: Misc fixes for HVS commits
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8817=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=BC=9A
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
> Changes from v1:
>   - Prevent a null pointer dereference
>
> Maxime Ripard (6):
>   drm/vc4: kms: Wait for the commit before increasing our clock rate
>   drm/vc4: kms: Fix return code check
>   drm/vc4: kms: Add missing drm_crtc_commit_put
>   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
>   drm/vc4: kms: Don't duplicate pending commit
>   drm/vc4: kms: Fix previous HVS commit wait
>
>  drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 23 deletions(-)

I tested the v2 patches based on latest mainline kernel with RPi 4B.
System can boot up into desktop environment.

Although it still hit the bug [1], which might be under debugging, I
think these patches LGTM.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D214991

Tested-by: Jian-Hong Pan <jhp@endlessos.org>
