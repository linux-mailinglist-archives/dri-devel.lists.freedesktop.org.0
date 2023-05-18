Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8239708A1F
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 23:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D381710E128;
	Thu, 18 May 2023 21:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4769A10E128
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 21:08:05 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso4533992a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684444083; x=1687036083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQ1nJRxIw8TnLlb1uSAgTqg+C0cT9QEqF+EZc+fkSGE=;
 b=qcFIYBlhQxLx5FpKG/1H+u3N7ybS144V6jLsrdWYaTAUef1G3Uq6pjVipT0EPjzIsf
 fPa8M+8MqZNU68NgmxUnn81uBLw1UNoTwoH3v2vWcg7UC+FCOIGTjWLJPA4yh8qlEdyb
 R+7ZPZHirHFLCQMwATJX8ntw+HT3nWxvNcrlcSMBPCg4ZU+q1EaQQI0txdXcibMPs1d9
 NpTb0gJp8+JAhUWbyqtJmcus1ooyPCHUsrg0VQlE/S+izxUyzCjl7Es6/+qJx2NzRUDC
 h18rwgSxqbISnBdUfohbj4b9Bkcgue6noAzU77rh7XqPZVJGZRrqX39lxW3rEEF9WTWh
 lc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684444083; x=1687036083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQ1nJRxIw8TnLlb1uSAgTqg+C0cT9QEqF+EZc+fkSGE=;
 b=XJrgq6uiEQiQaBpaEscHQHqAjOZsAv1JN3Iho0bvjL9j2ZV+dmpoeZ4ciT4kYWt/3K
 ItvFUkosX10YtYaVRvNn8druAFRasxRcTuiP57Z3TaDyBxrJ8hFjjhOlUz1ZyZ2qn6hN
 7tMO3jHuEQ2jkS9ZZ4Mwygm298T/JqhBJXffl6Ej975+ZuA7T1F5rrAGV02gsEoJyClL
 76KtGtrY6tcARaYZ2mBPaihkipZwTjLw3dXfqh45wYtbMhxGydEQyR728ahrPYt26FTO
 Wz+xw91IufBrIYZQuhLu5sldlVKk7e6pq5gyVBHDWn4heDP9zrYIQObBeCkO2oT2Ch90
 EZKQ==
X-Gm-Message-State: AC+VfDzTp2lUHlMZ6IK4dkqohVcmWjlgZ04QPWaVnydNJYF5V5ZDzH+n
 nzltHeOLJqLqQSxULIWpY+w=
X-Google-Smtp-Source: ACHHUZ52SILasiNNx8sRkg0S1vg75C4xH/2WANsiZSXCT1GQIAgCV8NbifpGXn/D63ZPnP28Jh2UMw==
X-Received: by 2002:aa7:df0d:0:b0:50d:f9b3:444c with SMTP id
 c13-20020aa7df0d000000b0050df9b3444cmr6065388edy.17.1684444082935; 
 Thu, 18 May 2023 14:08:02 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 bc3-20020a056402204300b0050bc41352d9sm949023edb.46.2023.05.18.14.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 14:08:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in TCON0
 mux
Date: Thu, 18 May 2023 23:07:59 +0200
Message-ID: <4828357.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230505052110.67514-2-me@crly.cz>
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-2-me@crly.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 05. maj 2023 ob 07:21:07 CEST je Roman Beranek napisal(a):
> TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X),
> however MIPI DSI output only seems to work when PLL_MIPI is selected and
> thus the choice must be hardcoded in.
> 
> Currently, this driver can't propagate rate change from N-K-M clocks
> (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> in setting of the TCON0 data clock rate, limiting the precision with
> which a target pixel clock can be matched.
> 
> For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotclock
> can deviate up to 8% off target.
> 
> Signed-off-by: Roman Beranek <me@crly.cz>

Applied, thanks!

Best regards,
Jernej


