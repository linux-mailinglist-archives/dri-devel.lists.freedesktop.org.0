Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65ABA65649
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 16:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D81010E166;
	Mon, 17 Mar 2025 15:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Mn5kZUZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522CA10E166
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 15:47:40 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5e686d39ba2so8805358a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742226457; x=1742831257;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G4wur4DVDtUGtY+JC/BnzdIJ47cqhy+qgGDguDBO8CU=;
 b=Mn5kZUZgpP8HTBn3bB7SRL86AXtBg6CqFlGeTxotEz9eFD3fMDuX+JL418I1CsvsS/
 Ntl79DVp2ArJhw6J9yfSnyI9xahQ6kDk8O6BsZCpf/XXnZ41/3reI8T5rFMlOYdqFzvV
 1Y3u3GtyKvb3dRBKV3CUCe057kx87qVNQaIJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742226457; x=1742831257;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G4wur4DVDtUGtY+JC/BnzdIJ47cqhy+qgGDguDBO8CU=;
 b=OC8VF9jAepRnntBygqETGri1+8DH3nJrpaIcGr7PwiEmVhcSqZ2SpeynQAdnUZNq4p
 ZcLXHwv0e9XEE4cPdRPkgvd8BZWTsg7gdTKFGHKLW/M8Zc5I2YFv9NvGNZ/un1UIUWBh
 bB7/DFeeJXdWuesOltZFyk9iHqnZpQWyO27EVhKqBxM2F66ysl1Gd9UvzwgZ8UVZH9tT
 hKI9V1QKfGmonK3x31NZC1EUW5rK9w3rXLgeTUw9+R83gsFXh5GLDCM/KyB+QmZnv8L6
 w9FYa9X85SDXCf71CNFfCapzdImuBENJgjzMgRd+DMSJIU12v5ooQssXltFl8M0AtZ90
 DCAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOnHy4fRbZk0mBbL1tp5vGsbZkWfkb39kH09wNNNkM6Hylhr+hIueJUubFm9rDlk1Krwbv1UFVAE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6sPmAnbIaqUrrTsUizn2iXYvNTkdoRu/W6MBrRZLtDM0n1yHI
 3wDvG8rwqV4fBNe8pD8xYIzPP4jcojoUvFj14u8xKgjkTlkZndHWlh2phHob3jB+snFN9/a0Z/p
 x2g==
X-Gm-Gg: ASbGncsvuztMugqZHTXdrQpmzqXKowLKtd6f4+1TtuMNHG50btULgUxakYMqOzhbfQE
 7ACxswPHdPhmrGU7E4/lSX8UOxtnK4GoDdwgJwqFoVOrQphsPEvYROdXzDmvR7lOQHJEem7NFN1
 J2TEMROjFpiuYfXWhkr/1Q9FDQ8HQoCz311It5VwS+R5UtO24+7Q4VxHRkiZWEWBTiSX4WbOi0H
 RMCobZLY0zzfpWPOnisdTfe/him4JxO7GU6vhnMbO5XbDwHyKbXJNSuUql4/84yGWhSfe3f97rS
 qpBH2pgjMomBl/q14XJ4nW2MI6ymiZIbHZetgXfrjSripKVmJX9WW289Pbs0bEPqfB8/eJSKaMB
 4BJUwnoA/
X-Google-Smtp-Source: AGHT+IEfpMutSspbVX+ZuknQDIVezjBRhQUQwVEti5/L1U9OjaaOOMa7NoPzxrk3CCgvfU111CraLA==
X-Received: by 2002:a17:907:bd0d:b0:ac3:8d24:a7e with SMTP id
 a640c23a62f3a-ac38d240d3cmr15025866b.26.1742226457267; 
 Mon, 17 Mar 2025 08:47:37 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314a3fc0esm694017266b.137.2025.03.17.08.47.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:47:37 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso939092466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:47:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8pyOjAIr2jmHBttELhjYWgUOObIejBEl9Hmlemu7gF75+Ji7X9beMyitiG31yo+lRbhVeT4AoC44=@lists.freedesktop.org
X-Received: by 2002:a05:6512:68e:b0:545:f70:8a95 with SMTP id
 2adb3069b0e04-549c3989f17mr8892700e87.32.1742226106287; Mon, 17 Mar 2025
 08:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250314224202.13128-2-wsa+renesas@sang-engineering.com>
 <CAD=FV=VBHfg+Fgp27ieYVhd0U8kDp2E0ATW+=ueM8EBNOYMoSg@mail.gmail.com>
 <Z9VBtTzNgDh_QsxX@ninjato>
In-Reply-To: <Z9VBtTzNgDh_QsxX@ninjato>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Mar 2025 08:41:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>
X-Gm-Features: AQ5f1JrQ_jp1uS0V6XyXOkUiGcqHWJHxsb3uac6rP3mbR6gy2h4X8JXIkIfmOMg
Message-ID: <CAD=FV=U_rYXZtN7Jw_E4UCjsnNcgtYC=EJ1+BLWiAwVEyo1M7w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Doug Anderson <dianders@chromium.org>, 
 linux-renesas-soc@vger.kernel.org, Phong Hoang <phong.hoang.wz@renesas.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Sat, Mar 15, 2025 at 2:00=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Doug,
>
> > Seems reasonable to me. I would probably put an error message in this
> > case, though? I don't think regmap_read() necessarily prints an error
> > so it would just be a mysterious failure for why things didn't probe,
> > right?
>
> OK, can do that.
>
> > This also only solves the problems for one of the 4 devices in this
> > file. I think the GPIO device, PWM device, and DP-AUX device will
> > still confusingly stick around. It's probably better to add a bogus
> > regmap read in ti_sn65dsi86_probe().
>
> Could be argued. I just wonder about all the other error cases in
> ti_sn_attach_host() plus ti_sn_bridge_probe(). They have the same
> problem with the other devices dangling?

They do, though the other ones don't seem quite the same to me. It
feels like an i2c device not actually showing up on the bus is a
_somewhat_ normal/expected error. It also is an error that would
affect all of the other sub-devices, so making sure they're not
dangling is something that is worth doing. It feels like other errors
that ti_sn_attach_host() plus ti_sn_bridge_probe() are likely to face
are either unexpected (like a small memory allocation failing or an
i2c transfer failing after a previous one succeeded) or are errors
where leaving the dangling devices isn't really a problem. For
instance: if somehow you fail to link up to a MIPI source then it
feels OK that the GPIO / PWM and DP-AUX bus parts of the bridge
continue to dangle. You can still use them, right?

-Doug
