Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E8FD177AA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 10:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0801310E480;
	Tue, 13 Jan 2026 09:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="suqmwgPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AEF10E47F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:06:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso66613705e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 01:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768295164; x=1768899964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJ5qgBPNt2A9KU2NCZgM7k5Zf215ZqcLLzVeUQlD8sw=;
 b=suqmwgPNh8rIM3TxtXDOSQjUh4pyU9rvZ6wZXzo9h1NFzkZ1OVnpU0CaoZCK6Zqyjm
 +ZPibf3vRriPVmJZa0YQniquCbgSGRlsWb3QKJSRQF753Jyifp+1sCbCtMno4PT01eJp
 p4W+VBUhqoSSbB493iCA7vk2imYT0ItqyJBqEGYTyE7twn1GkZZwJKTxvf/DM7h6rqLf
 CYAerRktGUDMt7r3IOSmvjOkfL1/BY8gJNzDiZjA9EtWlbO1DJGofK4SSqkDWzU3fZzM
 o3vQ5FlMkI3QFYrlbC7hq9xQEK/mQuMUO/PPCKF6AAx3UJnGUzLeS2IgcNnnCMG49m8B
 mUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768295164; x=1768899964;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJ5qgBPNt2A9KU2NCZgM7k5Zf215ZqcLLzVeUQlD8sw=;
 b=kcP5si8GyfE1TU91r+oxe916GewsFJJFdCaRzCx4Od4UroFVxkAoyiKFODoekiSFCw
 /1aoCc8sQIhSNTM982rGvbu/1R9iBOB7Dq+OA//mdSQJADyaMAORFd7LDW/KChhRSY3X
 /VVF98GZHHz8a39z5G7C08HKBN4ArQDEJs7seWMDBMZFt8fggCzs7oATlPY0K8uRwdmT
 79o7rLJS1qBJrkroceCiMqDT7yNXZUIV8a7FBbF0sYMXyw3WIfD4zgyh2hARfmhQGsf7
 sUQDPm6iInlsk1Ty0Z5uJbfWWcCefaMlriviz/zKB/qOCw2sOMUcFVbf+TVeo3oKhgco
 rZtQ==
X-Gm-Message-State: AOJu0Yw80ZD2+62cKUfWuYIA7eAJ7Ef/SK5oL45AtcCR570l+iVf7qVp
 LUxpKaL1L1uB0+UEWkCfCh48eq6CBsZfhbKjIffahee/DmC+y4BMarujAl7ZLTD267I=
X-Gm-Gg: AY/fxX5dGBVNhQBxKqe1h0zlBgbVwQoiS8cDmBzmHEZ1USE3IYZKtFIrCk/sgJ7Gj8m
 t3oi3+3vvrpAh9b77KUTU/lj0AkaT3u2DWjMByH9R7AEplfvt4NXkGrAXDvJvMMLhdcSDlpyFTn
 j6BA9m7CrM4XH7Qh1gMmZEOw0E4K0Xs1Im5Mk3hReGlRJbexct2B6m9ftE/jcIsINIoQ20e90Y6
 Eq799qUj1N5Ltm9leseZpOZQDInLakULDmbEqQ1UK/c/ur5bxAS4BvW2Wgc5dwBbmEGfXCNNzsj
 bLzZWU8KFO5PpB/GzYopOJ9hvMP9DhfCN+FUsTAt0z09MaT6enZLxPQWIfBh6d01TZ3lwX/GEZF
 vmb5mOnb/tbIikmmKyfWSzilekQd6FfEj83gC/9MooA5w5sK/WiRX6Xg9WYFP2QRY80qoazpCDP
 r4jQuRqpPqXw/PhjvYLQKXJcl8baT+EQ==
X-Google-Smtp-Source: AGHT+IGZHjyIjphvR5P4dJrp4ySSxf5hi6F1gI/ah3Nvh1cEvuJE5z/lMWwcIYG1dWuzcPNVjjm7RA==
X-Received: by 2002:a05:600c:4ed4:b0:471:14f5:126f with SMTP id
 5b1f17b1804b1-47d84b41181mr262528085e9.33.1768295163573; 
 Tue, 13 Jan 2026 01:06:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080::17ad:35a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed9fe7ac3sm11118635e9.4.2026.01.13.01.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 01:06:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 Fabio Estevam <festevam@nabladev.com>
In-Reply-To: <20260102141706.36842-1-festevam@gmail.com>
References: <20260102141706.36842-1-festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add Innolux
 G150XGE-L05 panel
Message-Id: <176829516301.3839584.15689890384888126553.b4-ty@linaro.org>
Date: Tue, 13 Jan 2026 10:06:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Fri, 02 Jan 2026 11:17:05 -0300, Fabio Estevam wrote:
> Add Innolux G150XGE-L05 15.0" TFT 1024x768 LVDS panel compatible string.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Innolux G150XGE-L05 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e7ec00be22d6563430f8e7bc44117cbcbf0fc1ee
[2/2] drm/panel: simple: Add Innolux G150XGE-L05 panel entry
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ed7417e5b889769ef7f66edfd0f836fa812655bc

-- 
Neil

