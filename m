Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAHqD5FdhGmn2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:06:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B371BF046E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016EE10E80E;
	Thu,  5 Feb 2026 09:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YeNJCCda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489FB10E80E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:06:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 713234E4240E;
 Thu,  5 Feb 2026 09:06:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43C79606FD;
 Thu,  5 Feb 2026 09:06:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88A95119A88EE; Thu,  5 Feb 2026 10:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770282378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EZW9RspXiOG1EsA4BrKT08TjY+AaRCXLFfK0GdRkHMM=;
 b=YeNJCCdaqFDQvB4UzlGTPuaV0Dig3NDBJzC7W4EkABm1898rR0xMFDMUgTR4pKgsKNN8cQ
 JpZfGfb9qqzBhNDd01h6flq7pTp5C7dOnvPRuyfOupekQ7KQEESoGRA+0wdYqu4JEK+PTT
 jyY2H/bkZe1OC+7HdCufQwyRaN7Bxkv/mqb5whz34Vj8dHSIxJWaPlTHG4DIChTImP+RWC
 7a3Y4BQEIScN+65a7ipOuykLajiWgixH00HU3AEs2YKD7nPOOfamx/xTLJDBU/Z6xBoeOE
 VndDslq3huFSsrBe5croU3ejQIPUgbeQcF/hpI5C1un4qDhVHM37lxL062tDcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 10:06:09 +0100
Message-Id: <DG6WQ5F88DOH.1ITTFO6WDJ4AS@bootlin.com>
Subject: Re: [PATCH v2] drm/bridge: synopsys: dw-dp: Check return value of
 devm_drm_bridge_add() in dw_dp_bind()
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Chen Ni" <nichen@iscas.ac.cn>, <andyshrk@163.com>,
 <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <rgallaispou@gmail.com>,
 <simona@ffwll.ch>, <tzimmermann@suse.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <3384b794.65bd.19c27b7d739.Coremail.andyshrk@163.com>
 <20260204092148.2309681-1-nichen@iscas.ac.cn>
In-Reply-To: <20260204092148.2309681-1-nichen@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
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
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,163.com,ideasonboard.com,gmail.com,intel.com,rock-chips.com,kwiboo.se,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B371BF046E
X-Rspamd-Action: no action

On Wed Feb 4, 2026 at 10:21 AM CET, Chen Ni wrote:
> Return the value of devm_drm_bridge_add() in order to propagate the
> error properly, if it fails due to resource allocation failure or bridge
> registration failure.
>
> This ensures that the bind function fails safely rather than proceeding
> with a potentially incomplete bridge setup.
>
> Fixes: b726970486d8 ("drm/bridge: synopsys: dw-dp: add bridge before atta=
ching")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Ah, good catch, thanks for the patch!

> ---
> Changes in v2:
> - Use ERR_PTR() instead of dev_err_ptr_probe().
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 432342452484..29fcba7a47d3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2049,7 +2049,11 @@ struct dw_dp *dw_dp_bind(struct device *dev, struc=
t drm_encoder *encoder,
>  	bridge->type =3D DRM_MODE_CONNECTOR_DisplayPort;
>  	bridge->ycbcr_420_allowed =3D true;
>
> -	devm_drm_bridge_add(dev, bridge);
> +	ret =3D devm_drm_bridge_add(dev, bridge);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to add bridge\n");
> +		return ERR_PTR(ret);
> +	}

Looks correct, but can be simpler:

	ret =3D devm_drm_bridge_add(dev, bridge);
	if (ret)
		return ERR_PTR(dev_err_probe(dev, ret, "failed to add bridge\n"));

Also, when sending a new iteration, it is common to _not_ send the patch as
a reply to the previous iteration. It can generate huge threads for long
series. Also I'd not be surprised if it confused some tools, even though I
just did a quick test with b4 and it seems to do the expected thing (take
v2, not v1).

Best regards,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
