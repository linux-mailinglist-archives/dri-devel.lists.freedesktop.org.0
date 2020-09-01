Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4A5258986
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 09:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965D36E81F;
	Tue,  1 Sep 2020 07:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76526E81F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 07:46:18 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0817k83L056118;
 Tue, 1 Sep 2020 02:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598946368;
 bh=IArKfXZjgWen9X3q7V/DQYJ14EV6u7IF2HjW9A6oRts=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=S3yYZOhgjNY+2Pafmm6vxaksZY3A6sXjztPLPMIHZ2lpaGx/hCS/oQEdZ74sq0E0L
 auF29YHwaaLT7+VLZe+VwoWhf5/OP6jY6wVzu12JzzKaeMD6qNErJj8RsPtVGMffVz
 CqVIiGTV/MXvKG/oGWxSnyxjB8d8JN+U7Zvp5AdI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0817k8vJ130624;
 Tue, 1 Sep 2020 02:46:08 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 02:46:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 02:46:07 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0817k3oJ118971;
 Tue, 1 Sep 2020 02:46:04 -0500
Subject: Re: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
To: Swapnil Jakhade <sjakhade@cadence.com>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
 <1598862215-10222-3-git-send-email-sjakhade@cadence.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <71452de7-80e7-0144-4802-e3370c00854b@ti.com>
Date: Tue, 1 Sep 2020 10:46:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598862215-10222-3-git-send-email-sjakhade@cadence.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 jsarha@ti.com, a.hajda@samsung.com, robh+dt@kernel.org, nikhil.nd@ti.com,
 mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Swapnil,

On 31/08/2020 11:23, Swapnil Jakhade wrote:

> +static int cdns_mhdp_validate_mode_params(struct cdns_mhdp_device *mhdp,
> +					  const struct drm_display_mode *mode,
> +					  struct drm_bridge_state *bridge_state)
> +{
> +	u32 tu_size = 30, line_thresh1, line_thresh2, line_thresh = 0;
> +	u32 rate, vs, vs_f, required_bandwidth, available_bandwidth;
> +	struct cdns_mhdp_bridge_state *state;
> +	int pxlclock;
> +	u32 bpp;
> +
> +	state = to_cdns_mhdp_bridge_state(bridge_state);
> +
> +	pxlclock = mode->crtc_clock;
> +
> +	/* Get rate in MSymbols per second per lane */
> +	rate = mhdp->link.rate / 1000;
> +
> +	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);

None of the above are used when calling cdns_mhdp_bandwidth_ok(). For clarity, I'd move the above
lines a bit closer to where they are needed, as currently it makes me think the above values are
used when checking the bandwidth.

> +	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
> +				    mhdp->link.rate)) {
> +		dev_err(mhdp->dev, "%s: Not enough BW for %s (%u lanes at %u Mbps)\n",
> +			__func__, mode->name, mhdp->link.num_lanes,
> +			mhdp->link.rate / 100);
> +		return -EINVAL;
> +	}
> +
> +	/* find optimal tu_size */
> +	required_bandwidth = pxlclock * bpp / 8;
> +	available_bandwidth = mhdp->link.num_lanes * rate;
> +	do {
> +		tu_size += 2;
> +
> +		vs_f = tu_size * required_bandwidth / available_bandwidth;
> +		vs = vs_f / 1000;
> +		vs_f = vs_f % 1000;
> +		/* Downspreading is unused currently */
> +	} while ((vs == 1 || ((vs_f > 850 || vs_f < 100) && vs_f != 0) ||
> +		 tu_size - vs < 2) && tu_size < 64);
> +
> +	if (vs > 64) {
> +		dev_err(mhdp->dev,
> +			"%s: No space for framing %s (%u lanes at %u Mbps)\n",
> +			__func__, mode->name, mhdp->link.num_lanes,
> +			mhdp->link.rate / 100);
> +		return -EINVAL;
> +	}
> +
> +	if (vs == tu_size)
> +		vs = tu_size - 1;
> +
> +	line_thresh1 = ((vs + 1) << 5) * 8 / bpp;
> +	line_thresh2 = (pxlclock << 5) / 1000 / rate * (vs + 1) - (1 << 5);
> +	line_thresh = line_thresh1 - line_thresh2 / mhdp->link.num_lanes;
> +	line_thresh = (line_thresh >> 5) + 2;
> +
> +	state->vs = vs;
> +	state->tu_size = tu_size;
> +	state->line_thresh = line_thresh;
> +
> +	return 0;
> +}
> +
> +static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
> +{
> +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	int ret;
> +
> +	mutex_lock(&mhdp->link_mutex);
> +
> +	if (!mhdp->plugged) {
> +		mhdp->link.rate = mhdp->host.link_rate;
> +		mhdp->link.num_lanes = mhdp->host.lanes_cnt;
> +	}
> +
> +	ret = cdns_mhdp_validate_mode_params(mhdp, mode, bridge_state);
> +
> +	mutex_unlock(&mhdp->link_mutex);
> +
> +	return ret;
> +}

Laurent mentioned that atomic_check should not change state. Note that
cdns_mhdp_validate_mode_params also changes state, as it calculates tu_size, vs and line_thresh.

There seems to be issues with mode changes, but I think the first step would be to clarify the
related code a bit. cdns_mhdp_validate_mode_params() is misnamed, I think it should be renamed to
calculate_tu or something like that.

cdns_mhdp_bandwidth_ok() should take display_fmt or bpp as a parameter, as currently it digs that up
from the current state.

Probably cdns_mhdp_validate_mode_params() would be better if it doesn't write the result to the
state, but returns the values. That way it could also be used to verify if suitable settings can be
found, without changing the state.

The are two issues I see with some testing, which are probably related.

The first one is that if I run kmstest with a new mode, I see tu-size & co being calculated. But the
calculation happens before link training, which doesn't make sense. So I think what's done here is
that atomic_check causes tu-size calculations, then atomic_enable does link training and enables the
video.

The second happens when my monitor fails with the first CR after power-on, and the driver drops
number-of-lanes to 2. It goes like this:

The driver is loaded. Based on EDID, fbdev is created with 1920x1200. Link training is done, which
has the CR issue, and because of that the actual mode that we get is 1280x960. I get a proper
picture here, so far so good.

Then if I run kmstest, it only allows 1280x960 as the link doesn't support higher modes (that's ok).
It the does link training and gets a 4 lane link, and enables 1280x960. But the picture is not ok.

If I then exit kmstest, it goes back to fbdev, but now that picture is broken also.

Running kmstest again gives me 1920x1200 (as the link has been 4 lane now), and the picture is fine.

I think the above suggests that the driver is not properly updating all the registers based on the
new mode and link. I tried adding cdns_mhdp_validate_mode_params() call to
cdns_mhdp_atomic_enable(), so that tu-size etc will be calculated, but that did not fix the problem.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
