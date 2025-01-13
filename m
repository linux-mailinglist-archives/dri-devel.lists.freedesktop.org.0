Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B6EA0B98A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 15:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D7010E42B;
	Mon, 13 Jan 2025 14:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XNsCPywh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4607410E42B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 14:31:37 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so41293541fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 06:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736778635; x=1737383435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQiQxuwGR8sipxLnE2QpNqD0m337joQm8Mgec26elhM=;
 b=XNsCPywhJDJ+MKGm+HLtfLfYNCkXvkoFWFAVfn0BZ50giRAiD7z8gA5LIKjgq6GZNP
 +5h6tZzQECcb9K8PyUXPeGp/YZZSkKHwJcLFsZOtmYxgx8tDzi37aH9DjJq+Ef5dus+4
 LhRznUIeGHCQzyM8d2QHZJN0kS5QmU2ACGKQjI9LYu0ja9qyUAImVGTJSDMZmDSbxk2l
 3HwastVSajli0G/UH0qS4npLdrKfzoCh+eVeVQ+VCtSPE/y6/QaWCBXGy3VUGuFMxG/O
 rMmt3h44HkRM8LFHBLPJg8VJ7UQx6DgcDogN116cSvtg0YTaiGSJJs4FfDBhPv2vW6FK
 3WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736778635; x=1737383435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQiQxuwGR8sipxLnE2QpNqD0m337joQm8Mgec26elhM=;
 b=FuCTRZtRBVuyUXsl+uIc4gcWNU6AuIwtqg/mP28VCjqBLKm2+D4tyUFvhB227X2kFb
 84XfrROlYacV39XI8tRtc2Y0HWIWxs5+qQR4mmndPrMYkMci8DO9u7E5lIPlM9k2iCvC
 PAZZyP5UTNl9Dys5fYxe7w1Rp1ilHsF0WqAx7ivfonLrsXv/Qh/5WEmZnmtWCUXSgSbu
 uAmV1TfE8IeDalbGhcxwW/EDHerBr3SQBw11IDu0ohGUEEgsLtSNAmakx4mbQnTzM08q
 wZ60QklDwwTsHzEk0RHyEEsB3tRXZPnmi37iy0vpJdS5farMMbrZq2AWinny+SeDfQ6q
 PhZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqGwFeGC+3zlTVOgzk+cTtbBzqwfsWTEPbWdzW2/1OSxX4k8XPi001PIz5OMvw7bSBvCpn/UFdgz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfLmhTdvzrqqnsu+BFP6hAg+FEaNA+DKQAqDHvXfScHSX1gqCR
 QuC7tssbK1WPXlT+BMcqGUOY3/PdVZAk+70lNHYvXHq2mSQJe0HZzTHDnML0tZSh0cRmVPHgEjz
 SY4KYl/dt8otzDj/62xM+GlDVPTSjyw8iNxuK3A==
X-Gm-Gg: ASbGncv9gFMiQHoHjT65bbWcsu+wfNJsCrs4e7wHozFKJhivuSTqalmYTkGd4Dbgv8v
 mFZK3KfZFp6aQr4AqiCXT3ILhNcXJmWg1C9K2
X-Google-Smtp-Source: AGHT+IGhfOPi0kkaR3fzIiz3zYVKzNITf7WqJXfvCEhBW44RAY34fqtT6fXLyl378DmtnGYFFnV3yeRTPKvHK9wdrxk=
X-Received: by 2002:a05:651c:221f:b0:302:1c90:58e8 with SMTP id
 38308e7fff4ca-3060ce3d06emr30538601fa.33.1736778635404; Mon, 13 Jan 2025
 06:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:30:24 +0100
X-Gm-Features: AbW1kvZgkONvTczIqxIzrr227mixg_kY6H8hXCa96ZE9JLa4yEIXQA2LwUItM1s
Message-ID: <CACRpkdY29s6Cz3zvtksLO8sESwxhkVdmGUipVAqiEtix3E1=Vw@mail.gmail.com>
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Dec 27, 2024 at 12:09=E2=80=AFPM Parthiban Nallathambi
<parthiban@linumiz.com> wrote:

> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> data 3 lines and lvds1 pins are missed, add them.
>
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Nobody seems to have any objections about this patch and it seems
technically correct so I just applied it to the pin control tree.

Yours,
Linus Walleij
