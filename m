Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3E6722036
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 09:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86AB10E193;
	Mon,  5 Jun 2023 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC0810E193
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 07:54:52 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-256766a1c43so1679535a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685951691; x=1688543691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gctR4B/F366o79rRjaTlEjaSOwGINvdlm29r1EhTx8k=;
 b=IBl45+cFS9ZeEMlBdhrNyq0cLCZXUp9G+sX0aPY3DcZ/BVtbtXzhhMln/ahhy2ii4+
 +Im4NZNpTU4BVjeivBQmdyXeXmz1oSb2FbC01KI2VLeBwFTb6Cn6Ku3A2DRgYes0YMxe
 XlY9f6rsnvGeXdL/iTrTdrppudHw/QuzNE+v6n+xFkpNrBSKx6MMHOfudcjIDGYYm9U3
 UDwZo7f6TA6oNou5jTh0/aX9sVDy0cLfOVDLRlcPv0VegzWVUtgBmxz7db2FghSscCGH
 pY6uK8NqPINsManZWHcnUr0MuS9yIisigu8WLNE0Z9Ujr1/gjlfSKSgJqqq1BgLbidAy
 qeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951691; x=1688543691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gctR4B/F366o79rRjaTlEjaSOwGINvdlm29r1EhTx8k=;
 b=DZG/sVr0c7pVA7s9Lf6YDbvQ57lSGyQQN0f5Vh6QtbNTaj5j6X1ItiPSFbV9wIpxbu
 5cwK5KcDTiHs42qfuXrUKfP0/xKwnJ0SHxjm7g5dImsPLeoB+lUuo1opfjfS19Ey8tXX
 XJIIR5KuRtj5peZbxHi1t5CCPaYf9+6KWGh9QYfmKG5koWemDAhJmR2QNbDuFlTwsmda
 ZBiqtSjcdtG6xmIRixZ5jvTb/65q4adIAP6wo2nivuWghw2ApxoWqDk3DC/ERuargF7F
 OqP1ZZH4uyNPy9B7QG2LWUGApva5B6DKodGAKDbwvcoCoIuXZcFe0kc67R69YxfqecNK
 lliQ==
X-Gm-Message-State: AC+VfDz986NOI9ZryRYcaD9oFQK+5+Q40F18kfriW7LVuqsiXaI0mTy/
 t/v2CsGy9pq1w3/EEVWwVwxglCWB46sTYS9rtfA=
X-Google-Smtp-Source: ACHHUZ6eLBQnJQNw4F4yFQ8bwU7RsMY7hwIYuTv3LodX5gKrukGZKtV/mxNbtDuqrTDK18FqOuTB5jmqu8kShl7aS/U=
X-Received: by 2002:a17:90b:309:b0:253:3f25:3d99 with SMTP id
 ay9-20020a17090b030900b002533f253d99mr2570319pjb.45.1685951691671; Mon, 05
 Jun 2023 00:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230604075713.1027261-1-masahiroy@kernel.org>
 <20230604075713.1027261-2-masahiroy@kernel.org>
In-Reply-To: <20230604075713.1027261-2-masahiroy@kernel.org>
From: Ying Liu <gnuiyl@gmail.com>
Date: Mon, 5 Jun 2023 15:54:40 +0800
Message-ID: <CAOcKUNU_7eCdMvAvx8YyGUHVcz4vjvCHPQ6oo5K4cWQEL4+oig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: imx: turn imx8{qm, qxp}-ldb into
 single-object modules
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 4, 2023 at 3:57=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
> With the previous fix, these modules are built from a single C file.
>
> Rename the source files so they match the module names.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/bridge/imx/Makefile                           | 4 ----
>  drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c =3D> imx8qm-ldb.c} | 0
>  .../gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c =3D> imx8qxp-ldb.c}   | 0
>  3 files changed, 4 deletions(-)
>  rename drivers/gpu/drm/bridge/imx/{imx8qm-ldb-drv.c =3D> imx8qm-ldb.c} (=
100%)
>  rename drivers/gpu/drm/bridge/imx/{imx8qxp-ldb-drv.c =3D> imx8qxp-ldb.c}=
 (100%)

[...]

Reviewed-by: Liu Ying <victor.liu@nxp.com>
