Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05B1FA23D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 23:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B656E509;
	Mon, 15 Jun 2020 21:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF726E509
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 21:02:07 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id y123so10195726vsb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 14:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lTxkb0/xfqxdmdhnrrwxWlD2yDcGL5KA5jytYg2gxEQ=;
 b=QyFMUcah00whnKsmH/WOjRmI/aIrzahesrF0vASDJNsPKbJkzddncZaGUFGgvBK3Hh
 at5gMi7uDjIMuBuWbJD046WoepE1Lq4CtJhSXQtAG47fOjcR0GfN+h30B2+gyVcwzkk0
 WF3SpTB7Pqo0b6K1VrffjFb0VQ4qCPjDA3dgyV6h6aK3/e+V8aRF3sClFSBpU2hhWaX3
 EwZzvgd0uVcfRPT0Oa9OA5LaSSYRz5pESoP1dNh3sRXrwneesMACeXAAtKSsrNj0A/VP
 PTMTJMY5D7tAwxE7tJF8Pn18nSSUlfCL75MhZsOFhFVWfYuVeKn0KueiK7BGSfufWJ0g
 bV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lTxkb0/xfqxdmdhnrrwxWlD2yDcGL5KA5jytYg2gxEQ=;
 b=HZ1WLm38GAhdQ8+WFWV+swyOti0bq9B8+EUZGPEIfPVB+w09JfiSlMLwxVcNxL8dwv
 fmqzK2g7DIDgDnVxFtLeYSdvcuH+HD6adjbg7ok8r4nLf8gB6eKY1bMKheAewah7yc/z
 9fOI7NcVgrJG45Af1/0igTVySzEyTwCH6gq/Mg6NFv87NdDFDNOjCak8bu8OIxREtlmo
 pFnArrKxrQyavTPJWpdTHkynvixKF9lvFGlTLHhyJdmg+JnqCd1Xt3mtZRuX95guVNMR
 +474miIWOf0UpFaMfLI81aEgf18HzyRlm9yjD0dmfMdrOI34TjxS4geGlMUg4ANLAqyj
 1h+A==
X-Gm-Message-State: AOAM53255E3v1P7dJF7oOmp5QGrqS6KSEoIwFk1LUZi8/mC/W5M7Po5T
 qFijlgiAi8GvpJgdFa/IuEbuOuPLISFmi3OTS676EDDK
X-Google-Smtp-Source: ABdhPJwM1VvHhQvy/SWQNs7wNDJqJQkTfD9oX3QE4IaPuwhsiQiWch6TLF1oX5E88ksIWoOWNHwDBF5HiQcT1vvAkg4=
X-Received: by 2002:a05:6102:22ec:: with SMTP id
 b12mr21065148vsh.138.1592254926900; 
 Mon, 15 Jun 2020 14:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
In-Reply-To: <20200603090929.GG12456@shao2-debian>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 21:58:26 +0100
Message-ID: <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
Subject: Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
To: kernel test robot <rong.a.chen@intel.com>
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 lkp@lists.01.org, OTC LSE PnP <otc.lse.pnp@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Thu, 4 Jun 2020 at 08:11, kernel test robot <rong.a.chen@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed a -64.9% regression of phoronix-test-suite.glmark2.800x600.score due to commit:
>
On one hand, I'm really happy to see performance testing happening
although this report is missing various crucial pieces of information.

