Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A728C8C7F63
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 03:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488E710E013;
	Fri, 17 May 2024 01:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X28kIjMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B9510E013
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 01:08:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so226445366b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 18:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715908099; x=1716512899; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HKmYG8xCXUNt8KM3AI9ihqZhXFfndGJhx62ZDLuNUm0=;
 b=X28kIjMywWNaDNapfketMDEtWTmSTuvj5sWGQlU6lafYbeRi+uOfYibgfj2GeEN4Qf
 1ylApQRrkBT/AjbFX9bBxks6Ls4OcK5aLjiBXDCCo5OaaGyfNA78Fmb6Gch7/5mxWCuZ
 B4s42qdzSN3XAN1e6htsYF9A8ReK+NqHrTSE3N3uNbOk9AITb/OXPbZp1HtCyspnoSVK
 ddWq5ni+7EYZx+n9fog/eFj1pF2q9NltYzg7hlLZmYk3wteh7bmg7RpbsYyaEpXiqjrL
 +4tuPJTkfkuHbHB8IfytY31pc1sQrgtid6IIOY8tv6o/zmFgo3eS4uWLU5Ve9A1QHcop
 4Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715908099; x=1716512899;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HKmYG8xCXUNt8KM3AI9ihqZhXFfndGJhx62ZDLuNUm0=;
 b=wsklyle8VauU/ExFI0UsOGNhq48H6TAUOxjVR6omxCBSwrcsjXGrZk/SwD2bT1BD47
 vHQr9mmNtnVTdjd6WQZfyvL3HH8IWaXs1XTIeuXZLjAylkxCGcx1fkzwrDZRyGVZEZ0b
 M2InfufX8nppaea4PriZ9dU5qf9D/2nJowDgTH+ZuO5q5aIp06Dwsr6q5o+DH+0NIL8t
 OWeiCFpB/jvwEjFCiXDTIp4cg/4C3zFttU1OCZQI2m20aXPqp1ip+54xIl2diMwbCXtv
 WSrRkrIifMipVX5QpdBxfeUa/9z3gbGqaZG0PjItGgCT5of/4cu4oDf9hmF5Ue3YAlkK
 X4nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK6DeY0gRzESXsSvrlpn+tGiaOz+lG2CBL+7oLMjs18A4YQuvN8nK6iGkwunQbfyHgVs0i7O/RV2Clhyf5wJYSwsPYIzu0STfScSnQXnoN
X-Gm-Message-State: AOJu0YzTBRXq2xaVRpxzJvzv0CY2I0M/rFoxMi+wBvRIOUxbm8PhNPQo
 8hF0KnOZt0XiT5uLhdFKf3ayLxWrOhuZ/phGga3W7UKsLUaZQ0APsJUH1FFeJW1Rr+/of2kqITW
 y3p+jPS7TwNA4Kw95rzIc54Z1TcU=
X-Google-Smtp-Source: AGHT+IF0+yGmXXW46xFjjfGuDr19Y9YP8gbVSUnKUsgiu/201syTbQ+og4I51pzcxuN8vpMXdciwjKUIRK3J8YUSjY0=
X-Received: by 2002:a17:906:9815:b0:a5a:c194:b53d with SMTP id
 a640c23a62f3a-a5ac194b61fmr496160666b.20.1715908099037; Thu, 16 May 2024
 18:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
 <CAHk-=wjdyimk4t2C7xfqLYFX1HUH92yTRTFQXAitJJT+REvF3Q@mail.gmail.com>
 <CADnq5_NmC9bYkPFUD35gBtxsk_9jYhOTugni-q4WGXggf6=rLA@mail.gmail.com>
 <6225ecf4-f4ca-4ed7-a316-69c86f4ade7f@amd.com>
In-Reply-To: <6225ecf4-f4ca-4ed7-a316-69c86f4ade7f@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 May 2024 11:08:07 +1000
Message-ID: <CAPM=9tyJCJ+D4h7BZ3dBpm6R33gTfwtigDtmt6g9KX25Jun9Hg@mail.gmail.com>
Subject: Re: [git pull] drm urgent for 6.10-rc1
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
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

> >>
> >> (And that kernel version of "6.9.0-08295-gfd39ab3b5289" that is quoted
> >> in the WARN isn't some official kernel, I have about ten private
> >> patches that I keep testing in my tree, so if you wondered what the
> >> heck that git version is, it's not going to match anything you see,
> >> but the ~ten patches also aren't relevant to this).
> >>
> >> Nothing unusual in the config, although this is clang-built. Shouldn't
> >> matter, never has before.
> > Arun is investigating and trying to repro it.  You still have a
> > polaris based GPU right?
> We haven't been able to reproduce it across variety of GPU's. Would it
> please be possible
> to send your dmesg logs and kernel config, I will check this on the same
> GPU you are using.

I just installed my RX480 polaris card in my AMD test machine, and
with current origin/master
I'm not seeing this at all.

Running an F40 GNOME desktop, doing firefox etc.

Linus, do you see it a boot straight away?

Dave.
