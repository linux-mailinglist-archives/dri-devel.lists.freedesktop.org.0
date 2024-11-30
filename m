Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C89DF22B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 18:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6701210E054;
	Sat, 30 Nov 2024 17:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ibxTOoda";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6463010E076
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 11:15:37 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e3985aabf43so1282883276.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 03:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732965336; x=1733570136; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=My+Y64elRWi2729TcRQADy3OD/AZrL+55nSA2jzZWWQ=;
 b=ibxTOodaGZqz6viU4Cfqv6Gp5tAZDi7mQgCyM3MQx6sNFqVe3x+wuG9qCVtdKCRXzl
 /at+/RRkNOJvHbTvj8DRoIAjS4IIsKN81jRmDjtgv7Y0WsGxdJzcn2M8RSTk+ZRpa6Au
 a9rZctbeaUrjWdKf+4bInHsE4PlQvrJWjR1i1Fg/IOxt59L5mpHxN5UhSAJYZeWlB5fP
 j1g8aaJ3/knZH/v8dUoO3xBxquCw4hJm5yk2AIawml/qWklgcUToBvnh6E5Q3rCBMfuO
 Jvbt7InvL7IqO086VwYgBJ9rpE7iQN64KJS5Im+8fXJBUS4aocb0MD063iBGNvZD0rzV
 jt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732965336; x=1733570136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=My+Y64elRWi2729TcRQADy3OD/AZrL+55nSA2jzZWWQ=;
 b=q1MSHdr6zA5AVcnl4rnL3jo+c7k/bKsZ9luB75usUf8pJgLa8Qdma8azTotmIV8ymz
 vTg9Q2W77l9u85DfrmwV9lBQkg56PRZbogb5vjagv0PxLUwnfFWPTeDrJ8DEZMotflsu
 EttAn3gXqWdbmO2OFZaX2xE6JIfNjfmoC/NRZvQLrc2rFmlGLmpwZjlx1sZCCsetbAqw
 PFuEwhc8N5NYxhEWMn/1b/miAUHUzYQM9vmNqKEIqF2CyPnU3VkZq22oN9Nf/460gD+i
 88mGSEJ8xhxau8g+KWhiIlQzZtob3EKHo7s1btBp+9qUuNDNI42L6Wz/BbVUXH9aHlhU
 r8ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi2q4dNULml/rtsn115HSH0qybXP8uHTlz5X0+PvIW9TvFEUHh/MaVdAWcHrrZvoW7yXs3690JL04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+TpNpRFl8kSf/z+ls2zOewxn68ikSRWdxk3bJPccSia/UAF5/
 G8Kql4dFxNrXyD9MPtFd+d+N69jgb8X6tNzphbZ5vfVXgjPBlYzB1CA8DXUQdGcK9JyhkhJUEaT
 RkitBURaiEih0krkCrshGN/zRqh4=
X-Gm-Gg: ASbGncvzBUVJ+W7cskHP1tY1LWK5WzKteuKss6mDmG98gkS1SJY27nERjum5bjUsSyl
 rfsqizw12JL/lVtnxZJwBXiuBpHAixsLy
X-Google-Smtp-Source: AGHT+IHnjY+2Sxuoh7d1Wcmkvzc3kysfXGBiGIRQr78j9FBJPnq2iZmfGEF20LZhC0dhpWjwOiR2FaJ4YhczzVfR9XY=
X-Received: by 2002:a05:6902:154a:b0:e29:1099:9047 with SMTP id
 3f1490d57ef6-e395b869ac6mr13767408276.11.1732965336132; Sat, 30 Nov 2024
 03:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
In-Reply-To: <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sat, 30 Nov 2024 12:15:25 +0100
Message-ID: <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit
 display
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 30 Nov 2024 17:12:55 +0000
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

On Sat, 30 Nov 2024 at 10:29, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +
> > +static int summit_resume(struct device *dev)
> > +{
> > +     return summit_set_brightness(dev);
>
> Doesn't the generic code already handle that for you?

Apparently not, I have commented out the pm ops, entered sleep
and the display stayed on.
