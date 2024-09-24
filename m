Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D277398477B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A23010E706;
	Tue, 24 Sep 2024 14:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ODC2ER7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7B110E706
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 14:17:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0526F5C3A66;
 Tue, 24 Sep 2024 14:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3162EC4CEC4;
 Tue, 24 Sep 2024 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727187478;
 bh=J5TBaRRy4m28gsa5Yj7EjOg1GBy2En1MJiMCYbuKp/o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ODC2ER7/pbpA2Tg96XYG9NClsI7ZsArgatndyAh+YWAVgJ7uCHN4RjeswwXV2iQNK
 g/2FCzK9k3mPALyxNlAC/c8mBjWOtssKl4qSVGRuPnVVgNi0irPEpgl2UgP44bh3Fp
 Ja1T7U1wH/TW+JUPZX+59ttIbcx1F1FkG35ky3V/MdMW0gPTowvbCEqRE4maqY1VHa
 Nk0oSYB/rgMFpsdO/DW6aYWJJHT9tUHAdK4sspXn1ozDUc5RgRyhg3HzTQgohp2Vto
 vgqlUhi1rUA0E2fgbUSGgcSkhUiBXnoBHhnxg71egWob3+pwNHPCHWfOkVZOjy0lJQ
 E7uXec2cxgmpg==
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
References: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Subject: Re: [PATCH] drm: renesas: rcar-du: Add drm_panic support for non-vsp
Message-Id: <172718747586.94652.10830946679925222683.b4-ty@kernel.org>
Date: Tue, 24 Sep 2024 16:17:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Mon, 27 May 2024 15:35:49 +0200, Geert Uytterhoeven wrote:
> Add support for the drm_panic module for DU variants not using the
> VSP-compositor, to display a message on the screen when a kernel panic
> occurs.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

