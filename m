Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0472200C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 09:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F91E10E190;
	Mon,  5 Jun 2023 07:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66FF10E190
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 07:50:06 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5585f2f070bso3298681eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685951405; x=1688543405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4faFP8A0r0X78bHV6Nl0Xmhbz8/0jgKJObe45f18FIY=;
 b=oPVGhyaEEshqI+qZYk/QxcetvoJbpgt1Qfs5LkRLvOoqPcWQ8myJlJ9+AK8ToDqUT9
 PwQsqPL8s85zwhQGhORYcdzInmL6fCgTkOB2Rt9qbTog2hcv2AIq/dHqi7IGyen9s6yD
 D9Yx5Xcn45mH63QmYGvI36IFfmu5p2jc9n1jitmENvKtiQFEy8tW6qqjfWpL6AZfLES4
 CuUB3aRzqFS1xIV+A7/ghNtQ3hTBBOr//d6yMISx+sfJa6Jre8oNTi+8Py2XCtIpbQFQ
 YFV6e26ys5rD7McBkH4DCw+rlXfiwpCbMUm3TUj+AuYzbVcjn2jIGmfEX9dB60WJ2hwZ
 ihGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951405; x=1688543405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4faFP8A0r0X78bHV6Nl0Xmhbz8/0jgKJObe45f18FIY=;
 b=VnHDZJLApeBlU/kkkwk1cP+D3Q2ybI6SMW228CCQ3UkyDcMOJXnqO9LQHJ6ryfIh/6
 26LhyY00b3RJ4T9ywDUAXSwLUHdeQs3vCUfT6BJ71inkfT0aQtc6coxCD8IjLNlYyyHW
 ArwVG43j41CTrtpPxIsqIFdlllB5do7YZbIE9Cbm9R3lvywruIIXBud65ZY3dEXkLWs2
 lPJfoxIQmKMDC7Siaxg8h27kg9rl6rfzSF03Qrlezsow8j4frReWGyATCLp1KiGkCppV
 y+zSHgLpWcMCfuw0yvEUSSx7ev8QMG6R4w2sK6mlEwObGhI8O8DAgqEL4ju8m/ebkaj+
 50ZQ==
X-Gm-Message-State: AC+VfDyRaqUp2/mT5c8eJp3s7Eb29nAZlidPVVtieYmV+wBc+pVKlAv+
 mijH8HUp3udPJ1F6lCjP/H/aqPnZu00J6lYz8CziQvxi/CXuWEvh
X-Google-Smtp-Source: ACHHUZ7MZ2VcyBXtDSPmFFZvu3octS0FxXw5m114X8R2/Nn68gej8qQH+MsLY3w52UcaSJOQ34FUCI2Uq3jB5eBRKoQ=
X-Received: by 2002:a05:6808:359:b0:39b:5968:deb9 with SMTP id
 j25-20020a056808035900b0039b5968deb9mr231404oie.39.1685951405589; Mon, 05 Jun
 2023 00:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230604075713.1027261-1-masahiroy@kernel.org>
In-Reply-To: <20230604075713.1027261-1-masahiroy@kernel.org>
From: Ying Liu <gnuiyl@gmail.com>
Date: Mon, 5 Jun 2023 15:49:54 +0800
Message-ID: <CAOcKUNXT9heNVCpqZqEy7MOx6=+oYZKXKQgsTLLWmffP-v8nhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: imx: fix mixed module-builtin object
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Nick Terrell <terrelln@fb.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 4, 2023 at 3:57=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
> With CONFIG_DRM_IMX8QM_LDB=3Dm and CONFIG_DRM_IMX8QXP_LDB=3Dy (or vice
> versa), imx-ldb-helper.o is linked to a module and also to vmlinux
> even though the expected CFLAGS are different between builtins and
> modules.
>
> This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
> Fixing mixed module-builtin objects").
>
> Split imx-ldb-helper.c into a separate module.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>  - Add a separate module instead of making the functions static inline
>
>  drivers/gpu/drm/bridge/imx/Kconfig          |  5 +++++
>  drivers/gpu/drm/bridge/imx/Makefile         |  5 +++--
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 20 ++++++++++++++++++++
>  3 files changed, 28 insertions(+), 2 deletions(-)

[...]

Reviewed-by: Liu Ying <victor.liu@nxp.com>
