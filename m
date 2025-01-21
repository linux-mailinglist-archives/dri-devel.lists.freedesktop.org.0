Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB5A1883A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 00:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9D710E645;
	Tue, 21 Jan 2025 23:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YLO4JiTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E5110E645
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 23:15:28 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ab2bb0822a4so1221509066b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 15:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1737501327; x=1738106127;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3CzgTo91p2JzpEW+JctKkaLkKIND/CdJFB7oWX/HWBA=;
 b=YLO4JiTtvrBCwWaTfU11QpnFvDD4pKoAbMxFnIMcgiEzFiiTkRkgG6W6W/Iw5rLYqU
 j1ogchRDOYqFQJip9bVu47XocAGe/R1mB+2BMniFAlW0PK+jgJpRHoCdt3C5z31yZWZ4
 9A8hrRpKhLX5lUzLx2yWO5Ylat6XjmBEvLGxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737501327; x=1738106127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3CzgTo91p2JzpEW+JctKkaLkKIND/CdJFB7oWX/HWBA=;
 b=boNOC73pR40Z5KcVXlfc1rQtu4eVP83q1VdSZ6GB6IoXPG6seVTmsSNJpcP+Wge7Q5
 Hsh2kEQQVOVt2KkrGUa+0yYY/4Vvx0goeBdtyh5Owe8IRJdTmL9vhEL53s2Sg/o0UmZe
 EOwuKK97AjJnyQkrioVOmNc80aNH2pizQ1VwWZ2oXakjB7o7lcqGFlX4RSO567R8IoNp
 L74TRKeD0nIaybKPzctTTo4D4hf7wFzm+gHH96gSzkO5a4yJMYdzXctebO83nCOu+3ED
 twmb7KY4es9bdp1C+k2GADa8HEbjNTHMLlJudUEoUh0X9mtAJMeRMHJsLPV//nzNTF0L
 gBAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXthVaa4r9P9PDe2Oz0ekSkEpgALvGd+YOIfLg4UfLEjcf3hb37J9h49P+i6RgMXKr0fccfGm2WuQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yweiu6Vx9a3FWzEBwTVmDHW0/S3mw4JMGB9QmDgX7YdxsfeNSqP
 9C3gW1S4u9ba5GCnQckJnjy6gziM9x1+z1zVNTsUaCZkRGaeRIv7On4glWQQ0wW6+P7FB2B9phf
 chVc=
X-Gm-Gg: ASbGnctGVWyTWJavtygOjDOIUqOoFnVyRHNCELCQrPKNnHyTE3Nyzf6I3vjcErjUvXG
 f4pZfV/BEHjUe5fkN7tUzd4PR0rSkmiNKiTfxwTo8BsDztnjtlBx8NdvzumIvB+DjN+6I1wumjt
 1ogSOlRSabQRyHsswqPMq6PppKG7a7Jz75IGUT0PMjPp7XV/2ATFGIq8+PoWIu7pazwu4n8j+nS
 urX7TLhdKJmLKCeyxkvxjp5q4iX3/CKJ8LD0Cjn9bYPGpPRp8S4nnWnTYPref3DHdrNVGg5MxsC
 cgk5AU7rrDbzvVSNhrwH66UW0SQ2q4mpw0TNEpbMRHz0
X-Google-Smtp-Source: AGHT+IG6+RaoNDXYEquFXOzMBBQGjznTxAGUKNTnL1UH3w1vxabCCy44DT7gMoz+QZUNx4J61rx1fg==
X-Received: by 2002:a17:907:969f:b0:aa6:6a55:ad81 with SMTP id
 a640c23a62f3a-ab38b3791c1mr2307149966b.41.1737501326788; 
 Tue, 21 Jan 2025 15:15:26 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384d2df47sm807453266b.85.2025.01.21.15.15.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 15:15:25 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso1203364966b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 15:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSlIjUNuN4ABgfh37qlGDTkkKhb83njrkz5RYol6Tev3dd1PKppM+grjxMS7VcW8UchG4W8aMJp84=@lists.freedesktop.org
X-Received: by 2002:a17:907:7f03:b0:ab2:d96d:6364 with SMTP id
 a640c23a62f3a-ab38b10ade0mr1648380366b.18.1737501325402; Tue, 21 Jan 2025
 15:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20250121145203.2851237-1-linux@roeck-us.net>
 <Z5AmlJ8stVQ4L5jS@intel.com>
In-Reply-To: <Z5AmlJ8stVQ4L5jS@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Jan 2025 15:15:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
X-Gm-Features: AbW1kvYKV26mhyqOrtUvp86nodxXf2uwO8fs5mpSdjqoyzGKlqO6hShDhX9VCRY
Message-ID: <CAHk-=wix3Rgt+8yBHDdeb_F+c8TzL5aidtCiUEpF+TBc6SCLiQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, David Laight <david.laight.linux@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Tue, 21 Jan 2025 at 14:59, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> I'm pushing this soon to drm-intel-next, unless Linus want to take
> this one directly to his tree

Let's just go through the proper channels and go through the drm tree.

Unless I've issed something, I think this is only an active issue on
parisc (and only with certain compiler versions at that), so it isn't
some super-urgent thing that needs to be expedited.

Thanks,
            Linus
