Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744DDCA870F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 17:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F8A10EB6D;
	Fri,  5 Dec 2025 16:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="nY5LxwS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB4210EB71
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1764953669; x=1765212869;
 bh=BX7vL0QBxUG8IFjN/Vn7c2cEpPMdLWrE7PDrv9RLsU8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=nY5LxwS/xDKA4BojeQcQzVauct/6v5Rg6Sl32I5kdd3CZLiat/NA9+t30Vu09UioG
 v8s9fwX5fkA1ZPbgYUoFFK6Xod/7DWY7BNzEObOgsnkb1544KJsEgveMQ4g44mX0Tg
 QHYFws0puYZp5Upvz2iVPZ6NXUIzI/BkllsZFUVyjgC/tCty2NsFTnlh66EXJKUBBJ
 DW3FPjWlWpkGrkyPrBeS7Z5ZOPmGVqmHvYzSDz5hWB+NxqueliWp4eAPtJcPxW75Cd
 YXe9JT5jR0FRdbS26xUZzAij6B2grszIPbZtWNHKZBOckmzPw9S9PeQnvY4fg+lvAX
 bqUAcTpmP4rMw==
Date: Fri, 05 Dec 2025 16:54:20 +0000
To: Dan Carpenter <dan.carpenter@linaro.org>
From: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, Sebastian Wick <sebastian.wick@redhat.com>,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
 drm_plane_create_color_pipeline_property()
Message-ID: <CN7gZcz0WnfFN-FgfhFlSwX9naLEVoV-H6FCniOPp3glGzIEFRK1-SXlVbb5S_B34TxYnCOBQZj4ldqZNCl-Igw2zyPeUnaruX2ngu__loE=@emersion.fr>
In-Reply-To: <aTK9ZR0sMgqSACow@stanley.mountain>
References: <aTK9ZR0sMgqSACow@stanley.mountain>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 6055722f007a4713addc3f24ea81304fe1bf3a32
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

Please ping me in a few days if I forget to push this.
