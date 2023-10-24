Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C187D4B72
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822410E306;
	Tue, 24 Oct 2023 09:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FF510E30B;
 Tue, 24 Oct 2023 09:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698138217; x=1698397417;
 bh=EDYJdM7sL6gW7jKmPlTKPlkThFtq0YLcsYqx9unf2Fc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=OhJjivDwe3S5rPwRzHtt+Iuk2QgQBwBzmOam7qGCxFG31f0Cn11quTCAv1a/UGMMm
 MXE89pXvqbbYziGX2molWZ76JV1zuw9h0E9jV9vqxd1uqG1FcT8TQEAIlKQSZjnidR
 3EJeEI4ThGj7jDPc6zAfTwUpRMY18dKuQ2fOVbWjMns+gst7ufkT6sxQccjWbsoCno
 NXZWMnLjlJuIrzaE0tJMCWiczDuRl/uCcHv/TAmo6rHPqIqbK/YA5vsn231fCA3/YJ
 3W/K2rx+9Iy0iJ41SEh40nqpbph/vzbo3sirC8YaOUl8NFwe6vtlqvwlIeGpYzC3gf
 r7sKSbV1jcUUg==
Date: Tue, 24 Oct 2023 09:03:22 +0000
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: describe PATH format for DP MST
Message-ID: <TJceGIK3ZUXu0BwrhZUQIJhVtnuTayrPRLcg_KGuxE91o9OPfqxduzZljtreq-z48_1FGMy1z6qppi9UleSqx_hIMJ4GK_CCGBPiyRKkCwM=@emersion.fr>
In-Reply-To: <20231024103604.6dd7f6d5@eldfell>
References: <20231023203629.198109-1-contact@emersion.fr>
 <20231024103604.6dd7f6d5@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 24th, 2023 at 09:36, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> Are DP MST port numbers guaranteed to be tied to the physical hardware
> configuration (e.g. how cables are connected) and therefore stable
> across reboots? What about stable across kernel upgrades?
>=20
> If I knew that, I could perhaps manufacture a stable identifier in
> userspace by replacing the parent connector ID with a stable connector
> designator.

Hm, my assumption is that these are stable, but maybe that's also wrong?
Ville, Dmitry, do you know whether the DP MST port numbers are
guaranteed stable across reboots when retaining the exact same hardware
configuration (not the software, maybe the user upgraded the kernel)?
