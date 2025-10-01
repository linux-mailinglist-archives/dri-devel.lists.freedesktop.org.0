Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29CBAF5D4
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87410E2FC;
	Wed,  1 Oct 2025 07:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ap61pdUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3844310E2FC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:14:34 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso46202945e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759302873; x=1759907673; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kf5dynhRLldJCNs2IEg0+64rtOtAeTZkEe5n/sgM2Y=;
 b=ap61pdUxGgSCpfkIHbSd6zvgdUYky9+GkmNpTWfuRU3zkI9/F3JNVb+lbzDGg56YPz
 0Sl9HO1gIZR+E/jTFNmRq1EBoWi3ATTrvTxgTc0Pohp1USOY1xIuvZcw0csdtp1GVg99
 phCYF5GUcXBtSAkiMCOmB/LaxaVfg+dRXjyem89p9OiVR4p5CB9BiZv6S3gSHovrxQIx
 LpjH0N2TdgPrtXGi78zMUrWqdfOYuKXkc8gycJHy5u8uTy9YTAxgojIwtuLdZCUN0nj9
 bcKlZaHqFZ+sryVEAL+M9+lUWyJBrmUfPgwiqTJA4x60OeIdPbBdm1ajA820aVnV9wuq
 0Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759302873; x=1759907673;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kf5dynhRLldJCNs2IEg0+64rtOtAeTZkEe5n/sgM2Y=;
 b=ugPeXr5UjT1XhO9GW6LQx0BiHKHIPzK7c1YJhR4Ag5xO2aJpKRON7YOzU1ypKAam3q
 W0ZDiX7xj41fC5okz7TGjQaepTliy1gYn3YxSyngXMPHwQ8U8WBNO7MY/uZl/ykggD2s
 e3taTvp/qeF/CChgnbiDZXfWiKohRfOIyh1WY5/j7wd1MgDgJNMDFb2FsYQN0yuOE65t
 XPHZQ/jgtYUY+1GqkBDcTQAr2fJBJxVUaqiqWPVs6mlbSA9SDrqLt+BScch96gKdztQC
 /J6xpVk+NeLKkpZ5tIWoHCS72SVNnyJcUyOneHA+kz/m3mtih6Xltj+1uq9wJ9XA0SWt
 Zz6Q==
X-Gm-Message-State: AOJu0YwYReE4kUePtMTC8BB+C0Faq3+GjlbXUH0ng+kqThf7H+6Vgnt7
 srqWM5j+Bt/6g9ELFBEi6ARMg0IVZ4glI5vH1oJaIUQBW4rvdxvAEN1+YCSyYp0s+WU=
X-Gm-Gg: ASbGncsxoEDPJvH4bGSlX2wlGccD+rUsTBHw9u5m7Eo4+ZeNDwo9As5bUg0qDCk9LRe
 uVvf6OEOYLbMbxqnbkGS+dzdRHMwp0+gEk2FLDhKt+MX/QDSlClSrXhfQc4iubDkarMTEmdn8S2
 FkFoW32x/DMTEkaVHj0KDSvoVm286VSZGJS6VrC+5MBKOTo1J4Xop/Xz3sJMfgcp8QCraXCsK5j
 5LxPzGAZV0nvmtUdYAbwkV7i1rPa16E1AFmyhBGaPPhQ70VLYF7C9rNFS2O/gMRY8Q/oj86HZH7
 ZYehaWgyhvMcH3if53VZgOBDWwxPfqXoFkliJ8AH5C7UZnSff7trwvqW85zAmqWZrwvN8gqN2mQ
 RZMNER2rarnNso0Mk5R/epid/cdJQem4aQsevm5yKKcPB/jcbjBdoFabPisVdgo7c9Fs=
X-Google-Smtp-Source: AGHT+IFowAj7Hze66bm6j+kw015O7nlbY2diRFniCjTtOMsjXtusPU50OP7bOKSBUfU7OwfjEU6VXQ==
X-Received: by 2002:a05:600c:8206:b0:45b:88d6:8db5 with SMTP id
 5b1f17b1804b1-46e612192d5mr21887525e9.12.1759302872517; 
 Wed, 01 Oct 2025 00:14:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b7e37sm25185825e9.1.2025.10.01.00.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 00:14:32 -0700 (PDT)
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
In-Reply-To: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
References: <20250904205541.186001-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Turn
 ILI9881C_COMMAND_INSTR() parameters lowercase
Message-Id: <175930287176.425863.10274979935592534719.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:14:31 +0200
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

On Thu, 04 Sep 2025 22:55:15 +0200, Marek Vasut wrote:
> Make all ILI9881C_COMMAND_INSTR() parameters consistently lowercase.
> No functional change.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR() parameters lowercase
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/02b6babf22eb60d86b4030f08204f6e7853da4e0

-- 
Neil

