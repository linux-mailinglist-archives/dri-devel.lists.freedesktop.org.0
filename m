Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E4EA384AF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 14:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FCB10E1D3;
	Mon, 17 Feb 2025 13:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SJywsZie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569D10E1D3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 13:30:25 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e545c1e8a15so4395272276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 05:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739799024; x=1740403824; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=;
 b=SJywsZieDn4Fqz1KMi9pv4/X0pQLMjVHhYIfQ7W4hZIbf3Jq7nkSlY2Rlm+fziJxo/
 BN0RgXD4FvFUa1VgRz5d2pVNW2zrSQpVbL2eCOwxQxXC3mVWD5WHVZMS6NgvUQ4ciqtO
 Ea3khkbQOkzE6jRV09EeHTB5mLnev13VsPDy8QGnI7NVwIQZtCniUz4hLvmBRBjP7o00
 5LeVMLc5Ib3X3p4Yk/8dPJxrUSbRyQzXQLUsVQwX2ZI6v3airvBUD2yqIjjFgPF1E+Tr
 Q5GXGMxpfelzdCTDDoB6/yRD5zImhu5QqFNc27jlfuwHd5cfjQ+mgb/Ai61kUsgAcB4c
 xqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739799024; x=1740403824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=77G+qwzoFLoNAsQ3YZKaFAwVbGfr3rRsvhGhU7TMI/g=;
 b=W7Ll5Byopa/UIL2CARoFlfCHpCulX6y3qQ94RS7hiyS9TZiIJmaii/7v0hV1rLqsUX
 5b/Cxlt+5EM8rAIiXMtsrynatljWvC7yKAX6GOoTlfMRKx0+tt1utRkTOqjGC6CZS1xv
 q0oS3qlbCUIILcL8rnjz17VV/HbJmggK/6OAwS/mo9BnzIniwQA1hciLinqVEglE9jNQ
 p05J4av9Wq/7YRBO/29wlT43h9xGZ5VqN0E3cnZYdT9BkltUrdp/OXtysbbdZsDbJ4K0
 mBXPdVnvBflh4irTqVjEbvn71NOvy15DJlg01Z2ILIT5Gcu6KSTY90AGg/ydAxzZg9xL
 2U8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsQmTpq4Sg6kJvw9AmjStl+5lb42VOtrDeIF5TO9MClWRdwKrty1Rkjxj+r8uY7isO71Bry0XIcVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzECAkExpolMNR9mUgC50KRd+5N/KTHjDkYnm+zuYclHMnB8VMt
 RijuHp1jFExnq4ktzaTjVLsRbPrPOEp/ERLatIFVKN/TyUx/sFs5bq2VkRTR6vbj81qwl2kaFZN
 f2ABdG5j9J44AcVre6eJ4sc/T7Ak=
X-Gm-Gg: ASbGncs0JvaabyHIdZU0qBWs+6OXR7STjrMLykO4okSjx2Z2U55NjZ8c/kzscI2vlKo
 gP10CI9vkEhFOwNKqag8ZMvCUkvT2zOGZb32O2NuQPTCNOIcz4Edf2zZvm7X29gpoKtuxcKov2w
 ==
X-Google-Smtp-Source: AGHT+IEB+MJzs+GIv2z74KvmTn3I75FACBN5SxbyoNwzXh0aK5QoppHOlpFhtMuTvychYCVQsoczFA/mnvfT2jm3ops=
X-Received: by 2002:a05:6902:3387:b0:e5d:bf09:452c with SMTP id
 3f1490d57ef6-e5dc932727fmr6866952276.49.1739799024419; Mon, 17 Feb 2025
 05:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <20250217-adpdrm-v7-2-ca2e44b3c7d8@gmail.com>
 <40e59cf1-86da-4c1d-aafd-f409d8179167@suse.de>
In-Reply-To: <40e59cf1-86da-4c1d-aafd-f409d8179167@suse.de>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 17 Feb 2025 14:30:13 +0100
X-Gm-Features: AWEUYZmCQ2KktIIoXJ32NnC-FVTPM5zygmYh9xHWyp5QfVtkMZOiANCC-UiM5nc
Message-ID: <CAMT+MTS016CLK7cawdF2kKv2tpGH-N4p3rqGLBPLkPv4A=j67g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] drm: adp: Add Apple Display Pipe driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 17 Feb 2025 at 14:22, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Unless the described problem really happens
> in practice, I'd drop this workaround. There's no point in working
> around legacy userspace in modern drivers.

This workaround was put in place after we noticed x11 either preventing
the userspace daemon from working, or breaking itself. So, yes,
it does happen in practice.
