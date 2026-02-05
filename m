Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECH6FSRhhGng2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:21:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56EFF0905
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBCC10E132;
	Thu,  5 Feb 2026 09:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qtaCayC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D94710E132
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:21:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A8A06C243A6;
 Thu,  5 Feb 2026 09:21:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A2BC3606FD;
 Thu,  5 Feb 2026 09:21:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98734119A865B; Thu,  5 Feb 2026 10:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770283293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ty37LSAWvvUI6qAp67+JaVk7ExaFUkeXx5EXAWhMrmc=;
 b=qtaCayC10O/iglKC9KAONKb/mFoaRGMI9j30TDsCXIC7BLIHd4ztEbDFsTWtC1aqQWMCKs
 ONrOeFpuFtsNHacTMORdI041H0Q4O4E5krvkda6EVhxohm6gqKkiMHw8aWoWBX42EfrsVt
 AMAh3WcnHfza1IxaXtHp6OrDmuDovDaRf1fq5cokx6fIefkK4Et5QWv7+62UN+XprLixnG
 NSbUDwoLEeGNdSOSmdAuj5HXJ5IFY4Ic3pEyJlS9uR1+hR+dUTuG5T8aQchHLwoL1evNVM
 YLZ4ovWkBvHPtYPJuCjGCilq/FLt5wnYUOpYr5605jpAVHQ/Svv7CYRZ6TJtBA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 10:21:25 +0100
Message-Id: <DG6X1UEEWJMW.3ITO010UUHL69@bootlin.com>
Subject: Re: [PATCH v2] drm/bridge: synopsys: dw-dp: Check return value of
 devm_drm_bridge_add() in dw_dp_bind()
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Chen Ni"
 <nichen@iscas.ac.cn>, <andyshrk@163.com>,
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
 <DG6WQ5F88DOH.1ITTFO6WDJ4AS@bootlin.com>
In-Reply-To: <DG6WQ5F88DOH.1ITTFO6WDJ4AS@bootlin.com>
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
	FREEMAIL_TO(0.00)[bootlin.com,iscas.ac.cn,163.com,ideasonboard.com,gmail.com,intel.com,rock-chips.com,kwiboo.se,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de];
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
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D56EFF0905
X-Rspamd-Action: no action

On Thu Feb 5, 2026 at 10:06 AM CET, Luca Ceresoli wrote:
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
>> @@ -2049,7 +2049,11 @@ struct dw_dp *dw_dp_bind(struct device *dev, stru=
ct drm_encoder *encoder,
>>  	bridge->type =3D DRM_MODE_CONNECTOR_DisplayPort;
>>  	bridge->ycbcr_420_allowed =3D true;
>>
>> -	devm_drm_bridge_add(dev, bridge);
>> +	ret =3D devm_drm_bridge_add(dev, bridge);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "failed to add bridge\n");
>> +		return ERR_PTR(ret);
>> +	}
>
> Looks correct, but can be simpler:
>
> 	ret =3D devm_drm_bridge_add(dev, bridge);
> 	if (ret)
> 		return ERR_PTR(dev_err_probe(dev, ret, "failed to add bridge\n"));

I noticed you are doing the same fix in [0] but without logging a
message. Either is fine, but I don't see why using a different policy. I
think not logging anything for devm_drm_bridge_add() is fine, because the
only error it can return is on a small memory allocation which de facto
cannot happen. So I'm OK if you just ditch the message in v3.

[0] https://lore.kernel.org/lkml/20260204090629.2209542-1-nichen@iscas.ac.c=
n/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
