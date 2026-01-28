Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI+PEZOUemmC8AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:58:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3233A9CB1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BF910E165;
	Wed, 28 Jan 2026 22:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pmMeCKXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E06410E165
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 22:58:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 06BBC6001A;
 Wed, 28 Jan 2026 22:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55009C4CEF1;
 Wed, 28 Jan 2026 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769641102;
 bh=Z9OqPeF9IuAUdu1BeekUKKNyvo5WfxDHVzPt2apoXDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmMeCKXSIpP9RojxNRVcs7H1lP0xvQLj/J7xBmpBkM6vQOrrRbhWg6Wj4A95BnSiF
 O1otSk2VEAJeIin0cfw6z3ZNBiXTFpQeMi1t8JmuNJqYRSIc9apZ/WHkCvUHTovATr
 1FeOnna9f3hTBz4v6UWNmwRzw2lb2SRZ+55Se5862Z7w0GLTiRY2uVz5lFV+K5KL7M
 JxM4+ZJg0iZgyi1tbxdU4FPL0zkNMJb/OJSyiDYpK/coqjb8ajQv24ghCJDzwW/0UB
 H80PkBWiWFMGSjb2H3LDBd1U4RWSXHhrflJyCjeNyFJFsWulrwWKL7JDhBvitR7tWK
 vpEbN8h6dZDoA==
Date: Wed, 28 Jan 2026 14:58:20 -0800
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
 Icenowy Zheng <uwu@icenowy.me>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 4/9] dt-bindings: display/bridge: add binding for
 TH1520 HDMI controller
Message-ID: <aXqUjLG9YdKSwh/2@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-5-zhengxingda@iscas.ac.cn>
 <aXpzC8MnShvc0tJv@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXpzC8MnShvc0tJv@x1>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com,pengutronix.de,samsung.com,bootlin.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:krzysztof.kozlowski@linaro.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D3233A9CB1
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:35:23PM -0800, Drew Fustini wrote:
> On Fri, Jan 23, 2026 at 05:28:25PM +0800, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> > 
> > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller paired
> > with DesignWare HDMI PHY, with an extra clock gate for HDMI pixel clock
> > and two reset controls.
> > 
> > Add a device tree binding to it.
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > No changes since v3.
> > 
> > Changes in v2:
> > - Re-aligned multi-line clocks/resets in example.
> > - Added Krzysztof's R-b.
> > 
> >  .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
> 
> I've applied the bindings patches (1, 2, 4) to thead-dt-for-next as well
> so that 'make W=1 dtbs_check' won't break for the next release of
> linux-next.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next
> 
> Please see my reply to patch 1 for the rest of my message.

I've dropped the yaml patches from thead-dt-for-next based on Conor's
advice. Patches 1, 2 and 4 can go through drm.

Drew
