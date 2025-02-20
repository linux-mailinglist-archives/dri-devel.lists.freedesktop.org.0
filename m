Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C576DA3D57C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E079110E8F7;
	Thu, 20 Feb 2025 09:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h4yQ/+N2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C98810E8FB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:54:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E8DBA61364
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09484C4AF0C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740044963;
 bh=ArcLgFk2io66TkX35tqAR2Buc0pUYz2AJzitE5PaYuo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h4yQ/+N2jxxsI0C8gBGC92X0RZ0eAas6xX/uKm1RM0aktZl2+55m+tpnh/SOr2E6Y
 9TU0pDQCOuVRJNn94W2euN1zRXqHqEh/VybQtBQaX0ggh1RCPbHOEFyV09j86Sl2rn
 /wUTA5oFRFngTC1nQ5rIk+00BJxAMlbxagWthqSBZRkuTteviIQhph9uJF/PuACeQ4
 9EfMkK+cJ5tvRxkGMXKe/B+teDXjCdE7xiXsFW48yC4LWUv3Rv1HnouFpcAkYkGb7q
 zs8tNGNbp/9YaFLgFlTCisinHB8BVmNle2TXZ5uIp8lrNbliK1fNnREJqK+jNKFw1q
 HWmKMCVqWLVHQ==
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e5dc299deb4so699818276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 01:49:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXpGF8WOOrrRJyqzi4PDCT/+uAQ5Av26bASWaMKPBBOp28sMreERZ0RHA3NgE8OGyseSPiGh4v2+Q4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynC42YuUosWOcN3gxtCiSzhTIYYeoeL7aqWMQYm3SXcc/dbHZQ
 hdGfjhM+qDq+U3HKSsE/2ob1DXSsTMOyu+uXjBLqlnsE2ZD+h4vOTy+QELffu1VUfsEKxg4RNWF
 Ci4V6ZD4mEBXUWDZji6VBeykaLbmM1u2WSKrgrQ==
X-Google-Smtp-Source: AGHT+IG2VfvF2GnkRpoys0YJzodvdqc/5xzJY6uPb9btHNHUh2VENPQuq2gVXoso8g5unIWhVfhtqhWMRKw8m8MprAc=
X-Received: by 2002:a05:6902:1706:b0:e5b:4482:a4f7 with SMTP id
 3f1490d57ef6-e5e0a09240fmr5734034276.12.1740044962299; Thu, 20 Feb 2025
 01:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20250220094456.32818-1-clamor95@gmail.com>
 <20250220094456.32818-4-clamor95@gmail.com>
In-Reply-To: <20250220094456.32818-4-clamor95@gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 20 Feb 2025 10:49:11 +0100
X-Gmail-Original-Message-ID: <CAN6tsi5cfXCOiYDFCGVdt5+Ug_YVfWrY92RA6GWt66-3j73vCw@mail.gmail.com>
X-Gm-Features: AWEUYZl5H9Gg9NYfvDiAyEwJCEBbXZYFr80mYoMdK-I6EKVYjTLvZcUu8t-JWBE
Message-ID: <CAN6tsi5cfXCOiYDFCGVdt5+Ug_YVfWrY92RA6GWt66-3j73vCw@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/bridge: simple-bridge: Add support for MStar
 TSUMU88ADT3-LF-1
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Feb 20, 2025 at 10:45=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.c=
om> wrote:
>
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
>
> A simple HDMI bridge used in ASUS Transformer AiO P1801-T.
>
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bri=
dge/simple-bridge.c
> index ab0b0e36e97a..c0f1f7baaa37 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -277,6 +277,11 @@ static const struct of_device_id simple_bridge_match=
[] =3D {
>                         .timings =3D &ti_ths8134_bridge_timings,
>                         .connector_type =3D DRM_MODE_CONNECTOR_VGA,
>                 },
> +       }, {
> +               .compatible =3D "mstar,tsumu88adt3-lf-1",
> +               .data =3D &(const struct simple_bridge_info) {
> +                       .connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> +               },
>         },
>         {},
>  };
> --
> 2.43.0
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
