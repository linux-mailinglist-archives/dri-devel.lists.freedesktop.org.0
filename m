Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA1A85912
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 12:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C8910EB5C;
	Fri, 11 Apr 2025 10:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="DkesvRPb";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="AFKm5rGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at gabe;
 Fri, 11 Apr 2025 10:11:11 UTC
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F4D10EB5C;
 Fri, 11 Apr 2025 10:11:09 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id BF8911380226;
 Fri, 11 Apr 2025 06:01:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Fri, 11 Apr 2025 06:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1744365688; x=1744452088; bh=z5cs1W8tVA
 bJ3ZA2qMajWH2YzqXLYeH4TnXCQKM1qc8=; b=DkesvRPbaObCmJtnsaeuQhyWuE
 jBT+v0SPalOYX2jilqnBC88s9Kpn3iKmJ0z3Ig7eYDIYd1PmwDW8ldGxpT3o+qeU
 gZICnCYqz0pBx9EV1Q7Ya1h0tqVhUCf2kHf75wALwToRTJpflOgAQHTfLvIf89AY
 RKKuPQ3Q6mIVJoKMM7NAk1AWF2LpRlf53Bg0PbRZcp0fS4iDhNpLEisur+bBxWSQ
 qKXZGy6szUcI+TO5NQlQKjUOGDz7HThAz837SzRDnBFSpl72AMg8r+oIZKcoBZjp
 ZtmNyM+NfJnQvFhm7LfN1Qm5v0DjpD6atDcaQ/DNMNtFz/0Jo7iltkwDpJJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744365688; x=
 1744452088; bh=z5cs1W8tVAbJ3ZA2qMajWH2YzqXLYeH4TnXCQKM1qc8=; b=A
 FKm5rGx2BLCYEndgJ7mw3IN+L37G97Xeyaci4YKzEJ6xen2Y6XaE57Ucczz1kRnU
 1L82wq/s8jPk4vsMp6G2p8X4rLrHGFAphiiB4Y3hs0g0CmVlc31BeUxkHUZU8dRf
 WGILwzfEVGNCou7acgL+VcOgkwQmJL8DPTn7dw4wog123nihpwYJm2U5vIXvLS1/
 zYGlcHfY9qxX1oXufcEVGpzkO/Gp2QPubG06TZFraW14ADQBNhTFMM3W0LpqVfN8
 mkqg1QCQGOaG3Y47ljRt30aWD6OUEyYsb6S7vp8AzO7UgdOnoNqbPbup6nb8stYx
 oWCMHGXW5LzQ635kHpI5Q==
X-ME-Sender: <xms:eOj4Z18WohOqzZh-qJlmkzeCbSsRkR8now3uvVLiJJiUCE7KntVeFQ>
 <xme:eOj4Z5v8pkWUzauwqvKEZMar3D6uq_IUrubosCzJknM-vQMjHEJUM0HLy1ccc8X-E
 ni4SIsyRSa0OQ>
X-ME-Received: <xmr:eOj4ZzAoUe-SJf3YXEDsTikSMVm2w2BYN9d9l7VW-KtuoeMIiZ43A-FmMEjwEmZBzJGAnWHaishA_BRniFUk_LNw3UECHcHTfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduhedvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtgfgjgesthekredttddt
 jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
 eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
 ggftrfgrthhtvghrnhephefgteevgfefgeetteefueeuvefhfeektdelhfeuffeuleefhf
 dvgeffkefgieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
 dpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
 ohihvghrsehirhhlrdhhuhdprhgtphhtthhopegusggrrhihshhhkhhovhesghhmrghilh
 drtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
 epughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgt
 phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
 pdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhope
 grlhgvgigrnhguvghrrdguvghutghhvghrsegrmhgurdgtohhm
X-ME-Proxy: <xmx:eOj4Z5eozMALmK2q7WTH3Y7NW2p5xx8GWN8pEMuDFLJ0mi2F1s7-AQ>
 <xmx:eOj4Z6M2E5C1Nn_VE7HWQ6o8uJmm9wXtXpaRTTwA_4eNQUMH7eOrBw>
 <xmx:eOj4Z7lRb9TdtFPHrQO6x-e0jhSIgjFA_uFcvgcYaS_cA_PWhH_7Zw>
 <xmx:eOj4Z0uT-62w59kPKHqk3P3hXEjVInJ-nq6VqMNpiEPHU0iV2RAm8w>
 <xmx:eOj4Zz3ztczLsdEPlh51aY9pvfDh_6eqGCOVKW2rVT7VRP6SMyDLSRaI>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 06:01:26 -0400 (EDT)
Date: Fri, 11 Apr 2025 12:01:24 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
Message-ID: <Z_jodBrNFdEpJRKA@mail-itl>
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
 <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
 <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; x-action=pgp-signed
Content-Transfer-Encoding: 8bit
In-Reply-To: <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


Hi,

On Wed, Apr 02, 2025 at 04:35:05PM +0200, Gergo Koteles wrote:
> Hi Dmitry,
> 
> But the code would start to become quite untraceable.
> duplicate mode in amdgpu_dm_connector_mode_valid()
> call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
> duplicate mode in create_stream_for_sink()
> overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
> if crtc_clock == 0 call drm_mode_set_crtcinfo() again in
> create_stream_for_sink() 

FWIW I'm affected by the same issue (on HP ProBook 445 G7, with AMD
Ryzen 5 4500U). And the patch quoted below fixes it for me too.

> 
> saved_mode is never used after this, so I can't add the condition here
>         if (recalculate_timing)
>                 drm_mode_set_crtcinfo(&saved_mode, 0);
> 
> This commit is related, I think:
> 1101185 ("drm/amd/display: fix the ability to use lower resolution
> modes on eDP")
> 
> Regards,
> Gergo
> 
> ---
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bae83a129b5f..83c8c81d4015 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6984,6 +6984,9 @@ create_stream_for_sink(struct drm_connector
> *connector,
>         if (recalculate_timing)
>                 drm_mode_set_crtcinfo(&saved_mode, 0);
>  
> +       if (mode.crtc_clock == 0)
> +               drm_mode_set_crtcinfo(&mode, 0);
> +
>         /*
>          * If scaling is enabled and refresh rate didn't change
>          * we copy the vic and polarities of the old timings
> --

- -- 
Best Regards,
Marek Marczykowski-Górecki
Invisible Things Lab
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf46HQACgkQ24/THMrX
1ywBfAf/SX79WOL0Rv1cL2F/YeEUbr6b/FxZ6W+xsFCi38UxcN0PKCGalQ76jT5r
LAyy1zPedAAdGu+JdQ8abrVfPbSXnzLUcUZNN75kGHixS1c/TqfP4L9ymZ6Z5rAB
BUt579EkdDZlm2dZ0mxwHcdoArv7fK05Fb+l3Vd645w5MK0fmwWPesCeBaEiwG2S
ZiuSOWcJBL0yPPzvRaVPD5FCgjjjEhQ2fZZinqhwVy1LNA6OBXQrVvNhOazFVjKq
rQV1YLG4gCBu6TD6NaETrPMevmZmovuo7o4/6Y5vJQexhQv3eaaxE5dh/0AaWovJ
FqW2VrxvWXz6HgOokPpfispYzpMgEQ==
=+SPC
-----END PGP SIGNATURE-----
