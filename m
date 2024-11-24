Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E076D9D77CA
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 20:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAEB10E2B8;
	Sun, 24 Nov 2024 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hYRgpJND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8AE10E2B8
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 19:15:00 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6ee745e3b2bso35600747b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 11:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732475700; x=1733080500; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FUcdfu20vlbQrbUIjv/kHG2vfF1hWf+xGemgGCwntLM=;
 b=hYRgpJNDqC+UgfpbIIB3g0PujpUgjAfCminiGGOCfgnloGyS0h11F0E+VBc9z2tx12
 kX8he1RXg7qRqUtas3gpU3rPY7Q+8bIsl0pvUsisI3Fzxz6W1XaiEFlVFAYa0yKHJnkI
 MZrNY/Tgl+hgVmNHa+X3rKZH6g24s8R5MLIR3RokK7QeWTvCI4fdQz0RvtU8XIU/Q2t6
 2bYwiWcOmdG2+59xVACZaJkiYDhF1UCWmP2BK1/bOIA1atrHnqDW/f9jyACt4Cf89R/o
 Y1dbYY5xb9HneIkH521n0wKVdOi1ywPMalz35tXVKrrB61/pq9piDOqy4h/pYZib5rR8
 tiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732475700; x=1733080500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUcdfu20vlbQrbUIjv/kHG2vfF1hWf+xGemgGCwntLM=;
 b=esCG6WdPo423Fls8A+/Cn1Pd/8wf1+h4IT6gWeShJw5VDtd1sW41A/sKmqNXln2CeC
 J7Hl3WujzTBjLyb6DZcCkE7N0g1PwUoqxNsxnRbgK1sbQWl2wrW9gKGbvtJezhUbP5pA
 PlNBMUyual2dOwQhKCaQ26UuxSbFVUFOaAP33e2l9Z8IDTergcmJ4T1OJAdT/J53kl/0
 +jNKogNcvKQRihGgacv2Ho8LvOsVY3IwJ2Q7SzNY5cRmCAddO72apV9AhSD0x/0kfEY1
 nu55WCvYYMWOTl5s0iGO32gnrp72bsWZiyRToG54VXauLOGFISfQdQyyCNE68g/xk5o5
 uyNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeMikzgFuPKpfE9x1t83K9AUd148QtqoieY5MiazroGoJ2RiCkbeAaFgt6V7y8/HjxT9gXKjqXMYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkKkLqDwbSh5HKttc6al40a4BLo3WOAFxpX01hgbZQpnFmUG0g
 VHLlpVdaORC4rLKrwbRF9bE2gnT+g9OXfsY5neAFs9N4S8VZWXXzrOLqgTQCDspJZX7wZu3WmT6
 zapsVoLJ0SojPysfv7fQLpQgpQgM=
X-Gm-Gg: ASbGnct8BSFba4cGTPwC7n3Uw2IYyDzBj+CZV3aMNPnkgsaVSWCGDqNh3Co4Qm4RcP/
 uFJVrAYDoigVjeJH7CTavjni9rjz5wShGEwOYP9LLrgvC5DiQ4eLOX2ms+PUbFUT0
X-Google-Smtp-Source: AGHT+IHKRZlUaCOi723pd97G/msekH1s8xPuV9Y+aAZNnkMkpHNkqzMOXJaL29JkY+PIZPFmh2ic6PoNXDjqv4ViCqY=
X-Received: by 2002:a05:690c:6ac8:b0:6ea:88d4:fd4f with SMTP id
 00721157ae682-6eee0b6f234mr78667757b3.18.1732475699701; Sun, 24 Nov 2024
 11:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20241124080220.1657238-1-kikuchan98@gmail.com>
 <20241124080220.1657238-2-kikuchan98@gmail.com>
 <f0d983f7-5f60-4cb7-9522-ef4429359c52@kernel.org>
 <945786cc-1d6d-4a45-b9df-26d9335fd271@kernel.org>
In-Reply-To: <945786cc-1d6d-4a45-b9df-26d9335fd271@kernel.org>
From: Hironori KIKUCHI <kikuchan98@gmail.com>
Date: Mon, 25 Nov 2024 04:14:48 +0900
Message-ID: <CAG40kxH8bQHauBAd1B=UpC7LLAJoS=ETKczL=QWBKqvk=VKh_w@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: display: panel: Add another panel for
 RG35XX Plus (Rev6)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>, 
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

Hello Krzysztof,

Thank you for reviewing.

> no wildcards

Sorry, but I believe these are not wildcards.

As discussed previously, the integrating vendor and device name are
preferred instead of the OEM serial for unidentified OEM panels.
These compatible strings are based on the actual device names:
  "RG35XX Plus", "RG 40XXV", "RG40XX H", and "RG CubeXX"
You can refer to
https://anbernic.com/collections/handheld-game-console for the full
line-up.

Oh, regarding "rg40xx-panel", it might have been separated to
"rg40xx-v-panel" and "rg40xx-h-panel".


> don't duplicate schemas

The old schemas "leadtek,ltk035c5444t", "fascontek,fs035vg158", and
"anbernic,rg35xx-plus-panel" exist independently.
So I had to add new schemas since the new ones are not compatible with
the old ones.

Perhaps the compatibles should be like this:
  compatible = "anbernic,rg35xx-plus-panel", "newvision,nv3052c";
as some others do.

In this way, the schema files would be a single file and not be messed
up, but it would break the previously defined schemas.

How should I deal with this?
Any suggestions or advice would be greatly appreciated.


> BTW, isn't this v2? Where is the changelog and proper versioning of
> patches?

Sorry, I thought the previous version was completely rejected due to
renaming back to "wl-355608-a8".
https://lore.kernel.org/dri-devel/20241105-maybe-chamomile-7505214f737e@spud/

But yes, these are somewhat relevant, I'll post the next version as v3
with changelogs. Thanks.

Best regards,
kikuchan
