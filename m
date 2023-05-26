Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32E71225B
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 10:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E83110E1C3;
	Fri, 26 May 2023 08:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FAC10E1C3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 08:36:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f6da07feb2so5578815e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685090215; x=1687682215;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wh7efR5v8e0vkSD7MWnUSokvejiF72nQWy6QT+M4OEk=;
 b=q6/joui9LGDiR+/gTQhuf4Wv4GUwBNdNe5SV8a9OxQaMFBNrECsD+/xfgc3n+tuA0X
 bJ3TC+gQoiK0e9lqfAlIiCVXocq7DF9xg6/AKzCBkpAhJ3KBjXgyT4VeBEt2j+sN3urw
 imVBx+66mwbmOM5enOj43i+K/8FPYaUK88WUtsr8ABViExtIgmBL61CSdLcWRXPSs0NE
 agkDMcvSFoGMfd9HVKlxR/TEpAY7OvWTdRNskfJS38/sj0bQg5NSybtwowZjYwY6m6Jr
 QNRhYXXqSI6Zo66zjwT+pzQP0Vs0NU0mHc0R0xucNnCsJTYgQC71WHwNRyWOdsPc+Paz
 ehfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685090215; x=1687682215;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wh7efR5v8e0vkSD7MWnUSokvejiF72nQWy6QT+M4OEk=;
 b=gIstQKYT5cAGU9JrTb2ODSFQGxGZ67TUfFkK4HqFbTMVx3NCXyX1lCVpxznnKVrSp7
 Gu3nkQBkB5K5gu/aERucXIvLiZvxUA0z+Tjnx7DHUcYq1sO0N+IbFLhYKRm8TQVxP4UN
 Gh+lLbV5/2JfGpffxef6KXaKgOvsy8+A/z8lzFHbzLrwSpV0D1q/eVJsgTtuc79X1IxN
 8bfLGh3TXjnds1QOM3m2oE1v5du2YYTFCyh70cnSrV18NesIjYUMDpUCMh4hch35lmmL
 jWLW1ZrKMV8wmPdSTRLfdMnBZmvW3ntA0J5CPl2O0K+ctrCfB8Tuxck8WYFJaNOFiT8R
 wDIA==
X-Gm-Message-State: AC+VfDygmbqDo+ZOl+GIYS+haD+qGTqges+jrywNXAZXqKMg+JqZuPoz
 n68ogjvNbn480PZTGLiuNTcc5Q==
X-Google-Smtp-Source: ACHHUZ7DYQBiHBk+ExfjvmQiPj/1QqxrrFxOJu0T+gIHhioXAxvPRHTfhknpnn6dS5cYrmO4riAOHw==
X-Received: by 2002:a1c:ed0b:0:b0:3f0:9564:f4f6 with SMTP id
 l11-20020a1ced0b000000b003f09564f4f6mr821681wmh.1.1685090214836; 
 Fri, 26 May 2023 01:36:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a5d45c5000000b002fda1b12a0bsm4379284wrs.2.2023.05.26.01.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 01:36:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230526-revert-bad-binding-v1-1-67329ad1bd80@linaro.org>
References: <20230526-revert-bad-binding-v1-1-67329ad1bd80@linaro.org>
Subject: Re: [PATCH] Revert "dt-bindings: bridge: samsung-dsim: Make some
 flags optional"
Message-Id: <168509021387.1545019.9918047087016823576.b4-ty@linaro.org>
Date: Fri, 26 May 2023 10:36:53 +0200
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 26 May 2023 09:27:16 +0200, Neil Armstrong wrote:
> This reverts commit cfaf76d349837f695c8aa6d7077847fec4231fe5 which was applied
> without review due to a bad tool manipulation.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] Revert "dt-bindings: bridge: samsung-dsim: Make some flags optional"
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=35070674f488eefaeb753a13df11199d10328ff8

-- 
Neil

