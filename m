Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A876369C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 14:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6408610E477;
	Wed, 26 Jul 2023 12:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3710E477
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:45:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F008F61AED;
 Wed, 26 Jul 2023 12:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2264EC43395;
 Wed, 26 Jul 2023 12:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690375544;
 bh=qAP+AniKBMF/3k1CBzf3DK40Wu2ameAg/4VKPtXezEk=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=uHsTkRYK+Vp8yA1fXMbRLvQyZ8owgaWKk0VI7ubenlB9WG3JNnTtW2Z0oxce6IyD9
 gyn++dztbKQxgpV7N+TdBuq4Lv8njQVGwEvmVS2dnuW1PiuYwpgYENDQsmCwWwNT73
 mBV31OcfLDNPHVifZ6Tw3VEotxT0Rvv4g28vQln+U//syOeBBCktniFvLC3JC28h/e
 m7QIlV/EmlwfgrxyyOcCtUlQbTykNgdXSA4z0G3PevtxHue22VwJkwRVNwwuKYkNaX
 Kv5J0ZIDIjdP5qrLmHdv5/7ZIHHEqp2QPf8cIvukxblOMtWF+ymOUDhSJMBq/r/GED
 t0YrfrnSkPYjA==
Message-ID: <b173a6b5a016b7f0fce751cd8a05c2d3.mripard@kernel.org>
Date: Wed, 26 Jul 2023 12:45:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [PATCH v3 00/10] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
In-Reply-To: <20230725203545.2260506-1-dianders@chromium.org>
References: <20230725203545.2260506-1-dianders@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Chris
 Morgan <macroalpha82@gmail.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank
 Rowand <frowand.list@gmail.com>, Sam
 Ravnborg <sam@ravnborg.org>, linux-input@vger.kernel.org, hsinyi@google.com,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Jul 2023 13:34:35 -0700, Douglas Anderson wrote:
>=20
> The big motivation for this patch series is mostly described in the patch
> ("drm/panel: Add a way for other devices to follow panel state"), but to
> quickly summarize here: for touchscreens that are connected to a panel we
> need the ability to power sequence the two device together. This is not a
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
