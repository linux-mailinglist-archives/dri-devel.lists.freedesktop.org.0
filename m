Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E3DA0081E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 11:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C9A10E295;
	Fri,  3 Jan 2025 10:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VYelCNPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148DA10E295
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 10:53:15 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so14336902e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 02:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735901533; x=1736506333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Id5jxrXyu5iZt29+Fzup4tBPSiyAJWKORh5sy4QQ8Cg=;
 b=VYelCNPbSe+IcV0Ke8GllwOUxS/V+UiisXxByFpc3nT3smOeLVm0dEix/s7uvPOWmX
 OB51puu5cRTEZcv5xqKtFOVV+FUV7RJ0fG4X/mCjeVhSezGTqNl/0RE5Ah0VQfJqBWhI
 VcFznIcoeccDFQnJOQjrklWIVuNbpPc81GIu+07fmFBcGG4Ru/eHnyr+/LIv5VXyYggS
 RPetAXktXoUrPB3a0NI6xgnilQWkDYhcvtGLPc30/OXRhApbkJvhtm+TddBoue2bs2kb
 xkwtFQY4XBeyZEor7Fc0VnPd7LCMt69kcqHBQlqyDYzeyk7QENz4ccphpcLuy8XTfHhl
 Wawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735901533; x=1736506333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Id5jxrXyu5iZt29+Fzup4tBPSiyAJWKORh5sy4QQ8Cg=;
 b=Kv+7RU045lbC7NdUJNbwXmT40J+O3y9PBunyTpGDqyowACMeZKjik+W6eCIZAWppkm
 0hA05j45bE9mbaZYs7STscQF66xBZAVpbbO/RnoDvIVoLHJTJSJTRZD3D9k9/pOWeEmI
 MYWiEss+0pF4lzIfs+toskzCcjXTpWe8VJkRLCGC17gKtF1cvt3+KcygNuYngsssHhmY
 XtXYvNfVCn88d3rdfm8iDAblD36T7Bs41NO/tM8UwYwRQIEuAojCWN8VWCswtf/YHBYV
 gmg5bY3bE1HutfHBp7xmTDXR/MHmv6Q3V7N+HJbj9SBGbGj+zvMmjLG5T3XC/+V25UHf
 S1tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWaZ3PrxgVi56AtVAXT4N+RIsPrXyFnA07bo+i4VJ4/mh8E3sa8/sYBfh1xEzU/DtSut4asnLpCKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy80rIM6QLCT8vkzu4KbX30LX5dVjl16irSj9G+hwXkqT5r9XLs
 3Yde1wFmxzgH6TiNuu26Y3O3m4xQkBEJEkxe7DlqzASx8nfuxVj+ULM99HujLj9bbBnvyExKEnW
 O
X-Gm-Gg: ASbGncvf7cr7RBJPIELWFWkosMBcHFGcHDj2e8Vfa2IWLgdk+98B6yWfehUUrXeLJHh
 vBapUrUG0zfzctMEOkPLfXRd617gOAveWzlTAcNM1Pj7Vn07Fpi0O1zrGHLIZGf1CA+rxCUZndA
 onLeLOmU72FEIXa7wkICferUVyOgELoQ2hPura3iMzBaH2AHz0fnXGrkaTkx1yG8QsAs2u8uYlD
 6q8e4+w1RtydZSfOTbMfchI589CqBp3O2VveF0R+Uzkwa60zf0BUm+IvYad9KkT256kL4bthlQ3
 zlVrEubFxfPHhWD/a07xaOPO
X-Google-Smtp-Source: AGHT+IHE7v9MDMFa7AVnTzbdGU3TgdNFV7pJDdTs17qUC5pxJSU9djgHBqmKj+rabDXVAtERtRJtUw==
X-Received: by 2002:a05:6512:b0f:b0:542:2141:2ccc with SMTP id
 2adb3069b0e04-54229450ab9mr14626218e87.15.1735901533424; 
 Fri, 03 Jan 2025 02:52:13 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235feda8sm4168498e87.60.2025.01.03.02.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 02:52:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, kong.kongxinwei@hisilicon.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Yongbang Shi <shiyongbang@huawei.com>
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 drm-dp 0/5] Add dp module in hibmc driver
Date: Fri,  3 Jan 2025 12:52:08 +0200
Message-ID: <173590151924.708477.16295921709511915034.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250103093824.1963816-1-shiyongbang@huawei.com>
References: <20250103093824.1963816-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Fri, 03 Jan 2025 17:38:19 +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Realizing the basic display function of DP cable for DP connector
> displaying. Add DP module in hibmc drm driver, which is for Hisilicon
> Hibmc SoC which used for Out-of-band management. Blow is the general
> hardware connection, both the Hibmc and the host CPU are on the same
> mother board.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/hisilicon/hibmc: add dp aux in hibmc drivers
      commit: 057e77972556aed4a0f1eed7eeb85024d0a22ba1
[2/5] drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
      commit: 54063d86e0369f53f180137e5e889bc19cd9015b
[3/5] drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
      commit: 94ee73ee30208f3d92b2f2a4f7d3346ba56245bf
[4/5] drm/hisilicon/hibmc: refactored struct hibmc_drm_private
      commit: 587013d72c1a217ced9f42a9a08c8013052cabfc
[5/5] drm/hisilicon/hibmc: add dp module in hibmc
      commit: 0ab6ea261c1fe4edbf4d99dfe65d8ebaae905092

Best regards,
-- 
With best wishes
Dmitry

