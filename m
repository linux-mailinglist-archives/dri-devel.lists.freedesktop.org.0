Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBrmM6XZeWlI0AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:40:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309469EF03
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC3C10E0FA;
	Wed, 28 Jan 2026 09:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="mn/e5kAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B1710E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1769593246; x=1770198046; i=markus.elfring@web.de;
 bh=LPgjr6YUFZjgmlNth8QyleuTmFci4x/vrSZM+Fe+8Jk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=mn/e5kArmI4GXr8gNFCJPkN0xxFOI62jpKFiPiRj08PkCrQLUUO4WmV8Owg/EvL/
 uvdA1T4JoSY05w7CNBtVcT09Qmpxj/qKWUBG9gNHr4u7Fofot6oJR/FG3Xoqudu3F
 6Ibs4XmMFrBxDve/3JzSYQcExE3ucLFoL5ug+qlPY0kQVjUBBvJnB4m11h05OGeWt
 sIgnVGUTQx9xSX0CLdHnnQtvGoXjb273IMmWYna8gDNh7C/nTa1RxdfYrzhYi7b2/
 gg/em2mkklGB8g+mp+jgY7Nmoog0ovnsAHlNc5l25hFZ2jqP6pAD8jG42C2mhrcdL
 95zqvMJ6njgsj+hsmw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5Qq9-1vlrNz2g5t-001Ozh; Wed, 28
 Jan 2026 10:40:46 +0100
Message-ID: <e46c9f31-6991-454b-aedd-10c10fc482a0@web.de>
Date: Wed, 28 Jan 2026 10:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: au1100fb: Add missing check for clk_enable
To: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260128091004.2747011-1-nichen@iscas.ac.cn>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260128091004.2747011-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B0yCgdL7p5TiiwLHl1tkOIGguhHiagnVWEWkL1TRdp7Rv/J/1gq
 tvFas3Zb4wvQOXZxhJ4LdotGLz0xbkRMMxKhVsLScFTbfePXvWEppu577z1XZ9WuI0RCHeS
 uxEcOGukubmcMrES9Rym7LtHDNz4wMD3MxcDJ8s8aMUwOl8qnEMTpmvBDRLPV/qNuxL6Dv9
 +KjCAT7bOOa5CCuwdWDhA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Za+7XWlckc=;KFn78kZOO5DVedNI9GCk2BDDP0J
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,m:deller@gmx.de,m:u.kleine-koenig@baylibre.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iscas.ac.cn,vger.kernel.org,lists.freedesktop.org,gmx.de,baylibre.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[web.de:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 309469EF03
X-Rspamd-Action: no action

> Add check for the return value of clk_enable() andreturn the error

                                                 and return?


> if it fails in order to catch the error.

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc7#n145

Regards,
Markus
