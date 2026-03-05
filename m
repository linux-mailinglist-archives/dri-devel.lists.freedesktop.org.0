Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K9ZK+1VqWng5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:07:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620ED20F66E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5D310EC01;
	Thu,  5 Mar 2026 10:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bT09/vEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC5410E28C;
 Thu,  5 Mar 2026 10:07:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772705241; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JyfVnP4+KszQmwuoXFZ8ruIZigZfqrPygzLjs/1DRhk05ABitc8xkW/a70ttnvAIlnkhv9vm5jBb1evLXmu8LLKNpxw0hcUJUB1WUcIBnGdNgdCbYmZclDOKZNoQSjlAkIB6Aku5ctzZ/EEhO4TsAa+tImSBL5aG5oKKh68gKqg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772705241;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nszGsxugf+CGTQes71iM3DAN6Pzn2MLUlpTJlv1vBJI=; 
 b=TsmeHq/rZ93VEmsTOB6uoSvG8hVoDmDbtT5QPjlJFPmzWzfvMdcqJD2mNWBv/B6p/6hRcYN8bDX25/lPRMYkDE4+sLlAyM3RvWVQcBlkDBFB/6ErcCHquAoL0WCQEtdtR8x9GMozNsxBLQsYKGNLz4SqWLjSkWHmUGuVByLmdts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772705241; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=nszGsxugf+CGTQes71iM3DAN6Pzn2MLUlpTJlv1vBJI=;
 b=bT09/vEjLQZtoqDIHdb9LiaSgYzDW0jBTU6ABmJ+Zndtis8AZZw4PxDwFtuuAz7J
 z6/YDMnfDNqNed5d0JD1VmhrN0hraVni8ZJSH9/0onUpXW4Pbtby87TuYDDCYnGXAfu
 7ZKGkVloRwcZglAOZWYmlVHdKU4MLxKWdWcfbN30=
Received: by mx.zohomail.com with SMTPS id 1772705239022996.0545573857447;
 Thu, 5 Mar 2026 02:07:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Andri Yngvason <andri@yngvason.is>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
Date: Thu, 05 Mar 2026 11:07:09 +0100
Message-ID: <5733371.31r3eYUQgx@workhorse>
In-Reply-To: <20260305-just-oxpecker-of-reward-e05e4f@houat>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
 <20260305-just-oxpecker-of-reward-e05e4f@houat>
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
X-Rspamd-Queue-Id: 620ED20F66E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	CTE_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,yngvason.is,tuxedocomputers.com];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thursday, 5 March 2026 10:28:11 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 4af91e252fbd..b5bc93856ad1 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -579,6 +579,91 @@ enum drm_output_color_format {
> >  	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> >  };
> >  
> > +/* Do not forget to adjust after modifying &enum drm_output_color_format */
> > +#define DRM_OUTPUT_COLOR_FORMAT_COUNT 4
> 
> Maybe we can put that as the last variant of our enum so we don't have
> to always update it?

That will then cause a bunch of potential warnings for any of the switch
cases that convert from one thing to the other. At least my LSP indicated
so. I guess I can ignore those (and wouldn't be surprised if they were
already ignored by the Makefiles and the LSP just didn't pick up on this
somehow.) I'll do that in the next revision if you're fine with this.
Potentially, I'll have to add a default case to some switch statements
that just does a WARN() or something.

I do wish C had a better way to deal with setting a symbol to the number
of valid enum values without making it itself a valid enum value.

> 
> > +/**
> > + * enum drm_connector_color_format - Connector Color Format Request
> > + *
> > + * This enum, unlike &enum drm_output_color_format, is used to specify requests
> > + * for a specific color format on a connector through the DRM "color format"
> > + * property. The difference is that it has an "AUTO" value to specify that
> > + * no specific choice has been made.
> > + */
> > +enum drm_connector_color_format {
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> > +	 * helpers should pick a suitable color format. All implementations of a
> > +	 * specific display protocol must behave the same way with "AUTO", but
> > +	 * different display protocols do not necessarily have the same "AUTO"
> > +	 * semantics.
> > +	 *
> > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> > +	 * bandwidth required for full-scale RGB is not available, or the mode
> > +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> > +	 * YCbCr 4:2:0.
> > +	 *
> > +	 * For display protocols other than HDMI, the recursive bridge chain
> > +	 * format selection picks the first chain of bridge formats that works,
> > +	 * as has already been the case before the introduction of the "color
> > +	 * format" property. Non-HDMI bridges should therefore either sort their
> > +	 * bus output formats by preference, or agree on a unified auto format
> > +	 * selection logic that's implemented in a common state helper (like
> > +	 * how HDMI does it).
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> > +	 * not subsampled)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> > +	 * with horizontal subsampling)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> > +	 * with horizontal and vertical subsampling)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > +};
> > +
> > +/* Do not forget to adjust after modifying &enum drm_connector_color_format */
> > +#define DRM_CONNECTOR_COLOR_FORMAT_COUNT 5
> 
> Ditto
> 
> Maxime
> 




