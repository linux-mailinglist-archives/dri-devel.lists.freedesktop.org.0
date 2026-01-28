Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMH4MQtbemm35QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:52:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEABA7EB3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 19:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219010E2E0;
	Wed, 28 Jan 2026 18:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mbFpiGD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E858510E2E0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 18:52:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6682C60126;
 Wed, 28 Jan 2026 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA408C4CEF7;
 Wed, 28 Jan 2026 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769626376;
 bh=FpN2GeKkLPq5QvKft5Ke2BDw8HtI7yEWOSKliy0KiDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mbFpiGD35Co3WMyUN29gQyYQImVUpu7KXjh6ycwH0vxJlov/y5hOT4UHHD0ck0C1I
 Dk619LyJIgRJMAkjESGDtQzmah2HRfd5uNuXwCbZkSm2yaY/D9P6DH+DSc4eueZ2Hw
 NTt0kNlKP7NOInx0F92fANjwhf4OY1+/OTn2EYixTYUY78Qq4kY/QyEJJRwRvADSjL
 RwUJDDvBGHhQTDJhUrcf/Pmhxl6QP/jupCnxkpZ9jtrNrRRhb58+NKT25eNLI5yRBI
 Ca+q1OJXLjP0fE75ad2CSpMEQ5quN5OcFYXrib22DcXCVooyT+Rigy5mq430eqN7Oq
 5mm40+SU49Zog==
Date: Wed, 28 Jan 2026 10:52:54 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH v6 7/9] riscv: dts: thead: lichee-pi-4a: enable HDMI
Message-ID: <aXpbBq3TwuiP9Qry@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-8-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123092830.4046009-8-zhengxingda@iscas.ac.cn>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:gaohan@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com,pengutronix.de,samsung.com,bootlin.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me,iscas.ac.cn];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,samsung.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6BEABA7EB3
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:28:28PM +0800, Icenowy Zheng wrote:
> Lichee Pi 4A board features a HDMI Type-A connector connected to the
> HDMI TX controller of TH1520 SoC.
> 
> Add a device tree node describing the connector, connect it to the HDMI
> controller, and enable everything on this display pipeline.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
> No changes in v5.
> 
> Changes in v4:
> - Rebased on top of v6.19-rc1.
> 
> No changes in v2, v3.
> 
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>
