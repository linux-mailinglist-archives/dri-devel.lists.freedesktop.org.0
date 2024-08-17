Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB9955B65
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 08:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D2810E0CC;
	Sun, 18 Aug 2024 06:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fux5h6G6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7E510E063;
 Sat, 17 Aug 2024 23:46:54 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso22839155e9.0; 
 Sat, 17 Aug 2024 16:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723938412; x=1724543212; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l+v85gKWtxhzD66uOw4BW1TzyQEIvhfDX4xdo53zdhA=;
 b=fux5h6G6qv14fNGONCJqZSMcjz01O8VvT+7+PqrnUDECFGNv49QZvGQIY/mSUVuYWG
 gDGGn9HwhJhq9yVBUbr1oGRNrlbKvWASqzHcU+Sfa5b6doazrguZ2wvV4e7KHI2Q4DMm
 TUAfWa1byVz+Gg1v+neA4d6W0QQN3gUovqgnCqCHxFH2D+IyhGBRJWxNeENtqQ1MdIcU
 TkPG9aCu7H6u0QXIw5uTE3Me5TC22uUY+wcDA9/48Q/72lGAT5k5MeRkOzgXgHOsKjRl
 J9NFtDSEdTr2icjSG81qtep+BXvvERnaYAxiOO0csC6gfCSB1yAmuxTNFQLqo0+H6Ima
 xrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723938412; x=1724543212;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l+v85gKWtxhzD66uOw4BW1TzyQEIvhfDX4xdo53zdhA=;
 b=aWRRzp8rFx3wAd+puFUTRIAkalCgPYS8/MaxCaw7/L/RF250AoLp+wFEoHC8kih8Vz
 mi4kvxwvXJ54ZZNYkUuXVJTXUg9OnHjBjIwKfdo0QXn6InN5a7866LL4y2DGP0bm/vBJ
 D0ojQI+fAkglbNDr0DR2Uw4JQQYwgZ0GwFcl0jAVpYT40zddgsdWQO4Etsg1bR84Yr4Y
 nRmLqWMqleSs/9R08QEQdDSpe5Ym8vlV9SWIzTBCThWQ4f8vtRB4M8p0n2QKQ6sQTikD
 ChD0Sl9jlmYMs0v1nTOywB1EYCL3cjk3e22zP6rBtGgdPxaR3xFRUu9lsTg3QFAMjo3j
 mKZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGOy3FAUNK/XUQ7edpFNEQSS1qykGt2w+PCEt1u8n8HumSaVInsVb8wwtYab6DTOGKL4OW6VkQj5x9IKxOdDUqmgxdbZvFOkc0NgdzsVobQfU0ykixbAaokftUtNMU7GUQfGf8iaDLX9y2WRbHvQ==
X-Gm-Message-State: AOJu0YzmXU5wq9j1KZ3sWJI2kNZx/BImoidkYwvY3hABmImWhC8W1XPT
 E8O5S3uGaKKKmO5+oPyuRmhErRBr4phk582JwEvffS3ic3HIKj6T
X-Google-Smtp-Source: AGHT+IG3UALrq/UQ4xcK92W6vqfpkfsnEizhUqmvHtg/EglYTF6LB8XWQKQZog25XQ6bIkcF1BOx2g==
X-Received: by 2002:a05:600c:4f45:b0:428:1b0d:8657 with SMTP id
 5b1f17b1804b1-429ed7ba9a9mr49075005e9.22.1723938412168; 
 Sat, 17 Aug 2024 16:46:52 -0700 (PDT)
Received: from [10.33.80.43] (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945cesm60488635e9.40.2024.08.17.16.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2024 16:46:51 -0700 (PDT)
Message-ID: <1e962f52a2b1bb243227348dc998273eaf19cdab.camel@gmail.com>
Subject: Re: [REGRESSION] Brightness at max level after waking up from sleep
 on AMD Laptop
From: Filip Hejsek <filip.hejsek@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: alexander.deucher@amd.com, serg.partizan@gmail.com, 
 amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 hamza.mahfooz@amd.com,  ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Date: Sun, 18 Aug 2024 01:46:50 +0200
In-Reply-To: <77KAHS.13UUH2XVHQQF1@gmail.com>
References: <77KAHS.13UUH2XVHQQF1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 18 Aug 2024 06:38:32 +0000
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

Hello,

On Sat, 2024-07-27 at 19:52 +0300, serg.partizan@gmail.com wrote:
> Hello,
>=20
> After updating from 6.8.9 to 6.9.1 I noticed a bug on my HP Envy x360=20
> with AMD Ryzen 5 4500U.
>=20
> #regzbot introduced: v6.8.9..v6.9.1
>=20
> After waking up from sleep brightness is set to max level, ignoring=20
> previous value.

This issue is tracked here:
#regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/3474


> With the help of Arch Linux team, we was able to track bad commit to=20
> this:=20
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/63d0b87213a0ba241b3fc=
fba3fe7b0aed0cd1cc5
>=20
> [...]

This commit does not introduce the bug, it only makes it possible to
set the ABM level without requiring support from the compositor. It's
very likely that the bug has existed for a long time, it just hasn't
surfaced because no compositor enabled the ABM power savings featue.
Now that power-profiles-daemon can enable it through sysfs, the bug has
been exposed.

So I think this actually might not be a regression, just a new feature
that exposed an old bug.

--
Filip
