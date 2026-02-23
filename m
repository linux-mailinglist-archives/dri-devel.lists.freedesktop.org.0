Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB+iJnA4nGlCBgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:22:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F26F1756AD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6EE10E36F;
	Mon, 23 Feb 2026 11:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ey8Oc4N/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B588510E36A;
 Mon, 23 Feb 2026 11:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771845726; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S2IB7ZD6DSdp0K9Cc0NBmF40o2LhuWVfCMBxDrxcFijbXLcaH0Lyf5O+2kZkLiznNdkANWcE+BWKHonsRq9KrsrbjcrODuvcKSNxIqKHvtuAbvhQuY8SR2HXpfIgKNQxPAR0kwT3+1adyLsr7+PsZ0/XmR6FDUPRTzuOt2Q3rRg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771845726;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zE1zLu6pL3uqgPGPzZfTY/83E+cY4Cd10iRFX9/SaOs=; 
 b=Po53vDPX65HL6NClbbr3hhqP5yF7v8feEJRZ4aacu/eltttbeEFv2plJ6LJDIZFQ3ye/Yf/DnnD0kAORtkCD42bluLAxEQFl4MrlEVKBONaQE3/CtleL1546UG23I8FrPP7I7OKil6TwHw40C4Q84Y58qH6kwlEbMoRxjwnYajw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771845726; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=zE1zLu6pL3uqgPGPzZfTY/83E+cY4Cd10iRFX9/SaOs=;
 b=ey8Oc4N/ijwyIwISAsnqyuzxwVpaDXPyWdOQrkVUmuNLUqcBICMAqwTs8Zyvf7Uk
 V3SFa2egcB4yao+jcsR4TTgjiNmrdjggG0klVO2zrceXcT92E/POQQ6LygQdb1+w9tA
 wV1bodCAlzCCpYR9uF+d/exsYpJDZf2sbF9djF+0=
Received: by mx.zohomail.com with SMTPS id 1771845725129427.58768335061166;
 Mon, 23 Feb 2026 03:22:05 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 13/20] drm/bridge: dw-hdmi-qp: Implement
 atomic_get_output_bus_fmts
Date: Mon, 23 Feb 2026 12:21:56 +0100
Message-ID: <5968719.DvuYhMxLoT@workhorse>
In-Reply-To: <ff7b531a-77c1-4c7d-b09d-47779b640193@collabora.com>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
 <20260216-color-format-v8-13-5722ce175dd5@collabora.com>
 <ff7b531a-77c1-4c7d-b09d-47779b640193@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim]
X-Rspamd-Queue-Id: 3F26F1756AD
X-Rspamd-Action: no action

