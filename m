Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC6A141DB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 19:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1646410E21A;
	Thu, 16 Jan 2025 18:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cbi+4I67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F9510E257
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 18:52:41 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so2480936276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737053561; x=1737658361; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=epUccpjDGRE9EuJbLES1VkaNPQIRZSalTXoKeOQ8Ry8=;
 b=cbi+4I675dv5GnYra4hkP9q/syBNJQV37QSVK69dh2gg2j89Q1/mJdrLB3k6B1r0F7
 Xxfe0gPTakEcbQQz7WTpGczepSR0fmWyIJ9XMU2nvAxSHZxVlC0XZxUJgChcfBrhxuYG
 Hrxk0dBNRsLIESiug9unXNksV7u3PiOw8CX8CIts7SuL7q+m3e+44hUvP8Gk4a7TZLzE
 ErnGpKfpDU3+LiliK6b4dsN776ZocKlIl1Ml3cNc+oV67kdaxMNeOGV8RFbNplT5p27w
 BinTQFLO1Firaq1i8Oh7/9Mw1GWiyfSwE5BteD9toF9ovUQtEX+Bkg/q0ALOXUriuDN0
 NlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737053561; x=1737658361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=epUccpjDGRE9EuJbLES1VkaNPQIRZSalTXoKeOQ8Ry8=;
 b=XPrgztx6YWgGCMICRVMyzRYU5N7osa2+Qc89Ur6VRlGWaucG+7RRWzWMMtHHlSA8y1
 M7R8pN6sM8pAtXg6dP2Y+myUbFHh4WxZKbeUsbAqWf2XMrWzsTW8GjpIf5HBC1PzLAJC
 lq5JqNqitlrNSxcCZCfAgWSWhalS/UozBQaD9vnLCtitwlMXPb9FcQ3Kx3sIukNnQhpn
 UNMOHlCcjdHVZd2nKGI0AQ00uTi9BQcND4Y+GxMVhRnBMXQP9Pz0sKvtPGRL9GIHQPb3
 gX2QrkwLFF3A/5k0iJFkDpkoXqN+P4R7Z12At/c3DTfgVfheG9vDUClbC3Sh8n6UB5Ev
 bzvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Hq6/Xf+ovUb91z10J5Id+PWhzEEtxMOV0nHaC7FqNoWTSe7+h+ZiocuhcsYwpMv10jaQNkIxGdI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHlPh+lB59YQzDNRlIorp3wRkBXDAzvmpNS3vg5ZzTYwwJnawY
 NTMrrbzsEAyzM9zu0cfWp24Z9hICsIqnX8XbwGtVz/OcXZTtZm0NUrJ8/If7TVyez48da0SgMis
 VRExkvHB3BH9JLvMnm5HRh3pjnGI=
X-Gm-Gg: ASbGnctgEr4VIVHyAKE4msgcdvey1lI3UhC/GGGKvyEzJmpvX5Hq3Kkdq/J665RFfSJ
 MobS4tvVe4/P0ZtogQkZbyE4EUdFVbEEP+SehmTc=
X-Google-Smtp-Source: AGHT+IG/5CjKhXh96Nk+XB/+aMWTA4imIkKzPQiupTR0gI1gGVjVyFbBQFaeqBYVq9D6f+2cUD0dR0X8JEvKu0ia5Qg=
X-Received: by 2002:a05:6902:a09:b0:e57:31f1:9722 with SMTP id
 3f1490d57ef6-e5731f1a429mr22183513276.29.1737053560928; Thu, 16 Jan 2025
 10:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
In-Reply-To: <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 16 Jan 2025 19:52:30 +0100
X-Gm-Features: AbW1kvbipHKJwElTaiGLwN0S5Fv6wP5xVACM8b4oZ-wh_e88VZ8Pe5kxngHqc80
Message-ID: <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
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

On Wed, 15 Jan 2025 at 11:21, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +     ret = drm_simple_encoder_init(drm, &adp->encoder, DRM_MODE_ENCODER_DSI);
>
> This is being deprecated, please use drm_encoder_init() /
> drmm_encoder_init() instead.

I seem to be unable to find any documentation or a mailing list post
to this effect. If you are referring to this patchset:
https://patchwork.kernel.org/project/linux-samsung-soc/patch/20200313201744.19773-3-sam@ravnborg.org/
according to my understanding, it has not been applied.
In this case, the simple encoder api provides all functionality i need,
and a replacement would just be a simple encoder, except copied and pasted
into this driver.

> > +static void adp_remove(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct drm_device *drm = dev_get_drvdata(dev);
> > +     struct adp_drv_private *adp = to_adp(drm);
> > +
> > +     adp_disable_vblank(adp);
>
> Isn't it being helped by the DRM itself? Anyway, I'd suggest moving it
> after DRM device unregistration and shutdown.

Not sure i follow, as this call disables generation of vblank interrupts,
shouldn't it be done before all drm structures are torn down, to prevent
the interrupt handler from potentially operating on objects that are in
an invalid state?
