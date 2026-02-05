Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMIiM3CVhGmL3gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:04:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27229F2F35
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6BA10E894;
	Thu,  5 Feb 2026 13:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="DO0KrEb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ECE10E894
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1770296660; x=1770901460; i=markus.elfring@web.de;
 bh=jKh2vBusx+1Xm9OJQlBX5U+A0LddTbyzBzCEznqBUgA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DO0KrEb1FamMcrsGWGSqnVrOzTAH7KDgXH7MrE+hs2UNWfeSHYc+91083yIAhRdc
 b9dBH+5Yh7aw7YMtJjTd+GwpecQwzsSh0LYMVzmm43w54qGiug3UsFcbeYvXbzmwB
 q7i8RQcNYJ76cEWIAjgXSqkAjjVCZws4DlEcgtuaIk4stBnaseXfUhyaABq9veAh9
 r6v+wuakUjUNT+9gtSLdXsir8WwIzQMQq678de1wDmHV8oCeh4cMebvUSW3bSTeUd
 CeLWKLCiM8jJJxgTJStjBac3rJLCPEa+VQM0KcW98hi3kplU+/VI98aEGSY/HpCi9
 sYRd6rRJWM27t3oNuQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.222]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M7Nmo-1vtTCq2LWO-00DKWj; Thu, 05
 Feb 2026 14:04:20 +0100
Message-ID: <25f6072e-3d3e-4032-a87f-4fea5dbc4570@web.de>
Date: Thu, 5 Feb 2026 14:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260204090629.2209542-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/imx: parallel-display: check return value of
 devm_drm_bridge_add() in imx_pd_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260204090629.2209542-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ud2wSVcy20aQJjydqr4TUnHm7GiXoLxshjfaZytS4ZHtBSznu0L
 ZTxqnGXoOHiafrty2WQssiWpYgqTy1cvN8RjtJpXHOFqIv0ya5WaWMPQuesOgWRw2I7kpfE
 g/kTzn+ytJPf9HMoRCtbvJX+LCiR/oyUk2fm3N8ivQiHKCVyeg5+wzAOE7YEJyFmgfRjC0R
 Z4QWjYCGT9HiFZpef/JEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HqR7addawYU=;K2d5DM65T7JsgyhEusGD9iwKeIH
 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
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:imx@lists.linux.dev,m:kernel@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:airlied@gmail.com,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:louis.chauvet@bootlin.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:p.zabel@pengutronix.de,m:s.hauer@pengutronix.de,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,lists.linux.dev,lists.freedesktop.org,pengutronix.de,lists.infradead.org,gmail.com,nxp.com,bootlin.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 27229F2F35
X-Rspamd-Action: no action

> Return the value of devm_drm_bridge_add() in order to propagate the
> error properly, if it fails due to resource allocation failure or bridge
> registration failure.
=E2=80=A6

* Were any source code analysis tools involved here?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv6.19-rc8#n34


Regards,
Markus
