Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C92537B50
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D1310E847;
	Mon, 30 May 2022 13:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF2C10E83F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:22:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A0595C01B4;
 Mon, 30 May 2022 09:22:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 30 May 2022 09:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1653916956; x=
 1654003356; bh=z7a79ghN+N76ZhwQ641IsKDuKwUgLOjLc7mVHgDfios=; b=s
 3P4KBN+gl3HsslnjzvnXp2LcO5teFuFBSxeCpyP/gLvEO50TDtuuQ1Gf4WK6bdI9
 JHrm9pAbafzd/Rudmo4V/fuWNXm3LIYKykwnXVbyDATrswzSL7WOjX28G2OaHPbT
 4vkeB1/UIJH3JObjxLlKM6uD9ORLO6Y6KF01wrI7b3vIK8IhZzsChlF5bNQmVjje
 6Kv920BrDUY22w4recK/E8+ORAXzRKYrYgG3Q7zqPMcvLF+gAzvsxpUSSq8ScVNW
 hWpvsiUF5tYHnwZ1MIQxcDkHu/rTlT6L9Bob+gNSy0qDNUITQ0i/eKV7c1IeFATn
 U7lqNEfuxktZ5xa4SbUqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653916956; x=
 1654003356; bh=z7a79ghN+N76ZhwQ641IsKDuKwUgLOjLc7mVHgDfios=; b=q
 J8GEZqHBSm/cxidTwgjMDhW6snhd0QwR9/+Vo/PJJnd2Fo8qOtLDo5i3Ki3sXGiY
 NUq0DeG4Gq5olkpk0aaucPs09yU2glhLRWt3bssdI0ktBqgR5LSGNzKwtrEMZJC2
 8dCDQXBQ/QQijgYyA0uIIiaxmm6n8yhd9TySJiydr9Xkti5OGjhlHzn2gZEikg1I
 enMMUKpwpvuZsBxCGjdBYQxsarpWss/849VnLVDPfk3bAIDL460DL5MG8O38tmNe
 cqQ/ek4ReRFHJ4xhKC3O3RUcvPo+abI6gddbK6cDtVpzpjOIx3WMuKem+zJW3eS5
 C68Tu11QiDQPbqgUn6L6g==
X-ME-Sender: <xms:G8WUYn_5eZ7uW-GMnMnxcz_9ZOYBYl8BCDyi7YgIAUAr5NNHOF7lwA>
 <xme:G8WUYjtxIXsyBygiFSFuRmcVhvX3PzdXjorK9bP-u2Q1taH_Sj7wrL6uDp1d7JK3p
 joWyui7iPsvDQAau7c>
X-ME-Received: <xmr:G8WUYlCQvPw96h6iJeqM2_qgelWcT91lR2AnGWtafkcDeAO2BVz76BHxpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
 teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G8WUYje-lLTlw-rdu1x5n7XuL0H7G3wZo-Uffv6u-ZfWFHaQ5QVEaw>
 <xmx:G8WUYsMrMs_6nuOGP6DJdL5z5yjbfdI2TedIAxds20dn72knm587kQ>
 <xmx:G8WUYllwWD5A02oRVxGPmWikoyP3qQbPlIg3Ob6XH0GxoVh2fmS5Dg>
 <xmx:HMWUYtE014QcM0DE06p4XUMtvHQxPnnciyrKE5Gm2JBi3A5jRf4Ofg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 May 2022 09:22:35 -0400 (EDT)
Date: Mon, 30 May 2022 15:22:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix blend route/enable register corruption
 for DE2.0/DE3.0
Message-ID: <20220530132232.himfp7ubiacbmkpx@penduick>
References: <20220525115445.93500-1-roman.o.stratiienko@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220525115445.93500-1-roman.o.stratiienko@globallogic.com>
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
Cc: samuel@sholland.org, airlied@linux.ie,
 Roman Stratiienko <roman.o.stratiienko@globallogic.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roman,

On Wed, May 25, 2022 at 11:54:45AM +0000, Roman Stratiienko wrote:
> By this commit 2 related issues are solved:
>=20
>   Issue #1. Corruption in blend route/enable register:
>=20
> Register corruption happens after using old_state->zpos to disable layer
> state. Blend route/enable registers are shared with other layers
> and other layers may have already assigned this PIPE to valid value.
>=20
> Solution: Do not use old_state->zpos to disable the plane pipe in
> blend registers.
>=20
>   Issue #2. Remove disabled layer from blend route/enable registers:
>=20
> Since sun4i/drm are using normalized_zpos, .atomic_update() will setup
> blend route/enable pipes starting from PIPE0 to PIPEX, where X+1 is a
> number of layers used by the CRTC in this frame.
>=20
> Remaining pipes (PIPE[X+1] - PIPE[MAX]) can have old data that MUST be
> updated.
>=20
> new_state->normalized_zpos can't be used, since drm helpers won't update
> it for disabled planes.
>=20
> Solution:
>=20
> 1. Track the number of total used planes for crtc.
> 2. Use this number instead of zpos to disable unused blend pipes.
>=20
> Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>

If there's two issues, and two solutions, it should be two patches.

Maxime
