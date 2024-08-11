Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0594E111
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2024 14:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1893510E010;
	Sun, 11 Aug 2024 12:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="iqagdlus";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="edfi6leC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Sun, 11 Aug 2024 12:21:14 UTC
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA01210E010;
 Sun, 11 Aug 2024 12:21:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id 7022F138FCDC;
 Sun, 11 Aug 2024 08:13:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 11 Aug 2024 08:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1723378408; x=1723464808; bh=bN/mOZQgK8
 R1TmjEJ6lNJc8Sf+gJv+a60h50Kou4cuo=; b=iqagdlusCS3dT9FpqXKasV4YaT
 ekkx/vsqvF44Q+nQfhN+McGfpZKm7VUSBEElOU/ajtQyLOaQjEwo5IHFzpSVc6P9
 t9+mr51AhancDTbLYI4LVP6FCeZZEJ6JL2F9H2sgCY6tsIvIzNytC/bQk7rqpGMo
 Obhm94DXk0CmdjhINN+hxPA72KNmRS4RGW2e7nXLYAi2oPksJuFQ6qeKVFOTUGAX
 zFFd1t3Ih+oUf4UZDeVUe3gk/QI2YvIwQt/iPQYup4Zql/UlskvYprIF53xpTBXl
 yj6LkopuvmmtNxE4oY8bNwcE9VgJzNiX86P0haEVCmXCVOcxyQOCd8kks0Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1723378408; x=1723464808; bh=bN/mOZQgK8R1TmjEJ6lNJc8Sf+gJ
 v+a60h50Kou4cuo=; b=edfi6leCnJJ0Cv/rslMCnBHnWOAsCMpvCcwiXb7a7cii
 W7gjtn5jbDlF9CMgpYnjio3UDEDAvdXpkoPaSaW1s7qGehxXMgKO3r/mPr1cifKI
 IO1E/fdpIKw2xVABNJbOXc4DQfp5yuenE7l4ss7vp6dYOKndpne4tF/Y73uT4A0A
 SvotFEDZ/WMOifzM7KmstFHmtuJrnfyY1vh8BOwlLE6IBl73pPrkjRAezHgqnbGs
 KEqD/+GB2Rcwd4Wl5IyhT6QByN+6dyoFU16F/P0Vu3CkHy4iFBvmKvpz+h7WOBTA
 ZrpjlMB4DxHRbhJmZvaLjPPit4cecC349KAfMb/YcA==
X-ME-Sender: <xms:6Kq4Zp_YHSX5EGYFLSiQLTRCT1YPwkKD8ZqG9awFX5TeRgwKIdt1gg>
 <xme:6Kq4Ztsx3nrIt1HKgE_w_KsvpdC4iJUbgWTHT6d8dtCUTPhSDqlXZRU2m6HqQxyNX
 ftSkKMobbCrfw>
X-ME-Received: <xmr:6Kq4ZnBUqsgVUTSDts07H4vhNbwitVpDx8ZkEcgzuhVT30KwwK6YlhG1Yb2A7YvfPxolu0nnHqq_kj_UAyYhK_URPSyiUPYfgBv0ZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleekgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
 tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
 hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecu
 hfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrg
 htthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduieffvddufeefleev
 tddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhn
 sggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhgvvh
 hinheshhholhhmrdguvghvpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlhhinh
 hugidruggvvhdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghs
 khhtohhprdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvg
 gvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
 vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifrgihnhgvrdhlihhnsegrmhgurd
 gtohhmpdhrtghpthhtohepjhgvrhhrhidriihuohesrghmugdrtghomhdprhgtphhtthho
 peiirggvvghmrdhmohhhrghmvggusegrmhgurdgtohhm
X-ME-Proxy: <xmx:6Kq4Ztf_hbQWGCQSsIvsVGTJ3d4HSeQPG3dfo1AWRsNbsJV6uxGBKg>
 <xmx:6Kq4ZuPcYMlfMNoRFyiC3ARBJNUz3iJSJHUVaPStD5RZhmFDHoFRZg>
 <xmx:6Kq4Zvma3MCkKGDsk74sGuJq28jYf6dYxOYlb1EfZXWuTBaa3TcrjA>
 <xmx:6Kq4ZotDU49Hf7RGXvdKesU2U7DCA-k5v01lsrrVnCY331CgMG4N2Q>
 <xmx:6Kq4Zl-uHpbt6TYXbwRDt-dbGnrCgYhpBaRBDcIccYuU6rbOi89l6EUe>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Aug 2024 08:13:27 -0400 (EDT)
Date: Sun, 11 Aug 2024 14:13:26 +0200
From: Greg KH <greg@kroah.com>
To: Kevin Holm <kevin@holm.dev>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 amd-gfx@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Wayne Lin <wayne.lin@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 6.10] drm/amd/display: Refactor function
 dm_dp_mst_is_port_support_mode()
Message-ID: <2024081141-clump-obliged-8fb0@gregkh>
References: <20240730185339.543359-1-kevin@holm.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730185339.543359-1-kevin@holm.dev>
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

On Tue, Jul 30, 2024 at 08:53:39PM +0200, Kevin Holm wrote:
> From: Wayne Lin <wayne.lin@amd.com>
> 
> [ Upstream commit fa57924c76d995e87ca3533ec60d1d5e55769a27 ]
> 
> [Why]
> dm_dp_mst_is_port_support_mode() is a bit not following the original design rule and cause
> light up issue with multiple 4k monitors after mst dsc hub.
> 
> [How]
> Refactor function dm_dp_mst_is_port_support_mode() a bit to solve the light up issue.
> 
> Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
> Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> [kevin@holm.dev: Resolved merge conflict in .../amdgpu_dm_mst_types.c]
> Fixes: 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for mst mode validation")
> Link: https://lore.kernel.org/stable/d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev/T/#u
> Signed-off-by: Kevin Holm <kevin@holm.dev>
> ---
> I resolved the merge conflict so that, after this patch is applied to the
> linux-6.10.y branch of the stable git repository, the resulting function
> dm_dp_mst_is_port_support_mode (and also the new function 
> dp_get_link_current_set_bw) is identical to the original commit.
> 
> I've confirmed that it fixes the regression I reported for my use case.

Now queued up, thanks.

greg k-h
