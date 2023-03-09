Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E474E6B2144
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 11:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E0010E7DC;
	Thu,  9 Mar 2023 10:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D2410E7DC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 10:22:00 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id i19so747781ila.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 02:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678357319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ah1TtdVxfPgfmW7zrYGGBKwFiIK5NMV4NPzf8pIYnM=;
 b=B72T8/xcJkjQz7mlADugAXF75gmsMItZFaKG06Dg/eKa38XtjEmB5TesT6Tgp6ASVa
 y7A4CQ+1SKnIFvNYlOo3PnP0nSTd+8rsz+m7vcdsxyqsxg5jUheyJ7M22oT4FGRUwJFe
 UlqCyzjG+7geAfz15PsLpJSOKheBGW/Vk39Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678357319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Ah1TtdVxfPgfmW7zrYGGBKwFiIK5NMV4NPzf8pIYnM=;
 b=CmfouE34iJibvdrCDbflfd9HkLF0iZDaYFXioKPS7ZfnkQ+vtW8qy2zIFS9QjGHDKm
 V3XgDETAWsBliTaBbXF5AxcaS5ew4yaP3FulmVFfKFkhBdA4Og8BdHyaHbTXmHxzNbk7
 9PV1MiLpsgbPwjDPS1U8tEzfLDmKl6qabfcD86ghpF17ABTkgKowLsHzVazXBFwE91Qj
 bTKnAa+WV02Kx4MSg4YyEgqha3wfWOz45WMKq59B61HcMvTd3fuIMjE07w2OtEL6dImy
 I+M/cndHZn36nYkQNAJsDKsTTO2idAOMVJuQgEcaNbIvBiKjrClg3juEjllyMRQMM7Jd
 1QoQ==
X-Gm-Message-State: AO0yUKXVwt+v4jB5wNB6LLRD1xf22EfOKOrEYspLzHuQYd1e16dI+DIf
 dwZzTq00a1TOZ06K/eLPreq7P96FjJiQUVKwVazHxA==
X-Google-Smtp-Source: AK7set/8LE04Zm+2ShiPru3Ucvo7TBxa+dRVhoQ8TlB/lSr0SCiXxU6ZSWYbEzWNlrck7ayKIPUPGHnsRZrsJ3nY8As=
X-Received: by 2002:a92:b512:0:b0:30f:543d:e52c with SMTP id
 f18-20020a92b512000000b0030f543de52cmr10301852ile.2.1678357319507; Thu, 09
 Mar 2023 02:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-11-treapking@chromium.org>
 <ZAXWbkq4oLfrWUR7@smile.fi.intel.com>
 <CAEXTbpe=e1iA7cnzuTtcsyFxpG37YCWSK_SqZb2A8hxcyCnJBg@mail.gmail.com>
 <ZAiqPIm6O1JCPF7f@smile.fi.intel.com>
In-Reply-To: <ZAiqPIm6O1JCPF7f@smile.fi.intel.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 9 Mar 2023 18:21:48 +0800
Message-ID: <CAEXTbpcQAJ1HiF0eGbBFzFU2K-K7vnEEyqGtqJFHbUOxWGG3iA@mail.gmail.com>
Subject: Re: [PATCH v13 10/10] drm/bridge: it6505: Register Type C mode
 switches
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Wed, Mar 8, 2023 at 11:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Mar 08, 2023 at 09:51:19PM +0800, Pin-yen Lin wrote:
> > On Mon, Mar 6, 2023 at 8:03=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Mar 03, 2023 at 10:33:50PM +0800, Pin-yen Lin wrote:
>
> ...
>
> > > > +             it6505->port_data[i].lane_swap =3D (dp_lanes[0] / 2 =
=3D=3D 1);
> > >
> > > ' % 2 =3D=3D 0' ?
> > >
> > Per another patch, I'll update this into `< 2`
>
> But here it should be >=3D 2 then, no?
>
Yes it should be >=3D 2 here. I wasn't really using my brain when I
replied to the mail....
> --
> With Best Regards,
> Andy Shevchenko
>
>
Best regards,
Pin-yen
