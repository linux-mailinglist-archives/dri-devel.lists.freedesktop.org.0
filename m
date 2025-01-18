Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86EA15EF1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 22:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328B510E128;
	Sat, 18 Jan 2025 21:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qoJbFrHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453F110E128
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 21:36:24 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30613802a59so34487931fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 13:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737236122; x=1737840922; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4pAHJkXoFZdgHisVUkzvL4I/Edqgv9mE3mnJ+Lw62oI=;
 b=qoJbFrHSqiu6bQ35GuxdPLt5Qj5LCPRtkb98Q30OAvcChVD90QbnbKdcwuD/zZnZ4Y
 6QpQdN9BriEbnGhCPSeh2wcCXFbCkafYe+D4vgOHyO97q5pPizHRgpLdyzmbvo4SP02P
 b5n+Dfoc6UzQi/iRqcRImHRn8F5tHSkJET+QAb8OzWfkPNhkde3e5OASYy3ppkApJvV/
 f3OwAsBTckfeYFrvRypt9WBNB2JZXzuTVZvOZztMmWd6at4sOdcLtx5BCgFSJotQJZXk
 lAZRy1eN5KVp/9V6msaWqq5kbZmChdVCRz+hN3vFE42EY7a9G6vZcq7zdekR+i/gdip3
 LOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737236122; x=1737840922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pAHJkXoFZdgHisVUkzvL4I/Edqgv9mE3mnJ+Lw62oI=;
 b=KBX2ToR6qaZpJArVoiO5dC111DXj3ke/EDjjaGW53QuaddDnFLXtz4L68D2P7V4Yzq
 plcFVd02iC4/7uF6DYnsnrbTeU+IbdGVSevqHAbA0Z7TOUdfvkYW6es2xlDK2rxzN4p+
 JPvjX4gkLR9mYhO25tBnYYRDinh/Xgfo5zCzONnG64QAUTayOQKGqaazeX0ypBWTyKoF
 qvF3qyymAgpCtyzIqaCqAmKpNZodxEyKsElRQNEWQ1PFXDA31zRp8i2pGNS6GK6jjjdi
 EIMLmI4GP93oGZTCC+AnUu07ygHX4+cwefiKS2Z/LuEVztdMV+lJojRFsXYREV8JZZgV
 AM5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLMNRarJ6SqAlJiRK9sIW8ckdfw39HK8s91HpuDA2qyHSgTDx9PvOSy34XnakTXXik0M9PKQAC8Iw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJj0MD0+U272NjdHdoskFnmkyAQWGkYMNoMquPjMzzJm3TP+ff
 9VFHsQyNW4xgT3YDhkGoXee4wFdHEFpmwgSrjn0mh/SCLKdQVwkQiMMmgQTZvoI=
X-Gm-Gg: ASbGncvQ+WY/ZjZG7kdwlyiYUUr2qSHs7T3wcPIzzfyT2m094FKblURrvJKE0/q7vaf
 nVIvpdUbzYuoJfalmN/Uy59027N44Tb5s0iEax6FHpj0suEScusYIJur3YMFUvxzqof/HuEww2+
 LIO067dRAPBdqqAVmel/EFscybZgRTVt60u2MgNkl8vWGmR9uf3fw/XAce+WSECU/a6cDeND1/w
 IQnVG29nPUFbTrM3gekxlGMqEE2cAFwhZBr73UEoUSD1v7tAw9RH2i6Jv4NPYbU6qCxJy/kbHcC
 dzbco7RIZuwN+fmEofflqPm1a0MYU9UUEtf6VRNzs5OPc1fp+g==
X-Google-Smtp-Source: AGHT+IEe70NKsSNS6vODeZanfRqTTZhK/r5j+Z3Dmevq5/rL+i3YM7BD6wYBdurTwDfOej9kcBleRw==
X-Received: by 2002:a05:651c:896:b0:300:1d45:871f with SMTP id
 38308e7fff4ca-3072ca5bce5mr25037041fa.5.1737236122551; 
 Sat, 18 Jan 2025 13:35:22 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a3308edsm9034701fa.4.2025.01.18.13.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 13:35:21 -0800 (PST)
Date: Sat, 18 Jan 2025 23:35:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <r56ycfx6eeampdduxy65v7tczwyfzgh6z64wmvivlxzt6ww2nk@6y7otqj5hoy5>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
 <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
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

On Fri, Jan 17, 2025 at 03:17:32PM +0100, Sasha Finkelstein wrote:
> On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > I was thinking about using drmm_ here, as the DRM device is also created
> > > and destroyed each time. But I might be mistaken here.
> >
> > Ah, right, it makes sense then, thanks!
> > Maxime
> 
> Not sure i understand. The drm device is created in probe(), and is
> destroyed by devm.

devm on which device? The bridge's lifecycle is tied to the mipi-dsi
host lifecycle, while the drm device is managed by the display device.

> I do not see a path where it can be created/destroyed without a trip
> via probe/remove,
> and so tying the lifetime of the bridge in question to devm seems correct?

-- 
With best wishes
Dmitry
