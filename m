Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D447A921D5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15E10EB52;
	Thu, 17 Apr 2025 15:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LUWN7Gdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A82A10EB54
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:43:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so982342f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904596; x=1745509396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcmDyccsNttBk1NEg+6hG3KCFS05A9O/iwmE0/V4rHM=;
 b=LUWN7GdmjRnwTxxsLiH4IRMJ4pueVJqtP3QhfRtYj8WDiADtCB7PUJh2s+ENavreEu
 qmn2j1fkWqXwAsh+tAQtefgTXaFP9IhPgo8OpNnDcKUGIVUD8FjpS9NrOTFsfCPx3L7z
 CptLl9yCUgBsQ0kNZdD+RLnt7jsqQ2/2lfbLrZS+M3xTIf8hhkdxR0uipQOBV2auZEGB
 KVT/wzX21LlX6y2vJep+dL81uXHR00O21T0VpezByZQLSUsccEKHtYbHFEeZL/xVhxn3
 R0zrdlXBbak3oh7rhJimvIfkuQQrF1akl2OzcnSSYKUmnY8navIZVCo11yNGlsIzRscO
 neeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904596; x=1745509396;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcmDyccsNttBk1NEg+6hG3KCFS05A9O/iwmE0/V4rHM=;
 b=tO/Ml2I07yzpucq3wMVM5tRmaCYcZisoTATQj6nKHnBxYuSryxFiF5nSYARsq8WnXd
 1ZN6SjgJnBglpjehnahZltrzaWXFUmo3zsgtbwl83A8A03cVv8ClvSwSg/CfmMbvwOY3
 n+KSLfszQnh51poNGfAkmtKJKs6oVPXIRr2F392ksMJJOxFJNxwx8I8M0QCt52AYWMDy
 ih8KzLmf4zhAc45KnuLw5pWw0wvpkwguNO3FBxgY6bFAA11YqelVgtqKGN2N0gc5bHyM
 bTjdjdEsLRS32kCqA93yqaXMmYKBw9MLtNpzbQwD9KCevlU+JGgos0nKu+JSOW0z2D4a
 Culw==
X-Gm-Message-State: AOJu0YzyUaNXcug1N6gP/08trk5j0CABsyOrfhMGYSkICZ6X3YZuU5YI
 Nm8MY5/d4iQGI3/QYMqUVOwE6RqO2UKkoRg1NWGITDHVJUotXP26zOC1V5yHG7Q=
X-Gm-Gg: ASbGncstJt6lJUg76RUy6bHoX+upW+WQJn/Wjw54c+iQiXI0RnZEWtT+TFqhb2ran6T
 Qgyg3+VjDCo8WoizvPIHWNZtCIimWUk0sJlavvjNhkvcm8Poo0ygoetKx7bR8mXDKfokRINHQJf
 1n7pTNXhTHya7X6GlsBnpW2VT2fUzhi7v+imLS8DYMThfyJ7988getEHjWJBf1h9gXxafarggjd
 gALRGJKqqYBJ4cmM5VYTnr0DHrvgTI8qcHHQdGY0fObIX9u1QNwA0Bq1dH5jftKnLc8PDujDP7L
 +8Ui4QIatVoXQaaykovshbeizkGXzk9FYUti9Vt13Q9Aog0tbby4S6abX4lEwQ==
X-Google-Smtp-Source: AGHT+IEU5hSJ6PQyOtWU4JcRiIyUToVqInBdR55ONV+0tTCpl+QOvuCPnUHp/XeMa+65tSD1j+KrnQ==
X-Received: by 2002:a05:6000:1867:b0:391:2a9a:478c with SMTP id
 ffacd0b85a97d-39ee5b1618dmr5694942f8f.23.1744904595706; 
 Thu, 17 Apr 2025 08:43:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf44577dsm20773640f8f.94.2025.04.17.08.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 08:43:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Alexander Baransky <sanyapilot496@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250414172637.197792-1-sanyapilot496@gmail.com>
References: <20250414172637.197792-1-sanyapilot496@gmail.com>
Subject: Re: [PATCH v3 0/2] Add Visionox G2647FB105 panel support
Message-Id: <174490459500.1152288.2148667843889329004.b4-ty@linaro.org>
Date: Thu, 17 Apr 2025 17:43:15 +0200
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

On Mon, 14 Apr 2025 20:26:30 +0300, Alexander Baransky wrote:
> This patch series adds support for the Visionox G2647FB105 panel, used in:
> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
> 
> Testing has been done by me on sm7150-xiaomi-tucana. According to the
> downstream DTS, this driver should be fully compatible with the
> sm7150-xiaomi-toco (unfortunately not tested) without requiring any
> modifications.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Visionox G2647FB105
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a5d0cbd8b19403ededbe84f21780f70632d1e09
[2/2] drm/panel: Add Visionox G2647FB105 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3d55aebe257ec49f577deb7c8e4acb40dabc05e4

-- 
Neil

