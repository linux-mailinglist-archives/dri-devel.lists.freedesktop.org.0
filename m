Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7197FAC28
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2633E10E30C;
	Mon, 27 Nov 2023 21:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3903C10E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:02:57 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1fa289a35e7so1132584fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701118976; x=1701723776; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/URjZ8nADYYERle5yEbSZ8yEpn5y/9V4VSzkBZxEyA=;
 b=aprJPf5lAabrOZpeK9bxZp2Iro7wbiLgwxpd3gBy69cLu7dDowHvmFx1Qp377EK/0X
 4lEOQfG/eWgdvtrA8CX8zR9dKBWFsWVXgHO3cKZsxOKsNnJ4wf+sX3BY+7+ADbjMdUWy
 GgJm1idxWr9isi45oJv+mS5cf+0Fsp+tZTRnAfWWODxynyL7vHxf7SVAIcscDV/AoGlV
 VB365TNcIWKuvVBf7Y6A08cV9x843WqwCQYg5VLsNtpRF3HtNnkqQy1OzkuWnDBI7Igy
 UBLkUyLgNwyuiMXd8aA++bORZS2WZ8AlvC2q24zifkvQxOTA6qCAy0vCe22X0CQBVBND
 1ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701118976; x=1701723776;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/URjZ8nADYYERle5yEbSZ8yEpn5y/9V4VSzkBZxEyA=;
 b=XyYAKojJYYkgGjP9FaU4Dg3ivp0NnNZUj2S/rs6nU3NFn3pATZBoX2u+O9NzQUAfWB
 GL+KDIpRIfAi0kfuhVqVgjyu4lcYg/HT6GQ9r2EpX2D/8ubz/3H4iCibtfkPRNAFiyjK
 RJBuLJzGdn/iDlmat8HmsKvMvn3YAa6scnjHe/xQA0YDAuDQnAT9OTP+HiQcBsPqXueT
 /f61JZvWfqQGQ0eXC7uoZpUBKgUOilT4Z/EBS0eiYTNA8QrXo4PhVNnjkFIEqv9IdTF2
 KH/DAfxEqgDj4E9l2wiyaVwrS8k3f5CqN4GnJBMn1CI20yU4n/gzxEA01wC1hzpNnksP
 KChA==
X-Gm-Message-State: AOJu0YwXyW3esWKouyMIuuOQKKQ64Cf0LyfdYD/kxPaWnUDE+xZdDxua
 orWgQYixcjqxfgf8EyGmTPskH7Ox+oxFd99GrhY=
X-Google-Smtp-Source: AGHT+IHQhapSzKaJWN9AXlYSZ1KiLZ6SHYBMuIwFWgsyRpoLqjNDWWg/Ayr1LN6eJbSc36wevU+by4X07E5yovjRXf8=
X-Received: by 2002:a05:6871:d217:b0:1fa:cdd:c0fb with SMTP id
 pk23-20020a056871d21700b001fa0cddc0fbmr14400149oac.7.1701118976475; Mon, 27
 Nov 2023 13:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-3-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-3-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:02:45 -0500
Message-ID: <CADnq5_PwgV=SpuzdD==R-3nxz+Em4AiVmriODxyxZgoeZu7Yrw@mail.gmail.com>
Subject: Re: [PATCH 02/14] drm: Fix TODO list mentioning non-KMS drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, mripard@kernel.org,
 cai.huoqing@linux.dev, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Non-KMS drivers have been removed from DRM. Update the TODO list
> accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: a276afc19eec ("drm: Remove some obsolete drm pciids(tdfx, mga, i81=
0, savage, r128, sis, via)")
> Cc: Cai Huoqing <cai.huoqing@linux.dev>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.3+
> Cc: linux-doc@vger.kernel.org

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/todo.rst | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index b62c7fa0c2bcc..3bdb8787960be 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -337,8 +337,8 @@ connector register/unregister fixes
>
>  Level: Intermediate
>
> -Remove load/unload callbacks from all non-DRIVER_LEGACY drivers
> ----------------------------------------------------------------
> +Remove load/unload callbacks
> +----------------------------
>
>  The load/unload callbacks in struct &drm_driver are very much midlayers,=
 plus
>  for historical reasons they get the ordering wrong (and we can't fix tha=
t)
> @@ -347,8 +347,7 @@ between setting up the &drm_driver structure and call=
ing drm_dev_register().
>  - Rework drivers to no longer use the load/unload callbacks, directly co=
ding the
>    load/unload sequence into the driver's probe function.
>
> -- Once all non-DRIVER_LEGACY drivers are converted, disallow the load/un=
load
> -  callbacks for all modern drivers.
> +- Once all drivers are converted, remove the load/unload callbacks.
>
>  Contact: Daniel Vetter
>
> --
> 2.42.1
>
