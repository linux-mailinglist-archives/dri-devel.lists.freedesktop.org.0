Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785515778B7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 01:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858CB96548;
	Sun, 17 Jul 2022 23:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817A49654E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 23:02:42 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id o15so10223480pjh.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 16:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9duI1rSpswAXnRq3urEW1hM9QxHEE1skc8fMorpNRtM=;
 b=Bx419kWJ5uk7pbzZCokXEhQ7DRPh7mtVCaztg7LXosqvEYYqxHD/NfuIYwQfJpz/4i
 lqPECExSYKWZ9/9zx0mxoHwPZv2d4MtmTZTJEd42aqZQ0fkkWHVogmEXWAjN2sqIvGUk
 A8b9mCQcU5RUfk+Ln51//K+Sz2mthahh1rAdzDKJVrwYnKGqoNgHuDVmPP/yb50zYnm0
 GvNLc7XqQkhi0xZaS0+OWmAb6NPRasw5DSnyUcVsYFiv3RQ/qklRt5gDTPIDM0dkPa7h
 kMHKBIC0F+AozCbKsaGvdsOGOjbbnfqskEYMG1qjgoExvS/sES1Vu+qEajndEYcOq4Ox
 UXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9duI1rSpswAXnRq3urEW1hM9QxHEE1skc8fMorpNRtM=;
 b=8NCK1gnZcAJvKtdHa1Ekp5fiiGS00WRQsWwuFVKitiB1ccX6S/MGpOwMjSNKnZmr+f
 z7QVt+CmGmz+CkXHRDoyvpRR3Kh0y5DbOkgLhA6jpsIZ/tBPGIv9I9AAOn+8BnoBxtxD
 1wUA4IY4v2QvhXDCJZQ1fZfYyktw7RlCvrS99Aw5vQQzTjN2cHrCEUBx+Mq0U1M1jU+J
 08pUDI6rgRrGMNnTJkuqok0zouv4zklXgXIk+BjP/ljz6eXbRA3BEG129gZPYw4AoFK+
 K+o66nL5dniGCwu80a1LpTA7zFCUTYH4uN3VB8lq23Oyii6qSVtd69YphRRMLUsDnQ0N
 8dgw==
X-Gm-Message-State: AJIora//vDklMFzAcSuXPx2m31ve4/5Hy0xi7RB6uaVWxvjS4XOlwHpH
 IUy7y0HciJqqTceTS07mhnQ=
X-Google-Smtp-Source: AGRyM1s2OwobGDzORrPZHucygkybI/3hmpBr8Ni1Lah7murhJ3EfiGFcUanLyWGjdHC/P7DK+DlDgA==
X-Received: by 2002:a17:90b:3502:b0:1f0:986:e36b with SMTP id
 ls2-20020a17090b350200b001f00986e36bmr35970479pjb.154.1658098962056; 
 Sun, 17 Jul 2022 16:02:42 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:6c17:ca15:3733:a6a1?
 ([2001:df0:0:200c:6c17:ca15:3733:a6a1])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170902650300b0016be96e07d1sm7766371plk.121.2022.07.17.16.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 16:02:41 -0700 (PDT)
Message-ID: <77ecffbd-7568-f653-5273-1f3dffb17891@gmail.com>
Date: Mon, 18 Jul 2022 11:02:36 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 00/10] video: fbdev: atari: Miscellaneous fixes and
 cleanups
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Helge Deller <deller@gmx.de>
References: <cover.1657554353.git.geert@linux-m68k.org>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 12/07/22 03:50, Geert Uytterhoeven wrote:
> 	Hi all,
>
> This patch series contains miscellaneous fixes and cleanups for the
> Atari frame buffer device driver, which were identified while working on
> the Atari DRM driver.
>
> Most of them have been tested on ARAnyM, and should be sa<fe to apply,
> except perhaps for the last one, which is marked RFC.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (10):
>    video: fbdev: atari: Simplify atafb_pan_display()
>    video: fbdev: atari: Remove bogus FB_VMODE_YWRAP flags
>    video: fbdev: atari: Fix inverse handling
>    video: fbdev: atari: Fix ext_setcolreg()
>    video: fbdev: atari: Remove unneeded casts from void *
>    video: fbdev: atari: Remove unneeded casts to void *
>    video: fbdev: atari: Fix TT High video mode vertical refresh
>    video: fbdev: atari: Fix VGA modes
>    video: fbdev: atari: Remove unused definitions and variables
>    [RFC] video: fbdev: atari: Remove backward bug-compatibility
>
>   Documentation/m68k/kernel-options.rst |   4 +-
>   drivers/video/fbdev/atafb.c           | 101 +++++++-------------------
>   2 files changed, 29 insertions(+), 76 deletions(-)
>
Works OK on my Falcon (except for the falh* modes, but that is not a 
regression - might be something I miscoded in these modes, ages ago).

Tested-by: Michael Schmitz <schmitzmic@gmail.com>


