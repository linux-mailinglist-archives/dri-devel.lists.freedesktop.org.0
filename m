Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNkCHVJtcmlpkwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 19:32:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F686C79C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 19:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFA010EA38;
	Thu, 22 Jan 2026 18:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="US9+bYtd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934E810EA38
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=agslpXLRXlgoIqoXX1b/469dMp/dSJo51gcsUDWxm10=; b=US9+bYtdoESb7Sxo34iTpi/+4d
 jHW0+3yOCh20Q0YUYmGdG2p1EkXJh/705kvbMhICO58eaTB4PPK4ZAuBoN2fK20pVwO4m1CeDEmM4
 7cdQ5LuhhFOsEZGDaXXcwLK/a6kt1HFnnUFgQ9M4WOAVaOj/R49vI5BHCtGCBL8OtxF3zzVmCTKyV
 Uw4+D1c8BputqR33CfqXIdml8wTUqqm4uvocq2U4iXhIHLLSjRLnkPd0rklNBy/T0aw3AGxjZfcEK
 Oxr9I2drNpjGOhMuw8PEI/Af1ArM5TwqP5BnKQotsEVjqBbm831PaM8P0mpHp2wyaQeQBMeHzvssG
 C12Ndzug==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vizU2-003rA9-Fa; Thu, 22 Jan 2026 19:32:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, simona@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
 neil.armstrong@linaro.org, jagan@edgeble.ai, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, aweinzerl13@yahoo.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: (subset) [PATCH 0/6] Add Anbernic RG-DS
Date: Thu, 22 Jan 2026 19:32:39 +0100
Message-ID: <176910675441.726233.3829281115415341998.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260113195721.151205-1-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-rockchip@lists.infradead.org,m:macroalpha82@gmail.com,m:heiko@sntech.de,m:devicetree@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:jesszhan0024@gmail.com,m:neil.armstrong@linaro.org,m:jagan@edgeble.ai,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:aweinzerl13@yahoo.com,m:macromorgan@hotmail.com,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com];
	FORGED_SENDER(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[sntech.de,lists.freedesktop.org,vger.kernel.org,gmail.com,ffwll.ch,suse.de,kernel.org,linux.intel.com,linaro.org,edgeble.ai,yahoo.com,hotmail.com];
	DKIM_TRACE(0.00)[sntech.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.560];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,sntech.de:dkim,sntech.de:mid,anbernic.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D2F686C79C
X-Rspamd-Action: no action


On Tue, 13 Jan 2026 13:57:15 -0600, Chris Morgan wrote:
> Add support for the Anbernic RG-DS. The Anbernic RG-DS is a dual-screen
> handheld from Anbernic powered by the Rockchip RK3568 SoC. It has
> dual DSI displays with touchscreens, multiple face buttons, and is in
> a foldable clamshell form-factor.
> 
> https://anbernic.com/products/rgds
> 
> [...]

Applied, thanks!

[4/6] dt-bindings: arm: rockchip: Add Anbernic RG-DS
      commit: 84f42966b80eaec59349c7b474ebd6b0943731e4
[5/6] dt-bindings: input: touchscreen: goodix: Add "panel" property
      commit: 3c8399d31c8eb10aa34bccec1f49b51694e67b00
[6/6] arm64: dts: rockchip: Add Anbernic RG-DS
      commit: 9e3f8ae040009f66367b2ba1081b7e313b39aeff

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
