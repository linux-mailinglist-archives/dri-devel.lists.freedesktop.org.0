Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E20C712185
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C792310E7B5;
	Fri, 26 May 2023 07:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB5910E7B6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:51:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30ab87a1897so198250f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685087491; x=1687679491;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSVgumf2aYp2qt988Utmhrty6r7JgjUMOf1vhbwIgVM=;
 b=HH5IiCPntBHLkYgsL6QiZABhfwdHOLeWhFCRMFlSrGxNr0L6dthPHyJdIRMAKrNra4
 63y/pgAi76VZNZg0zBgqvC9gEtmELmw4909Dch4ly3pRBSSU2o29JYoYKWcrkNRt8rZQ
 sVNEXmvWppWi8rxFncKzKQkDXggzNOdrZejLBhQerNkXnXtIys5WvpDo7R6dYYm8ezzB
 XggJyDbjjVC/FF0fuEVFdSofvxpKLGVkZWpojkWVvPqwEFmY4u+PNhbxdmPf52zHA0sp
 tQzdzBATgOL+W8yHTaJaYx4x8bI0xNJPhLLNeLe0mxq2KEmTR7EV+y9z7GawBx2M/h3E
 hMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685087491; x=1687679491;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSVgumf2aYp2qt988Utmhrty6r7JgjUMOf1vhbwIgVM=;
 b=cqU4rA2GzY2Jvbp8I/p54Ab1hRyxCEGj7zcGdTXItFR/F0KepZKPWoTSdAHrmwTkGy
 E9aAwfKcyNFIJ909TkFledG70t4pFqyAq2IPf42GtXsNof7pR2NOsPz7I4E9/7ZzpWTm
 AWjQQQP7u3ceBM31oeVFFDtAnYcYdPjUdcdrfdNRaItlGbAC6bdz0/ZrcH/KlzSbPyL0
 Uhfe41Hw2XV5MbVb7+iGAROU1KDwRAQRyfWgL7XvmqZbzFzkWxuHQylaQpWI8me/DyBi
 s+HkAyM9g9pxlmWOuEEvDjbPwnPXXixGIhzomOaAV4Q2jc5qsr6dOi9S/gPs6/A7sJ6h
 nEAw==
X-Gm-Message-State: AC+VfDzZYh5XKZfNQXnaBkKHFrCDZ4ZdPy2fyqrky6IXAumH6KnGBeBc
 iCFjPJA1Jfv6Sv6PGHyz/PGQLA==
X-Google-Smtp-Source: ACHHUZ5BAKGgVMedwMdSbhQAr3bu64t8rjg7+27iN2I67Zd0S3+ppfH0i4SJBLQfQVLsllKAFRx2Cw==
X-Received: by 2002:a5d:4d02:0:b0:30a:c2c4:7133 with SMTP id
 z2-20020a5d4d02000000b0030ac2c47133mr621730wrt.49.1685087490812; 
 Fri, 26 May 2023 00:51:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a7bc8c7000000b003f42158288dsm7873151wml.20.2023.05.26.00.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 00:51:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <cover.1684931026.git.geert+renesas@glider.be>
References: <cover.1684931026.git.geert+renesas@glider.be>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add support for Ampire
 AM-800480L1TMQW-T00H
Message-Id: <168508748966.1489292.6504449064133741624.b4-ty@linaro.org>
Date: Fri, 26 May 2023 09:51:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 24 May 2023 14:32:09 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds support for the Ampire AM-800480L1TMQW-T00H 5"
> WVGA TFT LCD panel, which can be found on e.g. the Atmark Techno
> Armadillo-800-EVA development board.
> 
> It has been tested with a WIP DT-enhanced version of the shmob-drm
> driver.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: panel-simple: Add Ampire AM-800480L1TMQW-T00H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d3a6c2b60f07c64631b9437032d8f079341b7a16
[2/2] drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=410bb21319f69c2ec28aeafe530d00ed2f6a1c54

-- 
Neil

