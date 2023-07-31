Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31258769B18
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 17:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA2310E2B5;
	Mon, 31 Jul 2023 15:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B126010E2B5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 15:48:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82d9cso43305615e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690818485; x=1691423285;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ea29XW2Oj6uA5+J/+a6EhPg6MOWcuGpScRnndteK92U=;
 b=e2ZwWZgLNcH8SGcedF39ZGAunxZFRDJYoJJpY5ulm9q5lgR1UyglSAhgtwgo/JYiAQ
 XV1bYqm3hhqWdk5qj36SgCliJ44gzZ/uAZLBIOQ0izMWQYR+3YeVeun1NKDM1GLHTJGy
 N2K56LMuAFq6F5mOQL3NJSLX1dpDRXvHR5KQDmKjmfOTyCP+QzZW8EiI6cZAU7+en3HM
 +BawqRHXgUFO+bK2pWcBw8RLRNHutC6+hbkptmruNs4LVFIevo4Jyv1z9D9bZHrBTImp
 WDrqSmb5jdAu25MSTtaoRYiwjOEsdkS/HTSmwRUzBkVGrLC9N9SpKtOPo85/NqTufiiU
 chIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690818485; x=1691423285;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ea29XW2Oj6uA5+J/+a6EhPg6MOWcuGpScRnndteK92U=;
 b=evdJMm6XywUKulSfKSSmvec4ERK/qPL/3awnIkeCnjdq8jjeDE6tIxUS/l/tefdyjd
 PK3g+4skQmqkn6nZYNKLLHKNCdb9FFUkuegLIZgICGxcn/1WQE2UFaycJnCfdLv2kieF
 7ks6BT8IWXozIBsUyJyWMRtmGa5DpEDof3NH+ohciOUST7TC42pxACeEu/wMDjfbrDaZ
 Oj/ZOBIOY51Aln9zjPXGy4fR5Np9uWxw88nE6mkGBR4+bq2ovw3cKnFglEUn68pc2eGM
 vo1/KJ0NFPodw4l90b/k6g6kj12NIzh5nGSQZSV5lRA1DV+uYiVbf7leIRsaAre0v9Z/
 r1Bw==
X-Gm-Message-State: ABy/qLYFQrucJRNOFhP2H0O4pWsKVEd8GRfddNDZAmo06Klwzp0jfcgR
 MTgSjSqXdX1CrX1ZI1V9gFpm2Q==
X-Google-Smtp-Source: APBJJlFHABHv2mXYYls1027lw8mNbIKOOxpDTaFUjQSeRtPCCAP0xOgS7nk+2w4RRUx62OlTIVSMzA==
X-Received: by 2002:a1c:7310:0:b0:3fb:e189:3532 with SMTP id
 d16-20020a1c7310000000b003fbe1893532mr260226wmb.20.1690818485042; 
 Mon, 31 Jul 2023 08:48:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a7bca4a000000b003fbc0a49b57sm11799628wml.6.2023.07.31.08.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 08:48:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230711-startek_display-v4-0-fb1d53bfdef6@baylibre.com>
References: <20230711-startek_display-v4-0-fb1d53bfdef6@baylibre.com>
Subject: Re: (subset) [PATCH v4 0/3] Add startek-kd070fhfid015 display support
Message-Id: <169081848410.590715.3216306012234783278.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 17:48:04 +0200
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 31 Jul 2023 17:08:55 +0200, Alexandre Mergnat wrote:
> Add the support of the Startek KD070FHFID015 panel.
> It's a 7-inch TFT LCD display with a resolution of 1024 x 600 pixels.
> 
> I use this display plugged to my mt8365-evk board.
> 
> This serie come from a bigger one [1]. Then I addressed the previous
> comments for the related commits here.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: display: panel: add startek kd070fhfid015 support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5ede23d12b442750ba1298913cf3ce572f1b79d3
[2/3] drm/panel: Support for startek-kd070fhfid015 MIPI-DSI panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=69312a77cd13e36f87378dfe83480b671ebf9216

-- 
Neil

