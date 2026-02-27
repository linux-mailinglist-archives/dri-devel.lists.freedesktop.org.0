Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHAJIh2VoWl8ugQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:59:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A31B766F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 13:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DE810EB34;
	Fri, 27 Feb 2026 12:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ObTqDIw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4E510EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 12:59:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 64A0EC406AA;
 Fri, 27 Feb 2026 12:59:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 824E05FE46;
 Fri, 27 Feb 2026 12:59:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 30EED1036943D; Fri, 27 Feb 2026 13:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772197140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vr8wnBI6tXD0cjqGp1qmUgWaymHUW24b6tbquknqsZk=;
 b=ObTqDIw7SCeC3udo1DAW+aMsMnpTqEaUbfe18HWtHP4S30sOa7x4jJqEPrr6LvaDp6ZwO4
 2ca66sTYcKDDezYi8PfSSjKUGhSVCqm3a/OGvFDT7Uu5UTL6V4U+4HM7sWFz3D8ANcdBN6
 KIkrsL7uKrIoHvTDnth8Rw6kQ3g/gadP1BH8Scq9nLfW/EmYsJntEkPePaMWObt5dw1CUL
 Zftxi/O73cAkI8C95NkA8DyTQYSqI3BCElTFSz/g9kif6hvDdfBzaMyYcyumCad75ICtqI
 bKg8wjcc9V4tlSiSkPZzKJVKZ0d7NLxjq+f/QEftohdl2atKCzVDbdNRfYVKgg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 13:58:56 +0100
Message-Id: <DGPRGDBNFYRP.E1KH0DNZ2M5U@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi83: add test pattern
 generation support
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Frieder Schrempf" <frieder.schrempf@kontron.de>, "Marek
 Vasut" <marex@denx.de>, "Linus Walleij" <linusw@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Marek Vasut"
 <marek.vasut@mailbox.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-0-2e15f5a9a6a0@bootlin.com>
 <20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-3-2e15f5a9a6a0@bootlin.com>
 <71224e5f-d982-45f9-be91-b61b78f38853@mailbox.org>
 <20260227-loud-silky-macaw-8d4d3b@houat>
In-Reply-To: <20260227-loud-silky-macaw-8d4d3b@houat>
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
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:frieder.schrempf@kontron.de,m:marex@denx.de,m:linusw@kernel.org,m:thomas.petazzoni@bootlin.com,m:linux-kernel@vger.kernel.org,m:mripard@kernel.org,m:marek.vasut@mailbox.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,kontron.de,denx.de,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.626];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:url,bootlin.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 144A31B766F
X-Rspamd-Action: no action

Hello Marek, Maxime,

On Fri Feb 27, 2026 at 11:57 AM CET, Maxime Ripard wrote:
>> > @@ -134,6 +135,9 @@
>> >   #define  REG_IRQ_STAT_CHA_SOT_BIT_ERR		BIT(2)
>> >   #define  REG_IRQ_STAT_CHA_PLL_UNLOCK		BIT(0)
>> > +static bool sn65dsi83_test_pattern;
>> > +module_param_named(test_pattern, sn65dsi83_test_pattern, bool, 0644);
>>
>> Can this be enabled/disabled at runtime via sysfs attribute instead ?
>
> Then you would have to deal with concurrency with the atomic state
> updates, and it would really be better implemented as a connector
> property.
>
> In other words, it's probably enough for now :)

I agree with Maxime, let's keep it simple, especially as it's a debugging
tool and nobody wants to debug a debugging tool. :)

It can be made more complex in the future if there is a real need.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
