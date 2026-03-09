Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FV1FHXmrmlfKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:25:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2726C23B9BC
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4010E541;
	Mon,  9 Mar 2026 15:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MNAmv8fD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C96310E53E;
 Mon,  9 Mar 2026 15:25:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 74401600B0;
 Mon,  9 Mar 2026 15:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B133C2BC86;
 Mon,  9 Mar 2026 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773069936;
 bh=fBBN7nvLIOBBwvSPB0nsIwVG0Bl8ydOvAnuxSNjiMJ4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=MNAmv8fDnhYtxM0AqvHEvs5plNOfcFG5T5i+Ja+7DrxyZIGfF1AAYnIY+u3KsprMG
 JMuD8rHTrFsGxJuWtPzYn1oTpX5E/S8Wt7w6/5DuKx+fhf450UI35MM2GkY6PE1bKn
 maJdvsjJrMxdqAY0d4lhnCsvLP7aIkDoSGt+jsXb5ntSN4HlTvmbbzBDcMOZTgsLKA
 fu7AB0yWeg/bOhCRg6RIQcQ9MK05WUSRy63p/aUCNSck2EKbYfMnfl3bpUTcKRp5/z
 yCwhrXd/YmGiRCR7yH6ahfW4bFw3FHW/3DByDbQ0Kvt31TJT8Tpqn8CtNZmxqUy8dU
 GlADCxlH2vpOw==
Message-ID: <da696271d7b5e27569f026d4f7c2ab82@kernel.org>
Date: Mon, 09 Mar 2026 15:25:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 03/22] drm: Add new general DRM property "color format"
In-Reply-To: <20260305-color-format-v10-3-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-3-a58c68a11868@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andri Yngvason" <andri@yngvason.is>,
 "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo
 Li" <sunpeng.li@amd.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marius
 Vlad" <marius.vlad@collabora.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Robert
 Foss" <rfoss@kernel.org>, "Rodrigo Siqueira" <siqueira@igalia.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, "Sandy Huang" <hjc@rock-chips.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, "Werner Sembach" <wse@tuxedocomputers.com>
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 2726C23B9BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.19 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,lists.infradead.org,vger.kernel.org,amd.com,yngvason.is,intel.com,rock-chips.com,gmail.com,kernel.org,sntech.de,linux.intel.com,kwiboo.se,lwn.net,ideasonboard.com,linaro.org,igalia.com,pengutronix.de,linuxfoundation.org,ffwll.ch,suse.de,ursulin.net,tuxedocomputers.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 15:19:29 +0100, Nicolas Frattaroli wrote:
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
> 
> Possible options are:
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
