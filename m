Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FAA9E9B4B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BAA10E03A;
	Mon,  9 Dec 2024 16:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="RXIxVbmg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A50010E2AA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 16:11:28 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1733760686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LIKxDul1PcRU3jEvG5gfDjtOJwNlmOXizKV8HI2OXjs=;
 b=RXIxVbmgY2RiTb762BtEh3yK1NiF08UMTYml4IZ5B/wiKXgNjViKlUeUFaVX+3E3qSp/1Y
 cfuWCkJ2A4IsyMt8dKd6GkYYPxsQhSbIlwICGT1cy/tvfuQK9hiBGAuQs+MJXHxb10NWgp
 9WKyi2/b4G15E1dOMuOPXv9LfSWMHhsA/ftIedCphTNKNGW3LryRQv7WIxS1V7jUpBWk7W
 czGzOrEdbCttwDJh7O87AMvdBgX2ZefrLtOzcVIWtX0VmbAvUZVf9xrVhLE9eyVnWNIr+V
 Qydg84tNNUpDhF6SGOyueLlAxPTJ3TmyDxLJy8SSEaWVTmdLPWY8aWHVPLc0dg==
Content-Type: multipart/signed;
 boundary=eefa09e675ebf91d252165db5d46d61f91efbf3c096cae57afe8caeae9bb;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 09 Dec 2024 17:11:03 +0100
Message-Id: <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org>
Cc: <Laurent.pinchart@ideasonboard.com>, <andrzej.hajda@intel.com>,
 <andy.yan@rock-chips.com>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>,
 <quentin.schulz@cherry.de>, <rfoss@kernel.org>, <robh@kernel.org>,
 <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Daniel Semkowicz" <dse@thaumatec.com>, <heiko@sntech.de>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
In-Reply-To: <20241209150619.33998-1-dse@thaumatec.com>
X-Migadu-Flow: FLOW_OUT
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

--eefa09e675ebf91d252165db5d46d61f91efbf3c096cae57afe8caeae9bb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> On 03.12.24 21:54, Heiko Stuebner wrote:
> > This series adds a bridge and glue driver for the DSI2 controller found
> > in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> >=20
>
> I did more tests with different LVDS displays. I tested following
> configurations with DSI/LVDS bridge:
> - 1024x600@60.01
> - 1024x768@60.02
> - 1280x800@60.07
> - 1366x768@60.06
>
> All of them worked without issues, except 1366x768.
> With this resolution, video is blurry, and offset incorrectly
> to the left. There are also repeating errors on the console:
>
>   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at=
 vp3
>
> In correct operation with other resolutions, there is no error.
> I am not sure if this is a problem in your series or rather in VOP2
> driver.

On my PineTab2 I got similar messages about 2 weeks ago:
rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp1

Preceding those, I got several panfrost related errors:

panfrost fde60000.gpu: get clock failed -517
panfrost fde60000.gpu: clk init failed -517
platform fde60000.gpu: deferred probe pending: (reason unknown)
platform cpufreq-dt: deferred probe pending: (reason unknown)
vdd_gpu_npu: disabling

But can also be that the PineTab2 (likely) needs regulator-always-on
and regulator-boot-on in its vdd_gpu_npu node.

> I tried to track down the problem, and it seems to be a generic issue
> when horizontal line width is not divisible by 4.
> Lowering line width to 1364px fixes the issue, but of course I have two
> vertical lines of black pixels on the right.
> I also made some tests with 720x1280 DSI display. Lowering horizontal
> line to 718px shows the same problem. With 720px and 716px it works
> correctly.

I haven't look further into it, but the PT2 has a 1280x800 resolution.

HTH,
  Diederik

--eefa09e675ebf91d252165db5d46d61f91efbf3c096cae57afe8caeae9bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ1cWnwAKCRDXblvOeH7b
bt6mAQC6vSnt+4gcL6mV0BWnp8ZL7iXn5fWiXFogAWGKMTLc7QEAoV2+ibpMQSek
0THMoeuvcpjes+GUp5Tq8DFptaTtHAE=
=lTYg
-----END PGP SIGNATURE-----

--eefa09e675ebf91d252165db5d46d61f91efbf3c096cae57afe8caeae9bb--
