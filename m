Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66589DA44B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1DF10EA3F;
	Wed, 27 Nov 2024 09:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QYGoXZdP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941D510E94F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 17:01:10 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6ee7a400647so62247317b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732640469; x=1733245269; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6rC4JORljy68YEdx8irUeLm2zmoqEL3AApISoooOchM=;
 b=QYGoXZdPtARAHY3YrFSYKPls7fSyXIicgQMPqye4UmfyTmiK3SSBNsRjAgnltj1nqG
 pBnX6HmIAF/KJJdmDK0Tk/jWk9LwN1dZ7CMchiaTP7c6tYJA1ZdvRAx3lmDOeKkjF4Ie
 /vJHn+gKrw772yhp7CHnV5W20sfVQUcuB8VceSnA7XctkK1sA2qz168SloNXIsj5Q2We
 xz8zzCsALakzk9LpXU3TC6e2o9/bcyKedLnLT9MGv98bGU4QBY5wUlJjY9S+virjZjaE
 Ku/iLWDKaG/cay7QYn42tQI8fXl9t2W0a7UIslbeeu9VfCB0LuPFQoMYCD0idlijeRBQ
 gbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732640469; x=1733245269;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6rC4JORljy68YEdx8irUeLm2zmoqEL3AApISoooOchM=;
 b=dtQenNbx4xl5PEE6buubT/pqPNXomd2rZsDk/az/9Ge/lCb3493+Of3ydi3wAtEGSW
 THKrwdIPlBbpV0+wt5CioZn/tRMYOLKR6POuoSLBZmh3wYZmJjR85yiXz7ob4cSd9Ffb
 QnDuKJ5vVZBL3POUoiISTbki5faXPezOR8O6VoyJ+lZI4MjMaFGNYXQp0i+din/FI2VT
 l6PSM1GRYIFF8Xx/hWz/ejD2yNpdclA0848yfWsu0nf1f+Zw1UbrWg+bSVgT+ITUEGfx
 d/3zPPKjWlWF+oiSWKj/8MzAp2cSJDRjQb1QMBgTThync0YBt9+PJe5CxWYH3uOpA7Es
 KJkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkCDQz/3Cb3Ol6au9qfvgD4AJBVgx8EoSocQFlbCyO0tCyrLU0EyXkryqTe25fCh03EgCcC49Tk0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYSOcktI5drsfuRF4OqOiHOoXz6ZXg1q0KKWpNkS79hjEXpAcE
 dCY0U/4fgHogP6gDa1pkftsUPZyll7b8tyIU+gKHzsWjaCNAbpOxw3JbRQmUO/puFzmeXPI0JGJ
 h2t8/CWUz6oqSRzlHbxI8Ze6NzTk=
X-Gm-Gg: ASbGncuGLusa4jrlbJ471oX4ngr6zw7QLkxVOa3TTqv48JVfVTb+DUXyHq68HbbXpyQ
 vGwArDTGIIlnHZ6HkDI5KcikZwIfdyg3/
X-Google-Smtp-Source: AGHT+IFd396UsokWwA15Q5p/KFcRLABdHgY43zyTynmP3tmYwQ6jofpQFOVNZv8hTAfYU9pttSvOZX2EXzH2X5cAsqw=
X-Received: by 2002:a05:6902:140b:b0:e35:dede:fe02 with SMTP id
 3f1490d57ef6-e38f8bf5ae0mr16167825276.44.1732640469435; Tue, 26 Nov 2024
 09:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
 <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
In-Reply-To: <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 18:00:58 +0100
Message-ID: <CAMT+MTSwCf=iwmD3t=E7T81K_d+o-5XpCxov9fk=_oUnwooA-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
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

On Tue, 26 Nov 2024 at 17:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +allOf:
> > +  - $ref: dsi-controller.yaml#
...
> > +patternProperties:
> > +  "^panel@[0-3]$": true
>
> These look unusual. Is this a DSI controller? If so, then reference
> dsi-controller. See other bindings how this is done.

This is a DSI controller, as referenced above. Those properties are from
dsi-controller.yaml

> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - apple,j293-summit
> > +          - apple,j493-summit
> > +      - const: apple,summit
>
> Summit tells me nothing - no description, title repeats it, so I suggest
> using device specific compatible.

The j293/j493 are the device-specific compatibles, those are chassis names
for the specific laptops the panel is present in.


> No, these cannot be true without definition. Again, please open existing
> bindings and use them as example. You probably miss here some reference,
> but max-brightness for panel is a bit confusing. I asked already and did
> not get answer: isn't this backlight property? What is this device -
> backlight or panel? If panel, then what bus?

Per my response on previous version, it's both, kind of. This is a
self-emissive panel on
a mipi-dsi bus, which can change brightness in response to mipi dcs
backlight commands.
