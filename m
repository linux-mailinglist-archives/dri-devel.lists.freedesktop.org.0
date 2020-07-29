Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6D23196B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257FC6E444;
	Wed, 29 Jul 2020 06:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D446E444
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:20:23 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v22so5762665edy.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 23:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ia4b/DRy+OghVaxZHcJHUZh7vgLvFo61VOPY5ySdu1k=;
 b=E06M1u5+/fEyZ5KZW/a0C700hj1M6UVdqb8uhDe+KF5m1nzya51is7/2E0mBsJ9gaQ
 S2m7GgLpxGUGNNY7DAoWbIY6FlpbFTbnRHX/gosh3DuiDT2cXBuWkf3zMyo9sirZyJ5l
 QFkORC7exgohfYXzt5niKo49bOwjs7qvBXXR3i7bOsyUKPqX9Qqi/ZGE1PBAwFbO08Z2
 7Vj58Ako9V0c3dB6CuK0cSSm6cBoVhZTp03JTJV0HzC9K20b1QiNodHff4JCpFnVwYG+
 Lms8cIzMWQ7kVkO2lTjEVuNNP3HdLxIdXEHDIKISwNPhaS1LbrYh3UY6JW1n8v6I5guf
 rSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ia4b/DRy+OghVaxZHcJHUZh7vgLvFo61VOPY5ySdu1k=;
 b=iBZiodUpBROeiYPH9flMa6X6UUtIvQcNB7xgSlYXvYZQfaLI8fb/ACJM1PNQl92Sb0
 hSgbpxrY4vORC3/NqOenhCKdAA8ru0TnjOncCToWakAZ8q37dDyDmNzt6JJayj5EthKy
 7z/bMXk/gTYqUcbXl0pm1IlOeaill8pQgyTq9w+jnyDMFIMKaKyr06G1/kXLtG5v9wbt
 7rZCpeKfk4zTJH3oEX4tBPi9zGbHGC+grivMavO23vtFTbYFROJ6qsAwEncZl6ivAGon
 Lo5oB7sadrKTdnPWJfvFC6haMkBYTiYYh1zmu+/ShgbU9WNIoacrLGCNZ2Lt2W0PGsOg
 eYNQ==
X-Gm-Message-State: AOAM5308NN0iS4IVYas4++zBgEazHQin7EQ6FyLHAzRDuZT16oz/QHVB
 LWyrExsWSg4ZF54TTl8JTMm71y9oxHIv4htu1m0=
X-Google-Smtp-Source: ABdhPJwPCJ2xGQhQ+uUCtq7plJb9bkcOyI1MPxc9Cn2uB9FbI4tvruWuM0s5aHn+N2ttJG1LUn7BJ8tnOUoHTaWaxAg=
X-Received: by 2002:aa7:d047:: with SMTP id n7mr21742107edo.78.1596003622344; 
 Tue, 28 Jul 2020 23:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <201501212056.ACF39099.FLVMFOHOSQtFOJ@I-love.SAKURA.ne.jp>
 <20200714091305.11255-1-gujx@cn.fujitsu.com>
 <e63d176e-9258-d35e-78be-cad10c470074@i-love.sakura.ne.jp>
In-Reply-To: <e63d176e-9258-d35e-78be-cad10c470074@i-love.sakura.ne.jp>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 29 Jul 2020 16:20:10 +1000
Message-ID: <CAPM=9txvzLfMG1GytVC_47+LF23HaG5TtJfe41MQN0JUp=Ap8w@mail.gmail.com>
Subject: Re: [drm/ttm] Memory corruption problem when ttm_tt_init() fails.
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Gu Jinxiang <gujx@cn.fujitsu.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jul 2020 at 17:00, Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/07/14 18:13, Gu Jinxiang wrote:
> > I've encountered [BUG: unable to handle kernel NULL pointer dereference at] which has call stack like your pattern2.
> > And before this happended, I got a lot of memory allocation failure warnings.
> > And my kernel is 3.10.0-327.62.1.el7.x86_64.
> >
> > Since, you mentioned it may be a bug of drm/tmm. So, I checked drm/ttm for possible patch to fix this problem, but found nothing.
> > Could you please tell me is there any progress of this problem that you detected.
>
> I'm not aware of any progress on https://patchwork.kernel.org/patch/5681611/ .

Just found this email, I've hopefully fix this issue in my drm-next tree with

https://patchwork.freedesktop.org/patch/380782/

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
