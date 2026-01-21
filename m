Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBe3KZw7cGmgXAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 03:36:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3361A4FD89
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 03:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D81E10E685;
	Wed, 21 Jan 2026 02:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pz+Vvrga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C1010E678
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 02:36:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E61844446B;
 Wed, 21 Jan 2026 02:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF8CC16AAE;
 Wed, 21 Jan 2026 02:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768962967;
 bh=s/ppDOKBriSbgvaTWgDYie5U594SU0x6q4edBskjLns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pz+VvrgaQFhd7a9RT1J+dAfdhfxVN3BR9wHGkB8ewiU+2MRLnAU5JaeMjl0GIqJ/u
 7ICMh7SrNQkBSj3U5E2Z8DPpueLblHwioQMJ9fNR73JdYssFgTJocvIKdCHP5e8ENs
 yIa6S7RPjbTV1sCSKDFyQiwjplnyZkE0KNpXC4sYzUMg58YoJphgt3Q7wKFYrUsYFE
 imMMWAm+y9Hrb0jbY+RxVWocb1dzGp+d1iF7FyUZoKomXe+56rum3Gmo7KRZMcsZgs
 T9gtuvqv237JL0MzWIl4mSrbUdimRhIYX0EbhgrMrkiDPOXgU4DqFw6n4jD4tb3vyY
 HwhayCCnoOiZQ==
Date: Tue, 20 Jan 2026 20:36:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, frank.li@nxp.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marek.vasut@mailbox.org, Fabio Estevam <festevam@nabladev.com>,
 victor.liu@nxp.com, neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: ldb: Document
 nxp,enable-termination-resistor
Message-ID: <176896296629.1844810.8491624416873215486.robh@kernel.org>
References: <20260120231930.2782444-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120231930.2782444-1-festevam@gmail.com>
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:festevam@gmail.com,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:frank.li@nxp.com,m:devicetree@vger.kernel.org,m:marek.vasut@mailbox.org,m:festevam@nabladev.com,m:victor.liu@nxp.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,i.mx:url]
X-Rspamd-Queue-Id: 3361A4FD89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 20:19:29 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Document the optional nxp,enable-termination-resistor property for the
> i.MX LVDS display bridge.
> 
> This boolean property indicates that the built-in 100 Ohm termination
> resistor on the LVDS output is enabled. It is controlled via the HS_EN
> bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
> signal quality and may prevent visual artifacts on some boards, but
> increases the power consumption.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - Restrict it to i.MX6SX. (Liu Ying)
> 
>  .../bindings/display/bridge/fsl,ldb.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

