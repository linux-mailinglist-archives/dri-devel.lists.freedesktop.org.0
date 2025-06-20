Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637EAE2115
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623B210EB9B;
	Fri, 20 Jun 2025 17:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H03gqolO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F5010E057
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 14:41:49 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-4067106dd56so1294267b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750430504; x=1751035304;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KT4DQcewRXgTOMNaBYIe1ub0iebCscNnZe8/5h5B18=;
 b=H03gqolO/xCfVU4mwWYlbRKtc96lgV+cp/5Dr8OevlgX1RZGGQ7DX62pQEzXxmkkNV
 8zQZNUpjPfLswkpWYnSXBHyxm4zLZZvEqAtP3lhGxOWy4lLsFbTV3erl0seFnxRRuc1X
 Z+GWP7us5DJFapav+4D64rb4Nlbt7q9hfJ//A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430504; x=1751035304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KT4DQcewRXgTOMNaBYIe1ub0iebCscNnZe8/5h5B18=;
 b=E6hi8GJCU+JRxG89ip9DWhQ3K9ea7TA/u4y/ajQtmkWnVz7Bi6nqMPz5e/b664mkdP
 xp+3tl4QvexZkRn1obqY6TOIlMv06ClFG3o+kH+RRCS0qwcu5B7qcj8v+xsS7rhLmJ4m
 n+NqIpmUqGVwZ6+h797usJabCxhLBmGetDIFVshig4w3SmhSn33Cug6VA3+lrrM9sb/3
 wTUBTkWWPYcvG68emqErYBF8ETejSqs4BplB4ZddSAd1/0w8rEYb5iODrhsRTz94MoD3
 JENsV8KgTKBnCYm4Oe5imS6bLMFiSYyc3GTumWHEJMenJtgCyKNMt6YpYEdj6U2U0Fs8
 6JJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnauveBhPqFDF13G9e1+t0+O6rfi3Dc4meSK+p/vV6tSb26BD6HASbybhcn1yIseQp+vvHSp9Inoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJLV3tGHdGZ5/yNHZZtMa0CNADtZT08nSMXfqpXglmYV9jUXtN
 1hFvuvcX6irC3lCDMgJxb4av7V35tk7Aaa5e1XYN6yH41j1Asczmjqebk2unnhBANZjm0iXkAhp
 5Mcxw1Psd
X-Gm-Gg: ASbGncu96MLffIXq2oJEpJpA+s8V9WM4/rv2HnUmpsigJwklrDUOWHMn3eoktDIstDC
 NOvTZzmH7SixhC87BjJsKIkEX4XNyHAPfjPO9SeBbvE+guqI8jkDsaavNn/ygr4BI/r7w/JmMGt
 Rl9+Abfxhk5AxXEpX+bVZoBObVtjXr/THzVvhM88WuddoMNMPeMTdYmXWmd8c6cPEvoA3Cgl5Ai
 zMl6KytUstrY+F7hlwjwHcuO+VToCnS0Y0/8pFTa+ebbRth9zIsf8BEkeAJ/mhlXHxLX4tqAdoj
 gUVXaRM1zP7qR4D5wU/NdCDmQCzyzOEYevlCDgnFNBP9Rwynp12kPm33Q+bjqtOy32+JouyMWca
 z1qWevpTGapU7nXUXuQudMFUTJHWxyQ==
X-Google-Smtp-Source: AGHT+IE6+7s3GcCAb7U9uxJsfseqQtm/j6wps7tOXu/UCzgzuL9fOXRUt4phcOBv9s4iVZvhUKQQ3Q==
X-Received: by 2002:a05:6808:2288:b0:405:6b13:ca55 with SMTP id
 5614622812f47-40ac7147f8fmr2247978b6e.37.1750430504219; 
 Fri, 20 Jun 2025 07:41:44 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
 [209.85.167.177]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40ac6c30ab2sm316683b6e.12.2025.06.20.07.41.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 07:41:43 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-408e0986303so1298842b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 07:41:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFCZ4WV5BBHw7SmxbfVGDeGOYVuVw9EmxVBUK4nk2Y/rNZPBcXUv7tAUwyJk1WUTlsPVp+uJ3usZo=@lists.freedesktop.org
X-Received: by 2002:a05:6871:4195:b0:2e9:9e9:d94b with SMTP id
 586e51a60fabf-2ef0094c0cbmr2001638fac.39.1750430501165; Fri, 20 Jun 2025
 07:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-29-jim.cromie@gmail.com>
In-Reply-To: <20250402174156.1246171-29-jim.cromie@gmail.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 20 Jun 2025 10:41:03 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
X-Gm-Features: Ac12FXysVBlI9m3EGLlNcwPGQBWhWDrHdfE7f5KsOCiBBCH_bJGVrs_uGmTAM7k
Message-ID: <CAOw6vbJwbvcVARNmx3O7mTbOr+A_Vo_DaUXFfN8HFFLqdG-VPQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/54] dyndbg: restore classmap protection when theres
 a controlling_param
To: Jim Cromie <jim.cromie@gmail.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 20 Jun 2025 17:39:34 +0000
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

On Thu, Apr 3, 2025 at 9:48=E2=80=AFAM Jim Cromie <jim.cromie@gmail.com> wr=
ote:
>

\snip

>
> -static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> -                                     const struct _ddebug_class_map *map=
,
> -                                     const char *mod_name)
> +static struct _ddebug_class_param *
> +ddebug_get_classmap_kparam(const struct kernel_param *kp,
> +                          const struct _ddebug_class_map *map)
>  {
>         struct _ddebug_class_param *dcp;
>
>         if (kp->ops !=3D &param_ops_dyndbg_classes)
> -               return;
> +               return false;

Return type is struct _ddebug_class_param *, should this be NULL?

>
>         dcp =3D (struct _ddebug_class_param *)kp->arg;
>
> -       if (map =3D=3D dcp->map) {
> +       return (map =3D=3D dcp->map)
> +               ? dcp : (struct _ddebug_class_param *)NULL;
> +}
> +
> +static void ddebug_match_apply_kparam(const struct kernel_param *kp,
> +                                     struct _ddebug_class_map *map,
> +                                     const char *mod_name)
> +{
> +       struct _ddebug_class_param *dcp =3D ddebug_get_classmap_kparam(kp=
, map);
> +
> +       if (dcp) {
> +               map->controlling_param =3D dcp;
>                 v2pr_info(" kp:%s.%s =3D0x%lx", mod_name, kp->name, *dcp-=
>bits);
>                 vpr_cm_info(map, " %s mapped to: ", mod_name);
>                 ddebug_sync_classbits(kp, mod_name);
>         }
>  }
>
> -static void ddebug_apply_params(const struct _ddebug_class_map *cm, cons=
t char *mod_name)
> +static void ddebug_apply_params(struct _ddebug_class_map *cm, const char=
 *mod_name)
>  {
>         const struct kernel_param *kp;
>  #if IS_ENABLED(CONFIG_MODULES)
> @@ -1266,6 +1288,13 @@ static void ddebug_apply_params(const struct _ddeb=
ug_class_map *cm, const char *
>         }
>  }
>
> +/*
> + * called from add_module, ie early. it can find controlling kparams,
> + * which can/does? enable protection of this classmap from class-less
> + * queries, on the grounds that the user created the kparam, means to
> + * use it, and expects it to reflect reality.  We should oblige him,
> + * and protect those classmaps from classless "-p" changes.
> + */
>  static void ddebug_apply_class_maps(const struct _ddebug_info *di)
>  {
>         struct _ddebug_class_map *cm;
> --
> 2.49.0
>
