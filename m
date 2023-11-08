Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35F7E5A22
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B06A10E79E;
	Wed,  8 Nov 2023 15:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F7510E169
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:36:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3B9E6CE10DA;
 Wed,  8 Nov 2023 15:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B143C433C8;
 Wed,  8 Nov 2023 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699457759;
 bh=eE6mOmTr1rj6VsFKkbtQZvA22hyfF/rlsdneGdInYVg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=TnawTsGuBBEORxekcBAmA+jjMHWmLN4XWGen0+F+lzTD0iGo8W2tgn4kqlkbO0UPU
 Yg5DELitXP/3jDF2mJBGoSiOS+uDJJ6MRAC3grJh8N/HyMs6+aDCC42QtUZtNOSeKc
 DkwygnSAdlfY5aLlamsBqwT2SPz3jalWB08GEuc7MBWDALw4d7xI8QyGAIXKbVKi4R
 DmQMKcX1uzaTaNg3f8ZUDVJdY7QS2U0GY4ts8ARpJWQFXOuLbRyWyqkR8IVsQHP0ZK
 l0Wk5oV/4lTqqS8eH1WQd8jRknt1kFge8eGRwNuaMi5JTuZXo/js4EFeJMASXzdhxD
 wXx1PNMofiEKQ==
Message-ID: <1b02163780ccd7a4ce1357ab9810bb26.mripard@kernel.org>
Date: Wed, 08 Nov 2023 15:35:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Hsin-Yi Wang" <hsinyi@chromium.org>
Subject: Re: [PATCH v6 2/5] drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02
 name
In-Reply-To: <20231107204611.3082200-3-hsinyi@chromium.org>
References: <20231107204611.3082200-3-hsinyi@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Nov 2023 12:41:52 -0800, Hsin-Yi Wang wrote:
> Rename AUO 0x235c B116XTN02 to B116XTN02.3 according to decoding edid.
>=20
> Fixes: 3db2420422a5 ("drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,=
836X2, NV116WHM-N49 V8.0")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
