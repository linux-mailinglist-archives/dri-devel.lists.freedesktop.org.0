Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97677CF27A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3708B10E204;
	Thu, 19 Oct 2023 08:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA70A10E204
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:25:21 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b96c3b4be4so1205866366b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697703920; x=1698308720;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v8Difn/D+XiTI90dIkn0xG+fv+x0la3KPldZ4kHjxUY=;
 b=ccwUw6ytk03UMJxqTncfoJmPySQb7fLssbLhDWl+HYFMqRHHXW+ga0ixA9qeKGvPtr
 gqExMkzDIWgb9p1XaZ/sKFbHik4ZOMHoRMmA9c9GpmunxKTKDvA0eoczQbyW0UeFbIvC
 uQkfgxEkvdGBr+ggzaiSQS2/rXUFzQ8krlabB8kerNQyrRANqCbieA2wNFuZJhzzD3g4
 w9ZT/1KGf2yiiTsNmEzXm7Ndbm0ywpMcRWrgofx4FxOWO40PzEkgDbzTzPzvjYu2I0hY
 25uRyoaa7w1L9OqldPad3Kudhibe2TgJR7mISRViJ7oJ0z4+Q/NtKCmvaIfKd14uJ30t
 1Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697703920; x=1698308720;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v8Difn/D+XiTI90dIkn0xG+fv+x0la3KPldZ4kHjxUY=;
 b=Pc72/WoN6VE2Kiccg/aX229JJrMO+1mlbrpxUXou9WxtvKo4VfxsNa++omutDbIpaq
 Am6pgiL/64pdUgbA6YneJSRdK1dK0R3l/oZvc5iApiuc9Jp/Tflk35i9WocMXeaUm3EN
 N5hlOPr65vLFwYZN9tJsB+rVIlHUt4hQaKK3apt043qyQNNsvw2Xk/IZko2OihDNo4Fv
 048SFBST/lJ8uVONQBY/s6dl3md8v3BF6o1V66jzCoVNSDGCxXYTn8lAnWsS7vbieply
 hIKgnpoZxoXh4wxZIxHiZ0Wjaf3ZLpbuu4trZpdA56E+q47pSvl0XfGUj7F4ymLbD88B
 iYtg==
X-Gm-Message-State: AOJu0YxrMtAYKYq9/ox1kaFVR5pSkpM3ucOIdRiI3Gkf/iqH2L+tnpsY
 tJ3a8+SPIPv0kJAH9qzQ1hUv/3K9jrNUlLvwp/cRrQ==
X-Google-Smtp-Source: AGHT+IERXq0bO1AmEurHewxhpzh6tNz4IbqMPHu+sifIOgs6RxCQnRc88SwKIglHJnVB5fDIiwqiPj8rxg9FYRI0joA=
X-Received: by 2002:a17:907:97c2:b0:9c1:4343:60ab with SMTP id
 js2-20020a17090797c200b009c1434360abmr974298ejc.10.1697703919882; Thu, 19 Oct
 2023 01:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
 <20231019070650.61159-10-vignesh.raman@collabora.com>
In-Reply-To: <20231019070650.61159-10-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 19 Oct 2023 10:25:07 +0200
Message-ID: <CAPj87rP=22Fw0h42U-p9fHd=6OHOu9Lj9kbpVMQVqL9U6BRE1A@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm: ci: Update xfails
To: Vignesh Raman <vignesh.raman@collabora.com>
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
Cc: daniels@collabora.com, emma@anholt.net, david.heidelberg@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 gustavo.padovan@collabora.com, helen.koike@collabora.com,
 linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vignesh,

On Thu, 19 Oct 2023 at 09:07, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> +# Some tests crashes with malloc error and IGT tests floods
> +# the CI log with error messages and we end up with a warning message
> +# Job's log exceeded limit of 4194304 bytes.
> +# Job execution will continue but no more output will be collected.

This is just from GitLab warning that we have a huge log, so not
related to the actual fails here.

> +# Below is the error log:
> +# malloc(): corrupted top size
> +# Received signal SIGABRT.
> +# Stack trace:
> +#  #0 [fatal_sig_handler+0x17b]
> +#  #1 [__sigaction+0x40]
> +#  #2 [pthread_key_delete+0x14c]
> +#  #3 [gsignal+0x12]
> +#  #4 [abort+0xd3]
> +#  #5 [__fsetlocking+0x290]
> +#  #6 [timer_settime+0x37a]
> +#  #7 [__default_morecore+0x1f1b]
> +#  #8 [__libc_calloc+0x161]
> +#  #9 [drmModeGetPlaneResources+0x44]
> +#  #10 [igt_display_require+0x194]
> +#  #11 [__igt_unique____real_main1356+0x93c]
> +#  #12 [main+0x3f]
> +#  #13 [__libc_init_first+0x8a]
> +#  #14 [__libc_start_main+0x85]
> +#  #15 [_start+0x21]
> +# malloc(): corrupted top size

By the time we get this error, it indicates that there was previously
memory corruption, but it is only being noticed at a later point. The
skip lists here are way too big - stuff like drm_read is common
testing not affected by virtio at all - so we really need to isolate
the test which is actually breaking things.

The way to do this would be to use valgrind to detect where the memory
corruption is. VirtIO can be run locally so this is something you can
do on your machine.

Cheers,
Daniel