On Sunday, 22 February 2026 11:42:39 Central European Standard Time Cristian Ciocaltea wrote:
> Hi Nicolas,
> 
> On 2/16/26 3:01 PM, Nicolas Frattaroli wrote:
> > The atomic_get_output_bus_fmts callback is used by the DRM bridge layer
> > to recursively select a suitable output format in a bridge chain.
> > 
> > As a bridge that outputs to HDMI, dw-hdmi-qp will have its output
> > formats determined by which formats the platform-specific integration of
> > the hardware supports, and the chosen HDMI output bit depth.
> > 
> > Implement this callback. The returned u32* buffer is supposed to be
> > freed by the caller of this callback, as specified by the callback's
> > documentation.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 178 +++++++++++++++++++++++++++
> >  1 file changed, 178 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > index d649a1cf07f5..4c00218e5fd7 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/export.h>
> >  #include <linux/i2c.h>
> >  #include <linux/irq.h>
> > +#include <linux/media-bus-format.h>
> >  #include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > @@ -749,6 +750,182 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
> >  	return adap;
> >  }
> >  
> > +static int dw_hdmi_qp_config_avi_infoframe(struct dw_hdmi_qp *hdmi,
> > +					   const u8 *buffer, size_t len)
> > +{
> > +	u32 val, i, j;
> > +
> > +	if (len != HDMI_INFOFRAME_SIZE(AVI)) {
> > +		dev_err(hdmi->dev, "failed to configure avi infoframe\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/*
> > +	 * DW HDMI QP IP uses a different byte format from standard AVI info
> > +	 * frames, though generally the bits are in the correct bytes.
> > +	 */
> > +	val = buffer[1] << 8 | buffer[2] << 16;
> > +	dw_hdmi_qp_write(hdmi, val, PKT_AVI_CONTENTS0);
> > +
> > +	for (i = 0; i < 4; i++) {
> > +		for (j = 0; j < 4; j++) {
> > +			if (i * 4 + j >= 14)
> > +				break;
> > +			if (!j)
> > +				val = buffer[i * 4 + j + 3];
> > +			val |= buffer[i * 4 + j + 3] << (8 * j);
> > +		}
> > +
> > +		dw_hdmi_qp_write(hdmi, val, PKT_AVI_CONTENTS1 + i * 4);
> > +	}
> > +
> > +	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_AVI_FIELDRATE, PKTSCHED_PKT_CONFIG1);
> > +
> > +	dw_hdmi_qp_mod(hdmi, PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN,
> > +		       PKTSCHED_AVI_TX_EN | PKTSCHED_GCP_TX_EN, PKTSCHED_PKT_EN);
> > +
> > +	return 0;
> > +}
> > +
> > +static int dw_hdmi_qp_config_drm_infoframe(struct dw_hdmi_qp *hdmi,
> > +					   const u8 *buffer, size_t len)
> > +{
> > +	u32 val, i;
> > +
> > +	if (len != HDMI_INFOFRAME_SIZE(DRM)) {
> > +		dev_err(hdmi->dev, "failed to configure drm infoframe\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_TX_EN, PKTSCHED_PKT_EN);
> > +
> > +	val = buffer[1] << 8 | buffer[2] << 16;
> > +	dw_hdmi_qp_write(hdmi, val, PKT_DRMI_CONTENTS0);
> > +
> > +	for (i = 0; i <= buffer[2]; i++) {
> > +		if (i % 4 == 0)
> > +			val = buffer[3 + i];
> > +		val |= buffer[3 + i] << ((i % 4) * 8);
> > +
> > +		if ((i % 4 == 3) || i == buffer[2])
> > +			dw_hdmi_qp_write(hdmi, val,
> > +					 PKT_DRMI_CONTENTS1 + ((i / 4) * 4));
> > +	}
> > +
> > +	dw_hdmi_qp_mod(hdmi, 0, PKTSCHED_DRMI_FIELDRATE, PKTSCHED_PKT_CONFIG1);
> > +	dw_hdmi_qp_mod(hdmi, PKTSCHED_DRMI_TX_EN, PKTSCHED_DRMI_TX_EN,
> > +		       PKTSCHED_PKT_EN);
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Static values documented in the TRM
> > + * Different values are only used for debug purposes
> > + */
> > +#define DW_HDMI_QP_AUDIO_INFOFRAME_HB1	0x1
> > +#define DW_HDMI_QP_AUDIO_INFOFRAME_HB2	0xa
> > +
> > +static int dw_hdmi_qp_config_audio_infoframe(struct dw_hdmi_qp *hdmi,
> > +					     const u8 *buffer, size_t len)
> > +{
> > +	/*
> > +	 * AUDI_CONTENTS0: { RSV, HB2, HB1, RSV }
> > +	 * AUDI_CONTENTS1: { PB3, PB2, PB1, PB0 }
> > +	 * AUDI_CONTENTS2: { PB7, PB6, PB5, PB4 }
> > +	 *
> > +	 * PB0: CheckSum
> > +	 * PB1: | CT3    | CT2  | CT1  | CT0  | F13  | CC2 | CC1 | CC0 |
> > +	 * PB2: | F27    | F26  | F25  | SF2  | SF1  | SF0 | SS1 | SS0 |
> > +	 * PB3: | F37    | F36  | F35  | F34  | F33  | F32 | F31 | F30 |
> > +	 * PB4: | CA7    | CA6  | CA5  | CA4  | CA3  | CA2 | CA1 | CA0 |
> > +	 * PB5: | DM_INH | LSV3 | LSV2 | LSV1 | LSV0 | F52 | F51 | F50 |
> > +	 * PB6~PB10: Reserved
> > +	 *
> > +	 * AUDI_CONTENTS0 default value defined by HDMI specification,
> > +	 * and shall only be changed for debug purposes.
> > +	 */
> > +	u32 header_bytes = (DW_HDMI_QP_AUDIO_INFOFRAME_HB1 << 8) |
> > +			  (DW_HDMI_QP_AUDIO_INFOFRAME_HB2 << 16);
> > +
> > +	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS0, &header_bytes, 1);
> > +	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS1, &buffer[3], 1);
> > +	regmap_bulk_write(hdmi->regm, PKT_AUDI_CONTENTS2, &buffer[4], 1);
> > +
> > +	/* Enable ACR, AUDI, AMD */
> > +	dw_hdmi_qp_mod(hdmi,
> > +		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
> > +		       PKTSCHED_ACR_TX_EN | PKTSCHED_AUDI_TX_EN | PKTSCHED_AMD_TX_EN,
> > +		       PKTSCHED_PKT_EN);
> > +
> > +	/* Enable AUDS */
> > +	dw_hdmi_qp_mod(hdmi, PKTSCHED_AUDS_TX_EN, PKTSCHED_AUDS_TX_EN, PKTSCHED_PKT_EN);
> > +
> > +	return 0;
> > +}
> 
> Something's wrong with this patch as all the functions above have been dropped
> since the HDMI VSI & SPD InfoFrames series [1] got merged.  The previous
> revision was fine though, hence that's likely an unexpected artifact of the
> latest rebase.

Oops, yeah, I think I messed this up during rebase. Thanks for letting me know!

> 
> [1] https://lore.kernel.org/all/20260129-dw-hdmi-qp-iframe-v2-0-0157ad05232c@collabora.com/
> 




