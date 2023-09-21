Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635827A9526
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365310E5B8;
	Thu, 21 Sep 2023 14:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D10310E5B8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:19:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E71B6B81F8E;
 Thu, 21 Sep 2023 14:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B855C4E681;
 Thu, 21 Sep 2023 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695305987;
 bh=3omRRAuhKLx3rUlF+M0I38XRTMiyOqLO113BPuaeJPE=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=NarvtlMJI4dC25o33cGWYbiFUCmh6m5wCn6RhAcs1t4sHSKg+gQYLRIib4349DV56
 T2KFKBerigcI6jOyzdS970PrTgy6l9Z79H6RKet7hOkbTP5TK5bHV7hDQGBvpazmC0
 R+8fGTRFcN44d/smo48T/hkRZ8DM+sjKzqBvwHkoMhicoF5YqATOc2rTwuC4kvFdKc
 r6bSlPfgbasVYD291yp21mtRIqmcjbDfICi+Iq+0Mv8SWie85dFlmKpAegqkbkgCk8
 36N4vbfs4TNFq5wpPiygyjqQM7WizXDFgr7tGoyHqiVnWqBBUYwuOwQkdP+Fzuqa/9
 bxEFLDCo148HA==
Message-ID: <f171c049112dfc21f0a1127edcd5717f.mripard@kernel.org>
Date: Thu, 21 Sep 2023 14:19:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Javier Martinez Canillas" <javierm@redhat.com>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
In-Reply-To: <20230914195138.1518065-1-javierm@redhat.com>
References: <20230914195138.1518065-1-javierm@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Sep 2023 21:51:24 +0200, Javier Martinez Canillas wrote:
> The driver uses a naming convention where functions for struct drm_*_funcs
> callbacks are named ssd130x_$object_$operation, while the callbacks for
> struct drm_*_helper_funcs are named ssd130x_$object_helper_$operation.
>=20
> The idea is that this helper_ prefix in the function names denote that are
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
