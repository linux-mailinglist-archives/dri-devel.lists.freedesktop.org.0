Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5959DA455
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C765210EA4F;
	Wed, 27 Nov 2024 09:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+AivvOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A7C10E411
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 16:34:21 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e388d853727so5304929276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732638861; x=1733243661; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=;
 b=i+AivvOYV1tL77Okghy4vPHyFXBDDpt0Y677VlMIvMaaQSg3iKegjXKgAH31LlFjDQ
 ReLT7gteSjtijDuNG8lSiaaG4gY2duKH0vt7//QGXu7Du54axQm3AtDwcRRbVwfu6TXF
 CbFvJQ2+GJrIO2yzLuSZp8r/5LiMR303cmzpYAY+CleXRN3j1WhxRwyMNN2SYBi/tktI
 QPuKbXn9cRQm0gIxpDezV0oiMsJF1VpiUdJLBWwjN4URrUh/NrmUD5D9hKQXuaay6zro
 1zKBFIlm+69QFYAsbAJvIoemaf1xwtKOd/53vR6vsZdmLElWw4aUm8TPR8r0kxa/Mt67
 9r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732638861; x=1733243661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=81kUDK2FfLp/WGQa7o8TpKjDjzqNKseVMcIR/5Kc37Q=;
 b=BLPpFUefg5WPAWQn54mDC9+ZcCWNNP8G/HimKlcjYqbwGORQ7T1jlkrwI0HlHNb44B
 Qipa772Z4IzA7IVIowG5Pb16GH9+zQdJiPIzx0SzkT06a6/KILL3zrlDIvcyI0+MnNS+
 Bk9KVLksjOMFQHg8wIhR6Virp5RKDMOj3ikkkfgOnCKBvVivjAepz4dD8Vkix0LzeJdO
 OTTYmUxodQ3i4FuYDL6Kb5q639uDGW3eWPiv3dJH8gtk+s0DA3EdxPvL1RgPBB44GEzo
 aOb+kCIhwjL2MQg7/hOj8iDkXd8tsm9CkV3avZQS7OJNJj14SP39R/bupdbP0fjpKIrx
 Hh4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnwRlJTVtW8smB/FN9NLrG23I/HpsHKb4raqIdPUbVIeCTZKy4yV4eSutIBE+XVTWrpumR4PXwxFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQghzdE1sb/NbcYftu5uUtHxOwyWXDbpH2Tkh7Ob+4PP/l0B3M
 ntUvE1JbWk0arpFO+1XycqRvJAgANusT2kBBOC4794FkDWT60LF/iTB2UQG5605ZS7mqJuWt3Yk
 FFq2sEvyGewtwPlNG3IN0DAIraiY=
X-Gm-Gg: ASbGncvPlDeY4Ge6iG13D5vJ3NH8LXbzBCtWiJkaJeO9bVsnRjlDC+/hDlFppfOk30b
 eaO+YYcsGJk1O55MZQW/0GMd8J++tvm0q
X-Google-Smtp-Source: AGHT+IH0rBw+xuH2VbnRPCa0ythGe+vmqwLZcKnDRV9jeUgWhfvMABxWAASqLF5EJD3NVkEYkOzdFIsrWd4Mu4/XXZw=
X-Received: by 2002:a05:6902:703:b0:e2b:d4c8:c5e9 with SMTP id
 3f1490d57ef6-e38f8ad708dmr15164230276.11.1732638860727; Tue, 26 Nov 2024
 08:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org>
 <3a6fb7fd-eb3d-428b-a37c-f04d81e7fbd0@gmail.com>
 <e647e8c7-6df9-44f5-abcc-34db74b8e266@kernel.org>
In-Reply-To: <e647e8c7-6df9-44f5-abcc-34db74b8e266@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 17:34:09 +0100
Message-ID: <CAMT+MTSetzODw-cbteQOgEYmEgpiFBVP5eDgjvyHGqofCU=VXg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit
 LCD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 27 Nov 2024 09:01:48 +0000
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

On Mon, 25 Nov 2024 at 16:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> BTW, max-brightness is a property of backlight, not panel, I think.
This is an oled panel, so no separate backlight device, the mipi commands
just change the pixel brightness. There is prior art in other bindings on having
the max-brightness property attached to the panel itself.
