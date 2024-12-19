Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696F9F8357
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 19:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679EC10ED9D;
	Thu, 19 Dec 2024 18:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AeKNejgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D69C10E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 18:36:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d41848901bso2089076a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 10:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734633374; x=1735238174; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn9xMxse4bN0fUolTA97Je/uZdGvTmkb5DrPzaIHGDQ=;
 b=AeKNejgY6JTrqVOoH0Mb16pNzuBug8zgWUJ0v60/b/vYeBzYA6ueVA6EyYC+AnoTLN
 qz9idzNuLf5Nqd5y3KHqWyaXn05ST+/G1UDG3XM0hDkQyQDLAr5UmmhaNLhNmMJchrWe
 7jYRITVr4c/26LL5TOnVVyuhqVHhawg2+vAFsPYfVKnU5RwC75FQNTp3WRzpo+URsQA1
 QVdXJCKr50ZnezWthVZ3Ko6nnviNvAxCCv3UW76j0auYJaKd4cU6rRUulkfDyCJvWGwb
 Z0fiDPz1+idLcJGXeeHiCEPHiy11aETI5lP9Mzxz0z89LGrLAFCWPkgZPT6YS4iWe6Nl
 0b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734633374; x=1735238174;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nn9xMxse4bN0fUolTA97Je/uZdGvTmkb5DrPzaIHGDQ=;
 b=OzHlhYL9ceV3/KMKV0zutwhNuhBvpPw24PuCKpiJb1JoWh0htRCD0G1lHbfQLBxWrK
 JkeJhlHlNuSlwNEv59wXk4b/n26QZ6e/Rc3fwtDVqkkjlKMkpgld0iAcR7O/g9VcdxLB
 ED0VybPBBG9cVlORGtE4bgIUz4XjY8aai9lrIaa/VsQIZ3mNYFY4dZt1xzCyy+68eGms
 7pgTrGszbKuM2soj5u3Um3+KOv11fQFDhMRpk+HNMjcSxiTVEJaqGohMyp8U/5PRLWoP
 od+B9tWtJcJtWqBJNkQgyfrGyggOsLZGMSc9aUM9/KFzLCb3hgZMoFpICU8mM2/a+Gyn
 6UFA==
X-Gm-Message-State: AOJu0YzVJjeCXKRkqR7ln+fSjfc31BKpq3HEq8PkmINiuSz0pvKPRWrL
 5TCmNZxt3BxO8vZEjhTztWBM8tuzKv1kmva3gxDMq1t7yXSz1kWp6fBjO7TmjH8=
X-Gm-Gg: ASbGncsELyKYuZvXCRGiqAHBElS9fhLnxR7GQiIjt4l5Kh6wh+oZQYTbn9IaCsM231t
 yYrde24OwP1q9Nw6GPTkOd06g1YwZ0rDwmJ+SlB9qsocKNcAlA2OfXJ4I7m5CJiS5ByBTJOR52/
 f5+IySQPvZI8ZGviegbrWAhRO79bcoDcW+kjcr7oKJJT/ha+9Lw9dHpdj8sAIm+0Q1WnKvp27ZO
 JLCGqXic/2SqzLe0d4pqVztd1qiU/fC8L0U83Coo7pTkmuYUYTLllrGdvVss0SpW48=
X-Google-Smtp-Source: AGHT+IEja1S43ZlYEVymJVANe/4PqT5NMhowgP3oYnvt/tMBlBfo4UGJSgJEmSXZUU6hqbQ8HjpoDA==
X-Received: by 2002:a05:6402:4010:b0:5d3:f617:a003 with SMTP id
 4fb4d7f45d1cf-5d802388f09mr4102472a12.4.1734633373667; 
 Thu, 19 Dec 2024 10:36:13 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f08dsm934543a12.21.2024.12.19.10.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 10:36:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 Dec 2024 19:36:05 +0100
Subject: [PATCH] MAINTAINERS: Assume maintainership of PL111
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-pl111-maintain-v1-1-c60f57c523cd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJRnZGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0NL3YIcQ0ND3dzEzLwSINZNTTZPM7M0MjZIMbFQAmoqKEpNy6wAGxg
 dW1sLAIijR+hgAAAA
X-Change-ID: 20241219-pl111-maintain-ec7f69230d48
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
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

Emma Anholt dropped maintainership for PL111 and I
didn't notice it at the time. I've written part of it
and I'm happy to maintain it, list myself as maintainer
and assume active maintainership.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b13d8bbe6bf133ba7b36aa24c2b5e0..99dbe95995824cb6bdf9e5865982c92677924fa8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7068,7 +7068,8 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
 
 DRM DRIVER FOR ARM PL111 CLCD
-S:	Orphan
+M:	Linus Walleij <linus.walleij@linaro.org>
+S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/pl111/
 

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241219-pl111-maintain-ec7f69230d48

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

