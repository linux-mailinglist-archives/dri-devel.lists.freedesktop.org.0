Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJavKNdNp2nKggAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:08:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7E01F72F4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 22:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57DC10E8CB;
	Tue,  3 Mar 2026 21:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="ZGgkwcyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F7810E8CB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=TVTPBO1ETB+TbDU3IdtAxLv4+MUduDzo1X9SkDOAYoo=; b=ZGgkwcyj3oNZe0jPuSP6JdXLpJ
 rx+NPQUmBlMYvL4qKtX9KkNKZCdxIOpXX7pQY6DNqp8MPaIg1bLyHunlZcgJiraae0kujQuIxScm4
 JNOqiLAH1mvo3DuV0ql+LTOQTXV+XFB1nHs3urQYEC7hL60f05o+OxjN1zpQ0vt7mVvqFSfk+AaE0
 d9uMUZ8h9ANiWrTNdeMNaAS0MBgUOO6cdeU/5o6OgzOvr8fJWU824EDqiA9Hw4gLLgRH3tChco2nu
 oqXaGuD27chMIdU8G1J8qWVC0O/uBTqOxIjYFNYwxwCjc3FYzfweW98j8LPRTsmTjupagJBAyyLGB
 u4+XiNvg==;
Date: Tue, 3 Mar 2026 22:08:24 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, airlied@gmail.com, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, khilman@baylibre.com,
 krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jesszhan0024@gmail.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de, andrzej.hajda@intel.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v9 6/8] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
 and 10.1
Message-ID: <20260303220824.334f7965@kemnade.info>
In-Reply-To: <20260303203017.511-7-bavishimithil@gmail.com>
References: <20260303203017.511-1-bavishimithil@gmail.com>
 <20260303203017.511-7-bavishimithil@gmail.com>
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
X-Rspamd-Queue-Id: 2F7E01F72F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kemnade.info:s=20220719];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[kemnade.info : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bavishimithil@gmail.com,m:aaro.koskinen@iki.fi,m:airlied@gmail.com,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:khilman@baylibre.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jesszhan0024@gmail.com,m:rfoss@kernel.org,m:robh@kernel.org,m:rogerq@kernel.org,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:tony@atomide.com,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[iki.fi,gmail.com,kernel.org,kwiboo.se,baylibre.com,ideasonboard.com,linux.intel.com,linaro.org,bp.renesas.com,ffwll.ch,atomide.com,suse.de,intel.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kemnade.info:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.163];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue,  3 Mar 2026 15:30:15 -0500
Mithil Bavishi <bavishimithil@gmail.com> wrote:

> Add samsung-espresso7 codename for the 7 inch variant
> Add samsung-espresso10 codename for the 10 inch variant
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
