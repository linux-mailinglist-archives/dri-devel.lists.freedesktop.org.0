Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F5976FF0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 20:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E9810E0D6;
	Thu, 12 Sep 2024 18:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="spdTUW1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC4010E0D6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 18:04:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BCA6EA45648;
 Thu, 12 Sep 2024 18:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E58C4CEC3;
 Thu, 12 Sep 2024 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726164254;
 bh=/u7emNOLxIDUjr++03pD8Z/lxJ7HDXd0Y6MHouVCViw=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=spdTUW1yZ9zAbCB4ZjRdEv4JZvzuO6e0yK51h7W3b2FwSwTUbVkro7exf/JhPIXo6
 uHEYkxRFnPff/psUPDz6HoS9bIN4aYPozC7ClBElbVYKl4vcLV8XdPsclvz/RmTQ+N
 pj52nieB269A41pj/EtzGMrmNESkAZNCmm47yoAO25J740Lot2smZAPJFWW2iJoYgz
 UD3J18JC/NkOp5sVxML+enqpd3xqLE38wgSTHNNFyNDgkCHMXVBvtig8ZmqtZN6/rJ
 3eHkXaSO9fu6xujgkCv9uVie6gl/n8mKRnljgXzVO+h4e3xD6fu4xfb1skqH64Ouat
 ob8Aa+SVSjppA==
Message-ID: <993bbe0a1b503505dd2e9b33b94e2b83@kernel.org>
Date: Thu, 12 Sep 2024 18:04:11 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Devarsh Thakkar" <devarsht@ti.com>
Subject: Re: [PATCH] drm/tidss: Add MIT license along with GPL-2.0
In-Reply-To: <20240912171142.3241719-1-devarsht@ti.com>
References: <20240912171142.3241719-1-devarsht@ti.com>
Cc: ahalaney@redhat.com, airlied@gmail.com, cai.huoqing@linux.dev,
 caihuoqing@baidu.com, colin.i.king@gmail.com, dakr@redhat.com, daniel@ffwll.ch,
 devarsht@ti.com, dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 geert+renesas@glider.be, grandmaster@al2klimov.de, j-choudhary@ti.com,
 javierm@redhat.com, jyri.sarha@iki.fi, laurent.pinchart@ideasonboard.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nm@ti.com, praneeth@ti.com, r-ravikumar@ti.com,
 robh@kernel.org, sam@ravnborg.org, simona.vetter@ffwll.ch,
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de,
 u.kleine-koenig@pengutronix.de, vigneshr@ti.com, ville.syrjala@linux.intel.com,
 wangxiaojun11@huawei.com, yuanjilin@cdjrlc.com, yuehaibing@huawei.com, "Maxime
 Ripard" <mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Sep 2024 22:41:42 +0530, Devarsh Thakkar wrote:
> Modify license to include dual licensing as GPL-2.0-only OR MIT license f=
or
> tidss display driver. This allows other operating system ecosystems such =
as
> Zephyr and also the commercial firmwares to refer and derive code from th=
is
> display driver in a more permissive manner.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
