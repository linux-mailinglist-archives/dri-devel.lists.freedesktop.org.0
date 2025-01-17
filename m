Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2246A152E7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 16:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C04310EB1F;
	Fri, 17 Jan 2025 15:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="WP1KtlQq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="dRtQSTs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 462 seconds by postgrey-1.36 at gabe;
 Fri, 17 Jan 2025 15:31:12 UTC
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55D710EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 15:31:12 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id ECC041140122;
 Fri, 17 Jan 2025 10:23:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 17 Jan 2025 10:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1737127409; x=1737213809; bh=8+jxORCvtC
 O1UVW79wt1NLNBpDwrWUOYHCySH1HZJJE=; b=WP1KtlQq0wd8YKHI+ufrouNriM
 VgQkYWZeTLxC6Kz8jwM55ZqgglzmzyEUdDk/k9Dy3UkmNtlHuSti6saC9CKakafN
 wrQOjpLLWOrf+3gwi9dirlLZm1DOsHhGqcgmoCCfy/sbF8m7j6zK5MyoOPDx2ZmR
 2g90S1rVkpnpFGhcJY1TMaBhOghsCuEckjrrQPjOvr11LvLgvtP81nkB5dSLPEQq
 lFHVkJlE33U0Wojrf+8kT08KBO/+kuVtzu2cPfgrb9JnmryZiXa7w5uk84lxbXwb
 i4H4tNRLH4HRNAP4vBPpGc6A/NqU1n8DMT8FqYsE8KaRCfRBMtxO3Obs0lAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1737127409; x=1737213809; bh=8+jxORCvtCO1UVW79wt1NLNBpDwrWUOYHCy
 SH1HZJJE=; b=dRtQSTs1gii4ez3E70cPRG58yKAcmv1iFEQ9jxDM22qGC69xJMR
 m93mCV+seh8v5lr7IS6g9757BJ5ErB5RgjYFPw8jHb+JkKC6tB8JDCwwV289jDj6
 za5jUjaBogwvoo56LU4RcIm7Pe1p44lc0m6STlAIVFmMCGxNQ6YZGGmKeP7Ne/fY
 YtURY543Ad4AuPNiwOMfDHnYWWMZUE6AbFMVjrIdA4N4KDHC8/yNMn6cbLPt+yBN
 Rv6nBk/nzISymGufkDE5DzI7CeFrn0JxBJr5ouvzJ2cODL4cYlyYJFVmMTGBfSu9
 WIx5c7RAyAhGK7zKyakhkD8uMXOpGXttyKA==
X-ME-Sender: <xms:8XWKZ2NXf0LVIwmdBuUCE5_w9E0R69LUw9CTTdqcqawYS7QcrWz8sw>
 <xme:8XWKZ09D9WnLu8cdoqdVAoDp02Dt2B19zJ-zO3Z8qs0BkvkP2wW8GkmKGh7s2vZdj
 g6pZHN15tAQtA>
X-ME-Received: <xmr:8XWKZ9T6Gv66Zp00SpU-JpVj5k6Pev2x4ydJWBT8nWhYLJSAaQ_gZR_V2YDHl2oX1im6Ud9gveySR_BBXrFr5yF1pKZIyVKPMDjHDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
 ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
 grthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiffdvudeffeel
 vedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhdp
 nhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsih
 hmohhnrgdrvhgvthhtvghrsehffhiflhhlrdgthhdprhgtphhtthhopegrlhgvgigrnhgu
 vghrrdguvghutghhvghrsegrmhgurdgtohhmpdhrtghpthhtohepshhtrggslhgvsehvgh
 gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvqdgtohhmmhhithhs
 sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhushhhihigihhonhhgse
 hkhihlihhnohhsrdgtnhdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighes
 rghmugdrtghomhdprhgtphhtthhopeigihhnhhhuihdrphgrnhesrghmugdrtghomhdprh
 gtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhho
 nhgrsehffhiflhhlrdgthh
