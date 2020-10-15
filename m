Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C177528F42B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 15:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59AD6ED21;
	Thu, 15 Oct 2020 13:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E94C6ED21
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 13:59:41 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c20so2078620pfr.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B5Z9U2pjRXxai+O0+8qnC4hYUBYk+Ovi1UIah8Pfnh8=;
 b=CCyQ2Mo6dpE2+RmxGQxeccV6AlyBWoZI6Lq6uNkpxoWR9D9cI6Y5dkJXyvcMLAiEBe
 dakR222fVaFj5mqczTSyfR6uuiLlWJPwXGZSY2PxkKGWjrFdZnNBLYia4tgMeyhHypPo
 BFwiuJvXQQygBBWXEqxKboTvzYowEUOdT9TQ7pu/mn1dnhFOvOM6zuovDAIuRAEeXgra
 /ZdPUwb2YZQNT855W5RnEB+2OL5ymNOvQXBzsc7vZr90ikZETaVScvnBU9DbwnPvmxji
 Vhw0jBpG/whOwYXBxKseCd1LZXm6jGf4mXc0UWyBvrOgnNfmyDZyIXiuc3C18d+RLK5C
 9ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B5Z9U2pjRXxai+O0+8qnC4hYUBYk+Ovi1UIah8Pfnh8=;
 b=c2JaYhElmcUwhJ/chG1frndaSaR4KHivXuI+BCnB3mG/ZPgmgaJPoU0S6K/wsB7fE+
 oQzpLvxNOJFLQZfhh/JYZPSdwqfkXVAupMWRkrckynmUu3sagPnhZJ8uDbNc9NldX8kn
 xE+DWk/Ev2gtS93dFfugYz727jBlK8ONHIwhUqzH6oTSPjLMlHtb07YQz2DaGFkbdVav
 df3g1kNQ9Rn5y0hPWtDgXKqpPq7YeLGHU40VLWcA14DV1ewZZHFbF/3ocPzpBWfbRmBu
 L8OOtSRyyHu40pufbeXLiRWojuzXaUi4IG2QCsCKC1OUYc8AcKE+1qhownHRZu5nwzNi
 EphA==
X-Gm-Message-State: AOAM530xEK5IHKvi/W5NXvzEikov6kP+m9DEiToI4MvnuwGas6QKqauk
 jDrshXkF9mM8ZKqMlxoaFlQGVbA7iAnU/Pg=
X-Google-Smtp-Source: ABdhPJwyTXpHfxsilAoNRd9tAuXwfTWvujzOuugI6N3cwWPzkHFYNRg3sPIArZQVG8JNU1oXcT3Mhg==
X-Received: by 2002:aa7:8492:0:b029:155:79b1:437a with SMTP id
 u18-20020aa784920000b029015579b1437amr4281640pfn.26.1602770380792; 
 Thu, 15 Oct 2020 06:59:40 -0700 (PDT)
Received: from PWN ([161.117.80.159])
 by smtp.gmail.com with ESMTPSA id x25sm3654736pfr.132.2020.10.15.06.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 06:59:40 -0700 (PDT)
Date: Thu, 15 Oct 2020 09:59:32 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
Message-ID: <20201015135932.GA277152@PWN>
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Thu, Oct 15, 2020 at 11:33:08AM +1000, Dave Airlie wrote:
> Peilin Ye (1):
>       drm/amdgpu: Prevent kernel-infoleak in amdgpu_info_ioctl()

This patch is already in mainline:

commit 543e8669ed9bfb30545fd52bc0e047ca4df7fb31
Author: Peilin Ye <yepeilin.cs@gmail.com>
Date:   Tue Jul 28 15:29:24 2020 -0400

    drm/amdgpu: Prevent kernel-infoleak in amdgpu_info_ioctl()

It has been applied to linux-next twice, for unknown reasons. Thank you!

Peilin Ye

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
