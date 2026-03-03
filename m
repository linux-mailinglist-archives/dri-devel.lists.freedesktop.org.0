Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PyzOe8Kp2kDcgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0055B1F3AA6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 17:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225EC10E854;
	Tue,  3 Mar 2026 16:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="pg6KN0dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA71A10E854
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 16:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=dIABMziNLvW0jGN8kMlgpZrAq89Imgr046x+DRl4Rp0=; b=pg6KN0dJ5ZW2AM6cCDdSSbnuh8
 PhW6AkE7BgkA004hNmbRR18mGBAQhSx99q5o9AAXWurQ7v8cqZw4Sy816/wAn7HandtGwvps2gs9f
 Rqcam9kTr/6hJ0oAXcGwT8kAE04C11Py+CCOXtzokRwkAzZE0Z/Vid+3hcaJR9LmbvjM=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:35704
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1vxSWF-0003Ms-A8; Tue, 03 Mar 2026 11:22:47 -0500
Date: Tue, 3 Mar 2026 11:22:46 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260303112246.0bd6238aba7489b6de499299@hugovil.com>
In-Reply-To: <920740e1-5bbb-4632-a62d-325715cd8043@kernel.org>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-5-hugo@hugovil.com>
 <20260303-rational-thundering-firefly-9dcaa9@quoll>
 <20260303095533.1c6dff174f6c9d162d3e3303@hugovil.com>
 <920740e1-5bbb-4632-a62d-325715cd8043@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -0.8 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-3.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-6UL model name
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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
X-Rspamd-Queue-Id: 0055B1F3AA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=x];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shawnguo@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:antonin.godard@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:hvilleneuve@dimonoff.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_NA(0.00)[hugovil.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,nxp.com,pengutronix.de,bootlin.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,dimonoff.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[hugovil.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_WP_URI(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,variscite.com:url]
X-Rspamd-Action: no action

Hi Krzysztof,

On Tue, 3 Mar 2026 16:19:54 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 03/03/2026 15:55, Hugo Villeneuve wrote:
> > Hi Krzysztof,
> > 
> > On Tue, 3 Mar 2026 08:10:51 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> >> On Mon, Mar 02, 2026 at 02:03:40PM -0500, Hugo Villeneuve wrote:
> >>> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >>>
> >>> There is no Variscite module named VAR-SOM-MX6UL.
> >>
> >> VAR-SOM-MX6? And there is.
> >> https://dev.variscite.com/var-som-mx6/
> > 
> > Ok,
> > I was confused by the "const: variscite,var-som-imx6ul" and thought the
> > description was not matching.
> > 
> > But there is still no module named "VAR-SOM-MX6UL", but "VAR-SOM-MX6",
> > with different CPU variants like UL, ULL, etc. So I will modify the
> > patch to reflect that.
> 
> I don't understand what you want to reflect/modify.
> 
> Description says: VAR-SOM-MX6
> My link says: VAR-SOM-MX6
> 
> What is incorrect?

VAR-SOM-MX6 is ok, like your link shows, but not VAR-SOM-MX6UL.

If someone looks at VAR-SOM-MX6UL, they may think that the "MX6" part
refers to the VAR-SOM-MX6, or they may think that the "6UL" part refers
to the VAR-SOM-6UL, and it can be extremely confusing. This was my
understanding at first, and the reason why I submitted this patch.

If you look at the associated board entry in the binding, it says
"const: variscite,mx6ulconcerto" but the VAR-SOM-MX6 doesn't use
the concerto board. It uses a board named "VAR-MX6CustomBoard":

https://variscite.com/wp-content/uploads/2017/12/VAR-MX6CustomBoard-Datasheet.pdf

The VAR-SOM-6UL uses the concerto board:

https://variscite.com/wp-content/uploads/2019/07/Concerto-Board_Datasheet.pdf

So the description in the binding "i.MX6UL Variscite VAR-SOM-MX6 Boards"
is wrong, and needs to be replaced with VAR-SOM-6UL.

By the way, support for the VAR-SOM-MX6 is provided by this binding entry:
   - description: i.MX6Q Variscite VAR-SOM-MX6 Boards
    items:
      - const: variscite,mx6customboard
      - const: variscite,var-som-imx6q
      - const: fsl,imx6q


> > 
> > In fact, I will modify the description to reflect that it supports both
> > VAR-SOM-MX6 and VAR-SOM-6UL modules.
> 
> Are you sure that it does?

With my new research, as explained above, this is not the case. I will
modify the description to reflect that it supports VAR-SOM-6UL modules only.

-- 
Hugo Villeneuve
