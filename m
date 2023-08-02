Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795976C8D9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D1610E525;
	Wed,  2 Aug 2023 08:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF7D10E525
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:58:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc63c2e84so70065945e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690966700; x=1691571500;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKacoYBhafR10JvvkyZ4j4gyiT1DNxLnWoSCLRFnVfU=;
 b=AWa/iPaFw5XFT+9QkWWjxhWsUN0N71PxFxhwMv0R1UjwWQh1WSdpAbd/e/x2vpSpNP
 XyiZuFlUUyfL2yY+dPymzAfV9X+cngqRA7B71vyUMV/p45GwrwkitHFj/RdSy2rHksx0
 TGZ0NO2jhexdYc+S0++842cB+vRZqpRwgcgYWFJX/s2SBiM1tbvGYZYLTSvpIodxTpmM
 5rYajw1fAgK/rfR7nt9q1BGMbXYCmzurtinzjZs3nDFv4xGY3oJanB9aBcRSuPur0tyK
 1QlLJznshobNG+fE8zQrNhZzE+g/NxX9ZIzf6ZLEcMC5HV66H2VTukKXE0nznmcQVDJB
 2aGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690966700; x=1691571500;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKacoYBhafR10JvvkyZ4j4gyiT1DNxLnWoSCLRFnVfU=;
 b=H6Co2uGb9xU+/1U/TohqxP44zd12CDZUyxagmXmPzPbHv34jTRTKXr1YiPOwejoSTF
 23l98AZGbzsn8rWClLBpwmGxYsSaY+D/mDdtep4G9oanMsVMPj8OB2wgEEK4IDCrXQ5O
 UrL2W6LBb4KRo3Y/e8euTkwrSIKmqpSdDjrjPJZ05/XlqauCrArmfKNJOKO8pwAoQFP4
 F9LqhgnDEJjlTDTrr52ZxfdXv6pYxujFIhbPU6iBGDiwOpvtku9YV0ejs44gMILzgRah
 kNRjwYvrtpBXTwPCgVNk1q9z8gTPB7rfk+696zWGO8Ecr+AE1n3jIaV2qemavLGgBgSS
 SCsQ==
X-Gm-Message-State: ABy/qLZs3CymbuNaKdsQQxLlBc8hA2N79oW9EQiTev3wuj8dOa84Lx9L
 kig5SsMXqKpCqxoHmrUVmlHhzg==
X-Google-Smtp-Source: APBJJlEdnBHU7cqzNc3pMckBNKjRN95SYy691YYhfyhVJaDEzM/thCfEvh7gkb2/LJ9duF0czLeMaA==
X-Received: by 2002:a05:600c:220a:b0:3fe:2b76:3d7 with SMTP id
 z10-20020a05600c220a00b003fe2b7603d7mr2763113wml.10.1690966700562; 
 Wed, 02 Aug 2023 01:58:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c2a4800b003fe29dc0ff2sm1094874wme.21.2023.08.02.01.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:58:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nikita Travkin <nikita@trvn.ru>
In-Reply-To: <20230802-gt5-panel-dtable-v1-1-c0a765c175e2@trvn.ru>
References: <20230802-gt5-panel-dtable-v1-1-c0a765c175e2@trvn.ru>
Subject: Re: [PATCH] drm/panel: samsung-s6d7aa0: Add MODULE_DEVICE_TABLE
Message-Id: <169096669979.1696778.2368037632749809262.b4-ty@linaro.org>
Date: Wed, 02 Aug 2023 10:58:19 +0200
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 02 Aug 2023 11:41:22 +0500, Nikita Travkin wrote:
> The driver can be built as a module, however the lack of the
> MODULE_DEVICE_TABLE macro prevents it from being automatically probed
> from the DT in such case.
> 
> Add the missed macro to make sure the module can load automatically.
> 
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/panel: samsung-s6d7aa0: Add MODULE_DEVICE_TABLE
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c71b7aa8619a0c9700132d0733e33999fb614339

-- 
Neil

