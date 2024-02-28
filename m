Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F2386A76C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 04:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5388E10E4FF;
	Wed, 28 Feb 2024 03:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RZ5ELodu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C781610E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:59:26 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc6e080c1f0so4634483276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 19:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709092765; x=1709697565; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YFwyn+BWw8rCmi1hzkJUbLKC4zkTCP6n1LK6z6QA5OI=;
 b=RZ5ELoduwZHtEJZXIePh49fd8BnSraSIMTJgnr60/e6338u0az8cu8pdWezhJxXgZ9
 BKXdaOzm1E2T9qlBcrIvYWbtLZ4v8HunXUmnM1Ray4yxgLYGE/lVBGonBbvNq5QztCLZ
 7KxQy7mKkXjYakSOMwKehUYxrySI790tyog8oNHg11E9w6kmcYekDAmUKozLZjDeEybJ
 D+PXbaZAKVIc95ioIlSu2rE7I/2hlxJbyDatoVLNC5VzgZsiCIUe0zUQ8h72t1eL2Ds1
 i1BNCzzxaBk9PHX7OVhUXSiFKHd0Qpn9iaIzk1WNmhOcAyjDoySTSbJdrdB3iimuCBQM
 IHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709092765; x=1709697565;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YFwyn+BWw8rCmi1hzkJUbLKC4zkTCP6n1LK6z6QA5OI=;
 b=lsS/07eiNLEQpqelxTb+iskghAq9gUpG6F6q2LMcTQw0ChEjktFdjM+06wRdZmX68n
 t4EOJDAOX8S4+o9ege/nb6+3IyaqxMKJU2f3jT0+9Q+iJlwZXpKyJFSP9f3diAK6/Tkc
 zgoJG8vdcpMFJ7FsWd8jqBA0c4SLQlX9UUZvPToQBBGLnhx6Nx7CFwLAni8AFrk+7LVx
 zjSyQE2GnkS4TVonDT5UBBZS9ZuNpSOIgpyQt0xA9iMtmlJSzGOEfVRjnhyh+1lh+Agt
 /JJyrrIEjqh3tLqk9u0KcyiTk8SkdBwAXRb6Mjg0H4OMZyO/PqQxfQk9yRPYvwaQEBdX
 E6Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIcD/k6f995cbAhB0M1iUwy8iw29dNzFC3PyQsUkzwDIkbWoasf53X77v8dKq4IMwtBwqXQmqzkrJFqCuOoY4pPqWM6gxA1h2nGFqWskDY
X-Gm-Message-State: AOJu0Yy2xNe6LanocCqE/EJpq9Vp/VwkL0JUBVQaph5Rsn20AbXEeNVB
 0fyKxXjcE+CBJgDkH+keu1uOy+DdiFgRFvJ5LpWGp0ulXNV0WsC0ecSd3K5Tn833MCvL4f1lsKF
 Eflw2X4jMzCTgQ83y06FUP9x7HMhFMFuBw37xOg==
X-Google-Smtp-Source: AGHT+IFcs2FLZnsPY384lCGwM2yZ4jK42q79aAno/WcBXJrGDRzRP9dkz37Md1Jr+WKWJn4QzBI+5Nm6obS/pu7NW9o=
X-Received: by 2002:a25:ae8d:0:b0:dcc:d455:2ab9 with SMTP id
 b13-20020a25ae8d000000b00dccd4552ab9mr1551431ybj.27.1709092765548; Tue, 27
 Feb 2024 19:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-3-hsinyi@chromium.org>
In-Reply-To: <20240228011133.1238439-3-hsinyi@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Feb 2024 05:59:14 +0200
Message-ID: <CAA8EJpoHQD2apb=0WB8G4aisgnQsZG1=dxRV-NQNLNcm-KTdNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panel: panel-edp: Match edp_panels with panel
 name
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 28 Feb 2024 at 03:11, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> It's found that some panels have variants that they share the same panel id
> although their EDID and names are different. When matching generic edp
> panels, we should first match with both panel id and panel name by checking
> if edid contains the name string. If not found, match with panel id only.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2:
> match with panel name instead of crc hash.
> Note that we can't directly use drm_edid_get_monitor_name(), because some
> panel store the name after EDID_DETAIL_MONITOR_STRING instead of
> EDID_DETAIL_MONITOR_NAME.
> ---
>  drivers/gpu/drm/drm_edid.c        | 69 +++++++------------------------
>  drivers/gpu/drm/panel/panel-edp.c | 44 +++++++++++++++++---
>  include/drm/drm_edid.h            |  2 +-
>  3 files changed, 54 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 15b97c8ed993..c4126475ff0a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2764,7 +2764,19 @@ const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_edid_read);
>
> -static u32 edid_extract_panel_id(const struct edid *edid)
> +/**
> + * edid_extract_panel_id - Extract a panel's ID from EDID
> + * @edid: EDID used to extract the panel's ID.
> + *
> + * Extract panel ID from EDID.
> + *
> + * Return: A 32-bit ID that should be different for each make/model of panel.
> + *         See the functions drm_edid_encode_panel_id() and
> + *         drm_edid_decode_panel_id() for some details on the structure of this
> + *         ID.
> + */
> +
> +u32 edid_extract_panel_id(const struct edid *edid)

drm_edid_extract_panel_id(), please

>  {
>         /*
>          * We represent the ID as a 32-bit number so it can easily be compared

[skipeed the rest, LGTM]

-- 
With best wishes
Dmitry
