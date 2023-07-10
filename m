Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9574D993
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 17:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6694A10E1B6;
	Mon, 10 Jul 2023 15:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D969010E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=fXW2iwuEasBaakvFEnxtCVpluF+/2XyN0DqTEyNbwo4=;
 b=b17cmgR5dJGwA0Dk6g+Q+OvMk1EMbPogGbeV4tgz6bK4+FjeHZbeIxlp+/i4V8ZH5o1w+qMxrtysY
 YB6QZ7TAQS6lLgt98GNK/0bdHW3VgKYMo97SnS1/UNXoNov6DzaNlsJEMnq1YTk9GkYoCnety396Xj
 LYrrlae16bXnAcgNKt9hCuDxtSP1y5tACE6s1qvjFVVeZqTB/CKMLqcTbQCR1R9Xg/+8wmLkcmwvly
 w4gRJwcXKsFW89nos6/rW2yzahQK11Al12nwQpOm9bV0X/Ydl0756qqWeNCZ6G7lFnvxqpJYivRsAl
 pGrCjPuSQCo33sAqiH1UUm+2k6W3qng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=fXW2iwuEasBaakvFEnxtCVpluF+/2XyN0DqTEyNbwo4=;
 b=pfBe7R3sTfxJ815RFUxT6OnMAgw5P1idkPq03/VCAkSImfQs1gnk1pR8cUO/MKwT7AgxsaXAfFT+8
 t6M0IZHBg==
X-HalOne-ID: 9bdb67b0-1f33-11ee-93b1-5ba399456a4a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 9bdb67b0-1f33-11ee-93b1-5ba399456a4a;
 Mon, 10 Jul 2023 15:08:24 +0000 (UTC)
Date: Mon, 10 Jul 2023 17:08:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH v7 5/8] drm/bridge: sii902x: Support format negotiation
 hooks
Message-ID: <20230710150822.GA5237@ravnborg.org>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
 <20230606082142.23760-6-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606082142.23760-6-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Robert Foss <rfoss@kernel.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Devarsh Thakkar <devarsht@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Francesco Dolcini <francesco@dolcini.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aradhya,

On Tue, Jun 06, 2023 at 01:51:39PM +0530, Aradhya Bhatia wrote:
> With new connector model, sii902x will not create the connector, when
> DRM_BRIDGE_ATTACH_NO_CONNECTOR is set and SoC driver will rely on format
> negotiation to setup the encoder format.
> 
> Support format negotiations hooks in the drm_bridge_funcs.
> Use helper functions for state management.
> 
> Input format is selected to MEDIA_BUS_FMT_RGB888_1X24 as default, as is
> the case with older model.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

As noted by Javier, this patch-set was forgotten, so sorry for not
providing timely feedback.


> ---
> 
> Notes:
> 
>     changes from v6:
>     * Add Neil Armstrong's R-b tag.
> 
>  drivers/gpu/drm/bridge/sii902x.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index ef66461e7f7c..70aeb04b7f77 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -473,6 +473,27 @@ static struct edid *sii902x_bridge_get_edid(struct drm_bridge *bridge,
>  	return sii902x_get_edid(sii902x, connector);
>  }
>  
> +static u32 *sii902x_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +						     struct drm_bridge_state *bridge_state,
> +						     struct drm_crtc_state *crtc_state,
> +						     struct drm_connector_state *conn_state,
> +						     u32 output_fmt,
> +						     unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}

An alternative implementation of the above is:
{
        switch (output_fmt) {
        case MEDIA_BUS_FMT_RGB888_1X24:
                break;

        default:
        /* Fail for any other formats */
               *num_input_fmts = 0;
                return NULL;
        }

       return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
                                                         crtc_state, conn_state,
                                                         output_fmt,
                                                         num_input_fmts);
}

If you agree and have the time to do it it would be nice to use this
simpler variant.
Mostly so we avoid more open coded variants like you already did, and
which we have plenty of already.

It would be even better to walk through other implementations of
get_input_bus_fmts and update them accordingly.

Again, sorry for being late here. Feel free to ignore if you already
moved on with something else.

	Sam

