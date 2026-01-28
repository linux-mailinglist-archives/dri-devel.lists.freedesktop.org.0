Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLd6A3OUemmC8AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:57:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87CA9C93
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 23:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F7C10E038;
	Wed, 28 Jan 2026 22:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="APE1AEwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57E710E038
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 22:57:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7032A41567;
 Wed, 28 Jan 2026 22:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2BAC4CEF1;
 Wed, 28 Jan 2026 22:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769641070;
 bh=zzDPxa7YTOuxLsTohGS9o5cD9aMxBThQMZVsekatb4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=APE1AEwTUOcZZ+IQmP17cC9GRK94sU9OeZ/v7jHgkDwIOBOrZpB+vQtNnXrep80Bx
 9sJacVWYQ6fmBBJQon+E4uhVlMmA4PsJDmWLnT3NmVaxKhDMcx59DvgL8JbahtGyJW
 tlSCEoqsoDhTsndDt3Mqe3mZzNNWhVT/bJ9V+zWwFEMjT4xIYYmOxL/VmZ6jVouwE0
 hHTPw5qCftlxbvrMn/eRhsu1c8GwkR6CkPfk1LtxyJmFEU7AYKXQWBFpdirjOxx5UK
 vDnGnXzSxLwu5r8+nlH5COUoPzb0VzZcz4lcpKNrmrtfg/B+RkdZQleGKglPI+OANW
 jQUhDbQJJfntQ==
Date: Wed, 28 Jan 2026 14:57:48 -0800
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
 Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v6 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <aXqUbDw45ulf8c+s@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-3-zhengxingda@iscas.ac.cn>
 <aXpy4f9G9QKRh3Ts@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXpy4f9G9QKRh3Ts@x1>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com,pengutronix.de,samsung.com,bootlin.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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
X-Rspamd-Queue-Id: 6A87CA9C93
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:34:41PM -0800, Drew Fustini wrote:
> On Fri, Jan 23, 2026 at 05:28:23PM +0800, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> > 
> > Verisilicon has a series of display controllers prefixed with DC and
> > with self-identification facility like their GC series GPUs.
> > 
> > Add a device tree binding for it.
> > 
> > Depends on the specific DC model, it can have either one or two display
> > outputs, and each display output could be set to DPI signal or "DP"
> > signal (which seems to be some plain parallel bus to HDMI controllers).
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Changes in v6:
> > - Added Rob's R-b.
> > 
> > Changes in v5:
> > - Dropped the requirement of port@0.
> > - Dropped the if clause for TH1520, which seems to be not needed because
> >   of implicit DT binding rules.
> > 
> > Changes in v4:
> > - Added a comment for "verisilicon,dc" that says the ID/revision is
> >   discoverable via registers.
> > - Removed clock minItems constraint w/o specific compatible strings.
> > 
> > Changes in v3:
> > - Added SoC-specific compatible string, and arm the binding with clock /
> >   port checking for the specific SoC (with a 2-output DC).
> > 
> > Changes in v2:
> > - Fixed misspelt "versilicon" in title.
> > - Moved minItems in clock properties to be earlier than items.
> > - Re-aligned multi-line clocks and resets in example.
> > 
> >  .../bindings/display/verisilicon,dc.yaml      | 122 ++++++++++++++++++
> >  1 file changed, 122 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
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
