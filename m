Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC5C6076D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD3210E0B7;
	Sat, 15 Nov 2025 14:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j8/5ngWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF0D10E0B7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:40:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45589441FE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FB5C19424
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763217641;
 bh=Sue3DiX7aivO+CREJvjgnQK9H3Tgu+sLekJRMaXhs2A=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=j8/5ngWcMu4uR2+5U32ZtsMBluoXbq4r00xSz5DFwqXGpsDqRehYBPhU4JwhuqdfY
 rbVIFrFXl0tSiZAoGw3l9jYyYqA6bwRpq1DPDHpzDfun+qQbWSPHJhH5uwWnAjrWsB
 XsLsCQmT6BCZGBLG3EMH8TeJwriHOIpa+OSTKqdCivadSieOI412P2DW3qbVSSDdhh
 r1vPdMJnHak4ggiJaMEuXkxhwGd4LayTdLi12cAsnrQUhIXhK+j9ktydZdL80ClfRh
 Sp3WkhGUiPnVVHT9HaUeGJGEVLZPmIyM6BmSmJTCA0zgUBPBjzCLGdiKGqgagqrKU9
 PNPs7HXAp1YAg==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-37b9728a353so28218171fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeoFi0wp0sE8iFpjRYjeZ6kZ/5SGW0mTEdZZNikCu7eJBBekXZREn9o9kd97t28TWctk9Byn3hqls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyprJJ2UHQrU4N7iNmvv1OKdF69UITdlUq+573/wQh7Q+rQigl0
 uJ3fAVkLbdc0qZaLJ7lORqCy5jQfl38yH/iPsuBwFx5n3udFeOAhddDd1x0dhv36zbfmfdbuCk5
 Nn/fCw7rYdOIKgsLJGZZqr82A//YJTtk=
X-Google-Smtp-Source: AGHT+IESjGE8+0xVTH/QjhjF8+obf5TP9Oc8OEClkcCl8dEd7PpJQsH5CVoNDaeGwAe6R1UChVfXuLbguHAeh3ulKxU=
X-Received: by 2002:a05:651c:41c8:b0:37a:455e:f302 with SMTP id
 38308e7fff4ca-37babd5cb6cmr20120411fa.27.1763217640107; Sat, 15 Nov 2025
 06:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-3-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-3-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 15 Nov 2025 22:40:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk6LAUI84UIq1LoT1dh5454sL5SZsNoWjCZBYs2iLefOyWq2c142CwfOnM
Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
 sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

I assume a fixes tag isn't needed because technically DE33 support isn't
there yet?
