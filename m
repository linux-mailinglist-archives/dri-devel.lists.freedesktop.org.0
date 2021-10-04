Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1842186C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 22:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF016E0F7;
	Mon,  4 Oct 2021 20:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F8A6E0F7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 20:31:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 15F0A3200C17;
 Mon,  4 Oct 2021 16:31:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 04 Oct 2021 16:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=sFLwbogJTuaCetYvbTgL9lVGckd
 MqCuANETSyDED0ic=; b=vqyQos20a/arlUSomJpIghSRIm4ksffuKB/BYhs12v6
 X4vChG1tHdeJBsSTaQfbvNH2rUYw5eGrmM59ujD5pFg4XY7fY5tePcK6Zy2q3HMl
 /VlvxQLKUt6hQ+HDIbOV1vwh2R5vqGCZu21Ade811FOnW2WlONh83hurHOdCx03u
 p3B4e0RTGskHE7kdaLrOy3XEyXF10RXnNMz5wfVxklCtmnDRM1Qlb0NyYmV4jNo1
 dTi6/e7CNjE5eqGiWZlvLlR0uEKcStOtFb9y4dI6F3PWQ7jcrjJW4ROfe8Rd3wTN
 C1/eNbBCYyNLa661Ung3CCzoH3jKih5kYTA4CAZHBJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sFLwbo
 gJTuaCetYvbTgL9lVGckdMqCuANETSyDED0ic=; b=OXrCP0+24KjwzM4CdZ/4y+
 7u0Z9ehy9pXSYTINADLHZa1U+kF0oPNpI5OtrONgqHblSQbjlZUi65UCbp/ftXsZ
 53V2Iw27ItJ3fCYcJLtD/X4jiqcLhxL7VRYi67Ni50AnT9KV7KmQqDyVTw/sUHYw
 IcW7ZxBUxyqAQ4uhsHPbClEjMGCWtzraeyY13ziuyn4AkOgEKXZdixsupZdlzMAC
 MhhjvyDWnhNuinsaFmf03cjQA6n8fU4zBT5T8cb+cKPuik/fBKUV3iFtZZtnc072
 F0EQcEyLSgMuamdSd/lZ5SfrsEQXUXSeswA5iKIZx/RB/cMDoD8z0nKcMAJodS9A
 ==
X-ME-Sender: <xms:jGRbYXg8jig9WJ5pj23oW9w5TeH_QtuZhq_jkL_uFX55xcwdPJnuYg>
 <xme:jGRbYUCreSVyktPK8pfslNVzFGi2Ht8BWawyi-afSrwXuhu91UsXFV6SYj3Vz5tjt
 5ICir4S5Ruxpd70DA>
X-ME-Received: <xmr:jGRbYXHCCZuEd3j3p7UWB1Kt3NKQ4LXVVXo9aeNVKRQIwCk2m_sg8g4dLukXwQXL843IOaA0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtjeenucfhrhhomhephfgvrhhn
 rghnughoucftrghmohhsuceoghhrvggvnhhfohhosehuledvrdgvuheqnecuggftrfgrth
 htvghrnhepvdfggedvhfeiuddvveeffeegveehjeevieekhfeggefhgfdvudduuefhuedv
 keevnecuffhomhgrihhnpedtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:jGRbYUS86EomLSepVD-3TScw0k2x5zDEGRN-gch8Dh77orQtMolG9g>
 <xmx:jGRbYUwFMcFuSvvC3IZ2ZjpVYt9b2Hg7eKvaMy2LerHaNdO8DR8iwA>
 <xmx:jGRbYa4lmJfYEl--Rvi0Wunw-2-BaxXiqvOvP-K6qVNwG6eI7_TPaA>
 <xmx:jWRbYf_vYg4yti562erZ-MInbinNuWuk3BEFr4zxFmhIC-82X1C_0w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 16:31:07 -0400 (EDT)
Date: Mon, 4 Oct 2021 22:31:04 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Sean Paul <sean@poorly.run>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH 15/16] Revert "drm/i915: cleanup:
 drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()"
Message-ID: <YVtkiP//rXCmTy59@zacax395.localdomain>
References: <20211002154542.15800-1-sean@poorly.run>
 <20211002154542.15800-15-sean@poorly.run>
 <YVrMLNa/oaP2+ZWx@intel.com> <20211004155637.GC2515@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211004155637.GC2515@art_vandelay>
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

On 21/10/04 11:56AM, Sean Paul wrote:
> @Fernando, hopefully you can revise and post again. Thank you for your patches
> and your effort!

No problem :)

Just to be sure I do the right thing this time (and to better understand the
process), please confirm that this is the correct sequence of events:

  1. I fix the lock issue and test on my local machine.

  2. I then post this new patch set (v3) rebased on top of drm-tip (instead of
     drm-next). This will automatically trigger tests on intel hardware (and
     maybe in other hardwares?)

        NOTE: I originally chose drm-next because that's what is mentioned here:
        https://01.org/linuxgraphics/gfx-docs/drm/gpu/introduction.html#contribution-process
        Maybe this doc should be updated?

  3. Once reviewed and approved, someone (Sean?) merges them into "somewhere"
     (drm-next? drm-misc-next? drm-intel-next? How is this decided?).

  4. Eventually, that other branch from the previous point is merged into
     drm-tip.

  5. ??

  6. The branch is merged into linux-next.


There must be something wrong in my description above, as it doesn't make sense
to post the patch series based on "drm-tip" only to later have one of the
mainteiners merge them into a different branch that will eventually be merged
back into "drm-tip".

Sorry for being completely lost! Is there a document explaining how all of this
works so that I can learn for the next time?

Thanks!
