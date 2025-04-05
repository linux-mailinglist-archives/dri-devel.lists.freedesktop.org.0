Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67FAA7CC56
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 01:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B7410E19A;
	Sat,  5 Apr 2025 23:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WrfHUjfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB3310E1E2
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 23:18:31 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac41514a734so554812766b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Apr 2025 16:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1743895110; x=1744499910;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qhf/rx7t8bMwyY/f1Kp0rJLQEBrQ/aBJkKwcV4l30K4=;
 b=WrfHUjfo3YP2LIBKyozBArTs6RRwcale6o8WLIGMv2BSPBNeZoUJ8Eut0Ve9kHxF1D
 DGY6YxG23A9od9RVDjKbZXqpn21rW1b0JNDNCLcpkk04xf2r/lqMjMufmMork8Ta6uQl
 uhHFoDVC7jjeC1SRemKn50218q7DRSXXJnZm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743895110; x=1744499910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qhf/rx7t8bMwyY/f1Kp0rJLQEBrQ/aBJkKwcV4l30K4=;
 b=azzba9iX9KyEwcFt5dWstC0+odR6rx+XUpTWI5VFwta9hxiADrGcbTZSurSy0JYu4r
 4clGmSsbC/QbXYASvu5ewjNhealaGyD7h61s0gHQ6OwRSFXCH5gBknBgnJ+InmPxyVUU
 pf37Wh1qvyGgs0hvLnYUBG5mZo8VAoPdylQBrr12D7JyMN3EzxeOq6TSprMtEmFeQOIY
 8D6bKClmoAXaX4W9vSggSLUOLHT7DiRyh4vlVhoURLGk/JBt6GiQ0+3oy+Pz1kxbA49y
 J2neBxBlkO7fgoZQc+dmD+TQwKNIbXVdDcPIIoyDSFvz3sLPciyWTcocggxf4Q9lKCGC
 LDGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgKEwKkVhRlpZ4AM59DWw78wnk5TEWcge6e1H2q7F+9xg7A80wojcwipgwc7i6lrFo4i6C1odkhss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/kRyNZWltE0Jy2zmNnUwwX515Xx7Qx884eDxDnDmeslGUA5Eb
 ZKHFfsvP1c3HhtENQ7R9C83UT7HxWQ6bvLD9dZw3JgbLXlkRcXRbrGLN5PgS62zebOneGmPOO1W
 dxGo=
X-Gm-Gg: ASbGncv05kC5Axns9cwiqAcGUtPvAcNqsmNgbPbRwAANA+5l3WSfNCRB2/5GTSfr3sR
 U8236bqQXngfJSr9ufvHJL32B6LSJjEyU7xJdgg6mqryVtl6K7ebenQ93pJNa21G8qlfybb30eZ
 Ij8ZLxIAGH3bBEeVWWC9oj2ZyEMZsYGG+dZ2nYO1P8Ulih9ssykCql83SkdwzhKXx66kroYBF7F
 4f5XrYgIbSl5rQnzEPDq+1bHmfX4sfCcXD/Vh7iaFAonk5b1TZ8As13kDxzcl03w5nfcVnBjXC4
 XPatEf7ceNSoS51UHBI2kZmXM5AMPQuBUfalI61d25ewAh8scQorXfMDFO2L2Ev2sHR71oQgAH5
 J5JRnjgjwqqJLk6At3SE=
X-Google-Smtp-Source: AGHT+IG2bMenaR7Gp/LDzBSBaQGoglulWgUA8/9yCpJkarO91BjdKc85dd7Bq9I6tB97nWBgNdPOUw==
X-Received: by 2002:a17:906:f5a3:b0:abf:7af6:ea64 with SMTP id
 a640c23a62f3a-ac7e7651b43mr356982466b.45.1743895109739; 
 Sat, 05 Apr 2025 16:18:29 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c013f2b4sm486060866b.116.2025.04.05.16.18.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 16:18:29 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso535276866b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Apr 2025 16:18:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5sezqQ2x8LnlCp4vGX2QRZ5ZAwTWv2z/+XybP01VXJIM25NwaUYodvsIO7FudXbDQZ+gzAeBHBFI=@lists.freedesktop.org
X-Received: by 2002:a17:906:81d0:b0:ac7:ec6f:a7c with SMTP id
 a640c23a62f3a-ac7ec6f0b0fmr227244666b.13.1743895108623; Sat, 05 Apr 2025
 16:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
 <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
 <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
In-Reply-To: <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Apr 2025 16:18:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjcoeRQ2ywrcY=1eYRtYgye65eG+eiwgKc-hEWs9rvLCg@mail.gmail.com>
X-Gm-Features: ATxdqUHFMm87zCO8Rc7Je2B4WCFw6-4VH0NK94B5F2-ank9OPYFEmgzZhqqov1I
Message-ID: <CAHk-=wjcoeRQ2ywrcY=1eYRtYgye65eG+eiwgKc-hEWs9rvLCg@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc1
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Sat, 5 Apr 2025 at 15:34, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Does any of this happen to fix this (repeated a couple of hundred
> times each time):
>
>   [drm] scheduler comp_1.1.1 is not ready, skipping
>   [drm] scheduler comp_1.3.0 is not ready, skipping
>   [drm] scheduler comp_1.0.1 is not ready, skipping
>
> which seems to happen on my machine when the display goes to sleep and
> then comes back from low-power state.

Seems to be fixed. Knock wood. I'm not entirely sure it was 100%
reproducible (and it wasn't just the display that went to sleep, it
was the whole machine that suspended).

            Linus
