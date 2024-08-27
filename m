Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BED960501
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 10:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7471610E270;
	Tue, 27 Aug 2024 08:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SkFzgDgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD32E10E270
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 08:58:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 128EAA41688;
 Tue, 27 Aug 2024 08:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D68EC8B7A5;
 Tue, 27 Aug 2024 08:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724749138;
 bh=brMwUnoxrTvNJcSO2RG6nxbRHtnEcIrTU0qQDmJE/7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SkFzgDgDObrJZ62sKyhzDaQWPSu69zfgIIlt6JriR+Pd+4k0BmqKPB5RbGnecjA+g
 qrGPlLmMaEkmKURMJdZtNLM/xOqwwECLm25Is6vmmxu4L3+ZRXd+ZdvABVItbUmZ4S
 /T1q9GAaxJgA06eVBchBKVVsoeQfjkYnrsjNIrwOPhYwTTF/XtFvX5ZDqw94r0x0MC
 HDe8z9qhw+nsOizgwq0aPnslhBS2LAXKi/fU7D1LcyI1BQQP9y+MwNcCDlNTRf3Ohd
 MH0JYXGNSbadD7+cswhubahggRqDZMbRHcFYw0ZvTvIm7gvhwoBy07crol/e58A2A+
 ZH5UQRyzp3JFg==
Date: Tue, 27 Aug 2024 10:58:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v4 2/4] drm/bridge: synopsys: Add DW HDMI QP TX
 Controller support library
Message-ID: <20240827-armored-magnificent-badger-ffb025@houat>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-2-6417c72a2749@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7d6czoxivc6cezpy"
Content-Disposition: inline
In-Reply-To: <20240819-b4-rk3588-bridge-upstream-v4-2-6417c72a2749@collabora.com>
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


--7d6czoxivc6cezpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2024 at 01:29:29AM GMT, Cristian Ciocaltea wrote:
> +static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
> +{
> +	struct dw_hdmi_qp *hdmi = dev_id;
> +	struct dw_hdmi_qp_i2c *i2c = hdmi->i2c;
> +	u32 stat;
> +
> +	stat = dw_hdmi_qp_read(hdmi, MAINUNIT_1_INT_STATUS);
> +
> +	i2c->stat = stat & (I2CM_OP_DONE_IRQ | I2CM_READ_REQUEST_IRQ |
> +			    I2CM_NACK_RCVD_IRQ);
> +
> +	if (i2c->stat) {
> +		dw_hdmi_qp_write(hdmi, i2c->stat, MAINUNIT_1_INT_CLEAR);
> +		complete(&i2c->cmp);
> +	}
> +
> +	if (stat)
> +		return IRQ_HANDLED;
> +
> +	return IRQ_NONE;
> +}

If the scrambler is enabled, you need to deal with hotplug. On hotplug,
the monitor will drop its TMDS ratio and scrambling status, but the
driver will keep assuming it's been programmed.

If you don't have a way to deal with hotplug yet, then I'd suggest to
just drop the scrambler setup for now.

Maxime

--7d6czoxivc6cezpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs2VRgAKCRAnX84Zoj2+
doR9AX9jVRhemySX3ezsY45XTCyYbffOw0vhn1iAZ9FcKrlkjaZ1jF3VuvQVlqV+
CgkFKFwBfRfYZWXSy78SdiB2VLCDGrHhrKCyjwCWW4R2Le9bIP4lzSh1HDBv4FFA
JXPD9gbLhA==
=OVt5
-----END PGP SIGNATURE-----

--7d6czoxivc6cezpy--
