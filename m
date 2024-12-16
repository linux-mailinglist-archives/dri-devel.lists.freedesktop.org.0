Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0229F2DEB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F299D10E577;
	Mon, 16 Dec 2024 10:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="E4Wy5Iut";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="qDCud6QC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B16910E577
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:13:18 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 26BA91383AB0;
 Mon, 16 Dec 2024 05:13:18 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Mon, 16 Dec 2024 05:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1734343998;
 x=1734430398; bh=wivUGdcXYn6VwelfaLekmpNak5Bcy3xhV06KWiQzClA=; b=
 E4Wy5IutbDxBHk8+mFIuN+1AMbV4u7yWjqcjs/ohVZLVVAHXszEUEfWI3EsvKgD4
 uGHO1ky7A2JnKY2b5V/o9gedVq3mfvmB0O8n/hZ9Zdp6sjQsjJ0Ss/M3xVECN9Y2
 285OVJ2qtUIguSLeU1h+ZUU/0jzDa2LhbSBGEWhfrYt//H/yqE4YoxhEepgVE6Te
 gNB7/czcXQQcRG1Vxod/itgte84EX/Q50lRxM6pbOhkBoOGrrtMn61f5hcZb2CT/
 pxYTDGtgm6ItwrkMC6ymMSxThAJ8e9LXE6jI2YFP6qlw9dU2yn4dzM10/fS9bSAM
 kdE7SyinUJAW3+lsJ47EdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734343998; x=
 1734430398; bh=wivUGdcXYn6VwelfaLekmpNak5Bcy3xhV06KWiQzClA=; b=q
 DCud6QCp0V1iCaJmCs2gPw/rtFX7/5LQjHdNzXb950CIQJV2tBHWlSTERH+wu5mU
 OcvaV78TQd0hdsZM555o6WkvKoVqP/ThqsQ5QxDAJmiS0GiDXkPrQmva0u9BYBWJ
 hOP9ulZksMG4v43kVrklzDxoEllOTLJFKOdL3SFyLL0UqZBJ4WK/qYX+i9w0oZRf
 Q+cO07omolM2Kd2chyN+Seph2Kh1dWLA1dU+ybfR9BhQjBUEF2I4IQk8ysq+CHQP
 KXMuytkmU+Fs8vuZprFplJNUjlBIZLud0IFNOTjYeMd58fGjiSlvdG3w25P2Wih6
 Ak7fL31c0qlMcGiu8+1LA==
X-ME-Sender: <xms:Pf1fZwQL3IFh4yAdP0IZXTOYWupixVQKRIR2VXACtF0FIwMKs2bbnw>
 <xme:Pf1fZ9xkPOTDIun49Y_r06EpTBwZraZgBdfcPadFOjHKiCOZrw5Mvrr9hLtoeI0-O
 qduH0dY9WYQkb8KUtk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
 hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
 ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
 gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
 vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddp
 mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghroh
 ihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
 pdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopeguvg
 hllhgvrhesghhmgidruggvpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhu
 gidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrd
 hfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtrghgihhn
 gheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigphhptgdqug
 gvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepjhgrvhhivghrmhes
 rhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:Pf1fZ93xhCqySX7gHNrptVHxhMGCe3rk4EOLDa7frWmCUGYK_WrnNQ>
 <xmx:Pf1fZ0D1hm5-bVL5XAY4NjKbP6tXldx00oItEU-lMwIamAYLcIOwQw>
 <xmx:Pf1fZ5iwESOtKK7P3N9JqntnJqIadOwfNE_dBBE1NGPtU5ub9ty3eA>
 <xmx:Pf1fZwpdN_CUM20AQx7drnZuBhUmFQoV_uy_M_QXfCL0YxMag_ob-g>
 <xmx:Pv1fZ-aYJaDSAZC-h4tgh1CAopr3btq1o-_2Lt81K2X-t6HIex-fugaU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 52B3A2220072; Mon, 16 Dec 2024 05:13:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 11:12:32 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Helge Deller" <deller@gmx.de>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Simona Vetter" <simona@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Message-Id: <1dcda6ee-dc0f-4d2e-b234-6f03b5637d01@app.fastmail.com>
In-Reply-To: <20241216074450.8590-1-tzimmermann@suse.de>
References: <20241216074450.8590-1-tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/3] drm,fbdev: Fix module dependencies
Content-Type: text/plain
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

On Mon, Dec 16, 2024, at 08:42, Thomas Zimmermann wrote:
> Fix the dependencies among the various graphics modules.
>
> Before addressing the FB_CORE issue, patch 1 first resolves a problem
> with BACKLIGHT_CLASS_DEVICE. A number of fbdev drivers select it, which
> results in a recursive-dependency error after patch has been applied.
> Making these drivers (or parts of them) depend on BACKLIGHT_CLASS_DEVICE
> fixes this.
>
> Patch 2 selects FB_CORE for DRM_GEM_DMA_HELPER and DRM_TTM_HELPER.
> This is necessary with the recently added DRM client library.
>
> Patch 3 is the second half of the patch provided by Arnd at [1]. It
> could not yet be merged because of the issues fixed by patch 1.
>
> Side note: For the majority of graphics drivers, backlight functionality
> depends on BACKLIGHT_CLASS_DEVICE. In a few cases drivers select the
> Kconfig token automatically. These drivers should be updated to depend
> on the token as well, such that backlight functionality is fully user-
> controlled.
>
> v3:
> - Fix PMAC_BACKLIGHT case (Christophe)
> v2:

The patches look good to me. I've had a slightly different version
in my randconfig test tree and have replaced it with yours now
to do some more regression testing, but I expect this to be fine.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
