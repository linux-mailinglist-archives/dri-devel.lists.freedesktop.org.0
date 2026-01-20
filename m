Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNPxH4Oob2ndEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:08:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDEC471C6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CF110E625;
	Tue, 20 Jan 2026 16:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QM5qn0Sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE1810E625
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 16:08:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8517960010;
 Tue, 20 Jan 2026 16:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690DAC16AAE;
 Tue, 20 Jan 2026 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768925311;
 bh=rzqncKRsFylklA8JgWPnwbRWYhHOrgt31SSlsoCZ4LU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QM5qn0Sl/ZmrYXsNMoOo4rnF0g0P/JPkxWnkbDg79Zc7TnPDr+7KJxUXG0WmJdKln
 vsNQNAa5Y7bYLuLrpUUShSEJawuBJsEj0Q1vjytZvnMjwibr7ey8x2XUsHyW2LxqWQ
 Z/cgCFzA0pFexKXvMr+RgSOHd6zBpECNBAMUcOIKlO+WCuTx39zolgPsvMCof0pKSt
 CDazGrxrEtbg6aCtIjZmq3WgcEA7oqmOjDcujzPoX9Ua3RBkzaZVsHrZyrzxoJW46n
 AqMsVh0D6fKikdUlKqpPwAM2gR+tY/RiMDtLXm0aPCmL72aaDRNu3q6tprjmnERPOe
 JMUZ1Isneb90A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Junjie Cao <junjie.cao@intel.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, caojunjie650@gmail.com, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20260111130117.5041-1-junjie.cao@intel.com>
References: <20260111130117.5041-1-junjie.cao@intel.com>
Subject: Re: (subset) [PATCH] backlight: aw99706: Fix build errors caused
 by wrong gpio header
Message-Id: <176892530914.2314511.7875702736146646667.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 16:08:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:junjie.cao@intel.com,m:mitltlatltl@gmail.com,m:linux-kernel@vger.kernel.org,m:caojunjie650@gmail.com,m:lkp@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org,intel.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: EDDEC471C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 11 Jan 2026 21:01:17 +0800, Junjie Cao wrote:
> The driver uses GPIO descriptor API (devm_gpiod_get,
> gpiod_set_value_cansleep, GPIOD_OUT_LOW) but includes the legacy
> <linux/gpio.h> header instead of <linux/gpio/consumer.h>.
> 
> When CONFIG_GPIOLIB is not set, <linux/gpio.h> does not include
> <linux/gpio/consumer.h>, causing build errors:
> 
> [...]

Applied, thanks!

[1/1] backlight: aw99706: Fix build errors caused by wrong gpio header
      commit: b7db7d9c4ffc04210fe631f73a81746d6e2ef24b

--
Lee Jones [李琼斯]

