Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B37D2F04F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FA210E83F;
	Fri, 16 Jan 2026 09:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="JflKDW3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28FB10E83F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=cqCixF2Pc5MhdaJsgpzo2YJbIZacc7IssS0kDdn60Ns=; b=JflKDW3ySyVhq3WARCThhQnbfT
 F6rL0N6RJ6Oi/s3IWHZLTs9mS1bGK5B6YDeUQNjBteA1rNHqKsVB2W4VZU3BUwyxiQ5N3QKi0IRNk
 EOrorwfYyIP7SgRuVq8fsDzL8mOF7C6Jg12ow5sJqGQF8DY1sIoSJxTtNpeLSIg2lBSqBhob1Fml8
 bB+xpxrMRskBooncfxzEDj7Ro0NIJO2hgun+OyncWZuVhg8k1Nb0q+yVjjiihf4MT0diSQNzMCeDA
 WckDLy2jUecf2mwT+ZvN/7aidht/PPBxuWdlEol9AgfM2Cbs26izPUtFKlhBmM8NB0JNP/xA8jP/z
 tMDFXoTQ==;
Received: from i53875a97.versanet.de ([83.135.90.151] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vggSL-002bWj-Jy; Fri, 16 Jan 2026 10:49:26 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>, 
 dmitry.torokhov@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
 neil.armstrong@linaro.org, jagan@edgeble.ai, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, aweinzerl13@yahoo.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: input: touchscreen: goodix: Add "panel"
 property
Date: Fri, 16 Jan 2026 10:49:25 +0100
Message-ID: <7863194.oDFzTOozpa@diego>
In-Reply-To: <20260113195721.151205-6-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
 <20260113195721.151205-6-macroalpha82@gmail.com>
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

Hi Chris,

Am Dienstag, 13. Januar 2026, 20:57:20 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add a "panel" property to define a relationship between a touchscreen
> and an associated panel when more than one of each exist in a device.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 ++

This patch is part of a diverse series right now (drm-panel, input, dts)
and therefore possibly could be overlooked by Dmitry, as the patch should
likely go through the input subsystem (or would at least need an Ack from
Dmitry, for me to take it along) .

Best way would probably be to pick Rob's Ack and resend it separately
(pointing to this series as user).


Heiko


