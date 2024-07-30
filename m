Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BD5941093
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 13:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC010E0AC;
	Tue, 30 Jul 2024 11:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnFfT25d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C27B10E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 11:35:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E6969CE0FEA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 11:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F2BC4AF0B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722339348;
 bh=QuGx/cfgbpy+UDC/SMjDueR0n2vdbpL7mFmj7Sdj8M8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bnFfT25dT4wKLkt4Vk1uoutR+SM0e24bqowcermTIFbjhl2y/71pFNTXmdZDhgnDE
 TqpQZ5kSopjJ8mAwiU4+6BPPi23H9YmDnlxYm5gJeb/p6991S+BWAWxSiQbKoGz84D
 8gk2JRQbkj8UldYrDaGdbAQi9VPtaFUDR3JXHBDk6A2XIYzbKEKEPop5uesnP2IhAb
 ogX0DfwQe0EnO701vinESDaO9oHAs57UazliJXsT5XRYC8i2OiqKf8LcpuZ9+Z3Vi6
 vc1wU46kGPCGPcTnn5eRxx3Te49iUUaoSZymLrgxbWDukdSdTkQKMjeGaBRH9H2wXr
 jSd+/hq7X06Kg==
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e087264e297so3400224276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 04:35:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXv+YlalNJvjJAhIBvcbOnTFVbxAgoYQut56I/QJ8a2UN0X38ac+jJxl0HXAtshQ69Jtku1YSfpOqWYkDzqcJCSYNp69adRuz/B7bsItXlD
X-Gm-Message-State: AOJu0YwBE1YYMBeO2vBtPlFv2ilCHQKwg5BXVFVCnwsT/exQNp4xl1j3
 GmJ85CCrzHezSVHB2Wr5Fc5gSxuvE1FEveWIlJqSD3CFg3k3bzOsrD6Yb/Y7m34aw8JSJdVBI2r
 N871FSrsZae8fgtZzESw+bjJi39OBSEkIBlYrIQ==
X-Google-Smtp-Source: AGHT+IEXZhkCqRyUyEyxTHFbtZAKND/cdRQlkpUzzuZrzlEMTWVBtNPZMpw+/ALQOHM7BlhfWq0bh9W0/8U1+/SzMZE=
X-Received: by 2002:a05:6902:2b0d:b0:e08:5b14:dfb0 with SMTP id
 3f1490d57ef6-e0b544f4aebmr13391934276.28.1722339347522; Tue, 30 Jul 2024
 04:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
In-Reply-To: <20240701-lt9611uxc-next-bridge-v1-0-665bce5fdaaa@linaro.org>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 30 Jul 2024 13:35:36 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5=VmahLzVYEYfp6TAe=w5pB7hgaEy1SN55s7fsUkyoLg@mail.gmail.com>
Message-ID: <CAN6tsi5=VmahLzVYEYfp6TAe=w5pB7hgaEy1SN55s7fsUkyoLg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/bridge: lt9611uxc: require
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Jul 1, 2024 at 8:20=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> There are no in-kernel DTs that use Lontium LT9611UXC bridge and still
> require creation of the drm_connector by the bridge on attachment.
> Drop support for !DRM_BRIDGE_ATTACH_NO_CONNECTOR by the driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (2):
>       drm/bridge: lt9611uxc: properly attach to a next bridge
>       drm/bridge: lt9611uxc: drop support for !DRM_BRIDGE_ATTACH_NO_CONNE=
CTOR
>
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 103 ++++-------------------=
------
>  1 file changed, 12 insertions(+), 91 deletions(-)
> ---
> base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
> change-id: 20240625-lt9611uxc-next-bridge-5827d9b17fc1
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>

Snoozing this for 2 weeks, since it is removing functionality.

Reviewed-by: Robert Foss <rfoss@kernel.org>
