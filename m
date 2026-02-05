Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACs1McBfhGng2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:15:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB6F0736
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF35810E816;
	Thu,  5 Feb 2026 09:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qyMfgDWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CDA10E816
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:15:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 18C254E4240D;
 Thu,  5 Feb 2026 09:15:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D84C2606FD;
 Thu,  5 Feb 2026 09:15:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8FC30119A88F8; Thu,  5 Feb 2026 10:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770282937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IhnniDnleOJRYD4v165EXk4k3ynNf9KHvznFDNU0nvA=;
 b=qyMfgDWdUTQb39ZA2e1rwvq040Mn39QlnEq8ButdLERRRFFrDldcetAZz+hJupSCvCKMSs
 3og3PxJEbJRAyHmGx4MLBlkufiTOxvW2QYvBFnt8UO0i8jCimxuR2GjbKG2D7YwV+5okuQ
 rMW9UwhQF5csUeyDCNqbcTiOIuqNnaFNRPKj3zf0QYteZ5rfgKHxAiiyy+ut2KXZIs7bZU
 5C19+DI9/j2CckJoiR48hRSQoqChpmlXeiChe6pVVD5StioCCW8iqm9MV/pYha+/sYkroQ
 kt3lCj+TGNCKjsuZt36p5XGAlFgknB1bKdmWdZnLorC3NiHf+6vvyyVFUdUvxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 10:15:31 +0100
Message-Id: <DG6WXBLE7CZ0.27X527V71HZ7N@bootlin.com>
Subject: Re: [PATCH] drm/imx: parallel-display: check return value of
 devm_drm_bridge_add() in imx_pd_probe()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Chen Ni" <nichen@iscas.ac.cn>, <p.zabel@pengutronix.de>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <louis.chauvet@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260204090629.2209542-1-nichen@iscas.ac.cn>
In-Reply-To: <20260204090629.2209542-1-nichen@iscas.ac.cn>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,pengutronix.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,nxp.com,bootlin.com];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3EBB6F0736
X-Rspamd-Action: no action

On Wed Feb 4, 2026 at 10:06 AM CET, Chen Ni wrote:
> Return the value of devm_drm_bridge_add() in order to propagate the
> error properly, if it fails due to resource allocation failure or bridge
> registration failure.
>
> This ensures that the probe function fails safely rather than proceeding
> with a potentially incomplete bridge setup.
>
> Fixes: bf7e97910b9f ("drm/imx: parallel-display: add the bridge before at=
taching it")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
