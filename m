Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PkSMPrzhWk+IgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:00:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D5FE8CC
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 15:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8F210E792;
	Fri,  6 Feb 2026 14:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="wM5MW9LM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098CD10E792
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1770386417; x=1770991217; i=markus.elfring@web.de;
 bh=seSfeppYtBNthR+4IGTcwxVn+0fjaTpAo2v2dRJmVNI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=wM5MW9LMM2afPZY24Dd1V8jZyTuR7P/5eFylHM0yCANPnkiehcBTraMPpyALCnE1
 FH7hDvDEyy05Tf8oK5FlW9QXn8iSUNwN5NDMZTMj0gChDJN5wsinuZUQbGExbtMNP
 0SjOIQcaskNsUvd56oU301dzfZ42e0N6sneZQsLrhNBvB7fXYmZeI2k5P6jsH9DfU
 gohTPvdeX2/qeIx2U10/RN/aE7duKI8zTCiQalVOkMxSb/FsjOFlJIJWrFnqsEygo
 YVnk9qH8Px1iCKbrQzxa8+sGA2Ign9+nJEjGoE0nja5xyrGMmQRC0HxAlTGjoOGfS
 3YyMjndNbG3C0y2eaw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.223]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSIJ0-1wGraC3arQ-00IiEC; Fri, 06
 Feb 2026 15:00:16 +0100
Message-ID: <036f47ad-f126-45ff-a0a8-b3a450020b5a@web.de>
Date: Fri, 6 Feb 2026 15:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Damon Ding <damon.ding@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20260206084220.543267-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/rockchip: analogix_dp: Add missing error check for
 platform_get_resource()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260206084220.543267-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LuhTjM/4FzIOCr8r5RdGmywoowSPUCMokAzYamrwOMJ0W42Qt7N
 o5C4xaKy9Om2gPnQs5RxGxu6r5l5Gc2eWDuWZbEhfaNTZgrCUsYrHUMtE8oaAt63r+2/5En
 Cen2BeXjA4I/Z/ARDD0Q3qm7J2VwD1/Js2S+VzWIT4dNUSmAwdepwA716Pwz9X/BlkoprXB
 bSGBJODnZ2FTKhNZCR8Qg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ooLSxhe31cc=;IcpeEpn5R+iEvKce1soK7zog12i
 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
 bRi40HvY=
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andy.yan@rock-chips.com,m:damon.ding@rock-chips.com,m:airlied@gmail.com,m:dsimic@manjaro.org,m:heiko@sntech.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:hjc@rock-chips.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,rock-chips.com,gmail.com,manjaro.org,sntech.de,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1B8D5FE8CC
X-Rspamd-Action: no action

> Add missing error check for platform_get_resource() return value to
> prevent NULL pointer dereference when memory resource is not available.

* Were any source code analysis tools involved here?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v6.19-rc8#n34


Regards,
Markus
