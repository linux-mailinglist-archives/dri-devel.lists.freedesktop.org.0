Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5B093AD20
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8976E10E1C7;
	Wed, 24 Jul 2024 07:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607F110E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 07:22:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 1DC9C4FEC;
 Wed, 24 Jul 2024 09:22:21 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jul 2024 09:22:20 +0200
Message-Id: <D2XL71L5TEZ3.3UXFSWKGQ0KBE@kernel.org>
Subject: Re: [PATCH 2/2] drm/panel/panel-ilitek-ili9806e: Add Densitron
 DMT028VGHMCMI-1D TFT to ILI9806E DSI TCON driver
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>,
 "David Airlie" <airlied@gmail.com>, "Jessica Zhang"
 <quic_jesszhan@quicinc.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <devicetree@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marek Vasut" <marex@denx.de>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.16.0
References: <20240724005700.196073-1-marex@denx.de>
 <20240724005700.196073-2-marex@denx.de>
In-Reply-To: <20240724005700.196073-2-marex@denx.de>
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

> Add Densitron DMT028VGHMCMI-1D 480x640 TFT matrix 2.83 inch panel
> attached to Ilitek ILI9806E DSI TCON into the ILI9806E driver.
>
> Note that the Densitron panels use different TCONs, this driver is for
> the later panel, use panel-ilitek-st7701.c for the former panel:
> DMT028VGHMCMI-1A - ST7701
> DMT028VGHMCMI-1D - ILI9806E
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael
