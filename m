Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D55E6F051F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 13:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712E310EB1D;
	Thu, 27 Apr 2023 11:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C51C10EB1D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 11:47:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so52177215e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682596031; x=1685188031;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlpPvzn5kCu5+ixnMWOKTzXcqfj1ddTFaeoVC+uamZg=;
 b=EsVd2ApUhxayKpNl917bGCPAFGAAKMk/qPYyVz+DwW8A4Usnz/Z3n34hPd2rYpht1w
 aMlukfoSI4ncwz/7ZP98Go3B4CU2aL9H8TTae6XJBWboJ2U7CBi55ZLqibezwcIWXIP1
 MA+ZUypJtJGDhCeRAAxCCNOfF5rJ55lzWrYmDya4awxfuKVJCq69sGEqlZ5SZE6aEitH
 zcAiycihsUBNZ3KZX7UTQqGsEhAWinPdU/1NRyhdQt/xg2GF//07ToUmPTlWmdopovtQ
 nj7nIUylBYVT4tYaWq6XWnzsGL7o8rDNuS9Rv+yq4kDRdoBcamC+J2k+XUrvG8miu+d1
 eIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682596031; x=1685188031;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlpPvzn5kCu5+ixnMWOKTzXcqfj1ddTFaeoVC+uamZg=;
 b=YdpJwcXpR7MzdUBexM7vF4LW83Q8wotL9gNlyjw4Ukg7UQsEuJswsvCjD+IeM1USGd
 TbcnTkyaxPmdsTTkOG0q+x/X4qHbl4uM41j9nnuaEuRacXuUMnoeBJn4tgj+vICbS0Md
 ChwFj5klPhdNqbTXq2q43udumDrZgOr//SIPZFJJX30oDZp4FDvVvrnUXbee8aFknsLC
 Uyw6WqwtW2O9JetZuDn5lHSEPwZxxCmqPO3s02Si5tpoQqobc1S16fWI7OMhiLuCc3NL
 06sD5rmORTfEuJhzNPANNOVSXtKlKYyd9qPdIKEO6D88gwP6PKmK/9F9AU0oFtwkutKF
 Aj8Q==
X-Gm-Message-State: AC+VfDzoHyTHCzx6aiNtgxYCf8+Cz7Ro1yTeAoBNJiEQH69oJuvLOJkd
 0jfUdrRGFqtL/Bp9a8SJVEHbFA==
X-Google-Smtp-Source: ACHHUZ49NtB6i5XgGjOXOYLFVCzdTueqFodswUYGE7piF8vGxo+fYk600mHand4r7AFobTig13eY9g==
X-Received: by 2002:a1c:f203:0:b0:3f1:72dc:8bae with SMTP id
 s3-20020a1cf203000000b003f172dc8baemr1229500wmc.21.1682596031515; 
 Thu, 27 Apr 2023 04:47:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a5d5147000000b002cde25fba30sm18495829wrt.1.2023.04.27.04.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 04:47:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20230426143213.4178586-1-macroalpha82@gmail.com>
References: <20230426143213.4178586-1-macroalpha82@gmail.com>
Subject: Re: [PATCH V3 0/3] drm/panel: Add Anbernic RG353V-V2 Panel
Message-Id: <168259603028.3049941.9313160410502762105.b4-ty@linaro.org>
Date: Thu, 27 Apr 2023 13:47:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org, sam@ravnborg.org,
 kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 26 Apr 2023 09:32:10 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the NewVision NV3051D panel as found on the second revision of the
> RG353V. The underlying LCD panel itself is unknown (ST7703 is the
> controller IC).
> 
> Changes from V2:
>  - Rebased patch series (to address removal of dsi_dcs_write_seq custom
>    macro).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/3] dt-bindings: panel: Add Anbernic RG353V-V2 panel compatible
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e41fef1e43ae86aecc466e8c9e449d7bf71596a7
[2/3] drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e0310564a7e31d7359a6831226aa9b559c6728a0
[3/3] drm/panel: st7703: Add Anbernic RG353V-V2 Panel Support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0ed9208cb120086f1b600199c548f00544406fa5

-- 
Neil

