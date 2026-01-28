Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPEKN7Iqemmi3gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:26:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1BA3C0A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F0E10E6ED;
	Wed, 28 Jan 2026 15:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZBrv5OTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D845610E6ED
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 15:26:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 95FCCC211E8;
 Wed, 28 Jan 2026 15:26:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D8D176071F;
 Wed, 28 Jan 2026 15:26:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 09B66119A86D4; Wed, 28 Jan 2026 16:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769613989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ifdIKBALmrDtlGji95Dn4uLjAd1QzXtIVq+J3SL2uiM=;
 b=ZBrv5OTsxnvC31C9xB5u3t92JpXYvSfGTBtbzpE1nwuHruAK57TjVcGMS3APCHv4l9SF/E
 wnqAQ55EFsg6Uj8+Ym01dWq/BJk9kjEcjm3JoqkQjhOyiTejWsxXKc9iZ6Utsubt6Y4bzq
 cqdqoHfypaQthCvQtpBCwD5UR+Mrs/C+MyqWvVgQ8NfmSW0KnRnaztVhOs2s/Pk6EGyLqc
 +qNIkWAByljlRPA9ZsxpbMXwdVOfJA1pNsG5HdTOzd4POa95lQpTLenMXpI2+eS7+mdf9W
 v03OkG2M3vHFVTUlnyDCCl7Ch2B+i2I0bsHAaRRmhM5ozz4ujvb/gEq/asKfVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 16:26:22 +0100
Message-Id: <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
 <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
In-Reply-To: <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E9C1BA3C0A
X-Rspamd-Action: no action

Hello Liu,

On Wed Jan 28, 2026 at 2:50 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Tue, Jan 27, 2026 at 12:35:47PM +0100, Luca Ceresoli wrote:
>>
>> On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
>>> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
>>> Each patch fixes a NULL pointer dereference issue and stands alone.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_l=
db_bridge_destroy()
>>       commit: 852c68bf42965ee38b465d2d6f7b965eb0b5dc1d
>> [2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8q=
xp_pxl2dpi_bridge_destroy()
>>       commit: db7e7ea838c916ee4cdf26bee126fd36f58295dc
>
> Any reason why patch 3/3 is not applied?

Yes, the reason is there's a patch conflict and I still have to find out
how to handle it.

Patch 3 by the rules [0] should go to drm-misc-fixes because the bug (added
by [1]) is already on Linus' master tree (since v6.17), but it does not
apply there due to a conflict with an unrelated change [2] currently on
drm-misc-next.

Note that [1] and [2] are the two commits mentioned in your 'Fixes: 'tags.

I had a chat with Maxime on #dir-devel about how to handle this situation
but still haven't got a final answer.

I guess the correct way is:

 1. apply patch 3 on drm-misc-next, where it applies cleanly
 2. send a modified patch for drm-misc-fixes, to fix ASAP the master branch

Would you send the patch as in item 2, so it can be applied to
drm-misc-fixes and have master fixed ASAP? Note iit should not mention [2]
in the Fixes: tag because [2] is not yet on master. I can send it of course
but you can test on hardware so that would be the best option (and I'm a
bit overloaded at the moment).

[0] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-misc.html
[1] commit 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to de=
vm_drm_bridge_alloc() API")
[2] commit ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the n=
ext bridge")

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
