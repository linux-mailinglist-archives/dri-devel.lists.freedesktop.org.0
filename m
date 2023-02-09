Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263166902D4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55210E96E;
	Thu,  9 Feb 2023 09:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBE910E966
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:05:56 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 4774F5C011B;
 Thu,  9 Feb 2023 04:05:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 09 Feb 2023 04:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1675933556; x=
 1676019956; bh=FAEiAyOWNyVl7eoo8S1kFn4OtNOwEQcNZ0DRjhiOAT8=; b=s
 TEp3QCvfEZjUO56xmYDYLxdQyNBFqpYvCP+fR7M4OAub07toyRGZCMyHxzaAdMn5
 szN9YdF+mnkXtTz6OFFKjgxdV4uRomUwTPKEc7rvCCRYoCMKHAYCzDlvqji6kw4F
 KKfnMYdCXDTiOfHyN11x0jhP8yNViple8HoOQcfXgwSYX6ZeFrUWwEVsWE9AIutF
 5lk4YhR2hM4dh3zSj3/gjF8ZRyJ4zhp+symUf0zAdW/iM8HcjpLQ5UGByargdbVK
 xOwJbGS/T2gpOwVIxvsKzu3qNUXDh8dUnlcckHOloaw9lQbmuADy/4mQBdvXGNfL
 R2Q2dGFA5SeY2wliibSnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675933556; x=
 1676019956; bh=FAEiAyOWNyVl7eoo8S1kFn4OtNOwEQcNZ0DRjhiOAT8=; b=M
 b+KqUkn/IIHMdtZkd5qTV2+XEPx5y/xXhKiivPOfXTxlPPM7OS5kHcVW658n16hj
 ADB56cFNq/Uz0civLTppsI45eVcqwwO3FYw/YIPof/cvljxH2LUW6VsQcXJGu3Mv
 6pLhzpKuqWPbhokilqPgYizVJTJtnlpvR7BOmRR5DAu7K0qhgHxYFEimRm5uPPTN
 DyqmkDMFXToEZeL4LfmaCM9MLnu512jT3mjwDy4amH6R0q8TUCQwOz40pHbB97iv
 /Kca3TRBydFCWrg2R4S4Ia+iAi95UWh19+OD8JSwnOxwQ20sVohHGVXmGl+8PmOc
 YLPBJkozOApkbfjFuh+uQ==
X-ME-Sender: <xms:dLfkY8JUzW4bEbAw5D6JQtCIgQ_YaG-TZfhQZbuWJuOKCRlRpdyQ7g>
 <xme:dLfkY8J-YU6sQL5wz0BigzsKiQUL7uNv0mJ5JjdJAIkqqPLzdGfdPVwnKvrDiP2k-
 zDxVEt-6GQdUDjGc9s>
X-ME-Received: <xmr:dLfkY8ucnQWsrwsx08jufhFVf01xR4nu1-gbx9Ghhg1nmFNWLC58MPcETv3a4J2eR0HuyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehvddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dLfkY5aQAdkQeBMO9oq6-Fu_lRAQnh-2Za4M6cMtx3E3dfxQghby5w>
 <xmx:dLfkYzYYHWhoe_KrP8W5dKajOJMQRcJ3hRN_8-jEQeIgcKV0iJmrrw>
 <xmx:dLfkY1Bv0h6P-R5ReXgBn_-femeR5FKTpxWi0gHYUpflpmcJQbvd-w>
 <xmx:dLfkY3Sof7LML2bCv6jcJdRcjfR7MQHpsvNUjG3djDgbtWqLDNpaiA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 04:05:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20230127145558.446123-1-maxime@cerno.tech>
References: <20230127145558.446123-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/vc4: crtc: Increase setup cost in core
 clock calculation to handle extreme reduced blanking
Message-Id: <167593353334.392369.11326164456705758333.b4-ty@cerno.tech>
Date: Thu, 09 Feb 2023 10:05:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 15:55:58 +0100, Maxime Ripard wrote:
> The formula that determines the core clock requirement based on pixel
> clock and blanking has been determined experimentally to minimise the
> clock while supporting all modes we've seen.
> 
> A new reduced blanking mode (4kp60 at 533MHz rather than the standard
> 594MHz) has been seen that doesn't produce a high enough clock and
> results in "flip_done timed out" error.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

