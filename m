Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E02811614
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1AD10E79B;
	Wed, 13 Dec 2023 15:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AC310E764
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B53FCB81DD4;
 Wed, 13 Dec 2023 15:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C93C433C7;
 Wed, 13 Dec 2023 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702480955;
 bh=tf/O8dGetCNcpoy6MZUH2WfyxvXI3zJrSEHCm5FUzJ0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fNrPOmca6s3S/ZPvqGYwmmGm4U8Nux2est+54hkCERW/9/h6pAIACO4u6ENd52nTP
 EzwruVq8O270QaA6xO+4M1jqR7JOygVP/qryhESjvj3bZC0IsQkf/aOzVantjhURS1
 IC+VRRLEolr7n6scU0vjCCr1HaKCECn4b6yEwVexHKV8/BU1Q+T5FIlHvT3G3mK7WQ
 cPbb114J80/xlnGDBNqk9P/hPTkncp3zlbGBxVT7iIfDaYqChaTdnomlhP8DSzq56a
 682Ysi6huUkV6dFXXafuGxIwf4WFBw5G/b/3U78HTGnz3fJ4Aa5R0GvziJYQl4m6We
 8OcivlPMheioQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
Subject: Re: (subset) [PATCH v5 18/44] drm/vc4: hdmi: Create destroy state
 implementation
Message-Id: <170248095242.191897.1505855856456253349.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Dec 2023 16:49:41 +0100, Maxime Ripard wrote:
> Even though we were rolling our own custom state for the vc4 HDMI
> controller driver, we were still using the generic helper to destroy
> that state.
> 
> It was mostly working since the underlying state is the first member of
> our state so the pointers are probably equal in all relevant cases, but
> it's still fragile so let's fix this properly.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

