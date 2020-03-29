Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C32196C4A
	for <lists+dri-devel@lfdr.de>; Sun, 29 Mar 2020 11:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3636E0C2;
	Sun, 29 Mar 2020 09:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011D26E0C2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 09:57:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g62so17830580wme.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5/ybwGZw15O183cB6hxraMKImcCya/+VsT5AgJC+wk=;
 b=PlBBbPjoSfFFs7coNzHn9y18vAv7tg8/gEY0ie5YIkK13kmI6SbdzQoLrfMgSy8Rm5
 M6+sZHbgLbuUP3x7Yi4JOEBmBfnVda+LdwY0Bj/l8h0ZA7GwdUMMPV9FgLFKvYJaQfy9
 dD02x2Np6E67W8gO2RBaVF56KZAtqp1CEFtuUIbWKhYVCXseO4V7/kzmWJsWVWZ9RPT2
 MTCiMRujzIQ9JvGhJ3qoItKdllyaL5MnMUvQlC6O810X5BaS9f5mhH3x/grKuoDdvGDe
 vVpv82zY7bvOSu48mbqHv8jw67oBX8GWFwfg19KElJa2K4zU3TB3rSUoXgPMAwgFG8Mf
 gAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5/ybwGZw15O183cB6hxraMKImcCya/+VsT5AgJC+wk=;
 b=nqUCb8JN4jT2JYXxY4N/XfEKXU0/wCcwNjaNmfIimzVD2O8BCMkh1owrtyvg55f/Uf
 Y++A0VIloZg26wQZ5kzNJmtFoITRJnnefoZPRRHMLo9eKaCfIx7zg1rhmTp19yOv/N9+
 sbUb04ySK0Hc+MgS/CDoQ1cn2xxSK3rzleFyuPFsbAJQNRvczXDoPH536Z/lfZzD5MQ2
 Pg0Uxybminx155uEBM8UMiVvDkFdQZPs61ud0oraS0+Lz+z1kbFDkpg+w5oa8A32RqJ3
 Snvv+uc0i+ngpCZv2FIc/wHq2DW5ROVlcchS0q4XdtqH55C+pmaqkbrZ3mTXDDB8fyYK
 7ZBg==
X-Gm-Message-State: ANhLgQ2MXlNc9d7DDoQ4KNcRhaLDeqrbpXbB6Nyb+2m+iSUH4y7dSMX4
 Jaf9zoxa8E/nZpgO5jUe1rUbf9lafp8ajWZnsYY=
X-Google-Smtp-Source: ADFU+vt/KWuDksi8mUndNDmzSr2QWqqKzTuw0aQvhAAxtapcUeVPe+tjCaP46IlOCkv0ET3XIlL1gz6wNhFoqGMdrKY=
X-Received: by 2002:a1c:1942:: with SMTP id 63mr4990909wmz.133.1585475844683; 
 Sun, 29 Mar 2020 02:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
 <20200319203427.2259891-3-martin.blumenstingl@googlemail.com>
 <CAKGbVbtKqdCEcawkjG=7TRd30df6GJ+gagV_JegntyqRpzC4cg@mail.gmail.com>
 <CAKGbVbvAvk0L5sGQmuqfxeL6AwtVnSsYyCp6YBYV6ZHKepWBXg@mail.gmail.com>
 <CAFBinCDUhVaky6EUA7dOAhAZM9itbydQ+w=0P-1m2u0o0HUUeA@mail.gmail.com>
In-Reply-To: <CAFBinCDUhVaky6EUA7dOAhAZM9itbydQ+w=0P-1m2u0o0HUUeA@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 29 Mar 2020 17:57:13 +0800
Message-ID: <CAKGbVbsHXUhpaU34ovRPqc51LSavERUzMySx3hG7AqdO-oobHw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/lima: Add optional devfreq and cooling device
 support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm not the maintainer of patch 1 file, so please contact:
  - Rob Herring <robh@kernel.org>
  - Maxime Ripard <maxime.ripard@free-electrons.com>
  - Heiko Stuebner <heiko@sntech.de>
to review and apply patch 1.

Regards,
Qiang

On Sat, Mar 28, 2020 at 6:20 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Mar 28, 2020 at 9:40 AM Qiang Yu <yuq825@gmail.com> wrote:
> >
> > Applied to drm-misc-next.
> thank you!
>
> regarding patch #1 - can you apply this as well?
> patch #1 just takes this midgard change [0] and ports it to utgard
>
>
> Thank you!
> Martin
>
>
> [0] https://cgit.freedesktop.org/drm/drm-misc/commit/Documentation/devicetree/bindings/gpu?id=982c0500fd1a8012c31d3c9dd8de285129904656
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
