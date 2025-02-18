Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36435A3915B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 04:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C648910E26B;
	Tue, 18 Feb 2025 03:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JUGksp8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284A210E379
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 03:38:56 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2f9b8ef4261so1224195a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739849935; x=1740454735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpIhM0zsF5MRaXYqddzsaHiNvWZ/pZsLy5qS/qUhHO0=;
 b=JUGksp8QvqNHM9b4B5KtY5avq7EkaIrjX4Ao+oOLrmBby+yC9E2JFKC8kCH4VnH6xI
 mKtoF5rzdDFwKLPfvAL9YHDUX441/yybsTn8QHs1E79ZBWl/+MvlTNf0KN3/s58xdcTO
 HrgTzmFdL12IM3KgQWuqVYO9mNR6GCYaFnS28xMdXIMQkE/uJXEvqhdoyQbr/QBTqYsx
 QNoX3nu9A6XhTXffRFgaMzAsHHOpzFv2U/ycAWhmeZH0q9RnFK4sjpuIPJy6QtwTCZU8
 lG2KIrPvexQTdrw/Bjm2Kz1fh1fBHLqfBaqNb98HgXGrybWZzCEo9sQ03cmIGStzK4++
 Mwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739849935; x=1740454735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BpIhM0zsF5MRaXYqddzsaHiNvWZ/pZsLy5qS/qUhHO0=;
 b=K1qNGgh2y+mD+XjrXMZIbUMbpb4LWF4PdxLVkOPA0auE+CZR/jMe1LW5j/r/BD2j94
 2vg5Nzg7+Ue2gdoH3Ln6xC3jDW30lZmBc5LoTynVbWww927/WDDNM4lWekPqHFG+PKMW
 SWZBZC83l5Biv05K1dxSvFiaEXagdSwVVy3gsPV73KHji+DVFrvy7E8NFWN9+jfjbhqz
 zQnTsDW8gqDUjH88Cy2gyy/HSRD2j+dQcULbJuKl2HVfP/cyP+FQz1LytftDuqIJ9Z2U
 W9bsgsXFFZ8hmrvuCKIZVIMMAD2d2ceW5aGbD/2RHfHT+PuBNoFvVdoE7AWq3XIsO1lX
 5UZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCxcnPBJUI8b0KX2EjbSv46GpBlUwnKoJ+KvGNEbpGkQuejRMfcpvjyptI8yvzp4jvjF3IGHsnV5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ6ShT3ExShTursBlPu4A/jjRqvu8gugWoTqYIDBpe/OtUD85D
 RNLSniJOePU7JHpCZiyYLqb6SVzHq0Md2sndKBndqUnmZlSuAGC/
X-Gm-Gg: ASbGncvXA/h1uUqPlhB50f9vFuyoYSe3sJefAh6ynHfdr1Las52LuOlsPbdohAtvUkm
 EAlvo+PT2HUuh4c5nBMrZwXVmCm4Apa4pK58IfcwQ2CEcRyj8yXvYjVycwmsgAPrpNioZKRd0vy
 UcJ6HbdG9UyAZWKUhh++UhmZ4DwfyH9pafYTQ/VdJ7JPraNJufFAhuLkrAY/8jbsW4Gc863wKmJ
 gWnKvhCfBPAcWLgdn8Mu+XJVXZ6eeFUPQ9Ee8Ol0pxycTBEik/O5LyFx3Jr+kNoy1UbHPdQPuZv
 OwO2d7AEpGSoHIVHRZyN
X-Google-Smtp-Source: AGHT+IHp51ZpR11Xenf1xc5xrATpU2b9pYP8ziEHbXQ3EXKCqj44fPEbRUBGOVevxEXu+GXioUS4wg==
X-Received: by 2002:a05:6a00:198c:b0:732:2923:b70e with SMTP id
 d2e1a72fcca58-73261446955mr7067310b3a.0.1739849935459; 
 Mon, 17 Feb 2025 19:38:55 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73271b4a8b6sm3947699b3a.2.2025.02.17.19.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 19:38:54 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: cristian.ciocaltea@collabora.com
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 liujianfeng1994@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Date: Tue, 18 Feb 2025 11:38:46 +0800
Message-ID: <20250218033846.1251897-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
References: <1b3234ce-4526-4735-b9c0-c242e6cc3cf0@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 18 Feb 2025 01:33:34 +0200, Cristian Ciocaltea wrote:
>@Jianfeng: Did you encounter any particular issue with the current approach?

This patch is adding a dependency of hdptxphy1 to vop for all rk3588
boards, but not all rk3588 boards have dual hdmi, armsom sige7 is an
example. At runtime I will get errors because there is no hdptxphy1
enabled in devicetree:

[    2.945675] rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy1

Overwrting vop node at board level to remove the dependency of hdptxphy1
can fix the issue.

Best regards,
Jianfeng
