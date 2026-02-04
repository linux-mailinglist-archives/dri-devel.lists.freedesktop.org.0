Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBtrA14Mg2k+hAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:07:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90159E3922
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1810E574;
	Wed,  4 Feb 2026 09:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="shttYJZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEC110E574
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=hDYEr87uD7421qYjDNk4fZncRRUE4KkHMxbUB1O9BkE=; b=shttYJZ7VYmOxtT1tTs+iK2G68
 kstUtUCJpDUq7j5z92nQDmdpt/LbuRMBUI7YS5WGpsrbbAQoc6wzjcCbVOJKj/3fjV1m8prFG7a/P
 WTHN0yWBC+hr9Vk7SI9ef3oYXZuqkfdA0ywjxruqxUb8GJbLftwo4pNo1iqQjUWP6AiL41PX1ZWcb
 QQh+FKWYkfIvRW8T33RQlrYOvC5Tu9wdHKQbzxoP41xbhlUtGRl/xY7w37vSU+0Q6ZUhQpVTORpcd
 +YXiyswSa4g0UWRtgkNYVrQptKpZsFi5O+DRB4frz/I5q0bLjPjH5NpqSS68e5y2qIRJa8rpjUm8t
 xg2tpfVA==;
Date: Wed, 4 Feb 2026 10:07:30 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, airlied@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, khilman@baylibre.com,
 krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v5 5/8] ARM: dts: ti: omap: espresso-common: Add common
 device tree for Samsung Galaxy Tab 2 series
Message-ID: <20260204100730.0fcc6b46@kemnade.info>
In-Reply-To: <20260204074831.300311-1-bavishimithil@gmail.com>
References: <20260202090408.4c3757cb@kemnade.info>
 <20260204074831.300311-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[kemnade.info : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bavishimithil@gmail.com,m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[iki.fi,gmail.com,kernel.org,vger.kernel.org,lists.freedesktop.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,atomide.com,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kemnade.info:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.40:email]
X-Rspamd-Queue-Id: 90159E3922
X-Rspamd-Action: no action

On Wed,  4 Feb 2026 02:48:31 -0500
Mithil Bavishi <bavishimithil@gmail.com> wrote:

> > We had the discussion. This should be done via pinctrl irq if possible instead of
> > specifying WAKEUP_EN here, You had some trouble to understand how it can be done,
> > and we agreed to add the wakeup functionality as a follow-up concentrating just
> > on that detail and for now just remove WAKEUP_EN.  
> 
> I think I may have understood what is to be done.
> For example we have 
> pinctrl-single,pins = <
> 	OMAP4_IOPAD(0x0bc, WAKEUP_EN | PIN_INPUT | MUX_MODE3)
> >;  
> 
> for wlan_host_wake, so the change needed to be done is from
> interrupt-parent = <&gpio3>;
> interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> interrupt-names = "host-wake";
> pinctrl-names = "default";
> pinctrl-0 = <&wlan_host_wake>;
>
we still need the pinctrl. Just the WAKEUP_EN flag gets managed via the
pinctrl interrupt handling.
 
> to
> \.
> interrupts-extended = <&gpio3 17 IRQ_TYPE_LEVEL_HIGH>, 
> 			<&omap4_pmx_core 0x0bc>;
<&omap4_pmx_core 0x7c>

offset is from beginning of padconf area, so from
0x4A10 0040, you can see that from.

In omap4-l4.dtsi:
omap4_pmx_core: pinmux@40 {
                                compatible = "ti,omap4-padconf",
                                             "pinctrl-single";
                                reg = <0x40 0x0196>;


The OMAP4_IOPAD macro handles the offset, so you have
different values there.

> interrupt-names = "host-wake", "wakeup";
> 
> and remove the pinctrl?

just remove the WAKEUP_EN flag from there.

> Similarly for all in the omap4_pmx_core domain (wifi, bt, i2c as the
> drivers support it)
> No chnages for &omap4_pmx_wkup domain
> 
The gpio instance in that domain is always-on anyways, so we do not need
any additional wakeup mechanism there.

Regards,
Andreas
