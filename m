Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMWaNz3YgWlYKgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:13:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508ED81CC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA12B10E61B;
	Tue,  3 Feb 2026 11:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FkJdarJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9CD10E617;
 Tue,  3 Feb 2026 11:12:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0648460144;
 Tue,  3 Feb 2026 11:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E2FC116D0;
 Tue,  3 Feb 2026 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770117176;
 bh=nTpe9wbQPfWCaTdsw1hxkwbQbogjCIFzERnAV3j9o7k=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FkJdarJzM8b9lURHy3n+yN97FHK8oLTy/t6YtOQDsNPw81+97Mm21UtilvuagkcQg
 6ytBn9aDwQgjFSPkIr2zQhEaYb4rYLGQVTy4d4LDu/w5SgiCgMcqTnyqx2kZjNW3uU
 XTWK0alf7fT3mEkZSgr/LND+65Yim2XqMQMjLpxOdpVHYQ5BdmmV6CIzLdPflRELp+
 zn8Y952pElZ4UWrsaFLko4E8CNW8aMBQVu9RXjA1ZvBN9DVu0j+gLsIRIJcPeRDE/O
 1wWNtNJiwU2gyLfT191HuZW6qjapt7FL/ieCU2QrfJVvxmJCIumYm7+3qJqefO2cS0
 T/6d3LzElBKeg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id 4CF55F40068;
 Tue,  3 Feb 2026 06:12:55 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-01.internal (MEProxy); Tue, 03 Feb 2026 06:12:55 -0500
X-ME-Sender: <xms:N9iBaSDnI1ySTcZQgSUxyZKlXtVGr_OXK3Ka2kDx9zuw_85xTyyefg>
 <xme:N9iBaXX8_imykBF7gkafTS4WlwDL0qlcuLlIJ7Y45Jy9_yypIAKmqif8mxJM_EXQx
 FzgObKUSkR236DV6TjOXtpmgs5od50YYDF9LKla-Nh3p2EMt9kXAnjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeelleeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
 uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
 htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
 jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
 qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
 gurdgtohhmpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflh
 hlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthht
 oheprghthhgrrhhvrghtihifrghrihhlihhnuhiguggvvhesghhmrghilhdrtghomhdprh
 gtphhtthhopehfrhgrnhgtvghstghophhomhhpohdvsehgmhgrihhlrdgtohhmpdhrtghp
 thhtohepjhgrnhhirdhnihhkuhhlrgesihhnthgvlhdrtghomhdprhgtphhtthhopehroh
 gurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmihhnghhosehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehjrghnihdrnhhikhhulhgrsehlihhnuhigrd
 hinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:N9iBaenzbIIMVQhcmCIzSe0N1WdjdYaWjASVhpxjAZywalDletKxKA>
 <xmx:N9iBaUMaxqdWnBmU6eLFsyWvKU5mV99m7mlWJfqA-Y7cPU_XJJvpig>
 <xmx:N9iBaYoZITaOjXg5cO3QTAwUqjhAcGlFBuwKzcyfNqwAa-hBIAmehA>
 <xmx:N9iBaVtyncDAUdi-kz1Xr2YJKVT_rbJtNzBieNym0FRheHh99Jh3Uw>
 <xmx:N9iBaU6UdddKTBw7Ijyblc5A2a0rtFg1Shz6-SxnQyWEaTq9Mp12fR_A>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 1CE9E700065; Tue,  3 Feb 2026 06:12:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: APW7_PzxWZZ-
Date: Tue, 03 Feb 2026 12:12:21 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Atharva Tiwari" <atharvatiwarilinuxdev@gmail.com>
Cc: "Jani Nikula" <jani.nikula@intel.com>,
 "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, "Ingo Molnar" <mingo@kernel.org>,
 "Francesco Pompo" <francescopompo2@gmail.com>,
 "Lenny Szubowicz" <lszubowi@redhat.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-Id: <40497cd8-b8c7-42bd-a176-96f38b994dc4@app.fastmail.com>
In-Reply-To: <20260203073130.1111-3-atharvatiwarilinuxdev@gmail.com>
References: <20260203073130.1111-1-atharvatiwarilinuxdev@gmail.com>
 <20260203073130.1111-3-atharvatiwarilinuxdev@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/i915/display: Disable display for iMac's
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.30 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,ursulin.net,gmail.com,ffwll.ch,suse.de,redhat.com,alien8.de,kernel.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,app.fastmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9508ED81CC
X-Rspamd-Action: no action



On Tue, 3 Feb 2026, at 08:31, Atharva Tiwari wrote:
> Disable display on iMacs, as they can't do link training
> on the internal display.
>
> (tested on iMac20,1)
>

How will you use the iMac if you disable the display?

If this is not in fact what you are doing, please explain in the commit log what exactly you are disabling and why.

