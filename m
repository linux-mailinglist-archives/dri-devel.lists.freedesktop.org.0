Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC863EB4C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0110E55F;
	Thu,  1 Dec 2022 08:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCB310E55F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:41:16 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f18so1509614wrj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 00:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tj390YNXHrclTFputKDdp/2EzmVq492YRg9LH1oG+Bg=;
 b=tqha8Io9+MdBJBv4dq8nsAAXsY3Bwbvisj8hUvDQu1+XuwzC4CazCyU4fzCvN1Lakf
 3JtwxkNxWXGDHo68+k/4QL7V1PnqKlTGdtb1abt2NJshf+pWw1/6udK1sa4giyLzaCoR
 XKTcH/fhWjZgU/P/XyErRu6LrgDGv/jt8D2LoVdimrV2B18XG/5YkhlUrH/g/orp2DVU
 PSl6CRiSJkEpOfsVa+BbcKnXbyJOS9L1gIZIWmi3EEnt/FHwL6ppEBS0OtiqQ8/2tpaS
 BMVu2sd25L+K+SRm1sprA1ZWHsIVeBE2e8LH+IPb1dblrvUak0BMyGfUIYqg60wloqcu
 s54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tj390YNXHrclTFputKDdp/2EzmVq492YRg9LH1oG+Bg=;
 b=BWDmno+a2asbYVPEH8Ad4ntpGvuWa3Nxa0T3yVtDJphtmFCkgQs18kwXiQ7nyWMlR/
 3V5UeigrdnMimipq0Ok58/C1h1TYhzO7WPdf08KJmmkCA3IuvjwGZFWvPNXMoi5HIVny
 kPBnlEzdzBOcGOeUrmqpg+t2pYLbphOl5G6xF6lEYPBmrJDtQIiSQ5mP3Gt4/TCD/vWo
 C3BOrzWtOEHXmOwM206SOvQnoAme2Qt1/n7F07qMceFkOY8R3IiM3CWrLHrhj96GOl9R
 rqu545IXQgBUTunsmJ440nzSJ/diGKA7MpqqE/7BxKP6QN3u8SX9fOoBGASHiXrwVnxI
 Gvqg==
X-Gm-Message-State: ANoB5pnzsI0X7EUC9dBHwDx5HhXxfxOK97KTt3d3jGPZpXpCZHL9rjDt
 yJEAm97wuYImRzZTOFAJXoBmcQ==
X-Google-Smtp-Source: AA0mqf4sOShSp/Ekl0Zx52j17akSaysCwnTBmBOchLMlhHGPZEbmMtxBFFAQQrs1Tgn94ff6d4zl+Q==
X-Received: by 2002:a5d:4890:0:b0:22a:f91f:674a with SMTP id
 g16-20020a5d4890000000b0022af91f674amr28955065wrq.214.1669884075457; 
 Thu, 01 Dec 2022 00:41:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adff085000000b00236c1f2cecesm4592623wro.81.2022.12.01.00.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 00:41:15 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <cover.1669799805.git.mazziesaccount@gmail.com>
References: <cover.1669799805.git.mazziesaccount@gmail.com>
Subject: Re: [PATCH RESEND2 v4 0/2] Use devm helpers for regulator get and
 enable
Message-Id: <166988407457.1972715.14336374251085655546.b4-ty@linaro.org>
Date: Thu, 01 Dec 2022 09:41:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 30 Nov 2022 11:21:51 +0200, Matti Vaittinen wrote:
> Simplify couple of drivers by using the new devm_regulator_*get_enable*()
> 
> These patches were previously part of the series:
> https://lore.kernel.org/lkml/cover.1660934107.git.mazziesaccount@gmail.com/
> "Devm helpers for regulator get and enable". I did keep the patch series
> versioning even though I changed the series name (subject of this mail)
> to "Use devm helpers for regulator get and enable". Name was changed
> because the devm helpers are already in 6.1-rc1.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/bridge: sii902x: Use devm_regulator_bulk_get_enable()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ff1eae1201a46f997126297d2d3440baa2d1b9a9
[2/2] drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=429e8706366166494314a46c82a9a9929aedbb8c

-- 
Neil
