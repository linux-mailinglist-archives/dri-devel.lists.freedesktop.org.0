Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0670924B89
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 00:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2735510E6F3;
	Tue,  2 Jul 2024 22:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+E/GD+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2333B10E6F3;
 Tue,  2 Jul 2024 22:21:45 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-36743a79dceso16104f8f.0; 
 Tue, 02 Jul 2024 15:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719958903; x=1720563703; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9vgcK/xm02vctzIF3h5toINdya3dR3yqrhsTftG73M=;
 b=c+E/GD+mFJ75z//SLW62/OfRfabppruYTnNyfY6WoR52OdR5sHg4goDbZs/mGSO9C8
 E6WfXy+tWjFBS6t/FFTZa2U3SVOjvhuQlxJKTbvoLapsN6/32T87SUhkHJBr+N8wXr+X
 MQIxCq8xn+jRlj3JY2dhewc3nHa75mMK5nZMBOahhS0m1VPHm5oZXjTrod7daZB9vy/U
 C4+z2VLpzPPQ/k4R8ikrsEMj55WDiOOzdZlyWr7V73pgOpr0DBLD/B8v2KrBg3Z3V5iH
 J8dWCnouUHbrPVzh/blx6KBFpaOwgiXo6HMUrqAdy9TSI7xs9rb86WupkRduU33ft0Zl
 ONEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719958903; x=1720563703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v9vgcK/xm02vctzIF3h5toINdya3dR3yqrhsTftG73M=;
 b=aGlFGyzrBASufhSZxoJQbBdhhxl6PGIt0UPVTEUs51IidIUOvK9cUHAGCJZwi9jj6w
 FP0Cw1XAMKkfP3jFaK4ROwWweCxoYyIaennX1H9qTwbeN0Qz30XfWtNpwnCFgchcbCxi
 yhgOjBK6SOyV/39kKU/yq0/6HP+ct//V3s0ESJns5ta0dtrYeaZjBmf+37Zp/3NzOlzB
 Jl9PwRF/o4l9aSEr20psBmHF0kr5BJucG81/sLh1VpjnETFMeOA/Dq2ii9HgMo7etyEa
 YnoNQmacrj/fxbdtSwN/0tstzA1H7utAPqLFO0v9AQbhIme4H12n0LrcyG+EPwUNq24l
 lFzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/arMI8Mvg6bSjb1MfZnFXuYibfHcjJDIfTkFHSP7i+vy/oYQ4AqJl5ocpvYDMHORIP69ERGZ7wfiq4pecxFpxpOIhNn/CnJidZDS1PYOnW1aJKHvtf7zuF4sgjur3KHVWz5hW7B6OqQqrBVaZUPrW9yxGSLNLvtabk5TfwCM13M4F0DiTeA4HLKxhHdUCQ4gZ3FNKjQZP53pmyrTUbRZvdWn77qVzqP0jgOcVyO4j8OSKCjk=
X-Gm-Message-State: AOJu0YxfQ2kz1INjvKSTetp1wiAeNSu0C7TbFXaU71d1vRMziSIvqaQZ
 9qh215rD9nxBiRX0+jWLh1gKNz0EaS9HK1uMaBD19GXnvKrGfPNY1j/Mij7mlMxxIxVjjxUqO6a
 B+gG14yb27iP/61e5p3D+e12zaBk=
X-Google-Smtp-Source: AGHT+IE6KI59FdH94mNz6QCT52qCK9nMcKkJLsqY5hrpIbquZ+qloFhsu/enL/iF4DqZaK14tDnn5QmgUZnTWqnbHfI=
X-Received: by 2002:adf:e25c:0:b0:367:8e52:3bb9 with SMTP id
 ffacd0b85a97d-3678e523de3mr1706933f8f.22.1719958903156; Tue, 02 Jul 2024
 15:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-33-jim.cromie@gmail.com>
In-Reply-To: <20240702215804.2201271-33-jim.cromie@gmail.com>
From: jim.cromie@gmail.com
Date: Tue, 2 Jul 2024 16:21:15 -0600
Message-ID: <CAJfuBxyuwpkWQpqoncHXOx5v_naAnxW1BUyHzon6PXiPCRrSSg@mail.gmail.com>
Subject: Re: [PATCH v9 32/53] DRM-CLASSMAP-USE in drm-drv.c
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, 
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com, 
 mcgrof@kernel.org
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

On Tue, Jul 2, 2024 at 3:58=E2=80=AFPM Jim Cromie <jim.cromie@gmail.com> wr=
ote:
>
> ---
>  drivers/gpu/drm/drm_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..f511d40f577a 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
>  static DEFINE_SPINLOCK(drm_minor_lock);
>  static struct idr drm_minors_idr;
>
> +/* single ref for all clients ? */

So this was my attempt to try a single USE
from the client-side of drm core / driver interface.

I didnt find it to work, and meant to rebase it away.


> +DRM_CLASSMAP_USE(drm_debug_classes);
> +
>  /*
>   * If the drm core fails to init for whatever reason,
>   * we should prevent any drivers from registering with it.
> --
> 2.45.2
>