X-ME-Proxy: <xmx:8XWKZ2uwKsfxqTDmrPBJZcxraUFcRUFSoG791awAFjux8WR-oKFWTA>
 <xmx:8XWKZ-cDldANaC3nCiwSQVtR-0l_swxSfQfFmxrXX2eku9bkH9EF-w>
 <xmx:8XWKZ63PzhxSidW7zsId0sl3eRq1N6G2SrwrPkt2JoUvzPFRYBFtqg>
 <xmx:8XWKZy9svf6NA8Mb4PQbgUyYYmyBdqlbuQSUXsM1bUwCITZIGLqgmw>
 <xmx:8XWKZ88Fd1OkD9b8vEg5Iqvnp_kyxzNz8bi1cPbtXU7ESZkhL507EZZD>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jan 2025 10:23:28 -0500 (EST)
Date: Fri, 17 Jan 2025 16:23:25 +0100
From: Greg KH <greg@kroah.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "stable-commits@vger.kernel.org" <stable-commits@vger.kernel.org>,
 "oushixiong@kylinos.cn" <oushixiong@kylinos.cn>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: Patch "drm/radeon: Delay Connector detecting when HPD singals is
 unstable" has been added to the 6.6-stable tree
Message-ID: <2025011717-ambush-viable-a27a@gregkh>
References: <20250103004210.471570-1-sashal@kernel.org>
 <BL1PR12MB5144226AD0D6697DBF25ED56F7122@BL1PR12MB5144.namprd12.prod.outlook.com>
 <Z4pzIzRg2xpYv2mJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4pzIzRg2xpYv2mJ@phenom.ffwll.local>
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

On Fri, Jan 17, 2025 at 04:11:31PM +0100, Simona Vetter wrote:
> On Wed, Jan 08, 2025 at 12:02:03AM +0000, Deucher, Alexander wrote:
> > [Public]
> > 
> > > -----Original Message-----
> > > From: Sasha Levin <sashal@kernel.org>
> > > Sent: Thursday, January 2, 2025 7:42 PM
> > > To: stable-commits@vger.kernel.org; oushixiong@kylinos.cn
> > > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie
> > > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
> > > Subject: Patch "drm/radeon: Delay Connector detecting when HPD singals is
> > > unstable" has been added to the 6.6-stable tree
> > >
> > > This is a note to let you know that I've just added the patch titled
> > >
> > >     drm/radeon: Delay Connector detecting when HPD singals is unstable
> > >
> > > to the 6.6-stable tree which can be found at:
> > >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> > >
> > > The filename of the patch is:
> > >      drm-radeon-delay-connector-detecting-when-hpd-singal.patch
> > > and it can be found in the queue-6.6 subdirectory.
> > >
> > > If you, or anyone else, feels it should not be added to the stable tree, please let
> > > <stable@vger.kernel.org> know about it.
> > >
> > >
> > >
> > > commit 20430c3e75a06c4736598de02404f768653d953a
> > > Author: Shixiong Ou <oushixiong@kylinos.cn>
> > > Date:   Thu May 9 16:57:58 2024 +0800
> > >
> > >     drm/radeon: Delay Connector detecting when HPD singals is unstable
> > >
> > >     [ Upstream commit 949658cb9b69ab9d22a42a662b2fdc7085689ed8 ]
> > >
> > >     In some causes, HPD signals will jitter when plugging in
> > >     or unplugging HDMI.
> > >
> > >     Rescheduling the hotplug work for a second when EDID may still be
> > >     readable but HDP is disconnected, and fixes this issue.
> > >
> > >     Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> > >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > >     Stable-dep-of: 979bfe291b5b ("Revert "drm/radeon: Delay Connector detecting
> > > when HPD singals is unstable"")
> > 
> > 
> > Please drop both of these patches.  There is no need to pull back a
> > patch just so that you can apply the revert.
> 
> Since we've just been discussing stable backports at length, how did this
> one happen?
> 
> 949658cb9b69ab9d22a42a662b2fdc7085689ed8 is in v6.11 and 979bfe291b5b in
> v6.13-rc1, so there's definitely a need to backport the latter to v6.11.y
> and v6.12.y. And maybe there was a cherry-pick of 949658cb9b69ab9d22a42a66
> to older stable releases already, but that doesn't seem to be the case. So
> what happened here?

I think Sasha's revert checker caught this one accidentally, but I'll
defer to him for the final answer.

thanks,

greg k-h
