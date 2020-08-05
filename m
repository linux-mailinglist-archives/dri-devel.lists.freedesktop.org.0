Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBB23CA5B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33ACD6E52D;
	Wed,  5 Aug 2020 11:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05556E52D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:47:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z6so45606713iow.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFbgx6sSKn2KplYN4e0YkhTZbCj58dXCDRAcIYrVDDg=;
 b=Q6xl32Q2c9knGtMceLyP/dswR+fcy6nPbDwAWPY4dnExhUIoChwySrryiP8pOOeBFl
 mX/TF5WdiCkm6RyDiNd5oFv0U0BUs1nC1pDLIWYJHbbjwmh61S9uxdclq536OsEQ2Two
 HIVgzyzHggG5967rR9FYffuOwSEMmJ0R+JolcM4/f30wHjxUduejkxdS2ore3LP6AvdN
 cT1Xyr4zID/NFQ6/UaZS0Di0QpZYsPGMERWUllCBLkO+9aHwHxDNBwteS/K2p7Ar0Wtp
 +QV6j70owptrsSodgvVY/145pOCyC/IWsUUApdcscoH8eQm1i+C31ME00NCe0VXb+lZJ
 bNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFbgx6sSKn2KplYN4e0YkhTZbCj58dXCDRAcIYrVDDg=;
 b=Dy7wSxwEMdYRA1R/l7xNWuAnlEWKwizsjrQ3pykfRyOjDziq71IGBXI3UJ3lqeEqCG
 qdDnwE9h1S3iCC3JHgpuMvEDDk2mR9IPRFLLVKrmO9Dy+WTvxDT+OUMbry5FWBUODSN7
 8g8dTMQOrTf/29ZOzgzHP7xiGYYK++nRh/09zOMZyuA2BF+kbexSIE/qx58dTK+FCzxt
 31OgYT8ENs1kcTRwoWIEZ+a3o2vedWBI/X7edeWzWQ9NetgdJODARWPuWC1rZqg+Qrcm
 zEQfthwFjjjxO/jhnMcKx7i6SpNbLA4DtiFKvka98lbHV3AoV1s7fNfe8+s5uP1/4bJ9
 rsdg==
X-Gm-Message-State: AOAM530MPYkW3Ez+6P9NAKzpP3oCocdetD7IdMsJcgOqseBEaIKtMMlW
 uL42CcF+6E6xCG3gdJZVKnejvOU6KeEu4IJZSg7/YQ==
X-Google-Smtp-Source: ABdhPJz9djBV7hoVsRm1SwhbQ5YsQSiBukc50OtsFH/43jtE27zlIu2W234Iq0tET+8jTuTuv2/LmBQDTxbrJo2z7AI=
X-Received: by 2002:a05:6638:621:: with SMTP id
 h1mr3678431jar.143.1596628067929; 
 Wed, 05 Aug 2020 04:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAKT=dD=_8daRz2h9pCvRQV4bvM6Wu6QGsBu7676-Jujfaf-Tuw@mail.gmail.com>
In-Reply-To: <CAKT=dD=_8daRz2h9pCvRQV4bvM6Wu6QGsBu7676-Jujfaf-Tuw@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 5 Aug 2020 13:47:37 +0200
Message-ID: <CAP+8YyEn-+gq_RiM0sOmPagD46eGPT7wzAS9y_j52Or6ETBx2A@mail.gmail.com>
Subject: Re: Question about per process GPU context global priority enforcement
To: Yiwei Zhang <zzyiwei@google.com>
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
Cc: Peiyong Lin <lpy@google.com>, Prahlad Kilambi <prahladk@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I don't think we have a uniform mechanism, currently each driver
decides on their own.

For the amdgpu driver we check that the process either has
CAP_SYS_NICE or is the DRM master.

On Wed, Aug 5, 2020 at 9:14 AM Yiwei Zhang <zzyiwei@google.com> wrote:
>
> Hi friends,
>
> For Vulkan/EGL, upon creating gpu contexts, applications can ask for a
> system-wide higher priority levels via VK_EXT_global_priority or
> EGL_IMG_context_priority extensions.
>
> I'm curious if we have certain rules(some form of process privilege
> check) in the kernel to limit non-privileged ones to never go beyond
> default system-wide gpu scheduling priority. (e.g. not allow random
> app processes to contend the GPU queues repeatedly/infinitely with
> high/realtime priorities)
>
> Many thanks,
> Yiwei - from Android Platform Graphics Team
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
