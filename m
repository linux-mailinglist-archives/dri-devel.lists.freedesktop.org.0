Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2725366CEF1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 19:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC2310E0C2;
	Mon, 16 Jan 2023 18:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E1E10E0C2;
 Mon, 16 Jan 2023 18:37:43 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id r9so13301184oie.13;
 Mon, 16 Jan 2023 10:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
 b=da/8FrC3su8n4920e9FOvu1j/TWeGMIAZK3QFppvkb8spsp70RYdvbMm2q6kr8fatp
 5ZhAWveL0+ghlV+yoW55uxO1VApqKx7SI3P9NQE44tN5xuWeO0ji9XuxwTvr/dlc9rsT
 tVUpF37v44gwmO7bLXKdtbiGDN/w5BQAj3xAbBkq52KC4lJdYL5HB8bnXAJ4+Its3plb
 v4Jme9uznTgidvg/tGOHCdyd7VszsqLeOpmjJn9xH6h/dQojHZTl8CSLKaqG/edls6PK
 yQ1U3V9Jp+1Ca32YYe1xYlqr5URZI2+ZvAQNN1kMuPpVWR6dfbhkvE0JUVZPCO257Kdu
 QMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bz6Srssb7KxtWIp2StQowmALBQ/ecYiEATmxxDpLUgE=;
 b=DzTV/hf6xCj0balEHdcnbV5wUaa7j9/0cClKxAP/1E8RHutOpaHJD8ZZZQxrqr7NcB
 kvQSNNOPbXhfKEtTilwL7ghF3AeOn7443lYt/Y1AJBKexvcIr6pNwKpnDD+mFsHlgtaA
 bdXnkvFQVzKUNcXTq23iTlV5QVNlI1k68CkG0DPf2ROqHRQKZqHD7C4FYbIDWe6GOKJ0
 qJ7LCqX7Nm+jwzFE9hWaCP0Kc4Ix3j1e5QV4ebMRSyW2s1mqR8QQZisXu5gEj4vHhnxD
 AD+9ZfQvfG5Gb56tI7LBED+SPOIs7dQ54rF1oGuTix3ad+sML1NWaR00huvPK2vJa3m2
 WS/g==
X-Gm-Message-State: AFqh2krzJPQBHDluIWbQTpBCi0zddvg0eXfFztQq7rgNMMk2isb2wFRs
 NKTcmpv0qCEBjhOrwceUpqQsZBIjjPiSOCE3U38=
X-Google-Smtp-Source: AMrXdXtOKveG9OHXqQHo9xNE/hNA9+TOjgR84/kFoTmzmkWJIw/wZWO6Z17PeC1Jr2qOmQVHIKAxEfu0US9MC60q0b0=
X-Received: by 2002:aca:2807:0:b0:35b:f5f7:3ed0 with SMTP id
 7-20020aca2807000000b0035bf5f73ed0mr17751oix.46.1673894262477; Mon, 16 Jan
 2023 10:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <87k01me9jn.fsf@intel.com>
In-Reply-To: <87k01me9jn.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 13:37:31 -0500
Message-ID: <CADnq5_PsL8N27_LC_h1m8i_FCg6mJtr7K9Yjv=guw-KGD2wU5w@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-aspeed@lists.ozlabs.org,
 sam@ravnborg.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 11:20 AM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Mon, 16 Jan 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > A lot of source files include drm_crtc_helper.h for its contained
> > include statements. This leads to excessive compile-time dependencies.
> >
> > Where possible, remove the include statements for drm_crtc_helper.h
> > and include the required source files directly. Also remove the
> > include statements from drm_crtc_helper.h itself, which doesn't need
> > most of them.
> >
> > I built this patchset on x86-64, aarch64 and arm. Hopefully I found
> > all include dependencies.
>
> I think this is the right direction and I support this. Personally I
> think it's enough to build test and fix any fallout afterwards.
>
> To that end, I did build test this myself with my config, and it was
> fine, though that probably doesn't add much coverage.
>
> FWIW,
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Agreed.  I applied 1/22 since it was an unrelated cleanup, but the
rest of the series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
