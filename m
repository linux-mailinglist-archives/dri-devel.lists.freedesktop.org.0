Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F52673A16
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CAB10E934;
	Thu, 19 Jan 2023 13:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381110E92B;
 Thu, 19 Jan 2023 13:26:19 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 83C973200995;
 Thu, 19 Jan 2023 08:26:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 19 Jan 2023 08:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674134775; x=
 1674221175; bh=Ge6AXz0IkBOoUK6IsNSpF6xnWknO8KEpb5p3HGJKSp4=; b=r
 +p3YPLicjauQQkS6jFy074V3rahxv/RyUuwD2ZaiLnDC3/RMgpySDZM/g0S9eQ1y
 TdbOhdhXWnCtrdDeyfxE329+lHnXwVmo7IG4fDF2RTkBnHArM56FnL+gPABq/qaf
 JX+srhmS/98sEmMg6o9VBPTjiK1V8ls0TA75b/9HAf9xY6gKhsViT0i4cFXwsuss
 TJYlwNFkpYzAYmTVcyYl3XNAXuKSpgOCUNuYwgX0JVy2EvFI25ZUPTlyivc53anH
 /3yjanuHaaNmoPzbkwr4bjSHWQiBPeZ7psvvBRerJOxVuvBwOGMcbfwNKZOWAIDK
 EGFLpqEA0if+N4DO9Ijyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674134775; x=
 1674221175; bh=Ge6AXz0IkBOoUK6IsNSpF6xnWknO8KEpb5p3HGJKSp4=; b=e
 f1Cu+ddqmkYINnY5rLwhijPgjrsmFGoV4cug8l1bJXfq+GGI89zFPAufnGiH1W0u
 IrLHScTQAb4e5LaABzjNdwFX2v7D0nzi6W3wRDVH9hGP5snGdPW+egt5lTBCPWKh
 xnD4dkm7koux+RJDV8uVhlkqGMSdzbnWj3i4TVNRqOQ7SU7hx3jphL5AOYLwZ3Du
 KzpUmXuY3ayhsGJi+jhUAvD+RIhaETO8J32uhofW5bylHh31mh2xFwlQfFvCWvNN
 AQJYYhDTZoHuCywza3ElQ+4ODJFskr8lG4k5N0MXkp9vMkHn2CzZvjPDz91EmdNP
 8VHcBdz394Im+XZfVdumw==
X-ME-Sender: <xms:9kTJY9HL_Kxpd7o0Wo5seMpLFZGyeuhHCedbhmYmip4WClNHd9a6_Q>
 <xme:9kTJYyWqYjFcdQq1h091RpAkScuMdcWgrNFBs1gzpku-JfY5e8P4dGBxCUCJMq_QS
 2_MJw9gbuu-SlUIhJo>
X-ME-Received: <xmr:9kTJY_IHXJNm3oqprj6jMlWu8qRoAAzH1CieGBNYRkttSyfIoXvGhFfF4IIpwjr4I2MuwKkMCawbhfMAIKap0I3L0mweXKIGp5VP84DZi7oB2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddutddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9kTJYzE6TuHHGdLJqrOU0ff_seQWjmXo22fcaEX_pdbVgAGZK5Pr2Q>
 <xmx:9kTJYzWRBpb9WCWERImmc9EdOXVr8YmuS1JsNOWYRb0N14wIM0O1jg>
 <xmx:9kTJY-MNBBu5eeAulYyAFPgpUFHu37V21r7U_gi1PxDifJXLS_T4MA>
 <xmx:90TJY0uHmkdJxRqC45cm5HiC9MFOkqyeMREZYOvqKp5CGJrVYIHOOQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 08:26:13 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20230117175236.22317-1-nirmoy.das@intel.com>
References: <20230117175236.22317-1-nirmoy.das@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/drm_vma_manager: Add
 drm_vma_node_allow_once()
Message-Id: <167413471736.3247301.2506243938133853546.b4-ty@cerno.tech>
Date: Thu, 19 Jan 2023 14:25:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.2
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Jan 2023 18:52:35 +0100, Nirmoy Das wrote:
> Currently there is no easy way for a drm driver to safely check and allow
> drm_vma_offset_node for a drm file just once. Allow drm drivers to call
> non-refcounted version of drm_vma_node_allow() so that a driver doesn't
> need to keep track of each drm_vma_node_allow() to call subsequent
> drm_vma_node_revoke() to prevent memory leak.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
