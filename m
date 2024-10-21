Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B49A694E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064B710E08F;
	Mon, 21 Oct 2024 12:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="an3VPxfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EAF10E4E2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:59:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so45630535e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515545; x=1730120345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lExjalvfmMpq5gwOfsIudp0zxSzrAVtFOo5di0TIink=;
 b=an3VPxfnhuEgib5V6jR92MWJLHOl8nXrVbuczKvUfvQszHC9v/tH8AFiIMmk3ju9ql
 LCnLC87OTMsHJ2QI0Useg5TvfJMpTK/OK/g4TIRrkuAzm7rRf80sFoYj0pPCdkugV/R0
 8JCtwVIOWrs7cckd1F7Q/kfEYMvLlNPEcQWNfTY+UNFH6uE4kjDYMJCoxlW7FMgZz0b1
 NC54dTFG+XUWurX7t7gNS8QO5I0/Fe2NyvGMkEvIvVgmEiDMI1YOdHFEy87//0Vkobqb
 +0IKLlkgqyE04mLYFvwQM9EjJTASBCdUL3r7g6mErQaLGDElb4VJR38PvIbAWCCMW/wp
 vnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515545; x=1730120345;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lExjalvfmMpq5gwOfsIudp0zxSzrAVtFOo5di0TIink=;
 b=cR6S0s0v0w0w9qf1aHYrbDBgnwFfM1XFOyv5l8MjyaPxT21LPz0f26q2hIjvrjvrv9
 9/IITATdgBjzmML5ZKJoglRYehY50HO1VG++pVmad+U/zh8e8VJAQLyP1xbNe77HRyv/
 w2MU1SdguOE1YUujY0Bd8uLRCHK90xzVW6BNSpqkXCrB1vRFIpObSjakXFf1hgHShiSK
 6mywZUgDwpE6iLu9ki1/Y9GBycsy0ZAOtfwdtsJxUB1UyXg/T2B4KrSHkJySbDKBzxG4
 m2+0Gv1z6KJQ+AO+OXUkFMP4HPPmjPLmOcZJ0YKsoCQzi628f1F0PEvGF73KAevoEQQo
 PK0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl7szF7PeFLiyfVqXCaj8BAeFeIwT+4soVXyMO7clP9lgi0YiJLd1N6GPeQUtXJf3wDo8MdJcP9Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/krPhEtVBqe1YjnVlq+LxuLKOU/TTU4CMdjAXnbcolcY7bEP2
 O4hbcNVBkiFucg2ni8d7PD0kaVoi6GuzHplFH//a8nVOjSRdnmGmi7fS1D9mBIk=
X-Google-Smtp-Source: AGHT+IELOxD1yYGmtKz5NVs7Cif1bPDnq58GzcXrZcoKhOuT3MoVscto3WdxUTfJOlW5oxtkimx4dA==
X-Received: by 2002:a05:600c:1d8d:b0:431:55af:a230 with SMTP id
 5b1f17b1804b1-431616977d8mr85207285e9.33.1729515544800; 
 Mon, 21 Oct 2024 05:59:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:59:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
References: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358768: switch to
 bus-width
Message-Id: <172951554381.1240386.8857314666442848881.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 03 Oct 2024 15:39:03 +0200, Krzysztof Kozlowski wrote:
> "data-lines" property is way too similar to "data-lanes".  It is also
> duplicating "bus-width" from video-interfaces.yaml schema.  Deprecate
> "data-lines" and use the common property.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: bridge: tc358768: switch to bus-width
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d704a2fe530caa7023949b513b8d1c364b5832fb
[2/2] drm/bridge: tc358768: switch to bus-width
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bf7c079902c34f8b16ea3484de080a7bb4ad0367

-- 
Neil

