Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E966CA1517F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 15:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE0B10E2E7;
	Fri, 17 Jan 2025 14:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dkxpQ9vv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EC110E2E7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 14:18:44 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e3c8ae3a3b2so3080774276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737123463; x=1737728263; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=;
 b=dkxpQ9vvQd5XC+fuZ6nfpIu8Ut7In4cw/edFIF/iyWPpy+3KnzVaHVaWkvkXLPnqpd
 Di86Kf4W/sgEg5lL8gTTVONOxGpO43qbkcE1AGqp7FoG+yJzzHQYrp/UTS1ac+7iC84c
 4gjqVxqeyuWNqGsYFRaobj+lIW39HurDOpnrl4gZMkr4kEfx6EITfPyt4cwF6udcd/Vk
 kO0nW3K7BhWhUD1rspEBWgvay1TGChHLHQZ1jx2mtN/PZ+8xu2JcQo5jCDzBMHDwPOzj
 tNo3tRuC2cgNRxO825vs2Xw4BKpOAN7o4ARgfs04MCOIPRpWPEjsnLYn67oiSTQSCr/z
 i1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737123463; x=1737728263;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=;
 b=A6tLOgkE7KwlfIUkYUZMW9ms6nKv6R2t47PBuTKeEZGDv3tfVqGL0lsgNYrDlQch70
 A0puhylvWARXYTtQI2Z07HitKdXUE2C+pvpPK1KiTNV7d69TxExwGkkCn/PrsZwkBR6j
 jmLXv8mi61LZcRDpJfBDByoIwsWblEAtTi9uLK8PdZA6GQKAUutciMWex5NCcJsjRiCr
 g0xXI3DPxuQAV99egOC3pG3v3CA/lTAAtiySlvkSVx356ksYGjXUICaGAGrCUc3NYZhi
 Onz+MkvpIenyXJ6xTRBoGklKW6i9DYf+h7RkrN5lLM1M7xGJCJFwPhRK+OqR8VVc8wPF
 wt4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhafj0VvVHA0v4dBkgZwx708CCoH6GT2XF026t8Vi3EGw3RHswBFYTyRb1ENWqTFHUXf9LeFqaonk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVsK+9vk/hw8kZJA8l9yGt26srGCDfHDNw5fbZwdhT1+x/2PLt
 ob/a3u23eqQP3R+ms0tR2IIil+Mx90LFmoJn4vaZYz8/ZfNaxlw9zIx6wxt9ifb2oOE3WNlZEnz
 GuZZ6Em/tgnkgjONCFopnmRPvTjw=
X-Gm-Gg: ASbGncsCXJz/jbuKshKUgz+MOLIc7gYLYIxki1RME5oyMLlmL4V9bWliYxtPrNZivUZ
 ESEveGKHSrHQhGDNZMB610cGbOnwSS3hs5A5GNg==
X-Google-Smtp-Source: AGHT+IEgzT2Y8X/d+HOguRWOezTmCdaDrvMrd0xyuzC2YC1+k0LNDI0M/Oo8/mnNOxO0+kIgTEzO5F/+UdmBoEnNI4E=
X-Received: by 2002:a05:6902:1b0d:b0:e49:e085:c0b4 with SMTP id
 3f1490d57ef6-e57b104668amr1782609276.8.1737123463394; Fri, 17 Jan 2025
 06:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
In-Reply-To: <20250117-neon-unicorn-of-plenty-bbe639@houat>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 17 Jan 2025 15:17:32 +0100
X-Gm-Features: AbW1kvbN_g2HyuopLeZCoB8YJ1kzXFaQ1lvT6Fub5esd6CPjCjqmkvDJ9dDJO2Q
Message-ID: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Janne Grunau <j@jannau.net>
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

On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > I was thinking about using drmm_ here, as the DRM device is also created
> > and destroyed each time. But I might be mistaken here.
>
> Ah, right, it makes sense then, thanks!
> Maxime

Not sure i understand. The drm device is created in probe(), and is
destroyed by devm.
I do not see a path where it can be created/destroyed without a trip
via probe/remove,
and so tying the lifetime of the bridge in question to devm seems correct?
