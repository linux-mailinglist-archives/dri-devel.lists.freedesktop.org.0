Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB34A6E35
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E86810E472;
	Wed,  2 Feb 2022 09:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AB110E472
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:56:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 189CD3202293;
 Wed,  2 Feb 2022 04:56:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 02 Feb 2022 04:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=tmxxcnz/d/eczM
 18Q37VNHNLr5lkPLKzElGIZPhSB48=; b=ObOYCgWqPzc0do5kSDtYAv/7UOd6p6
 zzh1TRo88Bda3t5U/V9UHWb7gHGGNPS0Pp6+GfzTIw7R6QgLjeXplIbukSv0p+aC
 JxRJpkFq9pUBZWTMeaVoDIYCSWPqGqIv2WRhFYc7s6UkMFbynzTyg46nW2810nHC
 iQP/jgXRc1Zn0j7FN8F69Z4rDOBEvyn6Rk9kTNSX00BXyZz2WsaIXgevNAqoXBma
 EgWFpY/Esfk30JPbgFEJjf/KR8t0MTp9GWHyXRBRXtYiXV3o2Bla7TnAD93PRtws
 L9MRpHQ5YtokFiL2Du7oGvw6XqMLfqEcHxa1qFo+uj7yPlPH1yq+m1Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=tmxxcnz/d/eczM18Q37VNHNLr5lkPLKzElGIZPhSB
 48=; b=oXWV6sLWaPVkPAab5DX82+FRBrvuxARSpVxB1Bw+k6GQ+l43jLeydKWxp
 nXNGoWLHLfPlmubj1Fs55Un0a4h3RZc7nMsnWceLNSV3SYXrW0n3KnfV8WxP1vXS
 eD5ZSfZyO4wzWRZ+Q8bRW2i4/c5Ku6dFGKP/Xt2i0Shzl16P/LTrTRjIGiOEvonR
 ndeJ/KYdUfYNHvR7ln2dcRZQUyv9ufmfjnnQ3BsI7WEaOyDey+R+pZBotwcND85e
 tPjIv6/yYN287gLljYU3wf1LIhPEXLE5T0CMSo9ofZIfju0tcqSp7WnOLDq4KM8b
 jGlfdjn96wnxTrEN+pUkZf5op8ZBw==
X-ME-Sender: <xms:MlX6YY806-aiWDVJAIaPqQukSqaf4-XbpPqD1zgvuyA8uuEAsEi-ZA>
 <xme:MlX6YQv3J2H0J3XaQWQ8K3b_rjgxasrFBGy_6I35j-SugWzofTWIB7m2j5qStwp0a
 NszHtuz_aA0U3mt_AY>
X-ME-Received: <xmr:MlX6YeBpfIWRzxtOlC-5oRBWzr2NQHRKACKQSWOjxs4A3isaIm6wFICI-wR1c5yPhV7O8GzeP_FdQOsqq7NLfZ2KfdxzcJMYuEZxjOU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MlX6YYfAe7zx06kjREbNEo5DIVUG3M_6GMU4M2DE7QVVhPl9GEIZNA>
 <xmx:MlX6YdMHYjpiMp5sdBggqI21R7iehUlWLITQ6rRlFOUhVsoUJWaalg>
 <xmx:MlX6YSmDL6CWipZadmtblWPe2oBlIfyQ0o-Gn7LsV7jLLHeREb6U2A>
 <xmx:M1X6YWiKmQ4oQAI3j-T-b3G3ivDka480UXPthcK5hge9JTvSWNJqPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 04:56:02 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Simplify the connector state
 retrieval
Date: Wed,  2 Feb 2022 10:55:58 +0100
Message-Id: <164379573891.876896.5261126344850145363.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111404.221882-1-maxime@cerno.tech>
References: <20220127111404.221882-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 12:14:04 +0100, Maxime Ripard wrote:
> When we have the entire DRM state, retrieving the connector state only
> requires the drm_connector pointer. Fortunately for us, we have
> allocated it as a part of the vc4_hdmi structure, so we can retrieve get
> a pointer by simply accessing our field in that structure.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
