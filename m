Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOtvLyM4cGmgXAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 03:21:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375EC4FAC1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 03:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA88110E1DB;
	Wed, 21 Jan 2026 02:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y0dT+Dvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390F810E1DB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 02:21:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E7F66011E;
 Wed, 21 Jan 2026 02:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820ACC16AAE;
 Wed, 21 Jan 2026 02:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768962078;
 bh=j7waV8NWZBtuhNIY6TrRP+nVW1vx7BHTzf5Bh5U439w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y0dT+DvdxyNk7sHMlklvwtNBRATnVqp+LcOt79ZRKCFlY2stWywHTziP8aWB9Tp2P
 QddRl1zKRfah8ixukRdy60c3nLahYvxjnqhDlo1fC60rJZNlPLFCIF+/205iDc6B1V
 S7i9gSptjqviHQX9WTB23Pt4BsRCtkZxi9In8Rvn6QkawwrAT8u+I5IwDdfG0GQs8B
 PWB1bOJpBT75zVhW/G0uzPnSAH4+j3PBkHY+dTqmvMQOhNzhHh27Iyinnxt4Msn/FI
 Q4FihIF6uKe0BoeFWcCGn1ZYKtDX0ichSb/SZTVuBQuJP12mM8OPzaqgwF/FP2lZ20
 BW8/IlX9ddLFQ==
Date: Tue, 20 Jan 2026 20:21:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Guo Ren <guoren@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Icenowy Zheng <uwu@icenowy.me>, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, Fu Wei <wefu@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 Dmitry Baryshkov <lumag@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Yao Zi <ziyao@disroot.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v5 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <176896207692.1787158.10124540284354506229.robh@kernel.org>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
 <20260116043746.336328-3-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116043746.336328-3-zhengxingda@iscas.ac.cn>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[linaro.org,bootlin.com,ffwll.ch,pengutronix.de,linux.intel.com,vger.kernel.org,gmail.com,samsung.com,kernel.org,intel.com,icenowy.me,lists.freedesktop.org,redhat.com,kwiboo.se,ideasonboard.com,lists.infradead.org,suse.de,disroot.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:neil.armstrong@linaro.org,m:luca.ceresoli@bootlin.com,m:simona@ffwll.ch,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:devicetree@vger.kernel.org,m:airlied@gmail.com,m:m.wilczynski@samsung.com,m:guoren@kernel.org,m:fustini@kernel.org,m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:uwu@icenowy.me,m:rfoss@kernel.org,m:wefu@redhat.com,m:jonas@kwiboo.se,m:Laurent.pinchart@ideasonboard.com,m:rabenda.cn@gmail.com,m:linux-riscv@lists.infradead.org,m:lumag@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:ziyao@disroot.org,m:jernej.skrabec@gmail.com,m:rabendacn@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,icenowy.me:email]
X-Rspamd-Queue-Id: 375EC4FAC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 16 Jan 2026 12:37:39 +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Verisilicon has a series of display controllers prefixed with DC and
> with self-identification facility like their GC series GPUs.
> 
> Add a device tree binding for it.
> 
> Depends on the specific DC model, it can have either one or two display
> outputs, and each display output could be set to DPI signal or "DP"
> signal (which seems to be some plain parallel bus to HDMI controllers).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v5:
> - Dropped the requirement of port@0.
> - Dropped the if clause for TH1520, which seems to be not needed because
>   of implicit DT binding rules.
> 
> Changes in v4:
> - Added a comment for "verisilicon,dc" that says the ID/revision is
>   discoverable via registers.
> - Removed clock minItems constraint w/o specific compatible strings.
> 
> Changes in v3:
> - Added SoC-specific compatible string, and arm the binding with clock /
>   port checking for the specific SoC (with a 2-output DC).
> 
> Changes in v2:
> - Fixed misspelt "versilicon" in title.
> - Moved minItems in clock properties to be earlier than items.
> - Re-aligned multi-line clocks and resets in example.
> 
>  .../bindings/display/verisilicon,dc.yaml      | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

