Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275C780754
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 10:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1750A10E48E;
	Fri, 18 Aug 2023 08:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2610E48E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 08:40:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe9c20f449so6356835e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692348048; x=1692952848;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1ms0sp3NA7xots6oKziMgk6P6/BMAfGtB9VS6N0YEU=;
 b=EWUFFIyUDQ29kempWRuVEt8PLTZaglKUoVnum2NRKndacFITxISkYmQgI5etdtDMN5
 CT7eyCTNm3+koNBEkeZcQKYpMH/XkvGp6I3mTFCneDa4+4sYZVZHJI2nMBnue6OCjtF1
 7ko7fLJdRMNLRXrEnGJDmchMSUE1rKHW2X1jRSr14IGWdKloVjUB4zNfe9mSgcfg70he
 +m6ySNmJqovpai7wfVhYseZ6cpUcli0ANcSEn7q6N9nzDsZbzGu8aP6ErgYr1jPKw2sN
 AhsrObdk5NFwEe0bM11+187jjF1mfC2e1JRuY4DWDP+AXSD98K/qkDEueyzZPgekPWOi
 Beeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692348048; x=1692952848;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1ms0sp3NA7xots6oKziMgk6P6/BMAfGtB9VS6N0YEU=;
 b=M3DZ0hP6tejpAI7zw3PbQr8ICNSSk6ZuX43dE30LqBuhcfpWwKJ1+6iXWTMpFDdWWt
 43CAQN4hxjb5LQAaRJaCzvRxwh6G1Rj6zx4NLiPditd1NPTRbqoBbol4e4bT9UTQqehH
 /jl8XQ7Ikd7G30AkYbNmny4TJvYvLMG/65SarMW0J5EXXCvaHcKeK2o6nfO1h0YsCAbS
 VhWljWzROxawiUfoX1QUZiduZOAc8qdxmoJfoN7MeeA+HRYkoACzuR4b4TPVddDTQ5Pp
 JdG4QIJnVe5OU7w8ojbQfJQ6uKfSFNAHdHvefai7ndGbKl8lGvE/ESjgMjnpcoSwWZQ7
 NWfQ==
X-Gm-Message-State: AOJu0YyldUrNWs0sgYZQpzZe5jV/mk+bqRNoEacwTVdtZCUHdW36FC5d
 RgcIKlVNqoB6puvtn3r8iqs1BA==
X-Google-Smtp-Source: AGHT+IGXBWQhpbxUAariamk2uLHaGEhe45Sqg63PPejAXPvCgWNBNSw4+HezjbkcG3Cy12Vtk7X9Hw==
X-Received: by 2002:a05:600c:b4f:b0:3fe:d71a:d84e with SMTP id
 k15-20020a05600c0b4f00b003fed71ad84emr180660wmr.1.1692348047998; 
 Fri, 18 Aug 2023 01:40:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c11ce00b003fe577eb8cbsm5497622wmi.44.2023.08.18.01.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 01:40:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robert Foss <rfoss@kernel.org>, Frieder Schrempf <frieder@fris.de>
In-Reply-To: <20230724151640.555490-1-frieder@fris.de>
References: <20230724151640.555490-1-frieder@fris.de>
Subject: Re: [PATCH v2] drm: bridge: samsung-dsim: Fix init during host
 transfer
Message-Id: <169234804670.3642120.1486717692776482497.b4-ty@linaro.org>
Date: Fri, 18 Aug 2023 10:40:46 +0200
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 24 Jul 2023 17:16:32 +0200, Frieder Schrempf wrote:
> In case the downstream bridge or panel uses DSI transfers before the
> DSI host was actually initialized through samsung_dsim_atomic_enable()
> which clears the stop state (LP11) mode, all transfers will fail.
> 
> This happens with downstream bridges that are controlled by DSI
> commands such as the tc358762.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm: bridge: samsung-dsim: Fix init during host transfer
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=20c827683de05a6c7e7ae7fae586899690693251

-- 
Neil

