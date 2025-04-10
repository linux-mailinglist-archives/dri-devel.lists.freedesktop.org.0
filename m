Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7225CA843AC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAFF10E985;
	Thu, 10 Apr 2025 12:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="x4HPNisg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FCD10E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=a4JIrqkWV6pq9frxXOKtyCpnd6YTeQcQLBm37c334dE=; b=x4HPNisgK9SWArZLW9LHQRU9B/
 sdGwquoaDF0JSYE516Kwo4fHX/sEeACBtYq4h0r2wGgB4qh7P1qTIgC31aKiNueTsIKA6zY2I4v/3
 O/qCzfycQpiRSt8I5PgyUBnE3AzlsbwM9OVpsbbJjDlP8s8RRk4wzvlUVWHt4am2Bdq57msyZj2oj
 dQjEgOqO4LQbKpWJGJ8SZpBUH5ScSJB2I3unnZwUqpwe0LH3pwbuJvPrvd26Pyb7kCa6Ov9raMLsu
 p/28fm94cpHLhbllptaNhGD0/rlwOnRKGTZThJC8lmm9Aj67zgWyDfkNvhojuZ54DU9vWfjxySrgB
 cAiUihSQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1u2rNX-0007NU-4d; Thu, 10 Apr 2025 14:51:35 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: lumag@kernel.org, Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Avoid including uapi headers
Date: Thu, 10 Apr 2025 14:51:34 +0200
Message-ID: <3022515.VdNmn5OnKV@diego>
In-Reply-To: <20250314075754.539221-1-andyshrk@163.com>
References: <20250314075754.539221-1-andyshrk@163.com>
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

Hi Andy,

Am Freitag, 14. M=C3=A4rz 2025, 08:57:47 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> It is not recommended for drivers to include UAPI header
> directly.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


But looking at=20
	scripts/get_maintainer.pl -f drivers/gpu/drm/bridge
it seems like your cc-list is missing bridge people:

Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE =
CHIPS)
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRID=
GE CHIPS)
Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS =
=46OR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE =
CHIPS)


> ---
>=20
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 0890add5f707..306e09a24a1c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -22,8 +22,8 @@
> =20
>  #include <media/cec-notifier.h>
> =20
> -#include <uapi/linux/media-bus-format.h>
> -#include <uapi/linux/videodev2.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
> =20
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/display/drm_hdmi_helper.h>
>=20




