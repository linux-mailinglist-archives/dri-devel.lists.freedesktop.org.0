Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dvUFNXZ4kmnFuAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 02:52:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E7140943
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 02:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85E410E054;
	Mon, 16 Feb 2026 01:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="o4gowADc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E33710E054
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 01:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1771206767; x=1771811567; i=deller@gmx.de;
 bh=ynK5Y2VULc8A7SShW2Yv/MVSpuDBYE6THdFyi6y/8D0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=o4gowADc4wOkf3DWR1GBhNeusLquK7N7nodNaWl3OFtf+j3sj5YkQQ/Zz4YhhIfm
 JRy41009U/D+fN43OqJtI7PRhrIA819W4w4xsrlYU4xGTr5vDhuPepLdzyZKJLSQ0
 DNU3m1NIwJib53vr/+ODLmdMGADqNySog7xTZ91Y96oHMVbpAJva2sfbROVgL3Ebo
 HzQslVdbAL0sKVORgb7pevnQAXHNJW/V3T+n0lvIQdCMlwIExpAlLTcLDUGz33ihX
 3U/kmvWSkVeJTO9WC+WX3AKQsdF8IrsAF7sM16s1gGXT4iu17655NHrXtpzj2XNUv
 ff4ZXnLuiLNkgFVZaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.52]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FnZ-1voDYe07jL-000xf3; Mon, 16
 Feb 2026 02:52:47 +0100
Message-ID: <77a43f20-7985-4701-8a1e-c0b930779435@gmx.de>
Date: Mon, 16 Feb 2026 02:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] fbdev: au1100fb: support COMPILE_TEST and fix
 multi-device support and other cleanups
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8svPiEtYUQ1gJdIeoEd0aT5IG0oqRCMiWPlBTpXeYlzOQ6+G1iQ
 tlCtMgbYmfW/utAAZOtoVKIBJWlKRZFLWlWxdGZS05PHyETZ0DjqHnnh2hDFSBdjoje88lz
 F4MhVsQ1ENiP2WqspO9Qd3pZF4bwQc2cj2ybTKNXAqNtkVvTuL+RR4XyVLsGfyc2x+wBRif
 YIEG6buESw+TrsbR5sc9A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7J3qj3+qQc8=;KG77P6UhxVZSdW02hWwvDASg6iT
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
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim]
X-Rspamd-Queue-Id: 226E7140943
X-Rspamd-Action: no action

On 2/16/26 00:33, Uwe Kleine-K=C3=B6nig wrote:
> Uwe Kleine-K=C3=B6nig (7):
>    fbdev: au1100fb: Don't store device specific data in global variables
>    fbdev: au1100fb: Mark several local functions as static
>    fbdev: au1100fb: Use proper conversion specifiers in printk formats
>    fbdev: au1100fb: Make driver compilable on non-mips platforms
>    fbdev: au1100fb: Replace custom printk wrappers by pr_*
>    fbdev: au1100fb: Fold au1100fb.h into its only user
>    fbdev: au1100fb: Replace license boilerplate by SPDX header
>=20
>   drivers/video/au1100fb.c       |   0
>   drivers/video/fbdev/Kconfig    |   3 +-
>   drivers/video/fbdev/au1100fb.c | 487 +++++++++++++++++++++++++++------
>   drivers/video/fbdev/au1100fb.h | 379 -------------------------
>   4 files changed, 406 insertions(+), 463 deletions(-)
>   create mode 100644 drivers/video/au1100fb.c
>   delete mode 100644 drivers/video/fbdev/au1100fb.h

series applied to fbdev git tree.

Thank you, Uwe!
