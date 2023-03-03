Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36CF6A9A4C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958110E649;
	Fri,  3 Mar 2023 15:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459A910E649
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 15:12:06 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id t4so2216261ybg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 07:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G+YNWt3/2mwhQtToJ+WhtS+kWhy5QJtkAQP5ui8Wpx0=;
 b=E7qyvwtQl97lZ/Sq/Xto3u4q+xBQgdgGeuODz5MPGhUkyuH4o4Qt0gmB84bdIh3zw/
 0Jk5yjUzGhUVNlsCA77YwtHod3OWwPnfxFCWCK1/t+L9cOJmt2P1Lw9o5pxFgvaMrRNY
 JvVyNKPgWpA0A7bpZNVRQ46O3AlJyvBXvj50M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+YNWt3/2mwhQtToJ+WhtS+kWhy5QJtkAQP5ui8Wpx0=;
 b=VmriUgSDIwQRZObUszYgvSOAn+KsCJ62LvZKX01+FhYZW7jkOzyemp9vk9C0SBBJiy
 adLvtv2yELrdygxP9cDs8N1X+qLFreLuG4F8TIE2/Cj9J6UUsx/2Sthc+6PRVb8uBREM
 KZAu2DJBKwifV2nvh9fWEaTJ1MF9R+oS4UzKrddw9UyBI0eL/IHT5RSQinia3TQAn1uh
 nsnGVtczcPUk8Q8nQ3Xw97tSvcHtgMI4tfb8TSMpzQXdho7YqPMtYujweq0Y3udPp88+
 lHUGpTPs2wCGCBo6jyW5XXLxDyhKH5fLCcUGEgNc/TvPkgjSahJ6ecIwZunwAoxxwhKU
 cp7A==
X-Gm-Message-State: AO0yUKV8v9DJK1ka4/rr+1w+r8R3EmReic+3Yh+VucyaELztioCxqLfM
 pEZzdkzolKLnakWJqyR0EPgtizpw2h0Mbzhk6J21uQ==
X-Google-Smtp-Source: AK7set/uu7+i7lmLzXdvVBwrBo2YxMppu1kabgxL75/dmMInh7Y50+ilXQzz4J7CEdbV4A3U6bNnY3M0naC/gJ2u3mE=
X-Received: by 2002:a05:6902:4c3:b0:a6a:3356:6561 with SMTP id
 v3-20020a05690204c300b00a6a33566561mr1035058ybs.1.1677856325423; Fri, 03 Mar
 2023 07:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
 <20230303145138.29233-13-jagan@amarulasolutions.com>
 <20230303150807.4hhpjinuac6uyj3p@houat>
In-Reply-To: <20230303150807.4hhpjinuac6uyj3p@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 3 Mar 2023 20:41:54 +0530
Message-ID: <CAMty3ZDCVQyR-Az4Nd+iNUww5ddvtEPRR2Dt0M-=0Nt+who4ow@mail.gmail.com>
Subject: Re: [PATCH v15 12/16] drm: bridge: Generalize Exynos-DSI driver into
 a Samsung DSIM bridge
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 3, 2023 at 8:38=E2=80=AFPM Maxime Ripard <maxime@cerno.tech> wr=
ote:
>
> On Fri, Mar 03, 2023 at 08:21:34PM +0530, Jagan Teki wrote:
> > +static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
> > +                                 struct mipi_dsi_device *device)
> > +{
> > +     struct samsung_dsim *dsi =3D host_to_dsi(host);
> > +     const struct samsung_dsim_plat_data *pdata =3D dsi->plat_data;
> > +
> > +     if (dsi->out_bridge->funcs->detach)
> > +             dsi->out_bridge->funcs->detach(dsi->out_bridge);
>
> You should never call into the bridge ops directly. If there's an issue
> in the helpers somewhere else, fix that instead.

Agreed, it was added by mistake and it was removed in Exynos. I will fix it=
.

Jagan.
