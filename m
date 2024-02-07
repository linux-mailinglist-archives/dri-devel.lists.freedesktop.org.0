Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D584CA18
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 13:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BA710E57D;
	Wed,  7 Feb 2024 12:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pf1QTl+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A420C10E57D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 12:00:49 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so386564a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 04:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707307249; x=1707912049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gM6QsWjACFBChfoK3bSweEUSE6o11Fq5T/YgBy/dphE=;
 b=Pf1QTl+ClGBo5GuhuAr+/njzHM0DQ4rXKxKUNC7XvIbv7rorDPHYYGBE/eVlY3X37L
 3LsAPM5mMfDxEpNBAnMcpZfvwyhGd+TZhAoUHgEFpHCiVbvo6/2lfpJuWxDfh9Vq9m16
 4qzpMkC+xTGpK5mtEk5u53Ms3/PL6XT5AKClLBQisCcDLd0XGY/NeoHc7Ma5IyBYc/Y9
 2rwh1Z+8uptK5pAigK2VwTkxGJuofo3RV7wQO6QN/lVjtlqIeAskRvuwwIw1FR4JkoLk
 UOd9jV4W4/izWOcGIOwDag4t7dyvl0PiDvLINzUTM7dF+qXS7LpIr1tj285yWrNarjWJ
 QYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707307249; x=1707912049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gM6QsWjACFBChfoK3bSweEUSE6o11Fq5T/YgBy/dphE=;
 b=ecfn4jIzLRkAPjqgZ9DLHJAoRQwobf/tHBoZPr9fTqBq3OBSK2tYO9sbjVe2p8q/xK
 NyAeA5G4WHpcL5L/le1gBynPuAoh1cTcGDXTZhzF+je9L7Z9kXtrCGQEFQPnE6a4NmS5
 veMxKgONklMk+txFNChIfQ/ZMc9AuOxlN10JCipgUOzEIFbS+PKvblKOKEmhf8EP5cAp
 RCoZTYNf5xpVgivVsOt8pfPIc2aTZl9yI4KPO4ovSRAI8txtDfavAhEzNiLm+D4vs01S
 X50pg2/xmsSrmR0gPnBtptQcKl7cjRteTPOnQY8sLLar/BBk0mONHH5kNrDzTbyxNGI0
 GHdg==
X-Gm-Message-State: AOJu0YzELMfEEkrV/OQAW2FMWgLZX3oPBhSqEVWJ2eQaburBoekNEhKs
 mke+CHlHoc+ZXHvKdB3lfMafyC0raL8vkFaQzcjelfselcgTt0P/LUq/9Ilw1Q2BqUZQCN5ldbx
 GWtXV2ZPoBEhtaDv2AtmL7zOBc1w=
X-Google-Smtp-Source: AGHT+IFmLjBaaEtX1/OMpKtsa7brGGtfjfLPXpt7bimcTxISC6q36Cd1j1/g2neE7C1t5/rt+Ks0wZAktODPx5HJXOM=
X-Received: by 2002:a05:6a20:3c94:b0:19c:1881:b4fa with SMTP id
 b20-20020a056a203c9400b0019c1881b4famr4911318pzj.33.1707307248929; Wed, 07
 Feb 2024 04:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20240207002305.618499-1-aford173@gmail.com>
 <CAOMZO5A1yiXiLOtR=H_4vJYAMGwjpqrErCzvSkmLoB_f6_rN_w@mail.gmail.com>
 <7b71ab7f-7ea5-4144-a7c5-d0b66ab13476@linaro.org>
In-Reply-To: <7b71ab7f-7ea5-4144-a7c5-d0b66ab13476@linaro.org>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 7 Feb 2024 06:00:37 -0600
Message-ID: <CAHCN7xJRWr8Og6E7Q10hAzd=8bb4kqOPJHQ9Rs98b5gqF8a3vg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
To: neil.armstrong@linaro.org
Cc: Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, 
 kernel test robot <lkp@intel.com>, Liu Ying <victor.liu@nxp.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Lucas Stach <l.stach@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, Feb 7, 2024 at 3:24=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On 07/02/2024 10:22, Fabio Estevam wrote:
> > Hi Adam,
> >
> > On Tue, Feb 6, 2024 at 9:23=E2=80=AFPM Adam Ford <aford173@gmail.com> w=
rote:
> >>
> >> Two separate build warnings were reported.  One from an
> >> uninitialized variable, and the other from returning 0
> >> instead of NULL from a pointer.
> >>
> >> Fixes: 059c53e877ca ("drm/bridge: imx: add driver for HDMI TX Parallel=
 Video Interface")
> >> Reported-by: nathan@kernel.org
> >
> > The Reported-by line format can be improved:
> >
Sorry about .that

> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Thanks
>
> Fixed while applying,

Thank you!

adam
>
> Thanks,
> Neil
