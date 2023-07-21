Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF7275BFC7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 09:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520410E149;
	Fri, 21 Jul 2023 07:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BFE10E149
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 07:33:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A22FA610A6;
 Fri, 21 Jul 2023 07:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B08C433C8;
 Fri, 21 Jul 2023 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689924824;
 bh=fctNF5EyYiJG9Wv//FA24SN2y/tZsF98l7MKQ2I9rpU=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Xh8wgcw76Z64y6ASZc+6FAUyj+yQAqYG0IbEqVTU3GLq7y5vf/WT5cfJTV7a6Gwx+
 /iHhjaFhZSFwTWpAgvXjFhzGFgtVp9FswYiviUI6y2WgrVr4zMc0tcOOUl2j6VU8kx
 dc3zNWG9fksW4N7QgkfdSzp0GPNKfcJHN1rrskSBELa2NokIEGOEJ53wOS6OPlblfK
 mBgEAxTtWZSE05CaAnPt2ChSBf4rtwlCS17pgx8A8/57jChHhEhNbNXv9bupCH73nM
 hiyTD8HicPwnBYUE7TxynWa3DrorNtPbfQ8U4HF3M+U2pkEBgMNWOijOK18rFw9TpA
 TcaS7OYA+ltDw==
Message-ID: <c3169a54ab922cfefd4372ce897446ba.mripard@kernel.org>
Date: Fri, 21 Jul 2023 07:33:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Javier Martinez Canillas" <javierm@redhat.com>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
In-Reply-To: <20230721070955.1170974-1-javierm@redhat.com>
References: <20230721070955.1170974-1-javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jul 2023 09:09:50 +0200, Javier Martinez Canillas wrote:
> Geert reports that the following NULL pointer dereference happens for him
> after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
> plane update"):
>=20
>     [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
