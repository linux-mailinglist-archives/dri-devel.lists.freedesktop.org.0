Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE0C9F4A9F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4499C10E94C;
	Tue, 17 Dec 2024 12:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="iNOEDdEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D2710E94C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:08:06 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6d8f75b31bfso44490826d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1734437286; x=1735042086;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j+dl3ly0rdbKwmGKotpv1oO2gk374L+s+XxGWg7hHC4=;
 b=iNOEDdEGOOAetrw4hO1gpbiUUfZUSwAKyb0sGwsBy3ZpUBOch71VnknGZLG+1eIh5b
 FgUczlivTIpln/vf6T4xP+FtlSELL2a4yP1FTlERJ58XVE3zvCUIfTIB4ITX5Ry05w4b
 nzVIxsCGA0yDWJMoElf1/17raSVe2Bou/lV3gV+biZ5JKIqVCqT9R85YXa8fdHLMo6bm
 cmA4xXo0FyVSJpuhU+uwlmUoupQK5I36RoZsPU2gRczvewQFubkAHgyEgPY8F0vaqjKl
 3G12lTCRCLglEv7afkpVFj2lv46LttR4Ml+E8mi/VBNo5ZVgejNcJom/RMJ3wC5TjwL5
 FLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734437286; x=1735042086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j+dl3ly0rdbKwmGKotpv1oO2gk374L+s+XxGWg7hHC4=;
 b=Z6LxyrwwOmOzl3/fJEbF4SSF/pd6qgYVe92InN0glc8YPAXKyWHWp3T2hfNpVGqJze
 JqCSjqWbA8lnWBGRt5hvKQo22Ac/EqZHTXq4SiCfybO5Y9k3+t6V49Y85TbTq4meOMOw
 Hb5M7PkXaXHNvVwCLPSYt9Iow9U78wFKjHBTKp9AtyzFr/v3I1EgpTTVV2JUBr5z6mKB
 U0g8qIzwObM1ghr/46BVhbBbpLBn4kHnQaRel0gdDzfLA/KVGC4eolpxgN38NHwr9sEu
 V33TvYmkeDs8GEBe/qXTlioaN8egOqxdgaVSmB64l0ZEbL+E17bL8Rj7tcFdTEbUoXQU
 AF7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHO8yxMa+hUT/DUnMTd5H9cX7E3PoAGh6Jm/AS/nnl5QBC1cTpIKUOcOEdubAatxLtGlL8UGDZFS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoD5mf+i7SGqrcx8TOlOzxOiwwwLd1E130iI4cfjImAgFPUXrN
 I6PwKX1rxCIOcHXU5Qe19NllSwm/c9Od8VLPW9jtGtIxhxWxAk505U0N64LGDnHoosRwEtIe0Wh
 cDGIFuxONdEsSbLW+G16eMgYXAXEV/aEdN4Y5hg==
X-Gm-Gg: ASbGncsbygenAo3EyXtvBwKGzBtZakxlhSJPqVNyhzlbJOq5LD2Q/YeR/tTrGap61ej
 usm8y4zusqc9mJD6OAApJ8xraUXi3uvF0EOIC
X-Google-Smtp-Source: AGHT+IENXkFl1sf/3x7p8kafThXQqXSZZrmYVwhsRzFtxsCkGCBTgLsddU6Li0qrlY45bm/mZ6nEZU9yLbhu5otz4j4=
X-Received: by 2002:a05:6214:d48:b0:6d8:a754:9647 with SMTP id
 6a1803df08f44-6dc8ca57509mr252459736d6.17.1734437285918; Tue, 17 Dec 2024
 04:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20241214081719.3330518-1-andyshrk@163.com>
 <20241214081719.3330518-9-andyshrk@163.com>
 <CAPj87rOjqZdyht2y8MK7gVyk_eqEzk1Sy0DcxFtQRuhrHQ_oxA@mail.gmail.com>
 <165af58a.697.193d2100239.Coremail.andyshrk@163.com>
In-Reply-To: <165af58a.697.193d2100239.Coremail.andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 17 Dec 2024 12:07:54 +0000
Message-ID: <CAPj87rMfFXkbyh7UEJQw4JV1R18KLXC3GyF0CznrN1k3UdL0Lw@mail.gmail.com>
Subject: Re: Re: [PATCH v6 08/16] drm/rockchip: vop2: Support 32x8 superblock
 afbc
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
 s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 derek.foreman@collabora.com, detlev.casanova@collabora.com, 
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
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

Hi Andy,

On Tue, 17 Dec 2024 at 00:41, Andy Yan <andyshrk@163.com> wrote:
> At 2024-12-16 21:06:07, "Daniel Stone" <daniel@fooishbar.org> wrote:
> >On Sat, 14 Dec 2024 at 08:18, Andy Yan <andyshrk@163.com> wrote:
> >> This is the only afbc format supported by the upcoming
> >> VOP for rk3576.
> >>
> >> Add support for it.
> >
> >Out of interest, how was this tested? There is no 32x8 modifier in the
> >format list in format_modifiers_afbc[], so it seems like it shouldn't
> >be possible to get a 32x8 buffer on a plane at all.
>
> The 32x8 modifier  added in PATCH 16/16:
>
> +/* used from rk3576, afbc 32*8 half mode */
> +static const uint64_t format_modifiers_rk3576_afbc[] = {
> +       DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +                               AFBC_FORMAT_MOD_SPLIT),
> +

Hmmm, that's strange; I applied the whole series with b4 but wasn't
seeing that block defined. Maybe a bad conflict resolution. Sorry for
the confusion.

> I write an ovltest[0] tool which can take linear/AFBC rgb/yuv data from a file, then
> commit to drm driver, I use this tool for most basic format test.
>
> But when tested on weston, I found that weston does not use the AFBC format for display,
> don't know why.

You'll need a Mesa tree with e0f48568c7f2 included; if you have this
then it should just work out of the box.

Cheers,
Daniel
