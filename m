Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uECwOKzAlmmzlwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:50:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF315CCC3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E439D10E0C6;
	Thu, 19 Feb 2026 07:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tdJwyZ47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B635010E0C6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 07:49:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AA6CD6013F;
 Thu, 19 Feb 2026 07:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85379C4CEF7;
 Thu, 19 Feb 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771487398;
 bh=ZTsJZQGNGuNyEZqHtlkF16M63qPvKht4Gw6M1DOfbDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdJwyZ47qnFcMs2kXrzQKabmrgHl6qFrpwkx6c31Nvoc1WNs9TGGRuVeY8VL0vfTQ
 ZQD9sTldH+YlqwchYTYmSC1CAHnOLqakR9E1dYxjS4bHLYIhvgDcV67THtT9w3e6IC
 5OmUjUFxryetq+Kld6RI8o9DJmJqBkpOm7yJqrIsswmQWXjBHeWjmam9rU1D8eKBCM
 +Nk97alkgcgRLmCof1xEUSNf8fmKjYDhpCnSP4oZSe16xXm5oMtfnNuQ3xdd/9y2h6
 8rC5AYFBLCvd72rXGT1tSx96/TCHL9Cc26nIu1wpgEuYcv2ow0U3toQi5XqzY0J7md
 k0iWXdkw5YM3w==
Date: Thu, 19 Feb 2026 08:49:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: Re: [PATCH v4 2/3] dt-bindings: display: panel: add LXD M9189A
Message-ID: <20260219-overjoyed-koala-of-warranty-bbcc73@quoll>
References: <20260218-drm-panel-ek79007ad3-v4-0-8ec448bf3ede@pengutronix.de>
 <20260218-drm-panel-ek79007ad3-v4-2-8ec448bf3ede@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218-drm-panel-ek79007ad3-v4-2-8ec448bf3ede@pengutronix.de>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:m.tretter@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:r.czerwinski@pengutronix.de,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:kernel@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 71EF315CCC3
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 10:12:05AM +0100, Michael Tretter wrote:
> From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> 
> The LXD M9189A is a 1024x600 MIPI-DSI panel.
> 
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changes in v4:
> - Remove "YAML schema for" from subject line
> - Make backlight a required property

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

