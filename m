Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BE73BKSFm2mj1AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:39:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6061709AF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 23:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F4510E1C4;
	Sun, 22 Feb 2026 22:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="gpaeyFyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC1810E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=HkoheiRsOgkGH0y6gauMEvPaM5M/sNlnyx5re4y4PJs=; b=gpaeyFySadCynK+2NX5d3KON33
 L95Z3MH8w0BPO8BTXwJxg5JcQmaqKkwslXa4Cb+4UX3aGg/vujLXU1HtWnsSpqeWdw9/yQQgFQ/uE
 ITNwh4ipkA1rq+y6vdWFmeHCwg3Bl23pOBNGEEfnWJhjwu4mjEAHz5F1Q1XC5QYtaYUCB+gTqZMKn
 WbFcS90JweO9+FwHt7WoFBXkrH6ttcdXxCkgzeCCTWbXCf8St4Lu3gFB+6ugPdlXwwhOZbZIhXJds
 1Y+BZiMc6V7/iyd2UwGEP6jG0h4DCk2TbHajeYUt9jVwsgZ4M14KeyAlf1QMYDCgS9y+rKB/TuY8h
 UHbSvr4Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org, dianders@chromium.org, thierry.reding@gmail.com,
 sam@ravnborg.org, Robin Murphy <robin.murphy@arm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, jesszhan0024@gmail.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/4] Properly support FriendlyElec HD702E
Date: Sun, 22 Feb 2026 23:39:11 +0100
Message-ID: <177179992303.1861430.2329914012385519373.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1769191673.git.robin.murphy@arm.com>
References: <cover.1769191673.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:dianders@chromium.org,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:robin.murphy@arm.com,m:heiko@sntech.de,m:jesszhan0024@gmail.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[sntech.de,gmail.com,lists.freedesktop.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,chromium.org,gmail.com,ravnborg.org,arm.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:mid,sntech.de:dkim,sntech.de:email]
X-Rspamd-Queue-Id: 8D6061709AF
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 19:22:19 +0000, Robin Murphy wrote:
> v1: https://lore.kernel.org/linux-rockchip/cover.1767111804.git.robin.murphy@arm.com/
> 
> Changelogs in the patches - fingers crossed this is good to go now,
> thanks all for the acks and reviews.
> 
> Cheers,
> Robin.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
      commit: 638fa970ac669e5d0fb2c5cc0bea3d4443299ac6
[4/4] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
      commit: 25afddad23b8e91fcff625756e51a805e288ab38

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
