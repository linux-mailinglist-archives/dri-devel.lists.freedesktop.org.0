Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2EF7F0DB6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B8610E311;
	Mon, 20 Nov 2023 08:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60C010E240
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:40:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso7915095e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700469625; x=1701074425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3B/W/wTERbS/sFkN55z77Z/3LERN0JKwZoYiPaPsC3w=;
 b=hn+fB7qjBcB3ZfZkgaWsuR8GogEUEg+WTpnxvXFYdt7+Gg8bItS4U+rhGB8w8DJXDQ
 Gj3L77FkRqvpwtwrS+ZXX5FwxJIvkNCvcaKQOOZlLv8LDmQnBc1Kq6BYQnC614mqlOHB
 INAm8eGIFeUxdLMf7gqxCm3I6JLUZHecBdai2EdOOnhZTQuRsg2R1Qjva5KdMSmqYAQj
 nhbY5/+knvxQ/ro/u0NXlTeUE8fiz66UK9X/s/p/8KQ0s6vatXfcu5iz/tIZ9zvwPCpM
 q1Lx0xOcxO7rpg1sgW6Bw/mQDautb3Ub61GW4bIgb7gSGutwqDu8FPWZndiFucPSDHg6
 a7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700469625; x=1701074425;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3B/W/wTERbS/sFkN55z77Z/3LERN0JKwZoYiPaPsC3w=;
 b=dKIccjN1MwBPBT3WG/6q4sGlwqxdXRFmGhePeLQVyvnOC8gCOHeXQ0KghsrrIaCjjX
 28qqw4JqTYdQ8Do8N4KCofJalpBlEpZRaQwpZco9T+97//ycuPaDKoXDTvkHv1gcxJMz
 E2GqajiuTc7nSTyJ+Sp6Y83B3mBWuYhFg+wDOeSRT8V2AT+5sHP0J7V8aQHDGqSfu3cI
 M4JXtBO5u1NHR6QF9WJPE0ppnru932w5LnNzNRr2CrNp3psn21cWkOl6MT+LrDnGMQO0
 MnNbPJ1XmVf+Vwb7Sa1vgyEGAy2MO7D1Jf1oCHyVHivNOpafECjl2LA8jgspMYyXeADd
 52tA==
X-Gm-Message-State: AOJu0YwPj3DYVK9doLLU98LPzwOKePbUeBE2PrOYfItPqgoQTSSqm3zy
 NVegaaLXBz8juyNrXwk/gyStuA==
X-Google-Smtp-Source: AGHT+IGc57XiGI0Hr91YZXsksyxewtP288qTCuuBwZMFQEub0BsfU7uftulW7KswisxSOjn1hxgHuQ==
X-Received: by 2002:a05:600c:190e:b0:405:784a:d53e with SMTP id
 j14-20020a05600c190e00b00405784ad53emr5116452wmq.20.1700469625117; 
 Mon, 20 Nov 2023 00:40:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b0040472ad9a3dsm12386618wml.14.2023.11.20.00.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 00:40:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20231117194405.1386265-1-macroalpha82@gmail.com>
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
Subject: Re: [PATCH V2 0/5] Elida KD35T133 Panel Improvements
Message-Id: <170046962439.1110472.10672121661554561342.b4-ty@linaro.org>
Date: Mon, 20 Nov 2023 09:40:24 +0100
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 17 Nov 2023 13:44:00 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Fix a few bugs and clean up no longer needed code on the Elida KD35T133
> DSI panel, as used in devices such as the Odroid Go Advance and the
> Anbernic RG351M.
> 
> Changes since V1:
>  - Split removal of shutdown logic into a new patch independent of
>    dropping of prepared tracking.
>  - Added fixes to patch holding panel in reset after unprepare.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/5] drm/panel-elida-kd35t133: trival: update panel size from 5.5 to 3.5
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c18b1b49764a1db824ed74286338b6283b619286
[2/5] drm/panel-elida-kd35t133: hold panel in reset for unprepare
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=03c5b2a5f6c39fe4e090346536cf1c14ee18b61e
[3/5] drm/panel-elida-kd35t133: drop drm_connector_set_orientation_from_panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3fc828b8ce2362982237f46a7cd46677f9094a8e
[4/5] drm/panel-elida-kd35t133: Drop shutdown logic
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5dea0c3fedee65413271a5700e653eff633e9a7f
[5/5] drm/panel-elida-kd35t133: Drop prepare/unprepare logic
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9f5ac1969df6dc0c2282454b147138c32d065b41

-- 
Neil

