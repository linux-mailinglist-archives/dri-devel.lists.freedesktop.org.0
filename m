Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC39FF0B1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 17:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D0510E686;
	Tue, 31 Dec 2024 16:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QoJj876O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE8E10E686
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 16:31:36 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso121665391fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 08:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735662635; x=1736267435; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pTH+bAJSzpgoWndRSpjtT7/xfnjopb6ppdZspOes9Ps=;
 b=QoJj876OUcHwSA7jqSoyIiu7IL1ps07fi8fePnAxJz8DBbA24sAhq/fwGd+XwhjL1n
 EyUcAjqI90HZEgBgn5PEx/sF6sqjh7Y6lde9grouXtXaa2lEF8HLsBVIFY14NHnEwLwX
 VH78/Nw9NJJb8UGuYo28Y+t9xImGFpre9c3uuFGRJd0zQBGYzP+emPHJZtsPKRBpZOHA
 dAMh/luw2a9aAT69JnAald8oVgL6mYyRmf5k28BXdDmOCBZ0M7K/cNAzhxyKY4jD+Ne9
 FWU1vikdzPxMwpSDR/9Bp9KnE0g1Kz4kAXImwCKWxgcHJ7eKuXuaR29lwcRf/HRbv3dQ
 RhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735662635; x=1736267435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTH+bAJSzpgoWndRSpjtT7/xfnjopb6ppdZspOes9Ps=;
 b=d5u/J10t6fzTVN186zphxoE8XO97jkmEu5AueZzeaKcduibki57IyUZEltn9pycqEk
 Koq9Ir8OsU/ETzHTuQqVVRJ6Nq9RGiH+bpN0uDAnkC2C/nlDAM8NGnokm52SIZ3H98ND
 wMtAajm8EBBwyieFiN6hkhJ7GyWmwA3q54uuVcu3mv3tfMXM5x4KKXJd37v4KHgHCzjk
 OQo+H4W17l4KaNmx2ZQ0N0EwyxBR2ymOOu3oKxbvFRskzQa2qdXDPb3wR5sAD2f1CzXi
 LPy5VKlmb2nw+9UpR3LRP8oL1m1tf316t0meoe1S/oIxTM8RePntuv7gxCYa87MEthYT
 kBpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsV9LoxoXUxGOCxIUQwnTe/mN22c70+J0ceA5LoR1dc/eZ4RVGS9eYkimOr5vUZu6Fz4tI6u5Cte0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuGbqvvHczg87O3uQp0ehO91a4kPc5vpmBnD7Suw6MdLABOMdR
 wx35v0FYUkFT7OqEtZs654zQp2csANUVHPGEl1PUYqAvgAfbj6t9JTYyqCq0OTseEpItGsCJfSj
 F
X-Gm-Gg: ASbGnctgFa3CwVhSElpJvCQhpqJW0tfno+hQ4TrQg9IMJWLO5ezga5YTbs4JzgCLL/3
 AtB+oPARYPOKCbL9pbrknBHJz8qydAvJkE4e3RV+OqiI4BLsD/drNWwSQLDpWJGMOVurqxq+WvS
 Hfm1gBa4ZgOOd107GzLyYdPLbLbnDbV+mMJZ/jgGBj9TUoIwuNVkbZLFjU7r/w4gCAfYYqJRb7J
 wgTc80niGGz7SjUb+G5AlfRA8qaaeio5HvrsyUooBMOorKTUpN8kcfrToS0mKpooIqWhSH8dwWZ
 DsUkGX0IQ746T5CKStH0iyQ477Q3wcwoOUJb
X-Google-Smtp-Source: AGHT+IGl0hH1p91hwEmbFBdcADSjDINAmF4jWx3tCZ6EzutKUe6U0F9RPqSn7oC1uhJtOG8quQ2NSQ==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id
 2adb3069b0e04-54229992e47mr13771860e87.24.1735662221517; 
 Tue, 31 Dec 2024 08:23:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f61e3sm3418708e87.42.2024.12.31.08.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 08:23:41 -0800 (PST)
Date: Tue, 31 Dec 2024 18:23:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Set SPI .id_table to prevent an SPI core
 warning
Message-ID: <vrk6nb6umj6754ttm6hugpgiczzuxm2qwpzwptskwdbzozmnjz@tbasj7yk4ksf>
References: <20241231114516.2063201-1-javierm@redhat.com>
 <p2hzb3ysmthgfi4j6ehwulzk44zf4s5d6bm3nqs2rww47boshl@jr6aqmas4l5p>
 <877c7fkgs5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c7fkgs5.fsf@minerva.mail-host-address-is-not-set>
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

On Tue, Dec 31, 2024 at 04:34:34PM +0100, Javier Martinez Canillas wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
> Hello Dmitry,
> 
> > On Tue, Dec 31, 2024 at 12:44:58PM +0100, Javier Martinez Canillas wrote:

[...]

> >> Since the check is done even for built-in drivers, drop the condition to
> >> only define the ID table when the driver is built as a module. Finally,
> >> rename the variable to use the "_spi_id" convention used for ID tables.
> >> 
> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> >
> > Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")
> >
> 
> I was on the fence about adding a Fixes: tag due a) the issue being there
> from the beginning as you pointed out and b) the warning being harmless.
> 
> But I'll add it to v2 or just before pushing it to drm-misc-next.

Just before pushing is enough. dim b4-shazam can do that for you.

> 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> 
> Thanks for your review!
> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 

-- 
With best wishes
Dmitry
