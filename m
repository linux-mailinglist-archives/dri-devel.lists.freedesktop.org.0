Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9C284C72C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FA5113178;
	Wed,  7 Feb 2024 09:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lv1EgNrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D307211317B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:22:31 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-292655cb454so72125a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707297751; x=1707902551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oat139wFLSjfVKIsAZBBlXueAqHNZFThp0IjSSQQnHk=;
 b=lv1EgNrJDfCZ19rDjzURK/QcoIExQhL3hUe2fk4ia5E0LInS4ZKnymVtlxeiiK1+e9
 FvFDDKKx4JLXBnS7c+4SS2qYEWZ74dLsSlCnWFsfyMyIZrlnNP0Ocl57zqa/ViajQacg
 FbicluVUWqApra9eZ33EkO4Q5Zo5LT5JZrlOFLX7H/NEQ9iyTVGfixZxrY/sN5KZb3gP
 jbgoWw9QmQuQfNq28DnAiXuTH/j2hyNOaNjfk2lyuty0eBjqYvtwf3PtD3Ixj6ly00+u
 r1J23DyxbRcOTkgLyef0nPQWua2q4/7a3Crbc8zcd2AoCbSYEyCeb2qqIpH2efRTwt8/
 Bmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297751; x=1707902551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oat139wFLSjfVKIsAZBBlXueAqHNZFThp0IjSSQQnHk=;
 b=R3d68WZ03v15SUWM3oELHPcwi5vCeHfcEfACnf7BBDHY0+eIS3Naj/U6ManTRsz0+7
 IFNA6CkLzUzfQytVHup51C3XtMw/mx5sx+2EIbXnZ/ukYwt4uzFh3B02VKKCi8+ayNhx
 5G9cM0HzQ+mJB0+AgEAeEBrhZ5djsB2mK64cB5mrwWQY8GbNm3Bx8kpkGAZK1im2kiWk
 R5udi2dsZprGTWw0Kb+2IniQidrN5PNnntdDvQ+osmRRPUebAY0oxuK3UAEUmCsXByRm
 md1W3w7jdIdHZXyyZ5lOwFQ7kz1stTo8ZmcFlXm8mrdLkGTkKEocBxZfcrqWHSqz0/IK
 ee2g==
X-Gm-Message-State: AOJu0Yw2KQWKyb7Cv/tsTnLHhnmUhcpQkGsB2f0y0qeWdeuemr9kiFUH
 hMPLcMj4w0e8XOmzdJELw1/gDPOrzeBezTwYbGB5jgNL1Bi2xsJ/92sx7LfbofggbrMOF9pdqtM
 sqGjUxS3pdjn+Fu5bqnfK3cJsPLQ=
X-Google-Smtp-Source: AGHT+IFr9zk9YPtcwwWeLlC+0qNDxpzGCms5VGzeQLl7LWlNxnnXxGzrAQ1FGf43ob5qq9Fq30A0i7bCdw+JtIWPFmA=
X-Received: by 2002:a17:90b:3a82:b0:296:e236:f69e with SMTP id
 om2-20020a17090b3a8200b00296e236f69emr946735pjb.4.1707297751332; Wed, 07 Feb
 2024 01:22:31 -0800 (PST)
MIME-Version: 1.0
References: <20240207002305.618499-1-aford173@gmail.com>
In-Reply-To: <20240207002305.618499-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 Feb 2024 06:22:19 -0300
Message-ID: <CAOMZO5A1yiXiLOtR=H_4vJYAMGwjpqrErCzvSkmLoB_f6_rN_w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nathan@kernel.org, 
 kernel test robot <lkp@intel.com>, Liu Ying <victor.liu@nxp.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

Hi Adam,

On Tue, Feb 6, 2024 at 9:23=E2=80=AFPM Adam Ford <aford173@gmail.com> wrote=
:
>
> Two separate build warnings were reported.  One from an
> uninitialized variable, and the other from returning 0
> instead of NULL from a pointer.
>
> Fixes: 059c53e877ca ("drm/bridge: imx: add driver for HDMI TX Parallel Vi=
deo Interface")
> Reported-by: nathan@kernel.org

The Reported-by line format can be improved:

Reported-by: Nathan Chancellor <nathan@kernel.org>

Thanks
