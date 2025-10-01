Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6891EBAF62C
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6388710E2FA;
	Wed,  1 Oct 2025 07:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ackv3c88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E7610E2FA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:23:28 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso4781559f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759303407; x=1759908207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VkTJvbE8D9pXlnX/SWWHYVNJ++dr8zamI8M2eVs9tNU=;
 b=Ackv3c88ifmdWmX+vxoLthGUc/IGzCzge3c7BBozotgpie6/JdNtR4adRlH+9MDdHM
 gWx3pbwuijR4rAiDwbi8/SDJjH1tWcDD4jxURssKwkEVehtxl1SiaQ9b6CI9hfbdCp/t
 xiVuIvDPtH91mKv9YkXDtfDR4APF6eubOl18sMmhQAm9KFreZL1bYp+dxVEZ3/pE7fgH
 L+LfzZ1Zte433b8nzv5qaaZ1+sQwFaxgZHcJ5Z+CPUi6FiQskceAB20wLDN/ay8EsReo
 GUenq0zbnAohrY9wBYs0IMABpZwxqUrTiEzFT+z+UedC4XnFlkpO6aUPXG4iosOR9AcL
 LudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759303407; x=1759908207;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VkTJvbE8D9pXlnX/SWWHYVNJ++dr8zamI8M2eVs9tNU=;
 b=m32wuMLCWiHnbGw7YJXHzV9C4Fw4aGMNxDf3qhVoDMV5QyqvRXR9W7LFzNHfRQdZN7
 aGTV6s50p8T0DKC91dmam8ghpEIb5DGA1+L8ObJyd693rwKhN/fdJumqKSAa68UUVcu7
 g3KV8CsA59X6Y7UVMCDSd9lXfjOrC/QDvtiVtHWF2uc+rAUQpUhFjc+evir3BT1L5zQq
 6hfWIVYZOzJ7YbEilRTeyazu1osGbrOqcqXEA9hwZYukJJpxuEZJnM1H6DAKISJDPLic
 MyVqALuoyXYb2m2qWtP96yZAkTlaFcfPIoUaJxctC12aeheWWVcVEejunuuf0l7St3/y
 r53g==
X-Gm-Message-State: AOJu0YxQIROJTz79yYcEwYLIdfvZrdQ4CQnTrqYzWUZ9SXXNeRUCTIdr
 HTlghUlKothckrkZW33/xP1ruq3VMEGk+L6mqM9hnzdA0AQvn7WFEtn7j+LS4xBYcoY=
X-Gm-Gg: ASbGnctpurSwoO2NOR3pzVJfqe9BDSNH0xreTThaCcq1s0mTm0daOGnUF0wrWp4LxHF
 hCV2aDgHMph8e4BKBfVQzyrBxl/rL70Onj91ut9zAhXceJhP9baBtU/XYMUtAGWVNbBkh4S+Yqy
 v4u6sU01GP+/PG9Kw2UmkuJtZXaNAN26zf3iA+I6u2/iTGlMptGanMvqaF1YqLDGjJfec7tKhm5
 DrVUyG/rie/AlZnio8NO6QhjjBQewvUHEFtjmPEyHMUztiruXRnropdjwiMtKMk3ERuY37QWzti
 Oz4ZYaCkj/Os4NI2VaS0Er7N/msQfzSKN3aNwcwZKODaidvYHfby6x6kbvb9bEFpX4w2dSQMQVW
 cQRy0rBqJ4PNveGX1W4JpqjJCWiRS4zGGaMJaQNr0yH0sQyHpLrKXRvQrlDHegspbxeyx0Mn8Os
 IMsg==
X-Google-Smtp-Source: AGHT+IEh/bWsHUjoOariR2V8TFO96fWfpxOZDaiVpLQZxlNjTTKvAPgNTUSjyaYhz6P4xg2rtuQ7wg==
X-Received: by 2002:a05:6000:2f82:b0:3ee:1368:a8e9 with SMTP id
 ffacd0b85a97d-42557807da2mr1446611f8f.17.1759303406666; 
 Wed, 01 Oct 2025 00:23:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b8507sm25805335e9.3.2025.10.01.00.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:23:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
Message-Id: <175930340588.467410.15494942585777462922.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:23:25 +0200
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

On Thu, 04 Sep 2025 22:01:08 +0200, Marek Vasut wrote:
> The ILI9881C is a DSI panel, which can be tied to a DSI controller
> using OF graph port/endpoint. Allow the port subnode in the binding.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: ili9881c: Allow port subnode
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3684218949703ea8779aec7c3ed598a05ccb2b23

-- 
Neil

