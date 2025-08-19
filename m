Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42913B2C5F0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E07F10E600;
	Tue, 19 Aug 2025 13:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eR53X2GP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9821210E600
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:43:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0389B5C5C1C;
 Tue, 19 Aug 2025 13:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280DBC4CEF1;
 Tue, 19 Aug 2025 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755611033;
 bh=pEwO34vKa2AleMQxAgTE9E4vXP3EDfO6zZ6fVuuOPvo=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=eR53X2GPOQPsfjZwCY2EBzUTjs+oBSEWMWqnwwNyRFf4r+dzc+eaC9qBm95oO6Z3Q
 /0TKaglW+xZgVyQ7Ux0+6Lchhbz4RyGEHain2Exu1EsXXU2efP9R90ZNcJlu+9vm7p
 zOp5/J04pvaDkU2316gM/nZ15zG8JDkGLieNeuONP1a/8tSuXQs1NgyCIi+PuSdB81
 ujICr2b83psFhfTMxbz4f54ApLcnyrAtLWXC9pZgaYcjG/gq7CDRxPFAKQym30YHZp
 q79VBcDUx3MCqetZHZ/X3gNbwkOych3lpv7s9ddlvn5pOkGAQ2rl+6VE5uhqYMbzKN
 67PxJhuR+F0Mg==
Message-ID: <174f1c2e07d59e49996d88bad8e471fd@kernel.org>
Date: Tue, 19 Aug 2025 13:43:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/9] drm/display: bridge-connector: remove unused
 variable assignment
In-Reply-To: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-2-edb6ee81edf1@bootlin.com>
References: <20250808-drm-bridge-alloc-getput-for_each_bridge-v2-2-edb6ee81edf1@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Bill Wendling" <morbo@google.com>, "Chaoyi
 Chen" <chaoyi.chen@rock-chips.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Justin
 Stitt" <justinstitt@google.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>
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

On Fri, 8 Aug 2025 16:49:09 +0200, Luca Ceresoli wrote:
> The 'bridge' pointer started being assigned and used within this 'if' sco=
pe
> in commit 0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec
> framework").
>=20
> After that, commit 5d04b4188959 ("drm/bridge: split HDMI Audio from
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
