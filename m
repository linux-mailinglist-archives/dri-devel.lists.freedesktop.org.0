Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFwQDRPwhWkPIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:43:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BAFE5AA
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A4710E66C;
	Fri,  6 Feb 2026 13:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Lc9IMgxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD86810E66C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1770385395; x=1770990195; i=markus.elfring@web.de;
 bh=jKh2vBusx+1Xm9OJQlBX5U+A0LddTbyzBzCEznqBUgA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Lc9IMgxsd8o9/fOSTJdwT+gvNgr4GYPCE7Gwv1uaAT299KDBSthieEmT26nFaIu3
 F3Tpsw1V1B2S2d3xMYA/X3tinY0j1sdTHK49jRrBlbFxKbC9la87Q9VpfJ1xhSNU4
 X0LLq5PV96kE+aBsrBY+Tu+O7Cbp8OKERtxPardWSd3FRhxXVnpCJ1R6SG6j6JtVc
 ezMXiBj2trmMxuw+WfyvkviR1u1jLxELUfiITKqyGDpClzFtUi8zDGtub5RPhEbE+
 sqq648ma+7cB/hQwYE6LCv2EB7WbSBdmIsCujQPxnOuI/pTzDlaI4BgP2tfs+UmiR
 uH5DE9HAEUZK4HWJfQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.223]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzkOR-1vagsM2j8z-017lRY; Fri, 06
 Feb 2026 14:43:15 +0100
Message-ID: <63c87d66-ffe6-46c9-9bd6-3d2cd58ca116@web.de>
Date: Fri, 6 Feb 2026 14:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Yan <andy.yan@rock-chips.com>,
 Andy Yan <andyshrk@163.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20260206040621.4095517-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH v4] drm/bridge: synopsys: dw-dp: Check return value of
 devm_drm_bridge_add() in dw_dp_bind()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260206040621.4095517-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JJwOw9BZVuS7CVuLYWhg7SUBR8EOmuvPtnEFpGEhCsP3wZiODn2
 pcpGyi5fYVY/JnJe4Uiz2soi97agxJOODf4i7F2bXMNv9fhCEgxOtCaEA3qYREDyjzf4cOv
 EDbBwyrX8bO2LnxUihASGaZ3oegiJ9rhm40vFGy0TsnbK8J2tCAO2AEWrgm15w56wl4asRr
 YAXLAdcqI2Bv7XBgsjm6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dryKVtT2aGM=;GqhfkqhOU9G2QAmi64IzPZSaOAk
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:andrzej.hajda@intel.com,m:andy.yan@rock-chips.com,m:andyshrk@163.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:laurent.pinchart@ideasonboard.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rgallaispou@gmail.com,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[web.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,rock-chips.com,163.com,gmail.com,kwiboo.se,ideasonboard.com,bootlin.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de];
	DKIM_TRACE(0.00)[web.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 810BAFE5AA
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
