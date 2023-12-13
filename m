Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A498810EFB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 11:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4704610E781;
	Wed, 13 Dec 2023 10:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C9910E781
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 10:53:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3363397426eso1472293f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 02:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702464822; x=1703069622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AVoR1uUGIhIdM0n8dOyva32mu3rDmn4zFFnMFBtCJg=;
 b=o4yQZlmnHy9J8GzKdiirj/OcOhwonib9VIHVODtrO16PdIWJHpjTb3pbmWaLiuulgz
 ChRrcu0rZXEvRQuSW4OMsM7RZSEIhsTRHYl2w4ExF6IafwGjOZlbU1rnrQRR0MfkurgE
 N2joxLqPBuov77Ch9BJKa/NXKKTpkGMLi2wrrX3K2CE5OzR5ANkMv4e+5sb08enoiNbL
 Z4Sk+doWDe8QXYcIPvDc8lnhcgBHQRLrQfzK8IEMn8IS2nWsw86PqAPRU5sdckN3zWwa
 1cZP2E4+KFftuPCJp5+c7QcM303y3WeE9ppClK5zHJr0HxMIPb0u3kMRrOf6dIsjtV2f
 hYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702464822; x=1703069622;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AVoR1uUGIhIdM0n8dOyva32mu3rDmn4zFFnMFBtCJg=;
 b=UCL5v/WDNQoivQiwNIOC0fVppRnToMOitJFxO6R0NFyGy0BbFGjv7QjZQ/6Q46iaYk
 zaTTmw/c2pyQQXlWuPvRlv4ROZrBnJhWn1Hwk9Wd+uO2xd14bchfBQyJhG10WBMqx+HL
 sO8a056R8FGAQUtX477IS9uO019qFO7dD7aPjK9k74zuufYvqVhv9s11lOVxfUw+T8Ok
 MjdCXevRR0IiWO75AOpmds1mvUFGc6WJ9Tg9Y6VkWQP9cUD82SuLkqb8D0ApuMYkUXI8
 aKmEMASSo4gMgq5jI4VNeqaM5GFAbaaxK1DX8ppKDgXM0Nny59ZNsuJsgFVceu9SdLN0
 AScw==
X-Gm-Message-State: AOJu0YwB8OskqBnwVVyqH3jbdj11Rq7R07UZKm9BUQ9ZmqRkqTr37lVR
 AB7DvigAhgJPHfnaR+wXwVUQuA==
X-Google-Smtp-Source: AGHT+IGuvTKym5GzSffelzfLsWJCS5S1+vASIQD6/JxyNREq8dMO2z30KqWMSeSA3exaeQI7tcTbNg==
X-Received: by 2002:a5d:6811:0:b0:332:ea44:8989 with SMTP id
 w17-20020a5d6811000000b00332ea448989mr4509472wru.30.1702464821704; 
 Wed, 13 Dec 2023 02:53:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 dd14-20020a0560001e8e00b003364277e714sm374761wrb.89.2023.12.13.02.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 02:53:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Brian Masney <masneyb@onstation.org>, David Heidelberg <david@ixit.cz>
In-Reply-To: <20231212200934.99262-1-david@ixit.cz>
References: <20231212200934.99262-1-david@ixit.cz>
Subject: Re: [PATCH v2] dt-bindings: panel-simple-dsi: move LG 5" HD TFT
 LCD panel into DSI yaml
Message-Id: <170246482066.875647.5449342592487224704.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 11:53:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 12 Dec 2023 21:09:17 +0100, David Heidelberg wrote:
> Originally was in the panel-simple, but belongs to panel-simple-dsi.
> 
> See arch/arm/boot/dts/nvidia/tegra114-roth.dts for more details.
> 
> Resolves the following warning:
> ```
> arch/arm/boot/dts/tegra114-roth.dt.yaml: panel@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> ```
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] dt-bindings: panel-simple-dsi: move LG 5" HD TFT LCD panel into DSI yaml
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fa97e21e74df5ef63a442e4cfd13fd113fc8196e

-- 
Neil

