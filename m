Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6476E2FA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC0110E5C4;
	Thu,  3 Aug 2023 08:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A47F10E5C4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:27:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso7421965e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691051223; x=1691656023;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RsBPXwTb7KnuCCCW3N3MxflKzaNoyu2cFrZoc/58LVc=;
 b=tKlwFtNQTIy2DnSLD/45g56iRGyTM8kdDa6wjhtNIW7QB0pJovZVUdJFTljTEP4A07
 NNiNk0TSAoL9dv3jIcGAiDfju5M/P8wqrqewApcAtgWnMIX9fm15YGG2gGQS5a2Ir3hB
 7a1Zf5aRs9Zi8ZF+VAaQGqGsxmmtlk0s6qJ889Ke3gli3+JCyiyKRh1DCTwdlEdsJlYt
 XqqkV9AC8WXDH/q2TFKvOfkKSPXqBEWyupy2Y/FI1PJY6OMdPJJMkRtnI3KAra7fMq+T
 9zzG5Ci2SP5l8K/tP7BhjNrnAlgedfVrGkuR0LqdlKGEI1mLxeC56yOG59qlLyXGINS7
 cikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051223; x=1691656023;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RsBPXwTb7KnuCCCW3N3MxflKzaNoyu2cFrZoc/58LVc=;
 b=cy1H+tdgdcehHOahtfJ0Iz1eFvzohAdx4863VLqNd/9mkj3oKTbnlpGoyIck3c5GoA
 J8gE3XD7qpkfFDiemCFYsJhlUfL/D/dVgmE+g2ubnVMBWhNbfJywir181vDLqhTAY8hK
 SE056IFmSXzYB1LF0rG4pon249cBxekLyFa9kqAZ7YhnsuXGf3r+voQIZwYaQxMpKlI4
 KSNp/1Jm/67dMVlny7ehSvcIhYWD9gZZw9yPxPggckWoFbLcvFqIlotamv30c/PyMj32
 /VuSkdg0fw2w43bGlHUXuamKOwl3vohTGYYurssEPXtrzMpoFuuwHANqZNVdhimobiHx
 YigA==
X-Gm-Message-State: ABy/qLZB9PeO0/cKfOXvmyxP7vzl/af6OnxPyNxOuFXCTK18mrB1J2e4
 yT0PYY1nBK99kTprXdmqbsSccg==
X-Google-Smtp-Source: APBJJlGuXtwgmbQ/cdj9vqunJuA2ynAh8F2Bj8J6lezBOaNsG/6/fAvd+CjhIXK6IugnYHqxz6nEQA==
X-Received: by 2002:a1c:7511:0:b0:3fe:2f31:8bf7 with SMTP id
 o17-20020a1c7511000000b003fe2f318bf7mr3957496wmc.26.1691051222804; 
 Thu, 03 Aug 2023 01:27:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c280700b003fe1cb874afsm3630150wmb.18.2023.08.03.01.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:27:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20230731210258.256152-1-marex@denx.de>
References: <20230731210258.256152-1-marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Innolux
 G156HCE-L01 panel
Message-Id: <169105122177.2500518.10935834416941997220.b4-ty@linaro.org>
Date: Thu, 03 Aug 2023 10:27:01 +0200
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 31 Jul 2023 23:02:57 +0200, Marek Vasut wrote:
> Add entry for Innolux G156HCE-L01 15.6" 1920x1080 24bpp
> dual-link LVDS TFT panel. Documentation is available at [1].
> 
> [1] https://www.distec.de/fileadmin/pdf/produkte/TFT-Displays/Innolux/G156HCE-L01_Rev.C3_Datasheet.pdf
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Innolux G156HCE-L01 panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3c5e8aa44dfc936ab596508158d222e3e87c1a1f
[2/2] drm/panel-simple: Add Innolux G156HCE-L01 panel entry
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=eae7488814b519e49c57dd331a7437d99d8ae91b

-- 
Neil

