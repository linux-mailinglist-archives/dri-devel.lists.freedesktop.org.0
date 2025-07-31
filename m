Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77567B16AEF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C7410E463;
	Thu, 31 Jul 2025 03:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Krg0oBjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005A310E463
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:41:07 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso716856a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1753933266; x=1754538066;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QvnFRPkMsCEK+aaS89AQGekDsy5pWyg4qq7HlQ9+a4w=;
 b=Krg0oBjoMjahAV5coEi28eMspvImkfIkwmg46wleCiz5n7qUV50ChWRU74rf2QqDs3
 sZNmAPPcX+yJ2EEvfntDJ0TVfAC6y9sR85NZF3ZJ7HorZ47Yxt/eRx3ckQJuVTfNhGb9
 6v5lYk5u/BTRTBx1yY9uhazgBbGr7PZqINiIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753933266; x=1754538066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QvnFRPkMsCEK+aaS89AQGekDsy5pWyg4qq7HlQ9+a4w=;
 b=VqXtv0hobvInQLTnYLgKkN6lUDTjsIjgRV33dTu6z4kQFbKLt0TN3tpOYzgdUwjqQc
 tPkqDF8i5dbsGqzkikao6cM0/lky/UHkTtm4YWSyWFHmCUcQwTervuYPJHSbmzbpEfeW
 NHvbyRysA2Sg/S6sU4FEFY0uW0KGbkrzTLmwpKVxqg0OavXqwyfnZx8cibxlyb7JnZc3
 rqgjgFjktSwEFJCh7N3D8g7/OK1puL2DEaZPAe1t2RCfJIANIMJlj7U52FvYcHvzbPYn
 ymOQYGvAiciGi+zVdT2kVbh6axjQqCRse1UKRJf8OaecNxQ7vZsyuZ6RZZgzwgHkECLF
 /6lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJefYy9iZI2qFA811ml9hWozS8B1GrAnYpfAMt+yDC3rId8+i0lu+qyrKNQyx+SDxdx3j79ly8zpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw6IlogUkgD5jqO8oaS8xpV7A8+vfWQ1av8nsJJ9N2lIKPGDRt
 bNXuvPFf79OseCKAl+ASooM7jmnfXNt4WDGuVt4VnfISwKtqUvkTDNKikneJ6YVUEDhUsEBemT6
 /mkQQUac=
X-Gm-Gg: ASbGnctnrQaCF9P92iPyHL+TyVkvJFWhit55PvlAx3sOY66FyspFetvhuNuJd25VEjM
 Ii6ZtvslKSHp6V1LlwxjK3LFw8wMjQCzehSrQMWPL55S3CDglQKRknlTBz5YdUgXip+1QblNoZY
 4XZ0wh0NmpBFxcNP/9MO4e/1MVvWYZbP5k6yId3SZ0OQU1srXnP+pp7SDFrfiOOxco9qEhXJ1js
 /bgKZoMEIXqQbb6C6cs9p/APry6TI08+Qwk8k3Ug8kdG7FSQqGmQTbrFSRD+0w95TTRdgsSlwEp
 nxd2HkC7gSoNcXyeM0y6LNZXuG4qvTs1YLF8hDy14USA3LBWwMD+bedIewFYBt00lHHr5FNMMdg
 CCIOiV9cTD3VPoCORUSu/d5+dHXsquuptoEzk7Mb3meFJMsEQxEcacw5Dwvjlx3RnSnkyShZ9
X-Google-Smtp-Source: AGHT+IHDvO8KGFt/rLc80mMpZsvyPzPLzm7j24JuloBP9x1N/Tc18LEtAKR7vM9sZOlSO88v58jjzA==
X-Received: by 2002:a05:6402:210f:b0:615:a521:ddcf with SMTP id
 4fb4d7f45d1cf-615a521e02fmr2172296a12.15.1753933266141; 
 Wed, 30 Jul 2025 20:41:06 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe79a0sm475118a12.39.2025.07.30.20.41.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 20:41:05 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-615622ed677so631394a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:41:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXTIwVvpoctGsIC+lwaZFnZNndwyThf+1MklYSJDJdq0N/2SReMDCA/n7/DdKHjRAUnee5e4vMYSLg=@lists.freedesktop.org
X-Received: by 2002:a05:6402:51c8:b0:607:77ed:19da with SMTP id
 4fb4d7f45d1cf-61586edd68emr5405818a12.1.1753933264981; Wed, 30 Jul 2025
 20:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
In-Reply-To: <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 20:40:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
X-Gm-Features: Ac12FXwMPSRQdouGzuIRGoSW7QIrmRqrk5WhWBYQ7lHtHAufO7o1YAQXgYqXm7Q
Message-ID: <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.17-rc1
To: Dave Airlie <airlied@gmail.com>
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

On Wed, 30 Jul 2025 at 20:05, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Again: I'm not going to guarantee that I got it right. I *think* I did
> - I'm not feeling particularly unhappy with my merge end result.

I spoke too soon.

I'm very unhappy with the end result, because it just results in a
black screen at boot for me. No signal.

It works on my laptop (Intel i915), but my Radeon desktop is very very dead.

I guess I'll have to bisect.

               Linus
