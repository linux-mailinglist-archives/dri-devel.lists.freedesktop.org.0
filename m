Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C49ED1B260
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 21:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C8F10E364;
	Tue, 13 Jan 2026 20:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="xAwMXeA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5ED10E364
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=y5i6zNgB/mLp9XFria465D/SmHCPYx+L3rwkXrbZnb0=; b=xAwMXeA30Upix0sJfjipJR4isv
 A44PYx7FDi4LRes4YG8H5K5OQYZTxw/N9yo4MeCQJqrDE3ZijgFcOZlAv8jAVzFL8hfe6Tc3vaD//
 dumYulNy7LYH6i2XlYnlPeQt1vW39C5IOKSlcuS8g0KeE7AWhpcZ+cQM9ZeqG/gWC+cyRGZEHc5RP
 TGa8UfIXXBhkP0xcCiKEAusrP69PW8h03TkjDTZV+P187K5lHK2Fa0Z+yLKGBD0ZLpgIFk3XOMFJG
 QKCIOUh9S80GWtzfcsOv27a+eddONBmwW2ggZh4az7SksZlWO6JlP2nusjj3Y7aFPBkF1BFv4Mr0A
 yKVBLUEQ==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vfkgg-002AcJ-Kj; Tue, 13 Jan 2026 21:08:23 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/6] drm: panel: jd9365da: Use gpiod_set_value_cansleep()
Date: Tue, 13 Jan 2026 21:08:21 +0100
Message-ID: <13199470.iMDcRRXYNz@diego>
In-Reply-To: <20260113195721.151205-2-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
 <20260113195721.151205-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Dienstag, 13. Januar 2026, 20:57:16 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Change instances of gpiod_set_value() to gpiod_set_value_cansleep().
> Uses of gpiod_set_value() generates warnings when used in instances
> where desc->gdev->can_sleep is true.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




