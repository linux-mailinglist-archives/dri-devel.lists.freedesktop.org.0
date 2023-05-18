Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2D708A2A
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 23:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C0910E556;
	Thu, 18 May 2023 21:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D37B10E556
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 21:09:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-96a2b6de3cbso398463766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684444155; x=1687036155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rnh3tyDUDMlsulIV/kPw728cW2/MDK+ktFBwUG82RqY=;
 b=TGR7argf0z8ZhgJu/21nGdGThgR8Or+D63dA/zj8mS+KOyyn7MsXbnBiMvZb49P/T1
 wm+CJVG6i34RnLFbsCF/9bRb28Rm7vAKvuCsp655+5SEk/vnYKFGa89Bc7u+sYDrcIA4
 NIaTtdCYE9dLtXDiXfSBAMjzyAT4uABaxrQmoVhtu5Y/5tD7vb3miktce4n77e3e8kS+
 M3j85AcXJiz4DpL3xl1CQRIPo7SS6EXobIWFgnl/K+u5yAp5/FOmgAEnv9nREzflNKH/
 dfZggDiU22pFucHgdBrBg0PVzKOebkuzNRGHMI3UKr0KLVjShk7WZ4jlN483uwy+KRw4
 V+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684444155; x=1687036155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rnh3tyDUDMlsulIV/kPw728cW2/MDK+ktFBwUG82RqY=;
 b=iBHR77DTjf1GRbMj0bsDYCMFHKNFI8+iuH3heXq4OgysCwp0PnnN1DHQVlsrLY8qFN
 /CrA3/o2LicfeRLk7lCgunPZx3OW/h4auOhjJSijDF7V68kmrYL6ihQibOZebcuX3Fmv
 8UidhOxxPhIlUExmlzCMr75qXanxsucB90Y4qIejAiw1om+tZdt8Foj9XA20U9aIBt/t
 Gw47tXpOXftihzs5yoWLBmGIjRB+pnhDk7B7oKNHTm3wdVhu+dmrzgWYdOW+n6wwVk3e
 Nhmos857XbreK+gZyNQVIeUNrMnoJ7C1bT0nDQhomYC4iCR7r4KqlMvcQxTYGjd5dh8T
 iFSA==
X-Gm-Message-State: AC+VfDzAQqqaHUOqIPfyZj9XkFwJ5fLgAQNyE94FpF+0Vt8Ev7l7P+DH
 0Ds+nlWOKSKy0h6tIqZHtZE=
X-Google-Smtp-Source: ACHHUZ4xYGeWgw813K5HPP+JDjaf07MOHp6X1MaKB4myGbAL1dXQo69yO/4QoJnkEsY0D9X3ii5Y1w==
X-Received: by 2002:a17:907:3f0d:b0:966:2984:3da0 with SMTP id
 hq13-20020a1709073f0d00b0096629843da0mr475421ejc.63.1684444155082; 
 Thu, 18 May 2023 14:09:15 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 b20-20020a056402139400b00508804f3b1dsm950498edv.57.2023.05.18.14.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 14:09:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Roman Beranek <me@crly.cz>
Subject: Re: [PATCH v4 2/4] ARM: dts: sunxi: rename tcon's clock output
Date: Thu, 18 May 2023 23:09:13 +0200
Message-ID: <2281226.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230505052110.67514-3-me@crly.cz>
References: <20230505052110.67514-1-me@crly.cz>
 <20230505052110.67514-3-me@crly.cz>
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

Dne petek, 05. maj 2023 ob 07:21:08 CEST je Roman Beranek napisal(a):
> While the rate of TCON0's DCLK matches dotclock for parallel and LVDS
> outputs, this doesn't hold for DSI. According manuals from Allwinner,
> DCLK is an abbreviation of Data Clock, not dotclock, so go with that
> instead.
> 
> Signed-off-by: Roman Beranek <me@crly.cz>

Applied, thanks!

Best regards,
Jernej