> commit: e44e907dd8f937313d35615d799d54162c56d173 ("[PATCH v3 05/15] drm/mgag200: Split MISC register update into PLL selection, SYNC and I/O")
> url: https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-mgag200-Convert-to-atomic-modesetting/20200515-163744
> base: git://anongit.freedesktop.org/drm/drm-tip drm-tip
>
> in testcase: phoronix-test-suite
> on test machine: 16 threads Intel(R) Xeon(R) CPU X5570 @ 2.93GHz with 48G memory
> with following parameters:
>
>         need_x: true
Replace "need_x" with the Xorg version as seen in `Xorg -version'.

>         test: glmark2-1.1.0
>         cpufreq_governor: performance
>         ucode: 0x1d
>
> test-description: The Phoronix Test Suite is the most comprehensive testing and benchmarking platform available that provides an extensible framework for which new tests can be easily added.
> test-url: http://www.phoronix-test-suite.com/
>
Please remove the test description and url. They don't add any value.

Mention which Mesa version is used as well as on what GPU. The output
of lspci and glxinfo will help here.

For this particular test - there is no Mesa/upstream driver for this
GPU, so I imagine one of the swrast drivers was used. Which one -
swrast (classic, softpipe, llvmpipe, swr) or kms_swrast.
The output of `LD_DEBUG=libs glxinfo  |& grep _dri.so` will help here.

> commit:
>   bef2303526 ("drm/mgag200: Move mode-setting code into separate helper function")
>   e44e907dd8 ("drm/mgag200: Split MISC register update into PLL selection, SYNC and I/O")
>

Actually the offending commit has a subtle change of behaviour - it
adds an extra MGAREG_MISC_RAMMAPEN.
That is not documented and I've failed to spot it during review.

Thomas - shall we revert that line in itself or at least add an inline
comment why it is needed?

>
>   100 +---------------------------------------------------------------------+
>    90 |-+    +      +   +.+      +    +     +    +      +   :               |
>       | :    :      :   : :      :    :     :    :      :   :               |
>    80 |-:    :      :   : :      :    :     :    :      :   :               |
>    70 |-::   :     ::   :  :     :   ::     ::   :     ::  :                |
>       |: :  : :    : : :   :    : :  : :   : :  : :    : : :                |
>    60 |:+:  : :    : : :   :    : :  : :   : :  : :    : : :                |
>    50 |:+:  : :    : : :   :    : :  : :   : :  : :    : : :                |
>    40 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : :                |
>       |:  : : :   :  : :    :   : : :  :   :  : : :   :  : :O      O O O  O |
>    30 |:+ : : :   :  : :    :   : : :  :   :  : : :   :  : :                |
>    20 |-+ ::   :  :   :     :  :   ::   : :   ::   :  : O :                 |
>       |    :   : :    :      : :   :    : :    :   : :    :                 |
>    10 |-+  :   : :    :      : :   :    : :    :   : :    :                 |
>     0 +---------------------------------------------------------------------+
>
>
>                    phoronix-test-suite.glmark2.1024x768.score
>
>   70 +----------------------------------------------------------------------+
>      | +    +      +   +..+     +    +      +    +     +    +.+             |
>   60 |-:    :      :   :  :     :    :      :    :     :    :               |
>      | :    :      :   :  :     :    :      :    :     :    :               |
>   50 |-::   :     ::   :  :     ::   :      :   ::     ::   :               |
>      |: :  : :    : : :    :   : :  : :    : :  : :   : :  :                |
>   40 |:+:  : :    : : :    :   : :  : :    : :  : :   : :  :                |
>      |: :  : :    : : :    :   : :  : :    : :  : :   : :  :         O      |
>   30 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : :O      O   O  O |
>      |:  : : :   :  : :    :   :  : : :    : : :  :   :  : :                |
>   20 |:+ : : :   :  : :    :   :  : : :    : : :  :   :  : :                |
>      |   ::   :  :   :      : :   ::   :  :   ::   : : O ::                 |
>   10 |-+  :   : :    :      : :    :   :  :   :    : :    :                 |
>      |    :   : :  O :    O : : O  :   :  : O :    : :    :                 |
>    0 +----------------------------------------------------------------------+
>
>
> [*] bisect-good sample
> [O] bisect-bad  sample
>
Hmm I must be going blind - there isn't even a single * in either of the graphs.
Or perhaps my eyesight is fine and the legend or the graphs need fixing.

HTH
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
