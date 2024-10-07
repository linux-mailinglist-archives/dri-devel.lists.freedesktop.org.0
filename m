Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB396992882
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 11:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55DE10E343;
	Mon,  7 Oct 2024 09:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="pf/Fyioz";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="IMME2xqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a2-smtp.messagingengine.com
 (flow-a2-smtp.messagingengine.com [103.168.172.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8BE10E343
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 09:53:49 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailflow.phl.internal (Postfix) with ESMTP id 14587200544;
 Mon,  7 Oct 2024 05:53:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Mon, 07 Oct 2024 05:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1728294829;
 x=1728302029; bh=Ey8q2Exixqsv+Hc2U8qhqIZaTVEP7hv/rQPpymDolag=; b=
 pf/FyiozswrQKEbnxbav3fDlP75KcXR9GBqYfdgubiMskuo9eQTLbMbCDv1WI4x+
 f8P5i7Itu6WNxLe/7itQACTdglcl+jvQOnGvp0cpWlD6U50cLgTJmxMPPRHFVjEH
 3YbgpQg3qEFeVemt8Vrr8P/AEaxFeOeL/gbaJ4exc2giEmcL8k1i8tcD03VkSHEq
 o0KHz9bVUadEUF9ZpyfwCxa6WUWXBBm/YY2yjjgdBXWsqWuhCd7ReBQHnqe9A1cH
 QuIF2AAteKSeR6fuxNbIoQbCkNeM149Jh6Js3xfmR0lrJuwickJkZYHqrtvk1wIJ
 MCAqepkcqZRrwWpjppAjwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728294829; x=
 1728302029; bh=Ey8q2Exixqsv+Hc2U8qhqIZaTVEP7hv/rQPpymDolag=; b=I
 MME2xqiifKGxwX0j/9XIQoe9GsmOqKhuhvadTlHVCd4QqcNWRdhG+t/KLT6Jvpk1
 ASUazZ0j1hqNBK78B2f1vp4qNNfmAnjiFHW/TXFIrij2WL5bqVdl/HMygeKvMdXF
 Nd6bjzrZt4Xs6CRwirshFXZQjeUNBqnwSDCS9doJI8Ll3cFnQJ3Y1j8FV+Lsw0X6
 KBVnKmWPHnVlVgL3Rl7nX7IGnau2bhmkPoGllXhWQrQNh3hovBNtM6Ars7IvBdBK
 Mul5km8oxuPRP51Ur9Wg3BVRaAVyJIiaOcyP0SWgq45pzT8b64y1egHkZeDftCRy
 zr6YnCtKRKSMjZO0W6oqA==
X-ME-Sender: <xms:rK8DZ0G0SR5WvT1DqqNfZ32VmKws2vxA1UMlXQkF9CW5nbXTROPBLg>
 <xme:rK8DZ9VBNu_N1BfXzo-uJSSrRl4CKT_yQwAYEkKhke9iEwXSnSAw6emOka1ZHv_lr
 lk6meAVv-_H8A>
X-ME-Received: <xmr:rK8DZ-K9-_Z62ooYxnvNWlA2WDPFofVodrl1Jq804aQrad5u8u_fbV1djC-Y2UnWypyGKnKt2puK293uWhHjW7vf5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvledgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
 necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
 frrghtthgvrhhnpefgkeffieefieevkeelteejvdetvddtledugfdvhfetjeejieduledt
 fefffedvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepgedvpdhmohguvgep
 shhmthhpohhuthdprhgtphhtthhopehmrghrkhhushdrvghlfhhrihhnghesfigvsgdrug
 gvpdhrtghpthhtoheplhgrnhiirghnohdrrghlvgigsehgmhgrihhlrdgtohhmpdhrtghp
 thhtohepmhgvhhguihdrughjrghithessghoohhtlhhinhdrtghomhdprhgtphhtthhope
 gurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghp
 thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
 htoheplhhinhhugidqphifmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugihfoh
 hunhgurghtihhonhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
 rdhorhhgpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:rK8DZ2FRBKNWamAcgnfF_EPiDvyezm_UZZBpwtuYOjghOMH2wQP4bQ>
 <xmx:rK8DZ6WQo6lImzGcIbIpzoraLpLNJKxcAzz-WB_hYjebnf9qmrGJrg>
 <xmx:rK8DZ5Nwmx0mMauabCm781pbWVnav8RPQWfredRNaHrVE7STXoI4vg>
 <xmx:rK8DZx2SdPZykWuw4xRJb4orhDDrGd9jdzTEg0xWTsYMz38CAnB2yg>
 <xmx:ra8DZx0woy97NI_Ohlvq0cQV8C2hygT_klQbOzGECL7un0niFVuA9Z55>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Oct 2024 05:53:47 -0400 (EDT)
Date: Mon, 7 Oct 2024 11:53:45 +0200
From: Greg KH <greg@kroah.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v9 0/2] Add driver for Sharp Memory LCD
Message-ID: <2024100737-audacious-subplot-7f4a@gregkh>
References: <20241007013036.3104877-1-lanzano.alex@gmail.com>
 <4e1d50de-8e00-47a3-94e0-5ee9c5df8755@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e1d50de-8e00-47a3-94e0-5ee9c5df8755@web.de>
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

On Mon, Oct 07, 2024 at 11:34:13AM +0200, Markus Elfring wrote:
> > This patch series add support for the monochrome Sharp Memory LCD panels.
> …
> > ---
> > Changes in v9:
> …
> 
> Would you like to benefit from the application of scope-based resource management
> (also for this software component)?

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
