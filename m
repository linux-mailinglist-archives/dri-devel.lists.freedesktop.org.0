Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224A5AE48A8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 17:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8865110E04C;
	Mon, 23 Jun 2025 15:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U4IZilFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2363610E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 15:31:08 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-234d3261631so29694835ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1750692667; x=1751297467;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WJGBSqCnUJA7irvO1PVoXNoRAeaWwjkEY7WkDOY6Li0=;
 b=U4IZilFUtIc2fRCq2JlqapvkGvAlXiyV7DPakOTCDNQo4mA0n/dDJ5V0/fKkhQ5P+W
 9uUl1GiAoYO/DDrOXH43bjD7roobOh96Lq1/94JhycMdsLP+WXfeez064n/8bdYzdnrj
 Rl9yes0YaX2v9x8jgsp//seDf9MrDek9H6zO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750692667; x=1751297467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WJGBSqCnUJA7irvO1PVoXNoRAeaWwjkEY7WkDOY6Li0=;
 b=Y2ktiLzBm8ICMvtBD0l3rf1v3LNLB84LOi9C5eG36tIJ0Blf+Sk+jNEYLg1+MSHbFg
 fSBtQ59UNcp/bHstUuYh2Q3Z157S2jWK+7JvhtxvRFi3rXgQenhuOWtB5sWybps07o9Z
 W+QgFDib42Z9/shzBMudqTbWG+ldS4kP0O4A5wUaxZr7UZHa23qFBX9TLflgMQ7vxZPy
 CBNZh4TiXZ7ZHmpn9QIPTCnNUKMB4i/7b0Ly1B9UbBmtXzm908ukWGdyWQtMSn0QL3JQ
 EQfcqBEqzRiQ0uoejXxhDK/9HAMEk79F9morH+zO7ja6dyCVknOBpqTCzHepdg/KFrKz
 8bFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpW/YyYIKo8NLhSLVqzT0qqNGeMxbV8mi8H9WuJpghWF4+WOxLD8G0nwja7QLr6W1qDeZ+aPM8N3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ+9t7Hjg8rm1cTDBJGiZyogMs49dPTPMLIZzE/Q2N8wotQ9kC
 XLh4XYa6JlGQf06aylJEcxyNayW86Ox44C+xcYGuldDBonT32OKxcWqZvNYXBTbGNA5Ko5W5fxf
 U9tM=
X-Gm-Gg: ASbGncsqrDfyzOYKx6Kh7slrUI0E9VW8qEyHJ7pGnt5zsLAjTsohWccBmDLOMOEZX6+
 pDvuNAJHPUrIXiQ3lPrV9N3GNIdVePC9FZd8Qs7/y6JDnYffp5/eaUTnn6xLYnpY8Svtvf1uxLm
 GeFEyiS8wEP94vmSfh+7+/Dx3eMAo0ic8PZrpRzK8GX94ANWqvQrwxeyUvata+xxGJfHgOM9vFf
 ujHJzsb853+Yjj1aAYSfvmCiSOD62NVRDgk9jUcf7TwhWZ3hTV976ZVI6zY9EjNuAuG6BWFeM7p
 GMSoZ9NDrKT28CWA9aofLAGI3TUr5t7v1fAJHZbR520vRCefVfjBOjwFLPQluNElUJdjVbN2RYc
 qRmMazraKK58Pj7yFJzqMlxkAfw==
X-Google-Smtp-Source: AGHT+IF7I9sw3Lls2wLk43EyorGCpL2xVzxwoAgtlp5qXJb8RK7eZ5FoQoya80N1+crDLk3ak+j/kA==
X-Received: by 2002:a17:903:1386:b0:237:ec18:eab9 with SMTP id
 d9443c01a7336-237ec18f0d5mr73289745ad.32.1750692666719; 
 Mon, 23 Jun 2025 08:31:06 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com.
 [209.85.216.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f11122ddsm7109656a12.0.2025.06.23.08.31.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 08:31:05 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3122368d7cfso2802411a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:31:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHtgzny1+5YFxhO/TWny1lqhvhGjvOc3AI+jFnrqlMiuM5R4Ykwcd8ZdoowyScc7E9A9Qvne8y2wk=@lists.freedesktop.org
X-Received: by 2002:a17:90a:fc48:b0:312:26d9:d5a7 with SMTP id
 98e67ed59e1d1-3159d8cf2ebmr18648459a91.20.1750692664352; Mon, 23 Jun 2025
 08:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250616093240.499094-1-j-choudhary@ti.com>
 <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
In-Reply-To: <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Jun 2025 08:30:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
X-Gm-Features: AX0GCFutWwxgHkQImeDKqwnVfYzG0u_tdBUlCpF-1CHh8gsLqYzh3utRxemN67s
Message-ID: <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
 tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
 ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
 linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
 geert@linux-m68k.org
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

Hi,

On Mon, Jun 16, 2025 at 9:24=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jun 16, 2025 at 2:32=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.=
com> wrote:
> >
> > @@ -1220,6 +1231,27 @@ static void ti_sn65dsi86_debugfs_init(struct drm=
_bridge *bridge, struct dentry *
> >         debugfs_create_file("status", 0600, debugfs, pdata, &status_fop=
s);
> >  }
> >
> > +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +       /*
> > +        * Device needs to be powered on before reading the HPD state
> > +        * for reliable hpd detection in ti_sn_bridge_detect() due to
> > +        * the high debounce time.
> > +        */
> > +
> > +       pm_runtime_get_sync(pdata->dev);
> > +}
> > +
> > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +       pm_runtime_mark_last_busy(pdata->dev);
> > +       pm_runtime_put_autosuspend(pdata->dev);
>
> nit: you don't need the pm_runtime_mark_last_busy() here, do you? Just
> call pm_runtime_put_autosuspend().
>
> Aside from the nit, this looks reasonable to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

What's the plan here? I can just remove the
`pm_runtime_mark_last_busy()` and land it if people are on board with
that (and if it works fine for Jayesh). If Jayesh wants to post a v6
to make it more legit, I can land that. I probably won't land anything
myself past Wednesday (California time) since I'm about to go offline
for 2 weeks and wouldn't want to land and bolt.

-Doug
