Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED808C4534
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8CE10E50A;
	Mon, 13 May 2024 16:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QqhaY4+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0605F10E50A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:41:50 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so3877771276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715618510; x=1716223310; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DH4khu6TurPS5qb0OEXIieAt+VWCVTM6kLpaEQH1DyY=;
 b=QqhaY4+vk7lkt+ZwCwjbMw+521/ueJN/CQ2yCvLM8+6cDrZfQLLQF/lXHK5XXe+Gh7
 NyjJQXNpAaXp0Gt7nOECimDPlCaNhp4LsbT+uTb9eezQWJ2ktVz6rdEkKn3XTxhkU94/
 WXDjxXZdDjdfQORSN50GfbtVx814qEOF91X5HMLFTDk/+ZBGpgdlx5n+VHpQKr5YyhKD
 TbhKGwc00tYElI4qbUgyuHPGjLxAkYBH8Ba0rys8yV3MUy6W+pHH/WNKupw3zHbb/pfm
 1m6zwujs4i2pMP2WLE28phv/tEmroD5K9q6BVeaSWrnByX9BgAkFj3L0C+/sA9hZCfRw
 WH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715618510; x=1716223310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DH4khu6TurPS5qb0OEXIieAt+VWCVTM6kLpaEQH1DyY=;
 b=uU788aHRP6pF7hVZgJ3eggrAHh/aJBsr6CZ3Yh+3TqA3uczOR0MaPCcQqv9VSlrcM1
 YTk6BRgYXRTfycUOemqTqqnC1dkjd2FtQm42Riyu7N22noIHavgudtXHk9wyyonONf46
 iVVCR6es7iqJvvjtmrysxKUIX9hmBEn5kwVHZPZG/boLQqEGJIKk2knxIfCIwhDDJkBE
 3pUCgpJw6vIkr4ThsKjnIYPQTpa/fwDPmY/vg4KGIMtVJth8avF01Y+jfftwnL6gScSb
 f795dllhFOEj4sJF1XNh3oqOuAhOajiGeVTgY6tpISSxW18/Aesxbh5Y02F0UjD9L56v
 Mokg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9ge/jz9Nl29/IWUWDJ0ETvl7IEZDcCNLntMcJH8b9grIuOanC2nwxfDibayjreF+tWiVsizddswggOgLwE7KZ8aUMHu0i+vmafG6drYQv
X-Gm-Message-State: AOJu0YxjAmfOO6LhVYX+NVZQI83MsBLufREVcTPyha0/uy7QdRkxERjf
 aNQOg7fMV0uAtRivgku0n909Kpha+UvmaeuSF7QYvzNkFq8V+RnaDlqfizy+xnXXGerlJnO2i9i
 04RZK4p7D55sX3mG7WycPvKveMQmBSQ3eKbfAoA==
X-Google-Smtp-Source: AGHT+IGq2C3XDhTaH0foAS493CYmJmGVWp1jeF0dF17vOTZlUltQhDhRhnjWctarnqxlh56yWFXuox8WxUwgr4RKcNc=
X-Received: by 2002:a05:6902:2401:b0:de6:1645:499a with SMTP id
 3f1490d57ef6-dee4f338380mr9928504276.30.1715618510038; Mon, 13 May 2024
 09:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
 <20240513131711.GA2419451-robh@kernel.org>
In-Reply-To: <20240513131711.GA2419451-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 May 2024 19:41:39 +0300
Message-ID: <CAA8EJppkJ9rukeUZ=1kAL3Y0WVhN5QFXnNU3tjv4yuXMjc++7w@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: display: panel: constrain 'reg'
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Luca Weiss <luca.weiss@fairphone.com>, Shawn Guo <shawn.guo@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Mon, 13 May 2024 at 16:17, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 09, 2024 at 11:42:50AM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > Cleanups for display panel bindings.
> >
> > Rob, maybe you could take entire set if it applies? I based it on
> > linux-next, so letl me know if I need to rebase on your for-next.
>
> Applied. These 2 don't exist in my tree:

It's most likely fine, but was there an ack from drm-misc maintainers?

> Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
> Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml

Because those were added to drm-misc during the last cycle. So ideally
the patch should have gone through drm-misc.

-- 
With best wishes
Dmitry
