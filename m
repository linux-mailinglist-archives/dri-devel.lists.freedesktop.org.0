Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60EACEA88
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 08:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C49710E24C;
	Thu,  5 Jun 2025 06:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HT/b4lM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DD210E24C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 06:59:21 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a4f71831abso560407f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749106760; x=1749711560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2+w5qDlvAp457KpMnxq0u5sHkVOO1dTs6W/hmm8fgY=;
 b=HT/b4lM+76fz7yh4QkKRi0bGHP/zWMVGT8IRTFS9uQwigLaHvSg+XCSfs3jeJBJ0x8
 16lxIwxGieexr0zjeIQCleNFHBgMejefrYddonHAxWYpBLYTZhp0UhGfwhjnI4AIo2FJ
 770CV+sxYELtOXr0yB+WDMTW090JEvJODk4kXf152vEyceZ3RQDgifc6ljOuMEuT+en/
 /Y9dZyHn33Hw0IjXT1wKn+esUvRg8Sf1A0KM0aC1W6Kz+3E2ePEQ7DdQ19Cz4NZjFoK5
 kaMDPTTXZei1IMyC6F0oDpPtqAfA+7C8Rt+UJ6G/eNLH56SDIBgvCz/uSMHTSiaIx0bJ
 1rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749106760; x=1749711560;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2+w5qDlvAp457KpMnxq0u5sHkVOO1dTs6W/hmm8fgY=;
 b=Dn0ToyxJ0ZtWGqVUeLBJXQx+VTJBF4EzKXdQyOJjIYiJA0G4FRnycO1/OFssItYtVP
 gD7oXHJgYVAcAlndEVvFHdzsvgut8jF4VShYRr7PxiwIawmK2Q9OIGjxDClp3iEWoqL5
 BCn6/tAPX7zOQODKVJoFZbMKVdo+wbqLst7+TBRxGOVP8MLrSRDt1gbXGFYtF6kZQNaY
 sSaYM0iwM2yVszUURGdJ6uy5nf0g2Mta3ElPnTxrDuQVn5EYLNNuGnq0RgDX+/CqLVYl
 LEgaO7OnhrC8pXoPKrLBhLepzo9V8ANdIDlZH5WfHME0nVkeySXNUDxvJYWmOm/SXThz
 2fAg==
X-Gm-Message-State: AOJu0YwKcJgLGVS05hnvG9X6phugDKHoU6Z4p+D4gmlVFxwQ4zL2m8fC
 xO6Ww2eQwdBJOwQWs016VekXKhqXEPiIUHdSbdHxVut+qaIm5p7Bet0yBVSS5qEmra0=
X-Gm-Gg: ASbGncs/atEkGZARZUBeLclcmIx7OO2VD66T7J45La99WMTnviB3Zwde/AqH1ypBL+o
 s71TmGJlAW2lHOdOW0pXL7qdlH1mvBq9gT6d96TvhZC/qpPlWGY5M02n7Zw8vw4Neo1A0SYHPFc
 XFdBMp2UCLA6iH7Ald+tyrn01M3qKQRDFx2TBaq2f9tRVYgwPJLyHvYqrDvbusOLX8d+j0EKukm
 UyEZdSQUvv+LwIZ2mo6j0UWsnI4dplzOJLUMKHwO8M3qQpZr14uDh38P/SyZBScureisrz4Kkn1
 CEypTBpeN2KGz7KgvxkE9UH2K+Vyd2rAgmsHod/HIYsGicIWpYjr8nhO2IunVsONvbxeF+420ll
 DHeBQYGxqiHcawZ05RQ==
X-Google-Smtp-Source: AGHT+IGESUUU1RW1xUlGowA7kg5K9C6Ccu9saFql9en1faQOIZ4stoUT+cAx7nQdlpFweYLRlEcrSg==
X-Received: by 2002:a5d:5f95:0:b0:3a4:efbb:6df3 with SMTP id
 ffacd0b85a97d-3a51d8f5e25mr4573586f8f.10.1749106760421; 
 Wed, 04 Jun 2025 23:59:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe73f3csm23245470f8f.42.2025.06.04.23.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 23:59:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250520074110.655114-1-mwalle@kernel.org>
References: <20250520074110.655114-1-mwalle@kernel.org>
Subject: Re: [PATCH] drm/panel-simple: fix the warnings for the Evervision
 VGG644804
Message-Id: <174910675945.1443717.10418020148498727713.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:59:19 +0200
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

On Tue, 20 May 2025 09:41:10 +0200, Michael Walle wrote:
> The panel lacked the connector type which causes a warning. Adding the
> connector type reveals wrong bus_flags and bits per pixel. Fix all of
> it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel-simple: fix the warnings for the Evervision VGG644804
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5dc1ea903588a73fb03b3a3e5a041a7c63a4bccd

-- 
Neil

