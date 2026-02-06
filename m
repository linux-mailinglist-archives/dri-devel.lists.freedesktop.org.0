Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NxiCTvrhWk0IQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:23:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CB0FE10A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C7B10E635;
	Fri,  6 Feb 2026 13:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="CmAypNvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D380D10E635
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1770384139; x=1770988939; i=markus.elfring@web.de;
 bh=jKh2vBusx+1Xm9OJQlBX5U+A0LddTbyzBzCEznqBUgA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CmAypNvZuDpkwXvbkJx+jC+5OEgH3LCjHQ9v0m1Kpd7lV0LHx5vGufQoNFSzrDhp
 MvuH8A7jjVpuASAOsMyrbwMEwqnXbkbbgR1daIU6roUwygfARJI6jXxBKgOvOO/6U
 50LoMACAa73FH35OzU5QsMSGL4Ub9sSlxNoEvor4fEbDfpsxLD1nRxX72bmO00mUW
 4Qm8toOvUfKwk6iaton95A6D1ePw7Mzu1vY4yn0J1Dv/1hQkdsqmhL7g88D2uQlmN
 In9am/t2d2rvTlLs9xR8Dao9SWB/+tZCKOj+5NJdWxfwobVKRpsEu2tojh5RpC+Di
 PcyKynynzBwyn2ArlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.223]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4vNe-1veDR03u8i-00tRKj; Fri, 06
 Feb 2026 14:22:19 +0100
Message-ID: <18944dc6-8ebc-4712-ac73-aab8d41b9dfa@web.de>
Date: Fri, 6 Feb 2026 14:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Yan <andy.yan@rock-chips.com>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20260206023015.3876957-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH v3] drm/bridge: synopsys: dw-dp: Check return value of
 devm_drm_bridge_add() in dw_dp_bind()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260206023015.3876957-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p6izZ7xYlNJa2K4yrVlSlaJfAJ0PsWqAbFn02ChYH1KDvQ+CXWe
 yyQFUrdB6fxn7FNtjvN6JuJ6tkxFBCh5hz9yZUrDhdAaOhY/XAS75YeyAojpVuMq9EPDNw6
 AMq0K23n3Dy2bQ8obw/gGzGscavieQjhVkvgJYjU/HjRaXU4b6i8ktDsgQv4eJ6i/CwMEsz
 7dXGCnr/mqTS8Ox9LSJIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MaUylmIYPfI=;CP/773al1mdWRGdnkE0G3SsAuCK
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
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:andrzej.hajda@intel.com,m:andy.yan@rock-chips.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:laurent.pinchart@ideasonboard.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rgallaispou@gmail.com,m:rfoss@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[web.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,rock-chips.com,gmail.com,kwiboo.se,ideasonboard.com,bootlin.com,linux.intel.com,kernel.org,linaro.org,ffwll.ch,suse.de];
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
X-Rspamd-Queue-Id: 92CB0FE10A
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
