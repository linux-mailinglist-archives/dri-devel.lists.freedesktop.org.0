Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMXeLOM8emlB4wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:44:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D44BA60DB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 17:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E7A10E1B4;
	Wed, 28 Jan 2026 16:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aLw6q2hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6443F10E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 16:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2F2443AF0;
 Wed, 28 Jan 2026 16:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588A3C4CEF1;
 Wed, 28 Jan 2026 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769618654;
 bh=5DovOnZ0d/vD+FS6LMq5cjmgNxGlH48eoVz7AsPLaZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aLw6q2hyyMhczgJtKVG4ZScIVWCKyS5DAyL6vgAcQs55C1JogC0jJnjvyKORQtuC/
 VGhIiNae5eDve+hzCyVjMMOgCU7oA0yeQ8erSWGAbX4+6jnlvhnjxuUFytlfhQLhNL
 tLjjzhy0j1YDw5X4GjVpw858EBVl3KgRMmO9whyrWsbim32i2V7oVgHx6pzgRS5mxh
 nCD6Sfdu4O0qwfeS5jsvYxIkeexgGWOE5Lw8VYDaV68NAxaIj6W8s090YSr0n7CBpH
 61sjaOavOOr4Wt/TIchmolOHBAcA/26Nm+iik0sCysfrzEGvSz1CguM+gfZjwfBBIy
 OvSayE1rGmaUA==
Date: Wed, 28 Jan 2026 08:44:12 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
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
 Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH v6 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
Message-ID: <aXo83Ob9LpeHd2SC@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-4-zhengxingda@iscas.ac.cn>
 <6ea016d6-42a4-4d83-89fd-eee918a834ef@suse.de>
 <7301d5f80c7f247d4a2f82c242b3d8b8ad69f5e1.camel@icenowy.me>
 <064dd2b7-415b-4794-8867-73bdd7ac17df@suse.de>
 <4e340eb246e4e725754ed2097260c1a1acd8fe71.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e340eb246e4e725754ed2097260c1a1acd8fe71.camel@icenowy.me>
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
	FORGED_SENDER(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	URIBL_MULTI_FAIL(0.00)[samsung.com:server fail,gabe.freedesktop.org:server fail,suse.de:server fail,icenowy.me:server fail,iscas.ac.cn:server fail];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:gaohan@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fustini@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com,pengutronix.de,samsung.com,bootlin.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,suse.de:email,iscas.ac.cn:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0D44BA60DB
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 12:03:01AM +0800, Icenowy Zheng wrote:
> 在 2026-01-28星期三的 09:54 +0100，Thomas Zimmermann写道：
> > Hi
> > 
> > Am 28.01.26 um 09:39 schrieb Icenowy Zheng:
> > > 在 2026-01-28星期三的 08:58 +0100，Thomas Zimmermann写道：
> > > > Hi
> > > > 
> > > > Am 23.01.26 um 10:28 schrieb Icenowy Zheng:
> > > > > From: Icenowy Zheng <uwu@icenowy.me>
> > > > > 
> > > > > This is a from-scratch driver targeting Verisilicon DC-series
> > > > > display
> > > > > controllers, which feature self-identification functionality
> > > > > like
> > > > > their
> > > > > GC-series GPUs.
> > > > > 
> > > > > Only DC8200 is being supported now, and only the main
> > > > > framebuffer
> > > > > is set
> > > > > up (as the DRM primary plane). Support for more DC models and
> > > > > more
> > > > > features is my further targets.
> > > > > 
> > > > > As the display controller is delivered to SoC vendors as a
> > > > > whole
> > > > > part,
> > > > > this driver does not use component framework and extra bridges
> > > > > inside a
> > > > > SoC is expected to be implemented as dedicated bridges (this
> > > > > driver
> > > > > properly supports bridge chaining).
> > > > > 
> > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > Tested-by: Han Gao <gaohan@iscas.ac.cn>
> > > > > Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > 
> > > > I only briefly looked over this revision, as v5 already seemed
> > > > quite
> > > > good. If you want to do a follow-up patch, see my other reply to
> > > > v5
> > > > on
> > > > storing hardware formats in the plane state.
> > > Well the kernel test robot found a small Kconfig problem in this
> > > revision -- DRM_DISPLAY_HELPER should be selected.
> > > 
> > > Maybe I'm going to send a v7 to address this.
> > > 
> > > Should I also make derived plane state a change in v7, or leave it
> > > as a
> > > follow-up?
> > 
> > That would require another round of review, I guess. Better leave it
> > for 
> > a separate series.
> > 
> > > 
> > > By the way, I think PATCH 1-5 should go through drm-misc tree, am I
> > > right? Who's going to pick it if going through drm-misc?
> > 
> > I can do that. In v7, you can merge patch 8 (MAINTAINERS) into patch
> > 3, 
> > so that it goes in as well.
> 
> Well then who should pick patch 9, the mailmap change?
> 
> I remember there is some tree for this kind of "trivial changes", but I
> forgot any detail about this.
> 
> > 
> > Patches 6 and 7 are small, so I can also take them into drm-misc if
> > they 
> > riscv maintainers are OK with that.
> 
> Well, I think there might be other TH1520 DT bits merged by Drew
> Fustini in this cycle?
> 
> Drew, can you read this? (I heard from Han Gao that his mail failed to
> get delivered to Drew). If you can read this, could you confirm that
> whether you want to merge DT patches?

Sorry for not giving a tag for the dts patches earlier. I'll do that
now. W=1 dtbs_check looks clean.

The dts patches should probably go through the thead-dt-for-next tree.
There were no other dts patches for the merge window so I had not
planned to send a thead-dt-for-next pull request for 6.20. Normally I
try to send the PR to Arnd by rc5.

I'm excited about this series so maybe there is still a possibility. If
the drivers changes are going into next now, then I could apply the dts
changes to thead-dt-for-next and ask the SoC maintainer team if it is
possible to accept a late dts PR. There is still the possibility of a
couple next releases before rc8 this weekend. The extra week for 6.19
might make this feasible.

Thanks,
Drew
